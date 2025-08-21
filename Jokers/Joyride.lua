SMODS.Joker {
    key = 'joyride',
    atlas = 'Jokers',
    pos = {x = 7, y = 4},
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    config = {
        extra = {
            increase_by = 1
        }
    },
    
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.increase_by,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval and #context.full_hand == 1 then
            local c = context.full_hand[1]

            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.5,
                func = function()
                    assert(SMODS.modify_rank(c, card.ability.extra.increase_by))
                    return true
                end
            }))
            return {
                message = localize('ad_joyride'),
                colour = G.C.MULT,
                card = c
            }
        end
    end,

    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
        }
    end
}