; ModuleID = 'loopkernel.cu'
source_filename = "loopkernel.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

; Function Attrs: uwtable
define void @_Z6kernelPiS_(i32* %a, i32* %b) #0 !dbg !535 {
entry:
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !539, metadata !540), !dbg !541
  store i32* %b, i32** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %b.addr, metadata !542, metadata !540), !dbg !543
  %0 = bitcast i32** %a.addr to i8*, !dbg !544
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !544
  %2 = icmp eq i32 %1, 0, !dbg !544
  br i1 %2, label %setup.next, label %setup.end, !dbg !544

setup.next:                                       ; preds = %entry
  %3 = bitcast i32** %b.addr to i8*, !dbg !545
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !545
  %5 = icmp eq i32 %4, 0, !dbg !545
  br i1 %5, label %setup.next1, label %setup.end, !dbg !545

setup.next1:                                      ; preds = %setup.next
  %6 = call i32 @cudaLaunch(i8* bitcast (void (i32*, i32*)* @_Z6kernelPiS_ to i8*)), !dbg !547
  br label %setup.end, !dbg !547

setup.end:                                        ; preds = %setup.next1, %setup.next, %entry
  ret void, !dbg !549
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: norecurse uwtable
define i32 @main() #2 !dbg !550 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [10 x i32], align 16
  %b = alloca [10 x i32], align 16
  %a_d = alloca i32*, align 8
  %b_d = alloca i32*, align 8
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp5 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp5.coerce = alloca { i64, i32 }, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %a, metadata !551, metadata !540), !dbg !555
  %0 = bitcast [10 x i32]* %a to i8*, !dbg !555
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 40, i32 16, i1 false), !dbg !555
  %1 = bitcast i8* %0 to [10 x i32]*, !dbg !555
  %2 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i32 0, !dbg !555
  store i32 2, i32* %2, !dbg !555
  call void @llvm.dbg.declare(metadata [10 x i32]* %b, metadata !556, metadata !540), !dbg !557
  %3 = bitcast [10 x i32]* %b to i8*, !dbg !557
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 40, i32 16, i1 false), !dbg !557
  %4 = bitcast i8* %3 to [10 x i32]*, !dbg !557
  %5 = getelementptr [10 x i32], [10 x i32]* %4, i32 0, i32 0, !dbg !557
  store i32 1, i32* %5, !dbg !557
  call void @llvm.dbg.declare(metadata i32** %a_d, metadata !558, metadata !540), !dbg !559
  call void @llvm.dbg.declare(metadata i32** %b_d, metadata !560, metadata !540), !dbg !561
  %call = call i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(i32** %a_d, i64 40), !dbg !562
  %call1 = call i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(i32** %b_d, i64 40), !dbg !563
  %6 = load i32*, i32** %a_d, align 8, !dbg !564
  %7 = bitcast i32* %6 to i8*, !dbg !564
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %a, i32 0, i32 0, !dbg !565
  %8 = bitcast i32* %arraydecay to i8*, !dbg !565
  %call2 = call i32 @cudaMemcpy(i8* %7, i8* %8, i64 40, i32 1), !dbg !566
  %9 = load i32*, i32** %b_d, align 8, !dbg !567
  %10 = bitcast i32* %9 to i8*, !dbg !567
  %arraydecay3 = getelementptr inbounds [10 x i32], [10 x i32]* %b, i32 0, i32 0, !dbg !568
  %11 = bitcast i32* %arraydecay3 to i8*, !dbg !568
  %call4 = call i32 @cudaMemcpy(i8* %10, i8* %11, i64 40, i32 1), !dbg !569
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 10, i32 1, i32 1), !dbg !570
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp5, i32 1, i32 1, i32 1), !dbg !571
  %12 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !573
  %13 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !573
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 12, i32 4, i1 false), !dbg !574
  %14 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !573
  %15 = load i64, i64* %14, align 4, !dbg !573
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !573
  %17 = load i32, i32* %16, align 4, !dbg !573
  %18 = bitcast { i64, i32 }* %agg.tmp5.coerce to i8*, !dbg !573
  %19 = bitcast %struct.dim3* %agg.tmp5 to i8*, !dbg !573
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 12, i32 4, i1 false), !dbg !576
  %20 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp5.coerce, i32 0, i32 0, !dbg !573
  %21 = load i64, i64* %20, align 4, !dbg !573
  %22 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp5.coerce, i32 0, i32 1, !dbg !573
  %23 = load i32, i32* %22, align 4, !dbg !573
  %call6 = call i32 @cudaConfigureCall(i64 %15, i32 %17, i64 %21, i32 %23, i64 0, %struct.CUstream_st* null), !dbg !578
  %tobool = icmp ne i32 %call6, 0, !dbg !573
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !580

kcall.configok:                                   ; preds = %entry
  %arraydecay7 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i32 0, i32 0, !dbg !581
  %arraydecay8 = getelementptr inbounds [10 x i32], [10 x i32]* %b, i32 0, i32 0, !dbg !583
  call void @_Z6kernelPiS_(i32* %arraydecay7, i32* %arraydecay8), !dbg !584
  br label %kcall.end, !dbg !584

