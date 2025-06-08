SMODS.Joker {
    key = 'spot',
    atlas = 'Jokers',
    pos = {x = 6, y = 2},
    soul_pos = {x = 7, y = 2},
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    config = {
        extra = {
            xmult = 1,
            xmult_base = 1
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        local extra = card.ability.extra

        if context.joker_main then
            return {
                xmult = extra.xmult
            }
        end
        
        if context.after and not context.blueprint then
            extra.xmult = extra.xmult * 2
            return 
            {
                message = localize("ad_doubled"),
                colour = G.C.INACTIVE,
                message_card = card
            }
        end


        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if extra.xmult > extra.xmult_base then
                extra.xmult = extra.xmult_base
                return {
                    message = localize('k_reset'),
                    colour = G.C.INACTIVE
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
                        { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                    }
                }
            },
        }
    end
}