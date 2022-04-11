local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
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
  BurgerShot = AddBlipForCoord(-1197.32, -897.655, 13.995)
  SetBlipSprite (BurgerShot, 106)
  SetBlipDisplay(BurgerShot, 4)
  SetBlipScale  (BurgerShot, 0.5)
  SetBlipAsShortRange(BurgerShot, true)
  SetBlipColour(BurgerShot, 75)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName("BurgerShot")
  EndTextCommandSetBlipName(BurgerShot)
end) 

RegisterNetEvent("qb-burgershot:BleederBurger")
AddEventHandler("qb-burgershot:BleederBurger", function()
  if onDuty then
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientBurger', function(HasItems)  
      if HasItems then
        Working = true
        TriggerEvent('inventory:client:busy:status', true)
        QBCore.Functions.Progressbar("pickup_sla", "Making Burgers..", 4000, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = false,
        }, {
          animDict = "mp_common",
          anim = "givetake1_a",
          flags = 8,
        }, {}, {}, function() -- Done
          Working = false
          TriggerEvent('inventory:client:busy:status', false)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-lettuce", 1)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-tomato", 1)
          TriggerServerEvent('QBCore:Server:AddItem', "burger-bleeder", 1)
      QBCore.Functions.Notify("You made a Bleeder Burger", "success")
        end, function()
          TriggerEvent('inventory:client:busy:status', false)
          QBCore.Functions.Notify("Cancelled..", "error")
          Working = false
        end)
      else
           QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
      end
    end)
  else 
    QBCore.Functions.Notify("You must be clocked into work", "error")
  end
end)

RegisterNetEvent("qb-burgershot:MoneyShot")
AddEventHandler("qb-burgershot:MoneyShot", function()
  if onDuty then
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientBurger', function(HasItems)  
      if HasItems then
        Working = true
        TriggerEvent('inventory:client:busy:status', true)
        QBCore.Functions.Progressbar("pickup_sla", "Making Burgers..", 4000, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = false,
        }, {
          animDict = "mp_common",
          anim = "givetake1_a",
          flags = 8,
        }, {}, {}, function() -- Done
          Working = false
          TriggerEvent('inventory:client:busy:status', false)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-lettuce", 1)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-tomato", 1)
          TriggerServerEvent('QBCore:Server:AddItem', "burger-moneyshot", 1)
          QBCore.Functions.Notify("You made a MoneyShot Burger", "success")
        end, function()
          TriggerEvent('inventory:client:busy:status', false)
          QBCore.Functions.Notify("Cancelled..", "error")
          Working = false
        end)
      else
           QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
      end
    end)
  else 
    QBCore.Functions.Notify("You must be clocked into work", "error")
  end
end)

RegisterNetEvent("qb-burgershot:HeartStopper")
AddEventHandler("qb-burgershot:HeartStopper", function()
  if onDuty then
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientBurger', function(HasItems)  
      if HasItems then
        Working = true
        TriggerEvent('inventory:client:busy:status', true)
        QBCore.Functions.Progressbar("pickup_sla", "Making Burgers..", 4000, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = false,
        }, {
          animDict = "mp_common",
          anim = "givetake1_a",
          flags = 8,
        }, {}, {}, function() -- Done
          Working = false
          TriggerEvent('inventory:client:busy:status', false)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-lettuce", 1)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-tomato", 1)
          TriggerServerEvent('QBCore:Server:AddItem', "burger-heartstopper", 1)
          QBCore.Functions.Notify("You made a Heart Stopper", "success")
        end, function()
          TriggerEvent('inventory:client:busy:status', false)
          QBCore.Functions.Notify("Cancelled..", "error")
          Working = false
        end)
      else
           QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
      end
    end)
  else 
    QBCore.Functions.Notify("You must be clocked into work", "error")
  end
end)


