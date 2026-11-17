//.kernel _ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZ4mainEUlNS0_2idILi1EEEE_EE
//.platform XE3P_CRI
//.thread_config numGRF=64, numAcc=4, numSWSB=32
//.options_string "-emitCrossThreadOffR0Reloc -hashmovs 2299205084 500309506 -hashmovs1 0 1 "
//.full_options "-emitLocation -autoGRFSelection -wideMulMadOpsEn -enableCoalesceScalarMoves -supportLSCImmScale 0 -samplerHeaderWA -enablePreemption -hasRNEandDenorm -noStitchExternFunc -useInlineData -emitCrossThreadOffR0Reloc -abortonspill -abortOnSpill 4 -enableBCR -forceBCR -bumpGRFForForceBCR -enableBundleCR 3 -freqBasedSpillCost 8 -freqBasedSpillCostFunc 1 -boundsChecking -presched-ctrl 6 -presched-rp 90 -nodpsendreorder -SBIDDepLoc -PVCSendWARWA -output -binary -dumpcommonisa -dumpcombinedcisa -dumpvisa -printHexFloatInAsm -noverifyCISA -enableHalfLSC -partialInt64 -activeThreadsOnlyBarrier -hashmovs 2299205084 500309506 -hashmovs1 0 1 -enableEfficient64b -GRFBumpUpNumber 2 -waSlmGOS20 "
//.instCount 71
//.RA type	LOCAL_ROUND_ROBIN_BC_RA
//.git-hash cb58c7fbc7f88dae319e4276acae5bc1f9969b2d

