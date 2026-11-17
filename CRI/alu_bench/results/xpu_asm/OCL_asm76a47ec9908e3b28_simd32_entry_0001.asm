//.kernel _ZTS6SweepKILi1EE
//.platform XE3P_CRI
//.thread_config numGRF=96, numAcc=4, numSWSB=32
//.options_string "-emitCrossThreadOffR0Reloc -hashmovs 1990491849 2425240360 -hashmovs1 0 1 "
//.full_options "-emitLocation -autoGRFSelection -wideMulMadOpsEn -enableCoalesceScalarMoves -supportLSCImmScale 0 -samplerHeaderWA -enablePreemption -hasRNEandDenorm -noStitchExternFunc -useInlineData -emitCrossThreadOffR0Reloc -abortOnSpill 4 -enableBCR -forceBCR -bumpGRFForForceBCR -enableBundleCR 3 -freqBasedSpillCost 8 -freqBasedSpillCostFunc 1 -boundsChecking -presched-ctrl 6 -presched-rp 90 -nodpsendreorder -SBIDDepLoc -PVCSendWARWA -output -binary -dumpcommonisa -dumpcombinedcisa -dumpvisa -printHexFloatInAsm -noverifyCISA -enableHalfLSC -partialInt64 -activeThreadsOnlyBarrier -hashmovs 1990491849 2425240360 -hashmovs1 0 1 -enableEfficient64b -GRFBumpUpNumber 2 -waSlmGOS20 "
//.instCount 169
//.RA type	LOCAL_FIRST_FIT_BC_RA
//.git-hash cb58c7fbc7f88dae319e4276acae5bc1f9969b2d

