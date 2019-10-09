--==========================================================================================================================
-- Sassanid / Wiškar (District)
--==========================================================================================================================
-----------------------------------------------
-- Districts
-----------------------------------------------
INSERT INTO Districts		(
		DistrictType,
		Name,
		Description,
		TraitType,
		Entertainment,
		Cost,
		Maintenance,
		PrereqCivic,
		Aqueduct,
		PlunderType,
		PlunderAmount,
		AdvisorType,
		CostProgressionModel,
		CostProgressionParam1,
		RequiresPlacement,
		RequiresPopulation,
		NoAdjacentCity,
		InternalOnly,
		ZOC,
		CaptureRemovesBuildings,
		HitPoints,
		CaptureRemovesCityDefenses,
		TravelTime,
		CityStrengthModifier,
		MilitaryDomain,
		Appeal,
		Housing,
		OnePerCity
		)
SELECT	'DISTRICT_CVS_HUNTINGPARK', -- DistrictType
		'LOC_DISTRICT_CVS_HUNTINGPARK_NAME', -- Name
		'LOC_DISTRICT_CVS_HUNTINGPARK_DESCRIPTION', -- Description
		'TRAIT_CIVILIZATION_DISTRICT_CVS_HUNTINGPARK', -- TraitType
		1, -- Entertainment
		Cost/2, -- Cost
		Maintenance,
		'CIVIC_MILITARY_TRADITION', -- PrereqCivic
		Aqueduct,
		'YIELD_CULTURE', -- PlunderType
		25, -- PlunderAmount
		'ADVISOR_GENERIC', -- AdvisorType
		CostProgressionModel,
		CostProgressionParam1,
		RequiresPlacement,
		0, -- RequiresPopulation
		NoAdjacentCity,
		InternalOnly,
		ZOC,
		CaptureRemovesBuildings,
		HitPoints,
		CaptureRemovesCityDefenses,
		TravelTime,
		CityStrengthModifier,
		'NO_DOMAIN', -- MilitaryDomain
		Appeal,
		0, -- Housing
		1  -- OnePerCity
FROM Districts
WHERE DistrictType = 'DISTRICT_NEIGHBORHOOD';
-----------------------------------------------
-- District_GreatPersonPoints
-----------------------------------------------
INSERT INTO District_GreatPersonPoints
		(DistrictType,				GreatPersonClassType,		PointsPerTurn)
SELECT 	'DISTRICT_CVS_HUNTINGPARK',	GreatPersonClassType,		PointsPerTurn
FROM District_GreatPersonPoints WHERE DistrictType = 'DISTRICT_ENTERTAINMENT_COMPLEX';
-----------------------------------------------
-- District_TradeRouteYields
-----------------------------------------------
INSERT INTO District_TradeRouteYields
		(DistrictType,				YieldType,	YieldChangeAsOrigin,	YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination)
SELECT 	'DISTRICT_CVS_HUNTINGPARK',	YieldType,	YieldChangeAsOrigin,	YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination
FROM District_TradeRouteYields WHERE DistrictType = 'DISTRICT_THEATER';
-----------------------------------------------
-- District_CitizenYieldChanges
-----------------------------------------------
INSERT INTO District_CitizenYieldChanges
		(DistrictType,							YieldType,					YieldChange)
VALUES	('DISTRICT_CVS_HUNTINGPARK',			'YIELD_CULTURE',			2);
-----------------------------------------------
-- District_ValidTerrains
-----------------------------------------------
INSERT INTO District_ValidTerrains
		(DistrictType,							TerrainType)
