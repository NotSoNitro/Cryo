------------// (V) Variables (V) \\------------

local mainFrame = script.Parent
local homeButton = script.Parent.Buttons.Home.homeButton
local homeFrame = homeButton.Parent
local homeMain = homeFrame.Parent.Parent
local homePage = homeMain.Parent.Home
local localButton = script.Parent.Buttons.Local.localButton
local localFrame = localButton.Parent
local localMain = localFrame.Parent.Parent
local localPage = localMain.Parent.LocalPlayer
local executorButton = script.Parent.Buttons.Executor.executorButton
local executorFrame = executorButton.Parent
local executorMain = executorFrame.Parent.Parent
local executorPage = executorMain.Parent.Executor
local modulesButton = script.Parent.Buttons.Modules.modulesButton
local modulesFrame = modulesButton.Parent
local modulesMain = modulesFrame.Parent.Parent
local modulesPage = modulesMain.Parent.Modules
local playerlistButton = script.Parent.Buttons.Playerlist.playerlistButton
local playerlistFrame = playerlistButton.Parent
local playerlistMain = playerlistFrame.Parent.Parent
local playerlistPage = playerlistMain.Parent.Playerlist

local currentFov

local starterGui = game:GetService("StarterGui")
local userInput = game:GetService("UserInputService")

local homeOpen = false
local localOpen = false
local executorOpen = false
local modulesOpen = false
local playerlistOpen = false
local homeDebounce = false
local debounce = false
local mainClosed = false


------------// (T) Tweens (T) \\------------

local tweenService = game:GetService("TweenService")

local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

