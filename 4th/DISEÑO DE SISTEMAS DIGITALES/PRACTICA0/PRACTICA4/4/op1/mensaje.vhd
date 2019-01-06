library ieee;
use ieee.std_logic_1164.all;

entity mensaje is
    port(clk, clr: in std_logic;
         an: inout std_logic_vector(2 downto 0);
         d:  out std_logic_vector(6 downto 0));

    attribute pin_numbers of mensaje: entity is
    "clk:1 "         &
    "clr:13 "        &
    "an(0):14 "      &
    "d(0):15 " &
    "d(1):16 " &
    "d(2):17 " &
    "d(3):18 " &
    "d(4):19 " &
    "d(5):20 " &
    "d(6):21 " &
    "an(2):22 "      &
    "an(1):23";
end mensaje;

architecture ipn of mensaje is
    constant I: std_logic_vector(6 downto 0):= "1001111";
    constant P: std_logic_vector(6 downto 0):= "0011000";
    constant N: std_logic_vector(6 downto 0):= "1101010";
    constant q0: std_logic_vector(2 downto 0):= "110";
    constant q1: std_logic_vector(2 downto 0):= "101";
    constant q2: std_logic_vector(2 downto 0):= "011";
    begin
        process(clk, clr)
        begin
            if clr = '1' then
                an <= q0;
            elsif rising_edge(clk) then
                an(0) <= an(2);
                an(1) <= an(0);
                an(2) <= an(1);
            end if;
        end process;

    d <=       I when an = q0 else
               P when an = q1 else
               N when an = q2 else
               "0000000";

end ipn;
