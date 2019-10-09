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
-- Kawad I / Defines
--==========================================================================================================================
-----------------------------------------------
-- Types
-----------------------------------------------	
INSERT INTO Types	
		(Type,										Kind)
VALUES	('LEADER_SAILOR_KAWAD_I',					'KIND_LEADER');
-----------------------------------------------	
-- Leaders
-----------------------------------------------	
INSERT INTO Leaders	
		(LeaderType,					Name,									Sex,		InheritFrom,		SceneLayers)
VALUES	('LEADER_SAILOR_KAWAD_I',		'LOC_LEADER_SAILOR_KAWAD_I_NAME',		'Male',		'LEADER_DEFAULT',	2);	
-----------------------------------------------
-- CivilizationLeaders
-----------------------------------------------	
INSERT INTO CivilizationLeaders	
		(CivilizationType,						LeaderType,						CapitalName)
VALUES	('CIVILIZATION_SAILOR_SASANIAN',		'LEADER_SAILOR_KAWAD_I',		'LOC_CITY_NAME_SC_CTESIPHON');
-----------------------------------------------	
-- PlayerColors
-----------------------------------------------	
INSERT INTO PlayerColors	
		(Type,							Usage,			PrimaryColor, 												SecondaryColor,													TextColor)
VALUES	('LEADER_SAILOR_KAWAD_I',		'Unique',		'COLOR_PLAYER_SAILOR_SASANIAN_SAILOR_KAWAD_I_PRIMARY',		'COLOR_PLAYER_SAILOR_SASANIAN_SAILOR_KAWAD_I_SECONDARY', 		'COLOR_PLAYER_WHITE_TEXT');	

INSERT INTO Colors 
		(Type, 																Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_SAILOR_SASANIAN_SAILOR_KAWAD_I_PRIMARY', 			0.518,	0.392,	0.596,	1),
		('COLOR_PLAYER_SAILOR_SASANIAN_SAILOR_KAWAD_I_SECONDARY', 			0.890,	0.886,	0.565,	1);
-----------------------------------------------		
-- BackGround Art		
-----------------------------------------------			
INSERT INTO DiplomacyInfo			
		(Type,							BackgroundImage)
VALUES	('LEADER_SAILOR_KAWAD_I',		'ART_LEADER_SAILOR_KAWAD_I.dds');
-----------------------------------------------
-- LeaderQuotes
-----------------------------------------------	
INSERT INTO LeaderQuotes	
		(LeaderType,				Quote)
VALUES	('LEADER_SAILOR_KAWAD_I',	'LOC_PEDIA_LEADERS_PAGE_LEADER_SAILOR_KAWAD_I_QUOTE');	
--==========================================================================================================================
-- LEADERS: LOADING INFO
--==========================================================================================================================
-----------------------------------------------	
-- LoadingInfo
-----------------------------------------------	
INSERT INTO LoadingInfo	
		(LeaderType,					BackgroundImage, 						ForegroundImage,						PlayDawnOfManAudio)
VALUES	('LEADER_SAILOR_KAWAD_I',		'LEADER_SAILOR_KAWAD_I_BACKGROUND',		'LEADER_SAILOR_KAWAD_I_NEUTRAL',	0);	
