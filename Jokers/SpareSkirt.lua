local poker_hand = "Three of a Kind"

SMODS.Joker {
    key = 'spare_skirt',
    loc_txt = {
        name = 'Spare Skirt',
        text = {
            "This joker gains {C:mult}+#1#{} Mult if played",
            "hand contains a {C:attention}#3#",
            "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
        }
    },
    atlas = 'Jokers',
    pos = {x = 5, y = 2},
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    config = {
        extra = {
            mult_mod = 3,
            mult = 0
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.mult_mod,
                center.ability.extra.mult,
                localize(poker_hand, "poker_hands")
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.blueprint then
            return
        end
        
        if context.before and context.main_eval and next(context.poker_hands[poker_hand]) then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED
            }
        end
    end
}