--==========================================================================================================================
--
--            .
--            |\
--            | \
--            |  \
--            |   \
--            |    \          KAWAD I by CIVITAS
--            |     \
--            |      \
--            |       \       ____O
--            |        \     .' ./
--            |   _.,-~"\  .',/~'
--            <-~"   _.,-~" ~ |
--^"~-,._.,-~"^"~-,._\       /,._.,-~"^"~-,._.,-~"^"~-,._
--~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._
--^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._
--~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._
--==========================================================================================================================
-- Kawad I / Traits
--==========================================================================================================================
-----------------------------------------------
-- Types
-----------------------------------------------	
INSERT INTO Types	
		(Type,													Kind)
VALUES	('TRAIT_LEADER_SAILOR_KAWAD_I_TTBAM',					'KIND_TRAIT'),
		('TRAIT_LEADER_SAILOR_KAWAD_I_AMARGAR',					'KIND_TRAIT'),
		('BUILDING_SAILOR_AMARGAR',								'KIND_BUILDING');
-----------------------------------------------
-- LeaderTraits
-----------------------------------------------	
INSERT INTO LeaderTraits	
		(LeaderType,					TraitType)
VALUES	('LEADER_SAILOR_KAWAD_I',		'TRAIT_LEADER_SAILOR_KAWAD_I_TTBAM'),
		('LEADER_SAILOR_KAWAD_I',		'TRAIT_LEADER_SAILOR_KAWAD_I_AMARGAR');
-----------------------------------------------
-- WHAT DO PERSIAN RUGS GET IF YOU ROLL THEM TOO OFTEN? CARPET TUNNEL SYNDROME!
-----------------------------------------------			
-- Traits			
-----------------------------------------------				
INSERT INTO Traits				
		(TraitType,										Name,												Description)
VALUES	('TRAIT_LEADER_SAILOR_KAWAD_I_TTBAM',			'LOC_TRAIT_LEADER_SAILOR_KAWAD_I_TTBAM_NAME',		'LOC_TRAIT_LEADER_SAILOR_KAWAD_I_TTBAM_DESCRIPTION'),
		('TRAIT_LEADER_SAILOR_KAWAD_I_AMARGAR',			'LOC_BUILDING_SAILOR_AMARGAR_NAME',					null);
-----------------------------------------------		
-- TraitModifiers		
-----------------------------------------------			
INSERT INTO TraitModifiers
		(TraitType,								ModifierId)
VALUES	('TRAIT_LEADER_SAILOR_KAWAD_I_TTBAM',	'SAILOR_TTBAM_SPY_WITH_RELIGION'),
		('TRAIT_LEADER_SAILOR_KAWAD_I_TTBAM',	'SAILOR_TTBAM_HUB_HARBOR_FAITH'),
		('TRAIT_LEADER_SAILOR_KAWAD_I_TTBAM',	'SAILOR_TTBAM_HUB_HARBOR_RELIGION');
-- 007
INSERT INTO TraitModifiers
		(TraitType,												ModifierId)
SELECT	'TRAIT_LEADER_SAILOR_KAWAD_I_TTBAM',	'SAILOR_KAWAD_I_007_'||OperationType
FROM	UnitOperations
WHERE	CategoryInUI = 'OFFENSIVESPY' AND LevelProbChange IS NOT 0;
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT INTO Modifiers
		(ModifierId,								ModifierType,								RunOnce,	Permanent,	SubjectRequirementSetId)
VALUES	('SAILOR_TTBAM_SPY_WITH_RELIGION',			'DYNMOD_SAILOR_TTBAM_GRANT_SPY_SLOT',		1,			1,			'SAILOR_TTBAM_REQUIRES_HAS_FOUNDED_RELIGION');
INSERT INTO Modifiers
		(ModifierId,								ModifierType,								SubjectRequirementSetId)
VALUES	('SAILOR_TTBAM_HUB_HARBOR_FAITH',			'DYNMOD_SAILOR_TTBAM_DISTRICT_YIELD',		'SAILOR_TTBAM_REQUIRES_HUB_OR_HARBOR'),
		('SAILOR_TTBAM_HUB_HARBOR_RELIGION',		'DYNMOD_SAILOR_TTBAM_DISTRICT_YIELD',		'SAILOR_TTBAM_REQUIRES_CITY_FOLLOWS_RELIGION');

INSERT INTO Modifiers
		(ModifierId,								ModifierType,								SubjectRequirementSetId)
