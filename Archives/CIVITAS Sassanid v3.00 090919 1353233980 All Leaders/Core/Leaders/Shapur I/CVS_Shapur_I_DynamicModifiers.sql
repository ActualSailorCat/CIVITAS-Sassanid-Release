--==========================================================================================================================
-- Shapur I / Dynamic Modifiers
--==========================================================================================================================
-----------------------------------------------		
-- Types
-----------------------------------------------
INSERT INTO Types
		(Type,									Kind)
VALUES	('DYNMOD_CVS_SHAPUR_MOVEMENT',			'KIND_MODIFIER'),
		('DYNMOD_CVS_SHAPUR_GPP',				'KIND_MODIFIER'),
		('DYNMOD_CVS_SHAPUR_UNIT_HEAL',			'KIND_MODIFIER');
-----------------------------------------------
-- DynamicModifiers
-----------------------------------------------
INSERT INTO DynamicModifiers
		(ModifierType,							CollectionType,					EffectType)
VALUES	-- Movement All
		('DYNMOD_CVS_SHAPUR_MOVEMENT',			'COLLECTION_OWNER',				'EFFECT_ADJUST_UNIT_MOVEMENT'),
		-- GPP
		('DYNMOD_CVS_SHAPUR_GPP',				'COLLECTION_OWNER',				'EFFECT_ADJUST_GREAT_PEOPLE_POINTS_PER_KILL'),
		-- Unit Heal
		('DYNMOD_CVS_SHAPUR_UNIT_HEAL',			'COLLECTION_PLAYER_UNITS',		'EFFECT_ADJUST_UNIT_DAMAGE');