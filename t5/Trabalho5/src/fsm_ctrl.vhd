-------------------------------------------------------------------------------
-- fsm_ctrl.vhd
-- Maquina de estados do receptor UART: IDLE -> START -> DATA -> STOP -> IDLE.
-- Usa o tick16 do baud_gen (16 ticks por bit) para amostrar no centro de cada bit.
--
--   IDLE : aguarda start bit (rx_sync = '0').
--   START: no meio do start (8 ticks) confirma rx_sync = '0', senao volta a IDLE.
--   DATA : a cada 16 ticks amostra 1 bit (pulso shift_out), por 8 bits.
--   STOP : amostra o stop bit; se '1', pulsa en_out (dado pronto).
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_ctrl is
  port (
    clock_in  : in  std_logic;
    reset_in  : in  std_logic;
    tick16    : in  std_logic;   -- pulso de oversampling (16x baud)
    rx_sync   : in  std_logic;   -- linha serial sincronizada
    shift_out : out std_logic;   -- pulso p/ shift_reg amostrar 1 bit
    en_out    : out std_logic    -- data_p_en_out (dado pronto)
  );
end entity fsm_ctrl;

architecture rtl of fsm_ctrl is

  type state_t is (IDLE, START, DATA, STOP);
  signal state : state_t;

  signal tick_cnt : unsigned(3 downto 0);   -- ticks dentro de um bit (0..15)
  signal bit_cnt  : unsigned(2 downto 0);   -- bits de dados recebidos (0..7)

begin

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
        -- pulsos de 1 ciclo
        shift_out <= '0';
        en_out    <= '0';

        case state is
          when IDLE =>
            if rx_sync = '0' then              -- start bit
              state    <= START;
              tick_cnt <= (others => '0');
            end if;

          when START =>
            if tick16 = '1' then
              if tick_cnt = 7 then             -- centro do start bit
                if rx_sync = '0' then
                  state    <= DATA;
                  tick_cnt <= (others => '0');
                  bit_cnt  <= (others => '0');
                else
                  state <= IDLE;               -- start invalido
                end if;
              else
                tick_cnt <= tick_cnt + 1;
              end if;
            end if;

          when DATA =>
            if tick16 = '1' then
              if tick_cnt = 15 then            -- centro do bit de dados
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
              if tick_cnt = 15 then            -- centro do stop bit
                if rx_sync = '1' then
                  en_out <= '1';               -- stop valido -> dado pronto
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
