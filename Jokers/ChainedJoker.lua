SMODS.Joker {
    key = 'chained_joker',
    atlas = 'Jokers',
    pos = {x = 5, y = 1},
    soul_pos = {x = 6, y = 1},
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 7,
    config = {
        extra = {
            xmult = 2
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                    }
                }
            },        
        }
    end
}

local create_card_ref = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	local ret = create_card_ref(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
	if ret.config.center_key == "j_ad_chained_joker" then
        ret:set_eternal(true)
    end
	return ret
end