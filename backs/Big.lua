SMODS.Back {
    key = "big",
    atlas = "Enhancers",
    pos = { x = 2, y = 1 },

    config = { joker_slot  = 2 },
    
    loc_vars = function(self, info_queue, back)
        return {
            vars = {
                self.config.joker_slot
            }
        }
    end,
   
    apply = function(self, back)
        G.E_MANAGER:add_event(Event {
            func = function()
                for i = #G.playing_cards, 1, -1 do
                    local card = G.playing_cards[i]
                    if card:get_id() < 11 then
                        local copy = copy_card(card, nil, nil, G.playing_card)
                        copy:add_to_deck()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, copy)
                        G.deck:emplace(copy)
                    end
                end
                return true
            end
        })
    end
}