local buttonInfo = TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local shadowInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local frames1Info = TweenInfo.new(0.9, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local frames2Info = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local musicInfo = TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local fpsInfo = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local blurAndfovInfo = TweenInfo.new(0.7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local welcomeInfo = TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)


------------// (S) Script (S) \\------------

-- Home Menu
homeButton.MouseButton1Click:Connect(function()
	if homeDebounce == true then return end
	homeDebounce = true
	if homeOpen == false then
		homeOpen = true
		homePage.Visible = true
		starterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
		local camera = workspace.CurrentCamera
		currentFov = camera.FieldOfView
		local blur = Instance.new("BlurEffect")
		blur.Name = "HomeBlur"
		blur.Size = 0
		blur.Parent = game:GetService("Lighting")
		tweenService:Create(homeButton.Parent, buttonInfo, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		tweenService:Create(homeButton, buttonInfo, {ImageColor3 = Color3.fromRGB(54, 54, 54)}):Play()
		tweenService:Create(blur, blurAndfovInfo, {Size = 14}):Play()
		tweenService:Create(camera, blurAndfovInfo, {FieldOfView = 50}):Play()
		for _,homeMain in pairs(homePage:GetChildren()) do
			if homeMain:IsA("Frame") then
				if homeMain.Name == "GlassShadow" then
					tweenService:Create(homeMain, shadowInfo, {Transparency = 0.55}):Play()
				elseif homeMain.Name == "Details" then
					tweenService:Create(homeMain, frames1Info, {Position = UDim2.new(0.078, 0, 0.481, 0)}):Play()
				elseif homeMain.Name == "Friends" then
					tweenService:Create(homeMain, frames2Info, {Position = UDim2.new(0.258, 0, 0.35, 0)}):Play()
				elseif homeMain.Name == "User" then
					task.wait(.1)
					tweenService:Create(homeMain, frames2Info, {Position = UDim2.new(0.245, 0, 0.51, 0)}):Play()
				elseif homeMain.Name == "Keybind" then
					task.wait(.1)
					tweenService:Create(homeMain, frames2Info, {Position = UDim2.new(0.217, 0, 0.626, 0)}):Play()
				elseif homeMain.Name == "Music" then
					tweenService:Create(homeMain, musicInfo, {Position = UDim2.new(0.896, 0, 0.913, 0)}):Play()
				elseif homeMain.Name == "FPS" then
					tweenService:Create(homeMain, fpsInfo, {Position = UDim2.new(0.95, 0, 0.027, 0)}):Play()
				end
			elseif homeMain:IsA("TextLabel") then
				task.wait(.15)
				if homeMain.Name == "WelcomeTitle" then
					tweenService:Create(homeMain, welcomeInfo, {TextTransparency = 0}):Play()
				elseif homeMain.Name == "WelcomeSubtitle" then
					tweenService:Create(homeMain, welcomeInfo, {TextTransparency = 0.3}):Play()
				end
			end
		end
		task.wait(1.1)
		homeDebounce = false
	else
		homeOpen = false
		local camera = workspace.CurrentCamera
		local blur = game:GetService("Lighting"):FindFirstChild("HomeBlur")
		tweenService:Create(homeButton.Parent, buttonInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
		tweenService:Create(homeButton, buttonInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		tweenService:Create(blur, blurAndfovInfo, {Size = 0}):Play()
		tweenService:Create(camera, blurAndfovInfo, {FieldOfView = currentFov}):Play()
		for _,homeMain in pairs(homePage:GetChildren()) do
			if homeMain:IsA("TextLabel") then
				if homeMain.Name == "WelcomeTitle" then
					tweenService:Create(homeMain, welcomeInfo, {TextTransparency = 1}):Play()
				elseif homeMain.Name == "WelcomeSubtitle" then
					tweenService:Create(homeMain, welcomeInfo, {TextTransparency = 1}):Play()
				end
			elseif homeMain:IsA("Frame") then
				if homeMain.Name == "FPS" then
					tweenService:Create(homeMain, fpsInfo, {Position = UDim2.new(0.95, 0, -0.2, 0)}):Play()
				elseif homeMain.Name == "Music" then
					tweenService:Create(homeMain, musicInfo, {Position = UDim2.new(0.896, 0, 1.2, 0)}):Play()
				elseif homeMain.Name == "Friends" then
					tweenService:Create(homeMain, frames2Info, {Position = UDim2.new(-0.5, 0, 0.35, 0)}):Play()
				elseif homeMain.Name == "Keybind" then
					task.wait(.1)
					tweenService:Create(homeMain, frames2Info, {Position = UDim2.new(-0.5, 0, 0.626, 0)}):Play()
				elseif homeMain.Name == "User" then
					task.wait(.1)
					tweenService:Create(homeMain, frames2Info, {Position = UDim2.new(-0.5, 0, 0.51, 0)}):Play()
				elseif homeMain.Name == "Details" then
					tweenService:Create(homeMain, frames1Info, {Position = UDim2.new(-0.5, 0, 0.481, 0)}):Play()
				elseif homeMain.Name == "GlassShadow" then
					task.wait(.15)
					tweenService:Create(homeMain, shadowInfo, {Transparency = 1}):Play()
				end
			end
		end
		task.wait(0.6)
		starterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
		blur:Destroy()
		homePage.Visible = false
		homeDebounce = false
	end
end)

-- LocalPlayer Button
localButton.MouseButton1Click:Connect(function()

	if debounce == true then return end
	debounce = true

	if localOpen == false then

		local run = coroutine.create(function()
			executorOpen = false
			local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(executorPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(executorButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(executorButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.7)
			executorPage.Visible = false
		end)
		local run2 = coroutine.create(function()
			modulesOpen = false
			local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(modulesPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(modulesButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(modulesButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.7)
			modulesPage.Visible = false
		end)
		local run3 = coroutine.create(function()
			playerlistOpen = false
			local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(playerlistPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(playerlistButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(playerlistButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.7)
			executorPage.Visible = false
		end)

		if executorOpen then
			coroutine.resume(run)
		elseif modulesOpen then
			coroutine.resume(run2)
		elseif playerlistOpen then
			coroutine.resume(run3)
		else
			run = nil
			run2 = nil
			run3 = nil
		end

		localOpen = true
		localPage.Visible = true

		local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		tweenService:Create(localPage, tweenInfo2, {Position = UDim2.new(0.5, 0,0.81, 0)}):Play()
		tweenService:Create(localButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		tweenService:Create(localButton, tweenInfo, {ImageColor3 = Color3.fromRGB(54, 54, 54)}):Play()

		task.wait(0.7)
		debounce = false

	else

		localOpen = false
		local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		tweenService:Create(localPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
		tweenService:Create(localButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
		tweenService:Create(localButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

		task.wait(0.7)
		localPage.Visible = false
		debounce = false

	end

end)

-- Executor Button
executorButton.MouseButton1Click:Connect(function()

	if debounce == true then return end
	debounce = true

	if executorOpen == false then

		local run = coroutine.create(function()
			localOpen = false
			local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(localPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(localButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(localButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.7)
			localPage.Visible = false
		end)
		local run2 = coroutine.create(function()
			modulesOpen = false
			local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(modulesPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(modulesButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(modulesButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.7)
			modulesPage.Visible = false
		end)
		local run3 = coroutine.create(function()
			playerlistOpen = false
			local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(playerlistPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(playerlistButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(playerlistButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.7)
			playerlistPage.Visible = false
		end)

		if localOpen then
			coroutine.resume(run)
		elseif modulesOpen then
			coroutine.resume(run2)
		elseif playerlistOpen then
			coroutine.resume(run3)
		else
			run = nil
			run2 = nil
			run3 = nil
		end

		executorOpen = true		
		executorPage.Visible = true

		local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		tweenService:Create(executorPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 0.761, 0)}):Play()
		tweenService:Create(executorButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		tweenService:Create(executorButton, tweenInfo, {ImageColor3 = Color3.fromRGB(54, 54, 54)}):Play()

		task.wait(0.7)
		debounce = false

	else

		executorOpen = false
		local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		tweenService:Create(executorPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
		tweenService:Create(executorButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
		tweenService:Create(executorButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

		task.wait(0.7)
		executorPage.Visible = false
		debounce = false

	end

end)

-- Modules Button
modulesButton.MouseButton1Click:Connect(function()

	if debounce == true then return end
	debounce = true

	if modulesOpen == false then

		local run = coroutine.create(function()
			localOpen = false
			local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(localPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(localButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(localButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.7)
			localPage.Visible = false
		end)
		local run2 = coroutine.create(function()
			executorOpen = false
			local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(executorPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(executorButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(executorButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.7)
			executorPage.Visible = false
		end)
		local run3 = coroutine.create(function()
			playerlistOpen = false
			local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(playerlistPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(playerlistButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(playerlistButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.7)
			executorPage.Visible = false
		end)
		
		if localOpen then
			coroutine.resume(run)
		elseif executorOpen then
			coroutine.resume(run2)
		elseif playerlistOpen then
			coroutine.resume(run3)
		else
			run = nil
			run2 = nil
			run3 = nil
		end

		modulesOpen = true		
		modulesPage.Visible = true

		local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		tweenService:Create(modulesPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 0.715, 0)}):Play()
		tweenService:Create(modulesButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		tweenService:Create(modulesButton, tweenInfo, {ImageColor3 = Color3.fromRGB(54, 54, 54)}):Play()

		task.wait(0.7)
		debounce = false

	else

		modulesOpen = false
		local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		tweenService:Create(modulesPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
		tweenService:Create(modulesButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
		tweenService:Create(modulesButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

		task.wait(0.7)
		modulesPage.Visible = false
		debounce = false

	end

end)

-- Playerlist Button
playerlistButton.MouseButton1Click:Connect(function()

	if debounce == true then return end
	debounce = true

	if playerlistOpen == false then

		local run = coroutine.create(function()
			localOpen = false
			local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(localPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(localButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(localButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.7)
			localPage.Visible = false
		end)
		local run2 = coroutine.create(function()
			executorOpen = false
			local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(executorPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(executorButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(executorButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.7)
			executorPage.Visible = false
		end)
		local run3 = coroutine.create(function()
			modulesOpen = false
			local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(modulesPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(modulesButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(modulesButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.7)
			modulesPage.Visible = false
		end)

		if localOpen then
			coroutine.resume(run)
		elseif executorOpen then
			coroutine.resume(run2)
		elseif modulesOpen then
			coroutine.resume(run3)
		else
			run = nil
			run2 = nil
			run3 = nil
		end

		playerlistOpen = true		
		playerlistPage.Visible = true

		local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		tweenService:Create(playerlistPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 0.785, 0)}):Play()
		tweenService:Create(playerlistButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
		tweenService:Create(playerlistButton, tweenInfo, {ImageColor3 = Color3.fromRGB(54, 54, 54)}):Play()

		task.wait(0.7)
		debounce = false

	else

		playerlistOpen = false
		local tweenInfo2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

		tweenService:Create(playerlistPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
		tweenService:Create(playerlistButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
		tweenService:Create(playerlistButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

		task.wait(0.7)
		playerlistPage.Visible = false
		debounce = false

	end

end)



-- Trancparency Timer
local opaqueTween = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local transparencyTween = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 7.6)
tweenService:Create(mainFrame, transparencyTween, {BackgroundTransparency = 0.7}):Play()
for _,item in pairs(mainFrame:GetDescendants()) do -- initial start 

	if item:IsA("Frame") and item.BackgroundTransparency ~= 1 then
		tweenService:Create(item, transparencyTween, {BackgroundTransparency = 0.7}):Play()
	elseif item:IsA("TextLabel") and not item.Name:find("HoverText") then
		tweenService:Create(item, transparencyTween, {TextTransparency = 0.7}):Play()
	elseif item:IsA("ImageButton") then
		tweenService:Create(item, transparencyTween, {ImageTransparency = 0.7}):Play()
	end

end

mainFrame.MouseEnter:Connect(function()
	if mainClosed == true then return end
	tweenService:Create(mainFrame, opaqueTween, {BackgroundTransparency = 0}):Play()
	for _,item in pairs(mainFrame:GetDescendants()) do
		
		if item:IsA("Frame") and item.BackgroundTransparency ~= 1 then
			tweenService:Create(item, opaqueTween, {BackgroundTransparency = 0}):Play()
		elseif item:IsA("TextLabel") and not item.Name:find("HoverText") then
			tweenService:Create(item, opaqueTween, {TextTransparency = 0}):Play()
		elseif item:IsA("ImageButton") then
			tweenService:Create(item, opaqueTween, {ImageTransparency = 0}):Play()
		end

	end
end)

mainFrame.Buttons.MouseEnter:Connect(function()
	if mainClosed == true then return end
	tweenService:Create(mainFrame, opaqueTween, {BackgroundTransparency = 0}):Play()
	for _,item in pairs(mainFrame:GetDescendants()) do

		if item:IsA("Frame") and item.BackgroundTransparency ~= 1 then
			tweenService:Create(item, opaqueTween, {BackgroundTransparency = 0}):Play()
		elseif item:IsA("TextLabel") and not item.Name:find("HoverText") then
			tweenService:Create(item, opaqueTween, {TextTransparency = 0}):Play()
		elseif item:IsA("ImageButton") then
			tweenService:Create(item, opaqueTween, {ImageTransparency = 0}):Play()
		end

	end
end)

mainFrame.Time.MouseEnter:Connect(function()
	if mainClosed == true then return end
	tweenService:Create(mainFrame, opaqueTween, {BackgroundTransparency = 0}):Play()
	for _,item in pairs(mainFrame:GetDescendants()) do

		if item:IsA("Frame") and item.BackgroundTransparency ~= 1 then
			tweenService:Create(item, opaqueTween, {BackgroundTransparency = 0}):Play()
		elseif item:IsA("TextLabel") and not item.Name:find("HoverText") then
			tweenService:Create(item, opaqueTween, {TextTransparency = 0}):Play()
		elseif item:IsA("ImageButton") then
			tweenService:Create(item, opaqueTween, {ImageTransparency = 0}):Play()
		end

	end
end)

mainFrame.MouseLeave:Connect(function()
	if mainClosed == true then return end
	task.wait(.4)
	tweenService:Create(mainFrame, transparencyTween, {BackgroundTransparency = 0.7}):Play()
	for _,item in pairs(mainFrame:GetDescendants()) do
		
		if item:IsA("Frame") and not (item.Name:find("Buttons") or item.Name:find("Page")) then
			tweenService:Create(item, transparencyTween, {BackgroundTransparency = 0.7}):Play()
		elseif item:IsA("TextLabel") and not item.Name:find("HoverText") then
			tweenService:Create(item, transparencyTween, {TextTransparency = 0.7}):Play()
		elseif item:IsA("ImageButton") then
			tweenService:Create(item, transparencyTween, {ImageTransparency = 0.7}):Play()
		end

	end
end)

mainFrame.Buttons.MouseLeave:Connect(function()
	if mainClosed == true then return end
	task.wait(.4)
	tweenService:Create(mainFrame, transparencyTween, {BackgroundTransparency = 0.7}):Play()
	for _,item in pairs(mainFrame:GetDescendants()) do

		if item:IsA("Frame") and not (item.Name:find("Buttons") or item.Name:find("Page")) then
			tweenService:Create(item, transparencyTween, {BackgroundTransparency = 0.7}):Play()
		elseif item:IsA("TextLabel") and not item.Name:find("HoverText") then
			tweenService:Create(item, transparencyTween, {TextTransparency = 0.7}):Play()
		elseif item:IsA("ImageButton") then
			tweenService:Create(item, transparencyTween, {ImageTransparency = 0.7}):Play()
		end

	end
end)

mainFrame.Time.MouseLeave:Connect(function()
	if mainClosed == true then return end
	task.wait(.4)
	tweenService:Create(mainFrame, transparencyTween, {BackgroundTransparency = 0.7}):Play()
	for _,item in pairs(mainFrame:GetDescendants()) do

		if item:IsA("Frame") and not (item.Name:find("Buttons") or item.Name:find("Page")) then
			tweenService:Create(item, transparencyTween, {BackgroundTransparency = 0.7}):Play()
		elseif item:IsA("TextLabel") and not item.Name:find("HoverText") then
			tweenService:Create(item, transparencyTween, {TextTransparency = 0.7}):Play()
		elseif item:IsA("ImageButton") then
			tweenService:Create(item, transparencyTween, {ImageTransparency = 0.7}):Play()
		end

	end
end)

-- Keybind Handling
local debounce2 = false
userInput.InputBegan:Connect(function(input, gpe)
	if debounce2 == true then return end
	debounce2 = true
	local closeKeybindValue = mainFrame.Parent.Key.Value
	local closeKeybind = Enum.KeyCode[closeKeybindValue]
	if input.KeyCode == closeKeybind and mainClosed == false and not userInput:GetFocusedTextBox() then
		mainClosed = true
		local closeTween = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
		
		local run = coroutine.create(function()
			localOpen = false
			local tweenInfo2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(localPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(localButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(localButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.5)
			localPage.Visible = false
		end)
		local run2 = coroutine.create(function()
			executorOpen = false
			local tweenInfo2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(executorPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(executorButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(executorButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.5)
			executorPage.Visible = false
		end)
		local run3 = coroutine.create(function()
			modulesOpen = false
			local tweenInfo2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(modulesPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(modulesButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(modulesButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.5)
			modulesPage.Visible = false
		end)
		local run4 = coroutine.create(function()
			playerlistOpen = false
			local tweenInfo2 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

			tweenService:Create(playerlistPage, tweenInfo2, {Position = UDim2.new(0.5, 0, 1.2, 0)}):Play()
			tweenService:Create(playerlistButton.Parent, tweenInfo, {BackgroundColor3 = Color3.fromRGB(54, 54, 54)}):Play()
			tweenService:Create(playerlistButton, tweenInfo, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()

			task.wait(0.5)
			modulesPage.Visible = false
		end)

		if localOpen then
			coroutine.resume(run)
			task.wait(0.55)
		elseif executorOpen then
			coroutine.resume(run2)
			task.wait(0.55)
		elseif modulesOpen then
			coroutine.resume(run3)
			task.wait(0.55)
		elseif playerlistOpen then
			coroutine.resume(run4)
			task.wait(0.55)
		else
			run = nil
			run2 = nil
			run3 = nil
			run4 = nil
		end
		for _,item in pairs(mainFrame:GetDescendants()) do
			
			if item:IsA("Frame") and not (item.Name:find("Buttons")) then
				tweenService:Create(item, closeTween, {BackgroundTransparency = 1}):Play()
			elseif item:IsA("TextLabel") then
				tweenService:Create(item, closeTween, {TextTransparency = 1}):Play()
			elseif item:IsA("ImageButton") then
				tweenService:Create(item, closeTween, {ImageTransparency = 1}):Play()
			end

		end
		task.wait(.1)
		tweenService:Create(mainFrame, closeTween, {BackgroundTransparency = 0.7}):Play()
		task.wait(.12)
		tweenService:Create(mainFrame, closeTween, {Size = UDim2.new((mainFrame.Size.X.Scale / 1.25), 0, (mainFrame.Size.Y.Scale / 1.25), 0)}):Play()
		task.wait(.5)
		tweenService:Create(mainFrame, closeTween, {Position = UDim2.new(0.5, 0, 1.1, 0)}):Play()
		task.wait(.5)
	elseif input.KeyCode == closeKeybind and mainClosed == true and not userInput:GetFocusedTextBox() then
		local openTween = TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
		tweenService:Create(mainFrame, openTween, {Position = UDim2.new(0.5, 0, 0.952, 0)}):Play()
		task.wait(.4)
		tweenService:Create(mainFrame, openTween, {Size = UDim2.new(0.264, 0, 0.067, 0)}):Play()
		task.wait(.2)
		tweenService:Create(mainFrame, openTween, {BackgroundTransparency = 0}):Play()
		task.wait(.1)
		for _,item in pairs(mainFrame:GetDescendants()) do
			task.wait()
			if item:IsA("Frame") and not (item.Name:find("Buttons")) then
				tweenService:Create(item, openTween, {BackgroundTransparency = 0}):Play()
			elseif item:IsA("TextLabel") then
				tweenService:Create(item, openTween, {TextTransparency = 0}):Play()
			elseif item:IsA("ImageButton") then
				tweenService:Create(item, openTween, {ImageTransparency = 0}):Play()
			end

		end
		task.wait(.7)
		mainClosed = false
	end
	debounce2 = false
end)