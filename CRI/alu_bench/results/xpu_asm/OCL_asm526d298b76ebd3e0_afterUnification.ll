; ------------------------------------------------
; OCL_asm526d298b76ebd3e0_afterUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::vec" = type { %"class.sycl::_V1::detail::vec_base" }
%"class.sycl::_V1::detail::vec_base" = type { [4 x float] }

@0 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@1 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@2 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTS4FmaK(float %0, float %1, ptr addrspace(1) align 4 %2, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i32 %bufferOffset, i32 %bindlessOffset) #0 {
  %4 = extractelement <3 x i32> %globalOffset, i32 0
  %5 = extractelement <3 x i32> %globalOffset, i32 1
  %6 = extractelement <3 x i32> %globalOffset, i32 2
  %7 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %8 = extractelement <3 x i32> %enqueuedLocalSize, i32 1
  %9 = extractelement <3 x i32> %enqueuedLocalSize, i32 2
  %10 = extractelement <8 x i32> %r0, i32 0
  %11 = extractelement <8 x i32> %r0, i32 1
  %12 = extractelement <8 x i32> %r0, i32 2
  %13 = extractelement <8 x i32> %r0, i32 3
  %14 = extractelement <8 x i32> %r0, i32 4
  %15 = extractelement <8 x i32> %r0, i32 5
  %16 = extractelement <8 x i32> %r0, i32 6
  %17 = extractelement <8 x i32> %r0, i32 7
  %18 = alloca [8 x float], align 4, !spirv.Decorations !484
  call void @llvm.lifetime.start.p0(ptr nonnull %18)
  br label %19

19:                                               ; preds = %22, %3
  %20 = phi i32 [ 0, %3 ], [ %31, %22 ]
  %21 = icmp samesign ult i32 %20, 8
  br i1 %21, label %22, label %.preheader2

.preheader2:                                      ; preds = %19
  br label %32

22:                                               ; preds = %19
  %23 = mul i32 %7, %11
  %24 = zext i16 %localIdX to i32
  %25 = add i32 %23, %24
  %26 = add i32 %25, %4
  %27 = icmp sgt i32 %26, -1
  call void @llvm.assume(i1 %27)
  %28 = zext nneg i32 %20 to i64
  %narrow = add nuw i32 %26, %20
  %29 = uitofp i32 %narrow to float
  %30 = getelementptr inbounds nuw float, ptr %18, i64 %28
  store float %29, ptr %30, align 4
  %31 = add nuw nsw i32 %20, 1, !spirv.Decorations !486
  br label %19, !llvm.loop !489

32:                                               ; preds = %38, %.preheader2
  %33 = phi i32 [ %39, %38 ], [ 0, %.preheader2 ]
  %34 = icmp samesign ult i32 %33, 2048
  br i1 %34, label %.preheader1, label %.preheader

.preheader1:                                      ; preds = %32
  br label %35

.preheader:                                       ; preds = %32
  br label %46

35:                                               ; preds = %40, %.preheader1
  %36 = phi i32 [ %45, %40 ], [ 0, %.preheader1 ]
  %37 = icmp samesign ult i32 %36, 8
  br i1 %37, label %40, label %38

38:                                               ; preds = %35
  %39 = add nuw nsw i32 %33, 1, !spirv.Decorations !486
  br label %32

40:                                               ; preds = %35
  %41 = zext nneg i32 %36 to i64
  %42 = getelementptr inbounds nuw float, ptr %18, i64 %41
  %43 = load float, ptr %42, align 4
  %44 = call noundef float @llvm.fma.f32(float %43, float %0, float %1)
  store float %44, ptr %42, align 4
  %45 = add nuw nsw i32 %36, 1, !spirv.Decorations !486
  br label %35, !llvm.loop !491

46:                                               ; preds = %52, %.preheader
  %47 = phi float [ %56, %52 ], [ 0.000000e+00, %.preheader ]
  %48 = phi i32 [ %57, %52 ], [ 0, %.preheader ]
  %49 = icmp samesign ult i32 %48, 8
  br i1 %49, label %52, label %50

50:                                               ; preds = %46
  %51 = fcmp reassoc nsz arcp contract oeq float %47, 1.234500e+03, !spirv.Decorations !492
  br i1 %51, label %58, label %59

52:                                               ; preds = %46
  %53 = zext nneg i32 %48 to i64
  %54 = getelementptr inbounds nuw float, ptr %18, i64 %53
  %55 = load float, ptr %54, align 4
  %56 = fadd reassoc nsz arcp contract float %47, %55, !spirv.Decorations !492
  %57 = add nuw nsw i32 %48, 1, !spirv.Decorations !486
  br label %46, !llvm.loop !494

58:                                               ; preds = %50
  store i32 1, ptr addrspace(1) %2, align 4
  br label %59

59:                                               ; preds = %58, %50
  call void @llvm.lifetime.end.p0(ptr nonnull %18)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTS4IntK(ptr addrspace(1) align 4 %0, <8 x i32> %r0, <3 x i32> %globalOffset, <3 x i32> %enqueuedLocalSize, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i32 %bufferOffset, i32 %bindlessOffset) #0 {
  %2 = extractelement <3 x i32> %globalOffset, i32 0
  %3 = extractelement <3 x i32> %globalOffset, i32 1
  %4 = extractelement <3 x i32> %globalOffset, i32 2
  %5 = extractelement <3 x i32> %enqueuedLocalSize, i32 0
  %6 = extractelement <3 x i32> %enqueuedLocalSize, i32 1
  %7 = extractelement <3 x i32> %enqueuedLocalSize, i32 2
  %8 = extractelement <8 x i32> %r0, i32 0
  %9 = extractelement <8 x i32> %r0, i32 1
  %10 = extractelement <8 x i32> %r0, i32 2
  %11 = extractelement <8 x i32> %r0, i32 3
  %12 = extractelement <8 x i32> %r0, i32 4
  %13 = extractelement <8 x i32> %r0, i32 5
  %14 = extractelement <8 x i32> %r0, i32 6
  %15 = extractelement <8 x i32> %r0, i32 7
  %16 = alloca [8 x i32], align 4, !spirv.Decorations !484
  call void @llvm.lifetime.start.p0(ptr nonnull %16)
  br label %17

