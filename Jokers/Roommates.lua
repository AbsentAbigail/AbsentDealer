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
    
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, enhancement) then
                return true
            end
        end
        return false
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
        return {
            text = {
                { text = "+$", colour = G.C.GOLD },
                { ref_table = "card.joker_display_values", ref_value = "money", retrigger_type = "mult", colour = G.C.GOLD },
                { text = " " },
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
                    }
                },
                { text = " +", colour = G.C.CHIPS },
                { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS }
            },
            
            calc_function = function(card)
                card.joker_display_values.money = 0
                card.joker_display_values.x_mult = 1
                card.joker_display_values.chips = 0

                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text == 'Unknown' then
                    return
                end

                local requirement = 0
                local i = 0

                for _, scoring_card in pairs(scoring_hand) do
                    local debuffed = AUtils.debuffed(scoring_card, card)
                    if SMODS.has_enhancement(scoring_card, enhancement) and not debuffed then
                        i = i + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        requirement = requirement + 1
                    end
                end

                if requirement < 2 then
                    return
                end

                card.joker_display_values.money = card.ability.extra.money * i
                card.joker_display_values.x_mult = card.ability.extra.x_mult ^ i
                card.joker_display_values.chips = card.ability.extra.chips * i
            end
        }
    end
}