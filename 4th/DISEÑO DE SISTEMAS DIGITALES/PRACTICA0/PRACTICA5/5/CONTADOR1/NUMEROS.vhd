LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY NUMEROS IS
	GENERIC ( 
		N : INTEGER := 7
	);
	PORT(
		EN,CLK,CLR : IN STD_LOGIC;
		Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);

	ATTRIBUTE PIN_NUMBERS OF NUMEROS: ENTITY IS
        "CLK:1 "       &
        "EN:9 "    &
        "CLR:13 "      &
        "Q(0):14 "     &
        "Q(1):15 "     &
        "Q(2):16 "     &
        "Q(3):17 "     &
        "Q(4):18 "     &
        "Q(5):19 "     &
        "Q(6):20";

END NUMEROS;

ARCHITECTURE CONTADOR OF NUMEROS IS
BEGIN
	PCONT : PROCESS (CLK, CLR)
	VARIABLE AUX : STD_LOGIC;
	BEGIN
		IF( CLR = '1' ) THEN
			Q<= (OTHERS =>'0');
		ELSIF( RISING_EDGE(CLK) ) THEN
--			CON LA LIBRERIA UNSIGNE Y CON SIGNE, depende del dispositovo como sintetisa el operador
--			IF( EN = '1' ) THEN
--				Q <= Q+1;
--			END IF;
			
			FOR I IN 0 TO N-1 LOOP
				AUX := EN;
				FOR J IN 0 TO i-1 LOOP
					AUX := AUX AND Q(J);
				END LOOP;
				Q(I) <= Q(I) XOR AUX;
			END LOOP;
		END IF;
	END PROCESS PCONT;
END CONTADOR;
