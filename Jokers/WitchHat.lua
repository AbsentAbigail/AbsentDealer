local mod = 1

SMODS.Joker {
    key = 'witch_hat',
    atlas = 'Jokers',
    pos = {x = 4, y = 4},
    soul_pos = {x = 5, y = 4},
    blueprint_compat = false,
    rarity = 3,
    cost = 5,
    config = {
        extra = {
        }
    },
    
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = ad_liber_credit
        return {
            vars = {
                G.GAME.ad_max_highlight_modifier or 0
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.ad_max_highlight_modifier = (G.GAME.ad_max_highlight_modifier or 0) + mod
    end,
    remove_from_deck = function(self, card, from_debuff)
        local current_mod = G.GAME.ad_max_highlight_modifier
        G.GAME.ad_max_highlight_modifier = current_mod and (current_mod - mod) or 0
    end,

    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
        }
    end
}