/// add_gun(item_id, name, description, cut, blunt, pierce, magic, hands, ammo_used, accuracy, effective_range, worth, sprite, spawn_id, tier)
var iid = argument[0]

global.item_index[# iid, item_stat.name] = argument[1]
global.item_index[# iid, item_stat.description] = argument[2]
global.item_index[# iid, item_stat.cut] = argument[3]
global.item_index[# iid, item_stat.blunt] = argument[4]
global.item_index[# iid, item_stat.pierce] = argument[5]
global.item_index[# iid, item_stat.magic] = argument[6]
global.item_index[# iid, item_stat.hands] = argument[7]
global.item_index[# iid, item_stat.ammo_used] = argument[8]
global.item_index[# iid, item_stat.accuracy] = argument[9]
global.item_index[# iid, item_stat.range] = argument[10]
global.item_index[# iid, item_stat.worth] = argument[11]
global.item_index[# iid, item_stat.sprite] = argument[12]
global.item_index[# iid, item_stat.spawn_id] = argument[13]
global.item_index[# iid, item_stat.tier] = argument[14]
global.item_index[# iid, item_stat.race_adv] = enemy_race.none

global.item_index[# iid, item_stat.wep_type] = weapon_type.gun

if(argument[1] != "None") global.item_index[# iid, item_stat.type] = item_type.weapon
else global.item_index[# iid, item_stat.type] = "None"
