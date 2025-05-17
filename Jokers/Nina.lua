SMODS.Joker {
    key = 'nina',
    loc_txt = {
        name = 'Nina',
        text = {
            "Played {C:attention}Stone{} cards",
            "have a {C:green}#1# in #2#{} chance",
            "to break and earn {C:money}$#3#"
        }
    },
    atlas = 'Jokers',
    pos = {x = 2, y = 2},
    soul_pos = {x = 3, y = 2},
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            odds = 4,
            money = 9
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                G.GAME and G.GAME.probabilities.normal or 1,
                center.ability.extra.odds,
                center.ability.extra.money
            }
        }
    end,
    calculate = function(self, card, context)
        if context.blueprint then
            return
        end
        local destroying_card = context.destroying_card
        if destroying_card and SMODS.has_enhancement(destroying_card, 'm_stone') and not AUtils.debuffed(destroying_card, nil) then
            if AUtils.calculate_odds("ad_nina", card.ability.extra.odds) then
                return {
                    remove = true,
                    dollars = card.ability.extra.money,
                    message_card = destroying_card
                }
            end
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_stone') then
                return true
            end
        end
        return false
    end
}