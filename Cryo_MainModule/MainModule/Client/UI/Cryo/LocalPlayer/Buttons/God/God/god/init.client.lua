local godmode = false
local plr = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local goal = {BackgroundColor3 = Color3.fromRGB(0, 207, 76)}
local goal2 = {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}
local frame = script.Parent.Parent

script.Parent.MouseButton1Click:Connect(function()
	if godmode == false then
		godmode = true
		tweenService:Create(frame, tweenInfo, goal):Play()
		script.godmode:FireServer(true)
	else
		godmode = false
		tweenService:Create(frame, tweenInfo, goal2):Play()
		script.godmode:FireServer(false)
	end
end)

plr.CharacterAdded:Connect(function()
	if godmode == false then return end
	godmode = false
	tweenService:Create(frame, tweenInfo, goal2):Play()
end)