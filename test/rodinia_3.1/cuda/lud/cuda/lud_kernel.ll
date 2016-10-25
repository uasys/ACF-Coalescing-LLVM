; ModuleID = 'lud_kernel.cu'
source_filename = "lud_kernel.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

; Function Attrs: uwtable
define void @_Z12lud_diagonalPfii(float* %m, i32 %matrix_dim, i32 %offset) #0 !dbg !565 {
entry:
  %m.addr = alloca float*, align 8
  %matrix_dim.addr = alloca i32, align 4
  %offset.addr = alloca i32, align 4
  store float* %m, float** %m.addr, align 8
  call void @llvm.dbg.declare(metadata float** %m.addr, metadata !568, metadata !569), !dbg !570
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %matrix_dim.addr, metadata !571, metadata !569), !dbg !572
  store i32 %offset, i32* %offset.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %offset.addr, metadata !573, metadata !569), !dbg !574
  %0 = bitcast float** %m.addr to i8*, !dbg !575
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !575
  %2 = icmp eq i32 %1, 0, !dbg !575
  br i1 %2, label %setup.next, label %setup.end, !dbg !575

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %matrix_dim.addr to i8*, !dbg !576
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 8), !dbg !576
  %5 = icmp eq i32 %4, 0, !dbg !576
  br i1 %5, label %setup.next1, label %setup.end, !dbg !576

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %offset.addr to i8*, !dbg !578
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 12), !dbg !578
  %8 = icmp eq i32 %7, 0, !dbg !578
  br i1 %8, label %setup.next2, label %setup.end, !dbg !578

setup.next2:                                      ; preds = %setup.next1
  %9 = call i32 @cudaLaunch(i8* bitcast (void (float*, i32, i32)* @_Z12lud_diagonalPfii to i8*)), !dbg !580
  br label %setup.end, !dbg !580

setup.end:                                        ; preds = %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !582
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @_Z13lud_perimeterPfii(float* %m, i32 %matrix_dim, i32 %offset) #0 !dbg !583 {
entry:
  %m.addr = alloca float*, align 8
  %matrix_dim.addr = alloca i32, align 4
  %offset.addr = alloca i32, align 4
  store float* %m, float** %m.addr, align 8
  call void @llvm.dbg.declare(metadata float** %m.addr, metadata !584, metadata !569), !dbg !585
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %matrix_dim.addr, metadata !586, metadata !569), !dbg !587
  store i32 %offset, i32* %offset.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %offset.addr, metadata !588, metadata !569), !dbg !589
  %0 = bitcast float** %m.addr to i8*, !dbg !590
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !590
  %2 = icmp eq i32 %1, 0, !dbg !590
  br i1 %2, label %setup.next, label %setup.end, !dbg !590

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %matrix_dim.addr to i8*, !dbg !591
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 8), !dbg !591
  %5 = icmp eq i32 %4, 0, !dbg !591
  br i1 %5, label %setup.next1, label %setup.end, !dbg !591

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %offset.addr to i8*, !dbg !593
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 12), !dbg !593
  %8 = icmp eq i32 %7, 0, !dbg !593
  br i1 %8, label %setup.next2, label %setup.end, !dbg !593

setup.next2:                                      ; preds = %setup.next1
  %9 = call i32 @cudaLaunch(i8* bitcast (void (float*, i32, i32)* @_Z13lud_perimeterPfii to i8*)), !dbg !595
  br label %setup.end, !dbg !595

setup.end:                                        ; preds = %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !597
}

; Function Attrs: uwtable
define void @_Z12lud_internalPfii(float* %m, i32 %matrix_dim, i32 %offset) #0 !dbg !598 {
entry:
  %m.addr = alloca float*, align 8
  %matrix_dim.addr = alloca i32, align 4
  %offset.addr = alloca i32, align 4
  store float* %m, float** %m.addr, align 8
  call void @llvm.dbg.declare(metadata float** %m.addr, metadata !599, metadata !569), !dbg !600
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %matrix_dim.addr, metadata !601, metadata !569), !dbg !602
  store i32 %offset, i32* %offset.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %offset.addr, metadata !603, metadata !569), !dbg !604
  %0 = bitcast float** %m.addr to i8*, !dbg !605
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !605
  %2 = icmp eq i32 %1, 0, !dbg !605
  br i1 %2, label %setup.next, label %setup.end, !dbg !605

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %matrix_dim.addr to i8*, !dbg !606
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 8), !dbg !606
  %5 = icmp eq i32 %4, 0, !dbg !606
  br i1 %5, label %setup.next1, label %setup.end, !dbg !606

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %offset.addr to i8*, !dbg !608
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 12), !dbg !608
  %8 = icmp eq i32 %7, 0, !dbg !608
  br i1 %8, label %setup.next2, label %setup.end, !dbg !608

setup.next2:                                      ; preds = %setup.next1
  %9 = call i32 @cudaLaunch(i8* bitcast (void (float*, i32, i32)* @_Z12lud_internalPfii to i8*)), !dbg !610
  br label %setup.end, !dbg !610

setup.end:                                        ; preds = %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !612
}

; Function Attrs: uwtable
define void @_Z8lud_cudaPfi(float* %m, i32 %matrix_dim) #0 !dbg !613 {
entry:
  %m.addr = alloca float*, align 8
  %matrix_dim.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %dimBlock = alloca %struct.dim3, align 4
  %m_debug = alloca float*, align 8
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp2 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp2.coerce = alloca { i64, i32 }, align 4
  %agg.tmp4 = alloca %struct.dim3, align 4
  %agg.tmp7 = alloca %struct.dim3, align 4
  %agg.tmp4.coerce = alloca { i64, i32 }, align 4
  %agg.tmp7.coerce = alloca { i64, i32 }, align 4
  %dimGrid = alloca %struct.dim3, align 4
  %agg.tmp18 = alloca %struct.dim3, align 4
  %agg.tmp19 = alloca %struct.dim3, align 4
  %agg.tmp18.coerce = alloca { i64, i32 }, align 4
  %agg.tmp19.coerce = alloca { i64, i32 }, align 4
  %agg.tmp24 = alloca %struct.dim3, align 4
  %agg.tmp25 = alloca %struct.dim3, align 4
  %agg.tmp24.coerce = alloca { i64, i32 }, align 4
  %agg.tmp25.coerce = alloca { i64, i32 }, align 4
  store float* %m, float** %m.addr, align 8
  call void @llvm.dbg.declare(metadata float** %m.addr, metadata !616, metadata !569), !dbg !617
  store i32 %matrix_dim, i32* %matrix_dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %matrix_dim.addr, metadata !618, metadata !569), !dbg !619
  call void @llvm.dbg.declare(metadata i32* %i, metadata !620, metadata !569), !dbg !621
  store i32 0, i32* %i, align 4, !dbg !621
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimBlock, metadata !622, metadata !569), !dbg !646
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimBlock, i32 16, i32 16, i32 1), !dbg !646
  call void @llvm.dbg.declare(metadata float** %m_debug, metadata !647, metadata !569), !dbg !648
  %0 = load i32, i32* %matrix_dim.addr, align 4, !dbg !649
  %1 = load i32, i32* %matrix_dim.addr, align 4, !dbg !650
  %mul = mul nsw i32 %0, %1, !dbg !651
  %conv = sext i32 %mul to i64, !dbg !649
  %mul1 = mul i64 %conv, 4, !dbg !652
  %call = call noalias i8* @malloc(i64 %mul1) #6, !dbg !653
  %2 = bitcast i8* %call to float*, !dbg !654
  store float* %2, float** %m_debug, align 8, !dbg !648
  store i32 0, i32* %i, align 4, !dbg !655
  br label %for.cond, !dbg !657

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !658
  %4 = load i32, i32* %matrix_dim.addr, align 4, !dbg !661
  %sub = sub nsw i32 %4, 16, !dbg !662
  %cmp = icmp slt i32 %3, %sub, !dbg !663
  br i1 %cmp, label %for.body, label %for.end, !dbg !664

