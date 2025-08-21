SMODS.Joker {
    key = 'patch',
    atlas = 'Jokers',
    pos = {x = 8, y = 3},
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    config = {
        extra = {
            level_up = 1
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.level_up
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after and G.GAME.current_round.hands_played == 0 then
            local multiplier = to_big(G.GAME.chips + (hand_chips * mult)) < to_big(G.GAME.blind.chips) and 2 or 1
            return {
                level_up = card.ability.extra.level_up * multiplier
            }
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {}
    end
}