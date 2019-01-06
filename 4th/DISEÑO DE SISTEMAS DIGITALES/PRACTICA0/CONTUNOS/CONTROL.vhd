----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:43:47 06/06/2018 
-- Design Name: 
-- Module Name:    CONTROL - AUTOMATA 
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


entity CONTROL is
    Port ( INI : in  STD_LOGIC;
           CLK,CLR : in  STD_LOGIC;
           LA : out  STD_LOGIC;
           LB : out  STD_LOGIC;
           EA : out  STD_LOGIC;
           EB : out  STD_LOGIC;
           A0 : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           EC : out  STD_LOGIC);
end CONTROL;

architecture AUTOMATA of CONTROL is
TYPE ESTADOS IS (A,B,C);
SIGNAL EDO_ACT,EDO_SIG: ESTADOS;
begin
 AUTO:PROCESS(EDO_ACT,Z,INI,A0)
 BEGIN
	 LA <= '0';
	 EA <= '0';
	 LB <= '0';
	 EB <= '0';
	 EC <= '0';
	 CASE EDO_ACT IS
		WHEN A =>
			LB <='1';
			IF(INI = '0') THEN
				LA <= '1';
				EDO_SIG <= A;
			ELSE 
				EDO_SIG <= B;
			END IF;
		WHEN B =>
			EA <= '1';
			IF( Z = '1') THEN
				EDO_SIG <= C;
			ELSE
				IF(A0 = '0') THEN
					EDO_SIG <= B;
				ELSE
					EB <= '1';
					EDO_SIG <= B;
				END IF;	
			END IF;
		WHEN C =>
			EC <='1';
			EDO_SIG <= C;
			IF (INI = '1') THEN
				EDO_SIG <= C;
			ELSE
				EDO_SIG <= A;
			END IF;
	 END CASE;
 END PROCESS AUTO;
 transicion: process(CLK,CLR)
 begin
	IF (CLR ='1') THEN
		EDO_ACT <= A;
	ELSIF(RISING_EDGE(CLK))THEN
		EDO_ACT <= EDO_SIG;
	END IF;
 end PROCESS transicion;
 end AUTOMATA;

	

