local enhancement = "m_ad_pride"

SMODS.Joker {
    key = 'roommates',
    atlas = 'Jokers',
    pos = { x = 2, y = 4 },
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    config = {
        extra = {
            money = 1,
            x_mult = 1.5,
            chips = 10
        }
    },
    
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.money,
                center.ability.extra.x_mult,
                center.ability.extra.chips,
            }
        }
    end,
    
    calculate = function(self, card, context)
        if not (context.cardarea == G.play and context.individual) then
            return
        end

        local count = false
        
        for _, scoring_card in pairs(context.scoring_hand) do
            local debuffed = AUtils.debuffed(scoring_card, card)
            if SMODS.has_enhancement(scoring_card, enhancement) and not debuffed then
                if count then
                    local extra = card.ability.extra
                    return {
                        dollars = extra.money,
                        x_mult = extra.x_mult,
                        chips = extra.chips
                    }
                end
                count = true
            end
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {}
    end
}