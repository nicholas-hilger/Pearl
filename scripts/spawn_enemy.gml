/// spawn_enemy(x, y, enemy_id)
x = argument0
y = argument1
eid = argument2

sprite_index = global.enemy_index[# eid, enemy_stat.sprite]
name = global.enemy_index[# eid, enemy_stat.name]
mHp = global.enemy_index[# eid, enemy_stat.hp]
hp = mHp
description = global.enemy_index[# eid, enemy_stat.description]
cut = global.enemy_index[# eid, enemy_stat.cut]
blunt = global.enemy_index[# eid, enemy_stat.blunt]
pierce = global.enemy_index[# eid, enemy_stat.pierce]
magic = global.enemy_index[# eid, enemy_stat.magic]
cut_resist = global.enemy_index[# eid, enemy_stat.cut_resist]
blunt_resist = global.enemy_index[# eid, enemy_stat.blunt_resist]
pierce_resist = global.enemy_index[# eid, enemy_stat.pierce_resist]
magic_resist = global.enemy_index[# eid, enemy_stat.magic_resist]
spd = global.enemy_index[# eid, enemy_stat.spd]
race = global.enemy_index[# eid, enemy_stat.race]
unique_drop = global.enemy_index[# eid, enemy_stat.unique_drop]
drop_rate = global.enemy_index[# eid, enemy_stat.drop_rate]
xp = global.enemy_index[# eid, enemy_stat.xp]
range = global.enemy_index[# eid, enemy_stat.range]

if(eid = enemy.slime or eid = enemy.demonite)
{
    immobile = true
}
if(eid = enemy.guard_hound) 
{
    enraged = false
}
if(eid = enemy.first_knight) 
{
    fortified = false
}

path = path_add()