RegisterNetEvent("qb-burgershot:Torpedo")
AddEventHandler("qb-burgershot:Torpedo", function()
  if onDuty then
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientTorpedo', function(HasItems)  
      if HasItems then
        Working = true
        TriggerEvent('inventory:client:busy:status', true)
        QBCore.Functions.Progressbar("pickup_sla", "Making A Torpedo..", 4000, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = false,
        }, {
          animDict = "mp_common",
          anim = "givetake1_a",
          flags = 8,
        }, {}, {}, function() -- Done
          Working = false
          TriggerEvent('inventory:client:busy:status', false)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
          TriggerServerEvent('QBCore:Server:AddItem', "burger-torpedo", 1)
          QBCore.Functions.Notify("You made a Torpedo Roll", "success")
        end, function()
          TriggerEvent('inventory:client:busy:status', false)
          QBCore.Functions.Notify("Cancelled..", "error")
          Working = false
        end)
      else
           QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
      end
    end)
  else 
    QBCore.Functions.Notify("You must be clocked into work", "error")
  end  
end)

RegisterNetEvent("qb-burgershot:MeatFree")
AddEventHandler("qb-burgershot:MeatFree", function()
  if onDuty then
    QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientMeatfree', function(HasItems)  
      if HasItems then
        Working = true
        TriggerEvent('inventory:client:busy:status', true)
        QBCore.Functions.Progressbar("pickup_sla", "Making A Meat Free Burger..", 4000, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = false,
        }, {
          animDict = "mp_common",
          anim = "givetake1_a",
          flags = 8,
        }, {}, {}, function() -- Done
          Working = false
          TriggerEvent('inventory:client:busy:status', false)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-tomato", 1)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-lettuce", 1)
          TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
          TriggerServerEvent('QBCore:Server:AddItem', "burger-meatfree", 1)
          QBCore.Functions.Notify("You made a Meat Free Burger", "success")
        end, function()
          TriggerEvent('inventory:client:busy:status', false)
          QBCore.Functions.Notify("Cancelled..", "error")
          Working = false
        end)
      else
           QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
      end
    end)
  else 
    QBCore.Functions.Notify("You must be clocked into work", "error")
  end  
end)

RegisterNetEvent("qb-burgershot:SoftDrink")
AddEventHandler("qb-burgershot:SoftDrink", function()
  if onDuty then
  QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
    if HasItem then
       MakeSoftDrink()
    else
      QBCore.Functions.Notify("You don't have any soda syrup..", "error")
    end
    end, 'burger-sodasyrup')
  else
    QBCore.Functions.Notify("You must be clocked into work", "error")
  end
end)

RegisterNetEvent("qb-burgershot:mShake")
AddEventHandler("qb-burgershot:mShake", function()
  if onDuty then
  QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
    if HasItem then
       MakeMShake()
    else
      QBCore.Functions.Notify("You don't have any Milkshake Formula..", "error")
    end
    end, 'burger-mshakeformula')
  else
    QBCore.Functions.Notify("You must be clocked into work", "error")
  end
end)

RegisterNetEvent("qb-burgershot:Fries")
AddEventHandler("qb-burgershot:Fries", function()
  if onDuty then
  QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
    if HasItem then
       MakeFries()
    else
      QBCore.Functions.Notify("You don't have any potatoes..", "error")
    end
    end, 'burger-potato' )
  else
    QBCore.Functions.Notify("You must be clocked into work", "error")
  end
end)


RegisterNetEvent("qb-burgershot:PattyFry")
AddEventHandler("qb-burgershot:PattyFry", function()
  if onDuty then
  QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
    if HasItem then
       MakePatty()
    else
      QBCore.Functions.Notify("You don't have any raw patties..", "error")
    end
    end, 'burger-raw')
  else
    QBCore.Functions.Notify("You must be clocked into work", "error")
  end
end)

RegisterNetEvent("qb-burgershot:DutyB")
AddEventHandler("qb-burgershot:DutyB", function()
  TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-burgershot:Tray1")
AddEventHandler("qb-burgershot:Tray1", function()
  TriggerEvent("inventory:client:SetCurrentStash", "burgertray1")
  TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgertray1", {
    maxweight = 10000,
    slots = 6,
  })
end)

RegisterNetEvent("qb-burgershot:Tray4")
AddEventHandler("qb-burgershot:Tray4", function()
  TriggerEvent("inventory:client:SetCurrentStash", "burgertray4")
  TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgertray4", {
    maxweight = 10000,
    slots = 6,
  })
end)

RegisterNetEvent("qb-burgershot:Tray3")
AddEventHandler("qb-burgershot:Tray3", function()
  TriggerEvent("inventory:client:SetCurrentStash", "burgertray3")
  TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgertray3", {
    maxweight = 10000,
    slots = 6,
  })
end)

