LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY REGISTRO IS 
	PORT(
		CLK, CLR, ES: IN STD_LOGIC;
		OPER: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	    D	: IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		Q	: INOUT STD_LOGIC_VECTOR(6 DOWNTO 0)

	);
ATTRIBUTE PIN_NUMBERS OF REGISTRO : ENTITY IS
		"CLK:1 "               &  
        "ES:2 "           	   &   
        "D(6):3 "              &   
        "D(5):4 "              &   
        "D(4):5 "              &   
        "D(3):6 "              &
        "D(2):7 "              &   
        "D(1):8 "              &   
        "D(0):9 "    		   &   
        "OPER(0):10 "          & 
        "OPER(1):11 "          & 
  		"CLR:13 "       	   &
  		"Q(0):14 "       	   & 
        "Q(1):15 "             &   
        "Q(2):16 "             &   
        "Q(3):17 "             &   
        "Q(4):18 "             &  
 	    "Q(5):19 "             &  
        "Q(6):20 ";
 
END REGISTRO;

ARCHITECTURE PRACTICA OF REGISTRO IS 
BEGIN
	PREG : PROCESS(CLR, CLK)
	BEGIN
		IF(CLR= '1') THEN
			Q <= (OTHERS =>'0');
		ELSIF(CLK'EVENT AND CLK = '1' )THEN
		FOR I IN  6 DOWNTO 0 LOOP
			IF(I=0) THEN

		 	Q(I)<=  ( Q(I)   AND NOT OPER(1) AND NOT OPER(0) ) OR
					( D(I)   AND NOT OPER(1) AND     OPER(0) ) OR
					( ES     AND     OPER(1) AND NOT OPER(0) ) OR
					( Q(I+1) AND     OPER(1) AND     OPER(0) );
			
			ELSIF (I=6) THEN
			Q(I)<=  ( Q(I)   AND NOT OPER(1) AND NOT OPER(0) ) OR
					( D(I)   AND NOT OPER(1) AND     OPER(0) ) OR
					(Q(I-1)  AND     OPER(1) AND NOT OPER(0) ) OR
					(ES      AND     OPER(1) AND     OPER(0) );


			ELSE

	Q(I)<=  ( Q(I) AND NOT OPER(1) AND NOT OPER(0) ) OR
			( D(I) AND NOT OPER(1) AND     OPER(0) ) OR
			( Q(I-1) AND     OPER(1) AND NOT OPER(0) ) OR
			( Q(I+1)   AND     OPER(1) AND     OPER(0) );
			
				END IF;
			END LOOP;
		 END IF;
 	END PROCESS PREG;
END PRACTICA;

