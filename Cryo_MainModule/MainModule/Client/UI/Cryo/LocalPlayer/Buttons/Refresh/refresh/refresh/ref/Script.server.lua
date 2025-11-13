script.Parent.OnServerEvent:Connect(function(plr)
	local hrp = plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:FindFirstChild("Torso") or plr.Character:FindFirstChild("UpperTorso")
	local pos1 = hrp.CFrame
	plr:LoadCharacter()
	local hrp2 = plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:FindFirstChild("Torso") or plr.Character:FindFirstChild("UpperTorso")
	hrp2.CFrame = pos1
end)