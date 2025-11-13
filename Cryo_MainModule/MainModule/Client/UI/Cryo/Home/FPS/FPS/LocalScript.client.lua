local RunService = game:GetService('RunService')
local fps = 0

RunService.Heartbeat:connect(function(step)
	fps = fps + 1
end)

while task.wait(1) do
	script.Parent.Text = fps
	fps = 0
end