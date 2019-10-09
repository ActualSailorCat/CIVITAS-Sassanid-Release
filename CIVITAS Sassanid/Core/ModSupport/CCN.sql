-----------------------------------------------
-- C15 AND SEELINGCAT'S COLONIAL CITY NAMES
-----------------------------------------------
CREATE TABLE IF NOT EXISTS C15_ColonyCityNames (CivilizationType TEXT NOT NULL, LeaderType TEXT DEFAULT NULL, CityName TEXT NOT NULL, PRIMARY KEY (CivilizationType, LeaderType, CityName));

CREATE TRIGGER IF NOT EXISTS C15_ColonyCityNames_RemoveFromCityNames
AFTER INSERT ON C15_ColonyCityNames
BEGIN
	DELETE FROM CityNames WHERE CityName = NEW.CityName AND (CivilizationType = NEW.CivilizationType OR LeaderType = NEW.LeaderType);
END;

CREATE TRIGGER IF NOT EXISTS C15_ColonyCityNames_DupeAddedToCityNames
AFTER INSERT ON CityNames
WHEN NEW.CityName IN (SELECT CityName FROM C15_ColonyCityNames WHERE CivilizationType = NEW.CivilizationType)
BEGIN
	DELETE FROM CityNames WHERE CityName = NEW.CityName AND CivilizationType = NEW.CivilizationType;
END;

INSERT OR REPLACE INTO C15_ColonyCityNames
		(CivilizationType,				CityName)
SELECT	'CIVILIZATION_CVS_SASANIAN',	CityName
FROM C15_ColonyCityNames WHERE CivilizationType = 'CIVILIZATION_PERSIA';

CREATE TRIGGER IF NOT EXISTS CVS_Sassanid_CCNStealPersia
AFTER INSERT ON C15_ColonyCityNames
WHEN NEW.CivilizationType = 'CIVILIZATION_PERSIA'
BEGIN
	INSERT OR REPLACE INTO C15_ColonyCityNames
			(CivilizationType,				CityName)
	VALUES	('CIVILIZATION_CVS_SASANIAN',	NEW.CityName);
END;