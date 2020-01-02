if(eid != enemy.punching_bag and instance_exists(player))
{
    if(point_distance(x,y,player.x,player.y) < (range*sprite_width+32) and player.stealth_timer = 0)
    {
        if(regen = true and hp < mHp)
        { 
            hp += floor(mHp/15)
            if(hp > mHp) hp = mHp
        }
        //Foyer boss specials
        if(eid = enemy.monitor_eye)
        {
            if(hp/mHp <= 0.5)
            {
                warp_chance = irandom(99)+1
                if(warp_chance < 20 and point_distance(player.x,player.y,x,y) < 80)
                {
                    ft = instance_find(floor_tile, irandom(instance_number(floor_tile)))
                    x = ft.x
                    y = ft.y
                    ds_list_insert(player.messages, 0, string(name) + " teleports to safety!")
                }
            }
        }
        if(eid = enemy.guard_hound)
        {
            if(hp/mHp <= 0.5 and !enraged)
            {
                ds_list_add(player.messages, 0, "Guard Hound howls in fury! Its strength has increased!")
                color_mod= c_red
                cut = round(cut*1.5)
                blunt = round(blunt*2)
                pierce = round(pierce*1.5)
                enraged = true
                with(instance_create(x,y-32,hurt_text))
                {
                    life = 30
                    val = "ENRAGED!"
                    color = c_red
                }
            }
        }
        if(eid = enemy.first_knight)
        {
            if(hp/mHp < 0.5 and !fortified)
            {
                ds_list_add(player.messages, 0, "The First Knight foritifies their remaining armor!")
                cut_resist *= 2
                blunt_resist *= 1.5
                pierce_resist *= 2
                magic_resist *= 2
                color_mod = c_dkgray
                fortified = true
                with(instance_create(x,y-32,hurt_text))
                {
                    life = 30
                    val = "Fortified!"
                    color = c_ltgray
                }
            }
        }
        //Mines boss specials
        if(eid = enemy.queen_spider)
        {
            if(hp/mHp < 0.6 and point_distance(x,y,player.x,player.y) <= 32)
            {
                poison_chance = irandom(99)+1
                if(poison_chance < 400 and player.poison_time = 0)
                {
                    ds_list_add(player.messages, 0, "The Queen Spider lunges, biting you with her venomous fangs!")
                    player.poison_time = 30
                    gain_buff(buff.poisoned, 30)
                }
            }
        }
        //Foreman's bonus is in the attack script, Crystal Demon's is in enemy_parent create method
        
        //Graveyard boss specials
        if(eid = enemy.necromancer)
        {
            summon_chance = irandom(99) + 1
            if(hp/mHp <= 0.5) summon_threshold = 50
            else summon_threshold = 25
            
            if(summon_chance < summon_threshold)
            {
                for(i = -1; i < 2; i++)
                {
                    for(j = -1; j < 2; j++)
                    {
                        if(place_meeting(x+(i*32), y+(j*32), floor_tile) and !place_meeting(x+(i*32), y+(j*32), enemy_parent) and !place_meeting(x+(i*32), y+(j*32), player) and (i+j != 0))
                        {
                            with(instance_place(x+(i*32), y+(j*32), floor_tile))
                            {
                                with(instance_create(x,y,enemy_parent))
                                {
                                    spawn_enemy(x,y,enemy.skeleton)
                                }
                            }
                        }
                    }
                }
            }
        }
        //Barracks boss specials
        
        
        if(controller.minute%spd = 0 and !collision_line(x,y,player.x,player.y,wall,1,1))
        {
            attack(self, player)
        }
    }
    
    else
    {
        if(controller.minute%spd = 0 and (point_distance(x,y,player.x,player.y) < (14*sprite_width)))
        {   
            if(eid = enemy.slime)
            {
                split_chance = irandom(99)+1
                if(split_chance < 15) 
                {
                    place_x = choose(-32,0,32)
                    place_y = choose(-32,0,32)
                    if(!(place_x = 0 and place_y = 0))
                    {
                        if(place_meeting(x+place_x, y+place_y, floor_tile) and ! place_meeting(x+place_x, y+place_y, enemy_parent))
                        { 
                            with(instance_create(x+place_x,y+place_y,enemy_parent)) 
                            {
                                spawn_enemy(x,y,enemy.slime)
                                eid = enemy.slime
                            }
                        }
                    }
                }   
            }
            if(mp_grid_path(global.grid,path,x,y,player.x,player.y,1) and !place_meeting(x1,y1,player) and player.stealth_timer = 0)
            {
                if(!immobile)
                {
                    if(!place_meeting(x1,y1,enemy_parent))
                    {
                        x = (x + sign(x1-x)*ts)
                        y = (y + sign(y1-y)*ts)
                    }
                    else if (place_meeting(x1,y1,enemy_parent) and point_distance(x,y,player.x,player.y) > 32)
                    {
                        spot_found = false
                        check_dir = choose(1,-1)
                        if(check_dir = 1)
                        {
                            for( i = -32; i < 64; i += 32)
                            {
                                for(j = -32; j < 64; j += 32)
                                {
                                    if(!place_meeting(x1+i, y1+j, enemy_parent) and !place_meeting(x1+i, y1 + j, wall) and (x1+i != x and y1+j != y))
                                    {
                                        potential_step_x = (x1+i)
                                        potential_step_y = (y1+j)
                                        potential_distance = point_distance(x,y,potential_step_x,potential_step_y)
                                        if(place_meeting(potential_step_x,potential_step_y, floor_tile) and !place_meeting(potential_step_x,potential_step_y, player) and point_distance(x,y,potential_step_x,potential_step_y) < 48)
                                        {
                                            //ds_list_insert(console.console_messages, 0, "X^% " + string(name) + ": X = " + string(x) + " Next X: " + string(x + sign((x1+i)-x)*ts) + " Y: " + string(y) + " Next Y: " + string(y + sign((y1 + j)-y)*ts))
                                            if(!place_meeting(potential_step_x,potential_step_y, enemy_parent))
                                            {
                                                x = (x + sign((x1+i)-x)*ts)
                                                y = (y + sign((y1 + j)-y)*ts)
                                                spot_found = true
                                                break
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        else
                        {
                            for( i = 64; i > -32; i -= 32)
                            {
                                for(j = 64; j > -32; j -= 32)
                                {
                                    if(!place_meeting(x1+i, y1+j, enemy_parent) and !place_meeting(x1+i, y1 + j, wall) and (x1+i != x and y1+j != y))
                                    {
                                        potential_step_x = (x1+i)
                                        potential_step_y = (y1+j)
                                        potential_distance = point_distance(x,y,potential_step_x,potential_step_y)
                                        if(place_meeting(potential_step_x,potential_step_y, floor_tile) and !place_meeting(potential_step_x,potential_step_y, player) and point_distance(x,y,potential_step_x,potential_step_y) < 48)
                                        {
                                            //ds_list_insert(console.console_messages, 0, "X^% " + string(name) + ": X = " + string(x) + " Next X: " + string(x + sign((x1+i)-x)*ts) + " Y: " + string(y) + " Next Y: " + string(y + sign((y1 + j)-y)*ts))
                                            if(!place_meeting(potential_step_x,potential_step_y, enemy_parent))
                                            {
                                                x = (x + sign((x1+i)-x)*ts)
                                                y = (y + sign((y1 + j)-y)*ts)
                                                spot_found = true
                                                break
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if(!spot_found)
                        {
                            //ds_list_insert(player.messages, 0, "<><> " + string(name) + " COULD NOT FIND SPOT <><>")
                            x = x
                            y = y
                        } 
                    }
                }
            }
            else
            {
                x = x
                y = y
            }
        }
    }
}
