music[0] = mus_title
music[1] = mus_tower
music[2] = mus_sargoza



sfx[0] = sfx_blunt
sfx[1] = sfx_pierce
sfx[2] = sfx_cut
sfx[3] = sfx_magic
sfx[4] = sfx_lvl_up
sfx[5] = sfx_shoot
sfx[6] = sfx_miss
sfx[7] = sfx_pickup

for(i = 0; i < array_length_1d(music); i++)
{
    audio_sound_gain(music[i], global.music_vol, 1)
}

for(i = 0; i < array_length_1d(sfx); i++)
{
    audio_sound_gain(sfx[i], global.sfx_vol, 1)
}
