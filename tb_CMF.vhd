library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_CMF is

    generic
(
	In_width 	:natural := 10;
	Out_width 	:natural := 13;
	sel_width 	:natural := 6;
	SUM_width 	:natural := 18;
	cont_width	:natural := 9;
        count_max       :natural := 40;
	contri_width	:natural := 9;
	average_width	:natural := 12;
	LT_add_width 	:natural := 4;
	Add_width	:natural := 13
	);
end tb_CMF;

architecture behavioral of tb_CMF is

component Common_mode_filter
port (
	Clock, Hiclk																							:in std_logic;
	In_1, In_2, In_3, In_4, In_5, In_6, In_7, In_8, In_9, In_10 :in  unsigned((In_width-1) downto 0);
	In_11, In_12, In_13, In_14, In_15, In_16, In_17, In_18, In_19, In_20 :in  unsigned((In_width-1) downto 0);
	In_21, In_22, In_23, In_24, In_25, In_26, In_27, In_28, In_29, In_30 :in  unsigned((In_width-1) downto 0);
	In_31, In_32, In_33, In_34, In_35, In_36, In_37, In_38, In_39, In_40 :in  unsigned((In_width-1) downto 0);
	In_41, In_42, In_43, In_44, In_45, In_46, In_47, In_48, In_49, In_50 :in  unsigned((In_width-1) downto 0); 
	In_51, In_52, In_53, In_54, In_55, In_56, In_57, In_58, In_59, In_60 :in  unsigned((In_width-1) downto 0);
	In_61, In_62, In_63, In_64, In_65, In_66, In_67, In_68, In_69, In_70 :in  unsigned((In_width-1) downto 0);
	In_71, In_72, In_73, In_74, In_75, In_76, In_77, In_78, In_79, In_80 :in  unsigned((In_width-1) downto 0);
	In_81, In_82, In_83, In_84, In_85, In_86, In_87, In_88, In_89, In_90 :in  unsigned((In_width-1) downto 0);
	In_91, In_92, In_93, In_94, In_95, In_96, In_97, In_98, In_99, In_100 :in  unsigned((In_width-1) downto 0);
	In_101, In_102, In_103, In_104, In_105, In_106, In_107, In_108, In_109, In_110	:in  unsigned((In_width-1) downto 0); 
	In_111, In_112, In_113, In_114, In_115, In_116, In_117, In_118, In_119, In_120 	:in  unsigned((In_width-1) downto 0);
	In_121, In_122, In_123, In_124, In_125, In_126, In_127, In_128, In_129, In_130 	:in  unsigned((In_width-1) downto 0);
	In_131, In_132, In_133, In_134, In_135, In_136, In_137, In_138, In_139, In_140 	:in  unsigned((In_width-1) downto 0);
	In_141, In_142, In_143, In_144, In_145, In_146, In_147, In_148, In_149, In_150 	:in  unsigned((In_width-1) downto 0);
	In_151, In_152, In_153, In_154, In_155, In_156, In_157, In_158, In_159, In_160 	:in  unsigned((In_width-1) downto 0);
	In_161, In_162, In_163, In_164, In_165, In_166, In_167, In_168, In_169, In_170 	:in  unsigned((In_width-1) downto 0);
	In_171, In_172, In_173, In_174, In_175, In_176, In_177, In_178, In_179, In_180 	:in  unsigned((In_width-1) downto 0);
	In_181, In_182, In_183, In_184, In_185, In_186, In_187, In_188, In_189, In_190 	:in  unsigned((In_width-1) downto 0);
	In_191, In_192, In_193, In_194, In_195, In_196, In_197, In_198, In_199, In_200 	:in  unsigned((In_width-1) downto 0);
	Thre	:in signed(In_width downto 0);
	CMF_o1, CMF_o2, CMF_o3, CMF_o4, CMF_o5, CMF_o6, CMF_o7, CMF_o8, CMF_o9, CMF_o10 :out  signed((Out_width-1) downto 0);
	CMF_o11, CMF_o12, CMF_o13, CMF_o14, CMF_o15, CMF_o16, CMF_o17, CMF_o18, CMF_o19, CMF_o20 :out  signed((Out_width-1) downto 0);
	CMF_o21, CMF_o22, CMF_o23, CMF_o24, CMF_o25, CMF_o26, CMF_o27, CMF_o28, CMF_o29, CMF_o30 :out  signed((Out_width-1) downto 0);
	CMF_o31, CMF_o32, CMF_o33, CMF_o34, CMF_o35, CMF_o36, CMF_o37, CMF_o38, CMF_o39, CMF_o40 :out  signed((Out_width-1) downto 0);
	CMF_o41, CMF_o42, CMF_o43, CMF_o44, CMF_o45, CMF_o46, CMF_o47, CMF_o48, CMF_o49, CMF_o50 :out  signed((Out_width-1) downto 0); 
	CMF_o51, CMF_o52, CMF_o53, CMF_o54, CMF_o55, CMF_o56, CMF_o57, CMF_o58, CMF_o59, CMF_o60 :out  signed((Out_width-1) downto 0);
	CMF_o61, CMF_o62, CMF_o63, CMF_o64, CMF_o65, CMF_o66, CMF_o67, CMF_o68, CMF_o69, CMF_o70 :out  signed((Out_width-1) downto 0);
	CMF_o71, CMF_o72, CMF_o73, CMF_o74, CMF_o75, CMF_o76, CMF_o77, CMF_o78, CMF_o79, CMF_o80 :out  signed((Out_width-1) downto 0);
	CMF_o81, CMF_o82, CMF_o83, CMF_o84, CMF_o85, CMF_o86, CMF_o87, CMF_o88, CMF_o89, CMF_o90 :out  signed((Out_width-1) downto 0);
	CMF_o91, CMF_o92, CMF_o93, CMF_o94, CMF_o95, CMF_o96, CMF_o97, CMF_o98, CMF_o99, CMF_o100 :out  signed((Out_width-1) downto 0);
	CMF_o101, CMF_o102, CMF_o103, CMF_o104, CMF_o105, CMF_o106, CMF_o107, CMF_o108, CMF_o109, CMF_o110:out  signed((Out_width-1) downto 0); 
	CMF_o111, CMF_o112, CMF_o113, CMF_o114, CMF_o115, CMF_o116, CMF_o117, CMF_o118, CMF_o119, CMF_o120:out  signed((Out_width-1) downto 0);
	CMF_o121, CMF_o122, CMF_o123, CMF_o124, CMF_o125, CMF_o126, CMF_o127, CMF_o128, CMF_o129, CMF_o130:out  signed((Out_width-1) downto 0);
	CMF_o131, CMF_o132, CMF_o133, CMF_o134, CMF_o135, CMF_o136, CMF_o137, CMF_o138, CMF_o139, CMF_o140:out  signed((Out_width-1) downto 0);
	CMF_o141, CMF_o142, CMF_o143, CMF_o144, CMF_o145, CMF_o146, CMF_o147, CMF_o148, CMF_o149, CMF_o150:out  signed((Out_width-1) downto 0);
	CMF_o151, CMF_o152, CMF_o153, CMF_o154, CMF_o155, CMF_o156, CMF_o157, CMF_o158, CMF_o159, CMF_o160:out  signed((Out_width-1) downto 0);
	CMF_o161, CMF_o162, CMF_o163, CMF_o164, CMF_o165, CMF_o166, CMF_o167, CMF_o168, CMF_o169, CMF_o170:out  signed((Out_width-1) downto 0);
	CMF_o171, CMF_o172, CMF_o173, CMF_o174, CMF_o175, CMF_o176, CMF_o177, CMF_o178, CMF_o179, CMF_o180:out  signed((Out_width-1) downto 0);
	CMF_o181, CMF_o182, CMF_o183, CMF_o184, CMF_o185, CMF_o186, CMF_o187, CMF_o188, CMF_o189, CMF_o190:out  signed((Out_width-1) downto 0);
	CMF_o191, CMF_o192, CMF_o193, CMF_o194, CMF_o195, CMF_o196, CMF_o197, CMF_o198, CMF_o199, CMF_o200:out  signed((Out_width-1) downto 0)
	); 
