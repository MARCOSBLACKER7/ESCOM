library IEEE;
LIBRARY WORK;
use IEEE.STD_LOGIC_1164.ALL;
USE WORK.MI_PAQUETE.ALL;

entity PRINCIPAL is
    Port ( CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           INI : in  STD_LOGIC;
           NUM : in  STD_LOGIC_VECTOR (7 downto 0);
           DISPLAY : out  STD_LOGIC_VECTOR (6 downto 0));
end PRINCIPAL;

architecture PROGRAMA of PRINCIPAL is
SIGNAL LA, EA : STD_LOGIC;
SIGNAL QB : STD_LOGIC_VECTOR(3 DOWNTO 0);
begin
	CONT : CONTADOR PORT MAP( "0000", CLK, LA, CLR, QB );
	
end PROGRAMA;

