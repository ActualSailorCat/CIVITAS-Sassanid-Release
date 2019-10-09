--==========================================================================================================================
-- Sassanid / Expac Traits
--==========================================================================================================================
-----------------------------------------------		
-- TraitModifiers		
-----------------------------------------------
INSERT INTO TraitModifiers
		(TraitType,									ModifierId)
SELECT	'TRAIT_CIVILIZATION_CVS_SASANIAN_UA',	'CVS_SASANIAN_UA_GOVERNMENT_PRODUCTION'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- DistrictModifiers
-----------------------------------------------
INSERT INTO DistrictModifiers
		(DistrictType,							ModifierId)
SELECT	'DISTRICT_GOVERNMENT',					'CVS_SASANIAN_UA_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO DistrictModifiers
		(DistrictType,							ModifierId)
SELECT	'DISTRICT_GOVERNMENT',					'CVS_SASANIAN_UA_THEATER_'||GreatPersonClassType
FROM Sassanid_UA WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- Modifiers		
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,								ModifierType,							SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_GOVERNMENT_PRODUCTION',	'DYNMOD_CVS_SASANIAN_UNIT_PROD',		'CVS_SASANIAN_UA_CITY_HAS_GOVERNMENT_DISTRICT'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,								ModifierType,							OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_'||DistrictType,			'DYNMOD_CVS_SASANIAN_DISTRICT_MOD',		'CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_ADJ_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,								ModifierType,							OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_MOD_'||DistrictType,		'DYNMOD_CVS_SASANIAN_DISTRICT_GPP',		'CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_IS_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,											ModifierType,							OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_THEATER_'||GreatPersonClassType,		'DYNMOD_CVS_SASANIAN_DISTRICT_MOD',		'CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_ADJ_THEATER'
FROM Sassanid_UA WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,											ModifierType,							OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_THEATER_MOD_'||GreatPersonClassType,	'DYNMOD_CVS_SASANIAN_DISTRICT_GPP',		'CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_IS_THEATER'
FROM Sassanid_UA WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,								Name,				Value)
SELECT	'CVS_SASANIAN_UA_GOVERNMENT_PRODUCTION',	'Amount',			20
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,							Name,					Value)
SELECT	'CVS_SASANIAN_UA_'||DistrictType,		'ModifierId',			'CVS_SASANIAN_UA_MOD_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,							Name,					Value)
SELECT	'CVS_SASANIAN_UA_MOD_'||DistrictType,	'GreatPersonClassType',	GreatPersonClassType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,							Name,					Value)
SELECT	'CVS_SASANIAN_UA_MOD_'||DistrictType,	'Amount',				1
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,											Name,					Value)
SELECT	'CVS_SASANIAN_UA_THEATER_'||GreatPersonClassType,		'ModifierId',			'CVS_SASANIAN_UA_THEATER_MOD_'||GreatPersonClassType
FROM Sassanid_UA WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,											Name,					Value)
SELECT	'CVS_SASANIAN_UA_THEATER_MOD_'||GreatPersonClassType,	'GreatPersonClassType',	GreatPersonClassType
FROM Sassanid_UA WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,											Name,					Value)
SELECT	'CVS_SASANIAN_UA_THEATER_MOD_'||GreatPersonClassType,	'Amount',				1
FROM Sassanid_UA WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
VALUES	('CVS_SASANIAN_UA_REQUIRES_LEADER',					'REQUIREMENTSET_TEST_ANY'),
		('CVS_SASANIAN_UA_REQUIRES_ADJ_THEATER',			'REQUIREMENTSET_TEST_ALL'),
		('CVS_SASANIAN_UA_REQUIRES_IS_THEATER',				'REQUIREMENTSET_TEST_ALL'),
		('CVS_SASANIAN_UA_CITY_HAS_GOVERNMENT_DISTRICT',	'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
SELECT	'CVS_SASANIAN_UA_REQUIRES_ADJ_'||DistrictType,		'REQUIREMENTSET_TEST_ALL'
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
SELECT	'CVS_SASANIAN_UA_REQUIRES_IS_'||DistrictType,		'REQUIREMENTSET_TEST_ALL'
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
VALUES	('CVS_SASANIAN_UA_REQUIRES_LEADER',					'CVS_SASANIAN_UA_REQUIRES_BORAN'),
		('CVS_SASANIAN_UA_REQUIRES_LEADER',					'CVS_SASANIAN_UA_REQUIRES_KAWAD_I'),
		('CVS_SASANIAN_UA_REQUIRES_LEADER',					'CVS_SASANIAN_UA_REQUIRES_SHAPUR_I'),
		('CVS_SASANIAN_UA_REQUIRES_ADJ_THEATER',			'CVS_SASANIAN_UA_CHECK_ADJ_THEATER'),
		('CVS_SASANIAN_UA_REQUIRES_IS_THEATER',				'CVS_SASANIAN_UA_CHECK_IS_THEATER'),
		('CVS_SASANIAN_UA_CITY_HAS_GOVERNMENT_DISTRICT',	'CVS_SASANIAN_UA_CHECK_HAS_GOVT');
			
INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
SELECT	'CVS_SASANIAN_UA_REQUIRES_ADJ_'||DistrictType,		'CVS_SASANIAN_UA_ADJ_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
SELECT	'CVS_SASANIAN_UA_REQUIRES_IS_'||DistrictType,		'CVS_SASANIAN_UA_IS_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId, 									RequirementType,									Inverse)
VALUES	('CVS_SASANIAN_UA_REQUIRES_BORAN',					'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',			0),
		('CVS_SASANIAN_UA_REQUIRES_KAWAD_I',				'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',			0),
		('CVS_SASANIAN_UA_REQUIRES_SHAPUR_I',				'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',			0),
		('CVS_SASANIAN_UA_CHECK_ADJ_THEATER',				'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0),
		('CVS_SASANIAN_UA_CHECK_IS_THEATER',				'REQUIREMENT_DISTRICT_TYPE_MATCHES',				0),
		('CVS_SASANIAN_UA_CHECK_HAS_GOVT',					'REQUIREMENT_CITY_HAS_DISTRICT',					0);

INSERT INTO Requirements
		(RequirementId, 									RequirementType,									Inverse)
SELECT	'CVS_SASANIAN_UA_ADJ_'||DistrictType,				'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Requirements
		(RequirementId, 									RequirementType,									Inverse)
SELECT	'CVS_SASANIAN_UA_IS_'||DistrictType,				'REQUIREMENT_DISTRICT_TYPE_MATCHES',				0
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
VALUES	('CVS_SASANIAN_UA_REQUIRES_BORAN',		'LeaderType',		'LEADER_CVS_BORAN'),
		('CVS_SASANIAN_UA_REQUIRES_KAWAD_I',	'LeaderType',		'LEADER_CVS_KAWAD_I'),
		('CVS_SASANIAN_UA_REQUIRES_SHAPUR_I',	'LeaderType',		'LEADER_CVS_SHAPUR_I'),
		('CVS_SASANIAN_UA_CHECK_ADJ_THEATER',	'DistrictType',		'DISTRICT_THEATER'),
		('CVS_SASANIAN_UA_CHECK_ADJ_THEATER',	'MinRange',			1),
		('CVS_SASANIAN_UA_CHECK_ADJ_THEATER',	'MaxRange',			1),
		('CVS_SASANIAN_UA_CHECK_IS_THEATER',	'DistrictType',		'DISTRICT_THEATER'),
		('CVS_SASANIAN_UA_CHECK_HAS_GOVT',		'DistrictType',		'DISTRICT_GOVERNMENT');

INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
SELECT	'CVS_SASANIAN_UA_ADJ_'||DistrictType,	'DistrictType',		DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
SELECT	'CVS_SASANIAN_UA_ADJ_'||DistrictType,	'MinRange',			1
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
SELECT	'CVS_SASANIAN_UA_ADJ_'||DistrictType,	'MaxRange',			1
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
SELECT	'CVS_SASANIAN_UA_IS_'||DistrictType,	'DistrictType',		DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL)
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

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