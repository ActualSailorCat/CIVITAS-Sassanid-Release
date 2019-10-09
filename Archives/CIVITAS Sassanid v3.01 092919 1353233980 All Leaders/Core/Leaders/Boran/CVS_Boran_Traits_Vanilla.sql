--==========================================================================================================================
-- Boran / Vanilla Traits
--==========================================================================================================================
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types	
		(Type,											Kind)
VALUES	('TRAIT_LEADER_CVS_BORAN_UA',					'KIND_TRAIT'),
		('TRAIT_LEADER_IMPROVEMENT_CVS_DIZ',			'KIND_TRAIT'),
		('IMPROVEMENT_CVS_DIZ',							'KIND_IMPROVEMENT');
-----------------------------------------------
-- LeaderTraits
-----------------------------------------------	
INSERT INTO LeaderTraits	
		(LeaderType,									TraitType)
VALUES	('LEADER_CVS_BORAN',							'TRAIT_LEADER_CVS_BORAN_UA');

INSERT INTO LeaderTraits
		(TraitType,										LeaderType)
VALUES	('TRAIT_LEADER_IMPROVEMENT_CVS_DIZ',			'LEADER_CVS_BORAN');
-----------------------------------------------			
-- Traits			
-----------------------------------------------				
INSERT INTO Traits				
		(TraitType,										Name,											Description)
VALUES	('TRAIT_LEADER_CVS_BORAN_UA',					'LOC_TRAIT_LEADER_CVS_BORAN_UA_NAME',		'LOC_TRAIT_LEADER_CVS_BORAN_UA_DESCRIPTION'),
		('TRAIT_LEADER_IMPROVEMENT_CVS_DIZ',			'LOC_IMPROVEMENT_CVS_DIZ_NAME',				null);

UPDATE Traits
SET Description = 'LOC_TRAIT_LEADER_CVS_BORAN_UA_EXPAC_DESCRIPTION'
WHERE TraitType = 'TRAIT_LEADER_CVS_BORAN_UA'
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- TraitModifiers		
-----------------------------------------------			
INSERT INTO TraitModifiers
		(TraitType,										ModifierId)
VALUES	('TRAIT_LEADER_CVS_BORAN_UA',					'CVS_BORAN_UA_WONDER_PRODUCTION');

INSERT INTO TraitModifiers
		(TraitType,										ModifierId)
SELECT	'TRAIT_LEADER_CVS_BORAN_UA',					'CVS_BORAN_UA_LEVY_COST'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- BuildingModifiers
-----------------------------------------------	
INSERT INTO BuildingModifiers
		(BuildingType,									ModifierId)
SELECT	BuildingType,									'CVS_BORAN_UA_INFLUENCE_FROM_'||BuildingType
FROM	Buildings
WHERE	IsWonder = 1;
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,									ModifierType,								RunOnce,	Permanent,	SubjectRequirementSetId)
VALUES	('CVS_BORAN_UA_WONDER_PRODUCTION',				'DYNMOD_CVS_BORAN_UA_WONDER_PRODUCTION',	0,			0,			'CVS_BORAN_UA_REQUIRES_NO_WONDERS_IN_CITY');

INSERT INTO Modifiers
		(ModifierId,									ModifierType)
SELECT	'CVS_BORAN_UA_LEVY_COST',						'DYNMOD_CVS_BORAN_UA_LEVY_DISCOUNT'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- Wonder Influence
INSERT INTO Modifiers
		(ModifierId,									ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId)
SELECT	'CVS_BORAN_UA_INFLUENCE_FROM_'||BuildingType,	'DYNMOD_CVS_BORAN_UA_UNIT_ENVOY_POINTS',	0,			1,			'CVS_BORAN_UA_REQUIRES_IS_BORAN'
FROM	Buildings
WHERE	IsWonder = 1;
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,									Name,				Value)
VALUES	('CVS_BORAN_UA_WONDER_PRODUCTION',				'Amount',			15);

INSERT INTO ModifierArguments
		(ModifierId,									Name,				Value)
SELECT	'CVS_BORAN_UA_LEVY_COST',						'Percent',			50
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- Wonder Influence
INSERT INTO ModifierArguments
		(ModifierId,									Name,				Value)
SELECT	'CVS_BORAN_UA_INFLUENCE_FROM_'||BuildingType,	'Amount',			1
FROM	Buildings
WHERE	IsWonder = 1;
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,								RequirementSetType)
VALUES	('CVS_BORAN_UA_REQUIRES_NO_WONDERS_IN_CITY',	'REQUIREMENTSET_TEST_ALL'),
		('CVS_BORAN_UA_REQUIRES_IS_BORAN',				'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
VALUES	('CVS_BORAN_UA_REQUIRES_IS_BORAN',				'CVS_BORAN_UA_CHECK_IS_BORAN');

-- No Wonders in City
INSERT INTO RequirementSetRequirements
		(RequirementSetId, 								RequirementId)
SELECT  'CVS_BORAN_UA_REQUIRES_NO_WONDERS_IN_CITY',		'CVS_BORAN_UA_CHECK_CITY_FOR_WONDER_'||BuildingType
FROM	Buildings
WHERE	IsWonder = 1;
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId, 								RequirementType,							Inverse)
VALUES	('CVS_BORAN_UA_CHECK_IS_BORAN',					'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',	0);

-- No Wonders in City
INSERT INTO Requirements
		(RequirementId, 										RequirementType,					Inverse)
SELECT  'CVS_BORAN_UA_CHECK_CITY_FOR_WONDER_'||BuildingType,	'REQUIREMENT_CITY_HAS_BUILDING',	1
FROM	Buildings
WHERE	IsWonder = 1;
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId, 										Name,						Value)
VALUES	('CVS_BORAN_UA_CHECK_IS_BORAN',							'LeaderType',				'LEADER_CVS_BORAN');

-- No Wonders in City
INSERT INTO RequirementArguments
		(RequirementId, 										Name,				Value)
SELECT	'CVS_BORAN_UA_CHECK_CITY_FOR_WONDER_'||BuildingType,	'BuildingType',		BuildingType
FROM	Buildings
WHERE	IsWonder = 1;