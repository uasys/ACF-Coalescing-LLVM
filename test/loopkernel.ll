; ModuleID = 'loopkernel.cu'
source_filename = "loopkernel.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

; Function Attrs: uwtable
define void @_Z6kernelPiS_(i32* %a, i32* %b) #0 !dbg !657 {
entry:
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  store i32* %a, i32** %a.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %a.addr, metadata !661, metadata !662), !dbg !663
  store i32* %b, i32** %b.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %b.addr, metadata !664, metadata !662), !dbg !665
  %0 = bitcast i32** %a.addr to i8*, !dbg !666
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !666
  %2 = icmp eq i32 %1, 0, !dbg !666
  br i1 %2, label %setup.next, label %setup.end, !dbg !666

setup.next:                                       ; preds = %entry
  %3 = bitcast i32** %b.addr to i8*, !dbg !667
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !667
  %5 = icmp eq i32 %4, 0, !dbg !667
  br i1 %5, label %setup.next1, label %setup.end, !dbg !667

setup.next1:                                      ; preds = %setup.next
  %6 = call i32 @cudaLaunch(i8* bitcast (void (i32*, i32*)* @_Z6kernelPiS_ to i8*)), !dbg !669
  br label %setup.end, !dbg !669

setup.end:                                        ; preds = %setup.next1, %setup.next, %entry
  ret void, !dbg !671
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: norecurse uwtable
define i32 @main() #2 !dbg !672 {
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
  call void @llvm.dbg.declare(metadata [10 x i32]* %a, metadata !673, metadata !662), !dbg !677
  %0 = bitcast [10 x i32]* %a to i8*, !dbg !677
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 40, i32 16, i1 false), !dbg !677
  %1 = bitcast i8* %0 to [10 x i32]*, !dbg !677
  %2 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i32 0, !dbg !677
  store i32 2, i32* %2, !dbg !677
  call void @llvm.dbg.declare(metadata [10 x i32]* %b, metadata !678, metadata !662), !dbg !679
  %3 = bitcast [10 x i32]* %b to i8*, !dbg !679
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 40, i32 16, i1 false), !dbg !679
  %4 = bitcast i8* %3 to [10 x i32]*, !dbg !679
  %5 = getelementptr [10 x i32], [10 x i32]* %4, i32 0, i32 0, !dbg !679
  store i32 1, i32* %5, !dbg !679
  call void @llvm.dbg.declare(metadata i32** %a_d, metadata !680, metadata !662), !dbg !681
  call void @llvm.dbg.declare(metadata i32** %b_d, metadata !682, metadata !662), !dbg !683
  %call = call i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(i32** %a_d, i64 40), !dbg !684
  %call1 = call i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(i32** %b_d, i64 40), !dbg !685
  %6 = load i32*, i32** %a_d, align 8, !dbg !686
  %7 = bitcast i32* %6 to i8*, !dbg !686
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %a, i32 0, i32 0, !dbg !687
  %8 = bitcast i32* %arraydecay to i8*, !dbg !687
  %call2 = call i32 @cudaMemcpy(i8* %7, i8* %8, i64 40, i32 1), !dbg !688
  %9 = load i32*, i32** %b_d, align 8, !dbg !689
  %10 = bitcast i32* %9 to i8*, !dbg !689
  %arraydecay3 = getelementptr inbounds [10 x i32], [10 x i32]* %b, i32 0, i32 0, !dbg !690
  %11 = bitcast i32* %arraydecay3 to i8*, !dbg !690
  %call4 = call i32 @cudaMemcpy(i8* %10, i8* %11, i64 40, i32 1), !dbg !691
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 10, i32 1, i32 1), !dbg !692
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp5, i32 1, i32 1, i32 1), !dbg !693
  %12 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !695
  %13 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !695
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 12, i32 4, i1 false), !dbg !695
  %14 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !695
  %15 = load i64, i64* %14, align 4, !dbg !695
  %16 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !695
  %17 = load i32, i32* %16, align 4, !dbg !695
  %18 = bitcast { i64, i32 }* %agg.tmp5.coerce to i8*, !dbg !695
  %19 = bitcast %struct.dim3* %agg.tmp5 to i8*, !dbg !695
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 12, i32 4, i1 false), !dbg !695
  %20 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp5.coerce, i32 0, i32 0, !dbg !695
  %21 = load i64, i64* %20, align 4, !dbg !695
  %22 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp5.coerce, i32 0, i32 1, !dbg !695
  %23 = load i32, i32* %22, align 4, !dbg !695
  %call6 = call i32 @cudaConfigureCall(i64 %15, i32 %17, i64 %21, i32 %23, i64 0, %struct.CUstream_st* null), !dbg !696
  %tobool = icmp ne i32 %call6, 0, !dbg !695
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !698

kcall.configok:                                   ; preds = %entry
  %arraydecay7 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i32 0, i32 0, !dbg !699
  %arraydecay8 = getelementptr inbounds [10 x i32], [10 x i32]* %b, i32 0, i32 0, !dbg !701
  call void @_Z6kernelPiS_(i32* %arraydecay7, i32* %arraydecay8), !dbg !702
  br label %kcall.end, !dbg !702

