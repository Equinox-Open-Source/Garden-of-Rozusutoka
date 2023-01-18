local ReplicatedStorage = game:GetService('ReplicatedStorage')
local PathfindingService = game:GetService("PathfindingService")
local Utils = require(ReplicatedStorage.Modules.Utils)
local Players = game:GetService('Players')
local SocialService = game:GetService('SocialService')

local Kariudo = {}

Kariudo.CurrentToriiGate = nil
Kariudo.ToriiGates = ReplicatedStorage.Game.Kariudo_Waypoints:GetChildren()
Kariudo.CurrentPlayer = nil
Kariudo.Model = nil
Kariudo.KillRange = 5

function Kariudo:New()
    
    local _ = ReplicatedStorage.Storage.Kariudo:Clone()
    _.Parent = workspace.Monsters
    Kariudo.Model = _

end

function Kariudo.JumpToGate(Gate, AnimTime)
    
    task.wait(AnimTime)
    for i, v in pairs(Kariudo.Model:GetChildren()) do
        
        v.Transparency = 1

    end

    Kariudo.Model.PrimaryPart = Kariudo.Model.Hitbox2
    Kariudo.Model:PivotTo(Gate)

    for i, v in pairs(Kariudo.Model:GetChildren()) do
        
        v.Transparency = 0
        
    end

    Kariudo.Model.PrimaryPart = Kariudo.Model.Hitbox

end

local function FindPlayers(Range)

    local ld = nil
    local target = nil
    for i,v in pairs(Players:GetPlayers()) do

        local Distance = (Kariudo.PrimaryPart.Position - v.Position).Magnitude

        if Distance =< Range then

            if Distance < ld then

                ld = Distance
                target = v

            else
                
                continue

            end    

        else

            continue

        end    

    end

    return target

end    

local function KillPlayer(Player,WarnPlayer)

    local Success, Fail = pcall(function()

        local Path = PathfindingService:CreatePath()

        local waypoints
        local nextWaypointIndex
        local reachedConnection
        local blockedConnection

        Path:ComputeAsync(Kariudo.Model.PrimaryPart.Position, Player.Character.PrimaryPart.Position)

        if Path.Status == Enum.PathStatus.Success then

            waypoints = Path:GetWaypoints()

            blockedConnection = Path.Blocked:Connect(function(blockedWaypoint)
            
                if blockedWaypoint >= nextWaypointIndex then

                    blockedConnection:Disconnect()
                    KillPlayer(Player,WarnPlayer)

                end    
            
            end)

            if not reachedConnection then

                reachedConnection = humanoid.MoveToFinished:Connect(function(reached)

                    if reached and nextWaypointIndex < #waypoints then

                        nextWaypointIndex += 1
                        humanoid:MoveTo(waypoints[nextWaypointIndex].Position)
                        if Utils.FindDistance(Kariudo.Model.PrimaryPart, Playerutf8.Character.PrimaryPart)

                    else

                        reachedConnection:Disconnect()
                        blockedConnection:Disconnect()

                    end
                end)
            end

        end    

        nextWaypointIndex = 2
		humanoid:MoveTo(waypoints[nextWaypointIndex].Position)

    end)    

    if not Sucess then 

        warn('Kariudo Exception: '..Fail)

    end    

end    

return Kariudo