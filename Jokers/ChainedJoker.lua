SMODS.Joker {
    key = 'chained_joker',
    atlas = 'Jokers',
    pos = {x = 5, y = 1},
    soul_pos = {x = 6, y = 1},
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 7,
    config = {
        extra = {
            xmult = 2
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.xmult
            }
        }
    end,

    set_ability = function(self, card, initial, delay_sprites)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
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