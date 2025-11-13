local content = script.Parent.Scroller
content.ScrollingEnabled = not script.SmoothingEnabled.Value 

local input = content:Clone()
input:ClearAllChildren()
input.BackgroundTransparency = 1
input.ScrollBarImageTransparency = 1
input.ZIndex = content.ZIndex + 1
input.Name = "_smoothinputframe"
input.ScrollingEnabled = script.SmoothingEnabled.Value 
input.Parent = content.Parent

script.SmoothingEnabled:GetPropertyChangedSignal("Value"):Connect(function()
	if script.SmoothingEnabled.Value then
		input.CanvasPosition = content.CanvasPosition
	end
	content.ScrollingEnabled = not script.SmoothingEnabled.Value 
	input.ScrollingEnabled = script.SmoothingEnabled.Value 
end)

input:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
	if not script.SmoothingEnabled.Value then
		content.CanvasPosition = input.CanvasPosition
	end
end)
script.InputFrame.Value = input
local function syncProperty(prop)
	content:GetPropertyChangedSignal(prop):Connect(function()
		if prop == "ZIndex" then
			input[prop] = content[prop] + 1
		else
			input[prop] = content[prop]
		end
	end)
end

syncProperty "CanvasSize"
syncProperty "Position"
syncProperty "Rotation"
syncProperty "ScrollingDirection"
syncProperty "ScrollBarThickness"
syncProperty "BorderSizePixel"
syncProperty "ElasticBehavior"
syncProperty "SizeConstraint"
syncProperty "ZIndex"
syncProperty "BorderColor3"
syncProperty "Size"
syncProperty "AnchorPoint"
syncProperty "Visible"

local smoothConnection = game:GetService("RunService").RenderStepped:Connect(function()
	if script.SmoothingEnabled.Value then
		local a = content.CanvasPosition
		local b = input.CanvasPosition
		local c = script.SmoothingFactor.Value
		local d = (b - a) * c + a
		content.CanvasPosition = d
	end
end)

content.AncestryChanged:Connect(function()
	if content.Parent == nil then
		input:Destroy()
		smoothConnection:Disconnect()
	end
end)