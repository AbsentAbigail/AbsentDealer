SMODS.current_mod.optional_features = {
    -- enable additional SMODS contexts that can be CPU intensive
    cardareas = { discard = true }
}

SMODS.Atlas({
    key = "modicon",
    path = "modicon.png",
    px = 32,
    py = 32
})

SMODS.Atlas {
    key = 'Jokers',
    path = 'Jokers.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'Scale',
    path = 'Scale.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'Enhancers',
    path = 'Enhancers.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'Tarots',
    path = 'Tarots.png',
    px = 71,
    py = 95
}

SMODS.load_file("Utils.lua")()

-- Colours
ad_sin_colour = HEX("927ad8")

-- Credit Centers
ad_megamarine_credit = {set = "Other", key = "ad_credit", vars = {"Art", "Megamarine", colours = { HEX("a950c0"), G.C.BLUE}}}
ad_tsuki_credit = {set = "Other", key = "ad_credit", vars = {"Idea", "tsuki", colours = { HEX("ff509f"), G.C.BLUE}}}

-- Common Jokers
AUtils.Joker("CrowningCeremony")
AUtils.Joker("Bubbles")
AUtils.Joker("Djungelskog")
AUtils.Joker("Aftonsparv")
AUtils.Joker("Friendship")
AUtils.Joker("Alice")
AUtils.Joker("Imagination")
AUtils.Joker("Catcus")
AUtils.Joker("May")
AUtils.Joker("April")
AUtils.Joker("Nina")

-- Uncommon Jokers
AUtils.Joker("Blahaj")
AUtils.Joker("HideAndSeek")
AUtils.Joker("GlowingShard")
AUtils.Joker("LilGuy")
AUtils.Joker("Blackfisk")
AUtils.Joker("ChainedJoker")
AUtils.Joker("Sam")
AUtils.Joker("SpareSkirt")
AUtils.Joker("Chirp")
AUtils.Joker("Scale")

-- Rare Jokers
AUtils.Joker("Catcitten")
AUtils.Joker("Seal")
AUtils.Joker("Cuddles")
AUtils.Joker("Bam")
AUtils.Joker("Boozle")
AUtils.Joker("SnuggleBuddies")
AUtils.Joker("AprilAndMay")
AUtils.Joker("Elsta")
AUtils.Joker("ShadyBox")
AUtils.Joker("Patch")

-- Legendary Jokers
AUtils.Joker("Sherba")
AUtils.Joker("Spot")
AUtils.Joker("Octavia")

if SMODS.current_mod.config.debug_jokers then
    -- Debug
    AUtils.Joker("Debuff")
end

-- Enhancements
AUtils.Enhancement("Pride")
AUtils.Enhancement("Envy")
AUtils.Enhancement("Greed")
AUtils.Enhancement("Gluttony")
AUtils.Enhancement("Lust")
AUtils.Enhancement("Wrath")
AUtils.Enhancement("Sloth")

-- Consumables
AUtils.Consumable("Sin")

-- Round based random effects

local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	init_seal_hand(ret)
	init_glowing_shard_hand(ret)
	init_imagination_hand(ret)
	return ret
end

function SMODS.current_mod.reset_game_globals(run_start)
	reset_seal_hand()
    reset_glowing_shard_rank()
    reset_imagination_rank()
end