local module = loadstring(game:HttpGet('https://raw.githubusercontent.com/diepedyt/bui/refs/heads/main/BananaHubKeyLoader.lua'))()
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
script_key = module:GetKeyInput("guns.lol/BrainrotHub", "https://ads.luarmor.net/v/cb/glivvlBfYmsc/HWeeXOWWampAhTPU", function(key)
  warn("attempting key", key)
  api.script_id = "c9d1ce97d284685be9191fb8090e23c5"
  local status = api.check_key(key)
  return status and status.code == "KEY_VALID"
end)
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/c9d1ce97d284685be9191fb8090e23c5.lua"))()
