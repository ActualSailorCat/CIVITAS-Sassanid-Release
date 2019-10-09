--==========================================================================================================================
-- Shapur I / Trait Defines
--==========================================================================================================================
-----------------------------------------------	
-- Types
-----------------------------------------------	
INSERT INTO Types	
		(Type,										Kind)
VALUES	('TRAIT_LEADER_CVS_SHAPUR_I_UA',			'KIND_TRAIT'),
		('TRAIT_LEADER_UNIT_CVS_SHAPUR_I_UU',		'KIND_TRAIT'),
		('UNIT_CVS_SHAPUR_I_UU',					'KIND_UNIT');
-----------------------------------------------
-- LeaderTraits
-----------------------------------------------	
INSERT INTO LeaderTraits	
		(LeaderType,								TraitType)
VALUES	('LEADER_CVS_SHAPUR_I',						'TRAIT_LEADER_CVS_SHAPUR_I_UA');

INSERT INTO LeaderTraits
		(TraitType,									LeaderType)
VALUES	('TRAIT_LEADER_UNIT_CVS_SHAPUR_I_UU',		'LEADER_CVS_SHAPUR_I');
-----------------------------------------------			
-- Traits			
-----------------------------------------------				
INSERT INTO Traits				
		(TraitType,									Name,											Description)
VALUES	('TRAIT_LEADER_CVS_SHAPUR_I_UA',			'LOC_TRAIT_LEADER_CVS_SHAPUR_I_UA_NAME',		'LOC_TRAIT_LEADER_CVS_SHAPUR_I_UA_DESCRIPTION'),
		('TRAIT_LEADER_UNIT_CVS_SHAPUR_I_UU',		'LOC_UNIT_CVS_SHAPUR_I_UU_NAME',				null);