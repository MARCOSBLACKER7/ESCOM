library ieee;
use ieee.std_logic_1164.all;
entity ALARMAS is 

	port ( 
			A, B, REF: in std_logic_vector(2 downto 0);
			SEL: in std_logic;
			DISPLAY: out std_logic_vector(6 downto 0)
		  );

ATTRIBUTE PIN_NUMBERS OF  ALARMAS : ENTITY IS

"A(2):2 A(1):3 A(0):4 B(2):5 B(1):6 B(0):7 " & " REF(2):8 REF(1):9 REF(0):10 SEL:11 " &
"DISPLAY(0):15 DISPLAY(1):16 DISPLAY(2):17 DISPLAY(3):18 " &
"DISPLAY(4):19 DISPLAY(5):20 DISPLAY(6):21";



end ALARMAS;


architecture CUADRO of ALARMAS is
	signal SENSOR: std_logic_vector(2 downto 0);
	signal CONDICION: std_logic_vector(2 downto 0);
	constant SIN_MAY: STD_LOGIC_VECTOR(6 DOWNTO 0) := "0110111";
BEGIN

   with SEL select
   	SENSOR<= A when '0',
 	 		 B when others;




PCOMP: PROCESS (SENSOR, REF)
BEGIN
		IF(SENSOR>REF) THEN
				CONDICION <= "001";
			ELSIF(SENSOR<REF) THEN
				CONDICION <="010";
			ELSE
				CONDICION<="100";
	END IF;
 END PROCESS PCOMP;

	 DISPLAY<= SIN_MAY WHEN(CONDICION="001")ELSE
	 		   "0110001" WHEN(CONDICION="100")ELSE
			   "0110111";

END CUADRO;
