-----------------------------------------------
-- JFD'S RULE WITH FAITH
-----------------------------------------------

CREATE TABLE IF NOT EXISTS 
	Civilization_Titles (
	CivilizationType  				text 		 		default null,
	GovernmentType					text 	 			default null,
	LeaderTitle						text				default null,
	PolicyType  					text 		 		default null);

CREATE TABLE IF NOT EXISTS 
	Leader_Titles (
	LeaderType  			text 		 		DEFAULT NULL,
	GovernmentType			text 	 			DEFAULT NULL,
	LeaderTitle				text				DEFAULT NULL,
	PolicyType  			text 		 		DEFAULT NULL,
	UseFeminine				BOOLEAN				DEFAULT 0,
	TitleIsFullName			BOOLEAN				DEFAULT 0);
	
INSERT INTO Civilization_Titles
		(CivilizationType, 			GovernmentType, 								PolicyType,				LeaderTitle)
VALUES	('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_CHIEFDOM',						null,					'LOC_GOVERNMENT_JFD_CHIEFDOM_LEADER_TITLE_SAILOR_SASANIAN'),						--Chiefdom	-- Salar
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_JFD_HORDE',						null,					'LOC_GOVERNMENT_JFD_HORDE_LEADER_TITLE_SAILOR_SASANIAN'),						--Horde	-- Marzb?n
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_JFD_POLIS',						null,					'LOC_GOVERNMENT_JFD_POLIS_LEADER_TITLE_SAILOR_SASANIAN'),						--Polis -- Mobed
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_AUTOCRACY',						null,					'LOC_GOVERNMENT_JFD_AUTOCRACY_LEADER_TITLE_SAILOR_SASANIAN'),					--Autocracy -- �?h
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_OLIGARCHY',						null,					'LOC_GOVERNMENT_JFD_OLIGARCHY_LEADER_TITLE_SAILOR_SASANIAN'),					--Oligarchy -- ?z?d
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_CLASSICAL_REPUBLIC',			null,					'LOC_GOVERNMENT_JFD_CLASSICAL_DEMOCRACY_LEADER_TITLE_SAILOR_SASANIAN'),			--Classical Democracy -- Wuzurg
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_MONARCHY',						null,					'LOC_GOVERNMENT_JFD_FEUDAL_MONARCHY_LEADER_TITLE_SAILOR_SASANIAN'),				--Feudal Monarchy -- �?han�?h
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_MERCHANT_REPUBLIC',				null,					'LOC_GOVERNMENT_JFD_MERCHANT_REPUBLIC_LEADER_TITLE_SAILOR_SASANIAN'),			--Merchant Republic -- Kirrogbed
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_THEOCRACY',						null,					'LOC_GOVERNMENT_JFD_GOVERNMENT_THEOCRACY_LEADER_TITLE_SAILOR_SASANIAN'),			--Theocracy -- Mobadan Mobad
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_JFD_ABSOLUTE_MONARCHY',			null,					'LOC_GOVERNMENT_JFD_MONARCHY_LEADER_TITLE_SAILOR_SASANIAN'),						--Absolute Monarchy -- �?han�?h
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_JFD_CONSTITUTIONAL_MONARCHY',	null,					'LOC_GOVERNMENT_JFD_MONARCHY_LEADER_TITLE_SAILOR_SASANIAN'),						--Constitutional Monarchy -- �?han�?h
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_JFD_NOBLE_REPUBLIC',			null,					'LOC_GOVERNMENT_JFD_OLIGARCHY_LEADER_TITLE_SAILOR_SASANIAN'),					--Noble Republic -- Darandarzbad
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_DEMOCRACY',						null,					'LOC_GOVERNMENT_JFD_LIBERAL_DEMOCRACY_LEADER_TITLE_SAILOR_SASANIAN'),			--Liberal Democracy -- Wuzurg-fram?d?r
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_COMMUNISM',						null,					'LOC_GOVERNMENT_JFD_PEOPLES_REPUBLIC_LEADER_TITLE_SAILOR_SASANIAN'),				--People's Republic -- �?han�?h
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_FASCISM',						null,					'LOC_GOVERNMENT_JFD_MILITARY_GUARDIANSHIP_LEADER_TITLE_SAILOR_SASANIAN'),		--Military Guardianship -- ?r?n-sp?hbed
		('CIVILIZATION_SAILOR_SASANIAN',	null,										'POLICY_JFD_EMPIRE',	'LOC_GOVERNMENT_JFD_MONARCHY_LEADER_TITLE_SAILOR_SASANIAN'),						--Empire -- �?han�?h
		
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_CHIEFDOM',						null,					'LOC_GOVERNMENT_JFD_CHIEFDOM_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),					--Chiefdom	-- Salar
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_JFD_HORDE',						null,					'LOC_GOVERNMENT_JFD_HORDE_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),						--Horde	-- Marzb?n
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_JFD_POLIS',						null,					'LOC_GOVERNMENT_JFD_POLIS_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),						--Polis -- Mobed
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_AUTOCRACY',						null,					'LOC_GOVERNMENT_JFD_AUTOCRACY_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),					--Autocracy -- B?nbi�n
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_OLIGARCHY',						null,					'LOC_GOVERNMENT_JFD_OLIGARCHY_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),					--Oligarchy -- ?z?d
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_CLASSICAL_REPUBLIC',			null,					'LOC_GOVERNMENT_JFD_CLASSICAL_DEMOCRACY_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),		--Classical Democracy -- Wuzurg
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_MONARCHY',						null,					'LOC_GOVERNMENT_JFD_FEUDAL_MONARCHY_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),			--Feudal Monarchy -- B?nbi�nan B?nbi�n
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_MERCHANT_REPUBLIC',				null,					'LOC_GOVERNMENT_JFD_MERCHANT_REPUBLIC_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),			--Merchant Republic -- Kirrogbed
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_THEOCRACY',						null,					'LOC_GOVERNMENT_JFD_GOVERNMENT_THEOCRACY_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),		--Theocracy -- Mobed?n Mobed
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_JFD_ABSOLUTE_MONARCHY',			null,					'LOC_GOVERNMENT_JFD_MONARCHY_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),					--Absolute Monarchy -- B?nbi�nan B?nbi�n
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_JFD_CONSTITUTIONAL_MONARCHY',	null,					'LOC_GOVERNMENT_JFD_MONARCHY_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),					--Constitutional Monarchy -- B?nbi�nan B?nbi�n
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_JFD_NOBLE_REPUBLIC',			null,					'LOC_GOVERNMENT_JFD_OLIGARCHY_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),					--Noble Republic -- Darandarzbad
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_DEMOCRACY',						null,					'LOC_GOVERNMENT_JFD_LIBERAL_DEMOCRACY_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),			--Liberal Democracy -- Wuzurg-fram?d?r
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_COMMUNISM',						null,					'LOC_GOVERNMENT_JFD_PEOPLES_REPUBLIC_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),			--People's Republic -- B?nbi�nan B?nbi�n
		('CIVILIZATION_SAILOR_SASANIAN',	'GOVERNMENT_FASCISM',						null,					'LOC_GOVERNMENT_JFD_MILITARY_GUARDIANSHIP_LEADER_TITLE_SAILOR_SASANIAN_FEMININE'),		--Military Guardianship -- ?r?n-sp?hbed
		('CIVILIZATION_SAILOR_SASANIAN',	null,										'POLICY_JFD_EMPIRE',	'LOC_GOVERNMENT_JFD_MONARCHY_LEADER_TITLE_SAILOR_SASANIAN_FEMININE');					--Empire -- B?nbi�nan B?nbi�n
DELETE FROM Civilization_Titles WHERE CivilizationType = 'CIVILIZATION_SAILOR_SASANIAN' AND GovernmentType IS NOT null AND GovernmentType NOT IN (SELECT GovernmentType FROM Governments);
DELETE FROM Civilization_Titles WHERE CivilizationType = 'CIVILIZATION_SAILOR_SASANIAN' AND PolicyType IS NOT null AND PolicyType NOT IN (SELECT PolicyType FROM Policies);				

-- And then in case the update hasn't come out yet:

INSERT INTO Leader_Titles
				(LeaderType, 					GovernmentType, 							PolicyType,				LeaderTitle																	)
SELECT DISTINCT	'LEADER_SAILOR_KAWAD_I',		GovernmentType, 							PolicyType,				LeaderTitle
FROM Civilization_Titles WHERE LeaderTitle NOT LIKE "%FEMININE" AND CivilizationType = 'CIVILIZATION_SAILOR_SASANIAN';

