--==========================================================================================================================
--
--            .
--            |\
--            | \
--            |  \
--            |   \
--            |    \          SHAPUR I by CIVITAS
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
-- Shapur I / Defines
--==========================================================================================================================
-----------------------------------------------
-- Types
-----------------------------------------------	
INSERT INTO Types	
		(Type,									Kind)
VALUES	('LEADER_CVS_SHAPUR_I',					'KIND_LEADER');
-----------------------------------------------	
-- Leaders
-----------------------------------------------	
INSERT INTO Leaders	
		(LeaderType,							Name,								Sex,		InheritFrom,		SceneLayers)
VALUES	('LEADER_CVS_SHAPUR_I',					'LOC_LEADER_CVS_SHAPUR_I_NAME',		'Male',		'LEADER_DEFAULT',	2);	
-----------------------------------------------
-- CivilizationLeaders
-----------------------------------------------	
INSERT INTO	CivilizationLeaders
		(CivilizationType,						LeaderType,					CapitalName)
VALUES	('CIVILIZATION_CVS_SASANIAN',			'LEADER_CVS_SHAPUR_I',		'LOC_CITY_NAME_SC_CTESIPHON');
-----------------------------------------------	
-- PlayerColors
-----------------------------------------------	
/*INSERT INTO PlayerColors	
		(Type,									Usage,			PrimaryColor, 							SecondaryColor,								TextColor)
VALUES	('LEADER_CVS_SHAPUR_I',					'Unique',		'COLOR_PLAYER_CVS_SHAPUR_I_PRIMARY',	'COLOR_PLAYER_CVS_SHAPUR_I_SECONDARY', 		'COLOR_PLAYER_WHITE_TEXT');	

INSERT INTO Colors
        (Type,									 Color)
VALUES  ('COLOR_PLAYER_CVS_SHAPUR_I_PRIMARY',    '121,92,79,255'),
		('COLOR_PLAYER_CVS_SHAPUR_I_SECONDARY',  '119,204,180,255');*/
-----------------------------------------------		
-- BackGround Art		
-----------------------------------------------			
INSERT INTO DiplomacyInfo			
		(Type,						BackgroundImage)
VALUES	('LEADER_CVS_SHAPUR_I',		'ART_LEADER_CVS_SHAPUR_I.dds');
-----------------------------------------------
-- LeaderQuotes
-----------------------------------------------	
INSERT INTO LeaderQuotes	
		(LeaderType,				Quote)
VALUES	('LEADER_CVS_SHAPUR_I',		'LOC_PEDIA_LEADERS_PAGE_LEADER_CVS_SHAPUR_I_QUOTE');	
--==========================================================================================================================
-- LEADERS: LOADING INFO
--==========================================================================================================================
-----------------------------------------------	
-- LoadingInfo
-----------------------------------------------	
INSERT INTO LoadingInfo	
		(LeaderType,				BackgroundImage, 						ForegroundImage,						PlayDawnOfManAudio)
VALUES	('LEADER_CVS_SHAPUR_I',		'LEADER_CVS_SHAPUR_I_BACKGROUND',		'LEADER_CVS_SHAPUR_I_NEUTRAL',			0);	
--==========================================================================================================================
-- Fin
--==========================================================================================================================