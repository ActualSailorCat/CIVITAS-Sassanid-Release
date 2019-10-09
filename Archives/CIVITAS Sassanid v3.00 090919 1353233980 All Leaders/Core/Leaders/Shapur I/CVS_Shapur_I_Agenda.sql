--==========================================================================================================================
-- Shapur I / Agenda by CIVITAS
--==========================================================================================================================
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types
		(Type,									Kind)
VALUES	('TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',	'KIND_TRAIT');
-----------------------------------------------	
-- Agendas
-----------------------------------------------	
INSERT INTO Agendas
		(AgendaType,						Name,										Description)
VALUES	('AGENDA_CVS_OXUS_TO_EUPHRATES',	'LOC_AGENDA_CVS_OXUS_TO_EUPHRATES_NAME',	'LOC_AGENDA_CVS_OXUS_TO_EUPHRATES_DESCRIPTION');
-----------------------------------------------	
-- Traits
-----------------------------------------------	
INSERT INTO Traits
		(TraitType,									Name,					Description)
VALUES	('TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',		'LOC_PLACEHOLDER',		'LOC_PLACEHOLDER');
-----------------------------------------------	
-- AgendaTraits
-----------------------------------------------	
INSERT INTO AgendaTraits
		(AgendaType,									TraitType)
VALUES	('AGENDA_CVS_OXUS_TO_EUPHRATES',				'TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES'),
		('AGENDA_CVS_OXUS_TO_EUPHRATES',				'TRAIT_AGENDA_IGNORE_WARMONGERING');
-----------------------------------------------	
-- TraitModifiers
-----------------------------------------------	
INSERT INTO TraitModifiers
		(TraitType,										ModifierId)
VALUES	('TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',			'AGENDA_CVS_OXUS_TO_EUPHRATES_WAR'),
		('TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',			'AGENDA_CVS_OXUS_TO_EUPHRATES_STANDING_HIGH'),
		('TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',			'AGENDA_CVS_OXUS_TO_EUPHRATES_STANDING_LOW');
-----------------------------------------------	
-- Modifiers
-----------------------------------------------	
INSERT INTO Modifiers	
		(ModifierId,										ModifierType,											SubjectRequirementSetId)
