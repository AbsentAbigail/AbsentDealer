local ranks = {
    14, 13, 12, 11, 10
}

SMODS.Back {
    key = "royal",
    atlas = "Enhancers",
    pos = { x = 0, y = 1 },

    config = { hand_size = -2 },
    
    loc_vars = function(self, info_queue, back)
        return {
            vars = {
                self.config.hand_size
            }
        }
    end,
   
    apply = function(self, back)
        G.E_MANAGER:add_event(Event {
            func = function()
                for i = #G.playing_cards, 1, -1 do
                    local card = G.playing_cards[i]
                    if not AUtils.contains(ranks, card:get_id()) then
                        card:remove()
                    end
                end
                return true
            end
        })
    end
}