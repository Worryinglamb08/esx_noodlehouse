ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'noodlehouse', Config.MaxInService)
end

--TriggerEvent('esx_phone:registerNumber', 'noodlehouse', _U('noodlehouse_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'noodlehouse', 'noodlehouse', 'society_noodlehouse', 'society_noodlehouse', 'society_noodlehouse', {type = 'private'})



RegisterServerEvent('esx_noodlehousejob:getStockItem')
AddEventHandler('esx_noodlehousejob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_noodlehouse', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

RegisterServerEvent('esx_noodlehousejob:Billing')--Not Working...
AddEventHandler('esx_noodlehousejob:Billing', function(money, player)

  local xPlayer = ESX.GetPlayerFromId(source)
  local xTarget = ESX.GetPlayerFromId(player)
  local valor = money

    if xTarget.getMoney() >= valor then
      xTarget.removeMoney(valor)
      xPlayer.addMoney(valor)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, "Votre client n'a pas cet argent, valeur: " ..valor)
	  TriggerClientEvent('esx:showNotification', xTarget.source, "Tu n'as pas cet argent, valeur: " ..valor)
    end
end)

ESX.RegisterServerCallback('esx_noodlehousejob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_noodlehouse', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_noodlehousejob:putStockItems')
AddEventHandler('esx_noodlehousejob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_noodlehouse', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_noodlehousejob:getFridgeStockItem')
AddEventHandler('esx_noodlehousejob:getFridgeStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_noodlehouse_fridge', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)

  end)

end)

ESX.RegisterServerCallback('esx_noodlehousejob:getFridgeStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_noodlehouse_fridge', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_noodlehousejob:putFridgeStockItems')
AddEventHandler('esx_noodlehousejob:putFridgeStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_noodlehouse_fridge', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)

  end)

end)


RegisterServerEvent('esx_noodlehousejob:buyItem')
AddEventHandler('esx_noodlehousejob:buyItem', function(itemName, price, itemLabel)

    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_noodlehouse', function(account)
        societyAccount = account
      end)
    
    if societyAccount ~= nil and societyAccount.money >= price then
        if qtty < limit then
            societyAccount.removeMoney(price)
            xPlayer.addInventoryItem(itemName, 1)
            TriggerClientEvent('esx:showNotification', _source, _U('bought') .. itemLabel)
        else
            TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
        end
    else
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
    end

end)


