SMODS.Joker {
    key = 'blackfisk',
    loc_txt = {
        name = 'Bläckfisk',
        text = {
            "{C:attention}+#1#{} hand size",
            "When holding {C:attention}8+{} cards in hand,",
            "earn {C:money}$#2#{} for each"
        }
    },
    atlas = 'Jokers',
    pos = {x = 4, y = 1},
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    config = {
        extra = {
            hand_size = 1,
            money = 1
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.hand_size,
                center.ability.extra.money
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
		G.hand:change_size(card.ability.extra.hand_size)
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.hand:change_size(-card.ability.extra.hand_size)
	end,

    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.individual and not context.end_of_round then
            if #G.hand.cards < 8 then
                return
            end

            local debuff = AUtils.debuffed(context.other_card, card)
            if debuff then
                return
            end
            
            return {
                dollars = card.ability.extra.money
            }
        end
    end,

    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                { ref_table = "card.joker_display_values", ref_value = "count",   retrigger_type = "mult" },
                { text = "x",                              scale = 0.35 },
                { text = "$",                              colour = G.C.GOLD },
                { ref_table = "card.ability.extra",  ref_value = "money", colour = G.C.GOLD },
            },
            text_config = { colour = G.C.GOLD },

            reminder_text = {
                { text = "(8+ cards held)" }
            },
            
            calc_function = function(card)
                local playing_hand = next(G.play.cards)
                local triggers = 0
                local card_count = 0
                for _, playing_card in ipairs(G.hand.cards) do
                    if playing_hand or not playing_card.highlighted then
                        card_count = card_count + 1
                        triggers = triggers + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                    end
                end
                card.joker_display_values.count = card_count < 8 and 0 or triggers
            end
        }
    end
}