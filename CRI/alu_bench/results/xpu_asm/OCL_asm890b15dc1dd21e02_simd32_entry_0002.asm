//.kernel _ZTSZ4mainEUlN4sycl3_V12idILi1EEEE_
//.platform XE3P_CRI
//.thread_config numGRF=64, numAcc=4, numSWSB=32
//.options_string "-emitCrossThreadOffR0Reloc -hashmovs 2299205084 500309506 -hashmovs1 0 2 "
//.full_options "-emitLocation -autoGRFSelection -wideMulMadOpsEn -enableCoalesceScalarMoves -supportLSCImmScale 0 -samplerHeaderWA -enablePreemption -hasRNEandDenorm -noStitchExternFunc -useInlineData -emitCrossThreadOffR0Reloc -abortonspill -abortOnSpill 4 -enableBCR -forceBCR -bumpGRFForForceBCR -enableBundleCR 3 -freqBasedSpillCost 8 -freqBasedSpillCostFunc 1 -boundsChecking -presched-ctrl 6 -presched-rp 90 -nodpsendreorder -SBIDDepLoc -PVCSendWARWA -output -binary -dumpcommonisa -dumpcombinedcisa -dumpvisa -printHexFloatInAsm -noverifyCISA -enableHalfLSC -partialInt64 -activeThreadsOnlyBarrier -hashmovs 2299205084 500309506 -hashmovs1 0 2 -enableEfficient64b -GRFBumpUpNumber 2 -waSlmGOS20 "
//.instCount 34
//.RA type	LOCAL_ROUND_ROBIN_BC_RA
//.git-hash cb58c7fbc7f88dae319e4276acae5bc1f9969b2d

//.declare BuiltInR0 (0)  rf=r size=64 type=ud align=32 words (r0.0) IsBuiltin
//.declare  (1)  rf=r size=64 type=ud align=32 words (r4.0) IsBuiltin
//.declare BuiltinA0 (2)  rf=a size=4 type=ud align=1 words (a0.0) IsBuiltin
//.declare BuiltinA0Dot2 (3)  rf=a size=4 type=ud align=1 words (a0.2) IsBuiltin
//.declare BuiltinSR0Dot1 (5)  rf=r size=4 type=ud align=2 words IsBuiltin
//.declare BuiltinS0 (6)  rf=s size=64 type=uq align=1 words (s0.0) IsBuiltin
//.declare %null (11)  rf=r size=4 type=ud align=2 words
//.declare %local_id_x (14)  rf=r size=4 type=ud align=2 words (r3.0)
//.declare %local_id_y (15)  rf=r size=4 type=ud align=2 words (r3.1)
//.declare %local_size_x (16)  rf=r size=4 type=ud align=2 words (r2.12)
//.declare %local_size_y (17)  rf=r size=4 type=ud align=2 words (r2.13)
//.declare %group_id_x (18)  rf=r size=4 type=ud align=2 words (r0.1)
//.declare %group_id_y (19)  rf=r size=4 type=ud align=2 words (r0.6)
//.declare %group_id_z (20)  rf=r size=4 type=ud align=2 words (r0.7)
//.declare %group_count_x (21)  rf=r size=4 type=ud align=2 words (r2.14)
//.declare %group_count_y (22)  rf=r size=4 type=ud align=2 words (r2.15)
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
//.declare V0033 (44)  rf=r size=64 type=d alias=+0 align=32 words (r4.0)
//.declare V0034 (45)  rf=r size=8 type=uq align=4 words (r2.5)
//.declare V0036 (47)  rf=r size=32 type=d alias=+0 align=32 words (r4.0)
//.declare V0037 (48)  rf=r size=12 type=d align=2 words (r2.4)
//.declare V0038 (49)  rf=r size=12 type=d align=2 words (r2.7)
//.declare V0039 (50)  rf=r size=64 type=w align=32 words (r1.0)
//.declare V0042 (53)  rf=r size=8 type=uq align=16 words (r2.0)
//.declare V0043 (54)  rf=r size=8 type=uq align=4 words (r2.1)
//.declare V0046 (57)  rf=r size=4 type=d align=2 words (r2.0)
//.declare V0048 (59)  rf=r size=64 type=uw alias=V0039+0 align=32 words (r1.0)
//.declare V0049 (60)  rf=r size=128 type=d align=32 words (r5.0)
//.declare V0051 (62)  rf=r size=128 type=ud alias=V0049+0 align=32 words (r5.0)
//.declare V0057 (68)  rf=r size=128 type=f align=32 words (r8.0)
//.declare V0059 (70)  rf=r size=128 type=f align=32 words (r10.0)
//.declare V0060 (71)  rf=r size=8 type=q alias=V0034+0 align=4 words (r2.5)
//.declare  (72)  rf=r size=128 type=uw align=32 words (r13.0)
//.declare  (73)  rf=r size=128 type=ud align=32 words (r16.0)
//.declare  (74)  rf=r size=128 type=ud align=32 words (r18.0)
//.declare  (76)  rf=r size=128 type=q align=32 words (r20.0)
//.declare  (77)  rf=r size=128 type=q align=32 words (r22.0)
//.declare  (78)  rf=r size=128 type=q align=32 words (r24.0)
//.declare  (79)  rf=r size=128 type=q align=32 words (r26.0)
//.declare  (80)  rf=r size=128 type=f align=32 words (r28.0)
//.declare  (81)  rf=r size=128 type=f align=32 words (r30.0)
//.declare  (82)  rf=r size=128 type=d alias=+0 align=32 words (r24.0)
//.declare  (83)  rf=r size=128 type=d alias=+0 align=32 words (r20.0)
//.declare  (84)  rf=r size=128 type=d alias=+0 align=32 words (r26.0)
//.declare  (85)  rf=r size=128 type=d alias=+0 align=32 words (r22.0)
//.declare  (86)  rf=r size=128 type=ud alias=+0 align=32 words (r24.0)
//.declare  (87)  rf=r size=128 type=ud alias=+0 align=32 words (r26.0)
//.declare  (88)  rf=r size=128 type=uq alias=+0 align=32 words (r24.0)
//.declare  (89)  rf=r size=128 type=uq alias=+0 align=32 words (r26.0)
//.declare  (90)  rf=r size=128 type=ud alias=+0 align=32 words (r28.0)
//.declare  (91)  rf=r size=128 type=ud alias=+0 align=32 words (r30.0)
//.declare r0 (92)  rf=r size=64 type=ud align=32 words (r0.0)
//.declare rtmp (93)  rf=r size=64 type=ud align=32 words (r63.0)
//.declare r0_7_uq (94)  rf=r size=64 type=uq align=32 words (r0.7)
//.declare inlineRegFromTDL (95)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare inlineRegExpectedLocation (96)  rf=r size=64 type=ud align=32 words (r2.0)
//.declare  (97)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare inlineDataRegister (98)  rf=r size=64 type=uq align=32 words (r2.0)

