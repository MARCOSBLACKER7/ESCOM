library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity REGISTRO is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK, L, E : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           Q : inout  STD_LOGIC_VECTOR (7 downto 0));
end REGISTRO;

architecture PROGRAMA of REGISTRO is

begin
	PCONT : PROCESS( CLK, CLR )
	BEGIN
		IF (CLR = '1') THEN
			Q <=(OTHERS =>'0');
		ELSIF(RISING_EDGE(CLK))THEN
			IF(L = '1')THEN
				Q <= D;
			ELSIF(E = '1')THEN
				Q <= Q + 1;
			END IF;			
		END IF;
	END PROCESS PCONT;
end PROGRAMA;

