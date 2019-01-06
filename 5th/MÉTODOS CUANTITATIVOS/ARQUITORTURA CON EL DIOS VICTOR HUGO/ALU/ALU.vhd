library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- to_unsigned
--We use this package for watching alright the code and don't have a lot of line of code
use work.arith.all; -- include all the components from a personal package

--COMPUTERS' ARCHITECTURE
--PROFESOR VICTOR HUGO GARCIA ORTEGA
-- Authors: Angel Lopez Manriquez, Marcos Oswaldo Vazquez & Emmanuel.
-- ALU: Sumador de 8 bits, iniverte a, invierte b 
-- FPGA model: NEXYS4 DDR DIGILENT

-- we don't define -a - b yet.

entity alu is 
    generic ( 
        n: integer := 4 -- amount of bits to use 
    );
    port (
        a, b: in std_logic_vector (n - 1 downto 0); --variables in order to into the numbers
        aluop: in std_logic_vector(3 downto 0); --here you can choosse your operator 
        flags: out std_logic_vector(3 downto 0); --flags in the worst case, overflow, negatives, etc.
        ans: out std_logic_vector (n - 1 downto 0)
    );
end entity;

architecture programa of alu is
   --signal gnd: std_logic := '0';
    signal c: std_logic_vector(n downto 0); -- carries
    signal s_ans: std_logic_vector(n - 1 downto 0);
    
    -- very useful constant, a "zero vector". It was needed for the when else instruction
    constant zero: std_logic_vector(n - 1 downto 0) := (others => '0');

begin
		--IN ORDEN NOT TO BE LOST
    -- flags definitions
    -- overflow := flags(3);
    -- negative := flags(2);
    -- zero := flags(1);
    -- carry := flags(0);

    ans <= s_ans;

    
    flags(2) <= s_ans(n - 1); -- Negative
    flags(1) <= '1' when s_ans = zero else '0'; -- Zero
    

    -- aluop definitions
    -- aluop(3): a_invert
    -- aluop(2): b_invert
    -- aluop(1): mux(1)
    -- aluop(0): mux(0)
    process(a, b, aluop) is 
        variable a_invert: std_logic := aluop(3);
        variable b_invert: std_logic := aluop(2);

        variable muxa: std_logic_vector(n - 1 downto 0) ;
        variable muxb: std_logic_vector(n - 1 downto 0) ;
    begin
        for i in n - 1 downto 0 loop
            muxa(i) := a_invert xor a(i);
            muxb(i) := b_invert xor b(i);
        end loop;
        case (aluop(1 downto 0)) is 
            when "00" => s_ans <= muxa and muxb; --funciona
            when "01" => s_ans <= muxa or muxb;  -- funciona
            when "10" => s_ans <= muxa xor muxb; --funciona
            when others =>
                c <= carries_of_sum(muxa, b, b_invert); 
                s_ans <= c(n - 1 downto 0) xor muxa xor muxb;
        end case;

        if aluop(1 downto 0) = "11" then 
            flags(3) <= c(n) xor c(n - 1); -- Overflow
            flags(0) <= c(n); -- Final Carry
        else 
             flags(3) <= '0'; -- ov
             flags(0) <= '0'; -- Final Carry
        end if;


    end process;

end architecture;
