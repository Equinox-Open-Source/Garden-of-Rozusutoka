local ModerationManager = require(game.ServerStorage.Modules.ModerationManager)
local Players = game:GetService('Players')

Players.PlayerAdded:Connect(function(plr)

    if ModerationManager:IsBanned(plr) then

        ModerationManager:Kick(plr, 'You are banned!')

    else

        return 0

    end 


end)