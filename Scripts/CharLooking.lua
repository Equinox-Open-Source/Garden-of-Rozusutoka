local char = script.Parent
local root = char:WaitForChild("HumanoidRootPart")
local hum = char:WaitForChild("Humanoid")
local hipH = hum.HipHeight
local Head = char:WaitForChild("Head")

local function RootHeight()
	return (Head.Position - Vector3.new(0,hipH,0))
end

local module = {}

module.IsLookingAtAI = function(AI)
	if AI and AI:FindFirstChild("HumanoidRootPart") then
		local origin = Head.Position
		local direction = (AI:WaitForChild("HumanoidRootPart").Position - Head.Position).unit * 1000
		local ray = Ray.new(origin,direction)
		local ignoreList = {char}
		
		local hit, pos = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)
		
		if hit then
			if hit:IsDescendantOf(AI) then
				local unit = (AI:WaitForChild("HumanoidRootPart").Position - RootHeight()).Unit
				local isLooking = root.CFrame.LookVector
				local Dot = unit:Dot(isLooking)
				
				if Dot > 0 then
					return true
				end	
			end
		else
			return false
		end
	end
end

return module
