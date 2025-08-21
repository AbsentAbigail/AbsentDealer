local enhancement = "m_glass"

SMODS.Joker {
    key = 'break_glass',
    atlas = 'Jokers',
    pos = {x = 1, y = 5},
    blueprint_compat = true,
    rarity = 3,
    cost = 6,
    config = {
        extra = {
        }
    },
    
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = ad_fungemp_credit
        info_queue[#info_queue + 1] = G.P_CENTERS[enhancement]
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if not context.remove_playing_cards then
            return
        end

        if not G.hand or #G.hand.cards < 1 then
            return
        end

        local glass_cards = 0
        for _, removed_card in ipairs(context.removed) do
            if removed_card.shattered then
                glass_cards = glass_cards + 1
            end
        end
        if glass_cards == 0 then
            return
        end

        for i = 1, glass_cards do
            local c = pseudorandom_element(G.hand.cards, pseudoseed("ad_break_glass"))
            G.E_MANAGER:add_event(Event {
                func = function()
                    c:set_ability(G.P_CENTERS[enhancement], nil, true)
                    SMODS.calculate_effect({ message = localize("ad_emergency") }, c)
                    return true
                end
            })
        end
    end,

    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, enhancement) then
                return true
            end
        end
        return false
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
        }
    end
}