end component; 

-- clk_cycle
  constant Hiclk_PERIOD : time := 10 ns;
  constant start_PERIOD : time := 200 ns;

  
  signal Hiclk : std_logic := '0';
  signal Clock : std_logic := '0';
  
  signal In_1, In_2, In_3, In_4, In_5, In_6, In_7, In_8, In_9, In_10 : unsigned((In_width-1) downto 0);
  signal In_11, In_12, In_13, In_14, In_15, In_16, In_17, In_18, In_19, In_20 : unsigned((In_width-1) downto 0);
  signal In_21, In_22, In_23, In_24, In_25, In_26, In_27, In_28, In_29, In_30 : unsigned((In_width-1) downto 0);
  signal In_31, In_32, In_33, In_34, In_35, In_36, In_37, In_38, In_39, In_40 : unsigned((In_width-1) downto 0);
  signal In_41, In_42, In_43, In_44, In_45, In_46, In_47, In_48, In_49, In_50 : unsigned((In_width-1) downto 0);
  signal In_51, In_52, In_53, In_54, In_55, In_56, In_57, In_58, In_59, In_60 : unsigned((In_width-1) downto 0);
  signal In_61, In_62, In_63, In_64, In_65, In_66, In_67, In_68, In_69, In_70 : unsigned((In_width-1) downto 0);
  signal In_71, In_72, In_73, In_74, In_75, In_76, In_77, In_78, In_79, In_80 : unsigned((In_width-1) downto 0);
  signal In_81, In_82, In_83, In_84, In_85, In_86, In_87, In_88, In_89, In_90 : unsigned((In_width-1) downto 0);
  signal In_91, In_92, In_93, In_94, In_95, In_96, In_97, In_98, In_99, In_100 : unsigned((In_width-1) downto 0);
  signal In_101, In_102, In_103, In_104, In_105, In_106, In_107, In_108, In_109, In_110 : unsigned((In_width-1) downto 0);
  signal In_111, In_112, In_113, In_114, In_115, In_116, In_117, In_118, In_119, In_120 : unsigned((In_width-1) downto 0);
  signal In_121, In_122, In_123, In_124, In_125, In_126, In_127, In_128, In_129, In_130 : unsigned((In_width-1) downto 0);
  signal In_131, In_132, In_133, In_134, In_135, In_136, In_137, In_138, In_139, In_140 : unsigned((In_width-1) downto 0);
  signal In_141, In_142, In_143, In_144, In_145, In_146, In_147, In_148, In_149, In_150 : unsigned((In_width-1) downto 0);
  signal In_151, In_152, In_153, In_154, In_155, In_156, In_157, In_158, In_159, In_160 : unsigned((In_width-1) downto 0);
  signal In_161, In_162, In_163, In_164, In_165, In_166, In_167, In_168, In_169, In_170 : unsigned((In_width-1) downto 0);
  signal In_171, In_172, In_173, In_174, In_175, In_176, In_177, In_178, In_179, In_180 : unsigned((In_width-1) downto 0);
  signal In_181, In_182, In_183, In_184, In_185, In_186, In_187, In_188, In_189, In_190 : unsigned((In_width-1) downto 0);
  signal In_191, In_192, In_193, In_194, In_195, In_196, In_197, In_198, In_199, In_200 : unsigned((In_width-1) downto 0);
  
  signal CMF_o1, CMF_o2, CMF_o3, CMF_o4, CMF_o5, CMF_o6, CMF_o7, CMF_o8, CMF_o9, CMF_o10: signed((Out_width-1) downto 0);
  signal CMF_o11, CMF_o12, CMF_o13, CMF_o14, CMF_o15, CMF_o16, CMF_o17, CMF_o18, CMF_o19, CMF_o20: signed((Out_width-1) downto 0);
  signal CMF_o21, CMF_o22, CMF_o23, CMF_o24, CMF_o25, CMF_o26, CMF_o27, CMF_o28, CMF_o29, CMF_o30: signed((Out_width-1) downto 0);
  signal CMF_o31, CMF_o32, CMF_o33, CMF_o34, CMF_o35, CMF_o36, CMF_o37, CMF_o38, CMF_o39, CMF_o40: signed((Out_width-1) downto 0);
  signal CMF_o41, CMF_o42, CMF_o43, CMF_o44, CMF_o45, CMF_o46, CMF_o47, CMF_o48, CMF_o49, CMF_o50: signed((Out_width-1) downto 0);
  signal CMF_o51, CMF_o52, CMF_o53, CMF_o54, CMF_o55, CMF_o56, CMF_o57, CMF_o58, CMF_o59, CMF_o60: signed((Out_width-1) downto 0);
  signal CMF_o61, CMF_o62, CMF_o63, CMF_o64, CMF_o65, CMF_o66, CMF_o67, CMF_o68, CMF_o69, CMF_o70: signed((Out_width-1) downto 0);
  signal CMF_o71, CMF_o72, CMF_o73, CMF_o74, CMF_o75, CMF_o76, CMF_o77, CMF_o78, CMF_o79, CMF_o80: signed((Out_width-1) downto 0);
  signal CMF_o81, CMF_o82, CMF_o83, CMF_o84, CMF_o85, CMF_o86, CMF_o87, CMF_o88, CMF_o89, CMF_o90: signed((Out_width-1) downto 0);
  signal CMF_o91, CMF_o92, CMF_o93, CMF_o94, CMF_o95, CMF_o96, CMF_o97, CMF_o98, CMF_o99, CMF_o100 : signed((Out_width-1) downto 0);
  signal CMF_o101, CMF_o102, CMF_o103, CMF_o104, CMF_o105, CMF_o106, CMF_o107, CMF_o108, CMF_o109, CMF_o110: signed((Out_width-1) downto 0);
  signal CMF_o111, CMF_o112, CMF_o113, CMF_o114, CMF_o115, CMF_o116, CMF_o117, CMF_o118, CMF_o119, CMF_o120: signed((Out_width-1) downto 0);
  signal CMF_o121, CMF_o122, CMF_o123, CMF_o124, CMF_o125, CMF_o126, CMF_o127, CMF_o128, CMF_o129, CMF_o130: signed((Out_width-1) downto 0);
  signal CMF_o131, CMF_o132, CMF_o133, CMF_o134, CMF_o135, CMF_o136, CMF_o137, CMF_o138, CMF_o139, CMF_o140: signed((Out_width-1) downto 0);
  signal CMF_o141, CMF_o142, CMF_o143, CMF_o144, CMF_o145, CMF_o146, CMF_o147, CMF_o148, CMF_o149, CMF_o150: signed((Out_width-1) downto 0);
  signal CMF_o151, CMF_o152, CMF_o153, CMF_o154, CMF_o155, CMF_o156, CMF_o157, CMF_o158, CMF_o159, CMF_o160: signed((Out_width-1) downto 0);
  signal CMF_o161, CMF_o162, CMF_o163, CMF_o164, CMF_o165, CMF_o166, CMF_o167, CMF_o168, CMF_o169, CMF_o170: signed((Out_width-1) downto 0);
  signal CMF_o171, CMF_o172, CMF_o173, CMF_o174, CMF_o175, CMF_o176, CMF_o177, CMF_o178, CMF_o179, CMF_o180: signed((Out_width-1) downto 0);
  signal CMF_o181, CMF_o182, CMF_o183, CMF_o184, CMF_o185, CMF_o186, CMF_o187, CMF_o188, CMF_o189, CMF_o190: signed((Out_width-1) downto 0);
  signal CMF_o191, CMF_o192, CMF_o193, CMF_o194, CMF_o195, CMF_o196, CMF_o197, CMF_o198, CMF_o199, CMF_o200: signed((Out_width-1) downto 0);

  signal Thre: signed(In_width downto 0);
	
