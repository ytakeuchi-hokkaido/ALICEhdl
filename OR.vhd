library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator is
	
	port 
	(
		r_LT, f_LT	:in  std_logic;
		LT_sel		:out  std_logic
	);

end entity;

architecture rtl of comparator is

begin
	LT_sel <= r_LT or f_LT;
end rtl;
