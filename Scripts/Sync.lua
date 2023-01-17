game.ReplicatedStorage.Events.SyncPlayerValues.OnServerEvent:Connect(function(plr, safe)
	
	plr["Safe"].Value = safe
	
end) 