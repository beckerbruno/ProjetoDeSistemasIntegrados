-------------------------------------------------------------------------------
-- Trabalho Final - Driver I2C
-- Maquina de Estados Finitos (FSM) sincrona para escrita I2C no PCF8574A.
--
-- Interface (Tabela 1):
--   clock  : in  std_logic                       -- relogio master (100 MHz)
--   reset  : in  std_logic                       -- reset global, ativo alto, assincrono
--   data_p : in  std_logic_vector(7 downto 0)    -- dado paralelo a transmitir
--   enable : in  std_logic                       -- 1 ciclo de clock = novo dado valido
--   busy   : out std_logic                       -- '1' enquanto a escrita nao termina
--   scl    : out std_logic                       -- relogio I2C (max. 100 kHz)
--   sda    : inout std_logic                     -- dado I2C (open-drain)
--
-- Endereco do escravo (PCF8574A): "0111" & A2 & A1 & A0 (A2=A1=A0='0' => 0x38).
-- Os bits A2/A1/A0 sao definidos por generic, conforme sugerido na especificacao.
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY i2c_driver IS
    GENERIC (
        -- Frequencias (Hz): master = 100 MHz, I2C SCL = 100 kHz
        CLK_FREQ : integer := 100_000_000;
        SCL_FREQ : integer := 100_000;
        -- Bits de endereçamento físico A2, A1, A0 do PCF8574A
        ADDR_A2  : std_logic := '0';
        ADDR_A1  : std_logic := '0';
        ADDR_A0  : std_logic := '0'
    );
    PORT (
        clock  : IN    std_logic;
        reset  : IN    std_logic;
        data_p : IN    std_logic_vector(7 DOWNTO 0);
        enable : IN    std_logic;
        busy   : OUT   std_logic;
        scl    : OUT   std_logic;
        sda    : INOUT std_logic
    );
END ENTITY i2c_driver;

ARCHITECTURE rtl OF i2c_driver IS

    -- Divisor de clock: um periodo de SCL = CLK_FREQ/SCL_FREQ ciclos de master.
    -- Cada periodo de SCL e dividido em 4 fases (quartos) iguais.
    CONSTANT DIVISOR : integer := CLK_FREQ / SCL_FREQ;   -- ex.: 1000
    CONSTANT QUARTER : integer := DIVISOR / 4;           -- ex.: 250

    -- Prefixo fixo do PCF8574A = "0111"; bit R/W = '0' (escrita).
    CONSTANT SLAVE_ADDR : std_logic_vector(6 DOWNTO 0) :=
        "0111" & ADDR_A2 & ADDR_A1 & ADDR_A0;
    CONSTANT ADDR_RW    : std_logic_vector(7 DOWNTO 0) :=
        SLAVE_ADDR & '0';

    TYPE state_t IS (S_IDLE, S_START, S_ADDR, S_ACK1, S_DATA, S_ACK2, S_STOP);
    SIGNAL state : state_t;

    -- Divisor / fase dentro do bit I2C (0..3)
    SIGNAL clk_cnt : integer RANGE 0 TO QUARTER - 1;
    SIGNAL phase   : integer RANGE 0 TO 3;
    SIGNAL bit_cnt : integer RANGE 0 TO 7;

    SIGNAL shift_reg : std_logic_vector(7 DOWNTO 0);
    SIGNAL data_reg  : std_logic_vector(7 DOWNTO 0);
    SIGNAL start_req : std_logic;

    -- Saidas registradas
    SIGNAL scl_r   : std_logic;
    SIGNAL sda_low : std_logic;  -- '1' = barramento puxado para baixo; '0' = liberado