//.declare BuiltInR0 (0)  rf=r size=64 type=ud align=32 words (r0.0) IsBuiltin
//.declare  (1)  rf=r size=64 type=ud align=32 words (r66.0) IsBuiltin
//.declare BuiltinA0 (2)  rf=a size=4 type=ud align=1 words (a0.0) IsBuiltin
//.declare BuiltinA0Dot2 (3)  rf=a size=4 type=ud align=1 words (a0.2) IsBuiltin
//.declare BuiltinSR0Dot1 (5)  rf=r size=4 type=ud align=2 words IsBuiltin
//.declare BuiltinS0 (6)  rf=s size=64 type=uq align=1 words (s0.0) IsBuiltin
//.declare %null (11)  rf=r size=4 type=ud align=2 words
//.declare %local_id_x (14)  rf=r size=4 type=ud align=2 words (r2.15)
//.declare %local_id_y (15)  rf=r size=4 type=ud align=2 words (r3.0)
//.declare %local_size_x (16)  rf=r size=4 type=ud align=2 words (r2.11)
//.declare %local_size_y (17)  rf=r size=4 type=ud align=2 words (r2.12)
//.declare %group_id_x (18)  rf=r size=4 type=ud align=2 words (r0.1)
//.declare %group_id_y (19)  rf=r size=4 type=ud align=2 words (r0.6)
//.declare %group_id_z (20)  rf=r size=4 type=ud align=2 words (r0.7)
//.declare %group_count_x (21)  rf=r size=4 type=ud align=2 words (r2.13)
//.declare %group_count_y (22)  rf=r size=4 type=ud align=2 words (r2.14)
//.declare %tsc (23)  rf=r size=20 type=ud align=2 words
//.declare %arg (24)  rf=r size=0 type=ud align=32 words (r26.0)
//.declare %retval (25)  rf=r size=0 type=ud align=32 words (r26.0) Output
//.declare %sp (26)  rf=r size=8 type=uq align=4 words (r127.5)
//.declare %fp (27)  rf=r size=8 type=uq align=4 words (r127.4)
//.declare %sr0 (28)  rf=r size=16 type=ud align=2 words
//.declare %cr0 (29)  rf=r size=12 type=ud align=2 words
//.declare %ce0 (30)  rf=r size=4 type=ud align=2 words
//.declare %dbg0 (31)  rf=r size=8 type=ud align=2 words
//.declare implBufPtr (33)  rf=r size=8 type=uq align=4 words (r127.0)
//.declare localIdBufPtr (34)  rf=r size=8 type=uq align=4 words (r127.3)
//.declare %msg0 (35)  rf=r size=12 type=ud align=2 words
//.declare %scratchloc (36)  rf=r size=8 type=uq align=4 words (s0.7)
//.declare V0033 (44)  rf=r size=64 type=d alias=+0 align=32 words (r66.0)
//.declare V0034 (45)  rf=r size=8 type=uq align=4 words (r2.2)
//.declare V0035 (46)  rf=r size=4 type=f align=2 words (r2.8)
//.declare V0036 (47)  rf=r size=4 type=f align=2 words (r2.9)
//.declare V0037 (48)  rf=r size=4 type=d align=2 words (r2.10)
//.declare V0038 (49)  rf=r size=8 type=uq align=4 words (r2.3)
//.declare V0040 (51)  rf=r size=32 type=d alias=+0 align=32 words (r66.0)
//.declare V0042 (53)  rf=r size=64 type=w align=32 words (r1.0)
//.declare V0046 (57)  rf=r size=8 type=uq align=16 words (r2.0)
//.declare V0047 (58)  rf=r size=8 type=uq align=4 words (r2.1)
//.declare V0053 (64)  rf=r size=32 type=ud alias=V0040+0 align=16 words (r66.0)
//.declare V0054 (65)  rf=r size=8 type=q align=4 words (r3.0)
//.declare V0055 (66)  rf=r size=8 type=q alias=V0034+0 align=4 words (r2.2)
//.declare V0056 (67)  rf=r size=8 type=q align=4 words (r8.0)
//.declare V0057 (68)  rf=r size=256 type=q align=32 words (r4.0)
//.declare V0058 (69)  rf=r size=64 type=uw alias=V0042+0 align=32 words (r1.0)
//.declare V0059 (70)  rf=r size=512 type=f align=32 words (r10.0)
//.declare V0060 (71)  rf=r size=512 type=f align=32 words (r26.0)
//.declare V0061 (72)  rf=r size=512 type=f align=32 words (r42.0)
//.declare V0062 (73)  rf=r size=512 type=f align=32 words (r58.0)
//.declare V0063 (74)  rf=r size=128 type=f align=32 words (r18.0)
//.declare V0064 (75)  rf=r size=64 type=hf align=32 words (r38.0)
//.declare P01 (76)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0065 (77)  rf=r size=64 type=w alias=V0064+0 align=32 words (r38.0)
//.declare V0066 (78)  rf=r size=128 type=d align=32 words (r21.0)
//.declare V0068 (80)  rf=r size=64 type=uw alias=V0064+0 align=32 words (r38.0)
//.declare V0069 (81)  rf=r size=128 type=d align=32 words (r26.0)
//.declare V0070 (82)  rf=r size=128 type=d align=32 words (r21.0)
//.declare V0071 (83)  rf=r size=128 type=ud alias=V0069+0 align=32 words (r26.0)
//.declare V0072 (84)  rf=r size=128 type=ud alias=V0070+0 align=32 words (r21.0)
//.declare V0073 (85)  rf=r size=128 type=f align=32 words (r20.0)
//.declare V0074 (86)  rf=r size=64 type=hf align=32 words (r40.0)
//.declare P02 (87)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V0075 (88)  rf=r size=64 type=w alias=V0074+0 align=32 words (r40.0)
//.declare V0076 (89)  rf=r size=128 type=d align=32 words (r23.0)
//.declare V0078 (91)  rf=r size=64 type=uw alias=V0074+0 align=32 words (r40.0)
//.declare V0079 (92)  rf=r size=128 type=d align=32 words (r28.0)
//.declare V0080 (93)  rf=r size=128 type=d align=32 words (r16.0)
//.declare V0081 (94)  rf=r size=128 type=ud alias=V0079+0 align=32 words (r28.0)
//.declare V0082 (95)  rf=r size=128 type=ud alias=V0080+0 align=32 words (r16.0)
//.declare V0083 (96)  rf=r size=128 type=d align=32 words (r44.0)
//.declare V0084 (97)  rf=r size=128 type=f align=32 words (r22.0)
//.declare V0085 (98)  rf=r size=64 type=hf align=32 words (r4.0)
//.declare P03 (99)  rf=f32  size=4 type=uw align=2 words (f3.0)
//.declare V0086 (100)  rf=r size=64 type=w alias=V0085+0 align=32 words (r4.0)
//.declare V0087 (101)  rf=r size=128 type=d align=32 words (r31.0)
//.declare V0089 (103)  rf=r size=64 type=uw alias=V0085+0 align=32 words (r4.0)
//.declare V0090 (104)  rf=r size=128 type=d align=32 words (r24.0)
//.declare V0091 (105)  rf=r size=128 type=d align=32 words (r39.0)
//.declare V0092 (106)  rf=r size=128 type=ud alias=V0090+0 align=32 words (r24.0)
//.declare V0093 (107)  rf=r size=128 type=ud alias=V0091+0 align=32 words (r39.0)
//.declare V0094 (108)  rf=r size=128 type=f align=32 words (r36.0)
//.declare V0095 (109)  rf=r size=64 type=hf align=32 words (r6.0)
//.declare P04 (110)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0096 (111)  rf=r size=64 type=w alias=V0095+0 align=32 words (r6.0)
//.declare V0097 (112)  rf=r size=128 type=d align=32 words (r67.0)
//.declare V0099 (114)  rf=r size=64 type=uw alias=V0095+0 align=32 words (r6.0)
//.declare V0100 (115)  rf=r size=128 type=d align=32 words (r70.0)
//.declare V0101 (116)  rf=r size=128 type=d align=32 words (r46.0)
//.declare V0102 (117)  rf=r size=128 type=ud alias=V0100+0 align=32 words (r70.0)
//.declare V0103 (118)  rf=r size=128 type=ud alias=V0101+0 align=32 words (r46.0)
//.declare V0104 (119)  rf=r size=128 type=d align=32 words (r5.0)
//.declare V0105 (120)  rf=r size=128 type=f align=32 words (r54.0)
//.declare V0106 (121)  rf=r size=64 type=hf align=32 words (r20.0)
//.declare P05 (122)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0107 (123)  rf=r size=64 type=w alias=V0106+0 align=32 words (r20.0)
//.declare V0108 (124)  rf=r size=128 type=d align=32 words (r3.0)
//.declare V0110 (126)  rf=r size=64 type=uw alias=V0106+0 align=32 words (r20.0)
//.declare V0111 (127)  rf=r size=128 type=d align=32 words (r48.0)
//.declare V0112 (128)  rf=r size=128 type=d align=32 words (r73.0)
//.declare V0113 (129)  rf=r size=128 type=ud alias=V0111+0 align=32 words (r48.0)
//.declare V0114 (130)  rf=r size=128 type=ud alias=V0112+0 align=32 words (r73.0)
//.declare V0115 (131)  rf=r size=128 type=f align=32 words (r56.0)
//.declare V0116 (132)  rf=r size=64 type=hf align=32 words (r34.0)
//.declare P06 (133)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V0117 (134)  rf=r size=64 type=w alias=V0116+0 align=32 words (r34.0)
//.declare V0118 (135)  rf=r size=128 type=d align=32 words (r73.0)
//.declare V0120 (137)  rf=r size=64 type=uw alias=V0116+0 align=32 words (r34.0)
//.declare V0121 (138)  rf=r size=128 type=d align=32 words (r52.0)
//.declare V0122 (139)  rf=r size=128 type=d align=32 words (r36.0)
//.declare V0123 (140)  rf=r size=128 type=ud alias=V0121+0 align=32 words (r52.0)
//.declare V0124 (141)  rf=r size=128 type=ud alias=V0122+0 align=32 words (r36.0)
//.declare V0125 (142)  rf=r size=128 type=d align=32 words (r46.0)
//.declare V0126 (143)  rf=r size=128 type=f align=32 words (r9.0)
//.declare V0127 (144)  rf=r size=64 type=hf align=32 words (r8.0)
//.declare P07 (145)  rf=f32  size=4 type=uw align=2 words (f3.0)
//.declare V0128 (146)  rf=r size=64 type=w alias=V0127+0 align=32 words (r8.0)
//.declare V0129 (147)  rf=r size=128 type=d align=32 words (r11.0)
//.declare V0131 (149)  rf=r size=64 type=uw alias=V0127+0 align=32 words (r8.0)
//.declare V0132 (150)  rf=r size=128 type=d align=32 words (r54.0)
//.declare V0133 (151)  rf=r size=128 type=d align=32 words (r11.0)
//.declare V0134 (152)  rf=r size=128 type=ud alias=V0132+0 align=32 words (r54.0)
//.declare V0135 (153)  rf=r size=128 type=ud alias=V0133+0 align=32 words (r11.0)
//.declare V0136 (154)  rf=r size=128 type=f align=32 words (r11.0)
//.declare V0137 (155)  rf=r size=64 type=hf align=32 words (r10.0)
//.declare P08 (156)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0138 (157)  rf=r size=64 type=w alias=V0137+0 align=32 words (r10.0)
//.declare V0139 (158)  rf=r size=128 type=d align=32 words (r33.0)
//.declare V0141 (160)  rf=r size=64 type=uw alias=V0137+0 align=32 words (r10.0)
//.declare V0142 (161)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0143 (162)  rf=r size=128 type=d align=32 words (r14.0)
//.declare V0144 (163)  rf=r size=128 type=ud alias=V0142+0 align=32 words (r8.0)
//.declare V0145 (164)  rf=r size=128 type=ud alias=V0143+0 align=32 words (r14.0)
//.declare V0146 (165)  rf=r size=128 type=d align=32 words (r5.0)
//.declare V0147 (166)  rf=r size=128 type=f align=32 words (r52.0)
//.declare V0148 (167)  rf=r size=64 type=hf align=32 words (r30.0)
//.declare P09 (168)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0149 (169)  rf=r size=64 type=w alias=V0148+0 align=32 words (r30.0)
//.declare V0150 (170)  rf=r size=128 type=d align=32 words (r67.0)
//.declare V0152 (172)  rf=r size=64 type=uw alias=V0148+0 align=32 words (r30.0)
//.declare V0153 (173)  rf=r size=128 type=d align=32 words (r18.0)
//.declare V0154 (174)  rf=r size=128 type=d align=32 words (r49.0)
//.declare V0155 (175)  rf=r size=128 type=ud alias=V0153+0 align=32 words (r18.0)
//.declare V0156 (176)  rf=r size=128 type=ud alias=V0154+0 align=32 words (r49.0)
//.declare V0157 (177)  rf=r size=128 type=f align=32 words (r54.0)
//.declare V0158 (178)  rf=r size=64 type=hf align=32 words (r50.0)
//.declare P10 (179)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V0159 (180)  rf=r size=64 type=w alias=V0158+0 align=32 words (r50.0)
//.declare V0160 (181)  rf=r size=128 type=d align=32 words (r41.0)
//.declare V0162 (183)  rf=r size=64 type=uw alias=V0158+0 align=32 words (r50.0)
//.declare V0163 (184)  rf=r size=128 type=d align=32 words (r34.0)
//.declare V0164 (185)  rf=r size=128 type=d align=32 words (r8.0)
//.declare V0165 (186)  rf=r size=128 type=ud alias=V0163+0 align=32 words (r34.0)
//.declare V0166 (187)  rf=r size=128 type=ud alias=V0164+0 align=32 words (r8.0)
//.declare V0167 (188)  rf=r size=128 type=d align=32 words (r38.0)
//.declare V0168 (189)  rf=r size=128 type=f align=32 words (r56.0)
//.declare V0169 (190)  rf=r size=64 type=hf align=32 words (r20.0)
//.declare P11 (191)  rf=f32  size=4 type=uw align=2 words (f3.0)
//.declare V0170 (192)  rf=r size=64 type=w alias=V0169+0 align=32 words (r20.0)
//.declare V0171 (193)  rf=r size=128 type=d align=32 words (r51.0)
//.declare V0173 (195)  rf=r size=64 type=uw alias=V0169+0 align=32 words (r20.0)
//.declare V0174 (196)  rf=r size=128 type=d align=32 words (r24.0)
//.declare V0175 (197)  rf=r size=128 type=d align=32 words (r43.0)
//.declare V0176 (198)  rf=r size=128 type=ud alias=V0174+0 align=32 words (r24.0)
//.declare V0177 (199)  rf=r size=128 type=ud alias=V0175+0 align=32 words (r43.0)
//.declare V0178 (200)  rf=r size=128 type=f align=32 words (r13.0)
//.declare V0179 (201)  rf=r size=64 type=hf align=32 words (r38.0)
//.declare P12 (202)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0180 (203)  rf=r size=64 type=w alias=V0179+0 align=32 words (r38.0)
//.declare V0181 (204)  rf=r size=128 type=d align=32 words (r57.0)
//.declare V0183 (206)  rf=r size=64 type=uw alias=V0179+0 align=32 words (r38.0)
//.declare V0184 (207)  rf=r size=128 type=d align=32 words (r26.0)
//.declare V0185 (208)  rf=r size=128 type=d align=32 words (r14.0)
//.declare V0186 (209)  rf=r size=128 type=ud alias=V0184+0 align=32 words (r26.0)
//.declare V0187 (210)  rf=r size=128 type=ud alias=V0185+0 align=32 words (r14.0)
//.declare V0188 (211)  rf=r size=128 type=d align=32 words (r46.0)
//.declare V0189 (212)  rf=r size=128 type=f align=32 words (r28.0)
//.declare V0190 (213)  rf=r size=64 type=hf align=32 words (r10.0)
//.declare P13 (214)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0191 (215)  rf=r size=64 type=w alias=V0190+0 align=32 words (r10.0)
//.declare V0192 (216)  rf=r size=128 type=d align=32 words (r53.0)
//.declare V0194 (218)  rf=r size=64 type=uw alias=V0190+0 align=32 words (r10.0)
//.declare V0195 (219)  rf=r size=128 type=d align=32 words (r12.0)
//.declare V0196 (220)  rf=r size=128 type=d align=32 words (r51.0)
//.declare V0197 (221)  rf=r size=128 type=ud alias=V0195+0 align=32 words (r12.0)
//.declare V0198 (222)  rf=r size=128 type=ud alias=V0196+0 align=32 words (r51.0)
//.declare V0199 (223)  rf=r size=128 type=f align=32 words (r31.0)
//.declare V0200 (224)  rf=r size=64 type=hf align=32 words (r32.0)
//.declare P14 (225)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V0201 (226)  rf=r size=64 type=w alias=V0200+0 align=32 words (r32.0)
//.declare V0202 (227)  rf=r size=128 type=d align=32 words (r41.0)
//.declare V0204 (229)  rf=r size=64 type=uw alias=V0200+0 align=32 words (r32.0)
//.declare V0205 (230)  rf=r size=128 type=d align=32 words (r18.0)
//.declare V0206 (231)  rf=r size=128 type=d align=32 words (r10.0)
//.declare V0207 (232)  rf=r size=128 type=ud alias=V0205+0 align=32 words (r18.0)
//.declare V0208 (233)  rf=r size=128 type=ud alias=V0206+0 align=32 words (r10.0)
//.declare V0209 (234)  rf=r size=128 type=d align=32 words (r48.0)
//.declare V0210 (235)  rf=r size=128 type=f align=32 words (r23.0)
//.declare V0211 (236)  rf=r size=64 type=hf align=32 words (r22.0)
//.declare P15 (237)  rf=f32  size=4 type=uw align=2 words (f3.0)
//.declare V0212 (238)  rf=r size=64 type=w alias=V0211+0 align=32 words (r22.0)
//.declare V0213 (239)  rf=r size=128 type=d align=32 words (r35.0)
//.declare V0215 (241)  rf=r size=64 type=uw alias=V0211+0 align=32 words (r22.0)
//.declare V0216 (242)  rf=r size=128 type=d align=32 words (r56.0)
//.declare V0217 (243)  rf=r size=128 type=d align=32 words (r23.0)
//.declare V0218 (244)  rf=r size=128 type=ud alias=V0216+0 align=32 words (r56.0)
//.declare V0219 (245)  rf=r size=128 type=ud alias=V0217+0 align=32 words (r23.0)
//.declare V0220 (246)  rf=r size=128 type=f align=32 words (r3.0)
//.declare V0221 (247)  rf=r size=64 type=hf align=32 words (r4.0)
//.declare P16 (248)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare V0222 (249)  rf=r size=64 type=w alias=V0221+0 align=32 words (r4.0)
//.declare V0223 (250)  rf=r size=128 type=d align=32 words (r33.0)
//.declare V0225 (252)  rf=r size=64 type=uw alias=V0221+0 align=32 words (r4.0)
//.declare V0226 (253)  rf=r size=128 type=d align=32 words (r6.0)
//.declare V0227 (254)  rf=r size=128 type=d align=32 words (r26.0)
//.declare V0228 (255)  rf=r size=128 type=ud alias=V0226+0 align=32 words (r6.0)
//.declare V0229 (256)  rf=r size=128 type=ud alias=V0227+0 align=32 words (r26.0)
//.declare V0230 (257)  rf=r size=128 type=d align=32 words (r8.0)
//.declare P17 (258)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V0231 (259)  rf=r size=8 type=uq align=32 words (r3.0)
//.declare V0232 (260)  rf=r size=4 type=d align=32 words (r4.0)
//.declare  (261)  rf=r size=128 type=hf align=32 words (r24.0)
//.declare  (262)  rf=r size=2 type=uw align=1 words (r2.0)
//.declare  (263)  rf=r size=128 type=uw align=32 words (r14.0)
//.declare  (264)  rf=r size=128 type=hf align=32 words (r34.0)
//.declare  (266)  rf=r size=128 type=uw align=32 words (r16.0)
//.declare  (267)  rf=r size=128 type=hf align=32 words (r50.0)
//.declare  (269)  rf=r size=128 type=uw align=32 words (r38.0)
//.declare  (270)  rf=r size=128 type=hf align=32 words (r52.0)
//.declare  (272)  rf=r size=128 type=uw align=32 words (r40.0)
//.declare  (273)  rf=r size=128 type=hf align=32 words (r7.0)
//.declare  (275)  rf=r size=128 type=uw align=32 words (r6.0)
//.declare  (276)  rf=r size=128 type=hf align=32 words (r18.0)
//.declare  (278)  rf=r size=128 type=uw align=32 words (r36.0)
//.declare  (279)  rf=r size=128 type=hf align=32 words (r35.0)
//.declare  (281)  rf=r size=128 type=uw align=32 words (r18.0)
//.declare  (282)  rf=r size=128 type=hf align=32 words (r50.0)
//.declare  (284)  rf=r size=128 type=uw align=32 words (r14.0)
//.declare  (285)  rf=r size=128 type=hf align=32 words (r11.0)
//.declare  (287)  rf=r size=128 type=uw align=32 words (r26.0)
//.declare  (288)  rf=r size=128 type=hf align=32 words (r18.0)
//.declare  (290)  rf=r size=128 type=uw align=32 words (r28.0)
//.declare  (291)  rf=r size=128 type=hf align=32 words (r42.0)
//.declare  (293)  rf=r size=128 type=uw align=32 words (r30.0)
//.declare  (294)  rf=r size=128 type=hf align=32 words (r26.0)
//.declare  (296)  rf=r size=128 type=uw align=32 words (r16.0)
//.declare  (297)  rf=r size=128 type=hf align=32 words (r16.0)
//.declare  (299)  rf=r size=128 type=uw align=32 words (r28.0)
//.declare  (300)  rf=r size=128 type=hf align=32 words (r21.0)
//.declare  (302)  rf=r size=128 type=uw align=32 words (r20.0)
//.declare  (303)  rf=r size=128 type=hf align=32 words (r39.0)
//.declare  (305)  rf=r size=128 type=uw align=32 words (r16.0)
//.declare  (306)  rf=r size=128 type=hf align=32 words (r43.0)
//.declare  (308)  rf=r size=128 type=uw align=32 words (r30.0)
//.declare r0 (309)  rf=r size=64 type=ud align=32 words (r0.0)
//.declare rtmp (310)  rf=r size=64 type=ud align=32 words (r95.0)
//.declare r0_7_uq (311)  rf=r size=64 type=uq align=32 words (r0.7)
//.declare inlineRegFromTDL (312)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare inlineRegExpectedLocation (313)  rf=r size=64 type=ud align=32 words (r2.0)
//.declare  (314)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare inlineDataRegister (315)  rf=r size=64 type=uq align=32 words (r2.0)

