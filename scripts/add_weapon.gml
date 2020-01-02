/// add_weapon(item_id, name, description, cut, blunt, pierce, magic, hands, wep_type, enchanted, worth, sprite, spawn_id, tier, *race_adv)
var iid = argument[0]

global.item_index[# iid, item_stat.name] = argument[1]
global.item_index[# iid, item_stat.description] = argument[2]
global.item_index[# iid, item_stat.cut] = argument[3]
global.item_index[# iid, item_stat.blunt] = argument[4]
global.item_index[# iid, item_stat.pierce] = argument[5]
global.item_index[# iid, item_stat.magic] = argument[6]
global.item_index[# iid, item_stat.hands] = argument[7]
global.item_index[# iid, item_stat.wep_type] = argument[8]
global.item_index[# iid, item_stat.enchanted] = argument[9]
global.item_index[# iid, item_stat.worth] = argument[10]
global.item_index[# iid, item_stat.sprite] = argument[11]
global.item_index[# iid, item_stat.spawn_id] = argument[12]
global.item_index[# iid, item_stat.tier] = argument[13]
if(argument_count >= 15) global.item_index[# iid, item_stat.race_adv] = argument[14]
else global.item_index[# iid, item_stat.race_adv] = enemy_race.none

if(argument[1] != "None") global.item_index[# iid, item_stat.type] = item_type.weapon
else global.item_index[# iid, item_stat.type] = "None"
