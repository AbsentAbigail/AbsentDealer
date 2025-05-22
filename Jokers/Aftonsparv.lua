primes = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97}
SMODS.Joker {
    key = 'aftonsparv',
    loc_txt = {
        name = 'Aftonsparv Prime',
        text = {
            "{C:chips}+#2#{} Chips and {C:mult}+#1#{} Mult if",
            "number of remaining {C:blue}hands{} is",
            "a {C:attention}prime number",
            "{C:inactive}(2, 3, 5, 7, ...)"
        }
    },
    atlas = 'Jokers',
    pos = {x = 2, y = 1},
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    config = {
        extra = {
            mult = 11,
            chips = 23
        }
    },
    
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.mult,
                center.ability.extra.chips
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main and G.GAME and AUtils.Contains(primes, G.GAME.current_round.hands_left) then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                { text = "+",                              colour = G.C.CHIPS },
                { ref_table = "card.joker_display_values", ref_value = "chips", colour = G.C.CHIPS, retrigger_type = "mult" },
                { text = " +",                             colour = G.C.MULT },
                { ref_table = "card.joker_display_values", ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
            },
            reminder_text = {
                { text = "(Prime hands)" }
            },
            calc_function = function(card)
                local is_prime = G.GAME and AUtils.Contains(primes, G.GAME.current_round.hands_left - 1)
                card.joker_display_values.chips = is_prime and card.ability.extra.chips or 0
                card.joker_display_values.mult = is_prime and card.ability.extra.mult or 0
            end
        }
    end
}