ini_open("config.cfg")

global.music_vol = ini_read_real("Config", "music_vol", 0.5)
global.sfx_vol = ini_read_real("Config", "sfx_vol", 0.5)
global.loot_pickup = ini_read_real("Config", "loot_pickup", true)
global.fullscreen = ini_read_real("Config", "fullscreen", true)
global.animation_size = ini_read_real("Config", "anim_size", 1)
global.show_hp_bars = ini_read_real("Config", "show_hp", true)
global.item_notifications = ini_read_real("Config", "item_notes", true)
global.show_elite_names = ini_read_real("Config", "elite_names", true)
global.loot_particles = ini_read_real("Config", "loot_paritcles", true)

window_set_fullscreen(global.fullscreen)

ini_close()
