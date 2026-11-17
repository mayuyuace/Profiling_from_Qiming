; ------------------------------------------------
; OCL_asm76a47ec9908e3b28_afterUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-n8:16:32"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::vec" = type { %"class.sycl::_V1::detail::vec_base" }
%"class.sycl::_V1::detail::vec_base" = type { [4 x float] }

@0 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@1 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@2 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@3 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@4 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@5 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"
@6 = internal unnamed_addr addrspace(2) constant [23 x i8] c"Pointer: %p, Type: %s\0A\00"

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTS6SweepKILi1EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i32 %bufferOffset, i32 %bufferOffset1, i32 %bindlessOffset, i32 %bindlessOffset2) #0 {
  %6 = extractelement <8 x i32> %r0, i32 0
  %7 = extractelement <8 x i32> %r0, i32 1
  %8 = extractelement <8 x i32> %r0, i32 2
  %9 = extractelement <8 x i32> %r0, i32 3
  %10 = extractelement <8 x i32> %r0, i32 4
  %11 = extractelement <8 x i32> %r0, i32 5
  %12 = extractelement <8 x i32> %r0, i32 6
  %13 = extractelement <8 x i32> %r0, i32 7
  %14 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !478
  %15 = zext nneg i32 %7 to i64
  %16 = icmp sgt i32 %7, -1
  call void @llvm.assume(i1 %16)
  %17 = zext i16 %localIdX to i64
  %.idx = shl nuw nsw i64 %15, 14
  %18 = getelementptr inbounds nuw i8, ptr addrspace(1) %0, i64 %.idx
  %19 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %18, i64 %17
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  br label %20

20:                                               ; preds = %23, %5
  %21 = phi i32 [ 0, %5 ], [ %29, %23 ]
  %22 = icmp samesign ult i32 %21, 4
  br i1 %22, label %23, label %.preheader

.preheader:                                       ; preds = %20
  br label %30

23:                                               ; preds = %20
  %24 = shl nuw nsw i32 %21, 8, !spirv.Decorations !480
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %19, i64 %25
  %27 = zext nneg i32 %21 to i64
  %28 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %27
  call void @llvm.memcpy.p0.p1.i64(ptr noundef nonnull align 16 dereferenceable(16) %28, ptr addrspace(1) noundef align 16 dereferenceable(16) %26, i64 16, i1 false)
  %29 = add nuw nsw i32 %21, 1, !spirv.Decorations !480
  br label %20, !llvm.loop !483

30:                                               ; preds = %43, %.preheader
  %31 = phi i32 [ %40, %43 ], [ 0, %.preheader ]
  %32 = phi i32 [ %44, %43 ], [ 0, %.preheader ]
  %33 = icmp samesign ult i32 %32, 4
  br i1 %33, label %34, label %37

34:                                               ; preds = %30
  %35 = zext nneg i32 %32 to i64
  %36 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %35
  br label %39

37:                                               ; preds = %30
  %38 = icmp eq i32 %31, %3
  br i1 %38, label %65, label %66

39:                                               ; preds = %53, %34
  %40 = phi i32 [ %51, %53 ], [ %31, %34 ]
  %41 = phi i32 [ %54, %53 ], [ 0, %34 ]
  %42 = icmp samesign ult i32 %41, 4
  br i1 %42, label %45, label %43

43:                                               ; preds = %39
  %44 = add nuw nsw i32 %32, 1, !spirv.Decorations !480
  br label %30, !llvm.loop !485

45:                                               ; preds = %39
  %46 = zext nneg i32 %41 to i64
  %47 = getelementptr inbounds nuw float, ptr %36, i64 %46
  %48 = load float, ptr %47, align 4
  br label %49

49:                                               ; preds = %55, %45
  %50 = phi float [ %48, %45 ], [ %56, %55 ]
  %51 = phi i32 [ %40, %45 ], [ %64, %55 ]
  %52 = phi i1 [ true, %45 ], [ false, %55 ]
  br i1 %52, label %55, label %53

53:                                               ; preds = %49
  %54 = add nuw nsw i32 %41, 1, !spirv.Decorations !480
  br label %39, !llvm.loop !486

55:                                               ; preds = %49
  %56 = call noundef float @llvm.fma.f32(float %50, float %1, float %2)
  %57 = fptrunc float %56 to half
  %58 = bitcast half %57 to i16
  %59 = zext i16 %58 to i32
  %60 = icmp sgt i16 %58, -1
  %61 = select i1 %60, i32 32768, i32 65520
  %62 = xor i32 %61, %59
  %63 = lshr i32 %62, 4
  %64 = add i32 %51, %63
  br label %49, !llvm.loop !487

65:                                               ; preds = %37
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %66

66:                                               ; preds = %65, %37
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p1.i64(ptr noalias writeonly captures(none), ptr addrspace(1) noalias readonly captures(none), i64, i1 immarg) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTS6SweepKILi2EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i32 %bufferOffset, i32 %bufferOffset1, i32 %bindlessOffset, i32 %bindlessOffset2) #0 {
  %6 = extractelement <8 x i32> %r0, i32 0
  %7 = extractelement <8 x i32> %r0, i32 1
  %8 = extractelement <8 x i32> %r0, i32 2
  %9 = extractelement <8 x i32> %r0, i32 3
  %10 = extractelement <8 x i32> %r0, i32 4
  %11 = extractelement <8 x i32> %r0, i32 5
  %12 = extractelement <8 x i32> %r0, i32 6
  %13 = extractelement <8 x i32> %r0, i32 7
  %14 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !478
  %15 = zext nneg i32 %7 to i64
  %16 = icmp sgt i32 %7, -1
  call void @llvm.assume(i1 %16)
  %17 = zext i16 %localIdX to i64
  %.idx = shl nuw nsw i64 %15, 14
  %18 = getelementptr inbounds nuw i8, ptr addrspace(1) %0, i64 %.idx
  %19 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %18, i64 %17
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  br label %20

20:                                               ; preds = %23, %5
  %21 = phi i32 [ 0, %5 ], [ %29, %23 ]
  %22 = icmp samesign ult i32 %21, 4
  br i1 %22, label %23, label %.preheader

.preheader:                                       ; preds = %20
  br label %30

23:                                               ; preds = %20
  %24 = shl nuw nsw i32 %21, 8, !spirv.Decorations !480
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %19, i64 %25
  %27 = zext nneg i32 %21 to i64
  %28 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %27
  call void @llvm.memcpy.p0.p1.i64(ptr noundef nonnull align 16 dereferenceable(16) %28, ptr addrspace(1) noundef align 16 dereferenceable(16) %26, i64 16, i1 false)
  %29 = add nuw nsw i32 %21, 1, !spirv.Decorations !480
  br label %20, !llvm.loop !488

30:                                               ; preds = %43, %.preheader
  %31 = phi i32 [ %40, %43 ], [ 0, %.preheader ]
  %32 = phi i32 [ %44, %43 ], [ 0, %.preheader ]
  %33 = icmp samesign ult i32 %32, 4
  br i1 %33, label %34, label %37

34:                                               ; preds = %30
  %35 = zext nneg i32 %32 to i64
  %36 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %35
  br label %39

37:                                               ; preds = %30
  %38 = icmp eq i32 %31, %3
  br i1 %38, label %67, label %68

39:                                               ; preds = %54, %34
  %40 = phi i32 [ %51, %54 ], [ %31, %34 ]
  %41 = phi i32 [ %55, %54 ], [ 0, %34 ]
  %42 = icmp samesign ult i32 %41, 4
  br i1 %42, label %45, label %43

43:                                               ; preds = %39
  %44 = add nuw nsw i32 %32, 1, !spirv.Decorations !480
  br label %30, !llvm.loop !489

45:                                               ; preds = %39
  %46 = zext nneg i32 %41 to i64
  %47 = getelementptr inbounds nuw float, ptr %36, i64 %46
  %48 = load float, ptr %47, align 4
  br label %49

49:                                               ; preds = %56, %45
  %50 = phi float [ %48, %45 ], [ %57, %56 ]
  %51 = phi i32 [ %40, %45 ], [ %65, %56 ]
  %52 = phi i32 [ 0, %45 ], [ %66, %56 ]
  %53 = icmp samesign ult i32 %52, 2
  br i1 %53, label %56, label %54

