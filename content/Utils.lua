AUtils = {}

local joker_path = 'jokers/'
local enhancement_path = 'enhancements/'
local consumable_path = 'consumables/'
local back_path = 'backs/'
local hand_path = 'hands/'
local seal_path = 'seals/'

function AUtils.joker(joker)
    SMODS.load_file(joker_path .. joker .. ".lua")()
end

function AUtils.enhancement(enhancement)
    SMODS.load_file(enhancement_path .. enhancement .. ".lua")()
end

function AUtils.consumable(consumable)
    SMODS.load_file(consumable_path .. consumable .. ".lua")()
end

function AUtils.back(back)
    SMODS.load_file(back_path .. back .. ".lua")()
end

function AUtils.hand(hand)
    SMODS.load_file(hand_path .. hand .. ".lua")()
end

function AUtils.seal(seal)
    SMODS.load_file(seal_path .. seal .. ".lua")()
end

function AUtils.hand_level_colour(level)
    return to_big(level) == to_big(1)
        and G.C.UI.TEXT_DARK
        or G.C.HAND_LEVELS[to_big(math.min(7, level)):to_number()]
end

function AUtils.localize_rank_from_id(id)
    local ranks = {
        [11] = "Jack",
        [12] = "Queen",
        [13] = "King",
        [14] = "Ace"
    }
    return localize(ranks[id] or tostring(id), "ranks")
end

function AUtils.calculate_odds(seed, odds)
	return pseudorandom(seed) < G.GAME.probabilities.normal / odds
end

function AUtils.debuffed(card, source)
    if card.debuff then
        return {
            message = localize('k_debuffed'),
            colour = G.C.RED,
            card = source
        }
    elseif not Card:can_calculate(nil) then
        return {}
    end
end

function AUtils.get_suit_count_in_hand(scoring_hand)
    local suits = {
        ['Hearts'] = 0,
        ['Diamonds'] = 0,
        ['Spades'] = 0,
        ['Clubs'] = 0
    }
    for i = 1, #scoring_hand do
        if scoring_hand[i].ability.name ~= 'Wild Card' then
            if scoring_hand[i]:is_suit('Hearts') then
                suits["Hearts"] = suits["Hearts"] + 1
            end
            if scoring_hand[i]:is_suit('Diamonds') then
                suits["Diamonds"] = suits["Diamonds"] + 1
            end
            if scoring_hand[i]:is_suit('Spades') then
                suits["Spades"] = suits["Spades"] + 1
            end
            if scoring_hand[i]:is_suit('Clubs') then
                suits["Clubs"] = suits["Clubs"] + 1
            end
        end
    end
    for i = 1, #scoring_hand do
        if scoring_hand[i].ability.name == 'Wild Card' then
            if scoring_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0 then
                suits["Clubs"] = suits["Clubs"] + 1
            elseif scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0 then
                suits["Diamonds"] = suits["Diamonds"] + 1
            elseif scoring_hand[i]:is_suit('Spades') and suits["Spades"] == 0 then
                suits["Spades"] = suits["Spades"] + 1
            elseif scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then
                suits["Hearts"] = suits["Hearts"] + 1
            end
        end
    end
    i = 0
    for k, v in pairs(suits) do
        if v > 0 then
            i = i + 1
        end
    end
    return i
end

function AUtils.contains(table, value)
    for i, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end
