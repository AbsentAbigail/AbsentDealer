SMODS.Tag {
    key = "cracked_mirror",
    atlas = "Tags",
    pos = { x = 0, y = 0 },
    
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
        
        local function activate()
            local copied_joker = copy_card(G.jokers.cards[1], nil, nil, nil, nil)
            copied_joker:add_to_deck()
            G.jokers:emplace(copied_joker)
            
            return true
        end

        local joker = G.jokers.cards[1]
        local success = joker and has_space(joker)

        G.GAME.ad_halve_scoring = (G.GAME.ad_halve_scoring or 0) + 1
        tag.triggered = true
        tag:yep(localize("ad_crack"), G.C.BLUE, success and activate or function() end)
    end
}