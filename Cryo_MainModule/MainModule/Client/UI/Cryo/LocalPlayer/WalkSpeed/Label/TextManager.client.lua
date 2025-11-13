local label = script.Parent
local frame = label.Parent
local max = frame.Action
local slider = max.Slider
local fire = slider.Fire
local as = Vector2.new(max.AbsoluteSize.X, max.AbsoluteSize.Y)

fire.Changed:Connect(function()

	if fire.Value == true then
		
		while wait() do
			
			local maxSize = as.X
			local size = slider.Size.X.Offset
			local num = 225 * (size / maxSize)
			local hum = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			
			label.Text = tostring(hum.WalkSpeed).. " | WalkSpeed"
			hum.WalkSpeed = math.clamp(math.ceil(num), 16, 225)
			
		end

	end

end)

