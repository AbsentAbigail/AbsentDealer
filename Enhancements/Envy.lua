SMODS.Enhancement {
    key = "envy",
    atlas = "Enhancers",
    pos = { x = 1, y = 0},
    weight = ad_sin_weight,

    config = {
        extra = {
            odds = 3
        }
    },

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.c_death
        local numerator, denominator = SMODS.get_probability_vars(center, 1, center.ability.extra.odds, "ad_envy")
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,
    
    set_card_type_badge = function(self,card,badges)
        local label = localize({ type = "name_text", set = "Enhanced", key = self.key, vars = {} })
        badges[#badges+1] = create_badge(label, ad_sin_colour or G.C.WHITE, G.C.WHITE, 1.2)
    end,

    calculate = function(self, card, context)
        local extra = card.ability.extra
        if not (context.end_of_round and not context.repetition and context.cardarea == G.hand) then
            return
        end

        if not (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
            return -- no space in consumable area
        end

        if not AUtils.calculate_odds(card, "ad_envy", card.ability.extra.odds) then
            return
        end

        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        
        return {
            message = localize("ad_envy"),
            message_card = card,
            func = function()
                G.E_MANAGER:add_event(Event {
                    func = function()
                        SMODS.add_card {
                            set = 'Tarot',
                            key = 'c_death'
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                })
            end
        }
    end
}
