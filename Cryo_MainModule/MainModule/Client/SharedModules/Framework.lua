-- Thank you HD for the framework, ill use it as a template :)

local main = {}

main.players = game:GetService("Players")

function main:Initialise(location, folder)
	if location == "Server" then
		main.mainModule = script:FindFirstAncestor("MainModule")
		main.settings = require(folder:FindFirstChild("Settings"))
		main.server = main.mainModule.Server
		main.client = main.mainModule.Client
		
		main.serverFolder = Instance.new("Folder")
		main.serverFolder.Name = "CryoServer"
		main.serverFolder.Parent = game:GetService("ServerStorage")
		
		require(main.server.Modules.PlayerHandler):Setup(main.settings)
		
		local folderClone = main.server:Clone()
		folderClone.Parent = main.serverFolder
		for _,item in pairs(folderClone:GetChildren()) do
			item.Parent = folderClone.Parent
		end
		folderClone:Destroy()
		
		
	elseif location == "Client" then
		
		-- Core client variables
		main.player = game.Players.LocalPlayer
		main.playerGui = main.player:WaitForChild("PlayerGui")
		main.gui = main.playerGui:WaitForChild("Cryo")
		
	end
end

return main
