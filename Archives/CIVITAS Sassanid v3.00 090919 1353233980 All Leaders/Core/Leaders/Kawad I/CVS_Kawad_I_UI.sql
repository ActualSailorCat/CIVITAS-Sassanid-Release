--==========================================================================================================================
-- Kawad I / Amargar (Building)
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
		PrereqTech,
		Buildable,
		OnePerCity,
		PlunderType,
		PlunderAmount,
		TilesRequired,
		SameAdjacentValid,
		Domain
		)
VALUES  (
		'IMPROVEMENT_CVS_AMARGAR', -- ImprovementType
		'LOC_IMPROVEMENT_CVS_AMARGAR_NAME', -- Name		
		'LOC_IMPROVEMENT_CVS_AMARGAR_DESCRIPTION', -- Description
		'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR', -- TraitType
		'ICON_IMPROVEMENT_CVS_AMARGAR', -- Icon
		'TECH_CURRENCY', -- PrereqTech
		1, -- Buildable
		0, -- OnePerCity
		'YIELD_GOLD', -- PlunderType
		25, -- PlunderAmount
		1, -- TilesRequired
		1, -- SameAdjacentValid
		'DOMAIN_LAND' -- Domain
		);
-----------------------------------------------
-- Improvement_ValidBuildUnits
-----------------------------------------------
INSERT INTO Improvement_ValidBuildUnits
		(ImprovementType,				UnitType)
VALUES	('IMPROVEMENT_CVS_AMARGAR',		'UNIT_BUILDER');
-----------------------------------------------
-- Improvement_ValidTerrains
-----------------------------------------------
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,				TerrainType)
VALUES	('IMPROVEMENT_CVS_AMARGAR',		'TERRAIN_GRASS'),
		('IMPROVEMENT_CVS_AMARGAR',		'TERRAIN_PLAINS'),
		('IMPROVEMENT_CVS_AMARGAR',		'TERRAIN_TUNDRA'),
		('IMPROVEMENT_CVS_AMARGAR',		'TERRAIN_DESERT'),
		('IMPROVEMENT_CVS_AMARGAR',		'TERRAIN_SNOW'),
		('IMPROVEMENT_CVS_AMARGAR',		'TERRAIN_GRASS_HILLS'),
		('IMPROVEMENT_CVS_AMARGAR',		'TERRAIN_PLAINS_HILLS'),
		('IMPROVEMENT_CVS_AMARGAR',		'TERRAIN_TUNDRA_HILLS'),
		('IMPROVEMENT_CVS_AMARGAR',		'TERRAIN_DESERT_HILLS'),
		('IMPROVEMENT_CVS_AMARGAR',		'TERRAIN_SNOW_HILLS');
-----------------------------------------------
-- Improvement_YieldChanges
-----------------------------------------------
INSERT INTO Improvement_YieldChanges
		(ImprovementType,				YieldType,			YieldChange)
VALUES	('IMPROVEMENT_CVS_AMARGAR',		'YIELD_GOLD',		2);
-----------------------------------------------
-- Improvement_BonusYieldChanges
-----------------------------------------------
INSERT INTO Improvement_BonusYieldChanges
		(Id,	ImprovementType,				YieldType,			BonusYieldChange,	PrereqTech)
VALUES	(653,	'IMPROVEMENT_CVS_AMARGAR',		'YIELD_GOLD',		2,					'TECH_BANKING');
-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT INTO	TraitModifiers
		(TraitType,								ModifierId)
VALUES	('TRAIT_LEADER_CVS_KAWAD_I_AMARGAR',	'CVS_AMARGAR_KAWAD_I_UNLOCK');
-----------------------------------------------		
-- ImprovementModifiers		
-----------------------------------------------
INSERT INTO ImprovementModifiers
		(ImprovementType,			ModifierId)
