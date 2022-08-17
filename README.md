# pi-paanshop
Paan Shop Job For your server

Me
https://github.com/Project-India
# Support

Join Our Server For Support
https://discord.gg/Kd5B3KPnTv

# Preview

(https://youtu.be/StsU8jXeTWQ)


## Dependencies :

[QBCore Framework](https://github.com/qbcore-framework/qb-core)

[PolyZone](https://github.com/mkafrin/PolyZone)

[qb-target](https://github.com/BerkieBb/qb-target)

[qb-input](https://github.com/qbcore-framework/qb-input)

[qb-menu](https://github.com/qbcore-framework/qb-menu)

[interior](https://www.gta5-mods.com/maps/mlo-legion-weed-clinic)

## Insert into @qb-smallresources --> server --> consumables.lua
```
--Paan Shop

--Food
QBCore.Functions.CreateUseableItem("masala-paan", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("chocolate-paan", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("sweet-paan", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
```



## Insert into @qb-smallresources --> config.lua
```
--Food 

["sweet-paan"] = math.random(35, 54),
["paan-paan"] = math.random(35, 54),
["masala-paan"] = math.random(35, 54),

```

## Insert into @qb-core/shared/items.lua 

```
	--Paan Shop
	["masala-paan"] 				 = {["name"] = "masala-paan", 			 	["label"] = "Masala Paan", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "masala-paan.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["chocolate-paan"] 			     = {["name"] = "chocolate-paan", 			 	["label"] = "Chocolate Paan", 				["weight"] = 300, 		["type"] = "item", 		["image"] = "chocolate-paan.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["sweet-paan"] 				     = {["name"] = "sweet-paan", 			 	["label"] = "Sweet Paan", 					["weight"] = 310, 		["type"] = "item", 		["image"] = "sweet-paan.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
	["paan-pack"] 		 	         = {["name"] = "paan-pack", 			["label"] = "A Pack Of Paans", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "paan-pack.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Amazing Paan Pack with a chance of a toy."},
	
        --Ingredients
	["paan-leaves"] 				 = {["name"] = "paan-leaves", 			 	  	["label"] = "Paan Leaves", 			["weight"] = 125, 		["type"] = "item", 					["image"] = "paan-leaves.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["chuna"] 				 = {["name"] = "chuna", 			 	  	["label"] = "Chuna", 			["weight"] = 125, 		["type"] = "item", 					["image"] = "chuna.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["supari"] 				 	     = {["name"] = "supari", 			 	  	["label"] = "Supari", 			["weight"] = 125, 		["type"] = "item", 					["image"] = "supari.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["tobacco"] 				     = {["name"] = "tobacco", 			 	  	["label"] = "Tobacco", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "tobacco.png", 		    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["mint"] 				         = {["name"] = "mint", 			 	        ["label"] = "Mint", 				["weight"] = 125, 		["type"] = "item", 			["image"] = "mint.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["mukhwass"] 				     = {["name"] = "mukhwass", 			 	    ["label"] = "Mukhwass", 				["weight"] = 125, 		["type"] = "item", 			["image"] = "mukhwass.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["gulkand"] 				 	 = {["name"] = "gulkand", 			 		["label"] = "Gulkand", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "gulkand.png", 	        ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["cherry"] 				         = {["name"] = "cherry", 			 	    ["label"] = "Cherry", 		["weight"] = 1500, 		["type"] = "item", 			["image"] = "cherry.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["chocolate"] 				 	 = {["name"] = "chocolate", 			 		["label"] = "Chocolate", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "chocolate.png", 	        ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["vanilla-essence"] 		     = {["name"] = "vanilla-essence", 			 	 ["label"] = "Vanilla Essence", 		["weight"] = 1500, 		["type"] = "item", 			["image"] = "vanilla-essence.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},


```
## Insert into @qb-core/shared/jobs.lua 
```

    ["paan"] = {
		label = "Paan Shop",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 50
            },
			['1'] = {
                name = "Employee",
                payment = 75
            },
			['2'] = {
                name = "Paan Maker",
                payment = 100
            },
			['3'] = {
                name = "Manager",
                payment = 125
            },
			['4'] = {
                name = "CEO",
				isboss = true,
                payment = 150
            },
        },
		
```



## Insert into @qb-management/client/cl_config.lua
```
Config.BossMenuZones = {
    ['paan'] = {
        { coords = vector3(382.49, -817.22, 28.2), length = 1.15, width = 2.6, heading = 1.57, minZ = 28.00, maxZ = 30.00 },
    },
}
```
```
Config.BossMenus = {
    ['paan'] = {
        vector3(382.48, -816.56, 29.3),
    },
}

```
