local base_cost = 10

local function on_use(card)
    G.GAME.ad_chance_cost = G.GAME.ad_chance_cost or base_cost

    ease_dollars(-G.GAME.ad_chance_cost, true)
    card:juice_up(0.3, 0.5)
    
    G.GAME.ad_chance_cost = G.GAME.ad_chance_cost * 2
    
    for k, v in pairs(G.GAME.probabilities) do
        G.GAME.probabilities[k] = v * 2
    end
end

SMODS.Consumable {
    key = "chance",
    set = "Spectral",
    atlas = "Tarots",
    pos = { x = 3, y = 0 },
    cost = 4,

    config = {
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                G.GAME.ad_chance_cost or base_cost
            }
        }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = on_use(card)
        }))
    end,
}