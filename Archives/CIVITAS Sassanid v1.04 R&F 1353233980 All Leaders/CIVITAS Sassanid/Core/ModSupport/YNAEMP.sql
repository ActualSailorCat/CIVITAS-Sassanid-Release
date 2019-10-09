--==========================================================================================================================
-- GEDEMON'S YNAEMP
--==========================================================================================================================

CREATE TABLE IF NOT EXISTS StartPosition (MapName TEXT, Civilization TEXT, Leader TEXT, X INT default 0, Y INT default 0);
INSERT INTO StartPosition
		(Civilization,						Leader,											MapName,			X,		Y	)
VALUES	('CIVILIZATION_SAILOR_SASANIAN',	'LEADER_SAILOR_KAWAD_I',						'GiantEarth',		41,		51	),
		('CIVILIZATION_SAILOR_SASANIAN',	'LEADER_SAILOR_KAWAD_I',						'GreatestEarthMap',	63,		41	), 
		('CIVILIZATION_SAILOR_SASANIAN',	'LEADER_SAILOR_KAWAD_I',						'CordiformEarth',	50,		23	);