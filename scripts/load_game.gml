ini_open("save.sav")

inv_loaded = ds_list_create()
spells_loaded = ds_list_create()
equip_saved = ds_list_create()


name = ini_read_string("Save1","name","Toppler")
job = ini_read_real("Save1","job",class.adventurer)

hp = ini_read_real("Save1","cur_hp",100)
max_hp = ini_read_real("Save1","max_hp",100)
energy = ini_read_real("Save1","cur_energy",30)
max_energy = ini_read_real("Save1","max_energy",30)
strength = ini_read_real("Save1","strength",5)
wisdom = ini_read_real("Save1","wisdom",5)
perception = ini_read_real("Save1","perception",5)
dexterity = ini_read_real("Save1","dexterity",5)
essence = ini_read_real("Save1","essence",0)
highest_floor = ini_read_real("Save1","highest_floor",1)
status = ini_read_string("Save1","status","OK")

xp = ini_read_real("Save1","cur_xp",0)
max_xp = ini_read_real("Save1","max_xp",30)
lvl = ini_read_real("Save1","lvl",1)
ammo = ini_read_real("Save1","ammo",0)
kills = ini_read_real("Save1","kills",0)
money = ini_read_real("Save1","money",100)

inv_string = ini_read_string("Save1","inv","")
spells_string = ini_read_string("Save1","spells","")
equip_string = ini_read_string("Save1","equip","")
perks_list_string = ini_read_string("Save1","perks_list","")
perks_gained_string = ini_read_string("Save1","perks_gained","")

days = ini_read_real("Save1","days_passed",0)
total_money = ini_read_real("Save1","total_money",100)

total_dmg = ini_read_real("Save1","dmg_taken",0)
total_dmg_dealt = ini_read_real("Save1","dmg_dealt",0)

controller.hour = ini_read_real("Save1","hour",8)
controller.minute = ini_read_real("Save1","min",0)

ds_list_read(inventory,inv_string)
ds_list_read(spells, spells_string)
ds_list_read(equipped, equip_string)
ds_list_read(perks_list, perks_list_string)
ds_list_read(perks_gained, perks_gained_string)

ini_close()
