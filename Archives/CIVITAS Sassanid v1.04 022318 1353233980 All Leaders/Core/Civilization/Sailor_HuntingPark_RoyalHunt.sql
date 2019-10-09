--==========================================================================================================================
-- Wiškar / Royal Hunt (Project)
--==========================================================================================================================
-----------------------------------------------
-- Types
-----------------------------------------------
INSERT INTO Types
		(Type,											Kind)
VALUES	('PROJECT_SAILOR_ROYALHUNT_ANCIENT',			'KIND_PROJECT');
-----------------------------------------------
-- Projects
-----------------------------------------------
INSERT INTO Projects	(
		ProjectType,
		Name,
		ShortName,
		Description,
		PopupText,
		Cost,
		CostProgressionModel,
		CostProgressionParam1,
		PrereqTech,
		PrereqCivic,
		PrereqDistrict,
		VisualBuildingType,
		SpaceRace,
		OuterDefenseRepair,
		MaxPlayerInstances,
		AmenitiesWhileActive,
		PrereqResource,
		AdvisorType
		)
SELECT	'PROJECT_SAILOR_ROYALHUNT_ANCIENT', -- ProjectType
		'LOC_PROJECT_SAILOR_ROYALHUNT_ANCIENT_NAME', -- Name		
		'LOC_PROJECT_SAILOR_ROYALHUNT_ANCIENT_SHORTNAME', -- ShortName
		'LOC_PROJECT_SAILOR_ROYALHUNT_ANCIENT_DESCRIPTION', -- Description
		PopupText,
		Cost,
		CostProgressionModel,
		CostProgressionParam1, -- CostProgressionParam1
		NULL, -- PrereqTech
		NULL, -- PrereqCivic
		'DISTRICT_SAILOR_HUNTINGPARK', -- PrereqDistrict
		VisualBuildingType,
		SpaceRace,
		OuterDefenseRepair,
		MaxPlayerInstances,
		NULL, -- AmenitiesWhileActive
		NULL, -- PrereqResource
		'ADVISOR_CONQUEST' -- AdvisorType
FROM	Projects
WHERE	ProjectType = 'PROJECT_CARNIVAL';

-----------------------------------------------
-- Project_YieldConversions
-----------------------------------------------

INSERT INTO Project_YieldConversions
		(ProjectType,							YieldType,			PercentOfProductionRate)
VALUES	('PROJECT_SAILOR_ROYALHUNT_ANCIENT',	'YIELD_CULTURE',	15);

-----------------------------------------------
-- Project_GreatPersonPoints
-----------------------------------------------

INSERT INTO Project_GreatPersonPoints
		(ProjectType,							GreatPersonClassType,			Points,		PointProgressionModel,				PointProgressionParam1)
VALUES	('PROJECT_SAILOR_ROYALHUNT_ANCIENT',	'GREAT_PERSON_CLASS_GENERAL',	10,			'COST_PROGRESSION_GAME_PROGRESS',	800),
		('PROJECT_SAILOR_ROYALHUNT_ANCIENT',	'GREAT_PERSON_CLASS_MUSICIAN',	5,			'COST_PROGRESSION_GAME_PROGRESS',	800);

-----------------------------------------------
-- ProjectCompletionModifiers
-----------------------------------------------
INSERT INTO ProjectCompletionModifiers
		(ProjectType,							ModifierId)
VALUES	('PROJECT_SAILOR_ROYALHUNT_ANCIENT',	'SAILOR_ROYALHUNT_PROJECT_EXP');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,							ModifierType,							RunOnce,	Permanent,		SubjectRequirementSetId)
VALUES	('SAILOR_ROYALHUNT_PROJECT_EXP',		'DYNMOD_SAILOR_GRANT_UNITS_EXP',		1,			1,				null);
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,							Name,					Value)
VALUES	('SAILOR_ROYALHUNT_PROJECT_EXP',		'Amount',				300);