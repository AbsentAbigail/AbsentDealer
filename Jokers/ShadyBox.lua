SMODS.Joker {
    key = 'shady_box',
    atlas = 'Jokers',
    pos = {x = 5, y = 3},
    blueprint_compat = false,
    eternal_compat = false,
    rarity = 3,
    cost = 12,
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
        if context.selling_self and not context.blueprint then
            local jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then
                    jokers[#jokers + 1] = G.jokers.cards[i]
                end
            end
            if #jokers >= 4 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for _, joker in ipairs(jokers) do
                            joker:start_dissolve()
                        end
                        SMODS.add_card {
                            set = "Joker",
                            legendary = true,
                            key_append = "ad_shady_box"
                        }
                        return true
                    end
                }))
                return {
                    message = "Opened!"
                }
            end
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "active" },
                { text = ")" },
            },
            
            calc_function = function(card)
                card.joker_display_values.active = (#G.jokers.cards > 4 and localize("jdis_active") or localize("jdis_inactive"))
            end
        }
    end
}