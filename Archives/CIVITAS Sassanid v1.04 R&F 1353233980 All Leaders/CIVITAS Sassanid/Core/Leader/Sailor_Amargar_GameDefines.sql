--==========================================================================================================================
-- Kawad I / AMARGAR (Building)
--==========================================================================================================================
-----------------------------------------------
-- Buildings
-----------------------------------------------
INSERT INTO Buildings	(
		BuildingType,
		Name,
		Description,
		TraitType,
		PrereqTech,
		PrereqCivic,
		Cost,
		PrereqDistrict,
		Housing,
		PurchaseYield,
		Maintenance,
		CitizenSlots,
		OuterDefenseStrength,
		DefenseModifier,
		RegionalRange,
		AdvisorType
		)
SELECT	'BUILDING_SAILOR_AMARGAR', -- BuildingType
		'LOC_BUILDING_SAILOR_AMARGAR_NAME', -- Name
		'LOC_BUILDING_SAILOR_AMARGAR_DESCRIPTION', -- Description
		'TRAIT_LEADER_SAILOR_KAWAD_I_AMARGAR', -- TraitType
		PrereqTech,
		PrereqCivic,
		Cost,
		PrereqDistrict,
		Housing,
		PurchaseYield,
		Maintenance,
		CitizenSlots,
		OuterDefenseStrength,
		DefenseModifier,
		RegionalRange,
		AdvisorType
FROM	Buildings
WHERE	BuildingType = 'BUILDING_MARKET';
-----------------------------------------------
-- BuildingReplaces
-----------------------------------------------
INSERT INTO BuildingReplaces
		(CivUniqueBuildingType,				ReplacesBuildingType)
VALUES	('BUILDING_SAILOR_AMARGAR',			'BUILDING_MARKET');
-----------------------------------------------
-- Building_YieldChanges
-----------------------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType,					YieldType,	YieldChange)
SELECT	'BUILDING_SAILOR_AMARGAR',	YieldType,	YieldChange
FROM	Building_YieldChanges
WHERE	BuildingType = 'BUILDING_MARKET';
-----------------------------------------------
-- Building_GreatPersonPoints
-----------------------------------------------
INSERT INTO Building_GreatPersonPoints
		(BuildingType,					GreatPersonClassType,	PointsPerTurn)
SELECT	'BUILDING_SAILOR_AMARGAR',	GreatPersonClassType,	PointsPerTurn
FROM	Building_GreatPersonPoints
WHERE	BuildingType = 'BUILDING_MARKET';
-----------------------------------------------		
-- BuildingModifiers		
-----------------------------------------------			
INSERT INTO BuildingModifiers
		(BuildingType,						ModifierId)
VALUES	
-- Charming Appeal (Hunting Park)
		('BUILDING_SAILOR_AMARGAR',		'SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_HUNTINGPARK'),
-- Breathtaking Appeal (Hunting Park)
		('BUILDING_SAILOR_AMARGAR',		'SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_HUNTINGPARK');

-- Charming Appeal (Stock Districts)
INSERT INTO BuildingModifiers			
		(BuildingType,						ModifierId)
SELECT	'BUILDING_SAILOR_AMARGAR',		'SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_'||DistrictType
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);
-- Breathtaking Appeal (Stock Districts)
INSERT INTO BuildingModifiers			
		(BuildingType,						ModifierId)
SELECT	'BUILDING_SAILOR_AMARGAR',		'SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_'||DistrictType
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,																ModifierType,										SubjectRequirementSetId)
VALUES	
-- Charming Appeal (Hunting Park)
		('SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_HUNTINGPARK',						'DYNMOD_SAILOR_ATTACH_SINGLE_CITY',					'SAILOR_AMARGAR_REQUIRES_CITY_HAS_AMARGAR'),
		('SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_HUNTINGPARK_MODIFIER',				'DYNMOD_SAILOR_DISTRICT_YIELD_VIA_APPEAL',			null),
-- Breathtaking Appeal (Hunting Park)
		('SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_HUNTINGPARK',			'DYNMOD_SAILOR_ATTACH_SINGLE_CITY',					'SAILOR_AMARGAR_REQUIRES_CITY_HAS_AMARGAR'),
		('SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_HUNTINGPARK_MODIFIER',	'DYNMOD_SAILOR_DISTRICT_YIELD_VIA_APPEAL',			null);

