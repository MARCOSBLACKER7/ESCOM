library ieee;

use ieee.std_logic_1164.all;

package arith is

    function carries_of_sum(
        a: std_logic_vector;
        b: std_logic_vector;
        b_invert: std_logic ) return std_logic_vector;

    function vprod (vec: std_logic_vector) return std_logic;

    function vxor_pair(u: std_logic_vector; v: std_logic_vector) 
        return std_logic_vector;

end package ; -- own 

package body arith is 

    function vxor_pair(u: std_logic_vector; v: std_logic_vector) 
    return std_logic_vector is 
        variable solution: std_logic_vector(u'length - 1 downto 0);
    begin 
        for i in u'length - 1 downto 0 loop
            solution(i) := u(i) xor v(i);
        end loop;
    end function;

	function vprod (vec: std_logic_vector) 
	return std_logic is
		variable result : std_logic := '1';
	begin 
		for i in vec'length - 1 downto 0 loop 
			result := result and vec(i);
		end loop;
		return result;
	end function;

    -- if b_invert is 0 we add else we subtract.
    -- the lenght of a must be equal to b.
    -- if a has n bits c must have n + 1 bits
    function carries_of_sum(a: std_logic_vector;
                            b: std_logic_vector;
                            b_invert: std_logic ) 
    return std_logic_vector is 
        variable n: integer := a'length;
        variable c: std_logic_vector(n downto 0);
        variable eb, p, g, s: std_logic_vector(n - 1 downto 0);
        variable sum, prod: std_logic;
    begin	
        c(0) := b_invert;
        for i in 0 to n - 1 loop    
            eb(i) := b(i) xor b_invert; -- variable change
            p(i)  := a(i) xor eb(i);
            g(i)  := a(i) and eb(i);
            sum := '0';
            for j in 0 to i - 1 loop -- summation
                prod := '1'; 
                for k in j + 1 to i loop 
                    prod := prod and p(k); 
                end loop;
                sum := sum or (g(j) and prod);
            end loop;
            prod := vprod(p(i downto 0));
            c(i + 1) := g(i) or sum or (c(0) and prod);
        end loop;
        return c;
    end function;



end package body;