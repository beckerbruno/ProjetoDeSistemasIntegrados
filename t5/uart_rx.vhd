LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY uart_rx IS
    GENERIC (
        -- Clock system em Hz (default 100 MHz)
        CLK_FREQ  : INTEGER := 100000000;
        -- Baud rate em bps (default 115200)
        BAUD_RATE : INTEGER := 115200
    );
    PORT (
        clock_in  : IN  STD_LOGIC;
        reset_in  : IN  STD_LOGIC;
        rx        : IN  STD_LOGIC;                     -- Dado serial de entrada
        data_p    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- Dado paralelo recebido
        data_p_en : OUT STD_LOGIC                      -- Enable do dado recebido (1 ciclo)
    );
END ENTITY uart_rx;

ARCHITECTURE rtl OF uart_rx IS

    -- Constantes para oversampling (16x baud rate)
    CONSTANT OVERSAMPLE : INTEGER := 16;
    CONSTANT BAUD_DIV  : INTEGER := CLK_FREQ / (BAUD_RATE * OVERSAMPLE);

    -- Sincronizador para o sinal RX (2 estagios)
    SIGNAL rx_sync : STD_LOGIC_VECTOR(1 DOWNTO 0);

    -- Deteccao de borda de descida
    SIGNAL rx_fall : STD_LOGIC;

    -- Gerador de baud rate tick (16x oversampling)
    SIGNAL baud_counter : INTEGER RANGE 0 TO BAUD_DIV - 1;
    SIGNAL baud_tick    : STD_LOGIC;

    -- Maquina de estados
    TYPE state_t IS (IDLE, WAIT_START, RECV_DATA, RECV_STOP);
    SIGNAL state   : state_t;

    -- Contadores
    SIGNAL sample_cnt : unsigned(3 DOWNTO 0);  -- Conta 16 amostras por bit
    SIGNAL bit_cnt    : unsigned(2 DOWNTO 0);  -- Conta 8 bits de dados

    -- Registradores de recepcao
    SIGNAL rx_data    : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL rx_shift   : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

    -- =====================================================================
    -- Sincronizacao do sinal RX no dominio de clock_in
    -- =====================================================================
    sync_proc : PROCESS (clock_in, reset_in)
    BEGIN
        IF reset_in = '1' THEN
            rx_sync <= (OTHERS => '1');
        ELSIF rising_edge(clock_in) THEN
            rx_sync <= rx_sync(0) & rx;
        END IF;
    END PROCESS;

    -- Deteccao de borda de descida (start bit)
    rx_fall <= (NOT rx_sync(1)) AND rx_sync(0);

    -- =====================================================================
    -- Gerador de baud tick (16x oversampling)
    -- =====================================================================
    baud_gen_proc : PROCESS (clock_in, reset_in)
    BEGIN
        IF reset_in = '1' THEN
            baud_counter <= 0;
            baud_tick    <= '0';
        ELSIF rising_edge(clock_in) THEN
            baud_tick <= '0';
            IF baud_counter = BAUD_DIV - 1 THEN
                baud_counter <= 0;
                baud_tick    <= '1';
            ELSE
                baud_counter <= baud_counter + 1;
            END IF;
        END IF;
    END PROCESS;

    -- =====================================================================
    -- FSM: Recepcao UART
    -- Frame: start(0) + bit0..bit7 + stop(1)
    -- Amostra no meio do bit (apos 8 ticks = meio do bit com oversample 16x)
    -- =====================================================================
    fsm_proc : PROCESS (clock_in, reset_in)
    BEGIN
        IF reset_in = '1' THEN
            state      <= IDLE;
            sample_cnt <= (OTHERS => '0');
            bit_cnt    <= (OTHERS => '0');
            rx_shift   <= (OTHERS => '0');
            rx_data    <= (OTHERS => '0');
            data_p     <= (OTHERS => '0');
            data_p_en  <= '0';

        ELSIF rising_edge(clock_in) THEN
            data_p_en <= '0';  -- Pulso de 1 ciclo

            CASE state IS

                WHEN IDLE =>
                    bit_cnt    <= (OTHERS => '0');
                    sample_cnt <= (OTHERS => '0');
                    -- Aguarda borda de descida (start bit)
                    IF rx_fall = '1' THEN
                        state <= WAIT_START;
                    END IF;

                WHEN WAIT_START =>
                    -- Espera meio bit para amostrar o meio do start bit
                    -- e alinhar o amostrador
                    IF baud_tick = '1' THEN
                        IF sample_cnt = 7 THEN  -- Meio do bit (16/2 - 1 = 7)
                            -- Verifica se ainda esta em '0' (start bit valido)
                            IF rx_sync(1) = '0' THEN
                                sample_cnt <= (OTHERS => '0');
                                state      <= RECV_DATA;
                            ELSE
                                -- Falso start bit, volta para IDLE
                                state <= IDLE;
                            END IF;
                        ELSE
                            sample_cnt <= sample_cnt + 1;
                        END IF;
                    END IF;

                WHEN RECV_DATA =>
                    IF baud_tick = '1' THEN
                        IF sample_cnt = 15 THEN  -- Fim de um bit completo
                            sample_cnt <= (OTHERS => '0');
                            -- Recebe LSB primeiro, shift-right
                            rx_shift <= rx_sync(1) & rx_shift(7 DOWNTO 1);

                            IF bit_cnt = 7 THEN
                                -- Ultimo bit recebido, vai para stop
                                state <= RECV_STOP;
                            ELSE
                                bit_cnt <= bit_cnt + 1;
                            END IF;
                        ELSE
                            sample_cnt <= sample_cnt + 1;
                        END IF;
                    END IF;

                WHEN RECV_STOP =>
                    IF baud_tick = '1' THEN
                        IF sample_cnt = 15 THEN  -- Fim do stop bit
                            sample_cnt <= (OTHERS => '0');
                            -- Verifica stop bit = '1'
                            IF rx_sync(1) = '1' THEN
                                rx_data    <= rx_shift;
                                data_p     <= rx_shift;
                                data_p_en  <= '1';
                            END IF;
                            state <= IDLE;
                        ELSE
                            sample_cnt <= sample_cnt + 1;
                        END IF;
                    END IF;

            END CASE;
        END IF;
    END PROCESS;

END ARCHITECTURE rtl;
