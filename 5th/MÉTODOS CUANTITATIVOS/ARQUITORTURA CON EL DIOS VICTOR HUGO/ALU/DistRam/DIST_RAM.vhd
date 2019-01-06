----------------------------------------------------------------------------------
-- COMPUTERS' ARCHITECTURE
-- AUTHORS:
		-- LOPEZ MANRIQUEZ ANGEL
		-- MAYA ROCHA EMMANUEL
		-- VAZQUEZ MARCOS
		
-- Create Date:    17:44:46 10/02/2018 
-- Module Name:    DIST_RAM - BEHAVIORAL
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity RAM_D is
	GENERIC( 
		N_ADDR : INTEGER := 8;
		N_DATA : INTEGER := 16
		);
    Port ( CLK 	: in  STD_LOGIC;
           WD 		: in  STD_LOGIC;
           ADDR	: in  STD_LOGIC_VECTOR (N_ADDR-1 downto 0);
			  --ADR_R1   : IN STD_LOGIC_VECTOR (N_ADDR-1 DOWNTO 0);
			  --ADR_R2   : IN STD_LOGIC_VECTOR (N_ADDR-1 DOWNTO 0);
           DIN 	: in  STD_LOGIC_VECTOR (N_DATA-1 downto 0);
			  DOUT 	: out STD_LOGIC_VECTOR (N_DATA-1 downto 0)
			  --DOUT2 	: out STD_LOGIC_VECTOR (N_DATA-1 downto 0)
	 );
end RAM_D;

architecture BEHAVIORAL of RAM_D is
TYPE MEM_TYPE IS ARRAY (0 TO 2**N_ADDR-1) OF STD_LOGIC_VECTOR(DOUT'rANGE);
SIGNAL MEM : MEM_TYPE;
BEGIN
-- WRITING OF MEMORY
	PMEM : PROCESS( CLK )
	BEGIN
		IF( CLK'EVENT AND CLK='1' )THEN
			IF( WD = '1' )THEN
				MEM(CONV_INTEGER(ADdR)) <= DIN;
			END IF;
		END IF;
	END PROCESS PMEM;
-- READING OF MEMORY

	DOUT <= MEM(CONV_INTEGER(ADdR));
	--DOUT2 <= MEM(CONV_INTEGER(ADR_R2));

end BEHAVIORAL;