RegisterNetEvent("qb-burgershot:Storage")
AddEventHandler("qb-burgershot:Storage", function()
  TriggerEvent("inventory:client:SetCurrentStash", "burgerstorage")
  TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgerstorage", {
    maxweight = 250000,
    slots = 40,
  })
end)

RegisterNetEvent("qb-burgershot:Storage2")
AddEventHandler("qb-burgershot:Storage2", function()
  TriggerEvent("inventory:client:SetCurrentStash", "burgerstorage2")
  TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgerstorage2", {
    maxweight = 250000,
    slots = 40,
  })
end)

-- Functions --
function MakeFries()
TriggerServerEvent('QBCore:Server:RemoveItem', "burger-potato", 1)
QBCore.Functions.Progressbar("pickup", "Frying the fries..", 4000, false, true, {
  disableMovement = true,
  disableCarMovement = false,
  disableMouse = false,
  disableCombat = false,
},{
  animDict = "amb@prop_human_bbq@male@base",
  anim = "base",
  flags = 8,
  }, {
    model = "prop_cs_fork",
    bone = 28422,
    coords = { x = -0.005, y = 0.00, z = 0.00 },
    rotation = { x = 175.0, y = 160.0, z = 0.0 },
  }
)
Citizen.Wait(4000)
TriggerServerEvent('QBCore:Server:AddItem', "burger-fries", 4)
QBCore.Functions.Notify("You made 4 fries", "success")
StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function MakePatty()
  TriggerServerEvent('QBCore:Server:RemoveItem', "burger-raw", 1)
  QBCore.Functions.Progressbar("pickup", "Cooking the Patty..", 4000, false, true, {
    disableMovement = true,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = false,
  },{
    animDict = "amb@prop_human_bbq@male@base",
    anim = "base",
    flags = 8,
  }, {
    model = "prop_cs_fork",
    bone = 28422,
    coords = { x = -0.005, y = 0.00, z = 0.00 },
    rotation = { x = 175.0, y = 160.0, z = 0.0 },
  }    
)
  Citizen.Wait(4000)
  TriggerServerEvent('QBCore:Server:AddItem', "burger-meat", 1)
  QBCore.Functions.Notify("You cooked the meat", "success")
  StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function MakeSoftDrink()
  TriggerServerEvent('QBCore:Server:RemoveItem', "burger-sodasyrup", 1)
  QBCore.Functions.Progressbar("pickup", "Filling a cup..", 4000, false, true, {
    disableMovement = true,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = false,
  })
  Citizen.Wait(4000)
  TriggerServerEvent('QBCore:Server:AddItem', "burger-softdrink", 1)
  QBCore.Functions.Notify("You made a Soda", "success")
  end  

function MakeMShake()
  TriggerServerEvent('QBCore:Server:RemoveItem', "burger-mshakeformula", 1)
  QBCore.Functions.Progressbar("pickup", "Filling up a cup..", 4000, false, true, {
    disableMovement = true,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = false,
  })
  Citizen.Wait(4000)
  TriggerServerEvent('QBCore:Server:AddItem', "burger-mshake", 1)
  QBCore.Functions.Notify("You made a Milkshake", "success")
end  
   
