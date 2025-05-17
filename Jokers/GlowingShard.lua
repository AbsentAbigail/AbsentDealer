SMODS.Joker {
    key = 'glowingshard',
    loc_txt = {
        name = 'Glowing Shard',
        text = {
            "All scoring {C:attention}#1#s{} become {C:attention}Glass",
            "cards when played, rank",
            "changes every round"
        }
    },
    atlas = 'Jokers',
    pos = {x = 6, y = 0},
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    config = {
        extra = {
        }
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.m_glass
        return {
            vars = {
                localize(G.GAME.current_round.mail_card.rank, "ranks")
            }
        }
    end,
    calculate = function(self, card, context)
        if context.blueprint then
            return
        end
        if context.cardarea == G.jokers and context.before then
            local matching_cards = {}
            for _, scoring_card in ipairs(context.scoring_hand) do
                local debuffed = AUtils.debuffed(scoring_card, card)
                if scoring_card:get_id() == G.GAME.current_round.mail_card.id and not debuffed then
                    matching_cards[#matching_cards+1] = scoring_card
                    scoring_card:set_ability(G.P_CENTERS.m_glass, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scoring_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if #matching_cards > 0 then 
                return {
                    message = "Crystallised!",
                    card = self
                }
            end
        end
    end
}