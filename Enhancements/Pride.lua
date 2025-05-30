SMODS.Enhancement {
    key = "pride",
    atlas = "Enhancers",
    pos = { x = 0, y = 0},
    weight = ad_sin_weight,
    
    set_card_type_badge = function(self,card,badges)
        local label = localize({ type = "name_text", set = "Enhanced", key = self.key, vars = {} })
        badges[#badges+1] = create_badge(label, ad_sin_colour or G.C.WHITE, G.C.WHITE, 1.2)
    end,

    calculate = function(self, card, context)
        if not context.repetition then
            return
        end
        
        if not (context.cardarea == G.play or context.cardarea == G.hand) then
            return
        end

        if not context.scoring_hand then
            return
        end

        local suits = AUtils.get_suit_count_in_hand(context.scoring_hand)
        
        return {
            message = localize('k_again_ex'),
            repetitions = suits,
            card = card
        }
    end
}