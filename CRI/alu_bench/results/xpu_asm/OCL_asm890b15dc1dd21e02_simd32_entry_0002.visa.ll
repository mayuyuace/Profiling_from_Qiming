; ------------------------------------------------
; OCL_asm890b15dc1dd21e02_simd32_entry_0002.visa.ll
; ------------------------------------------------
; Function Attrs: convergent nounwind null_pointer_is_valid
define spir_kernel void @_ZTSZ4mainEUlN4sycl3_V12idILi1EEEE_(ptr addrspace(1) align 4 %0, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i32 %bufferOffset, i32 %bindlessOffset) #0 {
; BB0 :
  %2 = extractelement <3 x i32> %globalOffset, i32 0		; visa id: 2
  %3 = extractelement <3 x i32> %enqueuedLocalSize, i32 0		; visa id: 2
  %4 = extractelement <8 x i32> %r0, i32 1		; visa id: 2
  %5 = mul i32 %3, %4		; visa id: 2
  %6 = zext i16 %localIdX to i32		; visa id: 3
  %7 = add i32 %5, %6
  %8 = add i32 %7, %2		; visa id: 4
  %9 = zext nneg i32 %8 to i64
  %10 = mul nuw nsw i64 %9, 3635633, !spirv.Decorations !475		; visa id: 5
  %11 = bitcast i64 %10 to <2 x i32>
  %12 = extractelement <2 x i32> %11, i32 0
  %13 = and i32 %12, 16777215		; visa id: 6
  %14 = insertelement <2 x i32> undef, i32 %13, i32 0
  %15 = insertelement <2 x i32> %14, i32 0, i32 1
  %16 = bitcast <2 x i32> %15 to i64		; visa id: 8
  %17 = uitofp nneg i64 %16 to float		; visa id: 12
  %18 = fmul reassoc nsz arcp contract float %17, 0x3E70000000000000, !spirv.Decorations !478		; visa id: 13
  %19 = ptrtoint ptr addrspace(1) %0 to i64		; visa id: 14
  %20 = shl nuw nsw i64 %9, 2
  %21 = add i64 %20, %19
  %22 = inttoptr i64 %21 to ptr addrspace(1)
  store float %18, ptr addrspace(1) %22, align 4		; visa id: 14
  ret void, !stats.blockFrequency.digits !480, !stats.blockFrequency.scale !481		; visa id: 15
}
