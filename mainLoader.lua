repeat wait() until game:IsLoaded()

_G.games = {
    [10723695195] = {
        GameName = "Anime Evolution",
        BackColor = Color3.fromRGB(31, 74, 167),
        MainColor = Color3.fromRGB(255,255,255),
        TextColor = Color3.fromRGB(0, 0, 0),
        ID = "13694"
    }
}

if _G.FastLoad then

    if isfile and readfile and isfile("Keys/"..game.Players.LocalPlayer.Name..".json") then
        local HP = game:GetService("HttpService")
        if HP then
            _G.Key = HP:JSONDecode(readfile("Keys/"..game.Players.LocalPlayer.Name..".json"))
        end
    end

    if _G.Key == nil then
        game.Players.LocalPlayer:Kick("You must login atleast once for Fast Load to work")
    end

end

_G.SIUUABC = true
if not _G.FastLoad then
    _G.SIUUABC = nil
    loadstring(game:HttpGet('https://raw.githubusercontent.com/diepedyt/bui/main/BananaLoader.lua'))()
end

repeat task.wait() until _G.SIUUABC

loadstring(game:HttpGet("https://scripts.luawl.com/".._G.games[game.PlaceId].ID.."/"..game.PlaceId..".lua"))()

