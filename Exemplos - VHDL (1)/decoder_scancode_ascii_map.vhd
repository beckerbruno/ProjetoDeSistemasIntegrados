--------------------------------------------------
-- Prof. Marlon Moraes
-- marlon.moraes@pucrs.br
-- 14/08/2025.
--------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity decoder_scancode_ascii is
  port (
    ascii_out : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    scancode_in : in STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end decoder_scancode_ascii;

architecture Structure of decoder_scancode_ascii is
  signal scancode_in_6_IBUF_478 : STD_LOGIC; 
  signal scancode_in_7_IBUF_480 : STD_LOGIC; 
  signal scancode_in_0_IBUF_484 : STD_LOGIC; 
  signal scancode_in_1_IBUF_485 : STD_LOGIC; 
  signal scancode_in_2_IBUF_486 : STD_LOGIC; 
  signal scancode_in_3_IBUF_488 : STD_LOGIC; 
  signal scancode_in_4_IBUF_490 : STD_LOGIC; 
  signal scancode_in_5_IBUF_492 : STD_LOGIC; 
  signal ascii_out_1_103 : STD_LOGIC; 
  signal N69_0 : STD_LOGIC; 
  signal ascii_out_6_99_0 : STD_LOGIC; 
  signal N97 : STD_LOGIC; 
  signal N33_0 : STD_LOGIC; 
  signal ascii_out_0_33 : STD_LOGIC; 
  signal ascii_out_1_43 : STD_LOGIC; 
  signal ascii_out_2_42 : STD_LOGIC; 
  signal N63_0 : STD_LOGIC; 
  signal N87 : STD_LOGIC; 
  signal N7 : STD_LOGIC; 
  signal ascii_out_6_8_0 : STD_LOGIC; 
  signal N45_0 : STD_LOGIC; 
  signal ascii_out_6_32 : STD_LOGIC; 
  signal ascii_out_4_101 : STD_LOGIC; 
  signal ascii_out_0_14_0 : STD_LOGIC; 
  signal ascii_out_0_67_0 : STD_LOGIC; 
  signal N93 : STD_LOGIC; 
  signal N57_0 : STD_LOGIC; 
  signal ascii_out_0_51_0 : STD_LOGIC; 
  signal ascii_out_1_21_0 : STD_LOGIC; 
  signal ascii_out_1_69_0 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal ascii_out_1_110_0 : STD_LOGIC; 
  signal ascii_out_1_123_0 : STD_LOGIC; 
  signal ascii_out_3_2_0 : STD_LOGIC; 
  signal N75 : STD_LOGIC; 
  signal ascii_out_3_30_0 : STD_LOGIC; 
  signal ascii_out_7_14_0 : STD_LOGIC; 
  signal N67_0 : STD_LOGIC; 
  signal ascii_out_2_131_0 : STD_LOGIC; 
  signal N83_0 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal N95_0 : STD_LOGIC; 
  signal ascii_out_6_122_0 : STD_LOGIC; 
  signal N61 : STD_LOGIC; 
  signal N111 : STD_LOGIC; 
  signal N6_0 : STD_LOGIC; 
  signal ascii_out_5_28_0 : STD_LOGIC; 
  signal N89_0 : STD_LOGIC; 
  signal N85_0 : STD_LOGIC; 
  signal N5 : STD_LOGIC; 
  signal ascii_out_2_103_0 : STD_LOGIC; 
  signal ascii_out_2_187_537 : STD_LOGIC; 
  signal N42_0 : STD_LOGIC; 
  signal ascii_out_3_59_0 : STD_LOGIC; 
  signal ascii_out_3_117_540 : STD_LOGIC; 
  signal ascii_out_3_73_0 : STD_LOGIC; 
  signal ascii_out_3_88_0 : STD_LOGIC; 
  signal ascii_out_1_56_0 : STD_LOGIC; 
  signal ascii_out_3_225_0 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal ascii_out_3_213_0 : STD_LOGIC; 
  signal ascii_out_4_157_0 : STD_LOGIC; 
  signal ascii_out_1_7_548 : STD_LOGIC; 
  signal ascii_out_2_70_0 : STD_LOGIC; 
  signal ascii_out_5_9_0 : STD_LOGIC; 
  signal ascii_out_4_120_0 : STD_LOGIC; 
  signal ascii_out_2_88_552 : STD_LOGIC; 
  signal N65_0 : STD_LOGIC; 
  signal ascii_out_4_17_554 : STD_LOGIC; 
  signal ascii_out_4_31_0 : STD_LOGIC; 
  signal ascii_out_4_94_556 : STD_LOGIC; 
  signal N13 : STD_LOGIC; 
  signal N99 : STD_LOGIC; 
  signal ascii_out_4_148_0 : STD_LOGIC; 
  signal ascii_out_4_173_560 : STD_LOGIC; 
  signal ascii_out_5_17_0 : STD_LOGIC; 
  signal ascii_out_5_40_0 : STD_LOGIC; 
  signal N52_0 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal ascii_out_5_53_565 : STD_LOGIC; 
  signal N91 : STD_LOGIC; 
  signal ascii_out_4_O : STD_LOGIC; 
  signal scancode_in_7_INBUF : STD_LOGIC; 
  signal ascii_out_5_O : STD_LOGIC; 
  signal scancode_in_6_INBUF : STD_LOGIC; 
  signal ascii_out_5_9_1356 : STD_LOGIC; 
  signal ascii_out_4_120_1349 : STD_LOGIC; 
  signal ascii_out_1_123_1632 : STD_LOGIC; 
  signal ascii_out_4_94_pack_1 : STD_LOGIC; 
  signal ascii_out_1_21_1284 : STD_LOGIC; 
  signal ascii_out_1_7_pack_1 : STD_LOGIC; 
  signal ascii_out_6_8_1212 : STD_LOGIC; 
  signal ascii_out_1_56_1205 : STD_LOGIC; 
  signal N63 : STD_LOGIC; 
  signal ascii_out_4_148_1457 : STD_LOGIC; 
  signal N65 : STD_LOGIC; 
  signal ascii_out_3_88_1528 : STD_LOGIC; 
  signal ascii_out_3_OBUF_1188 : STD_LOGIC; 
  signal ascii_out_3_117_pack_1 : STD_LOGIC; 
  signal ascii_out_2_103_1380 : STD_LOGIC; 
  signal ascii_out_2_88_pack_1 : STD_LOGIC; 
  signal ascii_out_6_OBUF_1440 : STD_LOGIC; 
  signal N99_pack_1 : STD_LOGIC; 
  signal ascii_out_4_OBUF_1488 : STD_LOGIC; 
  signal ascii_out_4_173_pack_1 : STD_LOGIC; 
  signal ascii_out_5_17_1512 : STD_LOGIC; 
  signal ascii_out_5_40_1505 : STD_LOGIC; 
  signal ascii_out_3_59_1416 : STD_LOGIC; 
  signal N33 : STD_LOGIC; 
  signal N52 : STD_LOGIC; 
  signal ascii_out_4_157_1260 : STD_LOGIC; 
  signal ascii_out_3_225_1253 : STD_LOGIC; 
  signal ascii_out_3_73_1332 : STD_LOGIC; 
  signal ascii_out_3_2_1325 : STD_LOGIC; 
  signal ascii_out_5_OBUF_1584 : STD_LOGIC; 
  signal ascii_out_5_53_pack_1 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal N5_pack_1 : STD_LOGIC; 
  signal ascii_out_4_31_1404 : STD_LOGIC; 
  signal ascii_out_4_17_pack_1 : STD_LOGIC; 
  signal ascii_out_3_213_1608 : STD_LOGIC; 
  signal N111_pack_1 : STD_LOGIC; 
  signal ascii_out_6_99_1308 : STD_LOGIC; 
  signal ascii_out_2_70_1301 : STD_LOGIC; 
  signal ascii_out_6_122_1656 : STD_LOGIC; 
  signal N13_pack_1 : STD_LOGIC; 
  signal ascii_out_7_OBUF_1680 : STD_LOGIC; 
  signal N8_pack_1 : STD_LOGIC; 
  signal ascii_out_0_14_1704 : STD_LOGIC; 
  signal N14_pack_1 : STD_LOGIC; 
  signal ascii_out_1_110_1728 : STD_LOGIC; 
  signal ascii_out_1_103_pack_1 : STD_LOGIC; 
  signal ascii_out_1_69_1752 : STD_LOGIC; 
  signal N91_pack_1 : STD_LOGIC; 
  signal scancode_in_2_INBUF : STD_LOGIC; 
  signal ascii_out_0_O : STD_LOGIC; 
  signal ascii_out_1_O : STD_LOGIC; 
  signal scancode_in_4_INBUF : STD_LOGIC; 
  signal scancode_in_5_INBUF : STD_LOGIC; 
  signal ascii_out_2_O : STD_LOGIC; 
  signal ascii_out_3_O : STD_LOGIC; 
  signal scancode_in_3_INBUF : STD_LOGIC; 
  signal scancode_in_1_INBUF : STD_LOGIC; 
  signal ascii_out_7_O : STD_LOGIC; 
  signal scancode_in_0_INBUF : STD_LOGIC; 
  signal ascii_out_6_O : STD_LOGIC; 
  signal ascii_out_1_43_F5MUX_752 : STD_LOGIC; 
  signal N108 : STD_LOGIC; 
  signal ascii_out_1_43_BXINV_745 : STD_LOGIC; 
  signal N107 : STD_LOGIC; 
  signal ascii_out_2_42_F5MUX_777 : STD_LOGIC; 
  signal N104 : STD_LOGIC; 
  signal ascii_out_2_42_BXINV_770 : STD_LOGIC; 
  signal N103 : STD_LOGIC; 
  signal N97_F5MUX_702 : STD_LOGIC; 
  signal ascii_out_6_159_SW0 : STD_LOGIC; 
  signal N97_BXINV_693 : STD_LOGIC; 
  signal ascii_out_6_159_SW01_691 : STD_LOGIC; 
  signal N87_F5MUX_802 : STD_LOGIC; 
  signal ascii_out_4_120_SW0 : STD_LOGIC; 
  signal N87_BXINV_795 : STD_LOGIC; 
  signal ascii_out_4_120_SW01_793 : STD_LOGIC; 
  signal N7_F5MUX_827 : STD_LOGIC; 
  signal N106 : STD_LOGIC; 
  signal N7_BXINV_820 : STD_LOGIC; 
  signal N105 : STD_LOGIC; 
  signal ascii_out_6_32_F5MUX_852 : STD_LOGIC; 
  signal N102 : STD_LOGIC; 
  signal ascii_out_6_32_BXINV_845 : STD_LOGIC; 
  signal N101 : STD_LOGIC; 
  signal ascii_out_4_101_F5MUX_877 : STD_LOGIC; 
  signal ascii_out_4_101_F : STD_LOGIC; 
  signal ascii_out_4_101_BXINV_866 : STD_LOGIC; 
  signal ascii_out_4_1011_864 : STD_LOGIC; 
  signal ascii_out_0_33_F5MUX_727 : STD_LOGIC; 
  signal ascii_out_0_331_725 : STD_LOGIC; 
  signal ascii_out_0_33_BXINV_718 : STD_LOGIC; 
  signal ascii_out_0_332_716 : STD_LOGIC; 
  signal ascii_out_0_OBUF_924 : STD_LOGIC; 
  signal N93_pack_1 : STD_LOGIC; 
  signal N95 : STD_LOGIC; 
  signal N81_pack_2 : STD_LOGIC; 
  signal ascii_out_5_28_1116 : STD_LOGIC; 
  signal N89 : STD_LOGIC; 
  signal N85 : STD_LOGIC; 
  signal ascii_out_0_67_1133 : STD_LOGIC; 
  signal ascii_out_2_OBUF_1164 : STD_LOGIC; 
  signal ascii_out_2_187_pack_1 : STD_LOGIC; 
  signal N45 : STD_LOGIC; 
  signal N69 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N61_pack_1 : STD_LOGIC; 
  signal N57 : STD_LOGIC; 
  signal ascii_out_2_131_1013 : STD_LOGIC; 
  signal ascii_out_3_30_972 : STD_LOGIC; 
  signal N75_pack_1 : STD_LOGIC; 
  signal ascii_out_0_51_1044 : STD_LOGIC; 
  signal N83 : STD_LOGIC; 
  signal ascii_out_1_OBUF_948 : STD_LOGIC; 
  signal N73_pack_1 : STD_LOGIC; 
  signal ascii_out_7_14_996 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
begin
  ascii_out_4_OBUF : X_OBUF
    port map (
      I => ascii_out_4_O,
      O => ascii_out(4)
    );
  scancode_in_7_IBUF : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in(7),
      O => scancode_in_7_INBUF
    );
  ascii_out_5_OBUF : X_OBUF
    port map (
      I => ascii_out_5_O,
      O => ascii_out(5)
    );
  scancode_in_6_IBUF : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in(6),
      O => scancode_in_6_INBUF
    );
  ascii_out_5_9_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_5_9_1356,
      O => ascii_out_5_9_0
    );
  ascii_out_5_9_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_4_120_1349,
      O => ascii_out_4_120_0
    );
  ascii_out_1_123_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_1_123_1632,
      O => ascii_out_1_123_0
    );
  ascii_out_1_123_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_4_94_pack_1,
      O => ascii_out_4_94_556
    );
  ascii_out_1_21_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_1_21_1284,
      O => ascii_out_1_21_0
    );
  ascii_out_1_21_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_1_7_pack_1,
      O => ascii_out_1_7_548
    );
  ascii_out_6_8_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_6_8_1212,
      O => ascii_out_6_8_0
    );
  ascii_out_6_8_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_1_56_1205,
      O => ascii_out_1_56_0
    );
  N63_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N63,
      O => N63_0
    );
  N63_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_4_148_1457,
      O => ascii_out_4_148_0
    );
  ascii_out_1_123 : X_LUT4
    generic map(
      INIT => X"FF5D"
    )
    port map (
      ADR0 => scancode_in_0_IBUF_484,
      ADR1 => N52_0,
      ADR2 => scancode_in_7_IBUF_480,
      ADR3 => ascii_out_4_94_556,
      O => ascii_out_1_123_1632
    );
  N65_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N65,
      O => N65_0
    );
  N65_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_3_88_1528,
      O => ascii_out_3_88_0
    );
  ascii_out_3_OBUF_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_3_117_pack_1,
      O => ascii_out_3_117_540
    );
  ascii_out_2_103_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_2_103_1380,
      O => ascii_out_2_103_0
    );
  ascii_out_2_103_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_2_88_pack_1,
      O => ascii_out_2_88_552
    );
  ascii_out_6_OBUF_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N99_pack_1,
      O => N99
    );
  ascii_out_4_OBUF_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_4_173_pack_1,
      O => ascii_out_4_173_560
    );
  ascii_out_5_17_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_5_17_1512,
      O => ascii_out_5_17_0
    );
  ascii_out_5_17_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_5_40_1505,
      O => ascii_out_5_40_0
    );
  ascii_out_3_59_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_3_59_1416,
      O => ascii_out_3_59_0
    );
  N33_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N33,
      O => N33_0
    );
  N33_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N52,
      O => N52_0
    );
  ascii_out_4_157_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_4_157_1260,
      O => ascii_out_4_157_0
    );
  ascii_out_4_157_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_3_225_1253,
      O => ascii_out_3_225_0
    );
  ascii_out_3_73_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_3_73_1332,
      O => ascii_out_3_73_0
    );
  ascii_out_3_73_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_3_2_1325,
      O => ascii_out_3_2_0
    );
  ascii_out_5_OBUF_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_5_53_pack_1,
      O => ascii_out_5_53_565
    );
  N42_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N42,
      O => N42_0
    );
  N42_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N5_pack_1,
      O => N5
    );
  ascii_out_4_31_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_4_31_1404,
      O => ascii_out_4_31_0
    );
  ascii_out_4_31_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_4_17_pack_1,
      O => ascii_out_4_17_554
    );
  ascii_out_3_213_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_3_213_1608,
      O => ascii_out_3_213_0
    );
  ascii_out_3_213_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N111_pack_1,
      O => N111
    );
  ascii_out_6_99_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_6_99_1308,
      O => ascii_out_6_99_0
    );
  ascii_out_6_99_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_2_70_1301,
      O => ascii_out_2_70_0
    );
  ascii_out_6_122 : X_LUT4
    generic map(
      INIT => X"FF8D"
    )
    port map (
      ADR0 => scancode_in_3_IBUF_488,
      ADR1 => scancode_in_4_IBUF_490,
      ADR2 => N13,
      ADR3 => scancode_in_5_IBUF_492,
      O => ascii_out_6_122_1656
    );
  ascii_out_6_31 : X_LUT4
    generic map(
      INIT => X"EEEE"
    )
    port map (
      ADR0 => scancode_in_1_IBUF_485,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => VCC,
      ADR3 => VCC,
      O => N13_pack_1
    );
  ascii_out_6_122_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_6_122_1656,
      O => ascii_out_6_122_0
    );
  ascii_out_6_122_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N13_pack_1,
      O => N13
    );
  ascii_out_7_39 : X_LUT4
    generic map(
      INIT => X"FFF8"
    )
    port map (
      ADR0 => ascii_out_7_14_0,
      ADR1 => ascii_out_4_94_556,
      ADR2 => N42_0,
      ADR3 => N8,
      O => ascii_out_7_OBUF_1680
    );
  ascii_out_7_OBUF_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N8_pack_1,
      O => N8
    );
  ascii_out_0_14 : X_LUT4
    generic map(
      INIT => X"FF01"
    )
    port map (
      ADR0 => scancode_in_5_IBUF_492,
      ADR1 => scancode_in_6_IBUF_478,
      ADR2 => N89_0,
      ADR3 => N14,
      O => ascii_out_0_14_1704
    );
  ascii_out_0_14_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_0_14_1704,
      O => ascii_out_0_14_0
    );
  ascii_out_0_14_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N14_pack_1,
      O => N14
    );
  ascii_out_6_41 : X_LUT4
    generic map(
      INIT => X"8080"
    )
    port map (
      ADR0 => scancode_in_1_IBUF_485,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => scancode_in_0_IBUF_484,
      ADR3 => VCC,
      O => N14_pack_1
    );
  ascii_out_6_87 : X_LUT4
    generic map(
      INIT => X"2222"
    )
    port map (
      ADR0 => scancode_in_6_IBUF_478,
      ADR1 => scancode_in_0_IBUF_484,
      ADR2 => VCC,
      ADR3 => VCC,
      O => ascii_out_1_103_pack_1
    );
  ascii_out_1_110 : X_LUT4
    generic map(
      INIT => X"FFF8"
    )
    port map (
      ADR0 => N52_0,
      ADR1 => scancode_in_3_IBUF_488,
      ADR2 => N111,
      ADR3 => ascii_out_1_103,
      O => ascii_out_1_110_1728
    );
  ascii_out_1_110_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_1_110_1728,
      O => ascii_out_1_110_0
    );
  ascii_out_1_110_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_1_103_pack_1,
      O => ascii_out_1_103
    );
  ascii_out_5_118 : X_LUT4
    generic map(
      INIT => X"FF01"
    )
    port map (
      ADR0 => scancode_in_1_IBUF_485,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => N83_0,
      ADR3 => ascii_out_5_17_0,
      O => N8_pack_1
    );
  ascii_out_1_69 : X_LUT4
    generic map(
      INIT => X"FF40"
    )
    port map (
      ADR0 => scancode_in_3_IBUF_488,
      ADR1 => ascii_out_1_56_0,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => N91,
      O => ascii_out_1_69_1752
    );
  ascii_out_1_69_SW0 : X_LUT4
    generic map(
      INIT => X"A8A8"
    )
    port map (
      ADR0 => scancode_in_7_IBUF_480,
      ADR1 => scancode_in_1_IBUF_485,
      ADR2 => scancode_in_2_IBUF_486,
      ADR3 => VCC,
      O => N91_pack_1
    );
  ascii_out_1_69_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_1_69_1752,
      O => ascii_out_1_69_0
    );
  ascii_out_1_69_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N91_pack_1,
      O => N91
    );
  scancode_in_2_IBUF : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in(2),
      O => scancode_in_2_INBUF
    );
  ascii_out_0_OBUF : X_OBUF
    port map (
      I => ascii_out_0_O,
      O => ascii_out(0)
    );
  ascii_out_1_OBUF : X_OBUF
    port map (
      I => ascii_out_1_O,
      O => ascii_out(1)
    );
  scancode_in_4_IBUF : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in(4),
      O => scancode_in_4_INBUF
    );
  scancode_in_5_IBUF : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in(5),
      O => scancode_in_5_INBUF
    );
  ascii_out_2_OBUF : X_OBUF
    port map (
      I => ascii_out_2_O,
      O => ascii_out(2)
    );
  ascii_out_3_OBUF : X_OBUF
    port map (
      I => ascii_out_3_O,
      O => ascii_out(3)
    );
  scancode_in_3_IBUF : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in(3),
      O => scancode_in_3_INBUF
    );
  scancode_in_1_IBUF : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in(1),
      O => scancode_in_1_INBUF
    );
  ascii_out_7_OBUF : X_OBUF
    port map (
      I => ascii_out_7_O,
      O => ascii_out(7)
    );
  scancode_in_0_IBUF : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in(0),
      O => scancode_in_0_INBUF
    );
  ascii_out_6_OBUF : X_OBUF
    port map (
      I => ascii_out_6_O,
      O => ascii_out(6)
    );
  ascii_out_1_43_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_1_43_F5MUX_752,
      O => ascii_out_1_43
    );
  ascii_out_1_43_F5MUX : X_MUX2
    port map (
      IA => N107,
      IB => N108,
      SEL => ascii_out_1_43_BXINV_745,
      O => ascii_out_1_43_F5MUX_752
    );
  ascii_out_1_43_BXINV : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_0_IBUF_484,
      O => ascii_out_1_43_BXINV_745
    );
  ascii_out_2_42_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_2_42_F5MUX_777,
      O => ascii_out_2_42
    );
  ascii_out_2_42_F5MUX : X_MUX2
    port map (
      IA => N103,
      IB => N104,
      SEL => ascii_out_2_42_BXINV_770,
      O => ascii_out_2_42_F5MUX_777
    );
  ascii_out_2_42_BXINV : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_3_IBUF_488,
      O => ascii_out_2_42_BXINV_770
    );
  N97_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N97_F5MUX_702,
      O => N97
    );
  N97_F5MUX : X_MUX2
    port map (
      IA => ascii_out_6_159_SW01_691,
      IB => ascii_out_6_159_SW0,
      SEL => N97_BXINV_693,
      O => N97_F5MUX_702
    );
  N97_BXINV : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_1_IBUF_485,
      O => N97_BXINV_693
    );
  N87_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N87_F5MUX_802,
      O => N87
    );
  N87_F5MUX : X_MUX2
    port map (
      IA => ascii_out_4_120_SW01_793,
      IB => ascii_out_4_120_SW0,
      SEL => N87_BXINV_795,
      O => N87_F5MUX_802
    );
  N87_BXINV : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_6_IBUF_478,
      O => N87_BXINV_795
    );
  N7_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N7_F5MUX_827,
      O => N7
    );
  N7_F5MUX : X_MUX2
    port map (
      IA => N105,
      IB => N106,
      SEL => N7_BXINV_820,
      O => N7_F5MUX_827
    );
  N7_BXINV : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_6_IBUF_478,
      O => N7_BXINV_820
    );
  ascii_out_6_32_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_6_32_F5MUX_852,
      O => ascii_out_6_32
    );
  ascii_out_6_32_F5MUX : X_MUX2
    port map (
      IA => N101,
      IB => N102,
      SEL => ascii_out_6_32_BXINV_845,
      O => ascii_out_6_32_F5MUX_852
    );
  ascii_out_6_32_BXINV : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_2_IBUF_486,
      O => ascii_out_6_32_BXINV_845
    );
  ascii_out_4_101_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_4_101_F5MUX_877,
      O => ascii_out_4_101
    );
  ascii_out_4_101_F5MUX : X_MUX2
    port map (
      IA => ascii_out_4_1011_864,
      IB => ascii_out_4_101_F,
      SEL => ascii_out_4_101_BXINV_866,
      O => ascii_out_4_101_F5MUX_877
    );
  ascii_out_4_101_BXINV : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_7_IBUF_480,
      O => ascii_out_4_101_BXINV_866
    );
  ascii_out_0_33_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_0_33_F5MUX_727,
      O => ascii_out_0_33
    );
  ascii_out_0_33_F5MUX : X_MUX2
    port map (
      IA => ascii_out_0_332_716,
      IB => ascii_out_0_331_725,
      SEL => ascii_out_0_33_BXINV_718,
      O => ascii_out_0_33_F5MUX_727
    );
  ascii_out_0_33_BXINV : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_7_IBUF_480,
      O => ascii_out_0_33_BXINV_718
    );
  ascii_out_0_OBUF_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N93_pack_1,
      O => N93
    );
  N95_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N95,
      O => N95_0
    );
  N95_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N81_pack_2,
      O => N81
    );
  ascii_out_5_28_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_5_28_1116,
      O => ascii_out_5_28_0
    );
  ascii_out_5_28_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N89,
      O => N89_0
    );
  N85_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N85,
      O => N85_0
    );
  N85_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_0_67_1133,
      O => ascii_out_0_67_0
    );
  ascii_out_2_OBUF_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_2_187_pack_1,
      O => ascii_out_2_187_537
    );
  N45_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N45,
      O => N45_0
    );
  N45_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N69,
      O => N69_0
    );
  N6_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N6,
      O => N6_0
    );
  N6_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N61_pack_1,
      O => N61
    );
  N57_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N57,
      O => N57_0
    );
  N57_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_2_131_1013,
      O => ascii_out_2_131_0
    );
  ascii_out_3_30_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_3_30_972,
      O => ascii_out_3_30_0
    );
  ascii_out_3_30_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N75_pack_1,
      O => N75
    );
  ascii_out_0_51_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_0_51_1044,
      O => ascii_out_0_51_0
    );
  ascii_out_0_51_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N83,
      O => N83_0
    );
  ascii_out_1_OBUF_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N73_pack_1,
      O => N73
    );
  ascii_out_7_14_XUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_7_14_996,
      O => ascii_out_7_14_0
    );
  ascii_out_7_14_YUSED : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => N67,
      O => N67_0
    );
  scancode_in_6_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_6_INBUF,
      O => scancode_in_6_IBUF_478
    );
  scancode_in_4_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_4_INBUF,
      O => scancode_in_4_IBUF_490
    );
  scancode_in_1_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_1_INBUF,
      O => scancode_in_1_IBUF_485
    );
  scancode_in_0_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_0_INBUF,
      O => scancode_in_0_IBUF_484
    );
  scancode_in_2_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_2_INBUF,
      O => scancode_in_2_IBUF_486
    );
  scancode_in_3_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_3_INBUF,
      O => scancode_in_3_IBUF_488
    );
  scancode_in_7_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_7_INBUF,
      O => scancode_in_7_IBUF_480
    );
  ascii_out_6_159_SW01 : X_LUT4
    generic map(
      INIT => X"8888"
    )
    port map (
      ADR0 => scancode_in_0_IBUF_484,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => VCC,
      ADR3 => VCC,
      O => ascii_out_6_159_SW0
    );
  ascii_out_6_159_SW02 : X_LUT4
    generic map(
      INIT => X"FFBA"
    )
    port map (
      ADR0 => ascii_out_1_103,
      ADR1 => N69_0,
      ADR2 => scancode_in_2_IBUF_486,
      ADR3 => ascii_out_6_99_0,
      O => ascii_out_6_159_SW01_691
    );
  ascii_out_0_332 : X_LUT4
    generic map(
      INIT => X"4040"
    )
    port map (
      ADR0 => scancode_in_4_IBUF_490,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => scancode_in_1_IBUF_485,
      ADR3 => VCC,
      O => ascii_out_0_332_716
    );
  ascii_out_2_42_F : X_LUT4
    generic map(
      INIT => X"0046"
    )
    port map (
      ADR0 => scancode_in_2_IBUF_486,
      ADR1 => scancode_in_6_IBUF_478,
      ADR2 => scancode_in_4_IBUF_490,
      ADR3 => scancode_in_1_IBUF_485,
      O => N103
    );
  ascii_out_1_43_G : X_LUT4
    generic map(
      INIT => X"88F8"
    )
    port map (
      ADR0 => scancode_in_2_IBUF_486,
      ADR1 => scancode_in_1_IBUF_485,
      ADR2 => scancode_in_3_IBUF_488,
      ADR3 => scancode_in_6_IBUF_478,
      O => N108
    );
  ascii_out_4_2_F : X_LUT4
    generic map(
      INIT => X"CDC9"
    )
    port map (
      ADR0 => scancode_in_4_IBUF_490,
      ADR1 => scancode_in_7_IBUF_480,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => scancode_in_3_IBUF_488,
      O => N105
    );
  ascii_out_0_331 : X_LUT4
    generic map(
      INIT => X"EEEE"
    )
    port map (
      ADR0 => scancode_in_1_IBUF_485,
      ADR1 => N33_0,
      ADR2 => VCC,
      ADR3 => VCC,
      O => ascii_out_0_331_725
    );
  ascii_out_1_43_F : X_LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      ADR0 => scancode_in_3_IBUF_488,
      ADR1 => scancode_in_1_IBUF_485,
      ADR2 => scancode_in_6_IBUF_478,
      ADR3 => scancode_in_5_IBUF_492,
      O => N107
    );
  ascii_out_4_120_SW02 : X_LUT4
    generic map(
      INIT => X"0202"
    )
    port map (
      ADR0 => scancode_in_0_IBUF_484,
      ADR1 => scancode_in_3_IBUF_488,
      ADR2 => N63_0,
      ADR3 => VCC,
      O => ascii_out_4_120_SW01_793
    );
  ascii_out_4_120_SW01 : X_LUT4
    generic map(
      INIT => X"88D8"
    )
    port map (
      ADR0 => scancode_in_3_IBUF_488,
      ADR1 => scancode_in_4_IBUF_490,
      ADR2 => scancode_in_0_IBUF_484,
      ADR3 => N63_0,
      O => ascii_out_4_120_SW0
    );
  ascii_out_4_2_G : X_LUT4
    generic map(
      INIT => X"FFC8"
    )
    port map (
      ADR0 => scancode_in_4_IBUF_490,
      ADR1 => scancode_in_7_IBUF_480,
      ADR2 => scancode_in_3_IBUF_488,
      ADR3 => scancode_in_5_IBUF_492,
      O => N106
    );
  scancode_in_5_IFF_IMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => scancode_in_5_INBUF,
      O => scancode_in_5_IBUF_492
    );
  ascii_out_3_213 : X_LUT4
    generic map(
      INIT => X"02AA"
    )
    port map (
      ADR0 => N111,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => scancode_in_3_IBUF_488,
      ADR3 => scancode_in_4_IBUF_490,
      O => ascii_out_3_213_1608
    );
  ascii_out_2_42_G : X_LUT4
    generic map(
      INIT => X"4055"
    )
    port map (
      ADR0 => scancode_in_1_IBUF_485,
      ADR1 => scancode_in_5_IBUF_492,
      ADR2 => scancode_in_4_IBUF_490,
      ADR3 => scancode_in_2_IBUF_486,
      O => N104
    );
  ascii_out_0_137 : X_LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      ADR0 => ascii_out_0_14_0,
      ADR1 => ascii_out_0_33,
      ADR2 => ascii_out_0_67_0,
      ADR3 => N93,
      O => ascii_out_0_OBUF_924
    );
  ascii_out_1_164 : X_LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      ADR0 => ascii_out_1_21_0,
      ADR1 => ascii_out_1_43,
      ADR2 => ascii_out_1_69_0,
      ADR3 => N73,
      O => ascii_out_1_OBUF_948
    );
  ascii_out_6_68_SW0 : X_LUT4
    generic map(
      INIT => X"AF23"
    )
    port map (
      ADR0 => scancode_in_2_IBUF_486,
      ADR1 => scancode_in_0_IBUF_484,
      ADR2 => scancode_in_1_IBUF_485,
      ADR3 => scancode_in_5_IBUF_492,
      O => N67
    );
  ascii_out_6_1251_SW0 : X_LUT4
    generic map(
      INIT => X"AF2F"
    )
    port map (
      ADR0 => scancode_in_0_IBUF_484,
      ADR1 => scancode_in_4_IBUF_490,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => scancode_in_3_IBUF_488,
      O => N69
    );
  ascii_out_6_1011 : X_LUT4
    generic map(
      INIT => X"88F8"
    )
    port map (
      ADR0 => scancode_in_5_IBUF_492,
      ADR1 => scancode_in_3_IBUF_488,
      ADR2 => scancode_in_4_IBUF_490,
      ADR3 => scancode_in_0_IBUF_484,
      O => N45
    );
  ascii_out_6_32_G : X_LUT4
    generic map(
      INIT => X"CCC8"
    )
    port map (
      ADR0 => ascii_out_6_8_0,
      ADR1 => scancode_in_6_IBUF_478,
      ADR2 => scancode_in_3_IBUF_488,
      ADR3 => scancode_in_4_IBUF_490,
      O => N102
    );
  ascii_out_1_164_SW0 : X_LUT4
    generic map(
      INIT => X"2322"
    )
    port map (
      ADR0 => ascii_out_1_110_0,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => scancode_in_1_IBUF_485,
      ADR3 => ascii_out_1_123_0,
      O => N73_pack_1
    );
  ascii_out_7_14 : X_LUT4
    generic map(
      INIT => X"1131"
    )
    port map (
      ADR0 => scancode_in_1_IBUF_485,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => scancode_in_0_IBUF_484,
      ADR3 => scancode_in_4_IBUF_490,
      O => ascii_out_7_14_996
    );
  ascii_out_3_30 : X_LUT4
    generic map(
      INIT => X"EAAA"
    )
    port map (
      ADR0 => ascii_out_3_2_0,
      ADR1 => scancode_in_4_IBUF_490,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => N75,
      O => ascii_out_3_30_972
    );
  ascii_out_2_131 : X_LUT4
    generic map(
      INIT => X"20AA"
    )
    port map (
      ADR0 => scancode_in_3_IBUF_488,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => scancode_in_4_IBUF_490,
      O => ascii_out_2_131_1013
    );
  ascii_out_0_137_SW0 : X_LUT4
    generic map(
      INIT => X"DC54"
    )
    port map (
      ADR0 => scancode_in_0_IBUF_484,
      ADR1 => scancode_in_6_IBUF_478,
      ADR2 => N57_0,
      ADR3 => ascii_out_0_51_0,
      O => N93_pack_1
    );
  ascii_out_6_32_F : X_LUT4
    generic map(
      INIT => X"F8F8"
    )
    port map (
      ADR0 => ascii_out_6_8_0,
      ADR1 => scancode_in_6_IBUF_478,
      ADR2 => N45_0,
      ADR3 => VCC,
      O => N101
    );
  ascii_out_3_30_SW0 : X_LUT4
    generic map(
      INIT => X"ACA8"
    )
    port map (
      ADR0 => scancode_in_1_IBUF_485,
      ADR1 => scancode_in_0_IBUF_484,
      ADR2 => scancode_in_3_IBUF_488,
      ADR3 => scancode_in_2_IBUF_486,
      O => N75_pack_1
    );
  ascii_out_4_1011 : X_LUT4
    generic map(
      INIT => X"FFB8"
    )
    port map (
      ADR0 => scancode_in_5_IBUF_492,
      ADR1 => scancode_in_3_IBUF_488,
      ADR2 => scancode_in_6_IBUF_478,
      ADR3 => scancode_in_4_IBUF_490,
      O => ascii_out_4_1011_864
    );
  ascii_out_2_187_SW0 : X_LUT4
    generic map(
      INIT => X"A8F8"
    )
    port map (
      ADR0 => scancode_in_4_IBUF_490,
      ADR1 => N81,
      ADR2 => scancode_in_6_IBUF_478,
      ADR3 => scancode_in_1_IBUF_485,
      O => N95
    );
  ascii_out_6_131 : X_LUT4
    generic map(
      INIT => X"F8F8"
    )
    port map (
      ADR0 => ascii_out_6_122_0,
      ADR1 => scancode_in_6_IBUF_478,
      ADR2 => N61,
      ADR3 => VCC,
      O => N6
    );
  ascii_out_5_28 : X_LUT4
    generic map(
      INIT => X"0F01"
    )
    port map (
      ADR0 => scancode_in_4_IBUF_490,
      ADR1 => scancode_in_7_IBUF_480,
      ADR2 => scancode_in_3_IBUF_488,
      ADR3 => scancode_in_6_IBUF_478,
      O => ascii_out_5_28_1116
    );
  ascii_out_0_14_SW0 : X_LUT4
    generic map(
      INIT => X"FF40"
    )
    port map (
      ADR0 => scancode_in_0_IBUF_484,
      ADR1 => scancode_in_3_IBUF_488,
      ADR2 => scancode_in_4_IBUF_490,
      ADR3 => scancode_in_7_IBUF_480,
      O => N89
    );
  ascii_out_1_56 : X_LUT4
    generic map(
      INIT => X"88F8"
    )
    port map (
      ADR0 => scancode_in_1_IBUF_485,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => scancode_in_4_IBUF_490,
      ADR3 => scancode_in_0_IBUF_484,
      O => ascii_out_1_56_1205
    );
  ascii_out_6_131_SW0 : X_LUT4
    generic map(
      INIT => X"BAB8"
    )
    port map (
      ADR0 => scancode_in_7_IBUF_480,
      ADR1 => scancode_in_4_IBUF_490,
      ADR2 => N111,
      ADR3 => N33_0,
      O => N61_pack_1
    );
  ascii_out_5_118_SW0 : X_LUT4
    generic map(
      INIT => X"1515"
    )
    port map (
      ADR0 => scancode_in_4_IBUF_490,
      ADR1 => scancode_in_3_IBUF_488,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => VCC,
      O => N83
    );
  ascii_out_0_67 : X_LUT4
    generic map(
      INIT => X"0F01"
    )
    port map (
      ADR0 => scancode_in_2_IBUF_486,
      ADR1 => scancode_in_7_IBUF_480,
      ADR2 => scancode_in_1_IBUF_485,
      ADR3 => scancode_in_4_IBUF_490,
      O => ascii_out_0_67_1133
    );
  ascii_out_4_31_SW0 : X_LUT4
    generic map(
      INIT => X"AA08"
    )
    port map (
      ADR0 => scancode_in_2_IBUF_486,
      ADR1 => scancode_in_3_IBUF_488,
      ADR2 => scancode_in_4_IBUF_490,
      ADR3 => scancode_in_1_IBUF_485,
      O => N85
    );
  ascii_out_2_187 : X_LUT4
    generic map(
      INIT => X"3332"
    )
    port map (
      ADR0 => ascii_out_2_131_0,
      ADR1 => scancode_in_0_IBUF_484,
      ADR2 => scancode_in_7_IBUF_480,
      ADR3 => N95_0,
      O => ascii_out_2_187_pack_1
    );
  ascii_out_0_111_SW0 : X_LUT4
    generic map(
      INIT => X"4202"
    )
    port map (
      ADR0 => scancode_in_2_IBUF_486,
      ADR1 => scancode_in_3_IBUF_488,
      ADR2 => scancode_in_4_IBUF_490,
      ADR3 => scancode_in_5_IBUF_492,
      O => N57
    );
  ascii_out_2_213 : X_LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      ADR0 => N5,
      ADR1 => ascii_out_2_42,
      ADR2 => ascii_out_2_103_0,
      ADR3 => ascii_out_2_187_537,
      O => ascii_out_2_OBUF_1164
    );
  ascii_out_3_117 : X_LUT4
    generic map(
      INIT => X"2322"
    )
    port map (
      ADR0 => ascii_out_3_73_0,
      ADR1 => scancode_in_0_IBUF_484,
      ADR2 => scancode_in_2_IBUF_486,
      ADR3 => ascii_out_3_88_0,
      O => ascii_out_3_117_pack_1
    );
  ascii_out_3_148 : X_LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      ADR0 => N42_0,
      ADR1 => ascii_out_3_30_0,
      ADR2 => ascii_out_3_59_0,
      ADR3 => ascii_out_3_117_540,
      O => ascii_out_3_OBUF_1188
    );
  ascii_out_0_51 : X_LUT4
    generic map(
      INIT => X"F8F8"
    )
    port map (
      ADR0 => scancode_in_3_IBUF_488,
      ADR1 => scancode_in_4_IBUF_490,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => VCC,
      O => ascii_out_0_51_1044
    );
  ascii_out_2_162_SW0 : X_LUT4
    generic map(
      INIT => X"2075"
    )
    port map (
      ADR0 => scancode_in_2_IBUF_486,
      ADR1 => scancode_in_3_IBUF_488,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => scancode_in_1_IBUF_485,
      O => N81_pack_2
    );
  ascii_out_2_70 : X_LUT4
    generic map(
      INIT => X"FEFE"
    )
    port map (
      ADR0 => scancode_in_4_IBUF_490,
      ADR1 => scancode_in_5_IBUF_492,
      ADR2 => scancode_in_6_IBUF_478,
      ADR3 => VCC,
      O => ascii_out_2_70_1301
    );
  ascii_out_3_232 : X_LUT4
    generic map(
      INIT => X"FFF8"
    )
    port map (
      ADR0 => scancode_in_6_IBUF_478,
      ADR1 => ascii_out_3_225_0,
      ADR2 => N14,
      ADR3 => ascii_out_3_213_0,
      O => N5_pack_1
    );
  ascii_out_4_157 : X_LUT4
    generic map(
      INIT => X"80AA"
    )
    port map (
      ADR0 => scancode_in_3_IBUF_488,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => scancode_in_4_IBUF_490,
      O => ascii_out_4_157_1260
    );
  ascii_out_6_8 : X_LUT4
    generic map(
      INIT => X"F111"
    )
    port map (
      ADR0 => scancode_in_0_IBUF_484,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => scancode_in_1_IBUF_485,
      ADR3 => scancode_in_3_IBUF_488,
      O => ascii_out_6_8_1212
    );
  ascii_out_3_61 : X_LUT4
    generic map(
      INIT => X"FFC8"
    )
    port map (
      ADR0 => N33_0,
      ADR1 => scancode_in_7_IBUF_480,
      ADR2 => scancode_in_4_IBUF_490,
      ADR3 => N5,
      O => N42
    );
  ascii_out_3_2 : X_LUT4
    generic map(
      INIT => X"8080"
    )
    port map (
      ADR0 => scancode_in_1_IBUF_485,
      ADR1 => scancode_in_3_IBUF_488,
      ADR2 => scancode_in_6_IBUF_478,
      ADR3 => VCC,
      O => ascii_out_3_2_1325
    );
  ascii_out_3_73 : X_LUT4
    generic map(
      INIT => X"FF01"
    )
    port map (
      ADR0 => scancode_in_3_IBUF_488,
      ADR1 => scancode_in_5_IBUF_492,
      ADR2 => scancode_in_1_IBUF_485,
      ADR3 => scancode_in_6_IBUF_478,
      O => ascii_out_3_73_1332
    );
  ascii_out_3_225 : X_LUT4
    generic map(
      INIT => X"FFC8"
    )
    port map (
      ADR0 => scancode_in_2_IBUF_486,
      ADR1 => scancode_in_4_IBUF_490,
      ADR2 => scancode_in_3_IBUF_488,
      ADR3 => scancode_in_5_IBUF_492,
      O => ascii_out_3_225_1253
    );
  ascii_out_4_120 : X_LUT4
    generic map(
      INIT => X"AAAE"
    )
    port map (
      ADR0 => N87,
      ADR1 => ascii_out_4_101,
      ADR2 => scancode_in_1_IBUF_485,
      ADR3 => scancode_in_2_IBUF_486,
      O => ascii_out_4_120_1349
    );
  ascii_out_1_7 : X_LUT4
    generic map(
      INIT => X"3131"
    )
    port map (
      ADR0 => scancode_in_1_IBUF_485,
      ADR1 => scancode_in_0_IBUF_484,
      ADR2 => scancode_in_3_IBUF_488,
      ADR3 => VCC,
      O => ascii_out_1_7_pack_1
    );
  ascii_out_5_9 : X_LUT4
    generic map(
      INIT => X"AA08"
    )
    port map (
      ADR0 => scancode_in_1_IBUF_485,
      ADR1 => N111,
      ADR2 => scancode_in_3_IBUF_488,
      ADR3 => scancode_in_2_IBUF_486,
      O => ascii_out_5_9_1356
    );
  ascii_out_2_88 : X_LUT4
    generic map(
      INIT => X"44F4"
    )
    port map (
      ADR0 => N65_0,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => scancode_in_1_IBUF_485,
      ADR3 => scancode_in_4_IBUF_490,
      O => ascii_out_2_88_pack_1
    );
  ascii_out_2_103 : X_LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      ADR0 => scancode_in_7_IBUF_480,
      ADR1 => ascii_out_2_70_0,
      ADR2 => scancode_in_0_IBUF_484,
      ADR3 => ascii_out_2_88_552,
      O => ascii_out_2_103_1380
    );
  ascii_out_1_21 : X_LUT4
    generic map(
      INIT => X"FFC8"
    )
    port map (
      ADR0 => scancode_in_4_IBUF_490,
      ADR1 => scancode_in_6_IBUF_478,
      ADR2 => ascii_out_1_7_548,
      ADR3 => N7,
      O => ascii_out_1_21_1284
    );
  ascii_out_6_99 : X_LUT4
    generic map(
      INIT => X"0222"
    )
    port map (
      ADR0 => scancode_in_3_IBUF_488,
      ADR1 => scancode_in_6_IBUF_478,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => scancode_in_4_IBUF_490,
      O => ascii_out_6_99_1308
    );
  ascii_out_4_17 : X_LUT4
    generic map(
      INIT => X"3131"
    )
    port map (
      ADR0 => scancode_in_2_IBUF_486,
      ADR1 => scancode_in_7_IBUF_480,
      ADR2 => scancode_in_0_IBUF_484,
      ADR3 => VCC,
      O => ascii_out_4_17_pack_1
    );
  ascii_out_6_171 : X_LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      ADR0 => N61,
      ADR1 => N97,
      ADR2 => ascii_out_6_32,
      ADR3 => N99,
      O => ascii_out_6_OBUF_1440
    );
  ascii_out_3_59 : X_LUT4
    generic map(
      INIT => X"3332"
    )
    port map (
      ADR0 => ascii_out_4_94_556,
      ADR1 => N13,
      ADR2 => N45_0,
      ADR3 => N111,
      O => ascii_out_3_59_1416
    );
  ascii_out_6_171_SW0 : X_LUT4
    generic map(
      INIT => X"888D"
    )
    port map (
      ADR0 => scancode_in_6_IBUF_478,
      ADR1 => ascii_out_6_122_0,
      ADR2 => N67_0,
      ADR3 => scancode_in_7_IBUF_480,
      O => N99_pack_1
    );
  ascii_out_3_88 : X_LUT4
    generic map(
      INIT => X"02FF"
    )
    port map (
      ADR0 => scancode_in_1_IBUF_485,
      ADR1 => scancode_in_4_IBUF_490,
      ADR2 => scancode_in_3_IBUF_488,
      ADR3 => scancode_in_5_IBUF_492,
      O => ascii_out_3_88_1528
    );
  ascii_out_4_511 : X_LUT4
    generic map(
      INIT => X"1111"
    )
    port map (
      ADR0 => scancode_in_4_IBUF_490,
      ADR1 => scancode_in_6_IBUF_478,
      ADR2 => VCC,
      ADR3 => VCC,
      O => N52
    );
  ascii_out_4_71_SW0 : X_LUT4
    generic map(
      INIT => X"AF23"
    )
    port map (
      ADR0 => scancode_in_7_IBUF_480,
      ADR1 => scancode_in_6_IBUF_478,
      ADR2 => scancode_in_2_IBUF_486,
      ADR3 => scancode_in_4_IBUF_490,
      O => N63
    );
  ascii_out_4_31 : X_LUT4
    generic map(
      INIT => X"AAAE"
    )
    port map (
      ADR0 => N85_0,
      ADR1 => ascii_out_4_17_554,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => scancode_in_6_IBUF_478,
      O => ascii_out_4_31_1404
    );
  ascii_out_5_17 : X_LUT4
    generic map(
      INIT => X"4440"
    )
    port map (
      ADR0 => scancode_in_0_IBUF_484,
      ADR1 => scancode_in_6_IBUF_478,
      ADR2 => scancode_in_4_IBUF_490,
      ADR3 => scancode_in_3_IBUF_488,
      O => ascii_out_5_17_1512
    );
  ascii_out_0_212 : X_LUT4
    generic map(
      INIT => X"FFFB"
    )
    port map (
      ADR0 => scancode_in_3_IBUF_488,
      ADR1 => scancode_in_0_IBUF_484,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => scancode_in_6_IBUF_478,
      O => N33
    );
  ascii_out_2_88_SW0 : X_LUT4
    generic map(
      INIT => X"FDFD"
    )
    port map (
      ADR0 => scancode_in_3_IBUF_488,
      ADR1 => scancode_in_5_IBUF_492,
      ADR2 => scancode_in_6_IBUF_478,
      ADR3 => VCC,
      O => N65
    );
  ascii_out_5_53 : X_LUT4
    generic map(
      INIT => X"AA80"
    )
    port map (
      ADR0 => scancode_in_0_IBUF_484,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => ascii_out_5_28_0,
      ADR3 => ascii_out_5_40_0,
      O => ascii_out_5_53_pack_1
    );
  ascii_out_5_40 : X_LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      ADR0 => scancode_in_3_IBUF_488,
      ADR1 => scancode_in_2_IBUF_486,
      ADR2 => scancode_in_4_IBUF_490,
      ADR3 => scancode_in_6_IBUF_478,
      O => ascii_out_5_40_1505
    );
  ascii_out_4_148 : X_LUT4
    generic map(
      INIT => X"FF98"
    )
    port map (
      ADR0 => scancode_in_4_IBUF_490,
      ADR1 => scancode_in_6_IBUF_478,
      ADR2 => scancode_in_1_IBUF_485,
      ADR3 => scancode_in_7_IBUF_480,
      O => ascii_out_4_148_1457
    );
  ascii_out_4_173 : X_LUT4
    generic map(
      INIT => X"3232"
    )
    port map (
      ADR0 => ascii_out_4_157_0,
      ADR1 => scancode_in_0_IBUF_484,
      ADR2 => ascii_out_4_148_0,
      ADR3 => VCC,
      O => ascii_out_4_173_pack_1
    );
  ascii_out_4_199 : X_LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      ADR0 => N7,
      ADR1 => ascii_out_4_31_0,
      ADR2 => ascii_out_4_120_0,
      ADR3 => ascii_out_4_173_560,
      O => ascii_out_4_OBUF_1488
    );
  ascii_out_6_22 : X_LUT4
    generic map(
      INIT => X"0101"
    )
    port map (
      ADR0 => scancode_in_6_IBUF_478,
      ADR1 => scancode_in_7_IBUF_480,
      ADR2 => scancode_in_5_IBUF_492,
      ADR3 => VCC,
      O => N111_pack_1
    );
  ascii_out_5_76 : X_LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      ADR0 => N8,
      ADR1 => ascii_out_5_9_0,
      ADR2 => N6_0,
      ADR3 => ascii_out_5_53_565,
      O => ascii_out_5_OBUF_1584
    );
  ascii_out_4_94 : X_LUT4
    generic map(
      INIT => X"2222"
    )
    port map (
      ADR0 => scancode_in_6_IBUF_478,
      ADR1 => scancode_in_3_IBUF_488,
      ADR2 => VCC,
      ADR3 => VCC,
      O => ascii_out_4_94_pack_1
    );
  ascii_out_4_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_4_OBUF_1488,
      O => ascii_out_4_O
    );
  ascii_out_5_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_5_OBUF_1584,
      O => ascii_out_5_O
    );
  ascii_out_0_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_0_OBUF_924,
      O => ascii_out_0_O
    );
  ascii_out_1_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_1_OBUF_948,
      O => ascii_out_1_O
    );
  ascii_out_2_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_2_OBUF_1164,
      O => ascii_out_2_O
    );
  ascii_out_3_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_3_OBUF_1188,
      O => ascii_out_3_O
    );
  ascii_out_7_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_7_OBUF_1680,
      O => ascii_out_7_O
    );
  ascii_out_6_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      PATHPULSE => 694 ps
    )
    port map (
      I => ascii_out_6_OBUF_1440,
      O => ascii_out_6_O
    );
  ascii_out_4_101_F_X_LUT4 : X_LUT4
    generic map(
      INIT => X"FFFF"
    )
    port map (
      ADR0 => VCC,
      ADR1 => VCC,
      ADR2 => VCC,
      ADR3 => VCC,
      O => ascii_out_4_101_F
    );
  NlwBlock_decoder_scancode_ascii_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

