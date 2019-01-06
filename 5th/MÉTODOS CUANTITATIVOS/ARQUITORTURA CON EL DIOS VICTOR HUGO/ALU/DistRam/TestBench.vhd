--------------------------------------------------------------------------------
-- COMPUTERS' ARCHITECTURE
-- AUTHORS:
		-- LOPEZ MANRIQUEZ ANGEL
		-- MAYA ROCHA EMMANUEL
		-- VAZQUEZ MARCOS
		
-- Create Date:   17:53:24 10/02/2018
-- Design Name:   
-- Module Name:   C:/Xilinx/DistRam/TestBench.vhd
-- Project Name:  DistRam

-- VHDL Test Bench Created by ISE for module: RAM_D
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
USE ieee.std_logic_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_ARITH.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--YOU CAN USE STD_LOGIC 
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_RAM_D IS
GENERIC(
         DATA_N: INTEGER:=16;
			ADDR_N: INTEGER:=8
			);
END TB_RAM_D;
 
ARCHITECTURE behavior OF TB_RAM_D IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM_D
    PORT(
         CLK : IN  std_logic;
         WD : IN  std_logic;
         ADDR : IN  std_logic_vector(ADDR_N-1 downto 0);
         DIN : IN  std_logic_vector(DATA_N-1 downto 0);
         DOUT : OUT  std_logic_vector(DATA_N-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal WD : std_logic := '0';
   signal ADDR : std_logic_vector(ADDR_N-1 downto 0) := (others => '0');
   signal DIN : std_logic_vector(DATA_N-1 downto 0) := (others => '0');

 	--Outputs
   signal DOUT : std_logic_vector(DATA_N-1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM_D PORT MAP (
          CLK => CLK,
          WD => WD,
          ADDR => ADDR,
          DIN => DIN,
          DOUT => DOUT
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
	
	file FILE_RES : TEXT;			 --	file of results																	
	variable LINE_RES : line;
	VARIABLE VAR_DOUT : STD_LOGIC_VECTOR(DATA_N-1 DOWNTO 0);
	file FILE_INT : TEXT; --file of data that enters
	
	variable LINE_INT : line;
	
	VARIABLE VAR_ADDR : STD_LOGIC_VECTOR(ADDR_N-1 DOWNTO 0);  --ADDR (8 bits)
	VARIABLE VAR_DIN : STD_LOGIC_VECTOR(DATA_N-1 DOWNTO 0); --DIN (16 bits)
	VARIABLE VAR_WD : STD_LOGIC;  --WD (1 bit)
	VARIABLE CHAIN : STRING(1 TO 5);
   begin		
		file_open(FILE_INT, "ENTRADAS.TXT", READ_MODE); 	
		file_open(FILE_RES, "RESULTADOS.TXT", WRITE_MODE); 	

		CHAIN := "  DIN";
		write(LINE_RES, CHAIN, right, CHAIN'LENGTH+1);	--Write" DIN"
		CHAIN := "ADDR ";
		write(LINE_RES, CHAIN, right, CHAIN'LENGTH+1);	--Write "ADDR"
		CHAIN := "  WD ";
		write(LINE_RES, CHAIN, right, CHAIN'LENGTH+1);	--Write "  WD"
		CHAIN := "DOUT "; 
		write(LINE_RES, CHAIN, right, CHAIN'LENGTH+1);
		writeline(FILE_RES,LINE_RES);		-- Write a line of the file

		WAIT FOR 10 NS;
		FOR I IN 0 TO 11 LOOP
			readline(FILE_INT, LINE_INT); -- Read a complete line
			Hread(LINE_INT, VAR_DIN);
			DIN <= VAR_DIN;
			
			Hread(LINE_INT, VAR_ADDR);
			ADDR <= VAR_ADDR;		
			read(LINE_INT, VAR_WD);  
			WD <= VAR_WD;
			
			WAIT UNTIL RISING_EDGE(CLK);	
			VAR_DOUT := DOUT;
			
			Hwrite(LINE_RES, VAR_DIN, right, 5);	--write  DIN
			Hwrite(LINE_RES, VAR_ADDR, 	right, 5);	--write  ADDR
			write(LINE_RES, VAR_WD, 	right, 5);	--write  WD
			Hwrite(LINE_RES, VAR_DOUT, right, 5);
			writeline(FILE_RES,LINE_RES);-- write a line in the file
			
		end loop;
		file_close(FILE_INT);  -- close files
		file_close(FILE_RES);  

      wait;
   end process;
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for CLK_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

END;
