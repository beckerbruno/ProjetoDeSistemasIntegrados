-------------------------------------------------------------------------------
-- sync.vhd
-- Sincronizador de 2 flip-flops para a linha serial assincrona (uart_data_rx),
-- evitando metaestabilidade no dominio de clock_in.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity sync is
  port (
    clock_in : in  std_logic;
    reset_in : in  std_logic;
    async_in : in  std_logic;   -- linha serial assincrona
    sync_out : out std_logic    -- sinal sincronizado
  );
end entity sync;

architecture rtl of sync is

  signal ff1, ff2 : std_logic;

begin

  process (clock_in)
  begin
    if rising_edge(clock_in) then
      if reset_in = '1' then       -- repouso da linha UART = '1'
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
