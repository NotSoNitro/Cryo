-- Buggy ATM

local charInfo = {
	Transparency = {};
}
local lastpart = nil
local num = 0

script.Parent.OnServerEvent:Connect(function(plr, val)
	if val == true then
		local char = plr.Character
		for i,v in pairs(char:GetChildren()) do
			if (v:IsA("Part") or v:IsA("MeshPart")) and v.Name ~= "HumanoidRootPart" then
				charInfo.Transparency[v.Name] = v.Transparency
				if v.Name == "Head" then
					for _,d in pairs(v:GetChildren()) do
						if d:IsA("Decal") then
							charInfo.Transparency[d.Name] = d.Transparency
							d.Transparency = 1
						end
					end
				end
				v.Transparency = 1
			elseif v:IsA("Accessory") then
				for _,p in pairs(v:GetChildren()) do
					if p:IsA("Part") or p:IsA("MeshPart") then
						charInfo.Transparency[p.Name] = p.Transparency
						p.Transparency = 1
					elseif p:IsA("Trail") then
						p.Enabled = false
					end
				end
			elseif v:IsA("Model") then
				for n,p2 in pairs(v:GetDescendants()) do
					if p2:IsA("Part") or p2:IsA("MeshPart") then
						if lastpart == p2.Name then
							p2.Name = p2.Name.."_"..num
							num = num + 1
						else
							lastpart = p2.Name
						end
						charInfo.Transparency[p2.Name] = p2.Transparency
						p2.Transparency = 1
					elseif p2:IsA("Trail") then
						p2.Enabled = false
					elseif p2:IsA("ParticleEmitter") then
						p2.Enabled = false
					end
				end
				lastpart = nil
			elseif v:IsA("Trail") then
				v.Enabled = false
			elseif v:IsA("ParticleEmitter") then
				v.Enabled = false
			end
		end
		num = 0
	else
		local char = plr.Character
		for i,v in pairs(char:GetChildren()) do
			if (v:IsA("Part") or v:IsA("MeshPart")) and v.Name ~= "HumanoidRootPart" then
				if v.Name == "Head" then
					for _,d in pairs(v:GetChildren()) do
						if d:IsA("Decal") then
							d.Transparency = charInfo.Transparency[d.Name]
						end
					end
				end
				v.Transparency = charInfo.Transparency[v.Name]
			elseif v:IsA("Accessory") then
				for _,p in pairs(v:GetChildren()) do
					if p:IsA("Part") or p:IsA("MeshPart") then
						p.Transparency = charInfo.Transparency[p.Name]
					elseif p:IsA("Trail") then
						p.Enabled = true
					end
				end
			elseif v:IsA("Model") then
				for _,p2 in pairs(v:GetDescendants()) do
					if p2:IsA("Part") or p2:IsA("MeshPart") then
						p2.Transparency = charInfo.Transparency[p2.Name]
					elseif p2:IsA("Trail") then
						p2.Enabled = true
					elseif p2:IsA("ParticleEmitter") then
						p2.Enabled = true
					end
				end
			elseif v:IsA("Trail") then
				v.Enabled = true
			elseif v:IsA("ParticleEmitter") then
				v.Enabled = true
			end
		end
	end
end)