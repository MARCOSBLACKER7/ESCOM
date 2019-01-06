LIBRARY IEEE;   
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    
ENTITY NUMEROS2 IS     
    GENERIC(
        N : INTEGER := 7
    );
    PORT (
        EN, CLK, CLR, UpD, L: IN STD_LOGIC;
        D: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        Q: INOUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
        C: OUT STD_LOGIC
    );

    ATTRIBUTE PIN_NUMBERS OF NUMEROS2: ENTITY IS
        "CLK:1 "       &
        "D(6):2 "      &
        "D(5):3 "      &
        "D(4):4 "      &
        "D(3):5 "      &
        "D(2):6 "      &
        "D(1):7 "      &
        "D(0):8 "      &
        "EN:9 "        &
        "L:10 "        &
        "UpD:11 "      &
        "CLR:13 "      &
        "Q(0):14 "     &
        "Q(1):15 "     &
        "Q(2):16 "     &
        "Q(3):17 "     &
        "Q(4):18 "     &
        "Q(5):19 "     &
        "Q(6):20 "     &
        "C:22";
END NUMEROS2;  

ARCHITECTURE CONTADOR OF NUMEROS2 IS 
    CONSTANT CEROS: STD_LOGIC_VECTOR(N-1 DOWNTO 0):= (OTHERS => '0');
    CONSTANT UNOS:  STD_LOGIC_VECTOR(N-1 DOWNTO 0):= (OTHERS => '1');
    BEGIN
        PCONT : PROCESS(CLK, CLR)
        VARIABLE AUX: STD_LOGIC;
        BEGIN
            IF(CLR = '1') THEN
                Q <= CEROS;
                C <= '0';
            ELSIF(RISING_EDGE(CLK)) THEN
                IF(EN = '1') THEN
                    IF(L = '0') THEN
                        IF(UpD = '1') THEN
                            Q <= Q + 1;
                            IF(Q + 1 = CEROS) THEN
                                C <= '1';
                            ELSE
                                C <= '0';
                            END IF;
                        ELSIF(UpD = '0') THEN
                            Q <= Q - 1;
                            IF(Q - 1 = UNOS) THEN
                                C <= '1';
                            ELSE
                                C <= '0';
                            END IF;
                        END IF;
                    ELSIF(L = '1') THEN
                        Q <= D;
                    END IF;
                END IF;
            END IF;
        END PROCESS PCONT;
END CONTADOR;