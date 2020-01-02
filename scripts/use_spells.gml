/// use_spells(spell_id)
sid = argument0

es_cost = global.spell_index[# argument0, spell_stat.essence_cost]

if(player.job = class.slayer and player.essence < es_cost) ds_list_insert(player.messages, 0, "You don't have enough essence for that!")
else
{
    player.energy -= global.spell_index[# argument0, spell_stat.energy_cost]
    if(player.job = class.slayer) player.essence -= global.spell_index[# argument0, spell_stat.essence_cost]
    
    if(sid = spell.mend)
    {
        instance_create(player.x,player.y,mend_effect)
    }
    
    if(sid = spell.infernal_armor)
    {
        if(player.inf_armor_time > 0) ds_list_insert(player.messages, 0, "You're already using Infernal Armor!")
        else
        {
            ds_list_insert(player.messages, 0, "You shroud yourself in demonic essence!")
            player.inf_armor_time = 60
            gain_buff(buff.infernal_armor, 60)
        }
    }
    
    if(sid = spell.essence_edge)
    {
        if(player.essence_edge_time > 0) ds_list_insert(player.messages, 0, "You're already using Essence Edge!")
        else
        {
            ds_list_insert(player.messages, 0, "You imbue your blade with demonic essence!")
            player.essence_edge_time = 60
            gain_buff(buff.essence_edge, 60)
        }
    }
    
    if(sid = spell.quake) instance_create(0,0,quake_spell)
    
    if(sid = spell.town_port)
    {
        if(!list_contains(player.perks_gained, perk.homesick))
        {
            if(player.teleporting > -1) ds_list_insert(player.messages, 0, "You're already casting that!")
            else 
            {
                player.teleporting = 30
                gain_buff(buff.teleporting, 30)
            }
        }
        else
        {
            room_goto(town)
            player.x = 848
            player.y = 400
            floors = 0
            player.teleporting = -1
        }
    }
    
    if(sid = spell.hellfire)
    {
        ds_list_insert(player.messages, 0, "A great, blazing inferno erupts forth from your position!")
        for(i = -3; i < 3; i++)
        {
            for(j = -3; j < 3; j++)
            {
                        instance_create(player.x+(i*32),player.y+(j*32),hell_explosion)
            }
        }

    }
    if(sid = spell.concentrate)
    {
        ds_list_insert(player.messages, 0, "You focus on your seething hatred for demonkind...")
        player.essence += 10
    }
    
    if(sid = spell.sense_mind)
    {   
        ds_list_insert(player.messages, 0, "You concentrate and sense where the fiends are hiding...")
        with(enemy_parent) 
        {
            discovered = 1
            always_visible = 1
        }
    }
    if(sid = spell.demon_form)
    {
        ds_list_insert(player.messages, 0, "You unleash your inner demon. Rip and tear, until it is done.")
        with(player)
        {
            demon_form_time = 60
        }
        gain_buff(buff.demon_form, 60)
    }
    if(sid = spell.stealth)
    {
        with(player)
        {
            if(stealth_timer > 0)
            {
                ds_list_insert(player.messages, 0, "You are already stealthed!")
                player.energy += global.spell_index[# spell.stealth, spell_stat.energy_cost]
            }
            else if(room = town)
            {
                ds_list_insert(player.messages, 0, "You don't need stealth here.")
                player.energy += global.spell_index[# spell.stealth, spell_stat.energy_cost]
            }
            else 
            {
                stealth_timer = 30
                ds_list_insert(player.messages, 0, "You vanish in a puff of smoke!")
                gain_buff(buff.stealth, 30)
            }
        }
    }
    if(sid = spell.aoe_explosion)
    {
        for(i = -1; i < 2; i++)
        {
            for(j = -1; j < 2; j++)
            {
                instance_create(player.x+(i*32),player.y+(j*32),explosion)
            }
        }
    }
}

