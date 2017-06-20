library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator is
	
	generic
	(
		In_width : natural := 10
	);
	
	port 
	(
		SUB_o, Thre	:in  signed(In_width downto 0);
		LT				:out  std_logic
	);

end entity;

architecture rtl of comparator is

begin
	process(SUB_o, Thre)
	begin
		if(SUB_o > Thre)then
			LT <= '1';
		else
			LT <= '0';
		end if;
	end process;
end rtl;