for.body:                                         ; preds = %for.cond
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 1, i32 1, i32 1), !dbg !665
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp2, i32 16, i32 1, i32 1), !dbg !667
  %5 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !669
  %6 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !669
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 12, i32 4, i1 false), !dbg !669
  %7 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !669
  %8 = load i64, i64* %7, align 4, !dbg !669
  %9 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !669
  %10 = load i32, i32* %9, align 4, !dbg !669
  %11 = bitcast { i64, i32 }* %agg.tmp2.coerce to i8*, !dbg !669
  %12 = bitcast %struct.dim3* %agg.tmp2 to i8*, !dbg !669
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 12, i32 4, i1 false), !dbg !669
  %13 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp2.coerce, i32 0, i32 0, !dbg !669
  %14 = load i64, i64* %13, align 4, !dbg !669
  %15 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp2.coerce, i32 0, i32 1, !dbg !669
  %16 = load i32, i32* %15, align 4, !dbg !669
  %call3 = call i32 @cudaConfigureCall(i64 %8, i32 %10, i64 %14, i32 %16, i64 0, %struct.CUstream_st* null), !dbg !670
  %tobool = icmp ne i32 %call3, 0, !dbg !669
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !672

kcall.configok:                                   ; preds = %for.body
  %17 = load float*, float** %m.addr, align 8, !dbg !673
  %18 = load i32, i32* %matrix_dim.addr, align 4, !dbg !675
  %19 = load i32, i32* %i, align 4, !dbg !676
  call void @_Z12lud_diagonalPfii(float* %17, i32 %18, i32 %19), !dbg !677
  br label %kcall.end, !dbg !677

kcall.end:                                        ; preds = %kcall.configok, %for.body
  %20 = load i32, i32* %matrix_dim.addr, align 4, !dbg !678
  %21 = load i32, i32* %i, align 4, !dbg !679
  %sub5 = sub nsw i32 %20, %21, !dbg !680
  %div = sdiv i32 %sub5, 16, !dbg !681
  %sub6 = sub nsw i32 %div, 1, !dbg !682
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp4, i32 %sub6, i32 1, i32 1), !dbg !683
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp7, i32 32, i32 1, i32 1), !dbg !684
  %22 = bitcast { i64, i32 }* %agg.tmp4.coerce to i8*, !dbg !685
  %23 = bitcast %struct.dim3* %agg.tmp4 to i8*, !dbg !685
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* %23, i64 12, i32 4, i1 false), !dbg !685
  %24 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp4.coerce, i32 0, i32 0, !dbg !685
  %25 = load i64, i64* %24, align 4, !dbg !685
  %26 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp4.coerce, i32 0, i32 1, !dbg !685
  %27 = load i32, i32* %26, align 4, !dbg !685
  %28 = bitcast { i64, i32 }* %agg.tmp7.coerce to i8*, !dbg !685
  %29 = bitcast %struct.dim3* %agg.tmp7 to i8*, !dbg !685
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 12, i32 4, i1 false), !dbg !685
  %30 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp7.coerce, i32 0, i32 0, !dbg !685
  %31 = load i64, i64* %30, align 4, !dbg !685
  %32 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp7.coerce, i32 0, i32 1, !dbg !685
  %33 = load i32, i32* %32, align 4, !dbg !685
  %call8 = call i32 @cudaConfigureCall(i64 %25, i32 %27, i64 %31, i32 %33, i64 0, %struct.CUstream_st* null), !dbg !686
  %tobool9 = icmp ne i32 %call8, 0, !dbg !685
  br i1 %tobool9, label %kcall.end11, label %kcall.configok10, !dbg !687

kcall.configok10:                                 ; preds = %kcall.end
  %34 = load float*, float** %m.addr, align 8, !dbg !688
  %35 = load i32, i32* %matrix_dim.addr, align 4, !dbg !689
  %36 = load i32, i32* %i, align 4, !dbg !690
  call void @_Z13lud_perimeterPfii(float* %34, i32 %35, i32 %36), !dbg !691
  br label %kcall.end11, !dbg !691

kcall.end11:                                      ; preds = %kcall.configok10, %kcall.end
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimGrid, metadata !692, metadata !569), !dbg !693
  %37 = load i32, i32* %matrix_dim.addr, align 4, !dbg !694
  %38 = load i32, i32* %i, align 4, !dbg !695
  %sub12 = sub nsw i32 %37, %38, !dbg !696
  %div13 = sdiv i32 %sub12, 16, !dbg !697
  %sub14 = sub nsw i32 %div13, 1, !dbg !698
  %39 = load i32, i32* %matrix_dim.addr, align 4, !dbg !699
  %40 = load i32, i32* %i, align 4, !dbg !700
  %sub15 = sub nsw i32 %39, %40, !dbg !701
  %div16 = sdiv i32 %sub15, 16, !dbg !702
  %sub17 = sub nsw i32 %div16, 1, !dbg !703
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimGrid, i32 %sub14, i32 %sub17, i32 1), !dbg !693
  %41 = bitcast %struct.dim3* %agg.tmp18 to i8*, !dbg !704
  %42 = bitcast %struct.dim3* %dimGrid to i8*, !dbg !704
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* %42, i64 12, i32 4, i1 false), !dbg !704
  %43 = bitcast %struct.dim3* %agg.tmp19 to i8*, !dbg !705
  %44 = bitcast %struct.dim3* %dimBlock to i8*, !dbg !705
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* %44, i64 12, i32 4, i1 false), !dbg !705
  %45 = bitcast { i64, i32 }* %agg.tmp18.coerce to i8*, !dbg !706
  %46 = bitcast %struct.dim3* %agg.tmp18 to i8*, !dbg !706
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* %46, i64 12, i32 4, i1 false), !dbg !706
  %47 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp18.coerce, i32 0, i32 0, !dbg !706
  %48 = load i64, i64* %47, align 4, !dbg !706
  %49 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp18.coerce, i32 0, i32 1, !dbg !706
  %50 = load i32, i32* %49, align 4, !dbg !706
  %51 = bitcast { i64, i32 }* %agg.tmp19.coerce to i8*, !dbg !706
  %52 = bitcast %struct.dim3* %agg.tmp19 to i8*, !dbg !706
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %51, i8* %52, i64 12, i32 4, i1 false), !dbg !706
  %53 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp19.coerce, i32 0, i32 0, !dbg !706
  %54 = load i64, i64* %53, align 4, !dbg !706
  %55 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp19.coerce, i32 0, i32 1, !dbg !706
  %56 = load i32, i32* %55, align 4, !dbg !706
  %call20 = call i32 @cudaConfigureCall(i64 %48, i32 %50, i64 %54, i32 %56, i64 0, %struct.CUstream_st* null), !dbg !706
  %tobool21 = icmp ne i32 %call20, 0, !dbg !706
  br i1 %tobool21, label %kcall.end23, label %kcall.configok22, !dbg !707