VALUES	('AGENDA_CVS_OXUS_TO_EUPHRATES_WAR',				'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',			'CVS_O2E_PLAYER_DECLARES_WAR'),
		('AGENDA_CVS_OXUS_TO_EUPHRATES_STANDING_HIGH',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',			'CVS_O2E_PLAYER_HIGH_STANDING_ARMY'),
		('AGENDA_CVS_OXUS_TO_EUPHRATES_STANDING_LOW',		'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER',			'CVS_O2E_PLAYER_LOW_STANDING_ARMY');
-----------------------------------------------	
-- ModifierArguments
-----------------------------------------------	
INSERT INTO ModifierArguments
		(ModifierId,										Name,							Value)
VALUES	('AGENDA_CVS_OXUS_TO_EUPHRATES_WAR',				'InitialValue',					10),
		('AGENDA_CVS_OXUS_TO_EUPHRATES_WAR',				'ReductionTurns',				10),
		('AGENDA_CVS_OXUS_TO_EUPHRATES_WAR',				'ReductionValue',				-1),
		('AGENDA_CVS_OXUS_TO_EUPHRATES_WAR',				'StatementKey',					'LOC_DIPLO_KUDO_LEADER_CVS_SHAPUR_I_REASON_WAR'),
		('AGENDA_CVS_OXUS_TO_EUPHRATES_WAR',				'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_CVS_OXUS_TO_EUPHRATES_WAR'),

		('AGENDA_CVS_OXUS_TO_EUPHRATES_STANDING_HIGH',		'InitialValue',					7),
		('AGENDA_CVS_OXUS_TO_EUPHRATES_STANDING_HIGH',		'StatementKey',					'LOC_DIPLO_KUDO_LEADER_CVS_SHAPUR_I_REASON_STANDING_HIGH'),
		('AGENDA_CVS_OXUS_TO_EUPHRATES_STANDING_HIGH',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_CVS_OXUS_TO_EUPHRATES_STANDING_HIGH'),

		('AGENDA_CVS_OXUS_TO_EUPHRATES_STANDING_LOW',		'InitialValue',					-7),
		('AGENDA_CVS_OXUS_TO_EUPHRATES_STANDING_LOW',		'StatementKey',					'LOC_DIPLO_KUDO_LEADER_CVS_SHAPUR_I_REASON_STANDING_LOW'),
		('AGENDA_CVS_OXUS_TO_EUPHRATES_STANDING_LOW',		'SimpleModifierDescription',	'LOC_DIPLO_MODIFIER_CVS_OXUS_TO_EUPHRATES_STANDING_LOW');
-----------------------------------------------	
-- RequirementSets
-----------------------------------------------	
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
VALUES	('CVS_O2E_PLAYER_HIGH_STANDING_ARMY',					'REQUIREMENTSET_TEST_ALL'),
		('CVS_O2E_PLAYER_LOW_STANDING_ARMY',					'REQUIREMENTSET_TEST_ALL'),
		('CVS_O2E_PLAYER_DECLARES_WAR',							'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------	
-- RequirementSetRequirements
-----------------------------------------------	
INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
VALUES	('CVS_O2E_PLAYER_HIGH_STANDING_ARMY',					'REQUIRES_HAS_HIGH_STANDING_ARMY'),
		('CVS_O2E_PLAYER_HIGH_STANDING_ARMY',					'REQUIRES_MAJOR_CIV_OPPONENT'),
		('CVS_O2E_PLAYER_HIGH_STANDING_ARMY',					'REQUIRES_MET_10_TURNS_AGO'),

		('CVS_O2E_PLAYER_LOW_STANDING_ARMY',					'REQUIRES_HAS_LOW_STANDING_ARMY'),
		('CVS_O2E_PLAYER_LOW_STANDING_ARMY',					'REQUIRES_MAJOR_CIV_OPPONENT'),
		('CVS_O2E_PLAYER_LOW_STANDING_ARMY',					'REQUIRES_MET_10_TURNS_AGO'),

		('CVS_O2E_PLAYER_DECLARES_WAR',							'REQUIRES_PLAYER_DECLARED_WAR'),
		('CVS_O2E_PLAYER_DECLARES_WAR',							'REQUIRES_MAJOR_CIV_OPPONENT'),
		('CVS_O2E_PLAYER_DECLARES_WAR',							'REQUIRES_PLAYERS_HAVE_MET');
-----------------------------------------------	
-- HistoricalAgendas
-----------------------------------------------	
INSERT INTO HistoricalAgendas
		(LeaderType,						AgendaType)
VALUES	('LEADER_CVS_SHAPUR_I',				'AGENDA_CVS_OXUS_TO_EUPHRATES');
-----------------------------------------------	
-- ExclusiveAgendas
-----------------------------------------------	
INSERT INTO ExclusiveAgendas
		(AgendaOne,							AgendaTwo)
VALUES	('AGENDA_CVS_OXUS_TO_EUPHRATES',	'AGENDA_STANDING_ARMY'),
		('AGENDA_CVS_OXUS_TO_EUPHRATES',	'AGENDA_PARANOID'),
		('AGENDA_CVS_OXUS_TO_EUPHRATES',	'AGENDA_DARWINIST');
-----------------------------------------------
-- AgendaPreferredLeaders
-----------------------------------------------	
INSERT INTO AgendaPreferredLeaders
		(AgendaType,			LeaderType)
VALUES	('AGENDA_CIVILIZED',	'LEADER_CVS_SHAPUR_I');
-----------------------------------------------	
-- ModifierStrings
-----------------------------------------------	
INSERT INTO ModifierStrings
		(ModifierId,										Context,		Text)
VALUES	('AGENDA_CVS_OXUS_TO_EUPHRATES_WAR',				'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_CVS_OXUS_TO_EUPHRATES_STANDING_HIGH',		'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL'),
		('AGENDA_CVS_OXUS_TO_EUPHRATES_STANDING_LOW',		'Sample',		'LOC_TOOLTIP_SAMPLE_DIPLOMACY_ALL');
--=============================================
-- Expac-Only Values
--=============================================
INSERT INTO AgendaPreferredLeaders
		(AgendaType,					LeaderType,					PercentageChance)
SELECT	'AGENDA_CVS_FLIRTATIOUS',		'LEADER_CVS_SHAPUR_I',		15
WHERE EXISTS (SELECT AgendaType FROM Agendas WHERE AgendaType = 'AGENDA_CVS_FLIRTATIOUS')
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
