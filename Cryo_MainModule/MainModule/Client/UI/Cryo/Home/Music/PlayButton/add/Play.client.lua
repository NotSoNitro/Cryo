local button = script.Parent
local main = button.Parent.Parent
local mps = game:GetService("MarketplaceService")

button.MouseButton1Click:Connect(function()
	local textbox = main.ID.IDBox
	local id = tonumber(textbox.Text)
	local name = mps:GetProductInfo(id).Name
	textbox.Text = ''
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
end)