VALUES	('DISTRICT_CVS_HUNTINGPARK',			'TERRAIN_GRASS_HILLS'),
		('DISTRICT_CVS_HUNTINGPARK',			'TERRAIN_TUNDRA_HILLS'),
		('DISTRICT_CVS_HUNTINGPARK',			'TERRAIN_SNOW_HILLS'),
		('DISTRICT_CVS_HUNTINGPARK',			'TERRAIN_DESERT_HILLS'),
		('DISTRICT_CVS_HUNTINGPARK',			'TERRAIN_PLAINS_HILLS'),
		('DISTRICT_CVS_HUNTINGPARK',			'TERRAIN_GRASS'),
		('DISTRICT_CVS_HUNTINGPARK',			'TERRAIN_TUNDRA'),
		('DISTRICT_CVS_HUNTINGPARK',			'TERRAIN_PLAINS'),
		('DISTRICT_CVS_HUNTINGPARK',			'TERRAIN_SNOW'),
		('DISTRICT_CVS_HUNTINGPARK',			'TERRAIN_DESERT');
-----------------------------------------------
-- District_Adjacencies
-----------------------------------------------
INSERT INTO District_Adjacencies -- Features
		(DistrictType,					YieldChangeId)
SELECT	'DISTRICT_CVS_HUNTINGPARK',		'CVS_HUNTINGPARK_MINOR_FROM_'||FeatureType
FROM Features WHERE NaturalWonder = 0;

INSERT INTO District_Adjacencies -- Natural Wonders, Districts
		(DistrictType,					YieldChangeId)
VALUES	('DISTRICT_CVS_HUNTINGPARK',	'CVS_HUNTINGPARK_MAJOR_FROM_WONDER'),
		('DISTRICT_CVS_HUNTINGPARK',	'District_Culture');
-----------------------------------------------
-- AdjacencyYieldChanges
-----------------------------------------------
INSERT INTO Adjacency_YieldChanges -- Features
		(ID,										Description,								YieldType,			YieldChange,		TilesRequired,		AdjacentFeature)
SELECT	'CVS_HUNTINGPARK_MINOR_FROM_'||FeatureType,	'LOC_CVS_HUNTINGPARK_ADJ_'||FeatureType,	'YIELD_CULTURE',	1,					2,					FeatureType
FROM Features WHERE NaturalWonder = 0;

INSERT INTO Adjacency_YieldChanges -- Natural Wonders
		(ID,										Description,								YieldType,			YieldChange,		TilesRequired,		AdjacentNaturalWonder)
VALUES	('CVS_HUNTINGPARK_MAJOR_FROM_WONDER',		'LOC_CVS_HUNTINGPARK_ADJ_NATURALWONDER',	'YIELD_CULTURE',	1,					1,					1);
-----------------------------------------------
-- DistrictModifiers
-----------------------------------------------
-- Feature Ability
INSERT INTO DistrictModifiers
		(DistrictType,						ModifierId)
SELECT	'DISTRICT_CVS_HUNTINGPARK',			'CVS_HUNTINGPARK_ADJUST_DISTRICT_CAMP_FROM_'||FeatureType
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO DistrictModifiers
		(DistrictType,						ModifierId)
SELECT	'DISTRICT_CVS_HUNTINGPARK',			'CVS_HUNTINGPARK_ADJUST_DISTRICT_HOLY_FROM_'||FeatureType
FROM Features WHERE	NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO DistrictModifiers
		(DistrictType,						ModifierId)
SELECT	'DISTRICT_CVS_HUNTINGPARK',			'CVS_HUNTINGPARK_ADJUST_DISTRICT_COMM_FROM_'||FeatureType
FROM Features WHERE	NaturalWonder = 0;

INSERT INTO DistrictModifiers
		(DistrictType,						ModifierId)
SELECT	'DISTRICT_CVS_HUNTINGPARK',			'CVS_HUNTINGPARK_ADJUST_DISTRICT_INDU_FROM_'||FeatureType
FROM Features WHERE	NaturalWonder = 0;

INSERT INTO DistrictModifiers
		(DistrictType,						ModifierId)
SELECT	'DISTRICT_CVS_HUNTINGPARK',			'CVS_HUNTINGPARK_ADJUST_DISTRICT_THEA_FROM_'||FeatureType
FROM Features WHERE	NaturalWonder = 0;

