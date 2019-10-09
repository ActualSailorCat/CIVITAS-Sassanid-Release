--==========================================================================================================================
-- Kawad I / Ai
--==========================================================================================================================
-----------------------------------------------	
-- FavoredReligions
-----------------------------------------------	
INSERT INTO FavoredReligions	
		(LeaderType,					ReligionType)
VALUES	('LEADER_SAILOR_KAWAD_I',		'RELIGION_ZOROASTRIANISM');
-----------------------------------------------	
-- AiListTypes
-----------------------------------------------	
INSERT INTO AiListTypes	
		(ListType)
VALUES	('SAILOR_KAWAD_I_Civics'),
		('SAILOR_KAWAD_I_Techs'),
		('SAILOR_KAWAD_I_Buildings'),
		('SAILOR_KAWAD_I_Districts'),
		('SAILOR_KAWAD_I_PseudoYields'),
		('SAILOR_KAWAD_I_Units'),
		('SAILOR_KAWAD_I_FavorReligiousVictory'),
		('SAILOR_KAWAD_I_Yields'),
		('SAILOR_KAWAD_I_Diplomacy'),
		('SAILOR_KAWAD_I_Spy');
-----------------------------------------------	
-- AiLists
-----------------------------------------------	
INSERT INTO AiLists	
		(ListType,									 AgendaType,						System)
VALUES	('SAILOR_KAWAD_I_Civics',					 'TRAIT_AGENDA_SAILOR_TTBAM',		'Civics'),
		('SAILOR_KAWAD_I_Techs',					 'TRAIT_AGENDA_SAILOR_TTBAM',		'Technologies'),
		('SAILOR_KAWAD_I_Buildings',				 'TRAIT_AGENDA_SAILOR_TTBAM',		'Buildings'),
		('SAILOR_KAWAD_I_Districts',				 'TRAIT_AGENDA_SAILOR_TTBAM',		'Districts'),
		('SAILOR_KAWAD_I_PseudoYields',				 'TRAIT_AGENDA_SAILOR_TTBAM',		'PseudoYields'),
		('SAILOR_KAWAD_I_Units',					 'TRAIT_AGENDA_SAILOR_TTBAM',		'Units'),
		('SAILOR_KAWAD_I_FavorReligiousVictory',	 'TRAIT_AGENDA_SAILOR_TTBAM',		'Strategies'),
		('SAILOR_KAWAD_I_Diplomacy',				 'TRAIT_AGENDA_SAILOR_TTBAM',		'DiplomaticActions'),
		('SAILOR_KAWAD_I_Spy',						 'TRAIT_AGENDA_SAILOR_TTBAM',		'DiplomaticActions');
-----------------------------------------------	
-- AiFavoredItems
-----------------------------------------------
INSERT INTO AiFavoredItems	
		(ListType,							Favored,	Value,		Item)
VALUES	('SAILOR_KAWAD_I_Buildings',		1,			50,			'BUILDING_AMARGAR'),  
		('SAILOR_KAWAD_I_Buildings',		1,			50,			'BUILDING_EIFFEL_TOWER'),  
		('SAILOR_KAWAD_I_Buildings',		1,			50,			'BUILDING_SHRINE'),
		('SAILOR_KAWAD_I_Buildings',		1,			50,			'BUILDING_TEMPLE'),
		('SAILOR_KAWAD_I_Districts',		1,			50,			'DISTRICT_COMMERCIAL_HUB'),  
		('SAILOR_KAWAD_I_Districts',		1,			25,			'DISTRICT_HOLY_SITE'),
		('SAILOR_KAWAD_I_Districts',		1,			50,			'DISTRICT_SAILOR_HUNTINGPARK'), 
		('SAILOR_KAWAD_I_PseudoYields',		1,			50,			'PSEUDOYIELD_GPP_MERCHANT'), 
		('SAILOR_KAWAD_I_PseudoYields',		1,			50,			'PSEUDOYIELD_GPP_PROPHET'),
		('SAILOR_KAWAD_I_Units',			1,			50,			'UNIT_GREAT_MERCHANT'),
		('SAILOR_KAWAD_I_Units',			1,			50,			'UNIT_GREAT_PROPHET'),
		('SAILOR_KAWAD_I_Units',			1,			50,			'UNIT_SAILOR_ASWAR'),
		('SAILOR_KAWAD_I_Units',			1,			100,		'UNIT_TRADER'),
		('SAILOR_KAWAD_I_Units',			1,			250,		'UNIT_SPY'),
		('SAILOR_KAWAD_I_Diplomacy',		1,			250,		'DIPLOACTION_PROPOSE_TRADE');
		-- Civics & Techs
INSERT INTO AiFavoredItems	
		(ListType,							Item)
VALUES	('SAILOR_KAWAD_I_Civics',			'CIVIC_FEUDALISM'),
		('SAILOR_KAWAD_I_Civics',			'CIVIC_MILITARY_TRADITION'),
		('SAILOR_KAWAD_I_Civics',			'CIVIC_MERCANTILISM'),
		('SAILOR_KAWAD_I_Civics',			'CIVIC_FOREIGN_TRADE'),
		('SAILOR_KAWAD_I_Civics',			'CIVIC_CIVIL_SERVICE'),
		('SAILOR_KAWAD_I_Civics',			'CIVIC_THEOLOGY'),
		('SAILOR_KAWAD_I_Civics',			'CIVIC_DIVINE_RIGHT'),
		('SAILOR_KAWAD_I_Civics',			'CIVIC_MERCENARIES'),
		('SAILOR_KAWAD_I_Civics',			'CIVIC_DIPLOMATIC_SERVICE'),
		('SAILOR_KAWAD_I_Civics',			'CIVIC_NATIONALISM'),
		('SAILOR_KAWAD_I_Civics',			'CIVIC_IDEOLOGY'),
		('SAILOR_KAWAD_I_Civics',			'CIVIC_COLD_WAR'),

		('SAILOR_KAWAD_I_Techs',			'TECH_CURRENCY'),
		('SAILOR_KAWAD_I_Techs',			'TECH_SAILING'),
		('SAILOR_KAWAD_I_Techs',			'TECH_SHIPBUILDING'),
		('SAILOR_KAWAD_I_Techs',			'TECH_CARTOGRAPHY'),
		('SAILOR_KAWAD_I_Techs',			'TECH_CELESTIAL_NAVIGATION'),
		('SAILOR_KAWAD_I_Techs',			'TECH_COMPUTERS'),
		('SAILOR_KAWAD_I_Techs',			'TECH_ASTROLOGY');

INSERT INTO AiFavoredItems	
		(ListType,									Item,									Value)
VALUES	('SAILOR_KAWAD_I_FavorReligiousVictory',	'VICTORY_STRATEGY_RELIGIOUS_VICTORY',	-1);

INSERT INTO AiFavoredItems	
		(ListType,									Item,									Favored)
VALUES	('SAILOR_KAWAD_I_Spy',						'DIPLOACTION_KEEP_PROMISE_DONT_SPY',	0);
