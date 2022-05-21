local library = {}

library["CreateWindow"] = function(uiTitle, accentColor)
	local leefulibrary = Instance.new("ScreenGui")
	local main = Instance.new("Frame")
	local mainlayout = Instance.new("UIListLayout")
	local topbar = Instance.new("Frame")
	local title = Instance.new("TextLabel")
	local titlepadding = Instance.new("UIPadding")
	local dragger = Instance.new("Frame")
	local accent = Instance.new("Frame")

	local function IGPU_fake_script() -- main.drag 
		local script = Instance.new('LocalScript', main)

		local UserInputService = game:GetService("UserInputService")
		local runService = (game:GetService("RunService"));

		local gui = script.Parent

		local dragging
		local dragInput
		local dragStart
		local startPos

		local function Lerp(a, b, m)
			return a + (b - a) * m
		end;

		local lastMousePos
		local lastGoalPos
		local DRAG_SPEED = (8); -- // The speed of the UI darg.
		local function Update(dt)
			if not (startPos) then return end;
			if not (dragging) and (lastGoalPos) then
				gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
				return 
			end;

			local delta = (lastMousePos - UserInputService:GetMouseLocation())
			local xGoal = (startPos.X.Offset - delta.X);
			local yGoal = (startPos.Y.Offset - delta.Y);
			lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
		end;

		gui.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position
				lastMousePos = UserInputService:GetMouseLocation()

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		gui.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)

		runService.Heartbeat:Connect(Update)
	end
	coroutine.wrap(IGPU_fake_script)()

	leefulibrary.Name = "leefu-library"
	leefulibrary.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	leefulibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	main.Name = "main"
	main.Parent = leefulibrary
	main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	main.Position = UDim2.new(0.339309424, 0, 0.282208592, 0)
	main.Size = UDim2.new(0, 180, 0, 250)

	mainlayout.Name = "main-layout"
	mainlayout.Parent = main
	mainlayout.SortOrder = Enum.SortOrder.LayoutOrder

	topbar.Name = "top-bar"
	topbar.Parent = main
	topbar.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
	topbar.BorderSizePixel = 0
	topbar.Size = UDim2.new(1, 0, -0.280000001, 100)

	title.Name = "title"
	title.Parent = topbar
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.Size = UDim2.new(1, 0, 1, 0)
	title.Font = Enum.Font.Code
	title.Text = uiTitle
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextSize = 17.000
	title.TextStrokeTransparency = 0.000
	title.TextXAlignment = Enum.TextXAlignment.Left

	titlepadding.Name = "title-padding"
	titlepadding.Parent = title
	titlepadding.PaddingLeft = UDim.new(0, 10)

	dragger.Name = "dragger"
	dragger.Parent = topbar
	dragger.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	dragger.BackgroundTransparency = 1.000
	dragger.Size = UDim2.new(1, 0, 1, 0)

	accent.Name = "accent"
	accent.Parent = main
	accent.BackgroundColor3 = accentColor or Color3.fromRGB(0, 170, 127)
	accent.BorderSizePixel = 0
	accent.Size = UDim2.new(1, 0, 0, 1)

	local button = {}

	button["CreateButton"] = function(btnText, callback)
		local callback = callback or function() end
		local button = Instance.new("Frame")
		local buttontext = Instance.new("TextLabel")
		local buttonstate = Instance.new("TextLabel")
		local buttontext_padding = Instance.new("UIPadding")
		local buttonmain = Instance.new("TextButton")
		
		
		button.Name = "button"
		button.Parent = main
		button.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		button.BorderSizePixel = 0
		button.Position = UDim2.new(0, 0, 0.123999998, 0)
		button.Size = UDim2.new(0, 180, 0, 25)

			
		buttontext.Name = "button-text"
		buttontext.Parent = button
		buttontext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		buttontext.BackgroundTransparency = 1.000
		buttontext.Size = UDim2.new(1, 0, 1, 0)
		buttontext.Font = Enum.Font.Code
		buttontext.Text = btnText
		buttontext.TextColor3 = Color3.fromRGB(255, 255, 255)
		buttontext.TextSize = 14.000
		buttontext.TextStrokeTransparency = 0.000
		buttontext.TextXAlignment = Enum.TextXAlignment.Left

		buttontext_padding.Parent = buttontext
		buttontext_padding.PaddingLeft = UDim.new(0,10)
			
		buttonstate.Name = "button-state"
		buttonstate.Parent = button
		buttonstate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		buttonstate.BackgroundTransparency = 1.000
		buttonstate.Size = UDim2.new(1, 0, 1, 0)
		buttonstate.Font = Enum.Font.Code
		buttonstate.Text = "+"
		buttonstate.TextColor3 = Color3.fromRGB(255, 255, 255)
		buttonstate.TextSize = 14.000
		buttonstate.TextStrokeTransparency = 0.000
		buttonstate.TextXAlignment = Enum.TextXAlignment.Right

		buttonmain.Name = "button-main"
		buttonmain.Parent = button
		buttonmain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		buttonmain.BackgroundTransparency = 1.000
		buttonmain.Size = UDim2.new(1, 0, 1, 0)
		buttonmain.Font = Enum.Font.SourceSans
		buttonmain.Text = ""
		buttonmain.TextColor3 = Color3.fromRGB(0, 0, 0)
		buttonmain.TextSize = 14.000
		buttonmain.MouseButton1Click:Connect(function()
			pcall(callback)
		end)
	end
	return button
end

return library