kcall.end:                                        ; preds = %kcall.configok, %entry
  %arraydecay9 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i32 0, i32 0, !dbg !585
  %24 = bitcast i32* %arraydecay9 to i8*, !dbg !585
  %25 = load i32*, i32** %a_d, align 8, !dbg !586
  %26 = bitcast i32* %25 to i8*, !dbg !586
  %call10 = call i32 @cudaMemcpy(i8* %24, i8* %26, i64 40, i32 2), !dbg !587
  %27 = load i32*, i32** %a_d, align 8, !dbg !588
  %28 = bitcast i32* %27 to i8*, !dbg !588
  %call11 = call i32 @cudaFree(i8* %28), !dbg !589
  %29 = load i32*, i32** %b_d, align 8, !dbg !590
  %30 = bitcast i32* %29 to i8*, !dbg !590
  %call12 = call i32 @cudaFree(i8* %30), !dbg !591
  %31 = load i32, i32* %retval, align 4, !dbg !592
  ret i32 %31, !dbg !592
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: inlinehint uwtable
define internal i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(i32** %devPtr, i64 %size) #4 !dbg !593 {
entry:
  %devPtr.addr = alloca i32**, align 8
  %size.addr = alloca i64, align 8
  store i32** %devPtr, i32*** %devPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %devPtr.addr, metadata !601, metadata !540), !dbg !602
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !603, metadata !540), !dbg !604
  %0 = load i32**, i32*** %devPtr.addr, align 8, !dbg !605
  %1 = bitcast i32** %0 to i8*, !dbg !605
  %2 = bitcast i8* %1 to i8**, !dbg !606
  %3 = load i64, i64* %size.addr, align 8, !dbg !607
  %call = call i32 @cudaMalloc(i8** %2, i64 %3), !dbg !608
  ret i32 %call, !dbg !609
}

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #5

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #5

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #6 comdat align 2 !dbg !610 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !633, metadata !540), !dbg !635
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !636, metadata !540), !dbg !637
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !638, metadata !540), !dbg !639
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !640, metadata !540), !dbg !641
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !642
  %0 = load i32, i32* %vx.addr, align 4, !dbg !643
  store i32 %0, i32* %x, align 4, !dbg !642
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !644
  %1 = load i32, i32* %vy.addr, align 4, !dbg !645
  store i32 %1, i32* %y, align 4, !dbg !644
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !646
  %2 = load i32, i32* %vz.addr, align 4, !dbg !647
  store i32 %2, i32* %z, align 4, !dbg !646
  ret void, !dbg !648
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

declare i32 @cudaFree(i8*) #5

declare i32 @cudaMalloc(i8**, i64) #5

