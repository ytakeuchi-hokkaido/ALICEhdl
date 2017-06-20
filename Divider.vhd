library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divider is
  generic(
    SUM_width : natural := 18;
    contri_width:natural := 9;
    average_width:natural := 12
    );

  port(
    SUM	   	:in unsigned  ((SUM_width-1) downto 0);
    contribute	:in unsigned  ((contri_width-1) downto 0);
    average 		:out unsigned ((average_width-1) downto 0)
    );

end entity;

architecture rtl of Divider is

  signal resultD:unsigned(((SUM_width+1)) downto 0);


begin

  resultD <= (SUM & "00") / ("000000000" & contribute);

  average <= resultD((average_width-1) downto 0);

end rtl;
