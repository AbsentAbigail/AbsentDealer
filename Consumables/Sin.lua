local sins = {
    "m_ad_envy",
    "m_ad_gluttony",
    "m_ad_greed",
    "m_ad_lust",
    "m_ad_pride",
    "m_ad_sloth",
    "m_ad_wrath",
}

local function get_sin()
    return pseudorandom_element(sins, pseudoseed("ad_sin"))
end

SMODS.Consumable {
    key = "sin",
    set = "Spectral",
    atlas = "Tarots",
    pos = { x = 0, y = 0 },
    cost = 4,

    config = {
        max_highlighted = 3
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.max_highlighted
            }
        }
    end,

    can_use = function(self, card)
        local highlighted = G.hand.highlighted
        if highlighted and #highlighted > 0 and #highlighted <= card.ability.max_highlighted then
            return true
        end
        return false
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            local c = G.hand.highlighted[i]
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event {
                trigger = 'after',
                delay = 0.15,
                func = function()
                    c:flip()
                    play_sound('card1', percent)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            })
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            local c = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event {
                trigger = 'after',
                delay = 0.15,
                func = function()
                    c:set_ability(G.P_CENTERS[get_sin()])
                    return true
                end
            })
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            local c = G.hand.highlighted[i]
            local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event {
                trigger = 'after',
                delay = 0.15,
                func = function()
                    c:flip()
                    play_sound('tarot2', percent, 0.6)
                    c:juice_up(0.3, 0.3)
                    return true
                end
            })
        end
    end,
}