local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Players = game:GetService('Players')
local Utils = require(ReplicatedStorage.Modules.Utilities)
local Saibankan = require(ReplicatedStorage.Modules.Saibankan)
local UserInputService = game:GetService('UserInputService')

local Events = ReplicatedStorage.Events

local Player = Players.Localplayer
local Character = Player.Character
local Mouse = Player:GetMouse()

local Saibankan = {}

Saibankan.Distace = 100
Saibankan.Model = nil

Saibankan.LastWaypoint = nil
Saibankan.Waypoints = ReplicatedStorage.Game.Saibankan_Waypoints:GetChildren()

local function ChooseRandomWaypoint(LastWaypoint)

    local w = Utils.RandomItemFromArray(Saibankan.Waypoints)

    if w not LastWaypoint then

        return w

    else

        ChooseRandomWaypoint(LastWaypoint)

    end

end    

local function cycle(TimeBetweenActions)
    

    while true do

        local pos = ChooseRandomWaypoint()
        Saibankan.Model:PivotTo(pos.CFrame)


        Saibankan.Model.Head.CFrame = CFrame.lookAt(Saibankan.Model.Head.Position,Character.Head.Position)
        Character.Head.CFrame = CFrame.lookAt(Character.Head.Position,Saibankan.Model.Head.Position)

        UserInputService.InputBegan:Connect(function(key)
    
            print('Player inputed, killing..')
            Player.Character.Health = 0
    
        end)

        task.wait(TimeBetweenActions)

    end    

end

Events.SaibankanTarget.OnClientEvent:Connect(function(Position)

    local Model = ReplicatedStorage.Storage.Saibankan:Clone()
    Model.Parent = workspace.Monsters
    Model.PrimaryPart = Model.Hitbox

    Saibankan.Model = Model
    cycle()

end)