-- Charming Appeal (Stock Districts)
INSERT INTO Modifiers	
		(ModifierId,											ModifierType,									SubjectRequirementSetId)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_'||DistrictType,	'DYNMOD_SAILOR_ATTACH_SINGLE_CITY',				'SAILOR_AMARGAR_REQUIRES_CITY_HAS_AMARGAR'
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);
INSERT INTO Modifiers	
		(ModifierId,													ModifierType,									SubjectRequirementSetId)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_MODIFIER_'||DistrictType,	'DYNMOD_SAILOR_DISTRICT_YIELD_VIA_APPEAL',		null
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);
-- Breathtaking Appeal (Stock Districts)
INSERT INTO Modifiers	
		(ModifierId,														ModifierType,									SubjectRequirementSetId)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_'||DistrictType,	'DYNMOD_SAILOR_ATTACH_SINGLE_CITY',				'SAILOR_AMARGAR_REQUIRES_CITY_HAS_AMARGAR'
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);
INSERT INTO Modifiers	
		(ModifierId,																	ModifierType,									SubjectRequirementSetId)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_MODIFIER_'||DistrictType,	'DYNMOD_SAILOR_DISTRICT_YIELD_VIA_APPEAL',		null
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,															Name,								Value)
VALUES	
-- Charming Appeal (Hunting Park)
		('SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_HUNTINGPARK',					'ModifierId',						'SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_HUNTINGPARK_MODIFIER'),
		('SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_HUNTINGPARK_MODIFIER',			'RequiredAppeal',					2),
		('SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_HUNTINGPARK_MODIFIER',			'YieldType',						'YIELD_GOLD'),
		('SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_HUNTINGPARK_MODIFIER',			'YieldChange',						2),
		('SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_HUNTINGPARK_MODIFIER',			'DistrictType',						'DISTRICT_SAILOR_HUNTINGPARK'),
		('SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_HUNTINGPARK_MODIFIER',			'Description',						'LOC_AMARGAR_APPEAL_YIELD_DESCRIPTION'),

-- Breathtaking Appeal (Hunting Park)
		('SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_HUNTINGPARK',				'ModifierId',				'SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_HUNTINGPARK_MODIFIER'),
		('SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_HUNTINGPARK_MODIFIER',		'RequiredAppeal',			4),
		('SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_HUNTINGPARK_MODIFIER',		'YieldType',				'YIELD_GOLD'),
		('SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_HUNTINGPARK_MODIFIER',		'YieldChange',				2),
		('SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_HUNTINGPARK_MODIFIER',		'DistrictType',				'DISTRICT_SAILOR_HUNTINGPARK'),
		('SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_HUNTINGPARK_MODIFIER',		'Description',				'LOC_AMARGAR_BREATHTAKING_APPEAL_YIELD_DESCRIPTION');

-- Charming Appeal (Stock Districts)
INSERT INTO ModifierArguments
		(ModifierId,											Name,				Value)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_'||DistrictType,	'ModifierId',		'SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_MODIFIER_'||DistrictType
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);

INSERT INTO ModifierArguments
		(ModifierId,													Name,				Value)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_MODIFIER_'||DistrictType,	'RequiredAppeal',	2
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);

INSERT INTO ModifierArguments
		(ModifierId,													Name,				Value)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_MODIFIER_'||DistrictType,	'YieldType',		'YIELD_GOLD'
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);

INSERT INTO ModifierArguments
		(ModifierId,													Name,				Value)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_MODIFIER_'||DistrictType,	'YieldChange',		2
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);

INSERT INTO ModifierArguments
		(ModifierId,													Name,				Value)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_MODIFIER_'||DistrictType,	'DistrictType',		DistrictType
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);

INSERT INTO ModifierArguments
		(ModifierId,													Name,				Value)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_YIELD_MODIFIER_'||DistrictType,	'Description',		'LOC_AMARGAR_APPEAL_YIELD_DESCRIPTION'
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);
-- Breathtaking Appeal (Stock Districts)
INSERT INTO ModifierArguments
		(ModifierId,														Name,				Value)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_'||DistrictType,	'ModifierId',		'SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_MODIFIER_'||DistrictType
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);

INSERT INTO ModifierArguments
		(ModifierId,																	Name,				Value)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_MODIFIER_'||DistrictType,	'RequiredAppeal',	4
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);

INSERT INTO ModifierArguments
		(ModifierId,																	Name,				Value)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_MODIFIER_'||DistrictType,	'YieldType',		'YIELD_GOLD'
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);

INSERT INTO ModifierArguments
		(ModifierId,																	Name,				Value)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_MODIFIER_'||DistrictType,	'YieldChange',		2
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);

INSERT INTO ModifierArguments
		(ModifierId,																	Name,				Value)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_MODIFIER_'||DistrictType,	'DistrictType',		DistrictType
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);

INSERT INTO ModifierArguments
		(ModifierId,																	Name,				Value)
SELECT	'SAILOR_AMARGAR_DISTRICT_APPEAL_BREATHTAKING_YIELD_MODIFIER_'||DistrictType,	'Description',		'LOC_AMARGAR_BREATHTAKING_APPEAL_YIELD_DESCRIPTION'
FROM	District_TradeRouteYields
WHERE   YieldChangeAsInternationalDestination > 0
AND        DistrictType IN (SELECT DistrictType
							FROM    Districts
							WHERE    TraitType IS NULL
							);
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
VALUES	('SAILOR_AMARGAR_REQUIRES_CITY_HAS_AMARGAR',		'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
VALUES	('SAILOR_AMARGAR_REQUIRES_CITY_HAS_AMARGAR',		'SAILOR_CHECK_FOR_AMARGAR');
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId, 							RequirementType,							Inverse)
VALUES	('SAILOR_CHECK_FOR_AMARGAR',				'REQUIREMENT_CITY_HAS_BUILDING',			0);			
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId, 						Name,					Value)
VALUES	('SAILOR_CHECK_FOR_AMARGAR',			'BuildingType',			'BUILDING_SAILOR_AMARGAR');