local Players = game:GetService('Players')
local UIS = game:GetService('UserInputService')

local Utils = require(game.ReplicatedStorage.Modules.Utilities)

local Saibankan = {}

function Saibankan:New(Client, Position)

    game.ReplicatedStorage.Events.SaibankanTarget:FireClient(Client, Position)
    --print('Spawned Saibankan for player: '..Player.Name..' at position: '..Position)

end    

return Saibankan