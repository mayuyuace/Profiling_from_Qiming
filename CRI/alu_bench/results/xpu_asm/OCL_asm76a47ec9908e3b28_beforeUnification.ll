; ------------------------------------------------
; OCL_asm76a47ec9908e3b28_beforeUnification.ll
; ------------------------------------------------
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir64-unknown-unknown"

%"class.sycl::_V1::vec" = type { %"class.sycl::_V1::detail::vec_base" }
%"class.sycl::_V1::detail::vec_base" = type { [4 x float] }

; Function Attrs: nounwind
define spir_kernel void @_ZTS6SweepKILi1EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4) #0 !kernel_arg_addr_space !296 !kernel_arg_access_qual !297 !kernel_arg_type !298 !kernel_arg_type_qual !299 !kernel_arg_base_type !298 !kernel_arg_name !299 !spirv.ParameterDecorations !300 !intel_reqd_sub_group_size !303 {
  %6 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !304
  %7 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %8 = insertelement <3 x i64> poison, i64 %7, i32 0
  %9 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 1) #5
  %10 = insertelement <3 x i64> %8, i64 %9, i32 1
  %11 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 2) #5
  %12 = insertelement <3 x i64> %10, i64 %11, i32 2
  %13 = extractelement <3 x i64> %12, i32 0
  %14 = select i1 true, i64 %13, i64 0
  %15 = icmp ult i64 %14, 2147483648
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %17 = insertelement <3 x i64> poison, i64 %16, i32 0
  %18 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 1) #5
  %19 = insertelement <3 x i64> %17, i64 %18, i32 1
  %20 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 2) #5
  %21 = insertelement <3 x i64> %19, i64 %20, i32 2
  %22 = extractelement <3 x i64> %21, i32 0
  %23 = select i1 true, i64 %22, i64 0
  %24 = icmp ult i64 %23, 2147483648
  call void @llvm.assume(i1 %24)
  %25 = shl nuw nsw i64 %14, 10, !spirv.Decorations !306
  %26 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %0, i64 %25
  %27 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %26, i64 %23
  %28 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.start.p0(ptr %6)
  br label %29

29:                                               ; preds = %32, %5
  %30 = phi i32 [ 0, %5 ], [ %38, %32 ]
  %31 = icmp ult i32 %30, 4
  br i1 %31, label %32, label %.preheader

.preheader:                                       ; preds = %29
  br label %39

32:                                               ; preds = %29
  %33 = shl nuw nsw i32 %30, 8, !spirv.Decorations !306
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %27, i64 %34
  %36 = zext i32 %30 to i64
  %37 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %36
  call void @llvm.memcpy.p0.p1.i64(ptr align 16 %37, ptr addrspace(1) align 16 %35, i64 16, i1 false)
  %38 = add nuw nsw i32 %30, 1, !spirv.Decorations !306
  br label %29, !llvm.loop !309

39:                                               ; preds = %52, %.preheader
  %40 = phi i32 [ %49, %52 ], [ 0, %.preheader ]
  %41 = phi i32 [ %53, %52 ], [ 0, %.preheader ]
  %42 = icmp ult i32 %41, 4
  br i1 %42, label %43, label %46

43:                                               ; preds = %39
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %44
  br label %48

46:                                               ; preds = %39
  %47 = icmp eq i32 %40, %3
  br i1 %47, label %75, label %76

48:                                               ; preds = %63, %43
  %49 = phi i32 [ %61, %63 ], [ %40, %43 ]
  %50 = phi i32 [ %64, %63 ], [ 0, %43 ]
  %51 = icmp ult i32 %50, 4
  br i1 %51, label %54, label %52

52:                                               ; preds = %48
  %53 = add nuw nsw i32 %41, 1, !spirv.Decorations !306
  br label %39, !llvm.loop !311

54:                                               ; preds = %48
  %55 = zext i32 %50 to i64
  %56 = bitcast ptr %45 to ptr
  %57 = getelementptr inbounds [4 x float], ptr %56, i64 0, i64 %55
  %58 = load float, ptr %57, align 4
  br label %59

59:                                               ; preds = %65, %54
  %60 = phi float [ %58, %54 ], [ %66, %65 ]
  %61 = phi i32 [ %49, %54 ], [ %74, %65 ]
  %62 = phi i1 [ true, %54 ], [ false, %65 ]
  br i1 %62, label %65, label %63

63:                                               ; preds = %59
  %64 = add nuw nsw i32 %50, 1, !spirv.Decorations !306
  br label %48, !llvm.loop !312

65:                                               ; preds = %59
  %66 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_fmafff(float %60, float %1, float %2) #0, !spirv.Decorations !313
  %67 = fptrunc float %66 to half
  %68 = bitcast half %67 to i16
  %69 = zext i16 %68 to i32
  %70 = icmp sgt i16 %68, -1
  %71 = select i1 %70, i32 32768, i32 65520
  %72 = xor i32 %71, %69
  %73 = lshr i32 %72, 4
  %74 = add i32 %61, %73
  br label %59, !llvm.loop !315

75:                                               ; preds = %46
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %76

76:                                               ; preds = %75, %46
  %77 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.end.p0(ptr %6)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p1.i64(ptr noalias writeonly captures(none), ptr addrspace(1) noalias readonly captures(none), i64, i1 immarg) #3

; Function Attrs: nounwind memory(none)
declare spir_func float @_Z15__spirv_ocl_fmafff(float, float, float) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #2

; Function Attrs: nounwind
define spir_kernel void @_ZTS6SweepKILi2EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4) #0 !kernel_arg_addr_space !296 !kernel_arg_access_qual !297 !kernel_arg_type !298 !kernel_arg_type_qual !299 !kernel_arg_base_type !298 !kernel_arg_name !299 !spirv.ParameterDecorations !300 !intel_reqd_sub_group_size !303 {
  %6 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !304
  %7 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %8 = insertelement <3 x i64> poison, i64 %7, i32 0
  %9 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 1) #5
  %10 = insertelement <3 x i64> %8, i64 %9, i32 1
  %11 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 2) #5
  %12 = insertelement <3 x i64> %10, i64 %11, i32 2
  %13 = extractelement <3 x i64> %12, i32 0
  %14 = select i1 true, i64 %13, i64 0
  %15 = icmp ult i64 %14, 2147483648
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %17 = insertelement <3 x i64> poison, i64 %16, i32 0
  %18 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 1) #5
  %19 = insertelement <3 x i64> %17, i64 %18, i32 1
  %20 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 2) #5
  %21 = insertelement <3 x i64> %19, i64 %20, i32 2
  %22 = extractelement <3 x i64> %21, i32 0
  %23 = select i1 true, i64 %22, i64 0
  %24 = icmp ult i64 %23, 2147483648
  call void @llvm.assume(i1 %24)
  %25 = shl nuw nsw i64 %14, 10, !spirv.Decorations !306
  %26 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %0, i64 %25
  %27 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %26, i64 %23
  %28 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.start.p0(ptr %6)
  br label %29

