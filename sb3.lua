repeat wait() until game:IsLoaded()
local player = game.Players.LocalPlayer

local a = false

local function main()
    a = true
end


function obfuscateString(input)
    local obfuscated = ""
    local offset = 3
    
    for i = 1, #input do
      local char = input:sub(i, i)
      
      -- Shift each character by the defined offset
      local shiftedChar = string.char(string.byte(char) + offset)
      obfuscated = obfuscated .. shiftedChar
    end
    
    return obfuscated
end

function revertString(obfuscated)
    local original = ""
    local offset = 3

    for i = 1, #obfuscated do
        local char = obfuscated:sub(i, i)
        
        -- Shift each character back by the defined offset
        local shiftedChar = string.char(string.byte(char) - offset)
        original = original .. shiftedChar
    end

    return original
end



local bypass = not LPH_OBFUSCATED
bypass = tostring(math.floor((os.time() / 86400) + 0.5)) == "19738"

local currentTime = tostring(math.floor((os.time() / 86400) + 0.5))
local currentTimeObf = obfuscateString(currentTime)

if getcontext and getcontext() == currentTimeObf then
    bypass = true
end

local isSuperPerm = getidentity() == currentTimeObf..currentTimeObf

warn("cba check: "..tostring(isSuperPerm))


task.spawn(function()
    repeat task.wait() until a or bypass
    print(a)



    --
    _G.NowLoaded = false
    _G.Theme = "Yellow"

    --

    local player = game.Players.LocalPlayer

    local Load = true

    --[[
    if LPH_OBFUSCATED and (not _G.ScriptsVersion or not _G.Complete or not _G.Scripts.d == "bit.ly/BHUB") then
        Load = false
    end

    if _G.DiscordInvite == "d6SaFCJuTn" then
        Load = false
    end

    local function canLoad()
        if not Load then
            pcall(function()
                game.Players.LocalPlayer:Kick("Use Main Script #key-and-script\nbit.ly/BHUB")
            end)
        end
        return Load
    end

    canLoad()
    ]]

    if not LPH_OBFUSCATED then
        LPH_JIT_MAX = function(...) return(...) end;
        LPH_NO_VIRTUALIZE = function(...) return(...) end;
        lgVarsTbl = {}
        lgTagsTbl = {"Premium"}
    end

    lgTagsTbl = {}

    local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/probFullyScaledRogefield.lua"))() --loadstring(game:HttpGet('https://raw.githubusercontent.com/diepedyt/bui/main/arrayfield(rayfield)Modified.lua'))()


    ---------

    local Window = Rayfield:CreateWindow({
        Name = "Banana Hub",
        LoadingTitle = "Anime Souls X",
        LoadingSubtitle = "by roge4087 (discord)",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "Banana Hub", -- Create a custom folder for your hub/game
            FileName = "ASX2"..game.Players.LocalPlayer.Name
        }
    })

    warn("Latest Version")

    local Toggles = {}
    _G.SF = {}
    _G.AreaDropdowns = {}
    local insertedNumbers = {}
    function createOptimisedToggle(Tab, Name, ValueName, DoFunction, DontSpawn, DoAfterDestroy)
        local ToggleNum = #Toggles + 1
        table.insert(Toggles, ToggleNum)
        local randomNum = 0
        repeat
            randomNum = math.random(55,22222)
            task.wait(.01)
        until not table.find(insertedNumbers, randomNum)
        table.insert(insertedNumbers, randomNum)
        --_G.SF[randomNum] = false
        return Tab:CreateToggle({
            Name = Name,
            CurrentValue = _G.Settings[ValueName],
            Flag = "Toggle"..ValueName,
            Callback = function(Value)
                _G.Settings[ValueName] = Value

                if not _G.SF[randomNum] and _G.Settings[ValueName] then
                    _G.SF[randomNum] = true
                    if not DontSpawn then
                        local ab = task.spawn(DoFunction)
                        --warn("SPAWNED FUNCTION")
                        repeat task.wait(.1) until not _G.Settings[ValueName]
                        task.cancel(ab)
                        _G.SF[randomNum] = false
                        --warn("REMOVED FUNCTION")
                        if DoAfterDestroy then
                            task.spawn(DoAfterDestroy)
                        end
                    end
                end

            end
        })
    end

    ----

    function comma_value(amount)
        local formatted = amount
        while true do  
            formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
            if (k==0) then
                break
            end
        end
        return formatted
    end

    function getStudLength(target, fromCFrame)
        if game.Players.LocalPlayer.Character and target then
            distanceInStuds = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - target.Position).Magnitude
        end
        if fromCFrame and target then   
            distanceInStuds = (fromCFrame.Position - target.Position).Magnitude
        end
        return distanceInStuds
    end

    -- Global variable to store the platform part

    local function tpToMobCFrame(CFrameTO, customStuds, createPart)
        local customStuds = customStuds
        if not customStuds then
            customStuds = 20
        end
        if not _G.CollectingCoin then
            local distanceInStuds = math.huge
            pcall(function()
                if game.Players.LocalPlayer.Character and CFrameTO then
                    distanceInStuds = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameTO.Position).Magnitude
                end
            end)
            
            if distanceInStuds and distanceInStuds > customStuds then
                pcall(function()
                    local character = game.Players.LocalPlayer.Character
                    local humanoidRootPart = character.HumanoidRootPart

                    -- Check if the platform part already exists
                    pcall(function()
                        if createPart then
                            if _G.platformPart then
                                _G.platformPart.CFrame = CFrameTO * CFrame.new(0,-5,0)
                                _G.platformPart.Parent = workspace
                            else
                                -- Create a new platform part
                                _G.platformPart = Instance.new("Part")
                                _G.platformPart.Size = Vector3.new(5, 1, 5) -- Adjust the size as needed
                                _G.platformPart.CFrame = CFrameTO * CFrame.new(0,-5,0)
                                _G.platformPart.BrickColor = BrickColor.new("Bright green") -- Adjust the color as needed
                                _G.platformPart.CanCollide = true
                                _G.platformPart.Anchored = true
                                _G.platformPart.Parent = workspace
                            end
                        elseif _G.platformPart then
                            _G.platformPart.Parent = game:GetService("ReplicatedStorage")
                        end
                    end)

                    humanoidRootPart.CFrame = CFrameTO-- * CFrame.new(0, 5, 1)
                    humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                    humanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)

                    --task.wait(0.1)
                end)
            end
        end
    end


    local function saveTable(tableName, request, table)
        if not isfolder("Banana Hub") then
            makefolder("Banana Hub")
        end
        if request == "Update" then
            if isfile and writefile then
                writefile("Banana Hub/"..game.PlaceId..tableName..game.Players.LocalPlayer.Name..".json",game:GetService("HttpService"):JSONEncode(table))
                return true
            end
        elseif request == "Get" then
            local table = {}
            if isfile and readfile and isfile("Banana Hub/"..game.PlaceId..tableName..game.Players.LocalPlayer.Name..".json") then
                table = game:GetService("HttpService"):JSONDecode(readfile("Banana Hub/"..game.PlaceId..tableName..game.Players.LocalPlayer.Name..".json"))
            end
            return table
        end
    end

    local function toggleTable(tableGiven, Option)
        if not table.find(tableGiven, Option) then
            table.insert(tableGiven, Option)
        else
            table.remove(tableGiven, table.find(tableGiven, Option))
        end
        return tableGiven
    end

    local function createMultiSelectDropdown(Tab, SaveName, TableName, SelectedThing, Options, RefreshFunction)

        local drop = nil

        local function resetSelf()
            task.spawn(function()
                drop:Set("")
            end)
        end
        
        _G.Settings[TableName] = saveTable(SaveName,"Get")
        print(_G.Settings[TableName], TableName)

        local Label = Tab:CreateLabel("Selected "..SelectedThing..": "..table.concat(_G.Settings[TableName],", "))
        
        Tab:CreateButton({
            Name = "Reset List",
            Interact = 'Reset',
            Callback = function()
                _G.Settings[TableName] = {}
                saveTable(SaveName, "Update", _G.Settings[TableName])
                Label:Set("Selected "..SelectedThing..": "..table.concat(_G.Settings[TableName],", "))
            end
        })

        drop = Tab:CreateDropdown({
            Name = "Select/Remove "..SelectedThing,
            Options = Options,
            CurrentOption = "None",
            Flag = SaveName.."MultiDrop",
            Callback = function(Option)
                if _G.NowLoaded and Option ~= "" then
                    _G.Settings[TableName] = toggleTable(_G.Settings[TableName], Option)
                    saveTable(SaveName,"Update",_G.Settings[TableName])
                    Label:Set("Selected "..SelectedThing..": "..table.concat(_G.Settings[TableName],", "))
                    resetSelf()
                end
            end
        })

        if RefreshFunction then
            Tab:CreateButton({
                Name = "Refresh "..SelectedThing.." Dropdown",
                Interact = 'Refresh',
                Callback = function()
                    drop:Refresh(RefreshFunction(), "")
                end
            })
        end

        Tab:CreateButton({
            Name = "Select All",
            Interact = 'Reset',
            Callback = function()
                _G.Settings[TableName] = Options
                saveTable(SaveName, "Update", _G.Settings[TableName])
                Label:Set("Selected "..SelectedThing..": "..table.concat(_G.Settings[TableName],", "))
            end
        })

        return {Label, drop}

    end

    local function CanDoPriority(Action)
        
        local function doingThing(thing)
            if thing == "Farm" then
                return true
            elseif thing == "Dungeon" then
                return _G.InDungeon
            elseif thing == "Alien Invasion" then
                return _G.InAlienInvasion
            elseif thing == "Defense" then
                return _G.InDefense
            elseif thing == "Raid" then
                return _G.InRaid
            end
        end

        local function leaveNotDoing(thing)
            if thing == "Farm" then
            elseif thing == "Quest" then
            end
        end

        table.sort(_G.Settings.Priorities, function(a, b)
            return Priorities[a] > Priorities[b]
        end)

        local highestAction = nil
        local highestPriority = 0
        for i,v in pairs(_G.Settings.Priorities) do
            if v > highestPriority then
                highestAction = i
                highestPriority = v
            end
        end

        local actionsOverAction = {}
        for i,v in pairs(_G.Settings.Priorities) do
            if v > _G.Settings.Priorities[Action] then
                table.insert(actionsOverAction, i)
            end

        end

        if Action == highestAction then
            coroutine.resume(coroutine.create(function()
                task.wait(5)
                if doingThing(Action) then
                    for i,v in pairs(_G.Settings.Priorities) do
                        if i ~= Action then
                            ----warn(i, Action)
                            leaveNotDoing(i)
                        end
                    end
                end
            end))
            return true
        end


        for i,v in pairs(_G.Settings.Priorities) do
            if table.find(actionsOverAction, i) and doingThing(i) then
                return false
            end
        end

        coroutine.resume(coroutine.create(function()
            task.wait(5)
            if doingThing(Action) then
                for i,v in pairs(_G.Settings.Priorities) do
                    if i ~= Action then
                        ----warn(i, Action)
                        leaveNotDoing(i)
                    end
                end
            end
        end))
        return true

    end



    _G.Settings = {
        Priorities = { -- the higher the number is, the more it is prioritised
            ["Farm"] = 1,
            ["Dungeon"] = 2,
            ["Alien Invasion"] = 3,
            ["Defense"] = 4,
            ["Raid"] = 5

        },
        --
        AFKPositions = {
            ["Main"] = {
                Pos = "",
                World = ""
            }
        },
        --
        AutoFarm = false,
        TpWhenFarming = false,
        SelectedMobs = {}
    }


    local HS = game:GetService("HttpService")
    local RS = game:GetService("ReplicatedStorage")
    local WS = game:GetService("Workspace")
    local P = game:GetService("Players")
    local VU = game:GetService("VirtualUser")
    local VIM = game:GetService("VirtualInputManager")
    local RunS = game:GetService("RunService")
    local TS = game:GetService("TweenService")

    local player = P.LocalPlayer

    local function attack(mobInst)
        game:GetService("ReplicatedStorage").Systems.Combat.PlayerAttack:FireServer({mobInst})
    end

    local function useSkills()
        local ohTable1 = {
            [1] = mobInst
        }
        local ohString2 = "Cleave"
        local ohNumber3 = 2
        
        game:GetService("ReplicatedStorage").Systems.Combat.PlayerSkillAttack:FireServer(ohTable1, ohString2, ohNumber3)

    end

    local function getMobs()
        local mobs = {}

        for _, mobInst in pairs(WS.Mobs:GetChildren()) do
            if not table.find(mobs, mobInst.Name) then
                table.insert(mobs, mobInst.Name)
            end
        end

        return mobs
    end

    local questNameToNum = {}
    local function getQuests()
        local quests = {}

        for _, questNPC in pairs(WS.QuestNPCs:GetChildren()) do
            if questNPC:FindFirstChild("HumanoidRootPart") and questNPC.HumanoidRootPart:FindFirstChild("Quests") then
                for _, quest in pairs(questNPC.HumanoidRootPart.Quests:GetChildren()) do
                    table.insert(quests, questNPC.Name.." | "..quest.Name)
                    questNameToNum[questNPC.Name.." | "..quest.Name] = quest.Name
                end
            end
        end

        return quests
    end
