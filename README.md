# esx_noodlehouse

# Requirements
- [esx_basicneeds](https://github.com/esx-framework/esx_basicneeds)
- [esx_jobs](https://github.com/esx-framework/esx_jobs)


## Installation
- Import `esx_noodlehouse.sql` and`esx_noodlehouseitems.sql` into your database
- Add this line to your server.cfg somewhere after [esx_basicneeds] & [esx_jobs] :

```
start esx_noodlehouse
start noodlehouse
```

### Add this code in the server file in [esx_basicneeds]

```
ESX.RegisterUsableItem('ramen', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ramen', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_ramen'))
end)
ESX.RegisterUsableItem('soba', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('soba', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 120000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_soba'))
end)
ESX.RegisterUsableItem('rondelleporc4', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rondelleporc4', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 80000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_rondelleporc4'))
end)
ESX.RegisterUsableItem('rondelleporc10', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rondelleporc10', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 950000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_rondelleporc10'))
end)
ESX.RegisterUsableItem('nouilles', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('nouilles', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_nouilles'))
end)
ESX.RegisterUsableItem('the', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('the', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 110000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_the'))
end)
```

### Add this code in the server file in [esx_optionalneeds]

```
ESX.RegisterUsableItem('sake', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sake', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 150000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_sake'))

end)
```

### Add this code in the locales file in [esx_basicneeds]

```
['used_ramen'] = 'vous avez utilisé ~y~1x~s~ ~b~Ramen~s~',
['used_soba'] = 'vous avez utilisé ~y~1x~s~ ~b~Soba~s~',
['used_rondelleporc4'] = 'vous avez utilisé ~y~1x~s~ ~b~Rondelle de Porc x4~s~',
['used_rondelleporc10'] = 'vous avez utilisé ~y~1x~s~ ~b~Rondelle de Porc x10~s~',
['used_nouilles'] = 'vous avez utilisé ~y~1x~s~ ~b~Nouilles~s~',
['used_the'] = 'vous avez utilisé ~y~1x~s~ ~b~Thé~s~',
```

### Add this code in the locales file in [esx_optionalneeds]

```
['used_sake'] = 'Vous avez utilisé 1x ~y~Sake~s~',
```
