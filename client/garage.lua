local QBCore = exports['qb-core']:GetCoreObject()

PlayerData = {}
local pedspawned = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
function QBCore.Functions.GetPlayerData(cb)
    if cb then
        cb(QBCore.PlayerData)
    else
        return QBCore.PlayerData
    end
end

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
     	PlayerData.job = job
end)

RegisterNetEvent('QBCore:Player:SetPlayerData')
AddEventHandler('QBCore:Player:SetPlayerData', function(val)
	PlayerData = val
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.GaragePedLocations) do
			local pos = GetEntityCoords(PlayerPedId())	
			local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
			
			if dist < 40 and not pedspawned then
				TriggerEvent('pi-paanshop:spawn:ped', v.coords)
				pedspawned = true
			end
			if dist >= 35 then
				pedspawned = false
				DeletePed(npc)
			end
		end
	end
end)

RegisterNetEvent('pi-paanshop:spawn:ped')
AddEventHandler('pi-paanshop:spawn:ped',function(coords)
	local hash = `a_m_y_beachvesp_01`

	RequestModel(hash)
	while not HasModelLoaded(hash) do 
		Wait(10)
	end

    	pedspawned = true
	npc = CreatePed(5, hash, coords.x, coords.y, coords.z - 1.0, coords.w, false, false)
	FreezeEntityPosition(npc, true)
	SetEntityInvincible(npc, true)	
    	SetBlockingOfNonTemporaryEvents(npc, true)
	loadAnimDict("amb@world_human_cop_idles@male@idle_b") 
	TaskPlayAnim(npc, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0)
end)

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(5)
    end
end

RegisterNetEvent('pi-paanshop:garage')
AddEventHandler('pi-paanshop:garage', function(bs)
    local vehicle = bs.vehicle
    local coords = vector4(369.23, -826.65, 29.29, 178.35)
        if PlayerData.job.name == "paan" then
            if vehicle == 'tunak' then		
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "PAAN"..tostring(math.random(1000, 9999)))
                    exports['ps-fuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.w)
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            end
        else
            QBCore.Functions.Notify('You are not an employee of Paan Shop.', 'error')
        end
end)

RegisterNetEvent('pi-paanshop:storecar')
AddEventHandler('pi-paanshop:storecar', function()
    QBCore.Functions.Notify('Work Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)

RegisterNetEvent('garage:PaanShopGarage', function(data)
    
    exports['qb-menu']:openMenu({
        {
            header = "| Paan Shop Garage |",
            isMenuHeader = true,
        },

        {
            header = "• Rickshaw",
            txt = "Rickshaw",
            params = {
                event = "pi-paanshop:garage",
                args = {
                    vehicle = 'tunak',
                    number = 0,
                }
            }
        },
        {
            header = "• Store Vehicle",
            txt = "Store Vehicle Inside Garage",
            params = {
                event = "pi-paanshop:storecar",
                args = {
                    number = 1,
                }
            }
        },

        {
            header = "close",
            txt = "",
            params = {
                event = "",
                args = {
                    number = 2,
                }
            }
        },	
    })
end)
