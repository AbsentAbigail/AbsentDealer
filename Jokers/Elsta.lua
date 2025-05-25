SMODS.Joker {
    key = 'elsta',
    atlas = 'Jokers',
    pos = {x = 4, y = 3},
    blueprint_compat = true,
    rarity = 3,
    cost = 7,
    config = {
        extra = {
            retriggers = 0
        }
    },

    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.retriggers
            }
        }
    end,

    calculate = function(self, card, context)
        local extra = card.ability.extra

        if context.repetition and context.cardarea == G.hand and extra.retriggers > 0 then
            if next(context.card_effects[1] or #context.card_effects > 1) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = extra.retriggers,
                    card = card
                }
            end
        end

        if context.blueprint then
            return
        end

        if context.cardarea == G.jokers and context.before then
            for _, scoring_card in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(scoring_card, "m_steel") then
                    extra.retriggers = extra.retriggers + 1
                end
            end
        end

        if context.starting_shop and context.cardarea == G.jokers then
            extra.retriggers = 0
        end
    end,
    
    in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_lucky'`
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_steel') then
                return true
            end
        end
        return false
    end,
    
    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.ability.extra", ref_value = "retriggers" },
                { text = ")" }
            },

            retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
                return held_in_hand
                    and JokerDisplay.calculate_joker_triggers(joker_card) * joker_card.ability.extra.retrigger
                    or 0
            end
        }
    end
}