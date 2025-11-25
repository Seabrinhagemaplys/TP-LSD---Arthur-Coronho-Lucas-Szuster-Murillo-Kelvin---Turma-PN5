-- Arthur Coronho Seabra Eiras, Lucas Araújo Campos Szuster, Murillo Kelvin
-- Código do professor Marconi
library IEEE;
use IEEE.std_logic_1164.all;


entity divisor_clock is
	port (
		CLOCK_27MHz : in std_logic;
		reset : in std_logic;
		CLOCK_1Hz : out std_logic
	);

end entity;

architecture rtl of divisor_clock is

begin
	process (CLOCK_27MHz,reset)
		variable cnt : integer range 0 to 13500000;
		variable clk : std_logic:='0';
	begin
		if (reset = '1') then
			cnt := 0;
		elsif (rising_edge(CLOCK_27MHz)) then
			if (cnt = 13500000) then
				clk := not clk;
				cnt := 0;
			else
				cnt := cnt + 1;
			end if;
		end if;
		
		-- atribuição da saida
		CLOCK_1Hz <= clk;
	end process;
end architecture;
