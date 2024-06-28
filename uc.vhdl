library ieee;
use ieee.std_logic_1164.all;

entity uc is
    port(
        qa   : in  bit_vector(2 downto 0);
        j, k : out bit_vector(2 downto 0)
        );
end uc;

architecture controle of uc is

begin
    j(0) <= '1';
    k(0) <= qa(1) and not qa(2);
    j(1) <= qa(0);
    k(1) <= not qa(0) or qa(2);
    j(2) <= not qa(0) and qa(1);
    k(2) <= not qa(0) or qa(1);

end architecture controle;