INSERT INTO DistrictModifiers
		(DistrictType,						ModifierId)
SELECT	'DISTRICT_CVS_HUNTINGPARK',			'CVS_HUNTINGPARK_ADJUST_DISTRICT_HARB_FROM_'||FeatureType
FROM Features WHERE	NaturalWonder = 0;
-----------------------------------------------
-- Modifiers
-----------------------------------------------
-- Feature Ability
INSERT INTO Modifiers
		(ModifierId,														ModifierType,								RunOnce,	Permanent,		SubjectRequirementSetId)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_CAMP_FROM_'||FeatureType,			'DYNMOD_CVS_HUNTINGPARK_FEATURES',			1,			1,				'CVS_UD_CAMP_REQUIRES_'||FeatureType
FROM Features WHERE	NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO Modifiers
		(ModifierId,														ModifierType,								RunOnce,	Permanent,		SubjectRequirementSetId)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HOLY_FROM_'||FeatureType,			'DYNMOD_CVS_HUNTINGPARK_FEATURES',			1,			1,				'CVS_UD_HOLY_REQUIRES_'||FeatureType
FROM Features WHERE	NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO Modifiers
		(ModifierId,														ModifierType,								RunOnce,	Permanent,		SubjectRequirementSetId)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_COMM_FROM_'||FeatureType,			'DYNMOD_CVS_HUNTINGPARK_FEATURES',			1,			1,				'CVS_UD_REQUIRES_'||FeatureType
FROM Features WHERE	NaturalWonder = 0;

INSERT INTO Modifiers
		(ModifierId,														ModifierType,								RunOnce,	Permanent,		SubjectRequirementSetId)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_INDU_FROM_'||FeatureType,			'DYNMOD_CVS_HUNTINGPARK_FEATURES',			1,			1,				'CVS_UD_REQUIRES_'||FeatureType
FROM Features WHERE	NaturalWonder = 0;

INSERT INTO Modifiers
		(ModifierId,														ModifierType,								RunOnce,	Permanent,		SubjectRequirementSetId)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_THEA_FROM_'||FeatureType,			'DYNMOD_CVS_HUNTINGPARK_FEATURES',			1,			1,				'CVS_UD_REQUIRES_'||FeatureType
FROM Features WHERE	NaturalWonder = 0;

INSERT INTO Modifiers
		(ModifierId,														ModifierType,								RunOnce,	Permanent,		SubjectRequirementSetId)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HARB_FROM_'||FeatureType,			'DYNMOD_CVS_HUNTINGPARK_FEATURES',			1,			1,				'CVS_UD_REQUIRES_'||FeatureType
FROM Features WHERE	NaturalWonder = 0;
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
-- Feature Ability
-- Campus
INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_CAMP_FROM_'||FeatureType,			'DistrictType',			'DISTRICT_CAMPUS'
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_CAMP_FROM_'||FeatureType,			'FeatureType',			FeatureType
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_CAMP_FROM_'||FeatureType,			'YieldType',			'YIELD_SCIENCE'
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_CAMP_FROM_'||FeatureType,			'Amount',				1
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_CAMP_FROM_'||FeatureType,			'TilesRequired',		2
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_CAMP_FROM_'||FeatureType,			'Description',			'LOC_CVS_HUNTINGPARK_SCIENCE_GRANTED_FROM_'||FeatureType
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

-- Holy Site
INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HOLY_FROM_'||FeatureType,			'DistrictType',			'DISTRICT_HOLY_SITE'
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HOLY_FROM_'||FeatureType,			'FeatureType',			FeatureType
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HOLY_FROM_'||FeatureType,			'YieldType',			'YIELD_FAITH'
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HOLY_FROM_'||FeatureType,			'Amount',				1
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HOLY_FROM_'||FeatureType,			'TilesRequired',		2
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HOLY_FROM_'||FeatureType,			'Description',			'LOC_CVS_HUNTINGPARK_FAITH_GRANTED_FROM_'||FeatureType
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

