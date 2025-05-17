local rank = 4
SMODS.Joker {
    key = 'april',
    loc_txt = {
        name = 'April',
        text = {
            "If scoring hand",
            "contains a {C:attention}#1#{} earn {C:money}$#2#"
        }
    },
    atlas = 'Jokers',
    pos = {x = 1, y = 2},
    blueprint_compat = true,
    rarity = 1,
    cost = 8,
    config = {
        extra = {
            money = 4
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                AUtils.localize_rank_from_id(rank),
                center.ability.extra.money
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then
            for _, scoring_card in ipairs(context.scoring_hand) do
                local debuffed = AUtils.debuffed(scoring_card, card)
                if scoring_card:get_id() == rank and not debuffed then
                    return {
                        dollars = card.ability.extra.money
                    }
                end
            end
        end
    end
}