local source_enhancement = "m_stone"
local target_edition = "e_negative"

SMODS.Joker {
    key = 'obsidian',
    atlas = 'Jokers',
    pos = {x = 3, y = 4},
    blueprint_compat = false,
    rarity = 2,
    cost = 7,
    config = {
        extra = {
        }
    },

    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS[source_enhancement]
        info_queue[#info_queue + 1] = { key = 'e_negative_playing_card', set = 'Edition', config = { extra = 1 } }
        return {
            vars = {
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
                if not debuffed and SMODS.has_enhancement(scoring_card, source_enhancement) then
                    matching_cards[#matching_cards+1] = scoring_card
                    scoring_card:set_edition(target_edition, nil, true)
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
                    message = localize("ad_obsidian")
                }
            end
        end
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
        }
    end
}