//.declare BuiltInR0 (0)  rf=r size=64 type=ud align=32 words (r0.0) IsBuiltin
//.declare  (1)  rf=r size=64 type=ud align=32 words (r44.0) IsBuiltin
//.declare BuiltinA0 (2)  rf=a size=4 type=ud align=1 words (a0.0) IsBuiltin
//.declare BuiltinA0Dot2 (3)  rf=a size=4 type=ud align=1 words (a0.2) IsBuiltin
//.declare BuiltinSR0Dot1 (5)  rf=r size=4 type=ud align=2 words IsBuiltin
//.declare BuiltinS0 (6)  rf=s size=64 type=uq align=1 words (s0.0) IsBuiltin
//.declare %null (11)  rf=r size=4 type=ud align=2 words
//.declare %local_id_x (14)  rf=r size=4 type=ud align=2 words (r3.3)
//.declare %local_id_y (15)  rf=r size=4 type=ud align=2 words (r3.4)
//.declare %local_size_x (16)  rf=r size=4 type=ud align=2 words (r2.15)
//.declare %local_size_y (17)  rf=r size=4 type=ud align=2 words (r3.0)
//.declare %group_id_x (18)  rf=r size=4 type=ud align=2 words (r0.1)
//.declare %group_id_y (19)  rf=r size=4 type=ud align=2 words (r0.6)
//.declare %group_id_z (20)  rf=r size=4 type=ud align=2 words (r0.7)
//.declare %group_count_x (21)  rf=r size=4 type=ud align=2 words (r3.1)
//.declare %group_count_y (22)  rf=r size=4 type=ud align=2 words (r3.2)
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
//.declare V0033 (44)  rf=r size=64 type=d alias=+0 align=32 words (r44.0)
//.declare V0035 (46)  rf=r size=32 type=d alias=+0 align=32 words (r44.0)
//.declare V0036 (47)  rf=r size=12 type=d align=2 words (r2.2)
//.declare V0037 (48)  rf=r size=12 type=d align=2 words (r2.12)
//.declare V0038 (49)  rf=r size=12 type=d align=2 words (r2.5)
//.declare V0039 (50)  rf=r size=64 type=w align=32 words (r1.0)
//.declare V0043 (54)  rf=r size=8 type=uq align=16 words (r2.0)
//.declare V0045 (56)  rf=r size=8 type=q align=4 words (r2.4)
//.declare V0046 (57)  rf=r size=8 type=q align=4 words (r2.5)
//.declare V0047 (58)  rf=r size=8 type=d align=2 words (r2.0)
//.declare V0048 (59)  rf=r size=8 type=d alias=V0045+0 align=4 words (r2.8)
//.declare V0049 (60)  rf=r size=8 type=q align=4 words (r3.0)
//.declare V0050 (61)  rf=r size=12 type=ud alias=V0038+0 align=2 words (r2.5)
//.declare V0051 (62)  rf=r size=32 type=ud alias=V0035+0 align=16 words (r44.0)
//.declare V0052 (63)  rf=r size=256 type=q align=32 words (r6.0)
//.declare V0053 (64)  rf=r size=64 type=uw alias=V0039+0 align=32 words (r1.0)
//.declare V0054 (65)  rf=r size=256 type=q align=32 words (r11.0)
//.declare V0056 (67)  rf=r size=12 type=ud alias=V0036+0 align=2 words (r2.2)
//.declare V0057 (68)  rf=r size=256 type=q align=32 words (r45.0)
//.declare V0059 (70)  rf=r size=256 type=d alias=V0057+0 align=32 words (r45.0)
//.declare V0060 (71)  rf=r size=128 type=d align=32 words (r52.0)
//.declare V0061 (72)  rf=r size=128 type=d align=32 words (r54.0)
//.declare P01 (73)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0062 (74)  rf=r size=128 type=ud alias=V0060+0 align=32 words (r52.0)
//.declare V0063 (75)  rf=r size=8 type=ud alias=V0047+0 align=2 words (r2.0)
//.declare P02 (76)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare P03 (77)  rf=f32  size=4 type=uw align=2 words (f1.0)
//.declare V0064 (78)  rf=r size=128 type=ud alias=V0061+0 align=32 words (r54.0)
//.declare V0065 (79)  rf=r size=8 type=q align=4 words (r50.0)
//.declare V0066 (80)  rf=r size=12 type=ud alias=V0037+0 align=2 words (r2.12)
//.declare V0067 (81)  rf=r size=256 type=q align=32 words (r24.0)
//.declare V0068 (82)  rf=r size=256 type=ud alias=V0057+0 align=32 words (r45.0)
//.declare V0073 (87)  rf=r size=256 type=uq align=32 words (r3.0)
//.declare V0076 (90)  rf=r size=256 type=ud alias=V0073+0 align=32 words (r3.0)
//.declare V0079 (93)  rf=r size=256 type=uq alias=V0067+0 align=32 words (r24.0)
//.declare V0081 (95)  rf=r size=256 type=d alias=V0067+0 align=32 words (r24.0)
//.declare V0085 (99)  rf=r size=128 type=f align=32 words (r36.0)
//.declare V0087 (101)  rf=r size=128 type=f align=32 words (r38.0)
//.declare V0088 (102)  rf=r size=256 type=q align=32 words (r40.0)
//.declare V0090 (104)  rf=r size=256 type=d alias=V0088+0 align=32 words (r40.0)
//.declare V0091 (105)  rf=r size=128 type=d align=32 words (r57.0)
//.declare V0092 (106)  rf=r size=128 type=d align=32 words (r59.0)
//.declare P04 (107)  rf=f32  size=4 type=uw align=2 words (f3.0)
//.declare V0093 (108)  rf=r size=128 type=ud alias=V0091+0 align=32 words (r57.0)
//.declare P05 (109)  rf=f32  size=4 type=uw align=2 words (f2.0)
//.declare P06 (110)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V0094 (111)  rf=r size=128 type=ud alias=V0092+0 align=32 words (r59.0)
//.declare V0095 (112)  rf=r size=128 type=d align=32 words (r3.0)
//.declare V0096 (113)  rf=r size=128 type=d align=32 words (r5.0)
//.declare V0097 (114)  rf=r size=128 type=ud alias=V0095+0 align=32 words (r3.0)
//.declare V0098 (115)  rf=r size=128 type=ud alias=V0096+0 align=32 words (r5.0)
//.declare  (116)  rf=r size=128 type=q align=32 words (r15.0)
//.declare  (117)  rf=r size=128 type=q align=32 words (r19.0)
//.declare  (118)  rf=r size=4 type=ud align=2 words (r8.0)
//.declare  (125)  rf=r size=128 type=q align=32 words (r10.0)
//.declare  (126)  rf=r size=128 type=q align=32 words (r12.0)
//.declare  (127)  rf=r size=128 type=q align=32 words (r17.0)
//.declare  (128)  rf=r size=128 type=q align=32 words (r21.0)
//.declare  (129)  rf=r size=128 type=q align=32 words (r28.0)
//.declare  (130)  rf=r size=128 type=q align=32 words (r30.0)
//.declare  (133)  rf=r size=128 type=f align=32 words (r32.0)
//.declare  (134)  rf=r size=128 type=f align=32 words (r34.0)
//.declare  (135)  rf=r size=128 type=ud alias=+0 align=32 words (r10.0)
//.declare  (136)  rf=r size=128 type=ud alias=+0 align=32 words (r12.0)
//.declare  (137)  rf=r size=128 type=ud alias=+0 align=32 words (r17.0)
//.declare  (138)  rf=r size=128 type=ud alias=+0 align=32 words (r21.0)
//.declare  (139)  rf=r size=128 type=d alias=+0 align=32 words (r28.0)
//.declare  (140)  rf=r size=128 type=d alias=+0 align=32 words (r30.0)
//.declare  (141)  rf=r size=128 type=ud alias=+0 align=32 words (r28.0)
//.declare  (142)  rf=r size=128 type=ud alias=+0 align=32 words (r30.0)
//.declare  (143)  rf=r size=128 type=uq alias=+0 align=32 words (r28.0)
//.declare  (144)  rf=r size=128 type=uq alias=+0 align=32 words (r30.0)
//.declare  (145)  rf=r size=128 type=ud alias=+0 align=32 words (r32.0)
//.declare  (146)  rf=r size=128 type=ud alias=+0 align=32 words (r34.0)
//.declare r0 (147)  rf=r size=64 type=ud align=32 words (r0.0)
//.declare rtmp (148)  rf=r size=64 type=ud align=32 words (r63.0)
//.declare r0_7_uq (149)  rf=r size=64 type=uq align=32 words (r0.7)
//.declare inlineRegFromTDL (150)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare inlineRegExpectedLocation (151)  rf=r size=64 type=ud align=32 words (r2.0)
//.declare  (152)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare inlineDataRegister (153)  rf=r size=64 type=uq align=32 words (r2.0)

