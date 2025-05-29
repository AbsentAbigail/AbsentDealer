SMODS.Enhancement {
    key = "greed",
    atlas = "Enhancers",
    pos = { x = 2, y = 0},
    weight = 1,

    config = {
        extra = {
            drain_money = 2,
            stored_money = 0
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.drain_money,
                center.ability.extra.stored_money
            }
        }
    end,
    
    set_card_type_badge = function(self,card,badges)
        local label = localize({ type = "name_text", set = "Enhanced", key = self.key, vars = {} })
        badges[#badges+1] = create_badge(label, ad_sin_colour or G.C.WHITE, G.C.WHITE, 1.2)
    end,

    calculate = function(self, card, context)
        local extra = card.ability.extra
        if context.end_of_round then
            extra.stored_money = 0
            return
        end

        if context.main_scoring and context.cardarea == G.hand then
            extra.stored_money = extra.stored_money + (extra.drain_money * 2)
            return {
                dollars = -extra.drain_money
            }
        end

        if context.before and context.cardarea == G.play and extra.stored_money ~= 0 then
            return {
                dollars = extra.stored_money
            }
        end
    end
}