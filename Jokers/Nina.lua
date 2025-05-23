SMODS.Joker {
    key = 'nina',
    atlas = 'Jokers',
    pos = {x = 2, y = 2},
    soul_pos = {x = 3, y = 2},
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            odds = 4,
            money = 9
        }
    },

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_stone
        return {
            vars = {
                G.GAME and G.GAME.probabilities.normal or 1,
                center.ability.extra.odds,
                center.ability.extra.money
            }
        }
    end,

    calculate = function(self, card, context)
        if context.blueprint then
            return
        end
        local destroying_card = context.destroying_card
        if destroying_card and SMODS.has_enhancement(destroying_card, 'm_stone') and not AUtils.debuffed(destroying_card, nil) then
            if AUtils.calculate_odds("ad_nina", card.ability.extra.odds) then
                return {
                    remove = true,
                    dollars = card.ability.extra.money,
                    message_card = destroying_card
                }
            end
        end
    end,
    
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_stone') then
                return true
            end
        end
        return false
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                { text = "+$", colour = G.C.GOLD },
                { ref_table = "card.ability.extra", colour = G.C.GOLD, ref_value = "money", retrigger_type = "mult" },
            },

            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" }
            },
            
            extra = {
                {
                    { text = "(" },
                    { ref_table = "card.joker_display_values", ref_value = "odds" },
                    { text = ")" },
                }
            },
            extra_config = { colour = G.C.GREEN, scale = 0.3 },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize({ type = "name_text", set = "Enhanced", key = "m_stone" })
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { (G.GAME and G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
            end
        }
    end
}