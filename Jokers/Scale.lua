local to_big = to_big or function(x) return x end -- Talisman compatibility

SMODS.Joker {
    key = 'scale',
    atlas = 'Scale',
    pos = {x = 2, y = 0},
    soul_pos = {x = 2, y = 1},
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            x_mult = 2
        }
    },

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = ad_tsuki_credit
        return {
            vars = {
                center.ability.extra.x_mult
            }
        }
    end,
    
    update = function(self, card, dt)
        local center = G.P_CENTERS.j_ad_scale

        local hands = G.GAME.current_round.hands_left or 0
        local discards = G.GAME.current_round.discards_left or 0

        local difference = to_big(hands - discards)
            card.children.floating_sprite:set_sprite_pos({x = 0, y = 1})
        if difference == to_big(0) then
            card.children.floating_sprite:set_sprite_pos({x = 2, y = 1})
            center.pos.x = 2
        elseif difference == to_big(1) then
            center.pos.x = 1
        elseif difference > to_big(0) then
            center.pos.x = 0
        elseif difference == to_big(-1) then
            center.pos.x = 3
        else
            center.pos.x = 4
        end
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local hands = G.GAME.current_round.hands_left or 0
            local discards = G.GAME.current_round.discards_left or 0
            if to_big(hands) == to_big(discards) then
                return {
                    x_mult = card.ability.extra.x_mult
                }
            end
        end
    end,

    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" }
                    }
                }
            },

            calc_function = function(card)
                local hands = G.GAME.current_round.hands_left or 0
                local discards = G.GAME.current_round.discards_left or 0

                card.joker_display_values.x_mult = to_big(hands - 1) == to_big(discards) and card.ability.extra.x_mult or 1
            end
        }
    end
}