// .inputs
// +----------+----------+--------+----------+------------------+
// | id       | type     |  bytes | at       | from             |
// +----------+----------+--------+----------+------------------+
// | V0042    | :w x 32  |   0x40 | r1       | pti[tid]+0x0     |
// | V0046    | :uq      |    0x8 | r2       | inline+0x0       |
// | V0047    | :uq      |    0x8 | r2+0x8   | inline+0x8       |
// | V0034    | :uq      |    0x8 | r2+0x10  | inline+0x10      |
// | V0038    | :uq      |    0x8 | r2+0x18  | inline+0x18      |
// | V0035    | :f       |    0x4 | r2+0x20  | inline+0x20      |
// | V0036    | :f       |    0x4 | r2+0x24  | inline+0x24      |
// | V0037    | :d       |    0x4 | r2+0x28  | inline+0x28      |
// +----------+----------+--------+----------+------------------+


// B000: Preds:{},  Succs:{B001}
per_thread_prolog:
(W)     and (1|M0)               acc0.0<1>:ud  r0.4<0;1,0>:uw    0xFF:uw                             //  ALU pipe: int; 
(W)     mov (1|M0)               s0.2<1>:uq    r0.7<0;1,0>:uq                                        //  ALU pipe: int; 
(W)     mad (1|M0)               acc0.0<1>:ud  0x0:uw               acc0.0<0;0>:ud    0x40:uw              //  R_SYM_ADDR_16: __INTEL_PER_THREAD_OFF; ALU pipe: int; 
(W)     mov (16|M0)              r2.0<1>:ud    r1.0<1;1,0>:ud                                        //  ALU pipe: int; 
(W)     add (1|M0)               r95.0<1>:ud   acc0.0<0;1,0>:ud  0x0:ud                              //  R_SYM_ADDR_32: __INTEL_PATCH_CROSS_THREAD_OFFSET_OFF_R0; ALU pipe: int; 
(W)     sendg.ugm (1|M0)         r1       r95:1  null:0  s0.16  0x281680 {A@1,$0} // rd:64 B; load.ugm.d32x16t.a32u.ovf.ca.ca.uc [s0.16+src0] // 
        nop                                                                                          // 
        nop                                                                                          // 
