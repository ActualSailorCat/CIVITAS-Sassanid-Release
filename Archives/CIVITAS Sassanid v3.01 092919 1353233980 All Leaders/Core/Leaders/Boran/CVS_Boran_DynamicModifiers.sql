--==========================================================================================================================
-- Boran / Dynamic Modifiers
--==========================================================================================================================
-----------------------------------------------		
-- Types
-----------------------------------------------
INSERT INTO Types
		(Type,										Kind)
VALUES	('DYNMOD_CVS_BORAN_UA_WONDER_PRODUCTION',	'KIND_MODIFIER'), -- Boran
		('DYNMOD_CVS_BORAN_UA_UNIT_ENVOY_POINTS',	'KIND_MODIFIER'), -- Boran
		('DYNMOD_CVS_BORAN_UA_LEVY_DISCOUNT',		'KIND_MODIFIER'), -- Boran
		('DYNMOD_CVS_DIZ_GRANT_ABILITY',			'KIND_MODIFIER'), -- Diz
		('DYNMOD_CVS_DIZ_ZOC',						'KIND_MODIFIER'); -- Diz
-----------------------------------------------
-- DynamicModifiers
-----------------------------------------------
INSERT INTO DynamicModifiers
		(ModifierType,								CollectionType,						EffectType)
VALUES	-- Wonder Production
		('DYNMOD_CVS_BORAN_UA_WONDER_PRODUCTION',	'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_WONDER_PRODUCTION'),
		-- Influence Points
		('DYNMOD_CVS_BORAN_UA_UNIT_ENVOY_POINTS',	'COLLECTION_OWNER',					'EFFECT_ADJUST_INFLUENCE_POINTS_PER_TURN'),
		-- Levy Discount
		('DYNMOD_CVS_BORAN_UA_LEVY_DISCOUNT',		'COLLECTION_OWNER',					'EFFECT_ADJUST_PLAYER_LEVY_DISCOUNT_PERCENT'),
		-- Grant Ability
		('DYNMOD_CVS_DIZ_GRANT_ABILITY',			'COLLECTION_OWNER',					'EFFECT_GRANT_ABILITY'),
		-- Exert ZOC
		('DYNMOD_CVS_DIZ_ZOC',						'COLLECTION_PLAYER_UNITS',			'EFFECT_ADJUST_UNIT_EXERT_ZOC');