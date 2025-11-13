-- TODO: Make it work on all scripts

local invis = script.Parent.Parent.switch
local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local goal = {BackgroundColor3 = Color3.fromRGB(0, 207, 76)}
local goal2 = {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}
local frame = script.Parent.Parent
local plr = game:GetService("Players").LocalPlayer
local charInfo = {
	Material = {};
	Transparency = {};
}
local lastpart = nil
local num = 0

script.Parent.MouseButton1Click:Connect(function()
	if invis.Value == false then
		invis.Value = true
		script.invis:FireServer(invis.Value)
		tweenService:Create(frame, tweenInfo, goal):Play()
		wait(.053)
		local char = plr.Character
		for i,v in pairs(char:GetChildren()) do
			if (v:IsA("Part") or v:IsA("MeshPart")) and v.Name ~= "HumanoidRootPart" then
				charInfo.Material[v.Name] = v.Material
				charInfo.Transparency[v.Name] = v.Transparency
				v.Material = Enum.Material.ForceField
				v.Transparency = 0
			elseif v:IsA("Accessory") then
				for _,p in pairs(v:GetChildren()) do
					if p:IsA("Part") or p:IsA("MeshPart") then
						charInfo.Material[p.Name] = p.Material
						charInfo.Transparency[p.Name] = p.Transparency
						p.Material = Enum.Material.ForceField
						p.Transparency = 0
					elseif p:IsA("Trail") then
						p.Enabled = true
					end
				end
			elseif v:IsA("Model") then
				for _,p2 in pairs(v:GetChildren()) do
					if p2:IsA("Part") or p2:IsA("MeshPart") then
						if lastpart == p2.Name then
							p2.Name = p2.Name.."_"..num
							num = num + 1
						else
							lastpart = p2.Name
						end
						charInfo.Material[p2.Name] = p2.Material
						charInfo.Transparency[p2.Name] = p2.Transparency
						p2.Material = Enum.Material.ForceField
						p2.Transparency = 0
					elseif p2:IsA("Trail") then
						p2.Enabled = true
					elseif p2:IsA("ParticleEmitter") then
						p2.Enabled = true
					end
				end
				lastpart = nil
			elseif v:IsA("Trail") then
				v.Enabled = true
			elseif v:IsA("Tool") then
				for _,p3 in pairs(v:GetDescendants()) do
					if p3:IsA("Part") or p3:IsA("MeshPart") then
						charInfo.Material[p3.Name] = p3.Material
						charInfo.Transparency[p3.Name] = p3.Transparency
						p3.Material = Enum.Material.ForceField
						p3.Transparency = 0
					elseif p3:IsA("Trail") then
						p3.Enabled = true
					elseif p3:IsA("ParticleEmitter") then
						p3.Enabled = false
					end
				end
			end
		end
		num = 0
	else
		invis.Value = false
		script.invis:FireServer(invis.Value)
		tweenService:Create(frame, tweenInfo, goal2):Play()
		local char = plr.Character
		for i,v in pairs(char:GetChildren()) do
			if (v:IsA("Part") or v:IsA("MeshPart")) and v.Name ~= "HumanoidRootPart" then
				v.Material = charInfo.Material[v.Name]
				v.Transparency = charInfo.Transparency[v.Name]
			elseif v:IsA("Accessory") then
				for _,p in pairs(v:GetChildren()) do
					if p:IsA("Part") or p:IsA("MeshPart") then
						p.Material = charInfo.Material[p.Name]
						p.Transparency = charInfo.Transparency[p.Name]
					end
				end
			elseif v:IsA("Model") then
				for _,p2 in pairs(v:GetChildren()) do
					if p2:IsA("Part") or p2:IsA("MeshPart") then
						p2.Material = charInfo.Material[p2.Name]
						p2.Transparency = charInfo.Transparency[p2.Name]
					end
				end
			elseif v:IsA("Tool") then
				for _,p3 in pairs(v:GetChildren()) do
					if p3:IsA("Part") or p3:IsA("MeshPart") then
						p3.Material = charInfo.Material[p3.Name]
						p3.Transparency = charInfo.Transparency[p3.Name]
					elseif p3:IsA("Trail") then
						p3.Enabled = true
					elseif p3:IsA("ParticleEmitter") then
						p3.Enabled = true
					end
				end
			end
		end
	end
end)

plr.CharacterAdded:Connect(function()
	if invis.Value == false then return end
	invis.Value = false
	tweenService:Create(frame, tweenInfo, goal2):Play()
end)