kcall.end:                                        ; preds = %kcall.configok, %entry
  %arraydecay9 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i32 0, i32 0, !dbg !703
  %24 = bitcast i32* %arraydecay9 to i8*, !dbg !703
  %25 = load i32*, i32** %a_d, align 8, !dbg !704
  %26 = bitcast i32* %25 to i8*, !dbg !704
  %call10 = call i32 @cudaMemcpy(i8* %24, i8* %26, i64 40, i32 2), !dbg !705
  %27 = load i32*, i32** %a_d, align 8, !dbg !706
  %28 = bitcast i32* %27 to i8*, !dbg !706
  %call11 = call i32 @cudaFree(i8* %28), !dbg !707
  %29 = load i32*, i32** %b_d, align 8, !dbg !708
  %30 = bitcast i32* %29 to i8*, !dbg !708
  %call12 = call i32 @cudaFree(i8* %30), !dbg !709
  %31 = load i32, i32* %retval, align 4, !dbg !710
  ret i32 %31, !dbg !710
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: inlinehint uwtable
define internal i32 @_ZL10cudaMallocIiE9cudaErrorPPT_m(i32** %devPtr, i64 %size) #4 !dbg !711 {
entry:
  %devPtr.addr = alloca i32**, align 8
  %size.addr = alloca i64, align 8
  store i32** %devPtr, i32*** %devPtr.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %devPtr.addr, metadata !719, metadata !662), !dbg !720
  store i64 %size, i64* %size.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %size.addr, metadata !721, metadata !662), !dbg !722
  %0 = load i32**, i32*** %devPtr.addr, align 8, !dbg !723
  %1 = bitcast i32** %0 to i8*, !dbg !723
  %2 = bitcast i8* %1 to i8**, !dbg !724
  %3 = load i64, i64* %size.addr, align 8, !dbg !725
  %call = call i32 @cudaMalloc(i8** %2, i64 %3), !dbg !726
  ret i32 %call, !dbg !727
}

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #5

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #5

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #6 comdat align 2 !dbg !728 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !751, metadata !662), !dbg !753
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !754, metadata !662), !dbg !755
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !756, metadata !662), !dbg !757
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !758, metadata !662), !dbg !759
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !760
  %0 = load i32, i32* %vx.addr, align 4, !dbg !761
  store i32 %0, i32* %x, align 4, !dbg !760
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !762
  %1 = load i32, i32* %vy.addr, align 4, !dbg !763
  store i32 %1, i32* %y, align 4, !dbg !762
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !764
  %2 = load i32, i32* %vz.addr, align 4, !dbg !765
  store i32 %2, i32* %z, align 4, !dbg !764
  ret void, !dbg !766
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

declare i32 @cudaFree(i8*) #5

