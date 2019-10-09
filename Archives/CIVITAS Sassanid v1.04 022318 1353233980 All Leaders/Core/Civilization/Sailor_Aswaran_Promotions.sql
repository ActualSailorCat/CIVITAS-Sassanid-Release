--==========================================================================================================================
-- Sasanian / Aswar (Promotions)
--==========================================================================================================================
-----------------------------------------------		
-- Promotion Class Types
-----------------------------------------------
INSERT INTO Types
		(Type,										Kind)
VALUES	('PROMOTION_SAILOR_HORNEDSADDLE',			'KIND_PROMOTION'),
		('PROMOTION_SAILOR_MANEUVERING',			'KIND_PROMOTION'),
		('PROMOTION_SAILOR_STORMLIVENED',			'KIND_PROMOTION'),
		('PROMOTION_SAILOR_DESPOIL',				'KIND_PROMOTION'),
		('PROMOTION_SAILOR_IRONFURNACE',			'KIND_PROMOTION'),
		('PROMOTION_SAILOR_SKIRMISHING',			'KIND_PROMOTION'),
		('PROMOTION_SAILOR_NISAEAN_STALLIONS',		'KIND_PROMOTION');
-----------------------------------------------		
-- UnitPromotions
-----------------------------------------------
INSERT INTO UnitPromotions
		(UnitPromotionType,							Name,											Description,										Level,		Column,		Specialization,		PromotionClass)
VALUES	-- Tier 1
		('PROMOTION_SAILOR_HORNEDSADDLE',			'LOC_PROMOTION_SAILOR_TIER_1_HEAVY_NAME',		'LOC_PROMOTION_SAILOR_TIER_1_HEAVY_DESCRIPTION',	1,			1,			'',					'PROMOTION_CLASS_SAILOR_ASWAR'),
		('PROMOTION_SAILOR_MANEUVERING',			'LOC_PROMOTION_SAILOR_TIER_1_LIGHT_NAME',		'LOC_PROMOTION_SAILOR_TIER_1_LIGHT_DESCRIPTION',	1,			3,			'',					'PROMOTION_CLASS_SAILOR_ASWAR'),
		-- Tier 2
		('PROMOTION_SAILOR_STORMLIVENED',			'LOC_PROMOTION_SAILOR_TIER_2_HEAVY_NAME',		'LOC_PROMOTION_SAILOR_TIER_2_HEAVY_DESCRIPTION',	2,			1,			'',					'PROMOTION_CLASS_SAILOR_ASWAR'),
		('PROMOTION_SAILOR_DESPOIL',				'LOC_PROMOTION_SAILOR_TIER_2_LIGHT_NAME',		'LOC_PROMOTION_SAILOR_TIER_2_LIGHT_DESCRIPTION',	2,			3,			'',					'PROMOTION_CLASS_SAILOR_ASWAR'),
		-- Tier 3
		('PROMOTION_SAILOR_IRONFURNACE',			'LOC_PROMOTION_SAILOR_TIER_3_HEAVY_NAME',		'LOC_PROMOTION_SAILOR_TIER_3_HEAVY_DESCRIPTION',	3,			1,			'',					'PROMOTION_CLASS_SAILOR_ASWAR'),
		('PROMOTION_SAILOR_SKIRMISHING',			'LOC_PROMOTION_SAILOR_TIER_3_LIGHT_NAME',		'LOC_PROMOTION_SAILOR_TIER_3_LIGHT_DESCRIPTION',	3,			3,			'',					'PROMOTION_CLASS_SAILOR_ASWAR'),
		-- Tier 4
		('PROMOTION_SAILOR_NISAEAN_STALLIONS',		'LOC_PROMOTION_SAILOR_TIER_4_HEAVYLIGHT_NAME',	'LOC_PROMOTION_SAILOR_TIER_4_HEAVYLIGHT_DESCRIPTION',	4,			2,			'',				'PROMOTION_CLASS_SAILOR_ASWAR');
-----------------------------------------------		
-- UnitPromotionPrereqs
-----------------------------------------------
INSERT INTO UnitPromotionPrereqs
		(UnitPromotion,								PrereqUnitPromotion)
