--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:15:20 10/10/2018
-- Design Name:   
-- Module Name:   C:/Users/marco/Documents/ESCOM/QUINTO SEMESTRE/ARQUITECTURA DE COMPUTADORAS/BARRELS/TB_BARRELS.vhd
-- Project Name:  BARRELS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BARRELS
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
 
ENTITY TB_BARRELS IS
END TB_BARRELS;
 
ARCHITECTURE behavior OF TB_BARRELS IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BARRELS
    PORT(
         DATAIN : IN  std_logic_vector(7 downto 0);
         SHIFT : IN  std_logic_vector(2 downto 0);
         DATAOUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DATAIN : std_logic_vector(7 downto 0) := (others => '0');
   signal SHIFT : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal DATAOUT : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BARRELS PORT MAP (
          DATAIN => DATAIN,
          SHIFT => SHIFT,
          DATAOUT => DATAOUT
        );

----   -- Clock process definitions
----   <clock>_process :process
----   begin
----		<clock> <= '0';
----		wait for <clock>_period/2;
----		<clock> <= '1';
----		wait for <clock>_period/2;
----   end process;
---- 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		DIR <= '1';
		datain <= X"FF";
		SHIFT  <= "000";
		 wait for 100 ns;	
		datain <= X"FF";
		SHIFT  <= "001";
		 wait for 100 ns;	
		datain <= X"05";
		SHIFT  <= "100";
		 wait for 100 ns;	
		 DIR <= '0';
		datain <= X"07";
		SHIFT  <= "011";
		


      wait;
   end process;

END;
