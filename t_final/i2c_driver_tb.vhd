-------------------------------------------------------------------------------
-- Testbench auto-verificavel para o i2c_driver.
--
-- Estrategia:
--   - Gera clock master de 100 MHz e aplica reset assincrono.
--   - Aplica um pull-up ('H') em SDA, emulando o resistor externo do barramento.
--   - Um "monitor" decodifica o barramento (START, byte de endereco, byte de
--     dado, STOP) diretamente a partir de SCL/SDA e compara com o esperado.
--   - Verifica tambem o sinal busy e o pulso de enable.
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY i2c_driver_tb IS
END ENTITY i2c_driver_tb;

ARCHITECTURE sim OF i2c_driver_tb IS

    CONSTANT CLK_PERIOD : TIME := 10 ns;   -- 100 MHz

    SIGNAL clock  : std_logic := '0';
    SIGNAL reset  : std_logic := '1';
    SIGNAL data_p : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL enable : std_logic := '0';
    SIGNAL busy   : std_logic;
    SIGNAL scl    : std_logic;
    SIGNAL sda    : std_logic;

    SIGNAL sim_done : boolean := false;

    -- Endereco esperado: "0111000" & R/W('0') = 0x70 (A2=A1=A0='0')
    CONSTANT EXP_ADDR : std_logic_vector(7 DOWNTO 0) := x"70";

    -- Resultados decodificados pelo monitor
    SIGNAL got_addr  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL got_data  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL frame_cnt : integer := 0;            -- numero de transacoes concluidas
    SIGNAL exp_data  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL err_cnt   : integer := 0;

BEGIN

    ---------------------------------------------------------------------------
    -- DUT
    ---------------------------------------------------------------------------
    dut : ENTITY work.i2c_driver
        GENERIC MAP (
            CLK_FREQ => 100_000_000,
            SCL_FREQ => 100_000,
            ADDR_A2  => '0',
            ADDR_A1  => '0',
            ADDR_A0  => '0'
        )
        PORT MAP (
            clock  => clock,
            reset  => reset,
            data_p => data_p,
            enable => enable,
            busy   => busy,
            scl    => scl,
            sda    => sda
        );

    -- Pull-up do barramento SDA (resistor externo)
    sda <= 'H';

    ---------------------------------------------------------------------------
    -- Clock master 100 MHz
    ---------------------------------------------------------------------------
    clk_gen : PROCESS
    BEGIN
        WHILE NOT sim_done LOOP
            clock <= '0'; WAIT FOR CLK_PERIOD / 2;
            clock <= '1'; WAIT FOR CLK_PERIOD / 2;
        END LOOP;
        WAIT;
    END PROCESS;

    ---------------------------------------------------------------------------
    -- Monitor de barramento I2C (decodifica START/STOP e os 2 bytes)
    ---------------------------------------------------------------------------
    monitor : PROCESS (clock)
        VARIABLE scl_d   : std_logic := '1';
        VARIABLE sda_d   : std_logic := '1';
        VARIABLE scl_c   : std_logic;
        VARIABLE sda_c   : std_logic;
        VARIABLE active  : boolean   := false;
        VARIABLE bit_idx : integer   := 0;   -- 0..7 dados, 8 = ACK
        VARIABLE byte_no : integer   := 0;   -- 0 = endereco, 1 = dado
        VARIABLE cur     : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
    BEGIN
        IF rising_edge(clock) THEN
            scl_c := to_x01(scl);
            sda_c := to_x01(sda);

            -- Deteccao de START / STOP enquanto SCL esta estavel em alto
            IF scl_c = '1' AND scl_d = '1' THEN
                IF sda_d = '1' AND sda_c = '0' THEN
                    -- START
                    active  := true;
                    bit_idx := 0;
                    byte_no := 0;
                    cur     := (OTHERS => '0');
                ELSIF sda_d = '0' AND sda_c = '1' THEN
                    -- STOP -> transacao concluida
                    IF active THEN
                        active    := false;
                        frame_cnt <= frame_cnt + 1;
                    END IF;
                END IF;
            END IF;

            -- Amostragem dos bits na borda de subida de SCL
            IF active AND scl_d = '0' AND scl_c = '1' THEN
                IF bit_idx < 8 THEN
                    cur     := cur(6 DOWNTO 0) & sda_c;  -- MSB primeiro
                    bit_idx := bit_idx + 1;
                ELSE
                    -- 9o pulso = ACK; armazena byte completo
                    IF byte_no = 0 THEN
                        got_addr <= cur;
                    ELSE
                        got_data <= cur;
                    END IF;
                    byte_no := byte_no + 1;
                    bit_idx := 0;
                END IF;
            END IF;

            scl_d := scl_c;
            sda_d := sda_c;
        END IF;
    END PROCESS;

    ---------------------------------------------------------------------------
    -- Verificacao: a cada transacao concluida, compara endereco e dado
    ---------------------------------------------------------------------------
    checker : PROCESS (frame_cnt)
    BEGIN
        IF frame_cnt > 0 THEN
            IF got_addr = EXP_ADDR THEN
                REPORT "[OK] endereco = 0x" & to_hstring(got_addr) SEVERITY NOTE;
            ELSE
                REPORT "[ERRO] endereco recebido=0x" & to_hstring(got_addr) &
                       " esperado=0x" & to_hstring(EXP_ADDR) SEVERITY ERROR;
                err_cnt <= err_cnt + 1;
            END IF;

            IF got_data = exp_data THEN
                REPORT "[OK] dado = 0x" & to_hstring(got_data) SEVERITY NOTE;
            ELSE
                REPORT "[ERRO] dado recebido=0x" & to_hstring(got_data) &
                       " esperado=0x" & to_hstring(exp_data) SEVERITY ERROR;
                err_cnt <= err_cnt + 1;
            END IF;
        END IF;
    END PROCESS;

    ---------------------------------------------------------------------------
    -- Estimulos
    ---------------------------------------------------------------------------
    stim : PROCESS
        -- Envia um byte via porta paralela respeitando o protocolo de handshake.
        PROCEDURE write_byte (CONSTANT b : IN std_logic_vector(7 DOWNTO 0)) IS
        BEGIN
            WAIT UNTIL rising_edge(clock);
            data_p  <= b;
            exp_data <= b;
            enable  <= '1';
            WAIT UNTIL rising_edge(clock);
            enable  <= '0';
            -- Aguarda inicio e fim da transacao
            WAIT UNTIL busy = '1';
            WAIT UNTIL busy = '0';
            WAIT FOR 2 us;
        END PROCEDURE;
    BEGIN
        reset  <= '1';
        enable <= '0';
        WAIT FOR 100 ns;
        WAIT UNTIL rising_edge(clock);
        reset <= '0';
        WAIT FOR 100 ns;

        write_byte(x"55");
        write_byte(x"AA");
        write_byte(x"0F");
        write_byte(x"F0");
        write_byte(x"00");
        write_byte(x"FF");

        WAIT FOR 5 us;

        IF frame_cnt = 6 AND err_cnt = 0 THEN
            REPORT "Simulacao OK: 6 transacoes I2C corretas." SEVERITY NOTE;
        ELSE
            REPORT "Simulacao FALHOU: frames=" & integer'image(frame_cnt) &
                   " erros=" & integer'image(err_cnt) SEVERITY ERROR;
        END IF;

        sim_done <= true;
        WAIT;
    END PROCESS;

END ARCHITECTURE sim;
