/// add_tome(tome_id, name, description, spell, worth, sprite, spawn_id)

tid = argument0

global.item_index[# tid, item_stat.name] = argument1
global.item_index[# tid, item_stat.description] = argument2
global.item_index[# tid, item_stat.spell_taught] = argument3
global.item_index[# tid, item_stat.worth] = argument4
global.item_index[# tid, item_stat.sprite] = argument5
global.item_index[# tid, item_stat.spawn_id] = argument6

global.item_index[# tid, item_stat.type] = item_type.tome
global.item_index[# tid, item_stat.tier] = 9
