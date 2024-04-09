local ReaperHub = {}

function ReaperHub:DraggingEnabled(frame, parent)
	parent = parent or frame

	local gui = parent
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		game:GetService("TweenService"):Create(gui,TweenInfo.new(0.15), {
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		}):Play()
		--gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

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

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end


local firstTabOpened = false
function ReaperHub.SetupUI(config)
	config = config or {}
	config.Title = config.Title or "Reaper Hub UI Library"
	
	local ReaperHubUILibrary = Instance.new("ScreenGui")
	local ReaperHubUI = Instance.new("Frame")
	local TopBar = Instance.new("Frame")
	local TitleIcock = Instance.new("ImageLabel")
	local Title = Instance.new("TextLabel")
	local Destroy = Instance.new("ImageButton")
	local Background = Instance.new("ImageLabel")
	local minimized = Instance.new("ImageButton")
	local ContainerForAllShitz = Instance.new("Frame")
	local Kontol = Instance.new("ScrollingFrame")
	local KontolListLayout = Instance.new("UIListLayout")
	local TabContainer = Instance.new("Frame")
	local Title_2 = Instance.new("TextLabel")
	ReaperHub:DraggingEnabled(TopBar, ReaperHubUI)
	

	ReaperHubUILibrary.Name = "Reaper Hub UI Library"
	ReaperHubUILibrary.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ReaperHubUILibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	ReaperHubUI.Name = "Reaper Hub UI"
	ReaperHubUI.Parent = ReaperHubUILibrary
	ReaperHubUI.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	ReaperHubUI.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ReaperHubUI.BorderSizePixel = 0
	ReaperHubUI.Position = UDim2.new(0.288043469, 0, 0.262357414, 0)
	ReaperHubUI.Size = UDim2.new(0, 360, 0, 240)

	TopBar.Name = "TopBar"
	TopBar.Parent = ReaperHubUI
	TopBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Size = UDim2.new(0, 360, 0, 30)

	TitleIcock.Name = "TitleIcock"
	TitleIcock.Parent = TopBar
	TitleIcock.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleIcock.BackgroundTransparency = 1.000
	TitleIcock.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TitleIcock.BorderSizePixel = 0
	TitleIcock.Position = UDim2.new(-0.0155555727, 0, 0, 0)
	TitleIcock.Size = UDim2.new(0, 52, 0, 30)
	TitleIcock.Image = "http://www.roblox.com/asset/?id=17046037782"
	
	Title.Name = "Title"
	Title.Parent = TopBar
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.111111194, 0, 0, 0)
	Title.Size = UDim2.new(0, 80, 0, 30)
	Title.Font = Enum.Font.GothamBold
	Title.Text = "Reaper Hub"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextXAlignment = Enum.TextXAlignment.Left
	
	Title_2.Name = "Title"
	Title_2.Parent = TopBar
	Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title_2.BackgroundTransparency = 1.000
	Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title_2.BorderSizePixel = 0
	Title_2.Position = UDim2.new(0.333333433, 0, 0, 0)
	Title_2.Size = UDim2.new(0, 80, 0, 30)
	Title_2.Font = Enum.Font.GothamBold
	Title_2.Text = " | Universal Tools"
	Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title_2.TextSize = 14.000
	Title_2.TextXAlignment = Enum.TextXAlignment.Left
	
	Destroy.Name = "Destroy"
	Destroy.Parent = TopBar
	Destroy.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Destroy.BackgroundTransparency = 1.000
	Destroy.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Destroy.BorderSizePixel = 0
	Destroy.Position = UDim2.new(0.933333337, 0, 0.233333334, 0)
	Destroy.Size = UDim2.new(0, 15, 0, 15)
	Destroy.Modal = true
	Destroy.Image = "rbxassetid://7743878857"

	Background.Name = "Background"
	Background.Parent = TopBar
	Background.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	Background.BackgroundTransparency = 1.000
	Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Background.BorderSizePixel = 0
	Background.Position = UDim2.new(0, 0, 0.991666675, 0)
	Background.Size = UDim2.new(0, 359, 0, 210)
	Background.Image = "http://www.roblox.com/asset/?id=17044268550"

	minimized.Name = "minimized"
	minimized.Parent = TopBar
	minimized.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	minimized.BackgroundTransparency = 1.000
	minimized.BorderColor3 = Color3.fromRGB(0, 0, 0)
	minimized.BorderSizePixel = 0
	minimized.Position = UDim2.new(0.875, 0, 0.233333334, 0)
	minimized.Size = UDim2.new(0, 15, 0, 15)
	minimized.Modal = true
	minimized.Image = "rbxassetid://7734000129"

	ContainerForAllShitz.Name = "ContainerForAllShitz"
	ContainerForAllShitz.Parent = ReaperHubUI
	ContainerForAllShitz.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ContainerForAllShitz.BackgroundTransparency = 1.000
	ContainerForAllShitz.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ContainerForAllShitz.BorderSizePixel = 0
	ContainerForAllShitz.Position = UDim2.new(0.0194444451, 0, 0.154166669, 0)
	ContainerForAllShitz.Size = UDim2.new(0, 344, 0, 197)

	Kontol.Name = "Kontol"
	Kontol.Parent = ContainerForAllShitz
	Kontol.Active = true
	Kontol.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	Kontol.BackgroundTransparency = 0.990
	Kontol.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Kontol.BorderSizePixel = 0
	Kontol.Position = UDim2.new(0.0136305345, 0, 0.0346870236, 0)
	Kontol.Size = UDim2.new(0, 335, 0, 24)
	Kontol.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	Kontol.CanvasSize = UDim2.new(2, 0, 0, 0)
	Kontol.ScrollBarThickness = 0
	Kontol.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	
	KontolListLayout.Name = "KontolListLayout"
	KontolListLayout.Parent = Kontol
	KontolListLayout.FillDirection = Enum.FillDirection.Horizontal
	KontolListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	TabContainer.Name = "TabContainer"
	TabContainer.Parent = ContainerForAllShitz
	TabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	TabContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabContainer.BorderSizePixel = 0
	TabContainer.Position = UDim2.new(0.0116279069, 0, 0.15143837, 0)
	TabContainer.Size = UDim2.new(0, 335, 0, 160)
	
	Destroy.MouseButton1Click:Connect(function()
		ReaperHubUILibrary.Enabled = false
	end)
	
	local minimizedd = false
	minimized.MouseButton1Click:Connect(function()
		if minimizedd == false then
			minimizedd = true
			Background.Visible = false
			ContainerForAllShitz.Visible = false
			game:GetService("TweenService"):Create(ReaperHubUI, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {Size = UDim2.new(0,360,0,30)}):Play()
		else
			minimizedd = false
			local t = game:GetService("TweenService"):Create(ReaperHubUI, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = UDim2.new(0,360,0,240)})
			t:Play()
			repeat wait() until t.PlaybackState == Enum.PlaybackState.Completed
			Background.Visible = true
			ContainerForAllShitz.Visible = true
		end
	end)
	
	game:GetService("RunService").RenderStepped:Connect(function()
		Title.TextColor3 = Color3.fromHSV(tick()%5/5,1,1)
	end)
	
	local tabs = {}
	function tabs.CreateTabs(tconfig)
		tconfig = tconfig or {}
		tconfig.Text = tconfig.Text or "Babs"
		
		local Main = Instance.new("TextButton")
		local Main_2 = Instance.new("ScrollingFrame")
		local TabListLayout = Instance.new("UIListLayout")
		
		Main.Name = tostring(tconfig.Text)
		Main.Parent = Kontol
		Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Main.BorderSizePixel = 0
		Main.Size = UDim2.new(0, 35, 0, 23)
		Main.Font = Enum.Font.SourceSans
		Main.Text = "   "..tconfig.Text.."   "
		Main.TextColor3 = Color3.fromRGB(255, 255, 255)
		Main.TextSize = 14.000
		Main.TextXAlignment = Enum.TextXAlignment.Left
		Main.Size = UDim2.fromOffset(Main.TextBounds.X, 23) -- first time ever using udim2 fromoffset on ui library lol
		
		Main_2.Name = tostring(tconfig.Text)
		Main_2.Parent = TabContainer
		Main_2.Active = true
		Main_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Main_2.BackgroundTransparency = 1.000
		Main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Main_2.BorderSizePixel = 0
		Main_2.Position = UDim2.new(0, 0, 0.00520849228, 0)
		Main_2.Size = UDim2.new(0, 335, 0, 160)
		Main_2.Visible = false
		if firstTabOpened == false then
			firstTabOpened = true
			Main_2.Visible = true
		else
			Main_2.Visible = false
		end
		Main_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		Main_2.ScrollBarThickness = 5
		Main_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		
		TabListLayout.Name = "TabListLayout"
		TabListLayout.Parent = Main_2
		TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		
		game:GetService("RunService").RenderStepped:Connect(function()
			Main_2.CanvasSize = UDim2.new(0,0,0,TabListLayout.AbsoluteContentSize.Y + 2)
		end)
		
		local tabc = TabContainer
		local tabl = Kontol
		for i, v in next, tabl:GetChildren() do
			if v.ClassName == "TextButton" then
				v.MouseButton1Click:connect(function()
					print(v.Name)
					for i, v2 in next, tabc:GetChildren() do
						if v2.Name == v.Name then
							print("a")
							v2.Visible = true
						else
							v2.Visible = false
						end
					end
				end)
			end
		end
		
		local UiThingz = {}
		
		function UiThingz.CreateToggle(conpig)
			conpig = conpig or {}
			conpig.Text = conpig.Text or "Goggle"
			conpig.Callback = conpig.Callback or function() end
			
			local Toggle = Instance.new("Frame")
			local MainToggle = Instance.new("TextButton")
			local MainToggleCorner = Instance.new("UICorner")
			local ToggleText = Instance.new("TextLabel")
			
			Toggle.Name = "Toggle"
			Toggle.Parent = Main_2
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0, 325, 0, 30)

			MainToggle.Name = "MainToggle"
			MainToggle.Parent = Toggle
			MainToggle.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
			MainToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			MainToggle.BorderSizePixel = 0
			MainToggle.Position = UDim2.new(0.0246153846, 0, 0.166666672, 0)
			MainToggle.Size = UDim2.new(0, 20, 0, 20)
			MainToggle.AutoButtonColor = false
			MainToggle.Font = Enum.Font.SourceSans
			MainToggle.Text = ""
			MainToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			MainToggle.TextSize = 14.000

			MainToggleCorner.CornerRadius = UDim.new(0, 3)
			MainToggleCorner.Name = "MainToggleCorner"
			MainToggleCorner.Parent = MainToggle

			ToggleText.Name = "ToggleText"
			ToggleText.Parent = Toggle
			ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.BackgroundTransparency = 1.000
			ToggleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleText.BorderSizePixel = 0
			ToggleText.Position = UDim2.new(0.107692309, 0, 0.166666672, 0)
			ToggleText.Size = UDim2.new(0, 200, 0, 20)
			ToggleText.Font = Enum.Font.GothamBold
			ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleText.TextSize = 14.000
			ToggleText.TextXAlignment = Enum.TextXAlignment.Left
			ToggleText.Text = tostring(conpig.Text)
			
			local toggled = false
			MainToggle.MouseButton1Click:Connect(function()
				if toggled == false then
					toggled = true
					conpig.Callback(true)
					game:GetService("TweenService"):Create(MainToggle, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(30, 220, 70)}):Play()
				else
					toggled = false
					conpig.Callback(false)
					game:GetService("TweenService"):Create(MainToggle, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(255,60,60)}):Play()
				end
			end)
		end
		
		function UiThingz.CreateSlider(sconfig)
			sconfig = sconfig or {}
			sconfig.Text = sconfig.Text or "Slider"
			sconfig.Minimum = sconfig.Minimum or 0
			sconfig.Maximum = sconfig.Maximum or 50
			sconfig.Default = sconfig.Default or 25
			sconfig.Precise = sconfig.Precise or false
			sconfig.Callback = sconfig.Callback or function() end
			
			local Slider = Instance.new("Frame")
			local MainSlider = Instance.new("TextButton")
			local Fill = Instance.new("Frame")
			local Value = Instance.new("TextLabel")
			local SliderText = Instance.new("TextLabel")

			
			Slider.Name = "Slider"
			Slider.Parent = Main_2
			Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Slider.BackgroundTransparency = 0.990
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Size = UDim2.new(0, 325, 0, 30)

			MainSlider.Name = "MainSlider"
			MainSlider.Parent = Slider
			MainSlider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
			MainSlider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			MainSlider.BorderSizePixel = 0
			MainSlider.Position = UDim2.new(0.593846142, 0, 0.166666672, 0)
			MainSlider.Size = UDim2.new(0, 135, 0, 20)
			MainSlider.AutoButtonColor = false
			MainSlider.Font = Enum.Font.SourceSans
			MainSlider.Text = ""
			MainSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
			MainSlider.TextSize = 14.000

			Fill.Name = "Fill"
			Fill.Parent = MainSlider
			Fill.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
			Fill.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Fill.BorderSizePixel = 0
			Fill.Size = UDim2.new(0, 0, 0, 20)

			Value.Name = "Value"
			Value.Parent = MainSlider
			Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Value.BackgroundTransparency = 1.000
			Value.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Value.BorderSizePixel = 0
			Value.Size = UDim2.new(0, 135, 0, 20)
			Value.Font = Enum.Font.SourceSans
			Value.Text = tonumber(sconfig.Default)
			Value.TextColor3 = Color3.fromRGB(255, 255, 255)
			Value.TextSize = 14.000
			
			SliderText.Name = "SliderText"
			SliderText.Parent = Slider
			SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.BackgroundTransparency = 0.990
			SliderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderText.BorderSizePixel = 0
			SliderText.Position = UDim2.new(0.0246153846, 0, 0.166666672, 0)
			SliderText.Size = UDim2.new(0, 185, 0, 20)
			SliderText.Font = Enum.Font.GothamBold
			SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.TextSize = 14.000
			SliderText.TextXAlignment = Enum.TextXAlignment.Left
			SliderText.Text = tostring(sconfig.Text)
			
			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")

			local Min_Value = sconfig.Minimum
			local Max_Value = sconfig.Maximum
			local Precise = sconfig.Precise
			local Bar = Fill
			local Sliderbox = MainSlider
			local SliderValueText = Value
			local XSize = 135
			local DefaultValue = sconfig.Default

			if DefaultValue then 
				if DefaultValue <= Min_Value then DefaultValue = Min_Value elseif DefaultValue >= Max_Value then DefaultValue = Max_Value end
				Bar.Size = UDim2.new(1 - ((Max_Value - DefaultValue) / (Max_Value - Min_Value)),0, 0, 20)
				SliderValueText.Text = DefaultValue
				sconfig.Callback(tonumber(DefaultValue))
			end

			Sliderbox.MouseButton1Down:Connect(function()
				local value = Precise and  tonumber(string.format("%.2f",(((tonumber(Max_Value) - tonumber(Min_Value)) / XSize) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))

				pcall(function()
					sconfig.Callback(tonumber(value))					
					SliderValueText.Text = value
				end)
				Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, XSize), 0, 20)
				moveconnection = mouse.Move:Connect(function()   
					local value = Precise and  tonumber(string.format("%.2f",(((tonumber(Max_Value) - tonumber(Min_Value)) / XSize) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))
					pcall(function()
						sconfig.Callback(tonumber(value))
						SliderValueText.Text = value
					end)
					Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, XSize), 0, 20)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
						local value = Precise and  tonumber(string.format("%.2f",(((tonumber(Max_Value) - tonumber(Min_Value)) / XSize) * Bar.AbsoluteSize.X) + tonumber(Min_Value))) or math.floor((((tonumber(Max_Value) - tonumber(Min_Value)) / SizeChia) * Bar.AbsoluteSize.X) + tonumber(Min_Value))

						pcall(function()
							sconfig.Callback(tonumber(value))
							SliderValueText.Text = value
						end)
						Bar.Size = UDim2.new(0, math.clamp(mouse.X - Bar.AbsolutePosition.X, 0, XSize), 0, 20)
					end
				end)
				uis.InputEnded:Connect(function(m)
					if m.UserInputType == Enum.UserInputType.MouseButton1 or m.UserInputType == Enum.UserInputType.Touch then
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)
		end
		function UiThingz.CreateKeybinds(kconpig)
			kconpig = kconpig or {}
			kconpig.Text = kconpig.Text or "keypig"
			kconpig.DefaultKey = kconpig.DefaultKey or Enum.KeyCode.P
			kconpig.ReturnCallbackKeyName = kconpig.ReturnCallbackKeyName or false
			kconpig.Callback = kconpig.Callback or function() end
			
			local Keybind = Instance.new("Frame")
			local KeybindTrig = Instance.new("TextButton")
			local KeybindText = Instance.new("TextLabel")
			
			Keybind.Name = "Keybind"
			Keybind.Parent = Main_2
			Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Keybind.BackgroundTransparency = 1.000
			Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Keybind.BorderSizePixel = 0
			Keybind.Size = UDim2.new(0, 325, 0, 30)

			KeybindTrig.Name = "KeybindTrig"
			KeybindTrig.Parent = Keybind
			KeybindTrig.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
			KeybindTrig.BorderColor3 = Color3.fromRGB(0, 0, 0)
			KeybindTrig.BorderSizePixel = 0
			KeybindTrig.Position = UDim2.new(0.855384588, 0, 0.166666672, 0)
			KeybindTrig.Size = UDim2.new(0, 50, 0, 20)
			KeybindTrig.AutoButtonColor = false
			KeybindTrig.Font = Enum.Font.SourceSans
			KeybindTrig.Text = kconpig.DefaultKey.Name
			KeybindTrig.TextColor3 = Color3.fromRGB(255, 255, 255)
			KeybindTrig.TextSize = 14.000

			KeybindText.Name = "KeybindText"
			KeybindText.Parent = Keybind
			KeybindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			KeybindText.BackgroundTransparency = 0.990
			KeybindText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			KeybindText.BorderSizePixel = 0
			KeybindText.Position = UDim2.new(0.0246153846, 0, 0.166666672, 0)
			KeybindText.Size = UDim2.new(0, 185, 0, 20)
			KeybindText.Font = Enum.Font.GothamBold
			KeybindText.TextColor3 = Color3.fromRGB(255, 255, 255)
			KeybindText.TextSize = 14.000
			KeybindText.TextXAlignment = Enum.TextXAlignment.Left
			KeybindText.Text = kconpig.Text
			
			local key = kconpig.DefaultKey
			local togName = KeybindTrig

			KeybindTrig.MouseButton1Click:Connect(function()
				togName.Text = ". . ."
				local a, b = game:GetService('UserInputService').InputBegan:wait();
				if a.KeyCode.Name ~= "Unknown" then
					togName.Text = a.KeyCode.Name
					key = a.KeyCode.Name;
				end
			end)
			game:GetService("UserInputService").InputBegan:connect(function(current, ok) 
				if not ok then 
					if current.KeyCode.Name == key then 
						if kconpig.ReturnCallbackKeyName == true then
							kconpig.Callback(current.KeyCode)
						else
							kconpig.Callback()
						end
					end
				end
			end)
		end
		return UiThingz
	end
	return tabs
end
return ReaperHub
