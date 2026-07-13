local ui = {}

local ts = game:GetService("TweenService")

function protectGui(GUI)
    local completed = false
    if syn and syn.protect_gui then
        pcall(function()
            syn.protect_gui(GUI)
            GUI.Parent = game:GetService("CoreGui")
            completed = true
        end)
    elseif gethui then
        pcall(function()
            GUI.Parent = gethui()
            completed = true
        end)
    elseif game.CoreGui:FindFirstChild("RobloxGui") then
        pcall(function()
            GUI.Parent = game.CoreGui.RobloxGui
            completed = true
        end)
    else
        pcall(function()
            GUI.Parent = game:GetService("CoreGui")
            completed = true
        end)
    end
    if not completed then
        GUI.Parent = game.Players.LocalPlayer.PlayerGui
    end
end



ui.CreateKeySystem = function(discord, theme, title, keyVar, destroyVar)

	--
	local Blur = Instance.new("BlurEffect", game:GetService("Lighting"))
	Blur.Size = 0

	ts:Create(Blur, TweenInfo.new(.4, Enum.EasingStyle.Quint), {Size = 24}):Play()
	local oldFov = game:GetService("Workspace").Camera.FieldOfView
	ts:Create(game:GetService("Workspace").Camera, TweenInfo.new(.4, Enum.EasingStyle.Quint), {FieldOfView = oldFov - 20}):Play()
	--

	if not theme then
		theme = {
			["MainColor"] = Color3.fromRGB(255, 255, 255),
			["KeyUIColor"] = Color3.fromRGB(149, 149, 149),
			["KeyUIBorderColor"] = Color3.fromRGB(27, 42, 53),
			["KeyLoginTextBoxColor"] = Color3.fromRGB(255, 255, 255),
			["KeyLoginTextColor"] = Color3.fromRGB(0, 0, 0),
			["TextButtonColor"] = Color3.fromRGB(170, 170, 170),
			["TextButtonTextColor"] = Color3.fromRGB(0, 0, 0)
		}
	end

	local KeyLogin = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local ImageUiCorner = Instance.new("UICorner")
	local FrameUICorner = Instance.new("UICorner")


	KeyLogin.Enabled = false
	KeyLogin.Name = "KeyLoginReal"
	protectGui(KeyLogin)
	KeyLogin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = KeyLogin
	Main.AnchorPoint = Vector2.new(1, 0)
	Main.BackgroundColor3 = theme["MainColor"]
	Main.Position = UDim2.new(0.637653112, 0, 0.203301102, 0)
	Main.Size = UDim2.new(0.276595742, 0, 0.59334296, 0)

	FrameUICorner.CornerRadius = UDim.new(0, 5)
	FrameUICorner.Name = "FrameUICorner"
	FrameUICorner.Parent = Main


	local originalMainSize = Main.Size

	Main.Size = UDim2.new(0.277,0,0,0)
	Main.BackgroundTransparency = 1
	FrameUICorner.CornerRadius = UDim.new(0,5)

	KeyLogin.Enabled = true

	ts:Create(Main, TweenInfo.new(1, Enum.EasingStyle.Quint), {Size = originalMainSize, BackgroundTransparency = 0}):Play()
	task.wait(1)

	local KeyUI = Instance.new("Frame")
	local TextBox = Instance.new("TextBox")
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	local TextButton = Instance.new("TextButton")
	local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")

	--Properties:

	KeyUI.Name = "KeyUI"
	KeyUI.Parent = Main
	KeyUI.AnchorPoint = Vector2.new(0.5, 0)
	KeyUI.BackgroundColor3 = theme["KeyUIColor"]
	KeyUI.Position = UDim2.new(0.5, 0, 0.0250000004, 0)
	KeyUI.Size = UDim2.new(0, 0, 0.95, 0)

	TextBox.Parent = KeyUI
	TextBox.BackgroundColor3 = theme["KeyLoginTextBoxColor"]
	TextBox.BackgroundTransparency = 0.900
	TextBox.Position = UDim2.new(0.225845605, 0, 0.369597793, 0)
	TextBox.Size = UDim2.new(0.545224667, 0, 0.142152995, 0)
	TextBox.Font = Enum.Font.SourceSans
	TextBox.PlaceholderColor3 = theme["KeyLoginTextColor"]
	TextBox.PlaceholderText = "Enter Key"
	TextBox.Text = ""
	TextBox.TextColor3 = theme["KeyLoginTextColor"]
	TextBox.TextScaled = true
	TextBox.TextSize = 25.000
	TextBox.TextWrapped = true

	UITextSizeConstraint.Parent = TextBox
	UITextSizeConstraint.MaxTextSize = 25

	TextButton.Parent = KeyUI
	TextButton.BackgroundColor3 = theme["TextButtonColor"]
	TextButton.BorderSizePixel = 0
	TextButton.Position = UDim2.new(0.258039206, 0, 0.591498554, 0)
	TextButton.Size = UDim2.new(0.484886885, 0, 0.13504535, 0)
	TextButton.Font = Enum.Font.FredokaOne
	TextButton.Text = "Login"
	TextButton.TextColor3 = theme["TextButtonTextColor"]
	TextButton.TextScaled = true
	TextButton.TextSize = 31.000
	TextButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextStrokeTransparency = 0.000
	TextButton.TextWrapped = true

	UITextSizeConstraint_2.Parent = TextButton
	UITextSizeConstraint_2.MaxTextSize = 31

	ts:Create(KeyUI, TweenInfo.new(1, Enum.EasingStyle.Quint), {Size = UDim2.new(0.95, 0, 0.95, 0)}):Play()

	--

	local Input = nil

	TextButton.MouseButton1Click:Connect(function()
		Input = TextBox.Text
		_G[keyVar] = TextBox.Text
	end)

	if discord then
		local copyLink = discord
		if type(discord) ~= "string" then
			copyLink = discord.realLink
			discord = discord.displayLink
		end
		task.wait(.35)
		task.delay(.1, function()
			ts:Create(TextBox, TweenInfo.new(.35, Enum.EasingStyle.Quint), {Position = UDim2.new(0.226, 0,0.178, 0)}):Play()
			task.wait(.1)
			ts:Create(TextButton, TweenInfo.new(.35, Enum.EasingStyle.Quint), {Position = UDim2.new(0.258, 0,0.378, 0)}):Play()
		end)

		local Discord = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local TextLabel = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local TextButton = Instance.new("TextButton")
		local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")

		--Properties:

		Discord.Name = "Discord"
		Discord.Parent = KeyUI
		Discord.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Discord.Position = UDim2.new(0.0447725654, 0, 0.63684541, 0)
		Discord.Size = UDim2.new(0.934254229, 0, 0.264404565, 0)

		UICorner.Parent = Discord

		TextLabel.Parent = Discord
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.Position = UDim2.new(0.0760451257, 0, 0.0860215053, 0)
		TextLabel.Size = UDim2.new(0.849840283, 0, 0.408602148, 0)
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.Text = "Key Here: "..discord
		TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 35.000
		TextLabel.TextWrapped = true

		UITextSizeConstraint.Parent = TextLabel
		UITextSizeConstraint.MaxTextSize = 35

		TextButton.Parent = Discord
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.Position = UDim2.new(0.2441414, 0, 0.580645144, 0)
		TextButton.Size = UDim2.new(0.50834924, 0, 0.365591407, 0)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.Text = "Copy"
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextScaled = true
		TextButton.TextSize = 29.000
		TextButton.TextWrapped = true

		UITextSizeConstraint_2.Parent = TextButton
		UITextSizeConstraint_2.MaxTextSize = 29

		TextButton.MouseButton1Click:Connect(function()
			if setclipboard then
				setclipboard("https://"..copyLink)
			end
		end)

	end


	if title then
		task.wait(.35)
		task.delay(.05, function()
			ts:Create(TextBox, TweenInfo.new(.35, Enum.EasingStyle.Quint), {Position = UDim2.new(0.226, 0,0.25, 0)}):Play()
			task.wait(.1)
			ts:Create(TextButton, TweenInfo.new(.35, Enum.EasingStyle.Quint), {Position = UDim2.new(0.258, 0,0.45, 0)}):Play()
		end)
		local TextLabel = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

		--Properties:

		TextLabel.Parent = KeyUI
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.Position = UDim2.new(0.106617935, 0, 0.0378132015, 0)
		TextLabel.Size = UDim2.new(0.781864822, 0, 0.157554999, 0)
		TextLabel.Font = Enum.Font.FredokaOne
		TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 32.000
		TextLabel.TextWrapped = true
		TextLabel.Text = title

		UITextSizeConstraint.Parent = TextLabel
		UITextSizeConstraint.MaxTextSize = 32
	end

	task.spawn(function()
		repeat task.wait() until _G[destroyVar]

		ts:Create(Blur, TweenInfo.new(1, Enum.EasingStyle.Cubic), {Size = 0}):Play()
		ts:Create(game:GetService("Workspace").Camera, TweenInfo.new(1, Enum.EasingStyle.Cubic), {FieldOfView = oldFov}):Play()
		Blur:Destroy()


		ts:Create(KeyUI, TweenInfo.new(.25, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 0, 0.95, 0)}):Play()
		task.wait(.25)
		ts:Create(KeyUI, TweenInfo.new(.25, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
		task.wait(.15)
		ts:Create(Main, TweenInfo.new(.45, Enum.EasingStyle.Quint), {Size = UDim2.new(0.27, 0, 0, 0), BackgroundTransparency = 1}):Play()
		task.wait(.45)

		pcall(function()
			KeyLogin:Destroy()
		end)
	end)

	return --Input:gsub(" ","")

end

ui.CreateMain = function()
	local EggplantHub = Instance.new("ScreenGui")
	EggplantHub.Name = "EggplantHub"
	protectGui(EggplantHub)
	EggplantHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local ScrollingFrame = Instance.new("ScrollingFrame")
	ScrollingFrame.Parent = EggplantHub
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.Position = UDim2.new(0.147305608, 0, 0.199710563, 0)
	ScrollingFrame.Size = UDim2.new(0.740986168, 0, 0.599131703, 0)
	ScrollingFrame.ScrollBarThickness = 10
	ScrollingFrame.AutomaticCanvasSize  = Enum.AutomaticSize.Y
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = ScrollingFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	return ScrollingFrame
end

ui.CreateSection = function(parent, title)
	local EXAMPLESECTION = Instance.new("TextLabel")
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

	EXAMPLESECTION.Name = title
	EXAMPLESECTION.Parent = parent
	EXAMPLESECTION.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EXAMPLESECTION.Position = UDim2.new(-7.13161654e-08, 0, 0, 0)
	EXAMPLESECTION.Size = UDim2.new(0.98773092, 0, 0.200000003, 0)
	EXAMPLESECTION.Font = Enum.Font.SourceSans
	EXAMPLESECTION.Text = title
	EXAMPLESECTION.TextColor3 = Color3.fromRGB(0, 0, 0)
	EXAMPLESECTION.TextScaled = true
	EXAMPLESECTION.TextSize = 64.000
	EXAMPLESECTION.TextWrapped = true
	EXAMPLESECTION.TextColor3 = Color3.fromRGB(255, 0, 0)

	UITextSizeConstraint.Parent = EXAMPLESECTION
	UITextSizeConstraint.MaxTextSize = 64

	return EXAMPLESECTION

end

ui.CreateButton = function(parent, name, callback)
	local EXAMPLEBUTTON = Instance.new("TextButton")
	local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")

	EXAMPLEBUTTON.Name = name
	EXAMPLEBUTTON.Parent = parent
	EXAMPLEBUTTON.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EXAMPLEBUTTON.Position = UDim2.new(-3.30538406e-08, 0, 0.200000048, 0)
	EXAMPLEBUTTON.Size = UDim2.new(0.986916959, 0, 0.200000003, 0)
	EXAMPLEBUTTON.Font = Enum.Font.SourceSans
	EXAMPLEBUTTON.TextColor3 = Color3.fromRGB(0, 0, 0)
	EXAMPLEBUTTON.TextScaled = true
	EXAMPLEBUTTON.TextSize = 73.000
	EXAMPLEBUTTON.TextWrapped = true
	EXAMPLEBUTTON.Text = name

	UITextSizeConstraint_2.Parent = EXAMPLEBUTTON
	UITextSizeConstraint_2.MaxTextSize = 73

	EXAMPLEBUTTON.MouseButton1Click:Connect(function()
		callback()
	end)

end

ui.CreateBHUBPAID = function(opts, legacyCustomText)

	-- Backward compatible: old signature was (override, customText) where customText set the title.
	if type(opts) ~= "table" then
		opts = { title = legacyCustomText or (type(opts) == "string" and opts) or nil }
	end

	local cfg = {
		title      = opts.title      or "Free Weekend Trial Over",
		priceLine  = opts.priceLine  or "Unlock Full Access — A Key is Only $7",
		discord    = opts.discord    or "Grab your key: discord.gg/BananaHub",
		invite     = opts.invite     or "discord.gg/BananaHub",
		footer     = opts.footer     or "by Banana Hub @ Roge Studios  •  10M+ Lifetime Executions  •  1M+ Unique Users",
		closeDelay = opts.closeDelay or 5,
	}

	local inviteUrl = cfg.invite
	if not inviteUrl:match("^https?://") then
		inviteUrl = "https://" .. inviteUrl
	end

	--
	local Blur = Instance.new("BlurEffect", game:GetService("Lighting"))
	Blur.Size = 0

	ts:Create(Blur, TweenInfo.new(.4, Enum.EasingStyle.Quint), {Size = 24}):Play()
	local oldFov = game:GetService("Workspace").Camera.FieldOfView
	ts:Create(game:GetService("Workspace").Camera, TweenInfo.new(.4, Enum.EasingStyle.Quint), {FieldOfView = oldFov - 20}):Play()
	--


	local BuyKey = Instance.new("ScreenGui")
	local Shadow = Instance.new("ImageLabel")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local UIGradient = Instance.new("UIGradient")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local Divider = Instance.new("Frame")
	local DividerCorner = Instance.new("UICorner")
	local BH = Instance.new("TextLabel")
	local Paid = Instance.new("TextLabel")
	local Disc = Instance.new("TextButton")
	local Hint = Instance.new("TextLabel")
	local Footer = Instance.new("TextLabel")
	local Close = Instance.new("TextButton")
	local CloseCorner = Instance.new("UICorner")
	local CloseAspect = Instance.new("UIAspectRatioConstraint")

	--Properties:

	BuyKey.Name = "BuyKey"
	protectGui(BuyKey)
	BuyKey.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	-- Card: same banana-yellow vibe, just rounded with a soft gradient + clean stroke
	Frame.Name = "Frame"
	Frame.Parent = BuyKey
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(255, 246, 120)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.Size = UDim2.new(0.573979616, 0, 0.464337707, 0)

	-- soft drop shadow (child of Frame so it scales with the entrance pop, drawn behind the opaque card)
	Shadow.Name = "Shadow"
	--Shadow.Parent = Frame
	Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
	Shadow.BackgroundTransparency = 1
	Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	Shadow.Size = UDim2.new(1.45, 0, 1.85, 0)
	Shadow.ZIndex = 0
	--Shadow.Image = "rbxassetid://5028857084"
	Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	Shadow.ImageTransparency = 0.45
	Shadow.ScaleType = Enum.ScaleType.Stretch

	UIAspectRatioConstraint.Parent = Frame
	UIAspectRatioConstraint.AspectRatio = 2.116

	UICorner.CornerRadius = UDim.new(0, 18)
	UICorner.Parent = Frame

	UIStroke.Parent = Frame
	UIStroke.Color = Color3.fromRGB(22, 22, 22)
	UIStroke.Thickness = 3
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	UIGradient.Parent = Frame
	UIGradient.Rotation = 90
	UIGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 251, 178)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 226, 92)),
	})

	BH.Name = "BH"
	BH.Parent = Frame
	BH.BackgroundTransparency = 1.000
	BH.BorderSizePixel = 0
	BH.Position = UDim2.new(0.05, 0, 0.085, 0)
	BH.Size = UDim2.new(0.9, 0, 0.27, 0)
	BH.Font = Enum.Font.GothamBlack
	BH.Text = cfg.title
	BH.TextColor3 = Color3.fromRGB(28, 28, 28)
	BH.TextScaled = true
	BH.TextTransparency = 1.000
	BH.TextWrapped = true

	-- small accent divider under the title
	Divider.Name = "Divider"
	Divider.Parent = Frame
	Divider.AnchorPoint = Vector2.new(0.5, 0.5)
	Divider.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	Divider.BorderSizePixel = 0
	Divider.Position = UDim2.new(0.5, 0, 0.385, 0)
	Divider.Size = UDim2.new(0, 0, 0.018, 0)
	DividerCorner.CornerRadius = UDim.new(1, 0)
	DividerCorner.Parent = Divider

	Paid.Name = "Paid"
	Paid.Parent = Frame
	Paid.BackgroundTransparency = 1.000
	Paid.BorderSizePixel = 0
	Paid.Position = UDim2.new(0.0785185173, 0, 0.44, 0)
	Paid.Size = UDim2.new(0.841481507, 0, 0.14, 0)
	Paid.Font = Enum.Font.GothamMedium
	Paid.Text = cfg.priceLine
	Paid.TextColor3 = Color3.fromRGB(38, 38, 38)
	Paid.TextScaled = true
	Paid.TextTransparency = 1.000
	Paid.TextWrapped = true

	-- discord line doubles as a quiet click-to-copy
	Disc.Name = "Disc"
	Disc.Parent = Frame
	Disc.AutoButtonColor = false
	Disc.BackgroundTransparency = 1.000
	Disc.BorderSizePixel = 0
	Disc.Position = UDim2.new(0.106666729, 0, 0.56, 0)
	Disc.Size = UDim2.new(0.783703685, 0, 0.17, 0)
	Disc.Font = Enum.Font.GothamBold
	Disc.Text = cfg.discord
	Disc.TextColor3 = Color3.fromRGB(28, 28, 28)
	Disc.TextScaled = true
	Disc.TextTransparency = 1.000
	Disc.TextWrapped = true

	-- faint hint so people know the line is copyable, without making it a loud button
	Hint.Name = "Hint"
	Hint.Parent = Frame
	Hint.BackgroundTransparency = 1.000
	Hint.BorderSizePixel = 0
	Hint.Position = UDim2.new(0.15, 0, 0.735, 0)
	Hint.Size = UDim2.new(0.7, 0, 0.05, 0)
	Hint.Font = Enum.Font.GothamMedium
	Hint.Text = "(click to copy)"
	Hint.TextColor3 = Color3.fromRGB(90, 80, 30)
	Hint.TextScaled = true
	Hint.TextTransparency = 1.000
	Hint.TextWrapped = true

	-- small footer / credit + stats
	Footer.Name = "Footer"
	Footer.Parent = Frame
	Footer.AnchorPoint = Vector2.new(0.5, 1)
	Footer.BackgroundTransparency = 1.000
	Footer.BorderSizePixel = 0
	Footer.Position = UDim2.new(0.5, 0, 0.965, 0)
	Footer.Size = UDim2.new(0.9, 0, 0.075, 0)
	Footer.Font = Enum.Font.GothamMedium
	Footer.Text = cfg.footer
	Footer.TextColor3 = Color3.fromRGB(90, 80, 30)
	Footer.TextScaled = true
	Footer.TextTransparency = 1.000
	Footer.TextWrapped = true

	-- Circular close button with a delay countdown before it can be clicked
	Close.Name = "Close"
	Close.Parent = Frame
	Close.AnchorPoint = Vector2.new(0.5, 0.5)
	Close.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Close.AutoButtonColor = false
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(0.985, 0, 0.04, 0)
	Close.Size = UDim2.new(0.1, 0, 0.19, 0)
	Close.Font = Enum.Font.GothamBold
	Close.Text = tostring(cfg.closeDelay)
	Close.TextColor3 = Color3.fromRGB(255, 255, 255)
	Close.TextScaled = true
	Close.TextTransparency = 1.000
	Close.TextWrapped = true

	CloseAspect.Parent = Close
	CloseAspect.AspectRatio = 1

	CloseCorner.CornerRadius = UDim.new(1, 0)
	CloseCorner.Parent = Close

	-- Entrance animation: pop the card in, then fade content
	local targetSize = Frame.Size
	Frame.Size = UDim2.new(0, 0, 0, 0)

	ts:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = targetSize}):Play()

	task.delay(0.28, function()
		ts:Create(Divider, TweenInfo.new(0.45, Enum.EasingStyle.Quint), {Size = UDim2.new(0.16, 0, 0.018, 0)}):Play()
		ts:Create(BH, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		task.wait(0.08)
		ts:Create(Paid, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		task.wait(0.08)
		ts:Create(Disc, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
		task.wait(0.04)
		ts:Create(Hint, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0.45}):Play()
		task.wait(0.08)
		ts:Create(Footer, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0.35}):Play()
		task.wait(0.08)
		ts:Create(Close, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {TextTransparency = 0}):Play()
	end)

	-- quiet click-to-copy: subtle hover, copies the invite, brief "Copied!" flash
	Disc.MouseEnter:Connect(function()
		ts:Create(Disc, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextColor3 = Color3.fromRGB(70, 70, 70)}):Play()
		ts:Create(Hint, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextTransparency = 0.15}):Play()
	end)
	Disc.MouseLeave:Connect(function()
		ts:Create(Disc, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextColor3 = Color3.fromRGB(28, 28, 28)}):Play()
		ts:Create(Hint, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextTransparency = 0.45}):Play()
	end)

	Disc.MouseButton1Click:Connect(function()
		local copied = false
		pcall(function()
			local clip = setclipboard or toclipboard or (syn and syn.write_clipboard)
			if clip then
				clip(inviteUrl)
				copied = true
			end
		end)

		Hint.Text = copied and "Copied to clipboard!" or "Copy not supported"
		ts:Create(Hint, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextColor3 = Color3.fromRGB(45, 130, 60), TextTransparency = 0}):Play()

		task.delay(2, function()
			if Hint.Parent then
				Hint.Text = "(click to copy)"
				ts:Create(Hint, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {TextColor3 = Color3.fromRGB(90, 80, 30), TextTransparency = 0.45}):Play()
			end
		end)
	end)

	-- Close: delay countdown, then enable
	task.spawn(function()
		for i = cfg.closeDelay, 1, -1 do
			Close.Text = tostring(i)
			task.wait(1)
		end

		Close.Text = "X"
		ts:Create(Close, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(235, 64, 64)}):Play()

		Close.MouseEnter:Connect(function()
			ts:Create(Close, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {Size = UDim2.new(0.115, 0, 0.218, 0), BackgroundColor3 = Color3.fromRGB(255, 92, 92)}):Play()
		end)
		Close.MouseLeave:Connect(function()
			ts:Create(Close, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {Size = UDim2.new(0.1, 0, 0.19, 0), BackgroundColor3 = Color3.fromRGB(235, 64, 64)}):Play()
		end)

		Close.MouseButton1Click:Connect(function()
			ts:Create(Blur, TweenInfo.new(1, Enum.EasingStyle.Cubic), {Size = 0}):Play()
			ts:Create(game:GetService("Workspace").Camera, TweenInfo.new(.3, Enum.EasingStyle.Cubic), {FieldOfView = oldFov}):Play()

			ts:Create(Frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
			task.wait(0.3)

			Blur:Destroy()
			BuyKey:Destroy()
		end)
	end)

end

return ui
