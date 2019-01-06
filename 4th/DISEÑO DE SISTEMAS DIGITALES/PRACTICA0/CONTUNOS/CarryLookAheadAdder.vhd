----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:14:56 09/03/2018 
-- Design Name: 
-- Module Name:    CarryLookAheadAdder - Programa 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CarryLookAheadAdder is 
    generic ( 
        n: integer := 4 -- we'll use four bits
    );
    port (
        a, b: in std_logic_vector (n - 1 downto 0);
        b_invert: in std_logic; -- 0 for sum, 1 for subtract
        cf: out std_logic; 
        s: out std_logic_vector (n - 1 downto 0)
    );
end entity;

architecture programa of CarryLookAheadAdder is

begin

    process(a, b, b_invert) is 
        variable eb, p, g: std_logic_vector(n - 1 downto 0);
        variable c: std_logic_vector(n downto 0); -- n + 1 bits
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
            prod := '1';
            for j in 0 to i loop
                prod := prod and p(j);
            end loop;
            c(i + 1) := g(i) or sum or (c(0) and prod);
        end loop;

        for i in 0 to n - 1 loop    
            s(i) <= p(i) xor c(i);
        end loop;
        cf <= c(n);
    end process;

end architecture;



