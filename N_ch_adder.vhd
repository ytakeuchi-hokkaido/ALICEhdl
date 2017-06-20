library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity N_ch_adder is
	
	generic
	(
		In_width : natural := 10;
		sel_width : natural := 1;
		SUM_width : natural := 18;
		cont_width: natural := 9;
		contri_width:natural := 9;
		average_width:natural := 12;
		LT_add_width : natural := 4;
		Add_width: natural := 13
	);
	
	port 
	(
	Hiclk, reset 													:in std_logic;
	multi_o1, multi_o2, multi_o3, multi_o4, multi_o5 	:in unsigned((In_width-1) downto 0);
	delay_o1, delay_o2, delay_o3, delay_o4, delay_o5	:in unsigned((In_width-1) downto 0);
	Thre																:in signed(In_width downto 0);
	SUM																:out unsigned((SUM_width-1) downto 0);
	contribute   													:out unsigned ((contri_width-1) downto 0)
	);
	
end entity;

architecture rtl of N_ch_adder is

-- rise sub ,cmp and mask
component Differential
	port 
	(
	multi_o1, multi_o2, multi_o3, multi_o4, multi_o5 	:in unsigned((In_width-1) downto 0);
	delay_o1, delay_o2, delay_o3, delay_o4, delay_o5	:in unsigned((In_width-1) downto 0);
	Thre																:in signed(In_width downto 0);
	mask_o1, mask_o2, mask_o3, mask_o4, mask_o5			:out unsigned((In_width-1) downto 0);
	LT1, LT2, LT3, LT4, LT5										:inout std_logic
	);
end component;
-- rise sub ,cmp and mask
signal LT1, LT2, LT3, LT4, LT5:std_logic;
signal mask_o1, mask_o2, mask_o3, mask_o4, mask_o5 :unsigned((In_width-1) downto 0);
-- Adder_and_Accumulator
component Adder_and_Accumulator
	port 
	(
	Hiclk, reset 					:in std_logic;
	mask_o1, mask_o2				:in unsigned((In_width-1) downto 0);
	mask_o3, mask_o4, mask_o5 	:in unsigned((In_width-1) downto 0);
	SUM								:out unsigned((SUM_width-1) downto 0)
	);
end component;
-- Adder_and_Accumulator

-- LT_sum
component contri_sum
	port 
	(
	Hiclk, reset 					:in std_logic;
	LT1, LT2, LT3, LT4, LT5: in std_logic;
	contribute   	:out unsigned ((contri_width-1) downto 0)
	);
end component;
-- LT_sum 

begin

Differential_search:Differential port map
	(
	multi_o1 => multi_o1, multi_o2 => multi_o2, multi_o3 => multi_o3, multi_o4 => multi_o4, multi_o5 => multi_o5,
	delay_o1 => delay_o1, delay_o2 => delay_o2, delay_o3 => delay_o3, delay_o4 => delay_o4, delay_o5 => delay_o5,
	Thre => Thre,
	mask_o1 => mask_o1, mask_o2 => mask_o2, mask_o3 => mask_o3, mask_o4 => mask_o4, mask_o5 => mask_o5,
	LT1 => LT1, LT2 => LT2, LT3 => LT3, LT4 => LT4, LT5 => LT5
	);

SUM_contri:contri_sum port map
	(
	Hiclk => Hiclk, reset => reset,
	LT1 => LT1, LT2 => LT2, LT3 => LT3,
	LT4 => LT4, LT5 => LT5,
	contribute => contribute
	);
	
SUM_ad:Adder_and_Accumulator port map
	(
	Hiclk => Hiclk, reset => reset, mask_o1 => mask_o1, mask_o2 => mask_o2,
	mask_o3 => mask_o3, mask_o4 => mask_o4, mask_o5 => mask_o5,
	SUM => SUM
	);

end rtl;
