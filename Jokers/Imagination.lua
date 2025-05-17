SMODS.Joker {
    key = 'imagination',
    loc_txt = {
        name = 'Imagination',
        text = {
            "Scored {C:attention}#1#s{} have a {C:green}#2# in #3#{} chance",
            "to gain {C:dark_edition}Foil{}, {C:dark_edition}Holographic{},",
            "or {C:dark_edition}Polychrome{} effect, rank",
            "changes every round"
        }
    },
    atlas = 'Jokers',
    pos = {x = 8, y = 1},
    blueprint_compat = false,
    rarity = 1,
    cost = 6,
    config = {
        extra = {
            odds = 8
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                localize(G.GAME.current_round.mail_card.rank, "ranks"),
                G.GAME and G.GAME.probabilities.normal or 1,
                center.ability.extra.odds
            }
        }
    end,
    calculate = function(self, card, context)
        if context.blueprint then
            return
        end
        if context.individual and context.cardarea == G.play then
            local scoring_card = context.other_card
            if scoring_card:get_id() ~= G.GAME.current_round.mail_card.id then
                return
            end

            if scoring_card.edition then
                return
            end

            if AUtils.calculate_odds("ad_imagination", card.ability.extra.odds) then
                G.E_MANAGER:add_event(Event {
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if scoring_card.edition then
                            return true
                        end
                        local edition = poll_edition('ad_imagination', nil, true, true)
                        scoring_card:set_edition(edition, true)
                        return true
                    end 
                })
            end
        end
    end
}