--==========================================================================================================================
--
--            .
--            |\
--            | \
--            |  \
--            |   \
--            |    \          CIVITAS Sassanid Leader Settings
--            |     \			CREDIT AND THANKS TO JFD
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
CREATE TABLE IF NOT EXISTS 
CIVITAS_Sassanid_Leader_Settings (
	LeaderType text default null,
	Value integer default 1);
--==========================================================================================================================
-- Instructions:
-- If you would like to disable certain leaders,
-- or whether Sassanid leaders receive the Satrap's Court,
-- change the entries in the table below.
--
-- 1: Enabled
-- 0: Disabled
--==========================================================================================================================
INSERT INTO CIVITAS_Sassanid_Leader_Settings
		(LeaderType,			Value)
VALUES	('LEADER_CVS_BORAN',	1), -- Controls Boran
		('LEADER_CVS_KAWAD_I',	1), -- Controls Kawad I
		('LEADER_CVS_SHAPUR_I',	1), -- Controls Shapur I
		('LEADER_SATRAPSCOURT',	0); -- Controls Satraps Court