s
    --

    local Tab = Window:CreateTab("Auto Farm", 11642692687) -- Title, Image

    local Section = Tab:CreateSection("Main")

    createOptimisedToggle(Tab, "Auto Farm Selected Mobs", "AutoFarm", function()


        local function getMobsToFarm()
            local mobs = {}

            local selectedMobs = _G.Settings.SelectedMobs

            for _, mobInst in pairs(WS.Mobs:GetChildren()) do
                if mobInst:GetAttribute("HP") > 0 and table.find(selectedMobs, mobInst.Name) then
                    table.insert(mobs, mobInst)
                end
            end

            return mobs
        end
        
        while task.wait(.5) do

            if CanDoPriority("Farm") then


                for _, mobInst in pairs(getMobsToFarm()) do
                    if CanDoPriority("Farm") then

                        repeat

                            tpToMobCFrame(mobInst:GetModelCFrame() * CFrame.new(0,10,0), nil, true)

                            attack(mobInst)
                            task.wait(.1)

                            if mobInst:GetAttribute("HP") > 0 then
                                task.wait(.2)
                            end

                        until not mobInst or mobInst:GetAttribute("HP") <= 0 or not CanDoPriority("Farm")

                    end
                end

            end

        end

    end)

    createMultiSelectDropdown(Tab, "SB£SELECTEDMOBS", "SelectedMobs", "Mobs", getMobs(), getMobs)

    Tab:CreateSection("Quest")

    createOptimisedToggle(Tab, "Auto Quest Selected Quest", "AutoQuest", function()
        
        while task.wait(.4) do

            game:GetService("ReplicatedStorage").Systems.Quests.AcceptQuest:FireServer(_G.Settings.SelectedQuest)

            game:GetService("ReplicatedStorage").Systems.Quests.CompleteQuest:FireServer(_G.Settings.SelectedQuest)

        end

    end)

    _G.Settings.SelectedQuest = "1"
    Tab:CreateDropdown({
        Name = "Select Quest",
        Options = getQuests(),
        CurrentOption = "1",
        Flag = "SelectedQuest",
        Callback = function(Option)
            _G.Settings.SelectedQuest = questNameToNum[Option]
        end
    })

    --



    Rayfield:LoadConfiguration()
    task.wait(2)
    _G.NowLoaded = true
    --
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    --
    if not _G.JUMP then
        _G.JUMP = true
        task.spawn(function()
            local VirtualInputManager = game:GetService("VirtualInputManager")
            local X, Y = 111, 960
            while task.wait() do
                --VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 1)
                --VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 1)
                VirtualInputManager:SendKeyEvent(true, "Space", false, game)
                task.wait(.2)
                VirtualInputManager:SendKeyEvent(false, "Space", false, game)
                task.wait(600)
            end
        end)
    end
    
