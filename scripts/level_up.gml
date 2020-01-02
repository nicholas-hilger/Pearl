randomize()

//Base gain: 8 points to distribute
//Random bonus: 6 points to gain
//(Half for Useless, double for late-game)

if(!audio_is_playing(sfx_lvl_up)) audio_play_sound(sfx_lvl_up, 2, 0)

if(xp >= max_xp) xp = xp-max_xp
if(xp < 0) xp = 0

lvl++

if(lvl%5 = 0) 
{
    with(menu_parent) instance_destroy()
    instance_create(x,y,perk_menu)
}
bonus = 0

if(lvl%10 = 0)
{
    ds_list_insert(player.messages, 0, "Max Energy went up by 2!")
    max_energy += 2
}

if(lvl < 5) max_xp *= 1.3
else if(lvl >= 5 and lvl < 15) max_xp *= 1.2
else if(lvl >= 15 and lvl < 30) max_xp *= 1.1
else max_xp *= 1.05

max_xp = round(max_xp)

if(player.job = class.berserker)
{
    strength_gain = irandom(2) + 2
    dexterity_gain = irandom(1) + 1
    perception_gain = irandom(1) + 1
    wisdom_gain = irandom(1)
    hp_gain = 6
}

else if(player.job = class.useless)
{
    if(player.lvl < 25)
    {
        strength_gain = irandom(1)
        dexterity_gain = irandom(1)
        perception_gain = irandom(1)
        wisdom_gain = irandom(1)
        hp_gain = 1
    }
    else
    {
        strength_gain = irandom(3) + 4
        dexterity_gain = irandom(3) + 4
        perception_gain = irandom(3) + 4
        wisdom_gain = irandom(3) + 4
        hp_gain = 7
    }
}

else if(player.job = class.rogue)
{
    strength_gain = irandom(1)
    dexterity_gain = irandom(1) + 1
    perception_gain = irandom(2) + 2
    wisdom_gain = irandom(1)
    hp_gain = 2
}

else if(player.job = class.adventurer)
{
    strength_gain = irandom(2) + 1
    dexterity_gain = irandom(2) + 2
    perception_gain = irandom(2) + 1
    wisdom_gain = irandom(1) + 1
    hp_gain = 4
}

else if(player.job = class.arcanist)
{
    strength_gain = irandom(1)
    dexterity_gain = irandom(1)
    perception_gain = irandom(1) + 2
    wisdom_gain = irandom(2) + 2
    hp_gain = 2
}

else if(player.job = class.slayer)
{
    strength_gain = irandom(1) + 1
    dexterity_gain = irandom(1) + 2
    perception_gain = irandom(1)
    wisdom_gain = irandom(1)
    hp_gain = 3
}

else if(player.job = class.soldier)
{
    strength_gain = irandom(1) + 1
    dexterity_gain = irandom(2) + 2
    perception_gain = irandom(2) + 2
    wisdom_gain = irandom(1) + 1
    hp_gain = 3
}

//if(lvl%10 == 0) bonus = 1
//else 
bonus = 0

if(!bonus)
{
    strength += round(strength_gain)
    dexterity += round(dexterity_gain)
    perception += round(perception_gain)
    wisdom += round(wisdom_gain)
}
/*else
{
    strength += round(strength_gain)*2
    dexterity += round(dexterity_gain)*2
    perception += round(perception_gain)*2
    wisdom += round(wisdom_gain)*2
}*/

hp_gain += ceil(strength/10)
hp_gain = round(hp_gain)
hp += hp_gain
max_hp += round(hp_gain)

hp_mess = ""
strength_mess = ""
dexterity_mess = ""
perception_mess = ""
wisdom_mess = ""

ds_list_insert(messages, 0, "Level Up!")

if(hp_gain > 0) ds_list_insert(messages, 0, string("HP went up by " + string(hp_gain) + "!"))
if(strength_gain > 0) ds_list_insert(messages, 0, string("Str went up by " + string(strength_gain) + "!"))
if(wisdom_gain > 0) ds_list_insert(messages, 0, string("Wis went up by " + string(wisdom_gain) + "!"))
if(perception_gain > 0) ds_list_insert(messages, 0, string("Per went up by " + string(perception_gain) + "!")) 
if(dexterity_gain > 0) ds_list_insert(messages, 0, string("Dex went up by " + string(dexterity_gain) + "!"))

with(instance_create(player.x,player.y-16,hurt_text))
{
    val = "Level Up!"
    col_index = irandom(9)
    life = 40
}
