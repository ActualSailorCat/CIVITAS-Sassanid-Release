--==========================================================================================================================
--
--            .
--            |\
--            | \
--            |  \
--            |   \
--            |    \          Sassanid Empire by CIVITAS
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
-- Sassanid / Traits
--==========================================================================================================================
INSERT INTO Types
		(Type,											Kind)
VALUES	('UNIT_CVS_ASWAR',								'KIND_UNIT'),
		('DISTRICT_CVS_HUNTINGPARK',					'KIND_DISTRICT'),
		('TRAIT_CIVILIZATION_UNIT_CVS_ASWAR',			'KIND_TRAIT'),
		('TRAIT_CIVILIZATION_DISTRICT_CVS_HUNTINGPARK',	'KIND_TRAIT');

INSERT INTO Types
		(Type,											Kind)
VALUES	('TRAIT_CIVILIZATION_CVS_SASANIAN_UA',			'KIND_TRAIT');
-----------------------------------------------			
-- CivilizationTraits			
-----------------------------------------------				
INSERT INTO CivilizationTraits
		(CivilizationType,								TraitType)
VALUES	('CIVILIZATION_CVS_SASANIAN',					'TRAIT_CIVILIZATION_UNIT_CVS_ASWAR'),
		('CIVILIZATION_CVS_SASANIAN',					'TRAIT_CIVILIZATION_DISTRICT_CVS_HUNTINGPARK');

INSERT INTO CivilizationTraits
		(CivilizationType,								TraitType)
VALUES	('CIVILIZATION_CVS_SASANIAN',					'TRAIT_CIVILIZATION_CVS_SASANIAN_UA');
-----------------------------------------------			
-- Traits			
-----------------------------------------------				
INSERT INTO Traits				
		(TraitType,										Name,														Description)
VALUES	('TRAIT_CIVILIZATION_UNIT_CVS_ASWAR',			'LOC_TRAIT_CIVILIZATION_UNIT_CVS_ASWAR_NAME',				'LOC_TRAIT_CIVILIZATION_UNIT_CVS_ASWAR_DESCRIPTION'),
		('TRAIT_CIVILIZATION_DISTRICT_CVS_HUNTINGPARK',	'LOC_TRAIT_CIVILIZATION_DISTRICT_CVS_HUNTINGPARK_NAME',		'LOC_TRAIT_CIVILIZATION_DISTRICT_CVS_HUNTINGPARK_DESCRIPTION');

INSERT INTO Traits				
		(TraitType,										Name,														Description)
VALUES	('TRAIT_CIVILIZATION_CVS_SASANIAN_UA',			'LOC_TRAIT_CIVILIZATION_CVS_SASANIAN_UA_NAME',				'LOC_TRAIT_CIVILIZATION_CVS_SASANIAN_UA_DESCRIPTION');
-----------------------------------------------		
-- TraitModifiers		
-----------------------------------------------
CREATE TABLE IF NOT EXISTS 
Sassanid_UA (GreatPersonClassType text default null);

INSERT INTO Sassanid_UA
		(GreatPersonClassType)
VALUES	('GREAT_PERSON_CLASS_ARTIST'),
		('GREAT_PERSON_CLASS_WRITER'),
		('GREAT_PERSON_CLASS_MUSICIAN');	

INSERT INTO TraitModifiers
		(TraitType,									ModifierId)
SELECT	'TRAIT_CIVILIZATION_CVS_SASANIAN_UA',		'CVS_SASANIAN_UA_PALACE_PRODUCTION'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- BuildingModifiers	
-----------------------------------------------
INSERT INTO BuildingModifiers
		(BuildingType,							ModifierId)
SELECT	'BUILDING_PALACE',						'CVS_SASANIAN_UA_VANILLA_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO BuildingModifiers
		(BuildingType,							ModifierId)
