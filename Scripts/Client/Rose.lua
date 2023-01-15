local Rose = {}

Rose.CanStun = false
Rose.Equipped = false
Rose.Health = 10
Rose.MaxHealth = math.huge
Rose.Cooldown = 5
Rose.MinimumParts = 3
Rose.MaximumParts = 7
local Tool = script.Parent

Tool.Equipped:Connect(function()
	Rose.Equipped = true
end)

Tool.Unequipped:Connect(function()
	Rose.Equipped = false
end)


while true do

	if Rose.Equipped and game.ReplicatedStorage.Game.Rozusutoka_Target.Value == game.Players.LocalPlayer then
		
		
		game.ReplicatedStorage.Events.SyncPlayerValues:FireServer(true)	
		wait(10)
		game.ReplicatedStorage.Events.SyncPlayerValues:FireServer(false)
		local Petal = Instance.new('Part',workspace)
		Petal.Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
		Petal.Anchored = false
		Petal.CanCollide = false
		Petal.Size = Vector3.new(10,0.5,10)
		Petal.Transparency = 1
		Petal.Color = Color3.new(1,1,1)
		
		-- Register events
		
		Petal.Touched:Connect(function(hit)
			
			if hit and hit.Parent:WaitForChild("Humanoid") then
				
				-- Poison
				
				game.ReplicatedStorage.Events.EffectPlayer:FireServer(10,"Poison",5)
				
			end
			
		end)
		
		Tool:Destroy()
		
	else

		game.ReplicatedStorage.Events.SyncPlayerValues:FireServer(false)

		
	end
	wait(1)	
end

return Rose 