library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity SUB is
	
	generic
	(
		In_width : natural := 10;
		average_width:natural := 12;
		Out_width : natural := 13
	);
	
	port 
	(
		Df_o		:in unsigned((In_width-1) downto 0);
		average	:in unsigned((average_width-1) downto 0);
		SUB_o		:out signed((Out_width-1) downto 0)
	);

end entity;

architecture rtl of SUB is
signal S_unsi :unsigned((Out_width-1) downto 0);

begin
	process(Df_o, average, S_unsi)
	begin
		S_unsi <= ("0" & Df_o & "00") - ("0" & average);
		SUB_o <= signed(S_unsi);
	end process;
end rtl;
