local function getMult(base, mod, times) return base + (mod * times) end
local function emptyJokerSlots() return G.jokers and (G.jokers.config.card_limit - #G.jokers.cards) or 0 end

SMODS.Voucher {
    key = 'long_kitty',
    atlas = 'Vouchers',
    pos = {x = 0, y = 0},
    cost = 10,
    config = {
        extra = {
            xmult = 1,
            xmult_mod = 0.4
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.xmult_mod,
                getMult(center.ability.extra.xmult, center.ability.extra.xmult_mod, emptyJokerSlots())
            }
        }
    end,

    calculate = function(self, card, context)
        if context.final_scoring_step then
            return {
                xmult = getMult(card.ability.extra.xmult, card.ability.extra.xmult_mod, emptyJokerSlots())
            }
        end
    end
}