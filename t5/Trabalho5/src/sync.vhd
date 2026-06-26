-------------------------------------------------------------------------------
-- sync.vhd
-- Sincronizador de 2 flip-flops para a linha serial de entrada (uart_data_rx).
-- Evita metaestabilidade ao trazer o sinal assincrono para o dominio de
-- clock_in (100 MHz).
--
--   uart_data_rx ->[FF1]->[FF2]-> rx_sync
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity sync is
  port (
    clock_in : in  std_logic;                 -- clock master (100 MHz)
    reset_in : in  std_logic;                 -- reset sincrono
    async_in : in  std_logic;                 -- linha serial assincrona (uart_data_rx)
    sync_out : out std_logic                  -- sinal sincronizado (rx_sync)
  );
end entity sync;

architecture rtl of sync is

  -- Cadeia de 2 flip-flops
  signal ff1, ff2 : std_logic;

begin

  -- Processo sincrono com reset
  --   - em reset:    ff1 <= '1'; ff2 <= '1';   (linha UART em repouso = '1')
  --   - na borda de subida do clock: ff1 <= async_in; ff2 <= ff1;
  process (clock_in)
  begin
    if rising_edge(clock_in) then
      if reset_in = '1' then
        ff1 <= '1';
        ff2 <= '1';
      else
        ff1 <= async_in;
        ff2 <= ff1;
      end if;
    end if;
  end process;

  sync_out <= ff2;

end architecture rtl;