// B001: Preds:{B000},  Succs:{B002}
// cross_thread_prolog:
(W)     mov (1|M0)               s0.3<1>:uq    0x0:uq                                                //  R_SYM_ADDR_32: __INTEL_PATCH_CROSS_THREAD_OFFSET_OFF_R0; ALU pipe: S0; 
// B002: Preds:{B001},  Succs:{B003, B004}
// _main:
(W)     mov (16|M0)              r66.0<1>:ud   r0.0<1;1,0>:ud                                        //  ALU pipe: int; $1
(W)     or (1|M0)                cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x400004C0:ud              {A@1}    // $1
(W)     shl (1|M0)               acc0.0<1>:q   r66.1<0;1,0>:ud   14:w               {A@1}            //  ALU pipe: int; $3
        mov (16|M0)              r4.0<1>:q     r1.0<1;1,0>:uw                   {$0.dst}             //  ALU pipe: int; $5
(W)     add (1|M0)               r8.0<1>:q     acc0.0<0;1,0>:q   r2.2<0;1,0>:q                       //  ALU pipe: int; $4
        mov (16|M16)             r6.0<1>:q     r1.16<1;1,0>:uw                                       //  ALU pipe: int; $5
(W)     mov (1|M0)               s0.2<1>:q     r8.0<0;1,0>:q                    {I@2}                //  ALU pipe: int; $6
(W)     mov (1|M0)               r2.0<1>:hf    0x8000:hf                                             //  ALU pipe: float; $13
        sendg.ugm (32|M0)        r10      r4:4  null:0  s0.16  0x100000009180 {I@1,$1} // rd:512 B; load.ugm.d32x4.a64 [s0.16+0x10*src0] // $6
        sendg.ugm (32|M0)        r26      r4:4  null:0  s0.16  0x100100009180 {$2} // rd:512 B; load.ugm.d32x4.a64 [s0.16+0x10*src0+0x1000] // $7
        sendg.ugm (32|M0)        r42      r4:4  null:0  s0.16  0x100200009180 {$3} // rd:512 B; load.ugm.d32x4.a64 [s0.16+0x10*src0+0x2000] // $8
        sendg.ugm (32|M0)        r58      r4:4  null:0  s0.16  0x100300009180 {$4} // rd:512 B; load.ugm.d32x4.a64 [s0.16+0x10*src0+0x3000] // $9
        mad (32|M0)              acc0.0<1>:f   r2.9<0;0>:f       r2.8<0;0>:f       r10.0<1>:f       {$1.dst} //  ALU pipe: float; $10
        mad (32|M0)              acc2.0<1>:f   r2.9<0;0>:f       r2.8<0;0>:f       r12.0<1>:f        //  ALU pipe: float; $17
        mov (32|M0)              r24.0<2>:hf   acc0.0<1;1,0>:f                                       //  ALU pipe: int; $11
        mov (32|M0)              r34.0<2>:hf   acc2.0<1;1,0>:f                                       //  ALU pipe: int; $18
        mad (32|M0)              acc0.0<1>:f   r2.9<0;0>:f       r2.8<0;0>:f       r14.0<1>:f       {I@2} //  ALU pipe: float; $25
        mad (32|M0)              acc2.0<1>:f   r2.9<0;0>:f       r2.8<0;0>:f       r16.0<1>:f       {I@1} //  ALU pipe: float; $32
        mov (32|M0)              r38.0<1>:uw   r24.0<2;1,0>:uw                                       //  ALU pipe: int; $11
        mov (32|M0)              r40.0<1>:uw   r34.0<2;1,0>:uw                                       //  ALU pipe: int; $18
        mov (32|M0)              r50.0<2>:hf   acc0.0<1;1,0>:f                                       //  ALU pipe: int; $26
        mov (32|M0)              r52.0<2>:hf   acc2.0<1;1,0>:f                                       //  ALU pipe: int; $33
        sync.nop                             null                             {I@2}                  // $40
        mad (32|M0)              acc0.0<1>:f   r2.9<0;0>:f       r2.8<0;0>:f       r26.0<1>:f       {$2.dst} //  ALU pipe: float; $40
        mad (32|M0)              acc2.0<1>:f   r2.9<0;0>:f       r2.8<0;0>:f       r28.0<1>:f       {I@1} //  ALU pipe: float; $47
        cmp (32|M0)   (gt)f1.0   null<1>:w     r38.0<1;1,0>:w    -1:w                                //  ALU pipe: int; $12
        cmp (32|M0)   (gt)f0.0   null<1>:w     r40.0<1;1,0>:w    -1:w                                //  ALU pipe: int; $19
        mov (32|M0)              r4.0<1>:uw    r50.0<2;1,0>:uw                  {$4.src}             //  ALU pipe: int; $26
        mov (32|M0)              r6.0<1>:uw    r52.0<2;1,0>:uw                                       //  ALU pipe: int; $33
        mov (32|M0)              r7.0<2>:hf    acc0.0<1;1,0>:f                                       //  ALU pipe: int; $41
        mov (32|M0)              r18.0<2>:hf   acc2.0<1;1,0>:f                                       //  ALU pipe: int; $48
        mad (32|M0)              r9.0<1>:f     r2.9<0;0>:f       r2.8<0;0>:f       r30.0<1>:f        //  ALU pipe: float; $55
        mad (32|M0)              r11.0<1>:f    r2.9<0;0>:f       r2.8<0;0>:f       r32.0<1>:f        //  ALU pipe: float; $62
        cmp (32|M0)   (gt)f3.0   null<1>:w     r4.0<1;1,0>:w     -1:w               {I@4}            //  ALU pipe: int; $27
        cmp (32|M0)   (gt)f2.0   null<1>:w     r6.0<1;1,0>:w     -1:w               {I@4}            //  ALU pipe: int; $34
        mov (32|M0)              r14.0<2>:uw   r38.0<1;1,0>:uw                  {F@6}                //  ALU pipe: int; $15
        mov (32|M0)              r16.0<2>:uw   r40.0<1;1,0>:uw                  {F@5}                //  ALU pipe: int; $22
