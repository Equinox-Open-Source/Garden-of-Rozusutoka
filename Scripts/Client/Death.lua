local savefov = game.ReplicatedStorage.Events.SaveFov
if savefov.Value ~= 0 then
	game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, TweenInfo.new(0.01), {FieldOfView = savefov.Value}):Play()
else
	savefov.Value = game.Workspace.CurrentCamera.FieldOfView
end
script.Parent.Frame.BackgroundTransparency = 1
script.Parent.Frame.Visible = false
game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
script.Parent.FlashFrame.Visible = false
local playerspeed = game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed
local safing = false
local function partsafe(part)
part.CanCollide = false
part.Touched:Connect(function()
	safing = true
end)
part.TouchEnded:Connect(function()
	safing = false
end)
end
local function heartarget(AI,Value)
	local config = AI.Configuration.Others["Configuration - Values"].Hear
	local WalkingAmount = 2
	local lastPosition
	local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		while root.Parent do
			lastPosition = root.Position
			wait(0.2)
			if (lastPosition - root.Position).magnitude > 0 then 
			WalkingAmount -= 1
			if (AI.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= config.HearDistance.Value and WalkingAmount <= 1 and safing == false then	
				local randomHearIfTrue = math.random(0,100)
				if randomHearIfTrue <= Value.Value then
					wait(math.random(1.7,2.4))
					if game.Players.LocalPlayer.CanHear.Value == true then
						--		if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed >= playerspeed then
						game.ReplicatedStorage.Events.Hear:FireServer(game.Players.LocalPlayer.Character)
						--	end
					end
				end
			end
			--print("Walking")
			else
			WalkingAmount = 2
			--print("Stop")
			end
		end
end

local player = game.Players.LocalPlayer or game.Players.PlayerAdded:Wait()
local char = player.Character or player.CharacterAdded:Wait()

local humanoid = char:WaitForChild("Humanoid")
local TweenService = game:GetService("TweenService")
local Camera = game.Workspace.CurrentCamera
local fram = script.Parent.Frame
local function MoveCamera(StartPart, EndPart, Duration, EasingStyle, EasingDirection)
	Camera.CameraType = Enum.CameraType.Scriptable
	Camera.CFrame = StartPart.CFrame
	local Cutscene = TweenService:Create(Camera, TweenInfo.new(Duration, EasingStyle, EasingDirection), {CFrame = EndPart.CFrame})
	Cutscene:Play()
	wait(Duration)
end

local events = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
local plyr = game:GetService("Players").LocalPlayer
local char = plyr.Character or plyr.CharacterAdded:Wait()
local camera = workspace.CurrentCamera
local TS = game:GetService("TweenService")
local ResumeValue = plyr:WaitForChild("ResumeMusic")
local deb = false
local Theme
local minFov = 70
local Jumpscared = false
local oldcomp = 0
local shaking = false


local function repeator(timer,jumpscare2part,jumpscare1part,flesh,smooth,ends)
	for repet = -2.5,timer do
		MoveCamera(jumpscare2part, jumpscare1part, .1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		if flesh == true then
		script.Parent.FlashFrame.Visible = true
		end
		MoveCamera(jumpscare1part, jumpscare2part, .1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		if flesh == true then
		script.Parent.FlashFrame.Visible = false
		end
	end
	if smooth == true then
	fram.Visible = true
	fram.BackgroundTransparency = 0.9
	end
	MoveCamera(jumpscare1part, jumpscare2part, .1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	if smooth == true then
	fram.BackgroundTransparency = 0.7
	end
	if flesh == true then
		script.Parent.FlashFrame.Visible = true
	end
	MoveCamera(jumpscare2part, jumpscare1part, .1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	if smooth == true then
	fram.BackgroundTransparency = 0.5
	end
	MoveCamera(jumpscare1part, jumpscare2part, .1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	if smooth == true then
	fram.BackgroundTransparency = 0.3
	end
	if flesh == true then
		script.Parent.FlashFrame.Visible = false
	end
	MoveCamera(jumpscare2part, jumpscare1part, .1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	if smooth == true then
	fram.BackgroundTransparency = 0.2
	end
	MoveCamera(jumpscare1part, jumpscare2part, .1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	if ends == true then
	fram.Visible = true
	fram.BackgroundTransparency = 0
	end
	MoveCamera(jumpscare2part, jumpscare1part, .1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	fram.BackgroundTransparency = 0
	fram.Visible = true
	Camera.CameraType = Enum.CameraType.Custom
	camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end

events.Jumpscare.OnClientEvent:Connect(function(ai,timer,flesh,smooth,ends,folder)
	if folder.Value == true then
	TS:Create(camera, TweenInfo.new(3.5), {FieldOfView = folder.maxzoom.Value}):Play()
	end
	local jumpscaSound = ai.Configuration.Others["Configuration - Sounds"].Sounds.Jumpscare:Clone()
	jumpscaSound.Parent = script
	jumpscaSound.Name = "ScareNoise"
	local jumpscare1part = ai.Jumpscare1
	local jumpscare2part = ai.Jumpscare2
local function Jumpscare()
script.ScareNoise.Playing = true
		MoveCamera(game.Workspace.CurrentCamera, jumpscare2part, .1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
		repeator(timer,jumpscare2part,jumpscare1part,flesh,smooth,ends)
		script.ScareNoise:Destroy()


--for i, bodyPart in pairs(script.JumpscareMonster.Value:GetDescendants()) do
	--		if bodyPart.Name ~= "HumanoidRootPart" then
		--		if bodyPart:IsA("Part") or bodyPart:IsA("MeshPart") or bodyPart:IsA("Decal") or bodyPart:IsA("Texture") then
			--		bodyPart.Transparency = bodyPart:FindFirstChild("OldTransparency").Value
				--	bodyPart:FindFirstChild("OldTransparency"):Destroy()
				--elseif bodyPart:IsA("Sound") then
					--bodyPart.Volume = bodyPart:FindFirstChild("OldVolume").Value
					--if bodyPart.Name == "chaseTheme" then
						--bodyPart.Volume = 0
					--end
					--bodyPart:FindFirstChild("OldVolume"):Destroy()
				--end
		--	end
	--	end
end
Jumpscare()
end)
events:WaitForChild("On").OnClientEvent:Connect(function(AI, mxFov)
	if deb == true and Jumpscared == false then
		deb = false
		Theme = AI.Configuration.Others["Configuration - Sounds"].Sounds:WaitForChild("chaseTheme")
		if Theme ~= nil then
			if AI then
				Theme.Volume = AI.Configuration.Others["Configuration - Values"].Chase["ChaseTheme Volume"].Value				
				if AI.Configuration.Others["Configuration - Values"].Chase["CanVignet?"].Value == true then
				script.Parent.Overlay.Visible = true
				end
				if AI.Configuration.Others["Configuration - Values"].Chase["CanChaseFov?"].Value == true then
				TS:Create(camera, TweenInfo.new(1), {FieldOfView = mxFov}):Play()
				end
				if AI.Configuration.Others["Configuration - Values"].Chase["CanVignet?"].Value == true then
				wait(0.05)
				script.Parent.Overlay.ImageTransparency = 0.7
				wait(0.05)
				script.Parent.Overlay.ImageTransparency = 0.6
				end
				if ResumeValue.Value == false then
					Theme:Play()
				end
				events:FindFirstChild("ResumeMusic"):FireServer(AI)
			end
		end
	end
end)

events:WaitForChild("Off").OnClientEvent:Connect(function()
	if deb == false and events:WaitForChild("running").Value == false then
		deb = true
		if Theme ~= nil then
			--script.Parent.Overlay.ImageTransparency = 0.7
			--wait(0.05)
			--script.Parent.Overlay.ImageTransparency = 0.9
			TS:Create(Theme, TweenInfo.new(1), {Volume = 0}):Play()
			TS:Create(camera, TweenInfo.new(.35), {FieldOfView = minFov}):Play()
			wait(0.05)
			script.Parent.Overlay.Visible = false
		end
	end
end)

local camera = workspace.CurrentCamera
local CameraShaker = require(game.ReplicatedStorage.Events.CameraShaker)
local char = game.Players.LocalPlayer.Character

local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camera.CFrame = camera.CFrame * shakeCf
end)

camShake:Start()

events:WaitForChild("Shaking").OnClientEvent:Connect(function(Force, ShakeStopTime, phantom)
	local humanoid = char:WaitForChild("Humanoid")
	local oldCamPos = humanoid.CameraOffset
	if shaking == false then
		shaking = true
		if phantom == true then
			if Force == 3 then
				camShake:ShakeOnce(5,10,0,0.7,Vector3.new(0.15,0.15,0.15),Vector3.new(0,0,0))
			elseif Force == 5 then
				camShake:ShakeOnce(10,20,0,0.7,Vector3.new(0.15,0.15,0.15),Vector3.new(0,0,0))
			elseif Force == 10 then
				camShake:ShakeOnce(15,30,0,0.7,Vector3.new(0.15,0.15,0.15),Vector3.new(0,0,0))
			end
		else
		for i=1,10 do
			local x = math.random(-Force,Force)/2
			local y = math.random(-1 ,Force)/2
			local z = math.random(-1,Force)/2
			local lmao = TS:Create(humanoid, TweenInfo.new(.335), {CameraOffset = Vector3.new(x,y,z)})
			lmao:Play()
			wait(.025)
			lmao:Cancel()
			humanoid.CameraOffset = oldCamPos
		end
		wait(ShakeStopTime)
		end
		shaking = false
	end
end)
game.ReplicatedStorage.Events.Safe.OnClientEvent:Connect(partsafe)
game.ReplicatedStorage.Events.Hear.OnClientEvent:Connect(heartarget)
