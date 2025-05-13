SMODS.Joker {
    key = 'lilguy',
    loc_txt = {
        name = 'Lil Guy',
        text = {
            "During {C:attention}first hand of round{},",
            "retrigger played {C:attention}#1#s #2#{} times"
        }
    },
    atlas = 'Jokers',
    pos = {x = 9, y = 0},
    blueprint_compat = true,
    rarity = 2,
    cost = 4,
    config = {
        extra = {
            retriggers = 2
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                localize("Ace", "ranks"),
                center.ability.extra.retriggers
            }
        }
    end,
    calculate = function(self, card, context)
        if not context.blueprint and context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true) -- Jiggle if active
        end

        if context.repetition and context.cardarea == G.play then
            if G.GAME.current_round.hands_played == 0 and context.other_card:get_id() == 14 then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            end
        end
    end
}