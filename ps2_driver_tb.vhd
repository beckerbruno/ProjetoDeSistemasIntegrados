LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ps2_driver_tb IS
END ENTITY ps2_driver_tb;

ARCHITECTURE sim OF ps2_driver_tb IS

    CONSTANT CLK_PERIOD_100Mhz : TIME := 10 ns;
    CONSTANT CLK_PERIOD_1Mhz : TIME := 1000 ns;
    
    SIGNAL clock_in : STD_LOGIC := '0';
    SIGNAL reset_in : STD_LOGIC := '1';
    SIGNAL clock_ps2 : STD_LOGIC := '0';
    SIGNAL data_ps2 : STD_LOGIC := '0';
    SIGNAL data_p : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL data_p_en : STD_LOGIC;

    SIGNAL sync : STD_LOGIC;
    SIGNAL sim_done : BOOLEAN := false;
    SIGNAL pressing : BOOLEAN := false;

    PROCEDURE send_byte (
        SIGNAL clk_s : IN STD_LOGIC;
        SIGNAL ser : OUT STD_LOGIC;
        CONSTANT b : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
    ) IS
    BEGIN
        FOR i IN 7 DOWNTO 0 LOOP
            ser <= b(i);
            WAIT UNTIL rising_edge(clk_s);
        END LOOP;
    END PROCEDURE;

    PROCEDURE send_frame (
        SIGNAL clk_s : IN STD_LOGIC;
        SIGNAL ser : OUT STD_LOGIC;
        CONSTANT p1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        CONSTANT p2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        CONSTANT p3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        CONSTANT p4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        CONSTANT p5 : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
    ) IS
    BEGIN
        send_byte(clk_s, ser, x"A5");
        send_byte(clk_s, ser, p1);
        send_byte(clk_s, ser, p2);
        send_byte(clk_s, ser, p3);
        send_byte(clk_s, ser, p4);
        send_byte(clk_s, ser, p5);
    END PROCEDURE;

BEGIN

    dut : ENTITY work.ps2_driver
        PORT MAP(
            sync => sync,

            clock_in => clock_in,
            reset_in => reset_in,
            clock_ps2 => clock_ps2,
            data_ps2 => data_ps2,
            data_p => data_p,
            data_p_en => data_p_en
        );

    clk_gen_100 : PROCESS
    BEGIN
        WHILE NOT sim_done LOOP
            clk <= '0';
            WAIT FOR CLK_PERIOD_100Mhz / 2;
            clk <= '1';
            WAIT FOR CLK_PERIOD_100Mhz / 2;
        END LOOP;
        WAIT;
    END PROCESS;

    clk_gen_1 : PROCESS
    BEGIN
        WHILE NOT sim_done LOOP
            WHILE NOT pressing LOOP
                clk <= '0';
                WAIT FOR CLK_PERIOD_1Mhz / 2;
                clk <= '1';
                WAIT FOR CLK_PERIOD_1Mhz / 2;
            END LOOP;
        END LOOP;
        WAIT;
    END PROCESS;

    stim : PROCESS
    BEGIN
        rst <= '1';
        data_ps2 <= '0';
        WAIT FOR 50 ns;
        WAIT UNTIL rising_edge(clock_in);
        rst <= '0';

        send_byte(clk, data_sr, x"00");
        send_byte(clk, data_sr, x"FF");
        --send_byte(clk, data_sr, x"A5");
        send_byte(clk, data_sr, x"FF");

        send_frame(clk, data_sr, x"11", x"22", x"33", x"44", x"55");
        send_frame(clk, data_sr, x"66", x"77", x"88", x"99", x"AA");
        send_frame(clk, data_sr, x"BB", x"CC", x"DD", x"EE", x"FF");

        send_frame(clk, data_sr, x"01", x"02", x"03", x"04", x"05");
        send_frame(clk, data_sr, x"10", x"20", x"30", x"40", x"50");

        send_byte(clk, data_sr, x"5A");
        send_byte(clk, data_sr, x"DE");
        send_byte(clk, data_sr, x"AD");
        send_byte(clk, data_sr, x"BE");
        send_byte(clk, data_sr, x"EF");
        send_byte(clk, data_sr, x"00");

        send_frame(clk, data_sr, x"A1", x"A2", x"A3", x"A4", x"A5");
        send_frame(clk, data_sr, x"B1", x"B2", x"B3", x"B4", x"B5");
        send_frame(clk, data_sr, x"C1", x"C2", x"C3", x"C4", x"C5");

        send_byte(clk, data_sr, x"A5");
        send_byte(clk, data_sr, x"77");

        WAIT UNTIL rising_edge(clk);
        rst <= '1';
        WAIT FOR 40 ns;
        WAIT UNTIL rising_edge(clk);
        rst <= '0';

        send_frame(clk, data_sr, x"F0", x"F1", x"F2", x"F3", x"F4");
        send_frame(clk, data_sr, x"E0", x"E1", x"E2", x"E3", x"E4");
        send_frame(clk, data_sr, x"D0", x"D1", x"D2", x"D3", x"D4");
        send_frame(clk, data_sr, x"C0", x"C1", x"C2", x"C3", x"C4");

        WAIT FOR 500 ns;
        sim_done <= true;
        WAIT;
    END PROCESS;

END ARCHITECTURE sim;