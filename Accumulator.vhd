library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Accumulator is

	generic
	(
		In_width : natural := 10;
		Add_width: natural := 13;
		SUM_width : natural := 18
	);

	port 
	(
		mask_sum			:in unsigned((Add_width-1) downto 0);
		Hiclk, reset	:in std_logic;	
		SUM 		   	:out unsigned((SUM_width-1) downto 0)
	);

end entity;

architecture rtl of Accumulator is

	signal old_add 	: unsigned ((SUM_width-1) downto 0);
	signal adder_out 	: unsigned ((SUM_width-1) downto 0);
	signal old_result :unsigned ((SUM_width-1) downto 0);

begin

	old_add <= ("00000" & mask_sum);

	process (adder_out, reset)
	begin
		if (reset='1')then    -- Clear the accumulated data
			old_result <= (others => '0');
		else
			old_result <= adder_out;
		end if;
	end process;

	process (Hiclk)
	begin
		if (rising_edge(Hiclk)) then

			adder_out <= old_result + old_add;			-- Store accumulation result in a register

		end if;
	end process;

	SUM <= adder_out; 	-- Output accumulation result

end rtl;
