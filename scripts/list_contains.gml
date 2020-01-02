/// list_contains(list, value)

list = argument0
value = argument1

for(i = 0; i < ds_list_size(list); i++)
{
    if(ds_list_find_value(list, i) = value)
    {
        return true
        break
    }
}
return false
