repeat task.wait() until game:IsLoaded()

_G.Scripts = {
    [2324662457] = "https://raw.githubusercontent.com/diepedyt/bui/main/AnimeFighters.lua",
    [4986566693] = "https://raw.githubusercontent.com/diepedyt/bui/main/AnimeChampions.lua",
    [5166944221] = "https://raw.githubusercontent.com/diepedyt/bui/main/DeathBallLite.lua",
    [4777817887] = "https://raw.githubusercontent.com/diepedyt/bui/main/BladeBall.lua",
    [3541611379] = "https://raw.githubusercontent.com/diepedyt/bui/main/TDX.lua",
    [3317771874] = "https://raw.githubusercontent.com/diepedyt/bui/main/PS99.lua"
}

if not _G.dont then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/loader.lua"))()
end
