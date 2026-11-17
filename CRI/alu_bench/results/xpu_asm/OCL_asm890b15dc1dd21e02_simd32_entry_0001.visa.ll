; ------------------------------------------------
; OCL_asm890b15dc1dd21e02_simd32_entry_0001.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSN4sycl3_V16detail18RoundedRangeKernelINS0_4itemILi1ELb1EEELi1EZ4mainEUlNS0_2idILi1EEEE_EE(ptr byval(%"class.sycl::_V1::range") align 8 %0, ptr byval(%class._ZTSZ4mainEUlN4sycl3_V12idILi1EEEE_) align 8 %1, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %globalSize, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i64 %const_reg_qword, i64 %const_reg_qword1) #0 {
; BB0 :
  %3 = bitcast i64 %const_reg_qword to <2 x i32>		; visa id: 2
  %4 = extractelement <2 x i32> %3, i32 0		; visa id: 3
  %5 = extractelement <2 x i32> %3, i32 1		; visa id: 3
  %6 = extractelement <3 x i32> %globalOffset, i32 0		; visa id: 3
  %7 = extractelement <3 x i32> %enqueuedLocalSize, i32 0		; visa id: 3
  %8 = extractelement <8 x i32> %r0, i32 1		; visa id: 3
  %9 = zext i32 %7 to i64
  %10 = zext i32 %8 to i64
  %11 = mul nuw i64 %9, %10		; visa id: 3
  %12 = zext i16 %localIdX to i64		; visa id: 4
  %13 = add nuw i64 %11, %12		; visa id: 5
  %14 = zext i32 %6 to i64		; visa id: 6
  %15 = add nuw i64 %13, %14		; visa id: 7
  %16 = bitcast i64 %15 to <2 x i32>		; visa id: 8
  %17 = extractelement <2 x i32> %16, i32 0		; visa id: 12
  %18 = extractelement <2 x i32> %16, i32 1		; visa id: 12
  %19 = icmp eq i32 %18, %5
  %20 = icmp ult i32 %17, %4		; visa id: 12
  %21 = and i1 %19, %20		; visa id: 13
  %22 = icmp ult i32 %18, %5
  %23 = or i1 %21, %22		; visa id: 15
  br i1 %23, label %.lr.ph.preheader, label %.._crit_edge_crit_edge, !stats.blockFrequency.digits !475, !stats.blockFrequency.scale !476		; visa id: 17

.._crit_edge_crit_edge:                           ; preds = %2
; BB:
  br label %._crit_edge, !stats.blockFrequency.digits !477, !stats.blockFrequency.scale !478

.lr.ph.preheader:                                 ; preds = %2
; BB2 :
  %24 = extractelement <3 x i32> %globalSize, i32 0		; visa id: 19
  %25 = zext i32 %24 to i64		; visa id: 19
  br label %.lr.ph, !stats.blockFrequency.digits !479, !stats.blockFrequency.scale !478		; visa id: 20

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader
; BB3 :
  %26 = phi i64 [ %52, %.lr.ph..lr.ph_crit_edge ], [ %15, %.lr.ph.preheader ]
  %27 = mul nuw nsw i64 %26, 3635633, !spirv.Decorations !480		; visa id: 21
  %28 = bitcast i64 %27 to <2 x i32>
  %29 = extractelement <2 x i32> %28, i32 0
  %30 = and i32 %29, 16777215		; visa id: 28
  %31 = insertelement <2 x i32> undef, i32 %30, i32 0
  %32 = insertelement <2 x i32> %31, i32 0, i32 1
  %33 = bitcast <2 x i32> %32 to i64		; visa id: 30
  %34 = uitofp nneg i64 %33 to float		; visa id: 34
  %35 = fmul reassoc nsz arcp contract float %34, 0x3E70000000000000, !spirv.Decorations !483		; visa id: 35
  %36 = shl i64 %26, 2
  %37 = add i64 %const_reg_qword1, %36
  %38 = inttoptr i64 %37 to ptr addrspace(1)
  store float %35, ptr addrspace(1) %38, align 4		; visa id: 36
  %39 = add nuw nsw i64 %26, %25		; visa id: 37
  %40 = bitcast i64 %39 to <2 x i32>		; visa id: 38
  %41 = extractelement <2 x i32> %40, i32 0		; visa id: 42
  %42 = extractelement <2 x i32> %40, i32 1		; visa id: 42
  %43 = icmp eq i32 %42, %5
  %44 = icmp ult i32 %41, %4		; visa id: 42
  %45 = and i1 %43, %44		; visa id: 43
  %46 = icmp ult i32 %42, %5
  %47 = or i1 %45, %46		; visa id: 45
  br i1 %47, label %.lr.ph..lr.ph_crit_edge, label %._crit_edge.loopexit, !stats.blockFrequency.digits !479, !stats.blockFrequency.scale !485		; visa id: 47

._crit_edge.loopexit:                             ; preds = %.lr.ph
; BB:
  br label %._crit_edge, !stats.blockFrequency.digits !479, !stats.blockFrequency.scale !478

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
; BB5 :
  %48 = select i1 %47, i32 %41, i32 %17		; visa id: 49
  %49 = select i1 %47, i32 %42, i32 %18		; visa id: 50
  %50 = insertelement <2 x i32> undef, i32 %48, i32 0
  %51 = insertelement <2 x i32> %50, i32 %49, i32 1
  %52 = bitcast <2 x i32> %51 to i64		; visa id: 51
  br label %.lr.ph, !stats.blockFrequency.digits !486, !stats.blockFrequency.scale !485		; visa id: 55

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
; BB6 :
  ret void, !stats.blockFrequency.digits !475, !stats.blockFrequency.scale !476		; visa id: 57
}
