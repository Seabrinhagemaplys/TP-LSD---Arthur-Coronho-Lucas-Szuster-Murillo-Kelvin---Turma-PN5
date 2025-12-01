-- Arthur Coronho Seabra Eiras, Lucas Araújo Campos Szuster, Murillo Kelvin - Turma PN5
library IEEE;
use IEEE.std_logic_1164.all;

entity tb_controladora is
end entity;

architecture sim of tb_controladora is

    -- Sinais de entrada
    signal pedestre         : std_logic := '0';
    signal outro_pedestre   : std_logic := '0';
    signal emergencia       : std_logic := '0';
    signal outra_emergencia : std_logic := '0';
    signal ativar_night     : std_logic := '0';
    signal reset            : std_logic := '0';
    signal count            : std_logic := '0';

    -- Sinais de saída
    signal sinal_verde          : std_logic;
    signal sinal_amarelo        : std_logic;
    signal sinal_vermelho       : std_logic;
    signal night                : std_logic;
    signal clear_contador       : std_logic;
    signal vetor_estado         : std_logic_vector(2 downto 0);
    signal vetor_proximo_estado : std_logic_vector(2 downto 0);

    -- clk
    signal clk        : std_logic := '1';
    signal clk_enable : std_logic := '1';
    constant tempo    : time := 10 ns;

begin
	-- inicializando a uut e realizando o port map
    uut: entity work.controladora
    port map (
      pedestre             => pedestre,
      outro_pedestre       => outro_pedestre,
      emergencia           => emergencia,
      outra_emergencia     => outra_emergencia,
      ativar_night         => ativar_night,
      clk                  => clk,
      reset                => reset,
      count                => count,
      sinal_verde          => sinal_verde,
      sinal_amarelo        => sinal_amarelo,
      sinal_vermelho       => sinal_vermelho,
      night                => night,
      clear_contador       => clear_contador,
      vetor_estado         => vetor_estado,
      vetor_proximo_estado => vetor_proximo_estado
	);
    
    -- inicializando o pulso do clock
    clk <= clk_enable and not clk after tempo/2;
        
    stim: process
    begin
    	wait for tempo *4;
        
        -- gerar ciclo
        for i in 0 to 5 loop
        	-- ativar e desativar count para estado
        	count <= '1';
        	wait for tempo * 2;
        	count <= '0';
          
          	-- adicionar emergencia aleatoria
        	if(i = 3) then
        		emergencia <= '1';
        	end if;

			-- esperar
        	wait for tempo * 10;
        end loop;
        
        -- night
        ativar_night <= '1';
        wait for tempo * 10;
    
    	-- finalizando o clock
        clk_enable <= '0';
        
        -- finalizando o processo
        wait;
    end process;

end architecture;
