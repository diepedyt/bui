local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
local module = loadstring(game:HttpGet('https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/BananaHubKeyLoader.lua'))()
script_key = module:GetKeyInput("discord.gg/BananaHub", "https://ads.luarmor.net/get_key?for=Banana_Hub-hWOdrVMDQVrL", function(key)
    api.script_id = "180154ec7abc246752b60603a7adc12d"
    local status;
    pcall(function()
        status = api.check_key(key)
        print(status.code)
    end)
    return status and status.code == "KEY_VALID"
end)
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/180154ec7abc246752b60603a7adc12d.lua"))()

--loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/temporynewkeysystem.lua"))()
