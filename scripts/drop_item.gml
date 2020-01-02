ds_list_insert(player.messages, 0, "You drop the " + string(global.item_index[# ds_list_find_value(player.inventory, index), item_stat.name]) + ".")

with(instance_create(player.x,player.y,item_parent)) 
{   
    dropped = true
    iid = ds_list_find_value(player.inventory, other.index)
    sprite_index = global.item_index[# iid, item_stat.sprite]
    name = global.item_index[# iid, item_stat.name]
}
ds_list_delete(player.inventory,index)
if(ds_list_size(player.inventory) = 0) ds_list_add(player.inventory, item.none)
if(index > 0) index--
else index = 0