(f1.0)  sel (32|M0)              acc0.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $13
(f0.0)  sel (32|M0)              acc2.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $20
        mov (32|M0)              r20.0<1>:uw   r7.0<2;1,0>:uw                   {I@7}                //  ALU pipe: int; $41
        mov (32|M0)              r34.0<1>:uw   r18.0<2;1,0>:uw                  {I@7}                //  ALU pipe: int; $48
        mov (32|M0)              r35.0<2>:hf   r9.0<1;1,0>:f                    {F@2}                //  ALU pipe: int; $56
        mov (32|M0)              r50.0<2>:hf   r11.0<1;1,0>:f                   {F@1}                //  ALU pipe: int; $63
        mad (32|M0)              r52.0<1>:f    r2.9<0;0>:f       r2.8<0;0>:f       r42.0<1>:f       {$3.dst} //  ALU pipe: float; $70
        mad (32|M0)              r54.0<1>:f    r2.9<0;0>:f       r2.8<0;0>:f       r44.0<1>:f        //  ALU pipe: float; $77
        xor (32|M0)              r26.0<1>:d    acc0.0<1;1,0>:d   r14.0<2;1,0>:uw  {I@7}              //  ALU pipe: int; $15
        xor (32|M0)              r28.0<1>:d    acc2.0<1;1,0>:d   r16.0<2;1,0>:uw  {I@7}              //  ALU pipe: int; $22
        cmp (32|M0)   (gt)f1.0   null<1>:w     r20.0<1;1,0>:w    -1:w               {I@6}            //  ALU pipe: int; $42
        cmp (32|M0)   (gt)f0.0   null<1>:w     r34.0<1;1,0>:w    -1:w               {I@6}            //  ALU pipe: int; $49
