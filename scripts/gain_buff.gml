/// gain_buff(buff, time)
bid = argument0
time = argument1

duplicate = false
for(i = 0; i < ds_grid_width(player.buffs); i++)
{
    if(player.buffs[# i, 0] = bid)
    {
        duplicate = true
        break
    }
}

if(!duplicate) ds_grid_resize(player.buffs,ds_grid_width(player.buffs)+1,2)

slot = 0
buff_width = ds_grid_width(player.buffs)

while(slot < buff_width)
{
    if(player.buffs[# slot, 0] = bid or slot = (buff_width-1))
    {
        player.buffs[# slot, 0] = bid
        if(player.buffs[# slot, 1] < 0) player.buffs[# slot, 1] = 0
        player.buffs[# slot, 1] += time
        return true
        exit
    }
    slot++
}
return false
