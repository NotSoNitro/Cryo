game:GetService("RunService").Stepped:Connect(function()
	local seconds = math.floor(workspace.DistributedGameTime)
	local minutes = math.floor(workspace.DistributedGameTime / 60)
	local hours = math.floor(workspace.DistributedGameTime / 60 / 60)
	local seconds = seconds - (minutes * 60)
	local minutes = minutes - (hours * 60)
	local label = script.Parent

	if hours < 1 then 
		if minutes < 1 then
			label.Text = "Uptime: " .. seconds .. " Second(s)" 
		else
			label.Text = "Uptime: " .. minutes .. " Minute(s) | " .. seconds .. " Second(s)"
		end
	else
		label.Text = "Uptime: " .. hours .. " Hour(s) | " .. minutes .. " Minute(s)"
	end
end)