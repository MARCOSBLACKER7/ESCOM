--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:34:28 06/06/2018
-- Design Name:   
-- Module Name:   /home/ise/Desktop/ContadorUnos/ContadorUnos/TB_BCD27SEG.vhd
-- Project Name:  ContadorUnos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BCD27SEG
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_BCD27SEG IS
END TB_BCD27SEG;
 
ARCHITECTURE behavior OF TB_BCD27SEG IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BCD27SEG
    PORT(
         BCD : IN  std_logic_vector(3 downto 0);
         SEG : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal BCD : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal SEG : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BCD27SEG PORT MAP (
          BCD => BCD,
          SEG => SEG
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      BCD <="1000";
		BCD <="1001";
		BCD <="1011";
      -- insert stimulus here 

      wait;
   end process;

END;
