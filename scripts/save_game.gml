if(file_exists("save.sav")) file_delete("save.sav")
ini_open("save.sav")

inv_saved = ds_list_write(player.inventory)
spells_saved = ds_list_write(player.spells)
equip_saved = ds_list_write(player.equipped)
perk_list_saved = ds_list_write(player.perks_list)
perks_gained_saved = ds_list_write(player.perks_gained)

ini_write_string("Save1","name",player.name)
ini_write_real("Save1","job",player.job)

ini_write_real("Save1","cur_hp",player.hp)
ini_write_real("Save1","max_hp",player.max_hp)
ini_write_real("Save1","cur_energy",player.energy)
ini_write_real("Save1","max_energy",player.max_energy)
ini_write_real("Save1","strength",player.strength)
ini_write_real("Save1","wisdom",player.wisdom)
ini_write_real("Save1","perception",player.perception)
ini_write_real("Save1","dexterity",player.dexterity)
ini_write_real("Save1","essence",player.essence)
ini_write_real("Save1","highest_floor",player.highest_floor)

ini_write_real("Save1","cur_xp",player.xp)
ini_write_real("Save1","max_xp",player.max_xp)
ini_write_real("Save1","lvl",player.lvl)
ini_write_real("Save1","ammo",player.ammo)
ini_write_real("Save1","kills",player.kills)
ini_write_real("Save1","money",player.money)

ini_write_string("Save1","inv",inv_saved)
ini_write_string("Save1","spells",spells_saved)
ini_write_string("Save1","equip",equip_saved)
ini_write_string("Save1","perks_list",perk_list_saved)
ini_write_string("Save1","perks_gained",perks_gained_saved)

ini_write_real("Save1","total_money",player.total_money)
ini_write_real("Save1","days_passed",player.days)

ini_write_real("Save1","dmg_dealt", player.total_dmg_dealt)
ini_write_real("Save1","dmg_taken", player.total_dmg)
ini_write_real("Save1", "hour", controller.hour)
ini_write_real("Save1", "min", controller.minute)

/*ini_write_real("Save1","weapon",player.weapon)
ini_write_real("Save1","armor",player.armor)
ini_write_real("Save1","shield",player.shield)
*/

ini_close()
