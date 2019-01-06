----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:02:56 06/06/2018 
-- Design Name: 
-- Module Name:    PRINCIPAL - PRINC 
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
use work.mipaquetito.ALL;
use IEEE.STD_LOGIC_1164.ALL;


entity PRINCIPAL is
    Port ( INI : in  STD_LOGIC;
           DA : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK,CLR : in  STD_LOGIC;
           AN : inout  STD_LOGIC_VECTOR (3 downto 0);
           DISPLAY : out  STD_LOGIC_VECTOR (6 downto 0);
           QA : inout  STD_LOGIC_VECTOR (7 downto 0));
end PRINCIPAL;

architecture PRINC of PRINCIPAL is
SIGNAL LA,LB,EA,EB,Z,S: STD_LOGIC;
SIGNAL BCD: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL CODIGO : STD_LOGIC_VECTOR(6 DOWNTO 0);
begin
	CTRL : CONTROL PORT MAP(INI,CLK,CLR,LA,LB,EA,EB,QA(0),Z,S);
	CONT : Contador PORT MAP( "0000",LB,EB,BCD,CLK,CLR);
	REG : REGISTRO PORT MAP(DA,LA,EA,QA,CLK,CLR);
	B2S : BCD27SEG PORT MAP (BCD,CODIGO);
	
	Z<= '1' WHEN (QA="00000000") ELSE '0';
	AN <= "1110";
--	ANILLO: PROCESS(CLK,CLR)
	--BEGIN
		--IF(CLR='1')THEN
			--AN<="1110";
		--ELSIF(RISING_EDGE(CLK)) THEN
			--AN <= TO_STDLOGICVECTOR(TO_BITVECTOR(AN) ROL 1);
		--END IF;
	--END PROCESS ANILLO;
	
	WITH S&AN SELECT
		DISPLAY <=  CODIGO WHEN '1'&"1110",
						"1111110" WHEN OTHERS;
end PRINC;