29:                                               ; preds = %32, %5
  %30 = phi i32 [ 0, %5 ], [ %38, %32 ]
  %31 = icmp ult i32 %30, 4
  br i1 %31, label %32, label %.preheader

.preheader:                                       ; preds = %29
  br label %39

32:                                               ; preds = %29
  %33 = shl nuw nsw i32 %30, 8, !spirv.Decorations !306
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %27, i64 %34
  %36 = zext i32 %30 to i64
  %37 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %36
  call void @llvm.memcpy.p0.p1.i64(ptr align 16 %37, ptr addrspace(1) align 16 %35, i64 16, i1 false)
  %38 = add nuw nsw i32 %30, 1, !spirv.Decorations !306
  br label %29, !llvm.loop !316

39:                                               ; preds = %52, %.preheader
  %40 = phi i32 [ %49, %52 ], [ 0, %.preheader ]
  %41 = phi i32 [ %53, %52 ], [ 0, %.preheader ]
  %42 = icmp ult i32 %41, 4
  br i1 %42, label %43, label %46

43:                                               ; preds = %39
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %44
  br label %48

46:                                               ; preds = %39
  %47 = icmp eq i32 %40, %3
  br i1 %47, label %77, label %78

48:                                               ; preds = %64, %43
  %49 = phi i32 [ %61, %64 ], [ %40, %43 ]
  %50 = phi i32 [ %65, %64 ], [ 0, %43 ]
  %51 = icmp ult i32 %50, 4
  br i1 %51, label %54, label %52

52:                                               ; preds = %48
  %53 = add nuw nsw i32 %41, 1, !spirv.Decorations !306
  br label %39, !llvm.loop !317

54:                                               ; preds = %48
  %55 = zext i32 %50 to i64
  %56 = bitcast ptr %45 to ptr
  %57 = getelementptr inbounds [4 x float], ptr %56, i64 0, i64 %55
  %58 = load float, ptr %57, align 4
  br label %59

59:                                               ; preds = %66, %54
  %60 = phi float [ %58, %54 ], [ %67, %66 ]
  %61 = phi i32 [ %49, %54 ], [ %75, %66 ]
  %62 = phi i32 [ 0, %54 ], [ %76, %66 ]
  %63 = icmp ult i32 %62, 2
  br i1 %63, label %66, label %64

64:                                               ; preds = %59
  %65 = add nuw nsw i32 %50, 1, !spirv.Decorations !306
  br label %48, !llvm.loop !318

66:                                               ; preds = %59
  %67 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_fmafff(float %60, float %1, float %2) #0, !spirv.Decorations !313
  %68 = fptrunc float %67 to half
  %69 = bitcast half %68 to i16
  %70 = zext i16 %69 to i32
  %71 = icmp sgt i16 %69, -1
  %72 = select i1 %71, i32 32768, i32 65520
  %73 = xor i32 %72, %70
  %74 = lshr i32 %73, 4
  %75 = add i32 %61, %74
  %76 = add nuw nsw i32 %62, 1, !spirv.Decorations !306
  br label %59, !llvm.loop !319

77:                                               ; preds = %46
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %78

78:                                               ; preds = %77, %46
  %79 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.end.p0(ptr %6)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTS6SweepKILi4EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4) #0 !kernel_arg_addr_space !296 !kernel_arg_access_qual !297 !kernel_arg_type !298 !kernel_arg_type_qual !299 !kernel_arg_base_type !298 !kernel_arg_name !299 !spirv.ParameterDecorations !300 !intel_reqd_sub_group_size !303 {
  %6 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !304
  %7 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %8 = insertelement <3 x i64> poison, i64 %7, i32 0
  %9 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 1) #5
  %10 = insertelement <3 x i64> %8, i64 %9, i32 1
  %11 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 2) #5
  %12 = insertelement <3 x i64> %10, i64 %11, i32 2
  %13 = extractelement <3 x i64> %12, i32 0
  %14 = select i1 true, i64 %13, i64 0
  %15 = icmp ult i64 %14, 2147483648
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %17 = insertelement <3 x i64> poison, i64 %16, i32 0
  %18 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 1) #5
  %19 = insertelement <3 x i64> %17, i64 %18, i32 1
  %20 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 2) #5
  %21 = insertelement <3 x i64> %19, i64 %20, i32 2
  %22 = extractelement <3 x i64> %21, i32 0
  %23 = select i1 true, i64 %22, i64 0
  %24 = icmp ult i64 %23, 2147483648
  call void @llvm.assume(i1 %24)
  %25 = shl nuw nsw i64 %14, 10, !spirv.Decorations !306
  %26 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %0, i64 %25
  %27 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %26, i64 %23
  %28 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.start.p0(ptr %6)
  br label %29

29:                                               ; preds = %32, %5
  %30 = phi i32 [ 0, %5 ], [ %38, %32 ]
  %31 = icmp ult i32 %30, 4
  br i1 %31, label %32, label %.preheader

.preheader:                                       ; preds = %29
  br label %39

32:                                               ; preds = %29
  %33 = shl nuw nsw i32 %30, 8, !spirv.Decorations !306
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %27, i64 %34
  %36 = zext i32 %30 to i64
  %37 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %36
  call void @llvm.memcpy.p0.p1.i64(ptr align 16 %37, ptr addrspace(1) align 16 %35, i64 16, i1 false)
  %38 = add nuw nsw i32 %30, 1, !spirv.Decorations !306
  br label %29, !llvm.loop !320

39:                                               ; preds = %52, %.preheader
  %40 = phi i32 [ %49, %52 ], [ 0, %.preheader ]
  %41 = phi i32 [ %53, %52 ], [ 0, %.preheader ]
  %42 = icmp ult i32 %41, 4
  br i1 %42, label %43, label %46

43:                                               ; preds = %39
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %44
  br label %48

46:                                               ; preds = %39
  %47 = icmp eq i32 %40, %3
  br i1 %47, label %77, label %78

48:                                               ; preds = %64, %43
  %49 = phi i32 [ %61, %64 ], [ %40, %43 ]
  %50 = phi i32 [ %65, %64 ], [ 0, %43 ]
  %51 = icmp ult i32 %50, 4
  br i1 %51, label %54, label %52

52:                                               ; preds = %48
  %53 = add nuw nsw i32 %41, 1, !spirv.Decorations !306
  br label %39, !llvm.loop !321

54:                                               ; preds = %48
  %55 = zext i32 %50 to i64
  %56 = bitcast ptr %45 to ptr
  %57 = getelementptr inbounds [4 x float], ptr %56, i64 0, i64 %55
  %58 = load float, ptr %57, align 4
  br label %59

59:                                               ; preds = %66, %54
  %60 = phi float [ %58, %54 ], [ %67, %66 ]
  %61 = phi i32 [ %49, %54 ], [ %75, %66 ]
  %62 = phi i32 [ 0, %54 ], [ %76, %66 ]
  %63 = icmp ult i32 %62, 4
  br i1 %63, label %66, label %64

64:                                               ; preds = %59
  %65 = add nuw nsw i32 %50, 1, !spirv.Decorations !306
  br label %48, !llvm.loop !322

