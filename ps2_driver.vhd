LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ps2_driver IS
	PORT (
		clk : IN STD_LOGIC;
		rst : IN STD_LOGIC;
		data_sr : IN STD_LOGIC;
		data_pl : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_pl_en : OUT STD_LOGIC;
		sync : OUT STD_LOGIC
	);
END ENTITY ps2_driver;

ARCHITECTURE rtl OF ps2_driver IS

	CONSTANT ALIGN_WORD : STD_LOGIC_VECTOR(7 DOWNTO 0) := x"A5";
	CONSTANT PAYLOAD_BYTES : INTEGER := 5;
	CONSTANT SYNC_THRESHOLD : INTEGER := 3;

	TYPE state_t IS (
		S_HUNT,
		S_CHECK,
		S_LOCKED
	);
	SIGNAL state : state_t;

	SIGNAL shift_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL bit_cnt : unsigned(2 DOWNTO 0);
	SIGNAL byte_cnt : unsigned(2 DOWNTO 0);
	SIGNAL align_cnt : unsigned(1 DOWNTO 0);

	SIGNAL byte_done : STD_LOGIC;
	SIGNAL is_align : STD_LOGIC;

	SIGNAL data_pl_r : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL data_pl_en_r : STD_LOGIC;
	SIGNAL sync_r : STD_LOGIC;

BEGIN

	data_pl <= data_pl_r;
	data_pl_en <= data_pl_en_r;
	sync <= sync_r;

	shift_register : PROCESS (clk, rst)
	BEGIN
		IF rst = '1' THEN
			shift_reg <= (OTHERS => '0');
		ELSIF rising_edge(clk) THEN
			shift_reg <= shift_reg(6 DOWNTO 0) & data_sr;
		END IF;
	END PROCESS;

	bit_counter : PROCESS (clk, rst)
	BEGIN
		IF rst = '1' THEN
			bit_cnt <= (OTHERS => '0');
			byte_done <= '0';
		ELSIF rising_edge(clk) THEN
			byte_done <= '0';
			IF bit_cnt = 7 THEN
				bit_cnt <= (OTHERS => '0');
				byte_done <= '1';
			ELSE
				bit_cnt <= bit_cnt + 1;
			END IF;
		END IF;
	END PROCESS;

	is_align <= '1' WHEN shift_reg = ALIGN_WORD 
		ELSE 	'0';

	fsm_proc : PROCESS (clk, rst)
	BEGIN
		IF rst = '1' THEN
			state <= S_HUNT;
			byte_cnt <= (OTHERS => '0');
			align_cnt <= (OTHERS => '0');
			data_pl_r <= (OTHERS => '0');
			data_pl_en_r <= '0';
			sync_r <= '0';
		ELSIF rising_edge(clk) THEN
			data_pl_en_r <= '0';

			CASE state IS

				WHEN S_HUNT => sync_r <= '0';
					byte_cnt <= (OTHERS => '0');
					align_cnt <= (OTHERS => '0');

					IF byte_done = '1' THEN
						IF is_align = '1' THEN
							state <= S_CHECK;
							align_cnt <= to_unsigned(1, align_cnt'length);
						END IF;
					END IF;

				WHEN S_CHECK => sync_r <= '0';
					IF byte_done = '1' THEN
						IF byte_cnt = to_unsigned(PAYLOAD_BYTES, byte_cnt'length) THEN
							byte_cnt <= (OTHERS => '0');
							IF is_align = '1' THEN
								align_cnt <= align_cnt + 1;
								IF align_cnt = to_unsigned(SYNC_THRESHOLD - 1, align_cnt'length) THEN
									state <= S_LOCKED;
									sync_r <= '1';
								END IF;
							ELSE
								state <= S_HUNT;
								align_cnt <= (OTHERS => '0');
							END IF;
						ELSE
							byte_cnt <= byte_cnt + 1;
						END IF;
					END IF;

				WHEN S_LOCKED => sync_r <= '1';
					IF byte_done = '1' THEN
						IF byte_cnt = to_unsigned(PAYLOAD_BYTES, byte_cnt'length) THEN
							byte_cnt <= (OTHERS => '0');
							IF is_align = '0' THEN
								state <= S_HUNT;
								align_cnt <= (OTHERS => '0');
								sync_r <= '0';
							END IF;
						ELSE
							data_pl_r <= shift_reg;
							data_pl_en_r <= '1';
							byte_cnt <= byte_cnt + 1;
						END IF;
					END IF;

			END CASE;
		END IF;
	END PROCESS;

END ARCHITECTURE rtl;