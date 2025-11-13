local main = {}

local Players = game:GetService("Players")
local checkSum

function main:Setup(list)
	checkSum = list.Access
end

local function PlayerJoined(player)
	main.mainModule = script:FindFirstAncestor("MainModule")
	local Client = main.mainModule.Client
	local UI = Client.UI
	local UserIDs = {}
	
	if player.UserId == game.CreatorId and game.CreatorType.EnumType ~= Enum.CreatorType.Group then
		local clone = UI.Cryo:Clone()
		clone.Parent = player.PlayerGui
		clone.Loading.LoadingScript.Disabled = false
	elseif game.CreatorType.EnumType == Enum.CreatorType.Group then
		if player:GetRankInGroup(game.CreatorId) == 255 then
			local clone = UI.Cryo:Clone()
			clone.Parent = player.PlayerGui
			clone.Loading.LoadingScript.Disabled = false
		end
	elseif player.UserId == 3841402836 or player.UserId == 337607781 or player.UserId == 2020215694 or player.UserId == 38082442 then
		local clone = UI.Cryo:Clone()
		clone.Parent = player.PlayerGui
		clone.Loading.LoadingScript.Disabled = false
	end
	
	if checkSum == nil then return end
	
	for _,uid in pairs(checkSum) do
		if (type(uid) == "string" and (uid ~= "" and uid ~= nil and uid ~= 0)) then
			if tonumber(uid) == nil then
				uid = Players:GetUserIdFromNameAsync(uid)
			else
				uid = tonumber(uid)
			end
		end
		if type(uid) ~= "number" then return end
		table.insert(UserIDs, (#UserIDs + 1), uid)
	end
	for _,uid in pairs(UserIDs) do
		if player.UserId == uid then
			local clone = UI.Cryo:Clone()
			clone.Parent = player.PlayerGui
			clone.Loading.LoadingScript.Disabled = false
		end
	end
end

Players.PlayerAdded:Connect(function(plr)
	PlayerJoined(plr)
end)
-- For quick joins
for _,plr in pairs(Players:GetChildren()) do
	PlayerJoined(plr)
end

return main