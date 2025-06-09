SMODS.Seal {
    key = "gray",
    atlas = "Enhancers",
    pos = { x = 4, y = 1 },
    badge_colour = HEX("6d6d6d"),

    config = {
        extra = {
            x_mult = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.x_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and (context.cardarea == G.hand or context.cardarea == G.play) then
            return {
                x_mult = card.ability.seal.extra.x_mult
            }
        end
    end
}