--==========================================================================================================================
-- Boran / Agenda
--==========================================================================================================================
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types
		(Type,											Kind)
VALUES	('TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'KIND_TRAIT');
-----------------------------------------------	
-- Agendas
-----------------------------------------------	
INSERT INTO Agendas
		(AgendaType,									Name,										Description)
VALUES	('AGENDA_CVS_BANBISHNAN_BANBISHN',				'LOC_AGENDA_CVS_BANBISHNAN_BANBISHN_NAME',	'LOC_AGENDA_CVS_BANBISHNAN_BANBISHN_DESCRIPTION');
-----------------------------------------------	
-- Traits
-----------------------------------------------	
INSERT INTO Traits
		(TraitType,										Name,										Description)
VALUES	('TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'LOC_PLACEHOLDER',							'LOC_PLACEHOLDER');
-----------------------------------------------	
-- AgendaTraits
-----------------------------------------------	
INSERT INTO AgendaTraits
		(AgendaType,									TraitType)
VALUES	('AGENDA_CVS_BANBISHNAN_BANBISHN',				'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN');
-----------------------------------------------	
-- HistoricalAgendas
-----------------------------------------------	
INSERT INTO HistoricalAgendas
		(LeaderType,									AgendaType)
VALUES	('LEADER_CVS_BORAN',							'AGENDA_CVS_BANBISHNAN_BANBISHN');
-----------------------------------------------	
-- TraitModifiers
-----------------------------------------------	
INSERT INTO TraitModifiers
		(TraitType,										ModifierId)
VALUES	('TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'AGENDA_CVS_BANBISHNAN_BANBISHN_CS_COMPETING');

-- Vanilla
INSERT INTO TraitModifiers
		(TraitType,										ModifierId)
SELECT  'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',			'AGENDA_CVS_BANBISHNAN_BANBISHN_'||BuildingType
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- Expac
INSERT INTO TraitModifiers
		(TraitType,										ModifierId)
SELECT  'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',			'AGENDA_CVS_BANBISHNAN_BANBISHN_HIKKIMORI'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO TraitModifiers
		(TraitType,										ModifierId)
SELECT  'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',			'AGENDA_CVS_BANBISHNAN_BANBISHN_NOT_HIKKIMORI'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------	
-- Modifiers
-----------------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,											ModifierType,											SubjectRequirementSetId)
VALUES	('AGENDA_CVS_BANBISHNAN_BANBISHN_CS_COMPETING',			'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',			'CVS_BANBISHNAN_BANBISHN_PLAYER_COMPETING_MINORS');

-- Vanilla
INSERT INTO Modifiers
		(ModifierId,											ModifierType,											SubjectRequirementSetId)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_'||BuildingType,		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',			'CVS_BANBISHNAN_BANBISHN_REQUIRES_'||BuildingType
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- Expac
INSERT INTO Modifiers
		(ModifierId,											ModifierType,											SubjectRequirementSetId)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_HIKKIMORI',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',			'CVS_BANBISHNAN_BANBISHN_REQUIRES_HIKKIMORI'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,											ModifierType,											SubjectRequirementSetId)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_NOT_HIKKIMORI',			'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',			'CVS_BANBISHNAN_BANBISHN_REQUIRES_NOT_HIKKIMORI'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');


-----------------------------------------------	
-- ModifierArguments
-----------------------------------------------	
INSERT INTO ModifierArguments
		(ModifierId,											Name,							Value)
VALUES	('AGENDA_CVS_BANBISHNAN_BANBISHN_CS_COMPETING',			'InitialValue',					-10),
		('AGENDA_CVS_BANBISHNAN_BANBISHN_CS_COMPETING',			'ReductionValue',				-1),
		('AGENDA_CVS_BANBISHNAN_BANBISHN_CS_COMPETING',			'ReductionTurns',				10),
		('AGENDA_CVS_BANBISHNAN_BANBISHN_CS_COMPETING',			'StatementKey',					'LOC_DIPLO_WARNING_LEADER_CVS_BORAN_REASON_CS_COMPETING'),
		('AGENDA_CVS_BANBISHNAN_BANBISHN_CS_COMPETING',			'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_CVS_BANBISHNAN_BANBISHN_CS_COMPETING');

-- Vanilla
INSERT INTO ModifierArguments
		(ModifierId,											Name,							Value)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_'||BuildingType,		'InitialValue',					4
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,											Name,							Value)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_'||BuildingType,		'StatementKey',					'LOC_DIPLO_KUDO_LEADER_CVS_BORAN_REASON_BUILDS_THE_WALL'
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,											Name,							Value)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_'||BuildingType,		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_CVS_BANBISHNAN_BANBISHN_BUILDS_THE_WALL'
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- Expac
INSERT INTO ModifierArguments
		(ModifierId,											Name,							Value)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_HIKKIMORI',				'InitialValue',					7
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,											Name,							Value)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_HIKKIMORI',				'StatementKey',					'LOC_DIPLO_KUDO_LEADER_CVS_BORAN_REASON_BUILDS_THE_WALL'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,											Name,							Value)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_HIKKIMORI',				'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_CVS_BANBISHNAN_BANBISHN_BUILDS_THE_WALL'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,											Name,							Value)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_NOT_HIKKIMORI',			'InitialValue',					-7
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,											Name,							Value)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_NOT_HIKKIMORI',			'StatementKey',					'LOC_DIPLO_WARNING_LEADER_CVS_BORAN_REASON_NOT_BUILDS_THE_WALL'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierArguments
		(ModifierId,											Name,							Value)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_NOT_HIKKIMORI',			'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_CVS_BANBISHNAN_BANBISHN_NOT_BUILDS_THE_WALL'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------	
