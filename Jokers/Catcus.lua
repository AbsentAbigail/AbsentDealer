local rank = 14

SMODS.Joker {
    key = 'catcus',
    loc_txt = {
        name = 'Catcus',
        text = {
            "Played {C:attention}#1#s{} give {C:money}$#2#{} and",
            "{X:mult,C:white}X#3#{} Mult when scored"
        }
    },
    atlas = 'Jokers',
    pos = {x = 8, y = 0},
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    config = {
        extra = {
            money = 1,
            x_mult = 1.1
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                AUtils.localize_rank_from_id(rank),
                center.ability.extra.money,
                center.ability.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == rank then
                return {
                    xmult = card.ability.extra.x_mult,
                    dollars = card.ability.extra.money
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
                        { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
                    }
                },
                { text = " +$", colour = G.C.GOLD },
                { ref_table = "card.joker_display_values", colour = G.C.GOLD, ref_value = "money", retrigger_type = "mult" }
            },
            
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = AUtils.localize_rank_from_id(rank)

                card.joker_display_values.xmult = 1
                card.joker_display_values.money = 0

                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text == 'Unknown' then
                    return
                end

                local i = 0

                for _, scoring_card in pairs(scoring_hand) do
                    local debuffed = AUtils.debuffed(scoring_card, card)
                    if scoring_card:get_id() == rank and not debuffed then
                        i = i + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end

                card.joker_display_values.xmult = card.ability.extra.x_mult ^ i
                card.joker_display_values.money = card.ability.extra.money * i
            end
        }
    end
}