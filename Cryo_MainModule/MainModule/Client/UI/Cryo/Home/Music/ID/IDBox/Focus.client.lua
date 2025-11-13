local textbox = script.Parent
local uis = game:GetService("UserInputService")
local mps = game:GetService("MarketplaceService")
local main = textbox.Parent.Parent

uis.InputBegan:Connect(function(input, gre)
	if input.KeyCode == Enum.KeyCode.Return then
		local id = tonumber(textbox.Text)
		textbox.Text = ''
		textbox:ReleaseFocus()
		local name = mps:GetProductInfo(id).Name
		local find = main:FindFirstChild("Music")
		if find then
			find:Destroy()
		end
		local sound = Instance.new("Sound")
		sound.Name = "Music"
		sound.Parent = main
		sound.Looped = true
		sound.Volume = 1
		sound.SoundId = "rbxassetid://"..id
		main.PlayingID.Text = id
		main.Playing.Text = name
		main.Toggle.ImageRectOffset = Vector2.new(804, 124)
		sound:Play()
	end
end)