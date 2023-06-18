loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
if false then
loadstring(game:HttpGet('https://raw.githubusercontent.com/diepedyt/watermark/main/WHYDIDIMAKETHIS.lua'))()
    task.wait(6)

    repeat task.wait() until game:IsLoaded()

    _G.DiscordInvite = "https://discord.gg/A33fTdna63"

    _G.Scripts = {
        [8425128940] = "https://scripts.luawl.com/hosted/3423/19726/AnimeWarriors2Free.lua",
        [8720980067] = "https://scripts.luawl.com/hosted/3423/19690/AnimeTalesScript.lua"
    }

    local s, f = pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/mainBuiLoaderNew.lua"))() end)

    repeat task.wait() until f or _G.Complete
    loadstring(game:HttpGet(_G.Scripts[game.PlaceId]))()
end
