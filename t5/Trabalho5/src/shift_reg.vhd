-------------------------------------------------------------------------------
-- shift_reg.vhd
-- Registrador de deslocamento que captura os 8 bits de dados, LSB primeiro.
-- A FSM comanda quando deslocar (capturar 1 bit) e o dado paralelo resultante
-- alimenta a saida data_p_out.
--
--   UART envia: Data[0] (LSB) ... Data[7] (MSB)
--   Como o LSB chega primeiro, desloca-se para a DIREITA inserindo o novo
--   bit no MSB:   data <= rx_bit & data(7 downto 1);
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity shift_reg is
  port (
    clock_in : in  std_logic;                       -- clock master (100 MHz)
    reset_in : in  std_logic;                        -- reset sincrono
    shift_en : in  std_logic;                        -- pulso: capturar/deslocar 1 bit
    rx_bit   : in  std_logic;                        -- bit serial amostrado (rx_sync)
    data_out : out std_logic_vector(7 downto 0)      -- dado paralelo (data_p_out)
  );
end entity shift_reg;

architecture rtl of shift_reg is

  signal data : std_logic_vector(7 downto 0);

begin

  -- Processo sincrono
  --   - em reset:           data <= (others => '0');
  --   - quando shift_en='1': data <= rx_bit & data(7 downto 1);  -- LSB-first
  process (clock_in)
  begin
    if rising_edge(clock_in) then
      if reset_in = '1' then
        data <= (others => '0');
      elsif shift_en = '1' then
        data <= rx_bit & data(7 downto 1);
      end if;
    end if;
  end process;

  data_out <= data;

end architecture rtl;
