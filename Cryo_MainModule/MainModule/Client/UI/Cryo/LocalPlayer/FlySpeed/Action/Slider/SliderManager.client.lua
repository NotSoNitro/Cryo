local max = script.Parent.Parent
local slider = script.Parent
local label = max.Parent.Label
local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")
local ap = Vector2.new(max.AbsolutePosition.X, max.AbsolutePosition.Y)
local as = Vector2.new(max.AbsoluteSize.X, max.AbsoluteSize.Y)
local x = mouse.X
local down = false
local fire = slider.Fire
local tweenservice = game:GetService("TweenService")

max.MouseButton1Down:Connect(function(a)
	local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
	
	tweenservice:Create(slider, tweenInfo, {Size = UDim2.new(0, (mouse.X - ap.X), 1, 0)}):Play()
	
	fire.Value = true
	down = true
end)

uis.InputEnded:Connect(function(input, gp)
	
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		down = false
		fire.Value = false
	end
	
end)


mouse.Move:Connect(function()
	
	if down == true then
		
		fire.Value = false
		fire.Value = true

		if mouse.X < ap.X then
			
			local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

			tweenservice:Create(slider, tweenInfo, {Size = UDim2.new(0, 0, 1, 0)}):Play()

		elseif mouse.X > (ap.X + as.X) then
			
			local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
			
			tweenservice:Create(slider, tweenInfo, {Size = UDim2.new(0, as.X, 1, 0)}):Play()
			
		else
			
			local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
			
			tweenservice:Create(slider, tweenInfo, {Size = UDim2.new(0, (mouse.X - ap.X), 1, 0)}):Play()

		end

	end

end)