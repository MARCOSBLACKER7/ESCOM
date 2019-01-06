--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:34:03 06/06/2018
-- Design Name:   
-- Module Name:   /home/ise/Desktop/ContadorUnos/ContadorUnos/TB_MAIN.vhd
-- Project Name:  ContadorUnos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PRINCIPAL
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
 
ENTITY TB_MAIN IS
END TB_MAIN;
 
ARCHITECTURE behavior OF TB_MAIN IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PRINCIPAL
    PORT(
         INI : IN  std_logic;
         DA : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         CLR : IN  std_logic;
         AN : INOUT  std_logic_vector(3 downto 0);
         DISPLAY : OUT  std_logic_vector(6 downto 0);
         QA : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal INI : std_logic := '0';
   signal DA : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';

	--BiDirs
   signal AN : std_logic_vector(3 downto 0);
   signal QA : std_logic_vector(7 downto 0);

 	--Outputs
   signal DISPLAY : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PRINCIPAL PORT MAP (
          INI => INI,
          DA => DA,
          CLK => CLK,
          CLR => CLR,
          AN => AN,
          DISPLAY => DISPLAY,
          QA => QA
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;
			INI <= '0';
			DA <= "11110000";
			CLR <='1';
		wait for 10 ns;
			INI <= '0';
			DA <= "11110000";
			CLR <='0';
			wait for 10 ns;
			INI <= '1';
			DA <= "11110000";
			CLR <='0';
      wait for CLK_period*9;

      -- insert stimulus here 

      wait;
   end process;

END;
