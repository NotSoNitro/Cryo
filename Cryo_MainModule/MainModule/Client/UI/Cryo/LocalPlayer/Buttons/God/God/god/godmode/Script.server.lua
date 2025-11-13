local maxHealth

script.Parent.OnServerEvent:Connect(function(plr, val)
	if val == true then
		local char = plr.Character
		local hum = char:FindFirstChild("Humanoid")
		maxHealth = hum.MaxHealth
		hum.MaxHealth = math.huge
		hum.Health = math.huge
	else
		local char = plr.Character
		local hum = char:FindFirstChild("Humanoid")
		hum.MaxHealth = maxHealth
		hum.Health = maxHealth
	end
end)