local KeyBox = script.Parent
local KeyBG = KeyBox.Parent

KeyBox.Focused:Connect(function()
	changed = KeyBox:GetPropertyChangedSignal("Text"):Connect(function()
		KeyBox:ReleaseFocus()
		wait()
		local keybind = string.sub(KeyBox.Text, 1, 1):upper()
		KeyBox.Text = '...'
		for _,key in pairs(Enum.KeyCode:GetEnumItems()) do
			if key.Name == keybind then
				if key == Enum.KeyCode.I then return elseif key == Enum.KeyCode.O then return end
				KeyBox.Text = keybind
				KeyBG.Parent.Parent.Parent.Key.Value = keybind
			end
		end
		changed:Disconnect()
	end)
end)