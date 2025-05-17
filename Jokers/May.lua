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
            rank = 5,
            chips = 5,
            mult = 5,
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                AUtils.localize_rank_from_id(center.ability.extra.rank),
                center.ability.extra.chips,
                center.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card:get_id() == card.ability.extra.rank then
                local debuffed = AUtils.debuffed(context.other_card, card)
                return debuffed or {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult,
                }
            end
        end
    end
}