-- Targetting stuff.
Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("Duty", vector3(-1191.19, -900.36, 14.0), 1, 1.2, {
    name = "Duty",
    heading = 32,
    debugPoly = false,
    minZ=14.0,
    maxZ=18.0,
  }, {
    options = {
      {  
        event = "qb-burgershot:DutyB",
        icon = "far fa-clipboard",
        label = "Clock On/Off",
        job = "burgershot",
      },
    },
    distance = 1.5
  })
  
  exports['qb-target']:AddBoxZone("burger_tray_1", vector3(-1196.03, -891.38, 14.0), 1.05, 1.0, {
    name = "burger_tray_1",
    heading = 35.0,
    debugPoly = false,
    minZ=13.8,
    maxZ=14.3,
  }, {
    options = {
      {
        event = "qb-burgershot:Tray1",
        icon = "far fa-clipboard",
        label = "Tray 1",
      },
    },
    distance = 1.5
  })

  exports['qb-target']:AddBoxZone("burger_tray_2", vector3(-1194.98, -893.06, 14.0), 1.05, 1.0, {
    name = "burger_tray_2",
    heading = 35.0,
    debugPoly = false,
    minZ=13.8,
    maxZ=14.3,
  }, {
    options = {
      {
        event = "qb-burgershot:Tray2",
        icon = "far fa-clipboard",
        label = "Tray 2",
      },
    },
    distance = 1.5
  })

  exports['qb-target']:AddBoxZone("burger_tray_3", vector3(-1194.0, -894.37, 14.0), 1.05, 1, {
    name="burger_tray_3",
    heading=35,
    debugPoly=false,
    minZ=14.0,
    maxZ=14.4,
  }, {
    options = {
      {
        event = "qb-burgershot:Tray3",
        icon = "far fa-clipboard",
        label = "Tray 3",
      },
    },
    distance = 1.5
  })
  exports['qb-target']:AddBoxZone("burger_tray_4", vector3(-1193.88, -906.98, 14.0), 1, 1, {
    name="burger_tray_4",
    heading=350,
    debugPoly=false,
    minZ=13.2,
    maxZ=14.2,
  }, {
    options = {
      {
        event = "qb-burgershot:Tray4",
        icon = "far fa-clipboard",
        label = "Tray 4",
      },
    },
    distance = 3.5
  })

  exports['qb-target']:AddBoxZone("burgershotcooker", vector3(-1202.94, -897.38, 14.0), 1.7, 1, {
    name="burgershotcooker",
    heading=126,
    debugPoly=false,
    minZ=13.0,
    maxZ=14.3,
    }, {
      options = {
        {
          event = "qb-burgershot:PattyFry",
          icon = "fas fa-hamburger",
          label = "Cook Burger",
          job = "burgershot",
        },
      },
      distance = 1.5
    })
  



  exports['qb-target']:AddBoxZone("burgershotfryer", vector3(-1202.01, -899.27, 14.0), 2.5, 1.5, {
    name="burgershotfryer",
    heading=126,
    debugPoly=false,
    minZ=13.0,
    maxZ=14.4,
    }, {
      options = {
        {
          event = "qb-burgershot:Fries",
          icon = "fas fa-box",
          label = "Make Fries",
          job = "burgershot",
        },
      },
      distance = 1.5
    })


    exports['qb-target']:AddBoxZone("burgershotdrinks", vector3(-1199.54, -895.52, 14.0), 2.2, 0.6, {
      name="burgershotdrinks",
      heading=34,
      debugPoly=false,
      minZ=13.8,
      maxZ=14.8,
      }, {
        options = {
          {
            event = "nh-context:DrinkMenu",
            icon = "fas fa-filter",
            label = "Make Some Drinks",
            job = "burgershot",
          },
        },
        distance = 1.5
      })

    exports['qb-target']:AddBoxZone("burgershotdrinks2", vector3(-1190.55, -904.67, 14.0), 1.15, 2, {
      name="burgershotdrinks2",
      heading=301,
      debugPoly=false,
      minZ=13.8,
      maxZ=14.8,
      }, {
        options = {
          {
            event = "nh-context:DrinkMenu",
            icon = "fas fa-filter",
            label = "Make Some Drinks",
            job = "burgershot",
          },
        },
        distance = 1.5
      })


     exports['qb-target']:AddBoxZone("burgerfridge", vector3(-1203.71, -895.86, 14.0), 1.6, 1, {
      name="burgerfridge",
      heading=35,
      debugPoly=false,
      minZ=13.0,
      maxZ=15.6,
    }, {
        options = {
          {
            event = "nh-context:OrderMenu",
            icon = "fas fa-laptop",
            label = "Order Ingredients!",
            job = "burgershot",
          },
        },
        distance = 1.5
      })

    exports['qb-target']:AddBoxZone("burgershotdisplay", vector3(-1197.78, -894.45, 14.0), 4.6, 1.2, {
      name="burgershotdisplay",
      heading=34,
      debugPoly=false,
      minZ=13.0,
      maxZ=14.8,
    }, {
        options = {
          {
            event = "qb-burgershot:Storage",
            icon = "fas fa-box",
            label = "Storage",
            job = "burgershot",
          },
        },
        distance = 1.5
      })


    exports['qb-target']:AddBoxZone("craftburger", vector3(-1197.57, -899.41, 14.0), 1.8, 0.7, {
      name="craftburger",
      heading=30,
      debugPoly=false,
      minZ=13.0,
      maxZ=14.4,
    }, {
        options = {
          {
            event = "nh-context:Burgers",
            icon = "fas fa-cheeseburger",
            label = "Burger Work Station",
            job = "burgershot",
          },
        },
        distance = 1.5
      })


    exports['qb-target']:AddBoxZone("BurgerShot_register_1", vector3(-1195.87, -892.71, 14.0), 1, 0.6, {
      name="BurgerShot_register_1",
      debugPoly=false,
      heading=125,
      minZ=14.0,
      maxZ=14.5,
    }, {
        options = {
          {
            event = "qb-burgershot:bill",
            parms = "1",
            icon = "fas fa-credit-card",
            label = "Charge Customer",
            job = "burgershot",
          },
        },
        distance = 1.5
      })

    exports['qb-target']:AddBoxZone("BurgerShot_register_2", vector3(-1194.86, -894.3, 14.0), 1, 0.6, {
      name="BurgerShot_register_2",
      debugPoly=false,
      heading=302,
      minZ=14.1,
      maxZ=14.5,
      }, {
          options = {
            {
              event = "qb-burgershot:bill",
              parms = "2",
              icon = "fas fa-credit-card",
              label = "Charge Customer",
              job = "burgershot",
            },
          },
          distance = 1.5
        })  


    exports['qb-target']:AddBoxZone("BurgerShot_register_3", vector3(-1192.66, -906.42, 14.0), 1, 1, {
      name="BurgerShot_register_3",
      debugPoly=false,
      heading=218,
      minZ=14.0,
      maxZ=14.4,
      }, {
        options = {
          {
            event = "qb-burgershot:bill",
            parms = "3",
            icon = "fas fa-credit-card",
            label = "Charge Customer",
            job = "burgershot",
          },
        },
        distance = 1.5
      })  
