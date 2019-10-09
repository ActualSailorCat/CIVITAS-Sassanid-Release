-----------------------------------------------
-- TOMATEKH'S HISTORICAL RELIGIONS
-----------------------------------------------
INSERT INTO FavoredReligions
		(LeaderType,			ReligionType)
SELECT	'LEADER_SAILOR_KAWAD_I',		ReligionType
FROM FavoredReligions WHERE LeaderType = 'LEADER_CYRUS';

CREATE TRIGGER KawadReligion
AFTER INSERT ON FavoredReligions
WHEN NEW.LeaderType = 'LEADER_CYRUS'
BEGIN
	INSERT INTO FavoredReligions
			(LeaderType,			ReligionType)
	VALUES	('LEADER_SAILOR_KAWAD_I',	NEW.ReligionType);
END;