(f3.0)  sel (32|M0)              acc0.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $28
(f2.0)  sel (32|M0)              acc2.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $35
        mov (32|M0)              r38.0<2>:uw   r4.0<1;1,0>:uw                                        //  ALU pipe: int; $30
        mov (32|M0)              r40.0<2>:uw   r6.0<1;1,0>:uw                                        //  ALU pipe: int; $37
        mov (32|M0)              r8.0<1>:uw    r35.0<2;1,0>:uw                  {I@7}                //  ALU pipe: int; $56
        mov (32|M0)              r10.0<1>:uw   r50.0<2;1,0>:uw                  {I@7}                //  ALU pipe: int; $63
        mov (32|M0)              r11.0<2>:hf   r52.0<1;1,0>:f                   {F@2}                //  ALU pipe: int; $71
        mov (32|M0)              r18.0<2>:hf   r54.0<1;1,0>:f                   {F@1}                //  ALU pipe: int; $78
        shr (32|M0)              r21.0<1>:ud   r26.0<1;1,0>:ud   4:w                                 //  ALU pipe: int; $16
        shr (32|M0)              r16.0<1>:ud   r28.0<1;1,0>:ud   4:w                                 //  ALU pipe: int; $23
        mad (32|M0)              r56.0<1>:f    r2.9<0;0>:f       r2.8<0;0>:f       r46.0<1>:f        //  ALU pipe: float; $85
        mad (32|M0)              r13.0<1>:f    r2.9<0;0>:f       r2.8<0;0>:f       r48.0<1>:f        //  ALU pipe: float; $92
        xor (32|M0)              r24.0<1>:d    acc0.0<1;1,0>:d   r38.0<2;1,0>:uw  {I@7}              //  ALU pipe: int; $30
        xor (32|M0)              r70.0<1>:d    acc2.0<1;1,0>:d   r40.0<2;1,0>:uw  {I@7}              //  ALU pipe: int; $37
        cmp (32|M0)   (gt)f3.0   null<1>:w     r8.0<1;1,0>:w     -1:w               {I@7}            //  ALU pipe: int; $57
        cmp (32|M0)   (gt)f2.0   null<1>:w     r10.0<1;1,0>:w    -1:w               {I@7}            //  ALU pipe: int; $64
