--==========================================================================================================================
-- Shapur I / Daylamite Mercenary by CIVITAS
--==========================================================================================================================
-----------------------------------------------	
-- Tags
-----------------------------------------------	
INSERT INTO Tags
		(Tag,							Vocabulary)
VALUES	('CLASS_CVS_SHAPUR_I_UU',		'ABILITY_CLASS');
-----------------------------------------------	
-- TypeTags
-----------------------------------------------	
INSERT INTO TypeTags
		(Type,										Tag)
VALUES	('UNIT_CVS_SHAPUR_I_UU',					'CLASS_CVS_SHAPUR_I_UU'),
		('UNIT_CVS_SHAPUR_I_UU',					'CLASS_MELEE'),
		('ABILITY_IGNORE_CROSSING_RIVERS_COST',		'CLASS_CVS_SHAPUR_I_UU'),
		('ABILITY_CVS_SHAPUR_I_UU_HILL',			'CLASS_CVS_SHAPUR_I_UU');
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
		Combat,
		BaseSightRange,
		ZoneOfControl,
		Domain,
		FormationClass,
		PromotionClass,
		Maintenance,
		PrereqTech,
		MustPurchase
		)
SELECT	'UNIT_CVS_SHAPUR_I_UU',	-- UnitType
		'LOC_UNIT_CVS_SHAPUR_I_UU_NAME',	-- Name
		'LOC_UNIT_CVS_SHAPUR_I_UU_DESCRIPTION', -- Description
		'TRAIT_LEADER_UNIT_CVS_SHAPUR_I_UU', -- TraitType
		BaseMoves,
		Cost,
		PurchaseYield,
		AdvisorType,
		Combat,
		BaseSightRange,
		ZoneOfControl,
		Domain,
		FormationClass,
		PromotionClass,
		Maintenance,
		PrereqTech,
		MustPurchase
FROM	Units
WHERE	UnitType = 'UNIT_SWORDSMAN';
-----------------------------------------------
-- UnitUpgrades
-----------------------------------------------
INSERT INTO UnitUpgrades
		(Unit,					UpgradeUnit)
SELECT 	'UNIT_CVS_SHAPUR_I_UU',	UpgradeUnit
FROM UnitUpgrades WHERE Unit = 'UNIT_SWORDSMAN';
-----------------------------------------------
-- UnitUpgrades
-----------------------------------------------
INSERT INTO UnitReplaces
		(CivUniqueUnitType,			ReplacesUnitType)
VALUES	('UNIT_CVS_SHAPUR_I_UU',	'UNIT_SWORDSMAN');
-----------------------------------------------
-- UnitAiInfos
-----------------------------------------------
INSERT INTO UnitAiInfos
		(UnitType,					AiType)
SELECT	'UNIT_CVS_SHAPUR_I_UU',	AiType
FROM UnitAiInfos WHERE UnitType = 'UNIT_SWORDSMAN';
-----------------------------------------------
-- Types
-----------------------------------------------
INSERT INTO Types
		(Type,										Kind)
VALUES	('ABILITY_CVS_SHAPUR_I_UU_HILL',			'KIND_ABILITY');
-----------------------------------------------
-- UnitAbilities
-----------------------------------------------
INSERT INTO UnitAbilities
		(UnitAbilityType,							Name,										Description)
VALUES	('ABILITY_CVS_SHAPUR_I_UU_HILL',			'LOC_ABILITY_CVS_SHAPUR_I_UU_HILL_NAME',	'LOC_ABILITY_CVS_SHAPUR_I_UU_HILL_DESCRIPTION');
-----------------------------------------------
--  UnitAbilityModifiers
-----------------------------------------------
INSERT INTO UnitAbilityModifiers
		(UnitAbilityType,							ModifierId)
VALUES	('ABILITY_CVS_SHAPUR_I_UU_HILL',			'MOD_IGNORE_TERRAIN_COST');