66:                                               ; preds = %59
  %67 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_fmafff(float %60, float %1, float %2) #0, !spirv.Decorations !313
  %68 = fptrunc float %67 to half
  %69 = bitcast half %68 to i16
  %70 = zext i16 %69 to i32
  %71 = icmp sgt i16 %69, -1
  %72 = select i1 %71, i32 32768, i32 65520
  %73 = xor i32 %72, %70
  %74 = lshr i32 %73, 4
  %75 = add i32 %61, %74
  %76 = add nuw nsw i32 %62, 1, !spirv.Decorations !306
  br label %59, !llvm.loop !323

77:                                               ; preds = %46
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %78

78:                                               ; preds = %77, %46
  %79 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.end.p0(ptr %6)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTS6SweepKILi8EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4) #0 !kernel_arg_addr_space !296 !kernel_arg_access_qual !297 !kernel_arg_type !298 !kernel_arg_type_qual !299 !kernel_arg_base_type !298 !kernel_arg_name !299 !spirv.ParameterDecorations !300 !intel_reqd_sub_group_size !303 {
  %6 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !304
  %7 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %8 = insertelement <3 x i64> poison, i64 %7, i32 0
  %9 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 1) #5
  %10 = insertelement <3 x i64> %8, i64 %9, i32 1
  %11 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 2) #5
  %12 = insertelement <3 x i64> %10, i64 %11, i32 2
  %13 = extractelement <3 x i64> %12, i32 0
  %14 = select i1 true, i64 %13, i64 0
  %15 = icmp ult i64 %14, 2147483648
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %17 = insertelement <3 x i64> poison, i64 %16, i32 0
  %18 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 1) #5
  %19 = insertelement <3 x i64> %17, i64 %18, i32 1
  %20 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 2) #5
  %21 = insertelement <3 x i64> %19, i64 %20, i32 2
  %22 = extractelement <3 x i64> %21, i32 0
  %23 = select i1 true, i64 %22, i64 0
  %24 = icmp ult i64 %23, 2147483648
  call void @llvm.assume(i1 %24)
  %25 = shl nuw nsw i64 %14, 10, !spirv.Decorations !306
  %26 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %0, i64 %25
  %27 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %26, i64 %23
  %28 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.start.p0(ptr %6)
  br label %29

29:                                               ; preds = %32, %5
  %30 = phi i32 [ 0, %5 ], [ %38, %32 ]
  %31 = icmp ult i32 %30, 4
  br i1 %31, label %32, label %.preheader

.preheader:                                       ; preds = %29
  br label %39

32:                                               ; preds = %29
  %33 = shl nuw nsw i32 %30, 8, !spirv.Decorations !306
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %27, i64 %34
  %36 = zext i32 %30 to i64
  %37 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %36
  call void @llvm.memcpy.p0.p1.i64(ptr align 16 %37, ptr addrspace(1) align 16 %35, i64 16, i1 false)
  %38 = add nuw nsw i32 %30, 1, !spirv.Decorations !306
  br label %29, !llvm.loop !324

39:                                               ; preds = %52, %.preheader
  %40 = phi i32 [ %49, %52 ], [ 0, %.preheader ]
  %41 = phi i32 [ %53, %52 ], [ 0, %.preheader ]
  %42 = icmp ult i32 %41, 4
  br i1 %42, label %43, label %46

43:                                               ; preds = %39
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %44
  br label %48

46:                                               ; preds = %39
  %47 = icmp eq i32 %40, %3
  br i1 %47, label %77, label %78

48:                                               ; preds = %64, %43
  %49 = phi i32 [ %61, %64 ], [ %40, %43 ]
  %50 = phi i32 [ %65, %64 ], [ 0, %43 ]
  %51 = icmp ult i32 %50, 4
  br i1 %51, label %54, label %52

52:                                               ; preds = %48
  %53 = add nuw nsw i32 %41, 1, !spirv.Decorations !306
  br label %39, !llvm.loop !325

54:                                               ; preds = %48
  %55 = zext i32 %50 to i64
  %56 = bitcast ptr %45 to ptr
  %57 = getelementptr inbounds [4 x float], ptr %56, i64 0, i64 %55
  %58 = load float, ptr %57, align 4
  br label %59

59:                                               ; preds = %66, %54
  %60 = phi float [ %58, %54 ], [ %67, %66 ]
  %61 = phi i32 [ %49, %54 ], [ %75, %66 ]
  %62 = phi i32 [ 0, %54 ], [ %76, %66 ]
  %63 = icmp ult i32 %62, 8
  br i1 %63, label %66, label %64

64:                                               ; preds = %59
  %65 = add nuw nsw i32 %50, 1, !spirv.Decorations !306
  br label %48, !llvm.loop !326

66:                                               ; preds = %59
  %67 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_fmafff(float %60, float %1, float %2) #0, !spirv.Decorations !313
  %68 = fptrunc float %67 to half
  %69 = bitcast half %68 to i16
  %70 = zext i16 %69 to i32
  %71 = icmp sgt i16 %69, -1
  %72 = select i1 %71, i32 32768, i32 65520
  %73 = xor i32 %72, %70
  %74 = lshr i32 %73, 4
  %75 = add i32 %61, %74
  %76 = add nuw nsw i32 %62, 1, !spirv.Decorations !306
  br label %59, !llvm.loop !327

77:                                               ; preds = %46
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %78

78:                                               ; preds = %77, %46
  %79 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.end.p0(ptr %6)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTS6SweepKILi16EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4) #0 !kernel_arg_addr_space !296 !kernel_arg_access_qual !297 !kernel_arg_type !298 !kernel_arg_type_qual !299 !kernel_arg_base_type !298 !kernel_arg_name !299 !spirv.ParameterDecorations !300 !intel_reqd_sub_group_size !303 {
  %6 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !304
  %7 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %8 = insertelement <3 x i64> poison, i64 %7, i32 0
  %9 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 1) #5
  %10 = insertelement <3 x i64> %8, i64 %9, i32 1
  %11 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 2) #5
  %12 = insertelement <3 x i64> %10, i64 %11, i32 2
  %13 = extractelement <3 x i64> %12, i32 0
  %14 = select i1 true, i64 %13, i64 0
  %15 = icmp ult i64 %14, 2147483648
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %17 = insertelement <3 x i64> poison, i64 %16, i32 0
  %18 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 1) #5
  %19 = insertelement <3 x i64> %17, i64 %18, i32 1
  %20 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 2) #5
  %21 = insertelement <3 x i64> %19, i64 %20, i32 2
  %22 = extractelement <3 x i64> %21, i32 0
  %23 = select i1 true, i64 %22, i64 0
  %24 = icmp ult i64 %23, 2147483648
  call void @llvm.assume(i1 %24)
  %25 = shl nuw nsw i64 %14, 10, !spirv.Decorations !306
  %26 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %0, i64 %25
  %27 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %26, i64 %23
  %28 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.start.p0(ptr %6)
  br label %29

29:                                               ; preds = %32, %5
  %30 = phi i32 [ 0, %5 ], [ %38, %32 ]
  %31 = icmp ult i32 %30, 4
  br i1 %31, label %32, label %.preheader

