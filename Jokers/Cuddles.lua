SMODS.Joker {
    key = 'cuddles',
    loc_txt = {
        name = 'Cuddles',
        text = {
            "Doubles all {C:attention}listed {C:green,E:1,S:1.1}probabilities",
            "Successful {C:attention}Lucky{} card",
            "triggers also give {X:mult,C:white}X#1#{} Mult"
        }
    },
    atlas = 'Jokers',
    pos = {x = 9, y = 1},
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    config = {
        extra = {
            x_mult = 2
        }
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return {
            vars = {
                center.ability.extra.x_mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.lucky_trigger then
                return {
                    xmult = card.ability.extra.x_mult
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v * 2
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v / 2
        end
    end,
    in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_lucky'`
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_lucky') then
                return true
            end
        end
        return false
    end
}