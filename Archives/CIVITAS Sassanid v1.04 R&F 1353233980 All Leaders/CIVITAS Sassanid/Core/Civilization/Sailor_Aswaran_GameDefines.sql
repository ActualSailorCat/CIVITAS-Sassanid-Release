--==========================================================================================================================
-- Sasanian / Aswar (Unit)
--==========================================================================================================================
-----------------------------------------------	
-- Tags
-----------------------------------------------	
INSERT INTO Types
		(Type,								Kind)
VALUES	('PROMOTION_CLASS_SAILOR_ASWAR',	'KIND_PROMOTION_CLASS');
-----------------------------------------------	
-- Tags
-----------------------------------------------	
INSERT INTO Tags
		(Tag,							Vocabulary)
VALUES	('CLASS_SAILOR_ASWAR',			'ABILITY_CLASS');
-----------------------------------------------	
-- TypeTags
-----------------------------------------------	
INSERT INTO TypeTags
		(Type,									Tag)
VALUES	('UNIT_SAILOR_ASWAR',					'CLASS_SAILOR_ASWAR'),
		('UNIT_SAILOR_ASWAR',					'CLASS_HEAVY_CAVALRY'),
		('ABILITY_SAILOR_ASWAR_FREE_PROMO',		'CLASS_SAILOR_ASWAR'),
		('ABILITY_SAILOR_ASWAR_RANGEDDEFENSE',	'CLASS_SAILOR_ASWAR');
-----------------------------------------------		
-- Promotion Classes
-----------------------------------------------
INSERT INTO UnitPromotionClasses
		(PromotionClassType,					Name)
VALUES	('PROMOTION_CLASS_SAILOR_ASWAR',		'LOC_PROMOTION_CLASS_SAILOR_ASWAR_NAME');
-----------------------------------------------
-- Units
-----------------------------------------------
INSERT INTO Units	(
		UnitType,
		Name,
		Description,
		TraitType,
		BaseMoves,
		Cost,
		PurchaseYield,
		AdvisorType,
		RangedCombat,
		Range,
		Combat,
		BaseSightRange,
		ZoneOfControl,
		Domain,
		FormationClass,
		PromotionClass,
		Maintenance,
		MandatoryObsoleteTech,
		PrereqCivic
		)
SELECT	'UNIT_SAILOR_ASWAR',	-- UnitType
		'LOC_UNIT_SAILOR_ASWAR_NAME',	-- Name
		'LOC_UNIT_SAILOR_ASWAR_DESCRIPTION', -- Description
		'TRAIT_CIVILIZATION_UNIT_SAILOR_ASWAR', -- TraitType
		3, -- BaseMoves
		Cost,
		PurchaseYield,
		AdvisorType,
		35, -- RangedCombat
		2, -- Range
		43, -- Combat
		BaseSightRange,
		ZoneOfControl,
		Domain,
		FormationClass,
		'PROMOTION_CLASS_SAILOR_ASWAR', -- PromotionClass
		Maintenance,
		MandatoryObsoleteTech,
		'CIVIC_FEUDALISM'
FROM	Units
WHERE	UnitType = 'UNIT_KNIGHT';
-----------------------------------------------
-- UnitUpgrades
-----------------------------------------------
INSERT INTO UnitUpgrades
		(Unit,					UpgradeUnit)
SELECT 	'UNIT_SAILOR_ASWAR',	UpgradeUnit
FROM UnitUpgrades WHERE Unit = 'UNIT_KNIGHT';
-----------------------------------------------
-- UnitAiInfos
-----------------------------------------------
INSERT INTO UnitAiInfos
		(UnitType,				AiType)
VALUES 	('UNIT_SAILOR_ASWAR',	'UNITAI_COMBAT'),
		('UNIT_SAILOR_ASWAR',	'UNITAI_EXPLORE'),
		('UNIT_SAILOR_ASWAR',	'UNITTYPE_LAND_COMBAT'),
		('UNIT_SAILOR_ASWAR',	'UNITTYPE_RANGED'),
		('UNIT_SAILOR_ASWAR',	'UNITTYPE_MELEE');
