SMODS.Joker {
    key = 'bam',
    atlas = 'Jokers',
    pos = {x = 8, y = 2},
    blueprint_compat = true,
    rarity = 3,
    cost = 6,
    config = {
        extra = {
            xchips_base = 1.1,
            xchips = 1.1,
            xchips_gain = 0.1
        }
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        return {
            vars = {
                center.ability.extra.xchips,
                center.ability.extra.xchips_gain,
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

            local xchips = extra.xchips

            if not context.blueprint then
                extra.xchips = extra.xchips + extra.xchips_gain
            end
            
            return {
                xchips = xchips
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if extra.xchips > extra.xchips_base then
                extra.xchips = extra.xchips_base
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
    end,

    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xchips", retrigger_type = "exp" },
            },
            text_config = { colour = G.C.CHIPS },

            reminder_text = {
                { text = "(Bonus Cards)" }
            },
            
            calc_function = function(card)
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                local extra = card.ability.extra

                if text == 'Unknown' then
                    card.joker_display_values.xchips = 1
                    return
                end

                local bonus_cards = 0

                for _, scoring_card in pairs(scoring_hand) do
                    if SMODS.has_enhancement(scoring_card, 'm_bonus') then
                        bonus_cards = bonus_cards + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end

                local xchips = 1
                while bonus_cards > 0 do
                    xchips = xchips * (extra.xchips + extra.xchips_gain * (bonus_cards - 1))
                    bonus_cards = bonus_cards - 1
                end
                card.joker_display_values.xchips = xchips
            end
        }
    end
}