local module = {}

function module:Initialise(userTable)
	local main = require(script:WaitForChild("Client"):WaitForChild("SharedModules"):WaitForChild("Framework"))
	main:Initialise("Server", userTable)
end

return module
