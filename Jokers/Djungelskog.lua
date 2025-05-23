SMODS.Joker {
    key = 'djungelskog',
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
        if context.cardarea == G.hand and context.individual and not context.end_of_round then
            local debuff = AUtils.debuffed(context.other_card, card)
            if debuff then
                return
            end
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chip_bonus
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
        }
    end
}