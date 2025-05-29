SMODS.Enhancement {
    key = "wrath",
    atlas = "Enhancers",
    pos = { x = 5, y = 0},
    weight = 1,

    always_scores = true,

    config = {
        extra = {
            x_mult = 2,
            odds = 3
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                G.GAME and G.GAME.probabilities.normal or 1,
                center.ability.extra.odds,
                center.ability.extra.x_mult
            }
        }
    end,

    set_card_type_badge = function(self,card,badges)
        local label = localize({ type = "name_text", set = "Enhanced", key = self.key, vars = {} })
        badges[#badges+1] = create_badge(label, ad_sin_colour or G.C.WHITE, G.C.WHITE, 1.2)
    end,

    calculate = function(self, card, context)
        if not (context.main_scoring and context.cardarea == G.play) then
            return
        end

        if not AUtils.calculate_odds('ad_wrath', card.ability.extra.odds) then
            return
        end

        return {
            x_mult = card.ability.extra.x_mult
        }
    end
}