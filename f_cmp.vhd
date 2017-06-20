library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity f_cmp is
	
	generic
	(
		In_width : natural := 10
	);
	
	port 
	(
		f_sub_o, Thre	:in  signed(In_width downto 0);
		f_LT			:out  std_logic
	);

end entity;

architecture rtl of f_cmp is

begin
	process(f_sub_o, Thre)
	begin
		if(f_sub_o > Thre)then
			f_LT <= '1';
		else
			f_LT <= '0';
		end if;
	end process;
end rtl;
