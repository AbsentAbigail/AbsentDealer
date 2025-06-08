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

SMODS.Back {
    key = "sinner",
    atlas = "Enhancers",
    pos = { x = 3, y = 1 },

    config = { },
    
    loc_vars = function(self, info_queue, back)
        return {
            vars = {
            }
        }
    end,
   
    apply = function(self, back)
        G.E_MANAGER:add_event(Event {
            func = function()
                for i, card in ipairs(G.playing_cards) do
                    card:set_ability(G.P_CENTERS[get_sin()])
                end
                return true
            end
        })
    end
}