54:                                               ; preds = %49
  %55 = add nuw nsw i32 %41, 1, !spirv.Decorations !480
  br label %39, !llvm.loop !490

56:                                               ; preds = %49
  %57 = call noundef float @llvm.fma.f32(float %50, float %1, float %2)
  %58 = fptrunc float %57 to half
  %59 = bitcast half %58 to i16
  %60 = zext i16 %59 to i32
  %61 = icmp sgt i16 %59, -1
  %62 = select i1 %61, i32 32768, i32 65520
  %63 = xor i32 %62, %60
  %64 = lshr i32 %63, 4
  %65 = add i32 %51, %64
  %66 = add nuw nsw i32 %52, 1, !spirv.Decorations !480
  br label %49, !llvm.loop !491

67:                                               ; preds = %37
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %68

68:                                               ; preds = %67, %37
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTS6SweepKILi4EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i32 %bufferOffset, i32 %bufferOffset1, i32 %bindlessOffset, i32 %bindlessOffset2) #0 {
  %6 = extractelement <8 x i32> %r0, i32 0
  %7 = extractelement <8 x i32> %r0, i32 1
  %8 = extractelement <8 x i32> %r0, i32 2
  %9 = extractelement <8 x i32> %r0, i32 3
  %10 = extractelement <8 x i32> %r0, i32 4
  %11 = extractelement <8 x i32> %r0, i32 5
  %12 = extractelement <8 x i32> %r0, i32 6
  %13 = extractelement <8 x i32> %r0, i32 7
  %14 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !478
  %15 = zext nneg i32 %7 to i64
  %16 = icmp sgt i32 %7, -1
  call void @llvm.assume(i1 %16)
  %17 = zext i16 %localIdX to i64
  %.idx = shl nuw nsw i64 %15, 14
  %18 = getelementptr inbounds nuw i8, ptr addrspace(1) %0, i64 %.idx
  %19 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %18, i64 %17
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  br label %20

20:                                               ; preds = %23, %5
  %21 = phi i32 [ 0, %5 ], [ %29, %23 ]
  %22 = icmp samesign ult i32 %21, 4
  br i1 %22, label %23, label %.preheader

.preheader:                                       ; preds = %20
  br label %30

23:                                               ; preds = %20
  %24 = shl nuw nsw i32 %21, 8, !spirv.Decorations !480
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %19, i64 %25
  %27 = zext nneg i32 %21 to i64
  %28 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %27
  call void @llvm.memcpy.p0.p1.i64(ptr noundef nonnull align 16 dereferenceable(16) %28, ptr addrspace(1) noundef align 16 dereferenceable(16) %26, i64 16, i1 false)
  %29 = add nuw nsw i32 %21, 1, !spirv.Decorations !480
  br label %20, !llvm.loop !492

30:                                               ; preds = %43, %.preheader
  %31 = phi i32 [ %40, %43 ], [ 0, %.preheader ]
  %32 = phi i32 [ %44, %43 ], [ 0, %.preheader ]
  %33 = icmp samesign ult i32 %32, 4
  br i1 %33, label %34, label %37

34:                                               ; preds = %30
  %35 = zext nneg i32 %32 to i64
  %36 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %35
  br label %39

37:                                               ; preds = %30
  %38 = icmp eq i32 %31, %3
  br i1 %38, label %67, label %68

39:                                               ; preds = %54, %34
  %40 = phi i32 [ %51, %54 ], [ %31, %34 ]
  %41 = phi i32 [ %55, %54 ], [ 0, %34 ]
  %42 = icmp samesign ult i32 %41, 4
  br i1 %42, label %45, label %43

43:                                               ; preds = %39
  %44 = add nuw nsw i32 %32, 1, !spirv.Decorations !480
  br label %30, !llvm.loop !493

45:                                               ; preds = %39
  %46 = zext nneg i32 %41 to i64
  %47 = getelementptr inbounds nuw float, ptr %36, i64 %46
  %48 = load float, ptr %47, align 4
  br label %49

49:                                               ; preds = %56, %45
  %50 = phi float [ %48, %45 ], [ %57, %56 ]
  %51 = phi i32 [ %40, %45 ], [ %65, %56 ]
  %52 = phi i32 [ 0, %45 ], [ %66, %56 ]
  %53 = icmp samesign ult i32 %52, 4
  br i1 %53, label %56, label %54

54:                                               ; preds = %49
  %55 = add nuw nsw i32 %41, 1, !spirv.Decorations !480
  br label %39, !llvm.loop !494

56:                                               ; preds = %49
  %57 = call noundef float @llvm.fma.f32(float %50, float %1, float %2)
  %58 = fptrunc float %57 to half
  %59 = bitcast half %58 to i16
  %60 = zext i16 %59 to i32
  %61 = icmp sgt i16 %59, -1
  %62 = select i1 %61, i32 32768, i32 65520
  %63 = xor i32 %62, %60
  %64 = lshr i32 %63, 4
  %65 = add i32 %51, %64
  %66 = add nuw nsw i32 %52, 1, !spirv.Decorations !480
  br label %49, !llvm.loop !495

67:                                               ; preds = %37
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %68

68:                                               ; preds = %67, %37
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTS6SweepKILi8EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i32 %bufferOffset, i32 %bufferOffset1, i32 %bindlessOffset, i32 %bindlessOffset2) #0 {
  %6 = extractelement <8 x i32> %r0, i32 0
  %7 = extractelement <8 x i32> %r0, i32 1
  %8 = extractelement <8 x i32> %r0, i32 2
  %9 = extractelement <8 x i32> %r0, i32 3
  %10 = extractelement <8 x i32> %r0, i32 4
  %11 = extractelement <8 x i32> %r0, i32 5
  %12 = extractelement <8 x i32> %r0, i32 6
  %13 = extractelement <8 x i32> %r0, i32 7
  %14 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !478
  %15 = zext nneg i32 %7 to i64
  %16 = icmp sgt i32 %7, -1
  call void @llvm.assume(i1 %16)
  %17 = zext i16 %localIdX to i64
  %.idx = shl nuw nsw i64 %15, 14
  %18 = getelementptr inbounds nuw i8, ptr addrspace(1) %0, i64 %.idx
  %19 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %18, i64 %17
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  br label %20

20:                                               ; preds = %23, %5
  %21 = phi i32 [ 0, %5 ], [ %29, %23 ]
  %22 = icmp samesign ult i32 %21, 4
  br i1 %22, label %23, label %.preheader

.preheader:                                       ; preds = %20
  br label %30

23:                                               ; preds = %20
  %24 = shl nuw nsw i32 %21, 8, !spirv.Decorations !480
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %19, i64 %25
  %27 = zext nneg i32 %21 to i64
  %28 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %27
  call void @llvm.memcpy.p0.p1.i64(ptr noundef nonnull align 16 dereferenceable(16) %28, ptr addrspace(1) noundef align 16 dereferenceable(16) %26, i64 16, i1 false)
  %29 = add nuw nsw i32 %21, 1, !spirv.Decorations !480
  br label %20, !llvm.loop !496

30:                                               ; preds = %43, %.preheader
  %31 = phi i32 [ %40, %43 ], [ 0, %.preheader ]
  %32 = phi i32 [ %44, %43 ], [ 0, %.preheader ]
  %33 = icmp samesign ult i32 %32, 4
  br i1 %33, label %34, label %37

34:                                               ; preds = %30
  %35 = zext nneg i32 %32 to i64
  %36 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %35
  br label %39

37:                                               ; preds = %30
  %38 = icmp eq i32 %31, %3
  br i1 %38, label %67, label %68

39:                                               ; preds = %54, %34
  %40 = phi i32 [ %51, %54 ], [ %31, %34 ]
  %41 = phi i32 [ %55, %54 ], [ 0, %34 ]
  %42 = icmp samesign ult i32 %41, 4
  br i1 %42, label %45, label %43

43:                                               ; preds = %39
  %44 = add nuw nsw i32 %32, 1, !spirv.Decorations !480
  br label %30, !llvm.loop !497

45:                                               ; preds = %39
  %46 = zext nneg i32 %41 to i64
  %47 = getelementptr inbounds nuw float, ptr %36, i64 %46
  %48 = load float, ptr %47, align 4
  br label %49

