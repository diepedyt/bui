repeat task.wait() until game:IsLoaded()

if not readfile then
    delfolder("Banana Hub")
end

task.spawn(function()
    --loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/requireFix.lua"))()
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/todaysbypassExpirestmr.lua"))()

_G.Scripts = {
    [2324662457] = "https://raw.githubusercontent.com/diepedyt/bui/main/AnimeFighters.lua",
    [4986566693] = "https://raw.githubusercontent.com/diepedyt/bui/main/AnimeChampions.lua",
    [5166944221] = "https://raw.githubusercontent.com/diepedyt/bui/main/DeathBallLite.lua",
    [4777817887] = "https://raw.githubusercontent.com/diepedyt/bui/main/BladeBall.lua",
    [3541611379] = "https://raw.githubusercontent.com/diepedyt/bui/main/TDX.lua",
    [3317771874] = "https://raw.githubusercontent.com/diepedyt/bui/main/PS99.lua",
    [5300677688] = "https://raw.githubusercontent.com/diepedyt/bui/main/ASX2.lua",
    [5454107027] = "https://raw.githubusercontent.com/diepedyt/bui/main/APS.lua",
    [4509896324] = "https://raw.githubusercontent.com/diepedyt/bui/main/ALS.lua",
    [4093155512] = "https://raw.githubusercontent.com/diepedyt/bui/main/SB3.lua",
    [5686465822] = "https://raw.githubusercontent.com/diepedyt/bui/main/PetCatchers.lua",
    [6149138290] = "https://raw.githubusercontent.com/diepedyt/bui/main/ACB.lua"
}

if not _G.Override then
    _G.Override = {}
end
for i,v in pairs(_G.Override) do
    _G.Scripts[i] = v
end

if not _G.dont then
    loadstring(game:HttpGet(_G.Scripts[game.gameId]))()
    --loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/loader.lua"))()
end
