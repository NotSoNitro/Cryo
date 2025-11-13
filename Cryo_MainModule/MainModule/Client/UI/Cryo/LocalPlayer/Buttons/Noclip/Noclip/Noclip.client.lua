local players = game:GetService("Players")
local plr = players.LocalPlayer
local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local goal = {BackgroundColor3 = Color3.fromRGB(0, 207, 76)}
local goal2 = {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}
local frame = script.Parent.Parent
local noclip = false
local noclipRun

script.Parent.MouseButton1Click:Connect(function()
	local char = plr.Character
	if noclip == false then
		noclip = true
		tweenService:Create(frame, tweenInfo, goal):Play()
		local function runNoclip()
			for _,v in pairs(char:GetDescendants()) do
				if v:IsA("BasePart") and v.CanCollide == true then
					v.CanCollide = false
				end
			end
		end
		noclipRun = game:GetService("RunService").Stepped:Connect(runNoclip)
	else
		noclip = false
		tweenService:Create(frame, tweenInfo, goal2):Play()
		noclipRun:Disconnect()
	end
end)

plr.CharacterAdded:Connect(function()
	if noclip == false then return end
	noclip = false
	tweenService:Create(frame, tweenInfo, goal2):Play()
end)