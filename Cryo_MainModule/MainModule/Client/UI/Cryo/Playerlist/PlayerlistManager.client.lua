local main = script.Parent
local exampleFrame = main.Resources.Example
local playerService = game:GetService("Players")
local thumbSize = Enum.ThumbnailSize.Size420x420
local thumbType = Enum.ThumbnailType.HeadShot
local lp = playerService.LocalPlayer

local function refreshPlayerlist()
	main.List:ClearAllChildren()
	Instance.new("UIListLayout", main.List).Padding = UDim.new(0, 5)
	Instance.new("UIPadding", main.List).PaddingLeft = UDim.new(0, 1)
	for _,plr in pairs(playerService:GetPlayers()) do
		local playerFrame = exampleFrame:Clone()
		local profilePicture = playerFrame.ProfilePicture
		local username = playerFrame.Username
		local playerName = playerFrame.PlayerName
		playerFrame.Name = plr.Name
		profilePicture.Image = playerService:GetUserThumbnailAsync(plr.UserId, thumbType, thumbSize)
		username.Text = plr.Name
		if plr.Name == lp.Name then
			username.Text = plr.Name
			playerFrame.Buttons:Destroy()
		else
			playerFrame.Buttons.ButtonManager.Disabled = false
		end
		playerName.Value = plr.Name
		playerFrame.Parent = main.List
		playerFrame.Visible = true
	end
end
refreshPlayerlist()

playerService.PlayerAdded:Connect(refreshPlayerlist)
playerService.PlayerRemoving:Connect(refreshPlayerlist)