-------------------------------------------------------------------------------
-- fsm_ctrl.vhd
-- Maquina de estados do receptor UART.
--
-- Estados: IDLE -> START -> DATA -> STOP -> IDLE
--
--   IDLE : aguarda borda de descida (start bit = '0') em rx_sync.
--   START: espera meio bit (8 ticks de tick16) e confirma se ainda esta em '0'
--          (centro do bit). Se invalido, volta para IDLE.
--   DATA : a cada 16 ticks amostra o bit no centro e comanda shift_reg
--          (pulso shift_out) por 8 bits.
--   STOP : espera o bit de stop (centro). Se stop = '1', pulsa data_p_en_out
--          e volta para IDLE.
--
-- A contagem de tempo usa o "tick16" do baud_gen (16 ticks por bit).
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_ctrl is
  port (
    clock_in   : in  std_logic;                 -- clock master (100 MHz)
    reset_in   : in  std_logic;                  -- reset sincrono
    tick16     : in  std_logic;                  -- pulso de oversampling (16x baud)
    rx_sync    : in  std_logic;                  -- linha serial sincronizada
    shift_out  : out std_logic;                  -- pulso p/ shift_reg amostrar 1 bit
    en_out     : out std_logic                   -- data_p_en_out (dado pronto)
  );
end entity fsm_ctrl;

architecture rtl of fsm_ctrl is

  type state_t is (IDLE, START, DATA, STOP);
  signal state : state_t;

  -- Contador de ticks dentro de um bit (0..15)
  signal tick_cnt : unsigned(3 downto 0);
  -- Contador de bits de dados recebidos (0..7)
  signal bit_cnt  : unsigned(2 downto 0);

begin

  -- Processo da FSM (sincrono com clock_in).
  --
  -- Sugestao de estrutura:
  --   process (clock_in)
  --     if reset:  state <= IDLE; zera contadores; saidas em '0'
  --     senao (borda de subida):
  --        defaults: shift_out <= '0'; en_out <= '0';
  --        case state is
  --          when IDLE  => se rx_sync = '0' -> state <= START; tick_cnt <= 0
  --          when START => se tick16='1':
  --                           se tick_cnt = 7 (meio do bit):
  --                              se rx_sync='0' -> state<=DATA; tick_cnt<=0; bit_cnt<=0
  --                              senao          -> state<=IDLE  (start invalido)
  --                           senao tick_cnt <= tick_cnt + 1
  --          when DATA  => se tick16='1':
  --                           se tick_cnt = 15 (centro do proximo bit):
  --                              shift_out <= '1'; tick_cnt <= 0
  --                              se bit_cnt = 7 -> state<=STOP
  --                              senao             bit_cnt <= bit_cnt + 1
  --                           senao tick_cnt <= tick_cnt + 1
  --          when STOP  => se tick16='1':
  --                           se tick_cnt = 15:
  --                              se rx_sync='1' -> en_out <= '1';  -- stop valido
  --                              state <= IDLE; tick_cnt <= 0
  --                           senao tick_cnt <= tick_cnt + 1
  --        end case;
  process (clock_in)
  begin
    if rising_edge(clock_in) then
      if reset_in = '1' then
        state     <= IDLE;
        tick_cnt  <= (others => '0');
        bit_cnt   <= (others => '0');
        shift_out <= '0';
        en_out    <= '0';
      else
        -- defaults: pulsos de 1 ciclo
        shift_out <= '0';
        en_out    <= '0';

        case state is
          when IDLE =>
            -- aguarda start bit (linha em '0')
            if rx_sync = '0' then
              state    <= START;
              tick_cnt <= (others => '0');
            end if;

          when START =>
            if tick16 = '1' then
              if tick_cnt = 7 then
                -- centro do start bit: confirma se ainda em '0'
                if rx_sync = '0' then
                  state    <= DATA;
                  tick_cnt <= (others => '0');
                  bit_cnt  <= (others => '0');
                else
                  state <= IDLE;  -- start invalido (glitch)
                end if;
              else
                tick_cnt <= tick_cnt + 1;
              end if;
            end if;

          when DATA =>
            if tick16 = '1' then
              if tick_cnt = 15 then
                -- centro do bit de dados: amostra/desloca
                shift_out <= '1';
                tick_cnt  <= (others => '0');
                if bit_cnt = 7 then
                  state <= STOP;
                else
                  bit_cnt <= bit_cnt + 1;
                end if;
              else
                tick_cnt <= tick_cnt + 1;
              end if;
            end if;

          when STOP =>
            if tick16 = '1' then
              if tick_cnt = 15 then
                -- centro do stop bit
                if rx_sync = '1' then
                  en_out <= '1';  -- stop valido -> dado pronto
                end if;
                state    <= IDLE;
                tick_cnt <= (others => '0');
              else
                tick_cnt <= tick_cnt + 1;
              end if;
            end if;
        end case;
      end if;
    end if;
  end process;

end architecture rtl;
