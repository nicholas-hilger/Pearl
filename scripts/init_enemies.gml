//drop_rate should be greater than 15 (gold and ammo drop chance is a universal 15%)

//Foyer
add_enemy(enemy.skeleton, "Skeleton", "A spooky skeleton. Don't ask how it can move.", 44, 7, 0, 0, 0, 2 , 0.5, 1, 1.25, 9, item.none, 35, enemy_race.undead, 3, s_skeleton, 1, "skeleton")
add_enemy(enemy.imp, "Imp", "An imp. Attacks with arcane bolts and insults.", 14, 0, 0, 0, 3, 1, 1, 1, 2, 7, item.none, 25, enemy_race.enchanted, 2, s_imp, 2, "imp")
add_enemy(enemy.worm, "Worm", "A mutant worm. Its teeth have teeth...", 8, 3, 0, 2, 0, 1, 0.5, 0.75, 1, 5, item.none, 25, enemy_race.beast, 1, s_worm, 1, "worm")
add_enemy(enemy.lesser_demon, "Lesser Demon", "A low-ranked demon.", 60, 0, 5, 0, 2, 1.3, 1.3, 1.3, 1.6, 12, item.none, 40, enemy_race.demon, 3, s_lesser_demon, 1, "lesser_demon")
add_enemy(enemy.wight_knight, "Wight Knight", "A reanimated, elite Regent Knight.", 250, 10, 0, 3, 0, 1.3, 0.75, 0.9, 1.1, 30, item.skull_talisman, 20, enemy_race.undead, 2, s_wight_knight, 1, "wight_knight") 

//Foyer bosses
add_enemy(enemy.monitor_eye, "Monitor Eye", "An all-seeing, evil eye.", 400, 0, 0, 0, 8, 1.1, 1.35, 0.5, 1.9, 200, item.tome_sense_monster, 30, enemy_race.enchanted, 2, s_monitor_eye, 2, "monitor_eye")
add_enemy(enemy.guard_hound, "Guard Hound", "A vicious, enchanted mongrel.", 500, 5, 2, 4, 0, 1.1, 1.5, 1.0, 0.5, 200, item.rabid_tooth, 30, enemy_race.beast, 1, s_guard_hound, 1, "guard_hound")
add_enemy(enemy.first_knight, "First Knight", "The Tower's first line of defense.", 575, 3, 0, 12, 0, 1.5, 0.5, 1.2, 1, 200, item.tower_plate, 30, enemy_race.undead, 3, s_first_knight, 1, "first_knight")   

//Mines
add_enemy(enemy.rock_golem, "Rock Golem", "Contrary to popular opinion, of average intelligence.", 250, 0, 17, 0, 0, 1.5, 0.5, 1, 0.5, 25, item.boreal_sledge, 20, enemy_race.enchanted, 3, s_rock_golem, 1, "rock_golem")
add_enemy(enemy.cave_spider, "Cave Spider", "Spiders that live in caves. Gross.", 130, 4, 0, 5, 0, 1, 0.25, 0.75, 1, 13, item.none, 20, enemy_race.beast, 2, s_cave_spider, 1, "cave_spider")
add_enemy(enemy.miner, "Miner", "A Boreal citizen, brainwashed and lost.", 160, 9, 0, 4, 0, 1, 1.3, 1.2, 0.5, 15, item.boreal_pickaxe, 20, enemy_race.human, 2, s_miner, 1, "miner")
add_enemy(enemy.mutant_bat, "Mutant Bat", "A bat, mutated by the corrupting crystals of the Mines.", 80, 3, 0, 5, 0, 1, 0.75, 1.5, 1.5, 18, item.none, 16, enemy_race.gothic, 1, s_mutant_bat, 1, "mutant_bat")
add_enemy(enemy.shardling, "Shardling", "A chunk of demonic crystal given life.", 140, 0, 3, 0, 4, 2, 0.5, 0.5, 2, 19, item.none, 16, enemy_race.demon, 1, s_shardling, 1, "shardling")
add_enemy(enemy.demonite, "Demonite", "Corrupted ore that is incubating a Shardling.", 100, 0, 0, 0, 5, 3, 0.5, 0.75, 1.2, 8, item.none, 15, enemy_race.demon, 2, s_demonite, 4, "demonite")

