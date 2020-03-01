///attack(attacker, defender)

randomize()

attacker = argument0
defender = argument1

cut = attacker.cut
blunt = attacker.blunt
pierce = attacker.pierce
magic = attacker.magic

if(attacker = player)
{   
    if(list_contains(player.perks_gained, perk.swordmaster)) cut = round(cut*1.25)
    if(list_contains(player.perks_gained, perk.blunt_speaker)) blunt = round(blunt*1.25)
    if(list_contains(player.perks_gained, perk.mystic_murder)) magic = round(magic*1.25)
    if(list_contains(player.perks_gained, perk.boring)) pierce = round(pierce*1.25)
    if(global.item_index[# player.weapon, item_stat.tier] = 7) hp -= round(max_hp*0.03)
}

c_resist = defender.cut_resist
b_resist = defender.blunt_resist
p_resist = defender.pierce_resist
m_resist = defender.magic_resist
    
strength = player.strength
dexterity = player.dexterity
wisdom = player.wisdom
perception = player.perception
defense = player.defense
block = player.block

weapon_is_gun = false
weapon_is_staff = false

if(global.item_index[# player.weapon, item_stat.wep_type] = weapon_type.staff) weapon_is_staff = true
if(global.item_index[# player.weapon, item_stat.wep_type] = weapon_type.gun) weapon_is_gun = true

blocked = 0
missed = 0
reflected = false
fumbled = false
insta_death = false

dmg = 0

if(attacker = player and player.enchanted_wep_timer > 0)
{
    main_dmg = max(cut, blunt, pierce, magic)
    magic += round(main_dmg*0.25)
    ds_list_insert(console.console_messages, 0, "Player's magic is " + string(magic))
}


dmg = ((cut * (1/c_resist)) + (blunt * (1/b_resist)) + (pierce * (1/p_resist)) + (magic * (1/m_resist)))

if(defender = player and player.double_resist_timer > 0) dmg = ((cut * (1/(c_resist*2))) + (blunt * (1/(b_resist*2))) + (pierce * (1/(p_resist*2))) + (magic * (1/(m_resist*2))))

dmg = round(dmg)
//ds_list_insert(console.console_messages, 0, string(attacker.name) + "'s base dmg: " + string(attacker.dmg)) 

if(defender = player) 
{
    if(attacker.name = "The Foreman")
    {
        attacker_hp_percent = attacker.hp/attacker.mHp   
        if(attacker_hp_percent < 0.5) crit_thresh = 30
        else crit_thresh = 15
        crit_chance = irandom(100)
        
        if(crit_chance < crit_thresh)
        {
            ds_list_insert(player.messages, 0, "The Foreman lines up a CRITICAL SHOT!")
            dmg = round(dmg*1.5)
        }
    }
    
    if(player.stealthy_set and player.stealth_timer = 0)
    {
        stealth_chance = irandom(100)
        if(stealth_chance <= 15)
        {
            player.stealth_timer = 30
            ds_list_insert(player.messages, 0, "You vanish in a puff of smoke!")
            gain_buff(buff.stealth, 30)
        }
    }
    
    if(!player.champion_set) dmg -= defense
    miss = irandom(100)
    if(player.job = class.rogue) miss -= 15
    if(list_contains(player.perks_gained, perk.trickster)) miss -= 5
    if(miss < (floor(dexterity/15) + 15)) 
    {
        missed = 1
        dmg = 0
    }
    else
    {
        block_chance = irandom(99) + 1
        if(list_contains(player.perks_gained, perk.royalguard) and player.shield != item.none) 
        {
            //ds_list_insert(player.messages, 0, "ROYALGUARD!")
            block_chance -= 5
        }
        if(block_chance < block) 
        {
            dmg -= round(dmg*global.item_index[# player.shield, item_stat.mitigated])
            if(dmg < 0) dmg = 0
            blocked = 1
        }
    }
    if(player.job = class.berserker and !player.berserking)
    {
        rage_gained = round(dmg*2)
        if(rage_gained > 60) rage_gained = 60
        player.rage += rage_gained
    }
    if(player.inf_armor_time > 0) dmg = round(dmg/2)
    if(player.armor = item.bloody_robe)
    {
        revenge_chance = irandom(100)
        if(revenge_chance < 20)
        {
            ds_list_insert(player.messages, 0, "The soul of the robe strikes in revenge!")
            revenge_dmg = floor(dmg*0.75)
            attacker.hp -= revenge_dmg
            with(instance_create(attacker.x, attacker.y-((instance_number(hurt_text)*8)+8), hurt_text))
            {
                val = other.revenge_dmg
                color = c_maroon
            }
        }
    }
    if(player.armor = item.mirror_plate and max(cut,pierce,blunt,magic) = magic)
    {
        attacker.hp -= magic
        with(instance_create(attacker.x, attacker.y-((instance_number(hurt_text)*8)+8), hurt_text))
        {
            val = other.magic
            color = c_fuchsia
        }
        reflected = true
        dmg = 0
    }
    if(player.berserk_timer > 0) 
    {
        if(!player.gutsy_set) dmg *= 2
        else dmg *= 4
    }
    if(player.champion_set) dmg = round(dmg/2)
}

if(attacker = player)
{
    main_dmg = max(cut, blunt, pierce, magic)
    
    if(player.weapon = item.voracious_axe) player.energy -= round(player.energy/15)

    if(player.weapon = item.none) 
    {
        dmg = round(strength) + irandom(5)
        if(list_contains(player.perks_gained, perk.brawler))
        {
            dmg = ceil(dmg*1.25)
        }
        audio_play_sound(sfx_blunt, 2, 0)
    }
    else if(weapon_is_staff)
    {
        dmg = blunt+ceil(strength/2)
    }
    else if(weapon_is_gun)
    {
        dmg = ceil(strength/2) + irandom(5)
    }
    if(player.job = class.berserker and player.berserking and player.weapon = item.none) dmg = round(strength*1.5) 
    
    if(player.job = class.berserker and !player.berserking and player.weapon = item.none)
    {
        rage_gained = round(dmg/2)
        if(rage_gained > 40) rage_gained = 40
        player.rage += rage_gained
    }
    
    else if(!weapon_is_gun and !weapon_is_staff and player.weapon != item.none)
    {
        if(main_dmg = cut) dmg += round(dexterity) + irandom(5)
        else if(main_dmg = blunt) dmg += round(strength) + round(strength*(1.2*player.berserking)) + irandom(5)
        else if(main_dmg = pierce) dmg += round(perception) + irandom(5)
        else if(main_dmg = magic and global.item_index[#player.weapon, item_stat.enchanted] = true) dmg += round(wisdom/2) + irandom(5)
        
        if(global.item_index[#player.weapon, item_stat.enchanted] = true) dmg += magic 
    }
    else
    {
        if(cut > 0) dmg += round(dexterity/4) + irandom(2)
        if(blunt > 0) dmg += round(strength/4) + (strength*(2*player.berserking)) + irandom(2)
        if(pierce > 0) dmg += round(perception/4) + irandom(2)
    }
    
    if((player.weapon = item.fjolnir or player.gutsy_set) and berserk_timer = 0)
    {
        enrage_chance = irandom(100)
        if(enrage_chance < 25) 
        {
            ds_list_insert(player.messages, 0, "The smith's soul gives you its RAGE!")
            player.berserk_timer = 30
            gain_buff(buff.enraged, 30)
        }
    }
    if(player.weapon = item.quakehammer)
    {
        quake_chance = irandom(100)
        if(quake_chance < 20)
        {
            ds_list_insert(player.messages, 0, "The Quakehammer shakes the Tower to the core!")
            instance_create(x,y,quake_spell)
        }
    }
    if(player.weapon = item.dragonclaw)
    {
        explo_chance = irandom(100)
        if(explo_chance < 7)
        {
            for(i = -1; i < 2; i++)
            {
                for(j = -1; j < 2; j++)
                {
                    instance_create(x+(i*32),y+(j*32),explosion)
                }
            }
        }
    }
    
    if(player.berserk_timer > 0) dmg *= 2
    
    if(player.weapon != item.none and !weapon_is_gun and !weapon_is_staff)
    {
        fumble_chance = 0
        fumble_reason = "none"
        if(cut+pierce+blunt != 0) fumble_limit = max(cut, pierce, blunt)
        else fumble_limit = 0
        if(fumble_limit = cut) 
        {
            fumble_chance = (dexterity/cut)
            fumble_reason = "dexterity"
        }
        if(fumble_limit = pierce) 
        {
            fumble_chance = (perception/pierce)
            fumble_reason = "perception"
        }
        if(fumble_limit = blunt) 
        {
            fumble_chance = (strength/blunt)
            fumble_reason = "strength"
        }
        if(fumble_chance < 0.75)
        {
            fumble_chance = (1-fumble_chance)
            fumble_chance *= 100
            fumble_percent = irandom(99) + 1
            if(list_contains(player.perks_gained, perk.winging_it))
            {
                fumble_percent += 10
            }
            if(fumble_percent < fumble_chance) 
            {
                fumbled = true
                dmg = round(dmg/6)
            }
        }
    }
    if(global.item_index[# player.weapon, item_stat.race_adv] = defender.race) 
    {
        dmg = round(dmg*1.5)
    }
    if(global.item_index[# player.weapon, item_stat.race_adv] = enemy_race.demon and defender.race = enemy_race.demon and !player.demon_form)
    {
        if(player.job = class.slayer)
        {
            if(dmg < 50) player.essence += round(dmg/4)
            else if(dmg < 150) player.essence += round(dmg/8)
            else if(dmg < 350) player.essence += round(dmg/12)
            else if(dmg < 550) player.essence += round(dmg/16)
            else player.essence += round(dmg/20)
        }
    }
    if(player.essence_edge_time > 0 and player.job = class.slayer) dmg *= 2
    if(player.job = class.berserker and player.weapon = item.none) dmg = round(dmg*1.3)
    if(player.gold_on_hit_timer > 0 and room != town) 
    {
        gold_gained = round(dmg*0.5)
        ds_list_insert(player.messages, 0, "Your attack gains you " + string(gold_gained) + " Zun!")
        player.money += gold_gained
        player.total_money += gold_gained
    }
    if(player.weapon = item.grim_scythe and defender.boss = false)
    {
        kill_chance = irandom(100)
        if(kill_chance < 5)
        {
            insta_death = true
            dmg = 0
        }
    }
    if(list_contains(player.perks_gained, perk.all_in))
    {
        dmg = round(dmg*1.2)
    }
    if(list_contains(player.perks_gained, perk.fearless))
    {
        if(player.shield = item.none and global.item_index[# player.weapon, item_stat.hands] = 1)
        {
            dmg = round(dmg*1.2)
        }
    }
    if(player.status = "VAMP")
    {
        if(controller.hour >= 8 and controller.hour <= 20)
        {
            dmg = round(dmg*0.5)
        }
        else
        {
            dmg = round(dmg *1.5)
        }
        if(player.weapon = item.none)
        {
            leech_chance = irandom(100)
            if(leech_chance < 15)
            {
                ds_list_insert(player.messages, 0, "You leech some health and energy!")
                player.hp += round(dmg/20)
                player.energy += round(dmg/30)   
            }
        }
    }
    
    if(list_contains(player.perks_gained, perk.raimifications)) 
    {
        dmg = ceil(dmg*1.10)
    }
    if(list_contains(player.perks_gained, perk.cutpurse))
    {
        steal_chance = irandom(100)
        if(steal_chance < 15)
        {
            money_stolen = ceil(dmg/2) + irandom(100) + 10
            ds_list_insert(player.messages, 0, "You manage to steal " + string(money_stolen) + " Zun from " + string(defender.name) + "!")
            player.money += money_stolen
        }
    }
}

if(attacker = bullet)
{
    if(player.weapon = item.legion)
    {
        ds_list_insert(player.messages, 0, "Legion fires off all three barrels!")
        triple_chance = irandom(100)
        if(triple_chance < 15)
        {
            dmg *= 3
        }
    }
}

if(dmg < 1) dmg = 0

if(attacker = player)
{   
    if(!weapon_is_gun and !weapon_is_staff)
    {
        if( cut+blunt+pierce > 0) verb_choice = max(cut, blunt, pierce)
        else verb_choice = -1
    }
    else verb_choice = -1
}
else
{
    if( cut+blunt+pierce+magic > 0) verb_choice = max(cut, blunt, pierce, magic)
    else verb_choice = -1
}

if(verb_choice = cut)
{
    verb = choose("slashes", "cuts", "shanks", "whips", "slices", "dices")
    hurt_color = c_red
    audio_play_sound(sfx_cut,2,0)
}

else if(verb_choice = blunt)
{
    verb = choose("smashes", "smacks", "pummels", "whacks", "brutalizes", "blindsides")
    hurt_color = c_ltgray
    audio_play_sound(sfx_blunt,2,0)
}

else if(verb_choice = pierce)
{
    verb = choose("pierces", "pokes", "stabs", "jabs", "shishkebabs", "skewers")
    hurt_color = c_orange
    audio_play_sound(sfx_pierce,2,0)
}

else if(verb_choice = magic)
{
    verb = choose("blasts", "scorches", "magicks", "bursts", "sparkles", "ensorceles")
    hurt_color = c_purple
    audio_play_sound(sfx_magic,2,0)
}

else if(verb_choice = -1)
{
    verb = choose("hits", "aggresses", "punches", "smacks", "attacks")
    hurt_color = c_white
}

if(attacker = explosion or attacker = hell_explosion)
{
    verb = choose("scorches", "zorches", "toasts", "engulfs", "burns")
    hurt_color = c_purple
}

if(attacker = bullet)
{
    miss_chance = irandom(100)
    if(miss_chance > global.item_index[# player.weapon, item_stat.accuracy]) 
    {
        missed = 1
        dmg = 0
    }
    verb = "shoots"
}

if(missed or reflected) dmg = 0

if(console.verbose and !missed)
{
    fumble_string = ""
    if(fumbled) fumble_string = string(attacker.name) + " fumbled, halving their damage.   "
    ds_list_insert(console.console_messages, 0, "")
    ds_list_insert(console.console_messages, 0, "> " + string(attacker.name) + " attacks " + string(defender.name) + " for " + string(cut) + " cut, " + string(pierce) + " pierce, " + string(blunt) + " blunt, and " + string(magic) + " magic.")
    ds_list_insert(console.console_messages, 0, "\# " + string(defender.name) + " had " + string(real(c_resist)) + " cut resist, " + string(real(p_resist)) + " pierce resist, " + string(real(b_resist)) + " blunt resist, and " + string(real(m_resist)) + " magic resist.")
    if(attacker = player)
    {
        raw_dmg = 0
        if(main_dmg = cut) raw_dmg += dexterity + (cut*(1/c_resist))
        if(main_dmg = blunt) raw_dmg += strength + (blunt * (1/b_resist))
        if(main_dmg = pierce) raw_dmg += perception + (pierce * (1/p_resist))
        if(main_dmg = magic and global.item_index[#player.weapon, item_stat.enchanted]) raw_dmg += wisdom + (magic * (1/m_resist))
        ds_list_insert(console.console_messages, 0, "\# " + string(fumble_string) + "(Approx.) Raw damage: " + string(round(raw_dmg)) + "   Actual dmg: " + string(dmg))
    }
    else ds_list_insert(console.console_messages, 0, "\# (Approx.) Raw damage: " + string(cut+pierce+blunt) + "   Actual dmg: " + string(dmg))
}

if(defender = player and player.demon_form_time > 0 and player.job = class.slayer) dmg = round(dmg/2)
if(attacker = player and player.demon_form_time > 0 and player.job = class.slayer) dmg *= 2

if(attacker = player)
{
    if(list_contains(player.perks_gained, perk.critical_drive) and (player.hp/player.max_hp) <= 0.15) 
    {
        dmg = round(dmg*1.5)
    }
    if(list_contains(player.perks_gained, perk.strong_opener) and defender.hp = defender.mHp)
    {
        dmg = round(dmg*1.15)
    }
}

if(dmg <= 0 and !blocked and !missed and !reflected and !insta_death) dmg = 1
if(defender = player and player.invincibility_timer > 0) dmg = 0

if(defender = player)
{
    if(list_contains(player.perks_gained, perk.second_chance))
    {
        if(dmg >= player.hp and player.second_chance_timer = 0)
        {
            dmg = (player.hp - 1)
            player.second_chance_timer = 15
            gain_buff(buff.second_chance_debuff, 15)
        }
    }
}
if(attacker = player)
{
    enemies_near = 0
    if(list_contains(player.perks_gained, perk.mosh_master))
    {
        for(i = 0; i < instance_number(enemy_parent); i++)
        {
            enemy_search = instance_find(enemy_parent, i)
            if(point_distance(player.x,player.y, enemy_search.x, enemy_search.y) <= 128)
            {
                enemies_near++
            }   
        }
        if(enemies_near >= 6)
        {
            dmg = round(dmg*1.5)
        }
    }
}
defender.hp -= ceil(dmg)

if(!blocked and !missed and !fumbled and !reflected and !insta_death)
{
    if(dmg > 0) 
    {
        if(defender = player and list_contains(player.perks_gained, perk.all_in))
        {
            player.energy--
        }
        dmg_type = max(cut, blunt, magic, pierce)
        if(attacker = player and (player.weapon = item.none or (weapon_is_staff or weapon_is_gun))) dmg_icon = s_blunt_dmg
        else if(dmg_type = cut) dmg_icon = s_cut_dmg
        else if(dmg_type = blunt or dmg_type = 0) dmg_icon = s_blunt_dmg
        else if(dmg_type = pierce) dmg_icon = s_pierce_dmg
        else dmg_icon = s_magic_dmg 
        with(instance_create(defender.x, defender.y, dmg_effect))
        {
            sprite_index = other.dmg_icon
        }
        ds_list_insert(player.messages, 0, string(attacker.name) + " " + string(verb) + " " + string(defender.name) + " for " + string(dmg) + " damage.")
        if(defender = player) player.total_dmg += dmg
        else if(defender != player and defender.name != "Punching Bag") player.total_dmg_dealt += dmg
    }
    else ds_list_insert(player.messages, 0, string(attacker.name) + " " + string(verb) + " " + string(defender.name) + "-and whiffs it!")
}

else if(blocked)
{
    parried = false
    with(instance_create(defender.x, defender.y, dmg_effect))
    {
        sprite_index = s_blocked_dmg
    }
    ds_list_insert(player.messages, 0, string(attacker.name) + " " + string(verb) + " " + string(defender.name) + "-but it's blocked!")
    
    if(defender = player and list_contains(player.perks_gained, perk.parry_pro))
    {
        parry_chance = irandom(99) + 1
        if(parry_chance < 40 and point_distance(player.x,player.y,attacker.x,attacker.y) <= 32)
        {
            ds_list_insert(player.messages, 0, string(player.name) + " successfully parries!")
            parried = true
            attack(player, attacker) 
        }
    }
    
    hurt_color = c_red
    if(parried) dmg = "Parry!"
    else 
    {   
        temp_dmg = dmg
        dmg = "Block! (" + string(temp_dmg) + ")"
    }
    if(defender = player and player.shield = item.sanguine_shield)
    {
        ds_list_insert(player.messages, 0, "The Sanguine Shield absorbs the blow, healing you for " + string(cut+blunt+pierce+magic) + " HP!")
        player.hp += (cut+blunt+pierce+magic)
    }
    audio_play_sound(sfx_miss, 2, 0)
}

else if(missed)
{
    countered = false
    ds_list_insert(player.messages, 0, string(attacker.name) + " " + string(verb) + " " + string(defender.name) + "-but they miss!")
    hurt_color = c_white
    if(defender  = player and list_contains(player.perks_gained, perk.counter_jockey))
    {
        counter_chance = irandom(99) + 1
        if(counter_chance <= 20 and point_distance(player.x,player.y,attacker.x,attacker.y) <= 32)
        {
            ds_list_insert(player.messages, 0, string(player.name) + " successfully counter-attacks!")
            countered = true
            attack(player, attacker) 
        }   
    }
    if(countered)  dmg = "Counter Attack!"
    else dmg = "Miss!"
    audio_play_sound(sfx_miss, 2, 0)
}

else if(fumbled)
{
    with(instance_create(defender.x, defender.y, dmg_effect))
    {
        sprite_index = s_fumble_dmg
    }
    ds_list_insert(player.messages, 0, string(attacker.name) + " fumbles from lack of " + string(fumble_reason) + "!")
}

else if(reflected)
{
    ds_list_insert(player.messages, 0, string(attacker.name) + "'s magic attack is reflected!")
    dmg = "Reflect!"
}
else if(insta_death)
{
    ds_list_insert(player.messages, 0, "The Grim Scythe instantly kills " + string(defender.name) + "!")
    with(instance_create(defender.x, defender.y, dmg_effect))
    {
        sprite_index = s_cut_dmg
    }
    player.total_dmg_dealt += defender.hp
    defender.regen = false
    defender.hp = 0
    dmg = "Instant Death!"
}

else
{
    ds_list_insert(player.messages, 0, string(attacker.name) + " " + string(verb) + " " + string(defender.name) + "-but misses!")
}

with(instance_create(defender.x, defender.y-((instance_number(hurt_text)*8)+8), hurt_text))
{
    val = other.dmg
    color = other.hurt_color
}

if(dmg > 0) 
{
    with(wall)
    {
        blood_chance = irandom(100)
        if((point_distance(x,y,other.x,other.y) < 64) and blood_chance < 10) bloodied = true
    }
    with(floor_tile)
    {
        blood_chance = irandom(100)
        if((point_distance(x,y,other.defender.x,other.defender.y) < 64) and blood_chance < 10) bloodied = true
    }
}

if(attacker.is_enemy and attacker.hp > 0)
{
    if((attacker.name = "Thief" or attacker.thievery = true) and attacker.hp > 0)
    {
        money_lost = ((10*player.floors) + irandom(20))
        if(player.money - money_lost > 0) player.money -= money_lost
        else
        {
            money_lost = player.money
            player.money = 0
        }
        if(player.money <= 0) player.money = 0
        ds_list_insert(player.messages, 0, "Your purse feels " + string(money_lost) + " Zun lighter!")
        ds_list_insert(player.messages, 0, "The " + string(attacker.name) + " teleports away...")
        ft = instance_find(floor_tile, irandom(instance_number(floor_tile)-1))
        attacker.x = ft.x
        attacker.y = ft.y
        attacker.money_taken += money_lost
    }
}
if(defender.is_enemy)
{
    if(defender.vengeful and attacker = player and !missed and !blocked)
    {
        if(is_string(dmg)) dmg = 0
        revenge_dmg = round(dmg/5)
        if(revenge_dmg > round(player.max_hp/33)) revenge_dmg = round(player.max_hp/33)
        if(player.invincibility_timer > 0) revenge_dmg = 0
        ds_list_insert(player.messages, 0, string(defender.name) + " takes revenge on " + string(attacker.name) + " for " + string(revenge_dmg) + " dmg!")
        player.hp -= revenge_dmg
        with(instance_create(attacker.x, attacker.y-((instance_number(hurt_text)*8)+8), hurt_text))
        {
            val = other.revenge_dmg
            color = c_fuchsia
        }
    }
}

if(console.show_stats and attacker = player)
{
    ds_list_insert(console.console_messages, 0, "")
    ds_list_insert(console.console_messages, 0, "\# Enemy Statistics:")
    ds_list_insert(console.console_messages, 0, "\# Name: " + string(defender.name) + "     Max HP: " + string(defender.mHp))
    ds_list_insert(console.console_messages, 0, "\# Cut/Blunt/Pierce/Magic: " + string(defender.cut) + "/" + string(defender.blunt) + "/" + string(defender.pierce) + "/" + string(defender.magic))
    ds_list_insert(console.console_messages, 0, "\# CR/BR/PR/MR: " + string(real(c_resist)) + "/" + string(real(p_resist)) + "/" + string(real(b_resist)) + "/" + string(real(m_resist)))
    ds_list_insert(console.console_messages, 0, "\# XP: " + string(defender.xp) + "      Unique Drop: " + string(global.item_index[# defender.unique_drop, item_stat.name]) + "    Loot Chance: " + string(defender.drop_rate) + "%")
}
