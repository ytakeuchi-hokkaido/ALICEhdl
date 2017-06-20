library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity risecmp is
	
	generic
	(
		In_width : natural := 10
	);
	
	port 
	(
		risesub, Thre	:in  signed(In_width downto 0);
		riseLT			:out  std_logic
	);

end entity;

architecture rtl of risecmp is

begin
	process(risesub, Thre)
	begin
		if(risesub < Thre)then
			riseLT <= '1';
		else
			riseLT <= '0';
		end if;
	end process;
end rtl;
