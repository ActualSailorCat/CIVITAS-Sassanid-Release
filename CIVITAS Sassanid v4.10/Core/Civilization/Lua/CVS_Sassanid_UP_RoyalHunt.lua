local royalHunt = GameInfo.Projects["PROJECT_CVS_ROYALHUNT"].Index;
local wiskar	= GameInfo.Districts["DISTRICT_CVS_HUNTINGPARK"].Index;
function Sailor_Sassanid_Random_Unit(playerID, cityID, projectID, buildingIndex, iX, iY, bCancelled)
	if PlayerConfigurations[playerID]:GetCivilizationTypeName() ~= 'CIVILIZATION_CVS_SASANIAN' then
		return;
	end
	if bCancelled or projectID ~= royalHunt then
		return;
	end
    local iEraGap	        = 0;
	local pPlayer			= Players[playerID];
    local pPlayerEra		= pPlayer:GetEras():GetEra();
    local pPlayerTechs		= pPlayer:GetTechs();
    local pPlayerCulture	= pPlayer:GetCulture();
	--// Locating district...
	local iWX, iWY			= 0, 0;
	local pPlayerCities		= pPlayer:GetCities();
	local pCityDistricts	= pPlayerCities:FindID(cityID):GetDistricts();
	for i = 0, pCityDistricts:GetNumDistricts() - 1 do
		local pDistrict = pCityDistricts:GetDistrictByIndex(i);
		if pDistrict:GetType() == wiskar then
			iWX, iWY = pDistrict:GetX(), pDistrict:GetY();
		end
	end
    --// Dowsing for water...
    local tWaterTable   = {};
	local iRadius       = 5;
    for dx = (iRadius * -1), iRadius do
        for dy = (iRadius * -1), iRadius do
            local sPlot = Map.GetPlotXYWithRangeCheck(iWX, iWY, dx, dy, iRadius);
            if sPlot and ((sPlot:GetOwner() == pPlayer) or (sPlot:GetOwner() == -1)) then
                local pPlotTerrainIndex = sPlot:GetTerrainType();
                local pPlotTerrainType = GameInfo.Terrains[pPlotTerrainIndex].TerrainType;
                if pPlotTerrainType == "TERRAIN_COAST" then
                    table.insert(tWaterTable, sPlot);
                end
            end
        end
    end
	-- // Include water units if valid tile found.
    local sailorWaterSwitch = "";
    if next(tWaterTable) ~= nil then
        sailorWaterSwitch = "Domain != 'DOMAIN_AIR'";
        else sailorWaterSwitch = "Domain = 'DOMAIN_LAND'";
    end

    --// Unit collection and spawning.
    local tValidUnits = Sailor_UnitNet(iEraGap, sailorWaterSwitch, pPlayerEra, pPlayerTechs, pPlayerCulture);
    if next(tValidUnits) ~= nil then
        Sailor_SassySpawner(tValidUnits, tWaterTable, playerID, iWX, iWY);
    else
        -- Probably not necessary, but if no matches in current player era.
        iEraGap = 1;
        tValidUnits = Sailor_UnitNet(sailorWaterSwitch, pPlayerEra, pPlayerTechs, pPlayerCulture);
        if next(tValidUnits) ~= nil then
            Sailor_SassySpawner(tValidUnits, tWaterTable, playerID, iWX, iWY);
        else
            -- Probably even less necessary, but in the event of Future era issues.
            iEraGap = 2;
            tValidUnits = Sailor_UnitNet(sailorWaterSwitch, pPlayerEra, pPlayerTechs, pPlayerCulture);
            if next(tValidUnits) ~= nil then
                Sailor_SassySpawner(tValidUnits, tWaterTable, playerID, iWX, iWY);
            end
        end
    end
end
print("4");
--// Gathers only units within x eras, and only for which leader has the prerequisites.
function Sailor_UnitNet(iEraGap, sailorWaterSwitch, pPlayerEra, pPlayerTechs, pPlayerCulture)
    local tUnitNet = {};
    for i, tRow in ipairs(DB.Query("SELECT * FROM Units WHERE " .. sailorWaterSwitch .. " AND ReligiousStrength = 0 AND TraitType NOT NULL AND CanRetreatWhenCaptured = 0 AND UnitType NOT LIKE 'UNIT_HERO%' AND UnitType NOT IN ('UNIT_SPY', 'UNIT_BARBARIAN_RAIDER')")) do
        if not((pPlayerEra > iEraGap) and (tRow.Combat > 0) and (tRow.PrereqTech == nil) and (tRow.PrereqCivic == nil)) then -- Catches starting units.
            if (((tRow.PrereqTech == nil) or (pPlayerTechs:HasTech(GameInfo.Technologies[tRow.PrereqTech].Index) and ((pPlayerEra - GameInfo.Eras[GameInfo.Technologies[tRow.PrereqTech].EraType].Index) <= iEraGap)))
                and ((tRow.PrereqCivic == nil) or (pPlayerCulture:HasCivic(GameInfo.Civics[tRow.PrereqCivic].Index) and ((pPlayerEra - GameInfo.Eras[GameInfo.Civics[tRow.PrereqCivic].EraType].Index) <= iEraGap)))) then
            table.insert(tUnitNet, tRow);
            end
        end
    end
    return tUnitNet;
end

--// Rolls unit.
function Sailor_SassySpawner(tValidUnits, tWaterTable, playerID, iWX, iWY)
    local iRandUnit = TerrainBuilder.GetRandomNumber(#tValidUnits, "Unit Roll") + 1;
    for i, nUnit in ipairs(tValidUnits) do
        if i == iRandUnit then
            local sTargetUnit = nUnit.UnitType;
            if nUnit.Domain == 'DOMAIN_SEA' then -- Sea spawn...
                local iRandWaterTile = TerrainBuilder.GetRandomNumber(#tWaterTable, "Water Tile Roll") + 1;
                for i, nTile in ipairs(tWaterTable) do
                    if i == iRandWaterTile then
                        local iWaterX, iWaterY = nTile:GetX(), nTile:GetY();
                        print("Spawning water unit", sTargetUnit);
                        UnitManager.InitUnit(playerID, sTargetUnit, iWaterX, iWaterY);
                    end
                end
            else  -- Land spawn...
                print("Spawning land unit", sTargetUnit);
                UnitManager.InitUnit(playerID, sTargetUnit, iWX, iWY);
            end
        end
    end
end
--=============================================
-- Civilization Present Detection by SeelingCat
--=============================================
local bSassanidPresent = false;
for k, v in ipairs(PlayerManager.GetWasEverAliveIDs()) do
    if bSassanidPresent == false then
        local sCivType = PlayerConfigurations[v]:GetCivilizationTypeName();
        if sCivType == 'CIVILIZATION_CVS_SASANIAN' then
			bSassanidPresent = true;
        end
    end
end
if bSassanidPresent == true then
    print ("///// Sassanid detected. Loading lua functions...");
	Events.CityProjectCompleted.Add(Sailor_Sassanid_Random_Unit);
else
    print ("///// Sassanid not detected.");
end