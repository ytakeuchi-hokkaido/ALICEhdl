library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Common_mode_filter is
	
	generic
	(
		In_width 		:natural := 10;
		Out_width 		:natural := 13;
		sel_width 		:natural := 6;
		SUM_width 		:natural := 18;
		cont_width		:natural := 9;
                count_max               :natural := 40;
		contri_width	:natural := 9;
		average_width	:natural := 12;
		LT_add_width 	:natural := 4;
		Add_width		:natural := 13
	);
	
	port 
	(
	Clock, Hiclk																							:in std_logic;
	In_1, In_2, In_3, In_4, In_5, In_6, In_7, In_8, In_9, In_10 							:in  unsigned((In_width-1) downto 0);
	In_11, In_12, In_13, In_14, In_15, In_16, In_17, In_18, In_19, In_20 				:in  unsigned((In_width-1) downto 0);
	In_21, In_22, In_23, In_24, In_25, In_26, In_27, In_28, In_29, In_30 				:in  unsigned((In_width-1) downto 0);
	In_31, In_32, In_33, In_34, In_35, In_36, In_37, In_38, In_39, In_40 				:in  unsigned((In_width-1) downto 0);
	In_41, In_42, In_43, In_44, In_45, In_46, In_47, In_48, In_49, In_50					:in  unsigned((In_width-1) downto 0); 
	In_51, In_52, In_53, In_54, In_55, In_56, In_57, In_58, In_59, In_60 				:in  unsigned((In_width-1) downto 0);
	In_61, In_62, In_63, In_64, In_65, In_66, In_67, In_68, In_69, In_70 				:in  unsigned((In_width-1) downto 0);
	In_71, In_72, In_73, In_74, In_75, In_76, In_77, In_78, In_79, In_80 				:in  unsigned((In_width-1) downto 0);
	In_81, In_82, In_83, In_84, In_85, In_86, In_87, In_88, In_89, In_90 				:in  unsigned((In_width-1) downto 0);
	In_91, In_92, In_93, In_94, In_95, In_96, In_97, In_98, In_99, In_100 				:in  unsigned((In_width-1) downto 0);
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
	Thre										:in signed(In_width downto 0);
	CMF_o1, CMF_o2, CMF_o3, CMF_o4, CMF_o5, CMF_o6, CMF_o7, CMF_o8, CMF_o9, CMF_o10 			:out  signed((Out_width-1) downto 0);
	CMF_o11, CMF_o12, CMF_o13, CMF_o14, CMF_o15, CMF_o16, CMF_o17, CMF_o18, CMF_o19, CMF_o20 		:out  signed((Out_width-1) downto 0);
	CMF_o21, CMF_o22, CMF_o23, CMF_o24, CMF_o25, CMF_o26, CMF_o27, CMF_o28, CMF_o29, CMF_o30 		:out  signed((Out_width-1) downto 0);
	CMF_o31, CMF_o32, CMF_o33, CMF_o34, CMF_o35, CMF_o36, CMF_o37, CMF_o38, CMF_o39, CMF_o40 		:out  signed((Out_width-1) downto 0);
	CMF_o41, CMF_o42, CMF_o43, CMF_o44, CMF_o45, CMF_o46, CMF_o47, CMF_o48, CMF_o49, CMF_o50		:out  signed((Out_width-1) downto 0); 
	CMF_o51, CMF_o52, CMF_o53, CMF_o54, CMF_o55, CMF_o56, CMF_o57, CMF_o58, CMF_o59, CMF_o60 		:out  signed((Out_width-1) downto 0);
	CMF_o61, CMF_o62, CMF_o63, CMF_o64, CMF_o65, CMF_o66, CMF_o67, CMF_o68, CMF_o69, CMF_o70 		:out  signed((Out_width-1) downto 0);
	CMF_o71, CMF_o72, CMF_o73, CMF_o74, CMF_o75, CMF_o76, CMF_o77, CMF_o78, CMF_o79, CMF_o80 		:out  signed((Out_width-1) downto 0);
	CMF_o81, CMF_o82, CMF_o83, CMF_o84, CMF_o85, CMF_o86, CMF_o87, CMF_o88, CMF_o89, CMF_o90 		:out  signed((Out_width-1) downto 0);
	CMF_o91, CMF_o92, CMF_o93, CMF_o94, CMF_o95, CMF_o96, CMF_o97, CMF_o98, CMF_o99, CMF_o100 	:out  signed((Out_width-1) downto 0);
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
	
end entity;

architecture rtl of Common_mode_filter is

-- In_MUX
component MUX_all port 
	(

          Clock																										:in std_logic;
          In_1, In_2, In_3, In_4, In_5, In_6, In_7, In_8, In_9, In_10 							:in  unsigned((In_width-1) downto 0);
          In_11, In_12, In_13, In_14, In_15, In_16, In_17, In_18, In_19, In_20 				:in  unsigned((In_width-1) downto 0);
          In_21, In_22, In_23, In_24, In_25, In_26, In_27, In_28, In_29, In_30 				:in  unsigned((In_width-1) downto 0);

          In_31, In_32, In_33, In_34, In_35, In_36, In_37, In_38, In_39, In_40 				:in  unsigned((In_width-1) downto 0);

          In_41, In_42, In_43, In_44, In_45, In_46, In_47, In_48, In_49, In_50					:in  unsigned((In_width-1) downto 0); 

          In_51, In_52, In_53, In_54, In_55, In_56, In_57, In_58, In_59, In_60 				:in  unsigned((In_width-1) downto 0);

          In_61, In_62, In_63, In_64, In_65, In_66, In_67, In_68, In_69, In_70 				:in  unsigned((In_width-1) downto 0);

          In_71, In_72, In_73, In_74, In_75, In_76, In_77, In_78, In_79, In_80 				:in  unsigned((In_width-1) downto 0);

          In_81, In_82, In_83, In_84, In_85, In_86, In_87, In_88, In_89, In_90 				:in  unsigned((In_width-1) downto 0);

          In_91, In_92, In_93, In_94, In_95, In_96, In_97, In_98, In_99, In_100 				:in  unsigned((In_width-1) downto 0);

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

          sel										:in unsigned((sel_width-1) downto 0);

          multi_o1, multi_o2, multi_o3, multi_o4, multi_o5 				:out unsigned((In_width-1) downto 0)
          );
end component;
signal multi_o1, multi_o2, multi_o3, multi_o4, multi_o5 :unsigned((In_width-1) downto 0);
-- In_MUX

-- N-ch Adder
component N_ch_adder port 
	(

          Hiclk, reset 													:in std_logic;

          multi_o1, multi_o2, multi_o3, multi_o4, multi_o5 	:in unsigned((In_width-1) downto 0);

          delay_o1, delay_o2, delay_o3, delay_o4, delay_o5	:in unsigned((In_width-1) downto 0);

          Thre																:in signed(In_width downto 0);

          SUM																:out unsigned((SUM_width-1) downto 0);

          contribute   													:out unsigned ((contri_width-1) downto 0)
	);
end component;
signal  SUM:unsigned((SUM_width-1) downto 0);
signal  contribute  :unsigned ((contri_width-1) downto 0);
signal  average :unsigned((average_width-1) downto 0);
-- N-ch Adder


-- controller
component Controller port 
	(

          Clock, Hiclk 	:in std_logic;
          sel				:out unsigned((sel_width-1) downto 0);
          reset				:out std_logic
	);
end component;
signal reset	:std_logic;
signal sel		:unsigned((sel_width-1) downto 0);
-- controller

-- delay_multi
component D_MUX_all port 
	(
	Clock, Hiclk									:in std_logic;
	In_1, In_2, In_3, In_4, In_5, In_6, In_7, In_8, In_9, In_10 			:in  unsigned((In_width-1) downto 0);
	In_11, In_12, In_13, In_14, In_15, In_16, In_17, In_18, In_19, In_20 		:in  unsigned((In_width-1) downto 0);
	In_21, In_22, In_23, In_24, In_25, In_26, In_27, In_28, In_29, In_30 		:in  unsigned((In_width-1) downto 0);
	In_31, In_32, In_33, In_34, In_35, In_36, In_37, In_38, In_39, In_40 		:in  unsigned((In_width-1) downto 0);
	In_41, In_42, In_43, In_44, In_45, In_46, In_47, In_48, In_49, In_50		:in  unsigned((In_width-1) downto 0); 
	In_51, In_52, In_53, In_54, In_55, In_56, In_57, In_58, In_59, In_60 		:in  unsigned((In_width-1) downto 0);
	In_61, In_62, In_63, In_64, In_65, In_66, In_67, In_68, In_69, In_70 		:in  unsigned((In_width-1) downto 0);
	In_71, In_72, In_73, In_74, In_75, In_76, In_77, In_78, In_79, In_80 		:in  unsigned((In_width-1) downto 0);
	In_81, In_82, In_83, In_84, In_85, In_86, In_87, In_88, In_89, In_90 		:in  unsigned((In_width-1) downto 0);
	In_91, In_92, In_93, In_94, In_95, In_96, In_97, In_98, In_99, In_100 		:in  unsigned((In_width-1) downto 0);
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
	sel										:in unsigned((sel_width-1) downto 0);
      	delay_o1, delay_o2, delay_o3, delay_o4, delay_o5				:out unsigned((In_width-1) downto 0)
	);
end component;
signal delay_o1, delay_o2, delay_o3, delay_o4, delay_o5	:unsigned((In_width-1) downto 0);
-- delay_multi

-- Divider
component Divider port 
	(
		SUM	   	:in unsigned  ((SUM_width-1) downto 0);
		contribute	:in unsigned  ((contri_width-1) downto 0);
		average 		:out unsigned ((average_width-1) downto 0)
	);
end component;
signal resultD:unsigned(((SUM_width+1)) downto 0);

-- Divider

-- D-flip flop
component D_ffs port 
	(
	Clock											:in std_logic;
	In_1, In_2, In_3, In_4, In_5, In_6, In_7, In_8, In_9, In_10 				:in  unsigned((In_width-1) downto 0);
	In_11, In_12, In_13, In_14, In_15, In_16, In_17, In_18, In_19, In_20 			:in  unsigned((In_width-1) downto 0);
	In_21, In_22, In_23, In_24, In_25, In_26, In_27, In_28, In_29, In_30 			:in  unsigned((In_width-1) downto 0);
	In_31, In_32, In_33, In_34, In_35, In_36, In_37, In_38, In_39, In_40 			:in  unsigned((In_width-1) downto 0);
	In_41, In_42, In_43, In_44, In_45, In_46, In_47, In_48, In_49, In_50			:in  unsigned((In_width-1) downto 0); 
	In_51, In_52, In_53, In_54, In_55, In_56, In_57, In_58, In_59, In_60 			:in  unsigned((In_width-1) downto 0);
	In_61, In_62, In_63, In_64, In_65, In_66, In_67, In_68, In_69, In_70 			:in  unsigned((In_width-1) downto 0);
	In_71, In_72, In_73, In_74, In_75, In_76, In_77, In_78, In_79, In_80 			:in  unsigned((In_width-1) downto 0);
	In_81, In_82, In_83, In_84, In_85, In_86, In_87, In_88, In_89, In_90 			:in  unsigned((In_width-1) downto 0);
	In_91, In_92, In_93, In_94, In_95, In_96, In_97, In_98, In_99, In_100 			:in  unsigned((In_width-1) downto 0);
	In_101, In_102, In_103, In_104, In_105, In_106, In_107, In_108, In_109, In_110	        :in  unsigned((In_width-1) downto 0); 
	In_111, In_112, In_113, In_114, In_115, In_116, In_117, In_118, In_119, In_120 	        :in  unsigned((In_width-1) downto 0);
	In_121, In_122, In_123, In_124, In_125, In_126, In_127, In_128, In_129, In_130 	        :in  unsigned((In_width-1) downto 0);
	In_131, In_132, In_133, In_134, In_135, In_136, In_137, In_138, In_139, In_140 	        :in  unsigned((In_width-1) downto 0);
	In_141, In_142, In_143, In_144, In_145, In_146, In_147, In_148, In_149, In_150 	        :in  unsigned((In_width-1) downto 0);
	In_151, In_152, In_153, In_154, In_155, In_156, In_157, In_158, In_159, In_160 	        :in  unsigned((In_width-1) downto 0);
	In_161, In_162, In_163, In_164, In_165, In_166, In_167, In_168, In_169, In_170 	        :in  unsigned((In_width-1) downto 0);
	In_171, In_172, In_173, In_174, In_175, In_176, In_177, In_178, In_179, In_180 	        :in  unsigned((In_width-1) downto 0);
	In_181, In_182, In_183, In_184, In_185, In_186, In_187, In_188, In_189, In_190 	        :in  unsigned((In_width-1) downto 0);
	In_191, In_192, In_193, In_194, In_195, In_196, In_197, In_198, In_199, In_200 	        :in  unsigned((In_width-1) downto 0);
        Df_o1, Df_o2, Df_o3, Df_o4, Df_o5, Df_o6, Df_o7, Df_o8, Df_o9, Df_o10 			:out  unsigned((In_width-1) downto 0);
	Df_o11, Df_o12, Df_o13, Df_o14, Df_o15, Df_o16, Df_o17, Df_o18, Df_o19, Df_o20 		:out  unsigned((In_width-1) downto 0);
	Df_o21, Df_o22, Df_o23, Df_o24, Df_o25, Df_o26, Df_o27, Df_o28, Df_o29, Df_o30 		:out  unsigned((In_width-1) downto 0);
	Df_o31, Df_o32, Df_o33, Df_o34, Df_o35, Df_o36, Df_o37, Df_o38, Df_o39, Df_o40 		:out  unsigned((In_width-1) downto 0);
	Df_o41, Df_o42, Df_o43, Df_o44, Df_o45, Df_o46, Df_o47, Df_o48, Df_o49, Df_o50		:out  unsigned((In_width-1) downto 0); 
	Df_o51, Df_o52, Df_o53, Df_o54, Df_o55, Df_o56, Df_o57, Df_o58, Df_o59, Df_o60 		:out  unsigned((In_width-1) downto 0);
	Df_o61, Df_o62, Df_o63, Df_o64, Df_o65, Df_o66, Df_o67, Df_o68, Df_o69, Df_o70 		:out  unsigned((In_width-1) downto 0);
	Df_o71, Df_o72, Df_o73, Df_o74, Df_o75, Df_o76, Df_o77, Df_o78, Df_o79, Df_o80 		:out  unsigned((In_width-1) downto 0);
	Df_o81, Df_o82, Df_o83, Df_o84, Df_o85, Df_o86, Df_o87, Df_o88, Df_o89, Df_o90 		:out  unsigned((In_width-1) downto 0);
	Df_o91, Df_o92, Df_o93, Df_o94, Df_o95, Df_o96, Df_o97, Df_o98, Df_o99, Df_o100 	:out  unsigned((In_width-1) downto 0);
	Df_o101, Df_o102, Df_o103, Df_o104, Df_o105, Df_o106, Df_o107, Df_o108, Df_o109, Df_o110:out  unsigned((In_width-1) downto 0); 
	Df_o111, Df_o112, Df_o113, Df_o114, Df_o115, Df_o116, Df_o117, Df_o118, Df_o119, Df_o120:out  unsigned((In_width-1) downto 0);
	Df_o121, Df_o122, Df_o123, Df_o124, Df_o125, Df_o126, Df_o127, Df_o128, Df_o129, Df_o130:out  unsigned((In_width-1) downto 0);
	Df_o131, Df_o132, Df_o133, Df_o134, Df_o135, Df_o136, Df_o137, Df_o138, Df_o139, Df_o140:out  unsigned((In_width-1) downto 0);
	Df_o141, Df_o142, Df_o143, Df_o144, Df_o145, Df_o146, Df_o147, Df_o148, Df_o149, Df_o150:out  unsigned((In_width-1) downto 0);
	Df_o151, Df_o152, Df_o153, Df_o154, Df_o155, Df_o156, Df_o157, Df_o158, Df_o159, Df_o160:out  unsigned((In_width-1) downto 0);
	Df_o161, Df_o162, Df_o163, Df_o164, Df_o165, Df_o166, Df_o167, Df_o168, Df_o169, Df_o170:out  unsigned((In_width-1) downto 0);
	Df_o171, Df_o172, Df_o173, Df_o174, Df_o175, Df_o176, Df_o177, Df_o178, Df_o179, Df_o180:out  unsigned((In_width-1) downto 0);
	Df_o181, Df_o182, Df_o183, Df_o184, Df_o185, Df_o186, Df_o187, Df_o188, Df_o189, Df_o190:out  unsigned((In_width-1) downto 0);
	Df_o191, Df_o192, Df_o193, Df_o194, Df_o195, Df_o196, Df_o197, Df_o198, Df_o199, Df_o200:out  unsigned((In_width-1) downto 0)
	);
end component;
signal  Df_o1, Df_o2, Df_o3, Df_o4, Df_o5, Df_o6, Df_o7, Df_o8, Df_o9, Df_o10 			:unsigned((In_width-1) downto 0);
signal	Df_o11, Df_o12, Df_o13, Df_o14, Df_o15, Df_o16, Df_o17, Df_o18, Df_o19, Df_o20 		:unsigned((In_width-1) downto 0);
signal	Df_o21, Df_o22, Df_o23, Df_o24, Df_o25, Df_o26, Df_o27, Df_o28, Df_o29, Df_o30 		:unsigned((In_width-1) downto 0);
signal	Df_o31, Df_o32, Df_o33, Df_o34, Df_o35, Df_o36, Df_o37, Df_o38, Df_o39, Df_o40 		:unsigned((In_width-1) downto 0);
signal	Df_o41, Df_o42, Df_o43, Df_o44, Df_o45, Df_o46, Df_o47, Df_o48, Df_o49, Df_o50		:unsigned((In_width-1) downto 0); 
signal	Df_o51, Df_o52, Df_o53, Df_o54, Df_o55, Df_o56, Df_o57, Df_o58, Df_o59, Df_o60 		:unsigned((In_width-1) downto 0);
signal	Df_o61, Df_o62, Df_o63, Df_o64, Df_o65, Df_o66, Df_o67, Df_o68, Df_o69, Df_o70 		:unsigned((In_width-1) downto 0);
signal	Df_o71, Df_o72, Df_o73, Df_o74, Df_o75, Df_o76, Df_o77, Df_o78, Df_o79, Df_o80 		:unsigned((In_width-1) downto 0);
signal	Df_o81, Df_o82, Df_o83, Df_o84, Df_o85, Df_o86, Df_o87, Df_o88, Df_o89, Df_o90 		:unsigned((In_width-1) downto 0);
signal	Df_o91, Df_o92, Df_o93, Df_o94, Df_o95, Df_o96, Df_o97, Df_o98, Df_o99, Df_o100 	:unsigned((In_width-1) downto 0);
signal	Df_o101, Df_o102, Df_o103, Df_o104, Df_o105, Df_o106, Df_o107, Df_o108, Df_o109, Df_o110:unsigned((In_width-1) downto 0); 
signal	Df_o111, Df_o112, Df_o113, Df_o114, Df_o115, Df_o116, Df_o117, Df_o118, Df_o119, Df_o120:unsigned((In_width-1) downto 0);
signal	Df_o121, Df_o122, Df_o123, Df_o124, Df_o125, Df_o126, Df_o127, Df_o128, Df_o129, Df_o130:unsigned((In_width-1) downto 0);
signal	Df_o131, Df_o132, Df_o133, Df_o134, Df_o135, Df_o136, Df_o137, Df_o138, Df_o139, Df_o140:unsigned((In_width-1) downto 0);
signal	Df_o141, Df_o142, Df_o143, Df_o144, Df_o145, Df_o146, Df_o147, Df_o148, Df_o149, Df_o150:unsigned((In_width-1) downto 0);
signal	Df_o151, Df_o152, Df_o153, Df_o154, Df_o155, Df_o156, Df_o157, Df_o158, Df_o159, Df_o160:unsigned((In_width-1) downto 0);
signal	Df_o161, Df_o162, Df_o163, Df_o164, Df_o165, Df_o166, Df_o167, Df_o168, Df_o169, Df_o170:unsigned((In_width-1) downto 0);
signal	Df_o171, Df_o172, Df_o173, Df_o174, Df_o175, Df_o176, Df_o177, Df_o178, Df_o179, Df_o180:unsigned((In_width-1) downto 0);
signal	Df_o181, Df_o182, Df_o183, Df_o184, Df_o185, Df_o186, Df_o187, Df_o188, Df_o189, Df_o190:unsigned((In_width-1) downto 0);
signal	Df_o191, Df_o192, Df_o193, Df_o194, Df_o195, Df_o196, Df_o197, Df_o198, Df_o199, Df_o200:unsigned((In_width-1) downto 0);
-- D-flip flop

-- Subtractor
component SUBs port(
	Df_O1, Df_O2, Df_O3, Df_O4, Df_O5, Df_O6, Df_O7, Df_O8, Df_O9, Df_O10 			:in  UNSIGNED((in_WIDTH-1) DOWNTO 0);
	Df_O11, Df_O12, Df_O13, Df_O14, Df_O15, Df_O16, Df_O17, Df_O18, Df_O19, Df_O20 		:in  UNSIGNED((in_WIDTH-1) DOWNTO 0);
	Df_O21, Df_O22, Df_O23, Df_O24, Df_O25, Df_O26, Df_O27, Df_O28, Df_O29, Df_O30 		:in  UNSIGNED((in_WIDTH-1) DOWNTO 0);
	Df_O31, Df_O32, Df_O33, Df_O34, Df_O35, Df_O36, Df_O37, Df_O38, Df_O39, Df_O40 		:in  UNSIGNED((in_WIDTH-1) DOWNTO 0);
	Df_O41, Df_O42, Df_O43, Df_O44, Df_O45, Df_O46, Df_O47, Df_O48, Df_O49, Df_O50		:in  UNSIGNED((in_WIDTH-1) DOWNTO 0); 
	Df_O51, Df_O52, Df_O53, Df_O54, Df_O55, Df_O56, Df_O57, Df_O58, Df_O59, Df_O60 		:in  UNSIGNED((in_WIDTH-1) DOWNTO 0);
	Df_O61, Df_O62, Df_O63, Df_O64, Df_O65, Df_O66, Df_O67, Df_O68, Df_O69, Df_O70 		:in  UNSIGNED((in_WIDTH-1) DOWNTO 0);
	Df_O71, Df_O72, Df_O73, Df_O74, Df_O75, Df_O76, Df_O77, Df_O78, Df_O79, Df_O80 		:in  UNSIGNED((in_WIDTH-1) DOWNTO 0);
	Df_O81, Df_O82, Df_O83, Df_O84, Df_O85, Df_O86, Df_O87, Df_O88, Df_O89, Df_O90 		:in  UNSIGNED((in_WIDTH-1) DOWNTO 0);
	Df_O91, Df_O92, Df_O93, Df_O94, Df_O95, Df_O96, Df_O97, Df_O98, Df_O99, Df_O100 	:in  UNSIGNED((in_WIDTH-1) DOWNTO 0);
	DF_o101, Df_o102, Df_o103, Df_o104, Df_o105, Df_o106, Df_o107, Df_o108, Df_o109, Df_o110:in  unsigned((In_width-1) downto 0); 
	Df_o111, Df_o112, Df_o113, Df_o114, Df_o115, Df_o116, Df_o117, Df_o118, Df_o119, Df_o120:in  unsigned((In_width-1) downto 0);
	Df_o121, Df_o122, Df_o123, Df_o124, Df_o125, Df_o126, Df_o127, Df_o128, Df_o129, Df_o130:in  unsigned((In_width-1) downto 0);
	Df_o131, Df_o132, Df_o133, Df_o134, Df_o135, Df_o136, Df_o137, Df_o138, Df_o139, Df_o140:in  unsigned((In_width-1) downto 0);
	Df_o141, Df_o142, Df_o143, Df_o144, Df_o145, Df_o146, Df_o147, Df_o148, Df_o149, Df_o150:in  unsigned((In_width-1) downto 0);
	Df_o151, Df_o152, Df_o153, Df_o154, Df_o155, Df_o156, Df_o157, Df_o158, Df_o159, Df_o160:in  unsigned((In_width-1) downto 0);
	Df_o161, Df_o162, Df_o163, Df_o164, Df_o165, Df_o166, Df_o167, Df_o168, Df_o169, Df_o170:in  unsigned((In_width-1) downto 0);
	Df_o171, Df_o172, Df_o173, Df_o174, Df_o175, Df_o176, Df_o177, Df_o178, Df_o179, Df_o180:in  unsigned((In_width-1) downto 0);
	Df_o181, Df_o182, Df_o183, Df_o184, Df_o185, Df_o186, Df_o187, Df_o188, Df_o189, Df_o190:in  unsigned((In_width-1) downto 0);
	Df_o191, Df_o192, Df_o193, Df_o194, Df_o195, Df_o196, Df_o197, Df_o198, Df_o199, Df_o200:in  unsigned((In_width-1) downto 0);
	average											:in unsigned((average_width-1) downto 0);
        CMF_o1, CMF_o2, CMF_o3, CMF_o4, CMF_o5, CMF_o6, CMF_o7, CMF_o8, CMF_o9, CMF_o10 			:out  signed((Out_width-1) downto 0);
	CMF_o11, CMF_o12, CMF_o13, CMF_o14, CMF_o15, CMF_o16, CMF_o17, CMF_o18, CMF_o19, CMF_o20 		:out  signed((Out_width-1) downto 0);
	CMF_o21, CMF_o22, CMF_o23, CMF_o24, CMF_o25, CMF_o26, CMF_o27, CMF_o28, CMF_o29, CMF_o30 		:out  signed((Out_width-1) downto 0);
	CMF_o31, CMF_o32, CMF_o33, CMF_o34, CMF_o35, CMF_o36, CMF_o37, CMF_o38, CMF_o39, CMF_o40 		:out  signed((Out_width-1) downto 0);
	CMF_o41, CMF_o42, CMF_o43, CMF_o44, CMF_o45, CMF_o46, CMF_o47, CMF_o48, CMF_o49, CMF_o50		:out  signed((Out_width-1) downto 0); 
	CMF_o51, CMF_o52, CMF_o53, CMF_o54, CMF_o55, CMF_o56, CMF_o57, CMF_o58, CMF_o59, CMF_o60 		:out  signed((Out_width-1) downto 0);
	CMF_o61, CMF_o62, CMF_o63, CMF_o64, CMF_o65, CMF_o66, CMF_o67, CMF_o68, CMF_o69, CMF_o70 		:out  signed((Out_width-1) downto 0);
	CMF_o71, CMF_o72, CMF_o73, CMF_o74, CMF_o75, CMF_o76, CMF_o77, CMF_o78, CMF_o79, CMF_o80 		:out  signed((Out_width-1) downto 0);
	CMF_o81, CMF_o82, CMF_o83, CMF_o84, CMF_o85, CMF_o86, CMF_o87, CMF_o88, CMF_o89, CMF_o90 		:out  signed((Out_width-1) downto 0);
	CMF_o91, CMF_o92, CMF_o93, CMF_o94, CMF_o95, CMF_o96, CMF_o97, CMF_o98, CMF_o99, CMF_o100 	:out  signed((Out_width-1) downto 0);
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
-- Subtractor

begin

Nch_adder:N_ch_adder port map
	(
	Hiclk => Hiclk, reset => reset,
	multi_o1 => multi_o1, multi_o2 => multi_o2, multi_o3 => multi_o3, multi_o4 => multi_o4, multi_o5 => multi_o5,
	delay_o1 => delay_o1, delay_o2 => delay_o2, delay_o3 => delay_o3, delay_o4 => delay_o4, delay_o5 => delay_o5,
	Thre => Thre, SUM => SUM, contribute => contribute
	);
	
Count:Controller port map
	(
	Clock => Clock, Hiclk => Hiclk,
	sel => sel, reset => reset
	);

MUXs:MUX_all port map
	(
	Clock  => Clock,  sel => sel,
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
	multi_o1 => multi_o1, multi_o2 => multi_o2, multi_o3 => multi_o3, multi_o4 => multi_o4, multi_o5 => multi_o5
	);

	
D_MUXs:D_MUX_all port map
	(
	Clock => Clock, Hiclk => Hiclk, sel => sel,
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
	delay_o1 => delay_o1, delay_o2 => delay_o2, delay_o3 => delay_o3, delay_o4 => delay_o4, delay_o5 => delay_o5
	);

Divide:Divider port map
	(
	SUM => SUM, contribute => contribute,
	average => average
	);

D_ff_all:D_ffs port map
	(
        Clock => Clock,
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
        Df_o1   => Df_o1,   Df_o2   => Df_o2,   Df_o3   => Df_o3,   Df_o4   => Df_o4,   Df_o5   => Df_o5,   Df_o6   => Df_o6,   Df_o7   => Df_o7,   Df_o8   => Df_o8,   Df_o9   => Df_o9,   Df_o10  => Df_o10,
	Df_o11  => Df_o11,  Df_o12  => Df_o12,  Df_o13  => Df_o13,  Df_o14  => Df_o14,  Df_o15  => Df_o15,  Df_o16  => Df_o16,  Df_o17  => Df_o17,  Df_o18  => Df_o18,  Df_o19  => Df_o19,  Df_o20  => Df_o20,
	Df_o21  => Df_o21,  Df_o22  => Df_o22,  Df_o23  => Df_o23,  Df_o24  => Df_o24,  Df_o25  => Df_o25,  Df_o26  => Df_o26,  Df_o27  => Df_o27,  Df_o28  => Df_o28,  Df_o29  => Df_o29,  Df_o30  => Df_o30,
	Df_o31  => Df_o31,  Df_o32  => Df_o32,  Df_o33  => Df_o33,  Df_o34  => Df_o34,  Df_o35  => Df_o35,  Df_o36  => Df_o36,  Df_o37  => Df_o37,  Df_o38  => Df_o38,  Df_o39  => Df_o39,  Df_o40  => Df_o40,
	Df_o41  => Df_o41,  Df_o42  => Df_o42,  Df_o43  => Df_o43,  Df_o44  => Df_o44,  Df_o45  => Df_o45,  Df_o46  => Df_o46,  Df_o47  => Df_o47,  Df_o48  => Df_o48,  Df_o49  => Df_o49,  Df_o50  => Df_o50,
	Df_o51  => Df_o51,  Df_o52  => Df_o52,  Df_o53  => Df_o53,  Df_o54  => Df_o54,  Df_o55  => Df_o55,  Df_o56  => Df_o56,  Df_o57  => Df_o57,  Df_o58  => Df_o58,  Df_o59  => Df_o59,  Df_o60  => Df_o60,
	Df_o61  => Df_o61,  Df_o62  => Df_o62,  Df_o63  => Df_o63,  Df_o64  => Df_o64,  Df_o65  => Df_o65,  Df_o66  => Df_o66,  Df_o67  => Df_o67,  Df_o68  => Df_o68,  Df_o69  => Df_o69,  Df_o70  => Df_o70,
	Df_o71  => Df_o71,  Df_o72  => Df_o72,  Df_o73  => Df_o73,  Df_o74  => Df_o74,  Df_o75  => Df_o75,  Df_o76  => Df_o76,  Df_o77  => Df_o77,  Df_o78  => Df_o78,  Df_o79  => Df_o79,  Df_o80  => Df_o80,
	Df_o81  => Df_o81,  Df_o82  => Df_o82,  Df_o83  => Df_o83,  Df_o84  => Df_o84,  Df_o85  => Df_o85,  Df_o86  => Df_o86,  Df_o87  => Df_o87,  Df_o88  => Df_o88,  Df_o89  => Df_o89,  Df_o90  => Df_o90,
	Df_o91  => Df_o91,  Df_o92  => Df_o92,  Df_o93  => Df_o93,  Df_o94  => Df_o94,  Df_o95  => Df_o95,  Df_o96  => Df_o96,  Df_o97  => Df_o97,  Df_o98  => Df_o98,  Df_o99  => Df_o99,  Df_o100 => Df_o100,
	Df_o101 => Df_o101, Df_o102 => Df_o102, Df_o103 => Df_o103, Df_o104 => Df_o104, Df_o105 => Df_o105, Df_o106 => Df_o106, Df_o107 => Df_o107, Df_o108 => Df_o108, Df_o109 => Df_o109, Df_o110 => Df_o110,
	Df_o111 => Df_o111, Df_o112 => Df_o112, Df_o113 => Df_o113, Df_o114 => Df_o114, Df_o115 => Df_o115, Df_o116 => Df_o116, Df_o117 => Df_o117, Df_o118 => Df_o118, Df_o119 => Df_o119, Df_o120 => Df_o120,
	Df_o121 => Df_o121, Df_o122 => Df_o122, Df_o123 => Df_o123, Df_o124 => Df_o124, Df_o125 => Df_o125, Df_o126 => Df_o126, Df_o127 => Df_o127, Df_o128 => Df_o128, Df_o129 => Df_o129, Df_o130 => Df_o130,
	Df_o131 => Df_o131, Df_o132 => Df_o132, Df_o133 => Df_o133, Df_o134 => Df_o134, Df_o135 => Df_o135, Df_o136 => Df_o136, Df_o137 => Df_o137, Df_o138 => Df_o138, Df_o139 => Df_o139, Df_o140 => Df_o140,
	Df_o141 => Df_o141, Df_o142 => Df_o142, Df_o143 => Df_o143, Df_o144 => Df_o144, Df_o145 => Df_o145, Df_o146 => Df_o146, Df_o147 => Df_o147, Df_o148 => Df_o148, Df_o149 => Df_o149, Df_o150 => Df_o150,
	Df_o151 => Df_o151, Df_o152 => Df_o152, Df_o153 => Df_o153, Df_o154 => Df_o154, Df_o155 => Df_o155, Df_o156 => Df_o156, Df_o157 => Df_o157, Df_o158 => Df_o158, Df_o159 => Df_o159, Df_o160 => Df_o160,
	Df_o161 => Df_o161, Df_o162 => Df_o162, Df_o163 => Df_o163, Df_o164 => Df_o164, Df_o165 => Df_o165, Df_o166 => Df_o166, Df_o167 => Df_o167, Df_o168 => Df_o168, Df_o169 => Df_o169, Df_o170 => Df_o170,
	Df_o171 => Df_o171, Df_o172 => Df_o172, Df_o173 => Df_o173, Df_o174 => Df_o174, Df_o175 => Df_o175, Df_o176 => Df_o176, Df_o177 => Df_o177, Df_o178 => Df_o178, Df_o179 => Df_o179, Df_o180 => Df_o180,
	Df_o181 => Df_o181, Df_o182 => Df_o182, Df_o183 => Df_o183, Df_o184 => Df_o184, Df_o185 => Df_o185, Df_o186 => Df_o186, Df_o187 => Df_o187, Df_o188 => Df_o188, Df_o189 => Df_o189, Df_o190 => Df_o190,
	Df_o191 => Df_o191, Df_o192 => Df_o192, Df_o193 => Df_o193, Df_o194 => Df_o194, Df_o195 => Df_o195, Df_o196 => Df_o196, Df_o197 => Df_o197, Df_o198 => Df_o198, Df_o199 => Df_o199, Df_o200 => Df_o200
	);

SUB_all:SUBs port map
	(
        Df_o1   => Df_o1,   Df_o2   => Df_o2,   Df_o3   => Df_o3,   Df_o4   => Df_o4,   Df_o5   => Df_o5,   Df_o6   => Df_o6,   Df_o7   => Df_o7,   Df_o8   => Df_o8,   Df_o9   => Df_o9,   Df_o10  => Df_o10,
	Df_o11  => Df_o11,  Df_o12  => Df_o12,  Df_o13  => Df_o13,  Df_o14  => Df_o14,  Df_o15  => Df_o15,  Df_o16  => Df_o16,  Df_o17  => Df_o17,  Df_o18  => Df_o18,  Df_o19  => Df_o19,  Df_o20  => Df_o20,
	Df_o21  => Df_o21,  Df_o22  => Df_o22,  Df_o23  => Df_o23,  Df_o24  => Df_o24,  Df_o25  => Df_o25,  Df_o26  => Df_o26,  Df_o27  => Df_o27,  Df_o28  => Df_o28,  Df_o29  => Df_o29,  Df_o30  => Df_o30,
	Df_o31  => Df_o31,  Df_o32  => Df_o32,  Df_o33  => Df_o33,  Df_o34  => Df_o34,  Df_o35  => Df_o35,  Df_o36  => Df_o36,  Df_o37  => Df_o37,  Df_o38  => Df_o38,  Df_o39  => Df_o39,  Df_o40  => Df_o40,
	Df_o41  => Df_o41,  Df_o42  => Df_o42,  Df_o43  => Df_o43,  Df_o44  => Df_o44,  Df_o45  => Df_o45,  Df_o46  => Df_o46,  Df_o47  => Df_o47,  Df_o48  => Df_o48,  Df_o49  => Df_o49,  Df_o50  => Df_o50,
	Df_o51  => Df_o51,  Df_o52  => Df_o52,  Df_o53  => Df_o53,  Df_o54  => Df_o54,  Df_o55  => Df_o55,  Df_o56  => Df_o56,  Df_o57  => Df_o57,  Df_o58  => Df_o58,  Df_o59  => Df_o59,  Df_o60  => Df_o60,
	Df_o61  => Df_o61,  Df_o62  => Df_o62,  Df_o63  => Df_o63,  Df_o64  => Df_o64,  Df_o65  => Df_o65,  Df_o66  => Df_o66,  Df_o67  => Df_o67,  Df_o68  => Df_o68,  Df_o69  => Df_o69,  Df_o70  => Df_o70,
	Df_o71  => Df_o71,  Df_o72  => Df_o72,  Df_o73  => Df_o73,  Df_o74  => Df_o74,  Df_o75  => Df_o75,  Df_o76  => Df_o76,  Df_o77  => Df_o77,  Df_o78  => Df_o78,  Df_o79  => Df_o79,  Df_o80  => Df_o80,
	Df_o81  => Df_o81,  Df_o82  => Df_o82,  Df_o83  => Df_o83,  Df_o84  => Df_o84,  Df_o85  => Df_o85,  Df_o86  => Df_o86,  Df_o87  => Df_o87,  Df_o88  => Df_o88,  Df_o89  => Df_o89,  Df_o90  => Df_o90,
	Df_o91  => Df_o91,  Df_o92  => Df_o92,  Df_o93  => Df_o93,  Df_o94  => Df_o94,  Df_o95  => Df_o95,  Df_o96  => Df_o96,  Df_o97  => Df_o97,  Df_o98  => Df_o98,  Df_o99  => Df_o99,  Df_o100 => Df_o100,
	Df_o101 => Df_o101, Df_o102 => Df_o102, Df_o103 => Df_o103, Df_o104 => Df_o104, Df_o105 => Df_o105, Df_o106 => Df_o106, Df_o107 => Df_o107, Df_o108 => Df_o108, Df_o109 => Df_o109, Df_o110 => Df_o110,
	Df_o111 => Df_o111, Df_o112 => Df_o112, Df_o113 => Df_o113, Df_o114 => Df_o114, Df_o115 => Df_o115, Df_o116 => Df_o116, Df_o117 => Df_o117, Df_o118 => Df_o118, Df_o119 => Df_o119, Df_o120 => Df_o120,
	Df_o121 => Df_o121, Df_o122 => Df_o122, Df_o123 => Df_o123, Df_o124 => Df_o124, Df_o125 => Df_o125, Df_o126 => Df_o126, Df_o127 => Df_o127, Df_o128 => Df_o128, Df_o129 => Df_o129, Df_o130 => Df_o130,
	Df_o131 => Df_o131, Df_o132 => Df_o132, Df_o133 => Df_o133, Df_o134 => Df_o134, Df_o135 => Df_o135, Df_o136 => Df_o136, Df_o137 => Df_o137, Df_o138 => Df_o138, Df_o139 => Df_o139, Df_o140 => Df_o140,
	Df_o141 => Df_o141, Df_o142 => Df_o142, Df_o143 => Df_o143, Df_o144 => Df_o144, Df_o145 => Df_o145, Df_o146 => Df_o146, Df_o147 => Df_o147, Df_o148 => Df_o148, Df_o149 => Df_o149, Df_o150 => Df_o150,
	Df_o151 => Df_o151, Df_o152 => Df_o152, Df_o153 => Df_o153, Df_o154 => Df_o154, Df_o155 => Df_o155, Df_o156 => Df_o156, Df_o157 => Df_o157, Df_o158 => Df_o158, Df_o159 => Df_o159, Df_o160 => Df_o160,
	Df_o161 => Df_o161, Df_o162 => Df_o162, Df_o163 => Df_o163, Df_o164 => Df_o164, Df_o165 => Df_o165, Df_o166 => Df_o166, Df_o167 => Df_o167, Df_o168 => Df_o168, Df_o169 => Df_o169, Df_o170 => Df_o170,
	Df_o171 => Df_o171, Df_o172 => Df_o172, Df_o173 => Df_o173, Df_o174 => Df_o174, Df_o175 => Df_o175, Df_o176 => Df_o176, Df_o177 => Df_o177, Df_o178 => Df_o178, Df_o179 => Df_o179, Df_o180 => Df_o180,
	Df_o181 => Df_o181, Df_o182 => Df_o182, Df_o183 => Df_o183, Df_o184 => Df_o184, Df_o185 => Df_o185, Df_o186 => Df_o186, Df_o187 => Df_o187, Df_o188 => Df_o188, Df_o189 => Df_o189, Df_o190 => Df_o190,
	Df_o191 => Df_o191, Df_o192 => Df_o192, Df_o193 => Df_o193, Df_o194 => Df_o194, Df_o195 => Df_o195, Df_o196 => Df_o196, Df_o197 => Df_o197, Df_o198 => Df_o198, Df_o199 => Df_o199, Df_o200 => Df_o200,
	average => average,
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

end rtl;
