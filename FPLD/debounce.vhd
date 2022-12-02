
-- Declaración de librerias
--
-- Librerias estandar IEEE 
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-----------------------------------------------------------------------------
entity debounce is
    Port (             
				  
					D_IN: in STD_LOGIC;
               clock: in STD_LOGIC;
					reset: in STD_LOGIC;
					Q_OUT: out STD_LOGIC
					);
						 
    end debounce;
--
------------------------------------------------------------------------------------

architecture Behavioral of debounce is


--  Provides a one-shot pulse from a non-clock input, with reset
--**Insert the following between the 'architecture' and
---'begin' keywords**
signal Q1, Q2, Q3 : std_logic;
signal clk_div : STD_LOGIC_VECTOR (20 downto 0):= (others => '0');

 begin 
--**Insert the following after the 'begin' keyword**

reloj: process (clock)
begin
if RISING_EDGE (clock) then
	clk_div <= clk_div + conv_std_logic_vector(1,21);
end if;
end process reloj;


process(clock)
begin
	if RISING_EDGE (clock) then
		if clk_div =conv_std_logic_vector(2097152,21) then
			if (reset = '1') then
				Q1 <= '0';
				Q2 <= '0';
				Q3 <= '0'; 
			else
				Q1 <= D_IN;
				Q2 <= Q1;
				Q3 <= Q2;
			end if;
		end if;
	end if;
end process;
 
Q_OUT <= Q1 and Q2 and (not Q3);

end Behavioral;

------------------------------------------------------------------------------------------------------------------------------------

