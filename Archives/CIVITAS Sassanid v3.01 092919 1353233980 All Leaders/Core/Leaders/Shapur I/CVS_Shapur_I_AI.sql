--==========================================================================================================================
-- Shapur I / AI by CIVITAS
--==========================================================================================================================
-----------------------------------------------	
-- FavoredReligions
-----------------------------------------------	
INSERT INTO FavoredReligions	
		(LeaderType,				ReligionType)
VALUES	('LEADER_CVS_SHAPUR_I',		'RELIGION_ZOROASTRIANISM');
-----------------------------------------------	
-- AiListTypes
-----------------------------------------------	
INSERT INTO AiListTypes	
		(ListType)
VALUES	('CVS_SHAPUR_I_Civics'),
		('CVS_SHAPUR_I_Techs'),
		('CVS_SHAPUR_I_Buildings'),
		('CVS_SHAPUR_I_Districts'),
		('CVS_SHAPUR_I_PseudoYields'),
		('CVS_SHAPUR_I_Yields'),
		('CVS_SHAPUR_I_Units'),
		('CVS_SHAPUR_I_FavorDominationVictory'),
		('CVS_SHAPUR_I_Diplomacy'),
		('CVS_SHAPUR_I_PlotEvaluation');
-----------------------------------------------	
-- AiLists
-----------------------------------------------	
INSERT INTO AiLists	
		(ListType,								 AgendaType,								System)
VALUES	('CVS_SHAPUR_I_Civics',					 'TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',		'Civics'),
		('CVS_SHAPUR_I_Techs',					 'TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',		'Technologies'),
		('CVS_SHAPUR_I_Buildings',				 'TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',		'Buildings'),
		('CVS_SHAPUR_I_Districts',				 'TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',		'Districts'),
		('CVS_SHAPUR_I_PseudoYields',			 'TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',		'PseudoYields'),
		('CVS_SHAPUR_I_Yields',					 'TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',		'Yields'),
		('CVS_SHAPUR_I_Units',					 'TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',		'Units'),
		('CVS_SHAPUR_I_FavorDominationVictory',	 'TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',		'Strategies'),
		('CVS_SHAPUR_I_Diplomacy',				 'TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',		'DiplomaticActions'),
		('CVS_SHAPUR_I_PlotEvaluation',			 'TRAIT_AGENDA_CVS_OXUS_TO_EUPHRATES',		'PlotEvaluation');
-----------------------------------------------	
-- AiFavoredItems
-----------------------------------------------
-- YIELDS
INSERT INTO AiFavoredItems	
		(ListType,							Favored,	Item)
VALUES	('CVS_SHAPUR_I_Yields',				1,			'YIELD_GOLD'),						 -- Leader
		('CVS_SHAPUR_I_Yields',				1,			'YIELD_PRODUCTION'),				 -- Leader
		('CVS_SHAPUR_I_PseudoYields',		1,			'PSEUDOYIELD_GPP_GENERAL'),			 -- Leader
		('CVS_SHAPUR_I_PseudoYields',		1,			'PSEUDOYIELD_UNIT_COMBAT'),			 -- Leader
		('CVS_SHAPUR_I_PseudoYields',		1,			'PSEUDOYIELD_TECHNOLOGY'),			 -- Leader
		('CVS_SHAPUR_I_PseudoYields',		1,			'PSEUDOYIELD_STANDING_ARMY_NUMBER'), -- Leader
		('CVS_SHAPUR_I_PseudoYields',		1,			'PSEUDOYIELD_STANDING_ARMY_VALUE'),	 -- Leader
		('CVS_SHAPUR_I_PseudoYields',		1,			'PSEUDOYIELD_DISTRICT');			 -- Civilization

-- UNITS
INSERT INTO AiFavoredItems	
		(ListType,							Favored,	Item)
VALUES	('CVS_SHAPUR_I_Units',				1,			'UNIT_GREAT_GENERAL'),		-- Leader
		('CVS_SHAPUR_I_Units',				1,			'UNIT_CVS_SHAPUR_I_UU'),	-- Leader
		('CVS_SHAPUR_I_Units',				1,			'UNIT_CVS_ASWAR');			-- Civilization

-- BUILDINGS & DISTRICTS
INSERT INTO AiFavoredItems	
		(ListType,							Favored,	Item)
