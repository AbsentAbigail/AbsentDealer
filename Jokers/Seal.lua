SMODS.Joker {
    key = 'seal',
    loc_txt = {
        name = 'Seal',
        text = {
            "If first hand of round is",
            "a {C:attention}#1#{}, add a random",
            "{C:attention}seal{} to the first scoring",
            "card, poker hand changes",
            "a end of round"
        }
    },
    atlas = 'Jokers',
    pos = {x = 2, y = 0},
    blueprint_compat = false,
    rarity = 3,
    cost = 6,
    config = {
        extra = {
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                localize(G.GAME.current_round.ajseal_card.poker_hand, 'poker_hands')
            }
        }
    end,

    calculate = function(self, card, context)
        if context.blueprint then
            return -- not blueprint compatible
        end
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true) -- Jiggle if active
        end
        if context.before and G.GAME.current_round.hands_played == 0 and context.scoring_name == G.GAME.current_round.ajseal_card.poker_hand then
            first_scoring_card = context.scoring_hand[1]
            generatedSeal = SMODS.poll_seal({
                guaranteed = true,
                type_key = 'ajseal'
            })
            first_scoring_card:set_seal(generatedSeal, nil, true)
            return
        end
        if context.end_of_round and not context.repetition and not context.individual then
            return {
                message = localize('k_reset')
            }
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" }
            },
            
            calc_function = function(card)
                card.joker_display_values.localized_text = localize(G.GAME.current_round.ajseal_card.poker_hand, 'poker_hands')
            end
        }
    end
}

function init_seal_hand(ret)
	ret.current_round.ajseal_card = { poker_hand = 'High Card' }
end

-- Change required Poker Hand every round
function reset_seal_hand()
	local newHand = G.GAME.current_round.ajseal_card.poker_hand or ''
    local _poker_hands = {}
    for k, v in pairs(G.GAME.hands) do
        if v.visible and k ~= newHand then _poker_hands[#_poker_hands+1] = k end
    end
    newHand = pseudorandom_element(_poker_hands, pseudoseed('ad_seal'))

	G.GAME.current_round.ajseal_card = { poker_hand = newHand }
end