library ieee;
use ieee.std_logic_1164.all;

entity tb_cont3b is
    -- entidade vazia
end tb_cont3b;

architecture test of tb_cont3b is
    constant CLK_PERIOD : time := 20 ns;
    
    component contador3bit is
	port(
		clock, reset : in bit;
		c: out bit_vector(2 downto 0)
		);
    end component;
    
    signal sreset : bit := '0';
    signal sclk : bit := '0'; --Faz ser possivel o reset, mas ele fica no 'rising-edge' ao inves do 'falling-edge'
    signal sc : bit_vector (2 downto 0);
    
begin
    -- instancia de JK e port map
    u_tbc3b : contador3bit port map(sclk, sreset, sc(2 downto 0));
    
    -- process
    u_tbp : process 
    begin
    
        sreset <= '0';
        
        wait for CLK_PERIOD;
        
        sreset <= '1';
              
        wait for CLK_PERIOD;
        
        wait for CLK_PERIOD;
        
        wait for CLK_PERIOD;
        
        sreset <= '0';
        wait for CLK_PERIOD;
        sreset <= '1';
        
        wait for CLK_PERIOD;
        
        sreset <= '0';
        wait for CLK_PERIOD;
        
        sreset <= '1';
        wait for CLK_PERIOD;
        
        wait for CLK_PERIOD;
        
        wait for CLK_PERIOD;
        
        wait for CLK_PERIOD; 
        
        wait for CLK_PERIOD;
               
    end process;
    
    -- process para Clock
    p_clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;
    
end architecture test;
