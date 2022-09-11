--==========================================================================================================================
-- Sassanid / General Expac Traits
--==========================================================================================================================
INSERT INTO Types (Type, Kind) VALUES ('DYNMOD_CVS_SASANIAN_UNIT_PROD', 'KIND_MODIFIER');
INSERT INTO DynamicModifiers (ModifierType, CollectionType,	EffectType) VALUES ('DYNMOD_CVS_SASANIAN_UNIT_PROD', 'COLLECTION_PLAYER_CITIES', 'EFFECT_ADJUST_ALL_UNIT_PRODUCTION_MODIFIER');
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_CIVILIZATION_CVS_SASANIAN_UA', 'CVS_SASANIAN_UA_GOVERNMENT_PRODUCTION');
-----------------------------------------------		
-- DistrictModifiers
-----------------------------------------------
INSERT INTO DistrictModifiers (DistrictType, ModifierId)
SELECT DISTINCT	'DISTRICT_GOVERNMENT', 'CVS_SASANIAN_UA_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);

INSERT INTO DistrictModifiers (DistrictType, ModifierId)
SELECT DISTINCT	'DISTRICT_GOVERNMENT', 'CVS_SASANIAN_UA_THEATER_'||GreatPersonClassType
FROM Sassanid_UA;
-----------------------------------------------		
-- Modifiers		
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,								ModifierType,							SubjectRequirementSetId)
VALUES	('CVS_SASANIAN_UA_GOVERNMENT_PRODUCTION',	'DYNMOD_CVS_SASANIAN_UNIT_PROD',		'CVS_SASANIAN_UA_CITY_HAS_GOVERNMENT_DISTRICT');

INSERT INTO Modifiers
		(ModifierId,								ModifierType,							OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_'||DistrictType,			'DYNMOD_CVS_SASANIAN_DISTRICT_MOD',		'CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_ADJ_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);

INSERT INTO Modifiers
		(ModifierId,								ModifierType,							OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_MOD_'||DistrictType,		'DYNMOD_CVS_SASANIAN_DISTRICT_GPP',		'CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_IS_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);

INSERT INTO Modifiers
		(ModifierId,											ModifierType,							OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_THEATER_'||GreatPersonClassType,		'DYNMOD_CVS_SASANIAN_DISTRICT_MOD',		'CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_ADJ_THEATER'
FROM Sassanid_UA;

INSERT INTO Modifiers
		(ModifierId,											ModifierType,							OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SASANIAN_UA_THEATER_MOD_'||GreatPersonClassType,	'DYNMOD_CVS_SASANIAN_DISTRICT_GPP',		'CVS_SASANIAN_UA_REQUIRES_LEADER',		'CVS_SASANIAN_UA_REQUIRES_IS_THEATER'
FROM Sassanid_UA;
-----------------------------------------------		
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,								Name,					Value)
VALUES	('CVS_SASANIAN_UA_GOVERNMENT_PRODUCTION',	'Amount',				20);

INSERT INTO ModifierArguments
		(ModifierId,								Name,					Value)
SELECT	'CVS_SASANIAN_UA_'||DistrictType,			'ModifierId',			'CVS_SASANIAN_UA_MOD_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);

INSERT INTO ModifierArguments
		(ModifierId,								Name,					Value)
SELECT	'CVS_SASANIAN_UA_MOD_'||DistrictType,		'GreatPersonClassType',	GreatPersonClassType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);

INSERT INTO ModifierArguments
		(ModifierId,								Name,					Value)
SELECT	'CVS_SASANIAN_UA_MOD_'||DistrictType,		'Amount',				1
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);

INSERT INTO ModifierArguments
		(ModifierId,											Name,					Value)
SELECT	'CVS_SASANIAN_UA_THEATER_'||GreatPersonClassType,		'ModifierId',			'CVS_SASANIAN_UA_THEATER_MOD_'||GreatPersonClassType
FROM Sassanid_UA;

INSERT INTO ModifierArguments
		(ModifierId,											Name,					Value)
SELECT	'CVS_SASANIAN_UA_THEATER_MOD_'||GreatPersonClassType,	'GreatPersonClassType',	GreatPersonClassType
FROM Sassanid_UA;

INSERT INTO ModifierArguments
		(ModifierId,											Name,					Value)
SELECT	'CVS_SASANIAN_UA_THEATER_MOD_'||GreatPersonClassType,	'Amount',				1
FROM Sassanid_UA;
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
VALUES	('CVS_SASANIAN_UA_CITY_HAS_GOVERNMENT_DISTRICT',	'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
SELECT	'CVS_SASANIAN_UA_REQUIRES_ADJ_'||DistrictType,		'REQUIREMENTSET_TEST_ALL'
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);

INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
SELECT	'CVS_SASANIAN_UA_REQUIRES_IS_'||DistrictType,		'REQUIREMENTSET_TEST_ALL'
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
VALUES	('CVS_SASANIAN_UA_CITY_HAS_GOVERNMENT_DISTRICT',	'CVS_SASANIAN_UA_CHECK_HAS_GOVT');
			
INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
SELECT	'CVS_SASANIAN_UA_REQUIRES_ADJ_'||DistrictType,		'CVS_SASANIAN_UA_ADJ_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);

INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
SELECT	'CVS_SASANIAN_UA_REQUIRES_IS_'||DistrictType,		'CVS_SASANIAN_UA_IS_'||DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId, 									RequirementType,									Inverse)
VALUES	('CVS_SASANIAN_UA_CHECK_HAS_GOVT',					'REQUIREMENT_CITY_HAS_DISTRICT',					0);

INSERT INTO Requirements
		(RequirementId, 									RequirementType,									Inverse)
SELECT	'CVS_SASANIAN_UA_ADJ_'||DistrictType,				'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);

INSERT INTO Requirements
		(RequirementId, 									RequirementType,									Inverse)
SELECT	'CVS_SASANIAN_UA_IS_'||DistrictType,				'REQUIREMENT_DISTRICT_TYPE_MATCHES',				0
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
VALUES	('CVS_SASANIAN_UA_CHECK_HAS_GOVT',		'DistrictType',		'DISTRICT_GOVERNMENT');

INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
SELECT	'CVS_SASANIAN_UA_ADJ_'||DistrictType,	'DistrictType',		DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);

INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
SELECT	'CVS_SASANIAN_UA_ADJ_'||DistrictType,	'MinRange',			1
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);

INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
SELECT	'CVS_SASANIAN_UA_ADJ_'||DistrictType,	'MaxRange',			1
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);

INSERT INTO RequirementArguments
		(RequirementId, 						Name,				Value)
SELECT	'CVS_SASANIAN_UA_IS_'||DistrictType,	'DistrictType',		DistrictType
FROM District_GreatPersonPoints WHERE DistrictType != 'DISTRICT_THEATER' AND DistrictType IN (SELECT DistrictType FROM Districts WHERE TraitType IS NULL);
-----------------------------------------------
-- MomentIllustrations
-----------------------------------------------
INSERT INTO MomentIllustrations
		(MomentIllustrationType,					MomentDataType,			GameDataType,				Texture)
VALUES	('MOMENT_ILLUSTRATION_UNIQUE_UNIT',			'MOMENT_DATA_UNIT',		'UNIT_CVS_ASWAR',			'Moment_UniqueUnit_CVS_Aswar.dds'),
		('MOMENT_ILLUSTRATION_UNIQUE_DISTRICT',		'MOMENT_DATA_DISTRICT',	'DISTRICT_CVS_HUNTINGPARK',	'Moment_Infrastructure_CVS_Wishkar.dds');