.preheader:                                       ; preds = %29
  br label %39

32:                                               ; preds = %29
  %33 = shl nuw nsw i32 %30, 8, !spirv.Decorations !306
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %27, i64 %34
  %36 = zext i32 %30 to i64
  %37 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %36
  call void @llvm.memcpy.p0.p1.i64(ptr align 16 %37, ptr addrspace(1) align 16 %35, i64 16, i1 false)
  %38 = add nuw nsw i32 %30, 1, !spirv.Decorations !306
  br label %29, !llvm.loop !328

39:                                               ; preds = %52, %.preheader
  %40 = phi i32 [ %49, %52 ], [ 0, %.preheader ]
  %41 = phi i32 [ %53, %52 ], [ 0, %.preheader ]
  %42 = icmp ult i32 %41, 4
  br i1 %42, label %43, label %46

43:                                               ; preds = %39
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %44
  br label %48

46:                                               ; preds = %39
  %47 = icmp eq i32 %40, %3
  br i1 %47, label %77, label %78

48:                                               ; preds = %64, %43
  %49 = phi i32 [ %61, %64 ], [ %40, %43 ]
  %50 = phi i32 [ %65, %64 ], [ 0, %43 ]
  %51 = icmp ult i32 %50, 4
  br i1 %51, label %54, label %52

52:                                               ; preds = %48
  %53 = add nuw nsw i32 %41, 1, !spirv.Decorations !306
  br label %39, !llvm.loop !329

54:                                               ; preds = %48
  %55 = zext i32 %50 to i64
  %56 = bitcast ptr %45 to ptr
  %57 = getelementptr inbounds [4 x float], ptr %56, i64 0, i64 %55
  %58 = load float, ptr %57, align 4
  br label %59

59:                                               ; preds = %66, %54
  %60 = phi float [ %58, %54 ], [ %67, %66 ]
  %61 = phi i32 [ %49, %54 ], [ %75, %66 ]
  %62 = phi i32 [ 0, %54 ], [ %76, %66 ]
  %63 = icmp ult i32 %62, 16
  br i1 %63, label %66, label %64

64:                                               ; preds = %59
  %65 = add nuw nsw i32 %50, 1, !spirv.Decorations !306
  br label %48, !llvm.loop !330

66:                                               ; preds = %59
  %67 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_fmafff(float %60, float %1, float %2) #0, !spirv.Decorations !313
  %68 = fptrunc float %67 to half
  %69 = bitcast half %68 to i16
  %70 = zext i16 %69 to i32
  %71 = icmp sgt i16 %69, -1
  %72 = select i1 %71, i32 32768, i32 65520
  %73 = xor i32 %72, %70
  %74 = lshr i32 %73, 4
  %75 = add i32 %61, %74
  %76 = add nuw nsw i32 %62, 1, !spirv.Decorations !306
  br label %59, !llvm.loop !331

77:                                               ; preds = %46
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %78

78:                                               ; preds = %77, %46
  %79 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.end.p0(ptr %6)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTS6SweepKILi32EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4) #0 !kernel_arg_addr_space !296 !kernel_arg_access_qual !297 !kernel_arg_type !298 !kernel_arg_type_qual !299 !kernel_arg_base_type !298 !kernel_arg_name !299 !spirv.ParameterDecorations !300 !intel_reqd_sub_group_size !303 {
  %6 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !304
  %7 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %8 = insertelement <3 x i64> poison, i64 %7, i32 0
  %9 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 1) #5
  %10 = insertelement <3 x i64> %8, i64 %9, i32 1
  %11 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 2) #5
  %12 = insertelement <3 x i64> %10, i64 %11, i32 2
  %13 = extractelement <3 x i64> %12, i32 0
  %14 = select i1 true, i64 %13, i64 0
  %15 = icmp ult i64 %14, 2147483648
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %17 = insertelement <3 x i64> poison, i64 %16, i32 0
  %18 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 1) #5
  %19 = insertelement <3 x i64> %17, i64 %18, i32 1
  %20 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 2) #5
  %21 = insertelement <3 x i64> %19, i64 %20, i32 2
  %22 = extractelement <3 x i64> %21, i32 0
  %23 = select i1 true, i64 %22, i64 0
  %24 = icmp ult i64 %23, 2147483648
  call void @llvm.assume(i1 %24)
  %25 = shl nuw nsw i64 %14, 10, !spirv.Decorations !306
  %26 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %0, i64 %25
  %27 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %26, i64 %23
  %28 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.start.p0(ptr %6)
  br label %29

29:                                               ; preds = %32, %5
  %30 = phi i32 [ 0, %5 ], [ %38, %32 ]
  %31 = icmp ult i32 %30, 4
  br i1 %31, label %32, label %.preheader

.preheader:                                       ; preds = %29
  br label %39

32:                                               ; preds = %29
  %33 = shl nuw nsw i32 %30, 8, !spirv.Decorations !306
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %27, i64 %34
  %36 = zext i32 %30 to i64
  %37 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %36
  call void @llvm.memcpy.p0.p1.i64(ptr align 16 %37, ptr addrspace(1) align 16 %35, i64 16, i1 false)
  %38 = add nuw nsw i32 %30, 1, !spirv.Decorations !306
  br label %29, !llvm.loop !332

39:                                               ; preds = %52, %.preheader
  %40 = phi i32 [ %49, %52 ], [ 0, %.preheader ]
  %41 = phi i32 [ %53, %52 ], [ 0, %.preheader ]
  %42 = icmp ult i32 %41, 4
  br i1 %42, label %43, label %46

43:                                               ; preds = %39
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %44
  br label %48

46:                                               ; preds = %39
  %47 = icmp eq i32 %40, %3
  br i1 %47, label %77, label %78

48:                                               ; preds = %64, %43
  %49 = phi i32 [ %61, %64 ], [ %40, %43 ]
  %50 = phi i32 [ %65, %64 ], [ 0, %43 ]
  %51 = icmp ult i32 %50, 4
  br i1 %51, label %54, label %52

52:                                               ; preds = %48
  %53 = add nuw nsw i32 %41, 1, !spirv.Decorations !306
  br label %39, !llvm.loop !333

54:                                               ; preds = %48
  %55 = zext i32 %50 to i64
  %56 = bitcast ptr %45 to ptr
  %57 = getelementptr inbounds [4 x float], ptr %56, i64 0, i64 %55
  %58 = load float, ptr %57, align 4
  br label %59

59:                                               ; preds = %66, %54
  %60 = phi float [ %58, %54 ], [ %67, %66 ]
  %61 = phi i32 [ %49, %54 ], [ %75, %66 ]
  %62 = phi i32 [ 0, %54 ], [ %76, %66 ]
  %63 = icmp ult i32 %62, 32
  br i1 %63, label %66, label %64

64:                                               ; preds = %59
  %65 = add nuw nsw i32 %50, 1, !spirv.Decorations !306
  br label %48, !llvm.loop !334

