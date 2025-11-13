local button = script.Parent

button.MouseButton1Click:Connect(function()
	script.Fire:FireServer()
end)