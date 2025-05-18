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

SMODS.load_file("Utils.lua")()

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

-- Rare Jokers
AUtils.Joker("Catcitten")
AUtils.Joker("Seal")
AUtils.Joker("Cuddles")
AUtils.Joker("Bam")

-- Legendary Jokers
AUtils.Joker("Sherba")
AUtils.Joker("Spot")

if SMODS.current_mod.config.debug_jokers then
    -- Debug
    AUtils.Joker("Debuff")
end

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