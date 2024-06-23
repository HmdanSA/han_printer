local RSGCore = exports['rsg-core']:GetCoreObject()
local blip

RegisterNetEvent('han_printer:client:UseDocument', function(ItemData)
    local DocumentUrl = ItemData.info.url ~= nil and ItemData.info.url or false
    SendNUIMessage({
        action = "open",
        url = DocumentUrl
    })
    SetNuiFocus(true, false)
end)

-- NUI

RegisterNUICallback('SaveDocument', function(data, cb)
    if data.url then
        TriggerServerEvent('han_printer:server:SaveDocument', data.url)
    end
    cb('ok')
    RSGCore.Functions.Notify("Printing successfully", "success", 5000)
end)

RegisterNUICallback('CloseDocument', function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNetEvent('han_printer:printer',function()
    SendNUIMessage({
        action = "start"
    })
    SetNuiFocus(true, true)
end)

Citizen.CreateThread(function()
        for print,v in pairs(Config.print) do
            exports['rsg-core']:createPrompt(v.name, v.coords, RSGCore.Shared.Keybinds['J'], v.label, {
                type = 'client',
                event = 'han_printer:printer',
                args = {},
            })
        if v.blip == true then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(blip, -1031152097)
            SetBlipScale(blip, Config.blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.blip.blipName)
        end
    end
end)