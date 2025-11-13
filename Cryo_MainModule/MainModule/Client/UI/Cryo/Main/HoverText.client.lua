local frame = script.Parent
local buttons = frame.Buttons
local homeHover = buttons.Home.HomeHoverText
local localHover = buttons.Local.LocalHoverText
local playersHover = buttons.Playerlist.PlayersHoverText
local modulesHover = buttons.Modules.ModulesHoverText
local executorHover = buttons.Executor.ExecutorHoverText
local debounce = false

local tweenService = game:GetService("TweenService")

function Tween(obj, sty, dir, len, prop)
	if obj.Visible == false then obj.Visible = true end
	tweenService:Create(obj, TweenInfo.new(len, sty, dir), prop):Play()
	wait(len)
	if prop.BackgroundTransparency == 1 then obj.Visible = false end
end

buttons.Home.MouseEnter:Connect(function()
	Tween(homeHover, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.Local.MouseEnter:Connect(function()
	Tween(localHover, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.Playerlist.MouseEnter:Connect(function()
	Tween(playersHover, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.Modules.MouseEnter:Connect(function()
	Tween(modulesHover, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.Executor.MouseEnter:Connect(function()
	Tween(executorHover, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 0, TextTransparency = 0})
end)

buttons.Home.MouseLeave:Connect(function()
	Tween(homeHover, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)

buttons.Local.MouseLeave:Connect(function()
	Tween(localHover, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)

buttons.Playerlist.MouseLeave:Connect(function()
	Tween(playersHover, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)

buttons.Modules.MouseLeave:Connect(function()
	Tween(modulesHover, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)

buttons.Executor.MouseLeave:Connect(function()
	Tween(executorHover, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, .2, {BackgroundTransparency = 1, TextTransparency = 1})
end)