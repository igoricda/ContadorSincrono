library ieee;
use ieee.std_logic_1164.all;

entity contador3bit is
	port(
		clock, reset : in bit;
		c: out bit_vector(2 downto 0)
		);
end entity;
		
architecture comp of contador3bit is		
	component ffjk is
		port(
			j, k: in bit;
			clock : in bit;
			pr, cl : in bit;
			q, nq : out bit
		);
		end component;
		
	component uc is
		port(
			qa: in bit_vector (2 downto 0);
			j, k : out bit_vector (2 downto 0)
			);
		end component;
		
		signal sjj, skk, sq: bit_vector (2 downto 0);
		signal vcc : bit := '1';

begin
    u_ff0 : ffjk port map(sjj(0), skk(0), clock, reset, vcc, sq(0));
    u_ff1 : ffjk port map(sjj(1), skk(1), clock, vcc, reset, sq(1));
    u_ff2 : ffjk port map(sjj(2), skk(2), clock, vcc, reset, sq(2));
    u_uc :  uc port map(sq(2 downto 0), sjj(2 downto 0), skk(2 downto 0));
    
    c <= sq;    
end architecture;
    
