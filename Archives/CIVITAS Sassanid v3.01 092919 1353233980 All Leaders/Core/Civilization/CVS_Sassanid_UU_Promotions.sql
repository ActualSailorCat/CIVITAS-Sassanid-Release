--==========================================================================================================================
-- Sassanid / Aswar (Promotions)
--==========================================================================================================================
-----------------------------------------------		
-- Promotion Class Types
-----------------------------------------------
INSERT INTO Types
		(Type,									Kind)
VALUES	('PROMOTION_CVS_HORNEDSADDLE',			'KIND_PROMOTION'),
		('PROMOTION_CVS_MANEUVERING',			'KIND_PROMOTION'),
		('PROMOTION_CVS_STORMLIVENED',			'KIND_PROMOTION'),
		('PROMOTION_CVS_DESPOIL',				'KIND_PROMOTION'),
		('PROMOTION_CVS_IRONFURNACE',			'KIND_PROMOTION'),
		('PROMOTION_CVS_SKIRMISHING',			'KIND_PROMOTION'),
		('PROMOTION_CVS_NISAEAN_STALLIONS',		'KIND_PROMOTION');
-----------------------------------------------		
-- UnitPromotions
-----------------------------------------------
INSERT INTO UnitPromotions
		(UnitPromotionType,						Name,										Description,									Level,		Column,		Specialization,		PromotionClass)
VALUES	-- Tier 1
		('PROMOTION_CVS_HORNEDSADDLE',			'LOC_PROMOTION_CVS_TIER_1_HEAVY_NAME',		'LOC_PROMOTION_CVS_TIER_1_HEAVY_DESCRIPTION',	1,			1,			'',					'PROMOTION_CLASS_CVS_ASWAR'),
		('PROMOTION_CVS_MANEUVERING',			'LOC_PROMOTION_CVS_TIER_1_LIGHT_NAME',		'LOC_PROMOTION_CVS_TIER_1_LIGHT_DESCRIPTION',	1,			3,			'',					'PROMOTION_CLASS_CVS_ASWAR'),
		-- Tier 2
		('PROMOTION_CVS_STORMLIVENED',			'LOC_PROMOTION_CVS_TIER_2_HEAVY_NAME',		'LOC_PROMOTION_CVS_TIER_2_HEAVY_DESCRIPTION',	2,			1,			'',					'PROMOTION_CLASS_CVS_ASWAR'),
		('PROMOTION_CVS_DESPOIL',				'LOC_PROMOTION_CVS_TIER_2_LIGHT_NAME',		'LOC_PROMOTION_CVS_TIER_2_LIGHT_DESCRIPTION',	2,			3,			'',					'PROMOTION_CLASS_CVS_ASWAR'),
		-- Tier 3
		('PROMOTION_CVS_IRONFURNACE',			'LOC_PROMOTION_CVS_TIER_3_HEAVY_NAME',		'LOC_PROMOTION_CVS_TIER_3_HEAVY_DESCRIPTION',	3,			1,			'',					'PROMOTION_CLASS_CVS_ASWAR'),
		('PROMOTION_CVS_SKIRMISHING',			'LOC_PROMOTION_CVS_TIER_3_LIGHT_NAME',		'LOC_PROMOTION_CVS_TIER_3_LIGHT_DESCRIPTION',	3,			3,			'',					'PROMOTION_CLASS_CVS_ASWAR'),
		-- Tier 4
		('PROMOTION_CVS_NISAEAN_STALLIONS',		'LOC_PROMOTION_CVS_TIER_4_HEAVYLIGHT_NAME',	'LOC_PROMOTION_CVS_TIER_4_HEAVYLIGHT_DESCRIPTION',	4,			2,			'',				'PROMOTION_CLASS_CVS_ASWAR');
-----------------------------------------------		
-- UnitPromotionPrereqs
-----------------------------------------------
INSERT INTO UnitPromotionPrereqs
		(UnitPromotion,							PrereqUnitPromotion)
