
repeat task.wait() until game:IsLoaded()

local ui = loadstring(game:HttpGet('https://raw.githubusercontent.com/diepedyt/customLua/main/SimpleUiLib.lua'))()

local theme = {
	["MainColor"] = Color3.fromRGB(255, 255, 0), -- Yellow
	["KeyUIColor"] = Color3.fromRGB(173, 146, 0), -- Dark yellow
	["KeyUIBorderColor"] = Color3.fromRGB(255, 255, 255),
	["KeyLoginTextBoxColor"] = Color3.fromRGB(255, 230, 0), -- Light yellow
	["KeyLoginTextColor"] = Color3.fromRGB(0, 0, 0), -- Black
	["TextButtonColor"] = Color3.fromRGB(255, 204, 0), -- Bright yellow
	["TextButtonTextColor"] = Color3.fromRGB(107, 0, 2)
}

local n = nil;local v0=bit32 or bit ;local v1=v0.bxor;local v2=v0.bor;local v3=v0.band;local v4=string.char;local v5=string.byte;local v6=string.sub;local v0=bit32 or bit ;local v1=v0.bxor;local v7=table.concat;local v8=table.insert;local function v9(v13,v14)local v15={};for v16=2 -1 , #v13 do v8(v15,v4(v1(v5(v6(v13,v16,v3(v16,1) + v2(v16,2 -1 ) )),v5(v6(v14,v3(1 -0 ,(v16-(2 -1))% #v14 ) + v2(1,(v16-(620 -(555 + 64)))% #v14 ) ,v3(1 + ((v16-(932 -(857 + 74)))% #v14) ,1) + v2((569 -(367 + 201)) + ((v16-1)% #v14) ,928 -(214 + 713) ) )))%(65 + 191) ));end return v7(v15);end local v10={};v10[v9("\8\129\134\139","\126\177\163\187\69\134\219\167")]={};v10[v9("\234\115\136\122","\156\67\173\74\165")][v9("\80\100\242\25","\38\84\215\41\118\220\70")]={};n=(_G.Scripts.o:reverse()):lower();--[[_G.KeyInserted = ui.CreateKeySystem(n, _G.Scripts.d, theme, "Banana Hub 👑")]]_G.KeyInserted = _G.wl_key:lower() == n

if _G.KeyInserted then
    local main = ui.CreateMain()
    for i,v in pairs(_G.Scripts) do
        if type(v) == "table" then
            local gameName = tostring(i)
            pcall(function()
                gameName = game:GetService("MarketplaceService"):GetProductInfo(i).Name
            end)
            ui.CreateSection(main, gameName)
            for i,v in pairs(v) do
                ui.CreateButton(main, i ,function()
                    task.spawn(function()
                        loadstring(game:HttpGet(v))()
                    end)
                    main:Destroy()
                end)
            end
        end
    end
end
