-------------------------------------------------------------------------------
-- baud_gen.vhd
-- Gerador de baud rate com oversampling 16x: emite um pulso "tick16" de 1 ciclo
-- a 16x a baud selecionada. N = round(100e6 / (16*baud)) ciclos de clock.
--
--   rate_sel | baud  |  N
--     00     |  9600 | 651
--     01     | 19200 | 326
--     10     | 28800 | 217
--     11     | 57600 | 109
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity baud_gen is
  port (
    clock_in   : in  std_logic;
    reset_in   : in  std_logic;
    rate_sel   : in  std_logic_vector(1 downto 0);
    tick16_out : out std_logic
  );
end entity baud_gen;

architecture rtl of baud_gen is

  constant N_9600  : integer := 651;
  constant N_19200 : integer := 326;
  constant N_28800 : integer := 217;
  constant N_57600 : integer := 109;

  signal limit   : unsigned(15 downto 0);
  signal counter : unsigned(15 downto 0);

begin

  with rate_sel select
    limit <= to_unsigned(N_9600,  16) when "00",
             to_unsigned(N_19200, 16) when "01",
             to_unsigned(N_28800, 16) when "10",
             to_unsigned(N_57600, 16) when others;

  -- tick16_out = '1' por 1 ciclo a cada N ciclos de clock
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