SELECT	'SAILOR_KAWAD_I_007_'||OperationType,		'DYNMOD_SAILOR_TTBAM_OPERATION_CHANCE',		null
FROM	UnitOperations
WHERE	CategoryInUI = 'OFFENSIVESPY' AND LevelProbChange IS NOT 0;
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,										Name,				Value)
VALUES	('SAILOR_TTBAM_SPY_WITH_RELIGION',					'Amount',			1),
		('SAILOR_TTBAM_HUB_HARBOR_FAITH',					'YieldType',		'YIELD_FAITH'),
		('SAILOR_TTBAM_HUB_HARBOR_FAITH',					'Amount',			1),
		('SAILOR_TTBAM_HUB_HARBOR_RELIGION',				'YieldType',		'YIELD_FAITH'),
		('SAILOR_TTBAM_HUB_HARBOR_RELIGION',				'Amount',			2);

INSERT INTO ModifierArguments
		(ModifierId,										Name,				Value)
SELECT	'SAILOR_KAWAD_I_007_'||OperationType,				'OperationType',	OperationType
FROM	UnitOperations
WHERE	CategoryInUI = 'OFFENSIVESPY' AND LevelProbChange IS NOT 0;

INSERT INTO ModifierArguments
		(ModifierId,										Name,				Value)
SELECT	'SAILOR_KAWAD_I_007_'||OperationType,				'Offensive',		1
FROM	UnitOperations
WHERE	CategoryInUI = 'OFFENSIVESPY' AND LevelProbChange IS NOT 0;

INSERT INTO ModifierArguments
		(ModifierId,										Name,				Value)
SELECT	'SAILOR_KAWAD_I_007_'||OperationType,				'Amount',			1
FROM	UnitOperations
WHERE	CategoryInUI = 'OFFENSIVESPY' AND LevelProbChange IS NOT 0;
-----------------------------------------------		
-- RequirementSets
-----------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
VALUES	('SAILOR_TTBAM_REQUIRES_HAS_FOUNDED_RELIGION',			'REQUIREMENTSET_TEST_ALL'),
		('SAILOR_TTBAM_REQUIRES_HUB_OR_HARBOR',					'REQUIREMENTSET_TEST_ANY'),
		('SAILOR_TTBAM_REQUIRES_HUB_OR_HARBOR_MET',				'REQUIREMENTSET_TEST_ALL'),
		('SAILOR_TTBAM_REQUIRES_CITY_FOLLOWS_RELIGION',			'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
VALUES	('SAILOR_TTBAM_REQUIRES_HAS_FOUNDED_RELIGION',			'SAILOR_TTBAM_CHECK_RELIGIOUS_NUT'),
		('SAILOR_TTBAM_REQUIRES_HUB_OR_HARBOR',					'SAILOR_TTBAM_CHECK_HUB'),
		('SAILOR_TTBAM_REQUIRES_HUB_OR_HARBOR',					'SAILOR_TTBAM_CHECK_HARBOR'),
		('SAILOR_TTBAM_REQUIRES_HUB_OR_HARBOR_MET',				'SAILOR_TTBAM_CHECK_HUB_OR_HARBOR_MET'),
		('SAILOR_TTBAM_REQUIRES_CITY_FOLLOWS_RELIGION',			'SAILOR_TTBAM_CHECK_HUB_OR_HARBOR_MET'),
		('SAILOR_TTBAM_REQUIRES_CITY_FOLLOWS_RELIGION',			'SAILOR_TTBAM_CHECK_FOLLOWS_RELIGION');
-----------------------------------------------
-- Requirements
-----------------------------------------------
INSERT INTO Requirements
		(RequirementId, 							RequirementType,							Inverse)
VALUES	('SAILOR_TTBAM_CHECK_RELIGIOUS_NUT',		'REQUIREMENT_FOUNDED_NO_RELIGION',			1),
		('SAILOR_TTBAM_CHECK_HUB',					'REQUIREMENT_DISTRICT_TYPE_MATCHES',		0),
		('SAILOR_TTBAM_CHECK_HARBOR',				'REQUIREMENT_DISTRICT_TYPE_MATCHES',		0),
		('SAILOR_TTBAM_CHECK_HUB_OR_HARBOR_MET',	'REQUIREMENT_REQUIREMENTSET_IS_MET',		0),
		('SAILOR_TTBAM_CHECK_FOLLOWS_RELIGION',		'REQUIREMENT_CITY_FOLLOWS_RELIGION',		0);
-----------------------------------------------
-- RequirementArguments
-----------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId, 							Name,					Value)
VALUES	('SAILOR_TTBAM_CHECK_HUB',					'DistrictType',			'DISTRICT_COMMERCIAL_HUB'),
		('SAILOR_TTBAM_CHECK_HARBOR',				'DistrictType',			'DISTRICT_HARBOR'),
		('SAILOR_TTBAM_CHECK_HUB_OR_HARBOR_MET',	'RequirementSetId',		'SAILOR_TTBAM_REQUIRES_HUB_OR_HARBOR');

