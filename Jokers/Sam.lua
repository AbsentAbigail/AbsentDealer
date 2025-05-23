local rank = 9
local poker_hand = "Flush"

SMODS.Joker {
    key = 'sam',
    atlas = 'Jokers',
    pos = {x = 4, y = 2},
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    config = {
        extra = {
            x_chips = 2
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.x_chips,
                AUtils.localize_rank_from_id(rank),
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[poker_hand]) then
            local rank_check = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == rank then
                    rank_check = true
                    break
                end
            end
            if not rank_check then
                return
            end
            
            return {
                x_chips = card.ability.extra.x_chips
            }
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                    },
                    border_colour = G.C.CHIPS
                }
            },

            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = " and " },
                { ref_table = "card.joker_display_values", ref_value = "rank", colour = G.C.ORANGE },
                { text = ")" },
            },

            calc_function = function(card)
                local x_mult = 1
                local _, poker_hands, scoring_hand = JokerDisplay.evaluate_hand()
                if poker_hands[poker_hand] and next(poker_hands[poker_hand]) then
                    for _, scoring_card in pairs(scoring_hand) do
                        local debuffed = AUtils.debuffed(scoring_card, card)
                        if scoring_card:get_id() == rank and not debuffed then
                            x_mult = card.ability.extra.x_chips
                            break
                        end
                    end
                end
                card.joker_display_values.x_mult = x_mult
                card.joker_display_values.localized_text = localize(poker_hand, 'poker_hands')
                card.joker_display_values.rank = AUtils.localize_rank_from_id(rank)
            end
        }
    end
}