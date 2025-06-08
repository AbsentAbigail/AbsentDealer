SMODS.Joker {
    key = 'witch_hat',
    atlas = 'Jokers',
    pos = {x = 2, y = 1},
    blueprint_compat = false,
    rarity = 1,
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

    add_to_deck = function(self, card, from_debuff)
        for _, card in ipairs(G.consumeables.cards) do
            if card.ability and card.ability.set and card.ability.set == "Tarot" then
                local config = card.ability
                if config.max_highlighted then
                    config.max_highlighted = config.max_highlighted + 1
                    config.ad_witch_modified = config.ad_witch_modified and config.ad_witch_modified + 1 or 1
                end
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for _, card in ipairs(G.consumeables.cards) do
            local config = card.ability
            if card.set and card.set == "Tarot" and config.ad_witch_modified then
                if config.max_highlighted then
                    config.max_highlighted = config.max_highlighted - config.ad_witch_modified
                    config.ad_witch_modified = nil
                end
            end
        end
    end,

    joker_display_def = function(JokerDisplay) -- Joker Display integration
        return {
        }
    end
}

local create_card_reference = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    print("Created")
	local ret = create_card_reference(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local hats = SMODS.find_card("j_ad_witch_hat")
    print("Hats: " .. #hats)
    if next(hats) and ret.ability and ret.ability.set == "Tarot" and ret.ability.max_highlighted then
        print("do it")
        ret.ability.max_highlighted = ret.ability.max_highlighted + #hats
        ret.ability.ad_witch_modified = #hats
    end
	return ret
end