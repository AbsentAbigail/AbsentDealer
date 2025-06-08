SMODS.Joker {
    key = 'kiki',
    atlas = 'Jokers',
    pos = {x = 9, y = 3},
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    config = {
        extra = {
            chips = 0,
            chip_mod = 10
        }
    },

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] =  G.P_CENTERS.c_talisman
        return {
            vars = {
                center.ability.extra.chips,
                center.ability.extra.chip_mod,
                colours = {
                    next(SMODS.find_card('j_ad_kiki')) and G.C.UI.TEXT_INACTIVE or nil,
                    next(SMODS.find_card('j_ad_kiki')) and G.C.UI.TEXT_INACTIVE or G.C.BLUE
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
            message = "Hatched",
            message_card = card,
            func = function() -- This is for timing purposes, everything here runs after the message
                G.E_MANAGER:add_event(Event {
                    func = function()
                        SMODS.add_card {
                            set = 'Spectral',
                            key = 'c_talisman' -- Optional, useful for checking the source of the creation in `in_pool`.
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                })
            end
        }, card)
	end,

    calculate = function(self, card, context)
        local extra = card.ability.extra
        if context.ad_earn_money and to_big(context.ad_earn_money) > to_big(0) then
            extra.chips = extra.chips + extra.chip_mod
            SMODS.calculate_effect({
                message = localize("k_upgrade_ex"),
                colour = G.C.CHIPS,
                card = card
            }, card)
        end

        if context.joker_main then
            return {
                chips = extra.chips
            }
        end
        
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            extra.chips = 0
            return {
                message = localize('k_reset'),
                colour = G.C.INACTIVE
            }
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.CHIPS },
        }
    end
}