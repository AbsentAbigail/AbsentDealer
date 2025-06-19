SMODS.Tag {
    key = "defiance",
    atlas = "Tags",
    pos = { x = 3, y = 0 },
    
    config = {
        extra = {
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
        if not (context.type == "ad_end_of_round" and context.game_over) then
            return
        end

        if SMODS.saved then
            return
        end

        SMODS.saved = "ad_defied"
        tag.triggered = true
        tag:yep(localize("ad_defied"), G.C.RED, function() return true end)
    end
}