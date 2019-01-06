----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:35:00 06/06/2018 
-- Design Name: 
-- Module Name:    REGISTRO - REG 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity REGISTRO is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           L : in  STD_LOGIC;
           E : in  STD_LOGIC;
           Q : inout  STD_LOGIC_VECTOR (7 downto 0);
           CLK,CLR : in  STD_LOGIC);
end REGISTRO;

architecture REG of REGISTRO is

begin
REGIS:PROCESS(CLK,CLR)
BEGIN
	IF(CLR='1')THEN
		Q<=(OTHERS=>'0');
	ELSIF(RISING_EDGE(CLK))THEN
		IF(L='1')THEN --CARGAR EL VALOR EN EL VECTOR D
			Q<=D;
		ELSIF(E='1')THEN
			Q<=TO_STDLOGICVECTOR(TO_BITVECTOR(Q) SRL 1); --CORRIMIENTO A LA IZQUIERDA
		END IF;
	END IF;
END PROCESS REGIS;
end REG;

