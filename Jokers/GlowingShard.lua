SMODS.Joker {
    key = 'glowingshard',
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
                localize(G.GAME.current_round.glowing_shard_card.rank, "ranks")
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
                if scoring_card:get_id() == G.GAME.current_round.glowing_shard_card.id and not debuffed then
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
                    message = localize("ad_crystallised")
                }
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
                card.joker_display_values.localized_text = localize(G.GAME.current_round.glowing_shard_card.rank, "ranks")
            end
        }
    end
}

function init_glowing_shard_hand(ret)
    ret.current_round.glowing_shard_card = { rank = 'Ace' }
end

function reset_glowing_shard_rank()
    G.GAME.current_round.glowing_shard_card = { rank = 'Ace' }
    local valid_mail_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_rank(playing_card) then
            valid_mail_cards[#valid_mail_cards + 1] = playing_card
        end
    end
    local mail_card = pseudorandom_element(valid_mail_cards, pseudoseed('ad_glowing_shard' .. G.GAME.round_resets.ante))
    if mail_card then
        G.GAME.current_round.glowing_shard_card.rank = mail_card.base.value
        G.GAME.current_round.glowing_shard_card.id = mail_card.base.id
    end
end