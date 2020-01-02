/// spawn_item(item_id)
iid = argument0
 
with(instance_create(x,y,item_parent)) 
{
    dropped = true
    iid = other.iid
    sprite_index = global.item_index[# iid, item_stat.sprite]
    name = global.item_index[# iid, item_stat.name]
}
