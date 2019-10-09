--==========================================================================================================================
-- Kawad I / Vanilla Traits
--==========================================================================================================================
-----------------------------------------------
-- Types
-----------------------------------------------	
INSERT INTO Types	
		(Type,										Kind)
VALUES	('TRAIT_LEADER_CVS_KAWAD_I_TTBAM',			'KIND_TRAIT'),
		('TRAIT_LEADER_CVS_KAWAD_I_AMARGAR',		'KIND_TRAIT'),
		('IMPROVEMENT_CVS_AMARGAR',					'KIND_IMPROVEMENT');
-----------------------------------------------
-- LeaderTraits
-----------------------------------------------	
INSERT INTO LeaderTraits	
		(LeaderType,				TraitType)
VALUES	('LEADER_CVS_KAWAD_I',		'TRAIT_LEADER_CVS_KAWAD_I_TTBAM'),
		('LEADER_CVS_KAWAD_I',		'TRAIT_LEADER_CVS_KAWAD_I_AMARGAR');
-----------------------------------------------
-- WHAT DO PERSIAN RUGS GET IF YOU ROLL THEM TOO OFTEN? CARPET TUNNEL SYNDROME!
-----------------------------------------------			
-- Traits			
-----------------------------------------------				
INSERT INTO Traits				
		(TraitType,									Name,											Description)
VALUES	('TRAIT_LEADER_CVS_KAWAD_I_TTBAM',			'LOC_TRAIT_LEADER_CVS_KAWAD_I_TTBAM_NAME',		'LOC_TRAIT_LEADER_CVS_KAWAD_I_TTBAM_DESCRIPTION'),
		('TRAIT_LEADER_CVS_KAWAD_I_AMARGAR',		'LOC_IMPROVEMENT_CVS_AMARGAR_NAME',				null);

UPDATE Traits
SET Description = 'LOC_TRAIT_LEADER_CVS_KAWAD_I_TTBAM_EXPAC_DESCRIPTION'
WHERE TraitType = 'TRAIT_LEADER_CVS_KAWAD_I_TTBAM'
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------		
-- TraitModifiers		
-----------------------------------------------			
INSERT INTO TraitModifiers
		(TraitType,							ModifierId)
VALUES	('TRAIT_LEADER_CVS_KAWAD_I_TTBAM',	'CVS_TTBAM_SPY_WITH_RELIGION'),
		('TRAIT_LEADER_CVS_KAWAD_I_TTBAM',	'CVS_TTBAM_007_WITH_RELIGION'),
		('TRAIT_LEADER_CVS_KAWAD_I_TTBAM',	'CVS_TTBAM_APOSTLE_MODIFIER');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,							ModifierType,							RunOnce,	Permanent,	OwnerRequirementSetId,						SubjectRequirementSetId)
VALUES	('CVS_TTBAM_SPY_WITH_RELIGION',			'DYNMOD_CVS_TTBAM_GRANT_SPY_SLOT',		1,			1,			null,										'CVS_TTBAM_REQUIRES_HAS_FOUNDED_RELIGION'),
		('CVS_TTBAM_007_WITH_RELIGION',			'DYNMOD_CVS_TTBAM_GRANT_SPY',			1,			1,			'CVS_TTBAM_REQUIRES_HAS_FOUNDED_RELIGION',	null);

INSERT INTO Modifiers
		(ModifierId,							ModifierType,						SubjectRequirementSetId)
SELECT	'CVS_TTBAM_APOSTLE_MODIFIER',			'DYNMOD_CVS_TTBAM_007',				'CVS_TTBAM_REQUIRES_APOSTLE_PLAZA'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO Modifiers
		(ModifierId,							ModifierType,						SubjectRequirementSetId)
SELECT	'CVS_TTBAM_APOSTLE_MODIFIER',			'DYNMOD_CVS_TTBAM_007',				'CVS_TTBAM_REQUIRES_APOSTLE_HOLY'
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,							Name,			Value)
VALUES	('CVS_TTBAM_SPY_WITH_RELIGION',			'Amount',		1),
		('CVS_TTBAM_007_WITH_RELIGION',			'UnitType',		'UNIT_SPY'),
		('CVS_TTBAM_007_WITH_RELIGION',			'Amount',		1),
		('CVS_TTBAM_APOSTLE_MODIFIER',			'Hidden',		1);
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
VALUES	('CVS_TTBAM_REQUIRES_HAS_FOUNDED_RELIGION',				'REQUIREMENTSET_TEST_ALL'),
		('CVS_TTBAM_REQUIRES_APOSTLE_PLAZA',					'REQUIREMENTSET_TEST_ALL'),
		('CVS_TTBAM_REQUIRES_APOSTLE_HOLY',						'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
VALUES	('CVS_TTBAM_REQUIRES_HAS_FOUNDED_RELIGION',				'CVS_TTBAM_CHECK_RELIGIOUS_NUT'),
		('CVS_TTBAM_REQUIRES_APOSTLE_PLAZA',					'CVS_TTBAM_CHECK_APOSTLE'),
		('CVS_TTBAM_REQUIRES_APOSTLE_PLAZA',					'CVS_TTBAM_CHECK_PLAZA'),
		('CVS_TTBAM_REQUIRES_APOSTLE_HOLY',						'CVS_TTBAM_CHECK_APOSTLE'),
		('CVS_TTBAM_REQUIRES_APOSTLE_HOLY',						'CVS_TTBAM_CHECK_HOLY');
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId, 						RequirementType,									Inverse)
VALUES	('CVS_TTBAM_CHECK_RELIGIOUS_NUT',		'REQUIREMENT_FOUNDED_NO_RELIGION',					1),
		('CVS_TTBAM_CHECK_APOSTLE',				'REQUIREMENT_UNIT_TYPE_MATCHES',					0),
		('CVS_TTBAM_CHECK_PLAZA',				'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0),
		('CVS_TTBAM_CHECK_HOLY',				'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0);
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId, 						Name,					Value)
VALUES	('CVS_TTBAM_CHECK_APOSTLE',				'UnitType',				'UNIT_APOSTLE'),
		('CVS_TTBAM_CHECK_PLAZA',				'DistrictType',			'DISTRICT_GOVERNMENT_PLAZA'),
		('CVS_TTBAM_CHECK_PLAZA',				'MinRange',				0),
		('CVS_TTBAM_CHECK_PLAZA',				'MaxRange',				3),
		('CVS_TTBAM_CHECK_HOLY',				'DistrictType',			'DISTRICT_HOLY_SITE'),
		('CVS_TTBAM_CHECK_HOLY',				'MinRange',				0),
		('CVS_TTBAM_CHECK_HOLY',				'MaxRange',				1);