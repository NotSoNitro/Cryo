--[[
	
	This lets Cryo Auto-Update
	
	Cryo MainModule here:
	https://create.roblox.com/marketplace/asset/10733225450/Cryo-Open-Source
	
]]

local setupFolder = script.Parent.Parent
local mainModule = require(10733225450)
mainModule:Initialise(setupFolder)
setupFolder:Destroy()