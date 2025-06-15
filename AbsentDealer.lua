SMODS.current_mod.optional_features = {
    -- enable additional SMODS contexts that can be CPU intensive
    cardareas = { discard = true }
}

if SMODS.current_mod.config.debug_hotkey then
    -- Debug
    SMODS.Keybind {
        key_pressed = "g",
        action = function()
            add_tag(Tag('tag_ad_cracked_mirror'))
        end
    }
end

local path = "content/"

SMODS.load_file(path .. "Utils.lua")()
SMODS.load_file(path .. "Atlas.lua")()
SMODS.load_file(path .. "Globals.lua")()
SMODS.load_file(path .. "Hooks.lua")()

-- Jokers
SMODS.load_file(path .. "Jokers.lua")()

-- Enhancements
SMODS.load_file(path .. "Enhancements.lua")()

-- Consumables
SMODS.load_file(path .. "Consumables.lua")()

-- Decks
SMODS.load_file(path .. "Decks.lua")()

-- Hands
SMODS.load_file(path .. "Hands.lua")()

-- Seals
SMODS.load_file(path .. "Seals.lua")()

-- Tags
SMODS.load_file(path .. "Tags.lua")()