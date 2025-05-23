SMODS.Joker {
    key = 'cuddles',
    atlas = 'Jokers',
    pos = {x = 9, y = 1},
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    config = {
        extra = {
            x_mult = 2
        }
    },

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return {
            vars = {
                center.ability.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.lucky_trigger then
                return {
                    xmult = card.ability.extra.x_mult
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v * 2
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v / 2
        end
    end,

    in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_lucky'`
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_lucky') then
                return true
            end
        end
        return false
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
            
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" }
            }, 

            calc_function = function(card)
                card.joker_display_values.localized_text = localize({ type = "name_text", set = "Enhanced", key = "m_lucky" })
            end
        }
    end
}