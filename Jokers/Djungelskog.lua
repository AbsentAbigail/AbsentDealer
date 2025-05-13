SMODS.Joker {
    key = 'djungelskog',
    loc_txt = {
        name = 'Djungelskog',
        text = {
            "Each card {C:attention}held in hand{}",
            "permanently gains {C:chips}+#1#{} Chips"
        }
    },
    atlas = 'Jokers',
    pos = {x = 7, y = 0},
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    config = {
        extra = {
            chip_bonus = 2
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.chip_bonus
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.individual then
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chip_bonus
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
    end
}