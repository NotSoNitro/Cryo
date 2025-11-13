local players = game:GetService("Players")
local plr = players.LocalPlayer
local teleportService = game:GetService("TeleportService")

script.Parent.MouseButton1Click:Connect(function()
	if #players:GetPlayers() <= 1 then
		plr:Kick("\nTrying to Rejoin...")
		wait()
		teleportService:Teleport(game.PlaceId, plr)
	else
		teleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
	end
end)