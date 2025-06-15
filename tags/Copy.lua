SMODS.Tag {
    key = "copy",
    atlas = "Tags",
    pos = { x = 1, y = 0 },
    
    config = {

    },

    loc_vars = function(self, info_queue, card)
        return {

        }
    end,

    min_ante = 2,

    in_pool = function(self, args)
        return true
    end,

    apply = function(self, tag, context)
        local function has_space(joker)
            return #G.jokers.cards <= G.jokers.config.card_limit or joker.edition and joker.edition.negative
        end

        local function copy_joker()
            if not next(G.jokers.cards) then
                return G.C.RED, localize("k_no_other_jokers")
            end

            local joker = pseudorandom_element(G.jokers.cards, pseudoseed('ad_copy_tag'))

            if not has_space(joker) then
                return G.C.RED, localize("k_no_room_ex")
            end

            local copied_joker = copy_card(joker, nil, nil, nil, nil)
            copied_joker:add_to_deck()
            G.jokers:emplace(copied_joker)
            
            return G.C.BLUE, localize("k_duplicated_ex")
        end
        local colour, text = copy_joker()

        ease_dollars(-G.GAME.dollars, nil)

        tag.triggered = true
        tag:yep(text, colour, function() return true end)
    end
}