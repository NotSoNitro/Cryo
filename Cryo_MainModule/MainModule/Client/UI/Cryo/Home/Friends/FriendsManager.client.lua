local playerService = game:GetService("Players")
local plr = playerService.LocalPlayer
local uid = playerService:GetUserIdFromNameAsync(plr.Name)
local pages = playerService:GetFriendsAsync(uid)
local OnlineLabel = script.Parent.Online.Users
local OfflineLabel = script.Parent.Offline.Users
local GameLabel = script.Parent.Game.Users
local AllLabel = script.Parent.All.Users

local Friends = {}
local Online = {}
local Offline = {}
local InGame = {}

local function Items(pages)
	return coroutine.wrap(function()
		local pageNum = 1
		while true do
			for _,item in ipairs(pages:GetCurrentPage()) do
				coroutine.yield(item, pageNum)
			end
			if pages.IsFinished then
				break
			end
			pages:AdvanceToNextPageAsync()
			pageNum = pageNum + 1
		end
	end)
end

while wait() do
	for friend,page in Items(pages) do
		table.insert(Friends, friend.Username)
	end
	for friend,page in Items(pages) do
		if friend.IsOnline then
			table.insert(Online, friend.Username)
		else
			table.insert(Offline, friend.Username)
		end
	end
	for _,v in ipairs(playerService:GetPlayers()) do
		for _,f in ipairs(Friends) do
			if v.Name == f then
				table.insert(InGame, f)
			end
		end
	end

	OnlineLabel.Text = #Online.." Users"
	OfflineLabel.Text = #Offline.." Users"
	GameLabel.Text = #InGame.." Users"
	AllLabel.Text = #Friends.." Users"
	
	Online = {}
	Offline = {}
	InGame = {}
	Friends = {}
end
