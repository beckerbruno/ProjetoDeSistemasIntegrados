--------------------------------------------------
-- File:    reg_bank.vhd
-- Author:  Prof. M.Sc. Marlon Moraes
-- E-mail:  marlon.moraes@pucrs.br
--------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity reg_bank is
  port (
    clk : in STD_LOGIC := 'X'; 
    rd_en : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    wr_en : in STD_LOGIC := 'X'; 
    rd_data : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    rd_address : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
    wr_data : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    wr_address : in STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end reg_bank;

architecture Structure of reg_bank is
  signal wr_data_1_IBUF_656 : STD_LOGIC; 
  signal wr_data_0_IBUF_657 : STD_LOGIC; 
  signal reg_7_0_not0002_0 : STD_LOGIC; 
  signal clk_BUFGP : STD_LOGIC; 
  signal rst_IBUF_660 : STD_LOGIC; 
  signal wr_data_7_IBUF_663 : STD_LOGIC; 
  signal wr_data_6_IBUF_664 : STD_LOGIC; 
  signal reg_6_not0001_0 : STD_LOGIC; 
  signal wr_data_3_IBUF_668 : STD_LOGIC; 
  signal wr_data_2_IBUF_669 : STD_LOGIC; 
  signal N111 : STD_LOGIC; 
  signal wr_address_1_IBUF_673 : STD_LOGIC; 
  signal wr_address_0_IBUF_674 : STD_LOGIC; 
  signal wr_address_3_IBUF_675 : STD_LOGIC; 
  signal reg_10_not0001_0 : STD_LOGIC; 
  signal reg_2_not0001_0 : STD_LOGIC; 
  signal reg_8_not0001_0 : STD_LOGIC; 
  signal wr_data_5_IBUF_681 : STD_LOGIC; 
  signal wr_data_4_IBUF_682 : STD_LOGIC; 
  signal rd_address_0_IBUF_685 : STD_LOGIC; 
  signal rd_address_3_IBUF_686 : STD_LOGIC; 
  signal rd_address_1_IBUF_687 : STD_LOGIC; 
  signal Mmux_rd_data_mux00011487_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012112_0 : STD_LOGIC; 
  signal reg_9_not0001_0 : STD_LOGIC; 
  signal rd_address_2_IBUF_703 : STD_LOGIC; 
  signal Mmux_rd_data_mux00011475_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012841_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001518_0 : STD_LOGIC; 
  signal N7_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux000159111_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux000151104_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux00015936_0 : STD_LOGIC; 
  signal N10_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001775_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux00014395_0 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001598_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux00015923_0 : STD_LOGIC; 
  signal rd_en_IBUF_729 : STD_LOGIC; 
  signal rd_data_not0001_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001285_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001215_0 : STD_LOGIC; 
  signal rd_data_7_733 : STD_LOGIC; 
  signal wr_address_2_IBUF_735 : STD_LOGIC; 
  signal wr_en_IBUF_736 : STD_LOGIC; 
  signal rd_data_0_737 : STD_LOGIC; 
  signal rd_data_1_738 : STD_LOGIC; 
  signal rd_data_2_739 : STD_LOGIC; 
  signal rd_data_3_740 : STD_LOGIC; 
  signal rd_data_4_741 : STD_LOGIC; 
  signal rd_data_5_742 : STD_LOGIC; 
  signal rd_data_6_743 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001727 : STD_LOGIC; 
  signal Mmux_rd_data_mux00011427 : STD_LOGIC; 
  signal Mmux_rd_data_mux00015992_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux00015135 : STD_LOGIC; 
  signal Mmux_rd_data_mux00013627 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012191_0 : STD_LOGIC; 
  signal N8_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012116_O : STD_LOGIC; 
  signal N13 : STD_LOGIC; 
  signal Mmux_rd_data_mux00011483_O : STD_LOGIC; 
  signal Mmux_rd_data_mux000114107_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux00011445_O : STD_LOGIC; 
  signal Mmux_rd_data_mux00012816_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux00014384_O : STD_LOGIC; 
  signal Mmux_rd_data_mux000143118_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux00014335_O : STD_LOGIC; 
  signal Mmux_rd_data_mux000151136_O : STD_LOGIC; 
  signal Mmux_rd_data_mux00015185_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001783_O : STD_LOGIC; 
  signal Mmux_rd_data_mux00017107_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux00013691_O : STD_LOGIC; 
  signal Mmux_rd_data_mux000136114_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001745_O : STD_LOGIC; 
  signal Mmux_rd_data_mux00012853_O : STD_LOGIC; 
  signal N6_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012891_O : STD_LOGIC; 
  signal Mmux_rd_data_mux00013645_O : STD_LOGIC; 
  signal Mmux_rd_data_mux00012153_O : STD_LOGIC; 
  signal Mmux_rd_data_mux00012141_0 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001438_796 : STD_LOGIC; 
  signal N01 : STD_LOGIC; 
  signal reg_13_not0001_0 : STD_LOGIC; 
  signal reg_7_1_DXMUX_820 : STD_LOGIC; 
  signal reg_7_1_DYMUX_813 : STD_LOGIC; 
  signal reg_7_1_SRINV_811 : STD_LOGIC; 
  signal reg_7_1_CLKINV_810 : STD_LOGIC; 
  signal reg_7_1_CEINV_809 : STD_LOGIC; 
  signal reg_6_7_DXMUX_844 : STD_LOGIC; 
  signal reg_6_7_DYMUX_837 : STD_LOGIC; 
  signal reg_6_7_SRINV_835 : STD_LOGIC; 
  signal reg_6_7_CLKINV_834 : STD_LOGIC; 
  signal reg_6_7_CEINV_833 : STD_LOGIC; 
  signal reg_7_3_DXMUX_868 : STD_LOGIC; 
  signal reg_7_3_DYMUX_861 : STD_LOGIC; 
  signal reg_7_3_SRINV_859 : STD_LOGIC; 
  signal reg_7_3_CLKINV_858 : STD_LOGIC; 
  signal reg_7_3_CEINV_857 : STD_LOGIC; 
  signal reg_10_not0001 : STD_LOGIC; 
  signal reg_2_not0001 : STD_LOGIC; 
  signal reg_8_1_DXMUX_916 : STD_LOGIC; 
  signal reg_8_1_DYMUX_909 : STD_LOGIC; 
  signal reg_8_1_SRINV_907 : STD_LOGIC; 
  signal reg_8_1_CLKINV_906 : STD_LOGIC; 
  signal reg_8_1_CEINV_905 : STD_LOGIC; 
  signal reg_7_5_DXMUX_940 : STD_LOGIC; 
  signal reg_7_5_DYMUX_933 : STD_LOGIC; 
  signal reg_7_5_SRINV_931 : STD_LOGIC; 
  signal reg_7_5_CLKINV_930 : STD_LOGIC; 
  signal reg_7_5_CEINV_929 : STD_LOGIC; 
  signal Mmux_rd_data_mux00011487 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012112 : STD_LOGIC; 
  signal reg_7_7_DXMUX_988 : STD_LOGIC; 
  signal reg_7_7_DYMUX_981 : STD_LOGIC; 
  signal reg_7_7_SRINV_979 : STD_LOGIC; 
  signal reg_7_7_CLKINV_978 : STD_LOGIC; 
  signal reg_7_7_CEINV_977 : STD_LOGIC; 
  signal reg_8_3_DXMUX_1012 : STD_LOGIC; 
  signal reg_8_3_DYMUX_1005 : STD_LOGIC; 
  signal reg_8_3_SRINV_1003 : STD_LOGIC; 
  signal reg_8_3_CLKINV_1002 : STD_LOGIC; 
  signal reg_8_3_CEINV_1001 : STD_LOGIC; 
  signal reg_9_1_DXMUX_1036 : STD_LOGIC; 
  signal reg_9_1_DYMUX_1029 : STD_LOGIC; 
  signal reg_9_1_SRINV_1027 : STD_LOGIC; 
  signal reg_9_1_CLKINV_1026 : STD_LOGIC; 
  signal reg_9_1_CEINV_1025 : STD_LOGIC; 
  signal reg_8_5_DXMUX_1060 : STD_LOGIC; 
  signal reg_8_5_DYMUX_1053 : STD_LOGIC; 
  signal reg_8_5_SRINV_1051 : STD_LOGIC; 
  signal reg_8_5_CLKINV_1050 : STD_LOGIC; 
  signal reg_8_5_CEINV_1049 : STD_LOGIC; 
  signal reg_9_3_DXMUX_1084 : STD_LOGIC; 
  signal reg_9_3_DYMUX_1077 : STD_LOGIC; 
  signal reg_9_3_SRINV_1075 : STD_LOGIC; 
  signal reg_9_3_CLKINV_1074 : STD_LOGIC; 
  signal reg_9_3_CEINV_1073 : STD_LOGIC; 
  signal reg_8_7_DXMUX_1108 : STD_LOGIC; 
  signal reg_8_7_DYMUX_1101 : STD_LOGIC; 
  signal reg_8_7_SRINV_1099 : STD_LOGIC; 
  signal reg_8_7_CLKINV_1098 : STD_LOGIC; 
  signal reg_8_7_CEINV_1097 : STD_LOGIC; 
  signal Mmux_rd_data_mux00011475_1135 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012841_1127 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001518_1159 : STD_LOGIC; 
  signal N7 : STD_LOGIC; 
  signal reg_9_5_DXMUX_1180 : STD_LOGIC; 
  signal reg_9_5_DYMUX_1173 : STD_LOGIC; 
  signal reg_9_5_SRINV_1171 : STD_LOGIC; 
  signal reg_9_5_CLKINV_1170 : STD_LOGIC; 
  signal reg_9_5_CEINV_1169 : STD_LOGIC; 
  signal Mmux_rd_data_mux000159111_1207 : STD_LOGIC; 
  signal Mmux_rd_data_mux000151104_1200 : STD_LOGIC; 
  signal Mmux_rd_data_mux00015936_1231 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal reg_9_7_DXMUX_1252 : STD_LOGIC; 
  signal reg_9_7_DYMUX_1245 : STD_LOGIC; 
  signal reg_9_7_SRINV_1243 : STD_LOGIC; 
  signal reg_9_7_CLKINV_1242 : STD_LOGIC; 
  signal reg_9_7_CEINV_1241 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001775_1279 : STD_LOGIC; 
  signal Mmux_rd_data_mux00014395_1271 : STD_LOGIC; 
  signal reg_7_0_not0002 : STD_LOGIC; 
  signal reg_6_not0001 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001598_1327 : STD_LOGIC; 
  signal Mmux_rd_data_mux00015923_1320 : STD_LOGIC; 
  signal rd_data_not0001 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001285_1363 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001215_1355 : STD_LOGIC; 
  signal rd_data_7_O : STD_LOGIC; 
  signal clk_INBUF : STD_LOGIC; 
  signal wr_address_0_INBUF : STD_LOGIC; 
  signal wr_address_1_INBUF : STD_LOGIC; 
  signal wr_address_2_INBUF : STD_LOGIC; 
  signal wr_address_3_INBUF : STD_LOGIC; 
  signal rd_address_0_INBUF : STD_LOGIC; 
  signal rd_address_1_INBUF : STD_LOGIC; 
  signal rd_address_2_INBUF : STD_LOGIC; 
  signal rd_address_3_INBUF : STD_LOGIC; 
  signal wr_data_0_INBUF : STD_LOGIC; 
  signal wr_data_1_INBUF : STD_LOGIC; 
  signal wr_en_INBUF : STD_LOGIC; 
  signal wr_data_2_INBUF : STD_LOGIC; 
  signal wr_data_3_INBUF : STD_LOGIC; 
  signal wr_data_4_INBUF : STD_LOGIC; 
  signal wr_data_5_INBUF : STD_LOGIC; 
  signal wr_data_6_INBUF : STD_LOGIC; 
  signal wr_data_7_INBUF : STD_LOGIC; 
  signal rd_en_INBUF : STD_LOGIC; 
  signal rd_data_0_O : STD_LOGIC; 
  signal rd_data_1_O : STD_LOGIC; 
  signal rd_data_2_O : STD_LOGIC; 
  signal rd_data_3_O : STD_LOGIC; 
  signal rst_INBUF : STD_LOGIC; 
  signal rd_data_4_O : STD_LOGIC; 
  signal rd_data_5_O : STD_LOGIC; 
  signal rd_data_6_O : STD_LOGIC; 
  signal clk_BUFGP_BUFG_S_INVNOT : STD_LOGIC; 
  signal clk_BUFGP_BUFG_I0_INV : STD_LOGIC; 
  signal N4_F5MUX_1578 : STD_LOGIC; 
  signal N25 : STD_LOGIC; 
  signal N4_BXINV_1570 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001727_F5MUX_1603 : STD_LOGIC; 
  signal N17 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001727_BXINV_1595 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal Mmux_rd_data_mux00011427_F5MUX_1628 : STD_LOGIC; 
  signal N19 : STD_LOGIC; 
  signal Mmux_rd_data_mux00011427_BXINV_1620 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal rd_data_0_DXMUX_1659 : STD_LOGIC; 
  signal rd_data_0_F5MUX_1657 : STD_LOGIC; 
  signal N15 : STD_LOGIC; 
  signal rd_data_0_BXINV_1650 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal rd_data_0_CLKINV_1643 : STD_LOGIC; 
  signal rd_data_0_CEINV_1642 : STD_LOGIC; 
  signal Mmux_rd_data_mux00015135_F5MUX_1687 : STD_LOGIC; 
  signal N23 : STD_LOGIC; 
  signal Mmux_rd_data_mux00015135_BXINV_1679 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal Mmux_rd_data_mux00013627_F5MUX_1712 : STD_LOGIC; 
  signal N21 : STD_LOGIC; 
  signal Mmux_rd_data_mux00013627_BXINV_1704 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N26_F5MUX_1737 : STD_LOGIC; 
  signal reg_6_not00011 : STD_LOGIC; 
  signal N26_BXINV_1730 : STD_LOGIC; 
  signal N26_G : STD_LOGIC; 
  signal rd_data_5_DXMUX_1767 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012116_O_pack_1 : STD_LOGIC; 
  signal rd_data_5_CLKINV_1752 : STD_LOGIC; 
  signal rd_data_5_CEINV_1751 : STD_LOGIC; 
  signal Mmux_rd_data_mux000114107_1793 : STD_LOGIC; 
  signal Mmux_rd_data_mux00011483_O_pack_1 : STD_LOGIC; 
  signal rd_data_6_DXMUX_1824 : STD_LOGIC; 
  signal Mmux_rd_data_mux00011445_O_pack_1 : STD_LOGIC; 
  signal rd_data_6_CLKINV_1809 : STD_LOGIC; 
  signal rd_data_6_CEINV_1808 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012816_1850 : STD_LOGIC; 
  signal N13_pack_2 : STD_LOGIC; 
  signal Mmux_rd_data_mux000143118_1874 : STD_LOGIC; 
  signal Mmux_rd_data_mux00014384_O_pack_1 : STD_LOGIC; 
  signal rd_data_2_DXMUX_1905 : STD_LOGIC; 
  signal Mmux_rd_data_mux00014335_O_pack_1 : STD_LOGIC; 
  signal rd_data_2_CLKINV_1890 : STD_LOGIC; 
  signal rd_data_2_CEINV_1889 : STD_LOGIC; 
  signal rd_data_1_DXMUX_1938 : STD_LOGIC; 
  signal Mmux_rd_data_mux000151136_O_pack_2 : STD_LOGIC; 
  signal rd_data_1_CLKINV_1923 : STD_LOGIC; 
  signal rd_data_1_CEINV_1922 : STD_LOGIC; 
  signal Mmux_rd_data_mux00017107_1964 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001783_O_pack_1 : STD_LOGIC; 
  signal Mmux_rd_data_mux000136114_1988 : STD_LOGIC; 
  signal Mmux_rd_data_mux00013691_O_pack_1 : STD_LOGIC; 
  signal rd_data_7_DXMUX_2019 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001745_O_pack_1 : STD_LOGIC; 
  signal rd_data_7_CLKINV_2004 : STD_LOGIC; 
  signal rd_data_7_CEINV_2003 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012853_O_pack_1 : STD_LOGIC; 
  signal rd_data_4_DXMUX_2076 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012891_O_pack_1 : STD_LOGIC; 
  signal rd_data_4_CLKINV_2061 : STD_LOGIC; 
  signal rd_data_4_CEINV_2060 : STD_LOGIC; 
  signal rd_data_3_DXMUX_2109 : STD_LOGIC; 
  signal Mmux_rd_data_mux00013645_O_pack_1 : STD_LOGIC; 
  signal rd_data_3_CLKINV_2094 : STD_LOGIC; 
  signal rd_data_3_CEINV_2093 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012153_O_pack_1 : STD_LOGIC; 
  signal reg_8_not0001 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012191_2171 : STD_LOGIC; 
  signal Mmux_rd_data_mux00015992_2164 : STD_LOGIC; 
  signal Mmux_rd_data_mux00015185_2195 : STD_LOGIC; 
  signal Mmux_rd_data_mux0001438_pack_2 : STD_LOGIC; 
  signal reg_10_1_DXMUX_2216 : STD_LOGIC; 
  signal reg_10_1_DYMUX_2209 : STD_LOGIC; 
  signal reg_10_1_SRINV_2207 : STD_LOGIC; 
  signal reg_10_1_CLKINV_2206 : STD_LOGIC; 
  signal reg_10_1_CEINV_2205 : STD_LOGIC; 
  signal reg_10_3_DXMUX_2240 : STD_LOGIC; 
  signal reg_10_3_DYMUX_2233 : STD_LOGIC; 
  signal reg_10_3_SRINV_2231 : STD_LOGIC; 
  signal reg_10_3_CLKINV_2230 : STD_LOGIC; 
  signal reg_10_3_CEINV_2229 : STD_LOGIC; 
  signal reg_10_5_DXMUX_2264 : STD_LOGIC; 
  signal reg_10_5_DYMUX_2257 : STD_LOGIC; 
  signal reg_10_5_SRINV_2255 : STD_LOGIC; 
  signal reg_10_5_CLKINV_2254 : STD_LOGIC; 
  signal reg_10_5_CEINV_2253 : STD_LOGIC; 
  signal reg_13_not0001_2291 : STD_LOGIC; 
  signal N01_pack_1 : STD_LOGIC; 
  signal reg_10_7_DXMUX_2312 : STD_LOGIC; 
  signal reg_10_7_DYMUX_2305 : STD_LOGIC; 
  signal reg_10_7_SRINV_2303 : STD_LOGIC; 
  signal reg_10_7_CLKINV_2302 : STD_LOGIC; 
  signal reg_10_7_CEINV_2301 : STD_LOGIC; 
  signal reg_9_not0001 : STD_LOGIC; 
  signal N111_pack_1 : STD_LOGIC; 
  signal reg_2_1_DXMUX_2360 : STD_LOGIC; 
  signal reg_2_1_DYMUX_2353 : STD_LOGIC; 
  signal reg_2_1_SRINV_2351 : STD_LOGIC; 
  signal reg_2_1_CLKINV_2350 : STD_LOGIC; 
  signal reg_2_1_CEINV_2349 : STD_LOGIC; 
  signal reg_13_1_DXMUX_2384 : STD_LOGIC; 
  signal reg_13_1_DYMUX_2377 : STD_LOGIC; 
  signal reg_13_1_SRINV_2375 : STD_LOGIC; 
  signal reg_13_1_CLKINV_2374 : STD_LOGIC; 
  signal reg_13_1_CEINV_2373 : STD_LOGIC; 
  signal reg_2_3_DXMUX_2408 : STD_LOGIC; 
  signal reg_2_3_DYMUX_2401 : STD_LOGIC; 
  signal reg_2_3_SRINV_2399 : STD_LOGIC; 
  signal reg_2_3_CLKINV_2398 : STD_LOGIC; 
  signal reg_2_3_CEINV_2397 : STD_LOGIC; 
  signal reg_13_3_DXMUX_2432 : STD_LOGIC; 
  signal reg_13_3_DYMUX_2425 : STD_LOGIC; 
  signal reg_13_3_SRINV_2423 : STD_LOGIC; 
  signal reg_13_3_CLKINV_2422 : STD_LOGIC; 
  signal reg_13_3_CEINV_2421 : STD_LOGIC; 
  signal Mmux_rd_data_mux00012141_2447 : STD_LOGIC; 
  signal reg_2_5_DXMUX_2468 : STD_LOGIC; 
  signal reg_2_5_DYMUX_2461 : STD_LOGIC; 
  signal reg_2_5_SRINV_2459 : STD_LOGIC; 
  signal reg_2_5_CLKINV_2458 : STD_LOGIC; 
  signal reg_2_5_CEINV_2457 : STD_LOGIC; 
  signal reg_13_5_DXMUX_2492 : STD_LOGIC; 
  signal reg_13_5_DYMUX_2485 : STD_LOGIC; 
  signal reg_13_5_SRINV_2483 : STD_LOGIC; 
  signal reg_13_5_CLKINV_2482 : STD_LOGIC; 
  signal reg_13_5_CEINV_2481 : STD_LOGIC; 
  signal reg_14_0_DYMUX_2505 : STD_LOGIC; 
  signal reg_14_0_BYINV_2504 : STD_LOGIC; 
  signal reg_14_0_CLKINV_2503 : STD_LOGIC; 
  signal reg_14_0_CEINV_2502 : STD_LOGIC; 
  signal reg_2_7_DXMUX_2528 : STD_LOGIC; 
  signal reg_2_7_DYMUX_2521 : STD_LOGIC; 
  signal reg_2_7_SRINV_2519 : STD_LOGIC; 
  signal reg_2_7_CLKINV_2518 : STD_LOGIC; 
  signal reg_2_7_CEINV_2517 : STD_LOGIC; 
  signal reg_13_7_DXMUX_2552 : STD_LOGIC; 
  signal reg_13_7_DYMUX_2545 : STD_LOGIC; 
  signal reg_13_7_SRINV_2543 : STD_LOGIC; 
  signal reg_13_7_CLKINV_2542 : STD_LOGIC; 
  signal reg_13_7_CEINV_2541 : STD_LOGIC; 
  signal reg_6_1_DXMUX_2576 : STD_LOGIC; 
  signal reg_6_1_DYMUX_2569 : STD_LOGIC; 
  signal reg_6_1_SRINV_2567 : STD_LOGIC; 
  signal reg_6_1_CLKINV_2566 : STD_LOGIC; 
  signal reg_6_1_CEINV_2565 : STD_LOGIC; 
  signal reg_6_3_DXMUX_2600 : STD_LOGIC; 
  signal reg_6_3_DYMUX_2593 : STD_LOGIC; 
  signal reg_6_3_SRINV_2591 : STD_LOGIC; 
  signal reg_6_3_CLKINV_2590 : STD_LOGIC; 
  signal reg_6_3_CEINV_2589 : STD_LOGIC; 
  signal reg_6_5_DXMUX_2624 : STD_LOGIC; 
  signal reg_6_5_DYMUX_2617 : STD_LOGIC; 
  signal reg_6_5_SRINV_2615 : STD_LOGIC; 
  signal reg_6_5_CLKINV_2614 : STD_LOGIC; 
  signal reg_6_5_CEINV_2613 : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal reg_7 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal reg_6 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal reg_8 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal reg_9 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal reg_2 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal reg_14 : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal reg_10 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal reg_13 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal rd_data_mux0001 : STD_LOGIC_VECTOR ( 6 downto 0 ); 
begin
  reg_7_1_DXMUX : X_INV
    generic map(
      LOC => "SLICE_X28Y12",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_1_IBUF_656,
      O => reg_7_1_DXMUX_820
    );
  reg_7_1_DYMUX : X_INV
    generic map(
      LOC => "SLICE_X28Y12",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_0_IBUF_657,
      O => reg_7_1_DYMUX_813
    );
  reg_7_1_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y12",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_7_1_SRINV_811
    );
  reg_7_1_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y12",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_7_1_CLKINV_810
    );
  reg_7_1_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y12",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_7_0_not0002_0,
      O => reg_7_1_CEINV_809
    );
  reg_6_7_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y25",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_7_IBUF_663,
      O => reg_6_7_DXMUX_844
    );
  reg_6_7_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y25",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_6_IBUF_664,
      O => reg_6_7_DYMUX_837
    );
  reg_6_7_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y25",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_6_7_SRINV_835
    );
  reg_6_7_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y25",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_6_7_CLKINV_834
    );
  reg_6_7_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y25",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_6_not0001_0,
      O => reg_6_7_CEINV_833
    );
  reg_7_3_DXMUX : X_INV
    generic map(
      LOC => "SLICE_X30Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_3_IBUF_668,
      O => reg_7_3_DXMUX_868
    );
  reg_7_3_DYMUX : X_INV
    generic map(
      LOC => "SLICE_X30Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_2_IBUF_669,
      O => reg_7_3_DYMUX_861
    );
  reg_7_3_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_7_3_SRINV_859
    );
  reg_7_3_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_7_3_CLKINV_858
    );
  reg_7_3_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_7_0_not0002_0,
      O => reg_7_3_CEINV_857
    );
  reg_10_not0001_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y26",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_10_not0001,
      O => reg_10_not0001_0
    );
  reg_10_not0001_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y26",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_2_not0001,
      O => reg_2_not0001_0
    );
  reg_8_0 : X_SFF
    generic map(
      LOC => "SLICE_X29Y10",
      INIT => '0'
    )
    port map (
      I => reg_8_1_DYMUX_909,
      CE => reg_8_1_CEINV_905,
      CLK => reg_8_1_CLKINV_906,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_8_1_SRINV_907,
      O => reg_8(0)
    );
  reg_8_1_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_1_IBUF_656,
      O => reg_8_1_DXMUX_916
    );
  reg_8_1_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_0_IBUF_657,
      O => reg_8_1_DYMUX_909
    );
  reg_8_1_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_8_1_SRINV_907
    );
  reg_8_1_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_8_1_CLKINV_906
    );
  reg_8_1_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_8_not0001_0,
      O => reg_8_1_CEINV_905
    );
  reg_7_5_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_5_IBUF_681,
      O => reg_7_5_DXMUX_940
    );
  reg_7_5_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_4_IBUF_682,
      O => reg_7_5_DYMUX_933
    );
  reg_7_5_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_7_5_SRINV_931
    );
  reg_7_5_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_7_5_CLKINV_930
    );
  reg_7_5_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_7_0_not0002_0,
      O => reg_7_5_CEINV_929
    );
  Mmux_rd_data_mux00011487_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y21",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00011487,
      O => Mmux_rd_data_mux00011487_0
    );
  Mmux_rd_data_mux00011487_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y21",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00012112,
      O => Mmux_rd_data_mux00012112_0
    );
  reg_7_7_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X30Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_7_IBUF_663,
      O => reg_7_7_DXMUX_988
    );
  reg_7_7_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X30Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_6_IBUF_664,
      O => reg_7_7_DYMUX_981
    );
  reg_7_7_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_7_7_SRINV_979
    );
  reg_7_7_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_7_7_CLKINV_978
    );
  reg_7_7_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_7_0_not0002_0,
      O => reg_7_7_CEINV_977
    );
  reg_8_3_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_3_IBUF_668,
      O => reg_8_3_DXMUX_1012
    );
  reg_8_3_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_2_IBUF_669,
      O => reg_8_3_DYMUX_1005
    );
  reg_8_3_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_8_3_SRINV_1003
    );
  reg_8_3_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_8_3_CLKINV_1002
    );
  reg_8_3_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_8_not0001_0,
      O => reg_8_3_CEINV_1001
    );
  reg_9_1_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_1_IBUF_656,
      O => reg_9_1_DXMUX_1036
    );
  reg_9_1_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_0_IBUF_657,
      O => reg_9_1_DYMUX_1029
    );
  reg_9_1_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_9_1_SRINV_1027
    );
  reg_9_1_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_9_1_CLKINV_1026
    );
  reg_9_1_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_9_not0001_0,
      O => reg_9_1_CEINV_1025
    );
  reg_8_5_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y15",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_5_IBUF_681,
      O => reg_8_5_DXMUX_1060
    );
  reg_8_5_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y15",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_4_IBUF_682,
      O => reg_8_5_DYMUX_1053
    );
  reg_8_5_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y15",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_8_5_SRINV_1051
    );
  reg_8_5_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y15",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_8_5_CLKINV_1050
    );
  reg_8_5_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y15",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_8_not0001_0,
      O => reg_8_5_CEINV_1049
    );
  reg_9_3_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X31Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_3_IBUF_668,
      O => reg_9_3_DXMUX_1084
    );
  reg_9_3_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X31Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_2_IBUF_669,
      O => reg_9_3_DYMUX_1077
    );
  reg_9_3_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_9_3_SRINV_1075
    );
  reg_9_3_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_9_3_CLKINV_1074
    );
  reg_9_3_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_9_not0001_0,
      O => reg_9_3_CEINV_1073
    );
  reg_8_6 : X_SFF
    generic map(
      LOC => "SLICE_X28Y26",
      INIT => '0'
    )
    port map (
      I => reg_8_7_DYMUX_1101,
      CE => reg_8_7_CEINV_1097,
      CLK => reg_8_7_CLKINV_1098,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_8_7_SRINV_1099,
      O => reg_8(6)
    );
  reg_8_7 : X_SFF
    generic map(
      LOC => "SLICE_X28Y26",
      INIT => '0'
    )
    port map (
      I => reg_8_7_DXMUX_1108,
      CE => reg_8_7_CEINV_1097,
      CLK => reg_8_7_CLKINV_1098,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_8_7_SRINV_1099,
      O => reg_8(7)
    );
  reg_8_7_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y26",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_7_IBUF_663,
      O => reg_8_7_DXMUX_1108
    );
  reg_8_7_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y26",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_6_IBUF_664,
      O => reg_8_7_DYMUX_1101
    );
  reg_8_7_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y26",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_8_7_SRINV_1099
    );
  reg_8_7_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y26",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_8_7_CLKINV_1098
    );
  reg_8_7_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y26",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_8_not0001_0,
      O => reg_8_7_CEINV_1097
    );
  Mmux_rd_data_mux00011475 : X_LUT4
    generic map(
      INIT => X"C000",
      LOC => "SLICE_X29Y21"
    )
    port map (
      ADR0 => VCC,
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => rd_address_2_IBUF_703,
      ADR3 => reg_7(6),
      O => Mmux_rd_data_mux00011475_1135
    );
  Mmux_rd_data_mux00011475_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y21",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00011475_1135,
      O => Mmux_rd_data_mux00011475_0
    );
  Mmux_rd_data_mux00011475_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y21",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00012841_1127,
      O => Mmux_rd_data_mux00012841_0
    );
  Mmux_rd_data_mux00012841 : X_LUT4
    generic map(
      INIT => X"F454",
      LOC => "SLICE_X29Y21"
    )
    port map (
      ADR0 => rd_address_2_IBUF_703,
      ADR1 => reg_2(4),
      ADR2 => rd_address_0_IBUF_685,
      ADR3 => reg_7(4),
      O => Mmux_rd_data_mux00012841_1127
    );
  Mmux_rd_data_mux0001518_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y15",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux0001518_1159,
      O => Mmux_rd_data_mux0001518_0
    );
  Mmux_rd_data_mux0001518_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y15",
      PATHPULSE => 694 ps
    )
    port map (
      I => N7,
      O => N7_0
    );
  reg_9_5_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X30Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_5_IBUF_681,
      O => reg_9_5_DXMUX_1180
    );
  reg_9_5_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X30Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_4_IBUF_682,
      O => reg_9_5_DYMUX_1173
    );
  reg_9_5_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_9_5_SRINV_1171
    );
  reg_9_5_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_9_5_CLKINV_1170
    );
  reg_9_5_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_9_not0001_0,
      O => reg_9_5_CEINV_1169
    );
  Mmux_rd_data_mux000159111_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y11",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux000159111_1207,
      O => Mmux_rd_data_mux000159111_0
    );
  Mmux_rd_data_mux000159111_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y11",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux000151104_1200,
      O => Mmux_rd_data_mux000151104_0
    );
  Mmux_rd_data_mux00015936_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00015936_1231,
      O => Mmux_rd_data_mux00015936_0
    );
  Mmux_rd_data_mux00015936_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => N10,
      O => N10_0
    );
  reg_9_7_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y27",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_7_IBUF_663,
      O => reg_9_7_DXMUX_1252
    );
  reg_9_7_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y27",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_6_IBUF_664,
      O => reg_9_7_DYMUX_1245
    );
  reg_9_7_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y27",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_9_7_SRINV_1243
    );
  reg_9_7_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y27",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_9_7_CLKINV_1242
    );
  reg_9_7_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y27",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_9_not0001_0,
      O => reg_9_7_CEINV_1241
    );
  Mmux_rd_data_mux0001775_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X28Y19",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux0001775_1279,
      O => Mmux_rd_data_mux0001775_0
    );
  Mmux_rd_data_mux0001775_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X28Y19",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00014395_1271,
      O => Mmux_rd_data_mux00014395_0
    );
  reg_7_0_not0002_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y25",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_7_0_not0002,
      O => reg_7_0_not0002_0
    );
  reg_7_0_not0002_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y25",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_6_not0001,
      O => reg_6_not0001_0
    );
  Mmux_rd_data_mux0001598_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X28Y8",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux0001598_1327,
      O => Mmux_rd_data_mux0001598_0
    );
  Mmux_rd_data_mux0001598_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X28Y8",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00015923_1320,
      O => Mmux_rd_data_mux00015923_0
    );
  rd_data_not0001_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y29",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_not0001,
      O => rd_data_not0001_0
    );
  Mmux_rd_data_mux0001285_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X31Y21",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux0001285_1363,
      O => Mmux_rd_data_mux0001285_0
    );
  Mmux_rd_data_mux0001285_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X31Y21",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux0001215_1355,
      O => Mmux_rd_data_mux0001215_0
    );
  Mmux_rd_data_mux0001285 : X_LUT4
    generic map(
      INIT => X"5000",
      LOC => "SLICE_X31Y21"
    )
    port map (
      ADR0 => rd_address_2_IBUF_703,
      ADR1 => VCC,
      ADR2 => reg_9(4),
      ADR3 => rd_address_0_IBUF_685,
      O => Mmux_rd_data_mux0001285_1363
    );
  rd_data_7_OBUF : X_OBUF
    generic map(
      LOC => "PAD37"
    )
    port map (
      I => rd_data_7_O,
      O => rd_data(7)
    );
  clk_BUFGP_IBUFG : X_BUF
    generic map(
      LOC => "IPAD12",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk,
      O => clk_INBUF
    );
  wr_address_0_IBUF : X_BUF
    generic map(
      LOC => "PAD34",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_address(0),
      O => wr_address_0_INBUF
    );
  wr_address_0_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD34",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_address_0_INBUF,
      O => wr_address_0_IBUF_674
    );
  wr_address_1_IBUF : X_BUF
    generic map(
      LOC => "PAD33",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_address(1),
      O => wr_address_1_INBUF
    );
  wr_address_1_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD33",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_address_1_INBUF,
      O => wr_address_1_IBUF_673
    );
  wr_address_2_IBUF : X_BUF
    generic map(
      LOC => "PAD30",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_address(2),
      O => wr_address_2_INBUF
    );
  wr_address_3_IBUF : X_BUF
    generic map(
      LOC => "IPAD32",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_address(3),
      O => wr_address_3_INBUF
    );
  rd_address_0_IBUF : X_BUF
    generic map(
      LOC => "PAD54",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address(0),
      O => rd_address_0_INBUF
    );
  rd_address_1_IBUF : X_BUF
    generic map(
      LOC => "IPAD46",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address(1),
      O => rd_address_1_INBUF
    );
  rd_address_2_IBUF : X_BUF
    generic map(
      LOC => "PAD31",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address(2),
      O => rd_address_2_INBUF
    );
  rd_address_3_IBUF : X_BUF
    generic map(
      LOC => "PAD29",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address(3),
      O => rd_address_3_INBUF
    );
  wr_data_0_IBUF : X_BUF
    generic map(
      LOC => "PAD47",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data(0),
      O => wr_data_0_INBUF
    );
  wr_data_1_IBUF : X_BUF
    generic map(
      LOC => "PAD53",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data(1),
      O => wr_data_1_INBUF
    );
  wr_en_IBUF : X_BUF
    generic map(
      LOC => "IPAD36",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_en,
      O => wr_en_INBUF
    );
  wr_data_2_IBUF : X_BUF
    generic map(
      LOC => "PAD52",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data(2),
      O => wr_data_2_INBUF
    );
  wr_data_3_IBUF : X_BUF
    generic map(
      LOC => "PAD45",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data(3),
      O => wr_data_3_INBUF
    );
  wr_data_4_IBUF : X_BUF
    generic map(
      LOC => "IPAD50",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data(4),
      O => wr_data_4_INBUF
    );
  wr_data_5_IBUF : X_BUF
    generic map(
      LOC => "PAD49",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data(5),
      O => wr_data_5_INBUF
    );
  wr_data_6_IBUF : X_BUF
    generic map(
      LOC => "IPAD41",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data(6),
      O => wr_data_6_INBUF
    );
  wr_data_7_IBUF : X_BUF
    generic map(
      LOC => "PAD40",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data(7),
      O => wr_data_7_INBUF
    );
  rd_en_IBUF : X_BUF
    generic map(
      LOC => "PAD35",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_en,
      O => rd_en_INBUF
    );
  rd_data_0_OBUF : X_OBUF
    generic map(
      LOC => "PAD51"
    )
    port map (
      I => rd_data_0_O,
      O => rd_data(0)
    );
  rd_data_1_OBUF : X_OBUF
    generic map(
      LOC => "PAD48"
    )
    port map (
      I => rd_data_1_O,
      O => rd_data(1)
    );
  rd_data_2_OBUF : X_OBUF
    generic map(
      LOC => "PAD43"
    )
    port map (
      I => rd_data_2_O,
      O => rd_data(2)
    );
  rd_data_3_OBUF : X_OBUF
    generic map(
      LOC => "PAD42"
    )
    port map (
      I => rd_data_3_O,
      O => rd_data(3)
    );
  rst_IBUF : X_BUF
    generic map(
      LOC => "PAD28",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst,
      O => rst_INBUF
    );
  rst_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD28",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_INBUF,
      O => rst_IBUF_660
    );
  rd_data_4_OBUF : X_OBUF
    generic map(
      LOC => "PAD44"
    )
    port map (
      I => rd_data_4_O,
      O => rd_data(4)
    );
  rd_data_5_OBUF : X_OBUF
    generic map(
      LOC => "PAD39"
    )
    port map (
      I => rd_data_5_O,
      O => rd_data(5)
    );
  rd_data_6_OBUF : X_OBUF
    generic map(
      LOC => "PAD38"
    )
    port map (
      I => rd_data_6_O,
      O => rd_data(6)
    );
  clk_BUFGP_BUFG : X_BUFGMUX
    generic map(
      LOC => "BUFGMUX_X2Y10"
    )
    port map (
      I0 => clk_BUFGP_BUFG_I0_INV,
      I1 => GND,
      S => clk_BUFGP_BUFG_S_INVNOT,
      O => clk_BUFGP
    );
  clk_BUFGP_BUFG_SINV : X_INV
    generic map(
      LOC => "BUFGMUX_X2Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => '1',
      O => clk_BUFGP_BUFG_S_INVNOT
    );
  clk_BUFGP_BUFG_I0_USED : X_BUF
    generic map(
      LOC => "BUFGMUX_X2Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_INBUF,
      O => clk_BUFGP_BUFG_I0_INV
    );
  N4_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X31Y15",
      PATHPULSE => 694 ps
    )
    port map (
      I => N4_F5MUX_1578,
      O => N4
    );
  N4_F5MUX : X_MUX2
    generic map(
      LOC => "SLICE_X31Y15"
    )
    port map (
      IA => N24,
      IB => N25,
      SEL => N4_BXINV_1570,
      O => N4_F5MUX_1578
    );
  N4_BXINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y15",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address_0_IBUF_685,
      O => N4_BXINV_1570
    );
  Mmux_rd_data_mux0001727_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y27",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux0001727_F5MUX_1603,
      O => Mmux_rd_data_mux0001727
    );
  Mmux_rd_data_mux0001727_F5MUX : X_MUX2
    generic map(
      LOC => "SLICE_X29Y27"
    )
    port map (
      IA => N16,
      IB => N17,
      SEL => Mmux_rd_data_mux0001727_BXINV_1595,
      O => Mmux_rd_data_mux0001727_F5MUX_1603
    );
  Mmux_rd_data_mux0001727_BXINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y27",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address_2_IBUF_703,
      O => Mmux_rd_data_mux0001727_BXINV_1595
    );
  Mmux_rd_data_mux00011427_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y26",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00011427_F5MUX_1628,
      O => Mmux_rd_data_mux00011427
    );
  Mmux_rd_data_mux00011427_F5MUX : X_MUX2
    generic map(
      LOC => "SLICE_X29Y26"
    )
    port map (
      IA => N18,
      IB => N19,
      SEL => Mmux_rd_data_mux00011427_BXINV_1620,
      O => Mmux_rd_data_mux00011427_F5MUX_1628
    );
  Mmux_rd_data_mux00011427_BXINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y26",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address_2_IBUF_703,
      O => Mmux_rd_data_mux00011427_BXINV_1620
    );
  rd_data_0_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y11",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_0_F5MUX_1657,
      O => rd_data_0_DXMUX_1659
    );
  rd_data_0_F5MUX : X_MUX2
    generic map(
      LOC => "SLICE_X28Y11"
    )
    port map (
      IA => N14,
      IB => N15,
      SEL => rd_data_0_BXINV_1650,
      O => rd_data_0_F5MUX_1657
    );
  rd_data_0_BXINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y11",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address_1_IBUF_687,
      O => rd_data_0_BXINV_1650
    );
  rd_data_0_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y11",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => rd_data_0_CLKINV_1643
    );
  rd_data_0_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y11",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_not0001_0,
      O => rd_data_0_CEINV_1642
    );
  Mmux_rd_data_mux00015135_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y9",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00015135_F5MUX_1687,
      O => Mmux_rd_data_mux00015135
    );
  Mmux_rd_data_mux00015135_F5MUX : X_MUX2
    generic map(
      LOC => "SLICE_X29Y9"
    )
    port map (
      IA => N22,
      IB => N23,
      SEL => Mmux_rd_data_mux00015135_BXINV_1679,
      O => Mmux_rd_data_mux00015135_F5MUX_1687
    );
  Mmux_rd_data_mux00015135_BXINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y9",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address_0_IBUF_685,
      O => Mmux_rd_data_mux00015135_BXINV_1679
    );
  Mmux_rd_data_mux00013627_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X31Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00013627_F5MUX_1712,
      O => Mmux_rd_data_mux00013627
    );
  Mmux_rd_data_mux00013627_F5MUX : X_MUX2
    generic map(
      LOC => "SLICE_X31Y16"
    )
    port map (
      IA => N20,
      IB => N21,
      SEL => Mmux_rd_data_mux00013627_BXINV_1704,
      O => Mmux_rd_data_mux00013627_F5MUX_1712
    );
  Mmux_rd_data_mux00013627_BXINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address_2_IBUF_703,
      O => Mmux_rd_data_mux00013627_BXINV_1704
    );
  N26_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X31Y29",
      PATHPULSE => 694 ps
    )
    port map (
      I => N26_F5MUX_1737,
      O => N26
    );
  N26_F5MUX : X_MUX2
    generic map(
      LOC => "SLICE_X31Y29"
    )
    port map (
      IA => N26_G,
      IB => reg_6_not00011,
      SEL => N26_BXINV_1730,
      O => N26_F5MUX_1737
    );
  N26_BXINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y29",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_en_IBUF_736,
      O => N26_BXINV_1730
    );
  rd_data_5_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y24",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_mux0001(2),
      O => rd_data_5_DXMUX_1767
    );
  rd_data_5_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y24",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00012116_O_pack_1,
      O => Mmux_rd_data_mux00012116_O
    );
  rd_data_5_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y24",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => rd_data_5_CLKINV_1752
    );
  rd_data_5_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y24",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_not0001_0,
      O => rd_data_5_CEINV_1751
    );
  Mmux_rd_data_mux000114107_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X31Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux000114107_1793,
      O => Mmux_rd_data_mux000114107_0
    );
  Mmux_rd_data_mux000114107_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X31Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00011483_O_pack_1,
      O => Mmux_rd_data_mux00011483_O
    );
  Mmux_rd_data_mux000114107 : X_LUT4
    generic map(
      INIT => X"F800",
      LOC => "SLICE_X31Y22"
    )
    port map (
      ADR0 => Mmux_rd_data_mux00011487_0,
      ADR1 => Mmux_rd_data_mux00011483_O,
      ADR2 => Mmux_rd_data_mux00011475_0,
      ADR3 => rd_address_1_IBUF_687,
      O => Mmux_rd_data_mux000114107_1793
    );
  Mmux_rd_data_mux000114118 : X_LUT4
    generic map(
      INIT => X"FAF8",
      LOC => "SLICE_X29Y23"
    )
    port map (
      ADR0 => rd_address_3_IBUF_686,
      ADR1 => Mmux_rd_data_mux00011427,
      ADR2 => Mmux_rd_data_mux000114107_0,
      ADR3 => Mmux_rd_data_mux00011445_O,
      O => rd_data_mux0001(1)
    );
  rd_data_6 : X_FF
    generic map(
      LOC => "SLICE_X29Y23",
      INIT => '0'
    )
    port map (
      I => rd_data_6_DXMUX_1824,
      CE => rd_data_6_CEINV_1808,
      CLK => rd_data_6_CLKINV_1809,
      SET => GND,
      RST => GND,
      O => rd_data_6_743
    );
  rd_data_6_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_mux0001(1),
      O => rd_data_6_DXMUX_1824
    );
  rd_data_6_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00011445_O_pack_1,
      O => Mmux_rd_data_mux00011445_O
    );
  rd_data_6_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => rd_data_6_CLKINV_1809
    );
  rd_data_6_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_not0001_0,
      O => rd_data_6_CEINV_1808
    );
  Mmux_rd_data_mux00011445 : X_LUT4
    generic map(
      INIT => X"CE00",
      LOC => "SLICE_X29Y23"
    )
    port map (
      ADR0 => reg_10(6),
      ADR1 => N13,
      ADR2 => rd_address_2_IBUF_703,
      ADR3 => rd_address_1_IBUF_687,
      O => Mmux_rd_data_mux00011445_O_pack_1
    );
  Mmux_rd_data_mux00012816 : X_LUT4
    generic map(
      INIT => X"CC40",
      LOC => "SLICE_X29Y19"
    )
    port map (
      ADR0 => rd_address_2_IBUF_703,
      ADR1 => Mmux_rd_data_mux00012112_0,
      ADR2 => reg_10(4),
      ADR3 => N13,
      O => Mmux_rd_data_mux00012816_1850
    );
  Mmux_rd_data_mux00012816_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y19",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00012816_1850,
      O => Mmux_rd_data_mux00012816_0
    );
  Mmux_rd_data_mux00012816_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y19",
      PATHPULSE => 694 ps
    )
    port map (
      I => N13_pack_2,
      O => N13
    );
  Mmux_rd_data_mux000121211 : X_LUT4
    generic map(
      INIT => X"FAF0",
      LOC => "SLICE_X29Y19"
    )
    port map (
      ADR0 => rd_address_2_IBUF_703,
      ADR1 => VCC,
      ADR2 => rd_address_0_IBUF_685,
      ADR3 => reg_14(0),
      O => N13_pack_2
    );
  Mmux_rd_data_mux000143118 : X_LUT4
    generic map(
      INIT => X"DC00",
      LOC => "SLICE_X30Y19"
    )
    port map (
      ADR0 => rd_address_1_IBUF_687,
      ADR1 => Mmux_rd_data_mux00014384_O,
      ADR2 => Mmux_rd_data_mux00014395_0,
      ADR3 => rd_address_3_IBUF_686,
      O => Mmux_rd_data_mux000143118_1874
    );
  Mmux_rd_data_mux000143118_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y19",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux000143118_1874,
      O => Mmux_rd_data_mux000143118_0
    );
  Mmux_rd_data_mux000143118_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y19",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00014384_O_pack_1,
      O => Mmux_rd_data_mux00014384_O
    );
  Mmux_rd_data_mux00014384 : X_LUT4
    generic map(
      INIT => X"00A0",
      LOC => "SLICE_X30Y19"
    )
    port map (
      ADR0 => rd_address_0_IBUF_685,
      ADR1 => VCC,
      ADR2 => reg_9(2),
      ADR3 => rd_address_2_IBUF_703,
      O => Mmux_rd_data_mux00014384_O_pack_1
    );
  Mmux_rd_data_mux000143127 : X_LUT4
    generic map(
      INIT => X"FCF8",
      LOC => "SLICE_X31Y19"
    )
    port map (
      ADR0 => N4,
      ADR1 => rd_address_1_IBUF_687,
      ADR2 => Mmux_rd_data_mux000143118_0,
      ADR3 => Mmux_rd_data_mux00014335_O,
      O => rd_data_mux0001(5)
    );
  rd_data_2 : X_FF
    generic map(
      LOC => "SLICE_X31Y19",
      INIT => '0'
    )
    port map (
      I => rd_data_2_DXMUX_1905,
      CE => rd_data_2_CEINV_1889,
      CLK => rd_data_2_CLKINV_1890,
      SET => GND,
      RST => GND,
      O => rd_data_2_739
    );
  rd_data_2_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X31Y19",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_mux0001(5),
      O => rd_data_2_DXMUX_1905
    );
  rd_data_2_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X31Y19",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00014335_O_pack_1,
      O => Mmux_rd_data_mux00014335_O
    );
  rd_data_2_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y19",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => rd_data_2_CLKINV_1890
    );
  rd_data_2_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y19",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_not0001_0,
      O => rd_data_2_CEINV_1889
    );
  Mmux_rd_data_mux00014335 : X_LUT4
    generic map(
      INIT => X"5410",
      LOC => "SLICE_X31Y19"
    )
    port map (
      ADR0 => rd_address_2_IBUF_703,
      ADR1 => rd_address_3_IBUF_686,
      ADR2 => reg_2(2),
      ADR3 => reg_10(2),
      O => Mmux_rd_data_mux00014335_O_pack_1
    );
  rd_data_1_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y13",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_mux0001(6),
      O => rd_data_1_DXMUX_1938
    );
  rd_data_1_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X28Y13",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux000151136_O_pack_2,
      O => Mmux_rd_data_mux000151136_O
    );
  rd_data_1_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y13",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => rd_data_1_CLKINV_1923
    );
  rd_data_1_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y13",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_not0001_0,
      O => rd_data_1_CEINV_1922
    );
  Mmux_rd_data_mux00017107_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00017107_1964,
      O => Mmux_rd_data_mux00017107_0
    );
  Mmux_rd_data_mux00017107_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux0001783_O_pack_1,
      O => Mmux_rd_data_mux0001783_O
    );
  Mmux_rd_data_mux000136114_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y15",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux000136114_1988,
      O => Mmux_rd_data_mux000136114_0
    );
  Mmux_rd_data_mux000136114_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y15",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00013691_O_pack_1,
      O => Mmux_rd_data_mux00013691_O
    );
  rd_data_7_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y25",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_mux0001(0),
      O => rd_data_7_DXMUX_2019
    );
  rd_data_7_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y25",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux0001745_O_pack_1,
      O => Mmux_rd_data_mux0001745_O
    );
  rd_data_7_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y25",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => rd_data_7_CLKINV_2004
    );
  rd_data_7_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y25",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_not0001_0,
      O => rd_data_7_CEINV_2003
    );
  N6_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X28Y21",
      PATHPULSE => 694 ps
    )
    port map (
      I => N6,
      O => N6_0
    );
  N6_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X28Y21",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00012853_O_pack_1,
      O => Mmux_rd_data_mux00012853_O
    );
  rd_data_4_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_mux0001(3),
      O => rd_data_4_DXMUX_2076
    );
  rd_data_4_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X28Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00012891_O_pack_1,
      O => Mmux_rd_data_mux00012891_O
    );
  rd_data_4_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => rd_data_4_CLKINV_2061
    );
  rd_data_4_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_not0001_0,
      O => rd_data_4_CEINV_2060
    );
  rd_data_3_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X30Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_mux0001(4),
      O => rd_data_3_DXMUX_2109
    );
  rd_data_3_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00013645_O_pack_1,
      O => Mmux_rd_data_mux00013645_O
    );
  rd_data_3_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => rd_data_3_CLKINV_2094
    );
  rd_data_3_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_not0001_0,
      O => rd_data_3_CEINV_2093
    );
  N8_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X28Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => N8,
      O => N8_0
    );
  N8_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X28Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00012153_O_pack_1,
      O => Mmux_rd_data_mux00012153_O
    );
  reg_8_not0001_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y27",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_8_not0001,
      O => reg_8_not0001_0
    );
  reg_8_not00011 : X_LUT4
    generic map(
      INIT => X"0400",
      LOC => "SLICE_X30Y27"
    )
    port map (
      ADR0 => wr_address_0_IBUF_674,
      ADR1 => N111,
      ADR2 => wr_address_1_IBUF_673,
      ADR3 => wr_address_3_IBUF_675,
      O => reg_8_not0001
    );
  Mmux_rd_data_mux00012191 : X_LUT4
    generic map(
      INIT => X"B3A2",
      LOC => "SLICE_X29Y14"
    )
    port map (
      ADR0 => rd_address_2_IBUF_703,
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => reg_13(5),
      ADR3 => reg_8(5),
      O => Mmux_rd_data_mux00012191_2171
    );
  Mmux_rd_data_mux00012191_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00012191_2171,
      O => Mmux_rd_data_mux00012191_0
    );
  Mmux_rd_data_mux00012191_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00015992_2164,
      O => Mmux_rd_data_mux00015992_0
    );
  Mmux_rd_data_mux00015992 : X_LUT4
    generic map(
      INIT => X"ECA0",
      LOC => "SLICE_X29Y14"
    )
    port map (
      ADR0 => reg_6(0),
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => Mmux_rd_data_mux0001438_796,
      ADR3 => reg_7(0),
      O => Mmux_rd_data_mux00015992_2164
    );
  Mmux_rd_data_mux00015185 : X_LUT4
    generic map(
      INIT => X"ECA0",
      LOC => "SLICE_X29Y13"
    )
    port map (
      ADR0 => Mmux_rd_data_mux0001438_796,
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => reg_6(1),
      ADR3 => reg_7(1),
      O => Mmux_rd_data_mux00015185_2195
    );
  Mmux_rd_data_mux00015185_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y13",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00015185_2195,
      O => Mmux_rd_data_mux00015185_0
    );
  Mmux_rd_data_mux00015185_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X29Y13",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux0001438_pack_2,
      O => Mmux_rd_data_mux0001438_796
    );
  Mmux_rd_data_mux0001438 : X_LUT4
    generic map(
      INIT => X"0202",
      LOC => "SLICE_X29Y13"
    )
    port map (
      ADR0 => rd_address_2_IBUF_703,
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => rd_address_3_IBUF_686,
      ADR3 => VCC,
      O => Mmux_rd_data_mux0001438_pack_2
    );
  reg_10_0 : X_SFF
    generic map(
      LOC => "SLICE_X28Y10",
      INIT => '0'
    )
    port map (
      I => reg_10_1_DYMUX_2209,
      CE => reg_10_1_CEINV_2205,
      CLK => reg_10_1_CLKINV_2206,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_10_1_SRINV_2207,
      O => reg_10(0)
    );
  reg_10_1_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_1_IBUF_656,
      O => reg_10_1_DXMUX_2216
    );
  reg_10_1_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_0_IBUF_657,
      O => reg_10_1_DYMUX_2209
    );
  reg_10_1_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_10_1_SRINV_2207
    );
  reg_10_1_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_10_1_CLKINV_2206
    );
  reg_10_1_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y10",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_10_not0001_0,
      O => reg_10_1_CEINV_2205
    );
  reg_10_3_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X31Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_3_IBUF_668,
      O => reg_10_3_DXMUX_2240
    );
  reg_10_3_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X31Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_2_IBUF_669,
      O => reg_10_3_DYMUX_2233
    );
  reg_10_3_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_10_3_SRINV_2231
    );
  reg_10_3_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_10_3_CLKINV_2230
    );
  reg_10_3_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_10_not0001_0,
      O => reg_10_3_CEINV_2229
    );
  reg_10_5_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X31Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_5_IBUF_681,
      O => reg_10_5_DXMUX_2264
    );
  reg_10_5_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X31Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_4_IBUF_682,
      O => reg_10_5_DYMUX_2257
    );
  reg_10_5_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_10_5_SRINV_2255
    );
  reg_10_5_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_10_5_CLKINV_2254
    );
  reg_10_5_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_10_not0001_0,
      O => reg_10_5_CEINV_2253
    );
  reg_13_not0001_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X31Y28",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_13_not0001_2291,
      O => reg_13_not0001_0
    );
  reg_13_not0001_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X31Y28",
      PATHPULSE => 694 ps
    )
    port map (
      I => N01_pack_1,
      O => N01
    );
  reg_10_7_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X31Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_7_IBUF_663,
      O => reg_10_7_DXMUX_2312
    );
  reg_10_7_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X31Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_6_IBUF_664,
      O => reg_10_7_DYMUX_2305
    );
  reg_10_7_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_10_7_SRINV_2303
    );
  reg_10_7_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_10_7_CLKINV_2302
    );
  reg_10_7_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_10_not0001_0,
      O => reg_10_7_CEINV_2301
    );
  reg_9_not0001_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y28",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_9_not0001,
      O => reg_9_not0001_0
    );
  reg_9_not0001_YUSED : X_BUF
    generic map(
      LOC => "SLICE_X30Y28",
      PATHPULSE => 694 ps
    )
    port map (
      I => N111_pack_1,
      O => N111
    );
  reg_2_1_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y12",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_1_IBUF_656,
      O => reg_2_1_DXMUX_2360
    );
  reg_2_1_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y12",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_0_IBUF_657,
      O => reg_2_1_DYMUX_2353
    );
  reg_2_1_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y12",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_2_1_SRINV_2351
    );
  reg_2_1_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y12",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_2_1_CLKINV_2350
    );
  reg_2_1_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y12",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_2_not0001_0,
      O => reg_2_1_CEINV_2349
    );
  reg_13_1_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y8",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_5_IBUF_681,
      O => reg_13_1_DXMUX_2384
    );
  reg_13_1_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y8",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_4_IBUF_682,
      O => reg_13_1_DYMUX_2377
    );
  reg_13_1_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y8",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_13_1_SRINV_2375
    );
  reg_13_1_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y8",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_13_1_CLKINV_2374
    );
  reg_13_1_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y8",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_13_not0001_0,
      O => reg_13_1_CEINV_2373
    );
  reg_2_3_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X30Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_3_IBUF_668,
      O => reg_2_3_DXMUX_2408
    );
  reg_2_3_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X30Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_2_IBUF_669,
      O => reg_2_3_DYMUX_2401
    );
  reg_2_3_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_2_3_SRINV_2399
    );
  reg_2_3_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_2_3_CLKINV_2398
    );
  reg_2_3_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_2_not0001_0,
      O => reg_2_3_CEINV_2397
    );
  reg_13_3_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_7_IBUF_663,
      O => reg_13_3_DXMUX_2432
    );
  reg_13_3_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_6_IBUF_664,
      O => reg_13_3_DYMUX_2425
    );
  reg_13_3_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_13_3_SRINV_2423
    );
  reg_13_3_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_13_3_CLKINV_2422
    );
  reg_13_3_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y18",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_13_not0001_0,
      O => reg_13_3_CEINV_2421
    );
  Mmux_rd_data_mux00012141_XUSED : X_BUF
    generic map(
      LOC => "SLICE_X28Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => Mmux_rd_data_mux00012141_2447,
      O => Mmux_rd_data_mux00012141_0
    );
  reg_2_5_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X26Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_5_IBUF_681,
      O => reg_2_5_DXMUX_2468
    );
  reg_2_5_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X26Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_4_IBUF_682,
      O => reg_2_5_DYMUX_2461
    );
  reg_2_5_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X26Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_2_5_SRINV_2459
    );
  reg_2_5_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X26Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_2_5_CLKINV_2458
    );
  reg_2_5_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X26Y22",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_2_not0001_0,
      O => reg_2_5_CEINV_2457
    );
  reg_13_5_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_2_IBUF_669,
      O => reg_13_5_DXMUX_2492
    );
  reg_13_5_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_3_IBUF_668,
      O => reg_13_5_DYMUX_2485
    );
  reg_13_5_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_13_5_SRINV_2483
    );
  reg_13_5_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_13_5_CLKINV_2482
    );
  reg_13_5_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y16",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_13_not0001_0,
      O => reg_13_5_CEINV_2481
    );
  reg_14_0_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_14_0_BYINV_2504,
      O => reg_14_0_DYMUX_2505
    );
  reg_14_0_BYINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => '0',
      O => reg_14_0_BYINV_2504
    );
  reg_14_0_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_14_0_CLKINV_2503
    );
  reg_14_0_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y17",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_14_0_CEINV_2502
    );
  reg_2_7_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X30Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_7_IBUF_663,
      O => reg_2_7_DXMUX_2528
    );
  reg_2_7_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X30Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_6_IBUF_664,
      O => reg_2_7_DYMUX_2521
    );
  reg_2_7_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_2_7_SRINV_2519
    );
  reg_2_7_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_2_7_CLKINV_2518
    );
  reg_2_7_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X30Y23",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_2_not0001_0,
      O => reg_2_7_CEINV_2517
    );
  reg_13_7_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y24",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_0_IBUF_657,
      O => reg_13_7_DXMUX_2552
    );
  reg_13_7_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y24",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_1_IBUF_656,
      O => reg_13_7_DYMUX_2545
    );
  reg_13_7_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y24",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_13_7_SRINV_2543
    );
  reg_13_7_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y24",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_13_7_CLKINV_2542
    );
  reg_13_7_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y24",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_13_not0001_0,
      O => reg_13_7_CEINV_2541
    );
  reg_6_1_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_1_IBUF_656,
      O => reg_6_1_DXMUX_2576
    );
  reg_6_1_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X28Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_0_IBUF_657,
      O => reg_6_1_DYMUX_2569
    );
  reg_6_1_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_6_1_SRINV_2567
    );
  reg_6_1_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_6_1_CLKINV_2566
    );
  reg_6_1_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X28Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_6_not0001_0,
      O => reg_6_1_CEINV_2565
    );
  reg_6_3_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X31Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_3_IBUF_668,
      O => reg_6_3_DXMUX_2600
    );
  reg_6_3_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X31Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_2_IBUF_669,
      O => reg_6_3_DYMUX_2593
    );
  reg_6_3_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_6_3_SRINV_2591
    );
  reg_6_3_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_6_3_CLKINV_2590
    );
  reg_6_3_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X31Y14",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_6_not0001_0,
      O => reg_6_3_CEINV_2589
    );
  reg_6_5_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_5_IBUF_681,
      O => reg_6_5_DXMUX_2624
    );
  reg_6_5_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X29Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_4_IBUF_682,
      O => reg_6_5_DYMUX_2617
    );
  reg_6_5_SRINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => rst_IBUF_660,
      O => reg_6_5_SRINV_2615
    );
  reg_6_5_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => clk_BUFGP,
      O => reg_6_5_CLKINV_2614
    );
  reg_6_5_CEINV : X_BUF
    generic map(
      LOC => "SLICE_X29Y20",
      PATHPULSE => 694 ps
    )
    port map (
      I => reg_6_not0001_0,
      O => reg_6_5_CEINV_2613
    );
  reg_7_0 : X_SFF
    generic map(
      LOC => "SLICE_X28Y12",
      INIT => '1'
    )
    port map (
      I => reg_7_1_DYMUX_813,
      CE => reg_7_1_CEINV_809,
      CLK => reg_7_1_CLKINV_810,
      SET => GND,
      RST => GND,
      SSET => reg_7_1_SRINV_811,
      SRST => GND,
      O => reg_7(0)
    );
  reg_7_1 : X_SFF
    generic map(
      LOC => "SLICE_X28Y12",
      INIT => '1'
    )
    port map (
      I => reg_7_1_DXMUX_820,
      CE => reg_7_1_CEINV_809,
      CLK => reg_7_1_CLKINV_810,
      SET => GND,
      RST => GND,
      SSET => reg_7_1_SRINV_811,
      SRST => GND,
      O => reg_7(1)
    );
  reg_6_6 : X_SFF
    generic map(
      LOC => "SLICE_X28Y25",
      INIT => '0'
    )
    port map (
      I => reg_6_7_DYMUX_837,
      CE => reg_6_7_CEINV_833,
      CLK => reg_6_7_CLKINV_834,
      SET => GND,
      RST => GND,
      SSET => reg_6_7_SRINV_835,
      SRST => GND,
      O => reg_6(6)
    );
  reg_6_7 : X_SFF
    generic map(
      LOC => "SLICE_X28Y25",
      INIT => '0'
    )
    port map (
      I => reg_6_7_DXMUX_844,
      CE => reg_6_7_CEINV_833,
      CLK => reg_6_7_CLKINV_834,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_6_7_SRINV_835,
      O => reg_6(7)
    );
  reg_7_2 : X_SFF
    generic map(
      LOC => "SLICE_X30Y14",
      INIT => '1'
    )
    port map (
      I => reg_7_3_DYMUX_861,
      CE => reg_7_3_CEINV_857,
      CLK => reg_7_3_CLKINV_858,
      SET => GND,
      RST => GND,
      SSET => reg_7_3_SRINV_859,
      SRST => GND,
      O => reg_7(2)
    );
  reg_7_3 : X_SFF
    generic map(
      LOC => "SLICE_X30Y14",
      INIT => '0'
    )
    port map (
      I => reg_7_3_DXMUX_868,
      CE => reg_7_3_CEINV_857,
      CLK => reg_7_3_CLKINV_858,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_7_3_SRINV_859,
      O => reg_7(3)
    );
  reg_2_not00011 : X_LUT4
    generic map(
      INIT => X"0040",
      LOC => "SLICE_X30Y26"
    )
    port map (
      ADR0 => wr_address_0_IBUF_674,
      ADR1 => N111,
      ADR2 => wr_address_1_IBUF_673,
      ADR3 => wr_address_3_IBUF_675,
      O => reg_2_not0001
    );
  reg_10_not00011 : X_LUT4
    generic map(
      INIT => X"4000",
      LOC => "SLICE_X30Y26"
    )
    port map (
      ADR0 => wr_address_0_IBUF_674,
      ADR1 => N111,
      ADR2 => wr_address_1_IBUF_673,
      ADR3 => wr_address_3_IBUF_675,
      O => reg_10_not0001
    );
  reg_8_1 : X_SFF
    generic map(
      LOC => "SLICE_X29Y10",
      INIT => '0'
    )
    port map (
      I => reg_8_1_DXMUX_916,
      CE => reg_8_1_CEINV_905,
      CLK => reg_8_1_CLKINV_906,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_8_1_SRINV_907,
      O => reg_8(1)
    );
  reg_7_4 : X_SFF
    generic map(
      LOC => "SLICE_X28Y20",
      INIT => '0'
    )
    port map (
      I => reg_7_5_DYMUX_933,
      CE => reg_7_5_CEINV_929,
      CLK => reg_7_5_CLKINV_930,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_7_5_SRINV_931,
      O => reg_7(4)
    );
  reg_7_5 : X_SFF
    generic map(
      LOC => "SLICE_X28Y20",
      INIT => '0'
    )
    port map (
      I => reg_7_5_DXMUX_940,
      CE => reg_7_5_CEINV_929,
      CLK => reg_7_5_CLKINV_930,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_7_5_SRINV_931,
      O => reg_7(5)
    );
  Mmux_rd_data_mux00012812 : X_LUT4
    generic map(
      INIT => X"F000",
      LOC => "SLICE_X30Y21"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => rd_address_1_IBUF_687,
      ADR3 => rd_address_3_IBUF_686,
      O => Mmux_rd_data_mux00012112
    );
  Mmux_rd_data_mux0001787 : X_LUT4
    generic map(
      INIT => X"0033",
      LOC => "SLICE_X30Y21"
    )
    port map (
      ADR0 => VCC,
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => VCC,
      ADR3 => rd_address_3_IBUF_686,
      O => Mmux_rd_data_mux00011487
    );
  reg_7_6 : X_SFF
    generic map(
      LOC => "SLICE_X30Y20",
      INIT => '0'
    )
    port map (
      I => reg_7_7_DYMUX_981,
      CE => reg_7_7_CEINV_977,
      CLK => reg_7_7_CLKINV_978,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_7_7_SRINV_979,
      O => reg_7(6)
    );
  reg_7_7 : X_SFF
    generic map(
      LOC => "SLICE_X30Y20",
      INIT => '0'
    )
    port map (
      I => reg_7_7_DXMUX_988,
      CE => reg_7_7_CEINV_977,
      CLK => reg_7_7_CLKINV_978,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_7_7_SRINV_979,
      O => reg_7(7)
    );
  reg_8_2 : X_SFF
    generic map(
      LOC => "SLICE_X28Y17",
      INIT => '0'
    )
    port map (
      I => reg_8_3_DYMUX_1005,
      CE => reg_8_3_CEINV_1001,
      CLK => reg_8_3_CLKINV_1002,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_8_3_SRINV_1003,
      O => reg_8(2)
    );
  reg_8_3 : X_SFF
    generic map(
      LOC => "SLICE_X28Y17",
      INIT => '1'
    )
    port map (
      I => reg_8_3_DXMUX_1012,
      CE => reg_8_3_CEINV_1001,
      CLK => reg_8_3_CLKINV_1002,
      SET => GND,
      RST => GND,
      SSET => reg_8_3_SRINV_1003,
      SRST => GND,
      O => reg_8(3)
    );
  reg_9_0 : X_SFF
    generic map(
      LOC => "SLICE_X29Y18",
      INIT => '1'
    )
    port map (
      I => reg_9_1_DYMUX_1029,
      CE => reg_9_1_CEINV_1025,
      CLK => reg_9_1_CLKINV_1026,
      SET => GND,
      RST => GND,
      SSET => reg_9_1_SRINV_1027,
      SRST => GND,
      O => reg_9(0)
    );
  reg_9_1 : X_SFF
    generic map(
      LOC => "SLICE_X29Y18",
      INIT => '0'
    )
    port map (
      I => reg_9_1_DXMUX_1036,
      CE => reg_9_1_CEINV_1025,
      CLK => reg_9_1_CLKINV_1026,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_9_1_SRINV_1027,
      O => reg_9(1)
    );
  reg_8_4 : X_SFF
    generic map(
      LOC => "SLICE_X28Y15",
      INIT => '0'
    )
    port map (
      I => reg_8_5_DYMUX_1053,
      CE => reg_8_5_CEINV_1049,
      CLK => reg_8_5_CLKINV_1050,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_8_5_SRINV_1051,
      O => reg_8(4)
    );
  reg_8_5 : X_SFF
    generic map(
      LOC => "SLICE_X28Y15",
      INIT => '0'
    )
    port map (
      I => reg_8_5_DXMUX_1060,
      CE => reg_8_5_CEINV_1049,
      CLK => reg_8_5_CLKINV_1050,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_8_5_SRINV_1051,
      O => reg_8(5)
    );
  reg_9_2 : X_SFF
    generic map(
      LOC => "SLICE_X31Y17",
      INIT => '0'
    )
    port map (
      I => reg_9_3_DYMUX_1077,
      CE => reg_9_3_CEINV_1073,
      CLK => reg_9_3_CLKINV_1074,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_9_3_SRINV_1075,
      O => reg_9(2)
    );
  reg_9_3 : X_SFF
    generic map(
      LOC => "SLICE_X31Y17",
      INIT => '1'
    )
    port map (
      I => reg_9_3_DXMUX_1084,
      CE => reg_9_3_CEINV_1073,
      CLK => reg_9_3_CLKINV_1074,
      SET => GND,
      RST => GND,
      SSET => reg_9_3_SRINV_1075,
      SRST => GND,
      O => reg_9(3)
    );
  Mmux_rd_data_mux000143111 : X_LUT4
    generic map(
      INIT => X"AC8C",
      LOC => "SLICE_X29Y15"
    )
    port map (
      ADR0 => rd_address_3_IBUF_686,
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => rd_address_2_IBUF_703,
      ADR3 => reg_14(0),
      O => N7
    );
  Mmux_rd_data_mux0001518 : X_LUT4
    generic map(
      INIT => X"0080",
      LOC => "SLICE_X29Y15"
    )
    port map (
      ADR0 => rd_address_3_IBUF_686,
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => reg_9(1),
      ADR3 => rd_address_2_IBUF_703,
      O => Mmux_rd_data_mux0001518_1159
    );
  reg_9_4 : X_SFF
    generic map(
      LOC => "SLICE_X30Y22",
      INIT => '0'
    )
    port map (
      I => reg_9_5_DYMUX_1173,
      CE => reg_9_5_CEINV_1169,
      CLK => reg_9_5_CLKINV_1170,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_9_5_SRINV_1171,
      O => reg_9(4)
    );
  reg_9_5 : X_SFF
    generic map(
      LOC => "SLICE_X30Y22",
      INIT => '0'
    )
    port map (
      I => reg_9_5_DXMUX_1180,
      CE => reg_9_5_CEINV_1169,
      CLK => reg_9_5_CLKINV_1170,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_9_5_SRINV_1171,
      O => reg_9(5)
    );
  Mmux_rd_data_mux000151104 : X_LUT4
    generic map(
      INIT => X"3202",
      LOC => "SLICE_X29Y11"
    )
    port map (
      ADR0 => reg_2(1),
      ADR1 => rd_address_2_IBUF_703,
      ADR2 => rd_address_3_IBUF_686,
      ADR3 => reg_10(1),
      O => Mmux_rd_data_mux000151104_1200
    );
  Mmux_rd_data_mux000159111 : X_LUT4
    generic map(
      INIT => X"00D8",
      LOC => "SLICE_X29Y11"
    )
    port map (
      ADR0 => rd_address_3_IBUF_686,
      ADR1 => reg_10(0),
      ADR2 => reg_2(0),
      ADR3 => rd_address_2_IBUF_703,
      O => Mmux_rd_data_mux000159111_1207
    );
  Mmux_rd_data_mux000136112_SW0 : X_LUT4
    generic map(
      INIT => X"DDDD",
      LOC => "SLICE_X30Y10"
    )
    port map (
      ADR0 => rd_address_1_IBUF_687,
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => VCC,
      ADR3 => VCC,
      O => N10
    );
  Mmux_rd_data_mux00015936 : X_LUT4
    generic map(
      INIT => X"00C0",
      LOC => "SLICE_X30Y10"
    )
    port map (
      ADR0 => VCC,
      ADR1 => reg_8(0),
      ADR2 => rd_address_3_IBUF_686,
      ADR3 => rd_address_0_IBUF_685,
      O => Mmux_rd_data_mux00015936_1231
    );
  reg_9_6 : X_SFF
    generic map(
      LOC => "SLICE_X28Y27",
      INIT => '0'
    )
    port map (
      I => reg_9_7_DYMUX_1245,
      CE => reg_9_7_CEINV_1241,
      CLK => reg_9_7_CLKINV_1242,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_9_7_SRINV_1243,
      O => reg_9(6)
    );
  reg_9_7 : X_SFF
    generic map(
      LOC => "SLICE_X28Y27",
      INIT => '0'
    )
    port map (
      I => reg_9_7_DXMUX_1252,
      CE => reg_9_7_CEINV_1241,
      CLK => reg_9_7_CLKINV_1242,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_9_7_SRINV_1243,
      O => reg_9(7)
    );
  Mmux_rd_data_mux00014395 : X_LUT4
    generic map(
      INIT => X"DC54",
      LOC => "SLICE_X28Y19"
    )
    port map (
      ADR0 => rd_address_0_IBUF_685,
      ADR1 => rd_address_2_IBUF_703,
      ADR2 => reg_8(2),
      ADR3 => reg_13(2),
      O => Mmux_rd_data_mux00014395_1271
    );
  Mmux_rd_data_mux0001775 : X_LUT4
    generic map(
      INIT => X"C000",
      LOC => "SLICE_X28Y19"
    )
    port map (
      ADR0 => VCC,
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => reg_7(7),
      ADR3 => rd_address_2_IBUF_703,
      O => Mmux_rd_data_mux0001775_1279
    );
  reg_6_not00012 : X_LUT4
    generic map(
      INIT => X"5500",
      LOC => "SLICE_X30Y25"
    )
    port map (
      ADR0 => wr_address_0_IBUF_674,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => N26,
      O => reg_6_not0001
    );
  reg_7_0_not00021 : X_LUT4
    generic map(
      INIT => X"AA00",
      LOC => "SLICE_X30Y25"
    )
    port map (
      ADR0 => wr_address_0_IBUF_674,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => N26,
      O => reg_7_0_not0002
    );
  Mmux_rd_data_mux00015923 : X_LUT4
    generic map(
      INIT => X"FA5A",
      LOC => "SLICE_X28Y8"
    )
    port map (
      ADR0 => rd_address_3_IBUF_686,
      ADR1 => VCC,
      ADR2 => rd_address_0_IBUF_685,
      ADR3 => reg_13(0),
      O => Mmux_rd_data_mux00015923_1320
    );
  Mmux_rd_data_mux0001598 : X_LUT4
    generic map(
      INIT => X"0800",
      LOC => "SLICE_X28Y8"
    )
    port map (
      ADR0 => rd_address_3_IBUF_686,
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => rd_address_2_IBUF_703,
      ADR3 => reg_9(0),
      O => Mmux_rd_data_mux0001598_1327
    );
  rd_data_not00011 : X_LUT4
    generic map(
      INIT => X"00AA",
      LOC => "SLICE_X30Y29"
    )
    port map (
      ADR0 => rd_en_IBUF_729,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => rst_IBUF_660,
      O => rd_data_not0001
    );
  Mmux_rd_data_mux0001215 : X_LUT4
    generic map(
      INIT => X"5000",
      LOC => "SLICE_X31Y21"
    )
    port map (
      ADR0 => rd_address_2_IBUF_703,
      ADR1 => VCC,
      ADR2 => rd_address_0_IBUF_685,
      ADR3 => reg_9(5),
      O => Mmux_rd_data_mux0001215_1355
    );
  wr_address_2_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD30",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_address_2_INBUF,
      O => wr_address_2_IBUF_735
    );
  wr_address_3_IFF_IMUX : X_BUF
    generic map(
      LOC => "IPAD32",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_address_3_INBUF,
      O => wr_address_3_IBUF_675
    );
  rd_address_0_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD54",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address_0_INBUF,
      O => rd_address_0_IBUF_685
    );
  rd_address_1_IFF_IMUX : X_BUF
    generic map(
      LOC => "IPAD46",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address_1_INBUF,
      O => rd_address_1_IBUF_687
    );
  rd_address_2_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD31",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address_2_INBUF,
      O => rd_address_2_IBUF_703
    );
  rd_address_3_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD29",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_address_3_INBUF,
      O => rd_address_3_IBUF_686
    );
  wr_data_0_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD47",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_0_INBUF,
      O => wr_data_0_IBUF_657
    );
  wr_data_1_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD53",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_1_INBUF,
      O => wr_data_1_IBUF_656
    );
  wr_en_IFF_IMUX : X_BUF
    generic map(
      LOC => "IPAD36",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_en_INBUF,
      O => wr_en_IBUF_736
    );
  wr_data_2_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD52",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_2_INBUF,
      O => wr_data_2_IBUF_669
    );
  wr_data_3_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD45",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_3_INBUF,
      O => wr_data_3_IBUF_668
    );
  wr_data_4_IFF_IMUX : X_BUF
    generic map(
      LOC => "IPAD50",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_4_INBUF,
      O => wr_data_4_IBUF_682
    );
  wr_data_5_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD49",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_5_INBUF,
      O => wr_data_5_IBUF_681
    );
  wr_data_6_IFF_IMUX : X_BUF
    generic map(
      LOC => "IPAD41",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_6_INBUF,
      O => wr_data_6_IBUF_664
    );
  wr_data_7_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD40",
      PATHPULSE => 694 ps
    )
    port map (
      I => wr_data_7_INBUF,
      O => wr_data_7_IBUF_663
    );
  rd_en_IFF_IMUX : X_BUF
    generic map(
      LOC => "PAD35",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_en_INBUF,
      O => rd_en_IBUF_729
    );
  Mmux_rd_data_mux00014367_SW0_G : X_LUT4
    generic map(
      INIT => X"EEFF",
      LOC => "SLICE_X31Y15"
    )
    port map (
      ADR0 => rd_address_3_IBUF_686,
      ADR1 => reg_7(2),
      ADR2 => VCC,
      ADR3 => rd_address_2_IBUF_703,
      O => N25
    );
  Mmux_rd_data_mux00014367_SW0_F : X_LUT4
    generic map(
      INIT => X"C840",
      LOC => "SLICE_X31Y15"
    )
    port map (
      ADR0 => rd_address_3_IBUF_686,
      ADR1 => rd_address_2_IBUF_703,
      ADR2 => reg_6(2),
      ADR3 => reg_14(0),
      O => N24
    );
  Mmux_rd_data_mux0001727_F : X_LUT4
    generic map(
      INIT => X"DC10",
      LOC => "SLICE_X29Y27"
    )
    port map (
      ADR0 => rd_address_1_IBUF_687,
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => reg_8(7),
      ADR3 => reg_9(7),
      O => N16
    );
  Mmux_rd_data_mux0001727_G : X_LUT4
    generic map(
      INIT => X"00CF",
      LOC => "SLICE_X29Y27"
    )
    port map (
      ADR0 => VCC,
      ADR1 => reg_13(7),
      ADR2 => rd_address_0_IBUF_685,
      ADR3 => rd_address_1_IBUF_687,
      O => N17
    );
  Mmux_rd_data_mux00011427_F : X_LUT4
    generic map(
      INIT => X"A0AC",
      LOC => "SLICE_X29Y26"
    )
    port map (
      ADR0 => reg_9(6),
      ADR1 => reg_8(6),
      ADR2 => rd_address_0_IBUF_685,
      ADR3 => rd_address_1_IBUF_687,
      O => N18
    );
  Mmux_rd_data_mux00011427_G : X_LUT4
    generic map(
      INIT => X"00BB",
      LOC => "SLICE_X29Y26"
    )
    port map (
      ADR0 => reg_13(6),
      ADR1 => rd_address_0_IBUF_685,
      ADR2 => VCC,
      ADR3 => rd_address_1_IBUF_687,
      O => N19
    );
  Mmux_rd_data_mux000159158_F : X_LUT4
    generic map(
      INIT => X"FEFC",
      LOC => "SLICE_X28Y11"
    )
    port map (
      ADR0 => rd_address_2_IBUF_703,
      ADR1 => Mmux_rd_data_mux0001598_0,
      ADR2 => Mmux_rd_data_mux00015936_0,
      ADR3 => Mmux_rd_data_mux00015923_0,
      O => N14
    );
  Mmux_rd_data_mux000159158_G : X_LUT4
    generic map(
      INIT => X"FFFE",
      LOC => "SLICE_X28Y11"
    )
    port map (
      ADR0 => Mmux_rd_data_mux00015992_0,
      ADR1 => Mmux_rd_data_mux0001598_0,
      ADR2 => N7_0,
      ADR3 => Mmux_rd_data_mux000159111_0,
      O => N15
    );
  rd_data_0 : X_FF
    generic map(
      LOC => "SLICE_X28Y11",
      INIT => '0'
    )
    port map (
      I => rd_data_0_DXMUX_1659,
      CE => rd_data_0_CEINV_1642,
      CLK => rd_data_0_CLKINV_1643,
      SET => GND,
      RST => GND,
      O => rd_data_0_737
    );
  Mmux_rd_data_mux00015135_F : X_LUT4
    generic map(
      INIT => X"EE33",
      LOC => "SLICE_X29Y9"
    )
    port map (
      ADR0 => reg_8(1),
      ADR1 => rd_address_2_IBUF_703,
      ADR2 => VCC,
      ADR3 => rd_address_3_IBUF_686,
      O => N22
    );
  Mmux_rd_data_mux00015135_G : X_LUT4
    generic map(
      INIT => X"C000",
      LOC => "SLICE_X29Y9"
    )
    port map (
      ADR0 => VCC,
      ADR1 => rd_address_2_IBUF_703,
      ADR2 => reg_13(1),
      ADR3 => rd_address_3_IBUF_686,
      O => N23
    );
  Mmux_rd_data_mux00013627_F : X_LUT4
    generic map(
      INIT => X"A0AC",
      LOC => "SLICE_X31Y16"
    )
    port map (
      ADR0 => reg_9(3),
      ADR1 => reg_8(3),
      ADR2 => rd_address_0_IBUF_685,
      ADR3 => rd_address_1_IBUF_687,
      O => N20
    );
  Mmux_rd_data_mux00013627_G : X_LUT4
    generic map(
      INIT => X"5505",
      LOC => "SLICE_X31Y16"
    )
    port map (
      ADR0 => rd_address_1_IBUF_687,
      ADR1 => VCC,
      ADR2 => rd_address_0_IBUF_685,
      ADR3 => reg_13(3),
      O => N21
    );
  reg_6_not000111 : X_LUT4
    generic map(
      INIT => X"0400",
      LOC => "SLICE_X31Y29"
    )
    port map (
      ADR0 => rd_en_IBUF_729,
      ADR1 => wr_address_1_IBUF_673,
      ADR2 => wr_address_3_IBUF_675,
      ADR3 => wr_address_2_IBUF_735,
      O => reg_6_not00011
    );
  Mmux_rd_data_mux00012116 : X_LUT4
    generic map(
      INIT => X"CC40",
      LOC => "SLICE_X29Y24"
    )
    port map (
      ADR0 => rd_address_2_IBUF_703,
      ADR1 => Mmux_rd_data_mux00012112_0,
      ADR2 => reg_10(5),
      ADR3 => N13,
      O => Mmux_rd_data_mux00012116_O_pack_1
    );
  Mmux_rd_data_mux000121119 : X_LUT4
    generic map(
      INIT => X"FFF2",
      LOC => "SLICE_X29Y24"
    )
    port map (
      ADR0 => Mmux_rd_data_mux00012191_0,
      ADR1 => rd_address_1_IBUF_687,
      ADR2 => Mmux_rd_data_mux00012116_O,
      ADR3 => N8_0,
      O => rd_data_mux0001(2)
    );
  rd_data_5 : X_FF
    generic map(
      LOC => "SLICE_X29Y24",
      INIT => '0'
    )
    port map (
      I => rd_data_5_DXMUX_1767,
      CE => rd_data_5_CEINV_1751,
      CLK => rd_data_5_CLKINV_1752,
      SET => GND,
      RST => GND,
      O => rd_data_5_742
    );
  Mmux_rd_data_mux00011483 : X_LUT4
    generic map(
      INIT => X"CFC0",
      LOC => "SLICE_X31Y22"
    )
    port map (
      ADR0 => VCC,
      ADR1 => reg_6(6),
      ADR2 => rd_address_2_IBUF_703,
      ADR3 => reg_2(6),
      O => Mmux_rd_data_mux00011483_O_pack_1
    );
  Mmux_rd_data_mux000151136 : X_LUT4
    generic map(
      INIT => X"CCC8",
      LOC => "SLICE_X28Y13"
    )
    port map (
      ADR0 => N7_0,
      ADR1 => rd_address_1_IBUF_687,
      ADR2 => Mmux_rd_data_mux000151104_0,
      ADR3 => Mmux_rd_data_mux00015185_0,
      O => Mmux_rd_data_mux000151136_O_pack_2
    );
  Mmux_rd_data_mux000151151 : X_LUT4
    generic map(
      INIT => X"FFF4",
      LOC => "SLICE_X28Y13"
    )
    port map (
      ADR0 => rd_address_1_IBUF_687,
      ADR1 => Mmux_rd_data_mux00015135,
      ADR2 => Mmux_rd_data_mux000151136_O,
      ADR3 => Mmux_rd_data_mux0001518_0,
      O => rd_data_mux0001(6)
    );
  rd_data_1 : X_FF
    generic map(
      LOC => "SLICE_X28Y13",
      INIT => '0'
    )
    port map (
      I => rd_data_1_DXMUX_1938,
      CE => rd_data_1_CEINV_1922,
      CLK => rd_data_1_CLKINV_1923,
      SET => GND,
      RST => GND,
      O => rd_data_1_738
    );
  Mmux_rd_data_mux0001783 : X_LUT4
    generic map(
      INIT => X"ACAC",
      LOC => "SLICE_X29Y22"
    )
    port map (
      ADR0 => reg_6(7),
      ADR1 => reg_2(7),
      ADR2 => rd_address_2_IBUF_703,
      ADR3 => VCC,
      O => Mmux_rd_data_mux0001783_O_pack_1
    );
  Mmux_rd_data_mux00017107 : X_LUT4
    generic map(
      INIT => X"EC00",
      LOC => "SLICE_X29Y22"
    )
    port map (
      ADR0 => Mmux_rd_data_mux00011487_0,
      ADR1 => Mmux_rd_data_mux0001775_0,
      ADR2 => Mmux_rd_data_mux0001783_O,
      ADR3 => rd_address_1_IBUF_687,
      O => Mmux_rd_data_mux00017107_1964
    );
  Mmux_rd_data_mux00013691 : X_LUT4
    generic map(
      INIT => X"DA8A",
      LOC => "SLICE_X30Y15"
    )
    port map (
      ADR0 => rd_address_0_IBUF_685,
      ADR1 => reg_7(3),
      ADR2 => rd_address_1_IBUF_687,
      ADR3 => reg_6(3),
      O => Mmux_rd_data_mux00013691_O_pack_1
    );
  Mmux_rd_data_mux000136114 : X_LUT4
    generic map(
      INIT => X"B1A0",
      LOC => "SLICE_X30Y15"
    )
    port map (
      ADR0 => rd_address_2_IBUF_703,
      ADR1 => N10_0,
      ADR2 => Mmux_rd_data_mux00013691_O,
      ADR3 => reg_2(3),
      O => Mmux_rd_data_mux000136114_1988
    );
  Mmux_rd_data_mux0001745 : X_LUT4
    generic map(
      INIT => X"CC08",
      LOC => "SLICE_X29Y25"
    )
    port map (
      ADR0 => reg_10(7),
      ADR1 => rd_address_1_IBUF_687,
      ADR2 => rd_address_2_IBUF_703,
      ADR3 => N13,
      O => Mmux_rd_data_mux0001745_O_pack_1
    );
  Mmux_rd_data_mux00017118 : X_LUT4
    generic map(
      INIT => X"FCEC",
      LOC => "SLICE_X29Y25"
    )
    port map (
      ADR0 => Mmux_rd_data_mux0001727,
      ADR1 => Mmux_rd_data_mux00017107_0,
      ADR2 => rd_address_3_IBUF_686,
      ADR3 => Mmux_rd_data_mux0001745_O,
      O => rd_data_mux0001(0)
    );
  rd_data_7 : X_FF
    generic map(
      LOC => "SLICE_X29Y25",
      INIT => '0'
    )
    port map (
      I => rd_data_7_DXMUX_2019,
      CE => rd_data_7_CEINV_2003,
      CLK => rd_data_7_CLKINV_2004,
      SET => GND,
      RST => GND,
      O => rd_data_7_733
    );
  Mmux_rd_data_mux00012853 : X_LUT4
    generic map(
      INIT => X"5D55",
      LOC => "SLICE_X28Y21"
    )
    port map (
      ADR0 => rd_address_1_IBUF_687,
      ADR1 => rd_address_2_IBUF_703,
      ADR2 => rd_address_0_IBUF_685,
      ADR3 => reg_6(4),
      O => Mmux_rd_data_mux00012853_O_pack_1
    );
  Mmux_rd_data_mux000128119_SW0 : X_LUT4
    generic map(
      INIT => X"FF32",
      LOC => "SLICE_X28Y21"
    )
    port map (
      ADR0 => Mmux_rd_data_mux00012841_0,
      ADR1 => rd_address_3_IBUF_686,
      ADR2 => Mmux_rd_data_mux00012853_O,
      ADR3 => Mmux_rd_data_mux0001285_0,
      O => N6
    );
  Mmux_rd_data_mux00012891 : X_LUT4
    generic map(
      INIT => X"CF0A",
      LOC => "SLICE_X28Y16"
    )
    port map (
      ADR0 => reg_8(4),
      ADR1 => reg_13(4),
      ADR2 => rd_address_0_IBUF_685,
      ADR3 => rd_address_2_IBUF_703,
      O => Mmux_rd_data_mux00012891_O_pack_1
    );
  Mmux_rd_data_mux000128119 : X_LUT4
    generic map(
      INIT => X"FFF4",
      LOC => "SLICE_X28Y16"
    )
    port map (
      ADR0 => rd_address_1_IBUF_687,
      ADR1 => Mmux_rd_data_mux00012891_O,
      ADR2 => Mmux_rd_data_mux00012816_0,
      ADR3 => N6_0,
      O => rd_data_mux0001(3)
    );
  rd_data_4 : X_FF
    generic map(
      LOC => "SLICE_X28Y16",
      INIT => '0'
    )
    port map (
      I => rd_data_4_DXMUX_2076,
      CE => rd_data_4_CEINV_2060,
      CLK => rd_data_4_CLKINV_2061,
      SET => GND,
      RST => GND,
      O => rd_data_4_741
    );
  Mmux_rd_data_mux00013645 : X_LUT4
    generic map(
      INIT => X"A2A0",
      LOC => "SLICE_X30Y18"
    )
    port map (
      ADR0 => rd_address_1_IBUF_687,
      ADR1 => rd_address_2_IBUF_703,
      ADR2 => N13,
      ADR3 => reg_10(3),
      O => Mmux_rd_data_mux00013645_O_pack_1
    );
  Mmux_rd_data_mux000136148 : X_LUT4
    generic map(
      INIT => X"FCB8",
      LOC => "SLICE_X30Y18"
    )
    port map (
      ADR0 => Mmux_rd_data_mux00013627,
      ADR1 => rd_address_3_IBUF_686,
      ADR2 => Mmux_rd_data_mux000136114_0,
      ADR3 => Mmux_rd_data_mux00013645_O,
      O => rd_data_mux0001(4)
    );
  rd_data_3 : X_FF
    generic map(
      LOC => "SLICE_X30Y18",
      INIT => '0'
    )
    port map (
      I => rd_data_3_DXMUX_2109,
      CE => rd_data_3_CEINV_2093,
      CLK => rd_data_3_CLKINV_2094,
      SET => GND,
      RST => GND,
      O => rd_data_3_740
    );
  Mmux_rd_data_mux00012153 : X_LUT4
    generic map(
      INIT => X"55D5",
      LOC => "SLICE_X28Y22"
    )
    port map (
      ADR0 => rd_address_1_IBUF_687,
      ADR1 => rd_address_2_IBUF_703,
      ADR2 => reg_6(5),
      ADR3 => rd_address_0_IBUF_685,
      O => Mmux_rd_data_mux00012153_O_pack_1
    );
  Mmux_rd_data_mux000121119_SW0 : X_LUT4
    generic map(
      INIT => X"FF54",
      LOC => "SLICE_X28Y22"
    )
    port map (
      ADR0 => rd_address_3_IBUF_686,
      ADR1 => Mmux_rd_data_mux00012141_0,
      ADR2 => Mmux_rd_data_mux00012153_O,
      ADR3 => Mmux_rd_data_mux0001215_0,
      O => N8
    );
  reg_10_1 : X_SFF
    generic map(
      LOC => "SLICE_X28Y10",
      INIT => '1'
    )
    port map (
      I => reg_10_1_DXMUX_2216,
      CE => reg_10_1_CEINV_2205,
      CLK => reg_10_1_CLKINV_2206,
      SET => GND,
      RST => GND,
      SSET => reg_10_1_SRINV_2207,
      SRST => GND,
      O => reg_10(1)
    );
  reg_10_2 : X_SFF
    generic map(
      LOC => "SLICE_X31Y18",
      INIT => '0'
    )
    port map (
      I => reg_10_3_DYMUX_2233,
      CE => reg_10_3_CEINV_2229,
      CLK => reg_10_3_CLKINV_2230,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_10_3_SRINV_2231,
      O => reg_10(2)
    );
  reg_10_3 : X_SFF
    generic map(
      LOC => "SLICE_X31Y18",
      INIT => '1'
    )
    port map (
      I => reg_10_3_DXMUX_2240,
      CE => reg_10_3_CEINV_2229,
      CLK => reg_10_3_CLKINV_2230,
      SET => GND,
      RST => GND,
      SSET => reg_10_3_SRINV_2231,
      SRST => GND,
      O => reg_10(3)
    );
  reg_10_4 : X_SFF
    generic map(
      LOC => "SLICE_X31Y20",
      INIT => '0'
    )
    port map (
      I => reg_10_5_DYMUX_2257,
      CE => reg_10_5_CEINV_2253,
      CLK => reg_10_5_CLKINV_2254,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_10_5_SRINV_2255,
      O => reg_10(4)
    );
  reg_10_5 : X_SFF
    generic map(
      LOC => "SLICE_X31Y20",
      INIT => '0'
    )
    port map (
      I => reg_10_5_DXMUX_2264,
      CE => reg_10_5_CEINV_2253,
      CLK => reg_10_5_CLKINV_2254,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_10_5_SRINV_2255,
      O => reg_10(5)
    );
  reg_13_not0001_SW0 : X_LUT4
    generic map(
      INIT => X"FFF3",
      LOC => "SLICE_X31Y28"
    )
    port map (
      ADR0 => VCC,
      ADR1 => wr_address_0_IBUF_674,
      ADR2 => wr_address_1_IBUF_673,
      ADR3 => rd_en_IBUF_729,
      O => N01_pack_1
    );
  reg_13_not0001 : X_LUT4
    generic map(
      INIT => X"0800",
      LOC => "SLICE_X31Y28"
    )
    port map (
      ADR0 => wr_address_3_IBUF_675,
      ADR1 => wr_en_IBUF_736,
      ADR2 => N01,
      ADR3 => wr_address_2_IBUF_735,
      O => reg_13_not0001_2291
    );
  reg_10_6 : X_SFF
    generic map(
      LOC => "SLICE_X31Y23",
      INIT => '0'
    )
    port map (
      I => reg_10_7_DYMUX_2305,
      CE => reg_10_7_CEINV_2301,
      CLK => reg_10_7_CLKINV_2302,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_10_7_SRINV_2303,
      O => reg_10(6)
    );
  reg_10_7 : X_SFF
    generic map(
      LOC => "SLICE_X31Y23",
      INIT => '0'
    )
    port map (
      I => reg_10_7_DXMUX_2312,
      CE => reg_10_7_CEINV_2301,
      CLK => reg_10_7_CLKINV_2302,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_10_7_SRINV_2303,
      O => reg_10(7)
    );
  reg_10_not000111 : X_LUT4
    generic map(
      INIT => X"0404",
      LOC => "SLICE_X30Y28"
    )
    port map (
      ADR0 => wr_address_2_IBUF_735,
      ADR1 => wr_en_IBUF_736,
      ADR2 => rd_en_IBUF_729,
      ADR3 => VCC,
      O => N111_pack_1
    );
  reg_9_not00011 : X_LUT4
    generic map(
      INIT => X"4000",
      LOC => "SLICE_X30Y28"
    )
    port map (
      ADR0 => wr_address_1_IBUF_673,
      ADR1 => wr_address_3_IBUF_675,
      ADR2 => wr_address_0_IBUF_674,
      ADR3 => N111,
      O => reg_9_not0001
    );
  reg_2_0 : X_SFF
    generic map(
      LOC => "SLICE_X29Y12",
      INIT => '1'
    )
    port map (
      I => reg_2_1_DYMUX_2353,
      CE => reg_2_1_CEINV_2349,
      CLK => reg_2_1_CLKINV_2350,
      SET => GND,
      RST => GND,
      SSET => reg_2_1_SRINV_2351,
      SRST => GND,
      O => reg_2(0)
    );
  reg_2_1 : X_SFF
    generic map(
      LOC => "SLICE_X29Y12",
      INIT => '0'
    )
    port map (
      I => reg_2_1_DXMUX_2360,
      CE => reg_2_1_CEINV_2349,
      CLK => reg_2_1_CLKINV_2350,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_2_1_SRINV_2351,
      O => reg_2(1)
    );
  reg_13_0 : X_SFF
    generic map(
      LOC => "SLICE_X29Y8",
      INIT => '1'
    )
    port map (
      I => reg_13_1_DYMUX_2377,
      CE => reg_13_1_CEINV_2373,
      CLK => reg_13_1_CLKINV_2374,
      SET => GND,
      RST => GND,
      SSET => reg_13_1_SRINV_2375,
      SRST => GND,
      O => reg_13(0)
    );
  reg_13_1 : X_SFF
    generic map(
      LOC => "SLICE_X29Y8",
      INIT => '1'
    )
    port map (
      I => reg_13_1_DXMUX_2384,
      CE => reg_13_1_CEINV_2373,
      CLK => reg_13_1_CLKINV_2374,
      SET => GND,
      RST => GND,
      SSET => reg_13_1_SRINV_2375,
      SRST => GND,
      O => reg_13(1)
    );
  reg_2_2 : X_SFF
    generic map(
      LOC => "SLICE_X30Y16",
      INIT => '0'
    )
    port map (
      I => reg_2_3_DYMUX_2401,
      CE => reg_2_3_CEINV_2397,
      CLK => reg_2_3_CLKINV_2398,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_2_3_SRINV_2399,
      O => reg_2(2)
    );
  reg_2_3 : X_SFF
    generic map(
      LOC => "SLICE_X30Y16",
      INIT => '0'
    )
    port map (
      I => reg_2_3_DXMUX_2408,
      CE => reg_2_3_CEINV_2397,
      CLK => reg_2_3_CLKINV_2398,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_2_3_SRINV_2399,
      O => reg_2(3)
    );
  reg_13_2 : X_SFF
    generic map(
      LOC => "SLICE_X28Y18",
      INIT => '1'
    )
    port map (
      I => reg_13_3_DYMUX_2425,
      CE => reg_13_3_CEINV_2421,
      CLK => reg_13_3_CLKINV_2422,
      SET => GND,
      RST => GND,
      SSET => reg_13_3_SRINV_2423,
      SRST => GND,
      O => reg_13(2)
    );
  reg_13_3 : X_SFF
    generic map(
      LOC => "SLICE_X28Y18",
      INIT => '1'
    )
    port map (
      I => reg_13_3_DXMUX_2432,
      CE => reg_13_3_CEINV_2421,
      CLK => reg_13_3_CLKINV_2422,
      SET => GND,
      RST => GND,
      SSET => reg_13_3_SRINV_2423,
      SRST => GND,
      O => reg_13(3)
    );
  Mmux_rd_data_mux00012141 : X_LUT4
    generic map(
      INIT => X"BA32",
      LOC => "SLICE_X28Y23"
    )
    port map (
      ADR0 => rd_address_0_IBUF_685,
      ADR1 => rd_address_2_IBUF_703,
      ADR2 => reg_2(5),
      ADR3 => reg_7(5),
      O => Mmux_rd_data_mux00012141_2447
    );
  reg_2_4 : X_SFF
    generic map(
      LOC => "SLICE_X26Y22",
      INIT => '1'
    )
    port map (
      I => reg_2_5_DYMUX_2461,
      CE => reg_2_5_CEINV_2457,
      CLK => reg_2_5_CLKINV_2458,
      SET => GND,
      RST => GND,
      SSET => reg_2_5_SRINV_2459,
      SRST => GND,
      O => reg_2(4)
    );
  reg_2_5 : X_SFF
    generic map(
      LOC => "SLICE_X26Y22",
      INIT => '1'
    )
    port map (
      I => reg_2_5_DXMUX_2468,
      CE => reg_2_5_CEINV_2457,
      CLK => reg_2_5_CLKINV_2458,
      SET => GND,
      RST => GND,
      SSET => reg_2_5_SRINV_2459,
      SRST => GND,
      O => reg_2(5)
    );
  reg_13_4 : X_SFF
    generic map(
      LOC => "SLICE_X29Y16",
      INIT => '1'
    )
    port map (
      I => reg_13_5_DYMUX_2485,
      CE => reg_13_5_CEINV_2481,
      CLK => reg_13_5_CLKINV_2482,
      SET => GND,
      RST => GND,
      SSET => reg_13_5_SRINV_2483,
      SRST => GND,
      O => reg_13(4)
    );
  reg_13_5 : X_SFF
    generic map(
      LOC => "SLICE_X29Y16",
      INIT => '1'
    )
    port map (
      I => reg_13_5_DXMUX_2492,
      CE => reg_13_5_CEINV_2481,
      CLK => reg_13_5_CLKINV_2482,
      SET => GND,
      RST => GND,
      SSET => reg_13_5_SRINV_2483,
      SRST => GND,
      O => reg_13(5)
    );
  reg_14_0 : X_FF
    generic map(
      LOC => "SLICE_X29Y17",
      INIT => '1'
    )
    port map (
      I => reg_14_0_DYMUX_2505,
      CE => reg_14_0_CEINV_2502,
      CLK => reg_14_0_CLKINV_2503,
      SET => GND,
      RST => GND,
      O => reg_14(0)
    );
  reg_2_6 : X_SFF
    generic map(
      LOC => "SLICE_X30Y23",
      INIT => '0'
    )
    port map (
      I => reg_2_7_DYMUX_2521,
      CE => reg_2_7_CEINV_2517,
      CLK => reg_2_7_CLKINV_2518,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_2_7_SRINV_2519,
      O => reg_2(6)
    );
  reg_2_7 : X_SFF
    generic map(
      LOC => "SLICE_X30Y23",
      INIT => '0'
    )
    port map (
      I => reg_2_7_DXMUX_2528,
      CE => reg_2_7_CEINV_2517,
      CLK => reg_2_7_CLKINV_2518,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_2_7_SRINV_2519,
      O => reg_2(7)
    );
  reg_13_6 : X_SFF
    generic map(
      LOC => "SLICE_X28Y24",
      INIT => '1'
    )
    port map (
      I => reg_13_7_DYMUX_2545,
      CE => reg_13_7_CEINV_2541,
      CLK => reg_13_7_CLKINV_2542,
      SET => GND,
      RST => GND,
      SSET => reg_13_7_SRINV_2543,
      SRST => GND,
      O => reg_13(6)
    );
  reg_13_7 : X_SFF
    generic map(
      LOC => "SLICE_X28Y24",
      INIT => '1'
    )
    port map (
      I => reg_13_7_DXMUX_2552,
      CE => reg_13_7_CEINV_2541,
      CLK => reg_13_7_CLKINV_2542,
      SET => GND,
      RST => GND,
      SSET => reg_13_7_SRINV_2543,
      SRST => GND,
      O => reg_13(7)
    );
  reg_6_0 : X_SFF
    generic map(
      LOC => "SLICE_X28Y14",
      INIT => '0'
    )
    port map (
      I => reg_6_1_DYMUX_2569,
      CE => reg_6_1_CEINV_2565,
      CLK => reg_6_1_CLKINV_2566,
      SET => GND,
      RST => GND,
      SSET => reg_6_1_SRINV_2567,
      SRST => GND,
      O => reg_6(0)
    );
  reg_6_1 : X_SFF
    generic map(
      LOC => "SLICE_X28Y14",
      INIT => '1'
    )
    port map (
      I => reg_6_1_DXMUX_2576,
      CE => reg_6_1_CEINV_2565,
      CLK => reg_6_1_CLKINV_2566,
      SET => GND,
      RST => GND,
      SSET => reg_6_1_SRINV_2567,
      SRST => GND,
      O => reg_6(1)
    );
  reg_6_2 : X_SFF
    generic map(
      LOC => "SLICE_X31Y14",
      INIT => '1'
    )
    port map (
      I => reg_6_3_DYMUX_2593,
      CE => reg_6_3_CEINV_2589,
      CLK => reg_6_3_CLKINV_2590,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_6_3_SRINV_2591,
      O => reg_6(2)
    );
  reg_6_3 : X_SFF
    generic map(
      LOC => "SLICE_X31Y14",
      INIT => '0'
    )
    port map (
      I => reg_6_3_DXMUX_2600,
      CE => reg_6_3_CEINV_2589,
      CLK => reg_6_3_CLKINV_2590,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_6_3_SRINV_2591,
      O => reg_6(3)
    );
  reg_6_4 : X_SFF
    generic map(
      LOC => "SLICE_X29Y20",
      INIT => '0'
    )
    port map (
      I => reg_6_5_DYMUX_2617,
      CE => reg_6_5_CEINV_2613,
      CLK => reg_6_5_CLKINV_2614,
      SET => GND,
      RST => GND,
      SSET => GND,
      SRST => reg_6_5_SRINV_2615,
      O => reg_6(4)
    );
  reg_6_5 : X_SFF
    generic map(
      LOC => "SLICE_X29Y20",
      INIT => '0'
    )
    port map (
      I => reg_6_5_DXMUX_2624,
      CE => reg_6_5_CEINV_2613,
      CLK => reg_6_5_CLKINV_2614,
      SET => GND,
      RST => GND,
      SSET => reg_6_5_SRINV_2615,
      SRST => GND,
      O => reg_6(5)
    );
  rd_data_7_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD37",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_7_733,
      O => rd_data_7_O
    );
  rd_data_0_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD51",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_0_737,
      O => rd_data_0_O
    );
  rd_data_1_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD48",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_1_738,
      O => rd_data_1_O
    );
  rd_data_2_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD43",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_2_739,
      O => rd_data_2_O
    );
  rd_data_3_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD42",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_3_740,
      O => rd_data_3_O
    );
  rd_data_4_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD44",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_4_741,
      O => rd_data_4_O
    );
  rd_data_5_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD39",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_5_742,
      O => rd_data_5_O
    );
  rd_data_6_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD38",
      PATHPULSE => 694 ps
    )
    port map (
      I => rd_data_6_743,
      O => rd_data_6_O
    );
  N26_G_X_LUT4 : X_LUT4
    generic map(
      INIT => X"0000",
      LOC => "SLICE_X31Y29"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => N26_G
    );
  NlwBlock_reg_bank_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlock_reg_bank_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

