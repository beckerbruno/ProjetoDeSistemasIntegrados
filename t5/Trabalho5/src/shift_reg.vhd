-------------------------------------------------------------------------------
-- shift_reg.vhd
-- Registrador de deslocamento que captura os 8 bits de dados, LSB primeiro.
-- Como o LSB chega primeiro, desloca-se a direita inserindo o novo bit no MSB,
-- resultando em data_out(0)=Data[0] ... data_out(7)=Data[7].
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity shift_reg is
  port (
    clock_in : in  std_logic;
    reset_in : in  std_logic;
    shift_en : in  std_logic;                    -- pulso: captura/desloca 1 bit
    rx_bit   : in  std_logic;                    -- bit serial amostrado
    data_out : out std_logic_vector(7 downto 0)
  );
end entity shift_reg;

architecture rtl of shift_reg is

  signal data : std_logic_vector(7 downto 0);

begin

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
