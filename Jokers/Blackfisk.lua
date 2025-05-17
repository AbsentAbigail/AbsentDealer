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
    end
}