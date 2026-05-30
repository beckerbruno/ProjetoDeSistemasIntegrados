LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-- Modelo de referencia comportamental do driver PS/2.
-- Monitora diretamente a borda de descida do clock PS/2 (sem sincronizador),
-- adequado apenas para simulacao.

ENTITY ps2_driver_golden IS
    PORT (
        clock_in  : IN  STD_LOGIC;
        reset_in  : IN  STD_LOGIC;
        clock_ps2 : IN  STD_LOGIC;
        data_ps2  : IN  STD_LOGIC;
        data_p    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_p_en : OUT STD_LOGIC
    );
END ENTITY ps2_driver_golden;

ARCHITECTURE golden OF ps2_driver_golden IS

    TYPE state_t IS (IDLE, RECV_DATA, RECV_PARITY, RECV_STOP);
    SIGNAL state   : state_t;
    SIGNAL bit_cnt : unsigned(2 DOWNTO 0);
    SIGNAL rx_data : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL rx_par  : STD_LOGIC;

BEGIN

    ps2_proc : PROCESS (clock_ps2, reset_in)
    BEGIN
        IF reset_in = '1' THEN
            state     <= IDLE;
            bit_cnt   <= (OTHERS => '0');
            rx_data   <= (OTHERS => '0');
            rx_par    <= '0';
            data_p    <= (OTHERS => '0');
            data_p_en <= '0';
        ELSIF falling_edge(clock_ps2) THEN
            data_p_en <= '0';

            CASE state IS

                WHEN IDLE =>
                    bit_cnt <= (OTHERS => '0');
                    IF data_ps2 = '0' THEN
                        state <= RECV_DATA;
                    END IF;

                WHEN RECV_DATA =>
                    rx_data <= data_ps2 & rx_data(7 DOWNTO 1);
                    IF bit_cnt = 7 THEN
                        state <= RECV_PARITY;
                    ELSE
                        bit_cnt <= bit_cnt + 1;
                    END IF;

                WHEN RECV_PARITY =>
                    rx_par <= data_ps2;
                    state  <= RECV_STOP;

                WHEN RECV_STOP =>
                    IF data_ps2 = '1' AND
                       (rx_data(0) XOR rx_data(1) XOR rx_data(2) XOR rx_data(3) XOR
                        rx_data(4) XOR rx_data(5) XOR rx_data(6) XOR rx_data(7) XOR
                        rx_par) = '1' THEN
                        data_p    <= rx_data;
                        data_p_en <= '1';
                    END IF;
                    state <= IDLE;

            END CASE;
        END IF;
    END PROCESS;

END ARCHITECTURE golden;
