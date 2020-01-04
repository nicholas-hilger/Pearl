/*
this script will generate the walls and contents of the dungeon.
each floor will check around itself for empty places, and then place walls objects there
then each floor object will have a chance of spawning an enemy or a treasure chest

argument0 = floor objects
argument1 = grid size
argument2 = wall object
*/

randomize()

merchant_chance = irandom(99)+1

if(list_contains(player.perks_gained, perk.capitalist) and player.floors%3 = 0) merchant_chance = 1

if(merchant_chance < 15 and !list_contains(player.perks_gained, perk.communist))
{
    ft = instance_find(floor_tile, irandom(instance_number(floor_tile))-1)
    instance_create(ft.x,ft.y,dungeon_merchant)
    for( i = -32; i < 64; i += 32)
    {
        for(j = -32; j < 64; j += 32)
        {
            instance_create(ft.x+i,ft.y+j,floor_tile)
        }
    }
}

with (argument0) { //with all floor objects
    for (i=-(argument1);i<=argument1;i+=argument1) { //selecting all the blocks around them
        for (j=-(argument1);j<=argument1;j+=argument1) {
            if place_empty(x+i,y+j) { //if there's not a floor object within the space
                instance_create(x+i,y+j,argument2); //create a wall
            }
        }
    }
}

with(controller)
{
    global.grid = mp_grid_create(16,16,room_width/32,room_height/32,32,32)
    mp_grid_add_instances(global.grid, wall, 1)
    //mp_grid_add_instances(global.grid, enemy_parent, 0)
}

if(player.floors%6 = 0) instance_create(player.x+32,player.y,town_checkpoint)


with(wall) 
{
    auto_tile_wall()
    if(place_meeting(x,y,floor_tile)) instance_destroy()
}

breakables_pop = irandom(2) + 3
for(i = 0; i < breakables_pop; i++)
{
    with(instance_find(floor_tile,irandom(instance_number(floor_tile)))) 
    {
        instance_create(x,y,breakable)
    }
}

if(player.floors < 9) pop_coeff = 1
else if(player.floors < 19) pop_coeff = 0.75
else pop_coeff = 0.5

enemy_pop = round(irandom(4) + (6+round(pop_coeff*player.floors)))
item_pop = irandom(1) + (2+floor(player.floors/5))
gold_pop = irandom(3) + 3
ammo_pop = irandom(1) + 1

if(list_contains(player.perks_gained, perk.communist)) item_pop += irandom(2) + 1
if(list_contains(player.perks_gained, perk.capitalist)) item_pop -= irandom(2) + 1

for(i = 0; i < enemy_pop; i++)
{
    with(instance_find(floor_tile,irandom(instance_number(floor_tile)))) 
    {
        if(!place_meeting(x,y,enemy_parent)) 
        {
            with(instance_create(x,y,enemy_parent))
            {
                pool = global.foyer_pool
            }
        }
    }
}

for(i = 0 ; i < item_pop; i++)
{
    with(instance_find(floor_tile,irandom(instance_number(floor_tile)))) 
    {
        instance_create(x,y,item_parent)
    }
}

if(list_contains(player.perks_gained, perk.foodie))
{
    extra_food = irandom(3)
    repeat(extra_food)
    {
        with(instance_find(floor_tile,irandom(instance_number(floor_tile)))) 
        {
            with(instance_create(x,y,item_parent))
            {
                dropped = true
                pool = global.meal_pool
                pool_name = "Foodie"
                food_choice = global.meal_pool[irandom(array_length_1d(global.meal_pool)-1)]
                iid = food_choice
            }
        }
    }
}

for(i = 0 ; i < gold_pop; i++)
{
    with(instance_find(floor_tile,irandom(instance_number(floor_tile)))) 
    {
        instance_create(x,y,gold)
    }
}

for(i = 0 ; i < ammo_pop; i++)
{
    with(instance_find(floor_tile,irandom(instance_number(floor_tile)))) 
    {
        instance_create(x,y,ammunition)
    }
}

while(!instance_exists(stairs))
{
    with(instance_find(floor_tile,irandom(instance_number(floor_tile)))) 
    {
        if(place_meeting(x,y,merchant)) instance_create(x+32,y,stairs)
        else instance_create(x,y,stairs)
    }
}

if(player.floors%5 = 0) 
{
    with(stairs) instance_destroy()
    with(instance_find(floor_tile,irandom(instance_number(floor_tile)))) 
    {   
        ds_list_insert(player.messages, 0, "You sense a strong evil lurking on this floor...")

        with(instance_create(x,y,enemy_parent)) 
        {
            boss = true
            if(player.floors = 5) spawn_enemy(x,y,global.foyer_boss_pool[irandom(array_length_1d(global.foyer_boss_pool)-1)])
            if(player.floors = 10) spawn_enemy(x,y,global.mines_boss_pool[irandom(array_length_1d(global.mines_boss_pool)-1)])
            if(player.floors = 15) spawn_enemy(x,y,global.graveyard_boss_pool[irandom(array_length_1d(global.graveyard_boss_pool)-1)])
            if(player.floors = 20)spawn_enemy(x,y,global.barracks_boss_pool[irandom(array_length_1d(global.barracks_boss_pool)-1)]) 
        }
    }
}
//with(floor_tile) auto_tile_floor()


for(i = 0; i < round(instance_number(wall)/60); i++)
{
    with(instance_find(wall,irandom(instance_number(wall)))) instance_change(torch, true)
}

room_speed = 60

with(instance_find(floor_tile,irandom(instance_number(floor_tile)-1)))
{
    player.x = x
    player.y = y
}

