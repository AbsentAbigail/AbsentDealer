local rank = 4
SMODS.Joker {
    key = 'april',
    atlas = 'Jokers',
    pos = {x = 1, y = 2},
    blueprint_compat = true,
    rarity = 1,
    cost = 8,
    config = {
        extra = {
            money = 4
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                AUtils.localize_rank_from_id(rank),
                center.ability.extra.money
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then
            for _, scoring_card in ipairs(context.scoring_hand) do
                local debuffed = AUtils.debuffed(scoring_card, card)
                if scoring_card:get_id() == rank and not debuffed then
                    return {
                        dollars = card.ability.extra.money
                    }
                end
            end
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                { text = "+$" },
                { ref_table = "card.joker_display_values", ref_value = "dollars", retrigger_type = "mult" },
            },
            text_config = { colour = G.C.GOLD },

            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = lighten(G.C.SUITS["Diamonds"], 0.35) },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = AUtils.localize_rank_from_id(rank)
                card.joker_display_values.dollars = 0

                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text == 'Unknown' then
                    return
                end

                for _, scoring_card in pairs(scoring_hand) do
                    local debuffed = AUtils.debuffed(scoring_card, card)
                    if scoring_card:get_id() == rank and not debuffed then
                        card.joker_display_values.dollars = card.ability.extra.money
                        return
                    end
                end
            end
        }
    end
}