--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:01:59 12/05/2018
-- Design Name:   
-- Module Name:   /home/angelos/Documents/git/computerArchitecture/finalBoss4/counter_tb.vhd
-- Project Name:  finalBoss4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
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
 
ENTITY counter_tb IS
END counter_tb;
 
ARCHITECTURE behavior OF counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         OSC : IN  std_logic;
         clr : IN  std_logic;
         diven : IN  std_logic;
         sig_read_data_2 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OSC : std_logic := '0';
   signal clr : std_logic := '0';
   signal diven : std_logic := '0';

 	--Outputs
   signal sig_read_data_2 : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant osc_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          OSC => OSC,
          clr => clr,
          diven => diven,
          sig_read_data_2 => sig_read_data_2
        );

   -- Clock process definitions
   osc_process :process
   begin
		osc <= '0';
		wait for osc_period/2;
		osc <= '1';
		wait for osc_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		diven <= '0';
		clr <= '0';
		---wait for 1 ns;
		wait for 6 ns;
		clr <= '1';
		wait for 1 ns;
		--wait until rising_edge(osc);
		clr <= '0';
		for i in 1 to 50 loop
			wait until rising_edge(osc);
		end loop;

      wait;
   end process;

END;
