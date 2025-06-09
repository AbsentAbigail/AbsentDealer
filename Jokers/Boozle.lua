local suit = "Spades"

SMODS.Joker {
    key = 'boozle',
    atlas = 'Jokers',
    pos = {x = 1, y = 3},
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    config = {
        extra = {
            odds = 3,
            retriggers = 2
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                G.GAME and G.GAME.probabilities.normal or 1,
                center.ability.extra.odds,
                center.ability.extra.retriggers
            }
        }
    end,

    calculate = function(self, card, context)
        local scoring_card = context.other_card
        if context.repetition and scoring_card and (context.cardarea == G.play or context.cardarea == G.hand) then
            if not scoring_card:is_suit(suit, nil, nil) then
                return
            end
            
            if not AUtils.calculate_odds('ad_boozle', card.ability.extra.odds) then
                return
            end

            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.retriggers,
                card = card
            }
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                { ref_table = "card.joker_display_values", ref_value = "odds", scale = 0.35 }
            },
            text_config = { colour = G.C.GREEN },

            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = lighten(G.C.SUITS[suit], 0.35) },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize(suit, 'suits_plural')
                card.joker_display_values.odds = localize {
                    type = 'variable',
                    key = "jdis_odds",
                    vars = {
                        (G.GAME and G.GAME.probabilities.normal or 1),
                        card.ability.extra.odds
                    }
                }
            end
        }
    end
}