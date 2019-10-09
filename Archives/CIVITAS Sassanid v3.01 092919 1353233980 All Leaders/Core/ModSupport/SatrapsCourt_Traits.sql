-----------------------------------------------
-- p0kiehl's Satrap's Court
-----------------------------------------------
INSERT INTO CivilizationTraits	
		(TraitType,											CivilizationType)
SELECT	'TRAIT_CIVILIZATION_POK_DISTRICT_SATRAPS_COURT',	'CIVILIZATION_CVS_SASANIAN'
WHERE EXISTS (SELECT * FROM CIVITAS_Sassanid_Leader_Settings WHERE LeaderType = 'LEADER_SATRAPSCOURT' AND Value = 1)
AND EXISTS (SELECT TraitType FROM Traits WHERE TraitType = 'TRAIT_CIVILIZATION_POK_DISTRICT_SATRAPS_COURT')
AND EXISTS (SELECT ModifierType FROM DynamicModifiers WHERE ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN');