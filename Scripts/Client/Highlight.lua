local Player = game.Players.LocalPlayer

local PlayerMouse = Player:GetMouse()

local PickupObjects = workspace.PickupObjects

game.ReplicatedStorage.Events.HighlightClient.OnClientEvent:Connect(function(obj, bool)
	
	obj:WaitForChild('Highlight').Enabled = bool
	
end) 