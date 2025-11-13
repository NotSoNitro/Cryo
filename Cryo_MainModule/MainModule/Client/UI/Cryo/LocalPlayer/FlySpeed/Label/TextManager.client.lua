local label = script.Parent
local frame = label.Parent
local max = frame.Action
local slider = max.Slider
local fire = slider.Fire
local speed = frame.Parent.Buttons.Fly.Speed
local as = Vector2.new(max.AbsoluteSize.X, max.AbsoluteSize.Y)

fire.Changed:Connect(function()
	
	if fire.Value == true then
		
		while wait() do
			
			local maxSize = as.X
			local size = slider.Size.X.Offset
			local num = 35 * (size / maxSize)

			label.Text = tostring(speed.Value).. " | FlySpeed"
			speed.Value = math.clamp(math.ceil(num), 1, 35)
		end

	end

end)