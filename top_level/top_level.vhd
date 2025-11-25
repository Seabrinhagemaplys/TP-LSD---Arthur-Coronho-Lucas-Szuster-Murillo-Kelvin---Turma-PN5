library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_level is
    port(
        CLOCK_50   : in  std_logic;   -- Clock da placa DE2 (50 MHz)
        KEY        : in  std_logic_vector(3 downto 0); -- Botões
        SW         : in  std_logic_vector(9 downto 0); -- Chaves
        LEDR       : out std_logic_vector(9 downto 0); -- LEDs vermelhos
        LEDG       : out std_logic_vector(7 downto 0)  -- LEDs verdes
    );
end entity;

architecture RTL of top_level is

    signal clk_manual        : std_logic;
    signal reset_n           : std_logic;

    -- sinais internos conectados à controladora
    signal sinal_verde       : std_logic;
    signal sinal_amarelo     : std_logic;
    signal sinal_vermelho    : std_logic;
    signal night             : std_logic;
    signal clear_contador    : std_logic;
    signal vetor_estado      : std_logic_vector(2 downto 0);
    signal vetor_proximo_estado : std_logic_vector(2 downto 0);

begin

    -- BOTÕES
    reset_n    <= not KEY(1);  -- reset ativo baixo
    clk_manual <= not KEY(0);  -- botão como clock

    -- Instância da CONTROLADORA (FSM)
    U0: entity work.controladora
        port map(
            pedestre         => SW(0),   -- pedestre usa SW(0)
            outro_pedestre   => SW(1),   -- outro pedestre SW(1)
            emergencia       => SW(2),   -- emergência SW(2)
            outra_emergencia => SW(3),   -- outra emergência SW(3)
            ativar_night     => SW(4),   -- modo night SW(4)
            clk              => clk_manual,
            reset            => reset_n,
            count            => SW(5),   -- você pode ligar ao contador depois

            sinal_verde      => sinal_verde,
            sinal_amarelo    => sinal_amarelo,
            sinal_vermelho   => sinal_vermelho,
            night            => night,
            clear_contador   => clear_contador,
            vetor_estado     => vetor_estado,
            vetor_proximo_estado => vetor_proximo_estado
        );
      
    -- LEDs (controle simples para visualizar estados)
    LEDR(0) <= sinal_verde;
    LEDR(1) <= sinal_amarelo;
    LEDR(2) <= sinal_vermelho;

    LEDR(3) <= night;         -- night mode
    LEDR(4) <= clear_contador;

    LEDG(2 downto 0) <= vetor_estado;
    LEDG(5 downto 3) <= vetor_proximo_estado;

end RTL;
