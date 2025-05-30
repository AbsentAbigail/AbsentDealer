SMODS.Enhancement {
    key = "gluttony",
    atlas = "Enhancers",
    pos = { x = 3, y = 0},
    weight = ad_sin_weight,

    config = {
        extra = {
            chip_gain = 11 
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.chip_gain
            }
        }
    end,
    
    set_card_type_badge = function(self,card,badges)
        local label = localize({ type = "name_text", set = "Enhanced", key = self.key, vars = {} })
        badges[#badges+1] = create_badge(label, ad_sin_colour or G.C.WHITE, G.C.WHITE, 1.2)
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.ability.perma_bonus = (card.ability.perma_bonus or 0) + card.ability.extra.chip_gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
    end
}