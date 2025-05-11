SMODS.Joker {
    key = 'catcitten',
    loc_txt = {
        name = 'Catcitten',
        text = {
            "Played cards with {C:diamonds}Diamond{}",
            "suit have a {C:green}#1# in #2#{} chance to",
            "add a permanent copy to deck",
            "and draw it to {C:attention}hand"
        }
    },
    atlas = 'Jokers',
    pos = {x = 1, y = 0},
    blueprint_compat = true,
    rarity = 3,
    config = {
        extra = {
            odds = 5
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                G.GAME and G.GAME.probabilities.normal or 1,
                center.ability.extra.odds
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local card_to_copy = context.other_card
            
            if not card_to_copy:is_suit("Diamonds", nil, nil) then
                return
            end
            
            if not (pseudorandom('catcitten') < G.GAME.probabilities.normal / card.ability.extra.odds) then
                return
            end

            G.E_MANAGER:add_event(Event({
                    func = function()
                        local copy = copy_card(card_to_copy, nil, nil, G.playing_card)
                        copy:add_to_deck()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, copy)
                        G.hand:emplace(copy)
                        copy.states.visible = nil
                        copy:start_materialize()
                        playing_card_joker_effects({copy})
                        return true
                    end
                }))
        end
    end
}