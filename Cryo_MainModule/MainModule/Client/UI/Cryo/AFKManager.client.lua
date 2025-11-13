local plr = game:GetService("Players").LocalPlayer
local uis = game:GetService("UserInputService")
local blur = Instance.new("BlurEffect")
local sound = Instance.new("Sound")
local AFKMusic = {1848354536, 9043887091, 9046862941, 9047050075, 9042666762, 9048045656, 9044565954, 9044564552, 1839841807, 1837429944, 9046863579, 9047053092, 9048039534}
local instances = {}
blur.Name = "AFKBlur"
blur.Size = 0
sound.Name = "AFKSound"
sound.Volume = 0

local tweenService = game:GetService("TweenService")

function NewSong()
	sound.SoundId = "rbxassetid://"..AFKMusic[math.random(1,#AFKMusic)]
	sound:Play()
end

function Tween(obj, sty, dir, len, prop)
	if obj:IsA("BlurEffect") then if obj.Enabled == false then obj.Enabled = true end end
	tweenService:Create(obj, TweenInfo.new(len, sty, dir), prop):Play()
	if obj:IsA("BlurEffect") then
		if obj.Size == 0 and prop.Size == 0 then
			wait(len)
			blur:Destroy()
			blur = Instance.new("BlurEffect")
			blur.Name = "AFKBlur"
			blur.Size = 0
		end
	elseif obj:IsA("Sound") then
		if obj.Volume == 0 and prop.Volume == 0 then
			wait(len)
			sound:Destroy()
			sound = Instance.new("Sound")
			sound.Name = "AFKSound"
			sound.Volume = 0
		end
	end
end

uis.WindowFocusReleased:Connect(function()
	blur.Parent = game:GetService("Lighting")
	repeat
		sound.Parent = script.Parent
		wait()
	until script.Parent:FindFirstChild("AFKSound")
	for _,v in pairs(game:GetDescendants()) do
		if v:IsA("Sound") and (v.IsPlaying and v.Name ~= sound.Name) then
			Tween(v, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, .4, {Volume = 0})
		end
	end
	Tween(blur, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 2, {Size = 18})
	NewSong()
	Tween(sound, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 1.5, {Volume = .1})
end)

uis.WindowFocused:Connect(function()
	Tween(blur, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, .6, {Size = 0})
	Tween(sound, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 1, {Volume = 0})
	for _,v in pairs(game:GetDescendants()) do
		if v:IsA("Sound") and (v.IsPlaying and v.Name ~= sound.Name) then
			Tween(v, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, .4, {Volume = .5})
		end
	end
end)

sound.Ended:Connect(NewSong)