SELECT	'BUILDING_PALACE',						'CVS_SASANIAN_UA_THEATER_VANILLA_'||GreatPersonClassType
FROM Sassanid_UA WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- Modifiers		
-----------------------------------------------
-- Vanilla
INSERT INTO Modifiers
		(ModifierId,								ModifierType,							SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_PALACE_PRODUCTION',		'DYNMOD_CVS_SASANIAN_CAPITAL_PROD',		null
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,								ModifierType,							OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_VANILLA_'||DistrictType,	'DYNMOD_CVS_SASANIAN_DISTRICT_MOD',		'CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_ADJ_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,									ModifierType,							OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_VANILLA_MOD_'||DistrictType,	'DYNMOD_CVS_SASANIAN_DISTRICT_GPP',		'CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_IS_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,													ModifierType,							OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_THEATER_VANILLA_'||GreatPersonClassType,		'DYNMOD_CVS_SASANIAN_DISTRICT_MOD',		'CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_ADJ_THEATER'
FROM Sassanid_UA WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,													ModifierType,							OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_THEATER_VANILLA_MOD_'||GreatPersonClassType,	'DYNMOD_CVS_SASANIAN_DISTRICT_GPP',		'CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_IS_THEATER'
FROM Sassanid_UA WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,							Name,				Value)
SELECT	'CVS_SASANIAN_UA_PALACE_PRODUCTION',	'StartEra',			'ERA_ANCIENT'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,							Name,				Value)
SELECT	'CVS_SASANIAN_UA_PALACE_PRODUCTION',	'EndEra',			'ERA_INFORMATION'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,							Name,				Value)
SELECT	'CVS_SASANIAN_UA_PALACE_PRODUCTION',	'Amount',			20
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,									Name,					Value)
SELECT	'CVS_SASANIAN_UA_VANILLA_'||DistrictType,		'ModifierId',			'CVS_SASANIAN_UA_VANILLA_MOD_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,									Name,					Value)
SELECT	'CVS_SASANIAN_UA_VANILLA_MOD_'||DistrictType,	'GreatPersonClassType',	GreatPersonClassType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,									Name,					Value)
SELECT	'CVS_SASANIAN_UA_VANILLA_MOD_'||DistrictType,	'Amount',				1
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,													Name,					Value)
SELECT	'CVS_SASANIAN_UA_THEATER_VANILLA_'||GreatPersonClassType,		'ModifierId',			'CVS_SASANIAN_UA_THEATER_VANILLA_MOD_'||GreatPersonClassType
FROM Sassanid_UA WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,													Name,					Value)
SELECT	'CVS_SASANIAN_UA_THEATER_VANILLA_MOD_'||GreatPersonClassType,	'GreatPersonClassType',	GreatPersonClassType
FROM Sassanid_UA WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,													Name,					Value)
SELECT	'CVS_SASANIAN_UA_THEATER_VANILLA_MOD_'||GreatPersonClassType,	'Amount',				1
FROM Sassanid_UA WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
VALUES	('CVS_SASANIAN_UA_REQUIRES_ADJ_THEATER',			'REQUIREMENTSET_TEST_ALL'),
		('CVS_SASANIAN_UA_REQUIRES_IS_THEATER',				'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
VALUES	('CVS_SASANIAN_UA_REQUIRES_LEADER',					'REQUIREMENTSET_TEST_ANY');

INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
SELECT	'CVS_SASANIAN_UA_REQUIRES_ADJ_'||DistrictType,		'REQUIREMENTSET_TEST_ALL'
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
SELECT	'CVS_SASANIAN_UA_REQUIRES_IS_'||DistrictType,		'REQUIREMENTSET_TEST_ALL'
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
VALUES	('CVS_SASANIAN_UA_REQUIRES_ADJ_THEATER',			'CVS_SASANIAN_UA_CHECK_ADJ_THEATER'),
		('CVS_SASANIAN_UA_REQUIRES_IS_THEATER',				'CVS_SASANIAN_UA_CHECK_IS_THEATER'),
		('CVS_SASANIAN_UA_REQUIRES_LEADER',					'CVS_SASANIAN_UA_REQUIRES_BORAN'),
		('CVS_SASANIAN_UA_REQUIRES_LEADER',					'CVS_SASANIAN_UA_REQUIRES_KAWAD_I'),
		('CVS_SASANIAN_UA_REQUIRES_LEADER',					'CVS_SASANIAN_UA_REQUIRES_SHAPUR_I');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
SELECT	'CVS_SASANIAN_UA_REQUIRES_ADJ_'||DistrictType,		'CVS_SASANIAN_UA_ADJ_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
SELECT	'CVS_SASANIAN_UA_REQUIRES_IS_'||DistrictType,		'CVS_SASANIAN_UA_IS_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId, 									RequirementType,									Inverse)
VALUES	('CVS_SASANIAN_UA_CHECK_ADJ_THEATER',				'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0),
		('CVS_SASANIAN_UA_CHECK_IS_THEATER',				'REQUIREMENT_DISTRICT_TYPE_MATCHES',				0),
		('CVS_SASANIAN_UA_REQUIRES_BORAN',					'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',			0),
		('CVS_SASANIAN_UA_REQUIRES_KAWAD_I',				'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',			0),
		('CVS_SASANIAN_UA_REQUIRES_SHAPUR_I',				'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',			0);

INSERT INTO Requirements
		(RequirementId, 									RequirementType,									Inverse)
SELECT	'CVS_SASANIAN_UA_ADJ_'||DistrictType,				'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Requirements
		(RequirementId, 									RequirementType,									Inverse)
SELECT	'CVS_SASANIAN_UA_IS_'||DistrictType,				'REQUIREMENT_DISTRICT_TYPE_MATCHES',				0
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
VALUES	('CVS_SASANIAN_UA_CHECK_ADJ_THEATER',	'DistrictType',		'DISTRICT_THEATER'),
		('CVS_SASANIAN_UA_CHECK_ADJ_THEATER',	'MinRange',			1),
		('CVS_SASANIAN_UA_CHECK_ADJ_THEATER',	'MaxRange',			1),
		('CVS_SASANIAN_UA_CHECK_IS_THEATER',	'DistrictType',		'DISTRICT_THEATER'),
		('CVS_SASANIAN_UA_REQUIRES_BORAN',		'LeaderType',		'LEADER_CVS_BORAN'),
		('CVS_SASANIAN_UA_REQUIRES_KAWAD_I',	'LeaderType',		'LEADER_CVS_KAWAD_I'),
		('CVS_SASANIAN_UA_REQUIRES_SHAPUR_I',	'LeaderType',		'LEADER_CVS_SHAPUR_I');

INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
SELECT	'CVS_SASANIAN_UA_ADJ_'||DistrictType,	'DistrictType',		DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
SELECT	'CVS_SASANIAN_UA_ADJ_'||DistrictType,	'MinRange',			1
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
SELECT	'CVS_SASANIAN_UA_ADJ_'||DistrictType,	'MaxRange',			1
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
SELECT	'CVS_SASANIAN_UA_IS_'||DistrictType,	'DistrictType',		DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

--=============================================
-- Alternative Leader Support
--=============================================
-- Add the following to your leader SQL to
-- ensure support for alternative Sassanid
-- leaders, replacing NAMEHERE with the name
-- of your leader.
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
--INSERT INTO RequirementSetRequirements
--			(RequirementSetId,						RequirementId)
--VALUES	('CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_NAMEHERE');
--
--INSERT INTO Requirements
--			(RequirementId, 						RequirementType)
--VALUES	('CVS_SASANIAN_UA_REQUIRES_NAMEHERE',	'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES');
--
--INSERT INTO RequirementArguments
--			(RequirementId, 						Name,				Value)
--VALUES	('CVS_SASANIAN_UA_REQUIRES_NAMEHERE',	'LeaderType',		'NAMEHERE');