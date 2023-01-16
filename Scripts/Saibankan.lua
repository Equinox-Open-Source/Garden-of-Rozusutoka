local Players = game:GetService('Players')

local Saibankan = {}

Saibankan.CurrentTarget = nil
Saibankan.Waypoints = game.ReplicatedStorage.Game.Saibankan_Waypoints:GetChildren()
Saibankan.Waypoint_Index = nil

Saibankan.Distance = 100
Saibankan.LastDistance = nil

--[[

    [1] - Teleport around the map
    [2] - Teleport to player if within range

]]

local function FindPlayers(Model)
    
    local Success, Fail = pcall(function()
        
        for i, obj in pairs(Players:GetPlayers()) do
            
            local Distance = (obj.PrimaryPart.Position - Model.PrimaryPart.Position).Magnitude
            
            if Distance > Saibankan.LastDistance then
                
                Saibankan.LastDistance = Distance
                Saibankan.CurrentTarget = obj

            else

                continue

            end

        end

    end)

    if not Success then
        
        warn('Saibankan Exception: '..Fail)

    end

end

local function ChooseWaypoint(Waypoints)
    
    return Waypoints[math.random(1, #Waypoints)]

end

return Saibankan