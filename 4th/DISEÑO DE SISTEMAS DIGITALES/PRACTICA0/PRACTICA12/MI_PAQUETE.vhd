library IEEE;
use IEEE.STD_LOGIC_1164.all;

package MI_PAQUETE is

	COMPONENT CONTROL is
    Port ( CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           INI : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           A0 : in  STD_LOGIC;
           LA : out  STD_LOGIC;
           EA : out  STD_LOGIC;
           LB : out  STD_LOGIC;
           EB : out  STD_LOGIC);
	end COMPONENT;

	COMPONENT CONTADOR is
		 Port ( D : in  STD_LOGIC_VECTOR (3 downto 0);
				  CLK, L, E : in  STD_LOGIC;
				  CLR : in  STD_LOGIC;
				  Q : inout  STD_LOGIC_VECTOR (3 downto 0));
	end COMPONENT;

	COMPONENT REGISTRO is
		 Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
				  CLK, L, E : in  STD_LOGIC;
				  CLR : in  STD_LOGIC;
				  Q : inout  STD_LOGIC_VECTOR (7 downto 0));
	end COMPONENT;

	COMPONENT CODIGO is
		 Port ( BCD : in  STD_LOGIC_VECTOR (3 downto 0);
				  DISPLAY : out  STD_LOGIC_VECTOR (6 downto 0));
	end COMPONENT;

end MI_PAQUETE;

package body MI_PAQUETE is

 
end MI_PAQUETE;