49:                                               ; preds = %56, %45
  %50 = phi float [ %48, %45 ], [ %57, %56 ]
  %51 = phi i32 [ %40, %45 ], [ %65, %56 ]
  %52 = phi i32 [ 0, %45 ], [ %66, %56 ]
  %53 = icmp samesign ult i32 %52, 8
  br i1 %53, label %56, label %54

54:                                               ; preds = %49
  %55 = add nuw nsw i32 %41, 1, !spirv.Decorations !480
  br label %39, !llvm.loop !498

56:                                               ; preds = %49
  %57 = call noundef float @llvm.fma.f32(float %50, float %1, float %2)
  %58 = fptrunc float %57 to half
  %59 = bitcast half %58 to i16
  %60 = zext i16 %59 to i32
  %61 = icmp sgt i16 %59, -1
  %62 = select i1 %61, i32 32768, i32 65520
  %63 = xor i32 %62, %60
  %64 = lshr i32 %63, 4
  %65 = add i32 %51, %64
  %66 = add nuw nsw i32 %52, 1, !spirv.Decorations !480
  br label %49, !llvm.loop !499

67:                                               ; preds = %37
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %68

68:                                               ; preds = %67, %37
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTS6SweepKILi16EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i32 %bufferOffset, i32 %bufferOffset1, i32 %bindlessOffset, i32 %bindlessOffset2) #0 {
  %6 = extractelement <8 x i32> %r0, i32 0
  %7 = extractelement <8 x i32> %r0, i32 1
  %8 = extractelement <8 x i32> %r0, i32 2
  %9 = extractelement <8 x i32> %r0, i32 3
  %10 = extractelement <8 x i32> %r0, i32 4
  %11 = extractelement <8 x i32> %r0, i32 5
  %12 = extractelement <8 x i32> %r0, i32 6
  %13 = extractelement <8 x i32> %r0, i32 7
  %14 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !478
  %15 = zext nneg i32 %7 to i64
  %16 = icmp sgt i32 %7, -1
  call void @llvm.assume(i1 %16)
  %17 = zext i16 %localIdX to i64
  %.idx = shl nuw nsw i64 %15, 14
  %18 = getelementptr inbounds nuw i8, ptr addrspace(1) %0, i64 %.idx
  %19 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %18, i64 %17
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  br label %20

20:                                               ; preds = %23, %5
  %21 = phi i32 [ 0, %5 ], [ %29, %23 ]
  %22 = icmp samesign ult i32 %21, 4
  br i1 %22, label %23, label %.preheader

.preheader:                                       ; preds = %20
  br label %30

23:                                               ; preds = %20
  %24 = shl nuw nsw i32 %21, 8, !spirv.Decorations !480
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %19, i64 %25
  %27 = zext nneg i32 %21 to i64
  %28 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %27
  call void @llvm.memcpy.p0.p1.i64(ptr noundef nonnull align 16 dereferenceable(16) %28, ptr addrspace(1) noundef align 16 dereferenceable(16) %26, i64 16, i1 false)
  %29 = add nuw nsw i32 %21, 1, !spirv.Decorations !480
  br label %20, !llvm.loop !500

30:                                               ; preds = %43, %.preheader
  %31 = phi i32 [ %40, %43 ], [ 0, %.preheader ]
  %32 = phi i32 [ %44, %43 ], [ 0, %.preheader ]
  %33 = icmp samesign ult i32 %32, 4
  br i1 %33, label %34, label %37

34:                                               ; preds = %30
  %35 = zext nneg i32 %32 to i64
  %36 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %35
  br label %39

37:                                               ; preds = %30
  %38 = icmp eq i32 %31, %3
  br i1 %38, label %67, label %68

39:                                               ; preds = %54, %34
  %40 = phi i32 [ %51, %54 ], [ %31, %34 ]
  %41 = phi i32 [ %55, %54 ], [ 0, %34 ]
  %42 = icmp samesign ult i32 %41, 4
  br i1 %42, label %45, label %43

43:                                               ; preds = %39
  %44 = add nuw nsw i32 %32, 1, !spirv.Decorations !480
  br label %30, !llvm.loop !501

45:                                               ; preds = %39
  %46 = zext nneg i32 %41 to i64
  %47 = getelementptr inbounds nuw float, ptr %36, i64 %46
  %48 = load float, ptr %47, align 4
  br label %49

49:                                               ; preds = %56, %45
  %50 = phi float [ %48, %45 ], [ %57, %56 ]
  %51 = phi i32 [ %40, %45 ], [ %65, %56 ]
  %52 = phi i32 [ 0, %45 ], [ %66, %56 ]
  %53 = icmp samesign ult i32 %52, 16
  br i1 %53, label %56, label %54

54:                                               ; preds = %49
  %55 = add nuw nsw i32 %41, 1, !spirv.Decorations !480
  br label %39, !llvm.loop !502

56:                                               ; preds = %49
  %57 = call noundef float @llvm.fma.f32(float %50, float %1, float %2)
  %58 = fptrunc float %57 to half
  %59 = bitcast half %58 to i16
  %60 = zext i16 %59 to i32
  %61 = icmp sgt i16 %59, -1
  %62 = select i1 %61, i32 32768, i32 65520
  %63 = xor i32 %62, %60
  %64 = lshr i32 %63, 4
  %65 = add i32 %51, %64
  %66 = add nuw nsw i32 %52, 1, !spirv.Decorations !480
  br label %49, !llvm.loop !503

67:                                               ; preds = %37
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %68

68:                                               ; preds = %67, %37
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTS6SweepKILi32EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i32 %bufferOffset, i32 %bufferOffset1, i32 %bindlessOffset, i32 %bindlessOffset2) #0 {
  %6 = extractelement <8 x i32> %r0, i32 0
  %7 = extractelement <8 x i32> %r0, i32 1
  %8 = extractelement <8 x i32> %r0, i32 2
  %9 = extractelement <8 x i32> %r0, i32 3
  %10 = extractelement <8 x i32> %r0, i32 4
  %11 = extractelement <8 x i32> %r0, i32 5
  %12 = extractelement <8 x i32> %r0, i32 6
  %13 = extractelement <8 x i32> %r0, i32 7
  %14 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !478
  %15 = zext nneg i32 %7 to i64
  %16 = icmp sgt i32 %7, -1
  call void @llvm.assume(i1 %16)
  %17 = zext i16 %localIdX to i64
  %.idx = shl nuw nsw i64 %15, 14
  %18 = getelementptr inbounds nuw i8, ptr addrspace(1) %0, i64 %.idx
  %19 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %18, i64 %17
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  br label %20

20:                                               ; preds = %23, %5
  %21 = phi i32 [ 0, %5 ], [ %29, %23 ]
  %22 = icmp samesign ult i32 %21, 4
  br i1 %22, label %23, label %.preheader

.preheader:                                       ; preds = %20
  br label %30

23:                                               ; preds = %20
  %24 = shl nuw nsw i32 %21, 8, !spirv.Decorations !480
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %19, i64 %25
  %27 = zext nneg i32 %21 to i64
  %28 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %27
  call void @llvm.memcpy.p0.p1.i64(ptr noundef nonnull align 16 dereferenceable(16) %28, ptr addrspace(1) noundef align 16 dereferenceable(16) %26, i64 16, i1 false)
  %29 = add nuw nsw i32 %21, 1, !spirv.Decorations !480
  br label %20, !llvm.loop !504

30:                                               ; preds = %43, %.preheader
  %31 = phi i32 [ %40, %43 ], [ 0, %.preheader ]
  %32 = phi i32 [ %44, %43 ], [ 0, %.preheader ]
  %33 = icmp samesign ult i32 %32, 4
  br i1 %33, label %34, label %37

34:                                               ; preds = %30
  %35 = zext nneg i32 %32 to i64
  %36 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %35
  br label %39

37:                                               ; preds = %30
  %38 = icmp eq i32 %31, %3
  br i1 %38, label %67, label %68

39:                                               ; preds = %54, %34
  %40 = phi i32 [ %51, %54 ], [ %31, %34 ]
  %41 = phi i32 [ %55, %54 ], [ 0, %34 ]
  %42 = icmp samesign ult i32 %41, 4
  br i1 %42, label %45, label %43

