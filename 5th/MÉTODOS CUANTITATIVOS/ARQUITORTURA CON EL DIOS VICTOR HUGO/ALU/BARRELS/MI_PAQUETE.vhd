--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package MI_PAQUETE is

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--

FUNCTION SHL(SIGNAL DATAIN: STD_LOGIC_VECTOR;
				 SIGNAL SHIFT: STD_LOGIC_VECTOR)
				 RETURN STD_LOGIC_VECTOR;
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end MI_PAQUETE;

package body MI_PAQUETE is

FUNCTION SHL(SIGNAL DATAIN: STD_LOGIC_VECTOR;
				 SIGNAL SHIFT: STD_LOGIC_VECTOR)
				 RETURN STD_LOGIC_VECTOR IS
				 
		--variable DATA_SHIFT: STD_LOGIC_VECTOR(7 DOWNTO 0); --integer; -- shift
		variable data_shift: STD_LOGIC_VECTOR(7 DOWNTO 0);--variable j: integer; -- data in
		variable INDICE: INTEGER RANGE -8 TO 7;
	begin 
		data_shift := DATAIN;
		for i in 0 to nshift - 1 loop
			for j in nbits - 1 downto 0 loop 
				if (shift(i) = '1' )then 
					INDICE := J-2 ** I;
						data_shift(j) := '0';
					else 
						data_shift(j) := DATA_SHIFT(INDICE);
					end if;
				end if;
			end loop;
		end loop;
		RETURN data_shift;
	END SHL;

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end MI_PAQUETE;
