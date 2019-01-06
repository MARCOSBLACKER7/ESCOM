library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONTROL is
    Port ( CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
			  INI : in  STD_LOGIC;
           A0 : in  STD_LOGIC;
			  Z : in  STD_LOGIC; 
			  SHE : out  STD_LOGIC;
           LA : out  STD_LOGIC;
           EB : out  STD_LOGIC;
			  LB : out  STD_LOGIC;
           S : out  STD_LOGIC);
end CONTROL;

architecture UNIDAD of CONTROL is
TYPE  ESTADOS IS (A, B, C);   --DECLARACION DE ESTADOS
SIGNAL EDO_ACT, EDO_SGTE : ESTADOS; 
begin
	TRANSICION : PROCESS(CLK, CLR) --PROCESO DE TRANSICION
	BEGIN
		IF CLR = '1' THEN
			EDO_ACT <= A;
		ELSIF RISING_EDGE(CLK) THEN
			EDO_ACT <= EDO_SGTE;
		END IF;
	
	END PROCESS TRANSICION;
	
	PAUTO : PROCESS(EDO_ACT, INI, Z, A0) --MAQUINA DE ESTADOS 
	BEGIN
		LA  <= '0';
		EB  <= '0';
		LB <= '0';
		SHE <= '0';
		S   <= '0';
		CASE  EDO_ACT IS 
			WHEN A =>
				LB <= '1';
					IF INI = '0' THEN
						LA <= '1';
						EDO_SGTE <= A;
					ELSE
						EDO_SGTE <= B;
					END IF;
			
			WHEN B =>
				SHE <= '1';
				IF Z = '1' THEN
				  EDO_SGTE <= C;
				 ELSE
				  IF A0 = '0' THEN
					EDO_SGTE <= B;
				 ELSE
					EB <= '1';
					EDO_SGTE <= B;
					END IF;
				END IF;
				
				
				
			WHEN C => 
				S <= '1';
				 EDO_SGTE <= C;
				IF INI = '0' THEN
					EDO_SGTE <= A;
				ELSE
					EDO_SGTE <= C;
				END IF;
					
		END CASE;
	END PROCESS PAUTO;

end UNIDAD;

