LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY uart_rx_tb IS
END ENTITY uart_rx_tb;

ARCHITECTURE sim OF uart_rx_tb IS

    -- Clock system: 100 MHz
    CONSTANT CLK_PERIOD : TIME := 10 ns;

    -- Baud rate: 115200 bps
    -- Periodo do bit = 1/115200 = 8.68 us
    CONSTANT BIT_PERIOD : TIME := 8680 ns;

    -- Sinais
    SIGNAL clock_in  : STD_LOGIC := '0';
    SIGNAL reset_in  : STD_LOGIC := '1';
    SIGNAL rx        : STD_LOGIC := '1';  -- Idle = '1'

    SIGNAL data_p    : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_p_en : STD_LOGIC;

    SIGNAL sim_done  : BOOLEAN := false;
    SIGNAL rx_count  : INTEGER := 0;

    -- Bytes esperados na ordem de envio
    TYPE expected_t IS ARRAY(0 TO 5) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    CONSTANT EXPECTED : expected_t := (
        x"41",  -- 'A'
        x"53",  -- 'S'
        x"43",  -- 'C'
        x"49",  -- 'I'
        x"49",  -- 'I' novamente
        x"1B"   -- ESC
    );

    -- Procedimento para enviar um byte UART
    -- Frame: start(0) + bit0..bit7 (LSB first) + stop(1)
    PROCEDURE send_uart_byte (
        SIGNAL rx_p : OUT STD_LOGIC;
        CONSTANT b   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0)
    ) IS
    BEGIN
        -- Start bit (0)
        rx_p <= '0';
        WAIT FOR BIT_PERIOD;

        -- 8 bits de dados (LSB primeiro)
        FOR i IN 0 TO 7 LOOP
            rx_p <= b(i);
            WAIT FOR BIT_PERIOD;
        END LOOP;

        -- Stop bit (1)
        rx_p <= '1';
        WAIT FOR BIT_PERIOD;
    END PROCEDURE;

BEGIN

    -- -----------------------------------------------------------
    -- Instanciacao do DUT
    -- -----------------------------------------------------------
    dut : ENTITY work.uart_rx
        GENERIC MAP (
            CLK_FREQ  => 100000000,  -- 100 MHz
            BAUD_RATE => 115200
        )
        PORT MAP (
            clock_in  => clock_in,
            reset_in  => reset_in,
            rx        => rx,
            data_p    => data_p,
            data_p_en => data_p_en
        );

    -- -----------------------------------------------------------
    -- Geracao de clock (100 MHz)
    -- -----------------------------------------------------------
    clk_gen : PROCESS
    BEGIN
        WHILE NOT sim_done LOOP
            clock_in <= '0'; WAIT FOR CLK_PERIOD / 2;
            clock_in <= '1'; WAIT FOR CLK_PERIOD / 2;
        END LOOP;
        WAIT;
    END PROCESS;

    -- -----------------------------------------------------------
    -- Checker: verifica data_p e data_p_en
    -- -----------------------------------------------------------
    checker : PROCESS (clock_in)
    BEGIN
        IF rising_edge(clock_in) THEN
            IF data_p_en = '1' THEN
                IF rx_count < 6 THEN
                    IF data_p = EXPECTED(rx_count) THEN
                        REPORT "[OK] byte " & INTEGER'IMAGE(rx_count) &
                               ": recebido=0x" & TO_HSTRING(data_p) &
                               " esperado=0x" & TO_HSTRING(EXPECTED(rx_count))
                        SEVERITY NOTE;
                    ELSE
                        REPORT "[ERRO] byte " & INTEGER'IMAGE(rx_count) &
                               ": recebido=0x" & TO_HSTRING(data_p) &
                               " esperado=0x" & TO_HSTRING(EXPECTED(rx_count))
                        SEVERITY ERROR;
                    END IF;
                ELSE
                    REPORT "[AVISO] byte inesperado recebido: 0x" & TO_HSTRING(data_p)
                    SEVERITY WARNING;
                END IF;
                rx_count <= rx_count + 1;
            END IF;
        END IF;
    END PROCESS;

    -- -----------------------------------------------------------
    -- Geracao de estimulos
    -- -----------------------------------------------------------
    stim : PROCESS
    BEGIN
        -- Reset inicial
        reset_in <= '1';
        rx       <= '1';
        WAIT FOR 200 ns;
        WAIT UNTIL rising_edge(clock_in);
        reset_in <= '0';
        WAIT FOR 100 ns;

        -- Envia bytes de teste
        send_uart_byte(rx, x"41");  -- 'A'
        WAIT FOR 10 us;

        send_uart_byte(rx, x"53");  -- 'S'
        WAIT FOR 10 us;

        send_uart_byte(rx, x"43");  -- 'C'
        WAIT FOR 10 us;

        send_uart_byte(rx, x"49");  -- 'I'
        WAIT FOR 10 us;

        send_uart_byte(rx, x"49");  -- 'I' novamente
        WAIT FOR 10 us;

        send_uart_byte(rx, x"1B");  -- ESC
        WAIT FOR 10 us;

        -- Teste de reset no meio da operacao
        WAIT UNTIL rising_edge(clock_in);
        reset_in <= '1';
        WAIT FOR 100 ns;
        WAIT UNTIL rising_edge(clock_in);
        reset_in <= '0';
        WAIT FOR 100 ns;

        -- Apos reset, envia byte novamente para verificar recuperacao
        send_uart_byte(rx, x"41");  -- 'A' novamente
        WAIT FOR 20 us;

        -- Relatorio final
        IF rx_count = 7 THEN
            REPORT "Simulacao OK: todos os bytes recebidos corretamente."
            SEVERITY NOTE;
        ELSE
            REPORT "Simulacao FALHOU: esperado 7 bytes, recebido " &
                   INTEGER'IMAGE(rx_count)
            SEVERITY ERROR;
        END IF;

        sim_done <= true;
        WAIT;
    END PROCESS;

END ARCHITECTURE sim;
