add_topic(topic.stats, "Stats", "Your character is controlled by four main stats:
-Dexterity (Dex): Used when Cut is your weapon's primary damage type. Also influences dodge chance. 
-Perception (Per): Used when Pierce is your weapon's primary damage type. Also influences your field-of-view.
-Strength (Str): Used when Blunt is your weapon's primary damage type. Also influences your inventory size.
-Wisdom (Wis): Used when casting spells, or if your weapon is enchanted and magic is its primary damage type. Also influences experience points gained.
#Beyond those four stats are:
-Hit Points (HP): Your hit points. When these hit zero, you die. Restored via magic, eating, or resting.
-Energy (EN): Your energy. Will slowly drain over time. If it stays at zero for too long, you will begin starving to death. Also used to cast spells. Restored via eating.
#Other misc. stats:
-Essence: Used by the Slayer to call upon their unique powers. Gained by damaging demonic enemies, which is amplified by using a Slayer weapon. Doesn't drain outside of combat.
-Rage: Used by the Berserker. Builds with damage taken. When it reaches 100%, you will deal double damage for a while. Slowly drains outside of combat.")

add_topic(topic.wielding_weapons, "Weapon Scaling", "You can theoretically wield any weapon you find at any time. However, if your stats are too low, you will 'Fumble' witht he weapon, dealing drastically reduced damage.
#To wield a weapon effectively, you will want to match the weapon's primary stat with your own stat.
#
#EXAMPLE: The Warhammer does 22 Blunt damage. Blunt scales with Strength. Thus, to use the Warhammer without fear of fumbling, you would want to have at least 22 Strength.
#
#If a weapon does multiple types of damage, you only need to worry about scaling with the highest stat.
#
#EXAMPLE: The Zweihander is enchanted, and thus deals 14 Cut, 4 Blunt, and 3 Magic damage on hit. You would want 14 Dexterity to match the Zewihander's 14 Cut to wield it without fumbling.")

add_topic(topic.damage_types, "Damage Types", "The four damage types present are Cut, Pierce, Blunt, and Magic.
#
#-Cut: Scales with Dex. Good against fleshy targets.
#-Pierce: Scales with Per. Good against targets with small, but heightened weak spots.
#-Blunt: Scales with Str. Good agaisnt armored or hardened enemies.
#-Magic: Scales with Wis. Used to augment spell casting. Will only be applied as a damage type in melee combat if the weapon is enchanted.")

add_topic(topic.tower, "The Tower", "There are 25 floors to the Tower. Staircases will take you up, but the only way out is by using the Town Teleport spell, using a portal at the beginning of an area, or dying. Floors are discovered as you traverse them, and enemies will occasionally spawn in if you dawdle.
#The 25 floors of the Tower are split into 5 'Areas', which influence enemy spawns, item drops, and difficulty:
#-The Foyer: The entry halls of the Tower. Home to some of the weakest fiends in existence, making it a perfect way to cut your teeth on traversing the Tower.
#-The Mines: An apparently hand-created system of mines, growing demonic crystals and hellish ore. The enemies here hit harder, and aren't afraid to swarm you.
#-The Graveyard: An area whose soil has been stained black with the blood of the dead. Expect to meet many undead monstrosities here.
#-The Barracks: Even violent fiends need a place to recoup. Unfortunately, you'll have to cut through their R&R to get to the top of the Tower. Be prepared for ferocious resistance.
#-The Final Area: You'll have to see for yourself.")

add_topic(topic.tiers, "Tiers", "All items are valued on a tier system. Food has its own tier (Brown), as do spell tomes (Fuchsia). Beyond that, the progression of tiers (lowest to highest) is:
#-Gray (Waste)#-White (Mundane)#-Green (Specialty)#-Blue (Enhanced)#-Light Blue (Grand)#-Beige (Angellic) and Maroon (Demonic)#-Pink (Radiant)
#Higher-tier equipment will be more likely to have special effects when used, and will also indicate said equipment's general power or usefulness.")

add_topic(topic.food, "Food", "Food is an essential part of your fight through the Tower. It will heal you, keep you from starving, and if noted, will even increase certain stats. It's important to note that eating applies the health or energy gained from the food as a buff, restored at a rate of one point per turn.")

add_topic(topic.status_effects, "Status Effects", "Various buffs and debuffs that can empower or cripple your character. Status effects and their time left will be shown on the left side of the screen, and the character sheet will list more information on them.")

add_topic(topic.enemy_races, "Enemy Races", "Different foes have different races. Some weapons will do more damage to certain enemy races, when noted. You can glean an enemy's race through inference for now because I don't have a bestiary or anything implemented right now.")

add_topic(topic.merchants, "Merchants", "Merchants will sell you goods, while also buying your vendor trash. They are knowledgeable enough to buy low and sell high, so an item's worth in your inventory is the midpoint between its selling and buying prices. Their stock is pulled from defined item pools (except for the Random Merchant), and will update and refill at 00:00 every day.")

add_topic(topic.warp_zone, "Warp Zone", "A portal that will allow you to warp to the beginning of every area after the first. This useful portal will only appear after you have made it to floor 6.") 

add_topic(topic.pools, "Pools", "Not the kind you swim in. Sorry if you got your hopes up.
#Much of the game uses a system of pools to determine what is spawned in, dropped, or otherwise created. The two major sets of pools are:
#Enemy pools: Each area of the game has its own pool of enemies that will spawn there. There's also a pool of enemies who can spawn, regardless of floor. These enemies will scale their stats with your progress through the Tower.
#Item pools: These dictate what items will be dropped, based on their relative value and power. These do not necessarily follow the flow of areas, so you may still end up finding a shiv on the corpse of an end-game foe. However, the odds of getting more powerful items go up in the later areas. There are also pools for each item type, generally used for that item type's merchant.")

add_topic(topic.perks, "Perks", "Perks are unique modifiers that can empower your character, or entice them into committing to a new playstyle.
#You will gain one perk per 5 levels, starting at level 5. You will, generally, be offered a choice of three perks, from which you need to choose one.
#Some perks will override others. In this case, the perk you take last will replace the older perk. 
#You can also gain a random perk by drinking Perky Pop, although you won't have a chance to choose that one.
#A list of your perks can be found on your [C]haracter Sheet.")
