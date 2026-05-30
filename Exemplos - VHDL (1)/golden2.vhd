-- Prof. Marlon Moraes
-- marlon.moraes@pucrs.br

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_arith.all;
	
entity golden2 is
port
(
	entrada	: in	std_logic_vector(7 downto 0);
	saida	: out	std_logic_vector(7 downto 0)
);
end golden2;

architecture exemplo1 of golden2 is

begin

			
	with entrada select
	saida <= 	x"41" when x"1C",
				x"42" when x"32",
				x"43" when x"21",
				x"44" when x"23",
				x"FF" when others;



end exemplo1;