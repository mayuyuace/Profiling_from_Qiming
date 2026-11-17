//.kernel _ZTS6SweepKILi0EE
//.platform XE3P_CRI
//.thread_config numGRF=96, numAcc=4, numSWSB=32
//.options_string "-emitCrossThreadOffR0Reloc -hashmovs 1382885771 1995166688 -hashmovs1 0 3 "
//.full_options "-emitLocation -autoGRFSelection -wideMulMadOpsEn -enableCoalesceScalarMoves -supportLSCImmScale 0 -samplerHeaderWA -enablePreemption -hasRNEandDenorm -noStitchExternFunc -useInlineData -emitCrossThreadOffR0Reloc -abortOnSpill 4 -enableBCR -forceBCR -bumpGRFForForceBCR -enableBundleCR 3 -freqBasedSpillCost 8 -freqBasedSpillCostFunc 1 -boundsChecking -presched-ctrl 6 -presched-rp 90 -nodpsendreorder -SBIDDepLoc -PVCSendWARWA -output -binary -dumpcommonisa -dumpcombinedcisa -dumpvisa -printHexFloatInAsm -noverifyCISA -enableHalfLSC -partialInt64 -activeThreadsOnlyBarrier -hashmovs 1382885771 1995166688 -hashmovs1 0 3 -enableEfficient64b -GRFBumpUpNumber 2 -waSlmGOS20 "
//.instCount 39
//.RA type	LOCAL_ROUND_ROBIN_BC_RA
//.git-hash cb58c7fbc7f88dae319e4276acae5bc1f9969b2d

//.declare BuiltInR0 (0)  rf=r size=64 type=ud align=32 words (r0.0) IsBuiltin
//.declare  (1)  rf=r size=64 type=ud align=32 words (r4.0) IsBuiltin
//.declare BuiltinA0 (2)  rf=a size=4 type=ud align=1 words (a0.0) IsBuiltin
//.declare BuiltinA0Dot2 (3)  rf=a size=4 type=ud align=1 words (a0.2) IsBuiltin
//.declare BuiltinSR0Dot1 (5)  rf=r size=4 type=ud align=2 words IsBuiltin
//.declare BuiltinS0 (6)  rf=s size=64 type=uq align=1 words (s0.0) IsBuiltin
//.declare %null (11)  rf=r size=4 type=ud align=2 words
//.declare %local_id_x (14)  rf=r size=4 type=ud align=2 words (r2.13)
//.declare %local_id_y (15)  rf=r size=4 type=ud align=2 words (r2.14)
//.declare %local_size_x (16)  rf=r size=4 type=ud align=2 words (r2.9)
//.declare %local_size_y (17)  rf=r size=4 type=ud align=2 words (r2.10)
//.declare %group_id_x (18)  rf=r size=4 type=ud align=2 words (r0.1)
//.declare %group_id_y (19)  rf=r size=4 type=ud align=2 words (r0.6)
//.declare %group_id_z (20)  rf=r size=4 type=ud align=2 words (r0.7)
//.declare %group_count_x (21)  rf=r size=4 type=ud align=2 words (r2.11)
//.declare %group_count_y (22)  rf=r size=4 type=ud align=2 words (r2.12)
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
//.declare V0034 (45)  rf=r size=8 type=uq align=4 words (r2.2)
//.declare V0035 (46)  rf=r size=4 type=d align=2 words (r2.8)
//.declare V0036 (47)  rf=r size=8 type=uq align=4 words (r2.3)
//.declare V0038 (49)  rf=r size=32 type=d alias=+0 align=32 words (r4.0)
//.declare V0040 (51)  rf=r size=64 type=w align=32 words (r1.0)
//.declare V0044 (55)  rf=r size=8 type=uq align=16 words (r2.0)
//.declare V0045 (56)  rf=r size=8 type=uq align=4 words (r2.1)
//.declare V0051 (62)  rf=r size=32 type=ud alias=V0038+0 align=16 words (r4.0)
//.declare V0052 (63)  rf=r size=8 type=q align=4 words (r3.0)
//.declare V0053 (64)  rf=r size=8 type=q alias=V0034+0 align=4 words (r2.2)
//.declare V0054 (65)  rf=r size=8 type=q align=4 words (r2.0)
//.declare V0055 (66)  rf=r size=256 type=q align=32 words (r5.0)
//.declare V0056 (67)  rf=r size=64 type=uw alias=V0040+0 align=32 words (r1.0)
//.declare V0057 (68)  rf=r size=512 type=d align=32 words (r10.0)
//.declare V0058 (69)  rf=r size=512 type=d align=32 words (r18.0)
//.declare V0059 (70)  rf=r size=512 type=d align=32 words (r26.0)
//.declare V0060 (71)  rf=r size=512 type=d align=32 words (r34.0)
//.declare V0061 (72)  rf=r size=128 type=d align=32 words (r43.0)
//.declare V0062 (73)  rf=r size=128 type=d align=32 words (r45.0)
//.declare V0063 (74)  rf=r size=128 type=d align=32 words (r49.0)
//.declare V0064 (75)  rf=r size=128 type=d align=32 words (r47.0)
//.declare V0065 (76)  rf=r size=128 type=d align=32 words (r51.0)
//.declare V0066 (77)  rf=r size=128 type=d align=32 words (r53.0)
//.declare V0067 (78)  rf=r size=128 type=d align=32 words (r55.0)
//.declare V0068 (79)  rf=r size=128 type=d align=32 words (r58.0)
//.declare P01 (80)  rf=f32  size=4 type=uw align=2 words (f0.0)
//.declare V0069 (81)  rf=r size=8 type=uq align=32 words (r9.0)
//.declare V0070 (82)  rf=r size=4 type=d align=32 words (r42.0)
//.declare r0 (83)  rf=r size=64 type=ud align=32 words (r0.0)
//.declare rtmp (84)  rf=r size=64 type=ud align=32 words (r95.0)
//.declare r0_7_uq (85)  rf=r size=64 type=uq align=32 words (r0.7)
//.declare inlineRegFromTDL (86)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare inlineRegExpectedLocation (87)  rf=r size=64 type=ud align=32 words (r2.0)
//.declare  (88)  rf=r size=64 type=ud align=32 words (r1.0)
//.declare inlineDataRegister (89)  rf=r size=64 type=uq align=32 words (r2.0)