-- ModifierStrings
-----------------------------------------------	
INSERT INTO ModifierStrings
		(ModifierId,											Context,		Text)
VALUES	('AGENDA_CVS_BANBISHNAN_BANBISHN_CS_COMPETING',			'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');

-- Vanilla
INSERT INTO ModifierStrings
		(ModifierId,											Context,		Text)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_'||BuildingType,		'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- Expac
INSERT INTO ModifierStrings
		(ModifierId,											Context,		Text)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_HIKKIMORI',				'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO ModifierStrings
		(ModifierId,											Context,		Text)
SELECT	'AGENDA_CVS_BANBISHNAN_BANBISHN_NOT_HIKKIMORI',			'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------	
-- RequirementSets
-----------------------------------------------	
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
VALUES	('CVS_BANBISHNAN_BANBISHN_PLAYER_COMPETING_MINORS',		'REQUIREMENTSET_TEST_ALL');

-- Vanilla
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
SELECT	'CVS_BANBISHNAN_BANBISHN_REQUIRES_'||BuildingType,		'REQUIREMENTSET_TEST_ALL'
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- Expac
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
SELECT	'CVS_BANBISHNAN_BANBISHN_REQUIRES_HIKKIMORI',			'REQUIREMENTSET_TEST_ALL'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
SELECT	'CVS_BANBISHNAN_BANBISHN_REQUIRES_NOT_HIKKIMORI',		'REQUIREMENTSET_TEST_ALL'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
	
-----------------------------------------------	
-- RequirementSetRequirements
-----------------------------------------------	
INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
VALUES	('CVS_BANBISHNAN_BANBISHN_PLAYER_COMPETING_MINORS',		'REQUIRES_COMPETING_MINORS'),
		('CVS_BANBISHNAN_BANBISHN_PLAYER_COMPETING_MINORS',		'REQUIRES_MAJOR_CIV_OPPONENT'),
		('CVS_BANBISHNAN_BANBISHN_PLAYER_COMPETING_MINORS',		'REQUIRES_PLAYERS_HAVE_MET');

-- Vanilla
INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
SELECT	'CVS_BANBISHNAN_BANBISHN_REQUIRES_'||BuildingType,		'CVS_BB_CHECK_'||BuildingType
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
SELECT	'CVS_BANBISHNAN_BANBISHN_REQUIRES_'||BuildingType,		'REQUIRES_MAJOR_CIV_OPPONENT'
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
SELECT	'CVS_BANBISHNAN_BANBISHN_REQUIRES_'||BuildingType,		'REQUIRES_MET_10_TURNS_AGO'
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- Expac
INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
SELECT	'CVS_BANBISHNAN_BANBISHN_REQUIRES_HIKKIMORI',			'REQUIRES_HAS_HIGH_WALLS'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
SELECT	'CVS_BANBISHNAN_BANBISHN_REQUIRES_HIKKIMORI',			'REQUIRES_MAJOR_CIV_OPPONENT'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
SELECT	'CVS_BANBISHNAN_BANBISHN_REQUIRES_HIKKIMORI',			'REQUIRES_MET_10_TURNS_AGO'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
SELECT	'CVS_BANBISHNAN_BANBISHN_REQUIRES_NOT_HIKKIMORI',		'REQUIRES_HAS_LOW_WALLS'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
SELECT	'CVS_BANBISHNAN_BANBISHN_REQUIRES_NOT_HIKKIMORI',		'REQUIRES_MAJOR_CIV_OPPONENT'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
SELECT	'CVS_BANBISHNAN_BANBISHN_REQUIRES_NOT_HIKKIMORI',		'REQUIRES_MET_10_TURNS_AGO'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,								RequirementType)
SELECT	'CVS_BB_CHECK_'||BuildingType,				'REQUIREMENT_PLAYER_HAS_AT_LEAST_NUM_BUILDINGS'
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,								Name,				Value)
SELECT	'CVS_BB_CHECK_'||BuildingType,				'BuildingType',		BuildingType
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO RequirementArguments
		(RequirementId,								Name,				Value)
SELECT	'CVS_BB_CHECK_'||BuildingType,				'Amount',			3
FROM Buildings
WHERE OuterDefenseHitPoints IS NOT NULL
AND NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------	
-- ExclusiveAgendas
-----------------------------------------------	
INSERT INTO ExclusiveAgendas
		(AgendaOne,									AgendaTwo)
VALUES	('AGENDA_CVS_BANBISHNAN_BANBISHN',			'AGENDA_DARWINIST'),
		('AGENDA_CVS_BANBISHNAN_BANBISHN',			'AGENDA_CITY_STATE_ALLY');
-----------------------------------------------
-- AgendaPreferredLeaders
-----------------------------------------------	
INSERT INTO AgendaPreferredLeaders
		(AgendaType,								LeaderType)
VALUES	('AGENDA_CITY_STATE_PROTECTOR',				'LEADER_CVS_BORAN'),
		('AGENDA_CULTURED',							'LEADER_CVS_BORAN');