// .inputs
// +----------+----------+--------+----------+------------------+
// | id       | type     |  bytes | at       | from             |
// +----------+----------+--------+----------+------------------+
// | V0039    | :w x 32  |   0x40 | r1       | pti[tid]+0x0     |
// | V0043    | :uq      |    0x8 | r2       | inline+0x0       |
// | V0036    | :d x 3   |    0xC | r2+0x8   | inline+0x8       |
// | V0038    | :d x 3   |    0xC | r2+0x14  | inline+0x14      |
// | V0045    | :q       |    0x8 | r2+0x20  | inline+0x20      |
// | V0046    | :q       |    0x8 | r2+0x28  | inline+0x28      |
// | V0037    | :d x 3   |    0xC | r2+0x30  | inline+0x30      |
// +----------+----------+--------+----------+------------------+


// B000: Preds:{},  Succs:{B001}
per_thread_prolog:
(W)     and (1|M0)               acc0.0<1>:ud  r0.4<0;1,0>:uw    0xFF:uw                             //  ALU pipe: int; 
(W)     mov (1|M0)               s0.2<1>:uq    r0.7<0;1,0>:uq                                        //  ALU pipe: int; 
(W)     mad (1|M0)               acc0.0<1>:ud  0x0:uw               acc0.0<0;0>:ud    0x40:uw              //  R_SYM_ADDR_16: __INTEL_PER_THREAD_OFF; ALU pipe: int; 
(W)     mov (16|M0)              r2.0<1>:ud    r1.0<1;1,0>:ud                                        //  ALU pipe: int; 
(W)     add (1|M0)               r63.0<1>:ud   acc0.0<0;1,0>:ud  0x0:ud                              //  R_SYM_ADDR_32: __INTEL_PATCH_CROSS_THREAD_OFFSET_OFF_R0; ALU pipe: int; 
(W)     sendg.ugm (1|M0)         r1       r63:1  null:0  s0.16  0x281680 {A@1,$0} // rd:64 B; load.ugm.d32x16t.a32u.ovf.ca.ca.uc [s0.16+src0] // 
        nop                                                                                          // 
        nop                                                                                          // 
// B001: Preds:{B000},  Succs:{B002}
// cross_thread_prolog:
(W)     mov (1|M0)               s0.3<1>:uq    0x0:uq                                                //  R_SYM_ADDR_32: __INTEL_PATCH_CROSS_THREAD_OFFSET_OFF_R0; ALU pipe: S0; 
// B002: Preds:{B001},  Succs:{B003, B006}
// _main:
(W)     mov (16|M0)              r44.0<1>:ud   r0.0<1;1,0>:ud                                        //  ALU pipe: int; $1
(W)     or (1|M0)                cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x400004C0:ud              {A@1}    // $1
(W)     mul (1|M0)               r3.0<1>:q     r2.5<0;1,0>:ud    r44.1<0;1,0>:ud  {A@1}              //  ALU pipe: int; $3
        mov (16|M0)              r6.0<1>:q     r1.0<1;1,0>:uw                   {$0.dst}             //  ALU pipe: int; $4
        mov (16|M16)             r8.0<1>:q     r1.16<1;1,0>:uw                                       //  ALU pipe: int; $4
        add (32|M0)              r11.0<1>:q    r3.0<0;1,0>:q     r6.0<1;1,0>:q    {Compacted,I@1}    //  ALU pipe: int; $5
