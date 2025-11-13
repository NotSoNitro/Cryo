local frame = script.Parent
local buttons = frame.Buttons
--local plr = game:GetService("Players").LocalPlayer
--local mouse = plr:GetMouse()
local debounce = false


local tweenService = game:GetService("TweenService")

function Tween(obj, sty, dir, len, prop)
	if obj.Visible == false then obj.Visible = true end
	tweenService:Create(obj, TweenInfo.new(len, sty, dir), prop):Play()
	wait(len)
	if prop.BackgroundTransparency == 1 then obj.Visible = false end
end

buttons.Respawn.MouseEnter:Connect(function()
	Tween(buttons.Respawn.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.Refresh.MouseEnter:Connect(function()
	Tween(buttons.Refresh.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.R6.MouseEnter:Connect(function()
	Tween(buttons.R6.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.Fly.MouseEnter:Connect(function()
	Tween(buttons.Fly.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.Invisible.MouseEnter:Connect(function()
	Tween(buttons.Invisible.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.Rejoin.MouseEnter:Connect(function()
	Tween(buttons.Rejoin.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.Noclip.MouseEnter:Connect(function()
	Tween(buttons.Noclip.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.God.MouseEnter:Connect(function()
	Tween(buttons.God.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.Respawn.MouseLeave:Connect(function()
	Tween(buttons.Respawn.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)

buttons.Respawn.MouseLeave:Connect(function()
	Tween(buttons.Respawn.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)

buttons.Refresh.MouseLeave:Connect(function()
	Tween(buttons.Refresh.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)

buttons.R6.MouseLeave:Connect(function()
	Tween(buttons.R6.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)

buttons.Fly.MouseLeave:Connect(function()
	Tween(buttons.Fly.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)

buttons.Invisible.MouseLeave:Connect(function()
	Tween(buttons.Invisible.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)

buttons.Rejoin.MouseLeave:Connect(function()
	Tween(buttons.Rejoin.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)

buttons.Noclip.MouseLeave:Connect(function()
	Tween(buttons.Noclip.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)

buttons.God.MouseLeave:Connect(function()
	Tween(buttons.God.HoverText, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)