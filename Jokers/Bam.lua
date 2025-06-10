SMODS.Joker {
    key = 'bam',
    atlas = 'Jokers',
    pos = {x = 8, y = 2},
    blueprint_compat = true,
    rarity = 3,
    cost = 6,
    config = {
        extra = {
            x_chips_base = 1.1,
            x_chips = 1.1,
            x_chips_gain = 0.1
        }
    },

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        return {
            vars = {
                center.ability.extra.x_chips,
                center.ability.extra.x_chips_gain,
            }
        }
    end,

    calculate = function(self, card, context)
        local extra = card.ability.extra

        if context.individual and context.cardarea == G.play then
            local scoring_card = context.other_card

            if not SMODS.has_enhancement(scoring_card, 'm_bonus') then
                return
            end

            local x_chips = extra.x_chips

            if not context.blueprint then
                extra.x_chips = extra.x_chips + extra.x_chips_gain
            end
            
            return {
                xchips = x_chips
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if extra.x_chips > extra.x_chips_base then
                extra.x_chips = extra.x_chips_base
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
    end,

    in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_lucky'`
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_bonus') then
                return true
            end
        end
        return false
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.joker_display_values", ref_value = "x_chips", retrigger_type = "exp" }
                    },
                    border_colour = G.C.CHIPS
                }
            },

            reminder_text = {
                { text = "(Bonus Cards)" }
            },
            
            calc_function = function(card)
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                local extra = card.ability.extra

                if text == 'Unknown' then
                    card.joker_display_values.x_chips = 1
                    return
                end

                local bonus_cards = 0

                for _, scoring_card in pairs(scoring_hand) do
                    if SMODS.has_enhancement(scoring_card, 'm_bonus') then
                        bonus_cards = bonus_cards + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end

                local x_chips = 1
                while bonus_cards > 0 do
                    x_chips = x_chips * (extra.x_chips + extra.x_chips_gain * (bonus_cards - 1))
                    bonus_cards = bonus_cards - 1
                end
                card.joker_display_values.x_chips = x_chips
            end
        }
    end
}