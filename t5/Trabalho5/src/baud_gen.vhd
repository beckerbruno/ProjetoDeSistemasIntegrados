-------------------------------------------------------------------------------
-- baud_gen.vhd
-- Gerador de baud rate com oversampling de 16x.
-- A partir do clock de 100 MHz e da selecao "uart_rate_rx_sel", gera um pulso
-- de 1 ciclo ("tick16") a uma frequencia 16x a baud rate escolhida.
--
--   tick16_freq = 16 * baud_rate
--   N = round( f_clock / tick16_freq ) = round( 100e6 / (16 * baud) )
--
--   uart_rate_rx_sel | baud [bps] | tick16 [Hz] |   N (=100e6/tick16)
--   -----------------+-----------+-------------+--------------------
--          00        |   9600    |   153600    |   ~651
--          01        |  19200    |   307200    |   ~326
--          10        |  28800    |   460800    |   ~217
--          11        |  57600    |   921600    |   ~109
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity baud_gen is
  port (
    clock_in     : in  std_logic;                      -- clock master (100 MHz)
    reset_in     : in  std_logic;                      -- reset sincrono
    rate_sel     : in  std_logic_vector(1 downto 0);   -- uart_rate_rx_sel
    tick16_out   : out std_logic                       -- pulso de oversampling (16x baud)
  );
end entity baud_gen;

architecture rtl of baud_gen is

  -- Numero de ciclos de clock por tick16 (N = 100e6 / (16*baud)).
  constant N_9600  : integer := 651;
  constant N_19200 : integer := 326;
  constant N_28800 : integer := 217;
  constant N_57600 : integer := 109;

  signal limit   : unsigned(15 downto 0);   -- terminal count selecionado
  signal counter : unsigned(15 downto 0);   -- contador

begin

  -- Parte A: decodifica rate_sel -> limit (N correspondente).
  with rate_sel select
    limit <= to_unsigned(N_9600,  16) when "00",
             to_unsigned(N_19200, 16) when "01",
             to_unsigned(N_28800, 16) when "10",
             to_unsigned(N_57600, 16) when others;  -- "11"

  -- Parte B: contador que zera ao chegar em "limit" e gera tick16_out = '1'
  --          por 1 ciclo nesse instante (periodo = N ciclos de clock).
  process (clock_in)
  begin
    if rising_edge(clock_in) then
      if reset_in = '1' then
        counter    <= (others => '0');
        tick16_out <= '0';
      elsif counter = (limit - 1) then
        counter    <= (others => '0');
        tick16_out <= '1';
      else
        counter    <= counter + 1;
        tick16_out <= '0';
      end if;
    end if;
  end process;

end architecture rtl;
