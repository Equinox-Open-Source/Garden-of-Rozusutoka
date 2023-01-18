local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Players = game:GetService('Players')
local SocialService = game:GetService('SocialService')

local Kariudo = {}

Kariudo.CurrentToriiGate = nil
Kariudo.ToriiGates = ReplicatedStorage.Game.Kariudo_Waypoints:GetChildren()
Kariudo.CurrentPlayer = nil
Kariudo.Model = nil

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
end

return Kariudo