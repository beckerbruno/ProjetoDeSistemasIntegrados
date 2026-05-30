-- Prof. Marlon Moraes
-- marlon.moraes@pucrs.br

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_arith.all;

entity decoder_scancode_ascii_tb is
end decoder_scancode_ascii_tb;

architecture tb of decoder_scancode_ascii_tb is

	signal	tb_scancode	: std_logic_vector(7 downto 0) := x"00";
	signal	tb_duv		: std_logic_vector(7 downto 0);
	signal	tb_golden	: std_logic_vector(7 downto 0);
	signal	erro		: std_logic := '0';

begin

	DUV: entity work.decoder_scancode_ascii
	port map
	(
		ascii_out 	=>	tb_duv,
		scancode_in =>	tb_scancode
	);
	
	GOLDEN_MARLON: entity work.golden
	port map
	(
		entrada	=> tb_scancode,
		saida	=> tb_golden
	);
	
	
	erro <= '1' when tb_golden /= tb_duv else
			'0';
	
	
	checker: process
	begin
		wait for 5 ns;
		
		assert (tb_golden(0) = tb_duv(0)) report ("erro - bit 0.") severity note;
		assert (tb_golden(1) = tb_duv(1)) report ("erro - bit 1.") severity note;
		assert (tb_golden(2) = tb_duv(2)) report ("erro - bit 2.") severity note;
		assert (tb_golden(3) = tb_duv(3)) report ("erro - bit 3.") severity note;
		assert (tb_golden(4) = tb_duv(4)) report ("erro - bit 4.") severity note;
		assert (tb_golden(5) = tb_duv(5)) report ("erro - bit 5.") severity note;
		assert (tb_golden(6) = tb_duv(6)) report ("erro - bit 6.") severity note;
		assert (tb_golden(7) = tb_duv(7)) report ("erro - bit 7.") severity note;

		
		wait for 5 ns;
	
	end process;
	
	

	gerador_entradas: process
	begin
		if tb_scancode < 255 then
			tb_scancode <= tb_scancode + 1;
		else
			tb_scancode <= (others => '0');		
		end if;
	
		wait for 10 ns;
	
	end process gerador_entradas;




end tb;