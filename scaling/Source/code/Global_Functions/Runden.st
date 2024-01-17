
FUNCTION GLOBAL Runden
VAR_INPUT
	wert		: DINT;
	stelle		: USINT;
END_VAR
VAR_OUTPUT
	out			: DINT;
END_VAR
VAR
	ni			: UINT;
	mul			: DINT;
END_VAR

	IF stelle THEN

		mul := 1;

		//------------  Multiplikator suchen ---------------------
		FOR ni := 1 TO stelle DO
			mul *= 10;		
		END_FOR;

		//------------  Runden -----------------------------------
		IF wert >= 0 THEN
			wert := (wert + ((5 * mul) / 10)) / mul;
		ELSE
			wert := (wert - ((5 * mul) / 10)) / mul;
		END_IF;

	END_IF;

	//------------  auf den Ausgabewert ----------------------
	out := wert;

END_FUNCTION //GLOBAL Runden

