--==========================================================================================================================
--
--            .
--            |\
--            | \
--            |  \
--            |   \
--            |    \          SHAPUR I by CIVITAS
--            |     \
--            |      \
--            |       \       ____O
--            |        \     .' ./
--            |   _.,-~"\  .',/~'
--            <-~"   _.,-~" ~ |
--^"~-,._.,-~"^"~-,._\       /,._.,-~"^"~-,._.,-~"^"~-,._
--~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._
--^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._
--~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._.,-~"^"~-,._
--==========================================================================================================================
-- Sassanid / Colors
--==========================================================================================================================
INSERT INTO    Colors
        (Type,                                Color)
VALUES  ('COLOR_CVS_SASSANID_A_PRIMARY',	'121,92,79,255'),
        ('COLOR_CVS_SASSANID_A_SECONDARY',	'119,204,180,255'),
        ('COLOR_CVS_SASSANID_B_PRIMARY',    '198,62,101,255'),
        ('COLOR_CVS_SASSANID_B_SECONDARY',	'246,220,215,255'),
        ('COLOR_CVS_SASSANID_C_PRIMARY',    '132,100,152,255'),
        ('COLOR_CVS_SASSANID_C_SECONDARY',  '227,227,144,255');
-----------------------------------------------
-- PlayerColors
-----------------------------------------------

INSERT INTO    PlayerColors (Type, Usage, PrimaryColor, SecondaryColor, Alt1PrimaryColor, Alt1SecondaryColor, Alt2PrimaryColor, Alt2SecondaryColor)
VALUES	('LEADER_CVS_SHAPUR_I',
			'Unique',
			'COLOR_CVS_SASSANID_A_PRIMARY',
			'COLOR_CVS_SASSANID_A_SECONDARY',
			'COLOR_CVS_SASSANID_B_PRIMARY',
			'COLOR_CVS_SASSANID_B_SECONDARY',
			'COLOR_CVS_SASSANID_C_PRIMARY',
			'COLOR_CVS_SASSANID_C_SECONDARY'),

		('LEADER_CVS_BORAN',
			'Unique',
			'COLOR_CVS_SASSANID_B_PRIMARY',
			'COLOR_CVS_SASSANID_B_SECONDARY',
			'COLOR_CVS_SASSANID_A_PRIMARY',
			'COLOR_CVS_SASSANID_A_SECONDARY',
			'COLOR_CVS_SASSANID_C_PRIMARY',
			'COLOR_CVS_SASSANID_C_SECONDARY'),

		('LEADER_CVS_KAWAD_I',
			'Unique',
			'COLOR_CVS_SASSANID_C_PRIMARY',
			'COLOR_CVS_SASSANID_C_SECONDARY',
			'COLOR_CVS_SASSANID_B_PRIMARY',
			'COLOR_CVS_SASSANID_B_SECONDARY',
			'COLOR_CVS_SASSANID_A_PRIMARY',
			'COLOR_CVS_SASSANID_A_SECONDARY');
