/// interact_with_player()

if(object_is_ancestor(self.object_index, enemy_parent) or self.object_index = enemy_parent)
{
    if(hp > 0)
    {
        //ds_list_insert(player.messages, 0, string(self.name) + "'s cut, beginning: " + string(self.cut))
        with(player) 
        {
            attack(player, other)
        }
        player.moved = 1
    }
}

else if(object_is_ancestor(self.object_index, merchant))
{
    merch = self
    if(merch.name = "Innkeeper")
    {
        instance_create(x,y,rest_menu)
    }
    else
    {
        with(instance_create(x,y,buy_or_sell))
        {
            inventory = other.merch.inventory
            inventory_name = other.merch.inventory_name
        }
    }
}
else if(object_is_ancestor(self.object_index, breakable))
{
    if(!self.broken)
    {
        break_drop_chance = irandom(99) + 1
        self.image_index = self.image_number-1
        if(break_drop_chance < 65)
        {
            ds_list_insert(player.messages, 0, self.full_text)
            if(self.item_drop = item_parent)
            {
                spawn_item(self.iid)
            }
            else instance_create(self.x, self.y, self.item_drop)
        }
        else ds_list_insert(player.messages, 0, self.empty_text)
        broken = true
        player.moved = 1  
        player.x = player.xprevious
        player.y = player.yprevious      
    }
}