SELECT	'IMPROVEMENT_CVS_AMARGAR',	'CVS_AMARGAR_BY_'||ImprovementType
FROM Improvements WHERE ImprovementType != 'IMPROVEMENT_GOODY_HUT' AND ImprovementType != 'IMPROVEMENT_ROMAN_FORT' AND TraitType IS NULL
OR TraitType IN (SELECT TraitType FROM LeaderTraits WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%') OR TraitType = 'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR';
-----------------------------------------------		
-- Modifiers		
-----------------------------------------------
INSERT INTO	Modifiers
		(ModifierId,							ModifierType,									SubjectRequirementSetId)
VALUES	('CVS_AMARGAR_KAWAD_I_UNLOCK',			'MODIFIER_PLAYER_ADJUST_VALID_IMPROVEMENT',		null);

INSERT INTO Modifiers
		(ModifierId,							ModifierType,								RunOnce,	Permanent,	SubjectRequirementSetId)
SELECT	'CVS_AMARGAR_BY_'||ImprovementType,		'DYNMOD_CVS_TTBAM_SINGLE_PLOT_YIELD',		0,			0,			'CVS_AMARGAR_REQUIRES_LO_'||ImprovementType
FROM Improvements WHERE ImprovementType != 'IMPROVEMENT_GOODY_HUT' AND ImprovementType != 'IMPROVEMENT_ROMAN_FORT' AND TraitType IS NULL
OR TraitType IN (SELECT TraitType FROM LeaderTraits WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%') OR TraitType = 'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR';
-----------------------------------------------		
-- ModifierArguments	
-----------------------------------------------
INSERT INTO	ModifierArguments
		(ModifierId,							Name,				Value)
VALUES	('CVS_AMARGAR_KAWAD_I_UNLOCK',			'ImprovementType',	'IMPROVEMENT_CVS_AMARGAR');

INSERT INTO ModifierArguments
		(ModifierId,							Name,				Value)
SELECT	'CVS_AMARGAR_BY_'||ImprovementType,		'YieldType',		'YIELD_FOOD'
FROM Improvements WHERE ImprovementType != 'IMPROVEMENT_GOODY_HUT' AND ImprovementType != 'IMPROVEMENT_ROMAN_FORT' AND TraitType IS NULL
OR TraitType IN (SELECT TraitType FROM LeaderTraits WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%') OR TraitType = 'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR';

INSERT INTO ModifierArguments
		(ModifierId,							Name,				Value)
SELECT	'CVS_AMARGAR_BY_'||ImprovementType,		'Amount',			1
FROM Improvements WHERE ImprovementType != 'IMPROVEMENT_GOODY_HUT' AND ImprovementType != 'IMPROVEMENT_ROMAN_FORT' AND TraitType IS NULL
OR TraitType IN (SELECT TraitType FROM LeaderTraits WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%') OR TraitType = 'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR';
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
SELECT	'CVS_AMARGAR_REQUIRES_LO_'||ImprovementType,		'REQUIREMENTSET_TEST_ALL'
FROM Improvements WHERE ImprovementType != 'IMPROVEMENT_GOODY_HUT' AND ImprovementType != 'IMPROVEMENT_ROMAN_FORT' AND TraitType IS NULL
OR TraitType IN (SELECT TraitType FROM LeaderTraits WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%') OR TraitType = 'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR';
-----------------------------------------------		
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
SELECT	'CVS_AMARGAR_REQUIRES_LO_'||ImprovementType,		'CVS_AMARGAR_CHECK_LO_'||ImprovementType
FROM Improvements WHERE ImprovementType != 'IMPROVEMENT_GOODY_HUT' AND ImprovementType != 'IMPROVEMENT_ROMAN_FORT' AND TraitType IS NULL
OR TraitType IN (SELECT TraitType FROM LeaderTraits WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%') OR TraitType = 'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR';

INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
SELECT	'CVS_AMARGAR_REQUIRES_LO_'||ImprovementType,		'CVS_AMARGAR_CHECK_PLOT_IS'
FROM Improvements WHERE ImprovementType != 'IMPROVEMENT_GOODY_HUT' AND ImprovementType != 'IMPROVEMENT_ROMAN_FORT' AND TraitType IS NULL
OR TraitType IN (SELECT TraitType FROM LeaderTraits WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%') OR TraitType = 'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR';
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId, 									RequirementType)
SELECT	'CVS_AMARGAR_CHECK_LO_'||ImprovementType,			'REQUIREMENT_PLOT_ADJACENT_IMPROVEMENT_TYPE_MATCHES'
FROM Improvements WHERE ImprovementType != 'IMPROVEMENT_GOODY_HUT' AND ImprovementType != 'IMPROVEMENT_ROMAN_FORT' AND TraitType IS NULL
OR TraitType IN (SELECT TraitType FROM LeaderTraits WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%') OR TraitType = 'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR';

INSERT INTO Requirements
		(RequirementId,										RequirementType)
VALUES	('CVS_AMARGAR_CHECK_PLOT_IS',						'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES');
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId, 									Name,					Value)
SELECT	'CVS_AMARGAR_CHECK_LO_'||ImprovementType,			'ImprovementType',		ImprovementType
FROM Improvements WHERE ImprovementType != 'IMPROVEMENT_GOODY_HUT' AND ImprovementType != 'IMPROVEMENT_ROMAN_FORT' AND TraitType IS NULL
OR TraitType IN (SELECT TraitType FROM LeaderTraits WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%') OR TraitType = 'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR';

INSERT INTO RequirementArguments
		(RequirementId, 									Name,					Value)
SELECT	'CVS_AMARGAR_CHECK_LO_'||ImprovementType,			'MinRange',				1
FROM Improvements WHERE ImprovementType != 'IMPROVEMENT_GOODY_HUT' AND ImprovementType != 'IMPROVEMENT_ROMAN_FORT' AND TraitType IS NULL
OR TraitType IN (SELECT TraitType FROM LeaderTraits WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%') OR TraitType = 'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR';

INSERT INTO RequirementArguments
		(RequirementId, 									Name,					Value)
SELECT	'CVS_AMARGAR_CHECK_LO_'||ImprovementType,			'MaxRange',				1
FROM Improvements WHERE ImprovementType != 'IMPROVEMENT_GOODY_HUT' AND ImprovementType != 'IMPROVEMENT_ROMAN_FORT' AND TraitType IS NULL
OR TraitType IN (SELECT TraitType FROM LeaderTraits WHERE LeaderType LIKE 'LEADER_MINOR_CIV_%') OR TraitType = 'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR';

INSERT INTO RequirementArguments
		(RequirementId,										Name,					Value)
VALUES	('CVS_AMARGAR_CHECK_PLOT_IS',						'ImprovementType',		'IMPROVEMENT_CVS_AMARGAR');