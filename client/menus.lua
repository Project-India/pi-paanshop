local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = true
PlayerJob = {}

local onDuty = false

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("PaanDuty", vector3(375.74, -824.41, 28.36), 1.0, 1.0, {
		name = "PaanDuty",
		heading = 354.87,
		debugPoly = false,
		minZ=28.0,
		maxZ=30.0,
	}, {
		options = {
		    {  
			event = "pi-paanshop:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "paan",
		    },
		},
		distance = 1.5
	})

		exports['qb-target']:AddBoxZone("paan_tray_1", vector3(377.2, -827.38, 28.49), 1.0, 1.0, {
			name = "paan_tray_1",
			heading = 180.46,
			debugPoly = false,
			minZ=28.0,
			maxZ=30.0,
		}, {
			options = {
			    {
				event = "pi-paanshop:Tray1",
				icon = "far fa-clipboard",
				label = "Tray",
			    },
			},
			distance = 1.5
		})

         exports['qb-target']:AddBoxZone("paanfridge", vector3(383.62, -819.69, 28.34), 1.8, 0.7, {
            name="paanfridge",
            heading=171.92,
            debugPoly=false,
            minZ=28.0,
            maxZ=31.0,
        }, {
                options = {
                    {
                        event = "pi-paanshop:OrderMenu",
                        icon = "fas fa-laptop",
                        label = "Order Ingredients!",
                        job = "paan",
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("paandisplay", vector3(377.25, -825.54, 28.17), 0.7, 1.8, {
            name="paandisplay",
            heading=181.62,
            debugPoly=false,
            minZ=27.0,
            maxZ=29.8,
        }, {
                options = {
                    {
                        event = "pi-paanshop:Storage",
                        icon = "fas fa-box",
                        label = "Storage",
                        job = "paan",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("craftpaan", vector3(379.81, -819.73, 28.78), 1.8, 0.7, {
            name="craftpaan",
            heading=171.92,
            debugPoly=false,
            minZ=28.0,
            maxZ=31.0,
        }, {
                options = {
                    {
                        event = "pi-paanshop:PaanMenu",
                        icon = "fas fa-cheeseburger",
                        label = "Make Paan Here",
                        job = "paan",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("Paan_register_1", vector3(375.54, -827.26, 28.43), 0.5, 0.4, {
            name="Paan_register_1",
            debugPoly=false,
            heading=0.57,
            minZ=29.0,
            maxZ=30.5,
        }, {
                options = {
                    {
                        event = "pi-paanshop:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "paan",
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("Paan_register_2", vector3(380.24, -827.35, 28.48), 0.6, 0.5, {
            name="Paan_register_2",
            debugPoly=false,
            heading=302,
            minZ=29.0,
            maxZ=30.0,
            }, {
                    options = {
                        {
                            event = "pi-paanshop:bill",
                            parms = "2",
                            icon = "fas fa-credit-card",
                            label = "Charge Customer",
                            job = "paan",
                        },
                    },
                    distance = 1.5
                })  
        exports['qb-target']:AddTargetModel("bkr_prop_weed_med_01a", {
            options = {
                {
                    type = "client",
                    event = "pi-paanshop:collectpaanleaves",
                    icon = "fas fa-apple-alt",
                    label = "Pick Paan Leaves",
                    item = "weapon_knife",
                    job = "paan",
                },
            },
            distance = 2.5
        })
        exports['qb-target']:AddTargetModel("a_m_y_beachvesp_01", {
            options = {
                {
					type = "client",
					event = "garage:PaanShopGarage",
					icon = "fas fa-car",
					label = "Paan Shop Garage",
					job = "paan",
                },
            },
            distance = 2.5
        })
end)


-- NH - Context --
RegisterNetEvent('pi-paanshop:PaanMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = "Paan Menu",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },

        {
            header = "Masala Paan",
            txt = "Supari , Tobacco , Mint , Mukhwass , Paan Leaves , Chuna",
            params = {
                event = "pi-paanshop:MasalaPaan",
                args = {
                    number = 1,
                }
            }
        },
        {
            header = "Sweet Paan",
            txt = "Gulkand , Cherry , Mint , Mukhwass , Paan Leaves , Chuna",
            params = {
                event = "pi-paanshop:SweetPaan",
                args = {
                    number = 2,
                }
            }
        },
        {
            header = "Chocolate Paan",
            txt = "Chocolate , Cherry , Mint , Vanilla Essence , Paan Leaves , Chuna",
            params = {
                event = "pi-paanshop:ChocolatePaan",
                args = {
                    number = 3,
                }
            }
        },
        {
            header = "All in One Paan Pack",
            txt = "A Pack Of Paans",
            params = {
                event = "pi-paanshop:CreatePaanPack",
                args = {
                    number = 4,
                }
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "",
                args = {
                    number = 5,
                }
            }
        },
    })
end)

RegisterNetEvent('pi-paanshop:OrderMenu', function(data)

    exports['qb-menu']:openMenu({
       {
           header = "Fridge",
           isMenuHeader = true, -- Set to true to make a nonclickable title
       },

       {
           header = "Purchase Ingredients",
           txt = "Order Items",
           params = {
               event = "pi-paanshop:shop", 
               args = {
                   number = 0,
               }
           }
       },
       {
           header = "Fridge",
           txt = "Store items in the fridge",
           params = {
               event = "pi-paanshop:Storage2",
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

-- Till Stuff --
RegisterNetEvent("pi-paanshop:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Cash Register",
        submitText = "Charge Customer",
        inputs = {
            {
                type = 'number',
                name = 'id',
                text = 'Magic Number',
                isRequired = true

            },
            {
                type = 'number',
                name = 'amount',
                text = '$0.00',
                isRequired = true

            }
        }
    })
    if bill then
        if not bill.id or not bill.amount then return end
        TriggerServerEvent("pi-paanshop:bill:player", bill.id, bill.amount)
    end
end)















