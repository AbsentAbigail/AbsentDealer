SMODS.Joker {
    key = 'catcitten',
    atlas = 'Jokers',
    pos = {x = 1, y = 0},
    blueprint_compat = true,
    rarity = 3,
    cost = 7,
    config = {
        extra = {
            odds = 5
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                G.GAME and G.GAME.probabilities.normal or 1,
                center.ability.extra.odds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local card_to_copy = context.other_card

            if not card_to_copy:is_suit("Diamonds", nil, nil) then
                return
            end
            
            if not AUtils.calculate_odds('ad_catcitten', card.ability.extra.odds) then
                return
            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    local copy = copy_card(card_to_copy, nil, nil, G.playing_card)
                    copy:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, copy)
                    G.hand:emplace(copy)
                    copy.states.visible = nil
                    copy:start_materialize()
                    playing_card_joker_effects({copy})
                    return true
                end
            }))
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
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = lighten(G.C.SUITS["Diamonds"], 0.35) },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("Diamonds", 'suits_plural')
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