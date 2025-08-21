AUtils = {}

local joker_path = 'jokers/'
local enhancement_path = 'enhancements/'
local consumable_path = 'consumables/'
local back_path = 'backs/'
local hand_path = 'hands/'
local seal_path = 'seals/'
local tag_path = 'tags/'
local voucher_path = 'vouchers/'


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

function AUtils.tag(tag)
    SMODS.load_file(tag_path .. tag .. ".lua")()
end

function AUtils.voucher(voucher)
    SMODS.load_file(voucher_path .. voucher .. ".lua")()
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

function AUtils.calculate_odds(card, seed, odds)
    return SMODS.pseudorandom_probability(card, seed, 1, odds, seed)
	-- return pseudorandom(seed) < G.GAME.probabilities.normal / odds
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

function AUtils.balance_score()
    local total = hand_chips + mult
    hand_chips = math.floor(total/2)
    mult = math.floor(total/2)
    update_hand_text({delay = 0}, {mult = mult, chips = hand_chips})

    G.E_MANAGER:add_event(Event({
        func = function()
            play_sound('gong', 0.94, 0.3)
            play_sound('gong', 0.94*1.5, 0.2)
            play_sound('tarot1', 1.5)
            ease_colour(G.C.UI_CHIPS, {0.8, 0.45, 0.85, 1})
            ease_colour(G.C.UI_MULT, {0.8, 0.45, 0.85, 1})
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blockable = false,
                blocking = false,
                delay =  4.3,
                func = (function() 
                        ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                        ease_colour(G.C.UI_MULT, G.C.RED, 2)
                    return true
                end)
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blockable = false,
                blocking = false,
                no_delete = true,
                delay =  6.3,
                func = (function() 
                    G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
                    G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
                    return true
                end)
            }))
            return true
        end
    }))
end
