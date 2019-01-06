library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity REGISTRO is
	GENERIC (N : INTEGER := 8);
    Port ( CLK,CLR : in  STD_LOGIC; 
           L,SH : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Q : inout  STD_LOGIC_VECTOR (N-1 downto 0));
end REGISTRO;

architecture PROGRAMA of REGISTRO is
begin

	PCONT : PROCESS( CLK , CLR )
	BEGIN
		IF (CLR = '1' )THEN
			Q <= (OTHERS => '0');
		ELSIF (RISING_EDGE(CLK)) THEN
			IF ( L = '1' )THEN
				Q <= D;
			ELSIF ( SH = '1') THEN
				Q <= TO_STDLOGICVECTOR(TO_BITVECTOR(Q) SRL 1);
		--		Q <= TO_STDLOGICVECTOR( TO_BITVECTOR( Q ) SRL CONV_INTEGER(X"1"));
			END IF;
		END IF;
	END PROCESS PCONT;

end PROGRAMA;