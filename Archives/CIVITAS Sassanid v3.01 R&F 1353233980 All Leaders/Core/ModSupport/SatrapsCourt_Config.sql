-----------------------------------------------
-- p0kiehl's Satrap's Court
-----------------------------------------------
INSERT INTO PlayerItems	(
		Domain,
		CivilizationType,
		LeaderType,
		Type,
		Icon,
		Name,
		Description,
		SortIndex
		)
SELECT	'Players:Expansion1_Players',
		'CIVILIZATION_CVS_SASANIAN',
		'LEADER_CVS_BORAN',
		'POK_DISTRICT_SATRAPS_COURT',
		'ICON_POK_DISTRICT_SATRAPS_COURT',
		'LOC_POK_DISTRICT_SATRAPS_COURT_NAME',
		'LOC_POK_DISTRICT_SATRAPS_COURT_DESCRIPTION',
		40
--FROM PlayerItems WHERE CivilizationType = 'CIVILIZATION_CVS_SASANIAN'
WHERE EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_CVS_BORAN' AND Value = 1)
AND EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_SATRAPSCOURT' AND Value = 1)
AND EXISTS (SELECT Type FROM PlayerItems WHERE Type = 'POK_DISTRICT_SATRAPS_COURT');

INSERT INTO PlayerItems	(
		Domain,
		CivilizationType,
		LeaderType,
		Type,
		Icon,
		Name,
		Description,
		SortIndex
		)
SELECT	'Players:Expansion1_Players',
		'CIVILIZATION_CVS_SASANIAN',
		'LEADER_CVS_KAWAD_I',
		'POK_DISTRICT_SATRAPS_COURT',
		'ICON_POK_DISTRICT_SATRAPS_COURT',
		'LOC_POK_DISTRICT_SATRAPS_COURT_NAME',
		'LOC_POK_DISTRICT_SATRAPS_COURT_DESCRIPTION',
		40
WHERE EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_CVS_KAWAD_I' AND Value = 1)
AND EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_SATRAPSCOURT' AND Value = 1)
AND EXISTS (SELECT Type FROM PlayerItems WHERE Type = 'POK_DISTRICT_SATRAPS_COURT');

INSERT INTO PlayerItems	(
		Domain,
		CivilizationType,
		LeaderType,
		Type,
		Icon,
		Name,
		Description,
		SortIndex
		)
SELECT	'Players:Expansion1_Players',
		'CIVILIZATION_CVS_SASANIAN',
		'LEADER_CVS_SHAPUR_I',
		'POK_DISTRICT_SATRAPS_COURT',
		'ICON_POK_DISTRICT_SATRAPS_COURT',
		'LOC_POK_DISTRICT_SATRAPS_COURT_NAME',
		'LOC_POK_DISTRICT_SATRAPS_COURT_DESCRIPTION',
		40
WHERE EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_CVS_SHAPUR_I' AND Value = 1)
AND EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_SATRAPSCOURT' AND Value = 1)
AND EXISTS (SELECT Type FROM PlayerItems WHERE Type = 'POK_DISTRICT_SATRAPS_COURT');