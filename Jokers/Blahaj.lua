SMODS.Joker {
    key = 'blahaj',
    atlas = 'Jokers',
    pos = {x = 0, y = 0},
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            x_mult = 1,
            x_mult_gain = 0.2
        }
    },

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.c_trance
        return {
            vars = {
                center.ability.extra.x_mult,
                center.ability.extra.x_mult_gain,
                colours = {
                    next(SMODS.find_card('j_ad_blahaj')) and G.C.UI.TEXT_INACTIVE or nil,
                    next(SMODS.find_card('j_ad_blahaj')) and G.C.UI.TEXT_INACTIVE or G.C.BLUE
                }
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
		if not (#G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit) then
            return -- no space in consumable area
        end

        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        SMODS.calculate_effect({
            message = localize("ad_trans"),
            message_card = card,
            func = function() -- This is for timing purposes, everything here runs after the message
                G.E_MANAGER:add_event(Event {
                    func = function()
                        SMODS.add_card {
                            set = 'Spectral',
                            key = 'c_trance' -- Optional, useful for checking the source of the creation in `in_pool`.
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                })
            end
        }, card)
	end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.x_mult,
            }
        end

        if context.individual and context.cardarea == G.play then
            if context.blueprint then
                return
            end

            if context.other_card.seal == 'Blue' then
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_gain

                return {
                    message_card = card,
                    message = card.ability.extra.x_mult .. ' Mult'
                }
            end
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "x_mult", retrigger_type = "exp" }
                    }
                }
            }
        }
    end
}