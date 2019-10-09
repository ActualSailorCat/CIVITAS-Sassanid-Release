--==========================================================================================================================
-- Sassanid / Dynamic Modifiers
--==========================================================================================================================
-----------------------------------------------		
-- Promotion Class Types
-----------------------------------------------
INSERT INTO Types
		(Type,											Kind)
VALUES	('DYNMOD_CVS_SASANIAN_UNIT_CLEAR_TERRAIN_MOVE',	'KIND_MODIFIER'), -- Aswar Promotions
		('DYNMOD_CVS_SASANIAN_UNIT_COMBAT_STR',			'KIND_MODIFIER'), -- Aswar Promotions
		('DYNMOD_CVS_SASANIAN_DISTRICT_GPP',			'KIND_MODIFIER'), -- Sassanid UA
		('DYNMOD_CVS_SASANIAN_DISTRICT_MOD',			'KIND_MODIFIER'), -- Sassanid UA
		('DYNMOD_CVS_SASANIAN_CAPITAL_PROD',			'KIND_MODIFIER'), -- Sassanid UA
		('DYNMOD_CVS_HUNTINGPARK_FEATURES',				'KIND_MODIFIER'); -- Wiškar

INSERT INTO Types
		(Type,											Kind)
SELECT	'DYNMOD_CVS_SASANIAN_UNIT_PROD',				'KIND_MODIFIER' -- Sassanid UA Expac
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- DynamicModifiers
-----------------------------------------------
INSERT INTO DynamicModifiers
		(ModifierType,									CollectionType,					EffectType)
VALUES	-- District Great Person Points
		('DYNMOD_CVS_SASANIAN_DISTRICT_GPP',			'COLLECTION_PLAYER_DISTRICTS',	'EFFECT_ADJUST_DISTRICT_GREAT_PERSON_POINTS'),
		-- Districts Attach Modifier
		('DYNMOD_CVS_SASANIAN_DISTRICT_MOD',			'COLLECTION_OWNER',				'EFFECT_ATTACH_MODIFIER'),
		-- Capital Unit Production
		('DYNMOD_CVS_SASANIAN_CAPITAL_PROD',			'COLLECTION_PLAYER_CAPITAL_CITY',	'EFFECT_ADJUST_CITY_ALL_MILITARY_UNITS_PRODUCTION'),
		-- Hunting Park Feature Adjacency
		('DYNMOD_CVS_HUNTINGPARK_FEATURES',				'COLLECTION_OWNER',				'EFFECT_FEATURE_ADJACENCY'),
		-- Clear Terrain Movement
		('DYNMOD_CVS_SASANIAN_UNIT_CLEAR_TERRAIN_MOVE',	'COLLECTION_OWNER',				'EFFECT_ADJUST_UNIT_CLEAR_TERRAIN_START_MOVEMENT'),
		-- Unit Combat Strength
		('DYNMOD_CVS_SASANIAN_UNIT_COMBAT_STR',			'COLLECTION_UNIT_COMBAT',		'EFFECT_ADJUST_PLAYER_STRENGTH_MODIFIER');

INSERT INTO DynamicModifiers
		(ModifierType,									CollectionType,					EffectType)
SELECT	-- Adjust Unit Production
		'DYNMOD_CVS_SASANIAN_UNIT_PROD',				'COLLECTION_PLAYER_CITIES',		'EFFECT_ADJUST_ALL_UNIT_PRODUCTION_MODIFIER'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');