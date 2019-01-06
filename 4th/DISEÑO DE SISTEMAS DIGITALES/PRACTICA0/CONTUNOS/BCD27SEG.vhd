----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:16:43 06/06/2018 
-- Design Name: 
-- Module Name:    BCD27SEG - BCDSEG 
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

entity BCD27SEG is
    Port ( BCD : in  STD_LOGIC_VECTOR (3 downto 0);
           SEG : out  STD_LOGIC_VECTOR (6 downto 0));
end BCD27SEG;

architecture BCDSEG of BCD27SEG is
CONSTANT N0: STD_LOGIC_VECTOR(6 DOWNTO 0):="0000001";
CONSTANT N1: STD_LOGIC_VECTOR(6 DOWNTO 0):="1001111";
CONSTANT N2: STD_LOGIC_VECTOR(6 DOWNTO 0):="0010010";
CONSTANT N3: STD_LOGIC_VECTOR(6 DOWNTO 0):="0000110";
CONSTANT N4: STD_LOGIC_VECTOR(6 DOWNTO 0):="1001100";
CONSTANT N5: STD_LOGIC_VECTOR(6 DOWNTO 0):="0100100";
CONSTANT N6: STD_LOGIC_VECTOR(6 DOWNTO 0):="0100000";
CONSTANT N7: STD_LOGIC_VECTOR(6 DOWNTO 0):="0001111";
CONSTANT N8: STD_LOGIC_VECTOR(6 DOWNTO 0):="0000000";
CONSTANT N9: STD_LOGIC_VECTOR(6 DOWNTO 0):="0000100";

begin
SEG <= N0 WHEN (BCD = "0000")ELSE
		 N1 WHEN (BCD = "0001")ELSE
		 N2 WHEN (BCD = "0010")ELSE
		 N3 WHEN (BCD = "0011")ELSE
		 N4 WHEN (BCD = "0100")ELSE
		 N5 WHEN (BCD = "0101")ELSE
		 N6 WHEN (BCD = "0110")ELSE
		 N7 WHEN (BCD = "0111")ELSE
		 N8 WHEN (BCD = "1000")ELSE
		 N9 WHEN (BCD = "1001")ELSE
		 "1111110";

end BCDSEG;