BEGIN

    -- SCL: saida push-pull. SDA: open-drain (drive '0' ou alta impedancia).
    scl <= scl_r;
    sda <= '0' WHEN sda_low = '1' ELSE 'Z';

    -- busy combinacional: ocupado sempre que houver requisicao ou transacao ativa.
    busy <= '0' WHEN (state = S_IDLE AND start_req = '0') ELSE '1';

    fsm_proc : PROCESS (clock, reset)
    BEGIN
        IF reset = '1' THEN
            clk_cnt   <= 0;
            phase     <= 0;
            bit_cnt   <= 0;
            state     <= S_IDLE;
            shift_reg <= (OTHERS => '0');
            data_reg  <= (OTHERS => '0');
            start_req <= '0';
            scl_r     <= '1';
            sda_low   <= '0';

        ELSIF rising_edge(clock) THEN

            -- Captura de novo dado: enable por 1 ciclo enquanto o driver esta livre.
            IF state = S_IDLE AND start_req = '0' AND enable = '1' THEN
                data_reg  <= data_p;
                start_req <= '1';
            END IF;

            -- Geracao das fases I2C: a FSM avanca uma fase a cada QUARTER ciclos.
            IF clk_cnt = QUARTER - 1 THEN
                clk_cnt <= 0;

                CASE state IS

                    -- Repouso: SCL e SDA liberados em nivel alto.
                    WHEN S_IDLE =>
                        scl_r   <= '1';
                        sda_low <= '0';
                        phase   <= 0;
                        bit_cnt <= 0;
                        IF start_req = '1' THEN
                            start_req <= '0';
                            shift_reg <= ADDR_RW;
                            state     <= S_START;
                        END IF;

                    -- Condicao de START: SDA cai de '1' para '0' com SCL em '1'.
                    WHEN S_START =>
                        CASE phase IS
                            WHEN 0 => sda_low <= '0'; scl_r <= '1';
                            WHEN 1 => sda_low <= '1'; scl_r <= '1';
                            WHEN 2 => sda_low <= '1'; scl_r <= '1';
                            WHEN OTHERS => sda_low <= '1'; scl_r <= '0';
                        END CASE;
                        IF phase = 3 THEN
                            phase   <= 0;
                            bit_cnt <= 0;
                            state   <= S_ADDR;
                        ELSE
                            phase <= phase + 1;
                        END IF;

                    -- Envio do byte de endereco (MSB primeiro).
                    WHEN S_ADDR =>
                        CASE phase IS
                            WHEN 0 => scl_r <= '0'; sda_low <= NOT shift_reg(7);
                            WHEN 1 => scl_r <= '1';
                            WHEN 2 => scl_r <= '1';
                            WHEN OTHERS => scl_r <= '0';
                        END CASE;
                        IF phase = 3 THEN
                            phase     <= 0;
                            shift_reg <= shift_reg(6 DOWNTO 0) & '0';
                            IF bit_cnt = 7 THEN
                                bit_cnt <= 0;
                                state   <= S_ACK1;
                            ELSE
                                bit_cnt <= bit_cnt + 1;
                            END IF;
                        ELSE
                            phase <= phase + 1;
                        END IF;

                    -- ACK do escravo apos o endereco: master libera SDA e gera 1 pulso.
                    WHEN S_ACK1 =>
                        CASE phase IS
                            WHEN 0 => scl_r <= '0'; sda_low <= '0';
                            WHEN 1 => scl_r <= '1';
                            WHEN 2 => scl_r <= '1';
                            WHEN OTHERS => scl_r <= '0';
                        END CASE;
                        IF phase = 3 THEN
                            phase     <= 0;
                            bit_cnt   <= 0;
                            shift_reg <= data_reg;
                            state     <= S_DATA;
                        ELSE
                            phase <= phase + 1;
                        END IF;

                    -- Envio do byte de dados (MSB primeiro).
                    WHEN S_DATA =>
                        CASE phase IS
                            WHEN 0 => scl_r <= '0'; sda_low <= NOT shift_reg(7);
                            WHEN 1 => scl_r <= '1';
                            WHEN 2 => scl_r <= '1';
                            WHEN OTHERS => scl_r <= '0';
                        END CASE;
                        IF phase = 3 THEN
                            phase     <= 0;
                            shift_reg <= shift_reg(6 DOWNTO 0) & '0';
                            IF bit_cnt = 7 THEN
                                bit_cnt <= 0;
                                state   <= S_ACK2;
                            ELSE
                                bit_cnt <= bit_cnt + 1;
                            END IF;
                        ELSE
                            phase <= phase + 1;
                        END IF;

                    -- ACK do escravo apos o dado.
                    WHEN S_ACK2 =>
                        CASE phase IS
                            WHEN 0 => scl_r <= '0'; sda_low <= '0';
                            WHEN 1 => scl_r <= '1';
                            WHEN 2 => scl_r <= '1';
                            WHEN OTHERS => scl_r <= '0';
                        END CASE;
                        IF phase = 3 THEN
                            phase <= 0;
                            state <= S_STOP;
                        ELSE
                            phase <= phase + 1;
                        END IF;

                    -- Condicao de STOP: SDA sobe de '0' para '1' com SCL em '1'.
                    WHEN S_STOP =>
                        CASE phase IS
                            WHEN 0 => scl_r <= '0'; sda_low <= '1';
                            WHEN 1 => scl_r <= '1'; sda_low <= '1';
                            WHEN 2 => scl_r <= '1'; sda_low <= '0';
                            WHEN OTHERS => scl_r <= '1'; sda_low <= '0';
                        END CASE;
                        IF phase = 3 THEN
                            phase <= 0;
                            state <= S_IDLE;
                        ELSE
                            phase <= phase + 1;
                        END IF;

                END CASE;

            ELSE
                clk_cnt <= clk_cnt + 1;
            END IF;
        END IF;
    END PROCESS;

END ARCHITECTURE rtl;
