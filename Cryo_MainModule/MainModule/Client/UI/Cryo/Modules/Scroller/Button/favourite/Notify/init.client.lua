local tweenService = game:GetService("TweenService")
local notify = script.NIY
local debounce = false

function Tween(obj, sty, dir, len, prop)
	tweenService:Create(obj, TweenInfo.new(len, sty, dir), prop):Play()
end

script.Parent.MouseButton1Click:Connect(function()
	if debounce then return end
	debounce = true
	print("Not implamented yet")
	local clone = notify:Clone()
	clone.Parent = script.Parent.Parent.Parent.Parent
	clone.Visible = true
	Tween(clone,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,.8,{Position = UDim2.new(-0.003, 0, -0.7, 0)})
	wait(1.5)
	Tween(clone,Enum.EasingStyle.Quad,Enum.EasingDirection.In,.6,{Position = UDim2.new(-0.003, 0, -1.7, 0)})
	wait(.6)
	clone:Destroy()
	debounce = false
end)