66:                                               ; preds = %59
  %67 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_fmafff(float %60, float %1, float %2) #0, !spirv.Decorations !313
  %68 = fptrunc float %67 to half
  %69 = bitcast half %68 to i16
  %70 = zext i16 %69 to i32
  %71 = icmp sgt i16 %69, -1
  %72 = select i1 %71, i32 32768, i32 65520
  %73 = xor i32 %72, %70
  %74 = lshr i32 %73, 4
  %75 = add i32 %61, %74
  %76 = add nuw nsw i32 %62, 1, !spirv.Decorations !306
  br label %59, !llvm.loop !335

77:                                               ; preds = %46
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %78

78:                                               ; preds = %77, %46
  %79 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.end.p0(ptr %6)
  ret void
}

; Function Attrs: nounwind
define spir_kernel void @_ZTS6SweepKILi64EE(ptr addrspace(1) align 4 %0, float %1, float %2, i32 %3, ptr addrspace(1) align 4 %4) #0 !kernel_arg_addr_space !296 !kernel_arg_access_qual !297 !kernel_arg_type !298 !kernel_arg_type_qual !299 !kernel_arg_base_type !298 !kernel_arg_name !299 !spirv.ParameterDecorations !300 !intel_reqd_sub_group_size !303 {
  %6 = alloca [4 x %"class.sycl::_V1::vec"], align 16, !spirv.Decorations !304
  %7 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 0) #5
  %8 = insertelement <3 x i64> poison, i64 %7, i32 0
  %9 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 1) #5
  %10 = insertelement <3 x i64> %8, i64 %9, i32 1
  %11 = call spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32 2) #5
  %12 = insertelement <3 x i64> %10, i64 %11, i32 2
  %13 = extractelement <3 x i64> %12, i32 0
  %14 = select i1 true, i64 %13, i64 0
  %15 = icmp ult i64 %14, 2147483648
  call void @llvm.assume(i1 %15)
  %16 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 0) #5
  %17 = insertelement <3 x i64> poison, i64 %16, i32 0
  %18 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 1) #5
  %19 = insertelement <3 x i64> %17, i64 %18, i32 1
  %20 = call spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32 2) #5
  %21 = insertelement <3 x i64> %19, i64 %20, i32 2
  %22 = extractelement <3 x i64> %21, i32 0
  %23 = select i1 true, i64 %22, i64 0
  %24 = icmp ult i64 %23, 2147483648
  call void @llvm.assume(i1 %24)
  %25 = shl nuw nsw i64 %14, 10, !spirv.Decorations !306
  %26 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %0, i64 %25
  %27 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %26, i64 %23
  %28 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.start.p0(ptr %6)
  br label %29

29:                                               ; preds = %32, %5
  %30 = phi i32 [ 0, %5 ], [ %38, %32 ]
  %31 = icmp ult i32 %30, 4
  br i1 %31, label %32, label %.preheader

.preheader:                                       ; preds = %29
  br label %39

32:                                               ; preds = %29
  %33 = shl nuw nsw i32 %30, 8, !spirv.Decorations !306
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %"class.sycl::_V1::vec", ptr addrspace(1) %27, i64 %34
  %36 = zext i32 %30 to i64
  %37 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %36
  call void @llvm.memcpy.p0.p1.i64(ptr align 16 %37, ptr addrspace(1) align 16 %35, i64 16, i1 false)
  %38 = add nuw nsw i32 %30, 1, !spirv.Decorations !306
  br label %29, !llvm.loop !336

39:                                               ; preds = %52, %.preheader
  %40 = phi i32 [ %49, %52 ], [ 0, %.preheader ]
  %41 = phi i32 [ %53, %52 ], [ 0, %.preheader ]
  %42 = icmp ult i32 %41, 4
  br i1 %42, label %43, label %46

43:                                               ; preds = %39
  %44 = sext i32 %41 to i64
  %45 = getelementptr inbounds [4 x %"class.sycl::_V1::vec"], ptr %6, i64 0, i64 %44
  br label %48

46:                                               ; preds = %39
  %47 = icmp eq i32 %40, %3
  br i1 %47, label %77, label %78

48:                                               ; preds = %64, %43
  %49 = phi i32 [ %61, %64 ], [ %40, %43 ]
  %50 = phi i32 [ %65, %64 ], [ 0, %43 ]
  %51 = icmp ult i32 %50, 4
  br i1 %51, label %54, label %52

52:                                               ; preds = %48
  %53 = add nuw nsw i32 %41, 1, !spirv.Decorations !306
  br label %39, !llvm.loop !337

54:                                               ; preds = %48
  %55 = zext i32 %50 to i64
  %56 = bitcast ptr %45 to ptr
  %57 = getelementptr inbounds [4 x float], ptr %56, i64 0, i64 %55
  %58 = load float, ptr %57, align 4
  br label %59

59:                                               ; preds = %66, %54
  %60 = phi float [ %58, %54 ], [ %67, %66 ]
  %61 = phi i32 [ %49, %54 ], [ %75, %66 ]
  %62 = phi i32 [ 0, %54 ], [ %76, %66 ]
  %63 = icmp ult i32 %62, 64
  br i1 %63, label %66, label %64

64:                                               ; preds = %59
  %65 = add nuw nsw i32 %50, 1, !spirv.Decorations !306
  br label %48, !llvm.loop !338

66:                                               ; preds = %59
  %67 = call reassoc nsz arcp contract spir_func float @_Z15__spirv_ocl_fmafff(float %60, float %1, float %2) #0, !spirv.Decorations !313
  %68 = fptrunc float %67 to half
  %69 = bitcast half %68 to i16
  %70 = zext i16 %69 to i32
  %71 = icmp sgt i16 %69, -1
  %72 = select i1 %71, i32 32768, i32 65520
  %73 = xor i32 %72, %70
  %74 = lshr i32 %73, 4
  %75 = add i32 %61, %74
  %76 = add nuw nsw i32 %62, 1, !spirv.Decorations !306
  br label %59, !llvm.loop !339

77:                                               ; preds = %46
  store i32 %3, ptr addrspace(1) %4, align 4
  br label %78

78:                                               ; preds = %77, %46
  %79 = bitcast ptr %6 to ptr
  call void @llvm.lifetime.end.p0(ptr %6)
  ret void
}

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i64 @_Z26__spirv_BuiltInWorkgroupIdi(i32) #5

; Function Attrs: nounwind willreturn memory(none)
declare spir_func i64 @_Z32__spirv_BuiltInLocalInvocationIdi(i32) #5

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind memory(none) }
attributes #5 = { nounwind willreturn memory(none) }

!spirv.MemoryModel = !{!0}
!opencl.enable.FP_CONTRACT = !{}
!spirv.Source = !{!1}
!opencl.spir.version = !{!2}
!opencl.used.extensions = !{!3}
!opencl.used.optional.core.features = !{!3}
!spirv.Generator = !{!4}
!opencl.compiler.options = !{!5}
!igc.spirv.extensions = !{!6}
!igc.functions = !{}
!IGCMetadata = !{!7}

