--==========================================================================================================================
-- Sassanid / Aswar (Unit)
--==========================================================================================================================
-----------------------------------------------	
-- Tags
-----------------------------------------------	
INSERT INTO Types
		(Type,									Kind)
VALUES	('PROMOTION_CLASS_CVS_ASWAR',			'KIND_PROMOTION_CLASS');
-----------------------------------------------	
-- Tags
-----------------------------------------------	
INSERT INTO Tags
		(Tag,									Vocabulary)
VALUES	('CLASS_CVS_ASWAR',						'ABILITY_CLASS');
-----------------------------------------------	
-- TypeTags
-----------------------------------------------	
INSERT INTO TypeTags
		(Type,									Tag)
VALUES	('UNIT_CVS_ASWAR',						'CLASS_CVS_ASWAR'),
		('UNIT_CVS_ASWAR',						'CLASS_HEAVY_CAVALRY'),
		('ABILITY_CVS_ASWAR_ATTACKNMOVE',		'CLASS_CVS_ASWAR'),
		('ABILITY_CVS_ASWAR_RANGEDDEFENSE',		'CLASS_CVS_ASWAR');
-----------------------------------------------		
-- Promotion Classes
-----------------------------------------------
INSERT INTO UnitPromotionClasses
		(PromotionClassType,					Name)
VALUES	('PROMOTION_CLASS_CVS_ASWAR',			'LOC_PROMOTION_CLASS_CVS_ASWAR_NAME');
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
		StrategicResource,
		PurchaseYield,
		AdvisorType,
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
SELECT	'UNIT_CVS_ASWAR',	-- UnitType
		'LOC_UNIT_CVS_ASWAR_NAME',	-- Name
		'LOC_UNIT_CVS_ASWAR_DESCRIPTION', -- Description
		'TRAIT_CIVILIZATION_UNIT_CVS_ASWAR', -- TraitType
		BaseMoves,
		Cost - 30,
		StrategicResource,
		PurchaseYield,
		AdvisorType,
		Combat - 5,
		BaseSightRange,
		ZoneOfControl,
		Domain,
		FormationClass,
		'PROMOTION_CLASS_CVS_ASWAR', -- PromotionClass
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
SELECT 	'UNIT_CVS_ASWAR',	UpgradeUnit
FROM UnitUpgrades WHERE Unit = 'UNIT_HORSEMAN';
-----------------------------------------------
-- UnitAiInfos
-----------------------------------------------
INSERT INTO UnitAiInfos
		(UnitType,			AiType)
VALUES 	('UNIT_CVS_ASWAR',	'UNITAI_COMBAT'),
		('UNIT_CVS_ASWAR',	'UNITAI_EXPLORE'),
		('UNIT_CVS_ASWAR',	'UNITTYPE_LAND_COMBAT'),
		('UNIT_CVS_ASWAR',	'UNITTYPE_MELEE'),
		('UNIT_CVS_ASWAR',	'UNITTYPE_CAVALRY');
-----------------------------------------------
-- Types
-----------------------------------------------
INSERT INTO Types
		(Type,									Kind)
VALUES	('ABILITY_CVS_ASWAR_ATTACKNMOVE',		'KIND_ABILITY'),
		('ABILITY_CVS_ASWAR_RANGEDDEFENSE',		'KIND_ABILITY');
-----------------------------------------------
-- UnitAbilities
-----------------------------------------------
INSERT INTO UnitAbilities
		(UnitAbilityType,						Name,											Description)
VALUES	('ABILITY_CVS_ASWAR_ATTACKNMOVE',		'LOC_ABILITY_CVS_ASWAR_ATTACKNMOVE_NAME',		'LOC_ABILITY_CVS_ASWAR_ATTACKNMOVE_DESCRIPTION'),
		('ABILITY_CVS_ASWAR_RANGEDDEFENSE',		'LOC_ABILITY_CVS_ASWAR_RANGEDDEFENSE_NAME',		'LOC_ABILITY_CVS_ASWAR_RANGEDDEFENSE_DESCRIPTION');
-----------------------------------------------
--  UnitAbilityModifiers
-----------------------------------------------
INSERT INTO UnitAbilityModifiers
		(UnitAbilityType,						ModifierId)
VALUES	('ABILITY_CVS_ASWAR_ATTACKNMOVE',		'ABILITY_CVS_ASWAR_ATTACKNMOVE_MOD'),
		('ABILITY_CVS_ASWAR_RANGEDDEFENSE',		'ABILITY_CVS_ASWAR_RANGEDDEFENSE_MOD');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO	Modifiers
		(ModifierId,							ModifierType,									SubjectRequirementSetId)
VALUES	('ABILITY_CVS_ASWAR_ATTACKNMOVE_MOD',	'MODIFIER_PLAYER_UNIT_ADJUST_ATTACK_AND_MOVE',	null),
		('ABILITY_CVS_ASWAR_RANGEDDEFENSE_MOD',	'DYNMOD_CVS_SASANIAN_UNIT_COMBAT_STR',					'TORTOISE_REQUIREMENTS');
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO	ModifierArguments
		(ModifierId,							Name,		Value)
VALUES	('ABILITY_CVS_ASWAR_ATTACKNMOVE_MOD',	'CanMove',	1),
		('ABILITY_CVS_ASWAR_RANGEDDEFENSE_MOD',	'Amount',	7);
-----------------------------------------------
-- ModifierStrings
-----------------------------------------------
INSERT INTO ModifierStrings
		(ModifierId,							Context,	Text)
VALUES	('ABILITY_CVS_ASWAR_RANGEDDEFENSE_MOD',	'Preview',	'LOC_ABILITY_CVS_ASWAR_RANGEDDEFENSE_PREVIEW_TEXT');

