/// check_perks(pid)
//This is only to be used when selecting a perk from the menu.
//Any other perk procs will be done in their context/s via list_contains

pid = argument0

if(pid = perk.sighter) player.perception += 3
if(pid = perk.bigger_brain) player.wisdom += 3
if(pid = perk.faster) player.dexterity += 3
if(pid = perk.stronger) player.strength += 3
if(pid = perk.caffeine_drip) player.max_energy += 5
if(pid = perk.more_blood) player.max_hp += 20

if(pid = perk.promotion) with(player) level_up()

if(pid = perk.champion) 
{
    player.perception += 3
    player.wisdom += 3
    player.dexterity += 3
    player.strength += 3
    player.max_energy += 5
    player.max_hp += 20
}

if(pid = perk.communist)
{
    if(list_contains(player.perks_gained, perk.capitalist))
    {
        capitalist_index = ds_list_find_index(player.perks_gained, perk.capitalist)
        ds_list_delete(player.perks_gained, capitalist_index)
    }
}

if(pid = perk.capitalist)
{
    investment_payout = ((150*player.lvl) + (player.highest_floor*75))
    player.money += investment_payout
    ds_list_insert(player.messages, 0, "Your industrial connections bestow you with " + string(investment_payout) + " Zun!")
    if(list_contains(player.perks_gained, perk.communist))
    {
        communist_index = ds_list_find_index(player.perks_gained, perk.communist)
        ds_list_delete(player.perks_gained, communist_index)
    }
}

if(pid = perk.instant_gratification)
{
    player.strength += 30
    player.dexterity += 30
    player.wisdom += 30
    player.perception += 30
    player.max_hp += 50
    player.max_energy += 10
    player.xp = 0
}
