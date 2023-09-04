-- Gui to Lua
-- Version: 3.2

-- Instances:

function protectGui(GUI)
    if syn and syn.protect_gui then
        syn.protect_gui(GUI)
        GUI.Parent = game:GetService("CoreGui")
    elseif gethui then
        GUI.Parent = gethui()
    elseif game.CoreGui:FindFirstChild("RobloxGui") then
        GUI.Parent = game.CoreGui.RobloxGui
    else
        GUI.Parent = game:GetService("CoreGui")
    end
end


local ScreenGui = Instance.new("ScreenGui")
protectGui(ScreenGui)
local Main = Instance.new("ImageLabel")
local Glow = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("ImageLabel")
local Icons = Instance.new("Frame")
local Icon = Instance.new("ImageLabel")
local Icon_2 = Instance.new("ImageLabel")
local Text = Instance.new("Frame")
local keyless = Instance.new("ImageLabel")
local free = Instance.new("ImageLabel")
local fastupdates = Instance.new("ImageLabel")
local anysc = Instance.new("ImageLabel")
local Buttons = Instance.new("Frame")
local Download = Instance.new("ImageButton")
local Skip = Instance.new("ImageButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0,0.5, 0)
Main.AnchorPoint = Vector2.new(.5,.5)
Main.Size = UDim2.new(0,0,0,0)
Main.Image = "rbxassetid://14684971591"

Glow.Name = "Glow"
Glow.Parent = Main
Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Glow.BackgroundTransparency = 1.000
Glow.BorderColor3 = Color3.fromRGB(0, 0, 0)
Glow.BorderSizePixel = 0
Glow.Size = UDim2.new(1, 0, 1, 0)
Glow.Image = "rbxassetid://14685000015"

UICorner.Parent = Main
UIStroke.Parent = Main
UIStroke.Color = Color3.new(0.113725, 1, 0.941176)
UIStroke.Thickness = 2

Title.Name = "Title"
Title.Parent = ScreenGui
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.389293343, 0, 0.219971061, 0)
Title.Size = UDim2.new(0.228652686, 0, 0.254703343, 0)
Title.Image = "rbxassetid://14685015933"

Icons.Name = "Icons"
Icons.Parent = ScreenGui
Icons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icons.BackgroundTransparency = 1.000
Icons.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icons.BorderSizePixel = 0
Icons.Position = UDim2.new(0.310087204, 0, 0.217076704, 0)
Icons.Size = UDim2.new(0.408703119, 0, 0.26483354, 0)

Icon.Name = "Icon"
Icon.Parent = Icons
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon.BorderSizePixel = 0
Icon.Position = UDim2.new(-0.0494684167, 0, 0.0387096368, 0)
Icon.Size = UDim2.new(0.211221129, 0, 0.825806439, 0)
Icon.Image = "rbxassetid://14685036691"

Icon_2.Name = "Icon"
Icon_2.Parent = Icons
Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon_2.BackgroundTransparency = 1.000
Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon_2.BorderSizePixel = 0
Icon_2.Position = UDim2.new(0.775577545, 0, 0.0387096778, 0)
Icon_2.Size = UDim2.new(0.211221129, 0, 0.825806439, 0)
Icon_2.Image = "rbxassetid://14685034440"

Text.Name = "Text"
Text.Parent = ScreenGui
Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text.BackgroundTransparency = 1.000
Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
Text.BorderSizePixel = 0
Text.Position = UDim2.new(0.274403185, 0, 0.451519549, 0)
Text.Size = UDim2.new(0.456446201, 0, 0.377713472, 0)

keyless.Name = "keyless"
keyless.Parent = Text
keyless.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
keyless.BackgroundTransparency = 1.000
keyless.BorderColor3 = Color3.fromRGB(0, 0, 0)
keyless.BorderSizePixel = 0
keyless.Position = UDim2.new(-0.00740428129, 0, 0.0344827585, 0)
keyless.Size = UDim2.new(0.273701787, 0, 0.216679692, 0)
keyless.Image = "rbxassetid://14685071008"