(f0.0)  sel (32|M0)              r73.0<1>:d    r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $50
(f1.0)  sel (32|M0)              acc2.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $43
        mov (32|M0)              r6.0<2>:uw    r20.0<1;1,0>:uw                                       //  ALU pipe: int; $45
        mov (32|M0)              r36.0<2>:uw   r34.0<1;1,0>:uw                                       //  ALU pipe: int; $52
        mov (32|M0)              r30.0<1>:uw   r11.0<2;1,0>:uw                                       //  ALU pipe: int; $71
        mov (32|M0)              r50.0<1>:uw   r18.0<2;1,0>:uw                                       //  ALU pipe: int; $78
        add (32|M0)              r44.0<1>:d    r21.0<1;1,0>:d    r16.0<1;1,0>:d   {I@7}              //  ALU pipe: int; $24
        mov (32|M0)              r42.0<2>:hf   r56.0<1;1,0>:f                   {F@2}                //  ALU pipe: int; $86
        mov (32|M0)              r26.0<2>:hf   r13.0<1;1,0>:f                   {F@1}                //  ALU pipe: int; $93
        shr (32|M0)              r39.0<1>:ud   r24.0<1;1,0>:ud   4:w                                 //  ALU pipe: int; $31
        shr (32|M0)              r46.0<1>:ud   r70.0<1;1,0>:ud   4:w                                 //  ALU pipe: int; $38
        mad (32|M0)              acc0.0<1>:f   r2.9<0;0>:f       r2.8<0;0>:f       r58.0<1>:f       {$4.dst} //  ALU pipe: float; $100
        mad (32|M0)              r31.0<1>:f    r2.9<0;0>:f       r2.8<0;0>:f       r60.0<1>:f        //  ALU pipe: float; $107
        xor (32|M0)              r48.0<1>:d    acc2.0<1;1,0>:d   r6.0<2;1,0>:uw   {I@7}              //  ALU pipe: int; $45
        xor (32|M0)              r52.0<1>:d    r73.0<1;1,0>:d    r36.0<2;1,0>:uw  {I@7}              //  ALU pipe: int; $52
        cmp (32|M0)   (gt)f1.0   null<1>:w     r30.0<1;1,0>:w    -1:w               {I@7}            //  ALU pipe: int; $72
        cmp (32|M0)   (gt)f0.0   null<1>:w     r50.0<1;1,0>:w    -1:w               {I@7}            //  ALU pipe: int; $79
(f2.0)  sel (32|M0)              r33.0<1>:d    r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $65
(f3.0)  sel (32|M0)              acc2.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $58
        mov (32|M0)              r18.0<2>:uw   r8.0<1;1,0>:uw                                        //  ALU pipe: int; $60
        mov (32|M0)              r20.0<1>:uw   r42.0<2;1,0>:uw                  {I@7}                //  ALU pipe: int; $86
        mov (32|M0)              r14.0<2>:uw   r10.0<1;1,0>:uw                                       //  ALU pipe: int; $67
        mov (32|M0)              r38.0<1>:uw   r26.0<2;1,0>:uw                                       //  ALU pipe: int; $93
        mov (32|M0)              r16.0<2>:hf   acc0.0<1;1,0>:f                                       //  ALU pipe: int; $101
        mov (32|M0)              r21.0<2>:hf   r31.0<1;1,0>:f                   {F@1}                //  ALU pipe: int; $108
        add3 (32|M0)             r5.0<1>:d     r44.0<1;0>:d      r39.0<1;0>:d      r46.0<1>:d        //  ALU pipe: int; $39
        shr (32|M0)              r73.0<1>:ud   r48.0<1;1,0>:ud   4:w                                 //  ALU pipe: int; $46
        shr (32|M0)              r36.0<1>:ud   r52.0<1;1,0>:ud   4:w                                 //  ALU pipe: int; $53
        mad (32|M0)              r23.0<1>:f    r2.9<0;0>:f       r2.8<0;0>:f       r62.0<1>:f        //  ALU pipe: float; $115
        mad (32|M0)              r3.0<1>:f     r2.9<0;0>:f       r2.8<0;0>:f       r64.0<1>:f        //  ALU pipe: float; $122
        xor (32|M0)              r54.0<1>:d    acc2.0<1;1,0>:d   r18.0<2;1,0>:uw  {I@7}              //  ALU pipe: int; $60
        cmp (32|M0)   (gt)f3.0   null<1>:w     r20.0<1;1,0>:w    -1:w               {I@7}            //  ALU pipe: int; $87
        xor (32|M0)              r8.0<1>:d     r33.0<1;1,0>:d    r14.0<2;1,0>:uw  {I@7}              //  ALU pipe: int; $67
        cmp (32|M0)   (gt)f2.0   null<1>:w     r38.0<1;1,0>:w    -1:w               {I@7}            //  ALU pipe: int; $94
(f1.0)  sel (32|M0)              acc2.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $73
(f0.0)  sel (32|M0)              acc0.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $80
        mov (32|M0)              r26.0<2>:uw   r30.0<1;1,0>:uw                                       //  ALU pipe: int; $75
        mov (32|M0)              r28.0<2>:uw   r50.0<1;1,0>:uw                                       //  ALU pipe: int; $82
        mov (32|M0)              r10.0<1>:uw   r16.0<2;1,0>:uw                                       //  ALU pipe: int; $101
        mov (32|M0)              r32.0<1>:uw   r21.0<2;1,0>:uw                                       //  ALU pipe: int; $108
        add3 (32|M0)             r46.0<1>:d    r5.0<1;0>:d       r73.0<1;0>:d      r36.0<1>:d       {I@7} //  ALU pipe: int; $54
        mov (32|M0)              r39.0<2>:hf   r23.0<1;1,0>:f                   {F@2}                //  ALU pipe: int; $116
        mov (32|M0)              r43.0<2>:hf   r3.0<1;1,0>:f                    {F@1}                //  ALU pipe: int; $123
        shr (32|M0)              r11.0<1>:ud   r54.0<1;1,0>:ud   4:w                                 //  ALU pipe: int; $61
        shr (32|M0)              r14.0<1>:ud   r8.0<1;1,0>:ud    4:w                                 //  ALU pipe: int; $68
        xor (32|M0)              r18.0<1>:d    acc2.0<1;1,0>:d   r26.0<2;1,0>:uw  {I@7}              //  ALU pipe: int; $75
        xor (32|M0)              r34.0<1>:d    acc0.0<1;1,0>:d   r28.0<2;1,0>:uw  {I@7}              //  ALU pipe: int; $82
        cmp (32|M0)   (gt)f1.0   null<1>:w     r10.0<1;1,0>:w    -1:w               {I@7}            //  ALU pipe: int; $102
        cmp (32|M0)   (gt)f0.0   null<1>:w     r32.0<1;1,0>:w    -1:w               {I@7}            //  ALU pipe: int; $109
