--==========================================================================================================================
--
--            .
--            |\
--            | \
--            |  \
--            |   \
--            |    \          Sassanid Civilization by CIVITAS
--            |     \
--            |      \
--            |       \       ____O
--            |        \     .' ./
--            |   _.,-~"\  .',/~'
--            <-~"   _.,-~" ~ |
--^"~-,._.,-~"^"~-,._\       /,._.,-~"^"~-,._.,-~"^"~-,._
--~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._
--^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._
--~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._
--==========================================================================================================================
-- Sassanid / Defines
--==========================================================================================================================
-----------------------------------------------
-- Types
-----------------------------------------------
INSERT INTO Types	
		(Type,									Kind)
VALUES	('CIVILIZATION_CVS_SASANIAN',		'KIND_CIVILIZATION');
-----------------------------------------------
-- Civilizations
-----------------------------------------------	
INSERT INTO Civilizations	(
		CivilizationType,
		Name,
		Description,
		Adjective,
		StartingCivilizationLevelType,
		RandomCityNameDepth,
		Ethnicity
		)
VALUES	(
		'CIVILIZATION_CVS_SASANIAN', -- CivilizationType
		'LOC_CIVILIZATION_CVS_SASANIAN_NAME', -- Name
		'LOC_CIVILIZATION_CVS_SASANIAN_DESCRIPTION', -- Description
		'LOC_CIVILIZATION_CVS_SASANIAN_ADJECTIVE', -- Adjective
		'CIVILIZATION_LEVEL_FULL_CIV', -- StartingCivilizationLevelType
		22, -- RandomCityNameDepth
		'ETHNICITY_MEDIT' -- Ethnicity
		);	
-----------------------------------------------			
-- CityNames			
-----------------------------------------------		
INSERT INTO CityNames	
		(CivilizationType,				CityName)	
VALUES	('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_GUNDESHAPUR'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_ARBELA'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_GOR'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_ISFAHAN'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_NISHAPUR'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_MERV'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_DERBENT'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_GANZAK'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_NUSAYBIN'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_KIRKUK'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_RASHT'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_ZRANG'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_VAHMAN_ARDASHIR'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_GURGAN'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_SHIRAGAN'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_HERAT'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_AMOL'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_DVIN'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_PARTAV'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_TBILISI'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_SHUSHTAR'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_ISTAKHR'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_SIRAF'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_DARABGERD'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_BUSHEHR'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_BISHAPUR'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_ARTEMITA'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_PEROZ_SHAPUR'),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_REV_ARDASHIR'),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_QESHM'),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_KAPUL'),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_SURA'),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_ERAN_ASAN_KAR_KAWAD'),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITY_NAME_SC_WEH_AZ_AMID_KAWAD');
-----------------------------------------------
-- CivilizationCitizenNames
-----------------------------------------------	
INSERT INTO CivilizationCitizenNames	
		(CivilizationType,				CitizenName,									Female,		Modern)
VALUES	('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MALE_1',				0,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MALE_2',				0,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MALE_3',				0,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MALE_4',				0,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MALE_5',				0,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MALE_6',				0,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MALE_7',				0,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MALE_8',				0,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MALE_9',				0,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MALE_10',				0,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_FEMALE_1',			1,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_FEMALE_2',			1,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_FEMALE_3',			1,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_FEMALE_4',			1,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_FEMALE_5',			1,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_FEMALE_6',			1,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_FEMALE_7',			1,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_FEMALE_8',			1,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_FEMALE_9',			1,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_FEMALE_10',			1,			0),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_MALE_1',		0,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_MALE_2',		0,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_MALE_3',		0,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_MALE_4',		0,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_MALE_5',		0,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_MALE_6',		0,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_MALE_7',		0,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_MALE_8',		0,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_MALE_9',		0,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_MALE_10',		0,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_FEMALE_1',		1,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_FEMALE_2',		1,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_FEMALE_3',		1,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_FEMALE_4',		1,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_FEMALE_5',		1,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_FEMALE_6',		1,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_FEMALE_7',		1,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_FEMALE_8',		1,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_FEMALE_9',		1,			1),
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CITIZEN_CVS_SASANIAN_MODERN_FEMALE_10',	1,			1);	
-----------------------------------------------			
-- CivilizationInfo			
-----------------------------------------------		
INSERT INTO CivilizationInfo	
		(CivilizationType,				Header,						Caption,									SortIndex)	
VALUES	('CIVILIZATION_CVS_SASANIAN',	'LOC_CIVINFO_LOCATION',		'LOC_CIVINFO_CVS_SASANIAN_LOCATION',		10),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CIVINFO_SIZE',			'LOC_CIVINFO_CVS_SASANIAN_SIZE',			20),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CIVINFO_POPULATION',	'LOC_CIVINFO_CVS_SASANIAN_POPULATION',		30),	
		('CIVILIZATION_CVS_SASANIAN',	'LOC_CIVINFO_CAPITAL', 		'LOC_CIVINFO_CVS_SASANIAN_CAPITAL',			40);
-----------------------------------------------			
-- StartBias
-----------------------------------------------	
INSERT INTO StartBiasRivers	(CivilizationType, Tier) VALUES	('CIVILIZATION_CVS_SASANIAN', 1);

INSERT INTO StartBiasTerrains (CivilizationType, TerrainType, Tier) VALUES ('CIVILIZATION_CVS_SASANIAN', 'TERRAIN_DESERT', 1);

INSERT INTO StartBiasResources
		(CivilizationType, ResourceType, Tier)
VALUES	('CIVILIZATION_CVS_SASANIAN', 'RESOURCE_HORSES', 2),
		('CIVILIZATION_CVS_SASANIAN', 'RESOURCE_CITRUS', 2),
		('CIVILIZATION_CVS_SASANIAN', 'RESOURCE_WINE',	 2);
-----------------------------------------------			
-- StartBias Mods
-----------------------------------------------	
-- CIVITAS Resources Expanded
INSERT INTO StartBiasResources
		(CivilizationType,				ResourceType,					Tier)
SELECT	'CIVILIZATION_CVS_SASANIAN',	'RESOURCE_CVS_POMEGRANATES',	2
WHERE EXISTS (SELECT Type FROM Types WHERE Type = 'RESOURCE_CVS_POMEGRANATES');

-- Resourceful
INSERT INTO StartBiasResources
		(CivilizationType,				ResourceType,					Tier)
SELECT	'CIVILIZATION_CVS_SASANIAN',	'RESOURCE_CAVIAR',				3
WHERE EXISTS (SELECT Type FROM Types WHERE Type = 'RESOURCE_CAVIAR');

INSERT INTO StartBiasResources
		(CivilizationType,				ResourceType,					Tier)
SELECT	'CIVILIZATION_CVS_SASANIAN',	'RESOURCE_POPPIES',				2
WHERE EXISTS (SELECT Type FROM Types WHERE Type = 'RESOURCE_POPPIES');

INSERT INTO StartBiasResources
		(CivilizationType,				ResourceType,					Tier)
SELECT	'CIVILIZATION_CVS_SASANIAN',	'RESOURCE_DATES',				2
WHERE EXISTS (SELECT Type FROM Types WHERE Type = 'RESOURCE_DATES');

INSERT INTO StartBiasResources
		(CivilizationType,				ResourceType,					Tier)
SELECT	'CIVILIZATION_CVS_SASANIAN',	'RESOURCE_SAFFRON',				2
WHERE EXISTS (SELECT Type FROM Types WHERE Type = 'RESOURCE_SAFFRON');
