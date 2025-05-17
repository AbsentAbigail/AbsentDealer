local convertFirstToRank = 12
local convertSecondToRank = 2


SMODS.Joker {
    key = 'crowningceremony',
    loc_txt = {
        name = 'Crowning Ceremony',
        text = {
            "If first hand of {C:attention}Boss Blind{}",
            "is a {C:attention}#3#{}, convert first scoring",
            "card into a {C:attention}#1#{}, and second",
            "scoring card into a {C:attention}#2#{}"
        }
    },
    atlas = 'Jokers',
    pos = {x = 3, y = 0},
    blueprint_compat = false,
    rarity = 1,
    cost = 3,
    config = {
        extra = {
            poker_hand = "Pair"
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                AUtils.localize_rank_from_id(convertFirstToRank),
                AUtils.localize_rank_from_id(convertSecondToRank),
                localize(center.ability.extra.poker_hand, 'poker_hands')
            }
        }
    end,
    calculate = function(self, card, context)
        if context.blueprint then
            return -- not blueprint compatible
        end

        if context.first_hand_drawn then
            local eval = function() return G.GAME.blind:get_type() == 'Boss' and G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true) -- Jiggle if active
        end

        if context.before and G.GAME.blind:get_type() == 'Boss' and G.GAME.current_round.hands_played == 0 and context.scoring_name == card.ability.extra.poker_hand then
            local first_scoring_card = context.scoring_hand[1] or {}
            local second_Scoring_card = context.scoring_hand[2] or {}

            local first_diff = convertFirstToRank - (first_scoring_card.base.id or 0)
            SMODS.modify_rank(first_scoring_card, first_diff)
            local second_diff = convertSecondToRank - (second_Scoring_card.base.id or 0)
            SMODS.modify_rank(second_Scoring_card, second_diff)

            return {
                message = "Crowned!"
            }
        end
    end
}