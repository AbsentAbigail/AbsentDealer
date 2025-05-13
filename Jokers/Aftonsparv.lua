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
        if context.joker_main and AUtils.Contains(primes, G.GAME.current_round.hands_left) then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    end
}