//Mines bosses
add_enemy(enemy.queen_spider, "Queen Spider", "You killed her babies. She's out for blood.", 900, 5, 0, 7, 1, 1.2, 0.5, 1.75, 1, 500, item.none, 15, enemy_race.beast, 2, s_queen_spider, 1, "queen_spider")
add_enemy(enemy.foreman, "The Foreman", "The one-eyed, trigger-happy administrator of the Mines.", 800, 0, 0, 12, 0, 1, 1.5, 0.75, 1, 500, item.none, 15, enemy_race.human, 2, s_foreman, 6, "foreman") 
add_enemy(enemy.crystal_demon, "Crystal Demon", "Condensed evil energy, given crystalline form.", 1050, 0, 6, 0, 8, 2, 0.75, 0.5, 2, 500, item.none, 15, enemy_race.demon, 2, s_crystal_demon, 1, "crystal_demon")

//Graveyard
add_enemy(enemy.wraithbone, "Wraithbone", "A skeleton infused with dark powers.", 200, 0, 4, 0, 3, 2, 0.5, 1.5, 1, 50, item.none, 20, enemy_race.undead, 1, s_wraithbone, 1, "wraithbone")
add_enemy(enemy.spirit, "Spirit", "The adamant soul of someone who died tragically.", 180, 0, 0, 0, 8, 1.5, 1.5, 1, 1, 40, item.none, 19, enemy_race.undead, 2, s_spirit, 5, "spirit")
add_enemy(enemy.revenant, "Revenant", "An undead warrior that retains memories of its life.", 275, 6, 4, 0, 0, 1.25, 0.75, 2, 0.5, 45, item.none, 23, enemy_race.undead, 3, s_revenant, 1, "revenant")
add_enemy(enemy.cultist, "Cultist", "An insane, death-worshipping human.", 250, 4, 5, 0, 0, 1, 0.75, 0.75, 0.5, 45, item.none, 25, enemy_race.human, 2, s_cultist, 1, "cultist")
add_enemy(enemy.corpserat, "Corpserat", "A rat that has been fattened and corrupted on the flesh of the dead.", 150, 3, 0, 2, 1, 1, 0.5, 0.5, 1.5, 40, item.none, 18, enemy_race.beast, 1, s_corpserat, 1, "corpserat")
add_enemy(enemy.demon_knight, "Demon Knight", "Not to be confused with demonic metal.", 300, 4, 6, 0, 2, 1, 1.5, 0.75, 1.5, 40, item.none, 20, enemy_race.demon, 2, s_demon_knight, 1, "demon_knight")
add_enemy(enemy.vampire, "Vampire", "A pale, nocturnal sucker of blood.", 444, 0, 0, 8, 5, 0.75, 2, 0.25, 3, 66, item.vampire_blood, 25, enemy_race.gothic, 2, s_vampire, 1, "vampire")     

//Graveyard Bosses
add_enemy(enemy.reaper, "Reaper", "A high-ranking agent of Death.", 444, 13, 0, 0, 4, 4, 4, 4, 4, 1200, item.grim_scythe, 18, enemy_race.cosmic, 2, s_reaper, 1, "reaper")
add_enemy(enemy.amalgamation, "Amalgamation", "A clobbered-together mess of necrotic flesh and limbs.", 1400, 0, 21, 0, 6, 1.25, 0.75, 1, 1, 1200, item.none, 15, enemy_race.undead, 2, s_amalgamation, 1, "amalgamation")
add_enemy(enemy.necromancer, "Necromancer", "A sorcerer who has gained immortality at the cost of their soul.", 1200, 0, 0, 0, 23, 0.75, 0.75, 0.5, 2, 1200, item.none, 15, enemy_race.human, 2, s_necromancer, 4, "necromancer")

