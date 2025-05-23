SMODS.Joker {
    key = 'friendship',
    atlas = 'Jokers',
    pos = {x = 3, y = 1},
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 5,
    config = {
        extra = {
            mult_mod = 1,
            mult = 0
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.mult_mod,
                center.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
				mult = card.ability.extra.mult
            }
        end
        if not context.blueprint and context.before then
            local suit_count = AUtils.get_suit_count_in_hand(context.scoring_hand)
            if suit_count > 1 then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            
            reminder_text = {
                { text = "(2+ Suits)" }
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize("Hearts", 'suits_singular')
            end
        }
    end
}