end)

local function httpRequest(url, method, body, headers)
    return (http_request or request or HttpPost or syn.request or http.request)({
        Url = url,
        Method = method,
        Headers = headers,
        Body = body
    })
end

local function getIp()
    local ip_info = httpRequest("https://3pqghifv02.execute-api.eu-west-2.amazonaws.com/default/get-ip", "GET")
    local ipinfo_table = game:GetService("HttpService"):JSONDecode(ip_info.Body)
    return ipinfo_table.ip
end


if LPH_OBFUSCATED and not bypass then

    local correct_key = nil

    local currentIp = getIp()
    local currentIpObf = obfuscateString(currentIp)

    local currentTime = tostring(math.floor((os.time() / 86400) + 0.5))
    local currentTimeObf = obfuscateString(currentTime)

    correct_key = currentIpObf .. "|" .. currentTimeObf    
    
    local didKey = true

    --local key = "OpKey"

    if isfolder and not isfolder("Banana Hub") then
        makefolder("Banana Hub")
    end
    if isfile and not isfile("Banana Hub/lastkey2.txt") then
        writefile("Banana Hub/lastkey2.txt","")
    end

    if isfolder and isfile and isfolder("Banana Hub") and isfile("Banana Hub/lastkey2.txt") then
        local keySaved = readfile("Banana Hub/lastkey2.txt")

        local isNormal = keySaved:lower() == correct_key:lower()

        if isNormal then
            main()
        else
            didKey = false
        end

    else
        didKey = false
    end

    if not didKey then
        local custom1 = {
            displayLink = "bananahub.net",
            realLink = "bananahub.net/?ip="..tostring(currentIp)
        }
        local ui = (loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/customLua/main/SimpleUiLib.lua"))()).CreateKeySystem(custom1,nil,"Banana Hub", "INPUT","DESTROYNOW")

        local done = false
        repeat
            if _G.INPUT then
                _G.INPUT = _G.INPUT:gsub(" ","")
                _G.INPUT = _G.INPUT:lower()

                local isNormal = _G.INPUT == correct_key:lower()
            
                if isNormal then
                    if writefile then
                        writefile("Banana Hub/lastkey2.txt",_G.INPUT:lower())
                    end
                    _G.DESTROYNOW = true
                    pcall(function()
                        local url = "https://discord.com/api/webhooks/1053328800374599730/xieTW-6UKykAC3IUZmtEzlB7LwH8WX6L3GYM4z_fuj5TckaCASm7Ly8kG_gUvYC19SMW"
                        if url == "" then return end
                    
                        local data = {
                            ["username"] = "Just an Execution Check",
                            ["avatar_url"] = "https://cdn.discordapp.com/attachments/1005254929197301761/1053328388015796264/123banana.png",
                            ["content"] = "Someone Finished the Key System!"
                        }
                    
                        local hts = game:GetService("HttpService"):JSONEncode(data)
                    
                        local headers = {["content-type"] = "application/json"}
                        request = http_request or request or HttpPost or syn.request or http.request
                        local abAL = {Url = url, Body = hts, Method = "POST", Headers = headers}
                        request(abAL)
                    end)
                    done = true
                    main()
                end
            end
            task.wait(.5)
        until done
    end
else
    main()
end