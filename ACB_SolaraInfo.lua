local HM, CardInfoMod, CardRaritiesMod;

local HS = game:GetService("HttpService")

local function GCFCRMs()
    local CardInfoMod = loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/ACB_CardInfoMod.lua"))()
    CardInfoMod = HS:JSONDecode(CardInfoMod)

    local CardRaritiesMod = loadstring(game:HttpGet("https://raw.githubusercontent.com/diepedyt/bui/main/ACB_CardRaritiesMod.lua"))()
    CardRaritiesMod = HS:JSONDecode(CardRaritiesMod)

    return CardInfoMod, CardRaritiesMod
end

CardInfoMod, CardRaritiesMod = GCFCRMs()

HM = {}

local v4 = CardInfoMod
local v5 = CardRaritiesMod

local v196 = {
    Rain = 1.5, 
    Snow = 1.65, 
    Sandstorm = 1.8, 
    ["Infinite Tsukiyomi"] = 2, 
    Isekai = 2.15, 
    Eclipse = 2.3, 
    Galaxy = 2.8
}

HM.CalculateStats = function(v197, v198, v199)
    local l_Chance_0 = v4.CardInfo[v197].Chance
    local l_StatMultiplier_0 = v5.CardRarities[v198].StatMultiplier
    if v4.CardInfo[v197].Weather then
        l_StatMultiplier_0 = l_StatMultiplier_0 * v196[v4.CardInfo[v197].Weather]
    end
    if v199 then
        l_Chance_0 = v199
        l_StatMultiplier_0 = 1
        if v4.CardInfo[v197].Weather then
            l_StatMultiplier_0 = l_StatMultiplier_0 * 1.
        end
    end
    local v202 = math.ceil(2 ^ math.log10(l_Chance_0) * 5.5 * l_StatMultiplier_0)
    local v203 = math.ceil(2 ^ math.log10(l_Chance_0) * 11 * l_StatMultiplier_0)
    if v4.CardInfo[v197].Boss then
        v203 = if v199 then v203 * 1.6 else v203 * 2
        v202 = math.ceil(v202 * 1.2)
    end
    return {
        Damage = v202, 
        Health = v203
    }
end

return HM, CardInfoMod, CardRaritiesMod
