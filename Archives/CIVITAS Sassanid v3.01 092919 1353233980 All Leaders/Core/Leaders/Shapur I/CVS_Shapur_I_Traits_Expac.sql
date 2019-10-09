--==========================================================================================================================
-- Shapur I / Expac Traits
--==========================================================================================================================
-----------------------------------------------
-- GovernorPromotionModifiers
-----------------------------------------------
-- Governor Movement
INSERT INTO GovernorPromotionModifiers
		(GovernorPromotionType,			ModifierId)
SELECT	GovernorPromotionType,			'CVS_SHAPUR_GOVERNOR_OUTER_SPEED_'||GovernorPromotionType
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO GovernorPromotionModifiers
		(GovernorPromotionType,			ModifierId)
SELECT	GovernorPromotionType,			'CVS_SHAPUR_GOVERNOR_INNER_SPEED_'||GovernorPromotionType
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Governor GGP
INSERT INTO GovernorPromotionModifiers
		(GovernorPromotionType,			ModifierId)
SELECT	GovernorPromotionType,			'CVS_SHAPUR_GOVERNOR_OUTER_GGP_'||GovernorPromotionType
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO GovernorPromotionModifiers
		(GovernorPromotionType,			ModifierId)
SELECT	GovernorPromotionType,			'CVS_SHAPUR_GOVERNOR_INNER_GGP_'||GovernorPromotionType
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
-- Governor Movement
-- Outer
INSERT INTO Modifiers
		(ModifierId,													ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,				SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_SPEED_'||GovernorPromotionType,		'MODIFIER_ALL_UNITS_ATTACH_MODIFIER',		0,			0,			'CVS_SHAPUR_REQUIRES_NOT_SHAPUR',	'CVS_SHAPUR_REQUIRES_OUTER_RANGE'
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,													ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,			SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_SPEED_MOD_'||GovernorPromotionType,	'DYNMOD_CVS_SHAPUR_MOVEMENT',				0,			0,			'CVS_SHAPUR_REQUIRES_SHAPUR',	null
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Governor Movement
-- Inner
INSERT INTO Modifiers
		(ModifierId,													ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,				SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_SPEED_'||GovernorPromotionType,		'MODIFIER_ALL_UNITS_ATTACH_MODIFIER',		0,			0,			'CVS_SHAPUR_REQUIRES_NOT_SHAPUR',	'CVS_SHAPUR_REQUIRES_INNER_RANGE'
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,													ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,			SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_SPEED_MOD_'||GovernorPromotionType,	'DYNMOD_CVS_SHAPUR_MOVEMENT',				0,			0,			'CVS_SHAPUR_REQUIRES_SHAPUR',	null
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Governor GGP
-- Outer
INSERT INTO Modifiers
		(ModifierId,													ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,				SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_GGP_'||GovernorPromotionType,		'MODIFIER_ALL_UNITS_ATTACH_MODIFIER',		0,			0,			'CVS_SHAPUR_REQUIRES_NOT_SHAPUR',	'CVS_SHAPUR_REQUIRES_OUTER_RANGE'
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,													ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,			SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_GGP_MOD_'||GovernorPromotionType,	'DYNMOD_CVS_SHAPUR_GPP',					0,			0,			'CVS_SHAPUR_REQUIRES_SHAPUR',	null
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Governor GGP
-- Inner
INSERT INTO Modifiers
		(ModifierId,													ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,				SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_GGP_'||GovernorPromotionType,		'MODIFIER_ALL_UNITS_ATTACH_MODIFIER',		0,			0,			'CVS_SHAPUR_REQUIRES_NOT_SHAPUR',	'CVS_SHAPUR_REQUIRES_INNER_RANGE'
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,													ModifierType,								RunOnce,	Permanent,	OwnerRequirementSetId,			SubjectRequirementSetId)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_GGP_MOD_'||GovernorPromotionType,	'DYNMOD_CVS_SHAPUR_GPP',					0,			0,			'CVS_SHAPUR_REQUIRES_SHAPUR',	null
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
-- Governor Movement
-- Outer
INSERT INTO ModifierArguments
		(ModifierId,													Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_SPEED_'||GovernorPromotionType,		'ModifierId',	'CVS_SHAPUR_GOVERNOR_OUTER_SPEED_MOD_'||GovernorPromotionType
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,													Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_SPEED_MOD_'||GovernorPromotionType,	'Amount',		1
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Governor Movement
-- Inner
INSERT INTO ModifierArguments
		(ModifierId,													Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_SPEED_'||GovernorPromotionType,		'ModifierId',	'CVS_SHAPUR_GOVERNOR_INNER_SPEED_MOD_'||GovernorPromotionType
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,													Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_SPEED_MOD_'||GovernorPromotionType,	'Amount',		1
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Governor GGP
-- Outer
INSERT INTO ModifierArguments
		(ModifierId,													Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_GGP_'||GovernorPromotionType,		'ModifierId',	'CVS_SHAPUR_GOVERNOR_OUTER_GGP_MOD_'||GovernorPromotionType
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,													Name,						Value)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_GGP_MOD_'||GovernorPromotionType,	'GreatPersonClassType',		'GREAT_PERSON_CLASS_GENERAL'
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,													Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_OUTER_GGP_MOD_'||GovernorPromotionType,	'Amount',		2
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-- Governor GGP
-- Inner
INSERT INTO ModifierArguments
		(ModifierId,													Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_GGP_'||GovernorPromotionType,		'ModifierId',	'CVS_SHAPUR_GOVERNOR_INNER_GGP_MOD_'||GovernorPromotionType
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,													Name,						Value)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_GGP_MOD_'||GovernorPromotionType,	'GreatPersonClassType',		'GREAT_PERSON_CLASS_GENERAL'
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,													Name,			Value)
SELECT	'CVS_SHAPUR_GOVERNOR_INNER_GGP_MOD_'||GovernorPromotionType,	'Amount',		2
FROM	GovernorPromotions
WHERE	Level = 0
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,								RequirementSetType)
VALUES	('CVS_SHAPUR_REQUIRES_SHAPUR',					'REQUIREMENTSET_TEST_ALL'),
		('CVS_SHAPUR_REQUIRES_NOT_SHAPUR',				'REQUIREMENTSET_TEST_ALL'),
		('CVS_SHAPUR_REQUIRES_OUTER_RANGE',				'REQUIREMENTSET_TEST_ALL'),
		('CVS_SHAPUR_REQUIRES_INNER_RANGE',				'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,								RequirementId)
VALUES  ('CVS_SHAPUR_REQUIRES_SHAPUR',					'CVS_SHAPUR_CHECK_IS_SHAPUR'),
		('CVS_SHAPUR_REQUIRES_NOT_SHAPUR',				'CVS_SHAPUR_CHECK_NOT_SHAPUR'),
		('CVS_SHAPUR_REQUIRES_OUTER_RANGE',				'CVS_SHAPUR_CHECK_OUTER_RANGE'),
		('CVS_SHAPUR_REQUIRES_INNER_RANGE',				'CVS_SHAPUR_CHECK_INNER_RANGE');
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,									RequirementType,									Inverse)
VALUES	('CVS_SHAPUR_CHECK_IS_SHAPUR',					'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',			0),
		('CVS_SHAPUR_CHECK_NOT_SHAPUR',					'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES',			1),
		('CVS_SHAPUR_CHECK_OUTER_RANGE',				'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',				0),
		('CVS_SHAPUR_CHECK_INNER_RANGE',				'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',				0);

-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,									Name,				Value)
VALUES	('CVS_SHAPUR_CHECK_IS_SHAPUR',					'LeaderType',		'LEADER_CVS_SHAPUR_I'),
		('CVS_SHAPUR_CHECK_NOT_SHAPUR',					'LeaderType',		'LEADER_CVS_SHAPUR_I'),
		('CVS_SHAPUR_CHECK_OUTER_RANGE',				'MinDistance',		1),
		('CVS_SHAPUR_CHECK_OUTER_RANGE',				'MaxDistance',		3),
		('CVS_SHAPUR_CHECK_INNER_RANGE',				'MinDistance',		1),
		('CVS_SHAPUR_CHECK_INNER_RANGE',				'MaxDistance',		1);