(f3.0)  sel (32|M0)              acc0.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $88
(f2.0)  sel (32|M0)              acc2.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $95
        mov (32|M0)              r30.0<2>:uw   r20.0<1;1,0>:uw                                       //  ALU pipe: int; $90
        mov (32|M0)              r16.0<2>:uw   r38.0<1;1,0>:uw                                       //  ALU pipe: int; $97
        mov (32|M0)              r22.0<1>:uw   r39.0<2;1,0>:uw                                       //  ALU pipe: int; $116
        mov (32|M0)              r4.0<1>:uw    r43.0<2;1,0>:uw                                       //  ALU pipe: int; $123
        add3 (32|M0)             r5.0<1>:d     r46.0<1;0>:d      r11.0<1;0>:d      r14.0<1>:d       {I@7} //  ALU pipe: int; $69 R{} IR{}{E:7,O:5,E:7,},  R{} IR{}{O:7,E:6,O:7,},  {BC=2}
        shr (32|M0)              r49.0<1>:ud   r18.0<1;1,0>:ud   4:w               {I@7}             //  ALU pipe: int; $76
        shr (32|M0)              r8.0<1>:ud    r34.0<1;1,0>:ud   4:w               {I@7}             //  ALU pipe: int; $83
        xor (32|M0)              r24.0<1>:d    acc0.0<1;1,0>:d   r30.0<2;1,0>:uw  {I@7}              //  ALU pipe: int; $90
        xor (32|M0)              r26.0<1>:d    acc2.0<1;1,0>:d   r16.0<2;1,0>:uw  {I@7}              //  ALU pipe: int; $97
        cmp (32|M0)   (gt)f3.0   null<1>:w     r22.0<1;1,0>:w    -1:w               {I@7}            //  ALU pipe: int; $117
        cmp (32|M0)   (gt)f2.0   null<1>:w     r4.0<1;1,0>:w     -1:w               {I@7}            //  ALU pipe: int; $124
        mov (32|M0)              r28.0<2>:uw   r10.0<1;1,0>:uw                                       //  ALU pipe: int; $105
(f1.0)  sel (32|M0)              acc0.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $103
(f0.0)  sel (32|M0)              acc2.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $110
        mov (32|M0)              r20.0<2>:uw   r32.0<1;1,0>:uw                                       //  ALU pipe: int; $112
        add3 (32|M0)             r38.0<1>:d    r5.0<1;0>:d       r49.0<1;0>:d      r8.0<1>:d        {I@7} //  ALU pipe: int; $84
        shr (32|M0)              r43.0<1>:ud   r24.0<1;1,0>:ud   4:w               {I@7}             //  ALU pipe: int; $91
        shr (32|M0)              r14.0<1>:ud   r26.0<1;1,0>:ud   4:w               {I@7}             //  ALU pipe: int; $98
        xor (32|M0)              r12.0<1>:d    acc0.0<1;1,0>:d   r28.0<2;1,0>:uw  {I@7}              //  ALU pipe: int; $105
        xor (32|M0)              r18.0<1>:d    acc2.0<1;1,0>:d   r20.0<2;1,0>:uw  {I@5}              //  ALU pipe: int; $112
        mov (32|M0)              r30.0<2>:uw   r4.0<1;1,0>:uw                                        //  ALU pipe: int; $127
        mov (32|M0)              r16.0<2>:uw   r22.0<1;1,0>:uw                                       //  ALU pipe: int; $120
(f3.0)  sel (32|M0)              acc0.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $118
(f2.0)  sel (32|M0)              acc2.0<1>:d   r2.0<0;1,0>:uw    0xFFF0:uw                           //  ALU pipe: int; $125
        add3 (32|M0)             r46.0<1>:d    r38.0<1;0>:d      r43.0<1;0>:d      r14.0<1>:d       {I@7} //  ALU pipe: int; $99
        shr (32|M0)              r51.0<1>:ud   r12.0<1;1,0>:ud   4:w               {I@7}             //  ALU pipe: int; $106
        shr (32|M0)              r10.0<1>:ud   r18.0<1;1,0>:ud   4:w               {I@7}             //  ALU pipe: int; $113
        xor (32|M0)              r56.0<1>:d    acc0.0<1;1,0>:d   r16.0<2;1,0>:uw  {I@6}              //  ALU pipe: int; $120
        xor (32|M0)              r6.0<1>:d     acc2.0<1;1,0>:d   r30.0<2;1,0>:uw                     //  ALU pipe: int; $127
        add3 (32|M0)             acc0.0<1>:d   r46.0<1;0>:d      r51.0<1;0>:d      r10.0<1>:d       {I@3} //  ALU pipe: int; $114
        shr (32|M0)              r23.0<1>:ud   r56.0<1;1,0>:ud   4:w               {I@3}             //  ALU pipe: int; $121
        shr (32|M0)              r26.0<1>:ud   r6.0<1;1,0>:ud    4:w               {I@3}             //  ALU pipe: int; $128
        add3 (32|M0)             acc0.0<1>:d   acc0.0<1;0>:d     r23.0<1;0>:d      r26.0<1>:d       {I@1} //  ALU pipe: int; $129
        cmp (32|M0)   (eq)f0.0   null<1>:d     acc0.0<1;1,0>:d   r2.10<0;1,0>:d                      //  ALU pipe: int; $130
(~f0.0) goto (32|M0)                         _0_004            _0_004                                // $131
// B003: [inDivergent],  Preds:{B002},  Succs:{B004}
_0_005:
(W)     mov (1|M0)               r3.0<1>:uq    r2.3<0;1,0>:uq                   {Compacted}          //  ALU pipe: int; $133
(W)     mov (1|M0)               r4.0<1>:d     r2.10<0;1,0>:d                   {Compacted}          //  ALU pipe: int; $134
(W)     sendg.ugm (1|M0)         null     r3:1  r4:1  0x9404 {I@1,$5} // rd:0 B; store.ugm.d32t.a64 [src0] // $135
// B004: Preds:{B003, B002},  Succs:{}
_0_004:
        join (32|M0)                         L2608                                                   // 
L2608:
(W)     sendg.gtwy (1|M0)        null     r0:1  null:0  0x0 {EOT,$6} // rd:0 B; end of thread        // $137
L2624:
(W)     mov (16|M0)              null<1>:ud    0x76A47EC9:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x908E3B28:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x0:ud                                                // 
(W)     mov (16|M0)              null<1>:ud    0x1:ud                                                // 


//.BankConflicts: 2
//.ByteRMWs: 0
//


//.numALUInst: 158
//.accSubDef: 24
//.accSubUse: 24
//.accSubCandidateDef: 41
//.accSubCandidateUse: 41
//
//
//.singlePipeAtOneDistNum: 10
//.allAtOneDistNum: 3
//.syncInstCount: 1
//.tokenReuseCount: 0
//.AfterWriteTokenDepCount: 5
//.AfterReadTokenDepCount: 1
