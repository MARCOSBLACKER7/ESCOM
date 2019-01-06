library IEEE;
LIBRARY WORK;
use IEEE.STD_LOGIC_1164.ALL;
USE WORK.MI_PAQUETE.ALL;

entity PRINCIPAL is
    Port ( CLK, CLR : in STD_LOGIC;
           INI : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           DISP : out  STD_LOGIC_VECTOR (6 downto 0);
			  AN: out STD_LOGIC_VECTOR(7 downto 0));
end PRINCIPAL;

architecture PROGRAMA of PRINCIPAL is
SIGNAL IB, LB, Z, LA, SH, S : STD_LOGIC; 
SIGNAL QB : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL QBCD : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL QA,DA : STD_LOGIC_VECTOR(7 DOWNTO 0);


begin
	
	CONTB : CONTADOR GENERIC MAP (4) PORT MAP( CLK, CLR, IB, LB, X"0", QB );
	
	CONV_COD : CONVERTIDOR PORT MAP ( 
		BCD => QB,
		SEG => QBCD 
	);

	Z <= '1' WHEN (QA = "00000000")  ELSE '0';
	
	CTRL : CONTROL PORT MAP (
		CLK => CLK,
		CLR => CLR,
		INI => INI,
		Z   => Z,
		A0  => QA(0),
		LA  => LA,
		SH  => SH,
		LB  => LB,
		IB  => IB,
		S   => S
	);
	
	REG : REGISTRO PORT MAP (
		CLK => CLK,
		CLR => CLR, 
		L   => LA,
		SH  => SH,
		D   => D,
		Q   => QA 
	);
--REG : REGISTRO GENERIC MAP (8) PORT MAP ( CLK, CLR, LA, SH, X"00", QA);
	DISP <= "1111110" WHEN S <= '0' ELSE QBCD;
	
	AN <= "11111110";
	
end PROGRAMA; 
