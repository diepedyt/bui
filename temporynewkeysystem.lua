repeat task.wait() until game:IsLoaded()
task.spawn(function()
    while task.wait() do
        _G.ScriptsVersion = "yekdoog"
    end
end)

_G.Scripts = {
    [2324662457] = "https://raw.githubusercontent.com/diepedyt/bui/main/2.lua",
    [4986566693] = "https://raw.githubusercontent.com/diepedyt/bui/main/4.lua",
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/sec.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/mainBuiLoaderNew.lua"))()
