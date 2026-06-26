-------------------------------------------------------------------------------
-- uart_rx.vhd
-- Modulo TOP do receptor UART (Trabalho 5).
-- Conecta estruturalmente os sub-modulos: sync, baud_gen, shift_reg e fsm_ctrl.
--
--   clock_in / reset_in ---------------------------> todos os submodulos
--   uart_data_rx --[sync]--> rx_sync --> fsm_ctrl / shift_reg
--   uart_rate_rx_sel --[baud_gen]--> tick16 --> fsm_ctrl
--   fsm_ctrl --(shift/load)--> shift_reg --> data_p_out
--   fsm_ctrl --(en)---------------------------------> data_p_en_out
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity uart_rx is
  port (
    clock_in         : in  std_logic;                     -- referencia de clock master (100 MHz)
    reset_in         : in  std_logic;                     -- reset sincrono
    uart_data_rx     : in  std_logic;                     -- dado serial de entrada
    uart_rate_rx_sel : in  std_logic_vector(1 downto 0);  -- selecao da taxa de recepcao
    data_p_out       : out std_logic_vector(7 downto 0);  -- dado de saida paralelizado
    data_p_en_out    : out std_logic                      -- habilitacao do dado paralelizado
  );
end entity uart_rx;

architecture structural of uart_rx is

  ---------------------------------------------------------------------------
  -- Declaracao dos componentes
  ---------------------------------------------------------------------------
  component sync is
    port (
      clock_in : in  std_logic;
      reset_in : in  std_logic;
      async_in : in  std_logic;
      sync_out : out std_logic
    );
  end component;

  component baud_gen is
    port (
      clock_in   : in  std_logic;
      reset_in   : in  std_logic;
      rate_sel   : in  std_logic_vector(1 downto 0);
      tick16_out : out std_logic
    );
  end component;

  component shift_reg is
    port (
      clock_in : in  std_logic;
      reset_in : in  std_logic;
      shift_en : in  std_logic;
      rx_bit   : in  std_logic;
      data_out : out std_logic_vector(7 downto 0)
    );
  end component;

  component fsm_ctrl is
    port (
      clock_in  : in  std_logic;
      reset_in  : in  std_logic;
      tick16    : in  std_logic;
      rx_sync   : in  std_logic;
      shift_out : out std_logic;
      en_out    : out std_logic
    );
  end component;

  ---------------------------------------------------------------------------
  -- Sinais internos (ver diagrama de blocos)
  ---------------------------------------------------------------------------
  signal rx_sync_s   : std_logic;   -- saida do sincronizador
  signal tick16_s    : std_logic;   -- pulso de oversampling 16x
  signal shift_s     : std_logic;   -- comando de shift da FSM p/ shift_reg

begin

  ---------------------------------------------------------------------------
  -- Instanciacao / wiring estrutural
  ---------------------------------------------------------------------------
  u_sync : sync
    port map (
      clock_in => clock_in,
      reset_in => reset_in,
      async_in => uart_data_rx,
      sync_out => rx_sync_s
    );

  u_baud_gen : baud_gen
    port map (
      clock_in   => clock_in,
      reset_in   => reset_in,
      rate_sel   => uart_rate_rx_sel,
      tick16_out => tick16_s
    );

  u_shift_reg : shift_reg
    port map (
      clock_in => clock_in,
      reset_in => reset_in,
      shift_en => shift_s,
      rx_bit   => rx_sync_s,
      data_out => data_p_out
    );

  u_fsm_ctrl : fsm_ctrl
    port map (
      clock_in  => clock_in,
      reset_in  => reset_in,
      tick16    => tick16_s,
      rx_sync   => rx_sync_s,
      shift_out => shift_s,
      en_out    => data_p_en_out
    );

end architecture structural;
