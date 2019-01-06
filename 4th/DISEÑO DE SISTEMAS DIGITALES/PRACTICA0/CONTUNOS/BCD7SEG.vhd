----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:15:21 06/06/2018 
-- Design Name: 
-- Module Name:    BCD7SEG - Behavioral 
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

entity BCD7SEG is
    Port ( BCD : in  STD_LOGIC_VECTOR (4 downto 0);
           SEG : out  STD_LOGIC_VECTOR (6 downto 0));
end BCD7SEG;

architecture Behavioral of BCD7SEG is

begin


end Behavioral;

