library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity divisor is 
	Port (
		clk: in STD_LOGIC;
		reset: in STD_LOGIC;
		salida : out STD_LOGIC
			);
end divisor;


architecture Behavioral of divisor is

 signal temporal: STD_LOGIC;
 signal contador: integer range 0 to 15 := 0;

 begin
 divisor_frecuencia: process (reset,clk)
	begin
		if (reset = '1') then
			temporal <= '0';
			contador <= 0;
		elsif rising_edge(clk) then
			if (contador = 15) then
				temporal <= NOT(temporal);
				contador <= 0;
			else
				contador <= contador+1;
			end if;
		end if;
	end process;
 salida <= temporal;
end Behavioral;
