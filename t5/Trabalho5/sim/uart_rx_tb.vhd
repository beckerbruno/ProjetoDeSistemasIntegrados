-------------------------------------------------------------------------------
-- uart_rx_tb.vhd
-- Testbench do uart_rx: gera clock de 100 MHz, aplica reset, transmite um byte
-- no formato UART pela linha serial e verifica data_p_out / data_p_en_out.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_rx_tb is
end entity uart_rx_tb;

architecture sim of uart_rx_tb is

  component uart_rx is
    port (
      clock_in         : in  std_logic;
      reset_in         : in  std_logic;
      uart_data_rx     : in  std_logic;
      uart_rate_rx_sel : in  std_logic_vector(1 downto 0);
      data_p_out       : out std_logic_vector(7 downto 0);
      data_p_en_out    : out std_logic
    );
  end component;

  constant CLK_PERIOD  : time := 10 ns;       -- 100 MHz
  constant BAUD_PERIOD : time := 104167 ns;   -- 9600 bps (coerente com rate_sel = "00")

  signal clk       : std_logic := '0';
  signal rst       : std_logic := '1';
  signal serial_in : std_logic := '1';        -- linha em repouso = '1'
  signal rate_sel  : std_logic_vector(1 downto 0) := "00";
  signal data_out  : std_logic_vector(7 downto 0);
  signal data_en   : std_logic;

begin

  dut : uart_rx
    port map (
      clock_in         => clk,
      reset_in         => rst,
      uart_data_rx     => serial_in,
      uart_rate_rx_sel => rate_sel,
      data_p_out       => data_out,
      data_p_en_out    => data_en
    );

  clk <= not clk after CLK_PERIOD / 2;

  stimulus : process
    constant TX_BYTE : std_logic_vector(7 downto 0) := x"A5";
  begin
    -- reset
    rate_sel  <= "00";
    serial_in <= '1';
    rst       <= '1';
    wait for 10 * CLK_PERIOD;
    rst       <= '0';
    wait for 10 * CLK_PERIOD;

    -- start bit
    serial_in <= '0';
    wait for BAUD_PERIOD;

    -- 8 data bits, LSB primeiro
    for i in 0 to 7 loop
      serial_in <= TX_BYTE(i);
      wait for BAUD_PERIOD;
    end loop;

    -- stop bit. data_p_en_out e um pulso de 1 ciclo no centro do stop (~9,5 bits);
    -- aguarda aqui (sem esperar o stop inteiro) para nao perder esse pulso.
    serial_in <= '1';
    wait until data_en = '1';
    assert data_out = TX_BYTE
      report "FALHA: data_out = " & integer'image(to_integer(unsigned(data_out))) &
             " (esperado " & integer'image(to_integer(unsigned(TX_BYTE))) & ")"
      severity error;

    report "OK: byte recebido corretamente = " &
           integer'image(to_integer(unsigned(data_out))) & " (decimal)"
      severity note;

    wait for 10 * BAUD_PERIOD;
    report "Fim da simulacao." severity failure;
    wait;
  end process;

end architecture sim;