VALUES	('PROMOTION_CVS_STORMLIVENED',			'PROMOTION_CVS_HORNEDSADDLE'),
		('PROMOTION_CVS_DESPOIL',				'PROMOTION_CVS_MANEUVERING'),
		('PROMOTION_CVS_IRONFURNACE',			'PROMOTION_CVS_DESPOIL'),
		('PROMOTION_CVS_IRONFURNACE',			'PROMOTION_CVS_STORMLIVENED'),
		('PROMOTION_CVS_SKIRMISHING',			'PROMOTION_CVS_DESPOIL'),
		('PROMOTION_CVS_SKIRMISHING',			'PROMOTION_CVS_STORMLIVENED'),
		('PROMOTION_CVS_NISAEAN_STALLIONS',		'PROMOTION_CVS_SKIRMISHING'),
		('PROMOTION_CVS_NISAEAN_STALLIONS',		'PROMOTION_CVS_IRONFURNACE');
-----------------------------------------------		
-- UnitPromotionModifiers
-----------------------------------------------
INSERT INTO UnitPromotionModifiers
		(UnitPromotionType,						ModifierId)
VALUES	('PROMOTION_CVS_HORNEDSADDLE',			'CVS_HORNEDSADDLE_MOD'),
		('PROMOTION_CVS_MANEUVERING',			'CVS_MANEUVERING_MOD'),

		('PROMOTION_CVS_STORMLIVENED',			'CVS_STORMLIVENED_MOD'),
		('PROMOTION_CVS_DESPOIL',				'CVS_DESPOIL_MOD'),

		('PROMOTION_CVS_IRONFURNACE',			'CVS_IRONFURNACE_MOD'),
		('PROMOTION_CVS_SKIRMISHING',			'CVS_SKIRMISHING_MOD'),

		('PROMOTION_CVS_NISAEAN_STALLIONS',		'CVS_NISAEAN_STALLIONS_MOD');
-----------------------------------------------		
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,							ModifierType,												SubjectRequirementSetId)
VALUES	('CVS_HORNEDSADDLE_MOD',				'DYNMOD_CVS_SASANIAN_UNIT_COMBAT_STR',						'CHARGE_REQUIREMENTS'),
		('CVS_MANEUVERING_MOD',					'DYNMOD_CVS_SASANIAN_UNIT_COMBAT_STR',						'CAPARISON_REQUIREMENTS'),
		('CVS_STORMLIVENED_MOD',				'MODIFIER_PLAYER_UNIT_ADJUST_FLANKING_BONUS_MODIFIER',		null),
		('CVS_DESPOIL_MOD',						'MODIFIER_PLAYER_UNIT_ADJUST_ADVANCED_PILLAGING',			null),
		('CVS_IRONFURNACE_MOD',					'DYNMOD_CVS_SASANIAN_UNIT_COMBAT_STR',						'REACTIVE_ARMOR_REQUIREMENTS'),
		('CVS_SKIRMISHING_MOD',					'DYNMOD_CVS_SASANIAN_UNIT_CLEAR_TERRAIN_MOVE',				null),
		('CVS_NISAEAN_STALLIONS_MOD',			'MODIFIER_UNIT_ADJUST_NUM_ATTACKS',							null);
-----------------------------------------------		
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,							Name,					Value)
VALUES	('CVS_SKIRMISHING_MOD',					'Amount',				2),
		('CVS_HORNEDSADDLE_MOD',				'Amount',				10),
		('CVS_MANEUVERING_MOD',					'Amount',				5),
		('CVS_STORMLIVENED_MOD',				'Percent',				100),			
		('CVS_DESPOIL_MOD',						'UseAdvancedPillaging',	1),
		('CVS_IRONFURNACE_MOD',					'Amount',				7),
		('CVS_NISAEAN_STALLIONS_MOD',			'Amount',				1);	
-----------------------------------------------
-- ModifierStrings
-----------------------------------------------
INSERT INTO ModifierStrings
		(ModifierId,							Context,				Text)
VALUES	('CVS_HORNEDSADDLE_MOD',				'Preview',				"+{1_Amount} {LOC_PROMOTION_CVS_TIER_1_HEAVY_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}"),
		('CVS_MANEUVERING_MOD',					'Preview',				"+{1_Amount} {LOC_PROMOTION_CVS_TIER_1_LIGHT_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}"),
		('CVS_IRONFURNACE_MOD',					'Preview',				"+{1_Amount} {LOC_PROMOTION_CVS_TIER_3_HEAVY_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}");