//Barracks
add_enemy(enemy.grunt, "Grunt", "The backbone of the Tower Army.", 550, 7, 6, 0, 0, 1, 0.75, 1, 0.75, 90, item.none, 25, enemy_race.demon, 2, s_grunt, 1, "grunt")
add_enemy(enemy.greater_imp, "Greater Imp", "An imp that has learned more advanced magic and insults.", 350, 0, 0, 0, 13, 1, 1.5, 0.5, 2, 70, item.none, 23, enemy_race.enchanted, 2, s_greater_imp, 3, "greater_imp")
add_enemy(enemy.warbeast, "Warbeast", "A horrifying chimera, crafted for war.", 300, 0, 0, 13, 0, 1, 1, 1, 1.25, 75, item.none, 16, enemy_race.beast, 1, s_warbeast, 1, "warbeast")
add_enemy(enemy.archer, "Archer", "A traitorous human. Their arrows are razor-tipped.", 250, 4, 0, 7, 0, 1, 0.75, 0.75, 1, 70, item.none, 20, enemy_race.human, 2, s_archer, 5, "archer")
add_enemy(enemy.guard_drake, "Guard Drake", "A unique offshot of a dragon, instilled with undying loyalty to its master.", 650, 7, 0, 0, 8, 1.5, 0.75, 0.25, 2, 105, item.none, 23, enemy_race.gothic, 3, s_guard_drake, 1, "guard_drake")
add_enemy(enemy.demon_lord, "Demon Lord", "They miss their winter condo in Hell.", 750, 9, 0, 4, 3, 1.25, 1.25, 1.25, 1.75, 110, item.none, 25, enemy_race.demon, 2, s_demon_lord, 1, "demon_lord")
add_enemy(enemy.monstrosity, "Monstrosity", "An undead, terrifying mash-up of mismatched bodies and armor.", 800, 0, 11, 0, 5, 1.25, 0.5, 1, 1.25, 115, item.none, 20, enemy_race.undead, 3, s_monstrosity, 1, "monstrosity")
add_enemy(enemy.commander, "Commander", "They didn't earn their rank by scrubbing the latrines.", 950, 10, 0, 12, 0, 1.25, 1.5, 2, 2, 150, item.none, 30, enemy_race.cosmic, 2, s_commander, 1, "commander")

//Barracks Bosses
add_enemy(enemy.war, "War", "An aggressive Horseman of the Apocalypse.", 8000, 13, 8, 0, 0, 2, 2, 1.5, 1, 3000, item.none, 17, enemy_race.cosmic, 2, s_war, 1, "war")

//Universal
add_enemy(enemy.thief, "Thief", "A master of cutting purses and throats.", 10, 2, 0, 0, 0, 1, 1, 1, 0.75, 17, item.avarice_shield, 25, enemy_race.human, 1, s_thief, 1, "thief")   
add_enemy(enemy.ripper, "Ripper", "A ferocious lizard demon.", 40, 3, 0, 2, 0, 1.5, 0.75, 0.75, 0.75, 14, item.none, 15, enemy_race.demon, 2, s_ripper, 1, "ripper")
add_enemy(enemy.zombie, "Zombie", "A rotting corpse. Smells disgutsing.", 60, 0, 4, 0, 0, 1.5, 0.5, 1.5, 1, 12, item.none, 15, enemy_race.undead, 3, s_zombie, 1, "zombie")
add_enemy(enemy.shadowhound, "Shadowhound", "A poor puppy, corrupted by dark magic.", 30, 3, 0, 2, 0, 1, 1.25, 0.75, 1.5, 14, item.none, 15, enemy_race.beast, 1, s_shadowhound, 1, "shadowhound")
add_enemy(enemy.thrall, "Thrall", "Some poor, mind-controlled sap.", 45, 0, 4, 0, 0, 0.75, 1.25, 1, 1, 14, item.two_by_four, 30, enemy_race.human, 2, s_thrall, 1, "thrall")
add_enemy(enemy.phantasm, "Phantasm", "A vengeful spirit with access to magic.", 30, 0, 0, 0, 3, 1.5, 1.5, 1.5, 2, 16, item.none, 15, enemy_race.enchanted, 2, s_phantasm, 4, "phantasm") 
add_enemy(enemy.slime, "Slime", "Enchanted, semi-sentient, immobile slime. Will reproduce over time.", 10, 0, 2, 0, 0, 2, 1, 0.75, 0.75, 2, item.jelly, 20, enemy_race.enchanted, 3, s_slime, 1, "slime")
add_enemy(enemy.stain, "Stain", "An inexplicably living shadow.", 50, 0, 0, 0, 10, 1, 1, 1, 2, 28, item.none, 15, enemy_race.cosmic, 2, s_stain, 1, "stain") 

add_enemy(enemy.punching_bag, "Punching Bag", "A straw-being who loves getting hit.", 999999, 0, 0, 0, 0, 1, 1, 1, 1, 0, item.none, 0, enemy_race.enchanted, 0, s_punchingbag, 0, "punching_bag")
