SMODS.Joker {
    key = 'blahaj',
    loc_txt = {
        name = 'Blåhaj',
        text = {
            "This Joker gains {X:mult,C:white}X#2#{} Mult",
            "every time a card with a",
            "{C:blue}Blue Seal{} is scored",
            "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"
        }
    },
    atlas = 'Jokers',
    pos = {x = 0, y = 0},
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            xMult = 1,
            xMult_gain = 0.1
        }
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {key = 'blue_seal', set = 'Other'}
        return {
            vars = {
                center.ability.extra.xMult,
                center.ability.extra.xMult_gain
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xMult,
            }
        end

        if context.individual and context.cardarea == G.play then
            if context.blueprint then
                return
            end
            if context.other_card.seal == 'Blue' then
                card.ability.extra.xMult = card.ability.extra.xMult + card.ability.extra.xMult_gain

                return {
                    message_card = card,
                    message = card.ability.extra.xMult .. ' Mult'
                }
            end
        end
    end
}