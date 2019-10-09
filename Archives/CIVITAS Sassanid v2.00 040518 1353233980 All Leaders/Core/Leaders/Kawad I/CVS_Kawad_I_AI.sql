--==========================================================================================================================
-- Kawad I / Ai
--==========================================================================================================================
-----------------------------------------------	
-- FavoredReligions
-----------------------------------------------	
INSERT INTO FavoredReligions	
		(LeaderType,				ReligionType)
VALUES	('LEADER_CVS_KAWAD_I',		'RELIGION_ZOROASTRIANISM');
-----------------------------------------------	
-- AiListTypes
-----------------------------------------------	
INSERT INTO AiListTypes	
		(ListType)
VALUES	('CVS_KAWAD_I_Civics'),
		('CVS_KAWAD_I_Techs'),
		('CVS_KAWAD_I_Buildings'),
		('CVS_KAWAD_I_Districts'),
		('CVS_KAWAD_I_PseudoYields'),
		('CVS_KAWAD_I_Units'),
		('CVS_KAWAD_I_FavorReligiousVictory'),
		('CVS_KAWAD_I_Yields'),
		('CVS_KAWAD_I_Diplomacy'),
		('CVS_KAWAD_I_Spy'),
		('CVS_KAWAD_I_PlotEvaluation'),
		('CVS_KAWAD_I_Improvements');
-----------------------------------------------	
-- AiLists
-----------------------------------------------	
INSERT INTO AiLists	
		(ListType,								 AgendaType,					System)
VALUES	('CVS_KAWAD_I_Civics',					 'TRAIT_AGENDA_CVS_TTBAM',		'Civics'),
		('CVS_KAWAD_I_Techs',					 'TRAIT_AGENDA_CVS_TTBAM',		'Technologies'),
		('CVS_KAWAD_I_Buildings',				 'TRAIT_AGENDA_CVS_TTBAM',		'Buildings'),
		('CVS_KAWAD_I_Districts',				 'TRAIT_AGENDA_CVS_TTBAM',		'Districts'),
		('CVS_KAWAD_I_PseudoYields',			 'TRAIT_AGENDA_CVS_TTBAM',		'PseudoYields'),
		('CVS_KAWAD_I_Yields',					 'TRAIT_AGENDA_CVS_TTBAM',		'Yields'),
		('CVS_KAWAD_I_Units',					 'TRAIT_AGENDA_CVS_TTBAM',		'Units'),
		('CVS_KAWAD_I_FavorReligiousVictory',	 'TRAIT_AGENDA_CVS_TTBAM',		'Strategies'),
		('CVS_KAWAD_I_Diplomacy',				 'TRAIT_AGENDA_CVS_TTBAM',		'DiplomaticActions'),
		('CVS_KAWAD_I_Spy',						 'TRAIT_AGENDA_CVS_TTBAM',		'DiplomaticActions'),
		('CVS_KAWAD_I_PlotEvaluation',			 'TRAIT_AGENDA_CVS_TTBAM',		'PlotEvaluation'),
		('CVS_KAWAD_I_Improvements',			 'TRAIT_AGENDA_CVS_TTBAM',		'Improvements');
-----------------------------------------------	
-- AiFavoredItems
-----------------------------------------------
-- YIELDS
INSERT INTO AiFavoredItems	
		(ListType,							Favored,	Item)
VALUES	('CVS_KAWAD_I_Yields',				1,			'YIELD_FAITH'),					 -- Leader
		('CVS_KAWAD_I_PseudoYields',		1,			'PSEUDOYIELD_GPP_PROPHET'),		 -- Leader
		('CVS_KAWAD_I_PseudoYields',		1,			'PSEUDOYIELD_GREATWORK_RELIC'),  -- Leader
		('CVS_KAWAD_I_PseudoYields',		1,			'PSEUDOYIELD_DISTRICT'),		 -- Civilization
		('CVS_KAWAD_I_PseudoYields',		1,			'PSEUDOYIELD_IMPROVEMENT');		 -- Leader

-- UNITS
INSERT INTO AiFavoredItems	
		(ListType,							Favored,	Item)
VALUES	('CVS_KAWAD_I_Units',				1,			'UNIT_GREAT_PROPHET'),		 -- Leader
		('CVS_KAWAD_I_Units',				1,			'UNIT_CVS_KAWAD_I_UU'),	     -- Leader
		('CVS_KAWAD_I_Units',				1,			'UNIT_APOSTLE'),			 -- Leader
		('CVS_KAWAD_I_Units',				1,			'UNIT_MISSIONARY'),			 -- Leader
		('CVS_KAWAD_I_Units',				1,			'UNIT_SPY'),				 -- Leader
		('CVS_KAWAD_I_Units',				1,			'UNIT_TRADER'),				 -- Leader
		('CVS_KAWAD_I_Units',				1,			'UNIT_CVS_ASWAR');			 -- Civilization

-- IMPROVEMENTS
INSERT INTO AiFavoredItems
		(ListType,							Favored,	Item)
VALUES	('CVS_KAWAD_I_Improvements',		1,			'IMPROVEMENT_CVS_AMARGAR');  -- Leader

