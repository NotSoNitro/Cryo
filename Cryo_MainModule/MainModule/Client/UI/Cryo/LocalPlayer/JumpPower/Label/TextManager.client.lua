local label = script.Parent
local frame = label.Parent
local max = frame.Action
local slider = max.Slider
local fire = slider.Fire
local as = Vector2.new(max.AbsoluteSize.X, max.AbsoluteSize.Y)

if not game.StarterPlayer.CharacterUseJumpPower then
	label.Text = "7 | JumpHeight"
end

fire.Changed:Connect(function()

	if fire.Value == true then
		
		while wait() do
			
			if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").UseJumpPower then
				
				local maxSize = as.X
				local size = slider.Size.X.Offset
				local num = 351 * (size / maxSize)
				local hum = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

				label.Text = tostring(hum.JumpPower).. " | JumpPower"
				hum.JumpPower = math.clamp(math.ceil(num), 50, 350)
				
			else
				local maxSize = as.X
				local size = slider.Size.X.Offset
				local num = 36 * (size / maxSize)
				local hum = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

				label.Text = math.clamp(math.ceil(num), 7, 36).. " | JumpHeight"
				hum.JumpHeight = math.clamp(math.ceil(num), 7, 36)
			end
			
		end

	end

end)