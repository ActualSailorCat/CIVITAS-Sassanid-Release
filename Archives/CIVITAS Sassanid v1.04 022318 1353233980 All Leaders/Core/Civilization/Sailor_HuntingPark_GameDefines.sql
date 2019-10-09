--==========================================================================================================================
-- Sasanian / Wiškar (District)
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
		MilitaryDomain,
		TravelTime,
		CityStrengthModifier,
		Appeal,
		Housing,
		OnePerCity
		)
SELECT	'DISTRICT_SAILOR_HUNTINGPARK', -- DistrictType
		'LOC_DISTRICT_SAILOR_HUNTINGPARK_NAME', -- Name
		'LOC_DISTRICT_SAILOR_HUNTINGPARK_DESCRIPTION', -- Description
		'TRAIT_CIVILIZATION_DISTRICT_SAILOR_HUNTINGPARK', -- TraitType
		0, -- Entertainment
		Cost/2, -- Cost
		Maintenance,
		'CIVIC_MILITARY_TRADITION', -- PrereqCivic
		Aqueduct,
		PlunderType,
		PlunderAmount,
		AdvisorType,
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
		'DOMAIN_LAND', -- MilitaryDomain
		TravelTime,
		CityStrengthModifier,
		2, -- Appeal
		0, -- Housing
		1  -- OnePerCity
FROM Districts
WHERE DistrictType = 'DISTRICT_NEIGHBORHOOD';
-----------------------------------------------
-- District_GreatPersonPoints
-----------------------------------------------
INSERT INTO District_GreatPersonPoints
		(DistrictType,				GreatPersonClassType,		PointsPerTurn)
SELECT 	'DISTRICT_SAILOR_HUNTINGPARK',	GreatPersonClassType,		PointsPerTurn
FROM District_GreatPersonPoints WHERE DistrictType = 'DISTRICT_ENTERTAINMENT_COMPLEX';
-----------------------------------------------
-- District_TradeRouteYields
-----------------------------------------------
INSERT INTO District_TradeRouteYields
		(DistrictType,				YieldType,	YieldChangeAsOrigin,	YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination)
SELECT 	'DISTRICT_SAILOR_HUNTINGPARK',	YieldType,	YieldChangeAsOrigin,	YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination
FROM District_TradeRouteYields WHERE DistrictType = 'DISTRICT_THEATER';
-----------------------------------------------
-- District_CitizenYieldChanges
-----------------------------------------------
INSERT INTO District_CitizenYieldChanges
		(DistrictType,							YieldType,					YieldChange)
VALUES	('DISTRICT_SAILOR_HUNTINGPARK',			'YIELD_CULTURE',			2);
-----------------------------------------------
-- District_ValidTerrains
-----------------------------------------------
INSERT INTO District_ValidTerrains
		(DistrictType,							TerrainType)
VALUES	('DISTRICT_SAILOR_HUNTINGPARK',			'TERRAIN_GRASS_HILLS'),
		('DISTRICT_SAILOR_HUNTINGPARK',			'TERRAIN_TUNDRA_HILLS'),
		('DISTRICT_SAILOR_HUNTINGPARK',			'TERRAIN_SNOW_HILLS'),
		('DISTRICT_SAILOR_HUNTINGPARK',			'TERRAIN_DESERT_HILLS'),
		('DISTRICT_SAILOR_HUNTINGPARK',			'TERRAIN_PLAINS_HILLS'),
		('DISTRICT_SAILOR_HUNTINGPARK',			'TERRAIN_GRASS'),
		('DISTRICT_SAILOR_HUNTINGPARK',			'TERRAIN_TUNDRA'),
		('DISTRICT_SAILOR_HUNTINGPARK',			'TERRAIN_PLAINS'),
		('DISTRICT_SAILOR_HUNTINGPARK',			'TERRAIN_SNOW'),
		('DISTRICT_SAILOR_HUNTINGPARK',			'TERRAIN_DESERT');
-----------------------------------------------
-- District_Adjacencies
-----------------------------------------------
INSERT INTO District_Adjacencies -- Forest, Oasis, Natural Wonder, District
		(DistrictType,					YieldChangeId)
VALUES 	('DISTRICT_SAILOR_HUNTINGPARK',	'SAILOR_HUNTINGPARK_MINOR_FROM_FOREST'),
		('DISTRICT_SAILOR_HUNTINGPARK',	'SAILOR_HUNTINGPARK_MAJOR_FROM_OASIS'),
		('DISTRICT_SAILOR_HUNTINGPARK',	'SAILOR_HUNTINGPARK_NATURALWONDER'),
		('DISTRICT_SAILOR_HUNTINGPARK',	'District_Culture');
-----------------------------------------------
-- AdjacencyYieldChanges
-----------------------------------------------
INSERT INTO Adjacency_YieldChanges -- Forest, Oasis
		(ID,										Description,								YieldType,			YieldChange,		TilesRequired,		AdjacentFeature)
VALUES	('SAILOR_HUNTINGPARK_MINOR_FROM_FOREST',	'LOC_SAILOR_HUNTINGPARK_ADJ_FOREST',		'YIELD_CULTURE',	1,					2,					'FEATURE_FOREST'),
		('SAILOR_HUNTINGPARK_MAJOR_FROM_OASIS',		'LOC_SAILOR_HUNTINGPARK_ADJ_OASIS',			'YIELD_CULTURE',	1,					1,					'FEATURE_OASIS');

