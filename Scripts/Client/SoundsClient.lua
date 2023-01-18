local ReplicatedStorage = game:GetService('ReplicatedStorage')
local SS = game:GetService('SoundService')

local Events = ReplicatedStorage.Events

Events.SoundPlayer.OnClientEvent:Connect(function(Sound)
    
    SS:PlayLocalSound(Sound)
    print('Played sound '..Sound.Name..' for player '..game.Players.LocalPlayer.Name)
    
end)