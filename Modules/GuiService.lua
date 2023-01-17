local GuiService = {}

function GuiService:RGB(Item, Speed)
	
	if Item:IsA('Frame') then
		
		while true do

			for i = 0,1,0.001*Speed do

				Item.BackgroundColor = Color3.fromHSV(i,1,1)
				wait()

			end

		end
		
	elseif Item:IsA('ImageLabel') then
	
		while true do

			for i = 0,1,0.001*Speed do

				Item.ImageColor3 = Color3.fromHSV(i,1,1)
				wait()

			end

		end	
		
	elseif Item:IsA('TextLabel') or Item:IsA('TextButton') then
		
		while true do

			for i = 0,1,0.001*Speed do

				Item.Color = Color3.fromHSV(i,1,1)
				wait()

			end

		end
		
	end
	
end

return GuiService