43:                                               ; preds = %39
  %44 = add nuw nsw i32 %32, 1, !spirv.Decorations !480
  br label %30, !llvm.loop !505

45:                                               ; preds = %39
  %46 = zext nneg i32 %41 to i64
  %47 = getelementptr inbounds nuw float, ptr %36, i64 %46
  %48 = load float, ptr %47, align 4
  br label %49

49:                                               ; preds = %56, %45
  %50 = phi float [ %48, %45 ], [ %57, %56 ]
  %51 = phi i32 [ %40, %45 ], [ %65, %56 ]
  %52 = phi i32 [ 0, %45 ], [ %66, %56 ]
  %53 = icmp samesign ult i32 %52, 32
  br i1 %53, label %56, label %54

54:                                               ; preds = %49
  %55 = add nuw nsw i32 %41, 1, !spirv.Decorations !480
  br label %39, !llvm.loop !506

56:                                               ; preds = %49
  %57 = call noundef float @llvm.fma.f32(float %50, float %1, float %2)
  %58 = fptrunc float %57 to half
  %59 = bitcast half %58 to i16
  %60 = zext i16 %59 to i32
  %61 = icmp sgt i16 %59, -1
  %62 = select i1 %61, i32 32768, i32 65520
  %63 = xor i32 %62, %60
  %64 = lshr i32 %63, 4
  %65 = add i32 %51, %64
  %66 = add nuw nsw i32 %52, 1, !spirv.Decorations !480
  br label %49, !llvm.loop !507

67:                                               ; preds = %37
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %68

68:                                               ; preds = %67, %37
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  ret void
}

; Function Attrs: convergent nounwind
define spir_kernel void @_ZTS6SweepKILi64EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4, <8 x i32> %r0, <3 x i32> %globalOffset, i16 %localIdX, i16 %localIdY, i16 %localIdZ, ptr %privateBase, ptr addrspace(1) %indirectDataPointer, ptr addrspace(1) %scratchPointer, i32 %bufferOffset, i32 %bufferOffset1, i32 %bindlessOffset, i32 %bindlessOffset2) #0 {
  %6 = extractelement <8 x i32> %r0, i32 0
  %7 = extractelement <8 x i32> %r0, i32 1
  %8 = extractelement <8 x i32> %r0, i32 2
  %9 = extractelement <8 x i32> %r0, i32 3
  %10 = extractelement <8 x i32> %r0, i32 4
  %11 = extractelement <8 x i32> %r0, i32 5
  %12 = extractelement <8 x i32> %r0, i32 6
  %13 = extractelement <8 x i32> %r0, i32 7
  %14 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !478
  %15 = zext nneg i32 %7 to i64
  %16 = icmp sgt i32 %7, -1
  call void @llvm.assume(i1 %16)
  %17 = zext i16 %localIdX to i64
  %.idx = shl nuw nsw i64 %15, 14
  %18 = getelementptr inbounds nuw i8, ptr addrspace(1) %0, i64 %.idx
  %19 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %18, i64 %17
  call void @llvm.lifetime.start.p0(ptr nonnull %14)
  br label %20

20:                                               ; preds = %23, %5
  %21 = phi i32 [ 0, %5 ], [ %29, %23 ]
  %22 = icmp samesign ult i32 %21, 4
  br i1 %22, label %23, label %.preheader

.preheader:                                       ; preds = %20
  br label %30

23:                                               ; preds = %20
  %24 = shl nuw nsw i32 %21, 8, !spirv.Decorations !480
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr addrspace(1) %19, i64 %25
  %27 = zext nneg i32 %21 to i64
  %28 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %27
  call void @llvm.memcpy.p0.p1.i64(ptr noundef nonnull align 16 dereferenceable(16) %28, ptr addrspace(1) noundef align 16 dereferenceable(16) %26, i64 16, i1 false)
  %29 = add nuw nsw i32 %21, 1, !spirv.Decorations !480
  br label %20, !llvm.loop !508

30:                                               ; preds = %43, %.preheader
  %31 = phi i32 [ %40, %43 ], [ 0, %.preheader ]
  %32 = phi i32 [ %44, %43 ], [ 0, %.preheader ]
  %33 = icmp samesign ult i32 %32, 4
  br i1 %33, label %34, label %37

34:                                               ; preds = %30
  %35 = zext nneg i32 %32 to i64
  %36 = getelementptr inbounds nuw %"class.sycl::_V1::vec", ptr %14, i64 %35
  br label %39

37:                                               ; preds = %30
  %38 = icmp eq i32 %31, %3
  br i1 %38, label %67, label %68

39:                                               ; preds = %54, %34
  %40 = phi i32 [ %51, %54 ], [ %31, %34 ]
  %41 = phi i32 [ %55, %54 ], [ 0, %34 ]
  %42 = icmp samesign ult i32 %41, 4
  br i1 %42, label %45, label %43

43:                                               ; preds = %39
  %44 = add nuw nsw i32 %32, 1, !spirv.Decorations !480
  br label %30, !llvm.loop !509

45:                                               ; preds = %39
  %46 = zext nneg i32 %41 to i64
  %47 = getelementptr inbounds nuw float, ptr %36, i64 %46
  %48 = load float, ptr %47, align 4
  br label %49

49:                                               ; preds = %56, %45
  %50 = phi float [ %48, %45 ], [ %57, %56 ]
  %51 = phi i32 [ %40, %45 ], [ %65, %56 ]
  %52 = phi i32 [ 0, %45 ], [ %66, %56 ]
  %53 = icmp samesign ult i32 %52, 64
  br i1 %53, label %56, label %54

54:                                               ; preds = %49
  %55 = add nuw nsw i32 %41, 1, !spirv.Decorations !480
  br label %39, !llvm.loop !510

56:                                               ; preds = %49
  %57 = call noundef float @llvm.fma.f32(float %50, float %1, float %2)
  %58 = fptrunc float %57 to half
  %59 = bitcast half %58 to i16
  %60 = zext i16 %59 to i32
  %61 = icmp sgt i16 %59, -1
  %62 = select i1 %61, i32 32768, i32 65520
  %63 = xor i32 %62, %60
  %64 = lshr i32 %63, 4
  %65 = add i32 %51, %64
  %66 = add nuw nsw i32 %52, 1, !spirv.Decorations !480
  br label %49, !llvm.loop !511

67:                                               ; preds = %37
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %68

68:                                               ; preds = %67, %37
  call void @llvm.lifetime.end.p0(ptr nonnull %14)
  ret void
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare !igc_bif !512 float @llvm.fma.f32(float, float, float) #4

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare !igc_bif !512 spir_func i32 @__builtin_IB_get_group_id(i32 noundef) local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare !igc_bif !512 spir_func i32 @__builtin_IB_get_local_id_x() local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare !igc_bif !512 spir_func i32 @__builtin_IB_get_local_id_y() local_unnamed_addr #5

; Function Attrs: convergent mustprogress nofree nounwind willreturn memory(none)
declare !igc_bif !512 spir_func i32 @__builtin_IB_get_local_id_z() local_unnamed_addr #5

declare i32 @printf(ptr addrspace(2), ...)

attributes #0 = { convergent nounwind "less-precise-fpmad"="true" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { convergent mustprogress nofree nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" }

!spirv.MemoryModel = !{!0}
!spirv.Source = !{!1}
!spirv.Generator = !{!2}
!igc.functions = !{!3, !6, !7, !8, !9, !10, !11}
!IGCMetadata = !{!12}
!opencl.ocl.version = !{!471}
!opencl.spir.version = !{!471}
!llvm.ident = !{!472}
!llvm.errno.tbaa = !{!473}
!llvm.module.flags = !{!477}

