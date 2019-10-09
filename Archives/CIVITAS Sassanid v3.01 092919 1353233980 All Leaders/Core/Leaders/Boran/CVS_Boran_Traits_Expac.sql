--==========================================================================================================================
-- Boran / Expac Traits
--==========================================================================================================================
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types
		(Type,									Kind)
VALUES	('MOMENT_TRAIT_LEADER_CVS_BORAN_UA',	'KIND_MOMENT');
-----------------------------------------------	
-- Moments
-----------------------------------------------	
INSERT INTO Moments (
		MomentType,
		Name,
		Description,
		InstanceDescription,
		InterestLevel,
		IconTexture,
		EraScore
		)
VALUES 	(
		'MOMENT_TRAIT_LEADER_CVS_BORAN_UA',
		'LOC_MOMENT_TRAIT_LEADER_CVS_BORAN_UA',
		'LOC_MOMENT_TRAIT_LEADER_CVS_BORAN_UA_DESCRIPTION',
		'LOC_MOMENT_TRAIT_LEADER_CVS_BORAN_UA_INSTANCE_DESCRIPTION',
		1,
		'MomentSmall_Wonder',
		2
		);