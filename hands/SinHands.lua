local sins = {
    "envy",
    "gluttony",
    "greed",
    "lust",
    "pride",
    "sloth",
    "wrath",
}

local hand_chips = 160
local hand_mult = 20
local hand_level_chips = 60
local hand_level_mult = 5

local function all_sin(hand, enhancement)
    local sin_cards = {}
    for i, card in ipairs(hand) do
        if SMODS.has_enhancement(card, enhancement) then
            sin_cards[#sin_cards + 1] = card
        end
    end
    return sin_cards
end

for i, sin in ipairs(sins) do
    local enhancement = "m_ad_" .. sin
    
    SMODS.PokerHand {
        key = sin,
        chips = hand_chips,
        mult = hand_mult,
        l_chips = hand_level_chips,
        l_mult = hand_level_mult,
        visible = false,

        example = {
            { 'S_2', true, enhancement = enhancement },
            { 'H_3', true, enhancement = enhancement },
            { 'C_7', true, enhancement = enhancement },
            { 'D_A', true, enhancement = enhancement },
            { 'H_Q', true, enhancement = enhancement },
        },

        evaluate = function(parts, hand)
            if #hand < 5 then
                return {}
            end

            local sins = all_sin(hand, enhancement)
            return #sins >= 5 and { sins } or { }
        end
    }
end