local Effects = {
	
	["Poison"] = {
		
		["Decal"] = ""
		
	}
	
}

local EffectPlayerEvent = game.ReplicatedStorage.Events.EffectPlayer

EffectPlayerEvent.OnServerEvent:Connect(function(plr, duration, effect, dmg)
	
	if Effects[effect] and effect == "Poison" then
		
		for i = 1,duration do
			
			plr.Character.Humanoid.Health -= dmg
			wait(1)
			
		end
		
	end
	 
end)