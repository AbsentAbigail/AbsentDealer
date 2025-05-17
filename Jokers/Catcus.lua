local rank = 14

SMODS.Joker {
    key = 'catcus',
    loc_txt = {
        name = 'Catcus',
        text = {
            "Played {C:attention}#1#s{} give {C:money}$#2#{} and",
            "{X:mult,C:white}X#3#{} Mult when scored"
        }
    },
    atlas = 'Jokers',
    pos = {x = 8, y = 0},
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    config = {
        extra = {
            money = 1,
            x_mult = 1.1
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                AUtils.localize_rank_from_id(rank),
                center.ability.extra.money,
                center.ability.extra.x_mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == rank then
                return {
                    xmult = card.ability.extra.x_mult,
                    dollars = card.ability.extra.money
                }
            end
        end
    end
}