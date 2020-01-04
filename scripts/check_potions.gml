/// check_potions(item)

food = argument0

if(food = item.energy_potion) 
{
    player.max_energy += 2
    ds_list_insert(player.messages, 0, "You feel your metabolism improve!")
}

if(food = item.small_heal_potion) 
{
    healed = round(player.max_hp*0.33)
    player.hp += healed
    ds_list_insert(player.messages, 0, "You are healed for " + string(healed) + " HP!")
    with(instance_create(player.x,player.y-16,hurt_text))
    {
        color = c_green
        val = round(player.max_hp*0.33)
    }
}

if(food = item.big_heal_potion) 
{
    healed = round(player.max_hp*0.66)
    player.hp += healed
    ds_list_insert(player.messages, 0, "You are healed for " + string(healed) + " HP!")
    with(instance_create(player.x,player.y-16,hurt_text))
    {
        color = c_green
        val = round(player.max_hp*0.66)
    }
}

if(food = item.grand_potion) 
{
    player.hp = player.max_hp
    ds_list_insert(player.messages, 0, "All aches and pains are washed away form the inside out...")
    with(instance_create(player.x,player.y-16,hurt_text))
    {
        color = c_green
        val = round(player.max_hp)
    }
}

if(food = item.ambrosia_syrup)
{
    ds_list_insert(player.messages, 0, "You feel empowered by the drink of the gods!")
    player.hp = player.max_hp
    player.energy = player.max_energy
    with(player) level_up()
    if(player.invincibility_timer > 0)
    {  
        gain_buff(buff.invincibility, 60-player.invincibility_timer)
    }
    else gain_buff(buff.invincibility, 60)

    player.invincibility_timer = 60
}

if(food = item.distilled_essence)
{
    ds_list_insert(player.messages, 0, "Through much gagging and revolt, you feel your essence increase...")
    player.essence += 25
}


if(food = item.gold_dust)
{
    ds_list_insert(player.messages, 0, "Your weapon glows with avarice!")
    if(player.gold_on_hit_timer > 0)
    {
        gain_buff(buff.gold_on_hit, 60-player.gold_on_hit_timer)
    }
    else gain_buff(buff.gold_on_hit, 60)
    player.gold_on_hit_timer = 60
}

if(food = item.ironbark_brew)
{
    ds_list_insert(player.messages, 0, "You can feel your skin harden!")
    if(player.double_resist_timer > 0)
    {
        gain_buff(buff.double_resist, 45-player.double_resist_timer)
    }
    else gain_buff(buff.double_resist, 45)
    player.double_resist_timer = 45
}

if(food = item.liquid_knowledge)
{
    if(player.lvl < player.max_level and !list_contains(player.perks_gained, perk.instant_gratification) and player.status != "VAMP")
    {
        xp_gained = round(player.max_xp *0.25)
        ds_list_insert(player.messages, 0, "You feel a rush of insight...!")
        ds_list_insert(player.messages, 0, "You gain " + string(xp_gained) + " XP!")
        player.xp += xp_gained
    }
    else ds_list_insert(player.messages, 0, "The potion seems to have no effect on you...")
}   

if(food = item.enchanted_salve)
{
    ds_list_insert(player.messages, 0, "Your weapon glows with arcane might!")
    if(player.enchanted_wep_timer > 0)
    {
        gain_buff(buff.enchanted_wep, 45-player.enchanted_wep_timer)
    }
    else gain_buff(buff.enchanted_wep, 45)
    player.enchanted_wep_timer = 45    
}

if(food = item.star_essence)
{
    ds_list_insert(player.messages, 0, "You feel invicible!")
    if(player.invincibility_timer > 0)
    {  
        gain_buff(buff.invincibility, 30-player.invincibility_timer)
    }
    else gain_buff(buff.invincibility, 30)

    player.invincibility_timer = 30
}

if(food = item.perky_pop)
{
    if(ds_list_size(player.perks_list) = 0)
    {
        ds_list_insert(player.messages, 0, "You don't have any remaining perks...")
        ds_list_insert(player.messages, 0, "Your stats are instead empowered!")
        player.perception += 2
        player.dexterity += 2
        player.strength += 2
        player.wisdom += 2
    }
    else
    {
        pid = ds_list_find_value(player.perks_list, irandom(ds_list_size(player.perks_list)-1))
        ds_list_add(player.perks_gained, pid)
        perk_name = global.perk_index[# pid, perk_stats.name]
        perk_deleted = ds_list_find_index(player.perks_list, pid)
        check_perks(pid)
        ds_list_delete(player.perks_list, perk_deleted)
        ds_list_insert(player.messages, 0, "You gain the perk " + string(perk_name) + "!")
    }
}

if(food = item.vampire_blood)
{
    if(player.status = "OK")
    {
        with(player)
        {
            status = "VAMP"
            perception += 25
            wisdom += 25
            strength += 25
            dexterity += 25
            max_hp += 30
            hp = max_hp
            xp = 0
            instance_destroy(inventory_box)
            instance_create(x,y,vampire_msg)
        }
    }
    else
    {
        ds_list_insert(player.messages, 0, "The blood seems to go inert when you drink it...")
    }
}