17:                                               ; preds = %20, %1
  %18 = phi i32 [ 0, %1 ], [ %30, %20 ]
  %19 = icmp samesign ult i32 %18, 8
  br i1 %19, label %20, label %.preheader2

.preheader2:                                      ; preds = %17
  br label %31

20:                                               ; preds = %17
  %21 = mul i32 %5, %9
  %22 = zext i16 %localIdX to i32
  %23 = add i32 %21, %22
  %24 = add i32 %23, %2
  %25 = icmp sgt i32 %24, -1
  call void @llvm.assume(i1 %25)
  %26 = shl i32 %24, 3
  %27 = or disjoint i32 %26, %18
  %28 = zext nneg i32 %18 to i64
  %29 = getelementptr inbounds nuw i32, ptr %16, i64 %28
  store i32 %27, ptr %29, align 4
  %30 = add nuw nsw i32 %18, 1, !spirv.Decorations !486
  br label %17, !llvm.loop !495

31:                                               ; preds = %37, %.preheader2
  %32 = phi i32 [ %38, %37 ], [ 0, %.preheader2 ]
  %33 = icmp samesign ult i32 %32, 2048
  br i1 %33, label %.preheader1, label %.preheader

.preheader1:                                      ; preds = %31
  br label %34

.preheader:                                       ; preds = %31
  br label %46

34:                                               ; preds = %39, %.preheader1
  %35 = phi i32 [ %45, %39 ], [ 0, %.preheader1 ]
  %36 = icmp samesign ult i32 %35, 8
  br i1 %36, label %39, label %37

37:                                               ; preds = %34
  %38 = add nuw nsw i32 %32, 1, !spirv.Decorations !486
  br label %31

39:                                               ; preds = %34
  %40 = zext nneg i32 %35 to i64
  %41 = getelementptr inbounds nuw i32, ptr %16, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = xor i32 %42, 1540483477
  %44 = add i32 %43, 461845907
  store i32 %44, ptr %41, align 4
  %45 = add nuw nsw i32 %35, 1, !spirv.Decorations !486
  br label %34, !llvm.loop !496

46:                                               ; preds = %52, %.preheader
  %47 = phi i32 [ %56, %52 ], [ 0, %.preheader ]
  %48 = phi i32 [ %57, %52 ], [ 0, %.preheader ]
  %49 = icmp samesign ult i32 %48, 8
  br i1 %49, label %52, label %50

50:                                               ; preds = %46
  %51 = icmp eq i32 %47, 305419896
  br i1 %51, label %58, label %59

52:                                               ; preds = %46
  %53 = zext nneg i32 %48 to i64
  %54 = getelementptr inbounds nuw i32, ptr %16, i64 %53
  %55 = load i32, ptr %54, align 4
  %56 = xor i32 %47, %55
  %57 = add nuw nsw i32 %48, 1, !spirv.Decorations !486
  br label %46, !llvm.loop !497

58:                                               ; preds = %50
  store i32 305419896, ptr addrspace(1) %0, align 4
  br label %59

59:                                               ; preds = %58, %50
  call void @llvm.lifetime.end.p0(ptr nonnull %16)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTS6SweepKILi0EE(ptr addrspace(1) align 4 %0, i32 %1, ptr addrspace(1) align 4 %2, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i32 %bufferOffset, i32 %bufferOffset1, i32 %bindlessOffset, i32 %bindlessOffset2) #0 {
  %4 = extractelement <8 x i32> %r0, i32 0
  %5 = extractelement <8 x i32> %r0, i32 1
  %6 = extractelement <8 x i32> %r0, i32 2
  %7 = extractelement <8 x i32> %r0, i32 3
  %8 = extractelement <8 x i32> %r0, i32 4
  %9 = extractelement <8 x i32> %r0, i32 5
  %10 = extractelement <8 x i32> %r0, i32 6
  %11 = extractelement <8 x i32> %r0, i32 7
  %12 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !498
  %13 = zext nneg i32 %5 to i64
  %14 = icmp sgt i32 %5, -1
  call void @llvm.assume(i1 %14)
  %15 = zext i16 %localIdX to i64
  %.idx = shl nuw nsw i64 %13, 14
  %16 = getelementptr inbounds nuw i8, ptr addrspace(1) %0, i64 %.idx
  %17 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %16, i64 %15
  call void @llvm.lifetime.start.p0(ptr nonnull %12)
  br label %18

18:                                               ; preds = %21, %3
  %19 = phi i32 [ 0, %3 ], [ %27, %21 ]
  %20 = icmp samesign ult i32 %19, 4
  br i1 %20, label %21, label %.preheader

.preheader:                                       ; preds = %18
  br label %28

21:                                               ; preds = %18
  %22 = shl nuw nsw i32 %19, 8, !spirv.Decorations !486
  %23 = zext nneg i32 %22 to i64
  %24 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %17, i64 %23
  %25 = zext nneg i32 %19 to i64
  %26 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %12, i64 %25
  call void @llvm.memcpy.p0.p1.i64(ptr noundef nonnull align 16 dereferenceable(16) %26, ptr addrspace(1) noundef align 16 dereferenceable(16) %24, i64 16, i1 false)
  %27 = add nuw nsw i32 %19, 1, !spirv.Decorations !486
  br label %18, !llvm.loop !500

28:                                               ; preds = %41, %.preheader
  %29 = phi i32 [ %38, %41 ], [ 0, %.preheader ]
  %30 = phi i32 [ %42, %41 ], [ 0, %.preheader ]
  %31 = icmp samesign ult i32 %30, 4
  br i1 %31, label %32, label %35

