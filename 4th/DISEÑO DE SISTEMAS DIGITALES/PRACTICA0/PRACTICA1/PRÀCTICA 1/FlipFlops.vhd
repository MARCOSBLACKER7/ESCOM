LIBRARY IEEE;   
USE IEEE.STD_LOGIC_1164.ALL;    
    
ENTITY FlipFlops IS     
    
    PORT (
        S, R, J, K, D, T: IN STD_LOGIC;
        CLK, CLR: IN STD_LOGIC;    
        Selector: IN STD_LOGIC_VECTOR(1 DOWNTO 0);    
        Display: OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
    );

    ATTRIBUTE PIN_NUMBERS OF FlipFlops : ENTITY IS 
        "CLK:1 "            &  
        "CLR:2 "            &   
        "S:3 "              &   
        "R:4 "              &   
        "J:5 "              &   
        "K:6 "              &
        "D:7 "              &   
        "T:8 "              &   
        "Selector(1):9 "    &   
        "Selector(0):10 "   & 
        "Display(0):15 "    &   
        "Display(1):16 "    &   
        "Display(2):17 "    &   
        "Display(3):18 "    &   
        "Display(4):19 "    &   
        "Display(5):20 ";  
END FlipFlops;  


ARCHITECTURE Behave OF FlipFlops IS 

    SIGNAL QofSR, QofJK, QofD, QofT: STD_LOGIC;
    SIGNAL MuxtiplexorOut: STD_LOGIC;

    CONSTANT Visual0 : STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000";
    CONSTANT Visual1 : STD_LOGIC_VECTOR(5 DOWNTO 0) := "100111";

    BEGIN

    -- =============  FLIP FLOP SR  ============== --
    FlipFlopSR: PROCESS (CLK, CLR)
    BEGIN
        IF (CLR = '1') THEN
            QofSR <= '0';
        ELSIF (CLK'EVENT AND CLK = '1') THEN
            QofSR <= S OR ((NOT R) AND QofSR);  
        END IF;
        
    END PROCESS;

    -- =============  FLIP FLOP JK  ============== --   
    FlipFlopJK: PROCESS (CLK, CLR)
    BEGIN
        IF (CLR = '1') THEN
            QofJK <= '0';
        ELSIF (CLK'EVENT AND CLK = '1') THEN
            QofJK <= (J AND (NOT QofJK)) OR ((NOT K) AND QofJK);  
        END IF;
        
    END PROCESS;

    -- =============  FLIP FLOP D  ============== --   
    FlipFlopD: PROCESS (CLK, CLR)
    BEGIN
        IF(CLR = '1') THEN
            QofD <= '0';
        ELSIF (CLK'EVENT AND CLK = '1') THEN
            QofD <= D;
        END IF;
    END PROCESS;

    -- =============  FLIP FLOP T  ============== --   
    FlipFlopT: PROCESS (CLK, CLR)
    BEGIN
        IF(CLR = '1') THEN
            QofT <= '0';
        ELSIF (CLK'EVENT AND CLK = '1') THEN
            QofT <= T XOR QofT;
        END IF;
    END PROCESS;

    -- ============== MUX ======================== --
    MuxtiplexorOut <= QofJK WHEN Selector = "00" ELSE
                      QofT  WHEN Selector = "01" ELSE
                      QofD  WHEN Selector = "10" ELSE
                      QofSR;

    -- =============== CODE CONVERTER =============== --
    Display <=  Visual0      WHEN (MuxtiplexorOut = '0') ELSE
                Visual1;

END Behave;