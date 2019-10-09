--==========================================================================================================================
-- Boran / AI
--==========================================================================================================================
-----------------------------------------------	
-- FavoredReligions
-----------------------------------------------	
INSERT INTO FavoredReligions	
		(LeaderType,					ReligionType)
VALUES	('LEADER_CVS_BORAN',			'RELIGION_ZOROASTRIANISM');
-----------------------------------------------	
-- AiListTypes
-----------------------------------------------	
INSERT INTO AiListTypes	
		(ListType)
VALUES	('CVS_BORAN_Civics'),
		('CVS_BORAN_Techs'),
		('CVS_BORAN_Buildings'),
		('CVS_BORAN_Districts'),
		('CVS_BORAN_Yields'),
		('CVS_BORAN_PseudoYields'),
		('CVS_BORAN_Units'),
		('CVS_BORAN_FavorCulturalVictory'),
		('CVS_BORAN_Diplomacy'),
		('CVS_BORAN_CityStatePeace'),
		('CVS_BORAN_CityStateProtect'),
		('CVS_BORAN_Improvements');
-----------------------------------------------	
-- AiLists
-----------------------------------------------	
INSERT INTO AiLists	
		(ListType,							 AgendaType,									System)
VALUES	('CVS_BORAN_Civics',				 'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'Civics'),
		('CVS_BORAN_Techs',					 'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'Technologies'),
		('CVS_BORAN_Buildings',				 'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'Buildings'),
		('CVS_BORAN_Districts',				 'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'Districts'),
		('CVS_BORAN_Yields',				 'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'Yields'),
		('CVS_BORAN_PseudoYields',			 'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'PseudoYields'),
		('CVS_BORAN_Units',					 'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'Units'),
		('CVS_BORAN_FavorCulturalVictory',	 'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'Strategies'),
		('CVS_BORAN_Diplomacy',				 'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'DiplomaticActions'),
		('CVS_BORAN_CityStatePeace',		 'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'DiplomaticActions'),
		('CVS_BORAN_CityStateProtect',		 'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'DiplomaticActions'),
		('CVS_BORAN_Improvements',			 'TRAIT_AGENDA_CVS_BANBISHNAN_BANBISHN',		'Improvements');
-----------------------------------------------	
-- AiFavoredItems
-----------------------------------------------
-- YIELDS
INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item)
VALUES	('CVS_BORAN_Yields',			1,			'YIELD_PRODUCTION'),				-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_GPP_WRITER'),			-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_GPP_ARTIST'),			-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_GPP_MUSICIAN'),		-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_GREATWORK_SCULPTURE'),	-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_GREATWORK_RELIGIOUS'),	-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_GREATWORK_LANDSCAPE'),	-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_GREATWORK_ARTIFACT'),	-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_GREATWORK_WRITING'),	-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_GREATWORK_MUSIC'),		-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_CITY_DEFENSES'),		-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_DISTRICT'),		    -- Civilization
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_DEFENDING_UNITS'),		-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_INFLUENCE'),			-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_DIPLOMATIC_BONUS'),	-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_TOURISM'),				-- Leader
		('CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_WONDER');				-- Leader

		--===== Yields == VANILLA =====
INSERT INTO AiFavoredItems
		(ListType,						Favored,	Item)
SELECT	'CVS_BORAN_PseudoYields',		1,			'PSEUDOYIELD_GPP_MERCHANT'			-- Civilization
WHERE NOT EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- UNITS
INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item)
VALUES	('CVS_BORAN_Units',				1,			'UNIT_GREAT_ARTIST'),		-- Leader
		('CVS_BORAN_Units',				1,			'UNIT_GREAT_WRITER'),		-- Leader
		('CVS_BORAN_Units',				1,			'UNIT_GREAT_MUSICIAN'),		-- Leader
		('CVS_BORAN_Units',				1,			'UNIT_CVS_ASWAR');			-- Civilization

-- IMPROVEMENTS
INSERT INTO AiFavoredItems
		(ListType,						Favored,	Item)
VALUES	('CVS_BORAN_Improvements',		1,			'IMPROVEMENT_CVS_DIZ');		-- Leader

-- BUILDINGS & DISTRICTS
INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item)
VALUES	('CVS_BORAN_Buildings',			1,			'BUILDING_WALLS'),				-- Leader
		('CVS_BORAN_Buildings',			1,			'BUILDING_CASTLE'),				-- Leader
		('CVS_BORAN_Buildings',			1,			'BUILDING_STAR_FORT'),			-- Leader
		('CVS_BORAN_Buildings',			1,			'BUILDING_AMPHITHEATER'),		-- Leader
		('CVS_BORAN_Buildings',			1,			'BUILDING_MUSEUM_ART'),			-- Leader
		('CVS_BORAN_Buildings',			1,			'BUILDING_MUSEUM_ARTIFACT'),	-- Leader
		('CVS_BORAN_Districts',			1,			'DISTRICT_THEATER'),			-- Leader
		('CVS_BORAN_Districts',			1,			'DISTRICT_CVS_HUNTINGPARK');	-- Civilization

		--===== Buildings & Districts == EXPAC =====
INSERT INTO AiFavoredItems
		(ListType,						Favored,	Item)
SELECT	'CVS_BORAN_Districts',			1,			'DISTRICT_GOVERNMENT'   -- Civilization
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,						Favored,	Item)
SELECT	'CVS_BORAN_Buildings',			1,			'BUILDING_GOV_WIDE'		  -- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,						Favored,	Item)
SELECT	'CVS_BORAN_Buildings',			1,			'BUILDING_GOV_CITYSTATES' -- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,						Favored,	Item)
SELECT	'CVS_BORAN_Buildings',			1,			'BUILDING_GOV_CULTURE'	  -- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');


