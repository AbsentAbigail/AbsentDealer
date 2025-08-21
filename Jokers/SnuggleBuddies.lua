local suit = "Hearts"

SMODS.Joker {
    key = 'snuggle_buddies',
    atlas = 'Jokers',
    pos = {x = 2, y = 3},
    blueprint_compat = false,
    rarity = 3,
    cost = 8,
    config = {
        extra = {
            odds = 5
        }
    },

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.c_deja_vu
        local numerator, denominator = SMODS.get_probability_vars(center, 1, center.ability.extra.odds, "ad_snuggle_buddies")
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.blueprint then
            return
        end
        
        local destroying_card = context.destroying_card

        if not destroying_card or not destroying_card:is_suit(suit, nil, nil) then
            return
        end

        if not AUtils.calculate_odds(card, "ad_snuggle_buddies", card.ability.extra.odds) then
            return
        end

        return {
            remove = true,
            message = localize("ad_deja_vu"),
            message_card = destroying_card,
            func = function()
                G.E_MANAGER:add_event(Event {
                    func = function()
                        if not (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
                            return true -- no space in consumable area
                        end

                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

                        SMODS.add_card {
                            set = 'Spectral',
                            key = 'c_deja_vu'
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                })
            end
        }
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