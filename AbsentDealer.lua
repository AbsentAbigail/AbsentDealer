--- STEAMODDED HEADER
--- MOD_NAME: Absent Dealer
--- MOD_ID: AbsentDealer
--- PREFIX: ad
--- MOD_AUTHOR: [Absent Abigail]
--- MOD_DESCRIPTION: Cute plush jokers
--- LOADER_VERSION_GEQ: 1.0.0
--- VERSION: 1.0.0
--- BADGE_COLOR: FC03DF

AUtils = {}

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

AUtils.Joker("Blahaj")
AUtils.Joker("Catcitten")
AUtils.Joker("Seal")
AUtils.Joker("CrowningCeremony")
AUtils.Joker("HideAndSeek")
AUtils.Joker("Bubbles")
AUtils.Joker("GlowingShard")
AUtils.Joker("Djungelskog")
AUtils.Joker("Catcus")
AUtils.Joker("LilGuy")
AUtils.Joker("Aftonsparv")
AUtils.Joker("Friendship")
AUtils.Joker("Blackfisk")
AUtils.Joker("ChainedJoker")

-- Legendaries
AUtils.Joker("Sherba")