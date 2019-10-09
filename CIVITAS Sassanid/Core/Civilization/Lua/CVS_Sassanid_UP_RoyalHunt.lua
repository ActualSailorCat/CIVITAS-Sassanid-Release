--==========================================================================================================================
-- CIVITAS Sassanid Royal Hunt
-- Author: Sukritact, SailorCat
-- Most of this is edited Lua from Suk's Senusret III
--==========================================================================================================================
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
----------------------------
--LeaderCheck by Chrisy15
----------------------------
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
----------------------------
-- GetRandom
----------------------------
function GetRandom(iLower, iUpper, sReason)
	return Game.GetRandNum((iUpper + 1) - iLower, sReason) + iLower
end
----------------------------
-- GetValidUnits
----------------------------
function GetValidUnits(iPlayer, tUnits)

	local tValidUnits = {}

	-- Get Tech, Cult, and Resources
	local pPlayer = Players[iPlayer]
	local pPlayerTechs = pPlayer:GetTechs()
	local pPlayerCulture = pPlayer:GetCulture()

	for i, tUnit in pairs(tUnits) do
		local sTech			= tUnit.PrereqTech
		local sTechObs		= tUnit.MandatoryObsoleteTech
		local sCivic		= tUnit.PrereqCivic
		local sCivicObs 	= tUnit.MandatoryObsoleteCivic

		local bTech			=	not(sTech) or pPlayerTechs:HasTech(GameInfo.Technologies[sTech].Index)
		local bTechObs		=	not(sTechObs) or not pPlayerTechs:HasTech(GameInfo.Technologies[sTechObs].Index)
		local bCivic		=	not(sCivic) or pPlayerCulture:HasCivic(GameInfo.Civics[sCivic].Index)
		local bCivicObs		=	not(sCivicObs) or not pPlayerCulture:HasCivic(GameInfo.Civics[sCivicObs].Index)

		if bTech and bTechObs and bCivic and bCivicObs then
			table.insert(tValidUnits, tUnit)
		end
	end

	return tValidUnits
end

--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
local tSassanidUnits = {}
for i, tRow in ipairs(DB.Query("SELECT * from Units WHERE FormationClass != 'FORMATION_CLASS_CIVILIAN' AND Domain = 'DOMAIN_LAND'")) do
	tSassanidUnits[i] = tRow

	--print(tRow.UnitType)
	--print(tRow.PrereqTech)
	--print(tRow.MandatoryObsoleteTech)
	--print(tRow.PrereqCivic)
	--print(tRow.MandatoryObsoleteCivic)
end

local sTrait = "TRAIT_CIVILIZATION_CVS_SASANIAN_UA"
local tTraitPlayers = C15_GetValidTraitPlayersNew(sTrait)
local tValidProject = GameInfo.Projects["PROJECT_CVS_ROYALHUNT"].Index

function Sailor_Sassanid_Random_Unit(iPlayer, cityID, projectID, iUnknown, iX, iY, bCancelled)
	local pPlayer = Players[iPlayer]
	local pPlayerConfig = PlayerConfigurations[iPlayer]
	if not bCancelled and tValidProject == projectID and tTraitPlayers[iPlayer] then
			local tUnits = GetValidUnits(iPlayer, tSassanidUnits)
			local pPlayerCities = pPlayer:GetCities()
			local pCap = pPlayerCities:GetCapitalCity()
			if not pCap then return end
				local tUnit = tUnits[GetRandom(1, #tUnits, "Sassanid Units")]
				local sUnit = tUnit.UnitType
				UnitManager.InitUnit(iPlayer, sUnit, pCap:GetX(), pCap:GetY())
	end
end
Events.CityProjectCompleted.Add(Sailor_Sassanid_Random_Unit)
--==========================================================================================================================
--==========================================================================================================================
