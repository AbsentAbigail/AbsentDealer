SMODS.Tag {
    key = "balance",
    atlas = "Tags",
    pos = { x = 2, y = 0 },
    
    config = {
        extra = {
            activated = nil
        }
    },

    loc_vars = function(self, info_queue, card)
        return {

        }
    end,

    min_ante = 1,

    in_pool = function(self, args)
        return not (G.GAME.selected_back.effect.center.key == "b_plasma")
    end,
    
    apply = function(self, tag, context)
        if context.type == "round_start_bonus" and not G.GAME.ad_balance_tag then
            G.GAME.ad_balance_tag = true
            tag.config.extra.activated = true
            return
        end

        if not tag.config.extra.activated then
            return
        end
        
        if context.type == "ad_final_scoring_step" then
            AUtils.balance_score()
            return
        end
        
        if context.type == "ad_end_of_round" then
            G.GAME.ad_balance_tag = nil
            tag.triggered = true
            tag:yep(localize("k_balanced"), G.C.RED, function() return true end)
            return
        end
    end
}