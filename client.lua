local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    RegisterNetEvent('fivemscript:updateValue')
    AddEventHandler('fivemscript:updateValue', function(value)
        ESX.ShowNotification('Your value has been updated to: ' .. value)
    end)

    RegisterCommand('getvalue', function()
        TriggerServerEvent('fivemscript:getValue')
    end, false)

    RegisterCommand('setvalue', function(source, args)
        local value = tonumber(args[1])
        if value then
            TriggerServerEvent('fivemscript:setValue', value)
        else
            ESX.ShowNotification('Please enter a valid number')
        end
    end, false)
end)