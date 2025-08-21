return {
    descriptions = {
        Back = {
            b_ad_royal = {
                name = "Königliches Deck",
                text = {
                    "{C:attention}#1#{} Handgröße",
                    "Beginne den Durchlauf mit",
                    "nur Karten mit Rang",
                    "{C:attention}10 oder höher"
                }
            },
            b_ad_voucher = {
                name = "Gutschein Deck",
                text = {
                    "Erhalte nach dem Besiegen jedes",
                    "{C:attention}Boss Blinds{}",
                    "einen {C:attention,T:tag_voucher}#1#{}",
                }
            },
            b_ad_big = {
                name = "Dickes Deck",
                text = {
                    "{C:attention}+#1#{} Joker-Slot",
                    "",
                    "Beginne den Durchlauf mit",
                    "zweimal so vielen Zahlenkarte"
                }
            },
            b_ad_sinner = {
                name = "Deck des Sünders",
                text = {
                    "Beginne den Durchlauf mit",
                    "zufälligen {C:attention}Sünden verbesserungen",
                    "auf allen Karten"
                }
            }
        },
        Blind = {},
        Edition = {},
        Enhanced = {
            m_ad_pride = {
                name = 'Stolz Karte',
                text = {"Wird einmal für jede", "Farbe in der wertender", "hand erneut ausgelöst"}
            },
            m_ad_envy = {
                name = 'Neid Karte',
                text = {"{C:green}#1#-zu-#2#{}-Chance einen", "{C:attention}Tod{} zu erstellen wenn",
                        "diese Karte am Ende der Runde in der Hand ist", "{C:inactive}(Muss Platz haben)"}
            },
            m_ad_greed = {
                name = 'Gier Karte',
                text = {"Verliere {C:gold}$#1#{} wenn diese Karte", "in der Hand bleibt", "Wenn gespielt, bringt",
                        "zweimal das verlorere Geld", "{C:inactive}(Momentan {C:gold}$#2#{C:inactive})"}
            },
            m_ad_gluttony = {
                name = 'Völlerei Karte',
                text = {"Erhält dauerhaft", "{C:chips}+#1#{} Chips wenn gezählt"}
            },
            m_ad_lust = {
                name = 'Lust Karte',
                text = {"{C:mult}+#1#{} Mult wenn neben", "zwei gezählten Karten", "mit anderen Rängen"}
            },
            m_ad_wrath = {
                name = 'Zorn Karte',
                text = {"{C:green}#1#-zu-#2#{}-Chance", "{X:mult,C:white}X#3#{} Mult", "zu erhalten",
                        "Wird immer gezählt"}
            },
            m_ad_sloth = {
                name = 'Faule Karte',
                text = {"{C:chips}+#1#{} Chips", "während sich diese Karte", "auf der Hand befindet"}
            }
        },
        Joker = {
            j_ad_alice = {
                name = 'Alice',
                text = {"{C:chips}+#1#{} Chips für jedes", "{C:attention}aufeinanderfolge{} mal das die Poker Hand",
                        "gespielt wurde", "{C:inactive}(Momentan {C:chips}+#2#{C:inactive} Chips mit #3#)"}
            },
            j_ad_aftonsparv = {
                name = 'Aftonsparv Prim',
                text = {"{C:chips}+#2#{} Chips und {C:mult}+#1#{} Mult wenn", "die restlichen {C:blue}Hände{} eine",
                        "{C:attention}prim Zahl sind", "{C:inactive}(2, 3, 5, 7, ...)"}
            },
            j_ad_april = {
                name = 'April',
                text = {"Bringt {C:money}$#2#{} wenn wertende Hand", "eine {C:attention}#1#{} enthält"}
            },
            j_ad_bam = {
                name = 'Bam',
                text = {"Wertende {C:attention}Bonus{} Karten bringen {X:chips,C:white}X#1#{} Chips",
                        "und erhöhen es um {X:chips,C:white}X#2#{}, wird", "nach der Runde zurückgesetzt"}
            },
            j_ad_blackfisk = {
                name = 'Bläckfisk',
                text = {"{C:attention}+#1#{} Handgröße", "Wenn {C:attention}8+{} Karten gehalten werden,",
                        "verdiene {C:money}$#2#{} pro Karte"}
            },
            j_ad_blahaj = {
                name = 'Blåhaj',
                text = {
                    "Dieser Joker erhält {X:mult,C:white}X#2#{} Mult",
                    "wenn eine Karte mit einem {C:blue}Blauen", 
                    "Siegel gewertet wird",
                    "{C:inactive}(Momentan {X:mult,C:white} X#1# {C:inactive} Mult)",
                    "{C:inactive}----------",
                    "{V:1}Beim erhalt, erhalte ein {V:2}Trance",
                    "{C:inactive}(Muss Platz haben)"
                }
            },
            j_ad_bubbles = {
                name = 'Bubbles the Bear',
                text = {"Dieser Joker erhält {C:chips}+#1#{} Chips,", "wenn die gespielte Hand wertende",
                        "{C:hearts}Herzen{} enthält", "{C:inactive}(Momentan {C:chips}+#2#{C:inactive} Chips)"}
            },
            j_ad_catcitten = {
                name = 'Catcitten',
                text = {"Gewertete {C:diamonds}Diamanten{}", "haben eine {C:green}#1#-zu-#2#{}-Chance",
                        "füge dem Deck eine permanente Kopie hinzu", "und ziehe sie auf die {C:attention}Hand"}
            },
            j_ad_catcus = {
                name = 'Catcus',
                text = {"Gewertete {C:attention}#1#s{} bringen", "{C:money}$#2#{} und {X:mult,C:white}X#3#{} Mult"}
            },
            j_ad_chained_joker = {
                name = 'Geketteter Joker',
                text = {"{X:mult,C:white}X#1#{} Mult", "{C:inactive}(Immer Ewig)"}
            },
            j_ad_crowningceremony = {
                name = 'Krönungszeremonie',
                text = {"Während des {C:attention}Boss Blinds{}, wenn Poker Hand ein",
                        "{C:attention}#3#{} ist, verwandle die erste", "wertende Karte zu {C:attention}#1#{}, und zweite",
                        "wertende Karte zu {C:attention}#2#{}"}
            },
            j_ad_cuddles = {
                name = 'Cuddles',
                text = {"Verdoppelt alle {C:attention}aufgelisteten {C:green,E:1,S:1.1}Wahrscheinlichkeiten",
                        "Erfolgreich ausgelösten {C:attention}Glückskarten{}", "bringen {X:mult,C:white}X#1#{} Mult"}
            },
            j_ad_debuff = {
                name = 'Debuff',
                text = {"Debuffs playing cards"}
            },
            j_ad_djungelskog = {
                name = 'Djungelskog',
                text = {"Jede {C:attention}gehaltene Kartte{}", "erhält dauerhaft {C:chips}+#1#{} Chips"}
            },
            j_ad_friendship = {
                name = 'Freundschaft',
                text = {"Dieser Joker erhält {C:mult}+#1#{} Mult, wenn gewertete Hand",
                        "{C:attention}2+{} verschiedene Farben enthält",
                        "{C:inactive}(Momentan {C:mult}+#2#{C:inactive} Mult)"}
            },
            j_ad_glowingshard = {
                name = 'Leuchtene Scherbe',
                text = {"Alle wertenden {C:attention}#1#s{} werden {C:attention}Glass", "Karten when gespielt, Rang",
                        "verändert sich jede Runde"}
            },
            j_ad_hideandseek = {
                name = 'Versteckspiel',
                text = {"{C:green}#1#-zu-#2#{}-Chance Karten", "verdeckt zu ziehen,",
                        "{C:attention}verdeckte, {C:attention}gehaltene", "Karten werden {C:attention}#3#{} mal erneut ausgelöst"}
            },
            j_ad_imagination = {
                name = 'Fantasie',
                text = {"Gewertete {C:attention}#1#s{} haben eine {C:green}#2#-zu-#3#{}-Chance",
                        "{C:dark_edition}Foil{}, {C:dark_edition}Holografisch{},",
                        "oder {C:dark_edition}Polychrom{} zu werden, rang", "verändert sich jede Runde"}
            },
            j_ad_lilguy = {
                name = 'Lil Guy',
                text = {"Während {C:attention}erster Hand der Runde{},", "gespielte {C:attention}#1#s{} werden {C:attention}#2#{} mal erneut ausgelöst"}
            },
            j_ad_may = {
                name = 'May',
                text = {"Gehaltene {C:attention}#1#s{}", "geben {C:chips}+#2#{} Chips und {C:mult}+#3#{} Mult"}
            },
            j_ad_nina = {
                name = 'Nina',
                text = {"Gespielte {C:attention}Stone{} Karten", "haben eine {C:green}#1#-zu-#2#{}-Chance",
                        "zerstört zu werden und {C:money}$#3# zu bringen"}
            },
            j_ad_sam = {
                name = 'Sam',
                text = {"{X:chips,C:white}X#1#{} Chips wenn die gespielte Hand",
                        "eine {C:attention}#2#{} und {C:attention}Flush enthält"}
            },
            j_ad_seal = {
                name = 'Seal',
                text = {"Wenn die erste Hand der Runde", "{C:attention}#1#{} ist, gib der ersten wertenden",
                        "Karte ein zufälliges {C:attention}Siegel{},", "Poker Hand ändert sich", "am Ende der Runde"}
            },
            j_ad_sherba = {
                name = 'Sherba',
                text = {"Während der {C:attention}ersten Hand der Runde{},", "löse jede gespielte Karte ernaut aus, {C:attention}für",
                        "{C:attention}jede verbleibende Hand"}
            },
            j_ad_spare_skirt = {
                name = 'Ersatzrock',
                text = {"Dieser Joker erhält {C:mult}+#1#{} Mult,", "wenn die gespielte Hand", "{C:attention}#3#{} enthält",
                        "{C:inactive}(Momentan {C:mult}+#2#{C:inactive} Mult)"}
            },
            j_ad_spot = {
                name = 'Spot',
                text = {"{X:mult,C:white}X#1#", "Verdoppelt sich jede {C:blue}Hand{},", "wird nach der Runde zurückgesetzt"}
            },
            j_ad_chirp = {
                name = 'Chirp',
                text = {"Gehaltene {C:attention}#1#n{}", "bringen {C:chips}+#2#{} Chips"}
            },
            j_ad_boozle = {
                name = "Boozle",
                text = {"{C:spades}Pik{} Karten haben eine", "{C:green}#1#-zu-#2#{}-Chance {C:attention}#3#{} mal",
                        "erneut ausgelöst zu werden"}
            },
            j_ad_snuggle_buddies = {
                name = "Kuschelbuddies",
                text = {"Gewertete {C:hearts}Herzen{} haben", "eine {C:green}#1#-zu-#2#{}-Chance um",
                        "zerstört zu werden und ein {C:blue}Deja Vu{} zu erzeugen", "{C:inactive}(Muss Platz haben)"}
            },
            j_ad_april_and_may = {
                name = "April und May",
                text = {"Gewertete {C:clubs}Kreuz{} Karten", "haben eine {C:green}#1#-zu-#2#{}-Chance um",
                        "{C:attention}Mult{} Karten zu werden", "Gewertete {C:attention}Mult{} Karten bringen",
                        "{X:mult,C:white}X#3#{} Mult"}
            },
            j_ad_elsta = {
                name = "Elsta",
                text = {"Löse alle {C:attention}gehaltenen", "Karten erneut aus, für jede {C:attention}Stahl-Karte{}",
                        "die diese Runde gespielt wurde", "{C:inactive}(Momentan #1#)"}
            },
            j_ad_shady_box = {
                name = "Box der Erinnerungen",
                text = {"Wenn du mindestens {C:attention}4", "andere Joker hast, verkaufe diese Karte", "und zerstöre alle anderen Joker, um",
                        "einen zufälligen legendären Joker zu erzeugen"}
            },
            j_ad_scale = {
                name = "Wage",
                text = {"{X:mult,C:white}X#1#{} Mult wenn verbleibende", "{C:blue}Hände{} und verbleibende {C:red}Abwürfe",
                        "gleich sind"}
            },
            j_ad_octavia = {
                name = "Octavia",
                text = {"Gleiche {C:chips}Chips{} und {C:mult}Mult{} an, wenn", "verbleibende {C:blue}Hände{} und verbleibende {C:red}Abwürfe",
                        "gleich sind"}
            },
            j_ad_patch = {
                name = "Patch",
                text = {
                    "Verbessere level der ersten",
                    "{C:attention}poker hand{} der Runde",
                    "Verdoppelt wenn die Hand nicht gewonnen hat"
                }
            },
            j_ad_kiki = {
                name = "Kiki",
                text = {
                    "Dieser Joker erhält {C:chips}+#2#{} Chips wenn {C:money}Geld{}",
                    "verdient wird, wird nach der Runde zurückgesetzt",
                    "{C:inactive}(Momentan {C:chips}+#1#{C:inactive} Chips)",
                    "{C:inactive}----------",
                    "{V:1}Beim erhalt, erhalte ein {V:2}Talisman",
                    "{C:inactive}(Muss Platz haben)"
                }
            },
            j_ad_dysphoria_hoodie = {
                name = "Dysphorie Hoodie",
                text = {
                    "Wenn Blind ausgewählt wird,",
                    "reduziere die benötigten Chips",
                    "um {C:attention}#1#%{}, plus {C:attention}#2#%",
                    "wenn ein Blind besiegt wird"
                }
            },
            j_ad_puppo = {
                name = "Puppo",
                text = {
                    "Ziehe {C:attention}#1#{} Karten, wenn",
                    "ein Blind ausgewählt wird. Während",
                    "des {C:attention}Boss Blind{} verdoppelt"
                }
            },
            j_ad_roommates = {
                name = "Zweck WG",
                text = {
                    "Wenn Hand mindestens zwei",
                    "{C:attention}Stolz{} Karten enthält,",
                    "bringen sie {C:gold}+$#1#{}, {X:mult,C:white}X#2#{} Mult, and {C:chips}+#3#{} Chips",
                    "wenn gezählt"
                }
            },
            j_ad_obsidian = {
                name = "Obsidian Joker",
                text = {
                    "Gespielte {C:attention}Stone{} Karten",
                    "werden {C:dark_edition}Negativ"
                }
            },
            j_ad_witch_hat = {
                name = "Hexenhut",
                text = {
                    "{C:tarot}Tarot Karten{} können {C:attention}eine",
                    "{C:legendary}weitere Karte auswählen"
                }
            },
            j_ad_break_glass = {
                name = "Break Glass in case of emergency",
                text = {
                    "Wenn eine Glas Karte zerstört wird,",
                    "verwandel eine zufällige Karte in Hand",
                    "zu Glas"
                }
            },
            j_ad_joyride = {
                name = "Jetpack Joyride",
                text = {
                    "Wenn die gespielte Hand",
                    "nur eine Karte hat",
                    "erhöhe ihren Rang um {C:attention}#1#"
                }
            }
        },
        Other = {
            ad_credit = {
                name = "Credit",
                text = {"{V:1}#1#: {V:2}#2#"}
            },
            ad_gray_seal = {
                name = "Graues Siegel",
                text = {
                    "{X:mult,C:white}X#1#{} Mult wenn",
                    "gezählt oder in der Hand gehalten"
                }
            }
        },
        Planet = {
            c_ad_asteroid_belt = {
                name = "Asteroiden Gürtel",
                text = {
                    "{S:0.8}({S:0.8,V:1}Lvl.#1#{S:0.8}){} Aufwertung für",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult und",
                    "{C:chips}+#4#{} Chips",
                },
            },
            c_ad_rhea = {
                name = "Rhea",
                text = {
                    "{S:0.8}({S:0.8,V:1}Lvl.#1#{S:0.8}){} Aufwertung für",
                    "{C:attention}Sünden Hände",
                    "{C:mult}+#3#{} Mult und",
                    "{C:chips}+#4#{} Chips",
                },
            },
        },
        Spectral = {
            c_ad_sin = {
                name = "Sin",
                text = {"Verbessere {C:attention}#1#", "ausgewählte Karten zu", "zufälligen {C:attention}Sünden verbesserungen{}"}
            },
            c_ad_chance = {
                name = "Chance",
                text = {
                    "Verdoppelt alle {C:attention}aufgelisteten",
                    "{C:green,E:1,S:1.1}Wahrscheinlichkeiten",
                    "Verliere {C:gold}$#1#",
                    "{C:inactive}(bsp: {C:green}2-zu-4{C:inactive} -> {C:green}4-zu-4{C:inactive})",
                    "{C:inactive}(Aktuell {C:green}#2#-zu-X{C:inactive})"
                }
            },
        },
        Stake = {},
        Tag = {
            tag_ad_copy = {
                name = "Kopier-Tag",
                text = {
                    "Erstelle eine Kopie eines",
                    "zufälligen {C:attention}Joker",
                    "Setzt das {C:money}Geld{} auf {C:money}$0",
                    "{C:inactive}(Muss Platz haben)"
                }
            },
            tag_ad_cracked_mirror = {
                name = "Gebrochener Spigel-Tag",
                text = {
                    "Erstelle eine Kopie des",
                    "{C:attention}Joker{} ganz links",
                    "Erhalte permanent {X:mult,C:white}X0.5{} Mult",
                    "auf gespielte Hände",
                    "{C:inactive}(Muss Platz haben)"
                }
            },
            tag_ad_balance = {
                name = "Balance-Tag",
                text = {
                    "Während der nächsten Runde, gleiche",
                    "{C:chips}Chips{} und {C:mult}Mult{} an",
                    "bei der Berechnung von",
                    "gespielten Händen"
                }
            },
            tag_ad_defiance = {
                name = "Trotz-Tag",
                text = {
                    "Verhindere ein {C:attention}Game Over",
                    "einmal"
                }
            },
        },
        Tarot = {},
        Voucher = {
            v_ad_long_kitty = {
                name = "Long Kitty",
                text = {
                    "{X:mult,C:white}X#1#{} für jeden leeren",
                    "Joker slot",
                    "{C:inactive}(Momentan {X:mult,C:white}X#2#{})"
                }
            },
            v_ad_long_cat = {
                name = "Long Cat",
                text = {
                    "{X:mult,C:white}X#1#{} für jeden",
                    "eingnelösten Voucher",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{})"
                }
            }
        }
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {},
        collabs = {},
        dictionary = {
            ad_planet_moon = "Mond",
            ad_planet_not_planet = "Kein Planet",
            ad_sin_hands = "Sünden Hände",
            ad_covered = "Angezogen!",
            ad_obsidian = "Obsidian!",
            ad_envy = "Neid",
            ad_trans = "Trans!",
            ad_mult = "Mult!",
            ad_crowned = "Gekrönt!",
            ad_crystallised = "Kristalisiert!",
            ad_hatched = "Geschlüpft",
            ad_opened = "Geöffnet!",
            ad_deja_vu = "Déjà-vu",
            ad_doubled = "Verdoppelt!",
            ad_defied = "Tod getrotzt",
            ad_joyride = "Boosted"
        },
        high_scores = {},
        labels = {
            ad_gray_seal = "Graues Siegel"
        },
        poker_hand_descriptions = {
            ad_wrath = {
                "Fünf Zorn Karten"
            },
            ad_gluttony = {
                "Fünf Völlerei Karten"
            },
            ad_envy = {
                "Fünf Neid Karten"
            },
            ad_greed = {
                "Fünf Gier Karten"
            },
            ad_sloth = {
                "Fünf Faule Karten"
            },
            ad_pride = {
                "Fünf Stolz Karten"
            },
            ad_lust = {
                "Fünf Lust Karten"
            },
            ad_rockandroll = {
                "Fünf Stein Karten"
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
            ad_cracked = "Gesplittert! X#1#"
        },
        v_text = {}
    }
}
