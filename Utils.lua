AUtils = {}

local jokerPath = 'Jokers/'

function AUtils.Joker(joker)
    SMODS.load_file(jokerPath .. joker .. ".lua")()
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

-- Taken from Pokermon pokefunctions.lua poke_total_chips
function AUtils.TotalChips(card)
    local total_chips = (card.ability.bonus) + (card.ability.perma_bonus or 0)
    if card.ability.effect ~= 'Stone Card' and not card.config.center.replace_base_card then
        total_chips = total_chips + (card.base.nominal)
    end
    if card.edition then
        total_chips = total_chips + (card.edition.chips or 0)
    end
    return total_chips
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

function AUtils.Contains(table, value)
    for k, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end