// .inputs
// +----------+----------+--------+----------+------------------+
// | id       | type     |  bytes | at       | from             |
// +----------+----------+--------+----------+------------------+
// | V0040    | :w x 32  |   0x40 | r1       | pti[tid]+0x0     |
// | V0044    | :uq      |    0x8 | r2       | inline+0x0       |
// | V0045    | :uq      |    0x8 | r2+0x8   | inline+0x8       |
// | V0034    | :uq      |    0x8 | r2+0x10  | inline+0x10      |
// | V0036    | :uq      |    0x8 | r2+0x18  | inline+0x18      |
// | V0035    | :d       |    0x4 | r2+0x20  | inline+0x20      |
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
(W)     mov (16|M0)              r4.0<1>:ud    r0.0<1;1,0>:ud                                        //  ALU pipe: int; $1
(W)     or (1|M0)                cr0.0<1>:ud   cr0.0<0;1,0>:ud   0x400004C0:ud              {A@1}    // $1
(W)     shl (1|M0)               acc0.0<1>:q   r4.1<0;1,0>:ud    14:w               {A@1}            //  ALU pipe: int; $3
        mov (16|M0)              r5.0<1>:q     r1.0<1;1,0>:uw                   {$0.dst}             //  ALU pipe: int; $5
(W)     add (1|M0)               r2.0<1>:q     acc0.0<0;1,0>:q   r2.2<0;1,0>:q                       //  ALU pipe: int; $4
        mov (16|M16)             r7.0<1>:q     r1.16<1;1,0>:uw                                       //  ALU pipe: int; $5
