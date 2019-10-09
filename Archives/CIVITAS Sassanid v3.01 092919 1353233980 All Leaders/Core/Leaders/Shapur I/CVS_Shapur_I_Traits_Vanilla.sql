--==========================================================================================================================
-- Shapur I / Vanilla Traits
--==========================================================================================================================
-- Updates trait description to vanilla description if active.
UPDATE Traits
SET Description = 'LOC_TRAIT_LEADER_CVS_SHAPUR_I_UA_VANILLA_DESCRIPTION'
WHERE TraitType = 'TRAIT_LEADER_CVS_SHAPUR_I_UA'
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- GreatPersonIndividualActionModifiers
-----------------------------------------------
INSERT INTO GreatPersonIndividualActionModifiers
		(GreatPersonIndividualType,							ModifierId,													AttachmentTargetType)
SELECT	GreatPersonIndividualType,							'CVS_SHAPUR_GG_HEAL_'||GreatPersonIndividualType,			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_UNIT_GREATPERSON'
FROM	GreatPersonIndividuals
WHERE	GreatPersonClassType = 'GREAT_PERSON_CLASS_GENERAL';
-----------------------------------------------
-- BuildingModifiers
-----------------------------------------------
-- Capital Movement
INSERT INTO BuildingModifiers
		(BuildingType,			ModifierId)
SELECT	'BUILDING_PALACE',		'CVS_SHAPUR_GOVERNOR_OUTER_SPEED_VAN'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO BuildingModifiers
		(BuildingType,			ModifierId)
SELECT	'BUILDING_PALACE',		'CVS_SHAPUR_GOVERNOR_INNER_SPEED_VAN'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Governor GGP
INSERT INTO BuildingModifiers
		(BuildingType,			ModifierId)
SELECT	'BUILDING_PALACE',		'CVS_SHAPUR_GOVERNOR_OUTER_GGP_VAN'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO BuildingModifiers
		(BuildingType,			ModifierId)
SELECT	'BUILDING_PALACE',		'CVS_SHAPUR_GOVERNOR_INNER_GGP_VAN'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,										ModifierType,						RunOnce,	Permanent,	OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GG_HEAL_'||GreatPersonIndividualType,	'DYNMOD_CVS_SHAPUR_UNIT_HEAL',		1,			1,			'CVS_SHAPUR_CORE_IS_SHAPUR',			'CVS_SHAPUR_REQUIRES_ADJACENT'
FROM	GreatPersonIndividuals
WHERE	GreatPersonClassType = 'GREAT_PERSON_CLASS_GENERAL';

