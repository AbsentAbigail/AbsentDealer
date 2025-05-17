local rank = 9

SMODS.Joker {
    key = 'sam',
    loc_txt = {
        name = 'Sam',
        text = {
            "{X:chips,C:white}X#1#{} Chips if poker hand",
            "contains a {C:attention}#2#{} and a {C:attention}Flush"
        }
    },
    atlas = 'Jokers',
    pos = {x = 4, y = 2},
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    config = {
        extra = {
            x_chips = 2
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.x_chips,
                AUtils.localize_rank_from_id(rank),
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands["Flush"]) then
            local rank_check = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == rank then
                    rank_check = true
                    break
                end
            end
            if not rank_check then
                return
            end
            
            return {
                x_chips = card.ability.extra.x_chips
            }
        end
    end
}