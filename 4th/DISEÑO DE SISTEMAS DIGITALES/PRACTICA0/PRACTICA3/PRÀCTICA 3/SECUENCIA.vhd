LIBRARY IEEE;   
USE IEEE.STD_LOGIC_1164.ALL;    
ENTITY SECUENCIA IS     
    PORT (
  	CLK, CLR, X: IN STD_LOGIC; 
	AN0: OUT STD_LOGIC;
    D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0) --ENTRADA Y SALIDA
    );
ATTRIBUTE PIN_NUMBERS OF SECUENCIA : ENTITY IS
	"CLK:1 "		& --pines de entrada
	"X:11 " 		&   --
	"CLR:13 "		&   --
    "AN0:14 "		& --pines de salida
    "D(6):15 "   	&   --
    "D(5):16 "   	&   --
    "D(4):17 "   	&   --
 	"D(3):18 "   	&   --
	"D(2):19 "   	&   --
	"D(1):20 "   	&   --
	"D(0):21 "; 
END SECUENCIA;  

ARCHITECTURE DETECTOR OF SECUENCIA IS 
	CONSTANT A : STD_LOGIC_VECTOR(6 DOWNTO 0):= "0001000";
	CONSTANT E : STD_LOGIC_VECTOR(6 DOWNTO 0):= "0110000";
	SIGNAL QA,QB,Y : STD_LOGIC;
	BEGIN
		AN0 <= '0';
		PROC : PROCESS(CLK,CLR)--señales asincronas
			BEGIN
				IF(CLR = '1') THEN 
					QA <= '0';
					QB <= '0';
				ELSIF(CLK'EVENT AND CLK = '1') THEN
						QA <=(NOT QB AND X) OR (QA AND X);
					    QB <=(QA AND X) OR (QA AND QB);
				END IF;
				END PROCESS PROC;
		Y<= (NOT QA AND  QB AND X);
		D <= A WHEN (Y<='1') ELSE
		           E;
END DETECTOR;
