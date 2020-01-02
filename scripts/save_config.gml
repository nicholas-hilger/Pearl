if(file_exists("config.cfg")) file_delete("config.cfg")
ini_open("config.cfg")

ini_write_real("Config", "music_vol", global.music_vol)
ini_write_real("Config", "sfx_vol", global.sfx_vol)
ini_write_real("Config", "loot_pickup", global.loot_pickup)
ini_write_real("Config", "fullscreen", global.fullscreen)
ini_write_real("Config", "anim_size", global.animation_size)
ini_write_real("Config", "show_hp", global.show_hp_bars)
ini_write_real("Config", "item_notes", global.item_notifications)
ini_write_real("Config", "elite_names", global.show_elite_names)
ini_write_real("Config", "loot_particles", global.loot_particles)

ini_close()