32:                                               ; preds = %28
  %33 = zext nneg i32 %30 to i64
  %34 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %12, i64 %33
  br label %37

35:                                               ; preds = %28
  %36 = icmp eq i32 %29, %1
  br i1 %36, label %49, label %50

37:                                               ; preds = %43, %32
  %38 = phi i32 [ %47, %43 ], [ %29, %32 ]
  %39 = phi i32 [ %48, %43 ], [ 0, %32 ]
  %40 = icmp samesign ult i32 %39, 4
  br i1 %40, label %43, label %41

41:                                               ; preds = %37
  %42 = add nuw nsw i32 %30, 1, !spirv.Decorations !486
  br label %28, !llvm.loop !501

43:                                               ; preds = %37
  %44 = zext nneg i32 %39 to i64
  %45 = getelementptr inbounds nuw float, ptr %34, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = add i32 %38, %46
  %48 = add nuw nsw i32 %39, 1, !spirv.Decorations !486
  br label %37, !llvm.loop !502

49:                                               ; preds = %35
  store i32 %1, ptr addrspace(1) %2, align 4
  br label %50

50:                                               ; preds = %49, %35
  call void @llvm.lifetime.end.p0(ptr nonnull %12)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p1.i64(ptr noalias writeonly captures(none), ptr addrspace(1) noalias readonly captures(none), i64, i1 immarg) #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare !igc_bif !503 float @llvm.fma.f32(float, float, float) #4

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare !igc_bif !503 spir_func i32 @__builtin_IB_get_group_id(i32 noundef) local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare !igc_bif !503 spir_func i32 @__builtin_IB_get_enqueued_local_size(i32 noundef) local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare !igc_bif !503 spir_func i32 @__builtin_IB_get_local_id_x() local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare !igc_bif !503 spir_func i32 @__builtin_IB_get_local_id_y() local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare !igc_bif !503 spir_func i32 @__builtin_IB_get_local_id_z() local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare !igc_bif !503 spir_func i32 @__builtin_IB_get_global_offset(i32 noundef) local_unnamed_addr #5

declare i32 @printf(ptr addrspace(2), ...)

attributes #0 = { convergent nounwind "less-precise-fpmad"="true" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { convergent mustprogress nofree nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }

!spirv.MemoryModel = !{!0}
!spirv.Source = !{!1}
!spirv.Generator = !{!2}
!igc.functions = !{!3, !6, !7}
!IGCMetadata = !{!8}
!opencl.ocl.version = !{!477}
!opencl.spir.version = !{!477}
!llvm.ident = !{!478}
!llvm.errno.tbaa = !{!479}
!llvm.module.flags = !{!483}

