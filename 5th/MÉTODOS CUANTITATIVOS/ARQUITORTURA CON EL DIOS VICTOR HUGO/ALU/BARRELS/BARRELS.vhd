----------------------------------------------------------------------------------
-- Company:  ESCOM-IPN
-- Engineer: LOPEZ MANRIQUUEZ ANGEL
--				 MAYA ROCHA LUIS EMMANUEL
--				 VAZQUEZ MORENO MARCOS OSWALDO
-- 			NEXYS4 DDR
--				BARREL SHIFTER
-- Create Date:    10:50:21 10/10/2018 
-- Design Name: 
-- Module Name:    BARRELS - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
LIBRARY WORK;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity BARRELS is
	generic (
		nbits: integer := 8;
		nshift: integer := 3
	);
    Port ( DATAIN : in  STD_LOGIC_VECTOR (nbits - 1 downto 0);
           SHIFT : in  STD_LOGIC_VECTOR (nshift - 1 downto 0);
           DATAOUT : out  STD_LOGIC_VECTOR (nbits - 1 downto 0));
			  DIR : IN STD_LOGIC;
end BARRELS;

architecture Behavioral of BARRELS is

begin
	PSLL PROCESS: (DATAIN, SHIFT, DIR)
	BEGIN
		IF (DIR ='1') THEN
			DATAOUT <= SHL(DATAIN, SHIFT);
		ELSE
			DATAOUT <= TO_STDLOGICVECTOR(TO_BITVECTOR(DATAIN) SRL CONV_INTEGER(SHIFT));
		END IF;
	END PROCESS PSLL;
END BEHAVIORAL;