(W)     mov (1|M0)               s0.2<1>:q     r2.0<0;1,0>:q                    {I@2}                //  ALU pipe: int; $6
        sendg.ugm (32|M0)        r10      r5:4  null:0  s0.16  0x100000009180 {I@1,$1} // rd:512 B; load.ugm.d32x4.a64 [s0.16+0x10*src0] // $6
        sendg.ugm (32|M0)        r18      r5:4  null:0  s0.16  0x100100009180 {$2} // rd:512 B; load.ugm.d32x4.a64 [s0.16+0x10*src0+0x1000] // $7
        sendg.ugm (32|M0)        r26      r5:4  null:0  s0.16  0x100200009180 {$3} // rd:512 B; load.ugm.d32x4.a64 [s0.16+0x10*src0+0x2000] // $8
        sendg.ugm (32|M0)        r34      r5:4  null:0  s0.16  0x100300009180 {$4} // rd:512 B; load.ugm.d32x4.a64 [s0.16+0x10*src0+0x3000] // $9
        add (32|M0)              acc0.0<1>:d   r10.0<1;1,0>:d    r12.0<1;1,0>:d   {$1.dst}           //  ALU pipe: int; $10
        add3 (32|M0)             acc0.0<1>:d   acc0.0<1;0>:d     r14.0<1;0>:d      r16.0<1>:d        //  ALU pipe: int; $11
        add3 (32|M0)             acc0.0<1>:d   acc0.0<1;0>:d     r18.0<1;0>:d      r20.0<1>:d       {$2.dst} //  ALU pipe: int; $12
        add3 (32|M0)             acc0.0<1>:d   acc0.0<1;0>:d     r22.0<1;0>:d      r24.0<1>:d        //  ALU pipe: int; $13
        add3 (32|M0)             acc0.0<1>:d   acc0.0<1;0>:d     r26.0<1;0>:d      r28.0<1>:d       {$3.dst} //  ALU pipe: int; $14
        add3 (32|M0)             acc0.0<1>:d   acc0.0<1;0>:d     r30.0<1;0>:d      r32.0<1>:d        //  ALU pipe: int; $15
        add3 (32|M0)             acc0.0<1>:d   acc0.0<1;0>:d     r34.0<1;0>:d      r36.0<1>:d       {$4.dst} //  ALU pipe: int; $16
        add3 (32|M0)             acc0.0<1>:d   acc0.0<1;0>:d     r38.0<1;0>:d      r40.0<1>:d        //  ALU pipe: int; $17
        cmp (32|M0)   (eq)f0.0   null<1>:d     acc0.0<1;1,0>:d   r2.8<0;1,0>:d                       //  ALU pipe: int; $18
(~f0.0) goto (32|M0)                         _0_004            _0_004                                // $19
// B003: [inDivergent],  Preds:{B002},  Succs:{B004}
_0_005:
(W)     mov (1|M0)               r9.0<1>:uq    r2.3<0;1,0>:uq                   {Compacted}          //  ALU pipe: int; $21
(W)     mov (1|M0)               r42.0<1>:d    r2.8<0;1,0>:d                    {Compacted}          //  ALU pipe: int; $22
(W)     sendg.ugm (1|M0)         null     r9:1  r42:1  0x9404 {I@1,$5} // rd:0 B; store.ugm.d32t.a64 [src0] // $23
// B004: Preds:{B003, B002},  Succs:{}
_0_004:
        join (32|M0)                         L528                                                    // 
L528:
(W)     sendg.gtwy (1|M0)        null     r0:1  null:0  0x0 {EOT,$6} // rd:0 B; end of thread        // $25
L544:
(W)     mov (16|M0)              null<1>:ud    0x526D298B:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x76EBD3E0:ud                                         // 
(W)     mov (16|M0)              null<1>:ud    0x0:ud                                                // 
(W)     mov (16|M0)              null<1>:ud    0x3:ud                                                // 


//.BankConflicts: 0
//.ByteRMWs: 0
//


//.numALUInst: 28
//.accSubDef: 9
//.accSubUse: 9
//.accSubCandidateDef: 9
//.accSubCandidateUse: 9
//
//
//.singlePipeAtOneDistNum: 2
//.allAtOneDistNum: 3
//.syncInstCount: 0
//.tokenReuseCount: 0
//.AfterWriteTokenDepCount: 5
//.AfterReadTokenDepCount: 0
