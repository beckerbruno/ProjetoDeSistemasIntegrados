LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ps2_driver_tb IS
END ENTITY ps2_driver_tb;

ARCHITECTURE sim OF ps2_driver_tb IS

    CONSTANT CLK_PERIOD : TIME := 10 ns;    -- clock_in = 100 MHz
    CONSTANT PS2_HALF   : TIME := 10 us;    -- clock_ps2 = 50 kHz (abaixo de 1 MHz)

    SIGNAL clock_in  : STD_LOGIC := '0';
    SIGNAL reset_in  : STD_LOGIC := '1';
    SIGNAL clock_ps2 : STD_LOGIC := '1';
    SIGNAL data_ps2  : STD_LOGIC := '1';

    SIGNAL data_p    : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_p_en : STD_LOGIC;

    SIGNAL sim_done  : BOOLEAN := false;
    SIGNAL rx_count  : integer := 0;

    -- Bytes esperados na ordem de envio:
    -- 'A'=0x1C, 'S'=0x1B, 'C'=0x21, 'I'=0x43, 'I'=0x43 (novamente), ESC=0x76
    TYPE expected_t IS ARRAY(0 TO 5) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
    CONSTANT EXPECTED : expected_t := (
        x"1C",  -- 'A'
        x"1B",  -- 'S'
        x"21",  -- 'C'
        x"43",  -- 'I'
        x"29",  -- SPACE
        x"76"   -- ESC
    );

    -- Envia um frame PS/2 completo:
    --   start(0) + bit0..bit7 + paridade_impar + stop(1)
    -- O dado e amostrado na borda de descida do clock PS/2.
    PROCEDURE send_ps2_byte (
        SIGNAL clk_p : INOUT STD_LOGIC;
        SIGNAL dat_p : OUT   STD_LOGIC;
        CONSTANT b   : IN    STD_LOGIC_VECTOR(7 DOWNTO 0)
    ) IS
        VARIABLE par : STD_LOGIC;
    BEGIN
        -- Calcula paridade impar: XOR de todos os bits, depois inverte
        par := b(0) XOR b(1) XOR b(2) XOR b(3) XOR
               b(4) XOR b(5) XOR b(6) XOR b(7);
        par := NOT par;

        -- Start bit (data = '0')
        dat_p <= '0';
        WAIT FOR PS2_HALF;
        clk_p <= '0';           -- borda de descida: start amostrado
        WAIT FOR PS2_HALF;
        clk_p <= '1';
        WAIT FOR PS2_HALF;

        -- 8 bits de dados, LSB primeiro (bit0 ate bit7)
        FOR i IN 0 TO 7 LOOP
            dat_p <= b(i);
            WAIT FOR PS2_HALF;
            clk_p <= '0';       -- borda de descida: dado amostrado
            WAIT FOR PS2_HALF;
            clk_p <= '1';
            WAIT FOR PS2_HALF;
        END LOOP;

        -- Bit de paridade
        dat_p <= par;
        WAIT FOR PS2_HALF;
        clk_p <= '0';           -- borda de descida: paridade amostrada
        WAIT FOR PS2_HALF;
        clk_p <= '1';
        WAIT FOR PS2_HALF;

        -- Stop bit (data = '1')
        dat_p <= '1';
        WAIT FOR PS2_HALF;
        clk_p <= '0';           -- borda de descida: stop amostrado
        WAIT FOR PS2_HALF;
        clk_p <= '1';
        WAIT FOR PS2_HALF;
        -- Linhas retornam ao estado idle (alto)
    END PROCEDURE;

BEGIN

    -- -----------------------------------------------------------
    -- Instanciacao do DUT
    -- -----------------------------------------------------------
    dut : ENTITY work.ps2_driver
        PORT MAP (
            clock_in  => clock_in,
            reset_in  => reset_in,
            clock_ps2 => clock_ps2,
            data_ps2  => data_ps2,
            data_p    => data_p,
            data_p_en => data_p_en
        );

    -- -----------------------------------------------------------
    -- Geracao de clock_in (100 MHz)
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
    -- Checker: verifica data_p e data_p_en a cada ciclo de clock_in
    -- -----------------------------------------------------------
    checker : PROCESS (clock_in)
    BEGIN
        IF rising_edge(clock_in) THEN
            IF data_p_en = '1' THEN
                IF rx_count < 6 THEN
                    IF data_p = EXPECTED(rx_count) THEN
                        REPORT "[OK] scancode " & integer'image(rx_count) &
                               ": recebido=0x" & to_hstring(data_p) &
                               " esperado=0x"  & to_hstring(EXPECTED(rx_count))
                        SEVERITY NOTE;
                    ELSE
                        REPORT "[ERRO] scancode " & integer'image(rx_count) &
                               ": recebido=0x" & to_hstring(data_p) &
                               " esperado=0x"  & to_hstring(EXPECTED(rx_count))
                        SEVERITY ERROR;
                    END IF;
                ELSE
                    REPORT "[AVISO] byte inesperado recebido: 0x" & to_hstring(data_p)
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
        reset_in  <= '1';
        clock_ps2 <= '1';
        data_ps2  <= '1';
        WAIT FOR 200 ns;
        WAIT UNTIL rising_edge(clock_in);
        reset_in <= '0';
        WAIT FOR 100 ns;

        -- Testa teclas com diferentes scancodes e padroes de paridade
        send_ps2_byte(clock_ps2, data_ps2, x"1C");  -- 'A'  (0b00011100, par=0)
        WAIT FOR 200 us;

        send_ps2_byte(clock_ps2, data_ps2, x"1B");  -- 'S'  (0b00011011, par=1)
        WAIT FOR 200 us;

        send_ps2_byte(clock_ps2, data_ps2, x"21");  -- 'C'  (0b00100001, par=0)
        WAIT FOR 200 us;

        send_ps2_byte(clock_ps2, data_ps2, x"43");  -- 'I'  (0b01000011, par=0)
        WAIT FOR 200 us;

        send_ps2_byte(clock_ps2, data_ps2, x"29");  -- SPACE(0b00101001, par=1)
        WAIT FOR 200 us;

        send_ps2_byte(clock_ps2, data_ps2, x"76");  -- ESC  (0b01110110, par=0)
        WAIT FOR 200 us;

        -- Teste de reset no meio da operacao
        WAIT UNTIL rising_edge(clock_in);
        reset_in <= '1';
        WAIT FOR 100 ns;
        WAIT UNTIL rising_edge(clock_in);
        reset_in <= '0';
        WAIT FOR 100 ns;

        -- Apos reset, envia tecla novamente para verificar recuperacao
        send_ps2_byte(clock_ps2, data_ps2, x"1C");  -- 'A' novamente
        WAIT FOR 200 us;

        IF rx_count = 7 THEN
            REPORT "Simulacao OK: todos os bytes recebidos corretamente." SEVERITY NOTE;
        ELSE
            REPORT "Simulacao FALHOU: esperado 7 bytes, recebido " &
                   integer'image(rx_count) SEVERITY ERROR;
        END IF;

        sim_done <= true;
        WAIT;
    END PROCESS;

END ARCHITECTURE sim;
