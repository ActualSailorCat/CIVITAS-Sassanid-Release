--==========================================================================================================================
-- Sassanid / Gathering Storm
--==========================================================================================================================
UPDATE Traits
SET Description = 'LOC_TRAIT_CIVILIZATION_CVS_SASANIAN_UA_EXPAC2_DESCRIPTION'
WHERE TraitType = 'TRAIT_CIVILIZATION_CVS_SASANIAN_UA';

INSERT INTO Types (Type, Kind) VALUES ('DYNMOD_CVS_SASANIAN_ALL_ROADS_LEAD_FROM_TISFUN', 'KIND_MODIFIER');
INSERT INTO DynamicModifiers (ModifierType, CollectionType,	EffectType) VALUES ('DYNMOD_CVS_SASANIAN_ALL_ROADS_LEAD_FROM_TISFUN', 'COLLECTION_OWNER', 'EFFECT_GRANT_ROUTE_IN_RADIUS');
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES	('TRAIT_CIVILIZATION_CVS_SASANIAN_UA', 'CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T1'),
		('TRAIT_CIVILIZATION_CVS_SASANIAN_UA', 'CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T2'),
		('TRAIT_CIVILIZATION_CVS_SASANIAN_UA', 'CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T3');
-----------------------------------------------		
-- BuildingModifiers
-----------------------------------------------
INSERT INTO BuildingModifiers 
		(BuildingType,				ModifierId)
VALUES	('BUILDING_GOV_TALL',		'CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T1'),
		('BUILDING_GOV_WIDE',		'CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T1'),
		('BUILDING_GOV_CONQUEST',	'CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T1'),
		('BUILDING_GOV_CITYSTATES',	'CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T2'),
		('BUILDING_GOV_SPIES',		'CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T2'),
		('BUILDING_GOV_FAITH',		'CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T2'),
		('BUILDING_GOV_MILITARY',	'CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T3'),
		('BUILDING_GOV_CULTURE',	'CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T3'),
		('BUILDING_GOV_SCIENCE',	'CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T3');
-----------------------------------------------		
-- Modifiers		
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,							ModifierType,										OwnerRequirementSetId)
VALUES	('CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T1',	'DYNMOD_CVS_SASANIAN_ALL_ROADS_LEAD_FROM_TISFUN',	'CVS_SASANIAN_UA_REQUIRES_LEADER'),
		('CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T2',	'DYNMOD_CVS_SASANIAN_ALL_ROADS_LEAD_FROM_TISFUN',	'CVS_SASANIAN_UA_REQUIRES_LEADER'),
		('CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T3',	'DYNMOD_CVS_SASANIAN_ALL_ROADS_LEAD_FROM_TISFUN',	'CVS_SASANIAN_UA_REQUIRES_LEADER');
-----------------------------------------------		
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,							Name,			Value)
VALUES	('CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T1',	'RouteType',	'ROUTE_ANCIENT_ROAD'),
		('CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T1',	'Radius',		3),
		('CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T2',	'RouteType',	'ROUTE_MEDIEVAL_ROAD'),
		('CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T2',	'Radius',		5),
		('CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T3',	'RouteType',	'ROUTE_MODERN_ROAD'),
		('CVS_SASANIAN_UA_GOVT_PLAZA_ROADS_T3',	'Radius',		7);
-----------------------------------------------
-- NamedMountains
-----------------------------------------------
INSERT INTO NamedMountainCivilizations
		(CivilizationType,				NamedMountainType)
VALUES	('CIVILIZATION_CVS_SASANIAN',	'NAMED_MOUNTAIN_ALBORZ'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_MOUNTAIN_ZAGROS'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_MOUNTAIN_CAUCASUS'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_MOUNTAIN_TALYSH_MOUNTAINS'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_MOUNTAIN_KOPET_DAG_RANGE'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_MOUNTAIN_KARKAS_MOUNTAINS');
-----------------------------------------------
-- NamedRivers
-----------------------------------------------
INSERT INTO NamedRiverCivilizations
		(CivilizationType,				NamedRiverType)
VALUES	('CIVILIZATION_CVS_SASANIAN',	'NAMED_RIVER_TIGRIS'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_RIVER_EUPHRATES'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_RIVER_JAJRUD_RIVER'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_RIVER_KARKHEH_RIVER'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_RIVER_KARUN'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_RIVER_SEFID_RIVER'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_RIVER_ZAYANDE_RIVER'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_RIVER_AMU_DARYA');
-----------------------------------------------
-- NamedDeserts
-----------------------------------------------
INSERT INTO NamedDesertCivilizations
		(CivilizationType,				NamedDesertType)
VALUES	('CIVILIZATION_CVS_SASANIAN',	'NAMED_DESERT_KAVIR'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_DESERT_LUT');
-----------------------------------------------
-- NamedVolcanoCivilizations
-----------------------------------------------
INSERT INTO NamedVolcanoCivilizations
		(CivilizationType,				NamedVolcanoType)
VALUES	('CIVILIZATION_CVS_SASANIAN',	'NAMED_VOLCANO_DAMAVAND'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_VOLCANO_MOUNT_SABALAN'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_VOLCANO_SAHAND');
-----------------------------------------------
-- NamedLakeCivilizations
-----------------------------------------------
INSERT INTO NamedLakeCivilizations
		(CivilizationType,				NamedLakeType)
VALUES	('CIVILIZATION_CVS_SASANIAN',	'NAMED_LAKE_BAKHTEGAN_LAKE'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_LAKE_HAMUN_LAKE'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_LAKE_LAKE_URMIA'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_LAKE_MAHARLOO_LAKE'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_LAKE_NAMAK_LAKE');
-----------------------------------------------
-- NamedSeaCivilizations
-----------------------------------------------
INSERT INTO NamedSeaCivilizations
		(CivilizationType,				NamedSeaType)
VALUES	('CIVILIZATION_CVS_SASANIAN',	'NAMED_SEA_BLACK_SEA'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_SEA_CASPIAN_SEA'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_SEA_GULF_OF_OMAN'),
		('CIVILIZATION_CVS_SASANIAN',	'NAMED_SEA_PERSIAN_GULF');
-----------------------------------------------
-- Units_XP2
-----------------------------------------------
INSERT INTO Units_XP2
		(UnitType,
		ResourceMaintenanceAmount,
		ResourceCost,
		TourismBomb,
		CanEarnExperience,
		TourismBombPossible,
		CanFormMilitaryFormation,
		MajorCivOnly)
SELECT	'UNIT_CVS_ASWAR',
		ResourceMaintenanceAmount,
		10,
		TourismBomb,
		CanEarnExperience,
		TourismBombPossible,
		CanFormMilitaryFormation,
		MajorCivOnly
FROM Units_XP2 WHERE UnitType = 'UNIT_KNIGHT';