kcall.configok22:                                 ; preds = %kcall.end11
  %57 = load float*, float** %m.addr, align 8, !dbg !708
  %58 = load i32, i32* %matrix_dim.addr, align 4, !dbg !709
  %59 = load i32, i32* %i, align 4, !dbg !710
  call void @_Z12lud_internalPfii(float* %57, i32 %58, i32 %59), !dbg !711
  br label %kcall.end23, !dbg !711

kcall.end23:                                      ; preds = %kcall.configok22, %kcall.end11
  br label %for.inc, !dbg !712

for.inc:                                          ; preds = %kcall.end23
  %60 = load i32, i32* %i, align 4, !dbg !713
  %add = add nsw i32 %60, 16, !dbg !713
  store i32 %add, i32* %i, align 4, !dbg !713
  br label %for.cond, !dbg !715, !llvm.loop !716

for.end:                                          ; preds = %for.cond
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp24, i32 1, i32 1, i32 1), !dbg !718
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp25, i32 16, i32 1, i32 1), !dbg !719
  %61 = bitcast { i64, i32 }* %agg.tmp24.coerce to i8*, !dbg !721
  %62 = bitcast %struct.dim3* %agg.tmp24 to i8*, !dbg !721
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %61, i8* %62, i64 12, i32 4, i1 false), !dbg !721
  %63 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp24.coerce, i32 0, i32 0, !dbg !721
  %64 = load i64, i64* %63, align 4, !dbg !721
  %65 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp24.coerce, i32 0, i32 1, !dbg !721
  %66 = load i32, i32* %65, align 4, !dbg !721
  %67 = bitcast { i64, i32 }* %agg.tmp25.coerce to i8*, !dbg !721
  %68 = bitcast %struct.dim3* %agg.tmp25 to i8*, !dbg !721
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %67, i8* %68, i64 12, i32 4, i1 false), !dbg !721
  %69 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp25.coerce, i32 0, i32 0, !dbg !721
  %70 = load i64, i64* %69, align 4, !dbg !721
  %71 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp25.coerce, i32 0, i32 1, !dbg !721
  %72 = load i32, i32* %71, align 4, !dbg !721
  %call26 = call i32 @cudaConfigureCall(i64 %64, i32 %66, i64 %70, i32 %72, i64 0, %struct.CUstream_st* null), !dbg !722
  %tobool27 = icmp ne i32 %call26, 0, !dbg !721
  br i1 %tobool27, label %kcall.end29, label %kcall.configok28, !dbg !724

kcall.configok28:                                 ; preds = %for.end
  %73 = load float*, float** %m.addr, align 8, !dbg !725
  %74 = load i32, i32* %matrix_dim.addr, align 4, !dbg !727
  %75 = load i32, i32* %i, align 4, !dbg !728
  call void @_Z12lud_diagonalPfii(float* %73, i32 %74, i32 %75), !dbg !729
  br label %kcall.end29, !dbg !729

