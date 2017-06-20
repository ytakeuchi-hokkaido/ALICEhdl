library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity f_sub is
	
	generic
	(
		In_width : natural := 10
	);
	
	port 
	(
         delay_o, multi_o	:in unsigned((In_width-1) downto 0);
	 f_sub_o		:out signed(In_width downto 0)
	);

end entity;

architecture rtl of f_sub is
signal fS_unsi :unsigned(In_width downto 0);

begin
	process(delay_o, multi_o, fS_unsi)
	begin
		fS_unsi <= ("0" & delay_o) - ("0" & multi_o);
		f_sub_o <= signed(fS_unsi);
	end process;
end rtl;