end)


-- nh-context stuff.
RegisterNetEvent('nh-context:Burgers', function()
  TriggerEvent('nh-context:createMenu', {
    {
      header = "Available Burgers",
    },
    {
      header = "Moneyshot Burger",
      context = "Bun , Cooked Patty , Tomato , Lettuce",
      event = "qb-burgershot:MoneyShot",
    },
    {
      header = "Meat Free Burger",
      context = "Bun , Tomato , Lettuce",
      event = "qb-burgershot:MeatFree",
    },
    {
      header = "Bleeder Burger",
      context = "Bun , Cooked Patty , Tomato , Lettuce",
      event = "qb-burgershot:BleederBurger",
    },
    {
      header = "The Heart Stopper",
      context = "Bun , Cooked Patty , Tomato , Lettuce",
      event = "qb-burgershot:HeartStopper",
    },
    {
      header = "Torpedo Roll",
      context = "Bun , Cooked Meat",
      event = "qb-burgershot:Torpedo",
    },
  })
end)


RegisterNetEvent('nh-context:OrderMenu', function()
  TriggerEvent('nh-context:createMenu', {
    {
      header = "Fridge",
    },
    {
      header = "Order Items",
      context = "Order New Ingredients!",
      event = "qb-burgershot:shop",
    },
    {
      header = "Open Fridge",
      context = "See what you have in storage",
      event = "qb-burgershot:Storage2",
    },
  })
end)

RegisterNetEvent('nh-context:DrinkMenu', function()
  TriggerEvent('nh-context:createMenu', {
    {
      header = "Drink Menu ",
    },
    {
      header = "Soft Drink",
      context = "Soda Syrup",
      event = "qb-burgershot:SoftDrink",
    },
    {
      header = "Milkshake",
      context = "Milkshake Formula",
      event = "qb-burgershot:mShake",
    },
  })
end)


-- Till Stuff.
RegisterNetEvent("qb-burgershot:bill")
AddEventHandler("qb-burgershot:bill", function()
  local keyboard, id, bill = exports["nh-keyboard"]:Keyboard({
    header = "Create Receipt",
    rows = {
      {
        "Server ID"
      },
      {
        "Amount"
      }
    }
  })
  if keyboard then
    if id and tonumber(bill) then
      TriggerServerEvent("qb-burgershot:bill:player", id, bill)
    end
  end
end)

RegisterNetEvent("qb-burgershot:shop")
AddEventHandler("qb-burgershot:shop", function()
  TriggerServerEvent("inventory:server:OpenInventory", "shop", "burgershot", Config.Items)
end)



