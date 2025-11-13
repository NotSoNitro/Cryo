repeat
	wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and
	game.Players.LocalPlayer.Character:findFirstChild("Head") and
	game.Players.LocalPlayer.Character:findFirstChild("Humanoid")

local mouse = game.Players.LocalPlayer:GetMouse()

repeat
	wait()
until mouse

local plr = game.Players.LocalPlayer
local enable = false
local flying = false
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0, q = 0, e = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0, q = 0, e = 0}
local speed = 0

function Fly()
	if enable == false then return end
	flying = true
	local char = plr.Character
	local torso = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
	local bg = Instance.new("BodyGyro", torso)
	bg.P = 9e4
	bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
	bg.cframe = torso.CFrame
	
	local bv = Instance.new("BodyVelocity", torso)
	
	bv.velocity = Vector3.new(0, 0.1, 0)
	bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
	
	repeat
		wait()
		plr.Character.Humanoid.PlatformStand = true
		if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
			speed = script.Parent.Parent.Speed.Value * 50
		elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
			speed = 0
		end
		if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
			bv.velocity =
				((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) +
					((game.Workspace.CurrentCamera.CoordinateFrame *
						CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) -
						game.Workspace.CurrentCamera.CoordinateFrame.p)) *
				speed
			lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
		elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
			bv.velocity =
				((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) +
					((game.Workspace.CurrentCamera.CoordinateFrame *
						CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) -
						game.Workspace.CurrentCamera.CoordinateFrame.p)) *
				speed
		else
			bv.velocity = Vector3.new(0, 0.1, 0)
		end
		bg.cframe =
			game.Workspace.CurrentCamera.CoordinateFrame *
			CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50), 0, 0)
	until not flying
	ctrl = {f = 0, b = 0, l = 0, r = 0}
	lastctrl = {f = 0, b = 0, l = 0, r = 0}
	speed = 0
	bg:Destroy()
	bv:Destroy()
	plr.Character.Humanoid.PlatformStand = false
	
end
mouse.KeyDown:connect(
	function(key)
		if enable == false then return end
		if key:lower() == "e" then
			if flying then
				flying = false
			else
				flying = true
				Fly()
			end
		elseif key:lower() == "w" then
			ctrl.f = 1
		elseif key:lower() == "s" then
			ctrl.b = -1
		elseif key:lower() == "a" then
			ctrl.l = -1
		elseif key:lower() == "d" then
			ctrl.r = 1
		end
	end
)
mouse.KeyUp:connect(
	function(key)
		if enable == false then return end
		if key:lower() == "w" then
			ctrl.f = 0
		elseif key:lower() == "s" then
			ctrl.b = 0
		elseif key:lower() == "a" then
			ctrl.l = 0
		elseif key:lower() == "d" then
			ctrl.r = 0
		end
	end
)

local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local goal = {BackgroundColor3 = Color3.fromRGB(0, 207, 76)}
local goal2 = {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}
local frame = script.Parent.Parent

script.Parent.MouseButton1Click:Connect(function()
	if enable == false then
		tweenService:Create(frame, tweenInfo, goal):Play()
		enable = true
		Fly()
	else
		tweenService:Create(frame, tweenInfo, goal2):Play()
		enable = false
		flying = false
	end
end)

plr.CharacterAdded:Connect(function()
	if flying == false then return end
	flying = false
	tweenService:Create(frame, tweenInfo, goal2):Play()
end)