-- Capital Movement
-- Outer
INSERT INTO Modifiers
		(ModifierId,								ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_SPEED_VAN',		'MODIFIER_ALL_UNITS_ATTACH_MODIFIER',		0,			0,			'CVS_SHAPUR_VAN_REQUIRES_NOT_SHAPUR',	'CVS_SHAPUR_VAN_REQUIRES_OUTER_RANGE'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,								ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,				SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_SPEED_VAN_MOD',	'DYNMOD_CVS_SHAPUR_MOVEMENT',				0,			0,			'CVS_SHAPUR_VAN_REQUIRES_SHAPUR',	null
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Capital Movement
-- Inner
INSERT INTO Modifiers
		(ModifierId,								ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_SPEED_VAN',		'MODIFIER_ALL_UNITS_ATTACH_MODIFIER',		0,			0,			'CVS_SHAPUR_VAN_REQUIRES_NOT_SHAPUR',	'CVS_SHAPUR_VAN_REQUIRES_INNER_RANGE'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,								ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,				SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_SPEED_VAN_MOD',	'DYNMOD_CVS_SHAPUR_MOVEMENT',				0,			0,			'CVS_SHAPUR_VAN_REQUIRES_SHAPUR',	null
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Capital GGP
-- Outer
INSERT INTO Modifiers
		(ModifierId,								ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_GGP_VAN',		'MODIFIER_ALL_UNITS_ATTACH_MODIFIER',		0,			0,			'CVS_SHAPUR_VAN_REQUIRES_NOT_SHAPUR',	'CVS_SHAPUR_VAN_REQUIRES_OUTER_RANGE'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,								ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,				SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_GGP_VAN_MOD',	'DYNMOD_CVS_SHAPUR_GPP',					0,			0,			'CVS_SHAPUR_VAN_REQUIRES_SHAPUR',	null
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Capital GGP
-- Inner
INSERT INTO Modifiers
		(ModifierId,								ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,					SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_GGP_VAN',		'MODIFIER_ALL_UNITS_ATTACH_MODIFIER',		0,			0,			'CVS_SHAPUR_VAN_REQUIRES_NOT_SHAPUR',	'CVS_SHAPUR_VAN_REQUIRES_INNER_RANGE'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,								ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,				SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_GGP_VAN_MOD',	'DYNMOD_CVS_SHAPUR_GPP',					0,			0,			'CVS_SHAPUR_VAN_REQUIRES_SHAPUR',	null
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,										Name,			Value)
SELECT	'CVS_SHAPUR_GG_HEAL_'||GreatPersonIndividualType,	'Amount',		-100
FROM	GreatPersonIndividuals
WHERE	GreatPersonClassType = 'GREAT_PERSON_CLASS_GENERAL';

-- Capital Movement
-- Outer
INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_SPEED_VAN',		'ModifierId',	'CVS_SHAPUR_GOVERNOR_OUTER_SPEED_VAN_MOD'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_SPEED_VAN_MOD',	'Amount',		1
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Capital Movement
-- Inner
INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_SPEED_VAN',		'ModifierId',	'CVS_SHAPUR_GOVERNOR_INNER_SPEED_VAN_MOD'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_SPEED_VAN_MOD',	'Amount',		1
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Capital GGP
-- Outer
INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_GGP_VAN',		'ModifierId',	'CVS_SHAPUR_GOVERNOR_OUTER_GGP_VAN_MOD'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,								Name,						Value)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_GGP_VAN_MOD',	'GreatPersonClassType',		'GREAT_PERSON_CLASS_GENERAL'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_GGP_VAN_MOD',	'Amount',		2
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Capital GGP
-- Inner
INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_GGP_VAN',		'ModifierId',	'CVS_SHAPUR_GOVERNOR_INNER_GGP_VAN_MOD'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,								Name,						Value)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_GGP_VAN_MOD',	'GreatPersonClassType',		'GREAT_PERSON_CLASS_GENERAL'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_GGP_VAN_MOD',	'Amount',		2
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,								RequirementSetType)
VALUES	('CVS_SHAPUR_CORE_IS_SHAPUR',					'REQUIREMENTSET_TEST_ALL'),
		('CVS_SHAPUR_REQUIRES_ADJACENT',				'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSets
		(RequirementSetId,								RequirementSetType)
VALUES	('CVS_SHAPUR_VAN_REQUIRES_SHAPUR',				'REQUIREMENTSET_TEST_ALL'),
		('CVS_SHAPUR_VAN_REQUIRES_NOT_SHAPUR',			'REQUIREMENTSET_TEST_ALL'),
		('CVS_SHAPUR_VAN_REQUIRES_OUTER_RANGE',			'REQUIREMENTSET_TEST_ALL'),
		('CVS_SHAPUR_VAN_REQUIRES_INNER_RANGE',			'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
VALUES  ('CVS_SHAPUR_REQUIRES_ADJACENT',				'CVS_SHAPUR_CHECK_ADJACENT'),
		('CVS_SHAPUR_CORE_IS_SHAPUR',					'CVS_SHAPUR_CORE_CHECK_IS_SHAPUR');
INSERT INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
VALUES  ('CVS_SHAPUR_VAN_REQUIRES_SHAPUR',				'CVS_SHAPUR_VAN_CHECK_IS_SHAPUR'),
		('CVS_SHAPUR_VAN_REQUIRES_NOT_SHAPUR',			'CVS_SHAPUR_VAN_CHECK_NOT_SHAPUR'),
		('CVS_SHAPUR_VAN_REQUIRES_OUTER_RANGE',			'CVS_SHAPUR_VAN_CHECK_OUTER_RANGE'),
		('CVS_SHAPUR_VAN_REQUIRES_INNER_RANGE',			'CVS_SHAPUR_VAN_CHECK_INNER_RANGE');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
SELECT	'CVS_SHAPUR_VAN_REQUIRES_NOT_SHAPUR',			'CVS_SHAPUR_VAN_CHECK_NOT_'||LeaderType
FROM Leaders WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%';
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,									RequirementType,									Inverse)
VALUES	('CVS_SHAPUR_CHECK_ADJACENT',					'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',				0),
		('CVS_SHAPUR_CORE_CHECK_IS_SHAPUR',				'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',			0);

INSERT INTO Requirements
		(RequirementId,									RequirementType,									Inverse)
VALUES	('CVS_SHAPUR_VAN_CHECK_IS_SHAPUR',				'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',			0),
		('CVS_SHAPUR_VAN_CHECK_NOT_SHAPUR',				'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',			1),
		('CVS_SHAPUR_VAN_CHECK_OUTER_RANGE',			'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',				0),
		('CVS_SHAPUR_VAN_CHECK_INNER_RANGE',			'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',				0);

INSERT INTO Requirements
		(RequirementId,									RequirementType,									Inverse)
SELECT	'CVS_SHAPUR_VAN_CHECK_NOT_'||LeaderType,		'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',			1
FROM Leaders WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%';
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,									Name,				Value)
VALUES	('CVS_SHAPUR_CHECK_ADJACENT',					'MinDistance',		0),
		('CVS_SHAPUR_CHECK_ADJACENT',					'MaxDistance',		1),
		('CVS_SHAPUR_CORE_CHECK_IS_SHAPUR',				'LeaderType',		'LEADER_CVS_SHAPUR_I');

INSERT INTO RequirementArguments
		(RequirementId,									Name,				Value)
VALUES	('CVS_SHAPUR_VAN_CHECK_IS_SHAPUR',				'LeaderType',		'LEADER_CVS_SHAPUR_I'),
		('CVS_SHAPUR_VAN_CHECK_NOT_SHAPUR',				'LeaderType',		'LEADER_CVS_SHAPUR_I'),
		('CVS_SHAPUR_VAN_CHECK_OUTER_RANGE',			'MinDistance',		1),
		('CVS_SHAPUR_VAN_CHECK_OUTER_RANGE',			'MaxDistance',		5),
		('CVS_SHAPUR_VAN_CHECK_INNER_RANGE',			'MinDistance',		1),
		('CVS_SHAPUR_VAN_CHECK_INNER_RANGE',			'MaxDistance',		3);

INSERT INTO RequirementArguments
		(RequirementId,									Name,				Value)
SELECT	'CVS_SHAPUR_VAN_CHECK_NOT_'||LeaderType,		'LeaderType',		LeaderType
FROM Leaders WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%';