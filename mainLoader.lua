repeat wait() until game:IsLoaded()

_G.FastLoad = true

_G.games = {
    [10723695195] = {
        GameName = "Anime Evolution",
        BackColor = Color3.fromRGB(31, 74, 167),
        MainColor = Color3.fromRGB(255,255,255),
        TextColor = Color3.fromRGB(0, 0, 0),
        ID = "13694"
    },
    [11563572312] = {
        GameName = "Ultimate Magnet Simulator",
        BackColor = Color3.fromRGB(255, 0, 0),
        MainColor = Color3.fromRGB(255,255,255),
        TextColor = Color3.fromRGB(0, 0, 0),
        ID = "13839"
    },
    [11445923563] = {
        GameName = "One Fruit Simulator",
        BackColor = Color3.fromRGB(131, 48, 141),
        MainColor = Color3.fromRGB(255,255,255),
        TextColor = Color3.fromRGB(0, 0, 0),
        ID = "13911"
    },
    [11040063484] = {
        GameName = "Sword Fighters Simulator",
        BackColor = Color3.fromRGB(92, 160, 131),
        MainColor = Color3.fromRGB(255,255,255),
        TextColor = Color3.fromRGB(0, 0, 0),
        ID = "14042"
    }
}

if _G.FastLoad then

    if isfile and readfile and isfile("Keys/"..game.Players.LocalPlayer.Name..".json") then
        local HP = game:GetService("HttpService")
        if HP then
            _G.wl_key = HP:JSONDecode(readfile("Keys/"..game.Players.LocalPlayer.Name..".json"))
        end
    end

    if _G.wl_key == nil then
        game.Players.LocalPlayer:Kick("You must login atleast once for Fast Load to work")
    end

end

_G.SIUUABC = true
if not _G.FastLoad then
    _G.SIUUABC = nil
    loadstring(game:HttpGet('https://raw.githubusercontent.com/diepedyt/bui/main/BananaLoader.lua'))()
end

repeat task.wait(1) until _G.SIUUABC

if isfile and delfile and isfile("Keys/"..game.Players.LocalPlayer.Name..".json") then
    delfile("Keys/"..game.Players.LocalPlayer.Name..".json")
end

loadstring(game:HttpGet("https://scripts.luawl.com/".._G.games[game.PlaceId].ID.."/"..game.PlaceId..".lua"))()

repeat task.wait(1) until _G.Settings

if makefolder and isfolder and writefile and readfile and _G.wl_key then
    if not isfolder("Keys") then
        makefolder("Keys")
    end
    local HP = game:GetService("HttpService")
    if HP then
        writefile("Keys/"..game.Players.LocalPlayer.Name..".json",HP:JSONEncode(_G.wl_key))
    end
end

