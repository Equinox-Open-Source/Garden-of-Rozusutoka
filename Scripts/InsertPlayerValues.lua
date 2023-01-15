local Players = game:GetService("Players")
local moduleLooking = script:WaitForChild("CharacterLooking")
local events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
Players.PlayerAdded:Connect(function(plyr)
	local value1=Instance.new("BoolValue", plyr)
	local value2=Instance.new("BoolValue", plyr)
	value1.Name ="Safe"
	value2.Name = "ResumeMusic"
	local HearValue=Instance.new("BoolValue", plyr)
	HearValue.Name ="CanHear"
	HearValue.Value = true
	plyr.CharacterAdded:Connect(function(char)
		if char and char:FindFirstChild("HumanoidRootPart") then
			local root = char:WaitForChild("HumanoidRootPart")
			moduleLooking:Clone().Parent = char
			root.Touched:Connect(function(hit)
				if hit:FindFirstChild("SafeZone") and hit.SafeZone:IsA("BoolValue") then
					value1.Value = true
				end
			end)
			root.TouchEnded:Connect(function(hit)
				if hit:FindFirstChild("SafeZone") and hit.SafeZone:IsA("BoolValue") then
					value1.Value = false
				end
			end)
		end
	end)
	
	events:WaitForChild("ResumeMusic").OnServerEvent:Connect(function(plr,AI)
		if plr and AI and plr.Name == plyr.Name then
			value2.Value = true
			repeat wait() until events:WaitForChild('running').Value == false
			wait(3)
			if events:WaitForChild("running").Value == false then
				value2.Value = false
			end
		end
	end)

end)