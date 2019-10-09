--==========================================================================================================================
-- Kawad I / Agenda
--==========================================================================================================================
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types
		(Type,							Kind)
VALUES	('TRAIT_AGENDA_CVS_TTBAM',		'KIND_TRAIT');
-----------------------------------------------	
-- Agendas
-----------------------------------------------	
INSERT INTO Agendas
		(AgendaType,			Name,							Description)
VALUES	('AGENDA_CVS_TTBAM',	'LOC_AGENDA_CVS_TTBAM_NAME',	'LOC_AGENDA_CVS_TTBAM_DESCRIPTION');
-----------------------------------------------	
-- Traits
-----------------------------------------------	
INSERT INTO Traits
		(TraitType,						Name,					Description)
VALUES	('TRAIT_AGENDA_CVS_TTBAM',		'LOC_PLACEHOLDER',		'LOC_PLACEHOLDER');
-----------------------------------------------	
-- AgendaTraits
-----------------------------------------------	
INSERT INTO AgendaTraits
		(AgendaType,						TraitType)
VALUES	('AGENDA_CVS_TTBAM',				'TRAIT_AGENDA_CVS_TTBAM');
-----------------------------------------------	
-- TraitModifiers
-----------------------------------------------	
INSERT INTO TraitModifiers
		(TraitType,							ModifierId)
VALUES	('TRAIT_AGENDA_CVS_TTBAM',			'AGENDA_CVS_TTBAM_HAS_SPIED'),
		('TRAIT_AGENDA_CVS_TTBAM',			'AGENDA_CVS_TTBAM_HAS_NOT_SPIED'),
		('TRAIT_AGENDA_CVS_TTBAM',			'AGENDA_CVS_TTBAM_HIGH_FAITH'),
		('TRAIT_AGENDA_CVS_TTBAM',			'AGENDA_CVS_TTBAM_LOW_FAITH');
