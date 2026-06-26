-------------------------------------------------------------------------------
-- uart_rx_tb.vhd
-- Testbench (esqueleto) para o modulo uart_rx.
-- Objetivo: gerar clock de 100 MHz, aplicar reset, transmitir um byte pela
-- linha serial uart_data_rx no formato UART e verificar data_p_out /
-- data_p_en_out.
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_rx_tb is
end entity uart_rx_tb;

architecture sim of uart_rx_tb is

  -- DUT
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

  -- Clock de 100 MHz -> periodo de 10 ns
  constant CLK_PERIOD : time := 10 ns;

  -- Baud rate escolhida para a simulacao (ajuste junto com rate_sel).
  -- Ex.: 9600 bps -> bit_period = 1/9600 s ~= 104167 ns
  constant BAUD_PERIOD : time := 104167 ns;  -- 9600 bps, coerente com rate_sel = "00"

  -- Sinais de interconexao
  signal clk       : std_logic := '0';
  signal rst       : std_logic := '1';
  signal serial_in : std_logic := '1';           -- linha em repouso = '1'
  signal rate_sel  : std_logic_vector(1 downto 0) := "00";
  signal data_out  : std_logic_vector(7 downto 0);
  signal data_en   : std_logic;

begin

  ---------------------------------------------------------------------------
  -- Instancia do DUT
  ---------------------------------------------------------------------------
  dut : uart_rx
    port map (
      clock_in         => clk,
      reset_in         => rst,
      uart_data_rx     => serial_in,
      uart_rate_rx_sel => rate_sel,
      data_p_out       => data_out,
      data_p_en_out    => data_en
    );

  ---------------------------------------------------------------------------
  -- Geracao de clock
  ---------------------------------------------------------------------------
  clk <= not clk after CLK_PERIOD / 2;

  ---------------------------------------------------------------------------
  -- Procedimento de estimulo
  ---------------------------------------------------------------------------
  -- Processo de estimulo
  --   1) aplicar reset por alguns ciclos e depois liberar (rst <= '0')
  --   2) escolher rate_sel
  --   3) transmitir um byte com a sequencia UART:
  --        - start bit:  serial_in <= '0';  wait for BAUD_PERIOD;
  --        - 8 data bits (LSB primeiro): serial_in <= byte(i); wait for BAUD_PERIOD;
  --        - stop bit:   serial_in <= '1';  wait for BAUD_PERIOD;
  --   4) aguardar data_en = '1' e conferir data_out (assert)
  stimulus : process
    -- byte a transmitir (LSB primeiro na linha serial)
    constant TX_BYTE : std_logic_vector(7 downto 0) := x"A5";  -- 1010_0101
  begin
    -- 1) reset por alguns ciclos e depois libera
    rate_sel  <= "00";          -- 9600 bps
    serial_in <= '1';           -- linha em repouso
    rst       <= '1';
    wait for 10 * CLK_PERIOD;
    rst       <= '0';
    wait for 10 * CLK_PERIOD;

    -- 3) transmite um byte no formato UART
    -- start bit
    serial_in <= '0';
    wait for BAUD_PERIOD;

    -- 8 data bits, LSB primeiro
    for i in 0 to 7 loop
      serial_in <= TX_BYTE(i);
      wait for BAUD_PERIOD;
    end loop;

    -- stop bit
    serial_in <= '1';

    -- 4) aguarda data_en = '1' e confere data_out.
    --    O strobe data_p_en_out e um pulso de 1 ciclo que sobe ~no centro do stop
    --    bit (~9,5 bits apos o start). NAO esperar BAUD_PERIOD aqui: aguardar o bit
    --    de stop inteiro faria o 'wait until' perder o pulso e travar a simulacao.
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
