SMODS.Joker {
    key = 'debuff',
    loc_txt = {
        name = 'Debuff',
        text = {
            "Debuffs playing cards"
        }
    },
    atlas = 'Jokers',
    pos = {x = 10, y = 10},
    blueprint_compat = false,
    rarity = 4,
    cost = 5,
    config = {
        extra = {
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            for _, v in ipairs(G.playing_cards) do
                SMODS.debuff_card(v, true, card)
            end
        end
        if context.end_of_round and not context.individual and not context.repetition then
            for k, v in pairs(G.playing_cards) do
                SMODS.debuff_card(v, false, card)
            end
        end
    end
}