// .inputs
// +----------+----------+--------+----------+------------------+
// | id       | type     |  bytes | at       | from             |
// +----------+----------+--------+----------+------------------+
// | V0039    | :w x 32  |   0x40 | r1       | pti[tid]+0x0     |
// | V0042    | :uq      |    0x8 | r2       | inline+0x0       |
// | V0043    | :uq      |    0x8 | r2+0x8   | inline+0x8       |
// | V0037    | :d x 3   |    0xC | r2+0x10  | inline+0x10      |
// | V0038    | :d x 3   |    0xC | r2+0x1C  | inline+0x1C      |
// | V0034    | :uq      |    0x8 | r2+0x28  | inline+0x28      |
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
// B002: Preds:{B001},  Succs:{}
// _main:
(W)     mov (16|M0)              r4.0<1>:ud    r0.0<1;1,0>:ud                                        //  ALU pipe: int; $1
(W)     or (1|M0)                cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x400004C0:ud              {A@1}    // $1
(W)     mul (1|M0)               r2.0<1>:d     r2.7<0;1,0>:d     r4.1<0;1,0>:d    {A@1}              //  ALU pipe: int; $2
        mov (32|M0)              r13.0<2>:uw   r1.0<1;1,0>:uw                   {$0.dst}             //  ALU pipe: int; $4
        add3 (32|M0)             r5.0<1>:d     r2.0<0;0>:d       r13.0<4;2>:uw     r2.4<0>:d        {I@1} //  ALU pipe: int; $4
        mov (16|M0)              r16.0<2>:ud   r5.0<1;1,0>:ud                   {Compacted,I@1}      //  ALU pipe: int; $5
        mov (16|M16)             r18.0<2>:ud   r6.0<1;1,0>:ud                   {Compacted}          //  ALU pipe: int; $5
        mul (16|M0)              r20.0<1>:q    r16.0<2;1,0>:ud   0x3779B1:ud              {I@2}      //  ALU pipe: int; $5
        mul (16|M16)             r22.0<1>:q    r18.0<2;1,0>:ud   0x3779B1:ud              {I@2}      //  ALU pipe: int; $5
        and (16|M0)              r24.0<2>:d    r20.0<2;1,0>:d    16777215:d               {I@2}      //  ALU pipe: int; $6
        and (16|M16)             r26.0<2>:d    r22.0<2;1,0>:d    16777215:d               {I@2}      //  ALU pipe: int; $7
        mov (16|M0)              r24.1<2>:ud   0x0:uw                                                //  ALU pipe: int; $10
        mov (16|M16)             r26.1<2>:ud   0x0:uw                                                //  ALU pipe: int; $11
        mov (16|M0)              r28.0<2>:f    r24.0<1;1,0>:uq                  {I@2}                //  ALU pipe: int; $12
        mov (16|M16)             r30.0<2>:f    r26.0<1;1,0>:uq                  {I@2}                //  ALU pipe: int; $12
        mov (16|M0)              r8.0<1>:ud    r28.0<2;1,0>:ud                  {Compacted,I@2}      //  ALU pipe: int; $12
        mov (16|M16)             r9.0<1>:ud    r30.0<2;1,0>:ud                  {Compacted,I@2}      //  ALU pipe: int; $12
        mul (32|M0)              r10.0<1>:f    r8.0<1;1,0>:f     0x33800000:f               {I@1}    //  ALU pipe: float; $13
(W)     mov (1|M0)               s0.2<1>:q     r2.5<0;1,0>:q                                         //  ALU pipe: int; $14
        sendg.ugm (32|M0)        null     r5:2  r10:2  s0.16  0x100000001004 {A@1,$1} // rd:0 B; store.ugm.d32.a32u [s0.16+0x4*src0] // $14
(W)     sendg.gtwy (1|M0)        null     r0:1  null:0  0x0 {EOT,$2} // rd:0 B; end of thread        // $15
L448:
(W)     mov (16|M0)              null<1>:ud    0x890B15DC:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x1DD21E02:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x0:ud                                                // 
(W)     mov (16|M0)              null<1>:ud    0x2:ud                                                // 


//.BankConflicts: 0
//.ByteRMWs: 0
//


//.numALUInst: 29
//.accSubDef: 0
//.accSubUse: 0
//.accSubCandidateDef: 0
//.accSubCandidateUse: 0
//
//
//.singlePipeAtOneDistNum: 3
//.allAtOneDistNum: 4
//.syncInstCount: 0
//.tokenReuseCount: 0
//.AfterWriteTokenDepCount: 1
//.AfterReadTokenDepCount: 0
