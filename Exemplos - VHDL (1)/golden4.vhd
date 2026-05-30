-- Prof. Marlon Moraes
-- marlon.moraes@pucrs.br

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_arith.all;
	
entity golden4 is
port
(
	entrada	: in	std_logic_vector(7 downto 0);
	saida	: out	std_logic_vector(7 downto 0)
);
end golden4;

architecture exemplo1 of golden4 is

begin

	process(entrada)
	begin
		case entrada is
			when x"1C" => saida <= x"41";
			when x"32" => saida <= x"42";
			when x"21" => saida <= x"43";
			when x"23" => saida <= x"44";
			when others => saida <= x"FF";
		end case;
	
	end process;


end exemplo1;