!0 = !{i32 2, i32 2}
!1 = !{i32 4, i32 100000}
!2 = !{i16 6, i16 14}
!3 = !{ptr @_ZTS6SweepKILi1EE, !4}
!4 = !{!5}
!5 = !{!"function_type", i32 0}
!6 = !{ptr @_ZTS6SweepKILi2EE, !4}
!7 = !{ptr @_ZTS6SweepKILi4EE, !4}
!8 = !{ptr @_ZTS6SweepKILi8EE, !4}
!9 = !{ptr @_ZTS6SweepKILi16EE, !4}
!10 = !{ptr @_ZTS6SweepKILi32EE, !4}
!11 = !{ptr @_ZTS6SweepKILi64EE, !4}
!12 = !{!"ModuleMD", !13, !14, !132, !305, !336, !353, !374, !384, !386, !387, !402, !403, !404, !405, !406, !410, !411, !418, !419, !420, !421, !422, !423, !424, !425, !426, !428, !432, !433, !434, !435, !436, !437, !438, !439, !440, !441, !442, !443, !444, !445, !446, !240, !447, !448, !449, !451, !453, !456, !457, !458, !460, !461, !462, !467, !468, !469, !470}
!13 = !{!"isPrecise", i1 false}
!14 = !{!"compOpt", !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131}
!15 = !{!"DenormsAreZero", i1 false}
!16 = !{!"BFTFDenormsAreZero", i1 false}
!17 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!18 = !{!"OptDisable", i1 false}
!19 = !{!"MadEnable", i1 true}
!20 = !{!"NoSignedZeros", i1 false}
!21 = !{!"NoNaNs", i1 false}
!22 = !{!"FloatDenormMode16", !"FLOAT_DENORM_RETAIN"}
!23 = !{!"FloatDenormMode32", !"FLOAT_DENORM_RETAIN"}
!24 = !{!"FloatDenormMode64", !"FLOAT_DENORM_RETAIN"}
!25 = !{!"FloatDenormModeBFTF", !"FLOAT_DENORM_RETAIN"}
!26 = !{!"FloatRoundingMode", i32 0}
!27 = !{!"FloatCvtIntRoundingMode", i32 3}
!28 = !{!"LoadCacheDefault", i32 25}
!29 = !{!"StoreCacheDefault", i32 30}
!30 = !{!"VISAPreSchedRPThreshold", i32 0}
!31 = !{!"VISAPreSchedCtrl", i32 0}
!32 = !{!"SetLoopUnrollThreshold", i32 0}
!33 = !{!"UnsafeMathOptimizations", i1 false}
!34 = !{!"disableCustomUnsafeOpts", i1 false}
!35 = !{!"disableReducePow", i1 false}
!36 = !{!"disableSqrtOpt", i1 false}
!37 = !{!"FiniteMathOnly", i1 false}
!38 = !{!"FastRelaxedMath", i1 false}
!39 = !{!"DashGSpecified", i1 false}
!40 = !{!"FastCompilation", i1 false}
!41 = !{!"UseScratchSpacePrivateMemory", i1 true}
!42 = !{!"RelaxedBuiltins", i1 false}
!43 = !{!"SubgroupIndependentForwardProgressRequired", i1 true}
!44 = !{!"GreaterThan2GBBufferRequired", i1 true}
!45 = !{!"GreaterThan4GBBufferRequired", i1 true}
!46 = !{!"DisableA64WA", i1 false}
!47 = !{!"ForceEnableA64WA", i1 false}
!48 = !{!"PushConstantsEnable", i1 true}
!49 = !{!"HasPositivePointerOffset", i1 false}
!50 = !{!"HasBufferOffsetArg", i1 true}
!51 = !{!"BufferOffsetArgOptional", i1 true}
!52 = !{!"replaceGlobalOffsetsByZero", i1 false}
!53 = !{!"forcePixelShaderSIMDMode", i32 0}
!54 = !{!"forceTotalGRFNum", i32 0}
!55 = !{!"ForceGeomFFShaderSIMDMode", i32 0}
!56 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!57 = !{!"UniformWGS", i1 false}
!58 = !{!"disableVertexComponentPacking", i1 false}
!59 = !{!"disablePartialVertexComponentPacking", i1 false}
!60 = !{!"PreferBindlessImages", i1 true}
!61 = !{!"UseBindlessMode", i1 true}
!62 = !{!"UseLegacyBindlessMode", i1 false}
!63 = !{!"disableMathRefactoring", i1 false}
!64 = !{!"atomicBranch", i1 false}
!65 = !{!"spillCompression", i1 false}
!66 = !{!"AllowLICM", i1 true}
!67 = !{!"DisableEarlyOut", i1 false}
!68 = !{!"ForceInt32DivRemEmu", i1 false}
!69 = !{!"ForceInt32DivRemEmuSP", i1 false}
!70 = !{!"DisableIntDivRemIncrementReduction", i1 false}
!71 = !{!"DisableFastestSingleCSSIMD", i1 false}
!72 = !{!"DisableFastestLinearScan", i1 false}
!73 = !{!"UseStatelessforPrivateMemory", i1 false}
!74 = !{!"EnableTakeGlobalAddress", i1 false}
!75 = !{!"IsLibraryCompilation", i1 false}
!76 = !{!"LibraryCompileSIMDSize", i32 0}
!77 = !{!"FastVISACompile", i1 false}
!78 = !{!"MatchSinCosPi", i1 false}
!79 = !{!"ExcludeIRFromZEBinary", i1 false}
!80 = !{!"EmitZeBinVISASections", i1 false}
!81 = !{!"FP64GenEmulationEnabled", i1 false}
!82 = !{!"FP64GenConvEmulationEnabled", i1 false}
!83 = !{!"allowDisableRematforCS", i1 false}
!84 = !{!"DisableIncSpillCostAllAddrTaken", i1 false}
!85 = !{!"DisableCPSOmaskWA", i1 false}
!86 = !{!"DisableFastestGopt", i1 false}
!87 = !{!"WaForceHalfPromotionComputeShader", i1 false}
!88 = !{!"WaForceHalfPromotionPixelVertexShader", i1 false}
!89 = !{!"DisableConstantCoalescing", i1 false}
!90 = !{!"DisableBitcastedLoadNarrowing", i1 false}
!91 = !{!"EnableUndefAlphaOutputAsRed", i1 true}
!92 = !{!"WaEnableALTModeVisaWA", i1 false}
!93 = !{!"WaConvergentGradientsOnGenISA", i1 false}
!94 = !{!"WaDisableDualSIMD8", i1 false}
!95 = !{!"EnableLdStCombineforLoad", i1 false}
!96 = !{!"EnableLdStCombinewithDummyLoad", i1 false}
!97 = !{!"WaZeroInactiveLanesForWaveShuffle", i1 false}
!98 = !{!"ForceUniformBuffer", i1 false}
!99 = !{!"ForceUniformSurfaceSampler", i1 false}
!100 = !{!"EnableIndependentSharedMemoryFenceFunctionality", i1 false}
!101 = !{!"NewSpillCostFunction", i1 false}
!102 = !{!"VISABlockLevelSpillAllowed", i1 false}
!103 = !{!"EnableVRT", i1 true}
!104 = !{!"ForceLargeGRFNum4RQ", i1 false}
!105 = !{!"DisableEUFusion", i1 false}
!106 = !{!"DisableFDivToFMulInvOpt", i1 false}
!107 = !{!"initializePhiSampleSourceWA", i1 false}
!108 = !{!"WaDisableSubspanUseNoMaskForCB", i1 false}
!109 = !{!"DisableLoosenSimd32Occu", i1 false}
!110 = !{!"FastestS1Options", i32 0}
!111 = !{!"DisableFastestForWaveIntrinsicsCS", i1 false}
!112 = !{!"ForceLinearWalkOnLinearUAV", i1 false}
!113 = !{!"LscSamplerRouting", i32 0}
!114 = !{!"UseBarrierControlFlowOptimization", i1 false}
!115 = !{!"EnableDynamicRQManagement", i1 false}
!116 = !{!"WaDisablePayloadCoalescing", i1 false}
!117 = !{!"Quad8InputThreshold", i32 0}
!118 = !{!"UseResourceLoopUnrollNested", i1 false}
!119 = !{!"DisableLoopUnroll", i1 false}
!120 = !{!"ForcePushConstantMode", i32 0}
!121 = !{!"UseInstructionHoistingOptimization", i1 false}
!122 = !{!"DisableResourceLoopDestLifeTimeStart", i1 false}
!123 = !{!"ForceVRTGRFCeiling", i32 0}
!124 = !{!"EnableSamplerBackingByLSC", i32 0}
!125 = !{!"UseLinearScanRA", i1 false}
!126 = !{!"DisableConvertingAtomicIAddToIncDec", i1 false}
!127 = !{!"ZeroInitRegistersBeforeExecution", i1 false}
!128 = !{!"VISASpillAllowed", i32 0}
!129 = !{!"ConstantCoalescingMaxBBDepthDelta", i32 0}
!130 = !{!"ConstantCoalescingDepthCheckMinBytes", i32 0}
!131 = !{!"EnableSamplerLoopSpeculation", i1 false}
!132 = !{!"FuncMD", !133, !134, !292, !293, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304}
!133 = !{!"FuncMDMap[0]", ptr @_ZTS6SweepKILi1EE}
!134 = !{!"FuncMDValue[0]", !135, !136, !140, !143, !144, !145, !146, !147, !176, !177, !178, !201, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !260, !266, !272, !278, !284, !290, !291}
!135 = !{!"localOffsets"}
!136 = !{!"workGroupWalkOrder", !137, !138, !139}
!137 = !{!"dim0", i32 0}
!138 = !{!"dim1", i32 1}
!139 = !{!"dim2", i32 2}
!140 = !{!"threadGroupSize", !137, !141, !142}
!141 = !{!"dim1", i32 0}
!142 = !{!"dim2", i32 0}
!143 = !{!"threadGroupSizeHint", !137, !141, !142}
!144 = !{!"vecTypeHint", !""}
!145 = !{!"funcArgs"}
!146 = !{!"argInfoList"}
!147 = !{!"implicitArgInfoList", !148, !154, !156, !158, !160, !162, !164, !166, !168, !171, !173, !175}
!148 = !{!"implicitArgInfoListVec[0]", !149, !150, !151, !152, !153}
!149 = !{!"argId", i32 0}
!150 = !{!"explicitArgNum", i32 -1}
!151 = !{!"structArgOffset", i32 -1}
!152 = !{!"imgAccessFloatCoords", i32 -1}
!153 = !{!"imgAccessIntCoords", i32 -1}
!154 = !{!"implicitArgInfoListVec[1]", !155, !150, !151, !152, !153}
!155 = !{!"argId", i32 2}
!156 = !{!"implicitArgInfoListVec[2]", !157, !150, !151, !152, !153}
!157 = !{!"argId", i32 8}
!158 = !{!"implicitArgInfoListVec[3]", !159, !150, !151, !152, !153}
!159 = !{!"argId", i32 9}
!160 = !{!"implicitArgInfoListVec[4]", !161, !150, !151, !152, !153}
!161 = !{!"argId", i32 10}
!162 = !{!"implicitArgInfoListVec[5]", !163, !150, !151, !152, !153}
!163 = !{!"argId", i32 13}
!164 = !{!"implicitArgInfoListVec[6]", !165, !150, !151, !152, !153}
!165 = !{!"argId", i32 57}
!166 = !{!"implicitArgInfoListVec[7]", !167, !150, !151, !152, !153}
!167 = !{!"argId", i32 58}
!168 = !{!"implicitArgInfoListVec[8]", !169, !170, !151, !152, !153}
!169 = !{!"argId", i32 15}
!170 = !{!"explicitArgNum", i32 0}
!171 = !{!"implicitArgInfoListVec[9]", !169, !172, !151, !152, !153}
!172 = !{!"explicitArgNum", i32 4}
!173 = !{!"implicitArgInfoListVec[10]", !174, !170, !151, !152, !153}
!174 = !{!"argId", i32 54}
!175 = !{!"implicitArgInfoListVec[11]", !174, !172, !151, !152, !153}
!176 = !{!"functionType", !"KernelFunction"}
!177 = !{!"requiredSubGroupSize", i32 32}
!178 = !{!"rtInfo", !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !196, !197, !198, !199, !200}
!179 = !{!"callableShaderType", !"NumberOfCallableShaderTypes"}
!180 = !{!"isContinuation", i1 false}
!181 = !{!"hasTraceRayPayload", i1 false}
!182 = !{!"hasHitAttributes", i1 false}
!183 = !{!"hasCallableData", i1 false}
!184 = !{!"ShaderStackSize", i32 0}
!185 = !{!"ShaderHash", i64 0}
!186 = !{!"ShaderName", !""}
!187 = !{!"ParentName", !""}
!188 = !{!"SlotNum", ptr null}
!189 = !{!"NOSSize", i32 0}
!190 = !{!"globalRootSignatureSize", i32 0}
!191 = !{!"Entries"}
!192 = !{!"SpillUnions"}
!193 = !{!"CustomHitAttrSizeInBytes", i32 0}
!194 = !{!"Types", !195}
!195 = !{!"FullFrameTys"}
!196 = !{!"Aliases"}
!197 = !{!"numSyncRTStacks", i32 0}
!198 = !{!"NumCoherenceHintBits", i32 0}
!199 = !{!"useSyncHWStack", i1 false}
!200 = !{!"OriginatingShaderName", !""}
!201 = !{!"resAllocMD", !202, !203, !204, !205, !226}
!202 = !{!"uavsNumType", i32 0}
!203 = !{!"srvsNumType", i32 0}
!204 = !{!"samplersNumType", i32 0}
!205 = !{!"argAllocMDList", !206, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225}
!206 = !{!"argAllocMDListVec[0]", !207, !208, !209}
!207 = !{!"type", i32 0}
!208 = !{!"extensionType", i32 -1}
!209 = !{!"indexType", i32 -1}
!210 = !{!"argAllocMDListVec[1]", !207, !208, !209}
!211 = !{!"argAllocMDListVec[2]", !207, !208, !209}
!212 = !{!"argAllocMDListVec[3]", !207, !208, !209}
!213 = !{!"argAllocMDListVec[4]", !207, !208, !209}
!214 = !{!"argAllocMDListVec[5]", !207, !208, !209}
!215 = !{!"argAllocMDListVec[6]", !207, !208, !209}
!216 = !{!"argAllocMDListVec[7]", !207, !208, !209}
!217 = !{!"argAllocMDListVec[8]", !207, !208, !209}
!218 = !{!"argAllocMDListVec[9]", !207, !208, !209}
!219 = !{!"argAllocMDListVec[10]", !207, !208, !209}
!220 = !{!"argAllocMDListVec[11]", !207, !208, !209}
!221 = !{!"argAllocMDListVec[12]", !207, !208, !209}
!222 = !{!"argAllocMDListVec[13]", !207, !208, !209}
!223 = !{!"argAllocMDListVec[14]", !207, !208, !209}
!224 = !{!"argAllocMDListVec[15]", !207, !208, !209}
!225 = !{!"argAllocMDListVec[16]", !207, !208, !209}
!226 = !{!"inlineSamplersMD"}
!227 = !{!"maxByteOffsets"}
!228 = !{!"IsInitializer", i1 false}
!229 = !{!"IsFinalizer", i1 false}
!230 = !{!"CompiledSubGroupsNumber", i32 0}
!231 = !{!"maxRegPressureSimd16", i32 0}
!232 = !{!"maxRegPressureSimd32", i32 0}
!233 = !{!"maxRegUniformPressure", i32 0}
!234 = !{!"maxRegNonUniformPressure", i32 0}
!235 = !{!"bestGuessSimd", i32 0}
!236 = !{!"hasInlineVmeSamplers", i1 false}
!237 = !{!"localSize", i32 0}
!238 = !{!"localIDPresent", i1 false}
!239 = !{!"groupIDPresent", i1 false}
!240 = !{!"privateMemoryPerWI", i32 0}
!241 = !{!"prevFPOffset", i32 0}
!242 = !{!"globalIDPresent", i1 false}
!243 = !{!"hasSyncRTCalls", i1 false}
!244 = !{!"hasPrintfCalls", i1 false}
!245 = !{!"hasDPAS", i1 false}
!246 = !{!"requireAssertBuffer", i1 false}
!247 = !{!"requireSyncBuffer", i1 false}
!248 = !{!"hasIndirectCalls", i1 false}
!249 = !{!"hasNonKernelArgLoad", i1 false}
!250 = !{!"hasNonKernelArgStore", i1 false}
!251 = !{!"hasNonKernelArgAtomic", i1 false}
!252 = !{!"postTrimKernelSize", i32 125}
!253 = !{!"UserAnnotations"}
!254 = !{!"m_OpenCLArgAddressSpaces", !255, !256, !257, !258, !259}
!255 = !{!"m_OpenCLArgAddressSpacesVec[0]", i32 1}
!256 = !{!"m_OpenCLArgAddressSpacesVec[1]", i32 0}
!257 = !{!"m_OpenCLArgAddressSpacesVec[2]", i32 0}
!258 = !{!"m_OpenCLArgAddressSpacesVec[3]", i32 0}
!259 = !{!"m_OpenCLArgAddressSpacesVec[4]", i32 1}
!260 = !{!"m_OpenCLArgAccessQualifiers", !261, !262, !263, !264, !265}
!261 = !{!"m_OpenCLArgAccessQualifiersVec[0]", !"none"}
!262 = !{!"m_OpenCLArgAccessQualifiersVec[1]", !"none"}
!263 = !{!"m_OpenCLArgAccessQualifiersVec[2]", !"none"}
!264 = !{!"m_OpenCLArgAccessQualifiersVec[3]", !"none"}
!265 = !{!"m_OpenCLArgAccessQualifiersVec[4]", !"none"}
!266 = !{!"m_OpenCLArgTypes", !267, !268, !269, !270, !271}
!267 = !{!"m_OpenCLArgTypesVec[0]", !"class.sycl::_V1::vec*"}
!268 = !{!"m_OpenCLArgTypesVec[1]", !"float"}
!269 = !{!"m_OpenCLArgTypesVec[2]", !"float"}
!270 = !{!"m_OpenCLArgTypesVec[3]", !"int"}
!271 = !{!"m_OpenCLArgTypesVec[4]", !"int*"}
!272 = !{!"m_OpenCLArgBaseTypes", !273, !274, !275, !276, !277}
!273 = !{!"m_OpenCLArgBaseTypesVec[0]", !"class.sycl::_V1::vec*"}
!274 = !{!"m_OpenCLArgBaseTypesVec[1]", !"float"}
!275 = !{!"m_OpenCLArgBaseTypesVec[2]", !"float"}
!276 = !{!"m_OpenCLArgBaseTypesVec[3]", !"int"}
!277 = !{!"m_OpenCLArgBaseTypesVec[4]", !"int*"}
!278 = !{!"m_OpenCLArgTypeQualifiers", !279, !280, !281, !282, !283}
!279 = !{!"m_OpenCLArgTypeQualifiersVec[0]", !""}
!280 = !{!"m_OpenCLArgTypeQualifiersVec[1]", !""}
!281 = !{!"m_OpenCLArgTypeQualifiersVec[2]", !""}
!282 = !{!"m_OpenCLArgTypeQualifiersVec[3]", !""}
!283 = !{!"m_OpenCLArgTypeQualifiersVec[4]", !""}
!284 = !{!"m_OpenCLArgNames", !285, !286, !287, !288, !289}
!285 = !{!"m_OpenCLArgNamesVec[0]", !""}
!286 = !{!"m_OpenCLArgNamesVec[1]", !""}
!287 = !{!"m_OpenCLArgNamesVec[2]", !""}
!288 = !{!"m_OpenCLArgNamesVec[3]", !""}
!289 = !{!"m_OpenCLArgNamesVec[4]", !""}
!290 = !{!"m_OpenCLArgScalarAsPointers"}
!291 = !{!"m_OptsToDisablePerFunc"}
!292 = !{!"FuncMDMap[1]", ptr @_ZTS6SweepKILi2EE}
!293 = !{!"FuncMDValue[1]", !135, !136, !140, !143, !144, !145, !146, !147, !176, !177, !178, !201, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !294, !253, !254, !260, !266, !272, !278, !284, !290, !291}
!294 = !{!"postTrimKernelSize", i32 127}
!295 = !{!"FuncMDMap[2]", ptr @_ZTS6SweepKILi4EE}
!296 = !{!"FuncMDValue[2]", !135, !136, !140, !143, !144, !145, !146, !147, !176, !177, !178, !201, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !294, !253, !254, !260, !266, !272, !278, !284, !290, !291}
!297 = !{!"FuncMDMap[3]", ptr @_ZTS6SweepKILi8EE}
!298 = !{!"FuncMDValue[3]", !135, !136, !140, !143, !144, !145, !146, !147, !176, !177, !178, !201, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !294, !253, !254, !260, !266, !272, !278, !284, !290, !291}
!299 = !{!"FuncMDMap[4]", ptr @_ZTS6SweepKILi16EE}
!300 = !{!"FuncMDValue[4]", !135, !136, !140, !143, !144, !145, !146, !147, !176, !177, !178, !201, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !294, !253, !254, !260, !266, !272, !278, !284, !290, !291}
!301 = !{!"FuncMDMap[5]", ptr @_ZTS6SweepKILi32EE}
!302 = !{!"FuncMDValue[5]", !135, !136, !140, !143, !144, !145, !146, !147, !176, !177, !178, !201, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !294, !253, !254, !260, !266, !272, !278, !284, !290, !291}
!303 = !{!"FuncMDMap[6]", ptr @_ZTS6SweepKILi64EE}
!304 = !{!"FuncMDValue[6]", !135, !136, !140, !143, !144, !145, !146, !147, !176, !177, !178, !201, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !294, !253, !254, !260, !266, !272, !278, !284, !290, !291}
!305 = !{!"pushInfo", !306, !307, !308, !312, !313, !314, !315, !316, !317, !318, !319, !332, !333, !334, !335}
!306 = !{!"pushableAddresses"}
!307 = !{!"bindlessPushInfo"}
!308 = !{!"dynamicBufferInfo", !309, !310, !311}
!309 = !{!"firstIndex", i32 0}
!310 = !{!"numOffsets", i32 0}
!311 = !{!"forceDisabled", i1 false}
!312 = !{!"MaxNumberOfPushedBuffers", i32 0}
!313 = !{!"inlineConstantBufferSlot", i32 -1}
!314 = !{!"inlineConstantBufferOffset", i32 -1}
!315 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!316 = !{!"constants"}
!317 = !{!"inputs"}
!318 = !{!"constantReg"}
!319 = !{!"simplePushInfoArr", !320, !329, !330, !331}
!320 = !{!"simplePushInfoArrVec[0]", !321, !322, !323, !324, !325, !326, !327, !328}
!321 = !{!"cbIdx", i32 0}
!322 = !{!"pushableAddressGrfOffset", i32 -1}
!323 = !{!"pushableOffsetGrfOffset", i32 -1}
!324 = !{!"offset", i32 0}
!325 = !{!"size", i32 0}
!326 = !{!"isStateless", i1 false}
!327 = !{!"isBindless", i1 false}
!328 = !{!"simplePushLoads"}
!329 = !{!"simplePushInfoArrVec[1]", !321, !322, !323, !324, !325, !326, !327, !328}
!330 = !{!"simplePushInfoArrVec[2]", !321, !322, !323, !324, !325, !326, !327, !328}
!331 = !{!"simplePushInfoArrVec[3]", !321, !322, !323, !324, !325, !326, !327, !328}
!332 = !{!"simplePushBufferUsed", i32 0}
!333 = !{!"pushAnalysisWIInfos"}
!334 = !{!"inlineRTGlobalPtrOffset", i32 0}
!335 = !{!"rtSyncSurfPtrOffset", i32 0}
!336 = !{!"psInfo", !337, !338, !339, !340, !341, !342, !343, !344, !345, !346, !347, !348, !349, !350, !351, !352}
!337 = !{!"BlendStateDisabledMask", i8 0}
!338 = !{!"SkipSrc0Alpha", i1 false}
!339 = !{!"DualSourceBlendingDisabled", i1 false}
!340 = !{!"ForceEnableSimd32", i1 false}
!341 = !{!"DisableSimd32WithDiscard", i1 false}
!342 = !{!"outputDepth", i1 false}
!343 = !{!"outputStencil", i1 false}
!344 = !{!"outputMask", i1 false}
!345 = !{!"blendToFillEnabled", i1 false}
!346 = !{!"forceEarlyZ", i1 false}
!347 = !{!"hasVersionedLoop", i1 false}
!348 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!349 = !{!"blendOptimizationMode"}
!350 = !{!"colorOutputMask"}
!351 = !{!"isBlendEnabled"}
!352 = !{!"WaDisableVRS", i1 false}
!353 = !{!"csInfo", !354, !355, !356, !357, !54, !30, !31, !358, !32, !359, !360, !361, !362, !363, !364, !365, !366, !367, !368, !369, !65, !370, !371, !372, !373}
!354 = !{!"maxWorkGroupSize", i32 0}
!355 = !{!"waveSize", i32 0}
!356 = !{!"ComputeShaderSecondCompile"}
!357 = !{!"forcedSIMDSize", i8 0}
!358 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!359 = !{!"forceSpillCompression", i1 false}
!360 = !{!"allowLowerSimd", i1 false}
!361 = !{!"disableSimd32Slicing", i1 false}
!362 = !{!"disableSplitOnSpill", i1 false}
!363 = !{!"enableNewSpillCostFunction", i1 false}
!364 = !{!"forceVISAPreSched", i1 false}
!365 = !{!"disableLocalIdOrderOptimizations", i1 false}
!366 = !{!"disableDispatchAlongY", i1 false}
!367 = !{!"neededThreadIdLayout", ptr null}
!368 = !{!"forceTileYWalk", i1 false}
!369 = !{!"atomicBranch", i32 0}
!370 = !{!"disableEarlyOut", i1 false}
!371 = !{!"walkOrderEnabled", i1 false}
!372 = !{!"walkOrderOverride", i32 0}
!373 = !{!"ResForHfPacking"}
!374 = !{!"msInfo", !375, !376, !377, !378, !379, !380, !381, !382, !383}
!375 = !{!"PrimitiveTopology", i32 3}
!376 = !{!"MaxNumOfPrimitives", i32 0}
!377 = !{!"MaxNumOfVertices", i32 0}
!378 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!379 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!380 = !{!"WorkGroupSize", i32 0}
!381 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!382 = !{!"IndexFormat", i32 6}
!383 = !{!"SubgroupSize", i32 0}
!384 = !{!"taskInfo", !385, !380, !381, !383}
!385 = !{!"MaxNumOfOutputs", i32 0}
!386 = !{!"NBarrierCnt", i32 0}
!387 = !{!"rtInfo", !388, !389, !390, !391, !392, !393, !394, !395, !396, !397, !398, !399, !400, !401, !197}
!388 = !{!"RayQueryAllocSizeInBytes", i32 0}
!389 = !{!"NumContinuations", i32 0}
!390 = !{!"RTAsyncStackAddrspace", i32 -1}
!391 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!392 = !{!"SWHotZoneAddrspace", i32 -1}
!393 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!394 = !{!"SWStackAddrspace", i32 -1}
!395 = !{!"SWStackSurfaceStateOffset", ptr null}
!396 = !{!"RTSyncStackAddrspace", i32 -1}
!397 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!398 = !{!"doSyncDispatchRays", i1 false}
!399 = !{!"MemStyle", !"Xe"}
!400 = !{!"GlobalDataStyle", !"Xe"}
!401 = !{!"uberTileDimensions", ptr null}
!402 = !{!"hasSliceLayoutDependency", i1 false}
!403 = !{!"CurUniqueIndirectIdx", i32 0}
!404 = !{!"inlineDynTextures"}
!405 = !{!"inlineResInfoData"}
!406 = !{!"immConstant", !407, !408, !409}
!407 = !{!"data"}
!408 = !{!"sizes"}
!409 = !{!"zeroIdxs"}
!410 = !{!"stringConstants"}
!411 = !{!"inlineBuffers", !412, !416, !417}
!412 = !{!"inlineBuffersVec[0]", !413, !414, !415}
!413 = !{!"alignment", i32 0}
!414 = !{!"allocSize", i64 0}
!415 = !{!"Buffer"}
!416 = !{!"inlineBuffersVec[1]", !413, !414, !415}
!417 = !{!"inlineBuffersVec[2]", !413, !414, !415}
!418 = !{!"GlobalBufferAddressRelocInfo"}
!419 = !{!"ConstantBufferAddressRelocInfo"}
!420 = !{!"forceLscCacheList"}
!421 = !{!"SrvMap"}
!422 = !{!"RasterizerOrderedByteAddressBuffer"}
!423 = !{!"RasterizerOrderedViews"}
!424 = !{!"MinNOSPushConstantSize", i32 0}
!425 = !{!"inlineProgramScopeOffsets"}
!426 = !{!"shaderData", !427}
!427 = !{!"numReplicas", i32 0}
!428 = !{!"URBInfo", !429, !430, !431}
!429 = !{!"has64BVertexHeaderInput", i1 false}
!430 = !{!"has64BVertexHeaderOutput", i1 false}
!431 = !{!"hasVertexHeader", i1 true}
!432 = !{!"UseBindlessImage", i1 true}
!433 = !{!"HasBindlessImageRead", i1 false}
!434 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!435 = !{!"enableRangeReduce", i1 false}
!436 = !{!"allowMatchMadOptimizationforPosition", i1 false}
!437 = !{!"disableMatchMadOptimizationForCS", i1 false}
!438 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!439 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!440 = !{!"statefulResourcesNotAliased", i1 false}
!441 = !{!"disableMixMode", i1 false}
!442 = !{!"genericAccessesResolved", i1 false}
!443 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!444 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!445 = !{!"disableSeparateScratchWA", i1 false}
!446 = !{!"enableRemoveUnusedTGMFence", i1 false}
!447 = !{!"PrivateMemoryPerFG"}
!448 = !{!"m_OptsToDisable"}
!449 = !{!"capabilities", !450}
!450 = !{!"globalVariableDecorationsINTEL", i1 false}
!451 = !{!"extensions", !452}
!452 = !{!"spvINTELBindlessImages", i1 false}
!453 = !{!"m_ShaderResourceViewMcsMask", !454, !455}
!454 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!455 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!456 = !{!"computedDepthMode", i32 0}
!457 = !{!"isHDCFastClearShader", i1 false}
!458 = !{!"argRegisterReservations", !459}
!459 = !{!"argRegisterReservationsVec[0]", i32 0}
!460 = !{!"SIMD16_SpillThreshold", i8 0}
!461 = !{!"SIMD32_SpillThreshold", i8 0}
!462 = !{!"m_CacheControlOption", !463, !464, !465, !466}
!463 = !{!"LscLoadCacheControlOverride", i8 0}
!464 = !{!"LscStoreCacheControlOverride", i8 0}
!465 = !{!"TgmLoadCacheControlOverride", i8 0}
!466 = !{!"TgmStoreCacheControlOverride", i8 0}
!467 = !{!"ModuleUsesBindless", i1 false}
!468 = !{!"predicationMap"}
!469 = !{!"lifeTimeStartMap"}
!470 = !{!"HitGroups"}
!471 = !{i32 2, i32 0}
!472 = !{!"clang version 22.1.7"}
!473 = !{!474, !474, i64 0}
!474 = !{!"int", !475, i64 0}
!475 = !{!"omnipotent char", !476, i64 0}
!476 = !{!"Simple C/C++ TBAA"}
!477 = !{i32 1, !"wchar_size", i32 4}
!478 = !{!479}
!479 = !{i32 44, i32 16}
!480 = !{!481, !482}
!481 = !{i32 4469}
!482 = !{i32 4470}
!483 = distinct !{!483, !484}
!484 = !{!"llvm.loop.unroll.enable"}
!485 = distinct !{!485, !484}
!486 = distinct !{!486, !484}
!487 = distinct !{!487, !484}
!488 = distinct !{!488, !484}
!489 = distinct !{!489, !484}
!490 = distinct !{!490, !484}
!491 = distinct !{!491, !484}
!492 = distinct !{!492, !484}
!493 = distinct !{!493, !484}
!494 = distinct !{!494, !484}
!495 = distinct !{!495, !484}
!496 = distinct !{!496, !484}
!497 = distinct !{!497, !484}
!498 = distinct !{!498, !484}
!499 = distinct !{!499, !484}
!500 = distinct !{!500, !484}
!501 = distinct !{!501, !484}
!502 = distinct !{!502, !484}
!503 = distinct !{!503, !484}
!504 = distinct !{!504, !484}
!505 = distinct !{!505, !484}
!506 = distinct !{!506, !484}
!507 = distinct !{!507, !484}
!508 = distinct !{!508, !484}
!509 = distinct !{!509, !484}
!510 = distinct !{!510, !484}
!511 = distinct !{!511, !484}
!512 = !{!"IGC built-in function"}
