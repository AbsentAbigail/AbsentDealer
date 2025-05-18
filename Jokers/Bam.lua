SMODS.Joker {
    key = 'bam',
    loc_txt = {
        name = 'Bam',
        text = {
            "Scored {C:attention}Bonus{} cards give {X:chips,C:white}X#1#{} Chips",
            "and increase this by {X:chips,C:white}X#2#{}, resets",
            "at the end of round"
        }
    },
    atlas = 'Jokers',
    pos = {x = 8, y = 2},
    blueprint_compat = true,
    rarity = 3,
    cost = 6,
    config = {
        extra = {
            xchips_base = 1.1,
            xchips = 1.1,
            xchips_gain = 0.1
        }
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bonus
        return {
            vars = {
                center.ability.extra.xchips,
                center.ability.extra.xchips_gain,
            }
        }
    end,
    calculate = function(self, card, context)
        local extra = card.ability.extra

        if context.individual and context.cardarea == G.play then
            local scoring_card = context.other_card

            if not SMODS.has_enhancement(scoring_card, 'm_bonus') then
                return
            end

            local xchips = extra.xchips

            if not context.blueprint then
                extra.xchips = extra.xchips + extra.xchips_gain
            end
            
            return {
                xchips = xchips
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if extra.xchips > extra.xchips_base then
                extra.xchips = extra.xchips_base
                return {
                    message = localize('k_reset'),
                    colour = G.C.RED
                }
            end
        end
    end
}