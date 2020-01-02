/// add_armor(item_id, name, description, defense, cut_resist, pierce_resist, blunt_resist, magic_resist, worth, sprite, spawn_id, tier)

iid = argument0

global.item_index[# iid, item_stat.name] = argument1
global.item_index[# iid, item_stat.description] = argument2
global.item_index[# iid, item_stat.defense] = argument3
global.item_index[# iid, item_stat.cut_resist] = argument4
global.item_index[# iid, item_stat.pierce_resist] = argument5
global.item_index[# iid, item_stat.blunt_resist] = argument6
global.item_index[# iid, item_stat.magic_resist] = argument7
global.item_index[# iid, item_stat.worth] = argument8
global.item_index[# iid, item_stat.sprite] = argument9
global.item_index[# iid, item_stat.spawn_id] = argument10
global.item_index[# iid, item_stat.tier] = argument11

global.item_index[# iid, item_stat.type] = item_type.armor
