/// add_class(class_id, name, description, hp, energy, strength, dexterity, perception, wisdom, weapon, armor, shield, sprite, passive)

cid = argument0

global.class_index[# cid, class_stat.name] = argument1
global.class_index[# cid, class_stat.description] = argument2
global.class_index[# cid, class_stat.hp] = argument3
global.class_index[# cid, class_stat.energy] = argument4
global.class_index[# cid, class_stat.strength] = argument5
global.class_index[# cid, class_stat.dexterity] = argument6
global.class_index[# cid, class_stat.perception] = argument7
global.class_index[# cid, class_stat.wisdom] = argument8
global.class_index[# cid, class_stat.start_weapon] = argument9
global.class_index[# cid, class_stat.start_armor] = argument10
global.class_index[# cid, class_stat.start_shield] = argument11
global.class_index[# cid, class_stat.sprite] = argument12
global.class_index[# cid, class_stat.passive] = argument13
