SMODS.Consumable {
    key = "asteroid_belt",
    set = "Planet",
    atlas = "Tarots",
    pos = { x = 2, y = 0 },
    cost = 3,

    effect = "Hand Upgrade",

    config = {
        hand_type = "ad_rockandroll",
        softlock = true
    },

    loc_vars = function(self, info_queue, center)
        local hand = G.GAME.hands[center.ability.hand_type]
        local level = hand.level
        return {
            vars = {
                level,
                localize(center.ability.hand_type, 'poker_hands'),
                hand.l_mult,
                hand.l_chips,
                colours = {
                    AUtils.hand_level_colour(level)
                }
            }
        }
    end,
    
 	set_badges = function(self, card, badges)
 		badges[1] = create_badge(localize('ad_planet_not_planet'), HEX("00a7ca"), G.C.WHITE, 1.2 )
 	end,
}