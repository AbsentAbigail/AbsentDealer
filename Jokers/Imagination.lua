SMODS.Joker {
    key = 'imagination',
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
        info_queue[#info_queue+1] = G.P_CENTERS.e_foil
        info_queue[#info_queue+1] = G.P_CENTERS.e_holo
        info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
        return {
            vars = {
                localize(G.GAME.current_round.imagination_card.rank, "ranks"),
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
            if scoring_card:get_id() ~= G.GAME.current_round.imagination_card.id then
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
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" }
            },
            
            calc_function = function(card)
                card.joker_display_values.localized_text = localize(G.GAME.current_round.imagination_card.rank, "ranks")
            end
        }
    end
}

function init_imagination_hand(ret)
    ret.current_round.imagination_card = { rank = 'Ace' }
end

function reset_imagination_rank()
    G.GAME.current_round.imagination_card = { rank = 'Ace' }
    local valid_mail_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_rank(playing_card) then
            valid_mail_cards[#valid_mail_cards + 1] = playing_card
        end
    end
    local mail_card = pseudorandom_element(valid_mail_cards, pseudoseed('ad_imagination' .. G.GAME.round_resets.ante))
    if mail_card then
        G.GAME.current_round.imagination_card.rank = mail_card.base.value
        G.GAME.current_round.imagination_card.id = mail_card.base.id
    end
end