VALUES	('CVS_SHAPUR_I_Buildings',			1,			'BUILDING_STABLE'),				-- Leader
		('CVS_SHAPUR_I_Buildings',			1,			'BUILDING_BARRACKS'),			-- Leader
		('CVS_SHAPUR_I_Districts',			1,			'DISTRICT_ENCAMPMENT'),			-- Leader
		('CVS_SHAPUR_I_Districts',			0,			'DISTRICT_THEATER'),			-- Leader
		('CVS_SHAPUR_I_Districts',			1,			'DISTRICT_CVS_HUNTINGPARK');	-- Civilization

		--===== Buildings & Districts == EXPAC =====
INSERT INTO AiFavoredItems
		(ListType,							Favored,	Item)
SELECT	'CVS_SHAPUR_I_Districts',			1,			'DISTRICT_GOVERNMENT'   -- Civilization
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,							Favored,	Item)
SELECT	'CVS_SHAPUR_I_Districts',			1,			'BUILDING_GOV_CONQUEST' -- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,							Favored,	Item)
SELECT	'CVS_SHAPUR_I_Districts',			1,			'BUILDING_GOV_FAITH'    -- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,							Favored,	Item)
SELECT	'CVS_SHAPUR_I_Districts',			1,			'BUILDING_GOV_MILITARY' -- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');


-- WONDERS
INSERT INTO AiFavoredItems	
		(ListType,							Favored,	Item)
VALUES	('CVS_SHAPUR_I_Buildings',			1,			'BUILDING_TERRACOTTA_ARMY'),	  -- Leader
		('CVS_SHAPUR_I_Buildings',			1,			'BUILDING_ALHAMBRA'),			  -- Leader
		('CVS_SHAPUR_I_Buildings',			1,			'BUILDING_HANGING_GARDENS'),	  -- Leader
		('CVS_SHAPUR_I_Buildings',			1,			'BUILDING_GREAT_LIBRARY'),		  -- Leader
		('CVS_SHAPUR_I_Buildings',			1,			'BUILDING_OXFORD_UNIVERSITY');	  -- Leader

		--===== Wonders == EXPAC ======
INSERT INTO AiFavoredItems
		(ListType,							Favored,	Item)
SELECT	'CVS_SHAPUR_I_Buildings',			1,			'BUILDING_STATUE_LIBERTY'		  -- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,							Favored,	Item)
SELECT	'CVS_SHAPUR_I_Buildings',			1,			'BUILDING_AMUNDSEN_SCOTT_RESEARCH_STATION' -- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- CIVICS & TECHS
INSERT INTO AiFavoredItems	
		(ListType,						Item,							Favored)
VALUES	('CVS_SHAPUR_I_Civics',			'CIVIC_MILITARY_TRAINING',		1), -- Leader
		('CVS_SHAPUR_I_Civics',			'CIVIC_POLITICAL_PHILOSOPHY',	1), -- Leader
		('CVS_SHAPUR_I_Civics',			'CIVIC_MERCENARIES',			1), -- Leader
		('CVS_SHAPUR_I_Civics',			'CIVIC_MILITARY_TRADITION',		1), -- Civilization
		('CVS_SHAPUR_I_Civics',			'CIVIC_FEUDALISM',				1), -- Civilization
		('CVS_SHAPUR_I_Civics',			'CIVIC_DIVINE_RIGHT',			1), -- Civilization
		('CVS_SHAPUR_I_Techs',			'TECH_BRONZE_WORKING',			1), -- Leader
		('CVS_SHAPUR_I_Techs',			'TECH_ENGINEERING',				1), -- Leader
		('CVS_SHAPUR_I_Techs',			'TECH_HORSEBACK_RIDING',		1), -- Leader
		('CVS_SHAPUR_I_Techs',			'TECH_METAL_CASTING',			1), -- Leader
		('CVS_SHAPUR_I_Techs',			'TECH_REPLACEABLE_PARTS',		1), -- Leader
		('CVS_SHAPUR_I_Techs',			'TECH_IRON_WORKING',			1); -- Leader

		--===== Civics & Techs == EXPAC =====
INSERT INTO AiFavoredItems
		(ListType,						Item,							Favored)
SELECT	'CVS_SHAPUR_I_Civics',			'CIVIC_STATE_WORKFORCE',		1	-- Civilization
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- VICTORIES
INSERT INTO AiFavoredItems	
		(ListType,									Item,									Value)
VALUES	('CVS_SHAPUR_I_FavorDominationVictory',		'VICTORY_STRATEGY_MILITARY_VICTORY',	-2);