!0 = !{i32 2, i32 2}
!1 = !{i32 4, i32 100000}
!2 = !{i32 1, i32 2}
!3 = !{}
!4 = !{i16 6, i16 14}
!5 = !{!"-ze-opt-level=O2"}
!6 = !{!"SPV_INTEL_fp_fast_math_mode", !"SPV_KHR_expect_assume"}
!7 = !{!"ModuleMD", !8, !9, !127, !128, !159, !176, !197, !207, !209, !210, !226, !227, !228, !229, !230, !234, !235, !242, !243, !244, !245, !246, !247, !248, !249, !250, !252, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !276, !278, !281, !282, !283, !285, !286, !287, !292, !293, !294, !295}
!8 = !{!"isPrecise", i1 false}
!9 = !{!"compOpt", !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126}
!10 = !{!"DenormsAreZero", i1 false}
!11 = !{!"BFTFDenormsAreZero", i1 false}
!12 = !{!"CorrectlyRoundedDivSqrt", i1 false}
!13 = !{!"OptDisable", i1 false}
!14 = !{!"MadEnable", i1 false}
!15 = !{!"NoSignedZeros", i1 false}
!16 = !{!"NoNaNs", i1 false}
!17 = !{!"FloatDenormMode16", !"FLOAT_DENORM_RETAIN"}
!18 = !{!"FloatDenormMode32", !"FLOAT_DENORM_RETAIN"}
!19 = !{!"FloatDenormMode64", !"FLOAT_DENORM_RETAIN"}
!20 = !{!"FloatDenormModeBFTF", !"FLOAT_DENORM_RETAIN"}
!21 = !{!"FloatRoundingMode", i32 0}
!22 = !{!"FloatCvtIntRoundingMode", i32 3}
!23 = !{!"LoadCacheDefault", i32 -1}
!24 = !{!"StoreCacheDefault", i32 -1}
!25 = !{!"VISAPreSchedRPThreshold", i32 0}
!26 = !{!"VISAPreSchedCtrl", i32 0}
!27 = !{!"SetLoopUnrollThreshold", i32 0}
!28 = !{!"UnsafeMathOptimizations", i1 false}
!29 = !{!"disableCustomUnsafeOpts", i1 false}
!30 = !{!"disableReducePow", i1 false}
!31 = !{!"disableSqrtOpt", i1 false}
!32 = !{!"FiniteMathOnly", i1 false}
!33 = !{!"FastRelaxedMath", i1 false}
!34 = !{!"DashGSpecified", i1 false}
!35 = !{!"FastCompilation", i1 false}
!36 = !{!"UseScratchSpacePrivateMemory", i1 true}
!37 = !{!"RelaxedBuiltins", i1 false}
!38 = !{!"SubgroupIndependentForwardProgressRequired", i1 true}
!39 = !{!"GreaterThan2GBBufferRequired", i1 true}
!40 = !{!"GreaterThan4GBBufferRequired", i1 true}
!41 = !{!"DisableA64WA", i1 false}
!42 = !{!"ForceEnableA64WA", i1 false}
!43 = !{!"PushConstantsEnable", i1 true}
!44 = !{!"HasPositivePointerOffset", i1 false}
!45 = !{!"HasBufferOffsetArg", i1 false}
!46 = !{!"BufferOffsetArgOptional", i1 true}
!47 = !{!"replaceGlobalOffsetsByZero", i1 false}
!48 = !{!"forcePixelShaderSIMDMode", i32 0}
!49 = !{!"forceTotalGRFNum", i32 0}
!50 = !{!"ForceGeomFFShaderSIMDMode", i32 0}
!51 = !{!"pixelShaderDoNotAbortOnSpill", i1 false}
!52 = !{!"UniformWGS", i1 false}
!53 = !{!"disableVertexComponentPacking", i1 false}
!54 = !{!"disablePartialVertexComponentPacking", i1 false}
!55 = !{!"PreferBindlessImages", i1 false}
!56 = !{!"UseBindlessMode", i1 false}
!57 = !{!"UseLegacyBindlessMode", i1 true}
!58 = !{!"disableMathRefactoring", i1 false}
!59 = !{!"atomicBranch", i1 false}
!60 = !{!"spillCompression", i1 false}
!61 = !{!"AllowLICM", i1 true}
!62 = !{!"DisableEarlyOut", i1 false}
!63 = !{!"ForceInt32DivRemEmu", i1 false}
!64 = !{!"ForceInt32DivRemEmuSP", i1 false}
!65 = !{!"DisableIntDivRemIncrementReduction", i1 false}
!66 = !{!"DisableFastestSingleCSSIMD", i1 false}
!67 = !{!"DisableFastestLinearScan", i1 false}
!68 = !{!"UseStatelessforPrivateMemory", i1 false}
!69 = !{!"EnableTakeGlobalAddress", i1 false}
!70 = !{!"IsLibraryCompilation", i1 false}
!71 = !{!"LibraryCompileSIMDSize", i32 0}
!72 = !{!"FastVISACompile", i1 false}
!73 = !{!"MatchSinCosPi", i1 false}
!74 = !{!"ExcludeIRFromZEBinary", i1 false}
!75 = !{!"EmitZeBinVISASections", i1 false}
!76 = !{!"FP64GenEmulationEnabled", i1 false}
!77 = !{!"FP64GenConvEmulationEnabled", i1 false}
!78 = !{!"allowDisableRematforCS", i1 false}
!79 = !{!"DisableIncSpillCostAllAddrTaken", i1 false}
!80 = !{!"DisableCPSOmaskWA", i1 false}
!81 = !{!"DisableFastestGopt", i1 false}
!82 = !{!"WaForceHalfPromotionComputeShader", i1 false}
!83 = !{!"WaForceHalfPromotionPixelVertexShader", i1 false}
!84 = !{!"DisableConstantCoalescing", i1 false}
!85 = !{!"DisableBitcastedLoadNarrowing", i1 false}
!86 = !{!"EnableUndefAlphaOutputAsRed", i1 true}
!87 = !{!"WaEnableALTModeVisaWA", i1 false}
!88 = !{!"WaConvergentGradientsOnGenISA", i1 false}
!89 = !{!"WaDisableDualSIMD8", i1 false}
!90 = !{!"EnableLdStCombineforLoad", i1 false}
!91 = !{!"EnableLdStCombinewithDummyLoad", i1 false}
!92 = !{!"WaZeroInactiveLanesForWaveShuffle", i1 false}
!93 = !{!"ForceUniformBuffer", i1 false}
!94 = !{!"ForceUniformSurfaceSampler", i1 false}
!95 = !{!"EnableIndependentSharedMemoryFenceFunctionality", i1 false}
!96 = !{!"NewSpillCostFunction", i1 false}
!97 = !{!"VISABlockLevelSpillAllowed", i1 false}
!98 = !{!"EnableVRT", i1 true}
!99 = !{!"ForceLargeGRFNum4RQ", i1 false}
!100 = !{!"DisableEUFusion", i1 false}
!101 = !{!"DisableFDivToFMulInvOpt", i1 false}
!102 = !{!"initializePhiSampleSourceWA", i1 false}
!103 = !{!"WaDisableSubspanUseNoMaskForCB", i1 false}
!104 = !{!"DisableLoosenSimd32Occu", i1 false}
!105 = !{!"FastestS1Options", i32 0}
!106 = !{!"DisableFastestForWaveIntrinsicsCS", i1 false}
!107 = !{!"ForceLinearWalkOnLinearUAV", i1 false}
!108 = !{!"LscSamplerRouting", i32 0}
!109 = !{!"UseBarrierControlFlowOptimization", i1 false}
!110 = !{!"EnableDynamicRQManagement", i1 false}
!111 = !{!"WaDisablePayloadCoalescing", i1 false}
!112 = !{!"Quad8InputThreshold", i32 0}
!113 = !{!"UseResourceLoopUnrollNested", i1 false}
!114 = !{!"DisableLoopUnroll", i1 false}
!115 = !{!"ForcePushConstantMode", i32 0}
!116 = !{!"UseInstructionHoistingOptimization", i1 false}
!117 = !{!"DisableResourceLoopDestLifeTimeStart", i1 false}
!118 = !{!"ForceVRTGRFCeiling", i32 0}
!119 = !{!"EnableSamplerBackingByLSC", i32 0}
!120 = !{!"UseLinearScanRA", i1 false}
!121 = !{!"DisableConvertingAtomicIAddToIncDec", i1 false}
!122 = !{!"ZeroInitRegistersBeforeExecution", i1 false}
!123 = !{!"VISASpillAllowed", i32 0}
!124 = !{!"ConstantCoalescingMaxBBDepthDelta", i32 0}
!125 = !{!"ConstantCoalescingDepthCheckMinBytes", i32 0}
!126 = !{!"EnableSamplerLoopSpeculation", i1 false}
!127 = !{!"FuncMD"}
!128 = !{!"pushInfo", !129, !130, !131, !135, !136, !137, !138, !139, !140, !141, !142, !155, !156, !157, !158}
!129 = !{!"pushableAddresses"}
!130 = !{!"bindlessPushInfo"}
!131 = !{!"dynamicBufferInfo", !132, !133, !134}
!132 = !{!"firstIndex", i32 0}
!133 = !{!"numOffsets", i32 0}
!134 = !{!"forceDisabled", i1 false}
!135 = !{!"MaxNumberOfPushedBuffers", i32 0}
!136 = !{!"inlineConstantBufferSlot", i32 -1}
!137 = !{!"inlineConstantBufferOffset", i32 -1}
!138 = !{!"inlineConstantBufferGRFOffset", i32 -1}
!139 = !{!"constants"}
!140 = !{!"inputs"}
!141 = !{!"constantReg"}
!142 = !{!"simplePushInfoArr", !143, !152, !153, !154}
!143 = !{!"simplePushInfoArrVec[0]", !144, !145, !146, !147, !148, !149, !150, !151}
!144 = !{!"cbIdx", i32 0}
!145 = !{!"pushableAddressGrfOffset", i32 -1}
!146 = !{!"pushableOffsetGrfOffset", i32 -1}
!147 = !{!"offset", i32 0}
!148 = !{!"size", i32 0}
!149 = !{!"isStateless", i1 false}
!150 = !{!"isBindless", i1 false}
!151 = !{!"simplePushLoads"}
!152 = !{!"simplePushInfoArrVec[1]", !144, !145, !146, !147, !148, !149, !150, !151}
!153 = !{!"simplePushInfoArrVec[2]", !144, !145, !146, !147, !148, !149, !150, !151}
!154 = !{!"simplePushInfoArrVec[3]", !144, !145, !146, !147, !148, !149, !150, !151}
!155 = !{!"simplePushBufferUsed", i32 0}
!156 = !{!"pushAnalysisWIInfos"}
!157 = !{!"inlineRTGlobalPtrOffset", i32 0}
!158 = !{!"rtSyncSurfPtrOffset", i32 0}
!159 = !{!"psInfo", !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175}
!160 = !{!"BlendStateDisabledMask", i8 0}
!161 = !{!"SkipSrc0Alpha", i1 false}
!162 = !{!"DualSourceBlendingDisabled", i1 false}
!163 = !{!"ForceEnableSimd32", i1 false}
!164 = !{!"DisableSimd32WithDiscard", i1 false}
!165 = !{!"outputDepth", i1 false}
!166 = !{!"outputStencil", i1 false}
!167 = !{!"outputMask", i1 false}
!168 = !{!"blendToFillEnabled", i1 false}
!169 = !{!"forceEarlyZ", i1 false}
!170 = !{!"hasVersionedLoop", i1 false}
!171 = !{!"forceSingleSourceRTWAfterDualSourceRTW", i1 false}
!172 = !{!"blendOptimizationMode"}
!173 = !{!"colorOutputMask"}
!174 = !{!"isBlendEnabled"}
!175 = !{!"WaDisableVRS", i1 false}
!176 = !{!"csInfo", !177, !178, !179, !180, !49, !25, !26, !181, !27, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !60, !193, !194, !195, !196}
!177 = !{!"maxWorkGroupSize", i32 0}
!178 = !{!"waveSize", i32 0}
!179 = !{!"ComputeShaderSecondCompile"}
!180 = !{!"forcedSIMDSize", i8 0}
!181 = !{!"VISAPreSchedScheduleExtraGRF", i32 0}
!182 = !{!"forceSpillCompression", i1 false}
!183 = !{!"allowLowerSimd", i1 false}
!184 = !{!"disableSimd32Slicing", i1 false}
!185 = !{!"disableSplitOnSpill", i1 false}
!186 = !{!"enableNewSpillCostFunction", i1 false}
!187 = !{!"forceVISAPreSched", i1 false}
!188 = !{!"disableLocalIdOrderOptimizations", i1 false}
!189 = !{!"disableDispatchAlongY", i1 false}
!190 = !{!"neededThreadIdLayout", ptr null}
!191 = !{!"forceTileYWalk", i1 false}
!192 = !{!"atomicBranch", i32 0}
!193 = !{!"disableEarlyOut", i1 false}
!194 = !{!"walkOrderEnabled", i1 false}
!195 = !{!"walkOrderOverride", i32 0}
!196 = !{!"ResForHfPacking"}
!197 = !{!"msInfo", !198, !199, !200, !201, !202, !203, !204, !205, !206}
!198 = !{!"PrimitiveTopology", i32 3}
!199 = !{!"MaxNumOfPrimitives", i32 0}
!200 = !{!"MaxNumOfVertices", i32 0}
!201 = !{!"MaxNumOfPerPrimitiveOutputs", i32 0}
!202 = !{!"MaxNumOfPerVertexOutputs", i32 0}
!203 = !{!"WorkGroupSize", i32 0}
!204 = !{!"WorkGroupMemorySizeInBytes", i32 0}
!205 = !{!"IndexFormat", i32 6}
!206 = !{!"SubgroupSize", i32 0}
!207 = !{!"taskInfo", !208, !203, !204, !206}
!208 = !{!"MaxNumOfOutputs", i32 0}
!209 = !{!"NBarrierCnt", i32 0}
!210 = !{!"rtInfo", !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225}
!211 = !{!"RayQueryAllocSizeInBytes", i32 0}
!212 = !{!"NumContinuations", i32 0}
!213 = !{!"RTAsyncStackAddrspace", i32 -1}
!214 = !{!"RTAsyncStackSurfaceStateOffset", ptr null}
!215 = !{!"SWHotZoneAddrspace", i32 -1}
!216 = !{!"SWHotZoneSurfaceStateOffset", ptr null}
!217 = !{!"SWStackAddrspace", i32 -1}
!218 = !{!"SWStackSurfaceStateOffset", ptr null}
!219 = !{!"RTSyncStackAddrspace", i32 -1}
!220 = !{!"RTSyncStackSurfaceStateOffset", ptr null}
!221 = !{!"doSyncDispatchRays", i1 false}
!222 = !{!"MemStyle", !"Xe"}
!223 = !{!"GlobalDataStyle", !"Xe"}
!224 = !{!"uberTileDimensions", ptr null}
!225 = !{!"numSyncRTStacks", i32 0}
!226 = !{!"hasSliceLayoutDependency", i1 false}
!227 = !{!"CurUniqueIndirectIdx", i32 0}
!228 = !{!"inlineDynTextures"}
!229 = !{!"inlineResInfoData"}
!230 = !{!"immConstant", !231, !232, !233}
!231 = !{!"data"}
!232 = !{!"sizes"}
!233 = !{!"zeroIdxs"}
!234 = !{!"stringConstants"}
!235 = !{!"inlineBuffers", !236, !240, !241}
!236 = !{!"inlineBuffersVec[0]", !237, !238, !239}
!237 = !{!"alignment", i32 0}
!238 = !{!"allocSize", i64 0}
!239 = !{!"Buffer"}
!240 = !{!"inlineBuffersVec[1]", !237, !238, !239}
!241 = !{!"inlineBuffersVec[2]", !237, !238, !239}
!242 = !{!"GlobalBufferAddressRelocInfo"}
!243 = !{!"ConstantBufferAddressRelocInfo"}
!244 = !{!"forceLscCacheList"}
!245 = !{!"SrvMap"}
!246 = !{!"RasterizerOrderedByteAddressBuffer"}
!247 = !{!"RasterizerOrderedViews"}
!248 = !{!"MinNOSPushConstantSize", i32 0}
!249 = !{!"inlineProgramScopeOffsets"}
!250 = !{!"shaderData", !251}
!251 = !{!"numReplicas", i32 0}
!252 = !{!"URBInfo", !253, !254, !255}
!253 = !{!"has64BVertexHeaderInput", i1 false}
!254 = !{!"has64BVertexHeaderOutput", i1 false}
!255 = !{!"hasVertexHeader", i1 true}
!256 = !{!"UseBindlessImage", i1 false}
!257 = !{!"HasBindlessImageRead", i1 false}
!258 = !{!"UseBindlessImageWithSamplerTracking", i1 false}
!259 = !{!"enableRangeReduce", i1 false}
!260 = !{!"allowMatchMadOptimizationforPosition", i1 false}
!261 = !{!"disableMatchMadOptimizationForCS", i1 false}
!262 = !{!"disableMemOptforNegativeOffsetLoads", i1 false}
!263 = !{!"enableThreeWayLoadSpiltOpt", i1 false}
!264 = !{!"statefulResourcesNotAliased", i1 false}
!265 = !{!"disableMixMode", i1 false}
!266 = !{!"genericAccessesResolved", i1 false}
!267 = !{!"disableSeparateSpillPvtScratchSpace", i1 false}
!268 = !{!"enableSeparateSpillPvtScratchSpace", i1 false}
!269 = !{!"disableSeparateScratchWA", i1 false}
!270 = !{!"enableRemoveUnusedTGMFence", i1 false}
!271 = !{!"privateMemoryPerWI", i32 0}
!272 = !{!"PrivateMemoryPerFG"}
!273 = !{!"m_OptsToDisable"}
!274 = !{!"capabilities", !275}
!275 = !{!"globalVariableDecorationsINTEL", i1 false}
!276 = !{!"extensions", !277}
!277 = !{!"spvINTELBindlessImages", i1 false}
!278 = !{!"m_ShaderResourceViewMcsMask", !279, !280}
!279 = !{!"m_ShaderResourceViewMcsMaskVec[0]", i64 0}
!280 = !{!"m_ShaderResourceViewMcsMaskVec[1]", i64 0}
!281 = !{!"computedDepthMode", i32 0}
!282 = !{!"isHDCFastClearShader", i1 false}
!283 = !{!"argRegisterReservations", !284}
!284 = !{!"argRegisterReservationsVec[0]", i32 0}
!285 = !{!"SIMD16_SpillThreshold", i8 0}
!286 = !{!"SIMD32_SpillThreshold", i8 0}
!287 = !{!"m_CacheControlOption", !288, !289, !290, !291}
!288 = !{!"LscLoadCacheControlOverride", i8 0}
!289 = !{!"LscStoreCacheControlOverride", i8 0}
!290 = !{!"TgmLoadCacheControlOverride", i8 0}
!291 = !{!"TgmStoreCacheControlOverride", i8 0}
!292 = !{!"ModuleUsesBindless", i1 false}
!293 = !{!"predicationMap"}
!294 = !{!"lifeTimeStartMap"}
!295 = !{!"HitGroups"}
!296 = !{i32 1, i32 0, i32 0, i32 0, i32 1}
!297 = !{!"none", !"none", !"none", !"none", !"none"}
!298 = !{!"class.sycl::_V1::vec*", !"float", !"float", !"int", !"int*"}
!299 = !{!"", !"", !"", !"", !""}
!300 = !{!301, !3, !3, !3, !301}
!301 = !{!302}
!302 = !{i32 44, i32 4}
!303 = !{i32 32}
!304 = !{!305}
!305 = !{i32 44, i32 16}
!306 = !{!307, !308}
!307 = !{i32 4469}
!308 = !{i32 4470}
!309 = distinct !{!309, !310}
!310 = !{!"llvm.loop.unroll.enable"}
!311 = distinct !{!311, !310}
!312 = distinct !{!312, !310}
!313 = !{!314}
!314 = !{i32 40, i32 196620}
!315 = distinct !{!315, !310}
!316 = distinct !{!316, !310}
!317 = distinct !{!317, !310}
!318 = distinct !{!318, !310}
!319 = distinct !{!319, !310}
!320 = distinct !{!320, !310}
!321 = distinct !{!321, !310}
!322 = distinct !{!322, !310}
!323 = distinct !{!323, !310}
!324 = distinct !{!324, !310}
!325 = distinct !{!325, !310}
!326 = distinct !{!326, !310}
!327 = distinct !{!327, !310}
!328 = distinct !{!328, !310}
!329 = distinct !{!329, !310}
!330 = distinct !{!330, !310}
!331 = distinct !{!331, !310}
!332 = distinct !{!332, !310}
!333 = distinct !{!333, !310}
!334 = distinct !{!334, !310}
!335 = distinct !{!335, !310}
!336 = distinct !{!336, !310}
!337 = distinct !{!337, !310}
!338 = distinct !{!338, !310}
!339 = distinct !{!339, !310}
