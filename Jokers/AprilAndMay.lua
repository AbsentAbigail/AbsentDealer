local suit = "Clubs"

SMODS.Joker {
    key = 'april_and_may',
    atlas = 'Jokers',
    pos = {x = 3, y = 3},
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    config = {
        extra = {
            odds = 5,
            x_mult = 1.5
        }
    },

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = enhancement
        info_queue[#info_queue+1] = ad_megamarine_credit
        return {
            vars = {
                G.GAME and G.GAME.probabilities.normal or 1,
                center.ability.extra.odds,
                center.ability.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local scoring_card = context.other_card

            if not SMODS.has_enhancement(scoring_card, "m_mult") then
                return
            end
            
            return {
                xmult = card.ability.extra.x_mult
            }
        end

        if context.blueprint then
            return
        end

        if context.cardarea == G.jokers and context.before then
            local matching_cards = {}
            for _, scoring_card in ipairs(context.scoring_hand) do
                if scoring_card:is_suit(suit, nil, nil) and AUtils.calculate_odds("ad_april_and_may", card.ability.extra.odds) then
                    matching_cards[#matching_cards+1] = scoring_card
                    scoring_card:set_ability(G.P_CENTERS.m_mult, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scoring_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if #matching_cards > 0 then 
                return {
                    message = "Mult!",
                    card = self
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
                        { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                    }
                }
            },

            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize({ type = "name_text", set = "Enhanced", key = "m_mult", vars = {} })
                
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                local extra = card.ability.extra

                if text == 'Unknown' then
                    card.joker_display_values.x_mult = 1
                    return
                end

                local x_mult = 1

                for _, scoring_card in pairs(scoring_hand) do
                    if SMODS.has_enhancement(scoring_card, 'm_mult') then
                        x_mult = x_mult * extra.x_mult ^ JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end

                card.joker_display_values.x_mult = x_mult
            end
        }
    end
}