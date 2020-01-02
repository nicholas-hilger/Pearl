for(i = 0; i < ds_grid_width(buffs); i++)
{
    if(ds_grid_get(buffs, i,0) = buff.none)
    {
        max_slot = i
        break
    }
}
if(room = dungeon)
{
    for(i = 0; i < ds_grid_width(buffs); i++)
    {
        cur_buff = ds_grid_get(buffs, i, 0)
        cur_time = ds_grid_get(buffs, i, 1)
        if(buffs[# i, 0] != buff.none) ds_grid_set(buffs, i, 1, cur_time-1)
        if(cur_buff = buff.health_gain) hp++
        if(cur_buff = buff.energy_gain) energy++
        if(ds_grid_get(buffs, i, 1) <= 0)
        {
            ds_grid_set(buffs, i, 0, buff.none)
            ds_grid_set(buffs, i, 1, 0)
            for(j = 0; j < ds_grid_width(buffs)-1; j++)
            {
                if(ds_grid_get(buffs, j, 0) = buff.none)
                {
                    ds_grid_set(buffs, j, 0, ds_grid_get(buffs,j+1,0))
                    ds_grid_set(buffs, j, 1, ds_grid_get(buffs,j+1,1)-1)
                    ds_grid_set(buffs, j+1, 0, buff.none)
                    ds_grid_set(buffs, j+1, 1, 0)
                }
            }
            ds_grid_resize(buffs,ds_grid_width(buffs)-1,2)
        }
    }
}
