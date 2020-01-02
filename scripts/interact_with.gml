/// interact_with(obj)

obj = argument0
ox = obj.x
oy = obj.y

if(obj = interactable)
{
    attack(player, instance_place(ox, oy, obj))
    player.moved = 1
}

else if(object_is_ancestor(obj, merchant))
{
    merch = instance_place(ox, oy, obj)
    with(instance_create(x,y,buy_or_sell))
    {
        inventory = other.merch.inventory
        inventory_name = other.merch.inventory_name
    }
}
