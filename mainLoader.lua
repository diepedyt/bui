repeat wait() until game:IsLoaded()

_G.FastLoad = true

_G.games = {
    [11040063484] = {
        GameName = "Sword Fighters Simulator",
        BackColor = Color3.fromRGB(92, 160, 131),
        MainColor = Color3.fromRGB(255,255,255),
        TextColor = Color3.fromRGB(0, 0, 0),
        ID = "0",
        Script = "'https://scripts.luawl.com/hosted/2607/11040063484.lua'"
    },
    [11542692507] = {
        GameName = "Anime Souls Simulator",
        BackColor = Color3.fromRGB(92, 160, 131),
        MainColor = Color3.fromRGB(255,255,255),
        TextColor = Color3.fromRGB(0, 0, 0),
        ID = "0",
        Script = "https://scripts.luawl.com/hosted/2607/11542692507.lua"
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

loadstring(game:HttpGet(_G.games[game.PlaceId].Script))()

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

