script.Parent.Parent.Main.Position = UDim2.new(0.5, 0, 1.1, 0)
script.Parent.Visible = true
local cam = workspace.CurrentCamera
local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local tweenInfo2 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenInfo3 = TweenInfo.new(0.9, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local text = {"Waiting for game to load...", "Waiting For UI's to load...", "Waiting for scripts to load...", "Done!"}
local label = script.Parent
label.Text = text[1]
if not game:IsLoaded() then
	game.Loaded:Wait()
end
wait()
label.Text = text[2]
for _,inst in pairs(label.Parent:GetDescendants()) do
	local parent = inst.Parent
	if (inst:IsA("Frame") or inst:IsA("TextLabel") or inst:IsA("TextBox") or inst:IsA("ImageButton") or inst:IsA("ImageLabel") or inst:IsA("ScrollingFrame") or inst:IsA("UICorner") or inst:IsA("UIGradient") or inst:IsA("UIStroke") or inst:IsA("UIAspectRatioConstraint") or inst:IsA("UIGridLayout") or inst:IsA("UIPadding") or inst:IsA("UITextSizeConstraint")) then
		parent:WaitForChild(inst.Name)
	end
end
wait()
label.Text = text[3]
for _,srt in pairs(label.Parent:GetDescendants()) do
	local parent = srt.Parent
	if (srt:IsA("LocalScript") or srt:IsA("Script") or srt:IsA("ModuleScript")) then
		parent:WaitForChild(srt.Name)
	end
end
wait()
label.Text = text[#text]
wait(.4) -- Safety incase of lag
local currentFOV = cam.FieldOfView
local sound = Instance.new("Sound")
sound.Looped = false
sound.Volume = 2.5
sound.SoundId = "rbxassetid://8503531171"
sound.Parent = label.Parent
sound:Play()
if not sound.IsPlaying then
	repeat wait() until sound.IsPlaying
end
tweenService:Create(cam, tweenInfo, {FieldOfView = (currentFOV - 15)}):Play()
wait(1.1)
tweenService:Create(cam, tweenInfo2, {FieldOfView = currentFOV}):Play()
tweenService:Create(label.Parent.Main, tweenInfo3, {Position = UDim2.new(0.5, 0, 0.952, 0)}):Play()
label.Parent.Main.GuiManager.Disabled = false
label.Parent.Main.HoverText.Disabled = false
label.Parent.AFKManager.Disabled = false
wait(2.6)
sound:Destroy()
wait()
script.Parent:Destroy()