-- WONDERS
INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item)
VALUES	('CVS_BORAN_Buildings',			1,			'BUILDING_APADANA'),			-- Leader
		('CVS_BORAN_Buildings',			1,			'BUILDING_BOLSHOI_THEATRE'),	-- Leader
		('CVS_BORAN_Buildings',			1,			'BUILDING_BROADWAY'),			-- Leader
		('CVS_BORAN_Buildings',			1,			'BUILDING_CRISTO_REDENTOR'),	-- Leader
		('CVS_BORAN_Buildings',			1,			'BUILDING_HERMITAGE'),			-- Leader
		('CVS_BORAN_Buildings',			1,			'BUILDING_SYDNEY_OPERA_HOUSE');	-- Leader

		--===== Wonders == EXPAC =====
INSERT INTO AiFavoredItems	
		(ListType,						Favored,	Item)
SELECT  'CVS_BORAN_Buildings',			1,			'BUILDING_KILWA_KISIWANI'		-- Leader
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- CIVICS & TECHS
INSERT INTO AiFavoredItems	
		(ListType,					Item,							Favored)
VALUES	('CVS_BORAN_Civics',		'CIVIC_DEFENSIVE_TACTICS',		1), -- Leader
		('CVS_BORAN_Civics',		'CIVIC_POLITICAL_PHILOSOPHY',	1), -- Leader
		('CVS_BORAN_Civics',		'CIVIC_MILITARY_TRADITION',		1), -- Civilization
		('CVS_BORAN_Civics',		'CIVIC_FEUDALISM',				1), -- Civilization
		('CVS_BORAN_Civics',		'CIVIC_DIVINE_RIGHT',			1), -- Civilization
		('CVS_BORAN_Techs',			'TECH_MASONRY',					1), -- Leader
		('CVS_BORAN_Techs',			'TECH_SIEGE_TACTICS',			1), -- Leader
		('CVS_BORAN_Techs',			'TECH_CASTLES',					1); -- Leader

		--===== Civics & Techs == EXPAC =====
INSERT INTO AiFavoredItems
		(ListType,					Item,							Favored)
SELECT	'CVS_BORAN_Civics',			'CIVIC_STATE_WORKFORCE',		1	-- Civilization
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

-- VICTORIES
INSERT INTO AiFavoredItems	
		(ListType,							Item,									Value)
VALUES	('CVS_BORAN_FavorCulturalVictory',	'VICTORY_STRATEGY_CULTURAL_VICTORY',	-2);

-- WARS
INSERT INTO AiFavoredItems	
		(ListType,							Item,									Favored)
VALUES	('CVS_BORAN_CityStatePeace',		'DIPLOACTION_DECLARE_WAR_MINOR_CIV',	0),
		('CVS_BORAN_CityStateProtect',		'DIPLOACTION_DECLARE_PROTECTORATE_WAR',	1);

		--===== Diplomacy == EXPAC =====
INSERT INTO AiFavoredItems
		(ListType,							Item,								Favored)
SELECT	'CVS_BORAN_Diplomacy',				'DIPLOACTION_ALLIANCE_CULTURAL',	1
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');

INSERT INTO AiFavoredItems
		(ListType,							Item,								Favored)
SELECT	'CVS_BORAN_Diplomacy',				'DIPLOACTION_ALLIANCE_ECONOMIC',	1
WHERE EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');