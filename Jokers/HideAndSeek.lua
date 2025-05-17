SMODS.Joker {
    key = 'hideandseek',
    loc_txt = {
        name = 'Hide and Seek',
        text = {
            "{C:green}#1# in #2#{} chance to",
            "draw cards face down,",
            "{C:attention}face down cards held in",
            "{C:attention}hand{} retrigger {C:attention}#3#{} times"
        }
    },
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
            if not debuffed and context.other_card.facing == "back" and (next(context.card_effects[1]) or #context.card_effects > 1) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retrigger,
                    card = card
                }
            end
        end
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