declare i32 @cudaMalloc(i8**, i64) #5

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { inlinehint uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!654, !655}
!llvm.ident = !{!656}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !94, imports: !97)
!1 = !DIFile(filename: "loopkernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test")
!2 = !{!3, !11}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !4, line: 807, size: 32, align: 32, elements: !5, identifier: "_ZTS14cudaMemcpyKind")
!4 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!5 = !{!6, !7, !8, !9, !10}
!6 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!7 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!8 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!10 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !4, line: 156, size: 32, align: 32, elements: !12, identifier: "_ZTS9cudaError")
!12 = !{!13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93}
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
!91 = !DIEnumerator(name: "cudaErrorNvlinkUncorrectable", value: 80)
!92 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127)
!93 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000)
!94 = !{!95, !96}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64, align: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!97 = !{!98, !105, !110, !112, !114, !116, !118, !122, !124, !126, !128, !130, !132, !134, !136, !138, !140, !142, !144, !146, !148, !150, !154, !156, !158, !160, !165, !170, !172, !174, !179, !183, !185, !187, !189, !191, !193, !195, !197, !199, !204, !208, !210, !212, !216, !218, !220, !222, !224, !226, !230, !232, !234, !239, !247, !251, !253, !255, !259, !261, !263, !267, !269, !271, !275, !277, !279, !281, !283, !285, !287, !289, !291, !293, !298, !300, !302, !306, !308, !310, !312, !314, !316, !318, !320, !324, !328, !330, !332, !337, !339, !341, !343, !345, !347, !349, !353, !359, !363, !367, !372, !374, !378, !382, !395, !399, !403, !407, !411, !416, !418, !422, !426, !430, !438, !442, !446, !450, !454, !459, !465, !469, !473, !475, !483, !487, !495, !497, !499, !503, !507, !511, !516, !520, !525, !526, !527, !528, !531, !532, !533, !534, !535, !536, !537, !540, !542, !544, !546, !548, !550, !552, !554, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577, !579, !581, !583, !585, !587, !589, !591, !593, !595, !597, !599, !601, !603, !605, !607, !609, !611, !613, !615, !617, !619, !621, !625, !626, !628, !630, !632, !634, !636, !638, !640, !642, !644, !646, !648, !650, !652}
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !101, line: 189)
!99 = !DINamespace(name: "std", scope: null, file: !100, line: 188)
!100 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!101 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !100, file: !100, line: 44, type: !102, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!102 = !DISubroutineType(types: !103)
!103 = !{!104, !104}
!104 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !106, line: 190)
!106 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !100, file: !100, line: 46, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!107 = !DISubroutineType(types: !108)
!108 = !{!109, !109}
!109 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !111, line: 191)
!111 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !100, file: !100, line: 48, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !113, line: 192)
!113 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !100, file: !100, line: 50, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !115, line: 193)
!115 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !100, file: !100, line: 52, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !117, line: 194)
!117 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !100, file: !100, line: 56, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !119, line: 195)
!119 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !100, file: !100, line: 54, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DISubroutineType(types: !121)
!121 = !{!109, !109, !109}
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !123, line: 196)
!123 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !100, file: !100, line: 58, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !125, line: 197)
!125 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !100, file: !100, line: 60, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !127, line: 198)
!127 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !100, file: !100, line: 62, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !129, line: 199)
!129 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !100, file: !100, line: 64, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !131, line: 200)
!131 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !100, file: !100, line: 66, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !133, line: 201)
!133 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !100, file: !100, line: 68, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !135, line: 202)
!135 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !100, file: !100, line: 72, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !137, line: 203)
!137 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !100, file: !100, line: 70, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !139, line: 204)
!139 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !100, file: !100, line: 76, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !141, line: 205)
!141 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !100, file: !100, line: 74, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !143, line: 206)
!143 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !100, file: !100, line: 78, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !145, line: 207)
!145 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !100, file: !100, line: 80, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !147, line: 208)
!147 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !100, file: !100, line: 82, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !149, line: 209)
!149 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !100, file: !100, line: 84, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !151, line: 210)
!151 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !100, file: !100, line: 86, type: !152, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!152 = !DISubroutineType(types: !153)
!153 = !{!109, !109, !109, !109}
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !155, line: 211)
!155 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !100, file: !100, line: 88, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !157, line: 212)
!157 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !100, file: !100, line: 90, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !159, line: 213)
!159 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !100, file: !100, line: 92, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !161, line: 214)
!161 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !100, file: !100, line: 94, type: !162, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!162 = !DISubroutineType(types: !163)
!163 = !{!164, !109}
!164 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !166, line: 215)
!166 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !100, file: !100, line: 96, type: !167, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DISubroutineType(types: !168)
!168 = !{!109, !109, !169}
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !164, size: 64, align: 64)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !171, line: 216)
!171 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !100, file: !100, line: 98, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !173, line: 217)
!173 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !100, file: !100, line: 100, type: !162, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !175, line: 218)
!175 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !100, file: !100, line: 102, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DISubroutineType(types: !177)
!177 = !{!178, !109}
!178 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !180, line: 219)
!180 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !100, file: !100, line: 106, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{!178, !109, !109}
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !184, line: 220)
!184 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !100, file: !100, line: 105, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !186, line: 221)
!186 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !100, file: !100, line: 108, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !188, line: 222)
!188 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !100, file: !100, line: 112, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !190, line: 223)
!190 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !100, file: !100, line: 111, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !192, line: 224)
!192 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !100, file: !100, line: 114, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !194, line: 225)
!194 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !100, file: !100, line: 116, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !196, line: 226)
!196 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !100, file: !100, line: 118, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !198, line: 227)
!198 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !100, file: !100, line: 120, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !200, line: 228)
!200 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !100, file: !100, line: 121, type: !201, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DISubroutineType(types: !202)
!202 = !{!203, !203}
!203 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !205, line: 229)
!205 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !100, file: !100, line: 123, type: !206, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DISubroutineType(types: !207)
!207 = !{!109, !109, !164}
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !209, line: 230)
!209 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !100, file: !100, line: 125, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !211, line: 231)
!211 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !100, file: !100, line: 126, type: !102, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !213, line: 232)
!213 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !100, file: !100, line: 128, type: !214, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DISubroutineType(types: !215)
!215 = !{!104, !109}
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !217, line: 233)
!217 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !100, file: !100, line: 138, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !219, line: 234)
!219 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !100, file: !100, line: 130, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !221, line: 235)
!221 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !100, file: !100, line: 132, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !223, line: 236)
!223 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !100, file: !100, line: 134, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !225, line: 237)
!225 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !100, file: !100, line: 136, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !227, line: 238)
!227 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !100, file: !100, line: 140, type: !228, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DISubroutineType(types: !229)
!229 = !{!203, !109}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !231, line: 239)
!231 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !100, file: !100, line: 142, type: !228, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !233, line: 240)
!233 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !100, file: !100, line: 143, type: !214, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !235, line: 241)
!235 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !100, file: !100, line: 145, type: !236, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DISubroutineType(types: !237)
!237 = !{!109, !109, !238}
!238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64, align: 64)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !240, line: 242)
!240 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !100, file: !100, line: 146, type: !241, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DISubroutineType(types: !242)
!242 = !{!243, !244}
!243 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !245, size: 64, align: 64)
!245 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !246)
!246 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !248, line: 243)
!248 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !100, file: !100, line: 147, type: !249, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DISubroutineType(types: !250)
!250 = !{!109, !244}
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !252, line: 244)
!252 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !100, file: !100, line: 149, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !254, line: 245)
!254 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !100, file: !100, line: 151, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !256, line: 246)
!256 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !100, file: !100, line: 153, type: !257, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!257 = !DISubroutineType(types: !258)
!258 = !{!109, !109, !243}
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !260, line: 247)
!260 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !100, file: !100, line: 158, type: !206, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !262, line: 248)
!262 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !100, file: !100, line: 160, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !264, line: 249)
!264 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !100, file: !100, line: 162, type: !265, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!265 = !DISubroutineType(types: !266)
!266 = !{!109, !109, !109, !169}
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !268, line: 250)
!268 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !100, file: !100, line: 164, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !270, line: 251)
!270 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !100, file: !100, line: 166, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !272, line: 252)
!272 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !100, file: !100, line: 168, type: !273, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !DISubroutineType(types: !274)
!274 = !{!109, !109, !203}
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !276, line: 253)
!276 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !100, file: !100, line: 170, type: !206, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !278, line: 254)
!278 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !100, file: !100, line: 172, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !280, line: 255)
!280 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !100, file: !100, line: 174, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !282, line: 256)
!282 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !100, file: !100, line: 176, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !284, line: 257)
!284 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !100, file: !100, line: 178, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !286, line: 258)
!286 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !100, file: !100, line: 180, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !288, line: 259)
!288 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !100, file: !100, line: 182, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !290, line: 260)
!290 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !100, file: !100, line: 184, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !292, line: 261)
!292 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !100, file: !100, line: 186, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !294, line: 102)
!294 = !DISubprogram(name: "acos", scope: !295, file: !295, line: 54, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!296 = !DISubroutineType(types: !297)
!297 = !{!243, !243}
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !299, line: 121)
!299 = !DISubprogram(name: "asin", scope: !295, file: !295, line: 56, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !301, line: 140)
!301 = !DISubprogram(name: "atan", scope: !295, file: !295, line: 58, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !303, line: 159)
!303 = !DISubprogram(name: "atan2", scope: !295, file: !295, line: 60, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DISubroutineType(types: !305)
!305 = !{!243, !243, !243}
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !307, line: 180)
!307 = !DISubprogram(name: "ceil", scope: !295, file: !295, line: 178, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !309, line: 199)
!309 = !DISubprogram(name: "cos", scope: !295, file: !295, line: 63, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !311, line: 218)
!311 = !DISubprogram(name: "cosh", scope: !295, file: !295, line: 72, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !313, line: 237)
!313 = !DISubprogram(name: "exp", scope: !295, file: !295, line: 100, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !315, line: 256)
!315 = !DISubprogram(name: "fabs", scope: !295, file: !295, line: 181, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !317, line: 275)
!317 = !DISubprogram(name: "floor", scope: !295, file: !295, line: 184, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !319, line: 294)
!319 = !DISubprogram(name: "fmod", scope: !295, file: !295, line: 187, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !321, line: 315)
!321 = !DISubprogram(name: "frexp", scope: !295, file: !295, line: 103, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DISubroutineType(types: !323)
!323 = !{!243, !243, !169}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !325, line: 334)
!325 = !DISubprogram(name: "ldexp", scope: !295, file: !295, line: 106, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{!243, !243, !164}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !329, line: 353)
!329 = !DISubprogram(name: "log", scope: !295, file: !295, line: 109, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !331, line: 372)
!331 = !DISubprogram(name: "log10", scope: !295, file: !295, line: 112, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !333, line: 391)
!333 = !DISubprogram(name: "modf", scope: !295, file: !295, line: 115, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DISubroutineType(types: !335)
!335 = !{!243, !243, !336}
!336 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !243, size: 64, align: 64)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !338, line: 403)
!338 = !DISubprogram(name: "pow", scope: !295, file: !295, line: 153, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !340, line: 440)
!340 = !DISubprogram(name: "sin", scope: !295, file: !295, line: 65, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !342, line: 459)
!342 = !DISubprogram(name: "sinh", scope: !295, file: !295, line: 74, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !344, line: 478)
!344 = !DISubprogram(name: "sqrt", scope: !295, file: !295, line: 156, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !346, line: 497)
!346 = !DISubprogram(name: "tan", scope: !295, file: !295, line: 67, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !348, line: 516)
!348 = !DISubprogram(name: "tanh", scope: !295, file: !295, line: 76, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !350, line: 118)
!350 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !351, line: 101, baseType: !352)
!351 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!352 = !DICompositeType(tag: DW_TAG_structure_type, file: !351, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !354, line: 119)
!354 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !351, line: 109, baseType: !355)
!355 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !351, line: 105, size: 128, align: 64, elements: !356, identifier: "_ZTS6ldiv_t")
!356 = !{!357, !358}
!357 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !355, file: !351, line: 107, baseType: !203, size: 64, align: 64)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !355, file: !351, line: 108, baseType: !203, size: 64, align: 64, offset: 64)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !360, line: 121)
!360 = !DISubprogram(name: "abort", scope: !351, file: !351, line: 515, type: !361, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!361 = !DISubroutineType(types: !362)
!362 = !{null}
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !364, line: 122)
!364 = !DISubprogram(name: "abs", scope: !351, file: !351, line: 774, type: !365, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!365 = !DISubroutineType(types: !366)
!366 = !{!164, !164}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !368, line: 123)
!368 = !DISubprogram(name: "atexit", scope: !351, file: !351, line: 519, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{!164, !371}
!371 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !361, size: 64, align: 64)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !373, line: 129)
!373 = !DISubprogram(name: "atof", scope: !351, file: !351, line: 144, type: !241, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !375, line: 130)
!375 = !DISubprogram(name: "atoi", scope: !351, file: !351, line: 147, type: !376, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!376 = !DISubroutineType(types: !377)
!377 = !{!164, !244}
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !379, line: 131)
!379 = !DISubprogram(name: "atol", scope: !351, file: !351, line: 150, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !DISubroutineType(types: !381)
!381 = !{!203, !244}
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !383, line: 132)
!383 = !DISubprogram(name: "bsearch", scope: !351, file: !351, line: 754, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{!96, !386, !386, !388, !388, !391}
!386 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !387, size: 64, align: 64)
!387 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!388 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !389, line: 62, baseType: !390)
!389 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!390 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !351, line: 741, baseType: !392)
!392 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !393, size: 64, align: 64)
!393 = !DISubroutineType(types: !394)
!394 = !{!164, !386, !386}
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !396, line: 133)
!396 = !DISubprogram(name: "calloc", scope: !351, file: !351, line: 468, type: !397, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!397 = !DISubroutineType(types: !398)
!398 = !{!96, !388, !388}
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !400, line: 134)
!400 = !DISubprogram(name: "div", scope: !351, file: !351, line: 788, type: !401, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!401 = !DISubroutineType(types: !402)
!402 = !{!350, !164, !164}
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !404, line: 135)
!404 = !DISubprogram(name: "exit", scope: !351, file: !351, line: 543, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!405 = !DISubroutineType(types: !406)
!406 = !{null, !164}
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !408, line: 136)
!408 = !DISubprogram(name: "free", scope: !351, file: !351, line: 483, type: !409, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!409 = !DISubroutineType(types: !410)
!410 = !{null, !96}
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !412, line: 137)
!412 = !DISubprogram(name: "getenv", scope: !351, file: !351, line: 564, type: !413, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!413 = !DISubroutineType(types: !414)
!414 = !{!415, !244}
!415 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !246, size: 64, align: 64)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !417, line: 138)
!417 = !DISubprogram(name: "labs", scope: !351, file: !351, line: 775, type: !201, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !419, line: 139)
!419 = !DISubprogram(name: "ldiv", scope: !351, file: !351, line: 790, type: !420, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!420 = !DISubroutineType(types: !421)
!421 = !{!354, !203, !203}
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !423, line: 140)
!423 = !DISubprogram(name: "malloc", scope: !351, file: !351, line: 466, type: !424, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!424 = !DISubroutineType(types: !425)
!425 = !{!96, !388}
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !427, line: 142)
!427 = !DISubprogram(name: "mblen", scope: !351, file: !351, line: 862, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!428 = !DISubroutineType(types: !429)
!429 = !{!164, !244, !388}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !431, line: 143)
!431 = !DISubprogram(name: "mbstowcs", scope: !351, file: !351, line: 873, type: !432, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!432 = !DISubroutineType(types: !433)
!433 = !{!388, !434, !437, !388}
!434 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !435)
!435 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !436, size: 64, align: 64)
!436 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!437 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !244)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !439, line: 144)
!439 = !DISubprogram(name: "mbtowc", scope: !351, file: !351, line: 865, type: !440, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!440 = !DISubroutineType(types: !441)
!441 = !{!164, !434, !437, !388}
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !443, line: 146)
!443 = !DISubprogram(name: "qsort", scope: !351, file: !351, line: 764, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!444 = !DISubroutineType(types: !445)
!445 = !{null, !96, !388, !388, !391}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !447, line: 152)
!447 = !DISubprogram(name: "rand", scope: !351, file: !351, line: 374, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!448 = !DISubroutineType(types: !449)
!449 = !{!164}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !451, line: 153)
!451 = !DISubprogram(name: "realloc", scope: !351, file: !351, line: 480, type: !452, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!452 = !DISubroutineType(types: !453)
!453 = !{!96, !96, !388}
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !455, line: 154)
!455 = !DISubprogram(name: "srand", scope: !351, file: !351, line: 376, type: !456, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DISubroutineType(types: !457)
!457 = !{null, !458}
!458 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !460, line: 155)
!460 = !DISubprogram(name: "strtod", scope: !351, file: !351, line: 164, type: !461, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!461 = !DISubroutineType(types: !462)
!462 = !{!243, !437, !463}
!463 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !464)
!464 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !415, size: 64, align: 64)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !466, line: 156)
!466 = !DISubprogram(name: "strtol", scope: !351, file: !351, line: 183, type: !467, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DISubroutineType(types: !468)
!468 = !{!203, !437, !463, !164}
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !470, line: 157)
!470 = !DISubprogram(name: "strtoul", scope: !351, file: !351, line: 187, type: !471, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DISubroutineType(types: !472)
!472 = !{!390, !437, !463, !164}
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !474, line: 158)
!474 = !DISubprogram(name: "system", scope: !351, file: !351, line: 716, type: !376, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !476, line: 160)
!476 = !DISubprogram(name: "wcstombs", scope: !351, file: !351, line: 876, type: !477, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!477 = !DISubroutineType(types: !478)
!478 = !{!388, !479, !480, !388}
!479 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !415)
!480 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !481)
!481 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !482, size: 64, align: 64)
!482 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !436)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !484, line: 161)
!484 = !DISubprogram(name: "wctomb", scope: !351, file: !351, line: 869, type: !485, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!485 = !DISubroutineType(types: !486)
!486 = !{!164, !415, !436}
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !488, entity: !490, line: 214)
!488 = !DINamespace(name: "__gnu_cxx", scope: null, file: !489, line: 220)
!489 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!490 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !351, line: 121, baseType: !491)
!491 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !351, line: 117, size: 128, align: 64, elements: !492, identifier: "_ZTS7lldiv_t")
!492 = !{!493, !494}
!493 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !491, file: !351, line: 119, baseType: !104, size: 64, align: 64)
!494 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !491, file: !351, line: 120, baseType: !104, size: 64, align: 64, offset: 64)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !488, entity: !496, line: 220)
!496 = !DISubprogram(name: "_Exit", scope: !351, file: !351, line: 557, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !488, entity: !498, line: 224)
!498 = !DISubprogram(name: "llabs", scope: !351, file: !351, line: 779, type: !102, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !488, entity: !500, line: 230)
!500 = !DISubprogram(name: "lldiv", scope: !351, file: !351, line: 796, type: !501, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!501 = !DISubroutineType(types: !502)
!502 = !{!490, !104, !104}
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !488, entity: !504, line: 241)
!504 = !DISubprogram(name: "atoll", scope: !351, file: !351, line: 157, type: !505, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!505 = !DISubroutineType(types: !506)
!506 = !{!104, !244}
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !488, entity: !508, line: 242)
!508 = !DISubprogram(name: "strtoll", scope: !351, file: !351, line: 209, type: !509, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!509 = !DISubroutineType(types: !510)
!510 = !{!104, !437, !463, !164}
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !488, entity: !512, line: 243)
!512 = !DISubprogram(name: "strtoull", scope: !351, file: !351, line: 214, type: !513, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DISubroutineType(types: !514)
!514 = !{!515, !437, !463, !164}
!515 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !488, entity: !517, line: 245)
!517 = !DISubprogram(name: "strtof", scope: !351, file: !351, line: 172, type: !518, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DISubroutineType(types: !519)
!519 = !{!109, !437, !463}
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !488, entity: !521, line: 246)
!521 = !DISubprogram(name: "strtold", scope: !351, file: !351, line: 175, type: !522, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DISubroutineType(types: !523)
!523 = !{!524, !437, !463}
!524 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !490, line: 254)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !496, line: 256)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !498, line: 258)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !529, line: 259)
!529 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !488, file: !530, line: 227, type: !501, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test")
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !500, line: 260)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !504, line: 262)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !517, line: 263)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !508, line: 264)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !512, line: 265)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !521, line: 266)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !538, line: 397)
!538 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !539, file: !539, line: 1342, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!539 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test")
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !541, line: 398)
!541 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !539, file: !539, line: 1370, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !543, line: 399)
!543 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !539, file: !539, line: 1337, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !545, line: 400)
!545 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !539, file: !539, line: 1375, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !547, line: 401)
!547 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !539, file: !539, line: 1327, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !549, line: 402)
!549 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !539, file: !539, line: 1332, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !551, line: 403)
!551 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !539, file: !539, line: 1380, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !553, line: 404)
!553 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !539, file: !539, line: 1430, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !555, line: 405)
!555 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !556, file: !556, line: 667, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!556 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test")
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !558, line: 406)
!558 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !539, file: !539, line: 1189, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !560, line: 407)
!560 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !539, file: !539, line: 1243, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !562, line: 408)
!562 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !539, file: !539, line: 1312, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !564, line: 409)
!564 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !539, file: !539, line: 1490, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !566, line: 410)
!566 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !539, file: !539, line: 1480, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !568, line: 411)
!568 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !556, file: !556, line: 657, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !570, line: 412)
!570 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !539, file: !539, line: 1294, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !572, line: 413)
!572 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !539, file: !539, line: 1385, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !574, line: 414)
!574 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !556, file: !556, line: 607, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !576, line: 415)
!576 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !539, file: !539, line: 1616, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !578, line: 416)
!578 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !556, file: !556, line: 597, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !580, line: 417)
!580 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !539, file: !539, line: 1568, type: !152, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !582, line: 418)
!582 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !556, file: !556, line: 622, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !584, line: 419)
!584 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !556, file: !556, line: 617, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !586, line: 420)
!586 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !539, file: !539, line: 1553, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !588, line: 421)
!588 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !539, file: !539, line: 1543, type: !167, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !590, line: 422)
!590 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !539, file: !539, line: 1390, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !592, line: 423)
!592 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !539, file: !539, line: 1621, type: !162, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !594, line: 424)
!594 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !539, file: !539, line: 1520, type: !206, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !596, line: 425)
!596 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !539, file: !539, line: 1515, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !598, line: 426)
!598 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !539, file: !539, line: 1149, type: !214, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !600, line: 427)
!600 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !539, file: !539, line: 1602, type: !214, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !602, line: 428)
!602 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !539, file: !539, line: 1356, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !604, line: 429)
!604 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !539, file: !539, line: 1365, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !606, line: 430)
!606 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !539, file: !539, line: 1285, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !608, line: 431)
!608 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !539, file: !539, line: 1626, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !610, line: 432)
!610 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !539, file: !539, line: 1347, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !612, line: 433)
!612 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !539, file: !539, line: 1140, type: !228, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !614, line: 434)
!614 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !539, file: !539, line: 1607, type: !228, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !616, line: 435)
!616 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !539, file: !539, line: 1548, type: !236, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !618, line: 436)
!618 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !539, file: !539, line: 1154, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !620, line: 437)
!620 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !539, file: !539, line: 1218, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !622, line: 438)
!622 = !DISubprogram(name: "nexttowardf", scope: !295, file: !295, line: 294, type: !623, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!623 = !DISubroutineType(types: !624)
!624 = !{!109, !109, !524}
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !622, line: 439)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !627, line: 440)
!627 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !539, file: !539, line: 1583, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !629, line: 441)
!629 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !539, file: !539, line: 1558, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !631, line: 442)
!631 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !539, file: !539, line: 1563, type: !265, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !633, line: 443)
!633 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !539, file: !539, line: 1135, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !635, line: 444)
!635 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !539, file: !539, line: 1597, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !637, line: 445)
!637 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !539, file: !539, line: 1530, type: !273, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !639, line: 446)
!639 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !539, file: !539, line: 1525, type: !206, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !641, line: 447)
!641 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !539, file: !539, line: 1234, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !643, line: 448)
!643 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !539, file: !539, line: 1317, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !645, line: 449)
!645 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !556, file: !556, line: 907, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !647, line: 450)
!647 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !539, file: !539, line: 1276, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !649, line: 451)
!649 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !539, file: !539, line: 1322, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !651, line: 452)
!651 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !539, file: !539, line: 1592, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !99, entity: !653, line: 453)
!653 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !556, file: !556, line: 662, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!654 = !{i32 2, !"Dwarf Version", i32 4}
!655 = !{i32 2, !"Debug Info Version", i32 3}
!656 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!657 = distinct !DISubprogram(name: "kernel", linkageName: "_Z6kernelPiS_", scope: !1, file: !1, line: 3, type: !658, isLocal: false, isDefinition: true, scopeLine: 3, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !660)
!658 = !DISubroutineType(types: !659)
!659 = !{null, !169, !169}
!660 = !{}
!661 = !DILocalVariable(name: "a", arg: 1, scope: !657, file: !1, line: 3, type: !169)
!662 = !DIExpression()
!663 = !DILocation(line: 3, column: 18, scope: !657)
!664 = !DILocalVariable(name: "b", arg: 2, scope: !657, file: !1, line: 3, type: !169)
!665 = !DILocation(line: 3, column: 26, scope: !657)
!666 = !DILocation(line: 3, column: 29, scope: !657)
!667 = !DILocation(line: 3, column: 29, scope: !668)
!668 = !DILexicalBlockFile(scope: !657, file: !1, discriminator: 1)
!669 = !DILocation(line: 3, column: 29, scope: !670)
!670 = !DILexicalBlockFile(scope: !657, file: !1, discriminator: 2)
!671 = !DILocation(line: 12, column: 1, scope: !657)
!672 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 14, type: !448, isLocal: false, isDefinition: true, scopeLine: 15, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !660)
!673 = !DILocalVariable(name: "a", scope: !672, file: !1, line: 16, type: !674)
!674 = !DICompositeType(tag: DW_TAG_array_type, baseType: !164, size: 320, align: 32, elements: !675)
!675 = !{!676}
!676 = !DISubrange(count: 10)
!677 = !DILocation(line: 16, column: 9, scope: !672)
!678 = !DILocalVariable(name: "b", scope: !672, file: !1, line: 17, type: !674)
!679 = !DILocation(line: 17, column: 9, scope: !672)
!680 = !DILocalVariable(name: "a_d", scope: !672, file: !1, line: 19, type: !169)
!681 = !DILocation(line: 19, column: 10, scope: !672)
!682 = !DILocalVariable(name: "b_d", scope: !672, file: !1, line: 20, type: !169)
!683 = !DILocation(line: 20, column: 10, scope: !672)
!684 = !DILocation(line: 21, column: 5, scope: !672)
!685 = !DILocation(line: 22, column: 5, scope: !672)
!686 = !DILocation(line: 23, column: 16, scope: !672)
!687 = !DILocation(line: 23, column: 21, scope: !672)
!688 = !DILocation(line: 23, column: 5, scope: !672)
!689 = !DILocation(line: 24, column: 16, scope: !672)
!690 = !DILocation(line: 24, column: 21, scope: !672)
!691 = !DILocation(line: 24, column: 5, scope: !672)
!692 = !DILocation(line: 25, column: 14, scope: !672)
!693 = !DILocation(line: 25, column: 17, scope: !694)
!694 = !DILexicalBlockFile(scope: !672, file: !1, discriminator: 2)
!695 = !DILocation(line: 25, column: 11, scope: !672)
!696 = !DILocation(line: 25, column: 11, scope: !697)
!697 = !DILexicalBlockFile(scope: !672, file: !1, discriminator: 3)
!698 = !DILocation(line: 25, column: 5, scope: !672)
!699 = !DILocation(line: 25, column: 22, scope: !700)
!700 = !DILexicalBlockFile(scope: !672, file: !1, discriminator: 1)
!701 = !DILocation(line: 25, column: 24, scope: !700)
!702 = !DILocation(line: 25, column: 5, scope: !700)
!703 = !DILocation(line: 26, column: 16, scope: !672)
!704 = !DILocation(line: 26, column: 19, scope: !672)
!705 = !DILocation(line: 26, column: 5, scope: !672)
!706 = !DILocation(line: 27, column: 14, scope: !672)
!707 = !DILocation(line: 27, column: 5, scope: !672)
!708 = !DILocation(line: 28, column: 14, scope: !672)
!709 = !DILocation(line: 28, column: 5, scope: !672)
!710 = !DILocation(line: 29, column: 1, scope: !672)
!711 = distinct !DISubprogram(name: "cudaMalloc<int>", linkageName: "_ZL10cudaMallocIiE9cudaErrorPPT_m", scope: !712, file: !712, line: 540, type: !713, isLocal: true, isDefinition: true, scopeLine: 544, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !717, variables: !660)
!712 = !DIFile(filename: "/usr/local/cuda/include/cuda_runtime.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!713 = !DISubroutineType(types: !714)
!714 = !{!715, !716, !388}
!715 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !4, line: 1477, baseType: !11)
!716 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !169, size: 64, align: 64)
!717 = !{!718}
!718 = !DITemplateTypeParameter(name: "T", type: !164)
!719 = !DILocalVariable(name: "devPtr", arg: 1, scope: !711, file: !712, line: 541, type: !716)
!720 = !DILocation(line: 541, column: 12, scope: !711)
!721 = !DILocalVariable(name: "size", arg: 2, scope: !711, file: !712, line: 542, type: !388)
!722 = !DILocation(line: 542, column: 12, scope: !711)
!723 = !DILocation(line: 545, column: 38, scope: !711)
!724 = !DILocation(line: 545, column: 23, scope: !711)
!725 = !DILocation(line: 545, column: 46, scope: !711)
!726 = !DILocation(line: 545, column: 10, scope: !711)
!727 = !DILocation(line: 545, column: 3, scope: !711)
!728 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !730, file: !729, line: 421, type: !736, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !735, variables: !660)
!729 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test")
!730 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !729, line: 417, size: 96, align: 32, elements: !731, identifier: "_ZTS4dim3")
!731 = !{!732, !733, !734, !735, !739, !748}
!732 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !730, file: !729, line: 419, baseType: !458, size: 32, align: 32)
!733 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !730, file: !729, line: 419, baseType: !458, size: 32, align: 32, offset: 32)
!734 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !730, file: !729, line: 419, baseType: !458, size: 32, align: 32, offset: 64)
!735 = !DISubprogram(name: "dim3", scope: !730, file: !729, line: 421, type: !736, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!736 = !DISubroutineType(types: !737)
!737 = !{null, !738, !458, !458, !458}
!738 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !730, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!739 = !DISubprogram(name: "dim3", scope: !730, file: !729, line: 422, type: !740, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!740 = !DISubroutineType(types: !741)
!741 = !{null, !738, !742}
!742 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !729, line: 383, baseType: !743)
!743 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !729, line: 190, size: 96, align: 32, elements: !744, identifier: "_ZTS5uint3")
!744 = !{!745, !746, !747}
!745 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !743, file: !729, line: 192, baseType: !458, size: 32, align: 32)
!746 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !743, file: !729, line: 192, baseType: !458, size: 32, align: 32, offset: 32)
!747 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !743, file: !729, line: 192, baseType: !458, size: 32, align: 32, offset: 64)
!748 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !730, file: !729, line: 423, type: !749, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!749 = !DISubroutineType(types: !750)
!750 = !{!742, !738}
!751 = !DILocalVariable(name: "this", arg: 1, scope: !728, type: !752, flags: DIFlagArtificial | DIFlagObjectPointer)
!752 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !730, size: 64, align: 64)
!753 = !DILocation(line: 0, scope: !728)
!754 = !DILocalVariable(name: "vx", arg: 2, scope: !728, file: !729, line: 421, type: !458)
!755 = !DILocation(line: 421, column: 43, scope: !728)
!756 = !DILocalVariable(name: "vy", arg: 3, scope: !728, file: !729, line: 421, type: !458)
!757 = !DILocation(line: 421, column: 64, scope: !728)
!758 = !DILocalVariable(name: "vz", arg: 4, scope: !728, file: !729, line: 421, type: !458)
!759 = !DILocation(line: 421, column: 85, scope: !728)
!760 = !DILocation(line: 421, column: 95, scope: !728)
!761 = !DILocation(line: 421, column: 97, scope: !728)
!762 = !DILocation(line: 421, column: 102, scope: !728)
!763 = !DILocation(line: 421, column: 104, scope: !728)
!764 = !DILocation(line: 421, column: 109, scope: !728)
!765 = !DILocation(line: 421, column: 111, scope: !728)
!766 = !DILocation(line: 421, column: 116, scope: !728)
