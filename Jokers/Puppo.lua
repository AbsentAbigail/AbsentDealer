SMODS.Joker {
    key = 'puppo',
    atlas = 'Jokers',
    pos = { x = 1, y = 4 },
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    config = {
        extra = {
            extra_draw = 3
        }
    },
    
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.extra_draw
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local draw = card.ability.extra.extra_draw
            draw = G.GAME.blind:get_type() == 'Boss' and draw * 2 or draw
            for i = 1, draw do
                draw_card(G.deck, G.hand, i*100/draw,'up', true)
            end
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {}
    end
}