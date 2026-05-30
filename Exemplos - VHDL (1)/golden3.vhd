-- Prof. Marlon Moraes
-- marlon.moraes@pucrs.br

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
	use ieee.std_logic_arith.all;
	
entity golden3 is
port
(
	entrada	: in	std_logic_vector(7 downto 0);
	saida	: out	std_logic_vector(7 downto 0)
);
end golden3;

architecture exemplo1 of golden3 is

begin


	process(entrada)
	begin
		if entrada = x"1C" then
			saida <= x"41";
		elsif entrada = x"32" then
			saida <= x"42";
		elsif entrada = x"21" then
			saida <= x"43";
		elsif entrada = x"23" then
			saida <= x"44";
		else
			saida <= x"FF";
		end if;	
	end process;





end exemplo1;