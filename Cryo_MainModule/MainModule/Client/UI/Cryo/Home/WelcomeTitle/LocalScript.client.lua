local textL = script.Parent
local plr = game:GetService("Players").LocalPlayer
local greet = {"It's nice out today, ".. plr.DisplayName, "How's it going, ".. plr.DisplayName, "It's been a while, ".. plr.DisplayName, "You're looking pretty good today, ".. plr.DisplayName}

function Pick()
	local num = math.random(1,#greet)
	return greet[num]
end

local text = Pick()
textL.Text = text