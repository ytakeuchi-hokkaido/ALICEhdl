library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity r_sub is
	
	generic
	(
		In_width : natural := 10
	);
	
	port 
	(
		multi_o, delay_o	:in unsigned((In_width-1) downto 0);
		r_sub_o					:out signed(In_width downto 0)
	);

end entity;

architecture rtl of r_sub is
signal rS_unsi :unsigned(In_width downto 0);

begin
	process(multi_o, delay_o, rS_unsi)
	begin
		rS_unsi <= ("0" & multi_o) - ("0" & delay_o);
		r_sub_o <= signed(rS_unsi);
	end process;
end rtl;
