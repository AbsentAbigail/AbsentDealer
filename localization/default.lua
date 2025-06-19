return {
    descriptions = {
        Back = {
            b_ad_royal = {
                name = "Royal Deck",
                text = {
                    "{C:attention}#1#{} hand size",
                    "Start run with only",
                    "cards ranked",
                    "{C:attention}10 or higher"
                }
            },
            b_ad_voucher = {
                name = "Voucher Deck",
                text = {
                    "After defeating each",
                    "{C:attention}Boss Blind{}, gain a",
                    "{C:attention,T:tag_voucher}#1#",
                }
            },
            b_ad_big = {
                name = "Big Deck",
                text = {
                    "{C:attention}+#1#{} Joker slot",
                    "",
                    "Start run with double",
                    "numbered cards"
                }
            },
            b_ad_sinner = {
                name = "Sinner's Deck",
                text = {
                    "Start run with all cards",
                    "having random sin enhancements"
                }
            }
        },
        Blind = {},
        Edition = {},
        Enhanced = {
            m_ad_pride = {
                name = 'Prideful Card',
                text = {"Retrigger once for each", "unique suit in scoring", "hand"}
            },
            m_ad_envy = {
                name = 'Envious Card',
                text = {"{C:green}#1# in #2#{} chance to create", "a {C:attention}Death{} if this card is held",
                        "in hand at end of round", "{C:inactive}(Must have room)"}
            },
            m_ad_greed = {
                name = 'Greedy Card',
                text = {"Lose {C:gold}$#1#{} while this", "card stays in hand", "When played, earn two times",
                        "the money drained this round", "{C:inactive}(Currently {C:gold}$#2#{C:inactive})"}
            },
            m_ad_gluttony = {
                name = 'Gluttonous Card',
                text = {"Permanently gains", "{C:chips}+#1#{} Chips when scored"}
            },
            m_ad_lust = {
                name = 'Lusty Card',
                text = {"{C:mult}+#1#{} Mult when next", "to two scoring cards", "of a different rank"}
            },
            m_ad_wrath = {
                name = 'Wrathful Card',
                text = {"{C:green}#1# in #2#{} chance to", "give {X:mult,C:white}X#3#{} Mult", "when scored",
                        "Always scores when played"}
            },
            m_ad_sloth = {
                name = 'Slothful Card',
                text = {"{C:chips}+#1#{} Chips", "while this card", "stays in hand"}
            }
        },
        Joker = {
            j_ad_alice = {
                name = 'Alice',
                text = {"Gives {C:chips}+#1#{} Chips for each", "{C:attention}consecutive{} time poker hand",
                        "has been played", "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips on #3#)"}
            },
            j_ad_aftonsparv = {
                name = 'Aftonsparv Prime',
                text = {"{C:chips}+#2#{} Chips and {C:mult}+#1#{} Mult if", "number of remaining {C:blue}hands{} is",
                        "a {C:attention}prime number", "{C:inactive}(2, 3, 5, 7, ...)"}
            },
            j_ad_april = {
                name = 'April',
                text = {"If scoring hand", "contains a {C:attention}#1#{} earn {C:money}$#2#"}
            },
            j_ad_bam = {
                name = 'Bam',
                text = {"Scored {C:attention}Bonus{} cards give {X:chips,C:white}X#1#{} Chips",
                        "and increase this by {X:chips,C:white}X#2#{}, resets", "at the end of round"}
            },
            j_ad_blackfisk = {
                name = 'Bläckfisk',
                text = {"{C:attention}+#1#{} hand size", "When holding {C:attention}8+{} cards in hand,",
                        "earn {C:money}$#2#{} for each"}
            },
            j_ad_blahaj = {
                name = 'Blåhaj',
                text = {
                    "This Joker gains {X:mult,C:white}X#2#{} Mult",
                    "every time a card with a", 
                    "{C:blue}Blue Seal{} is scored",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
                    "{C:inactive}----------",
                    "{V:1}On pickup, gain a {V:2}Trance",
                    "{C:inactive}(Must have room)"
                }
            },
            j_ad_bubbles = {
                name = 'Bubbles the Bear',
                text = {"This joker gains {C:chips}+#1#{} Chips,", "if played hand contains scoring",
                        "{C:hearts}Hearts", "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"}
            },
            j_ad_catcitten = {
                name = 'Catcitten',
                text = {"Scored cards with {C:diamonds}Diamond{}", "suit have a {C:green}#1# in #2#{} chance to",
                        "add a permanent copy to deck", "and draw it to {C:attention}hand"}
            },
            j_ad_catcus = {
                name = 'Catcus',
                text = {"Played {C:attention}#1#s{} give {C:money}$#2#{} and", "{X:mult,C:white}X#3#{} Mult when scored"}
            },
            j_ad_chained_joker = {
                name = 'Chained Joker',
                text = {"{X:mult,C:white}X#1#{} Mult", "{C:inactive}(Always eternal)"}
            },
            j_ad_crowningceremony = {
                name = 'Crowning Ceremony',
                text = {"During {C:attention}Boss Blind{}, if played hand",
                        "is a {C:attention}#3#{}, convert first scoring", "card into a {C:attention}#1#{}, and second",
                        "scoring card into a {C:attention}#2#{}"}
            },
            j_ad_cuddles = {
                name = 'Cuddles',
                text = {"Doubles all {C:attention}listed {C:green,E:1,S:1.1}probabilities",
                        "Successful {C:attention}Lucky{} card", "triggers also give {X:mult,C:white}X#1#{} Mult"}
            },
            j_ad_debuff = {
                name = 'Debuff',
                text = {"Debuffs playing cards"}
            },
            j_ad_djungelskog = {
                name = 'Djungelskog',
                text = {"Each card {C:attention}held in hand{}", "permanently gains {C:chips}+#1#{} Chips"}
            },
            j_ad_friendship = {
                name = 'Friendship',
                text = {"This joker gains {C:mult}+#1#{} Mult, if scoring",
                        "hand contains {C:attention}2+{} unique suits",
                        "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"}
            },
            j_ad_glowingshard = {
                name = 'Glowing Shard',
                text = {"All scoring {C:attention}#1#s{} become {C:attention}Glass", "cards when played, rank",
                        "changes every round"}
            },
            j_ad_hideandseek = {
                name = 'Hide and Seek',
                text = {"{C:green}#1# in #2#{} chance to", "draw cards face down,",
                        "{C:attention}face down cards held in", "{C:attention}hand{} retrigger {C:attention}#3#{} times"}
            },
            j_ad_imagination = {
                name = 'Imagination',
                text = {"Scored {C:attention}#1#s{} have a {C:green}#2# in #3#{} chance",
                        "to gain {C:dark_edition}Foil{}, {C:dark_edition}Holographic{},",
                        "or {C:dark_edition}Polychrome{} effect, rank", "changes every round"}
            },
            j_ad_lilguy = {
                name = 'Lil Guy',
                text = {"During {C:attention}first hand of round{},", "retrigger played {C:attention}#1#s #2#{} times"}
            },
            j_ad_may = {
                name = 'May',
                text = {"{C:attention}#1#s{} held in hand each", "give {C:chips}+#2#{} Chips and {C:mult}+#3#{} Mult"}
            },
            j_ad_nina = {
                name = 'Nina',
                text = {"Played {C:attention}Stone{} cards", "have a {C:green}#1# in #2#{} chance",
                        "to break and earn {C:money}$#3#"}
            },
            j_ad_sam = {
                name = 'Sam',
                text = {"{X:chips,C:white}X#1#{} Chips if poker hand",
                        "contains a {C:attention}#2#{} and a {C:attention}Flush"}
            },
            j_ad_seal = {
                name = 'Seal',
                text = {"If first hand of round is", "a {C:attention}#1#{}, add a random",
                        "{C:attention}seal{} to the first scoring", "card, poker hand changes", "a end of round"}
            },
            j_ad_sherba = {
                name = 'Sherba',
                text = {"During {C:attention}first hand of round{},", "retrigger all played cards {C:attention}once",
                        "{C:attention}for each remaining hand"}
            },
            j_ad_spare_skirt = {
                name = 'Spare Skirt',
                text = {"This joker gains {C:mult}+#1#{} Mult if played", "hand contains a {C:attention}#3#",
                        "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"}
            },
            j_ad_spot = {
                name = 'Spot',
                text = {"{X:mult,C:white}X#1#", "Doubles after each {C:blue}hand{},", "resets at end of round"}
            },
            j_ad_chirp = {
                name = 'Chirp',
                text = {"{C:attention}#1#s{} held in hand", "give {C:chips}+#2#{} Chips"}
            },
            j_ad_boozle = {
                name = "Boozle",
                text = {"Cards with {C:spades}Spade{} suit", "have a {C:green}#1# in #2#{} chance to",
                        "retrigger {C:attention}#3#{} times"}
            },
            j_ad_snuggle_buddies = {
                name = "Snuggle Buddies",
                text = {"Scoring cards with {C:hearts}Heart{} suit", "have a {C:green}#1# in #2#{} chance to",
                        "be destroyed and create a {C:blue}Deja Vu", "{C:inactive}(Must have room)"}
            },
            j_ad_april_and_may = {
                name = "April and May",
                text = {"Scoring cards with {C:clubs}Club{} suit", "have a {C:green}#1# in #2#{} chance to",
                        "become {C:attention}Mult{} cards", "Scored {C:attention}Mult{} cards give",
                        "{X:mult,C:white}X#3#{} Mult"}
            },
            j_ad_elsta = {
                name = "Elsta",
                text = {"Retrigger all card {C:attention}held in hand", "abilities once for each {C:attention}Steel{}",
                        "card played this round", "{C:inactive}(Currently #1#)"}
            },
            j_ad_shady_box = {
                name = "Box of Memories",
                text = {"If you have at least {C:attention}4", "other jokers, sell this", "card to destroy them and",
                        "create a random legendary joker"}
            },
            j_ad_scale = {
                name = "Scale",
                text = {"{X:mult,C:white}X#1#{} Mult if remaining", "{C:blue}hands{} are equal to",
                        "remaining {C:red}discards"}
            },
            j_ad_octavia = {
                name = "Octavia",
                text = {"Balance {C:chips}Chips{} and {C:mult}Mult{} if", "remaining {C:blue}hands{} are equal",
                        "to remaining {C:red}discards"}
            },
            j_ad_patch = {
                name = "Patch",
                text = {"If first played {C:attention}poker hand{}", "doesn't beat Blind, upgrade", "its level"}
            },
            j_ad_kiki = {
                name = "Kiki",
                text = {
                    "This joker gains {C:chips}+#2#{} Chips when {C:money}money{}",
                    "is earned, resets at end of round",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                    "{C:inactive}----------",
                    "{V:1}On pickup, gain a {V:2}Talisman",
                    "{C:inactive}(Must have room)"
                }
            },
            j_ad_dysphoria_hoodie = {
                name = "Dysphoria Hoodie",
                text = {
                    "When blind is selected",
                    "reduce scoring requirement",
                    "by {C:attention}#1#%{}, plus {C:attention}#2#%",
                    "when blind is defeated"
                }
            },
            j_ad_puppo = {
                name = "Puppo",
                text = {
                    "When blind is selected",
                    "draw {C:attention}#1#{} cards, doubled",
                    "during {C:attention}Boss Blind"
                }
            },
            j_ad_roommates = {
                name = "Roommates",
                text = {
                    "If played hand contains",
                    "at least two {C:attention}Prideful{} cards,",
                    "they give {C:gold}+$#1#{}, {X:mult,C:white}X#2#{} Mult, and {C:chips}+#3#{} Chips",
                    "when scored"
                }
            },
            j_ad_obsidian = {
                name = "Obsidian Joker",
                text = {
                    "Played {C:attention}Stone{} cards",
                    "become {C:dark_edition}Negative"
                }
            },
            j_ad_witch_hat = {
                name = "Witches Hat",
                text = {
                    "{C:tarot}Tarot Cards{} can",
                    "{C:legendary}select {C:attention}one",
                    "{C:legendary}additional card"
                }
            },
        },
        Other = {
            ad_credit = {
                name = "Credit",
                text = {"{V:1}#1#: {V:2}#2#"}
            },
            ad_gray_seal = {
                name = "Gray Seal",
                text = {
                    "{X:mult,C:white}X#1#{} Mult when",
                    "scored or held in hand"
                }
            }
        },
        Planet = {
            c_ad_asteroid_belt = {
                name = "Asteroid Belt",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_ad_rhea = {
                name = "Rhea",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}Sin hands",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
        },
        Spectral = {
            c_ad_sin = {
                name = "Sin",
                text = {"Enhances {C:attention}#1#", "selected cards to", "random {C:attention}Sin enhancements{}"}
            },
            c_ad_chance = {
                name = "Chance",
                text = {
                    "Double all {C:attention}listed",
                    "{C:green,E:1,S:1.1}probabilities",
                    "Lose {C:gold}$#1#",
                    "{C:inactive}(ex: {C:green}2 in 4{C:inactive} -> {C:green}4 in 4{C:inactive})",
                    "{C:inactive}(Currently {C:green}#2# in X{C:inactive})"
                }
            },
        },
        Stake = {},
        Tag = {
            tag_ad_copy = {
                name = "Copy Tag",
                text = {
                    "Create a copy of a",
                    "random {C:attention}Joker",
                    "Set {C:money}money{} to {C:money}$0",
                    "{C:inactive}(Must have room)"
                }
            },
            tag_ad_cracked_mirror = {
                name = "Cracked Mirror Tag",
                text = {
                    "Create a copy of leftmost",
                    "{C:attention}Joker",
                    "Permanently gain a {X:mult,C:white}X0.5{} Mult",
                    "scoring penalty",
                    "{C:inactive}(Must have room)"
                }
            },
            tag_ad_balance = {
                name = "Balance Tag",
                text = {
                    "During next round, balance",
                    "{C:chips}Chips{} and {C:mult}Mult{} when",
                    "calculating score for",
                    "played hand"
                }
            },
            tag_ad_defiance = {
                name = "Defiance Tag",
                text = {
                    "Prevent {C:attention}game over",
                    "one time"
                }
            },
        },
        Tarot = {},
        Voucher = {}
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {},
        collabs = {},
        dictionary = {
            ad_planet_moon = "Moon",
            ad_planet_not_planet = "Not a planet",
            ad_sin_hands = "Sin Hands",
            ad_covered = "Covered up!",
            ad_obsidian = "Obsidian!",
            ad_envy = "Envy",
            ad_trans = "Trans!",
            ad_mult = "Mult!",
            ad_crowned = "Crowned!",
            ad_crystallised = "Crystallised!",
            ad_hatched = "Hatched",
            ad_opened = "Opened!",
            ad_deja_vu = "Déjà-vu",
            ad_doubled = "Doubled!",
            ad_defied = "Death defied",
        },
        high_scores = {},
        labels = {
            ad_gray_seal = "Gray Seal"
        },
        poker_hand_descriptions = {
            ad_wrath = {
                "Five wrath cards"
            },
            ad_gluttony = {
                "Five gluttony cards"
            },
            ad_envy = {
                "Five envy cards"
            },
            ad_greed = {
                "Five greed cards"
            },
            ad_sloth = {
                "Five sloth cards"
            },
            ad_pride = {
                "Five pride cards"
            },
            ad_lust = {
                "Five lust cards"
            },
            ad_rockandroll = {
                "Five stone cards"
            }
        },
        poker_hands = {
            ad_wrath = "Angy",
            ad_envy = "Jelly",
            ad_gluttony = "Yummy",
            ad_greed = "Munny",
            ad_lust = "Needy",
            ad_pride = "Gay",
            ad_sloth = "Eepy",
            ad_rockandroll = "Rock and Roll",
        },
        quips = {},
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {
            ad_cracked = "Cracks! X#1#"
        },
        v_text = {}
    }
}
