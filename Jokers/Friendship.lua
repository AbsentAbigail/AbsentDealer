SMODS.Joker {
    key = 'friendship',
    loc_txt = {
        name = 'Friendship',
        text = {
            "This joker gains {C:mult}+#1#{} Mult,",
            "if played hand contains scoring",
            "cards of {C:attention}2+{} unique suits",
            "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
        }
    },
    atlas = 'Jokers',
    pos = {x = 3, y = 1},
    blueprint_compat = true,
    rarity = 1,
    config = {
        extra = {
            mult_mod = 1,
            mult = 0
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.mult_mod,
                center.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
				mult = card.ability.extra.mult
            }
        end
        if not context.blueprint and context.before then
            suit_count = AUtils.get_suit_count_in_hand(context.scoring_hand)
            if suit_count > 1 then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
    end
}