-----------------------------------------------
-- Types
-----------------------------------------------
INSERT INTO Types
		(Type,									Kind)
VALUES	--('ABILITY_SAILOR_ASWAR_GGP',			'KIND_ABILITY'),
		('ABILITY_SAILOR_ASWAR_FREE_PROMO',		'KIND_ABILITY'),
		('ABILITY_SAILOR_ASWAR_RANGEDDEFENSE',	'KIND_ABILITY');
-----------------------------------------------
-- UnitAbilities
-----------------------------------------------
INSERT INTO UnitAbilities
		(UnitAbilityType,						Name,										Description)
VALUES	--('ABILITY_SAILOR_ASWAR_GGP',			'LOC_ABILITY_SAILOR_ASWAR_GGP_NAME',			'LOC_ABILITY_SAILOR_ASWAR_GGP_DESCRIPTION'),
		('ABILITY_SAILOR_ASWAR_FREE_PROMO',		'LOC_ABILITY_SAILOR_ASWAR_FREE_PROMO_NAME',			'LOC_ABILITY_SAILOR_ASWAR_FREE_PROMO_DESCRIPTION'),
		('ABILITY_SAILOR_ASWAR_RANGEDDEFENSE',	'LOC_ABILITY_SAILOR_ASWAR_RANGEDDEFENSE_NAME',	'LOC_ABILITY_SAILOR_ASWAR_RANGEDDEFENSE_DESCRIPTION');
-----------------------------------------------
--  UnitAbilityModifiers
-----------------------------------------------
INSERT INTO UnitAbilityModifiers
		(UnitAbilityType,							ModifierId)
VALUES	--('ABILITY_SAILOR_ASWAR_GGP',				'ABILITY_SAILOR_ASWAR_GGP_MOD'),
		('ABILITY_SAILOR_ASWAR_FREE_PROMO',			'ABILITY_SAILOR_ASWAR_FREE_PROMO_MOD'),
		('ABILITY_SAILOR_ASWAR_RANGEDDEFENSE',		'ABILITY_SAILOR_ASWAR_RANGEDDEFENSE_MOD');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO	Modifiers
		(ModifierId,								ModifierType,									SubjectRequirementSetId)
VALUES	--('ABILITY_SAILOR_ASWAR_GGP_MOD',			'MODIFIER_PLAYER_UNIT_ADJUST_GREAT_PEOPLE_POINTS_PER_KILL',		null),
		('ABILITY_SAILOR_ASWAR_FREE_PROMO_MOD',		'MODIFIER_PLAYER_UNIT_ADJUST_GRANT_EXPERIENCE',	null),
		('ABILITY_SAILOR_ASWAR_RANGEDDEFENSE_MOD',	'DYNMOD_SAILOR_UNIT_COMBAT_STR',	'TORTOISE_REQUIREMENTS');
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO	ModifierArguments
		(ModifierId,								Name,					Value)
VALUES	--('ABILITY_SAILOR_ASWAR_GGP_MOD',			'GreatPersonClassType',	'GREAT_PERSON_CLASS_GENERAL'),
		--('ABILITY_SAILOR_ASWAR_GGP_MOD',			'Amount',				5),
		('ABILITY_SAILOR_ASWAR_FREE_PROMO_MOD',		'Amount',				-1),
		('ABILITY_SAILOR_ASWAR_RANGEDDEFENSE_MOD',	'Amount',				10);
-----------------------------------------------
-- ModifierStrings
-----------------------------------------------
INSERT INTO ModifierStrings
		(ModifierId,								Context,	Text)
VALUES	('ABILITY_SAILOR_ASWAR_RANGEDDEFENSE_MOD',	'Preview',	'LOC_ABILITY_SAILOR_ASWAR_RANGEDDEFENSE_PREVIEW_TEXT');

