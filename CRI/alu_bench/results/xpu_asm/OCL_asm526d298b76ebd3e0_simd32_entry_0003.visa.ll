; ------------------------------------------------
; OCL_asm526d298b76ebd3e0_simd32_entry_0003.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTS6SweepKILi0EE(ptr addrspace(1) align 4 %0, i32 %1, ptr addrspace(1) align 4 %2, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i32 %bufferOffset, i32 %bufferOffset1, i32 %bindlessOffset, i32 %bindlessOffset2) #0 {
.preheader.preheader:
; BB0 :
  %3 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %4 = zext nneg i32 %3 to i64		; visa id: 2
  %.idx = shl nuw nsw i64 %4, 14		; visa id: 3
  %5 = ptrtoint ptr addrspace(1) %0 to i64		; visa id: 4
  %6 = add i64 %.idx, %5		; visa id: 4
  %7 = zext i16 %localIdX to i64		; visa id: 5
  %8 = shl nuw nsw i64 %7, 4
  %9 = add i64 %6, %8
  %10 = inttoptr i64 %9 to ptr addrspace(1)
  %11 = load <4 x i32>, ptr addrspace(1) %10, align 16		; visa id: 6
  %12 = extractelement <4 x i32> %11, i32 0		; visa id: 7
  %13 = extractelement <4 x i32> %11, i32 1		; visa id: 7
  %14 = extractelement <4 x i32> %11, i32 2		; visa id: 7
  %15 = extractelement <4 x i32> %11, i32 3		; visa id: 7
  %16 = add i64 %9, 4096
  %17 = inttoptr i64 %16 to ptr addrspace(1)
  %18 = load <4 x i32>, ptr addrspace(1) %17, align 16		; visa id: 7
  %19 = extractelement <4 x i32> %18, i32 0		; visa id: 8
  %20 = extractelement <4 x i32> %18, i32 1		; visa id: 8
  %21 = extractelement <4 x i32> %18, i32 2		; visa id: 8
  %22 = extractelement <4 x i32> %18, i32 3		; visa id: 8
  %23 = add i64 %9, 8192
  %24 = inttoptr i64 %23 to ptr addrspace(1)
  %25 = load <4 x i32>, ptr addrspace(1) %24, align 16		; visa id: 8
  %26 = extractelement <4 x i32> %25, i32 0		; visa id: 9
  %27 = extractelement <4 x i32> %25, i32 1		; visa id: 9
  %28 = extractelement <4 x i32> %25, i32 2		; visa id: 9
  %29 = extractelement <4 x i32> %25, i32 3		; visa id: 9
  %30 = add i64 %9, 12288
  %31 = inttoptr i64 %30 to ptr addrspace(1)
  %32 = load <4 x i32>, ptr addrspace(1) %31, align 16		; visa id: 9
  %33 = extractelement <4 x i32> %32, i32 0		; visa id: 10
  %34 = extractelement <4 x i32> %32, i32 1		; visa id: 10
  %35 = extractelement <4 x i32> %32, i32 2		; visa id: 10
  %36 = extractelement <4 x i32> %32, i32 3		; visa id: 10
  %37 = add i32 %12, %13		; visa id: 10
  %38 = add i32 %37, %14
  %39 = add i32 %38, %15		; visa id: 11
  %40 = add i32 %39, %19
  %41 = add i32 %40, %20		; visa id: 12
  %42 = add i32 %41, %21
  %43 = add i32 %42, %22		; visa id: 13
  %44 = add i32 %43, %26
  %45 = add i32 %44, %27		; visa id: 14
  %46 = add i32 %45, %28
  %47 = add i32 %46, %29		; visa id: 15
  %48 = add i32 %47, %33
  %49 = add i32 %48, %34		; visa id: 16
  %50 = add i32 %49, %35
  %51 = add i32 %50, %36		; visa id: 17
  %52 = icmp eq i32 %51, %1		; visa id: 18
  br i1 %52, label %53, label %.preheader.preheader.._crit_edge_crit_edge, !stats.blockFrequency.digits !493, !stats.blockFrequency.scale !494		; visa id: 19

53:                                               ; preds = %.preheader.preheader
; BB1 :
  store i32 %1, ptr addrspace(1) %2, align 4		; visa id: 21
  br label %._crit_edge, !stats.blockFrequency.digits !495, !stats.blockFrequency.scale !494		; visa id: 24

.preheader.preheader.._crit_edge_crit_edge:       ; preds = %.preheader.preheader
; BB:
  br label %._crit_edge, !stats.blockFrequency.digits !495, !stats.blockFrequency.scale !494

._crit_edge:                                      ; preds = %.preheader.preheader.._crit_edge_crit_edge, %53
; BB3 :
  ret void, !stats.blockFrequency.digits !493, !stats.blockFrequency.scale !494		; visa id: 25
}
