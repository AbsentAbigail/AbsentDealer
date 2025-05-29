SMODS.Joker {
    key = 'hideandseek',
    atlas = 'Jokers',
    pos = {x = 4, y = 0},
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            odds = 4,
            retrigger = 2
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                G.GAME and G.GAME.probabilities.normal or 1,
                center.ability.extra.odds,
                center.ability.extra.retrigger
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand then
            local debuffed = AUtils.debuffed(context.other_card, card)
            if context.other_card.facing == "back" and (next(context.card_effects[1]) or #context.card_effects > 1) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retrigger,
                    card = card
                }
            end
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
                return held_in_hand 
                    and playing_card.facing and playing_card.facing == "back"
                    and JokerDisplay.calculate_joker_triggers(joker_card) * joker_card.ability.extra.retrigger
                    or 0
            end
        }
    end
}

local stay_flipped_ref = Blind.stay_flipped
function Blind.stay_flipped(self, area, card)
    if area == G.hand then
        local _, hideandseek = next(SMODS.find_card('j_ad_hideandseek'))
        if hideandseek and AUtils.calculate_odds('ad_hideandseek', hideandseek.ability.extra.odds) then
            return true
        end
    end
    return stay_flipped_ref(self, area, card)
end