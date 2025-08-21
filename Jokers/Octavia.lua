SMODS.Joker {
    key = 'octavia',
    atlas = 'Jokers',
    pos = {x = 6, y = 3},
    soul_pos = {x = 7, y = 3},
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    config = {
        extra = {
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local hands = G.GAME.current_round.hands_left or 0
            local discards = G.GAME.current_round.discards_left or 0
            if to_big(hands) == to_big(discards) then
                AUtils.balance_score()
                return {
                    message = localize('k_balanced')
                }
            end
        end
    end,
    
    in_pool = function(self, args)
        return not (G.GAME.selected_back.effect.center.key == "b_plasma")
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {}
    end
}