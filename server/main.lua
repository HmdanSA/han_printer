local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Functions.CreateUseableItem("document", function(source, item)
    TriggerClientEvent('han_printer:client:UseDocument', source, item)
end)

RegisterNetEvent('han_printer:server:SaveDocument', function(url)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local info = {}
    local extension = string.sub(url, -4)
    if url ~= nil then
        if extension then
            info.url = url
            Player.Functions.AddItem('document', 1, nil, info)
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['document'], "add")
        end
    end
end)

exports['rsg-core']:AddItem("document", {
    name = "document", label = "Document", weight = 500, type = 'item', image = 'document.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = "" })