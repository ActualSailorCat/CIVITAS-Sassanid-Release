--=====================================
-- Trait Function -- Credit Chrisy15
--=====================================
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

--=============================================================================
-- Boran Wonder Era Score Function
--=============================================================================
local sTrait = "TRAIT_LEADER_CVS_BORAN_UA"
local tTraitPlayers = C15_GetValidTraitPlayersNew(sTrait)

local districtWonder					= GameInfo.Districts["DISTRICT_WONDER"]
local districtWonderID					= districtWonder.Index
local districtWonderType				= districtWonder.DistrictType
local momentBoranUA						= GameInfo.Moments["MOMENT_TRAIT_LEADER_CVS_BORAN_UA"]
local momentBoranUAID					= momentBoranUA.Index
local momentBoranUAEraScore				= momentBoranUA.EraScore

function CVS_Sailor_BoranUA_CityProductionCompleted(playerID, cityID, orderType, itemType)
    local player = Players[playerID]
    local playerConfig = PlayerConfigurations[playerID]
    local city = player:GetCities():FindID(cityID)
    if (not city) then return end
	print("1")
    if tTraitPlayers[playerID] then
		print("2")
		 if orderType ~= 1 then return end 
		 print("3")
		 if orderType == 1 and (GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_HANGING_GARDENS" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_STONEHENGE" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_PYRAMIDS" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_ORACLE" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_GREAT_LIGHTHOUSE" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_COLOSSUS" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_PETRA" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_COLOSSEUM" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_GREAT_LIBRARY" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_MAHABODHI_TEMPLE" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_TERRACOTTA_ARMY" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_HAGIA_SOPHIA" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_ALHAMBRA" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_CHICHEN_ITZA" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_MONT_ST_MICHEL" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_VENETIAN_ARSENAL" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_GREAT_ZIMBABWE" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_FORBIDDEN_CITY" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_POTALA_PALACE" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_RUHR_VALLEY" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_BOLSHOI_THEATRE" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_OXFORD_UNIVERSITY" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_BIG_BEN" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_HERMITAGE" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_EIFFEL_TOWER" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_BROADWAY" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_CRISTO_REDENTOR" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_ESTADIO_DO_MARACANA" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_SYDNEY_OPERA_HOUSE" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_TEMPLE_ARTEMIS" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_KILWA_KISIWANI" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_KOTOKU_IN" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_CASA_DE_CONTRATACION" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_ST_BASILS_CATHEDRAL" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_TAJ_MAHAL" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_STATUE_LIBERTY" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_AMUNDSEN_SCOTT_RESEARCH_STATION" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_HUEY_TEOCALLI" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_ANGKOR_WAT" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_APADANA" and GameInfo.Buildings[itemType].BuildingType ~= "BUILDING_HALICARNASSUS_MAUSOLEUM") then return 
		 print("4")
		 end
		  Game.ChangePlayerEraScore(playerID, momentBoranUAEraScore) 
			if player:IsHuman() then
			Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GLORY_GOLDEN_AGE] Era Score", momentBoranUAEraScore), plotX, plotY, 0)
			print("5")
			end
	end
end
Events.CityProductionCompleted.Add(CVS_Sailor_BoranUA_CityProductionCompleted)