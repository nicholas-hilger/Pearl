/// add_shield(item_id, name, description, block, mitigated, worth, sprite, spawn_id, tier)

iid = argument0

global.item_index[# iid, item_stat.name] = argument1
global.item_index[# iid, item_stat.description] = argument2
global.item_index[# iid, item_stat.block] = argument3
global.item_index[# iid, item_stat.mitigated] = argument4
global.item_index[# iid, item_stat.worth] = argument5
global.item_index[# iid, item_stat.sprite] = argument6
global.item_index[# iid, item_stat.spawn_id] = argument7
global.item_index[# iid, item_stat.tier] = argument8

global.item_index[# iid, item_stat.type] = item_type.shield
