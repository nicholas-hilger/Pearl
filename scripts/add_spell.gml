/// add_spell(item_id, name, description, base_damage, energy_cost, spell_type, object, *essence_cost)

iid = argument[0]

global.spell_index[# iid, spell_stat.name] = argument[1]
global.spell_index[# iid, spell_stat.description] = argument[2]
global.spell_index[# iid, spell_stat.base_damage] = argument[3]
global.spell_index[# iid, spell_stat.energy_cost] = argument[4]
global.spell_index[# iid, spell_stat.spell_type] = argument[5]
global.spell_index[# iid, spell_stat.object] = argument[6]

if(argument_count >= 8) global.spell_index[# iid, spell_stat.essence_cost] = argument[7]
else global.spell_index[# iid, spell_stat.essence_cost] = 0
