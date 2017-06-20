library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contri_sum is
	
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
	Hiclk, reset 					:in std_logic;
	LT1, LT2, LT3, LT4, LT5: in std_logic;
	contribute   	:out unsigned ((contri_width-1) downto 0)
	);
end entity;

architecture rtl of contri_sum is


component LT_Adder
	port 
	(
		LT1, LT2	:in std_logic;
		LT_sum 	:out unsigned ((LT_add_width-3) downto 0)
	);
end component;

component LT_adder_2
	port 
	(
		LT2a, LT2b	:in unsigned((LT_add_width-3) downto 0);
		LT3a 	:out unsigned((LT_add_width-2) downto 0)
	);
end component;

component LT_adder_3
	port 
	(
		LT5		:in std_logic;
		LT3a		:in unsigned((LT_add_width-2) downto 0);
		LT_sum 	:out unsigned((LT_add_width-1) downto 0)
	);
end component;

component contri_accum
	port 
	(
		Hiclk, reset	:in std_logic;
		LT_sum 			:in unsigned ((LT_add_width-1) downto 0);
		contribute   	:out unsigned ((contri_width-1) downto 0)
	);
end component;
signal LT2a, LT2b :unsigned((LT_add_width-3) downto 0);
signal LT3a 		:unsigned((LT_add_width-2) downto 0);
signal LT_sum		:unsigned ((LT_add_width-1) downto 0);
-- LT_sum

begin

LT_add1a:LT_adder port map(LT1 => LT1, LT2 => LT2, LT_sum => LT2a);
LT_add1b:LT_adder port map(LT1 => LT3, LT2 => LT4, LT_sum => LT2b);
LT_add2:LT_adder_2 port map(LT2a => LT2a, LT2b => LT2b, LT3a => LT3a);
sum_LT:LT_adder_3 port map(LT3a => LT3a, LT5 => LT5, LT_sum => LT_sum);
LT_accum:contri_accum port map(Hiclk => Hiclk, reset => reset, LT_sum => LT_sum,
contribute => contribute);
	
	
end rtl;