RegisterServerEvent('esx_noodlehousejob:craftingCoktails')
AddEventHandler('esx_noodlehousejob:craftingCoktails', function(Value)

    local _source = source
    local escolha = Value       
		if escolha == "soba" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('sobasurgele').count
            local bethQuantity      = xPlayer.getInventoryItem('bouillonpoisson').count
            local gammaQuantity      = xPlayer.getInventoryItem('fromage').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez de Soba Surgelé")
            elseif bethQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez de Bouillon de poisson")
            elseif gammaQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez de fromage")
            else
              TriggerClientEvent('esx:showNotification', _source, "Faire cuire le Soba Surgelé")
              TriggerClientEvent('esx_noodlehouse:StartCookAnimation', _source)
                    Citizen.Wait(20000)
                    TriggerClientEvent('esx_noodlehouse:StopCookAnimation', _source)
                    TriggerClientEvent('esx:showNotification', _source, "Vous avez fait un bol de Soba!")
                    xPlayer.removeInventoryItem('sobasurgele', 1)
                    xPlayer.removeInventoryItem('bouillonpoisson', 1)
                    xPlayer.removeInventoryItem('fromage', 1)
                    xPlayer.addInventoryItem('soba', 1)
            end
		elseif escolha == "ramen" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('ramensurgele').count
            local bethQuantity      = xPlayer.getInventoryItem('rondelleporc').count
            local bethQuantity2      = xPlayer.getInventoryItem('bouillonboeuf').count
            local gammaQuantity      = xPlayer.getInventoryItem('tomate').count
            local gammaQuantity2      = xPlayer.getInventoryItem('oeuf').count

            if alephQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez de Ramen Surgelé")
            elseif bethQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez de Rondelle de Porc")
            elseif bethQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez de Bouillon de Boeuf")
            elseif gammaQuantity < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez de tomate")
            elseif gammaQuantity2 < 1 then
                TriggerClientEvent('esx:showNotification', _source, "Vous n'avez pas assez d'oeuf")
            else
              TriggerClientEvent('esx:showNotification', _source, "Faire cuire les Ramen")
              TriggerClientEvent('esx_noodlehouse:StartCookAnimation', _source)
                    Citizen.Wait(25000)
              TriggerClientEvent('esx_noodlehouse:StopCookAnimation', _source)   
                    TriggerClientEvent('esx:showNotification', _source, "Vous avez fait un bol de Ramen!")
                    xPlayer.removeInventoryItem('ramensurgele', 1)
					          xPlayer.removeInventoryItem('rondelleporc', 2)
                    xPlayer.removeInventoryItem('bouillonboeuf', 1)
                    xPlayer.removeInventoryItem('tomate', 1)
                    xPlayer.removeInventoryItem('oeuf', 1)
                    xPlayer.addInventoryItem('ramen', 1)
            end
		elseif escolha == "rondelleporc4" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('rondelleporc').count

            if alephQuantity < 4 then
                TriggerClientEvent('esx:showNotification', _source, "Vous avez besoin de plus de Rondelles de porc")
            else
              TriggerClientEvent('esx:showNotification', _source, "Faire cuire les Rondelles de porc")
              TriggerClientEvent('esx_noodlehouse:StartCookAnimation', _source)
                    Citizen.Wait(20000)
                    TriggerClientEvent('esx_noodlehouse:StopCookAnimation', _source)
                    TriggerClientEvent('esx:showNotification', _source, "Vous avez fait des Rondelles de porc")
                    xPlayer.removeInventoryItem('rondelleporc', 4)
                    xPlayer.addInventoryItem('rondelleporc4', 1)
            end
    elseif escolha == "rondelleporc10" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('rondelleporc').count

            if alephQuantity < 10 then
                TriggerClientEvent('esx:showNotification', _source, "Vous avez besoin de plus de Rondelles de porc")
            else
              TriggerClientEvent('esx:showNotification', _source, "Faire cuire les Rondelles de porc")
              TriggerClientEvent('esx_noodlehouse:StartCookAnimation', _source)
                    Citizen.Wait(20000)
                    TriggerClientEvent('esx_noodlehouse:StopCookAnimation', _source)
                    TriggerClientEvent('esx:showNotification', _source, "Vous avez fait des Rondelles de porc")
                    xPlayer.removeInventoryItem('rondelleporc', 10)
                    xPlayer.addInventoryItem('rondelleporc10', 1)
            end
    elseif escolha == "nouilles" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('sobasurgele').count

            if alephQuantity < 2 then
                TriggerClientEvent('esx:showNotification', _source, "Vous avez besoin de plus de Soba surgelé")
            else
              TriggerClientEvent('esx:showNotification', _source, "Faire cuire le Soba Surgelé")
              TriggerClientEvent('esx_noodlehouse:StartCookAnimation', _source)
                    Citizen.Wait(20000)
                    TriggerClientEvent('esx_noodlehouse:StopCookAnimation', _source)
                    TriggerClientEvent('esx:showNotification', _source, "Vous avez fait des Nouilles")
                    xPlayer.removeInventoryItem('sobasurgele', 2)
                    xPlayer.addInventoryItem('nouilles', 1)
            end
		else
			TriggerClientEvent('esx:showNotification', _source, "Rip ~r~ERRO 404~w~")
		end
end)

RegisterServerEvent('esx_noodlehousejob:shop')
AddEventHandler('esx_noodlehousejob:shop', function(item, valor)

    local _source = source
    local xPlayer           = ESX.GetPlayerFromId(_source)
	local comida = item
	local preco = valor
	if xPlayer.getMoney() >= preco then
        xPlayer.removeMoney(preco)
        xPlayer.addInventoryItem(comida, 1)
	end
end)

ESX.RegisterServerCallback('esx_noodlehousejob:getVaultWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_noodlehouse', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_noodlehousejob:addVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_noodlehouse', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_noodlehousejob:removeVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_noodlehouse', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_noodlehousejob:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)
