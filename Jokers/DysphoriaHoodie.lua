SMODS.Joker {
    key = 'dysphoria_hoodie',
    atlas = 'Jokers',
    pos = { x = 0, y = 4 },
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            reduce_by = 10,
            increase_per_round = 1
        }
    },
    
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.reduce_by,
                center.ability.extra.increase_per_round
            }
        }
    end,
    
    calculate = function(self, card, context)
        local extra = card.ability.extra

        if context.setting_blind then
            local blind_chips = G.GAME.blind.chips * (100 - extra.reduce_by) / 100
            G.GAME.blind.chips = blind_chips
            G.GAME.blind.chip_text = number_format(blind_chips)
            return {
                message = localize("ad_covered")
            }
        end

        if context.blueprint then
            return
        end

        if context.main_eval and context.end_of_round then
            extra.reduce_by = extra.reduce_by + extra.increase_per_round
            return {
                message = localize('k_upgrade_ex'),
            }
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                { text = "-" },
                { ref_table = "card.ability.extra", ref_value = "reduce_by", retrigger_type = "mult" },
                { text = "%" },
            }
        }
    end
}