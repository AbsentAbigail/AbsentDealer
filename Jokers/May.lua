local rank = 5

SMODS.Joker {
    key = 'may',
    loc_txt = {
        name = 'May',
        text = {
            "{C:attention}#1#s{} held in hand each",
            "give {C:chips}+#2#{} Chips and {C:mult}+#3#{} Mult"
        }
    },
    atlas = 'Jokers',
    pos = {x = 0, y = 2},
    blueprint_compat = true,
    rarity = 1,
    cost = 3,
    config = {
        extra = {
            chips = 5,
            mult = 5,
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                AUtils.localize_rank_from_id(rank),
                center.ability.extra.chips,
                center.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card:get_id() == rank then
                local debuffed = AUtils.debuffed(context.other_card, card)
                return debuffed or {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult,
                }
            end
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                { text = "+", colour = G.C.CHIPS },
                { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
                { text = " +", colour = G.C.MULT },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT },
            },
            
            calc_function = function(card)
                local playing_hand = next(G.play.cards)
                local triggers = 0
                for _, playing_card in ipairs(G.hand.cards) do
                    if playing_hand or not playing_card.highlighted then
                        if playing_card.facing and not (playing_card.facing == 'back') and not playing_card.debuff and playing_card:get_id() == rank then
                            triggers = triggers + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                        end
                    end
                end
                card.joker_display_values.mult = triggers * card.ability.extra.mult
                card.joker_display_values.chips = triggers * card.ability.extra.chips
            end
        }
    end
}