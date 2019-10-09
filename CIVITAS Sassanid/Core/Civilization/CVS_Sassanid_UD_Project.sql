--==========================================================================================================================
-- Wiškar / Royal Hunt (Project)
--==========================================================================================================================
-----------------------------------------------
-- Types
-----------------------------------------------
INSERT INTO Types
		(Type,								Kind)
VALUES	('PROJECT_CVS_ROYALHUNT',			'KIND_PROJECT');
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
SELECT	'PROJECT_CVS_ROYALHUNT', -- ProjectType
		'LOC_PROJECT_CVS_ROYALHUNT_NAME', -- Name		
		'LOC_PROJECT_CVS_ROYALHUNT_SHORTNAME', -- ShortName
		'LOC_PROJECT_CVS_ROYALHUNT_DESCRIPTION', -- Description
		PopupText,
		40,
		CostProgressionModel,
		1200, -- CostProgressionParam1
		NULL, -- PrereqTech
		NULL, -- PrereqCivic
		'DISTRICT_CVS_HUNTINGPARK', -- PrereqDistrict
		VisualBuildingType,
		SpaceRace,
		OuterDefenseRepair,
		MaxPlayerInstances,
		1, -- AmenitiesWhileActive
		NULL, -- PrereqResource
		'ADVISOR_CONQUEST' -- AdvisorType
FROM	Projects
WHERE	ProjectType = 'PROJECT_CARNIVAL';