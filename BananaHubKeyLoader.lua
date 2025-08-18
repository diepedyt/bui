local RS = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")

if not isfile or not readfile or not writefile or not setclipboard then
	isfile = function() return end
	readfile = function() return end
	writefile = function() return end
	setclipboard = function() return end
end

local module = {}

module.SavedKeyFile = "savedKey12038"..game.Players.LocalPlayer.UserId..".txt"
module.UI_PACKAGE = game:GetObjects("rbxassetid://139906473639831")[1]

function module:DestroyUI()
	local ui = self.ui
	if ui then
		ui:Destroy()
	end
end

function module:GetUI()
	local ui = self.ui
	if not ui then
		self.ui = self.UI_PACKAGE:Clone()
		ui = self.ui
	end
	
	local ui_data = {
		ui = ui,
		MainBG = ui.BG.Main,
		KeyUI = ui.BG.Main.KeyUI,
		Loader = ui.BG.Main.Loader,
		Buttons = {
			Enter = ui.BG.Main.KeyUI.Enter,
			GetKey = ui.BG.Main.KeyUI.GetKey,
			BuyPermKey = ui.BG.Main.KeyUI.BuyPermKey
		},
		AutoKey = {
			Frame = ui.BG.Main.KeyUI.AutoKey,
			Text = ui.BG.Main.KeyUI.AutoKey.AutoKey
		},
		KeyBox = {
			TextBox = ui.BG.Main.KeyUI.KeyBox
		}
	}
	
	return ui_data
end

function module:ProtectUI()
    local ui = self:GetUI().ui
    if gethui then
        ui.Parent = gethui()
    elseif syn and syn.protect_gui then 
        syn.protect_gui(ui)
        ui.Parent = CoreGui
    elseif CoreGui:FindFirstChild("RobloxGui") then
        ui.Parent = CoreGui:FindFirstChild("RobloxGui")
    else
        ui.Parent = CoreGui
    end
end

module.cons = {}
function module:ClearCons()
	local cons = self.cons
	for _, con in pairs(cons) do
		con:Disconnect()
	end
end

function module:ResetUI()
	local ui = self:GetUI()
	
	
end

function module:LoadUI()
	self:ClearCons()
	self:ResetUI()
	
	local ui = self:GetUI()
	self:ProtectUI()

	local t = TS:Create(ui.Loader, TweenInfo.new(.4, Enum.EasingStyle.Exponential), {Size = UDim2.new(0.95, 0, 0.95, 0), BorderSizePixel = 1, BackgroundColor3 = Color3.fromRGB(149, 149, 149)})
	local t2 = TS:Create(ui.MainBG, TweenInfo.new(1, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0})
	t:Play()
	t2:Play()
	t.Completed:Wait()

	ui.KeyUI.Visible = true

	local t = TS:Create(ui.Loader, TweenInfo.new(.9, Enum.EasingStyle.Quart), {BackgroundTransparency = 1, BorderSizePixel = 0})
	t:Play()
	t.Completed:Wait()
	ui.Loader.Visible = false
end

function module:UnloadUI()
	local ui = self:GetUI()

	ui.Loader.Visible = true
	local t = TS:Create(ui.Loader, TweenInfo.new(.6, Enum.EasingStyle.Quart), {BackgroundTransparency = 0, BorderSizePixel = 1})
	t:Play()
	t.Completed:Wait()

	ui.KeyUI.Visible = false

	local t = TS:Create(ui.Loader, TweenInfo.new(.4, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 0, 0, 0), BorderSizePixel = 0, BackgroundColor3 = Color3.fromRGB(255, 255, 255)})
	local t2 = TS:Create(ui.MainBG, TweenInfo.new(1, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1})
	t:Play()
	t2:Play()
	t.Completed:Wait()

	self:DestroyUI()

end

function module:SaveKey(key)
	writefile(self.SavedKeyFile, key)
end

function module:GetSavedKey()
	local file_name = self.SavedKeyFile
	local file = isfile(file_name) and readfile(file_name)
	return file
end

module.KeyBoxInputChanged = nil -- tick
module.KeyEntered = nil -- boolean

function module:SetupKeyInput()
	local ui = self:GetUI()
	local c;
	self.KeyEntered = false
	c = ui.Buttons.Enter.Activated:Connect(function()
		c:Disconnect()
		self.KeyEntered = true
	end)
end

function module:SetKeyError()
	local ui = self:GetUI()
	ui.KeyBox.TextBox.Text = ""
	ui.Buttons.Enter.Text = "Key Error!"
	task.delay(0.75, function()
		ui.Buttons.Enter.Text = "Enter"
	end)
end

function module:SetupAutoKey()
	local savedKey = self:GetSavedKey()
	
	if savedKey then
		local ui = self:GetUI()
		local TextBox = ui.KeyBox.TextBox
		TextBox.Text = savedKey
		
		self.KeyBoxInputChanged = os.time() + 15
		
		local c;
		c = TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			c:Disconnect()
			self.KeyBoxInputChanged = nil
		end)
		
	end
end


function module:GetFinalKey()
	local ui = self:GetUI()
	local TextBox = ui.KeyBox.TextBox
	
	local KeyBoxInput = false --self.KeyBoxInputChanged
	if KeyBoxInput then
		local timeLeft = (KeyBoxInput - os.time())
	
		ui.AutoKey.Text.Text = string.format("Auto Using Key in %ss", timeLeft)
		ui.AutoKey.Frame.Visible = true
		
		if timeLeft <= 0 then
			return TextBox.Text
		end
	else
		ui.AutoKey.Frame.Visible = false
	end
	
	if self.KeyEntered then
		return TextBox.Text
	end
	
end

function module:SetUpBuyPermKey(discord_link)
	local ui = self:GetUI()
	local BuyPermKey = ui.Buttons.BuyPermKey
	local originalText = BuyPermKey.Text
	BuyPermKey.Activated:Connect(function()
		BuyPermKey.Text = string.format("Discord Copied (%s)", discord_link)
		setclipboard(discord_link)
		task.delay(2, function()
			BuyPermKey.Text = originalText
		end)
	end)
end

function module:SetUpGetKey(key_link)
	local ui = self:GetUI()
	local GetKey = ui.Buttons.GetKey
	local originalText = GetKey.Text
	GetKey.Activated:Connect(function()
		GetKey.Text = "Key Link Copied"
		setclipboard(key_link)
		task.delay(2, function()
			GetKey.Text = originalText
		end)
	end)
end

function module:GetKeyInput(discord_link, key_link, verify_key)

	local s_key = self:GetSavedKey()
	if s_key and verify_key and verify_key(s_key) then
		return s_key
	end
	
	self:LoadUI()
	
	self:SetupKeyInput()
	
	self:SetUpBuyPermKey(discord_link)
	self:SetUpGetKey(key_link)
	
	local key;
	while not key do

		key = self:GetFinalKey()
		
		if key and verify_key and not verify_key(key) then
			key = nil
			self:SetKeyError()
			self:SetupKeyInput()
		end

		if not key then
			task.wait(.1)
		end

	end

	key = tostring(key)
	key = key:gsub(" ","")

	self:SaveKey(key)
	self:UnloadUI()
	
	return key

end

return module
