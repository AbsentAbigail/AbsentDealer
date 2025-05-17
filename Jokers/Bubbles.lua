SMODS.Joker {
    key = 'bubbles',
    loc_txt = {
        name = 'Bubbles the Bear',
        text = {
            "This joker gains {C:chips}+#1#{} Chips,",
            "if played hand contains scoring",
            "{C:hearts}Hearts",
            "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
        }
    },
    atlas = 'Jokers',
    pos = {x = 5, y = 0},
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 4,
    config = {
        extra = {
            chips = 10,
            chip_mod = 3
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.chip_mod,
                center.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.chips > 0 then
            return {
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
				chip_mod = card.ability.extra.chips,
				colour = G.C.CHIPS
            }
        end
        if not context.blueprint and context.before then
            for _, scoring_card in pairs(context.scoring_hand) do
                local debuffed = AUtils.debuffed(scoring_card, card)
                if scoring_card:is_suit("Hearts", nil, nil) and not debuffed then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS,
                        card = card
                    }
                end
            end
        end
    end
}