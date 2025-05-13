SMODS.Joker {
    key = 'sherba',
    loc_txt = {
        name = 'Sherba',
        text = {
            "During {C:attention}first hand of round{},",
            "retrigger all played cards {C:attention}once",
            "{C:attention}for each remaining hand"
        }
    },
    atlas = 'Jokers',
    pos = {x = 0, y = 1},
    soul_pos = {x = 1, y = 1},
    blueprint_compat = true,
    rarity = 4,
    config = {
        extra = {
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
            }
        }
    end,
    calculate = function(self, card, context)
        if not context.blueprint and context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true) -- Jiggle if active
        end

        if context.repetition and context.cardarea == G.play then
            if G.GAME.current_round.hands_played == 0 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = G.GAME.current_round.hands_left,
                    card = card
                }
            end
        end
    end
}