-- BUILDINGS & DISTRICTS
INSERT INTO AiFavoredItems	
		(ListType,							Favored,	Item)
VALUES	('CVS_KAWAD_I_Buildings',			1,			'BUILDING_SHRINE'),				-- Leader
		('CVS_KAWAD_I_Buildings',			1,			'BUILDING_TEMPLE'),				-- Leader
		('CVS_KAWAD_I_Districts',			1,			'DISTRICT_HOLY_SITE'),			-- Leader
		('CVS_KAWAD_I_Districts',			1,			'DISTRICT_CVS_HUNTINGPARK');	-- Civilization

		--===== Buildings & Districts == EXPAC =====
INSERT INTO AiFavoredItems
		(ListType,							Favored,	Item)
SELECT	'CVS_KAWAD_I_Districts',			1,			'DISTRICT_GOVERNMENT'		    -- Civilization
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,							Favored,	Item)
SELECT	'CVS_KAWAD_I_Districts',			1,			'BUILDING_GOV_WIDE'				-- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,							Favored,	Item)
SELECT	'CVS_KAWAD_I_Districts',			1,			'BUILDING_GOV_SPIES'		    -- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,							Favored,	Item)
SELECT	'CVS_KAWAD_I_Districts',			1,			'BUILDING_GOV_SCIENCE'			-- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');


-- WONDERS
INSERT INTO AiFavoredItems	
		(ListType,							Favored,	Item)
VALUES	('CVS_KAWAD_I_Buildings',			1,			'BUILDING_GREAT_ZIMBABWE'),		-- Leader
		('CVS_KAWAD_I_Buildings',			1,			'BUILDING_MAHABODHI_TEMPLE'),	-- Leader
		('CVS_KAWAD_I_Buildings',			1,			'BUILDING_MONT_ST_MICHEL'),		-- Leader
		('CVS_KAWAD_I_Buildings',			1,			'BUILDING_BIG_BEN');			-- Leader

		--===== Wonders == EXPAC ======
INSERT INTO AiFavoredItems
		(ListType,							Favored,	Item)
SELECT	'CVS_KAWAD_I_Buildings',			1,			'BUILDING_ST_BASILS_CATHEDRAL'	-- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- CIVICS & TECHS
INSERT INTO AiFavoredItems	
		(ListType,						Item,							Favored)
VALUES	('CVS_KAWAD_I_Civics',			'CIVIC_THEOLOGY',				1), -- Leader
		('CVS_KAWAD_I_Civics',			'CIVIC_DIPLOMATIC_SERVICE',		1), -- Leader
		('CVS_KAWAD_I_Civics',			'CIVIC_NATIONALISM',			1), -- Leader
		('CVS_KAWAD_I_Civics',			'CIVIC_IDEOLOGY',				1), -- Leader
		('CVS_KAWAD_I_Civics',			'CIVIC_COLD_WAR',				1), -- Leader
		('CVS_KAWAD_I_Civics',			'CIVIC_MILITARY_TRADITION',		1), -- Civilization
		('CVS_KAWAD_I_Civics',			'CIVIC_FEUDALISM',				1), -- Civilization
		('CVS_KAWAD_I_Civics',			'CIVIC_DIVINE_RIGHT',			1), -- Civilization
		('CVS_KAWAD_I_Techs',			'TECH_ASTROLOGY',				1), -- Leader
		('CVS_KAWAD_I_Techs',			'TECH_CURRENCY',				1); -- Leader

		--===== Civics & Techs == EXPAC =====
INSERT INTO AiFavoredItems
		(ListType,						Item,							Favored)
SELECT	'CVS_KAWAD_I_Civics',			'CIVIC_STATE_WORKFORCE',		1	-- Civilization
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- VICTORIES
INSERT INTO AiFavoredItems	
		(ListType,								Item,									Value)
VALUES	('CVS_KAWAD_I_FavorReligiousVictory',	'VICTORY_STRATEGY_RELIGIOUS_VICTORY',	-1);

-- DIPLOMACY
INSERT INTO AiFavoredItems	
		(ListType,								Item,									Favored)
VALUES	('CVS_KAWAD_I_Spy',						'DIPLOACTION_KEEP_PROMISE_DONT_SPY',	0);

		--===== Diplomacy == EXPAC =====
INSERT INTO AiFavoredItems
		(ListType,						Item,								Favored)
SELECT	'CVS_KAWAD_I_Diplomacy',		'DIPLOACTION_ALLIANCE_RELIGIOUS',	1
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,						Item,								Favored)
SELECT	'CVS_KAWAD_I_Diplomacy',		'DIPLOACTION_ALLIANCE_ECONOMIC',	1
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- PLOT EVALUATION

		--===== Plot Evaluation == EXPAC =====
INSERT INTO AiFavoredItems
		(ListType,						Item,				Favored,	StringVal)
SELECT  'CVS_KAWAD_I_PlotEvaluation',	'Specific Feature',	1,			'FEATURE_EVEREST'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,						Item,				Favored,	StringVal)
SELECT  'CVS_KAWAD_I_PlotEvaluation',	'Specific Feature',	1,			'FEATURE_ULURU'
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');