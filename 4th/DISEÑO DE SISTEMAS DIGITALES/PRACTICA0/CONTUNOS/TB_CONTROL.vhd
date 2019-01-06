--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:12:20 06/06/2018
-- Design Name:   
-- Module Name:   /home/ise/Desktop/ContadorUnos/ContadorUnos/TB_CONTROL.vhd
-- Project Name:  ContadorUnos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CONTROL
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
 
ENTITY TB_CONTROL IS
END TB_CONTROL;
 
ARCHITECTURE behavior OF TB_CONTROL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONTROL
    PORT(
         INI : IN  std_logic;
         CLK : IN  std_logic;
         CLR : IN  std_logic;
         LA : OUT  std_logic;
         LB : OUT  std_logic;
         EA : OUT  std_logic;
         EB : OUT  std_logic;
         A0 : IN  std_logic;
         Z : IN  std_logic;
         EC : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal INI : std_logic := '0';
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';
   signal A0 : std_logic := '0';
   signal Z : std_logic := '0';

 	--Outputs
   signal LA : std_logic;
   signal LB : std_logic;
   signal EA : std_logic;
   signal EB : std_logic;
   signal EC : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROL PORT MAP (
          INI => INI,
          CLK => CLK,
          CLR => CLR,
          LA => LA,
          LB => LB,
          EA => EA,
          EB => EB,
          A0 => A0,
          Z => Z,
          EC => EC
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
			CLR <='1';
			INI <='0';
			 z  <='1';
			 A0 <='0';
		wait for 10 ns;
			CLR <='0';
			INI <='0';
			 z  <='1';
			 A0 <='1';
		wait for 10 ns;
			CLR <='0';
			INI <='0';
			 z  <='1';
			 A0 <='1';
		wait for 10 ns;
			CLR <='0';
			INI <='1';
			 z  <='1';
			 A0 <='1';
		wait for 10 ns;
			CLR <='0';
			INI <='1';
			 z  <='1';
			 A0 <='1';
		wait for 10 ns;
			CLR <='0';
			INI <='1';
			 z  <='1';
			 A0 <='1';
		wait for 10 ns;
			CLR <='0';
			INI <='1';
			 z  <='1';
			 A0 <='1';
		wait for 10 ns;
			CLR <='0';
			INI <='1';
			 z  <='1';
			 A0 <='1';
		wait for 10 ns;
			CLR <='0';
			INI <='0';
			 z  <='1';
			 A0 <='1';
		wait for 10 ns;
			CLR <='0';
			INI <='1';
			 z  <='1';
			 A0 <='1';
			 wait for 10 ns;
			CLR <='0';
			INI <='1';
			 z  <='1';
			 A0 <='0';
			wait for 10 ns;
			CLR <='0';
			INI <='1';
			 z  <='1';
			 A0 <='0';
			 wait for 10 ns;
			CLR <='0';
			INI <='1';
			 z  <='1';
			 A0 <='0';
			 wait for 10 ns;
			CLR <='0';
			INI <='1';
			 z  <='0';
			 A0 <='0';
			 wait for 10 ns;
			CLR <='0';
			INI <='1';
			 z  <='0';
			 A0 <='0';
			 wait for 10 ns;
			CLR <='0';
			INI <='0';
			 z  <='0';
			 A0 <='0';
			 
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
