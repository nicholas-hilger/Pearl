/// add_food(item_id, name, description, hunger_gain, str_gain, wis_gain, dex_gain, per_gain, health_gain, worth, sprite, spawn_id)

iid = argument0

global.item_index[# iid, item_stat.name] = argument1
global.item_index[# iid, item_stat.description] = argument2
global.item_index[# iid, item_stat.hunger_gain] = argument3
global.item_index[# iid, item_stat.str_gain] = argument4
global.item_index[# iid, item_stat.wis_gain] = argument5
global.item_index[# iid, item_stat.dex_gain] = argument6
global.item_index[# iid, item_stat.per_gain] = argument7
global.item_index[# iid, item_stat.health_gain] = argument8
global.item_index[# iid, item_stat.worth] = argument9
global.item_index[# iid, item_stat.sprite] = argument10
global.item_index[# iid, item_stat.spawn_id] = argument11

global.item_index[# iid, item_stat.type] = item_type.food
global.item_index[# iid, item_stat.tier] = 0
