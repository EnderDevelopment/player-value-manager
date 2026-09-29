local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('fivemscript:getValue', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.fetchScalar('SELECT value FROM fivemscript_data WHERE player_id = @player_id', {
        ['@player_id'] = playerId
    }, function(result)
        if result then
            cb(result)
        else
            MySQL.Async.execute('INSERT INTO fivemscript_data (player_id, value) VALUES (@player_id, @value)', {
                ['@player_id'] = playerId,
                ['@value'] = Config.Settings.DefaultValue
            }, function()
                cb(Config.Settings.DefaultValue)
            end)
        end
    end)
end)

RegisterServerEvent('fivemscript:setValue')
AddEventHandler('fivemscript:setValue', function(value)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = xPlayer.identifier

    MySQL.Async.execute('UPDATE fivemscript_data SET value = @value WHERE player_id = @player_id', {
        ['@value'] = value,
        ['@player_id'] = playerId
    }, function(rowsChanged)
        if rowsChanged > 0 then
            TriggerClientEvent('fivemscript:updateValue', source, value)
        else
            MySQL.Async.execute('INSERT INTO fivemscript_data (player_id, value) VALUES (@player_id, @value)', {
                ['@player_id'] = playerId,
                ['@value'] = value
            }, function()
                TriggerClientEvent('fivemscript:updateValue', source, value)
            end)
        end
    end)
end)