local Players = game:GetService('Players')
local Datastore = require(game.ReplicatedStorage.Modules.Datastore)

local ModerationManager = {}

function ModerationManager:BanPlayer(Player, Reason)
    
    local Data = {

        ["Key"] = "Banned",
        ["Value"] = true

    }

    Datastore:SaveData(Player, Data)
    ModerationManager:Kick(Player, Reason)

end

function ModerationManager:IsBanned(Player)

    local Data = {

        ["Key"] = "Banned"

    }

    return Datastore:LoadData(Player)

end    

function ModerationManager:UnbanPlayer(Player) 

    local Data = {

        ["Key"] = "Banned",
        ["Value"] = false

    }

    Datastore:SaveData(Player, Data)

end    

function ModerationManager:Kick(Player, Reason)

    Player:Kick(Reason)

end    

return ModerationManager

-- MAKE SURE THIS SCRIPT IS IN SERVERSTORAGE/MODULES OR ELSE EXPLOITS MAY OCCURS