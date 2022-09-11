--==========================================================================================================================
-- CIVITAS Sassanid Royal Hunt
-- Author: SailorCat
--==========================================================================================================================
----------------------------
-- GetValidUnits
----------------------------
function GetValidUnits(playerID, tUnits)

	local tValidUnits = {}

	-- Get Tech, Cult, and Resources
	local pPlayer = Players[playerID]
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
end

local tValidProject = GameInfo.Projects["PROJECT_CVS_ROYALHUNT"].Index
function Sailor_Sassanid_Random_Unit(playerID, cityID, projectID, iUnknown, iX, iY, bCancelled)
	local bSassanidCiv = false
	local pPlayerConfig = PlayerConfigurations[playerID]
	local sCivilization = pPlayerConfig:GetCivilizationTypeName()
	--print(sCivilization)
	if sCivilization == 'CIVILIZATION_CVS_SASANIAN' then
		bSassanidCiv = true
	end

	if bSassanidCiv == true then
	local pPlayer = Players[playerID]
	if not bCancelled and tValidProject == projectID then
		local tUnits = GetValidUnits(playerID, tSassanidUnits)
		local pPlayerCities = pPlayer:GetCities()
		local pCap = pPlayerCities:GetCapitalCity()
		if not pCap then return end
		local iNumberValidUnits = 0
		for i, tUnit in ipairs(tUnits) do
			iNumberValidUnits = iNumberValidUnits + 1
		end
		print("Units: ", iNumberValidUnits)

		if iNumberValidUnits > 0 then
			iRandomUnit = TerrainBuilder.GetRandomNumber(iNumberValidUnits, "Royal Hunt")
			print("Random unit number is: ", iRandomUnit)
			for i, tUnit in ipairs(tUnits) do
				if i == iRandomUnit then
					print("//// Spawning...", tUnit.UnitType)
					local sUnit = tUnit.UnitType
					UnitManager.InitUnit(playerID, sUnit, pCap:GetX(), pCap:GetY())
				end
			end
		end
	end
	end
end
--=============================================
-- Civilization Present Detection by SeelingCat
--=============================================
local bSassanidPresent = false

for k, v in ipairs(PlayerManager.GetWasEverAliveIDs()) do
    if bSassanidPresent == false then
        local sCivType = PlayerConfigurations[v]:GetCivilizationTypeName()
        if sCivType == 'CIVILIZATION_CVS_SASANIAN' then
			--print (sCivType)
			bSassanidPresent = true
        end
    end
end
if bSassanidPresent == true then
    print ("///// Sassanid detected. Loading lua functions...")
	Events.CityProjectCompleted.Add(Sailor_Sassanid_Random_Unit)
else
    print ("///// Sassanid not detected.")
end