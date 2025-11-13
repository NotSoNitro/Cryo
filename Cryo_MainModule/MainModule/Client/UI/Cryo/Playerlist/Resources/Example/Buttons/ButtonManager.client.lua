------------// (V) Variables (V) \\------------

local buttons = script.Parent
local goto = buttons.goto
local view = buttons.view
local playerName = buttons.Parent.PlayerName.Value
local playerService = game:GetService("Players")
local player = playerService[playerName]
local lp = playerService.LocalPlayer
local camera = workspace.CurrentCamera
local viewing = false

------------// (F) Funcitons (F) \\------------

function getRoot(plr)
	return plr:FindFirstChild("HumanoidRootPart") or plr:FindFirstChild("Torso") or plr:FindFirstChild("UpperTorso")
end

------------// (M) Main (M) \\------------

goto.MouseButton1Click:Connect(function()
	local hrp1 = getRoot(lp.Character)
	local hrp2 = getRoot(player.Character)
	hrp1.CFrame = hrp2.CFrame + Vector3.new(0,0,3)
end)

view.MouseButton1Click:Connect(function()
	if viewing == false then
		camera.CameraSubject = player.Character
		view.ImageRectOffset = Vector2.new(564, 44)
		viewing = true
	else
		camera.CameraSubject = lp.Character
		view.ImageRectOffset = Vector2.new(84, 44)
		viewing = false
	end
end)

camera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
	if camera.CameraSubject ~= player.Character then
		view.ImageRectOffset = Vector2.new(84, 44)
		viewing = false
	end
end)