(W)     mov (2|M0)               r2.0<1>:d     r2.8<1;1,0>:d                    {Compacted}          //  ALU pipe: int; $2
        add (32|M0)              r45.0<1>:q    r11.0<1;1,0>:q    r2.2<0;1,0>:ud   {I@2}              //  ALU pipe: int; $7
        mov (16|M0)              r52.0<1>:d    r45.0<2;1,0>:d                   {Compacted,I@1}      //  ALU pipe: int; $8
        mov (16|M16)             r53.0<1>:d    r47.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $9
        cmp (32|M0)   (lt)f1.0   null<1>:ud    r52.0<1;1,0>:ud   r2.0<0;1,0>:ud   {I@1}              //  ALU pipe: int; $12
        mov (16|M0)              r54.0<1>:d    r45.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $10
        mov (16|M16)             r55.0<1>:d    r47.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $11
(f1.0)  cmp (32|M0)   (eq)f1.0   null<1>:d     r54.0<1;1,0>:d    r2.1<0;1,0>:d    {I@1}              //  ALU pipe: int; $13
(~f1.0) cmp (32|M0)   (lt)f1.0   null<1>:ud    r54.0<1;1,0>:ud   r2.1<0;1,0>:ud                      //  ALU pipe: int; $15
(~f1.0) goto (32|M0)                         _0_007            _0_007                                // $17
// B003: [inDivergent],  Preds:{B002},  Succs:{B004}
_0_008:
(W)     mov (1|M0)               r50.0<1>:q    r2.12<0;1,0>:ud                                       //  ALU pipe: int; $19
// B004: [inDivergent],  Preds:{B005, B003},  Succs:{B005, B006}
_0_009:
        mul (16|M0)              r3.0<1>:uq    r45.0<2;1,0>:ud   0x3779B1:ud                         //  ALU pipe: int; $23
        mul (16|M16)             r5.0<1>:uq    r47.0<2;1,0>:ud   0x3779B1:ud                         //  ALU pipe: int; $23
(W)     mov (1|M0)               r8.0<1>:f     0x3779B1:f                                            //  (0x003779b1:f); ALU pipe: float; $24
        mul (16|M0)              acc0.0<1>:q   r45.0<2;1,0>:ud   0:d                                 //  ALU pipe: int; $25
        mul (16|M16)             acc2.0<1>:q   r47.0<2;1,0>:ud   0:d                                 //  ALU pipe: int; $25
        mad (16|M0)              r10.0<1>:q    r3.1<4;2>:ud      r8.0<0;0>:ud      r45.1<2>:d       {A@1} //  ALU pipe: int; $24
        mad (16|M16)             r12.0<1>:q    r5.1<4;2>:ud      r8.0<0;0>:ud      r47.1<2>:d       {I@4} //  ALU pipe: int; $24
        add (32|M0)              r40.0<1>:q    r45.0<1;1,0>:q    r50.0<0;1,0>:q                      //  ALU pipe: int; $37
        add (16|M0)              r17.0<1>:q    acc0.0<1;1,0>:q   r10.0<2;1,0>:ud  {I@3}              //  ALU pipe: int; $25
        add (16|M16)             r21.0<1>:q    acc2.0<1;1,0>:q   r12.0<2;1,0>:ud  {I@3}              //  ALU pipe: int; $25
        mov (16|M0)              r57.0<1>:d    r40.0<2;1,0>:d                   {Compacted,I@3}      //  ALU pipe: int; $38
        mov (16|M16)             r58.0<1>:d    r42.0<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $39
        mov (16|M0)              r3.1<2>:ud    r17.0<2;1,0>:ud                  {Compacted,I@4}      //  ALU pipe: int; $26
        mov (16|M16)             r5.1<2>:ud    r21.0<2;1,0>:ud                  {Compacted,I@4}      //  ALU pipe: int; $26
        cmp (32|M0)   (lt)f0.0   null<1>:ud    r57.0<1;1,0>:ud   r2.0<0;1,0>:ud   {I@3}              //  ALU pipe: int; $42
        mov (32|M0)              r24.0<1>:uq   r3.0<1;1,0>:uq                   {Compacted,I@2}      //  ALU pipe: int; $27
        mov (16|M0)              r59.0<1>:d    r40.1<2;1,0>:d                   {Compacted}          //  ALU pipe: int; $40
        mov (16|M16)             r60.0<1>:d    r42.1<2;1,0>:d                                        //  ALU pipe: int; $41
        and (16|M0)              r28.0<2>:d    r24.0<2;1,0>:d    16777215:d               {I@3}      //  ALU pipe: int; $28
        and (16|M16)             r30.0<2>:d    r26.0<2;1,0>:d    16777215:d                          //  ALU pipe: int; $29
        mov (16|M0)              r28.1<2>:ud   0x0:uw                                                //  ALU pipe: int; $32
        mov (16|M16)             r30.1<2>:ud   0x0:uw                                                //  ALU pipe: int; $33
