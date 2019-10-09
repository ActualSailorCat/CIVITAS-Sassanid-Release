--==========================================================================================================================
-- GEDEMON'S YNAEMP
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS StartPosition (MapName TEXT, Civilization TEXT, Leader TEXT, X INT default 0, Y INT default 0);

INSERT INTO StartPosition
		(Civilization,						Leader,				MapName,			X,		Y)
SELECT	'CIVILIZATION_CVS_SASANIAN',		LeaderType,			'GiantEarth',		41,		51
FROM	CivilizationLeaders
WHERE	CivilizationType = 'CIVILIZATION_CVS_SASANIAN';

INSERT INTO StartPosition
		(Civilization,						Leader,				MapName,			X,		Y)
SELECT	'CIVILIZATION_CVS_SASANIAN',		LeaderType,			'GreatestEarthMap',	63,		41
FROM	CivilizationLeaders
WHERE	CivilizationType = 'CIVILIZATION_CVS_SASANIAN';

INSERT INTO StartPosition
		(Civilization,						Leader,				MapName,			X,		Y)
SELECT	'CIVILIZATION_CVS_SASANIAN',		LeaderType,			'CordiformEarth',	50,		23
FROM	CivilizationLeaders
WHERE	CivilizationType = 'CIVILIZATION_CVS_SASANIAN';