attributes #0 = { uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { norecurse uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { inlinehint uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!532, !533}
!llvm.ident = !{!534}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 0c0654cbe42ce8060cf9bfeea18254aa37aceca3) (http://llvm.org/git/llvm.git 008f70d21cc2b33cebd1d4443052e62d3fbea6e8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !93, imports: !96)
!1 = !DIFile(filename: "loopkernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test")
!2 = !{!3, !11}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !4, line: 797, size: 32, align: 32, elements: !5, identifier: "_ZTS14cudaMemcpyKind")
!4 = !DIFile(filename: "/usr/local/cuda-7.5/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!5 = !{!6, !7, !8, !9, !10}
!6 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!7 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!8 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!10 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !4, line: 151, size: 32, align: 32, elements: !12, identifier: "_ZTS9cudaError")
!12 = !{!13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92}
!13 = !DIEnumerator(name: "cudaSuccess", value: 0)
!14 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 1)
!15 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2)
!16 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3)
!17 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 4)
!18 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 5)
!19 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 6)
!20 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 7)
!21 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 8)
!22 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9)
!23 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 10)
!24 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 11)
!25 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12)
!26 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13)
!27 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 14)
!28 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 15)
!29 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16)
!30 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17)
!31 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18)
!32 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19)
!33 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20)
!34 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21)
!35 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22)
!36 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23)
!37 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24)
!38 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25)
!39 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26)
!40 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27)
!41 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28)
!42 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 29)
!43 = !DIEnumerator(name: "cudaErrorUnknown", value: 30)
!44 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31)
!45 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32)
!46 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 33)
!47 = !DIEnumerator(name: "cudaErrorNotReady", value: 34)
!48 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35)
!49 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 36)
!50 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37)
!51 = !DIEnumerator(name: "cudaErrorNoDevice", value: 38)
!52 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 39)
!53 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 40)
!54 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 41)
!55 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 42)
!56 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43)
!57 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44)
!58 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45)
!59 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46)
!60 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 47)
!61 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 48)
!62 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49)
!63 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 50)
!64 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 51)
!65 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 54)
!66 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 55)
!67 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 56)
!68 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 57)
!69 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 58)
!70 = !DIEnumerator(name: "cudaErrorAssert", value: 59)
!71 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 60)
!72 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 61)
!73 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 62)
!74 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 63)
!75 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 64)
!76 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65)
!77 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66)
!78 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67)
!79 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68)
!80 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69)
!81 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 70)
!82 = !DIEnumerator(name: "cudaErrorNotSupported", value: 71)
!83 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 72)
!84 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 73)
!85 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 74)
!86 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 75)
!87 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 76)
!88 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 77)
!89 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 78)
!90 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 79)
!91 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127)
!92 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000)
!93 = !{!94, !95}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64, align: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!96 = !{!97, !104, !109, !111, !113, !115, !117, !121, !123, !125, !127, !129, !131, !133, !135, !137, !139, !141, !143, !145, !147, !149, !153, !155, !157, !159, !164, !169, !171, !173, !178, !182, !184, !186, !188, !190, !192, !194, !196, !198, !203, !207, !209, !211, !215, !217, !219, !221, !223, !225, !229, !231, !236, !244, !248, !250, !252, !254, !256, !258, !262, !264, !266, !270, !272, !274, !276, !278, !280, !282, !284, !286, !288, !293, !295, !297, !301, !303, !305, !307, !309, !311, !313, !315, !319, !323, !325, !327, !332, !334, !336, !338, !340, !342, !344, !348, !354, !358, !362, !367, !369, !373, !377, !390, !394, !398, !402, !406, !411, !413, !417, !421, !425, !433, !437, !441, !445, !449, !454, !460, !464, !468, !470, !478, !482, !490, !492, !494, !498, !502, !506, !511, !515, !520, !521, !522, !523, !526, !527, !528, !529, !530, !531}
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !100, line: 187)
!98 = !DINamespace(name: "std", scope: null, file: !99, line: 186)
!99 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!100 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !99, file: !99, line: 44, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!101 = !DISubroutineType(types: !102)
!102 = !{!103, !103}
!103 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !105, line: 188)
!105 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !99, file: !99, line: 46, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DISubroutineType(types: !107)
!107 = !{!108, !108}
!108 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !110, line: 189)
!110 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !99, file: !99, line: 48, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !112, line: 190)
!112 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !99, file: !99, line: 50, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !114, line: 191)
!114 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !99, file: !99, line: 52, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !116, line: 192)
!116 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !99, file: !99, line: 56, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !118, line: 193)
!118 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !99, file: !99, line: 54, type: !119, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!119 = !DISubroutineType(types: !120)
!120 = !{!108, !108, !108}
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !122, line: 194)
!122 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !99, file: !99, line: 58, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !124, line: 195)
!124 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !99, file: !99, line: 60, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !126, line: 196)
!126 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !99, file: !99, line: 62, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !128, line: 197)
!128 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !99, file: !99, line: 64, type: !119, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !130, line: 198)
!130 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !99, file: !99, line: 66, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !132, line: 199)
!132 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !99, file: !99, line: 68, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !134, line: 200)
!134 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !99, file: !99, line: 72, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !136, line: 201)
!136 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !99, file: !99, line: 70, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !138, line: 202)
!138 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !99, file: !99, line: 76, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !140, line: 203)
!140 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !99, file: !99, line: 74, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !142, line: 204)
!142 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !99, file: !99, line: 78, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !144, line: 205)
!144 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !99, file: !99, line: 80, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !146, line: 206)
!146 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !99, file: !99, line: 82, type: !119, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !148, line: 207)
!148 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !99, file: !99, line: 84, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !150, line: 208)
!150 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !99, file: !99, line: 86, type: !151, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DISubroutineType(types: !152)
!152 = !{!108, !108, !108, !108}
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !154, line: 209)
!154 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !99, file: !99, line: 88, type: !119, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !156, line: 210)
!156 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !99, file: !99, line: 90, type: !119, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !158, line: 211)
!158 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !99, file: !99, line: 92, type: !119, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !160, line: 212)
!160 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !99, file: !99, line: 94, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DISubroutineType(types: !162)
!162 = !{!163, !108}
!163 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !165, line: 213)
!165 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !99, file: !99, line: 96, type: !166, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DISubroutineType(types: !167)
!167 = !{!108, !108, !168}
!168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64, align: 64)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !170, line: 214)
!170 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !99, file: !99, line: 98, type: !119, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !172, line: 215)
!172 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !99, file: !99, line: 100, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !174, line: 216)
!174 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !99, file: !99, line: 102, type: !175, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DISubroutineType(types: !176)
!176 = !{!177, !108}
!177 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !179, line: 217)
!179 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !99, file: !99, line: 106, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DISubroutineType(types: !181)
!181 = !{!177, !108, !108}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !183, line: 218)
!183 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !99, file: !99, line: 105, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !185, line: 219)
!185 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !99, file: !99, line: 108, type: !175, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !187, line: 220)
!187 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !99, file: !99, line: 112, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !189, line: 221)
!189 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !99, file: !99, line: 111, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !191, line: 222)
!191 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !99, file: !99, line: 114, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !193, line: 223)
!193 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !99, file: !99, line: 116, type: !175, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !195, line: 224)
!195 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !99, file: !99, line: 118, type: !175, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !197, line: 225)
!197 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !99, file: !99, line: 120, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !199, line: 226)
!199 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !99, file: !99, line: 121, type: !200, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DISubroutineType(types: !201)
!201 = !{!202, !202}
!202 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !204, line: 227)
!204 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !99, file: !99, line: 123, type: !205, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DISubroutineType(types: !206)
!206 = !{!108, !108, !163}
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !208, line: 228)
!208 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !99, file: !99, line: 125, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !210, line: 229)
!210 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !99, file: !99, line: 126, type: !101, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !212, line: 230)
!212 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !99, file: !99, line: 128, type: !213, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DISubroutineType(types: !214)
!214 = !{!103, !108}
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !216, line: 231)
!216 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !99, file: !99, line: 138, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !218, line: 232)
!218 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !99, file: !99, line: 130, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !220, line: 233)
!220 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !99, file: !99, line: 132, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !222, line: 234)
!222 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !99, file: !99, line: 134, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !224, line: 235)
!224 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !99, file: !99, line: 136, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !226, line: 236)
!226 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !99, file: !99, line: 140, type: !227, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DISubroutineType(types: !228)
!228 = !{!202, !108}
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !230, line: 237)
!230 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !99, file: !99, line: 142, type: !227, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !232, line: 238)
!232 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !99, file: !99, line: 144, type: !233, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DISubroutineType(types: !234)
!234 = !{!108, !108, !235}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64, align: 64)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !237, line: 239)
!237 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !99, file: !99, line: 145, type: !238, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DISubroutineType(types: !239)
!239 = !{!240, !241}
!240 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !242, size: 64, align: 64)
!242 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !243)
!243 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !245, line: 240)
!245 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !99, file: !99, line: 146, type: !246, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DISubroutineType(types: !247)
!247 = !{!108, !241}
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !249, line: 241)
!249 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !99, file: !99, line: 148, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !251, line: 242)
!251 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !99, file: !99, line: 150, type: !119, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !253, line: 243)
!253 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardff", scope: !99, file: !99, line: 152, type: !119, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !255, line: 244)
!255 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !99, file: !99, line: 156, type: !205, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !257, line: 245)
!257 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !99, file: !99, line: 158, type: !119, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !259, line: 246)
!259 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !99, file: !99, line: 160, type: !260, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DISubroutineType(types: !261)
!261 = !{!108, !108, !108, !168}
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !263, line: 247)
!263 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !99, file: !99, line: 162, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !265, line: 248)
!265 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !99, file: !99, line: 164, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !267, line: 249)
!267 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !99, file: !99, line: 166, type: !268, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DISubroutineType(types: !269)
!269 = !{!108, !108, !202}
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !271, line: 250)
!271 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !99, file: !99, line: 168, type: !205, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !273, line: 251)
!273 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !99, file: !99, line: 170, type: !175, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !275, line: 252)
!275 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !99, file: !99, line: 172, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !277, line: 253)
!277 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !99, file: !99, line: 174, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !279, line: 254)
!279 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !99, file: !99, line: 176, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !281, line: 255)
!281 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !99, file: !99, line: 178, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !283, line: 256)
!283 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !99, file: !99, line: 180, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !285, line: 257)
!285 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !99, file: !99, line: 182, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !287, line: 258)
!287 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !99, file: !99, line: 184, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !289, line: 102)
!289 = !DISubprogram(name: "acos", scope: !290, file: !290, line: 54, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!291 = !DISubroutineType(types: !292)
!292 = !{!240, !240}
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !294, line: 121)
!294 = !DISubprogram(name: "asin", scope: !290, file: !290, line: 56, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !296, line: 140)
!296 = !DISubprogram(name: "atan", scope: !290, file: !290, line: 58, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !298, line: 159)
!298 = !DISubprogram(name: "atan2", scope: !290, file: !290, line: 60, type: !299, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DISubroutineType(types: !300)
!300 = !{!240, !240, !240}
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !302, line: 180)
!302 = !DISubprogram(name: "ceil", scope: !290, file: !290, line: 178, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !304, line: 199)
!304 = !DISubprogram(name: "cos", scope: !290, file: !290, line: 63, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !306, line: 218)
!306 = !DISubprogram(name: "cosh", scope: !290, file: !290, line: 72, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !308, line: 237)
!308 = !DISubprogram(name: "exp", scope: !290, file: !290, line: 100, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !310, line: 256)
!310 = !DISubprogram(name: "fabs", scope: !290, file: !290, line: 181, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !312, line: 275)
!312 = !DISubprogram(name: "floor", scope: !290, file: !290, line: 184, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !314, line: 294)
!314 = !DISubprogram(name: "fmod", scope: !290, file: !290, line: 187, type: !299, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !316, line: 315)
!316 = !DISubprogram(name: "frexp", scope: !290, file: !290, line: 103, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!317 = !DISubroutineType(types: !318)
!318 = !{!240, !240, !168}
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !320, line: 334)
!320 = !DISubprogram(name: "ldexp", scope: !290, file: !290, line: 106, type: !321, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!321 = !DISubroutineType(types: !322)
!322 = !{!240, !240, !163}
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !324, line: 353)
!324 = !DISubprogram(name: "log", scope: !290, file: !290, line: 109, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !326, line: 372)
!326 = !DISubprogram(name: "log10", scope: !290, file: !290, line: 112, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !328, line: 391)
!328 = !DISubprogram(name: "modf", scope: !290, file: !290, line: 115, type: !329, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!329 = !DISubroutineType(types: !330)
!330 = !{!240, !240, !331}
!331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64, align: 64)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !333, line: 403)
!333 = !DISubprogram(name: "pow", scope: !290, file: !290, line: 153, type: !299, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !335, line: 440)
!335 = !DISubprogram(name: "sin", scope: !290, file: !290, line: 65, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !337, line: 459)
!337 = !DISubprogram(name: "sinh", scope: !290, file: !290, line: 74, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !339, line: 478)
!339 = !DISubprogram(name: "sqrt", scope: !290, file: !290, line: 156, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !341, line: 497)
!341 = !DISubprogram(name: "tan", scope: !290, file: !290, line: 67, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !343, line: 516)
!343 = !DISubprogram(name: "tanh", scope: !290, file: !290, line: 76, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !345, line: 118)
!345 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !346, line: 101, baseType: !347)
!346 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!347 = !DICompositeType(tag: DW_TAG_structure_type, file: !346, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !349, line: 119)
!349 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !346, line: 109, baseType: !350)
!350 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !346, line: 105, size: 128, align: 64, elements: !351, identifier: "_ZTS6ldiv_t")
!351 = !{!352, !353}
!352 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !350, file: !346, line: 107, baseType: !202, size: 64, align: 64)
!353 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !350, file: !346, line: 108, baseType: !202, size: 64, align: 64, offset: 64)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !355, line: 121)
!355 = !DISubprogram(name: "abort", scope: !346, file: !346, line: 515, type: !356, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !DISubroutineType(types: !357)
!357 = !{null}
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !359, line: 122)
!359 = !DISubprogram(name: "abs", scope: !346, file: !346, line: 774, type: !360, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DISubroutineType(types: !361)
!361 = !{!163, !163}
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !363, line: 123)
!363 = !DISubprogram(name: "atexit", scope: !346, file: !346, line: 519, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{!163, !366}
!366 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !356, size: 64, align: 64)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !368, line: 129)
!368 = !DISubprogram(name: "atof", scope: !346, file: !346, line: 144, type: !238, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !370, line: 130)
!370 = !DISubprogram(name: "atoi", scope: !346, file: !346, line: 147, type: !371, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!371 = !DISubroutineType(types: !372)
!372 = !{!163, !241}
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !374, line: 131)
!374 = !DISubprogram(name: "atol", scope: !346, file: !346, line: 150, type: !375, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!375 = !DISubroutineType(types: !376)
!376 = !{!202, !241}
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !378, line: 132)
!378 = !DISubprogram(name: "bsearch", scope: !346, file: !346, line: 754, type: !379, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!379 = !DISubroutineType(types: !380)
!380 = !{!95, !381, !381, !383, !383, !386}
!381 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !382, size: 64, align: 64)
!382 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!383 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !384, line: 62, baseType: !385)
!384 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!385 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!386 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !346, line: 741, baseType: !387)
!387 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !388, size: 64, align: 64)
!388 = !DISubroutineType(types: !389)
!389 = !{!163, !381, !381}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !391, line: 133)
!391 = !DISubprogram(name: "calloc", scope: !346, file: !346, line: 468, type: !392, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!392 = !DISubroutineType(types: !393)
!393 = !{!95, !383, !383}
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !395, line: 134)
!395 = !DISubprogram(name: "div", scope: !346, file: !346, line: 788, type: !396, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!396 = !DISubroutineType(types: !397)
!397 = !{!345, !163, !163}
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !399, line: 135)
!399 = !DISubprogram(name: "exit", scope: !346, file: !346, line: 543, type: !400, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!400 = !DISubroutineType(types: !401)
!401 = !{null, !163}
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !403, line: 136)
!403 = !DISubprogram(name: "free", scope: !346, file: !346, line: 483, type: !404, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!404 = !DISubroutineType(types: !405)
!405 = !{null, !95}
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !407, line: 137)
!407 = !DISubprogram(name: "getenv", scope: !346, file: !346, line: 564, type: !408, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!408 = !DISubroutineType(types: !409)
!409 = !{!410, !241}
!410 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !243, size: 64, align: 64)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !412, line: 138)
!412 = !DISubprogram(name: "labs", scope: !346, file: !346, line: 775, type: !200, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !414, line: 139)
!414 = !DISubprogram(name: "ldiv", scope: !346, file: !346, line: 790, type: !415, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!415 = !DISubroutineType(types: !416)
!416 = !{!349, !202, !202}
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !418, line: 140)
!418 = !DISubprogram(name: "malloc", scope: !346, file: !346, line: 466, type: !419, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!419 = !DISubroutineType(types: !420)
!420 = !{!95, !383}
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !422, line: 142)
!422 = !DISubprogram(name: "mblen", scope: !346, file: !346, line: 862, type: !423, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!423 = !DISubroutineType(types: !424)
!424 = !{!163, !241, !383}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !426, line: 143)
!426 = !DISubprogram(name: "mbstowcs", scope: !346, file: !346, line: 873, type: !427, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!427 = !DISubroutineType(types: !428)
!428 = !{!383, !429, !432, !383}
!429 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !430)
!430 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !431, size: 64, align: 64)
!431 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!432 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !241)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !434, line: 144)
!434 = !DISubprogram(name: "mbtowc", scope: !346, file: !346, line: 865, type: !435, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!435 = !DISubroutineType(types: !436)
!436 = !{!163, !429, !432, !383}
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !438, line: 146)
!438 = !DISubprogram(name: "qsort", scope: !346, file: !346, line: 764, type: !439, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!439 = !DISubroutineType(types: !440)
!440 = !{null, !95, !383, !383, !386}
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !442, line: 152)
!442 = !DISubprogram(name: "rand", scope: !346, file: !346, line: 374, type: !443, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!443 = !DISubroutineType(types: !444)
!444 = !{!163}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !446, line: 153)
!446 = !DISubprogram(name: "realloc", scope: !346, file: !346, line: 480, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DISubroutineType(types: !448)
!448 = !{!95, !95, !383}
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !450, line: 154)
!450 = !DISubprogram(name: "srand", scope: !346, file: !346, line: 376, type: !451, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!451 = !DISubroutineType(types: !452)
!452 = !{null, !453}
!453 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !455, line: 155)
!455 = !DISubprogram(name: "strtod", scope: !346, file: !346, line: 164, type: !456, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DISubroutineType(types: !457)
!457 = !{!240, !432, !458}
!458 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !459)
!459 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !410, size: 64, align: 64)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !461, line: 156)
!461 = !DISubprogram(name: "strtol", scope: !346, file: !346, line: 183, type: !462, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!462 = !DISubroutineType(types: !463)
!463 = !{!202, !432, !458, !163}
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !465, line: 157)
!465 = !DISubprogram(name: "strtoul", scope: !346, file: !346, line: 187, type: !466, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!466 = !DISubroutineType(types: !467)
!467 = !{!385, !432, !458, !163}
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !469, line: 158)
!469 = !DISubprogram(name: "system", scope: !346, file: !346, line: 716, type: !371, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !471, line: 160)
!471 = !DISubprogram(name: "wcstombs", scope: !346, file: !346, line: 876, type: !472, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!472 = !DISubroutineType(types: !473)
!473 = !{!383, !474, !475, !383}
!474 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !410)
!475 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !476)
!476 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !477, size: 64, align: 64)
!477 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !431)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !479, line: 161)
!479 = !DISubprogram(name: "wctomb", scope: !346, file: !346, line: 869, type: !480, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!480 = !DISubroutineType(types: !481)
!481 = !{!163, !410, !431}
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !483, entity: !485, line: 214)
!483 = !DINamespace(name: "__gnu_cxx", scope: null, file: !484, line: 220)
!484 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!485 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !346, line: 121, baseType: !486)
!486 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !346, line: 117, size: 128, align: 64, elements: !487, identifier: "_ZTS7lldiv_t")
!487 = !{!488, !489}
!488 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !486, file: !346, line: 119, baseType: !103, size: 64, align: 64)
!489 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !486, file: !346, line: 120, baseType: !103, size: 64, align: 64, offset: 64)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !483, entity: !491, line: 220)
!491 = !DISubprogram(name: "_Exit", scope: !346, file: !346, line: 557, type: !400, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !483, entity: !493, line: 224)
!493 = !DISubprogram(name: "llabs", scope: !346, file: !346, line: 779, type: !101, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !483, entity: !495, line: 230)
!495 = !DISubprogram(name: "lldiv", scope: !346, file: !346, line: 796, type: !496, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DISubroutineType(types: !497)
!497 = !{!485, !103, !103}
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !483, entity: !499, line: 241)
!499 = !DISubprogram(name: "atoll", scope: !346, file: !346, line: 157, type: !500, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DISubroutineType(types: !501)
!501 = !{!103, !241}
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !483, entity: !503, line: 242)
!503 = !DISubprogram(name: "strtoll", scope: !346, file: !346, line: 209, type: !504, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DISubroutineType(types: !505)
!505 = !{!103, !432, !458, !163}
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !483, entity: !507, line: 243)
!507 = !DISubprogram(name: "strtoull", scope: !346, file: !346, line: 214, type: !508, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DISubroutineType(types: !509)
!509 = !{!510, !432, !458, !163}
!510 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !483, entity: !512, line: 245)
!512 = !DISubprogram(name: "strtof", scope: !346, file: !346, line: 172, type: !513, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DISubroutineType(types: !514)
!514 = !{!108, !432, !458}
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !483, entity: !516, line: 246)
!516 = !DISubprogram(name: "strtold", scope: !346, file: !346, line: 175, type: !517, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!517 = !DISubroutineType(types: !518)
!518 = !{!519, !432, !458}
!519 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !485, line: 254)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !491, line: 256)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !493, line: 258)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !524, line: 259)
!524 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !483, file: !525, line: 227, type: !496, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!525 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test")
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !495, line: 260)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !499, line: 262)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !512, line: 263)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !503, line: 264)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !507, line: 265)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !98, entity: !516, line: 266)
!532 = !{i32 2, !"Dwarf Version", i32 4}
!533 = !{i32 2, !"Debug Info Version", i32 3}
!534 = !{!"clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 0c0654cbe42ce8060cf9bfeea18254aa37aceca3) (http://llvm.org/git/llvm.git 008f70d21cc2b33cebd1d4443052e62d3fbea6e8)"}
!535 = distinct !DISubprogram(name: "kernel", linkageName: "_Z6kernelPiS_", scope: !1, file: !1, line: 3, type: !536, isLocal: false, isDefinition: true, scopeLine: 3, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !538)
!536 = !DISubroutineType(types: !537)
!537 = !{null, !168, !168}
!538 = !{}
!539 = !DILocalVariable(name: "a", arg: 1, scope: !535, file: !1, line: 3, type: !168)
!540 = !DIExpression()
!541 = !DILocation(line: 3, column: 18, scope: !535)
!542 = !DILocalVariable(name: "b", arg: 2, scope: !535, file: !1, line: 3, type: !168)
!543 = !DILocation(line: 3, column: 26, scope: !535)
!544 = !DILocation(line: 3, column: 29, scope: !535)
!545 = !DILocation(line: 3, column: 29, scope: !546)
!546 = !DILexicalBlockFile(scope: !535, file: !1, discriminator: 1)
!547 = !DILocation(line: 3, column: 29, scope: !548)
!548 = !DILexicalBlockFile(scope: !535, file: !1, discriminator: 2)
!549 = !DILocation(line: 11, column: 1, scope: !535)
!550 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 13, type: !443, isLocal: false, isDefinition: true, scopeLine: 14, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !538)
!551 = !DILocalVariable(name: "a", scope: !550, file: !1, line: 15, type: !552)
!552 = !DICompositeType(tag: DW_TAG_array_type, baseType: !163, size: 320, align: 32, elements: !553)
!553 = !{!554}
!554 = !DISubrange(count: 10)
!555 = !DILocation(line: 15, column: 9, scope: !550)
!556 = !DILocalVariable(name: "b", scope: !550, file: !1, line: 16, type: !552)
!557 = !DILocation(line: 16, column: 9, scope: !550)
!558 = !DILocalVariable(name: "a_d", scope: !550, file: !1, line: 18, type: !168)
!559 = !DILocation(line: 18, column: 10, scope: !550)
!560 = !DILocalVariable(name: "b_d", scope: !550, file: !1, line: 19, type: !168)
!561 = !DILocation(line: 19, column: 10, scope: !550)
!562 = !DILocation(line: 20, column: 5, scope: !550)
!563 = !DILocation(line: 21, column: 5, scope: !550)
!564 = !DILocation(line: 22, column: 16, scope: !550)
!565 = !DILocation(line: 22, column: 21, scope: !550)
!566 = !DILocation(line: 22, column: 5, scope: !550)
!567 = !DILocation(line: 23, column: 16, scope: !550)
!568 = !DILocation(line: 23, column: 21, scope: !550)
!569 = !DILocation(line: 23, column: 5, scope: !550)
!570 = !DILocation(line: 24, column: 14, scope: !550)
!571 = !DILocation(line: 24, column: 17, scope: !572)
!572 = !DILexicalBlockFile(scope: !550, file: !1, discriminator: 2)
!573 = !DILocation(line: 24, column: 11, scope: !550)
!574 = !DILocation(line: 24, column: 11, scope: !575)
!575 = !DILexicalBlockFile(scope: !550, file: !1, discriminator: 3)
!576 = !DILocation(line: 24, column: 11, scope: !577)
!577 = !DILexicalBlockFile(scope: !550, file: !1, discriminator: 4)
!578 = !DILocation(line: 24, column: 11, scope: !579)
!579 = !DILexicalBlockFile(scope: !550, file: !1, discriminator: 5)
!580 = !DILocation(line: 24, column: 5, scope: !550)
!581 = !DILocation(line: 24, column: 22, scope: !582)
!582 = !DILexicalBlockFile(scope: !550, file: !1, discriminator: 1)
!583 = !DILocation(line: 24, column: 24, scope: !582)
!584 = !DILocation(line: 24, column: 5, scope: !582)
!585 = !DILocation(line: 25, column: 16, scope: !550)
!586 = !DILocation(line: 25, column: 19, scope: !550)
!587 = !DILocation(line: 25, column: 5, scope: !550)
!588 = !DILocation(line: 26, column: 14, scope: !550)
!589 = !DILocation(line: 26, column: 5, scope: !550)
!590 = !DILocation(line: 27, column: 14, scope: !550)
!591 = !DILocation(line: 27, column: 5, scope: !550)
!592 = !DILocation(line: 28, column: 1, scope: !550)
!593 = distinct !DISubprogram(name: "cudaMalloc<int>", linkageName: "_ZL10cudaMallocIiE9cudaErrorPPT_m", scope: !594, file: !594, line: 498, type: !595, isLocal: true, isDefinition: true, scopeLine: 502, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !599, variables: !538)
!594 = !DIFile(filename: "/usr/local/cuda-7.5/include/cuda_runtime.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!595 = !DISubroutineType(types: !596)
!596 = !{!597, !598, !383}
!597 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !4, line: 1420, baseType: !11)
!598 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64, align: 64)
!599 = !{!600}
!600 = !DITemplateTypeParameter(name: "T", type: !163)
!601 = !DILocalVariable(name: "devPtr", arg: 1, scope: !593, file: !594, line: 499, type: !598)
!602 = !DILocation(line: 499, column: 12, scope: !593)
!603 = !DILocalVariable(name: "size", arg: 2, scope: !593, file: !594, line: 500, type: !383)
!604 = !DILocation(line: 500, column: 12, scope: !593)
!605 = !DILocation(line: 503, column: 38, scope: !593)
!606 = !DILocation(line: 503, column: 23, scope: !593)
!607 = !DILocation(line: 503, column: 46, scope: !593)
!608 = !DILocation(line: 503, column: 10, scope: !593)
!609 = !DILocation(line: 503, column: 3, scope: !593)
!610 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !612, file: !611, line: 421, type: !618, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !617, variables: !538)
!611 = !DIFile(filename: "/usr/local/cuda-7.5/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!612 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !611, line: 417, size: 96, align: 32, elements: !613, identifier: "_ZTS4dim3")
!613 = !{!614, !615, !616, !617, !621, !630}
!614 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !612, file: !611, line: 419, baseType: !453, size: 32, align: 32)
!615 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !612, file: !611, line: 419, baseType: !453, size: 32, align: 32, offset: 32)
!616 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !612, file: !611, line: 419, baseType: !453, size: 32, align: 32, offset: 64)
!617 = !DISubprogram(name: "dim3", scope: !612, file: !611, line: 421, type: !618, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!618 = !DISubroutineType(types: !619)
!619 = !{null, !620, !453, !453, !453}
!620 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !612, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!621 = !DISubprogram(name: "dim3", scope: !612, file: !611, line: 422, type: !622, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!622 = !DISubroutineType(types: !623)
!623 = !{null, !620, !624}
!624 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !611, line: 383, baseType: !625)
!625 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !611, line: 190, size: 96, align: 32, elements: !626, identifier: "_ZTS5uint3")
!626 = !{!627, !628, !629}
!627 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !625, file: !611, line: 192, baseType: !453, size: 32, align: 32)
!628 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !625, file: !611, line: 192, baseType: !453, size: 32, align: 32, offset: 32)
!629 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !625, file: !611, line: 192, baseType: !453, size: 32, align: 32, offset: 64)
!630 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !612, file: !611, line: 423, type: !631, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!631 = !DISubroutineType(types: !632)
!632 = !{!624, !620}
!633 = !DILocalVariable(name: "this", arg: 1, scope: !610, type: !634, flags: DIFlagArtificial | DIFlagObjectPointer)
!634 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !612, size: 64, align: 64)
!635 = !DILocation(line: 0, scope: !610)
!636 = !DILocalVariable(name: "vx", arg: 2, scope: !610, file: !611, line: 421, type: !453)
!637 = !DILocation(line: 421, column: 43, scope: !610)
!638 = !DILocalVariable(name: "vy", arg: 3, scope: !610, file: !611, line: 421, type: !453)
!639 = !DILocation(line: 421, column: 64, scope: !610)
!640 = !DILocalVariable(name: "vz", arg: 4, scope: !610, file: !611, line: 421, type: !453)
!641 = !DILocation(line: 421, column: 85, scope: !610)
!642 = !DILocation(line: 421, column: 95, scope: !610)
!643 = !DILocation(line: 421, column: 97, scope: !610)
!644 = !DILocation(line: 421, column: 102, scope: !610)
!645 = !DILocation(line: 421, column: 104, scope: !610)
!646 = !DILocation(line: 421, column: 109, scope: !610)
!647 = !DILocation(line: 421, column: 111, scope: !610)
!648 = !DILocation(line: 421, column: 116, scope: !610)