begin

  TEST : Common_mode_filter
    port map(
      Clock => Clock, Hiclk => Hiclk,
      In_1   => In_1,   In_2   => In_2,   In_3   => In_3,   In_4   => In_4,   In_5   => In_5,   In_6   => In_6,   In_7   => In_7,   In_8   => In_8,   In_9   => In_9,   In_10  => In_10,
      In_11  => In_11,  In_12  => In_12,  In_13  => In_13,  In_14  => In_14,  In_15  => In_15,  In_16  => In_16,  In_17  => In_17,  In_18  => In_18,  In_19  => In_19,  In_20  => In_20,
      In_21  => In_21,  In_22  => In_22,  In_23  => In_23,  In_24  => In_24,  In_25  => In_25,  In_26  => In_26,  In_27  => In_27,  In_28  => In_28,  In_29  => In_29,  In_30  => In_30,
      In_31  => In_31,  In_32  => In_32,  In_33  => In_33,  In_34  => In_34,  In_35  => In_35,  In_36  => In_36,  In_37  => In_37,  In_38  => In_38,  In_39  => In_39,  In_40  => In_40,
      In_41  => In_41,  In_42  => In_42,  In_43  => In_43,  In_44  => In_44,  In_45  => In_45,  In_46  => In_46,  In_47  => In_47,  In_48  => In_48,  In_49  => In_49,  In_50  => In_50,
      In_51  => In_51,  In_52  => In_52,  In_53  => In_53,  In_54  => In_54,  In_55  => In_55,  In_56  => In_56,  In_57  => In_57,  In_58  => In_58,  In_59  => In_59,  In_60  => In_60,
      In_61  => In_61,  In_62  => In_62,  In_63  => In_63,  In_64  => In_64,  In_65  => In_65,  In_66  => In_66,  In_67  => In_67,  In_68  => In_68,  In_69  => In_69,  In_70  => In_70,
      In_71  => In_71,  In_72  => In_72,  In_73  => In_73,  In_74  => In_74,  In_75  => In_75,  In_76  => In_76,  In_77  => In_77,  In_78  => In_78,  In_79  => In_79,  In_80  => In_80,
      In_81  => In_81,  In_82  => In_82,  In_83  => In_83,  In_84  => In_84,  In_85  => In_85,  In_86  => In_86,  In_87  => In_87,  In_88  => In_88,  In_89  => In_89,  In_90  => In_90,
      In_91  => In_91,  In_92  => In_92,  In_93  => In_93,  In_94  => In_94,  In_95  => In_95,  In_96  => In_96,  In_97  => In_97,  In_98  => In_98,  In_99  => In_99,  In_100 => In_100,
      In_101 => In_101, In_102 => In_102, In_103 => In_103, In_104 => In_104, In_105 => In_105, In_106 => In_106, In_107 => In_107, In_108 => In_108, In_109 => In_109, In_110 => In_110,
      In_111 => In_111, In_112 => In_112, In_113 => In_113, In_114 => In_114, In_115 => In_115, In_116 => In_116, In_117 => In_117, In_118 => In_118, In_119 => In_119, In_120 => In_120,
      In_121 => In_121, In_122 => In_122, In_123 => In_123, In_124 => In_124, In_125 => In_125, In_126 => In_126, In_127 => In_127, In_128 => In_128, In_129 => In_129, In_130 => In_130,
      In_131 => In_131, In_132 => In_132, In_133 => In_133, In_134 => In_134, In_135 => In_135, In_136 => In_136, In_137 => In_137, In_138 => In_138, In_139 => In_139, In_140 => In_140,
      In_141 => In_141, In_142 => In_142, In_143 => In_143, In_144 => In_144, In_145 => In_145, In_146 => In_146, In_147 => In_147, In_148 => In_148, In_149 => In_149, In_150 => In_150,
      In_151 => In_151, In_152 => In_152, In_153 => In_153, In_154 => In_154, In_155 => In_155, In_156 => In_156, In_157 => In_157, In_158 => In_158, In_159 => In_159, In_160 => In_160,
      In_161 => In_161, In_162 => In_162, In_163 => In_163, In_164 => In_164, In_165 => In_165, In_166 => In_166, In_167 => In_167, In_168 => In_168, In_169 => In_169, In_170 => In_170,
      In_171 => In_171, In_172 => In_172, In_173 => In_173, In_174 => In_174, In_175 => In_175, In_176 => In_176, In_177 => In_177, In_178 => In_178, In_179 => In_179, In_180 => In_180,
      In_181 => In_181, In_182 => In_182, In_183 => In_183, In_184 => In_184, In_185 => In_185, In_186 => In_186, In_187 => In_187, In_188 => In_188, In_189 => In_189, In_190 => In_190,
      In_191 => In_191, In_192 => In_192, In_193 => In_193, In_194 => In_194, In_195 => In_195, In_196 => In_196, In_197 => In_197, In_198 => In_198, In_199 => In_199, In_200 => In_200,

      Thre => Thre,

      CMF_o1   => CMF_o1,   CMF_o2   => CMF_o2,   CMF_o3   => CMF_o3,   CMF_o4   => CMF_o4,   CMF_o5   => CMF_o5,   CMF_o6   => CMF_o6,   CMF_o7   => CMF_o7,   CMF_o8   => CMF_o8,   CMF_o9   => CMF_o9,   CMF_o10  => CMF_o10,
      CMF_o11  => CMF_o11,  CMF_o12  => CMF_o12,  CMF_o13  => CMF_o13,  CMF_o14  => CMF_o14,  CMF_o15  => CMF_o15,  CMF_o16  => CMF_o16,  CMF_o17  => CMF_o17,  CMF_o18  => CMF_o18,  CMF_o19  => CMF_o19,  CMF_o20  => CMF_o20,
      CMF_o21  => CMF_o21,  CMF_o22  => CMF_o22,  CMF_o23  => CMF_o23,  CMF_o24  => CMF_o24,  CMF_o25  => CMF_o25,  CMF_o26  => CMF_o26,  CMF_o27  => CMF_o27,  CMF_o28  => CMF_o28,  CMF_o29  => CMF_o29,  CMF_o30  => CMF_o30,
      CMF_o31  => CMF_o31,  CMF_o32  => CMF_o32,  CMF_o33  => CMF_o33,  CMF_o34  => CMF_o34,  CMF_o35  => CMF_o35,  CMF_o36  => CMF_o36,  CMF_o37  => CMF_o37,  CMF_o38  => CMF_o38,  CMF_o39  => CMF_o39,  CMF_o40  => CMF_o40,
      CMF_o41  => CMF_o41,  CMF_o42  => CMF_o42,  CMF_o43  => CMF_o43,  CMF_o44  => CMF_o44,  CMF_o45  => CMF_o45,  CMF_o46  => CMF_o46,  CMF_o47  => CMF_o47,  CMF_o48  => CMF_o48,  CMF_o49  => CMF_o49,  CMF_o50  => CMF_o50,
      CMF_o51  => CMF_o51,  CMF_o52  => CMF_o52,  CMF_o53  => CMF_o53,  CMF_o54  => CMF_o54,  CMF_o55  => CMF_o55,  CMF_o56  => CMF_o56,  CMF_o57  => CMF_o57,  CMF_o58  => CMF_o58,  CMF_o59  => CMF_o59,  CMF_o60  => CMF_o60,
      CMF_o61  => CMF_o61,  CMF_o62  => CMF_o62,  CMF_o63  => CMF_o63,  CMF_o64  => CMF_o64,  CMF_o65  => CMF_o65,  CMF_o66  => CMF_o66,  CMF_o67  => CMF_o67,  CMF_o68  => CMF_o68,  CMF_o69  => CMF_o69,  CMF_o70  => CMF_o70,
      CMF_o71  => CMF_o71,  CMF_o72  => CMF_o72,  CMF_o73  => CMF_o73,  CMF_o74  => CMF_o74,  CMF_o75  => CMF_o75,  CMF_o76  => CMF_o76,  CMF_o77  => CMF_o77,  CMF_o78  => CMF_o78,  CMF_o79  => CMF_o79,  CMF_o80  => CMF_o80,
      CMF_o81  => CMF_o81,  CMF_o82  => CMF_o82,  CMF_o83  => CMF_o83,  CMF_o84  => CMF_o84,  CMF_o85  => CMF_o85,  CMF_o86  => CMF_o86,  CMF_o87  => CMF_o87,  CMF_o88  => CMF_o88,  CMF_o89  => CMF_o89,  CMF_o90  => CMF_o90,
      CMF_o91  => CMF_o91,  CMF_o92  => CMF_o92,  CMF_o93  => CMF_o93,  CMF_o94  => CMF_o94,  CMF_o95  => CMF_o95,  CMF_o96  => CMF_o96,  CMF_o97  => CMF_o97,  CMF_o98  => CMF_o98,  CMF_o99  => CMF_o99,  CMF_o100 => CMF_o100,
      CMF_o101 => CMF_o101, CMF_o102 => CMF_o102, CMF_o103 => CMF_o103, CMF_o104 => CMF_o104, CMF_o105 => CMF_o105, CMF_o106 => CMF_o106, CMF_o107 => CMF_o107, CMF_o108 => CMF_o108, CMF_o109 => CMF_o109, CMF_o110 => CMF_o110,
      CMF_o111 => CMF_o111, CMF_o112 => CMF_o112, CMF_o113 => CMF_o113, CMF_o114 => CMF_o114, CMF_o115 => CMF_o115, CMF_o116 => CMF_o116, CMF_o117 => CMF_o117, CMF_o118 => CMF_o118, CMF_o119 => CMF_o119, CMF_o120 => CMF_o120,
      CMF_o121 => CMF_o121, CMF_o122 => CMF_o122, CMF_o123 => CMF_o123, CMF_o124 => CMF_o124, CMF_o125 => CMF_o125, CMF_o126 => CMF_o126, CMF_o127 => CMF_o127, CMF_o128 => CMF_o128, CMF_o129 => CMF_o129, CMF_o130 => CMF_o130,
      CMF_o131 => CMF_o131, CMF_o132 => CMF_o132, CMF_o133 => CMF_o133, CMF_o134 => CMF_o134, CMF_o135 => CMF_o135, CMF_o136 => CMF_o136, CMF_o137 => CMF_o137, CMF_o138 => CMF_o138, CMF_o139 => CMF_o139, CMF_o140 => CMF_o140,
      CMF_o141 => CMF_o141, CMF_o142 => CMF_o142, CMF_o143 => CMF_o143, CMF_o144 => CMF_o144, CMF_o145 => CMF_o145, CMF_o146 => CMF_o146, CMF_o147 => CMF_o147, CMF_o148 => CMF_o148, CMF_o149 => CMF_o149, CMF_o150 => CMF_o150,
      CMF_o151 => CMF_o151, CMF_o152 => CMF_o152, CMF_o153 => CMF_o153, CMF_o154 => CMF_o154, CMF_o155 => CMF_o155, CMF_o156 => CMF_o156, CMF_o157 => CMF_o157, CMF_o158 => CMF_o158, CMF_o159 => CMF_o159, CMF_o160 => CMF_o160,
      CMF_o161 => CMF_o161, CMF_o162 => CMF_o162, CMF_o163 => CMF_o163, CMF_o164 => CMF_o164, CMF_o165 => CMF_o165, CMF_o166 => CMF_o166, CMF_o167 => CMF_o167, CMF_o168 => CMF_o168, CMF_o169 => CMF_o169, CMF_o170 => CMF_o170,
      CMF_o171 => CMF_o171, CMF_o172 => CMF_o172, CMF_o173 => CMF_o173, CMF_o174 => CMF_o174, CMF_o175 => CMF_o175, CMF_o176 => CMF_o176, CMF_o177 => CMF_o177, CMF_o178 => CMF_o178, CMF_o179 => CMF_o179, CMF_o180 => CMF_o180,
      CMF_o181 => CMF_o181, CMF_o182 => CMF_o182, CMF_o183 => CMF_o183, CMF_o184 => CMF_o184, CMF_o185 => CMF_o185, CMF_o186 => CMF_o186, CMF_o187 => CMF_o187, CMF_o188 => CMF_o188, CMF_o189 => CMF_o189, CMF_o190 => CMF_o190,
      CMF_o191 => CMF_o191, CMF_o192 => CMF_o192, CMF_o193 => CMF_o193, CMF_o194 => CMF_o194, CMF_o195 => CMF_o195, CMF_o196 => CMF_o196, CMF_o197 => CMF_o197, CMF_o198 => CMF_o198, CMF_o199 => CMF_o199, CMF_o200 => CMF_o200
      );

  -- clk generate
  Hiclk <= not Hiclk after (Hiclk_PERIOD / 2.0);

  
  -- In generate
  process
  begin
    Clock <= '1';
    Thre <= "00100000000";
    In_1 <= "0000000000";
    In_2 <= "0000000000";
    In_3 <= "0000000000";
    In_4 <= "0000000000";
    In_5 <= "0000000000";
    In_6 <= "0000000000";
    In_7 <= "0000000000";
    In_8 <= "0000000000";
    In_9 <= "0000000000";
    In_10 <= "0000000000";

    In_11 <= "0000000000";
    In_12 <= "0000000000";
    In_13 <= "0000000000";
    In_14 <= "0000000000";
    In_15 <= "0000000000";
    In_16 <= "0000000000";
    In_17 <= "0000000000";
    In_18 <= "0000000000";
    In_19 <= "0000000000";
    In_20 <= "0000000000";

    In_21 <= "0000000000";
    In_22 <= "0000000000";
    In_23 <= "0000000000";
    In_24 <= "0000000000";
    In_25 <= "0000000000";
    In_26 <= "0000000000";
    In_27 <= "0000000000";
    In_28 <= "0000000000";
    In_29 <= "0000000000";
    In_30 <= "0000000000";

    In_31 <= "0000000000";
    In_32 <= "0000000000";
    In_33 <= "0000000000";
    In_34 <= "0000000000";
    In_35 <= "0000000000";
    In_36 <= "0000000000";
    In_37 <= "0000000000";
    In_38 <= "0000000000";
    In_39 <= "0000000000";
    In_40 <= "0000000000";

    In_41 <= "0000000000";
    In_42 <= "0000000000";
    In_43 <= "0000000000";
    In_44 <= "0000000000";
    In_45 <= "0000000000";
    In_46 <= "0000000000";
    In_47 <= "0000000000";
    In_48 <= "0000000000";
    In_49 <= "0000000000";
    In_50 <= "0000000000";

    In_51 <= "0000000000";
    In_52 <= "0000000000";
    In_53 <= "0000000000";
    In_54 <= "0000000000";
    In_55 <= "0000000000";
    In_56 <= "0000000000";
    In_57 <= "0000000000";
    In_58 <= "0000000000";
    In_59 <= "0000000000";
    In_60 <= "0000000000";

    In_61 <= "0000000000";
    In_62 <= "0000000000";
    In_63 <= "0000000000";
    In_64 <= "0000000000";
    In_65 <= "0000000000";
    In_66 <= "0000000000";
    In_67 <= "0000000000";
    In_68 <= "0000000000";
    In_69 <= "0000000000";
    In_70 <= "0000000000";

    In_71 <= "0000000000";
    In_72 <= "0000000000";
    In_73 <= "0000000000";
    In_74 <= "0000000000";
    In_75 <= "0000000000";
    In_76 <= "0000000000";
    In_77 <= "0000000000";
    In_78 <= "0000000000";
    In_79 <= "0000000000";
    In_80 <= "0000000000";

    In_81 <= "0000000000";
    In_82 <= "0000000000";
    In_83 <= "0000000000";
    In_84 <= "0000000000";
    In_85 <= "0000000000";
    In_86 <= "0000000000";
    In_87 <= "0000000000";
    In_88 <= "0000000000";
    In_89 <= "0000000000";
    In_90 <= "0000000000";

    In_91 <= "0000000000";
    In_92 <= "0000000000";
    In_93 <= "0000000000";
    In_94 <= "0000000000";
    In_95 <= "0000000000";
    In_96 <= "0000000000";
    In_97 <= "0000000000";
    In_98 <= "0000000000";
    In_99 <= "0000000000";
    In_100 <= "0000000000";

    In_101 <= "0000000000";
    In_102 <= "0000000000";
    In_103 <= "0000000000";
    In_104 <= "0000000000";
    In_105 <= "0000000000";
    In_106 <= "0000000000";
    In_107 <= "0000000000";
    In_108 <= "0000000000";
    In_109 <= "0000000000";
    In_110 <= "0000000000";

    In_111 <= "0000000000";
    In_112 <= "0000000000";
    In_113 <= "0000000000";
    In_114 <= "0000000000";
    In_115 <= "0000000000";
    In_116 <= "0000000000";
    In_117 <= "0000000000";
    In_118 <= "0000000000";
    In_119 <= "0000000000";
    In_120 <= "0000000000";

    In_121 <= "0000000000";
    In_122 <= "0000000000";
    In_123 <= "0000000000";
    In_124 <= "0000000000";
    In_125 <= "0000000000";
    In_126 <= "0000000000";
    In_127 <= "0000000000";
    In_128 <= "0000000000";
    In_129 <= "0000000000";
    In_130 <= "0000000000";

    In_131 <= "0000000000";
    In_132 <= "0000000000";
    In_133 <= "0000000000";
    In_134 <= "0000000000";
    In_135 <= "0000000000";
    In_136 <= "0000000000";
    In_137 <= "0000000000";
    In_138 <= "0000000000";
    In_139 <= "0000000000";
    In_140 <= "0000000000";

    In_141 <= "0000000000";
    In_142 <= "0000000000";
    In_143 <= "0000000000";
    In_144 <= "0000000000";
    In_145 <= "0000000000";
    In_146 <= "0000000000";
    In_147 <= "0000000000";
    In_148 <= "0000000000";
    In_149 <= "0000000000";
    In_150 <= "0000000000";

    In_151 <= "0000000000";
    In_152 <= "0000000000";
    In_153 <= "0000000000";
    In_154 <= "0000000000";
    In_155 <= "0000000000";
    In_156 <= "0000000000";
    In_157 <= "0000000000";
    In_158 <= "0000000000";
    In_159 <= "0000000000";
    In_160 <= "0000000000";

    In_161 <= "0000000000";
    In_162 <= "0000000000";
    In_163 <= "0000000000";
    In_164 <= "0000000000";
    In_165 <= "0000000000";
    In_166 <= "0000000000";
    In_167 <= "0000000000";
    In_168 <= "0000000000";
    In_169 <= "0000000000";
    In_170 <= "0000000000";

    In_171 <= "0000000000";
    In_172 <= "0000000000";
    In_173 <= "0000000000";
    In_174 <= "0000000000";
    In_175 <= "0000000000";
    In_176 <= "0000000000";
    In_177 <= "0000000000";
    In_178 <= "0000000000";
    In_179 <= "0000000000";
    In_180 <= "0000000000";

    In_181 <= "0000000000";
    In_182 <= "0000000000";
    In_183 <= "0000000000";
    In_184 <= "0000000000";
    In_185 <= "0000000000";
    In_186 <= "0000000000";
    In_187 <= "0000000000";
    In_188 <= "0000000000";
    In_189 <= "0000000000";
    In_190 <= "0000000000";

    In_191 <= "0000000000";
    In_192 <= "0000000000";
    In_193 <= "0000000000";
    In_194 <= "0000000000";
    In_195 <= "0000000000";
    In_196 <= "0000000000";
    In_197 <= "0000000000";
    In_198 <= "0000000000";
    In_199 <= "0000000000";
    In_200 <= "0000000000";

    wait for 5 ns;
    Clock <= '0';
    --wait for (start_PERIOD - 10 ns);

    wait for 395 ns;
    Clock <= '1';
    In_1 <= "0001100100";
    In_2 <= "0001100100";
    In_3 <= "0001100100";
    In_4 <= "0001100100";
    In_5 <= "0001100100";
    In_6 <= "0001100100";
    In_7 <= "0001100100";
    In_8 <= "0001100100";
    In_9 <= "0001100100";
    In_10 <= "0001100100";

    In_11 <= "0001100100";
    In_12 <= "0001100100";
    In_13 <= "0001100100";
    In_14 <= "0001100100";
    In_15 <= "0001100100";
    In_16 <= "0001100100";
    In_17 <= "0001100100";
    In_18 <= "0001100100";
    In_19 <= "0001100100";
    In_20 <= "0001100100";

    In_21 <= "0001100100";
    In_22 <= "0001100100";
    In_23 <= "0001100100";
    In_24 <= "0001100100";
    In_25 <= "0001100100";
    In_26 <= "0001100100";
    In_27 <= "0001100100";
    In_28 <= "0001100100";
    In_29 <= "0001100100";
    In_30 <= "0001100100";

    In_31 <= "0001100100";
    In_32 <= "0001100100";
    In_33 <= "0001100100";
    In_34 <= "0001100100";
    In_35 <= "0001100100";
    In_36 <= "0001100100";
    In_37 <= "0001100100";
    In_38 <= "0001100100";
    In_39 <= "0001100100";
    In_40 <= "0001100100";

    In_41 <= "0001100100";
    In_42 <= "0001100100";
    In_43 <= "0001100100";
    In_44 <= "0001100100";
    In_45 <= "0001100100";
    In_46 <= "0001100100";
    In_47 <= "0001100100";
    In_48 <= "0001100100";
    In_49 <= "0001100100";
    In_50 <= "0001100100";

    In_51 <= "0001100100";
    In_52 <= "0001100100";
    In_53 <= "0001100100";
    In_54 <= "0001100100";
    In_55 <= "0001100100";
    In_56 <= "0001100100";
    In_57 <= "0001100100";
    In_58 <= "0001100100";
    In_59 <= "0001100100";
    In_60 <= "0001100100";

    In_61 <= "0001100100";
    In_62 <= "0001100100";
    In_63 <= "0001100100";
    In_64 <= "0001100100";
    In_65 <= "0001100100";
    In_66 <= "0001100100";
    In_67 <= "0001100100";
    In_68 <= "0001100100";
    In_69 <= "0001100100";
    In_70 <= "0001100100";

    In_71 <= "0001100100";
    In_72 <= "0001100100";
    In_73 <= "0001100100";
    In_74 <= "0001100100";
    In_75 <= "0001100100";
    In_76 <= "0001100100";
    In_77 <= "0001100100";
    In_78 <= "0001100100";
    In_79 <= "0001100100";
    In_80 <= "0001100100";

    In_81 <= "0001100100";
    In_82 <= "0001100100";
    In_83 <= "0001100100";
    In_84 <= "0001100100";
    In_85 <= "0001100100";
    In_86 <= "0001100100";
    In_87 <= "0001100100";
    In_88 <= "0001100100";
    In_89 <= "0001100100";
    In_90 <= "0001100100";

    In_91 <= "0001100100";
    In_92 <= "0001100100";
    In_93 <= "0001100100";
    In_94 <= "0001100100";
    In_95 <= "0001100100";
    In_96 <= "0001100100";
    In_97 <= "0001100100";
    In_98 <= "0001100100";
    In_99 <= "0001100100";
    In_100 <= "0001100100";

    In_101 <= "0001100100";
    In_102 <= "0001100100";
    In_103 <= "0001100100";
    In_104 <= "0001100100";
    In_105 <= "0001100100";
    In_106 <= "0001100100";
    In_107 <= "0001100100";
    In_108 <= "0001100100";
    In_109 <= "0001100100";
    In_110 <= "0001100100";

    In_111 <= "0001100100";
    In_112 <= "0001100100";
    In_113 <= "0001100100";
    In_114 <= "0001100100";
    In_115 <= "0001100100";
    In_116 <= "0001100100";
    In_117 <= "0001100100";
    In_118 <= "0001100100";
    In_119 <= "0001100100";
    In_120 <= "0001100100";

    In_121 <= "0001100100";
    In_122 <= "0001100100";
    In_123 <= "0001100100";
    In_124 <= "0001100100";
    In_125 <= "0001100100";
    In_126 <= "0001100100";
    In_127 <= "0001100100";
    In_128 <= "0001100100";
    In_129 <= "0001100100";
    In_130 <= "0001100100";

    In_131 <= "0001100100";
    In_132 <= "0001100100";
    In_133 <= "0001100100";
    In_134 <= "0001100100";
    In_135 <= "0001100100";
    In_136 <= "0001100100";
    In_137 <= "0001100100";
    In_138 <= "0001100100";
    In_139 <= "0001100100";
    In_140 <= "0001100100";

    In_141 <= "0001100100";
    In_142 <= "0001100100";
    In_143 <= "0001100100";
    In_144 <= "0001100100";
    In_145 <= "0001100100";
    In_146 <= "0001100100";
    In_147 <= "0001100100";
    In_148 <= "0001100100";
    In_149 <= "0001100100";
    In_150 <= "0001100100";

    In_151 <= "0001100100";
    In_152 <= "0001100100";
    In_153 <= "0001100100";
    In_154 <= "0001100100";
    In_155 <= "0001100100";
    In_156 <= "0001100100";
    In_157 <= "0001100100";
    In_158 <= "0001100100";
    In_159 <= "0001100100";
    In_160 <= "0001100100";

    In_161 <= "0001100100";
    In_162 <= "0001100100";
    In_163 <= "0001100100";
    In_164 <= "0001100100";
    In_165 <= "0001100100";
    In_166 <= "0001100100";
    In_167 <= "0001100100";
    In_168 <= "0001100100";
    In_169 <= "0001100100";
    In_170 <= "0001100100";

    In_171 <= "0001100100";
    In_172 <= "0001100100";
    In_173 <= "0001100100";
    In_174 <= "0001100100";
    In_175 <= "0001100100";
    In_176 <= "0001100100";
    In_177 <= "0001100100";
    In_178 <= "0001100100";
    In_179 <= "0001100100";
    In_180 <= "0001100100";

    In_181 <= "0001100100";
    In_182 <= "0001100100";
    In_183 <= "0001100100";
    In_184 <= "0001100100";
    In_185 <= "0001100100";
    In_186 <= "0001100100";
    In_187 <= "0001100100";
    In_188 <= "0001100100";
    In_189 <= "0001100100";
    In_190 <= "0001100100";

    In_191 <= "0001100100";
    In_192 <= "0001100100";
    In_193 <= "0001100100";
    In_194 <= "0001100100";
    In_195 <= "0001100100";
    In_196 <= "0001100100";
    In_197 <= "0001100100";
    In_198 <= "0001100100";
    In_199 <= "0001100100";
    In_200 <= "0001100100";


    wait for 5 ns;
    Clock <= '0';

    wait for 395 ns;
    Clock <= '1';
    
    wait for 5 ns;
    Clock <= '0';
    
    wait;
  end process;
  
end behavioral;
