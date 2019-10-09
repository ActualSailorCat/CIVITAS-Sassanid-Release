-----------------------------------------------
-- 40sw4rm's "Old World"
-----------------------------------------------
CREATE TABLE IF NOT EXISTS TSL 
    (
    MapType TEXT DEFAULT NULL,
    Civ TEXT DEFAULT NULL,
    LeaderType TEXT DEFAULT NULL,
    X INTEGER DEFAULT NULL,
    Y INTEGER DEFAULT NULL
    );

INSERT INTO TSL
		(MapType,		Civ,							LeaderType,		X,	Y)
SELECT	'40sw4rmOW',	'CIVILIZATION_CVS_SASANIAN',	LeaderType,		47,	37
FROM	CivilizationLeaders
WHERE	CivilizationType = 'CIVILIZATION_CVS_SASANIAN';