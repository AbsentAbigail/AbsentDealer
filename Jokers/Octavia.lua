local to_big = to_big or function(x) return x end -- Talisman compatibility

local function balance()
    local total = hand_chips + mult
    hand_chips = math.floor(total/2)
    mult = math.floor(total/2)
    update_hand_text({delay = 0}, {mult = mult, chips = hand_chips})

    G.E_MANAGER:add_event(Event({
        func = function()
            play_sound('gong', 0.94, 0.3)
            play_sound('gong', 0.94*1.5, 0.2)
            play_sound('tarot1', 1.5)
            ease_colour(G.C.UI_CHIPS, {0.8, 0.45, 0.85, 1})
            ease_colour(G.C.UI_MULT, {0.8, 0.45, 0.85, 1})
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blockable = false,
                blocking = false,
                delay =  4.3,
                func = (function() 
                        ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                        ease_colour(G.C.UI_MULT, G.C.RED, 2)
                    return true
                end)
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blockable = false,
                blocking = false,
                no_delete = true,
                delay =  6.3,
                func = (function() 
                    G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
                    G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
                    return true
                end)
            }))
            return true
        end
    }))
end

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
                balance()
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