-- Commercial Hub
INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_COMM_FROM_'||FeatureType,			'DistrictType',			'DISTRICT_COMMERCIAL_HUB'
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_COMM_FROM_'||FeatureType,			'FeatureType',			FeatureType
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_COMM_FROM_'||FeatureType,			'YieldType',			'YIELD_GOLD'
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_COMM_FROM_'||FeatureType,			'Amount',				1
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_COMM_FROM_'||FeatureType,			'TilesRequired',		2
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_COMM_FROM_'||FeatureType,			'Description',			'LOC_CVS_HUNTINGPARK_GOLD_GRANTED_FROM_'||FeatureType
FROM Features WHERE NaturalWonder = 0;

-- Industrial Zone
INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_INDU_FROM_'||FeatureType,			'DistrictType',			'DISTRICT_INDUSTRIAL_ZONE'
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_INDU_FROM_'||FeatureType,			'FeatureType',			FeatureType
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_INDU_FROM_'||FeatureType,			'YieldType',			'YIELD_PRODUCTION'
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_INDU_FROM_'||FeatureType,			'Amount',				1
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_INDU_FROM_'||FeatureType,			'TilesRequired',		2
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_INDU_FROM_'||FeatureType,			'Description',			'LOC_CVS_HUNTINGPARK_PRODUCTION_GRANTED_FROM_'||FeatureType
FROM Features WHERE NaturalWonder = 0;

-- Theater Square
INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_THEA_FROM_'||FeatureType,			'DistrictType',			'DISTRICT_THEATER'
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_THEA_FROM_'||FeatureType,			'FeatureType',			FeatureType
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_THEA_FROM_'||FeatureType,			'YieldType',			'YIELD_CULTURE'
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_THEA_FROM_'||FeatureType,			'Amount',				1
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_THEA_FROM_'||FeatureType,			'TilesRequired',		2
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_THEA_FROM_'||FeatureType,			'Description',			'LOC_CVS_HUNTINGPARK_CULTURE_GRANTED_FROM_'||FeatureType
FROM Features WHERE NaturalWonder = 0;

-- Harbor
INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HARB_FROM_'||FeatureType,			'DistrictType',			'DISTRICT_HARBOR'
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HARB_FROM_'||FeatureType,			'FeatureType',			FeatureType
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HARB_FROM_'||FeatureType,			'YieldType',			'YIELD_GOLD'
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HARB_FROM_'||FeatureType,			'Amount',				1
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HARB_FROM_'||FeatureType,			'TilesRequired',		2
FROM Features WHERE NaturalWonder = 0;

INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
SELECT	'CVS_HUNTINGPARK_ADJUST_DISTRICT_HARB_FROM_'||FeatureType,			'Description',			'LOC_CVS_HUNTINGPARK_GOLD_GRANTED_FROM_'||FeatureType
FROM Features WHERE NaturalWonder = 0;
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,							RequirementSetType)
SELECT	'CVS_UD_CAMP_REQUIRES_'||FeatureType,		'REQUIREMENTSET_TEST_ALL'
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO RequirementSets
		(RequirementSetId,							RequirementSetType)
SELECT	'CVS_UD_HOLY_REQUIRES_'||FeatureType,		'REQUIREMENTSET_TEST_ALL'
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO RequirementSets
		(RequirementSetId,							RequirementSetType)
