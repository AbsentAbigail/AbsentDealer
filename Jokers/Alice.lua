SMODS.Joker {
    key = 'alice',
    atlas = 'Jokers',
    pos = {x = 7, y = 1},
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 3,
    config = {
        extra = {
            chip_mod = 10,
            chips = 0,
            poker_hand = nil
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.chip_mod,
                center.ability.extra.chips,
                (center.ability.extra.poker_hand and localize(center.ability.extra.poker_hand, "poker_hands")) or "-"
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.blueprint then
            return
        end

        if context.before then
            local ret = nil
            if card.ability.extra.poker_hand and context.scoring_name ~= card.ability.extra.poker_hand then
                card.ability.extra.chips = 0
                ret = {
                    message = localize('k_reset')
                }
            end
            card.ability.extra.poker_hand = context.scoring_name
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod

            return ret
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.CHIPS },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "hand" },
                { text = ")" },
            },
            calc_function = function(card)
                card.joker_display_values.hand = (card.ability.extra.poker_hand and localize(card.ability.extra.poker_hand, "poker_hands")) or "-"
            end
        }
    end
}