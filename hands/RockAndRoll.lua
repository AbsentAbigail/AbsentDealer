SMODS.PokerHand {
    key = "rockandroll",
    chips = 0,
    mult = 5,
    l_chips = 50,
    l_mult = 2,
    example = {
        { 'H_2', true, enhancement = "m_stone" },
        { 'H_3', true, enhancement = "m_stone" },
        { 'H_7', true, enhancement = "m_stone" },
        { 'H_A', true, enhancement = "m_stone" },
        { 'H_Q', true, enhancement = "m_stone" },
    },
    above_hand = "Pair",
    visible = false,

    evaluate = function(parts, hand)
        if #hand < 5 then
            return {}
        end
        
        local rocks = {}

        for i, card in ipairs(hand) do
            if SMODS.has_enhancement(card, "m_stone") then
                rocks[#rocks + 1] = card
            end
        end

        return #rocks >= 5 and { rocks } or {}
    end
}