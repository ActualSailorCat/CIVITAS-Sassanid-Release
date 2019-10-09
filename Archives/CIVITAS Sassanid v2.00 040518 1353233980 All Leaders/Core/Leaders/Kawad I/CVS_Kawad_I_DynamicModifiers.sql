--==========================================================================================================================
-- Kawad I / Dynamic Modifiers
--==========================================================================================================================
-----------------------------------------------		
-- Promotion Class Types
-----------------------------------------------
INSERT INTO Types
		(Type,										Kind)
VALUES	('DYNMOD_CVS_TTBAM_GRANT_SPY_SLOT',			'KIND_MODIFIER'), -- Kawad
		('DYNMOD_CVS_TTBAM_GRANT_SPY',				'KIND_MODIFIER'), -- Kawad
		('DYNMOD_CVS_TTBAM_007',					'KIND_MODIFIER'), -- Kawad
		('DYNMOD_CVS_TTBAM_SINGLE_PLOT_YIELD',		'KIND_MODIFIER'); -- Amargar
-----------------------------------------------
-- DynamicModifiers
-----------------------------------------------
INSERT INTO DynamicModifiers
		(ModifierType,							CollectionType,						EffectType)
VALUES	-- Grant Spy Slot
		('DYNMOD_CVS_TTBAM_GRANT_SPY_SLOT',		'COLLECTION_OWNER',					'EFFECT_GRANT_SPY'),
		-- Grant Spy
		('DYNMOD_CVS_TTBAM_GRANT_SPY',			'COLLECTION_PLAYER_CAPITAL_CITY',	'EFFECT_GRANT_UNIT_IN_CITY'),
		-- Hidden Units
		('DYNMOD_CVS_TTBAM_007',				'COLLECTION_PLAYER_UNITS',			'EFFECT_ADJUST_UNIT_HIDDEN_VISIBILITY'),
		-- Single Plot Yield
		('DYNMOD_CVS_TTBAM_SINGLE_PLOT_YIELD',	'COLLECTION_SINGLE_PLOT_YIELDS',	'EFFECT_ADJUST_PLOT_YIELD');