--==========================================================================================================================
-- Boran / Diz (Improvement)
--==========================================================================================================================
-----------------------------------------------
-- Improvements
-----------------------------------------------
INSERT INTO Improvements	(
		ImprovementType,
		Name,		
		Description,
		TraitType,
		Icon,
		PrereqCivic,
		Buildable,
		PlunderType,
		TilesRequired,
		SameAdjacentValid,
		Domain,		
		GrantFortification,
		DefenseModifier,
		CanBuildOutsideTerritory
		)
VALUES  (
		'IMPROVEMENT_CVS_DIZ', -- ImprovementType
		'LOC_IMPROVEMENT_CVS_DIZ_NAME', -- Name		
		'LOC_IMPROVEMENT_CVS_DIZ_DESCRIPTION', -- Description
		'TRAIT_LEADER_IMPROVEMENT_CVS_DIZ', -- TraitType
		'ICON_IMPROVEMENT_CVS_DIZ', -- Icon
		'CIVIC_DEFENSIVE_TACTICS', -- PrereqCivic
		1, -- Buildable
		'NO_PLUNDER',
		1, -- TilesRequired
		0, -- SameAdjacentValid
		'DOMAIN_LAND', -- Domain
		2, -- GrantFortification
		4, -- DefenseModifier
		1 -- CanBuildOutsideTerritory
		);
-----------------------------------------------
-- Improvement_ValidBuildUnits
-----------------------------------------------
INSERT INTO Improvement_ValidBuildUnits
		(ImprovementType,			UnitType)
VALUES	('IMPROVEMENT_CVS_DIZ',		'UNIT_BUILDER');
-----------------------------------------------
-- Improvement_ValidTerrains
-----------------------------------------------
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,			TerrainType)
VALUES	('IMPROVEMENT_CVS_DIZ',		'TERRAIN_GRASS'),
		('IMPROVEMENT_CVS_DIZ',		'TERRAIN_PLAINS'),
		('IMPROVEMENT_CVS_DIZ',		'TERRAIN_TUNDRA'),
		('IMPROVEMENT_CVS_DIZ',		'TERRAIN_DESERT'),
		('IMPROVEMENT_CVS_DIZ',		'TERRAIN_SNOW'),
		('IMPROVEMENT_CVS_DIZ',		'TERRAIN_GRASS_HILLS'),
		('IMPROVEMENT_CVS_DIZ',		'TERRAIN_PLAINS_HILLS'),
		('IMPROVEMENT_CVS_DIZ',		'TERRAIN_TUNDRA_HILLS'),
		('IMPROVEMENT_CVS_DIZ',		'TERRAIN_DESERT_HILLS'),
		('IMPROVEMENT_CVS_DIZ',		'TERRAIN_SNOW_HILLS');
-----------------------------------------------
-- Improvement_YieldChanges
-----------------------------------------------
INSERT INTO Improvement_YieldChanges
		(ImprovementType,			YieldType,			YieldChange)
VALUES	('IMPROVEMENT_CVS_DIZ',		'YIELD_PRODUCTION',	1),
		('IMPROVEMENT_CVS_DIZ',		'YIELD_CULTURE',	1);
-----------------------------------------------
-- Improvement_BonusYieldChanges
-----------------------------------------------
INSERT INTO Improvement_BonusYieldChanges
		(Id,	ImprovementType,				YieldType,				BonusYieldChange,	PrereqCivic)
VALUES	(651,	'IMPROVEMENT_CVS_DIZ',			'YIELD_PRODUCTION',		1,					'CIVIC_MERCANTILISM'),
		(652,	'IMPROVEMENT_CVS_DIZ',			'YIELD_CULTURE',		1,					'CIVIC_MERCANTILISM');
-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT INTO	TraitModifiers
		(TraitType,								ModifierId)
VALUES	('TRAIT_LEADER_IMPROVEMENT_CVS_DIZ',	'CVS_DIZ_BORAN_UNLOCK'),
		('TRAIT_LEADER_CVS_BORAN_UA',			'CVS_DIZ_EXERT_ZOC');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO	Modifiers
		(ModifierId,							ModifierType,									SubjectRequirementSetId)
VALUES	-- Unlock Diz
		('CVS_DIZ_BORAN_UNLOCK',				'MODIFIER_PLAYER_ADJUST_VALID_IMPROVEMENT',		null);

INSERT INTO	Modifiers
		(ModifierId,							ModifierType,									SubjectRequirementSetId)		
VALUES	-- Exert ZoC
		('CVS_DIZ_EXERT_ZOC',					'DYNMOD_CVS_DIZ_ZOC',							'CVS_DIZ_PLOT_REQUIREMENT');
-----------------------------------------------	
-- ModifierArguments
-----------------------------------------------
INSERT INTO	ModifierArguments
		(ModifierId,							Name,				Value)
VALUES	('CVS_DIZ_BORAN_UNLOCK',				'ImprovementType',	'IMPROVEMENT_CVS_DIZ'),
		-- Exert ZoC
		('CVS_DIZ_EXERT_ZOC',					'Exert',			1);
-----------------------------------------------	
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,						RequirementSetType)
VALUES	('CVS_DIZ_PLOT_REQUIREMENT',			'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements	
		(RequirementSetId,						RequirementId)
VALUES	('CVS_DIZ_PLOT_REQUIREMENT',			'CVS_REQUIRES_DIZ_ON_PLOT');
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId,							RequirementType)
VALUES	('CVS_REQUIRES_DIZ_ON_PLOT',			'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES');
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,							Name,					Value)
VALUES	('CVS_REQUIRES_DIZ_ON_PLOT',			'ImprovementType',		'IMPROVEMENT_CVS_DIZ');
