local textL = script.Parent
local plr = game:GetService("Players").LocalPlayer
local greet = {"Look's like you need to sit back and relax.", "Go outside and enjoy some sunlight.", "Remember to take breaks.", "Let's get you in your zone."}

function Pick()
	local num = math.random(1,#greet)
	return greet[num]
end

local text = Pick()
textL.Text = text