SMODS.Enhancement {
    key = "sloth",
    atlas = "Enhancers",
    pos = { x = 6, y = 0},
    weight = 1,

    config = {
        h_chips = 40
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.h_chips
            }
        }
    end,
    
    set_card_type_badge = function(self,card,badges)
        local label = localize({ type = "name_text", set = "Enhanced", key = self.key, vars = {} })
        badges[#badges+1] = create_badge(label, ad_sin_colour or G.C.WHITE, G.C.WHITE, 1.2)
    end
}