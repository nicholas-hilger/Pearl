/// add_perk(pid, name, short_description, description, perk_id)

pid = argument0

global.perk_index[# pid, perk_stats.name] = argument1
global.perk_index[# pid, perk_stats.short_description] = argument2
global.perk_index[# pid, perk_stats.description] = argument3
global.perk_index[# pid, perk_stats.perk_id] = argument4