-----------------------------------------------	
-- Modifiers
-----------------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,						ModifierType,											SubjectRequirementSetId)
VALUES	('AGENDA_CVS_TTBAM_HAS_SPIED',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',			'CVS_TTBAM_PLAYER_HAS_SPIED'),
		('AGENDA_CVS_TTBAM_HAS_NOT_SPIED',	'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',			'CVS_TTBAM_PLAYER_HAS_NOT_SPIED'),
		('AGENDA_CVS_TTBAM_HIGH_FAITH',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',			'CVS_TTBAM_HIGH_FAITH'),
		('AGENDA_CVS_TTBAM_LOW_FAITH',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',			'CVS_TTBAM_LOW_FAITH');
-----------------------------------------------	
-- ModifierArguments
-----------------------------------------------	
INSERT INTO ModifierArguments
		(ModifierId,						Name,							Value)
VALUES	('AGENDA_CVS_TTBAM_HAS_SPIED',		'InitialValue',					-10),
		('AGENDA_CVS_TTBAM_HAS_SPIED',		'ReductionValue',				1),
		('AGENDA_CVS_TTBAM_HAS_SPIED',		'ReductionTurns',				10),
		('AGENDA_CVS_TTBAM_HAS_SPIED',		'StatementKey',					'LOC_DIPLO_KUDO_LEADER_CVS_KAWAD_I_REASON_HAS_SPIED'),
		('AGENDA_CVS_TTBAM_HAS_SPIED',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_CVS_TTBAM_HAS_SPIED'),

		('AGENDA_CVS_TTBAM_HAS_NOT_SPIED',	'InitialValue',					10),
		('AGENDA_CVS_TTBAM_HAS_NOT_SPIED',	'ReductionValue',				-1),
		('AGENDA_CVS_TTBAM_HAS_NOT_SPIED',	'ReductionTurns',				10),
		('AGENDA_CVS_TTBAM_HAS_NOT_SPIED',	'StatementKey',					'LOC_DIPLO_KUDO_LEADER_CVS_KAWAD_I_REASON_HAS_NOT_SPIED'),
		('AGENDA_CVS_TTBAM_HAS_NOT_SPIED',	'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_CVS_TTBAM_HAS_NOT_SPIED'),

		('AGENDA_CVS_TTBAM_HIGH_FAITH',		'InitialValue',					7),
		('AGENDA_CVS_TTBAM_HIGH_FAITH',		'StatementKey',					'LOC_DIPLO_KUDO_LEADER_CVS_KAWAD_I_REASON_HIGH_FAITH'),
		('AGENDA_CVS_TTBAM_HIGH_FAITH',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_CVS_TTBAM_HIGH_FAITH'),

		('AGENDA_CVS_TTBAM_LOW_FAITH',		'InitialValue',					-7),
		('AGENDA_CVS_TTBAM_LOW_FAITH',		'StatementKey',					'LOC_DIPLO_WARNING_LEADER_CVS_KAWAD_I_REASON_LOW_FAITH'),
		('AGENDA_CVS_TTBAM_LOW_FAITH',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_CVS_TTBAM_LOW_FAITH');
-----------------------------------------------	
-- ModifierStrings
-----------------------------------------------	
INSERT INTO ModifierStrings
		(ModifierId,						Context,		Text)
VALUES	('AGENDA_CVS_TTBAM_HAS_SPIED',		'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_CVS_TTBAM_HAS_NOT_SPIED',	'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_CVS_TTBAM_HIGH_FAITH',		'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_CVS_TTBAM_LOW_FAITH',		'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');
-----------------------------------------------	
-- RequirementSets
-----------------------------------------------	
INSERT INTO RequirementSets
		(RequirementSetId,					RequirementSetType)
VALUES	('CVS_TTBAM_PLAYER_HAS_SPIED',		'REQUIREMENTSET_TEST_ALL'),
		('CVS_TTBAM_PLAYER_HAS_NOT_SPIED',	'REQUIREMENTSET_TEST_ALL'),
		('CVS_TTBAM_HIGH_FAITH',			'REQUIREMENTSET_TEST_ALL'),
		('CVS_TTBAM_LOW_FAITH',				'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------	
-- RequirementSetRequirements
-----------------------------------------------	
INSERT INTO RequirementSetRequirements
		(RequirementSetId,					RequirementId)
VALUES	('CVS_TTBAM_PLAYER_HAS_SPIED',		'CVS_TTBAM_CHECK_HAS_SPIED'),
		('CVS_TTBAM_PLAYER_HAS_SPIED',		'REQUIRES_MAJOR_CIV_OPPONENT'),
		('CVS_TTBAM_PLAYER_HAS_SPIED',		'REQUIRES_MET_10_TURNS_AGO'),

		('CVS_TTBAM_PLAYER_HAS_NOT_SPIED',	'CVS_TTBAM_CHECK_HAS_NOT_SPIED'),
		('CVS_TTBAM_PLAYER_HAS_NOT_SPIED',	'REQUIRES_MAJOR_CIV_OPPONENT'),
		('CVS_TTBAM_PLAYER_HAS_NOT_SPIED',	'REQUIRES_MET_10_TURNS_AGO'),

		('CVS_TTBAM_HIGH_FAITH',			'REQUIRES_HAS_HIGH_FAITH'),
		('CVS_TTBAM_HIGH_FAITH',			'REQUIRES_MAJOR_CIV_OPPONENT'),
		('CVS_TTBAM_HIGH_FAITH',			'REQUIRES_MET_10_TURNS_AGO'),

		('CVS_TTBAM_LOW_FAITH',				'REQUIRES_HAS_LOW_FAITH'),
		('CVS_TTBAM_LOW_FAITH',				'REQUIRES_MAJOR_CIV_OPPONENT'),
		('CVS_TTBAM_LOW_FAITH',				'REQUIRES_MET_10_TURNS_AGO');
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,						RequirementType,					Triggered)
VALUES	('CVS_TTBAM_CHECK_HAS_SPIED',		'REQUIREMENT_ESPIONAGE_DETECTED',	1);

INSERT INTO Requirements
		(RequirementId,						RequirementType,					Inverse)
VALUES	('CVS_TTBAM_CHECK_HAS_NOT_SPIED',	'REQUIREMENT_ESPIONAGE_DETECTED',	1);
-----------------------------------------------	
-- HistoricalAgendas
-----------------------------------------------	
INSERT INTO HistoricalAgendas
		(LeaderType,				AgendaType)
VALUES	('LEADER_CVS_KAWAD_I',		'AGENDA_CVS_TTBAM');
-----------------------------------------------	
-- ExclusiveAgendas
-----------------------------------------------	
INSERT INTO ExclusiveAgendas
		(AgendaOne,					AgendaTwo)
VALUES	('AGENDA_CVS_TTBAM',		'AGENDA_DEVOUT'),
		('AGENDA_CVS_TTBAM',		'AGENDA_CULTURED');
--=============================================
-- Expac-Only Values
--=============================================
INSERT INTO AgendaPreferredLeaders
		(AgendaType,				LeaderType,				PercentageChance)
SELECT	'AGENDA_GOSSIP',			'LEADER_CVS_KAWAD_I',	30
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');