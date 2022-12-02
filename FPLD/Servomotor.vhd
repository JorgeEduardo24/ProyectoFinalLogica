library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Servomotor is

    generic( Max: natural := 100000); 
    Port (   clock :  in  STD_LOGIC; 
				 Position :  in  STD_LOGIC;
             PWM_Signal :  out  STD_LOGIC);
				 
end Servomotor;

ARCHITECTURE Servomotor of Servomotor is 

	 signal CountServo: integer range 1 to Max;
	 begin
	 
	 
	 create_PWM: process( clock, Position,CountServo)
               constant center: integer := 75000;
					constant left45: integer := 52500;
					constant left90: integer := 30000 ;  
               constant right90: integer := 120000;
               constant right45: integer := 97500; 
               						
          begin

             if rising_edge(clock)then 
					CountServo <= CountServo + 1;
             end if;

                     case (Position) is
--                               when '11111001' =>--con el selector en 00 se posiciona en servo en 0
--                                      if CountServo <= left45 then 
--														PWM_Signal <= '1';
--                                        else                                        
--														PWM_Signal <= '0';
--                                       end if;
--
--                                 when '10100100' =>-- selector en 01 posición en 45
--                                       if CountServo <= pos2 then 
--														PWM_Signal <= '1';
--                                       else                                       
--														PWM_Signal <= '0';
--                                       end if;

                                 when '1' =>-- con el selector en 11 se posiciona en servo en 90�
                                       if CountServo <= left90 then 
														PWM_Signal <= '1';
                                       else                                       
													   PWM_Signal <= '0';
                                        end if;

--                                 when '10011001' =>-- con el selector en 10 se posiciona en servo en 180�
--                                        if CountServo <= pos4 then 
--														 PWM_Signal <= '1';
--                                         else                                        
--														  PWM_Signal <= '0';
--                                        end if;
--
--											when '10010010' =>-- con el selector en 10 se posiciona en servo en 180�
--                                         if CountServo <= pos5 then 
--														 PWM_Signal <= '1';
--                                         else                                        
--														 PWM_Signal <= '0';
--                                         end if;
                                 when others => PWM_Signal <= '0';
                     end case;
          end process create_PWM;
end Servomotor;