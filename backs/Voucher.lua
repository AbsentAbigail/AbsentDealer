SMODS.Back {
    key = "voucher",
    atlas = "Enhancers",
    pos = { x = 1, y = 1 },

    loc_vars = function(self, info_queue, back)
        return { vars = { localize { type = 'name_text', key = 'tag_voucher', set = 'Tag' } } }
    end,
   
    calculate = function(self, back, context)
        if context.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss then
            G.E_MANAGER:add_event(Event({
                func = function()
                    add_tag(Tag('tag_voucher'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
        end
    end,
}