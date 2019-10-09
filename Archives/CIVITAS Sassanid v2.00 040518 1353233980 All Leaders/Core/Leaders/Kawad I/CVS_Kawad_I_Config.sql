--==========================================================================================================================
-- Kawad I / Config
--==========================================================================================================================
-----------------------------------------------		
-- Players Vanilla
-----------------------------------------------
INSERT INTO Players	(
		CivilizationType,
		PortraitBackground,
		LeaderType,
		LeaderName,
		LeaderIcon,
		LeaderAbilityName,
		LeaderAbilityDescription,
		LeaderAbilityIcon,
		CivilizationName,
		CivilizationIcon,
		CivilizationAbilityName,
		CivilizationAbilityDescription,
		CivilizationAbilityIcon
		)
SELECT	'CIVILIZATION_CVS_SASANIAN', -- CivilizationType
		'LEADER_CVS_KAWAD_I_BACKGROUND', -- PortraitBackground
		'LEADER_CVS_KAWAD_I', -- LeaderType
		'LOC_LEADER_CVS_KAWAD_I_NAME', -- LeaderName
		'ICON_LEADER_CVS_KAWAD_I', -- LeaderIcon
		'LOC_TRAIT_LEADER_CVS_KAWAD_I_TTBAM_NAME', -- LeaderAbilityName
		'LOC_TRAIT_LEADER_CVS_KAWAD_I_TTBAM_DESCRIPTION', -- LeaderAbilityDescription
		'ICON_LEADER_CVS_KAWAD_I', -- LeaderAbilityIcon
		'LOC_CIVILIZATION_CVS_SASANIAN_NAME', -- CivilizationName
		'ICON_CIVILIZATION_CVS_KAWAD_I_COLOR', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_CVS_SASANIAN_UA_NAME', --CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_CVS_SASANIAN_UA_DESCRIPTION', --CivilizationAbilityDescription
		'ICON_CIVILIZATION_CVS_KAWAD_I_COLOR' -- CivilizationAbilityIcon
WHERE EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_CVS_KAWAD_I' AND Value = 1);	
-----------------------------------------------		
-- PlayerItems Vanilla
-----------------------------------------------
INSERT INTO PlayerItems	(
		CivilizationType,
		LeaderType,
		Type,
		Icon,
		Name,
		Description,
		SortIndex
		)
SELECT	'CIVILIZATION_CVS_SASANIAN',
		'LEADER_CVS_KAWAD_I',
		'UNIT_CVS_ASWAR',
		'ICON_UNIT_CVS_ASWAR',
		'LOC_UNIT_CVS_ASWAR_NAME',
		'LOC_UNIT_CVS_ASWAR_DESCRIPTION',
		10
WHERE EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_CVS_KAWAD_I' AND Value = 1);	

INSERT INTO PlayerItems	(
		CivilizationType,
		LeaderType,
		Type,
		Icon,
		Name,
		Description,
		SortIndex
		)
SELECT	'CIVILIZATION_CVS_SASANIAN',
		'LEADER_CVS_KAWAD_I',
		'DISTRICT_CVS_HUNTINGPARK',
		'ICON_DISTRICT_CVS_HUNTINGPARK',
		'LOC_DISTRICT_CVS_HUNTINGPARK_NAME',
		'LOC_DISTRICT_CVS_HUNTINGPARK_DESCRIPTION',
		20
WHERE EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_CVS_KAWAD_I' AND Value = 1);	

INSERT INTO PlayerItems	(
		CivilizationType,
		LeaderType,
		Type,
		Icon,
		Name,
		Description,
		SortIndex
		)
SELECT	'CIVILIZATION_CVS_SASANIAN',
		'LEADER_CVS_KAWAD_I',
		'IMPROVEMENT_CVS_AMARGAR',
		'ICON_IMPROVEMENT_CVS_AMARGAR',
		'LOC_IMPROVEMENT_CVS_AMARGAR_NAME',
		'LOC_IMPROVEMENT_CVS_AMARGAR_DESCRIPTION',
		30
WHERE EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_CVS_KAWAD_I' AND Value = 1);	

-----------------------------------------------		
-- Players Expansion
-----------------------------------------------
INSERT INTO Players	(
		Domain,
		CivilizationType,
		PortraitBackground,
		LeaderType,
		LeaderName,
		LeaderIcon,
		LeaderAbilityName,
		LeaderAbilityDescription,
		LeaderAbilityIcon,
		CivilizationName,
		CivilizationIcon,
		CivilizationAbilityName,
		CivilizationAbilityDescription,
		CivilizationAbilityIcon
		)
SELECT	'Players:Expansion1_Players', -- Domain
		'CIVILIZATION_CVS_SASANIAN', -- CivilizationType
		'LEADER_CVS_KAWAD_I_BACKGROUND', -- PortraitBackground
		'LEADER_CVS_KAWAD_I', -- LeaderType
		'LOC_LEADER_CVS_KAWAD_I_NAME', -- LeaderName
		'ICON_LEADER_CVS_KAWAD_I', -- LeaderIcon
		'LOC_TRAIT_LEADER_CVS_KAWAD_I_TTBAM_NAME', -- LeaderAbilityName
		'LOC_TRAIT_LEADER_CVS_KAWAD_I_TTBAM_EXPAC_DESCRIPTION', -- LeaderAbilityDescription
		'ICON_LEADER_CVS_KAWAD_I', -- LeaderAbilityIcon
		'LOC_CIVILIZATION_CVS_SASANIAN_NAME', -- CivilizationName
		'ICON_CIVILIZATION_CVS_KAWAD_I_COLOR', -- CivilizationIcon
		'LOC_TRAIT_CIVILIZATION_CVS_SASANIAN_UA_EXPAC_NAME', --CivilizationAbilityName
		'LOC_TRAIT_CIVILIZATION_CVS_SASANIAN_UA_EXPAC_DESCRIPTION', --CivilizationAbilityDescription
		'ICON_CIVILIZATION_CVS_KAWAD_I_COLOR' -- CivilizationAbilityIcon
WHERE EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_CVS_KAWAD_I' AND Value = 1);	
-----------------------------------------------		
-- PlayerItems Expansion
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
		'LEADER_CVS_KAWAD_I',
		'UNIT_CVS_ASWAR',
		'ICON_UNIT_CVS_ASWAR',
		'LOC_UNIT_CVS_ASWAR_NAME',
		'LOC_UNIT_CVS_ASWAR_DESCRIPTION',
		10
WHERE EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_CVS_KAWAD_I' AND Value = 1);	

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
		'DISTRICT_CVS_HUNTINGPARK',
		'ICON_DISTRICT_CVS_HUNTINGPARK',
		'LOC_DISTRICT_CVS_HUNTINGPARK_NAME',
		'LOC_DISTRICT_CVS_HUNTINGPARK_DESCRIPTION',
		20
WHERE EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_CVS_KAWAD_I' AND Value = 1);	

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
		'IMPROVEMENT_CVS_AMARGAR',
		'ICON_IMPROVEMENT_CVS_AMARGAR',
		'LOC_IMPROVEMENT_CVS_AMARGAR_NAME',
		'LOC_IMPROVEMENT_CVS_AMARGAR_DESCRIPTION',
		30
WHERE EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_CVS_KAWAD_I' AND Value = 1);	