local rank = 14

SMODS.Joker {
    key = 'lilguy',
    atlas = 'Jokers',
    pos = {x = 9, y = 0},
    blueprint_compat = true,
    rarity = 2,
    cost = 4,
    config = {
        extra = {
            retriggers = 2
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                AUtils.localize_rank_from_id(rank),
                center.ability.extra.retriggers
            }
        }
    end,

    calculate = function(self, card, context)
        if not context.blueprint and context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true) -- Jiggle if active
        end

        if context.repetition and context.cardarea == G.play then
            if G.GAME.current_round.hands_played == 0 and context.other_card:get_id() == rank then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            end
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "active" },
                { text = ")" },
            },
            
            calc_function = function(card)
                card.joker_display_values.active = (G.GAME and G.GAME.current_round.hands_played == 0 and localize("jdis_active") or localize("jdis_inactive"))
            end,

            retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
                if held_in_hand then return 0 end
                if not (G.GAME and G.GAME.current_round.hands_played == 0) then return 0 end
                return playing_card:get_id() == rank and
                    joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card) or 0
            end
        }
    end
}