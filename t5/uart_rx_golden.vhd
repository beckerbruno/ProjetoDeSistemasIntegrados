-- UART RX Golden Reference
-- Implementacao compacta de referencia para comparacao

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY uart_rx_golden IS
    GENERIC (
        CLK_FREQ  : INTEGER := 100000000;
        BAUD_RATE : INTEGER := 115200
    );
    PORT (
        clock_in  : IN  STD_LOGIC;
        reset_in  : IN  STD_LOGIC;
        rx        : IN  STD_LOGIC;
        data_p    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_p_en : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE rtl OF uart_rx_golden IS
    CONSTANT DIV     : INTEGER := CLK_FREQ / (BAUD_RATE * 16);
    SIGNAL rx_s      : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL baud_cnt  : INTEGER RANGE 0 TO DIV - 1;
    SIGNAL tick      : STD_LOGIC;
    TYPE   state_t   IS (IDLE, START, DATA, STOP);
    SIGNAL state     : state_t;
    SIGNAL sample    : unsigned(3 DOWNTO 0);
    SIGNAL bit_idx   : unsigned(2 DOWNTO 0);
    SIGNAL shift     : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN

    -- Sincronizador
    PROCESS(clock_in, reset_in) BEGIN
        IF reset_in = '1' THEN rx_s <= "11";
        ELSIF rising_edge(clock_in) THEN rx_s <= rx_s(0) & rx;
        END IF;
    END PROCESS;

    -- Baud tick generator (16x oversampling)
    PROCESS(clock_in, reset_in) BEGIN
        IF reset_in = '1' THEN baud_cnt <= 0; tick <= '0';
        ELSIF rising_edge(clock_in) THEN
            tick <= '0';
            IF baud_cnt = DIV - 1 THEN baud_cnt <= 0; tick <= '1';
            ELSE baud_cnt <= baud_cnt + 1;
            END IF;
        END IF;
    END PROCESS;

    -- Main FSM
    PROCESS(clock_in, reset_in) BEGIN
        IF reset_in = '1' THEN
            state <= IDLE; sample <= x"0"; bit_idx <= "000";
            shift <= x"00"; data_p <= x"00"; data_p_en <= '0';
        ELSIF rising_edge(clock_in) THEN
            data_p_en <= '0';
            CASE state IS
                WHEN IDLE =>
                    IF rx_s(1) = '0' AND rx_s(0) = '1' THEN
                        state <= START; sample <= x"0";
                    END IF;
                WHEN START =>
                    IF tick = '1' THEN
                        IF sample = 7 THEN
                            IF rx_s(1) = '0' THEN sample <= x"0"; state <= DATA; bit_idx <= "000";
                            ELSE state <= IDLE;
                            END IF;
                        ELSE sample <= sample + 1;
                        END IF;
                    END IF;
                WHEN DATA =>
                    IF tick = '1' THEN
                        IF sample = 15 THEN
                            sample <= x"0";
                            shift <= rx_s(1) & shift(7 DOWNTO 1);
                            IF bit_idx = 7 THEN state <= STOP;
                            ELSE bit_idx <= bit_idx + 1;
                            END IF;
                        ELSE sample <= sample + 1;
                        END IF;
                    END IF;
                WHEN STOP =>
                    IF tick = '1' THEN
                        IF sample = 15 THEN
                            IF rx_s(1) = '1' THEN
                                data_p <= shift; data_p_en <= '1';
                            END IF;
                            state <= IDLE;
                        ELSE sample <= sample + 1;
                        END IF;
                    END IF;
            END CASE;
        END IF;
    END PROCESS;

END ARCHITECTURE;