SELECT	'CVS_UD_REQUIRES_'||FeatureType,			'REQUIREMENTSET_TEST_ALL'
FROM Features WHERE NaturalWonder = 0;
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
SELECT	'CVS_UD_CAMP_REQUIRES_'||FeatureType,		'CVS_UD_CAMP_CHECK_ADJ_'||FeatureType
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
SELECT	'CVS_UD_CAMP_REQUIRES_'||FeatureType,		'CVS_CHECK_FOR_CITY_HUNTINGPARK'
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
SELECT	'CVS_UD_HOLY_REQUIRES_'||FeatureType,		'CVS_UD_HOLY_CHECK_ADJ_'||FeatureType
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
SELECT	'CVS_UD_HOLY_REQUIRES_'||FeatureType,		'CVS_CHECK_FOR_CITY_HUNTINGPARK'
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
SELECT	'CVS_UD_REQUIRES_'||FeatureType,			'CVS_UD_CHECK_ADJ_'||FeatureType
FROM Features WHERE NaturalWonder = 0;

INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
SELECT	'CVS_UD_REQUIRES_'||FeatureType,			'CVS_CHECK_FOR_CITY_HUNTINGPARK'
FROM Features WHERE NaturalWonder = 0;
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,								RequirementType,									Inverse)
VALUES	('CVS_CHECK_FOR_CITY_HUNTINGPARK',			'REQUIREMENT_CITY_HAS_DISTRICT',					0);

INSERT INTO Requirements
		(RequirementId,								RequirementType,									Inverse)
SELECT	'CVS_UD_CAMP_CHECK_ADJ_'||FeatureType,		'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES',	0
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO Requirements
		(RequirementId,								RequirementType,									Inverse)
SELECT	'CVS_UD_HOLY_CHECK_ADJ_'||FeatureType,		'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES',	0
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO Requirements
		(RequirementId,								RequirementType,									Inverse)
SELECT	'CVS_UD_CHECK_ADJ_'||FeatureType,			'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES',	0
FROM Features WHERE NaturalWonder = 0;
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,								Name,					Value)
VALUES	('CVS_CHECK_FOR_CITY_HUNTINGPARK',			'DistrictType',			'DISTRICT_CVS_HUNTINGPARK');

INSERT INTO RequirementArguments
		(RequirementId,								Name,					Value)
SELECT	'CVS_UD_CAMP_CHECK_ADJ_'||FeatureType,		'FeatureType',			FeatureType
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO RequirementArguments
		(RequirementId,								Name,					Value)
SELECT	'CVS_UD_CAMP_CHECK_ADJ_'||FeatureType,		'MinRange',				1
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO RequirementArguments
		(RequirementId,								Name,					Value)
SELECT	'CVS_UD_CAMP_CHECK_ADJ_'||FeatureType,		'MaxRange',				1
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_JUNGLE';

INSERT INTO RequirementArguments
		(RequirementId,								Name,					Value)
SELECT	'CVS_UD_HOLY_CHECK_ADJ_'||FeatureType,		'FeatureType',			FeatureType
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO RequirementArguments
		(RequirementId,								Name,					Value)
SELECT	'CVS_UD_HOLY_CHECK_ADJ_'||FeatureType,		'MinRange',				1
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO RequirementArguments
		(RequirementId,								Name,					Value)
SELECT	'CVS_UD_HOLY_CHECK_ADJ_'||FeatureType,		'MaxRange',				1
FROM Features WHERE NaturalWonder = 0 AND FeatureType != 'FEATURE_FOREST';

INSERT INTO RequirementArguments
		(RequirementId,								Name,					Value)
SELECT	'CVS_UD_CHECK_ADJ_'||FeatureType,			'FeatureType',			FeatureType
FROM Features WHERE NaturalWonder = 0;

INSERT INTO RequirementArguments
		(RequirementId,								Name,					Value)
SELECT	'CVS_UD_CHECK_ADJ_'||FeatureType,			'MinRange',				1
FROM Features WHERE NaturalWonder = 0;

INSERT INTO RequirementArguments
		(RequirementId,								Name,					Value)
SELECT	'CVS_UD_CHECK_ADJ_'||FeatureType,			'MaxRange',				1
FROM Features WHERE NaturalWonder = 0;