kcall.end29:                                      ; preds = %kcall.configok28, %for.end
  ret void, !dbg !730
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #2 comdat align 2 !dbg !731 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !732, metadata !569), !dbg !734
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !735, metadata !569), !dbg !736
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !737, metadata !569), !dbg !738
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !739, metadata !569), !dbg !740
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !741
  %0 = load i32, i32* %vx.addr, align 4, !dbg !742
  store i32 %0, i32* %x, align 4, !dbg !741
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !743
  %1 = load i32, i32* %vy.addr, align 4, !dbg !744
  store i32 %1, i32* %y, align 4, !dbg !743
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !745
  %2 = load i32, i32* %vz.addr, align 4, !dbg !746
  store i32 %2, i32* %z, align 4, !dbg !745
  ret void, !dbg !747
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!562, !563}
!llvm.ident = !{!564}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, imports: !6)
!1 = !DIFile(filename: "lud_kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!6 = !{!7, !14, !18, !20, !22, !24, !26, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48, !50, !52, !54, !56, !58, !62, !64, !66, !68, !73, !78, !80, !82, !87, !91, !93, !95, !97, !99, !101, !103, !105, !107, !112, !116, !118, !120, !124, !126, !128, !130, !132, !134, !138, !140, !142, !146, !154, !158, !160, !162, !166, !168, !170, !174, !176, !178, !182, !184, !186, !188, !190, !192, !194, !196, !198, !200, !205, !207, !209, !213, !215, !217, !219, !221, !223, !225, !227, !231, !235, !237, !239, !244, !246, !248, !250, !252, !254, !256, !260, !266, !270, !274, !279, !281, !285, !289, !303, !307, !311, !315, !319, !324, !326, !330, !334, !338, !346, !350, !354, !358, !362, !367, !373, !377, !381, !383, !391, !395, !403, !405, !407, !411, !415, !419, !424, !428, !433, !434, !435, !436, !439, !440, !441, !442, !443, !444, !445, !448, !450, !452, !454, !456, !458, !460, !462, !465, !467, !469, !471, !473, !475, !477, !479, !481, !483, !485, !487, !489, !491, !493, !495, !497, !499, !501, !503, !505, !507, !509, !511, !513, !515, !517, !519, !521, !523, !525, !527, !529, !533, !534, !536, !538, !540, !542, !544, !546, !548, !550, !552, !554, !556, !558, !560}
!7 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !10, line: 189)
!8 = !DINamespace(name: "std", scope: null, file: !9, line: 188)
!9 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!10 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !9, file: !9, line: 44, type: !11, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!14 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !15, line: 190)
!15 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !9, file: !9, line: 46, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!16 = !DISubroutineType(types: !17)
!17 = !{!5, !5}
!18 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !19, line: 191)
!19 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !9, file: !9, line: 48, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!20 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !21, line: 192)
!21 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !9, file: !9, line: 50, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!22 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !23, line: 193)
!23 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !9, file: !9, line: 52, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!24 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !25, line: 194)
!25 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !9, file: !9, line: 56, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!26 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !27, line: 195)
!27 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !9, file: !9, line: 54, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!28 = !DISubroutineType(types: !29)
!29 = !{!5, !5, !5}
!30 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !31, line: 196)
!31 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !9, file: !9, line: 58, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !33, line: 197)
!33 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !9, file: !9, line: 60, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !35, line: 198)
!35 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !9, file: !9, line: 62, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !37, line: 199)
!37 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !9, file: !9, line: 64, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !39, line: 200)
!39 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !9, file: !9, line: 66, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !41, line: 201)
!41 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !9, file: !9, line: 68, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !43, line: 202)
!43 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !9, file: !9, line: 72, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !45, line: 203)
!45 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !9, file: !9, line: 70, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !47, line: 204)
!47 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !9, file: !9, line: 76, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !49, line: 205)
!49 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !9, file: !9, line: 74, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !51, line: 206)
!51 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !9, file: !9, line: 78, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !53, line: 207)
!53 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !9, file: !9, line: 80, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !55, line: 208)
!55 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !9, file: !9, line: 82, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !57, line: 209)
!57 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !9, file: !9, line: 84, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !59, line: 210)
!59 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !9, file: !9, line: 86, type: !60, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DISubroutineType(types: !61)
!61 = !{!5, !5, !5, !5}
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !63, line: 211)
!63 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !9, file: !9, line: 88, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !65, line: 212)
!65 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !9, file: !9, line: 90, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !67, line: 213)
!67 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !9, file: !9, line: 92, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !69, line: 214)
!69 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !9, file: !9, line: 94, type: !70, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!70 = !DISubroutineType(types: !71)
!71 = !{!72, !5}
!72 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !74, line: 215)
!74 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !9, file: !9, line: 96, type: !75, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!75 = !DISubroutineType(types: !76)
!76 = !{!5, !5, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64, align: 64)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !79, line: 216)
!79 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !9, file: !9, line: 98, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !81, line: 217)
!81 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !9, file: !9, line: 100, type: !70, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !83, line: 218)
!83 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !9, file: !9, line: 102, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !5}
!86 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !88, line: 219)
!88 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !9, file: !9, line: 106, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!89 = !DISubroutineType(types: !90)
!90 = !{!86, !5, !5}
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !92, line: 220)
!92 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !9, file: !9, line: 105, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !94, line: 221)
!94 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !9, file: !9, line: 108, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !96, line: 222)
!96 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !9, file: !9, line: 112, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !98, line: 223)
!98 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !9, file: !9, line: 111, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !100, line: 224)
!100 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !9, file: !9, line: 114, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !102, line: 225)
!102 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !9, file: !9, line: 116, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !104, line: 226)
!104 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !9, file: !9, line: 118, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !106, line: 227)
!106 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !9, file: !9, line: 120, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !108, line: 228)
!108 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !9, file: !9, line: 121, type: !109, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!109 = !DISubroutineType(types: !110)
!110 = !{!111, !111}
!111 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !113, line: 229)
!113 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !9, file: !9, line: 123, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DISubroutineType(types: !115)
!115 = !{!5, !5, !72}
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !117, line: 230)
!117 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !9, file: !9, line: 125, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !119, line: 231)
!119 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !9, file: !9, line: 126, type: !11, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !121, line: 232)
!121 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !9, file: !9, line: 128, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!122 = !DISubroutineType(types: !123)
!123 = !{!13, !5}
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !125, line: 233)
!125 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !9, file: !9, line: 138, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !127, line: 234)
!127 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !9, file: !9, line: 130, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !129, line: 235)
!129 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !9, file: !9, line: 132, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !131, line: 236)
!131 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !9, file: !9, line: 134, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !133, line: 237)
!133 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !9, file: !9, line: 136, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !135, line: 238)
!135 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !9, file: !9, line: 140, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!136 = !DISubroutineType(types: !137)
!137 = !{!111, !5}
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !139, line: 239)
!139 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !9, file: !9, line: 142, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !141, line: 240)
!141 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !9, file: !9, line: 143, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !143, line: 241)
!143 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !9, file: !9, line: 145, type: !144, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!144 = !DISubroutineType(types: !145)
!145 = !{!5, !5, !4}
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !147, line: 242)
!147 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !9, file: !9, line: 146, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!148 = !DISubroutineType(types: !149)
!149 = !{!150, !151}
!150 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !152, size: 64, align: 64)
!152 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !153)
!153 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !155, line: 243)
!155 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !9, file: !9, line: 147, type: !156, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!156 = !DISubroutineType(types: !157)
!157 = !{!5, !151}
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !159, line: 244)
!159 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !9, file: !9, line: 149, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !161, line: 245)
!161 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !9, file: !9, line: 151, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !163, line: 246)
!163 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !9, file: !9, line: 153, type: !164, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!164 = !DISubroutineType(types: !165)
!165 = !{!5, !5, !150}
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !167, line: 247)
!167 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !9, file: !9, line: 158, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !169, line: 248)
!169 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !9, file: !9, line: 160, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !171, line: 249)
!171 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !9, file: !9, line: 162, type: !172, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DISubroutineType(types: !173)
!173 = !{!5, !5, !5, !77}
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !175, line: 250)
!175 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !9, file: !9, line: 164, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !177, line: 251)
!177 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !9, file: !9, line: 166, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !179, line: 252)
!179 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !9, file: !9, line: 168, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DISubroutineType(types: !181)
!181 = !{!5, !5, !111}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !183, line: 253)
!183 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !9, file: !9, line: 170, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !185, line: 254)
!185 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !9, file: !9, line: 172, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !187, line: 255)
!187 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !9, file: !9, line: 174, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !189, line: 256)
!189 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !9, file: !9, line: 176, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !191, line: 257)
!191 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !9, file: !9, line: 178, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !193, line: 258)
!193 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !9, file: !9, line: 180, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !195, line: 259)
!195 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !9, file: !9, line: 182, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !197, line: 260)
!197 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !9, file: !9, line: 184, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !199, line: 261)
!199 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !9, file: !9, line: 186, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !201, line: 102)
!201 = !DISubprogram(name: "acos", scope: !202, file: !202, line: 54, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!203 = !DISubroutineType(types: !204)
!204 = !{!150, !150}
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !206, line: 121)
!206 = !DISubprogram(name: "asin", scope: !202, file: !202, line: 56, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !208, line: 140)
!208 = !DISubprogram(name: "atan", scope: !202, file: !202, line: 58, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !210, line: 159)
!210 = !DISubprogram(name: "atan2", scope: !202, file: !202, line: 60, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DISubroutineType(types: !212)
!212 = !{!150, !150, !150}
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !214, line: 180)
!214 = !DISubprogram(name: "ceil", scope: !202, file: !202, line: 178, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !216, line: 199)
!216 = !DISubprogram(name: "cos", scope: !202, file: !202, line: 63, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !218, line: 218)
!218 = !DISubprogram(name: "cosh", scope: !202, file: !202, line: 72, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !220, line: 237)
!220 = !DISubprogram(name: "exp", scope: !202, file: !202, line: 100, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !222, line: 256)
!222 = !DISubprogram(name: "fabs", scope: !202, file: !202, line: 181, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !224, line: 275)
!224 = !DISubprogram(name: "floor", scope: !202, file: !202, line: 184, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !226, line: 294)
!226 = !DISubprogram(name: "fmod", scope: !202, file: !202, line: 187, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !228, line: 315)
!228 = !DISubprogram(name: "frexp", scope: !202, file: !202, line: 103, type: !229, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DISubroutineType(types: !230)
!230 = !{!150, !150, !77}
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !232, line: 334)
!232 = !DISubprogram(name: "ldexp", scope: !202, file: !202, line: 106, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DISubroutineType(types: !234)
!234 = !{!150, !150, !72}
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !236, line: 353)
!236 = !DISubprogram(name: "log", scope: !202, file: !202, line: 109, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !238, line: 372)
!238 = !DISubprogram(name: "log10", scope: !202, file: !202, line: 112, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !240, line: 391)
!240 = !DISubprogram(name: "modf", scope: !202, file: !202, line: 115, type: !241, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DISubroutineType(types: !242)
!242 = !{!150, !150, !243}
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 64, align: 64)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !245, line: 403)
!245 = !DISubprogram(name: "pow", scope: !202, file: !202, line: 153, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !247, line: 440)
!247 = !DISubprogram(name: "sin", scope: !202, file: !202, line: 65, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !249, line: 459)
!249 = !DISubprogram(name: "sinh", scope: !202, file: !202, line: 74, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !251, line: 478)
!251 = !DISubprogram(name: "sqrt", scope: !202, file: !202, line: 156, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !253, line: 497)
!253 = !DISubprogram(name: "tan", scope: !202, file: !202, line: 67, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !255, line: 516)
!255 = !DISubprogram(name: "tanh", scope: !202, file: !202, line: 76, type: !203, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !257, line: 118)
!257 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !258, line: 101, baseType: !259)
!258 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!259 = !DICompositeType(tag: DW_TAG_structure_type, file: !258, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !261, line: 119)
!261 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !258, line: 109, baseType: !262)
!262 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !258, line: 105, size: 128, align: 64, elements: !263, identifier: "_ZTS6ldiv_t")
!263 = !{!264, !265}
!264 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !262, file: !258, line: 107, baseType: !111, size: 64, align: 64)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !262, file: !258, line: 108, baseType: !111, size: 64, align: 64, offset: 64)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !267, line: 121)
!267 = !DISubprogram(name: "abort", scope: !258, file: !258, line: 515, type: !268, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!268 = !DISubroutineType(types: !269)
!269 = !{null}
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !271, line: 122)
!271 = !DISubprogram(name: "abs", scope: !258, file: !258, line: 774, type: !272, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!272 = !DISubroutineType(types: !273)
!273 = !{!72, !72}
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !275, line: 123)
!275 = !DISubprogram(name: "atexit", scope: !258, file: !258, line: 519, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!276 = !DISubroutineType(types: !277)
!277 = !{!72, !278}
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !268, size: 64, align: 64)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !280, line: 129)
!280 = !DISubprogram(name: "atof", scope: !258, file: !258, line: 144, type: !148, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !282, line: 130)
!282 = !DISubprogram(name: "atoi", scope: !258, file: !258, line: 147, type: !283, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!283 = !DISubroutineType(types: !284)
!284 = !{!72, !151}
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !286, line: 131)
!286 = !DISubprogram(name: "atol", scope: !258, file: !258, line: 150, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!287 = !DISubroutineType(types: !288)
!288 = !{!111, !151}
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !290, line: 132)
!290 = !DISubprogram(name: "bsearch", scope: !258, file: !258, line: 754, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DISubroutineType(types: !292)
!292 = !{!293, !294, !294, !296, !296, !299}
!293 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!294 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !295, size: 64, align: 64)
!295 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!296 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !297, line: 62, baseType: !298)
!297 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!298 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!299 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !258, line: 741, baseType: !300)
!300 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !301, size: 64, align: 64)
!301 = !DISubroutineType(types: !302)
!302 = !{!72, !294, !294}
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !304, line: 133)
!304 = !DISubprogram(name: "calloc", scope: !258, file: !258, line: 468, type: !305, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!305 = !DISubroutineType(types: !306)
!306 = !{!293, !296, !296}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !308, line: 134)
!308 = !DISubprogram(name: "div", scope: !258, file: !258, line: 788, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!309 = !DISubroutineType(types: !310)
!310 = !{!257, !72, !72}
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !312, line: 135)
!312 = !DISubprogram(name: "exit", scope: !258, file: !258, line: 543, type: !313, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!313 = !DISubroutineType(types: !314)
!314 = !{null, !72}
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !316, line: 136)
!316 = !DISubprogram(name: "free", scope: !258, file: !258, line: 483, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!317 = !DISubroutineType(types: !318)
!318 = !{null, !293}
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !320, line: 137)
!320 = !DISubprogram(name: "getenv", scope: !258, file: !258, line: 564, type: !321, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!321 = !DISubroutineType(types: !322)
!322 = !{!323, !151}
!323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64, align: 64)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !325, line: 138)
!325 = !DISubprogram(name: "labs", scope: !258, file: !258, line: 775, type: !109, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !327, line: 139)
!327 = !DISubprogram(name: "ldiv", scope: !258, file: !258, line: 790, type: !328, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!328 = !DISubroutineType(types: !329)
!329 = !{!261, !111, !111}
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !331, line: 140)
!331 = !DISubprogram(name: "malloc", scope: !258, file: !258, line: 466, type: !332, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!332 = !DISubroutineType(types: !333)
!333 = !{!293, !296}
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !335, line: 142)
!335 = !DISubprogram(name: "mblen", scope: !258, file: !258, line: 862, type: !336, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DISubroutineType(types: !337)
!337 = !{!72, !151, !296}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !339, line: 143)
!339 = !DISubprogram(name: "mbstowcs", scope: !258, file: !258, line: 873, type: !340, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DISubroutineType(types: !341)
!341 = !{!296, !342, !345, !296}
!342 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !343)
!343 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !344, size: 64, align: 64)
!344 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!345 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !151)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !347, line: 144)
!347 = !DISubprogram(name: "mbtowc", scope: !258, file: !258, line: 865, type: !348, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!348 = !DISubroutineType(types: !349)
!349 = !{!72, !342, !345, !296}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !351, line: 146)
!351 = !DISubprogram(name: "qsort", scope: !258, file: !258, line: 764, type: !352, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !DISubroutineType(types: !353)
!353 = !{null, !293, !296, !296, !299}
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !355, line: 152)
!355 = !DISubprogram(name: "rand", scope: !258, file: !258, line: 374, type: !356, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !DISubroutineType(types: !357)
!357 = !{!72}
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !359, line: 153)
!359 = !DISubprogram(name: "realloc", scope: !258, file: !258, line: 480, type: !360, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DISubroutineType(types: !361)
!361 = !{!293, !293, !296}
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !363, line: 154)
!363 = !DISubprogram(name: "srand", scope: !258, file: !258, line: 376, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{null, !366}
!366 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !368, line: 155)
!368 = !DISubprogram(name: "strtod", scope: !258, file: !258, line: 164, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{!150, !345, !371}
!371 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !372)
!372 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !323, size: 64, align: 64)
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !374, line: 156)
!374 = !DISubprogram(name: "strtol", scope: !258, file: !258, line: 183, type: !375, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!375 = !DISubroutineType(types: !376)
!376 = !{!111, !345, !371, !72}
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !378, line: 157)
!378 = !DISubprogram(name: "strtoul", scope: !258, file: !258, line: 187, type: !379, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!379 = !DISubroutineType(types: !380)
!380 = !{!298, !345, !371, !72}
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !382, line: 158)
!382 = !DISubprogram(name: "system", scope: !258, file: !258, line: 716, type: !283, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !384, line: 160)
!384 = !DISubprogram(name: "wcstombs", scope: !258, file: !258, line: 876, type: !385, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!385 = !DISubroutineType(types: !386)
!386 = !{!296, !387, !388, !296}
!387 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !323)
!388 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !389)
!389 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !390, size: 64, align: 64)
!390 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !344)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !392, line: 161)
!392 = !DISubprogram(name: "wctomb", scope: !258, file: !258, line: 869, type: !393, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!393 = !DISubroutineType(types: !394)
!394 = !{!72, !323, !344}
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !396, entity: !398, line: 214)
!396 = !DINamespace(name: "__gnu_cxx", scope: null, file: !397, line: 220)
!397 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!398 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !258, line: 121, baseType: !399)
!399 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !258, line: 117, size: 128, align: 64, elements: !400, identifier: "_ZTS7lldiv_t")
!400 = !{!401, !402}
!401 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !399, file: !258, line: 119, baseType: !13, size: 64, align: 64)
!402 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !399, file: !258, line: 120, baseType: !13, size: 64, align: 64, offset: 64)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !396, entity: !404, line: 220)
!404 = !DISubprogram(name: "_Exit", scope: !258, file: !258, line: 557, type: !313, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !396, entity: !406, line: 224)
!406 = !DISubprogram(name: "llabs", scope: !258, file: !258, line: 779, type: !11, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !396, entity: !408, line: 230)
!408 = !DISubprogram(name: "lldiv", scope: !258, file: !258, line: 796, type: !409, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!409 = !DISubroutineType(types: !410)
!410 = !{!398, !13, !13}
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !396, entity: !412, line: 241)
!412 = !DISubprogram(name: "atoll", scope: !258, file: !258, line: 157, type: !413, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!413 = !DISubroutineType(types: !414)
!414 = !{!13, !151}
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !396, entity: !416, line: 242)
!416 = !DISubprogram(name: "strtoll", scope: !258, file: !258, line: 209, type: !417, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!417 = !DISubroutineType(types: !418)
!418 = !{!13, !345, !371, !72}
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !396, entity: !420, line: 243)
!420 = !DISubprogram(name: "strtoull", scope: !258, file: !258, line: 214, type: !421, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!421 = !DISubroutineType(types: !422)
!422 = !{!423, !345, !371, !72}
!423 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !396, entity: !425, line: 245)
!425 = !DISubprogram(name: "strtof", scope: !258, file: !258, line: 172, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!426 = !DISubroutineType(types: !427)
!427 = !{!5, !345, !371}
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !396, entity: !429, line: 246)
!429 = !DISubprogram(name: "strtold", scope: !258, file: !258, line: 175, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DISubroutineType(types: !431)
!431 = !{!432, !345, !371}
!432 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !398, line: 254)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !404, line: 256)
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !406, line: 258)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !437, line: 259)
!437 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !396, file: !438, line: 227, type: !409, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !408, line: 260)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !412, line: 262)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !425, line: 263)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !416, line: 264)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !420, line: 265)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !429, line: 266)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !446, line: 397)
!446 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !447, file: !447, line: 1342, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !449, line: 398)
!449 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !447, file: !447, line: 1370, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !451, line: 399)
!451 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !447, file: !447, line: 1337, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !453, line: 400)
!453 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !447, file: !447, line: 1375, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !455, line: 401)
!455 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !447, file: !447, line: 1327, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !457, line: 402)
!457 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !447, file: !447, line: 1332, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !459, line: 403)
!459 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !447, file: !447, line: 1380, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !461, line: 404)
!461 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !447, file: !447, line: 1430, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !463, line: 405)
!463 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !464, file: !464, line: 667, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!464 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !466, line: 406)
!466 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !447, file: !447, line: 1189, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !468, line: 407)
!468 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !447, file: !447, line: 1243, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !470, line: 408)
!470 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !447, file: !447, line: 1312, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !472, line: 409)
!472 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !447, file: !447, line: 1490, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !474, line: 410)
!474 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !447, file: !447, line: 1480, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !476, line: 411)
!476 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !464, file: !464, line: 657, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !478, line: 412)
!478 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !447, file: !447, line: 1294, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !480, line: 413)
!480 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !447, file: !447, line: 1385, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !482, line: 414)
!482 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !464, file: !464, line: 607, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !484, line: 415)
!484 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !447, file: !447, line: 1616, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !486, line: 416)
!486 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !464, file: !464, line: 597, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !488, line: 417)
!488 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !447, file: !447, line: 1568, type: !60, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !490, line: 418)
!490 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !464, file: !464, line: 622, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !492, line: 419)
!492 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !464, file: !464, line: 617, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !494, line: 420)
!494 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !447, file: !447, line: 1553, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !496, line: 421)
!496 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !447, file: !447, line: 1543, type: !75, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !498, line: 422)
!498 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !447, file: !447, line: 1390, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !500, line: 423)
!500 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !447, file: !447, line: 1621, type: !70, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !502, line: 424)
!502 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !447, file: !447, line: 1520, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !504, line: 425)
!504 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !447, file: !447, line: 1515, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !506, line: 426)
!506 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !447, file: !447, line: 1149, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !508, line: 427)
!508 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !447, file: !447, line: 1602, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !510, line: 428)
!510 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !447, file: !447, line: 1356, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !512, line: 429)
!512 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !447, file: !447, line: 1365, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !514, line: 430)
!514 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !447, file: !447, line: 1285, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !516, line: 431)
!516 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !447, file: !447, line: 1626, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !518, line: 432)
!518 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !447, file: !447, line: 1347, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !520, line: 433)
!520 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !447, file: !447, line: 1140, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !522, line: 434)
!522 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !447, file: !447, line: 1607, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !524, line: 435)
!524 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !447, file: !447, line: 1548, type: !144, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !526, line: 436)
!526 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !447, file: !447, line: 1154, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !528, line: 437)
!528 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !447, file: !447, line: 1218, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !530, line: 438)
!530 = !DISubprogram(name: "nexttowardf", scope: !202, file: !202, line: 294, type: !531, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!531 = !DISubroutineType(types: !532)
!532 = !{!5, !5, !432}
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !530, line: 439)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !535, line: 440)
!535 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !447, file: !447, line: 1583, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !537, line: 441)
!537 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !447, file: !447, line: 1558, type: !28, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !539, line: 442)
!539 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !447, file: !447, line: 1563, type: !172, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !541, line: 443)
!541 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !447, file: !447, line: 1135, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !543, line: 444)
!543 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !447, file: !447, line: 1597, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !545, line: 445)
!545 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !447, file: !447, line: 1530, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !547, line: 446)
!547 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !447, file: !447, line: 1525, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !549, line: 447)
!549 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !447, file: !447, line: 1234, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !551, line: 448)
!551 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !447, file: !447, line: 1317, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !553, line: 449)
!553 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !464, file: !464, line: 907, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !555, line: 450)
!555 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !447, file: !447, line: 1276, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !557, line: 451)
!557 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !447, file: !447, line: 1322, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !559, line: 452)
!559 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !447, file: !447, line: 1592, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !561, line: 453)
!561 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !464, file: !464, line: 662, type: !16, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!562 = !{i32 2, !"Dwarf Version", i32 4}
!563 = !{i32 2, !"Debug Info Version", i32 3}
!564 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!565 = distinct !DISubprogram(name: "lud_diagonal", linkageName: "_Z12lud_diagonalPfii", scope: !1, file: !1, line: 16, type: !566, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!566 = !DISubroutineType(types: !567)
!567 = !{null, !4, !72, !72}
!568 = !DILocalVariable(name: "m", arg: 1, scope: !565, file: !1, line: 16, type: !4)
!569 = !DIExpression()
!570 = !DILocation(line: 16, column: 21, scope: !565)
!571 = !DILocalVariable(name: "matrix_dim", arg: 2, scope: !565, file: !1, line: 16, type: !72)
!572 = !DILocation(line: 16, column: 28, scope: !565)
!573 = !DILocalVariable(name: "offset", arg: 3, scope: !565, file: !1, line: 16, type: !72)
!574 = !DILocation(line: 16, column: 44, scope: !565)
!575 = !DILocation(line: 17, column: 1, scope: !565)
!576 = !DILocation(line: 17, column: 1, scope: !577)
!577 = !DILexicalBlockFile(scope: !565, file: !1, discriminator: 1)
!578 = !DILocation(line: 17, column: 1, scope: !579)
!579 = !DILexicalBlockFile(scope: !565, file: !1, discriminator: 2)
!580 = !DILocation(line: 17, column: 1, scope: !581)
!581 = !DILexicalBlockFile(scope: !565, file: !1, discriminator: 3)
!582 = !DILocation(line: 55, column: 1, scope: !565)
!583 = distinct !DISubprogram(name: "lud_perimeter", linkageName: "_Z13lud_perimeterPfii", scope: !1, file: !1, line: 58, type: !566, isLocal: false, isDefinition: true, scopeLine: 59, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!584 = !DILocalVariable(name: "m", arg: 1, scope: !583, file: !1, line: 58, type: !4)
!585 = !DILocation(line: 58, column: 22, scope: !583)
!586 = !DILocalVariable(name: "matrix_dim", arg: 2, scope: !583, file: !1, line: 58, type: !72)
!587 = !DILocation(line: 58, column: 29, scope: !583)
!588 = !DILocalVariable(name: "offset", arg: 3, scope: !583, file: !1, line: 58, type: !72)
!589 = !DILocation(line: 58, column: 45, scope: !583)
!590 = !DILocation(line: 59, column: 1, scope: !583)
!591 = !DILocation(line: 59, column: 1, scope: !592)
!592 = !DILexicalBlockFile(scope: !583, file: !1, discriminator: 1)
!593 = !DILocation(line: 59, column: 1, scope: !594)
!594 = !DILexicalBlockFile(scope: !583, file: !1, discriminator: 2)
!595 = !DILocation(line: 59, column: 1, scope: !596)
!596 = !DILexicalBlockFile(scope: !583, file: !1, discriminator: 3)
!597 = !DILocation(line: 165, column: 1, scope: !583)
!598 = distinct !DISubprogram(name: "lud_internal", linkageName: "_Z12lud_internalPfii", scope: !1, file: !1, line: 168, type: !566, isLocal: false, isDefinition: true, scopeLine: 169, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!599 = !DILocalVariable(name: "m", arg: 1, scope: !598, file: !1, line: 168, type: !4)
!600 = !DILocation(line: 168, column: 21, scope: !598)
!601 = !DILocalVariable(name: "matrix_dim", arg: 2, scope: !598, file: !1, line: 168, type: !72)
!602 = !DILocation(line: 168, column: 28, scope: !598)
!603 = !DILocalVariable(name: "offset", arg: 3, scope: !598, file: !1, line: 168, type: !72)
!604 = !DILocation(line: 168, column: 44, scope: !598)
!605 = !DILocation(line: 169, column: 1, scope: !598)
!606 = !DILocation(line: 169, column: 1, scope: !607)
!607 = !DILexicalBlockFile(scope: !598, file: !1, discriminator: 1)
!608 = !DILocation(line: 169, column: 1, scope: !609)
!609 = !DILexicalBlockFile(scope: !598, file: !1, discriminator: 2)
!610 = !DILocation(line: 169, column: 1, scope: !611)
!611 = !DILexicalBlockFile(scope: !598, file: !1, discriminator: 3)
!612 = !DILocation(line: 190, column: 1, scope: !598)
!613 = distinct !DISubprogram(name: "lud_cuda", linkageName: "_Z8lud_cudaPfi", scope: !1, file: !1, line: 193, type: !614, isLocal: false, isDefinition: true, scopeLine: 194, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!614 = !DISubroutineType(types: !615)
!615 = !{null, !4, !72}
!616 = !DILocalVariable(name: "m", arg: 1, scope: !613, file: !1, line: 193, type: !4)
!617 = !DILocation(line: 193, column: 22, scope: !613)
!618 = !DILocalVariable(name: "matrix_dim", arg: 2, scope: !613, file: !1, line: 193, type: !72)
!619 = !DILocation(line: 193, column: 29, scope: !613)
!620 = !DILocalVariable(name: "i", scope: !613, file: !1, line: 195, type: !72)
!621 = !DILocation(line: 195, column: 7, scope: !613)
!622 = !DILocalVariable(name: "dimBlock", scope: !613, file: !1, line: 196, type: !623)
!623 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !624, line: 427, baseType: !625)
!624 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/lud/cuda")
!625 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !624, line: 417, size: 96, align: 32, elements: !626, identifier: "_ZTS4dim3")
!626 = !{!627, !628, !629, !630, !634, !643}
!627 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !625, file: !624, line: 419, baseType: !366, size: 32, align: 32)
!628 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !625, file: !624, line: 419, baseType: !366, size: 32, align: 32, offset: 32)
!629 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !625, file: !624, line: 419, baseType: !366, size: 32, align: 32, offset: 64)
!630 = !DISubprogram(name: "dim3", scope: !625, file: !624, line: 421, type: !631, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!631 = !DISubroutineType(types: !632)
!632 = !{null, !633, !366, !366, !366}
!633 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !625, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!634 = !DISubprogram(name: "dim3", scope: !625, file: !624, line: 422, type: !635, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!635 = !DISubroutineType(types: !636)
!636 = !{null, !633, !637}
!637 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !624, line: 383, baseType: !638)
!638 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !624, line: 190, size: 96, align: 32, elements: !639, identifier: "_ZTS5uint3")
!639 = !{!640, !641, !642}
!640 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !638, file: !624, line: 192, baseType: !366, size: 32, align: 32)
!641 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !638, file: !624, line: 192, baseType: !366, size: 32, align: 32, offset: 32)
!642 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !638, file: !624, line: 192, baseType: !366, size: 32, align: 32, offset: 64)
!643 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !625, file: !624, line: 423, type: !644, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!644 = !DISubroutineType(types: !645)
!645 = !{!637, !633}
!646 = !DILocation(line: 196, column: 8, scope: !613)
!647 = !DILocalVariable(name: "m_debug", scope: !613, file: !1, line: 197, type: !4)
!648 = !DILocation(line: 197, column: 10, scope: !613)
!649 = !DILocation(line: 197, column: 35, scope: !613)
!650 = !DILocation(line: 197, column: 46, scope: !613)
!651 = !DILocation(line: 197, column: 45, scope: !613)
!652 = !DILocation(line: 197, column: 56, scope: !613)
!653 = !DILocation(line: 197, column: 28, scope: !613)
!654 = !DILocation(line: 197, column: 20, scope: !613)
!655 = !DILocation(line: 199, column: 9, scope: !656)
!656 = distinct !DILexicalBlock(scope: !613, file: !1, line: 199, column: 3)
!657 = !DILocation(line: 199, column: 8, scope: !656)
!658 = !DILocation(line: 199, column: 13, scope: !659)
!659 = !DILexicalBlockFile(scope: !660, file: !1, discriminator: 1)
!660 = distinct !DILexicalBlock(scope: !656, file: !1, line: 199, column: 3)
!661 = !DILocation(line: 199, column: 17, scope: !659)
!662 = !DILocation(line: 199, column: 27, scope: !659)
!663 = !DILocation(line: 199, column: 15, scope: !659)
!664 = !DILocation(line: 199, column: 3, scope: !659)
!665 = !DILocation(line: 200, column: 22, scope: !666)
!666 = distinct !DILexicalBlock(scope: !660, file: !1, line: 199, column: 57)
!667 = !DILocation(line: 200, column: 25, scope: !668)
!668 = !DILexicalBlockFile(scope: !666, file: !1, discriminator: 2)
!669 = !DILocation(line: 200, column: 19, scope: !666)
!670 = !DILocation(line: 200, column: 19, scope: !671)
!671 = !DILexicalBlockFile(scope: !666, file: !1, discriminator: 3)
!672 = !DILocation(line: 200, column: 7, scope: !666)
!673 = !DILocation(line: 200, column: 39, scope: !674)
!674 = !DILexicalBlockFile(scope: !666, file: !1, discriminator: 1)
!675 = !DILocation(line: 200, column: 42, scope: !674)
!676 = !DILocation(line: 200, column: 54, scope: !674)
!677 = !DILocation(line: 200, column: 7, scope: !674)
!678 = !DILocation(line: 201, column: 24, scope: !666)
!679 = !DILocation(line: 201, column: 35, scope: !666)
!680 = !DILocation(line: 201, column: 34, scope: !666)
!681 = !DILocation(line: 201, column: 37, scope: !666)
!682 = !DILocation(line: 201, column: 48, scope: !666)
!683 = !DILocation(line: 201, column: 23, scope: !666)
!684 = !DILocation(line: 201, column: 52, scope: !668)
!685 = !DILocation(line: 201, column: 20, scope: !666)
!686 = !DILocation(line: 201, column: 20, scope: !671)
!687 = !DILocation(line: 201, column: 7, scope: !666)
!688 = !DILocation(line: 201, column: 68, scope: !674)
!689 = !DILocation(line: 201, column: 71, scope: !674)
!690 = !DILocation(line: 201, column: 83, scope: !674)
!691 = !DILocation(line: 201, column: 7, scope: !674)
!692 = !DILocalVariable(name: "dimGrid", scope: !666, file: !1, line: 202, type: !623)
!693 = !DILocation(line: 202, column: 12, scope: !666)
!694 = !DILocation(line: 202, column: 21, scope: !666)
!695 = !DILocation(line: 202, column: 32, scope: !666)
!696 = !DILocation(line: 202, column: 31, scope: !666)
!697 = !DILocation(line: 202, column: 34, scope: !666)
!698 = !DILocation(line: 202, column: 45, scope: !666)
!699 = !DILocation(line: 202, column: 50, scope: !666)
!700 = !DILocation(line: 202, column: 61, scope: !666)
!701 = !DILocation(line: 202, column: 60, scope: !666)
!702 = !DILocation(line: 202, column: 63, scope: !666)
!703 = !DILocation(line: 202, column: 74, scope: !666)
!704 = !DILocation(line: 203, column: 22, scope: !666)
!705 = !DILocation(line: 203, column: 31, scope: !666)
!706 = !DILocation(line: 203, column: 19, scope: !666)
!707 = !DILocation(line: 203, column: 7, scope: !666)
!708 = !DILocation(line: 203, column: 43, scope: !674)
!709 = !DILocation(line: 203, column: 46, scope: !674)
!710 = !DILocation(line: 203, column: 58, scope: !674)
!711 = !DILocation(line: 203, column: 7, scope: !674)
!712 = !DILocation(line: 204, column: 3, scope: !666)
!713 = !DILocation(line: 199, column: 42, scope: !714)
!714 = !DILexicalBlockFile(scope: !660, file: !1, discriminator: 2)
!715 = !DILocation(line: 199, column: 3, scope: !714)
!716 = distinct !{!716, !717}
!717 = !DILocation(line: 199, column: 3, scope: !613)
!718 = !DILocation(line: 205, column: 18, scope: !613)
!719 = !DILocation(line: 205, column: 20, scope: !720)
!720 = !DILexicalBlockFile(scope: !613, file: !1, discriminator: 2)
!721 = !DILocation(line: 205, column: 15, scope: !613)
!722 = !DILocation(line: 205, column: 15, scope: !723)
!723 = !DILexicalBlockFile(scope: !613, file: !1, discriminator: 3)
!724 = !DILocation(line: 205, column: 3, scope: !613)
!725 = !DILocation(line: 205, column: 34, scope: !726)
!726 = !DILexicalBlockFile(scope: !613, file: !1, discriminator: 1)
!727 = !DILocation(line: 205, column: 37, scope: !726)
!728 = !DILocation(line: 205, column: 49, scope: !726)
!729 = !DILocation(line: 205, column: 3, scope: !726)
!730 = !DILocation(line: 206, column: 1, scope: !613)
!731 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !625, file: !624, line: 421, type: !631, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !630, variables: !2)
!732 = !DILocalVariable(name: "this", arg: 1, scope: !731, type: !733, flags: DIFlagArtificial | DIFlagObjectPointer)
!733 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !625, size: 64, align: 64)
!734 = !DILocation(line: 0, scope: !731)
!735 = !DILocalVariable(name: "vx", arg: 2, scope: !731, file: !624, line: 421, type: !366)
!736 = !DILocation(line: 421, column: 43, scope: !731)
!737 = !DILocalVariable(name: "vy", arg: 3, scope: !731, file: !624, line: 421, type: !366)
!738 = !DILocation(line: 421, column: 64, scope: !731)
!739 = !DILocalVariable(name: "vz", arg: 4, scope: !731, file: !624, line: 421, type: !366)
!740 = !DILocation(line: 421, column: 85, scope: !731)
!741 = !DILocation(line: 421, column: 95, scope: !731)
!742 = !DILocation(line: 421, column: 97, scope: !731)
!743 = !DILocation(line: 421, column: 102, scope: !731)
!744 = !DILocation(line: 421, column: 104, scope: !731)
!745 = !DILocation(line: 421, column: 109, scope: !731)
!746 = !DILocation(line: 421, column: 111, scope: !731)
!747 = !DILocation(line: 421, column: 116, scope: !731)
