local PickupObjects = workspace.PickupObjects
local Items = require(game.ReplicatedStorage.Modules.Items)

PickupObjects.ChildAdded:Connect(function()

	for i,obj in pairs(PickupObjects:GetChildren()) do

		if obj:FindFirstChild('Highlight') then
			
			continue

		else

			local Highlight = Instance.new('Highlight',obj)
			Highlight.Adornee = obj
			Highlight.Enabled = false
			Highlight.FillTransparency = 1

			Highlight.OutlineTransparency = 0

			if Items.PickupObjects[obj.Name] then

				Highlight.OutlineColor = Items.Config[Items.PickupObjects[obj.Name].Rarity]

			else

				Highlight.OutlineColor = Color3.new(255,0,255)

			end

		end
		
		if obj:FindFirstChild('ClickDetector') then

			continue

		else

			local ClickDetector = Instance.new('ClickDetector',obj)

			ClickDetector.MouseHoverEnter:Connect(function(plr)

				game.ReplicatedStorage.Events.HighlightClient:FireClient(plr,obj,true)

			end)

			ClickDetector.MouseHoverLeave:Connect(function(plr)

				game.ReplicatedStorage.Events.HighlightClient:FireClient(plr,obj,false)

			end)

		end

	end

end)

