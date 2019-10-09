--==========================================================================================================================
--
--            .
--            |\
--            | \
--            |  \
--            |   \
--            |    \          Boran by CIVITAS
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
-- Boran / Defines
--==========================================================================================================================
-----------------------------------------------
-- Types
-----------------------------------------------	
INSERT INTO Types	
		(Type,									Kind)
VALUES	('LEADER_CVS_BORAN',					'KIND_LEADER');
-----------------------------------------------	
-- Leaders
-----------------------------------------------	
INSERT INTO Leaders	
		(LeaderType,							Name,								Sex,		InheritFrom,		SceneLayers)
VALUES	('LEADER_CVS_BORAN',					'LOC_LEADER_CVS_BORAN_NAME',		'Female',	'LEADER_DEFAULT',	2);	
-----------------------------------------------
-- CivilizationLeaders
-----------------------------------------------	
INSERT INTO	CivilizationLeaders
		(CivilizationType,						LeaderType,					CapitalName)
VALUES	('CIVILIZATION_CVS_SASANIAN',			'LEADER_CVS_BORAN',		'LOC_CITY_NAME_SC_CTESIPHON');
-----------------------------------------------	
-- PlayerColors
-----------------------------------------------	
INSERT INTO PlayerColors	
		(Type,									Usage,			PrimaryColor, 							SecondaryColor,								TextColor)
VALUES	('LEADER_CVS_BORAN',					'Unique',		'COLOR_PLAYER_CVS_BORAN_PRIMARY',	'COLOR_PLAYER_CVS_BORAN_SECONDARY', 		'COLOR_PLAYER_WHITE_TEXT');	

INSERT INTO Colors
        (Type,									Color)
VALUES  ('COLOR_PLAYER_CVS_BORAN_PRIMARY',		'198,62,101,255'),
		('COLOR_PLAYER_CVS_BORAN_SECONDARY',	'246,220,215,255');
-----------------------------------------------		
-- BackGround Art		
-----------------------------------------------			
INSERT INTO DiplomacyInfo			
		(Type,									BackgroundImage)
VALUES	('LEADER_CVS_BORAN',					'ART_LEADER_CVS_BORAN.dds');
-----------------------------------------------
-- LeaderQuotes
-----------------------------------------------	
INSERT INTO LeaderQuotes	
		(LeaderType,							Quote)
VALUES	('LEADER_CVS_BORAN',					'LOC_PEDIA_LEADERS_PAGE_LEADER_CVS_BORAN_QUOTE');	
--==========================================================================================================================
-- LEADERS: LOADING INFO
--==========================================================================================================================
-----------------------------------------------	
-- LoadingInfo
-----------------------------------------------	
INSERT INTO LoadingInfo	
		(LeaderType,							BackgroundImage, 						ForegroundImage,					PlayDawnOfManAudio)
VALUES	('LEADER_CVS_BORAN',					'LEADER_CVS_BORAN_BACKGROUND',		'LEADER_CVS_BORAN_NEUTRAL',			0);	