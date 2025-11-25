-- Arthur Coronho, Lucas Szuster, Murillo Kelvin - Turma PN5
library IEEE;
use IEEE.std_logic_1164.all;

entity criador_de_clock is
  generic (
    -- quantidade de contagem
    N : integer := 27000000
  );
  port (
    -- entradas
    SW : in std_logic_vector(0 downto 0);
    CLOCK_27 : in std_logic;
    
    -- saídas
    LEDR : out std_logic_vector(0 downto 0)
  );
end entity criador_de_clock;

architecture cnt of criador_de_clock is

    signal contador : integer range 0 to N := 0;

begin

    process(CLOCK_27, SW(0))
    begin
        if (SW(0) = '1') then
            -- clear_contador ligado, a saída vai para 0
            LEDR(0) <= '1';
            contador <= 0;

        elsif rising_edge(CLOCK_27) then
            if (contador = N) then
                LEDR(0) <= '0';
                contador <= 0;
            else
                contador <= contador + 1;
                LEDR(0) <= '1';
            end if;
        end if;
    end process;

end architecture cnt;
