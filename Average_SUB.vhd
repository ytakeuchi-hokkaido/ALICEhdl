library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Average_SUB is
	
	generic
	(
		In_width : natural := 10;
		average_width:natural := 12
	);
	
	port 
	(
		average 	:in unsigned ((average_width-1) downto 0);
		Shift_o	:in unsigned((In_width-1) downto 0);
		Fi_out 	:out signed (average_width downto 0)
	);

end entity;

architecture rtl of Average_SUB is

begin
	process(average, Shift_o)
	begin
		Fi_out <= signed(("0" & Shift_o & "00") - ("0" & average));
	end process;
end rtl;
