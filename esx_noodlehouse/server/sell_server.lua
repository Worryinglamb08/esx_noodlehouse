ESX                = nil
PlayersHarvesting  = {}
PlayersCrafting    = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local function Craft(source)

	SetTimeout(1000, function()

		if PlayersCrafting[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local ViandeQuantity = xPlayer.getInventoryItem('ramen').count

			if ViandeQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de ramen')			
			else   
                xPlayer.removeInventoryItem('ramen', 1)
				xPlayer.addMoney(150)
				
				Craft(source)
			end
		end
	end)
end

RegisterServerEvent('esx_noodlehouse:startVente')
AddEventHandler('esx_noodlehouse:startVente', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Vente de ~b~ramen~s~...')
	Craft(_source)
end)

RegisterServerEvent('esx_noodlehouse:stopVente')
AddEventHandler('esx_noodlehouse:stopVente', function()
	local _source = source
	PlayersCrafting[_source] = false
end)