(f0.0)  cmp (32|M0)   (eq)f0.0   null<1>:d     r59.0<1;1,0>:d    r2.1<0;1,0>:d    {I@5}              //  ALU pipe: int; $43
        mov (16|M0)              r32.0<2>:f    r28.0<1;1,0>:uq                  {I@3}                //  ALU pipe: int; $34
        mov (16|M16)             r34.0<2>:f    r30.0<1;1,0>:uq                  {I@3}                //  ALU pipe: int; $34
        mov (16|M0)              r36.0<1>:ud   r32.0<2;1,0>:ud                  {Compacted,I@2}      //  ALU pipe: int; $34
        mov (16|M16)             r37.0<1>:ud   r34.0<2;1,0>:ud                  {Compacted,I@2}      //  ALU pipe: int; $34
(~f0.0) cmp (32|M0)   (lt)f0.0   null<1>:ud    r59.0<1;1,0>:ud   r2.1<0;1,0>:ud                      //  ALU pipe: int; $45
        mul (32|M0)              r38.0<1>:f    r36.0<1;1,0>:f    0x33800000:f               {I@2}    //  ALU pipe: float; $35
(W)     mov (1|M0)               s0.2<1>:q     r2.5<0;1,0>:q                                         //  ALU pipe: int; $36
        sendg.ugm (32|M0)        null     r45:4  r38:2  s0.16  0x100000009004 {A@1,$1} // rd:0 B; store.ugm.d32.a64 [s0.16+0x4*src0] // $36
(~f0.0) goto (32|M0)                         _0_007            _0_007                                // $47
// B005: [inDivergent],  Preds:{B004},  Succs:{B004}
_0_010:
(f0.0)  sel (32|M0)              r3.0<1>:d     r57.0<1;1,0>:d    r52.0<1;1,0>:d                      //  ALU pipe: int; $49
(f0.0)  sel (32|M0)              r5.0<1>:d     r59.0<1;1,0>:d    r54.0<1;1,0>:d                      //  ALU pipe: int; $50
        mov (16|M0)              r45.0<2>:ud   r3.0<1;1,0>:ud                   {Compacted,@2,$1.src} //  ALU pipe: int; $51
        mov (16|M16)             r47.0<2>:ud   r4.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $52
        mov (16|M0)              r45.1<2>:ud   r5.0<1;1,0>:ud                   {Compacted,I@3}      //  ALU pipe: int; $53
        mov (16|M16)             r47.1<2>:ud   r6.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $54
(W)     jmpi                                 _0_009                                                  // $55
// B006: Preds:{B004, B002},  Succs:{}
_0_007:
        join (32|M0)                         L912                                                    // 
L912:
(W)     sendg.gtwy (1|M0)        null     r0:1  null:0  0x0 {EOT,$2} // rd:0 B; end of thread        // $57
L928:
(W)     mov (16|M0)              null<1>:ud    0x890B15DC:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x1DD21E02:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x0:ud                                                // 
(W)     mov (16|M0)              null<1>:ud    0x1:ud                                                // 


//.BankConflicts: 0
//.ByteRMWs: 0
//


//.numALUInst: 62
//.accSubDef: 2
//.accSubUse: 2
//.accSubCandidateDef: 2
//.accSubCandidateUse: 2
//
//
//.singlePipeAtOneDistNum: 4
//.allAtOneDistNum: 5
//.syncInstCount: 0
//.tokenReuseCount: 0
//.AfterWriteTokenDepCount: 1
//.AfterReadTokenDepCount: 1