VALUES	('PROMOTION_SAILOR_STORMLIVENED',			'PROMOTION_SAILOR_HORNEDSADDLE'),
		('PROMOTION_SAILOR_DESPOIL',				'PROMOTION_SAILOR_MANEUVERING'),
		('PROMOTION_SAILOR_IRONFURNACE',			'PROMOTION_SAILOR_DESPOIL'),
		('PROMOTION_SAILOR_IRONFURNACE',			'PROMOTION_SAILOR_STORMLIVENED'),
		('PROMOTION_SAILOR_SKIRMISHING',			'PROMOTION_SAILOR_DESPOIL'),
		('PROMOTION_SAILOR_SKIRMISHING',			'PROMOTION_SAILOR_STORMLIVENED'),
		('PROMOTION_SAILOR_NISAEAN_STALLIONS',		'PROMOTION_SAILOR_SKIRMISHING'),
		('PROMOTION_SAILOR_NISAEAN_STALLIONS',		'PROMOTION_SAILOR_IRONFURNACE');
-----------------------------------------------		
-- UnitPromotionModifiers
-----------------------------------------------
INSERT INTO UnitPromotionModifiers
		(UnitPromotionType,							ModifierId)
VALUES	('PROMOTION_SAILOR_HORNEDSADDLE',			'SAILOR_HORNEDSADDLE_MOD'),
		('PROMOTION_SAILOR_MANEUVERING',			'SAILOR_MANEUVERING_MOD'),

		('PROMOTION_SAILOR_STORMLIVENED',			'SAILOR_STORMLIVENED_MOD'),
		('PROMOTION_SAILOR_DESPOIL',				'SAILOR_DESPOIL_MOD'),

		('PROMOTION_SAILOR_IRONFURNACE',			'SAILOR_IRONFURNACE_MOD'),
		('PROMOTION_SAILOR_SKIRMISHING',			'SAILOR_SKIRMISHING_MOD'),

		('PROMOTION_SAILOR_NISAEAN_STALLIONS',		'SAILOR_NISAEAN_STALLIONS_MOD');
-----------------------------------------------		
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,									ModifierType,												SubjectRequirementSetId)
VALUES	('SAILOR_HORNEDSADDLE_MOD',						'DYNMOD_SAILOR_UNIT_COMBAT_STR',							'CHARGE_REQUIREMENTS'),
		('SAILOR_MANEUVERING_MOD',						'DYNMOD_SAILOR_UNIT_COMBAT_STR',							'CAPARISON_REQUIREMENTS'),
		('SAILOR_STORMLIVENED_MOD',						'MODIFIER_PLAYER_UNIT_ADJUST_FLANKING_BONUS_MODIFIER',		null),
		('SAILOR_DESPOIL_MOD',							'MODIFIER_PLAYER_UNIT_ADJUST_ADVANCED_PILLAGING',			null),
		('SAILOR_IRONFURNACE_MOD',						'DYNMOD_SAILOR_UNIT_COMBAT_STR',							'REACTIVE_ARMOR_REQUIREMENTS'),
		('SAILOR_SKIRMISHING_MOD',						'DYNMOD_SAILOR_UNIT_CLEAR_TERRAIN_MOVE',					null),
		('SAILOR_NISAEAN_STALLIONS_MOD',				'MODIFIER_UNIT_ADJUST_NUM_ATTACKS',							null);
-----------------------------------------------		
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,							Name,					Value)
VALUES	('SAILOR_SKIRMISHING_MOD',				'Amount',				2),
		('SAILOR_HORNEDSADDLE_MOD',				'Amount',				10),
		('SAILOR_MANEUVERING_MOD',				'Amount',				5),
		('SAILOR_STORMLIVENED_MOD',				'Percent',				100),			
		('SAILOR_DESPOIL_MOD',					'UseAdvancedPillaging',	1),
		('SAILOR_IRONFURNACE_MOD',				'Amount',				7),
		('SAILOR_NISAEAN_STALLIONS_MOD',		'Amount',				1);	
-----------------------------------------------
-- ModifierStrings
-----------------------------------------------
INSERT INTO ModifierStrings
		(ModifierId,						Context,				Text)
VALUES	('SAILOR_HORNEDSADDLE_MOD',			'Preview',				"+{1_Amount} {LOC_PROMOTION_SAILOR_TIER_1_HEAVY_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}"),
		('SAILOR_MANEUVERING_MOD',			'Preview',				"+{1_Amount} {LOC_PROMOTION_SAILOR_TIER_1_LIGHT_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}"),
		('SAILOR_IRONFURNACE_MOD',			'Preview',				"+{1_Amount} {LOC_PROMOTION_SAILOR_TIER_3_HEAVY_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}");