!0 = !{i32 2, i32 2}
!1 = !{i32 4, i32 100000}
!2 = !{i16 6, i16 14}
!3 = !{ptr @_ZTS4FmaK, !4}
!4 = !{!5}
!5 = !{!"function_type", i32 0}
!6 = !{ptr @_ZTS4IntK, !4}
!7 = !{ptr @_ZTS6SweepKILi0EE, !4}
!8 = !{!"ModuleMD", !9, !10, !128, !311, !342, !359, !380, !390, !392, !393, !408, !409, !410, !411, !412, !416, !417, !424, !425, !426, !427, !428, !429, !430, !431, !432, !434, !438, !439, !440, !441, !442, !443, !444, !445, !446, !447, !448, !449, !450, !451, !452, !232, !453, !454, !455, !457, !459, !462, !463, !464, !466, !467, !468, !473, !474, !475, !476}
!9 = !{!"isPrecise", i1 false}
!10 = !{!"compOpt", !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127}
!11 = !{!"DenormsAreZero", i1 false}
!12 = !{!"BFTFDenormsAreZero", i1 false}
!13 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!14 = !{!"OptDisable", i1 false}
!15 = !{!"MadEnable", i1 true}
!16 = !{!"NoSignedZeros", i1 false}
!17 = !{!"NoNaNs", i1 false}
!18 = !{!"FloatDenormMode16", !"FLOAT_DENORM_RETAIN"}
!19 = !{!"FloatDenormMode32", !"FLOAT_DENORM_RETAIN"}
!20 = !{!"FloatDenormMode64", !"FLOAT_DENORM_RETAIN"}
!21 = !{!"FloatDenormModeBFTF", !"FLOAT_DENORM_RETAIN"}
!22 = !{!"FloatRoundingMode", i32 0}
!23 = !{!"FloatCvtIntRoundingMode", i32 3}
!24 = !{!"LoadCacheDefault", i32 25}
!25 = !{!"StoreCacheDefault", i32 30}
!26 = !{!"VISAPreSchedRPThreshold", i32 0}
!27 = !{!"VISAPreSchedCtrl", i32 0}
!28 = !{!"SetLoopUnrollThreshold", i32 0}
!29 = !{!"UnsafeMathOptimizations", i1 false}
!30 = !{!"disableCustomUnsafeOpts", i1 false}
!31 = !{!"disableReducePow", i1 false}
!32 = !{!"disableSqrtOpt", i1 false}
!33 = !{!"FiniteMathOnly", i1 false}
!34 = !{!"FastRelaxedMath", i1 false}
!35 = !{!"DashGSpecified", i1 false}
!36 = !{!"FastCompilation", i1 false}
!37 = !{!"UseScratchSpacePrivateMemory", i1 true}
!38 = !{!"RelaxedBuiltins", i1 false}
!39 = !{!"SubgroupIndependentForwardProgressRequired", i1 true}
!40 = !{!"GreaterThan2GBBufferRequired", i1 true}
!41 = !{!"GreaterThan4GBBufferRequired", i1 true}
!42 = !{!"DisableA64WA", i1 false}
!43 = !{!"ForceEnableA64WA", i1 false}
!44 = !{!"PushConstantsEnable", i1 true}
!45 = !{!"HasPositivePointerOffset", i1 false}
!46 = !{!"HasBufferOffsetArg", i1 true}
!47 = !{!"BufferOffsetArgOptional", i1 true}
!48 = !{!"replaceGlobalOffsetsByZero", i1 false}
!49 = !{!"forcePixelShaderSIMDMode", i32 0}
!50 = !{!"forceTotalGRFNum", i32 0}
!51 = !{!"ForceGeomFFShaderSIMDMode", i32 0}
!52 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!53 = !{!"UniformWGS", i1 false}
!54 = !{!"disableVertexComponentPacking", i1 false}
!55 = !{!"disablePartialVertexComponentPacking", i1 false}
!56 = !{!"PreferBindlessImages", i1 true}
!57 = !{!"UseBindlessMode", i1 true}
!58 = !{!"UseLegacyBindlessMode", i1 false}
!59 = !{!"disableMathRefactoring", i1 false}
!60 = !{!"atomicBranch", i1 false}
!61 = !{!"spillCompression", i1 false}
!62 = !{!"AllowLICM", i1 true}
!63 = !{!"DisableEarlyOut", i1 false}
!64 = !{!"ForceInt32DivRemEmu", i1 false}
!65 = !{!"ForceInt32DivRemEmuSP", i1 false}
!66 = !{!"DisableIntDivRemIncrementReduction", i1 false}
!67 = !{!"DisableFastestSingleCSSIMD", i1 false}
!68 = !{!"DisableFastestLinearScan", i1 false}
!69 = !{!"UseStatelessforPrivateMemory", i1 false}
!70 = !{!"EnableTakeGlobalAddress", i1 false}
!71 = !{!"IsLibraryCompilation", i1 false}
!72 = !{!"LibraryCompileSIMDSize", i32 0}
!73 = !{!"FastVISACompile", i1 false}
!74 = !{!"MatchSinCosPi", i1 false}
!75 = !{!"ExcludeIRFromZEBinary", i1 false}
!76 = !{!"EmitZeBinVISASections", i1 false}
!77 = !{!"FP64GenEmulationEnabled", i1 false}
!78 = !{!"FP64GenConvEmulationEnabled", i1 false}
!79 = !{!"allowDisableRematforCS", i1 false}
!80 = !{!"DisableIncSpillCostAllAddrTaken", i1 false}
!81 = !{!"DisableCPSOmaskWA", i1 false}
!82 = !{!"DisableFastestGopt", i1 false}
!83 = !{!"WaForceHalfPromotionComputeShader", i1 false}
!84 = !{!"WaForceHalfPromotionPixelVertexShader", i1 false}
!85 = !{!"DisableConstantCoalescing", i1 false}
!86 = !{!"DisableBitcastedLoadNarrowing", i1 false}
!87 = !{!"EnableUndefAlphaOutputAsRed", i1 true}
!88 = !{!"WaEnableALTModeVisaWA", i1 false}
!89 = !{!"WaConvergentGradientsOnGenISA", i1 false}
!90 = !{!"WaDisableDualSIMD8", i1 false}
!91 = !{!"EnableLdStCombineforLoad", i1 false}
!92 = !{!"EnableLdStCombinewithDummyLoad", i1 false}
!93 = !{!"WaZeroInactiveLanesForWaveShuffle", i1 false}
!94 = !{!"ForceUniformBuffer", i1 false}
!95 = !{!"ForceUniformSurfaceSampler", i1 false}
!96 = !{!"EnableIndependentSharedMemoryFenceFunctionality", i1 false}
!97 = !{!"NewSpillCostFunction", i1 false}
!98 = !{!"VISABlockLevelSpillAllowed", i1 false}
!99 = !{!"EnableVRT", i1 true}
!100 = !{!"ForceLargeGRFNum4RQ", i1 false}
!101 = !{!"DisableEUFusion", i1 false}
!102 = !{!"DisableFDivToFMulInvOpt", i1 false}
!103 = !{!"initializePhiSampleSourceWA", i1 false}
!104 = !{!"WaDisableSubspanUseNoMaskForCB", i1 false}
!105 = !{!"DisableLoosenSimd32Occu", i1 false}
!106 = !{!"FastestS1Options", i32 0}
!107 = !{!"DisableFastestForWaveIntrinsicsCS", i1 false}
!108 = !{!"ForceLinearWalkOnLinearUAV", i1 false}
!109 = !{!"LscSamplerRouting", i32 0}
!110 = !{!"UseBarrierControlFlowOptimization", i1 false}
!111 = !{!"EnableDynamicRQManagement", i1 false}
!112 = !{!"WaDisablePayloadCoalescing", i1 false}
!113 = !{!"Quad8InputThreshold", i32 0}
!114 = !{!"UseResourceLoopUnrollNested", i1 false}
!115 = !{!"DisableLoopUnroll", i1 false}
!116 = !{!"ForcePushConstantMode", i32 0}
!117 = !{!"UseInstructionHoistingOptimization", i1 false}
!118 = !{!"DisableResourceLoopDestLifeTimeStart", i1 false}
!119 = !{!"ForceVRTGRFCeiling", i32 0}
!120 = !{!"EnableSamplerBackingByLSC", i32 0}
!121 = !{!"UseLinearScanRA", i1 false}
!122 = !{!"DisableConvertingAtomicIAddToIncDec", i1 false}
!123 = !{!"ZeroInitRegistersBeforeExecution", i1 false}
!124 = !{!"VISASpillAllowed", i32 0}
!125 = !{!"ConstantCoalescingMaxBBDepthDelta", i32 0}
!126 = !{!"ConstantCoalescingDepthCheckMinBytes", i32 0}
!127 = !{!"EnableSamplerLoopSpeculation", i1 false}
!128 = !{!"FuncMD", !129, !130, !272, !273, !289, !290}
!129 = !{!"FuncMDMap[0]", ptr @_ZTS4FmaK}
!130 = !{!"FuncMDValue[0]", !131, !132, !136, !139, !140, !141, !142, !143, !171, !172, !173, !196, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !250, !254, !258, !262, !266, !270, !271}
!131 = !{!"localOffsets"}
!132 = !{!"workGroupWalkOrder", !133, !134, !135}
!133 = !{!"dim0", i32 0}
!134 = !{!"dim1", i32 1}
!135 = !{!"dim2", i32 2}
!136 = !{!"threadGroupSize", !133, !137, !138}
!137 = !{!"dim1", i32 0}
!138 = !{!"dim2", i32 0}
!139 = !{!"threadGroupSizeHint", !133, !137, !138}
!140 = !{!"vecTypeHint", !""}
!141 = !{!"funcArgs"}
!142 = !{!"argInfoList"}
!143 = !{!"implicitArgInfoList", !144, !150, !152, !154, !156, !158, !160, !162, !164, !166, !169}
!144 = !{!"implicitArgInfoListVec[0]", !145, !146, !147, !148, !149}
!145 = !{!"argId", i32 0}
!146 = !{!"explicitArgNum", i32 -1}
!147 = !{!"structArgOffset", i32 -1}
!148 = !{!"imgAccessFloatCoords", i32 -1}
!149 = !{!"imgAccessIntCoords", i32 -1}
!150 = !{!"implicitArgInfoListVec[1]", !151, !146, !147, !148, !149}
!151 = !{!"argId", i32 2}
!152 = !{!"implicitArgInfoListVec[2]", !153, !146, !147, !148, !149}
!153 = !{!"argId", i32 7}
!154 = !{!"implicitArgInfoListVec[3]", !155, !146, !147, !148, !149}
!155 = !{!"argId", i32 8}
!156 = !{!"implicitArgInfoListVec[4]", !157, !146, !147, !148, !149}
!157 = !{!"argId", i32 9}
!158 = !{!"implicitArgInfoListVec[5]", !159, !146, !147, !148, !149}
!159 = !{!"argId", i32 10}
!160 = !{!"implicitArgInfoListVec[6]", !161, !146, !147, !148, !149}
!161 = !{!"argId", i32 13}
!162 = !{!"implicitArgInfoListVec[7]", !163, !146, !147, !148, !149}
!163 = !{!"argId", i32 57}
!164 = !{!"implicitArgInfoListVec[8]", !165, !146, !147, !148, !149}
!165 = !{!"argId", i32 58}
!166 = !{!"implicitArgInfoListVec[9]", !167, !168, !147, !148, !149}
!167 = !{!"argId", i32 15}
!168 = !{!"explicitArgNum", i32 2}
!169 = !{!"implicitArgInfoListVec[10]", !170, !168, !147, !148, !149}
!170 = !{!"argId", i32 54}
!171 = !{!"functionType", !"KernelFunction"}
!172 = !{!"requiredSubGroupSize", i32 32}
!173 = !{!"rtInfo", !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !191, !192, !193, !194, !195}
!174 = !{!"callableShaderType", !"NumberOfCallableShaderTypes"}
!175 = !{!"isContinuation", i1 false}
!176 = !{!"hasTraceRayPayload", i1 false}
!177 = !{!"hasHitAttributes", i1 false}
!178 = !{!"hasCallableData", i1 false}
!179 = !{!"ShaderStackSize", i32 0}
!180 = !{!"ShaderHash", i64 0}
!181 = !{!"ShaderName", !""}
!182 = !{!"ParentName", !""}
!183 = !{!"SlotNum", ptr null}
!184 = !{!"NOSSize", i32 0}
!185 = !{!"globalRootSignatureSize", i32 0}
!186 = !{!"Entries"}
!187 = !{!"SpillUnions"}
!188 = !{!"CustomHitAttrSizeInBytes", i32 0}
!189 = !{!"Types", !190}
!190 = !{!"FullFrameTys"}
!191 = !{!"Aliases"}
!192 = !{!"numSyncRTStacks", i32 0}
!193 = !{!"NumCoherenceHintBits", i32 0}
!194 = !{!"useSyncHWStack", i1 false}
!195 = !{!"OriginatingShaderName", !""}
!196 = !{!"resAllocMD", !197, !198, !199, !200, !218}
!197 = !{!"uavsNumType", i32 0}
!198 = !{!"srvsNumType", i32 0}
!199 = !{!"samplersNumType", i32 0}
!200 = !{!"argAllocMDList", !201, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217}
!201 = !{!"argAllocMDListVec[0]", !202, !203, !204}
!202 = !{!"type", i32 0}
!203 = !{!"extensionType", i32 -1}
!204 = !{!"indexType", i32 -1}
!205 = !{!"argAllocMDListVec[1]", !202, !203, !204}
!206 = !{!"argAllocMDListVec[2]", !202, !203, !204}
!207 = !{!"argAllocMDListVec[3]", !202, !203, !204}
!208 = !{!"argAllocMDListVec[4]", !202, !203, !204}
!209 = !{!"argAllocMDListVec[5]", !202, !203, !204}
!210 = !{!"argAllocMDListVec[6]", !202, !203, !204}
!211 = !{!"argAllocMDListVec[7]", !202, !203, !204}
!212 = !{!"argAllocMDListVec[8]", !202, !203, !204}
!213 = !{!"argAllocMDListVec[9]", !202, !203, !204}
!214 = !{!"argAllocMDListVec[10]", !202, !203, !204}
!215 = !{!"argAllocMDListVec[11]", !202, !203, !204}
!216 = !{!"argAllocMDListVec[12]", !202, !203, !204}
!217 = !{!"argAllocMDListVec[13]", !202, !203, !204}
!218 = !{!"inlineSamplersMD"}
!219 = !{!"maxByteOffsets"}
!220 = !{!"IsInitializer", i1 false}
!221 = !{!"IsFinalizer", i1 false}
!222 = !{!"CompiledSubGroupsNumber", i32 0}
!223 = !{!"maxRegPressureSimd16", i32 0}
!224 = !{!"maxRegPressureSimd32", i32 0}
!225 = !{!"maxRegUniformPressure", i32 0}
!226 = !{!"maxRegNonUniformPressure", i32 0}
!227 = !{!"bestGuessSimd", i32 0}
!228 = !{!"hasInlineVmeSamplers", i1 false}
!229 = !{!"localSize", i32 0}
!230 = !{!"localIDPresent", i1 false}
!231 = !{!"groupIDPresent", i1 false}
!232 = !{!"privateMemoryPerWI", i32 0}
!233 = !{!"prevFPOffset", i32 0}
!234 = !{!"globalIDPresent", i1 false}
!235 = !{!"hasSyncRTCalls", i1 false}
!236 = !{!"hasPrintfCalls", i1 false}
!237 = !{!"hasDPAS", i1 false}
!238 = !{!"requireAssertBuffer", i1 false}
!239 = !{!"requireSyncBuffer", i1 false}
!240 = !{!"hasIndirectCalls", i1 false}
!241 = !{!"hasNonKernelArgLoad", i1 false}
!242 = !{!"hasNonKernelArgStore", i1 false}
!243 = !{!"hasNonKernelArgAtomic", i1 false}
!244 = !{!"postTrimKernelSize", i32 145}
!245 = !{!"UserAnnotations"}
!246 = !{!"m_OpenCLArgAddressSpaces", !247, !248, !249}
!247 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 0}
!248 = !{!"m_OpenCLArgAddressSpacesVec[1]", i32 0}
!249 = !{!"m_OpenCLArgAddressSpacesVec[2]", i32 1}
!250 = !{!"m_OpenCLArgAccessQualifiers", !251, !252, !253}
!251 = !{!"m_OpenCLArgAccessQualifiersVec[0]", !"none"}
!252 = !{!"m_OpenCLArgAccessQualifiersVec[1]", !"none"}
!253 = !{!"m_OpenCLArgAccessQualifiersVec[2]", !"none"}
!254 = !{!"m_OpenCLArgTypes", !255, !256, !257}
!255 = !{!"m_OpenCLArgTypesVec[0]", !"float"}
!256 = !{!"m_OpenCLArgTypesVec[1]", !"float"}
!257 = !{!"m_OpenCLArgTypesVec[2]", !"int*"}
!258 = !{!"m_OpenCLArgBaseTypes", !259, !260, !261}
!259 = !{!"m_OpenCLArgBaseTypesVec[0]", !"float"}
!260 = !{!"m_OpenCLArgBaseTypesVec[1]", !"float"}
!261 = !{!"m_OpenCLArgBaseTypesVec[2]", !"int*"}
!262 = !{!"m_OpenCLArgTypeQualifiers", !263, !264, !265}
!263 = !{!"m_OpenCLArgTypeQualifiersVec[0]", !""}
!264 = !{!"m_OpenCLArgTypeQualifiersVec[1]", !""}
!265 = !{!"m_OpenCLArgTypeQualifiersVec[2]", !""}
!266 = !{!"m_OpenCLArgNames", !267, !268, !269}
!267 = !{!"m_OpenCLArgNamesVec[0]", !""}
!268 = !{!"m_OpenCLArgNamesVec[1]", !""}
!269 = !{!"m_OpenCLArgNamesVec[2]", !""}
!270 = !{!"m_OpenCLArgScalarAsPointers"}
!271 = !{!"m_OptsToDisablePerFunc"}
!272 = !{!"FuncMDMap[1]", ptr @_ZTS4IntK}
!273 = !{!"FuncMDValue[1]", !131, !132, !136, !139, !140, !141, !142, !274, !171, !172, !173, !278, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !280, !282, !283, !285, !287, !288, !270, !271}
!274 = !{!"implicitArgInfoList", !144, !150, !152, !154, !156, !158, !160, !162, !164, !275, !277}
!275 = !{!"implicitArgInfoListVec[9]", !167, !276, !147, !148, !149}
!276 = !{!"explicitArgNum", i32 0}
!277 = !{!"implicitArgInfoListVec[10]", !170, !276, !147, !148, !149}
!278 = !{!"resAllocMD", !197, !198, !199, !279, !218}
!279 = !{!"argAllocMDList", !201, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215}
!280 = !{!"m_OpenCLArgAddressSpaces", !281}
!281 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 1}
!282 = !{!"m_OpenCLArgAccessQualifiers", !251}
!283 = !{!"m_OpenCLArgTypes", !284}
!284 = !{!"m_OpenCLArgTypesVec[0]", !"int*"}
!285 = !{!"m_OpenCLArgBaseTypes", !286}
!286 = !{!"m_OpenCLArgBaseTypesVec[0]", !"int*"}
!287 = !{!"m_OpenCLArgTypeQualifiers", !263}
!288 = !{!"m_OpenCLArgNames", !267}
!289 = !{!"FuncMDMap[2]", ptr @_ZTS6SweepKILi0EE}
!290 = !{!"FuncMDValue[2]", !131, !132, !136, !139, !140, !141, !142, !291, !171, !172, !173, !300, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !303, !245, !304, !250, !305, !308, !262, !266, !270, !271}
!291 = !{!"implicitArgInfoList", !144, !150, !292, !293, !294, !295, !296, !297, !298, !166, !277, !299}
!292 = !{!"implicitArgInfoListVec[2]", !155, !146, !147, !148, !149}
!293 = !{!"implicitArgInfoListVec[3]", !157, !146, !147, !148, !149}
!294 = !{!"implicitArgInfoListVec[4]", !159, !146, !147, !148, !149}
!295 = !{!"implicitArgInfoListVec[5]", !161, !146, !147, !148, !149}
!296 = !{!"implicitArgInfoListVec[6]", !163, !146, !147, !148, !149}
!297 = !{!"implicitArgInfoListVec[7]", !165, !146, !147, !148, !149}
!298 = !{!"implicitArgInfoListVec[8]", !167, !276, !147, !148, !149}
!299 = !{!"implicitArgInfoListVec[11]", !170, !168, !147, !148, !149}
!300 = !{!"resAllocMD", !197, !198, !199, !301, !218}
!301 = !{!"argAllocMDList", !201, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !302}
!302 = !{!"argAllocMDListVec[14]", !202, !203, !204}
!303 = !{!"postTrimKernelSize", i32 110}
!304 = !{!"m_OpenCLArgAddressSpaces", !281, !248, !249}
!305 = !{!"m_OpenCLArgTypes", !306, !307, !257}
!306 = !{!"m_OpenCLArgTypesVec[0]", !"class.sycl::_V1::vec*"}
!307 = !{!"m_OpenCLArgTypesVec[1]", !"int"}
!308 = !{!"m_OpenCLArgBaseTypes", !309, !310, !261}
!309 = !{!"m_OpenCLArgBaseTypesVec[0]", !"class.sycl::_V1::vec*"}
!310 = !{!"m_OpenCLArgBaseTypesVec[1]", !"int"}
!311 = !{!"pushInfo", !312, !313, !314, !318, !319, !320, !321, !322, !323, !324, !325, !338, !339, !340, !341}
!312 = !{!"pushableAddresses"}
!313 = !{!"bindlessPushInfo"}
!314 = !{!"dynamicBufferInfo", !315, !316, !317}
!315 = !{!"firstIndex", i32 0}
!316 = !{!"numOffsets", i32 0}
!317 = !{!"forceDisabled", i1 false}
!318 = !{!"MaxNumberOfPushedBuffers", i32 0}
!319 = !{!"inlineConstantBufferSlot", i32 -1}
!320 = !{!"inlineConstantBufferOffset", i32 -1}
!321 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!322 = !{!"constants"}
!323 = !{!"inputs"}
!324 = !{!"constantReg"}
!325 = !{!"simplePushInfoArr", !326, !335, !336, !337}
!326 = !{!"simplePushInfoArrVec[0]", !327, !328, !329, !330, !331, !332, !333, !334}
!327 = !{!"cbIdx", i32 0}
!328 = !{!"pushableAddressGrfOffset", i32 -1}
!329 = !{!"pushableOffsetGrfOffset", i32 -1}
!330 = !{!"offset", i32 0}
!331 = !{!"size", i32 0}
!332 = !{!"isStateless", i1 false}
!333 = !{!"isBindless", i1 false}
!334 = !{!"simplePushLoads"}
!335 = !{!"simplePushInfoArrVec[1]", !327, !328, !329, !330, !331, !332, !333, !334}
!336 = !{!"simplePushInfoArrVec[2]", !327, !328, !329, !330, !331, !332, !333, !334}
!337 = !{!"simplePushInfoArrVec[3]", !327, !328, !329, !330, !331, !332, !333, !334}
!338 = !{!"simplePushBufferUsed", i32 0}
!339 = !{!"pushAnalysisWIInfos"}
!340 = !{!"inlineRTGlobalPtrOffset", i32 0}
!341 = !{!"rtSyncSurfPtrOffset", i32 0}
!342 = !{!"psInfo", !343, !344, !345, !346, !347, !348, !349, !350, !351, !352, !353, !354, !355, !356, !357, !358}
!343 = !{!"BlendStateDisabledMask", i8 0}
!344 = !{!"SkipSrc0Alpha", i1 false}
!345 = !{!"DualSourceBlendingDisabled", i1 false}
!346 = !{!"ForceEnableSimd32", i1 false}
!347 = !{!"DisableSimd32WithDiscard", i1 false}
!348 = !{!"outputDepth", i1 false}
!349 = !{!"outputStencil", i1 false}
!350 = !{!"outputMask", i1 false}
!351 = !{!"blendToFillEnabled", i1 false}
!352 = !{!"forceEarlyZ", i1 false}
!353 = !{!"hasVersionedLoop", i1 false}
!354 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!355 = !{!"blendOptimizationMode"}
!356 = !{!"colorOutputMask"}
!357 = !{!"isBlendEnabled"}
!358 = !{!"WaDisableVRS", i1 false}
!359 = !{!"csInfo", !360, !361, !362, !363, !50, !26, !27, !364, !28, !365, !366, !367, !368, !369, !370, !371, !372, !373, !374, !375, !61, !376, !377, !378, !379}
!360 = !{!"maxWorkGroupSize", i32 0}
!361 = !{!"waveSize", i32 0}
!362 = !{!"ComputeShaderSecondCompile"}
!363 = !{!"forcedSIMDSize", i8 0}
!364 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!365 = !{!"forceSpillCompression", i1 false}
!366 = !{!"allowLowerSimd", i1 false}
!367 = !{!"disableSimd32Slicing", i1 false}
!368 = !{!"disableSplitOnSpill", i1 false}
!369 = !{!"enableNewSpillCostFunction", i1 false}
!370 = !{!"forceVISAPreSched", i1 false}
!371 = !{!"disableLocalIdOrderOptimizations", i1 false}
!372 = !{!"disableDispatchAlongY", i1 false}
!373 = !{!"neededThreadIdLayout", ptr null}
!374 = !{!"forceTileYWalk", i1 false}
!375 = !{!"atomicBranch", i32 0}
!376 = !{!"disableEarlyOut", i1 false}
!377 = !{!"walkOrderEnabled", i1 false}
!378 = !{!"walkOrderOverride", i32 0}
!379 = !{!"ResForHfPacking"}
!380 = !{!"msInfo", !381, !382, !383, !384, !385, !386, !387, !388, !389}
!381 = !{!"PrimitiveTopology", i32 3}
!382 = !{!"MaxNumOfPrimitives", i32 0}
!383 = !{!"MaxNumOfVertices", i32 0}
!384 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!385 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!386 = !{!"WorkGroupSize", i32 0}
!387 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!388 = !{!"IndexFormat", i32 6}
!389 = !{!"SubgroupSize", i32 0}
!390 = !{!"taskInfo", !391, !386, !387, !389}
!391 = !{!"MaxNumOfOutputs", i32 0}
!392 = !{!"NBarrierCnt", i32 0}
!393 = !{!"rtInfo", !394, !395, !396, !397, !398, !399, !400, !401, !402, !403, !404, !405, !406, !407, !192}
!394 = !{!"RayQueryAllocSizeInBytes", i32 0}
!395 = !{!"NumContinuations", i32 0}
!396 = !{!"RTAsyncStackAddrspace", i32 -1}
!397 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!398 = !{!"SWHotZoneAddrspace", i32 -1}
!399 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!400 = !{!"SWStackAddrspace", i32 -1}
!401 = !{!"SWStackSurfaceStateOffset", ptr null}
!402 = !{!"RTSyncStackAddrspace", i32 -1}
!403 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!404 = !{!"doSyncDispatchRays", i1 false}
!405 = !{!"MemStyle", !"Xe"}
!406 = !{!"GlobalDataStyle", !"Xe"}
!407 = !{!"uberTileDimensions", ptr null}
!408 = !{!"hasSliceLayoutDependency", i1 false}
!409 = !{!"CurUniqueIndirectIdx", i32 0}
!410 = !{!"inlineDynTextures"}
!411 = !{!"inlineResInfoData"}
!412 = !{!"immConstant", !413, !414, !415}
!413 = !{!"data"}
!414 = !{!"sizes"}
!415 = !{!"zeroIdxs"}
!416 = !{!"stringConstants"}
!417 = !{!"inlineBuffers", !418, !422, !423}
!418 = !{!"inlineBuffersVec[0]", !419, !420, !421}
!419 = !{!"alignment", i32 0}
!420 = !{!"allocSize", i64 0}
!421 = !{!"Buffer"}
!422 = !{!"inlineBuffersVec[1]", !419, !420, !421}
!423 = !{!"inlineBuffersVec[2]", !419, !420, !421}
!424 = !{!"GlobalBufferAddressRelocInfo"}
!425 = !{!"ConstantBufferAddressRelocInfo"}
!426 = !{!"forceLscCacheList"}
!427 = !{!"SrvMap"}
!428 = !{!"RasterizerOrderedByteAddressBuffer"}
!429 = !{!"RasterizerOrderedViews"}
!430 = !{!"MinNOSPushConstantSize", i32 0}
!431 = !{!"inlineProgramScopeOffsets"}
!432 = !{!"shaderData", !433}
!433 = !{!"numReplicas", i32 0}
!434 = !{!"URBInfo", !435, !436, !437}
!435 = !{!"has64BVertexHeaderInput", i1 false}
!436 = !{!"has64BVertexHeaderOutput", i1 false}
!437 = !{!"hasVertexHeader", i1 true}
!438 = !{!"UseBindlessImage", i1 true}
!439 = !{!"HasBindlessImageRead", i1 false}
!440 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!441 = !{!"enableRangeReduce", i1 false}
!442 = !{!"allowMatchMadOptimizationforPosition", i1 false}
!443 = !{!"disableMatchMadOptimizationForCS", i1 false}
!444 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!445 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!446 = !{!"statefulResourcesNotAliased", i1 false}
!447 = !{!"disableMixMode", i1 false}
!448 = !{!"genericAccessesResolved", i1 false}
!449 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!450 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!451 = !{!"disableSeparateScratchWA", i1 false}
!452 = !{!"enableRemoveUnusedTGMFence", i1 false}
!453 = !{!"PrivateMemoryPerFG"}
!454 = !{!"m_OptsToDisable"}
!455 = !{!"capabilities", !456}
!456 = !{!"globalVariableDecorationsINTEL", i1 false}
!457 = !{!"extensions", !458}
!458 = !{!"spvINTELBindlessImages", i1 false}
!459 = !{!"m_ShaderResourceViewMcsMask", !460, !461}
!460 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!461 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!462 = !{!"computedDepthMode", i32 0}
!463 = !{!"isHDCFastClearShader", i1 false}
!464 = !{!"argRegisterReservations", !465}
!465 = !{!"argRegisterReservationsVec[0]", i32 0}
!466 = !{!"SIMD16_SpillThreshold", i8 0}
!467 = !{!"SIMD32_SpillThreshold", i8 0}
!468 = !{!"m_CacheControlOption", !469, !470, !471, !472}
!469 = !{!"LscLoadCacheControlOverride", i8 0}
!470 = !{!"LscStoreCacheControlOverride", i8 0}
!471 = !{!"TgmLoadCacheControlOverride", i8 0}
!472 = !{!"TgmStoreCacheControlOverride", i8 0}
!473 = !{!"ModuleUsesBindless", i1 false}
!474 = !{!"predicationMap"}
!475 = !{!"lifeTimeStartMap"}
!476 = !{!"HitGroups"}
!477 = !{i32 2, i32 0}
!478 = !{!"clang version 22.1.7"}
!479 = !{!480, !480, i64 0}
!480 = !{!"int", !481, i64 0}
!481 = !{!"omnipotent char", !482, i64 0}
!482 = !{!"Simple C/C++ TBAA"}
!483 = !{i32 1, !"wchar_size", i32 4}
!484 = !{!485}
!485 = !{i32 44, i32 4}
!486 = !{!487, !488}
!487 = !{i32 4469}
!488 = !{i32 4470}
!489 = distinct !{!489, !490}
!490 = !{!"llvm.loop.unroll.enable"}
!491 = distinct !{!491, !490}
!492 = !{!493}
!493 = !{i32 40, i32 196620}
!494 = distinct !{!494, !490}
!495 = distinct !{!495, !490}
!496 = distinct !{!496, !490}
!497 = distinct !{!497, !490}
!498 = !{!499}
!499 = !{i32 44, i32 16}
!500 = distinct !{!500, !490}
!501 = distinct !{!501, !490}
!502 = distinct !{!502, !490}
!503 = !{!"IGC built-in function"}
