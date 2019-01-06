library IEEE;
use IEEE.STD_LOGIC_1164.all;

package MI_PAQUETE is

COMPONENT CONTADOR is
	GENERIC (N : INTEGER := 4);
    Port ( CLK,CLR : in  STD_LOGIC;
           I,L : in  STD_LOGIC; --INCREMENTO Y CARGA
           D : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Q : inout  STD_LOGIC_VECTOR (N-1 downto 0));
end COMPONENT;

COMPONENT REGISTRO is
	GENERIC (N : INTEGER := 8);
    Port ( CLK,CLR : in  STD_LOGIC; 
           L,SH : in  STD_LOGIC;	--CARGA Y CORRIMIENTO
           D : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Q : inout  STD_LOGIC_VECTOR (N-1 downto 0));
end COMPONENT;

COMPONENT CONVERTIDOR is
    Port ( BCD : in  STD_LOGIC_VECTOR (3 downto 0);
           SEG : out  STD_LOGIC_VECTOR (6 downto 0));
end COMPONENT;

COMPONENT CONTROL is
    Port ( CLK,CLR : in  STD_LOGIC;
           INI,Z,A0 : in  STD_LOGIC;
           LA,SH,LB,IB,S : out  STD_LOGIC);
end COMPONENT;

end MI_PAQUETE;




package body MI_PAQUETE is

end MI_PAQUETE;
