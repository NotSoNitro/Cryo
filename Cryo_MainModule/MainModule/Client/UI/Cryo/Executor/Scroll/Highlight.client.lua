-- Might change this to lexer

local lua_keywords = {"and", "break", "do", "else", "elseif", "end", "false", "for", "function", "goto", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while"}
local global_env = {"getrawmetatable", "game", "workspace", "script", "math", "string", "table", "print", "wait", "BrickColor", "Color3", "next", "pairs", "ipairs", "select", "unpack", "Instance", "Vector2", "Vector3", "CFrame", "Ray", "UDim2", "Enum", "assert", "error", "warn", "tick", "loadstring", "_G", "shared", "getfenv", "setfenv", "newproxy", "setmetatable", "getmetatable", "os", "date", "difftime", "clock", "debug", "pcall", "ypcall", "xpcall", "rawequal", "rawset", "rawget", "tonumber", "tostring", "type", "typeof", "_VERSION", "coroutine", "delay", "require", "spawn", "LoadLibrary", "settings", "stats", "time", "UserSettings", "version", "Axes", "ColorSequence", "Faces", "ColorSequenceKeypoint", "NumberRange", "NumberSequence", "NumberSequenceKeypoint", "gcinfo", "elapsedTime", "collectgarbage", "PhysicalProperties", "Rect", "Region3", "Region3int16", "UDim", "Vector2int16", "Vector3int16", "load", "fire", "Fire"}

local Source = script.Parent.Code
local Lines = script.Parent.Lines
local resources = script.Parent.Parent.Resources
local tweenService = game:GetService("TweenService")
local Password = ""
for i,v in pairs(script.Parent.Parent:GetChildren()) do
	if v:IsA("SelectionBox") then
		Password = v.PasswordRemote.Value
	end
end

local Highlight = function(string, keywords)
    local K = {}
    local S = string
    local Token =
    {
        ["="] = true,
        ["."] = true,
        [","] = true,
        ["("] = true,
        [")"] = true,
        ["["] = true,
        ["]"] = true,
        ["{"] = true,
        ["}"] = true,
        [":"] = true,
        ["*"] = true,
        ["/"] = true,
        ["+"] = true,
        ["-"] = true,
        ["%"] = true,
		[";"] = true,
		["~"] = true
    }
    for i, v in pairs(keywords) do
        K[v] = true
    end
    S = S:gsub(".", function(c)
        if Token[c] ~= nil then
            return "\32"
        else
            return c
        end
    end)
    S = S:gsub("%S+", function(c)
        if K[c] ~= nil then
            return c
        else
            return (" "):rep(#c)
        end
    end)
    return S
end

local hTokens = function(string)
    local Token =
    {
        ["="] = true,
        ["."] = true,
        [","] = true,
        ["("] = true,
        [")"] = true,
        ["["] = true,
        ["]"] = true,
        ["{"] = true,
        ["}"] = true,
        [":"] = true,
        ["*"] = true,
        ["/"] = true,
        ["+"] = true,
        ["-"] = true,
        ["%"] = true,
		[";"] = true,
		["~"] = true
    }
    local A = ""
    string:gsub(".", function(c)
        if Token[c] ~= nil then
            A = A .. c
        elseif c == "\n" then
            A = A .. "\n"
		elseif c == "\t" then
			A = A .. "\t"
        else
            A = A .. "\32"
        end
    end)
    return A
end

local strings = function(string)
    local highlight = ""
	local quote = false
	local semiquote = false
    string:gsub(".", function(c)
        if quote == false and c == "\"" then
            quote = true
        elseif quote == true and c == "\"" then
			quote = false
		elseif semiquote == false and c == "\'" then
			semiquote = true
		elseif semiquote == true and c == "\'" then
			semiquote = false
        end
        if quote == false and c == "\"" then
			highlight = highlight .. "\""
		elseif semiquote == false and c == "\'" then
			highlight = highlight .. "\'"
        elseif c == "\n" then
            highlight = highlight .. "\n"
		elseif c == "\t" then
		    highlight = highlight .. "\t"
        elseif quote == true or semiquote == true then
            highlight = highlight .. c
		elseif quote == false or semiquote == false then
            highlight = highlight .. "\32"
        end
    end)
    return highlight
end

local comments = function(string)
    local ret = ""
    string:gsub("[^\r\n]+", function(c)
        local comm = false
        local i = 0
        c:gsub(".", function(n)
            i = i + 1
            if c:sub(i, i + 1) == "--" then
                comm = true
            end
            if comm == true then
                ret = ret .. n
            else
                ret = ret .. "\32"
            end
        end)
        ret = ret
    end)
    return ret
end

local numbers = function(string)
    local A = ""
    string:gsub(".", function(c)
        if tonumber(c) ~= nil then
            A = A .. c
        elseif c == "\n" then
            A = A .. "\n"
		elseif c == "\t" then
			A = A .. "\t"
        else
            A = A .. "\32"
        end
    end)
    return A
end

local highlight_source = function(type)
	if type == "Text" then
		Source.Text = Source.Text:gsub("\13", "")
		Source.Text = Source.Text:gsub("\t", "      ")
		local s = Source.Text
		Source.Keywords_.Text = Highlight(s, lua_keywords)
		Source.Globals_.Text = Highlight(s, global_env)
		Source.RemoteHighlight_.Text = Highlight(s, {"FireServer", "fireServer", "InvokeServer", "invokeServer"})
		Source.Tokens_.Text = hTokens(s)
		Source.Numbers_.Text = numbers(s)
		Source.Strings_.Text = strings(s)
		local lin = 1
		s:gsub("\n", function()
			lin = lin + 1
		end)
		Lines.Text = ""
		for i = 1, lin do
			Lines.Text = Lines.Text .. i .. "\n"
		end
	end
end

highlight_source("Text")

Source.Changed:Connect(highlight_source)

local Clearbut=script.Parent.Parent.Clear
local ExecuteBut=script.Parent.Parent.Execute
local HideBut=script.Parent.Parent.Hide
local hiddenText=Source.Hidden_
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local hide = false
local debounce = false

ExecuteBut.MouseButton1Down:connect(function()
	local succ,callback = pcall(function() resources.Parent:WaitForChild("RemoteHandler").Remote:FireServer(tostring(Source.Text),Password) end)
	if succ then
		script.Parent.Parent.Success.Text = "Executed!"
		tweenService:Create(script.Parent.Parent.Success, tweenInfo, {TextTransparency = 0}):Play()
		wait(.6)
		tweenService:Create(script.Parent.Parent.Success, tweenInfo, {TextTransparency = 1}):Play()
	end
end)

Clearbut.MouseButton1Down:Connect(function()
	script.Parent.Parent.Success.Text = "Cleared!"
	Source.Text = ""
	tweenService:Create(script.Parent.Parent.Success, tweenInfo, {TextTransparency = 0}):Play()
	wait(.6)
	tweenService:Create(script.Parent.Parent.Success, tweenInfo, {TextTransparency = 1}):Play()
end)

HideBut.MouseButton1Click:Connect(function()
	if debounce == true then return end
	if hide == false then
		debounce = true
		tweenService:Create(Source, tweenInfo, {TextTransparency = 1}):Play()
		tweenService:Create(Source.Comments_, tweenInfo, {TextTransparency = 1}):Play()
		tweenService:Create(Source.Globals_, tweenInfo, {TextTransparency = 1}):Play()
		tweenService:Create(Source.Keywords_, tweenInfo, {TextTransparency = 1}):Play()
		tweenService:Create(Source.Numbers_, tweenInfo, {TextTransparency = 1}):Play()
		tweenService:Create(Source.RemoteHighlight_, tweenInfo, {TextTransparency = 1}):Play()
		tweenService:Create(Source.Strings_, tweenInfo, {TextTransparency = 1}):Play()
		tweenService:Create(Source.Tokens_, tweenInfo, {TextTransparency = 1}):Play()
		HideBut.ImageRectOffset = Vector2.new(564, 44)
		wait(.5)
		tweenService:Create(hiddenText, tweenInfo, {TextTransparency = 0}):Play()
		wait(.5)
		hide = true
		debounce = false
	else
		debounce = true
		tweenService:Create(hiddenText, tweenInfo, {TextTransparency = 1}):Play()
		HideBut.ImageRectOffset = Vector2.new(84, 44)
		wait(.5)
		tweenService:Create(Source.Comments_, tweenInfo, {TextTransparency = 0}):Play()
		tweenService:Create(Source.Globals_, tweenInfo, {TextTransparency = 0}):Play()
		tweenService:Create(Source.Keywords_, tweenInfo, {TextTransparency = 0}):Play()
		tweenService:Create(Source.Numbers_, tweenInfo, {TextTransparency = 0}):Play()
		tweenService:Create(Source.RemoteHighlight_, tweenInfo, {TextTransparency = 0}):Play()
		tweenService:Create(Source.Strings_, tweenInfo, {TextTransparency = 0}):Play()
		tweenService:Create(Source.Tokens_, tweenInfo, {TextTransparency = 0}):Play()
		tweenService:Create(Source, tweenInfo, {TextTransparency = 0}):Play()
		wait(.5)
		hide = false
		debounce = false
	end
end)

Source:GetPropertyChangedSignal("Text"):Connect(function(t)
	local text = hiddenText
	local finalText = ""
	if #Source.Text > #text.Text and Source.Text:sub(#Source.Text,#Source.Text) ~= "\n" then
		text.Text = ''
		for i = 1,#Source.Text do
			finalText = finalText.."*"
		end	
	elseif #Source.Text < #text.Text and Source.Text:sub(#Source.Text,#Source.Text) ~= "\n" then
		text.Text = ''
		for i = 1,#Source.Text do
			finalText = finalText.."*"
		end
	end
	text.Text = finalText
end)

local list = {"print('Hello world!)", "print('Skids will always be skids and shall stay skids.')", "print('Stop talking to yourself in the mirror idiot.')", "print('Your're lonely, go get a cake and feel better :)')", "print('This is just random text lol.')", "print('Random print script :D')", "print('Just so you know, I love you.')", "print('Tatical Nuke Incoming!')", "print('Killed "..game.Players.LocalPlayer.Name.."!')"}
Source.Text = list[math.random(1,#list)]

while true do
	script.Name = game:GetService("HttpService"):GenerateGUID()
	wait(1)
end