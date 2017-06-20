library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity r_cmp is
	
	generic
	(
		In_width : natural := 10
	);
	
	port 
	(
		r_sub_o, Thre	:in  signed(In_width downto 0);
		r_LT			:out  std_logic
	);

end entity;

architecture rtl of r_cmp is

begin
	process(r_sub_o, Thre)
	begin
		if(r_sub_o > Thre)then
			r_LT <= '1';
		else
			r_LT <= '0';
		end if;
	end process;
end rtl;
