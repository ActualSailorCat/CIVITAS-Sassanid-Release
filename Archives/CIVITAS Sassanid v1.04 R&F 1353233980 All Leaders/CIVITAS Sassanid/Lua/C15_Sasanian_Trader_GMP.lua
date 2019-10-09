--==========================================================================================================================
-- Sasanian / Trader Lua (Chrisy15)
--==========================================================================================================================
function C15_GetValidTraitPlayersNew(sTrait)
    local tValid = {}
    for k, v in ipairs(PlayerManager.GetWasEverAliveIDs()) do
        local leaderType = PlayerConfigurations[v]:GetLeaderTypeName()
        for trait in GameInfo.LeaderTraits() do
            if trait.LeaderType == leaderType and trait.TraitType == sTrait then 
                tValid[v] = true 
            end;
        end
        if not tValid[v] then
            local civType = PlayerConfigurations[v]:GetCivilizationTypeName()
            for trait in GameInfo.CivilizationTraits() do
                if trait.CivilizationType == civType and trait.TraitType == sTrait then 
                    tValid[v] = true 
                end;
            end
        end
    end
    return tValid
end

local sTrait = "TRAIT_CIVILIZATION_SAILOR_SOTSR"
local tTraitPlayers = C15_GetValidTraitPlayersNew(sTrait)
local iGreatMerchantClass = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_MERCHANT"].Index
local iTrader = GameInfo.Units["UNIT_TRADER"].Index
local iGMPToAdd = 1

function C15_Seacatlad_TraderGMP(playerID)
    local pPlayerConfig = PlayerConfigurations[playerID]
	if tTraitPlayers[playerID] then
        local pPlayer = Players[playerID]
        local pPlayerUnits = pPlayer:GetUnits()
        local iGPP = 0
        local bHuman = pPlayer:IsHuman()
        for i, pUnit in pPlayerUnits:Members() do
            if pUnit:GetType() == iTrader then
                local iX, iY = pUnit:GetX(), pUnit:GetY()
                local pPlot = Map.GetPlot(iX, iY)
                if pPlot then
                    if pPlot:GetOwner() ~= playerID then
                        iGPP = iGPP + iGMPToAdd
                        if bHuman then
                            Game.AddWorldViewText(playerID, Locale.Lookup("[COLOR_FLOAT_GOLD]+{1_GMP} [ICON_GreatMerchant][ENDCOLOR]", iGMPToAdd), iX, iY, 0)
                        end
                    end
                end
            end
        end
        if iGPP > 0 then
            local pPlayerGPP = pPlayer:GetGreatPeoplePoints()
            pPlayerGPP:ChangePointsTotal(iGreatMerchantClass, iGPP)
        end
    end
end

GameEvents.PlayerTurnStarted.Add(C15_Seacatlad_TraderGMP)
