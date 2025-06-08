local hands = {
    "ad_envy",
    "ad_gluttony",
    "ad_greed",
    "ad_lust",
    "ad_pride",
    "ad_sloth",
    "ad_wrath",
}

SMODS.Consumable {
    key = "rhea",
    set = "Planet",
    atlas = "Tarots",
    pos = { x = 1, y = 0 },
    cost = 3,

    loc_vars = function(self, info_queue, center)
        local hand = G.GAME.hands[hands[1]]
        local level = hand.level
        return {
            vars = {
                level,
                nil,
                hand.l_mult,
                hand.l_chips,
                colours = {
                    AUtils.hand_level_colour(level)
                }
            }
        }
    end,
    
    can_use = function()
        return true
    end,

    use = function(self, card, area, copier)
        local hand = G.GAME.hands[hands[1]]
        
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {
            handname = localize('ad_sin_hands'),
            chips = hand.chips,
            mult = hand.mult,
            level = hand.level
        })
        
        for i, v in ipairs(hands) do
            level_up_hand(card, v, true)
        end

        G.E_MANAGER:add_event(Event { trigger = 'after', delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        })
        update_hand_text({delay = 0}, {
            mult = hand.mult,
            StatusText = true
        })
        G.E_MANAGER:add_event(Event { trigger = 'after', delay = 0.9, 
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end 
        })
        update_hand_text({delay = 0}, {
            chips = hand.chips,
            StatusText = true
        })
        G.E_MANAGER:add_event(Event { trigger = 'after', delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end 
        })
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {
            level='+1'
        })
        delay(1.3)

        
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {
            mult = 0,
            chips = 0,
            handname = '',
            level = ''
        })

    end,

    in_pool = function(self, args)
        for i, hand in ipairs(hands) do
            if G.GAME.hands[hand].visible then
                return true
            end
        end
        return false
    end,

 	set_badges = function(self, card, badges)
 		badges[1] = create_badge(localize('ad_planet_moon'), HEX("00a7ca"), G.C.WHITE, 1.2 )
 	end,
}