INSERT INTO Adjacency_YieldChanges -- Natural Wonder
		(ID,										Description,									YieldType,			YieldChange,		TilesRequired,		AdjacentNaturalWonder)
VALUES	('SAILOR_HUNTINGPARK_NATURALWONDER',		'LOC_SAILOR_HUNTINGPARK_ADJ_NATURALWONDER',		'YIELD_CULTURE',	2,					1,					1);
-----------------------------------------------
-- DistrictModifiers
-----------------------------------------------
INSERT INTO DistrictModifiers
		(DistrictType,						ModifierId)
VALUES	('DISTRICT_SAILOR_HUNTINGPARK',		'SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_AVERAGE'),
		('DISTRICT_SAILOR_HUNTINGPARK',		'SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_CHARMING'),
		('DISTRICT_SAILOR_HUNTINGPARK',		'SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_BREATHTAKING');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,														ModifierType,								RunOnce,	Permanent,		SubjectRequirementSetId)
VALUES	('SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_AVERAGE',					'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',		0,			0,				'SAILOR_REQUIRES_APPEAL_AVERAGE'),
		('SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_AVERAGE_MODIFIER',			'DYNMOD_SAILOR_HUNTINGPARK_AMENITY',		0,			0,				null),
		('SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_CHARMING',					'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',		0,			0,				'SAILOR_REQUIRES_APPEAL_CHARMING'),
		('SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_CHARMING_MODIFIER',		'DYNMOD_SAILOR_HUNTINGPARK_AMENITY',		0,			0,				null),
		('SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_BREATHTAKING',				'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',		0,			0,				'SAILOR_REQUIRES_APPEAL_BREATHTAKING'),
		('SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_BREATHTAKING_MODIFIER',	'DYNMOD_SAILOR_HUNTINGPARK_AMENITY',		0,			0,				null);
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,														Name,					Value)
VALUES	('SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_AVERAGE',					'ModifierId',			'SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_AVERAGE_MODIFIER'),
		('SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_AVERAGE_MODIFIER',			'Amount',				1),
		('SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_CHARMING',					'ModifierId',			'SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_CHARMING_MODIFIER'),
		('SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_CHARMING_MODIFIER',		'Amount',				2),
		('SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_BREATHTAKING',				'ModifierId',			'SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_BREATHTAKING_MODIFIER'),
		('SAILOR_HUNTINGPARK_AMENITY_FROM_APPEAL_BREATHTAKING_MODIFIER',	'Amount',				3);
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,							RequirementSetType)
VALUES	('SAILOR_REQUIRES_APPEAL_AVERAGE',			'REQUIREMENTSET_TEST_ALL'),
		('SAILOR_REQUIRES_APPEAL_CHARMING',			'REQUIREMENTSET_TEST_ALL'),
		('SAILOR_REQUIRES_APPEAL_BREATHTAKING',		'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
VALUES	('SAILOR_REQUIRES_APPEAL_AVERAGE',			'SAILOR_APPEAL_IS_AVERAGE'),
		('SAILOR_REQUIRES_APPEAL_AVERAGE',			'SAILOR_APPEAL_NOT_CHARMING'),
		('SAILOR_REQUIRES_APPEAL_AVERAGE',			'SAILOR_CHECK_FOR_CITY_HUNTINGPARK'),
		('SAILOR_REQUIRES_APPEAL_CHARMING',			'SAILOR_APPEAL_IS_CHARMING'),
		('SAILOR_REQUIRES_APPEAL_CHARMING',			'SAILOR_APPEAL_NOT_BREATHTAKING'),
		('SAILOR_REQUIRES_APPEAL_CHARMING',			'SAILOR_CHECK_FOR_CITY_HUNTINGPARK'),
		('SAILOR_REQUIRES_APPEAL_BREATHTAKING',		'SAILOR_APPEAL_IS_BREATHTAKING'),
		('SAILOR_REQUIRES_APPEAL_BREATHTAKING',		'SAILOR_CHECK_FOR_CITY_HUNTINGPARK');
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,								RequirementType,						Inverse)
VALUES	('SAILOR_APPEAL_IS_AVERAGE',				'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',	0),
		('SAILOR_APPEAL_IS_CHARMING',				'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',	0),
		('SAILOR_APPEAL_IS_BREATHTAKING',			'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',	0),
		('SAILOR_APPEAL_NOT_CHARMING',				'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',	1),
		('SAILOR_APPEAL_NOT_BREATHTAKING',			'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',	1),
		('SAILOR_CHECK_FOR_CITY_HUNTINGPARK',		'REQUIREMENT_CITY_HAS_DISTRICT',		0);
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,								Name,					Value)
VALUES	('SAILOR_APPEAL_IS_AVERAGE',				'MinimumAppeal',		-1),
		('SAILOR_APPEAL_IS_CHARMING',				'MinimumAppeal',		2),
		('SAILOR_APPEAL_IS_BREATHTAKING',			'MinimumAppeal',		4),
		('SAILOR_APPEAL_NOT_CHARMING',				'MinimumAppeal',		2),
		('SAILOR_APPEAL_NOT_BREATHTAKING',			'MinimumAppeal',		4),
		('SAILOR_CHECK_FOR_CITY_HUNTINGPARK',		'DistrictType',			'DISTRICT_SAILOR_HUNTINGPARK');