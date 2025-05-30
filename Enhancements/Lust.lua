local function check(card, i, scoring_hand)
    local previous_card = scoring_hand[i-1]
    if not previous_card or previous_card:get_id() == card:get_id() then
        return
    end

    local next_card = scoring_hand[i+1]
    if next_card and next_card:get_id() ~= card:get_id() then
        return {
            mult = card.ability.extra.mult
        }
    end
end

SMODS.Enhancement {
    key = "lust",
    atlas = "Enhancers",
    pos = { x = 4, y = 0},
    weight = ad_sin_weight,

    config = {
        extra = {
            mult = 20
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.mult
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

        for i, scoring_card in ipairs(context.scoring_hand) do
            if scoring_card == card then
                return check(card, i, context.scoring_hand)
            end
        end
    end
}