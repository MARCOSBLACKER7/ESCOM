--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:43:20 06/06/2018
-- Design Name:   
-- Module Name:   /home/ise/Desktop/ContadorUnos/ContadorUnos/TB_REGISTRO.vhd
-- Project Name:  ContadorUnos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: REGISTRO
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
 
ENTITY TB_REGISTRO IS
END TB_REGISTRO;
 
ARCHITECTURE behavior OF TB_REGISTRO IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT REGISTRO
    PORT(
         D : IN  std_logic_vector(7 downto 0);
         L : IN  std_logic;
         E : IN  std_logic;
         Q : INOUT  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         CLR : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(7 downto 0) := (others => '0');
   signal L : std_logic := '0';
   signal E : std_logic := '0';
   signal CLK : std_logic := '0';
   signal CLR : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: REGISTRO PORT MAP (
          D => D,
          L => L,
          E => E,
          Q => Q,
          CLK => CLK,
          CLR => CLR
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
      wait for 25 ns;
		D <= "11011101";
		L <= '0';
		CLR <= '1';
		E <='0';
		 wait for 25 ns;
		D <= "11011101";
		L <= '1';
		CLR <= '0';
		E <='0';
		 wait for 25 ns;
		D <= "11011101";
		L <= '0';
		CLR <= '0';
		E <='1';
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