free.Name = "free"
free.Parent = Text
free.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
free.BackgroundTransparency = 1.000
free.BorderColor3 = Color3.fromRGB(0, 0, 0)
free.BorderSizePixel = 0
free.Position = UDim2.new(0.7598629, 0, 0.0618544556, 0)
free.Rotation = 5.000
free.Size = UDim2.new(0.22184588, 0, 0.191317812, 0)
free.Image = "rbxassetid://14685077867"

fastupdates.Name = "fast updates"
fastupdates.Parent = Text
fastupdates.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fastupdates.BackgroundTransparency = 1.000
fastupdates.BorderColor3 = Color3.fromRGB(0, 0, 0)
fastupdates.BorderSizePixel = 0
fastupdates.Position = UDim2.new(-0.0398613513, 0, 0.762135863, 0)
fastupdates.Size = UDim2.new(0.40554592, 0, 0.213592216, 0)
fastupdates.Image = "rbxassetid://14685090333"

anysc.Name = "any sc"
anysc.Parent = Text
anysc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
anysc.BackgroundTransparency = 1.000
anysc.BorderColor3 = Color3.fromRGB(0, 0, 0)
anysc.BorderSizePixel = 0
anysc.Position = UDim2.new(0.627573848, 0, 0.774653077, 0)
anysc.Size = UDim2.new(0.391775876, 0, 0.199029118, 0)
anysc.Image = "rbxassetid://14685095535"

Buttons.Name = "Buttons"
Buttons.Parent = ScreenGui
Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Buttons.BackgroundTransparency = 1.000
Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0)
Buttons.BorderSizePixel = 0
Buttons.Position = UDim2.new(0.416821271, 0, 0.490593344, 0)
Buttons.Size = UDim2.new(0.223179013, 0, 0.303907365, 0)

Download.Name = "Download"
Download.Parent = Buttons
Download.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Download.BackgroundTransparency = 1.000
Download.BorderColor3 = Color3.fromRGB(0, 0, 0)
Download.BorderSizePixel = 0
Download.Position = UDim2.new(-0.167197183, 0, -0.0622560084, 0)
Download.Size = UDim2.new(1.11607015, 0, 0.647619069, 0)
Download.Image = "rbxassetid://14685113779"

Skip.Name = "Skip"
Skip.Parent = Buttons
Skip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Skip.BackgroundTransparency = 1.000
Skip.BorderColor3 = Color3.fromRGB(0, 0, 0)
Skip.BorderSizePixel = 0
Skip.Position = UDim2.new(-0.014, 0,0.403, 0)
Skip.Size = UDim2.new(0.806974769, 0, 0.576190531, 0)
Skip.Image = "rbxassetid://14685123969"


Skip.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

Download.MouseButton1Click:Connect(function()
	task.delay(2, function()
		ScreenGui:Destroy()
	end)
	if setclipboard then
		setclipboard("https://bit.ly/ArticX")
	end
	for i = 1, 10 do
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Copied",
			Text = "Copied bit.ly/ArticX",
			Duration = 500
		})
	end
end)

local ts = game:GetService("TweenService")

for i,v in pairs(ScreenGui:GetChildren()) do
	if v ~= Main then
		--v.Visible = false
		for i,v in pairs(v:GetChildren()) do
			v.ImageTransparency = 1
		end
		if v:IsA("ImageLabel") then
			v.ImageTransparency = 1
		end
	else
		ts:Create(Main, TweenInfo.new(.7, Enum.EasingStyle.Quart), {Size = UDim2.new(0.514005959, 0, 0.726383388, 0)}):Play()
	end
end

task.wait(1)

for i,v in pairs(ScreenGui:GetChildren()) do
	if v ~= Main then
		for i,v in pairs(v:GetChildren()) do
			v.ImageTransparency = 1
			ts:Create(v, TweenInfo.new(.2, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
		end
		if v:IsA("ImageLabel") then
			ts:Create(v, TweenInfo.new(.2, Enum.EasingStyle.Quint), {ImageTransparency = 0}):Play()
		end
	end
end


