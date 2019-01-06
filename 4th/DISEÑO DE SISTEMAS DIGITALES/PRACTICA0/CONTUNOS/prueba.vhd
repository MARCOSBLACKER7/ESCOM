library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prueba is
    Port ( y : in  STD_LOGIC;
           z : out  STD_LOGIC);
end prueba;

architecture Behavioral of prueba is
begin
z<=y;

end Behavioral;

