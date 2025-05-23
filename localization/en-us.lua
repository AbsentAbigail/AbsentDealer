return {
    descriptions = {
        Back = {},
        Blind = {},
        Edition = {},
        Enhanced = {},
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
                text = {"If scoring hand", "contains a {C:attention}#1#{} earn {C:money}$#2#",
                        "{C:inactive}(Art: Megamarine)"}
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
                text = {"On pickup, gain a {C:blue}Trance", "This Joker gains {X:mult,C:white}X#2#{} Mult",
                        "every time a card with a", "{C:blue}Blue Seal{} is scored",
                        "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"}
            },
            j_ad_bubbles = {
                name = 'Bubbles the Bear',
                text = {"This joker gains {C:chips}+#1#{} Chips,", "if played hand contains scoring",
                        "{C:hearts}Hearts", "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"}
            },
            j_ad_catcitten = {
                name = 'Catcitten',
                text = {"Played cards with {C:diamonds}Diamond{}", "suit have a {C:green}#1# in #2#{} chance to",
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
                text = {"{C:attention}#1#s{} held in hand each", "give {C:chips}+#2#{} Chips and {C:mult}+#3#{} Mult",
                        "{C:inactive}(Art: Megamarine)"}
            },
            j_ad_nina = {
                name = 'Nina',
                text = {"Played {C:attention}Stone{} cards", "have a {C:green}#1# in #2#{} chance",
                        "to break and earn {C:money}$#3#", "{C:inactive}(Art: Megamarine)"}
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
            }
        },
        Other = {},
        Planet = {},
        Spectral = {},
        Stake = {},
        Tag = {},
        Tarot = {},
        Voucher = {}
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {},
        collabs = {},
        dictionary = {},
        high_scores = {},
        labels = {},
        poker_hand_descriptions = {},
        poker_hands = {},
        quips = {},
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {},
        v_text = {}
    }
}
