local function getMult(mod, times) return (mod * times) end

local function getVoucherCount()
    local i = 0
    
    for voucher, redeemed in pairs(G.GAME.used_vouchers) do
        if redeemed then
            i = i + 1
        end
    end

    return i
end

SMODS.Voucher {
    key = 'long_cat',
    atlas = 'Vouchers',
    pos = {x = 0, y = 1},
    cost = 10,
    requires = {
        "v_ad_longkitty"
    },
    config = {
        extra = {
            xmult = 1
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.xmult,
                center.ability.extra.xmult * getVoucherCount()
            }
        }
    end,

    calculate = function(self, card, context)
        if not context.final_scoring_step then
            return
        end

        return {
            xmult = card.ability.extra.xmult * getVoucherCount()
        }
    end
}