-- WARS
INSERT INTO AiFavoredItems	
		(ListType,									Item,									Favored)
VALUES	('CVS_SHAPUR_I_Diplomacy',					'DIPLOACTION_DECLARE_SURPRISE_WAR',		1),
		('CVS_SHAPUR_I_Diplomacy',					'DIPLOACTION_DECLARE_WAR_MINOR_CIV',	1),
		('CVS_SHAPUR_I_Diplomacy',					'DIPLOACTION_DECLARE_FORMAL_WAR',		1),
		('CVS_SHAPUR_I_Diplomacy',					'DIPLOACTION_DECLARE_HOLY_WAR',			1),
		('CVS_SHAPUR_I_Diplomacy',					'DIPLOACTION_DECLARE_RECONQUEST_WAR',	1),
		('CVS_SHAPUR_I_Diplomacy',					'DIPLOACTION_DECLARE_TERRITORIAL_WAR',	1),
		('CVS_SHAPUR_I_Diplomacy',					'DIPLOACTION_JOINT_WAR',				1),
		('CVS_SHAPUR_I_Diplomacy',					'DIPLOACTION_DECLARE_PROTECTORATE_WAR',	1),
		('CVS_SHAPUR_I_Diplomacy',					'DIPLOACTION_DECLARE_LIBERATION_WAR',	1),
		('CVS_SHAPUR_I_Diplomacy',					'DIPLOACTION_DECLARE_COLONIAL_WAR',		1);

		--===== Diplomacy == EXPAC =====
INSERT INTO AiFavoredItems
		(ListType,						Item,								Favored)
SELECT	'CVS_SHAPUR_I_Diplomacy',		'DIPLOACTION_ALLIANCE_MILITARY',	1
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,						Item,								Favored)
SELECT	'CVS_SHAPUR_I_Diplomacy',		'DIPLOACTION_ALLIANCE_ECONOMIC',	1
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- PLOT EVALUATION
INSERT INTO AiFavoredItems
		(ListType,						Item,				Favored,		StringVal)
VALUES  ('CVS_SHAPUR_I_PlotEvaluation',	'Resource Class',	1,				'RESOURCECLASS_STRATEGIC');

		--===== Plot Evaluation == EXPAC =====
INSERT INTO AiFavoredItems
		(ListType,						Item,				Favored,		StringVal)
SELECT  'CVS_SHAPUR_I_PlotEvaluation',	'Specific Feature',	1,				'FEATURE_MATTERHORN'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,						Item,				Favored,		StringVal)
SELECT  'CVS_SHAPUR_I_PlotEvaluation',	'Specific Feature',	1,				'FEATURE_ZHANGYE_DANXIA'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

--=============================================
-- Settlement Expansion AI courtesy ChimpanG
--=============================================
-----------------------------------------------
-- AiListTypes
-----------------------------------------------
INSERT INTO AiListTypes
        (ListType)
VALUES  ('LEADER_CVS_SHAPUR_I_SETTLEMENT');
-----------------------------------------------
-- AiLists
-----------------------------------------------
INSERT INTO AiLists
        (ListType,                             LeaderType,                    System)
VALUES  ('LEADER_CVS_SHAPUR_I_SETTLEMENT',    'TRAIT_LEADER_CVS_SHAPUR_I',    'SettlementPreferences');
-----------------------------------------------
-- AiFavoredItems
-----------------------------------------------
INSERT INTO AiFavoredItems
        (ListType,                            Item,						                     Value)
VALUES  -- Settlement
        ('LEADER_CVS_SHAPUR_I_SETTLEMENT',    'SETTLEMENT_MIN_VALUE_NEEDED',				 -25),
        ('LEADER_CVS_SHAPUR_I_SETTLEMENT',    'SETTLEMENT_ADDITIONAL_VALUE_PER_CITY',	     -1),
        ('LEADER_CVS_SHAPUR_I_SETTLEMENT',    'SETTLEMENT_DECAY_TURNS',                      -3),
        ('LEADER_CVS_SHAPUR_I_SETTLEMENT',    'SETTLEMENT_DECAY_AMOUNT',				     3),
        ('LEADER_CVS_SHAPUR_I_SETTLEMENT',    'SETTLEMENT_CITY_MINIMUM_VALUE',			 	 10),
        ('LEADER_CVS_SHAPUR_I_SETTLEMENT',    'SETTLEMENT_CITY_VALUE_MULTIPLIER',		 	 1);