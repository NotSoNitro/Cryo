-- Gonna add anims later

local button = script.Parent
local main = button.Parent

button.MouseButton1Click:Connect(function()
	local music = main:FindFirstChild("Music")
	if music then
		if music.IsPlaying then
			script.Parent.ImageRectOffset = Vector2.new(764, 244)
			music:Pause()
		else
			script.Parent.ImageRectOffset = Vector2.new(804, 124)
			music:Resume()
		end
	end
end)