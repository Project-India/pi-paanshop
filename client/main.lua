local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
PlayerJob = {}

local onDuty = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "paan" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

Citizen.CreateThread(function()
    PaanShop = AddBlipForCoord(377.83, -832.13, 29.32)
    SetBlipSprite (PaanShop, 267)
    SetBlipDisplay(PaanShop, 4)
    SetBlipScale  (PaanShop, 0.8)
    SetBlipAsShortRange(PaanShop, true)
    SetBlipColour(PaanShop, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("PaanShop")
    EndTextCommandSetBlipName(PaanShop)
end) 

RegisterNetEvent("pi-paanshop:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("pi-paanshop:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "paantray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "paantray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("pi-paanshop:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "paanstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "paanstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("pi-paanshop:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "paanstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "paanstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

--Meal Creations
RegisterNetEvent("pi-paanshop:PaanPack", function()
		local randomToy = math.random(1,10)
		--remove box
		TriggerServerEvent('QBCore:Server:RemoveItem', "paan-pack", 1)
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "masala-paan", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "sweet-paan", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "chocolate-paan", 1)
end)

RegisterNetEvent("pi-paanshop:CreatePaanPack", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('pi-paanshop:server:get:ingredientPaanPack', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making A Pack Of Paans..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "masala-paan", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "sweet-paan", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "chocolate-paan", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "paan-pack", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["paan-pack"], "add")
                    QBCore.Functions.Notify("You made a A Pack Of Paans", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the items to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("pi-paanshop:MasalaPaan", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('pi-paanshop:server:get:ingredientMasalaPaan', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Masala Paan..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "supari", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "tobacco", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "mint", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "mukhwass", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "paan-leaves", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "masala-paan", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["masala-paan"], "add")
                    QBCore.Functions.Notify("You made a Masala Paan", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)


RegisterNetEvent("pi-paanshop:SweetPaan", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('pi-paanshop:server:get:ingredientSweetPaan', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making A Sweet Paan..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "gulkand", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "cherry", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "mint", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "mukhwass", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "paan-leaves", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "sweet-paan", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sweet-paan"], "add")
                    QBCore.Functions.Notify("You made a Sweet Paan", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("pi-paanshop:ChocolatePaan", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('pi-paanshop:server:get:ingredientChocolatePaan', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making A Chocolate Paan..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "chocolate", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "cherry", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "mint", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "vanilla-essence", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "paan-leaves", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "chocolate-paan", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chocolate-paan"], "add")
                   	QBCore.Functions.Notify("You made a Chocolate Paan", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
			end
		end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)
   
RegisterNetEvent("pi-paanshop:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "PaanShop", Config.Items)
end)


RegisterNetEvent("pi-paanshop:collectpaanleaves", function()
    if onDuty then
				QBCore.Functions.Progressbar("pickup_sla", "Picking Up Paan Leaves..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:AddItem', "paan-leaves", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["paan-leaves"], "add")
                   	QBCore.Functions.Notify("You Picked Up Paan Leaves", "success")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)
