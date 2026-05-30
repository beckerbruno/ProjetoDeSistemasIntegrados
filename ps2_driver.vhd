LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ps2_driver IS
    PORT (
        clock_in  : IN  STD_LOGIC;
        reset_in  : IN  STD_LOGIC;
        clock_ps2 : IN  STD_LOGIC;
        data_ps2  : IN  STD_LOGIC;
        data_p    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_p_en : OUT STD_LOGIC
    );
END ENTITY ps2_driver;

ARCHITECTURE rtl OF ps2_driver IS

    -- Sincronizadores para o dominio de clock_in (100 MHz)
    -- 3 estagios para clock_ps2 (deteccao de borda), 2 para data_ps2
    SIGNAL clk_sync : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL dat_sync : STD_LOGIC_VECTOR(1 DOWNTO 0);

    -- Borda de descida do clock PS/2 detectada no dominio clock_in
    SIGNAL ps2_fall : STD_LOGIC;

    TYPE state_t IS (IDLE, RECV_DATA, RECV_PARITY, RECV_STOP);
    SIGNAL state   : state_t;
    SIGNAL bit_cnt : unsigned(2 DOWNTO 0);
    SIGNAL rx_data : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL rx_par  : STD_LOGIC;

BEGIN

    -- Sincronizacao dos sinais PS/2 no dominio de clock_in
    sync_proc : PROCESS (clock_in, reset_in)
    BEGIN
        IF reset_in = '1' THEN
            clk_sync <= (OTHERS => '1');
            dat_sync <= (OTHERS => '1');
        ELSIF rising_edge(clock_in) THEN
            clk_sync <= clk_sync(1 DOWNTO 0) & clock_ps2;
            dat_sync <= dat_sync(0) & data_ps2;
        END IF;
    END PROCESS;

    -- clk_sync(2)=amostra de 2 ciclos atras, clk_sync(1)=1 ciclo atras
    -- borda de descida: era '1', ficou '0'
    ps2_fall <= clk_sync(2) AND NOT clk_sync(1);

    -- FSM: recebe frame PS/2 = start(0) + bit0..bit7 + paridade_impar + stop(1)
    -- Os dados sao amostrados na borda de descida do clock PS/2
    -- data_p_en fica em '1' por exatamente 1 ciclo de clock_in apos frame valido
    fsm_proc : PROCESS (clock_in, reset_in)
    BEGIN
        IF reset_in = '1' THEN
            state     <= IDLE;
            bit_cnt   <= (OTHERS => '0');
            rx_data   <= (OTHERS => '0');
            rx_par    <= '0';
            data_p    <= (OTHERS => '0');
            data_p_en <= '0';
        ELSIF rising_edge(clock_in) THEN
            data_p_en <= '0';

            CASE state IS

                WHEN IDLE =>
                    bit_cnt <= (OTHERS => '0');
                    -- Aguarda borda de descida PS/2 com dado = '0' (start bit)
                    IF ps2_fall = '1' AND dat_sync(1) = '0' THEN
                        state <= RECV_DATA;
                    END IF;

                WHEN RECV_DATA =>
                    IF ps2_fall = '1' THEN
                        -- PS/2 envia LSB primeiro; shift-right acumula LSB em rx_data(0)
                        rx_data <= dat_sync(1) & rx_data(7 DOWNTO 1);
                        IF bit_cnt = 7 THEN
                            state <= RECV_PARITY;
                        ELSE
                            bit_cnt <= bit_cnt + 1;
                        END IF;
                    END IF;

                WHEN RECV_PARITY =>
                    IF ps2_fall = '1' THEN
                        rx_par <= dat_sync(1);
                        state  <= RECV_STOP;
                    END IF;

                WHEN RECV_STOP =>
                    IF ps2_fall = '1' THEN
                        -- Valida stop bit = '1' e paridade impar
                        -- Paridade impar: XOR(dados) XOR paridade = '1'
                        IF dat_sync(1) = '1' AND
                           (rx_data(0) XOR rx_data(1) XOR rx_data(2) XOR rx_data(3) XOR
                            rx_data(4) XOR rx_data(5) XOR rx_data(6) XOR rx_data(7) XOR
                            rx_par) = '1' THEN
                            data_p    <= rx_data;
                            data_p_en <= '1';
                        END IF;
                        state <= IDLE;
                    END IF;

            END CASE;
        END IF;
    END PROCESS;

END ARCHITECTURE rtl;
