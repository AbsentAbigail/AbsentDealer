SMODS.current_mod.optional_features = {
    -- enable additional SMODS contexts that can be CPU intensive
    cardareas = { discard = true }
}

SMODS.load_file("Atlas.lua")()
SMODS.load_file("Utils.lua")()
SMODS.load_file("Globals.lua")()
SMODS.load_file("Hooks.lua")()

-- Jokers
SMODS.load_file("Jokers.lua")()

-- Enhancements
AUtils.enhancement("Pride")
AUtils.enhancement("Envy")
AUtils.enhancement("Greed")
AUtils.enhancement("Gluttony")
AUtils.enhancement("Lust")
AUtils.enhancement("Wrath")
AUtils.enhancement("Sloth")

-- Consumables
AUtils.consumable("Sin")

-- Decks
AUtils.back("Royal")
AUtils.back("Voucher")
AUtils.back("Big")