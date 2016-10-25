; ModuleID = '3D.cu'
source_filename = "3D.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@.str = private unnamed_addr constant [16 x i8] c"Time: %.3f (s)\0A\00", align 1
@t_chip = global float 0x3F40624DE0000000, align 4, !dbg !0
@chip_height = global float 0x3F90624DE0000000, align 4, !dbg !109
@chip_width = global float 0x3F90624DE0000000, align 4, !dbg !110
@amb_temp = global float 8.000000e+01, align 4, !dbg !111
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [11 x i8] c"Error: %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [24 x i8] c"The file was not opened\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"Error reading file\0A\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"not enough lines in file\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"invalid file format\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.9 = private unnamed_addr constant [25 x i8] c"The file was not opened\0A\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c"%d\09%g\0A\00", align 1
@.str.11 = private unnamed_addr constant [81 x i8] c"Usage: %s <rows/cols> <layers> <iterations> <powerFile> <tempFile> <outputFile>\0A\00", align 1
@.str.12 = private unnamed_addr constant [68 x i8] c"\09<rows/cols>  - number of rows/cols in the grid (positive integer)\0A\00", align 1
@.str.13 = private unnamed_addr constant [62 x i8] c"\09<layers>  - number of layers in the grid (positive integer)\0A\00", align 1
@.str.14 = private unnamed_addr constant [37 x i8] c"\09<iteration> - number of iterations\0A\00", align 1
@.str.15 = private unnamed_addr constant [83 x i8] c"\09<powerFile>  - name of the file containing the initial power values of each cell\0A\00", align 1
@.str.16 = private unnamed_addr constant [88 x i8] c"\09<tempFile>  - name of the file containing the initial temperature values of each cell\0A\00", align 1
@.str.17 = private unnamed_addr constant [28 x i8] c"\09<outputFile - output file\0A\00", align 1
@.str.18 = private unnamed_addr constant [14 x i8] c"Accuracy: %e\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @_Z8get_timev() #0 !dbg !668 {
entry:
  %tv = alloca %struct.timeval, align 8
  call void @llvm.dbg.declare(metadata %struct.timeval* %tv, metadata !673, metadata !682), !dbg !683
  %call = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #10, !dbg !684
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 0, !dbg !685
  %0 = load i64, i64* %tv_sec, align 8, !dbg !685
  %mul = mul nsw i64 %0, 1000000, !dbg !686
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 1, !dbg !687
  %1 = load i64, i64* %tv_usec, align 8, !dbg !687
  %add = add nsw i64 %mul, %1, !dbg !688
  ret i64 %add, !dbg !689
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #2

; Function Attrs: uwtable
define void @_Z11hotspotOpt1PfS_S_fiiifffffff(float* %p, float* %tIn, float* %tOut, float %sdc, i32 %nx, i32 %ny, i32 %nz, float %ce, float %cw, float %cn, float %cs, float %ct, float %cb, float %cc) #3 !dbg !690 {
entry:
  %p.addr = alloca float*, align 8
  %tIn.addr = alloca float*, align 8
  %tOut.addr = alloca float*, align 8
  %sdc.addr = alloca float, align 4
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %nz.addr = alloca i32, align 4
  %ce.addr = alloca float, align 4
  %cw.addr = alloca float, align 4
  %cn.addr = alloca float, align 4
  %cs.addr = alloca float, align 4
  %ct.addr = alloca float, align 4
  %cb.addr = alloca float, align 4
  %cc.addr = alloca float, align 4
  store float* %p, float** %p.addr, align 8
  call void @llvm.dbg.declare(metadata float** %p.addr, metadata !693, metadata !682), !dbg !694
  store float* %tIn, float** %tIn.addr, align 8
  call void @llvm.dbg.declare(metadata float** %tIn.addr, metadata !695, metadata !682), !dbg !696
  store float* %tOut, float** %tOut.addr, align 8
  call void @llvm.dbg.declare(metadata float** %tOut.addr, metadata !697, metadata !682), !dbg !698
  store float %sdc, float* %sdc.addr, align 4
  call void @llvm.dbg.declare(metadata float* %sdc.addr, metadata !699, metadata !682), !dbg !700
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !701, metadata !682), !dbg !702
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !703, metadata !682), !dbg !704
  store i32 %nz, i32* %nz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nz.addr, metadata !705, metadata !682), !dbg !706
  store float %ce, float* %ce.addr, align 4
  call void @llvm.dbg.declare(metadata float* %ce.addr, metadata !707, metadata !682), !dbg !708
  store float %cw, float* %cw.addr, align 4
  call void @llvm.dbg.declare(metadata float* %cw.addr, metadata !709, metadata !682), !dbg !710
  store float %cn, float* %cn.addr, align 4
  call void @llvm.dbg.declare(metadata float* %cn.addr, metadata !711, metadata !682), !dbg !712
  store float %cs, float* %cs.addr, align 4
  call void @llvm.dbg.declare(metadata float* %cs.addr, metadata !713, metadata !682), !dbg !714
  store float %ct, float* %ct.addr, align 4
  call void @llvm.dbg.declare(metadata float* %ct.addr, metadata !715, metadata !682), !dbg !716
  store float %cb, float* %cb.addr, align 4
  call void @llvm.dbg.declare(metadata float* %cb.addr, metadata !717, metadata !682), !dbg !718
  store float %cc, float* %cc.addr, align 4
  call void @llvm.dbg.declare(metadata float* %cc.addr, metadata !719, metadata !682), !dbg !720
  %0 = bitcast float** %p.addr to i8*, !dbg !721
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !721
  %2 = icmp eq i32 %1, 0, !dbg !721
  br i1 %2, label %setup.next, label %setup.end, !dbg !721

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %tIn.addr to i8*, !dbg !722
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !722
  %5 = icmp eq i32 %4, 0, !dbg !722
  br i1 %5, label %setup.next1, label %setup.end, !dbg !722

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %tOut.addr to i8*, !dbg !724
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !724
  %8 = icmp eq i32 %7, 0, !dbg !724
  br i1 %8, label %setup.next2, label %setup.end, !dbg !724

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float* %sdc.addr to i8*, !dbg !726
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 24), !dbg !726
  %11 = icmp eq i32 %10, 0, !dbg !726
  br i1 %11, label %setup.next3, label %setup.end, !dbg !726

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %nx.addr to i8*, !dbg !728
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 28), !dbg !728
  %14 = icmp eq i32 %13, 0, !dbg !728
  br i1 %14, label %setup.next4, label %setup.end, !dbg !728

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %ny.addr to i8*, !dbg !730
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 4, i64 32), !dbg !730
  %17 = icmp eq i32 %16, 0, !dbg !730
  br i1 %17, label %setup.next5, label %setup.end, !dbg !730

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i32* %nz.addr to i8*, !dbg !732
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 4, i64 36), !dbg !732
  %20 = icmp eq i32 %19, 0, !dbg !732
  br i1 %20, label %setup.next6, label %setup.end, !dbg !732

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast float* %ce.addr to i8*, !dbg !734
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 4, i64 40), !dbg !734
  %23 = icmp eq i32 %22, 0, !dbg !734
  br i1 %23, label %setup.next7, label %setup.end, !dbg !734

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast float* %cw.addr to i8*, !dbg !736
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 4, i64 44), !dbg !736
  %26 = icmp eq i32 %25, 0, !dbg !736
  br i1 %26, label %setup.next8, label %setup.end, !dbg !736

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast float* %cn.addr to i8*, !dbg !738
  %28 = call i32 @cudaSetupArgument(i8* %27, i64 4, i64 48), !dbg !738
  %29 = icmp eq i32 %28, 0, !dbg !738
  br i1 %29, label %setup.next9, label %setup.end, !dbg !738

setup.next9:                                      ; preds = %setup.next8
  %30 = bitcast float* %cs.addr to i8*, !dbg !740
  %31 = call i32 @cudaSetupArgument(i8* %30, i64 4, i64 52), !dbg !740
  %32 = icmp eq i32 %31, 0, !dbg !740
  br i1 %32, label %setup.next10, label %setup.end, !dbg !740

setup.next10:                                     ; preds = %setup.next9
  %33 = bitcast float* %ct.addr to i8*, !dbg !742
  %34 = call i32 @cudaSetupArgument(i8* %33, i64 4, i64 56), !dbg !742
  %35 = icmp eq i32 %34, 0, !dbg !742
  br i1 %35, label %setup.next11, label %setup.end, !dbg !742

setup.next11:                                     ; preds = %setup.next10
  %36 = bitcast float* %cb.addr to i8*, !dbg !744
  %37 = call i32 @cudaSetupArgument(i8* %36, i64 4, i64 60), !dbg !744
  %38 = icmp eq i32 %37, 0, !dbg !744
  br i1 %38, label %setup.next12, label %setup.end, !dbg !744

setup.next12:                                     ; preds = %setup.next11
  %39 = bitcast float* %cc.addr to i8*, !dbg !746
  %40 = call i32 @cudaSetupArgument(i8* %39, i64 4, i64 64), !dbg !746
  %41 = icmp eq i32 %40, 0, !dbg !746
  br i1 %41, label %setup.next13, label %setup.end, !dbg !746

setup.next13:                                     ; preds = %setup.next12
  %42 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*, float, i32, i32, i32, float, float, float, float, float, float, float)* @_Z11hotspotOpt1PfS_S_fiiifffffff to i8*)), !dbg !748
  br label %setup.end, !dbg !748

setup.end:                                        ; preds = %setup.next13, %setup.next12, %setup.next11, %setup.next10, %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !750
}

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @_Z12hotspot_opt1PfS_S_iiifffffi(float* %p, float* %tIn, float* %tOut, i32 %nx, i32 %ny, i32 %nz, float %Cap, float %Rx, float %Ry, float %Rz, float %dt, i32 %numiter) #3 !dbg !751 {
entry:
  %p.addr = alloca float*, align 8
  %tIn.addr = alloca float*, align 8
  %tOut.addr = alloca float*, align 8
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %nz.addr = alloca i32, align 4
  %Cap.addr = alloca float, align 4
  %Rx.addr = alloca float, align 4
  %Ry.addr = alloca float, align 4
  %Rz.addr = alloca float, align 4
  %dt.addr = alloca float, align 4
  %numiter.addr = alloca i32, align 4
  %ce = alloca float, align 4
  %cw = alloca float, align 4
  %cn = alloca float, align 4
  %cs = alloca float, align 4
  %ct = alloca float, align 4
  %cb = alloca float, align 4
  %cc = alloca float, align 4
  %stepDivCap = alloca float, align 4
  %s = alloca i64, align 8
  %tIn_d = alloca float*, align 8
  %tOut_d = alloca float*, align 8
  %p_d = alloca float*, align 8
  %block_dim = alloca %struct.dim3, align 4
  %grid_dim = alloca %struct.dim3, align 4
  %start = alloca i64, align 8
  %i = alloca i32, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp24 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp24.coerce = alloca { i64, i32 }, align 4
  %t = alloca float*, align 8
  %stop = alloca i64, align 8
  %time = alloca float, align 4
  store float* %p, float** %p.addr, align 8
  call void @llvm.dbg.declare(metadata float** %p.addr, metadata !754, metadata !682), !dbg !755
  store float* %tIn, float** %tIn.addr, align 8
  call void @llvm.dbg.declare(metadata float** %tIn.addr, metadata !756, metadata !682), !dbg !757
  store float* %tOut, float** %tOut.addr, align 8
  call void @llvm.dbg.declare(metadata float** %tOut.addr, metadata !758, metadata !682), !dbg !759
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !760, metadata !682), !dbg !761
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !762, metadata !682), !dbg !763
  store i32 %nz, i32* %nz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nz.addr, metadata !764, metadata !682), !dbg !765
  store float %Cap, float* %Cap.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Cap.addr, metadata !766, metadata !682), !dbg !767
  store float %Rx, float* %Rx.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Rx.addr, metadata !768, metadata !682), !dbg !769
  store float %Ry, float* %Ry.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Ry.addr, metadata !770, metadata !682), !dbg !771
  store float %Rz, float* %Rz.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Rz.addr, metadata !772, metadata !682), !dbg !773
  store float %dt, float* %dt.addr, align 4
  call void @llvm.dbg.declare(metadata float* %dt.addr, metadata !774, metadata !682), !dbg !775
  store i32 %numiter, i32* %numiter.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numiter.addr, metadata !776, metadata !682), !dbg !777
  call void @llvm.dbg.declare(metadata float* %ce, metadata !778, metadata !682), !dbg !779
  call void @llvm.dbg.declare(metadata float* %cw, metadata !780, metadata !682), !dbg !781
  call void @llvm.dbg.declare(metadata float* %cn, metadata !782, metadata !682), !dbg !783
  call void @llvm.dbg.declare(metadata float* %cs, metadata !784, metadata !682), !dbg !785
  call void @llvm.dbg.declare(metadata float* %ct, metadata !786, metadata !682), !dbg !787
  call void @llvm.dbg.declare(metadata float* %cb, metadata !788, metadata !682), !dbg !789
  call void @llvm.dbg.declare(metadata float* %cc, metadata !790, metadata !682), !dbg !791
  call void @llvm.dbg.declare(metadata float* %stepDivCap, metadata !792, metadata !682), !dbg !793
  %0 = load float, float* %dt.addr, align 4, !dbg !794
  %1 = load float, float* %Cap.addr, align 4, !dbg !795
  %div = fdiv float %0, %1, !dbg !796
  store float %div, float* %stepDivCap, align 4, !dbg !793
  %2 = load float, float* %stepDivCap, align 4, !dbg !797
  %3 = load float, float* %Rx.addr, align 4, !dbg !798
  %div1 = fdiv float %2, %3, !dbg !799
  store float %div1, float* %cw, align 4, !dbg !800
  store float %div1, float* %ce, align 4, !dbg !801
  %4 = load float, float* %stepDivCap, align 4, !dbg !802
  %5 = load float, float* %Ry.addr, align 4, !dbg !803
  %div2 = fdiv float %4, %5, !dbg !804
  store float %div2, float* %cs, align 4, !dbg !805
  store float %div2, float* %cn, align 4, !dbg !806
  %6 = load float, float* %stepDivCap, align 4, !dbg !807
  %7 = load float, float* %Rz.addr, align 4, !dbg !808
  %div3 = fdiv float %6, %7, !dbg !809
  store float %div3, float* %cb, align 4, !dbg !810
  store float %div3, float* %ct, align 4, !dbg !811
  %8 = load float, float* %ce, align 4, !dbg !812
  %conv = fpext float %8 to double, !dbg !812
  %mul = fmul double 2.000000e+00, %conv, !dbg !813
  %9 = load float, float* %cn, align 4, !dbg !814
  %conv4 = fpext float %9 to double, !dbg !814
  %mul5 = fmul double 2.000000e+00, %conv4, !dbg !815
  %add = fadd double %mul, %mul5, !dbg !816
  %10 = load float, float* %ct, align 4, !dbg !817
  %conv6 = fpext float %10 to double, !dbg !817
  %mul7 = fmul double 3.000000e+00, %conv6, !dbg !818
  %add8 = fadd double %add, %mul7, !dbg !819
  %sub = fsub double 1.000000e+00, %add8, !dbg !820
  %conv9 = fptrunc double %sub to float, !dbg !821
  store float %conv9, float* %cc, align 4, !dbg !822
  call void @llvm.dbg.declare(metadata i64* %s, metadata !823, metadata !682), !dbg !824
  %11 = load i32, i32* %nx.addr, align 4, !dbg !825
  %conv10 = sext i32 %11 to i64, !dbg !825
  %mul11 = mul i64 4, %conv10, !dbg !826
  %12 = load i32, i32* %ny.addr, align 4, !dbg !827
  %conv12 = sext i32 %12 to i64, !dbg !827
  %mul13 = mul i64 %mul11, %conv12, !dbg !828
  %13 = load i32, i32* %nz.addr, align 4, !dbg !829
  %conv14 = sext i32 %13 to i64, !dbg !829
  %mul15 = mul i64 %mul13, %conv14, !dbg !830
  store i64 %mul15, i64* %s, align 8, !dbg !824
  call void @llvm.dbg.declare(metadata float** %tIn_d, metadata !831, metadata !682), !dbg !832
  call void @llvm.dbg.declare(metadata float** %tOut_d, metadata !833, metadata !682), !dbg !834
  call void @llvm.dbg.declare(metadata float** %p_d, metadata !835, metadata !682), !dbg !836
  %14 = bitcast float** %p_d to i8**, !dbg !837
  %15 = load i64, i64* %s, align 8, !dbg !838
  %call = call i32 @cudaMalloc(i8** %14, i64 %15), !dbg !839
  %16 = bitcast float** %tIn_d to i8**, !dbg !840
  %17 = load i64, i64* %s, align 8, !dbg !841
  %call16 = call i32 @cudaMalloc(i8** %16, i64 %17), !dbg !842
  %18 = bitcast float** %tOut_d to i8**, !dbg !843
  %19 = load i64, i64* %s, align 8, !dbg !844
  %call17 = call i32 @cudaMalloc(i8** %18, i64 %19), !dbg !845
  %20 = load float*, float** %tIn_d, align 8, !dbg !846
  %21 = bitcast float* %20 to i8*, !dbg !846
  %22 = load float*, float** %tIn.addr, align 8, !dbg !847
  %23 = bitcast float* %22 to i8*, !dbg !847
  %24 = load i64, i64* %s, align 8, !dbg !848
  %call18 = call i32 @cudaMemcpy(i8* %21, i8* %23, i64 %24, i32 1), !dbg !849
  %25 = load float*, float** %p_d, align 8, !dbg !850
  %26 = bitcast float* %25 to i8*, !dbg !850
  %27 = load float*, float** %p.addr, align 8, !dbg !851
  %28 = bitcast float* %27 to i8*, !dbg !851
  %29 = load i64, i64* %s, align 8, !dbg !852
  %call19 = call i32 @cudaMemcpy(i8* %26, i8* %28, i64 %29, i32 1), !dbg !853
  %call20 = call i32 @_ZL22cudaFuncSetCacheConfigIFvPfS0_S0_fiiifffffffEE9cudaErrorPT_13cudaFuncCache(void (float*, float*, float*, float, i32, i32, i32, float, float, float, float, float, float, float)* @_Z11hotspotOpt1PfS_S_fiiifffffff, i32 2), !dbg !854
  call void @llvm.dbg.declare(metadata %struct.dim3* %block_dim, metadata !855, metadata !682), !dbg !879
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %block_dim, i32 64, i32 4, i32 1), !dbg !879
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid_dim, metadata !880, metadata !682), !dbg !881
  %30 = load i32, i32* %nx.addr, align 4, !dbg !882
  %div21 = sdiv i32 %30, 64, !dbg !883
  %31 = load i32, i32* %ny.addr, align 4, !dbg !884
  %div22 = sdiv i32 %31, 4, !dbg !885
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid_dim, i32 %div21, i32 %div22, i32 1), !dbg !881
  call void @llvm.dbg.declare(metadata i64* %start, metadata !886, metadata !682), !dbg !887
  %call23 = call i64 @_Z8get_timev(), !dbg !888
  store i64 %call23, i64* %start, align 8, !dbg !887
  call void @llvm.dbg.declare(metadata i32* %i, metadata !889, metadata !682), !dbg !891
  store i32 0, i32* %i, align 4, !dbg !891
  br label %for.cond, !dbg !892

for.cond:                                         ; preds = %for.inc, %entry
  %32 = load i32, i32* %i, align 4, !dbg !893
  %33 = load i32, i32* %numiter.addr, align 4, !dbg !896
  %cmp = icmp slt i32 %32, %33, !dbg !897
  br i1 %cmp, label %for.body, label %for.end, !dbg !898

for.body:                                         ; preds = %for.cond
  %34 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !899
  %35 = bitcast %struct.dim3* %grid_dim to i8*, !dbg !899
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %34, i8* %35, i64 12, i32 4, i1 false), !dbg !899
  %36 = bitcast %struct.dim3* %agg.tmp24 to i8*, !dbg !901
  %37 = bitcast %struct.dim3* %block_dim to i8*, !dbg !901
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %36, i8* %37, i64 12, i32 4, i1 false), !dbg !901
  %38 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !902
  %39 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !902
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %38, i8* %39, i64 12, i32 4, i1 false), !dbg !902
  %40 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !902
  %41 = load i64, i64* %40, align 4, !dbg !902
  %42 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !902
  %43 = load i32, i32* %42, align 4, !dbg !902
  %44 = bitcast { i64, i32 }* %agg.tmp24.coerce to i8*, !dbg !902
  %45 = bitcast %struct.dim3* %agg.tmp24 to i8*, !dbg !902
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %44, i8* %45, i64 12, i32 4, i1 false), !dbg !902
  %46 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp24.coerce, i32 0, i32 0, !dbg !902
  %47 = load i64, i64* %46, align 4, !dbg !902
  %48 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp24.coerce, i32 0, i32 1, !dbg !902
  %49 = load i32, i32* %48, align 4, !dbg !902
  %call25 = call i32 @cudaConfigureCall(i64 %41, i32 %43, i64 %47, i32 %49, i64 0, %struct.CUstream_st* null), !dbg !902
  %tobool = icmp ne i32 %call25, 0, !dbg !902
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !903

kcall.configok:                                   ; preds = %for.body
  %50 = load float*, float** %p_d, align 8, !dbg !904
  %51 = load float*, float** %tIn_d, align 8, !dbg !905
  %52 = load float*, float** %tOut_d, align 8, !dbg !906
  %53 = load float, float* %stepDivCap, align 4, !dbg !907
  %54 = load i32, i32* %nx.addr, align 4, !dbg !908
  %55 = load i32, i32* %ny.addr, align 4, !dbg !909
  %56 = load i32, i32* %nz.addr, align 4, !dbg !910
  %57 = load float, float* %ce, align 4, !dbg !911
  %58 = load float, float* %cw, align 4, !dbg !912
  %59 = load float, float* %cn, align 4, !dbg !913
  %60 = load float, float* %cs, align 4, !dbg !914
  %61 = load float, float* %ct, align 4, !dbg !915
  %62 = load float, float* %cb, align 4, !dbg !916
  %63 = load float, float* %cc, align 4, !dbg !917
  call void @_Z11hotspotOpt1PfS_S_fiiifffffff(float* %50, float* %51, float* %52, float %53, i32 %54, i32 %55, i32 %56, float %57, float %58, float %59, float %60, float %61, float %62, float %63), !dbg !918
  br label %kcall.end, !dbg !918

kcall.end:                                        ; preds = %kcall.configok, %for.body
  call void @llvm.dbg.declare(metadata float** %t, metadata !920, metadata !682), !dbg !921
  %64 = load float*, float** %tIn_d, align 8, !dbg !922
  store float* %64, float** %t, align 8, !dbg !921
  %65 = load float*, float** %tOut_d, align 8, !dbg !923
  store float* %65, float** %tIn_d, align 8, !dbg !924
  %66 = load float*, float** %t, align 8, !dbg !925
  store float* %66, float** %tOut_d, align 8, !dbg !926
  br label %for.inc, !dbg !927

for.inc:                                          ; preds = %kcall.end
  %67 = load i32, i32* %i, align 4, !dbg !928
  %inc = add nsw i32 %67, 1, !dbg !928
  store i32 %inc, i32* %i, align 4, !dbg !928
  br label %for.cond, !dbg !930, !llvm.loop !931

for.end:                                          ; preds = %for.cond
  %call26 = call i32 @cudaDeviceSynchronize(), !dbg !933
  call void @llvm.dbg.declare(metadata i64* %stop, metadata !934, metadata !682), !dbg !935
  %call27 = call i64 @_Z8get_timev(), !dbg !936
  store i64 %call27, i64* %stop, align 8, !dbg !935
  call void @llvm.dbg.declare(metadata float* %time, metadata !937, metadata !682), !dbg !938
  %68 = load i64, i64* %stop, align 8, !dbg !939
  %69 = load i64, i64* %start, align 8, !dbg !940
  %sub28 = sub nsw i64 %68, %69, !dbg !941
  %conv29 = sitofp i64 %sub28 to double, !dbg !942
  %div30 = fdiv double %conv29, 1.000000e+06, !dbg !943
  %conv31 = fptrunc double %div30 to float, !dbg !944
  store float %conv31, float* %time, align 4, !dbg !938
  %70 = load float, float* %time, align 4, !dbg !945
  %conv32 = fpext float %70 to double, !dbg !945
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), double %conv32), !dbg !946
  %71 = load float*, float** %tOut.addr, align 8, !dbg !947
  %72 = bitcast float* %71 to i8*, !dbg !947
  %73 = load float*, float** %tOut_d, align 8, !dbg !948
  %74 = bitcast float* %73 to i8*, !dbg !948
  %75 = load i64, i64* %s, align 8, !dbg !949
  %call34 = call i32 @cudaMemcpy(i8* %72, i8* %74, i64 %75, i32 2), !dbg !950
  %76 = load float*, float** %p_d, align 8, !dbg !951
  %77 = bitcast float* %76 to i8*, !dbg !951
  %call35 = call i32 @cudaFree(i8* %77), !dbg !952
  %78 = load float*, float** %tIn_d, align 8, !dbg !953
  %79 = bitcast float* %78 to i8*, !dbg !953
  %call36 = call i32 @cudaFree(i8* %79), !dbg !954
  %80 = load float*, float** %tOut_d, align 8, !dbg !955
  %81 = bitcast float* %80 to i8*, !dbg !955
  %call37 = call i32 @cudaFree(i8* %81), !dbg !956
  ret void, !dbg !957
}

declare i32 @cudaMalloc(i8**, i64) #4

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #4

; Function Attrs: inlinehint uwtable
define internal i32 @_ZL22cudaFuncSetCacheConfigIFvPfS0_S0_fiiifffffffEE9cudaErrorPT_13cudaFuncCache(void (float*, float*, float*, float, i32, i32, i32, float, float, float, float, float, float, float)* %func, i32 %cacheConfig) #5 !dbg !958 {
entry:
  %func.addr = alloca void (float*, float*, float*, float, i32, i32, i32, float, float, float, float, float, float, float)*, align 8
  %cacheConfig.addr = alloca i32, align 4
  store void (float*, float*, float*, float, i32, i32, i32, float, float, float, float, float, float, float)* %func, void (float*, float*, float*, float, i32, i32, i32, float, float, float, float, float, float, float)** %func.addr, align 8
  call void @llvm.dbg.declare(metadata void (float*, float*, float*, float, i32, i32, i32, float, float, float, float, float, float, float)** %func.addr, metadata !966, metadata !682), !dbg !967
  store i32 %cacheConfig, i32* %cacheConfig.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cacheConfig.addr, metadata !968, metadata !682), !dbg !969
  %0 = load void (float*, float*, float*, float, i32, i32, i32, float, float, float, float, float, float, float)*, void (float*, float*, float*, float, i32, i32, i32, float, float, float, float, float, float, float)** %func.addr, align 8, !dbg !970
  %1 = bitcast void (float*, float*, float*, float, i32, i32, i32, float, float, float, float, float, float, float)* %0 to i8*, !dbg !971
  %2 = load i32, i32* %cacheConfig.addr, align 4, !dbg !972
  %call = call i32 @cudaFuncSetCacheConfig(i8* %1, i32 %2), !dbg !973
  ret i32 %call, !dbg !974
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #0 comdat align 2 !dbg !975 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !976, metadata !682), !dbg !978
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !979, metadata !682), !dbg !980
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !981, metadata !682), !dbg !982
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !983, metadata !682), !dbg !984
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !985
  %0 = load i32, i32* %vx.addr, align 4, !dbg !986
  store i32 %0, i32* %x, align 4, !dbg !985
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !987
  %1 = load i32, i32* %vy.addr, align 4, !dbg !988
  store i32 %1, i32* %y, align 4, !dbg !987
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !989
  %2 = load i32, i32* %vz.addr, align 4, !dbg !990
  store i32 %2, i32* %z, align 4, !dbg !989
  ret void, !dbg !991
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #6

declare i32 @cudaDeviceSynchronize() #4

declare i32 @printf(i8*, ...) #4

declare i32 @cudaFree(i8*) #4

; Function Attrs: uwtable
define void @_Z5fatalPKc(i8* %s) #3 !dbg !992 {
entry:
  %s.addr = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %s.addr, metadata !995, metadata !682), !dbg !996
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !997
  %1 = load i8*, i8** %s.addr, align 8, !dbg !998
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !999
  ret void, !dbg !1000
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: uwtable
define void @_Z9readinputPfiiiPc(float* %vect, i32 %grid_rows, i32 %grid_cols, i32 %layers, i8* %file) #3 !dbg !1001 {
entry:
  %vect.addr = alloca float*, align 8
  %grid_rows.addr = alloca i32, align 4
  %grid_cols.addr = alloca i32, align 4
  %layers.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %fp = alloca %struct._IO_FILE*, align 8
  %str = alloca [256 x i8], align 16
  %val = alloca float, align 4
  store float* %vect, float** %vect.addr, align 8
  call void @llvm.dbg.declare(metadata float** %vect.addr, metadata !1004, metadata !682), !dbg !1005
  store i32 %grid_rows, i32* %grid_rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %grid_rows.addr, metadata !1006, metadata !682), !dbg !1007
  store i32 %grid_cols, i32* %grid_cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %grid_cols.addr, metadata !1008, metadata !682), !dbg !1009
  store i32 %layers, i32* %layers.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %layers.addr, metadata !1010, metadata !682), !dbg !1011
  store i8* %file, i8** %file.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %file.addr, metadata !1012, metadata !682), !dbg !1013
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1014, metadata !682), !dbg !1015
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1016, metadata !682), !dbg !1017
  call void @llvm.dbg.declare(metadata i32* %k, metadata !1018, metadata !682), !dbg !1019
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !1020, metadata !682), !dbg !1026
  call void @llvm.dbg.declare(metadata [256 x i8]* %str, metadata !1027, metadata !682), !dbg !1031
  call void @llvm.dbg.declare(metadata float* %val, metadata !1032, metadata !682), !dbg !1033
  %0 = load i8*, i8** %file.addr, align 8, !dbg !1034
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0)), !dbg !1036
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !1037
  %cmp = icmp eq %struct._IO_FILE* %call, null, !dbg !1038
  br i1 %cmp, label %if.then, label %if.end, !dbg !1039

if.then:                                          ; preds = %entry
  call void @_Z5fatalPKc(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.3, i32 0, i32 0)), !dbg !1040
  br label %if.end, !dbg !1040

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4, !dbg !1041
  br label %for.cond, !dbg !1043

for.cond:                                         ; preds = %for.inc28, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !1044
  %2 = load i32, i32* %grid_rows.addr, align 4, !dbg !1047
  %sub = sub nsw i32 %2, 1, !dbg !1048
  %cmp1 = icmp sle i32 %1, %sub, !dbg !1049
  br i1 %cmp1, label %for.body, label %for.end30, !dbg !1050

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !1051
  br label %for.cond2, !dbg !1053

for.cond2:                                        ; preds = %for.inc25, %for.body
  %3 = load i32, i32* %j, align 4, !dbg !1054
  %4 = load i32, i32* %grid_cols.addr, align 4, !dbg !1057
  %sub3 = sub nsw i32 %4, 1, !dbg !1058
  %cmp4 = icmp sle i32 %3, %sub3, !dbg !1059
  br i1 %cmp4, label %for.body5, label %for.end27, !dbg !1060

for.body5:                                        ; preds = %for.cond2
  store i32 0, i32* %k, align 4, !dbg !1061
  br label %for.cond6, !dbg !1063

for.cond6:                                        ; preds = %for.inc, %for.body5
  %5 = load i32, i32* %k, align 4, !dbg !1064
  %6 = load i32, i32* %layers.addr, align 4, !dbg !1067
  %sub7 = sub nsw i32 %6, 1, !dbg !1068
  %cmp8 = icmp sle i32 %5, %sub7, !dbg !1069
  br i1 %cmp8, label %for.body9, label %for.end, !dbg !1070

for.body9:                                        ; preds = %for.cond6
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %str, i32 0, i32 0, !dbg !1071
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !1074
  %call10 = call i8* @fgets(i8* %arraydecay, i32 256, %struct._IO_FILE* %7), !dbg !1075
  %cmp11 = icmp eq i8* %call10, null, !dbg !1076
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !1077

if.then12:                                        ; preds = %for.body9
  call void @_Z5fatalPKc(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i32 0, i32 0)), !dbg !1078
  br label %if.end13, !dbg !1078

if.end13:                                         ; preds = %if.then12, %for.body9
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !1080
  %call14 = call i32 @feof(%struct._IO_FILE* %8) #10, !dbg !1082
  %tobool = icmp ne i32 %call14, 0, !dbg !1082
  br i1 %tobool, label %if.then15, label %if.end16, !dbg !1083

if.then15:                                        ; preds = %if.end13
  call void @_Z5fatalPKc(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i32 0, i32 0)), !dbg !1084
  br label %if.end16, !dbg !1084

if.end16:                                         ; preds = %if.then15, %if.end13
  %arraydecay17 = getelementptr inbounds [256 x i8], [256 x i8]* %str, i32 0, i32 0, !dbg !1085
  %call18 = call i32 (i8*, i8*, ...) @sscanf(i8* %arraydecay17, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), float* %val) #10, !dbg !1087
  %cmp19 = icmp ne i32 %call18, 1, !dbg !1088
  br i1 %cmp19, label %if.then20, label %if.end21, !dbg !1089

if.then20:                                        ; preds = %if.end16
  call void @_Z5fatalPKc(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i32 0, i32 0)), !dbg !1090
  br label %if.end21, !dbg !1090

if.end21:                                         ; preds = %if.then20, %if.end16
  %9 = load float, float* %val, align 4, !dbg !1091
  %10 = load float*, float** %vect.addr, align 8, !dbg !1092
  %11 = load i32, i32* %i, align 4, !dbg !1093
  %12 = load i32, i32* %grid_cols.addr, align 4, !dbg !1094
  %mul = mul nsw i32 %11, %12, !dbg !1095
  %13 = load i32, i32* %j, align 4, !dbg !1096
  %add = add nsw i32 %mul, %13, !dbg !1097
  %14 = load i32, i32* %k, align 4, !dbg !1098
  %15 = load i32, i32* %grid_rows.addr, align 4, !dbg !1099
  %mul22 = mul nsw i32 %14, %15, !dbg !1100
  %16 = load i32, i32* %grid_cols.addr, align 4, !dbg !1101
  %mul23 = mul nsw i32 %mul22, %16, !dbg !1102
  %add24 = add nsw i32 %add, %mul23, !dbg !1103
  %idxprom = sext i32 %add24 to i64, !dbg !1092
  %arrayidx = getelementptr inbounds float, float* %10, i64 %idxprom, !dbg !1092
  store float %9, float* %arrayidx, align 4, !dbg !1104
  br label %for.inc, !dbg !1105

for.inc:                                          ; preds = %if.end21
  %17 = load i32, i32* %k, align 4, !dbg !1106
  %inc = add nsw i32 %17, 1, !dbg !1106
  store i32 %inc, i32* %k, align 4, !dbg !1106
  br label %for.cond6, !dbg !1108, !llvm.loop !1109

for.end:                                          ; preds = %for.cond6
  br label %for.inc25, !dbg !1111

for.inc25:                                        ; preds = %for.end
  %18 = load i32, i32* %j, align 4, !dbg !1113
  %inc26 = add nsw i32 %18, 1, !dbg !1113
  store i32 %inc26, i32* %j, align 4, !dbg !1113
  br label %for.cond2, !dbg !1115, !llvm.loop !1116

for.end27:                                        ; preds = %for.cond2
  br label %for.inc28, !dbg !1118

for.inc28:                                        ; preds = %for.end27
  %19 = load i32, i32* %i, align 4, !dbg !1120
  %inc29 = add nsw i32 %19, 1, !dbg !1120
  store i32 %inc29, i32* %i, align 4, !dbg !1120
  br label %for.cond, !dbg !1122, !llvm.loop !1123

for.end30:                                        ; preds = %for.cond
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !1125
  %call31 = call i32 @fclose(%struct._IO_FILE* %20), !dbg !1126
  ret void, !dbg !1127
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #4

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #4

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare i32 @sscanf(i8*, i8*, ...) #2

declare i32 @fclose(%struct._IO_FILE*) #4

; Function Attrs: uwtable
define void @_Z11writeoutputPfiiiPc(float* %vect, i32 %grid_rows, i32 %grid_cols, i32 %layers, i8* %file) #3 !dbg !1128 {
entry:
  %vect.addr = alloca float*, align 8
  %grid_rows.addr = alloca i32, align 4
  %grid_cols.addr = alloca i32, align 4
  %layers.addr = alloca i32, align 4
  %file.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %index = alloca i32, align 4
  %fp = alloca %struct._IO_FILE*, align 8
  %str = alloca [256 x i8], align 16
  store float* %vect, float** %vect.addr, align 8
  call void @llvm.dbg.declare(metadata float** %vect.addr, metadata !1129, metadata !682), !dbg !1130
  store i32 %grid_rows, i32* %grid_rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %grid_rows.addr, metadata !1131, metadata !682), !dbg !1132
  store i32 %grid_cols, i32* %grid_cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %grid_cols.addr, metadata !1133, metadata !682), !dbg !1134
  store i32 %layers, i32* %layers.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %layers.addr, metadata !1135, metadata !682), !dbg !1136
  store i8* %file, i8** %file.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %file.addr, metadata !1137, metadata !682), !dbg !1138
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1139, metadata !682), !dbg !1140
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1141, metadata !682), !dbg !1142
  call void @llvm.dbg.declare(metadata i32* %k, metadata !1143, metadata !682), !dbg !1144
  call void @llvm.dbg.declare(metadata i32* %index, metadata !1145, metadata !682), !dbg !1146
  store i32 0, i32* %index, align 4, !dbg !1146
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !1147, metadata !682), !dbg !1148
  call void @llvm.dbg.declare(metadata [256 x i8]* %str, metadata !1149, metadata !682), !dbg !1150
  %0 = load i8*, i8** %file.addr, align 8, !dbg !1151
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0)), !dbg !1153
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !1154
  %cmp = icmp eq %struct._IO_FILE* %call, null, !dbg !1155
  br i1 %cmp, label %if.then, label %if.end, !dbg !1156

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.9, i32 0, i32 0)), !dbg !1157
  br label %if.end, !dbg !1157

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4, !dbg !1158
  br label %for.cond, !dbg !1160

for.cond:                                         ; preds = %for.inc19, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !1161
  %2 = load i32, i32* %grid_rows.addr, align 4, !dbg !1164
  %cmp2 = icmp slt i32 %1, %2, !dbg !1165
  br i1 %cmp2, label %for.body, label %for.end21, !dbg !1166

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !1167
  br label %for.cond3, !dbg !1169

for.cond3:                                        ; preds = %for.inc16, %for.body
  %3 = load i32, i32* %j, align 4, !dbg !1170
  %4 = load i32, i32* %grid_cols.addr, align 4, !dbg !1173
  %cmp4 = icmp slt i32 %3, %4, !dbg !1174
  br i1 %cmp4, label %for.body5, label %for.end18, !dbg !1175

for.body5:                                        ; preds = %for.cond3
  store i32 0, i32* %k, align 4, !dbg !1176
  br label %for.cond6, !dbg !1178

for.cond6:                                        ; preds = %for.inc, %for.body5
  %5 = load i32, i32* %k, align 4, !dbg !1179
  %6 = load i32, i32* %layers.addr, align 4, !dbg !1182
  %cmp7 = icmp slt i32 %5, %6, !dbg !1183
  br i1 %cmp7, label %for.body8, label %for.end, !dbg !1184

for.body8:                                        ; preds = %for.cond6
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %str, i32 0, i32 0, !dbg !1185
  %7 = load i32, i32* %index, align 4, !dbg !1187
  %8 = load float*, float** %vect.addr, align 8, !dbg !1188
  %9 = load i32, i32* %i, align 4, !dbg !1189
  %10 = load i32, i32* %grid_cols.addr, align 4, !dbg !1190
  %mul = mul nsw i32 %9, %10, !dbg !1191
  %11 = load i32, i32* %j, align 4, !dbg !1192
  %add = add nsw i32 %mul, %11, !dbg !1193
  %12 = load i32, i32* %k, align 4, !dbg !1194
  %13 = load i32, i32* %grid_rows.addr, align 4, !dbg !1195
  %mul9 = mul nsw i32 %12, %13, !dbg !1196
  %14 = load i32, i32* %grid_cols.addr, align 4, !dbg !1197
  %mul10 = mul nsw i32 %mul9, %14, !dbg !1198
  %add11 = add nsw i32 %add, %mul10, !dbg !1199
  %idxprom = sext i32 %add11 to i64, !dbg !1188
  %arrayidx = getelementptr inbounds float, float* %8, i64 %idxprom, !dbg !1188
  %15 = load float, float* %arrayidx, align 4, !dbg !1188
  %conv = fpext float %15 to double, !dbg !1188
  %call12 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0), i32 %7, double %conv) #10, !dbg !1200
  %arraydecay13 = getelementptr inbounds [256 x i8], [256 x i8]* %str, i32 0, i32 0, !dbg !1201
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !1202
  %call14 = call i32 @fputs(i8* %arraydecay13, %struct._IO_FILE* %16), !dbg !1203
  %17 = load i32, i32* %index, align 4, !dbg !1204
  %inc = add nsw i32 %17, 1, !dbg !1204
  store i32 %inc, i32* %index, align 4, !dbg !1204
  br label %for.inc, !dbg !1205

for.inc:                                          ; preds = %for.body8
  %18 = load i32, i32* %k, align 4, !dbg !1206
  %inc15 = add nsw i32 %18, 1, !dbg !1206
  store i32 %inc15, i32* %k, align 4, !dbg !1206
  br label %for.cond6, !dbg !1208, !llvm.loop !1209

for.end:                                          ; preds = %for.cond6
  br label %for.inc16, !dbg !1211

for.inc16:                                        ; preds = %for.end
  %19 = load i32, i32* %j, align 4, !dbg !1213
  %inc17 = add nsw i32 %19, 1, !dbg !1213
  store i32 %inc17, i32* %j, align 4, !dbg !1213
  br label %for.cond3, !dbg !1215, !llvm.loop !1216

for.end18:                                        ; preds = %for.cond3
  br label %for.inc19, !dbg !1218

for.inc19:                                        ; preds = %for.end18
  %20 = load i32, i32* %i, align 4, !dbg !1220
  %inc20 = add nsw i32 %20, 1, !dbg !1220
  store i32 %inc20, i32* %i, align 4, !dbg !1220
  br label %for.cond, !dbg !1222, !llvm.loop !1223

for.end21:                                        ; preds = %for.cond
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !1225
  %call22 = call i32 @fclose(%struct._IO_FILE* %21), !dbg !1226
  ret void, !dbg !1227
}

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #2

declare i32 @fputs(i8*, %struct._IO_FILE*) #4

; Function Attrs: nounwind uwtable
define void @_Z14computeTempCPUPfS_S_iiifffffi(float* %pIn, float* %tIn, float* %tOut, i32 %nx, i32 %ny, i32 %nz, float %Cap, float %Rx, float %Ry, float %Rz, float %dt, i32 %numiter) #0 !dbg !1228 {
entry:
  %pIn.addr = alloca float*, align 8
  %tIn.addr = alloca float*, align 8
  %tOut.addr = alloca float*, align 8
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %nz.addr = alloca i32, align 4
  %Cap.addr = alloca float, align 4
  %Rx.addr = alloca float, align 4
  %Ry.addr = alloca float, align 4
  %Rz.addr = alloca float, align 4
  %dt.addr = alloca float, align 4
  %numiter.addr = alloca i32, align 4
  %ce = alloca float, align 4
  %cw = alloca float, align 4
  %cn = alloca float, align 4
  %cs = alloca float, align 4
  %ct = alloca float, align 4
  %cb = alloca float, align 4
  %cc = alloca float, align 4
  %stepDivCap = alloca float, align 4
  %c = alloca i32, align 4
  %w = alloca i32, align 4
  %e = alloca i32, align 4
  %n = alloca i32, align 4
  %s = alloca i32, align 4
  %b = alloca i32, align 4
  %t = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %i = alloca i32, align 4
  %temp = alloca float*, align 8
  store float* %pIn, float** %pIn.addr, align 8
  call void @llvm.dbg.declare(metadata float** %pIn.addr, metadata !1229, metadata !682), !dbg !1230
  store float* %tIn, float** %tIn.addr, align 8
  call void @llvm.dbg.declare(metadata float** %tIn.addr, metadata !1231, metadata !682), !dbg !1232
  store float* %tOut, float** %tOut.addr, align 8
  call void @llvm.dbg.declare(metadata float** %tOut.addr, metadata !1233, metadata !682), !dbg !1234
  store i32 %nx, i32* %nx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nx.addr, metadata !1235, metadata !682), !dbg !1236
  store i32 %ny, i32* %ny.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ny.addr, metadata !1237, metadata !682), !dbg !1238
  store i32 %nz, i32* %nz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nz.addr, metadata !1239, metadata !682), !dbg !1240
  store float %Cap, float* %Cap.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Cap.addr, metadata !1241, metadata !682), !dbg !1242
  store float %Rx, float* %Rx.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Rx.addr, metadata !1243, metadata !682), !dbg !1244
  store float %Ry, float* %Ry.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Ry.addr, metadata !1245, metadata !682), !dbg !1246
  store float %Rz, float* %Rz.addr, align 4
  call void @llvm.dbg.declare(metadata float* %Rz.addr, metadata !1247, metadata !682), !dbg !1248
  store float %dt, float* %dt.addr, align 4
  call void @llvm.dbg.declare(metadata float* %dt.addr, metadata !1249, metadata !682), !dbg !1250
  store i32 %numiter, i32* %numiter.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numiter.addr, metadata !1251, metadata !682), !dbg !1252
  call void @llvm.dbg.declare(metadata float* %ce, metadata !1253, metadata !682), !dbg !1254
  call void @llvm.dbg.declare(metadata float* %cw, metadata !1255, metadata !682), !dbg !1256
  call void @llvm.dbg.declare(metadata float* %cn, metadata !1257, metadata !682), !dbg !1258
  call void @llvm.dbg.declare(metadata float* %cs, metadata !1259, metadata !682), !dbg !1260
  call void @llvm.dbg.declare(metadata float* %ct, metadata !1261, metadata !682), !dbg !1262
  call void @llvm.dbg.declare(metadata float* %cb, metadata !1263, metadata !682), !dbg !1264
  call void @llvm.dbg.declare(metadata float* %cc, metadata !1265, metadata !682), !dbg !1266
  call void @llvm.dbg.declare(metadata float* %stepDivCap, metadata !1267, metadata !682), !dbg !1268
  %0 = load float, float* %dt.addr, align 4, !dbg !1269
  %1 = load float, float* %Cap.addr, align 4, !dbg !1270
  %div = fdiv float %0, %1, !dbg !1271
  store float %div, float* %stepDivCap, align 4, !dbg !1268
  %2 = load float, float* %stepDivCap, align 4, !dbg !1272
  %3 = load float, float* %Rx.addr, align 4, !dbg !1273
  %div1 = fdiv float %2, %3, !dbg !1274
  store float %div1, float* %cw, align 4, !dbg !1275
  store float %div1, float* %ce, align 4, !dbg !1276
  %4 = load float, float* %stepDivCap, align 4, !dbg !1277
  %5 = load float, float* %Ry.addr, align 4, !dbg !1278
  %div2 = fdiv float %4, %5, !dbg !1279
  store float %div2, float* %cs, align 4, !dbg !1280
  store float %div2, float* %cn, align 4, !dbg !1281
  %6 = load float, float* %stepDivCap, align 4, !dbg !1282
  %7 = load float, float* %Rz.addr, align 4, !dbg !1283
  %div3 = fdiv float %6, %7, !dbg !1284
  store float %div3, float* %cb, align 4, !dbg !1285
  store float %div3, float* %ct, align 4, !dbg !1286
  %8 = load float, float* %ce, align 4, !dbg !1287
  %conv = fpext float %8 to double, !dbg !1287
  %mul = fmul double 2.000000e+00, %conv, !dbg !1288
  %9 = load float, float* %cn, align 4, !dbg !1289
  %conv4 = fpext float %9 to double, !dbg !1289
  %mul5 = fmul double 2.000000e+00, %conv4, !dbg !1290
  %add = fadd double %mul, %mul5, !dbg !1291
  %10 = load float, float* %ct, align 4, !dbg !1292
  %conv6 = fpext float %10 to double, !dbg !1292
  %mul7 = fmul double 3.000000e+00, %conv6, !dbg !1293
  %add8 = fadd double %add, %mul7, !dbg !1294
  %sub = fsub double 1.000000e+00, %add8, !dbg !1295
  %conv9 = fptrunc double %sub to float, !dbg !1296
  store float %conv9, float* %cc, align 4, !dbg !1297
  call void @llvm.dbg.declare(metadata i32* %c, metadata !1298, metadata !682), !dbg !1299
  call void @llvm.dbg.declare(metadata i32* %w, metadata !1300, metadata !682), !dbg !1301
  call void @llvm.dbg.declare(metadata i32* %e, metadata !1302, metadata !682), !dbg !1303
  call void @llvm.dbg.declare(metadata i32* %n, metadata !1304, metadata !682), !dbg !1305
  call void @llvm.dbg.declare(metadata i32* %s, metadata !1306, metadata !682), !dbg !1307
  call void @llvm.dbg.declare(metadata i32* %b, metadata !1308, metadata !682), !dbg !1309
  call void @llvm.dbg.declare(metadata i32* %t, metadata !1310, metadata !682), !dbg !1311
  call void @llvm.dbg.declare(metadata i32* %x, metadata !1312, metadata !682), !dbg !1313
  call void @llvm.dbg.declare(metadata i32* %y, metadata !1314, metadata !682), !dbg !1315
  call void @llvm.dbg.declare(metadata i32* %z, metadata !1316, metadata !682), !dbg !1317
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1318, metadata !682), !dbg !1319
  store i32 0, i32* %i, align 4, !dbg !1319
  br label %do.body, !dbg !1320, !llvm.loop !1321

do.body:                                          ; preds = %do.cond, %entry
  store i32 0, i32* %z, align 4, !dbg !1322
  br label %for.cond, !dbg !1325

for.cond:                                         ; preds = %for.inc95, %do.body
  %11 = load i32, i32* %z, align 4, !dbg !1326
  %12 = load i32, i32* %nz.addr, align 4, !dbg !1329
  %cmp = icmp slt i32 %11, %12, !dbg !1330
  br i1 %cmp, label %for.body, label %for.end97, !dbg !1331

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %y, align 4, !dbg !1332
  br label %for.cond10, !dbg !1334

for.cond10:                                       ; preds = %for.inc92, %for.body
  %13 = load i32, i32* %y, align 4, !dbg !1335
  %14 = load i32, i32* %ny.addr, align 4, !dbg !1338
  %cmp11 = icmp slt i32 %13, %14, !dbg !1339
  br i1 %cmp11, label %for.body12, label %for.end94, !dbg !1340

for.body12:                                       ; preds = %for.cond10
  store i32 0, i32* %x, align 4, !dbg !1341
  br label %for.cond13, !dbg !1343

for.cond13:                                       ; preds = %for.inc, %for.body12
  %15 = load i32, i32* %x, align 4, !dbg !1344
  %16 = load i32, i32* %nx.addr, align 4, !dbg !1347
  %cmp14 = icmp slt i32 %15, %16, !dbg !1348
  br i1 %cmp14, label %for.body15, label %for.end, !dbg !1349

for.body15:                                       ; preds = %for.cond13
  %17 = load i32, i32* %x, align 4, !dbg !1350
  %18 = load i32, i32* %y, align 4, !dbg !1352
  %19 = load i32, i32* %nx.addr, align 4, !dbg !1353
  %mul16 = mul nsw i32 %18, %19, !dbg !1354
  %add17 = add nsw i32 %17, %mul16, !dbg !1355
  %20 = load i32, i32* %z, align 4, !dbg !1356
  %21 = load i32, i32* %nx.addr, align 4, !dbg !1357
  %mul18 = mul nsw i32 %20, %21, !dbg !1358
  %22 = load i32, i32* %ny.addr, align 4, !dbg !1359
  %mul19 = mul nsw i32 %mul18, %22, !dbg !1360
  %add20 = add nsw i32 %add17, %mul19, !dbg !1361
  store i32 %add20, i32* %c, align 4, !dbg !1362
  %23 = load i32, i32* %x, align 4, !dbg !1363
  %cmp21 = icmp eq i32 %23, 0, !dbg !1364
  br i1 %cmp21, label %cond.true, label %cond.false, !dbg !1365

cond.true:                                        ; preds = %for.body15
  %24 = load i32, i32* %c, align 4, !dbg !1366
  br label %cond.end, !dbg !1368

cond.false:                                       ; preds = %for.body15
  %25 = load i32, i32* %c, align 4, !dbg !1369
  %sub22 = sub nsw i32 %25, 1, !dbg !1371
  br label %cond.end, !dbg !1372

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %24, %cond.true ], [ %sub22, %cond.false ], !dbg !1373
  store i32 %cond, i32* %w, align 4, !dbg !1375
  %26 = load i32, i32* %x, align 4, !dbg !1376
  %27 = load i32, i32* %nx.addr, align 4, !dbg !1377
  %sub23 = sub nsw i32 %27, 1, !dbg !1378
  %cmp24 = icmp eq i32 %26, %sub23, !dbg !1379
  br i1 %cmp24, label %cond.true25, label %cond.false26, !dbg !1380

cond.true25:                                      ; preds = %cond.end
  %28 = load i32, i32* %c, align 4, !dbg !1381
  br label %cond.end28, !dbg !1382

cond.false26:                                     ; preds = %cond.end
  %29 = load i32, i32* %c, align 4, !dbg !1383
  %add27 = add nsw i32 %29, 1, !dbg !1384
  br label %cond.end28, !dbg !1385

cond.end28:                                       ; preds = %cond.false26, %cond.true25
  %cond29 = phi i32 [ %28, %cond.true25 ], [ %add27, %cond.false26 ], !dbg !1386
  store i32 %cond29, i32* %e, align 4, !dbg !1387
  %30 = load i32, i32* %y, align 4, !dbg !1388
  %cmp30 = icmp eq i32 %30, 0, !dbg !1389
  br i1 %cmp30, label %cond.true31, label %cond.false32, !dbg !1390

cond.true31:                                      ; preds = %cond.end28
  %31 = load i32, i32* %c, align 4, !dbg !1391
  br label %cond.end34, !dbg !1392

cond.false32:                                     ; preds = %cond.end28
  %32 = load i32, i32* %c, align 4, !dbg !1393
  %33 = load i32, i32* %nx.addr, align 4, !dbg !1394
  %sub33 = sub nsw i32 %32, %33, !dbg !1395
  br label %cond.end34, !dbg !1396

cond.end34:                                       ; preds = %cond.false32, %cond.true31
  %cond35 = phi i32 [ %31, %cond.true31 ], [ %sub33, %cond.false32 ], !dbg !1397
  store i32 %cond35, i32* %n, align 4, !dbg !1398
  %34 = load i32, i32* %y, align 4, !dbg !1399
  %35 = load i32, i32* %ny.addr, align 4, !dbg !1400
  %sub36 = sub nsw i32 %35, 1, !dbg !1401
  %cmp37 = icmp eq i32 %34, %sub36, !dbg !1402
  br i1 %cmp37, label %cond.true38, label %cond.false39, !dbg !1403

cond.true38:                                      ; preds = %cond.end34
  %36 = load i32, i32* %c, align 4, !dbg !1404
  br label %cond.end41, !dbg !1405

cond.false39:                                     ; preds = %cond.end34
  %37 = load i32, i32* %c, align 4, !dbg !1406
  %38 = load i32, i32* %nx.addr, align 4, !dbg !1407
  %add40 = add nsw i32 %37, %38, !dbg !1408
  br label %cond.end41, !dbg !1409

cond.end41:                                       ; preds = %cond.false39, %cond.true38
  %cond42 = phi i32 [ %36, %cond.true38 ], [ %add40, %cond.false39 ], !dbg !1410
  store i32 %cond42, i32* %s, align 4, !dbg !1411
  %39 = load i32, i32* %z, align 4, !dbg !1412
  %cmp43 = icmp eq i32 %39, 0, !dbg !1413
  br i1 %cmp43, label %cond.true44, label %cond.false45, !dbg !1414

cond.true44:                                      ; preds = %cond.end41
  %40 = load i32, i32* %c, align 4, !dbg !1415
  br label %cond.end48, !dbg !1416

cond.false45:                                     ; preds = %cond.end41
  %41 = load i32, i32* %c, align 4, !dbg !1417
  %42 = load i32, i32* %nx.addr, align 4, !dbg !1418
  %43 = load i32, i32* %ny.addr, align 4, !dbg !1419
  %mul46 = mul nsw i32 %42, %43, !dbg !1420
  %sub47 = sub nsw i32 %41, %mul46, !dbg !1421
  br label %cond.end48, !dbg !1422

cond.end48:                                       ; preds = %cond.false45, %cond.true44
  %cond49 = phi i32 [ %40, %cond.true44 ], [ %sub47, %cond.false45 ], !dbg !1423
  store i32 %cond49, i32* %b, align 4, !dbg !1424
  %44 = load i32, i32* %z, align 4, !dbg !1425
  %45 = load i32, i32* %nz.addr, align 4, !dbg !1426
  %sub50 = sub nsw i32 %45, 1, !dbg !1427
  %cmp51 = icmp eq i32 %44, %sub50, !dbg !1428
  br i1 %cmp51, label %cond.true52, label %cond.false53, !dbg !1429

cond.true52:                                      ; preds = %cond.end48
  %46 = load i32, i32* %c, align 4, !dbg !1430
  br label %cond.end56, !dbg !1431

cond.false53:                                     ; preds = %cond.end48
  %47 = load i32, i32* %c, align 4, !dbg !1432
  %48 = load i32, i32* %nx.addr, align 4, !dbg !1433
  %49 = load i32, i32* %ny.addr, align 4, !dbg !1434
  %mul54 = mul nsw i32 %48, %49, !dbg !1435
  %add55 = add nsw i32 %47, %mul54, !dbg !1436
  br label %cond.end56, !dbg !1437

cond.end56:                                       ; preds = %cond.false53, %cond.true52
  %cond57 = phi i32 [ %46, %cond.true52 ], [ %add55, %cond.false53 ], !dbg !1438
  store i32 %cond57, i32* %t, align 4, !dbg !1439
  %50 = load float*, float** %tIn.addr, align 8, !dbg !1440
  %51 = load i32, i32* %c, align 4, !dbg !1441
  %idxprom = sext i32 %51 to i64, !dbg !1440
  %arrayidx = getelementptr inbounds float, float* %50, i64 %idxprom, !dbg !1440
  %52 = load float, float* %arrayidx, align 4, !dbg !1440
  %53 = load float, float* %cc, align 4, !dbg !1442
  %mul58 = fmul float %52, %53, !dbg !1443
  %54 = load float*, float** %tIn.addr, align 8, !dbg !1444
  %55 = load i32, i32* %n, align 4, !dbg !1445
  %idxprom59 = sext i32 %55 to i64, !dbg !1444
  %arrayidx60 = getelementptr inbounds float, float* %54, i64 %idxprom59, !dbg !1444
  %56 = load float, float* %arrayidx60, align 4, !dbg !1444
  %57 = load float, float* %cn, align 4, !dbg !1446
  %mul61 = fmul float %56, %57, !dbg !1447
  %add62 = fadd float %mul58, %mul61, !dbg !1448
  %58 = load float*, float** %tIn.addr, align 8, !dbg !1449
  %59 = load i32, i32* %s, align 4, !dbg !1450
  %idxprom63 = sext i32 %59 to i64, !dbg !1449
  %arrayidx64 = getelementptr inbounds float, float* %58, i64 %idxprom63, !dbg !1449
  %60 = load float, float* %arrayidx64, align 4, !dbg !1449
  %61 = load float, float* %cs, align 4, !dbg !1451
  %mul65 = fmul float %60, %61, !dbg !1452
  %add66 = fadd float %add62, %mul65, !dbg !1453
  %62 = load float*, float** %tIn.addr, align 8, !dbg !1454
  %63 = load i32, i32* %e, align 4, !dbg !1455
  %idxprom67 = sext i32 %63 to i64, !dbg !1454
  %arrayidx68 = getelementptr inbounds float, float* %62, i64 %idxprom67, !dbg !1454
  %64 = load float, float* %arrayidx68, align 4, !dbg !1454
  %65 = load float, float* %ce, align 4, !dbg !1456
  %mul69 = fmul float %64, %65, !dbg !1457
  %add70 = fadd float %add66, %mul69, !dbg !1458
  %66 = load float*, float** %tIn.addr, align 8, !dbg !1459
  %67 = load i32, i32* %w, align 4, !dbg !1460
  %idxprom71 = sext i32 %67 to i64, !dbg !1459
  %arrayidx72 = getelementptr inbounds float, float* %66, i64 %idxprom71, !dbg !1459
  %68 = load float, float* %arrayidx72, align 4, !dbg !1459
  %69 = load float, float* %cw, align 4, !dbg !1461
  %mul73 = fmul float %68, %69, !dbg !1462
  %add74 = fadd float %add70, %mul73, !dbg !1463
  %70 = load float*, float** %tIn.addr, align 8, !dbg !1464
  %71 = load i32, i32* %t, align 4, !dbg !1465
  %idxprom75 = sext i32 %71 to i64, !dbg !1464
  %arrayidx76 = getelementptr inbounds float, float* %70, i64 %idxprom75, !dbg !1464
  %72 = load float, float* %arrayidx76, align 4, !dbg !1464
  %73 = load float, float* %ct, align 4, !dbg !1466
  %mul77 = fmul float %72, %73, !dbg !1467
  %add78 = fadd float %add74, %mul77, !dbg !1468
  %74 = load float*, float** %tIn.addr, align 8, !dbg !1469
  %75 = load i32, i32* %b, align 4, !dbg !1470
  %idxprom79 = sext i32 %75 to i64, !dbg !1469
  %arrayidx80 = getelementptr inbounds float, float* %74, i64 %idxprom79, !dbg !1469
  %76 = load float, float* %arrayidx80, align 4, !dbg !1469
  %77 = load float, float* %cb, align 4, !dbg !1471
  %mul81 = fmul float %76, %77, !dbg !1472
  %add82 = fadd float %add78, %mul81, !dbg !1473
  %78 = load float, float* %dt.addr, align 4, !dbg !1474
  %79 = load float, float* %Cap.addr, align 4, !dbg !1475
  %div83 = fdiv float %78, %79, !dbg !1476
  %80 = load float*, float** %pIn.addr, align 8, !dbg !1477
  %81 = load i32, i32* %c, align 4, !dbg !1478
  %idxprom84 = sext i32 %81 to i64, !dbg !1477
  %arrayidx85 = getelementptr inbounds float, float* %80, i64 %idxprom84, !dbg !1477
  %82 = load float, float* %arrayidx85, align 4, !dbg !1477
  %mul86 = fmul float %div83, %82, !dbg !1479
  %add87 = fadd float %add82, %mul86, !dbg !1480
  %83 = load float, float* %ct, align 4, !dbg !1481
  %84 = load float, float* @amb_temp, align 4, !dbg !1482
  %mul88 = fmul float %83, %84, !dbg !1483
  %add89 = fadd float %add87, %mul88, !dbg !1484
  %85 = load float*, float** %tOut.addr, align 8, !dbg !1485
  %86 = load i32, i32* %c, align 4, !dbg !1486
  %idxprom90 = sext i32 %86 to i64, !dbg !1485
  %arrayidx91 = getelementptr inbounds float, float* %85, i64 %idxprom90, !dbg !1485
  store float %add89, float* %arrayidx91, align 4, !dbg !1487
  br label %for.inc, !dbg !1488

for.inc:                                          ; preds = %cond.end56
  %87 = load i32, i32* %x, align 4, !dbg !1489
  %inc = add nsw i32 %87, 1, !dbg !1489
  store i32 %inc, i32* %x, align 4, !dbg !1489
  br label %for.cond13, !dbg !1491, !llvm.loop !1492

for.end:                                          ; preds = %for.cond13
  br label %for.inc92, !dbg !1494

for.inc92:                                        ; preds = %for.end
  %88 = load i32, i32* %y, align 4, !dbg !1496
  %inc93 = add nsw i32 %88, 1, !dbg !1496
  store i32 %inc93, i32* %y, align 4, !dbg !1496
  br label %for.cond10, !dbg !1498, !llvm.loop !1499

for.end94:                                        ; preds = %for.cond10
  br label %for.inc95, !dbg !1501

for.inc95:                                        ; preds = %for.end94
  %89 = load i32, i32* %z, align 4, !dbg !1503
  %inc96 = add nsw i32 %89, 1, !dbg !1503
  store i32 %inc96, i32* %z, align 4, !dbg !1503
  br label %for.cond, !dbg !1505, !llvm.loop !1506

for.end97:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata float** %temp, metadata !1508, metadata !682), !dbg !1509
  %90 = load float*, float** %tIn.addr, align 8, !dbg !1510
  store float* %90, float** %temp, align 8, !dbg !1509
  %91 = load float*, float** %tOut.addr, align 8, !dbg !1511
  store float* %91, float** %tIn.addr, align 8, !dbg !1512
  %92 = load float*, float** %temp, align 8, !dbg !1513
  store float* %92, float** %tOut.addr, align 8, !dbg !1514
  %93 = load i32, i32* %i, align 4, !dbg !1515
  %inc98 = add nsw i32 %93, 1, !dbg !1515
  store i32 %inc98, i32* %i, align 4, !dbg !1515
  br label %do.cond, !dbg !1516

do.cond:                                          ; preds = %for.end97
  %94 = load i32, i32* %i, align 4, !dbg !1517
  %95 = load i32, i32* %numiter.addr, align 4, !dbg !1518
  %cmp99 = icmp slt i32 %94, %95, !dbg !1519
  br i1 %cmp99, label %do.body, label %do.end, !dbg !1520, !llvm.loop !1321

do.end:                                           ; preds = %do.cond
  ret void, !dbg !1522
}

; Function Attrs: nounwind uwtable
define float @_Z8accuracyPfS_i(float* %arr1, float* %arr2, i32 %len) #0 !dbg !1523 {
entry:
  %arr1.addr = alloca float*, align 8
  %arr2.addr = alloca float*, align 8
  %len.addr = alloca i32, align 4
  %err = alloca float, align 4
  %i = alloca i32, align 4
  store float* %arr1, float** %arr1.addr, align 8
  call void @llvm.dbg.declare(metadata float** %arr1.addr, metadata !1526, metadata !682), !dbg !1527
  store float* %arr2, float** %arr2.addr, align 8
  call void @llvm.dbg.declare(metadata float** %arr2.addr, metadata !1528, metadata !682), !dbg !1529
  store i32 %len, i32* %len.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %len.addr, metadata !1530, metadata !682), !dbg !1531
  call void @llvm.dbg.declare(metadata float* %err, metadata !1532, metadata !682), !dbg !1533
  store float 0.000000e+00, float* %err, align 4, !dbg !1533
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1534, metadata !682), !dbg !1535
  store i32 0, i32* %i, align 4, !dbg !1536
  br label %for.cond, !dbg !1538

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1539
  %1 = load i32, i32* %len.addr, align 4, !dbg !1542
  %cmp = icmp slt i32 %0, %1, !dbg !1543
  br i1 %cmp, label %for.body, label %for.end, !dbg !1544

for.body:                                         ; preds = %for.cond
  %2 = load float*, float** %arr1.addr, align 8, !dbg !1545
  %3 = load i32, i32* %i, align 4, !dbg !1547
  %idxprom = sext i32 %3 to i64, !dbg !1545
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom, !dbg !1545
  %4 = load float, float* %arrayidx, align 4, !dbg !1545
  %5 = load float*, float** %arr2.addr, align 8, !dbg !1548
  %6 = load i32, i32* %i, align 4, !dbg !1549
  %idxprom1 = sext i32 %6 to i64, !dbg !1548
  %arrayidx2 = getelementptr inbounds float, float* %5, i64 %idxprom1, !dbg !1548
  %7 = load float, float* %arrayidx2, align 4, !dbg !1548
  %sub = fsub float %4, %7, !dbg !1550
  %8 = load float*, float** %arr1.addr, align 8, !dbg !1551
  %9 = load i32, i32* %i, align 4, !dbg !1552
  %idxprom3 = sext i32 %9 to i64, !dbg !1551
  %arrayidx4 = getelementptr inbounds float, float* %8, i64 %idxprom3, !dbg !1551
  %10 = load float, float* %arrayidx4, align 4, !dbg !1551
  %11 = load float*, float** %arr2.addr, align 8, !dbg !1553
  %12 = load i32, i32* %i, align 4, !dbg !1554
  %idxprom5 = sext i32 %12 to i64, !dbg !1553
  %arrayidx6 = getelementptr inbounds float, float* %11, i64 %idxprom5, !dbg !1553
  %13 = load float, float* %arrayidx6, align 4, !dbg !1553
  %sub7 = fsub float %10, %13, !dbg !1555
  %mul = fmul float %sub, %sub7, !dbg !1556
  %14 = load float, float* %err, align 4, !dbg !1557
  %add = fadd float %14, %mul, !dbg !1557
  store float %add, float* %err, align 4, !dbg !1557
  br label %for.inc, !dbg !1558

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !1559
  %inc = add nsw i32 %15, 1, !dbg !1559
  store i32 %inc, i32* %i, align 4, !dbg !1559
  br label %for.cond, !dbg !1561, !llvm.loop !1562

for.end:                                          ; preds = %for.cond
  %16 = load float, float* %err, align 4, !dbg !1564
  %17 = load i32, i32* %len.addr, align 4, !dbg !1565
  %conv = sitofp i32 %17 to float, !dbg !1565
  %div = fdiv float %16, %conv, !dbg !1566
  %conv8 = fpext float %div to double, !dbg !1564
  %call = call double @sqrt(double %conv8) #10, !dbg !1567
  %conv9 = fptrunc double %call to float, !dbg !1567
  ret float %conv9, !dbg !1568
}

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: uwtable
define void @_Z5usageiPPc(i32 %argc, i8** %argv) #3 !dbg !1569 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1572, metadata !682), !dbg !1573
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1574, metadata !682), !dbg !1575
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1576
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !1577
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !1577
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !1577
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.11, i32 0, i32 0), i8* %2), !dbg !1578
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1579
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.12, i32 0, i32 0)), !dbg !1580
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1581
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.13, i32 0, i32 0)), !dbg !1582
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1583
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.14, i32 0, i32 0)), !dbg !1584
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1585
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([83 x i8], [83 x i8]* @.str.15, i32 0, i32 0)), !dbg !1586
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1587
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([88 x i8], [88 x i8]* @.str.16, i32 0, i32 0)), !dbg !1588
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1589
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.17, i32 0, i32 0)), !dbg !1590
  call void @exit(i32 1) #11, !dbg !1591
  unreachable, !dbg !1591

return:                                           ; No predecessors!
  ret void, !dbg !1592
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #7

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #8 !dbg !1593 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %pfile = alloca i8*, align 8
  %tfile = alloca i8*, align 8
  %ofile = alloca i8*, align 8
  %iterations = alloca i32, align 4
  %numCols = alloca i32, align 4
  %numRows = alloca i32, align 4
  %layers = alloca i32, align 4
  %dx = alloca float, align 4
  %dy = alloca float, align 4
  %dz = alloca float, align 4
  %Cap = alloca float, align 4
  %Rx = alloca float, align 4
  %Ry = alloca float, align 4
  %Rz = alloca float, align 4
  %max_slope = alloca float, align 4
  %dt = alloca float, align 4
  %powerIn = alloca float*, align 8
  %tempOut = alloca float*, align 8
  %tempIn = alloca float*, align 8
  %tempCopy = alloca float*, align 8
  %size = alloca i32, align 4
  %answer = alloca float*, align 8
  %acc = alloca float, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1596, metadata !682), !dbg !1597
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1598, metadata !682), !dbg !1599
  %0 = load i32, i32* %argc.addr, align 4, !dbg !1600
  %cmp = icmp ne i32 %0, 7, !dbg !1602
  br i1 %cmp, label %if.then, label %if.end, !dbg !1603

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %argc.addr, align 4, !dbg !1604
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !1606
  call void @_Z5usageiPPc(i32 %1, i8** %2), !dbg !1607
  br label %if.end, !dbg !1608

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i8** %pfile, metadata !1609, metadata !682), !dbg !1610
  call void @llvm.dbg.declare(metadata i8** %tfile, metadata !1611, metadata !682), !dbg !1612
  call void @llvm.dbg.declare(metadata i8** %ofile, metadata !1613, metadata !682), !dbg !1614
  call void @llvm.dbg.declare(metadata i32* %iterations, metadata !1615, metadata !682), !dbg !1616
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !1617
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 3, !dbg !1617
  %4 = load i8*, i8** %arrayidx, align 8, !dbg !1617
  %call = call i32 @atoi(i8* %4) #12, !dbg !1618
  store i32 %call, i32* %iterations, align 4, !dbg !1616
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !1619
  %arrayidx1 = getelementptr inbounds i8*, i8** %5, i64 4, !dbg !1619
  %6 = load i8*, i8** %arrayidx1, align 8, !dbg !1619
  store i8* %6, i8** %pfile, align 8, !dbg !1620
  %7 = load i8**, i8*** %argv.addr, align 8, !dbg !1621
  %arrayidx2 = getelementptr inbounds i8*, i8** %7, i64 5, !dbg !1621
  %8 = load i8*, i8** %arrayidx2, align 8, !dbg !1621
  store i8* %8, i8** %tfile, align 8, !dbg !1622
  %9 = load i8**, i8*** %argv.addr, align 8, !dbg !1623
  %arrayidx3 = getelementptr inbounds i8*, i8** %9, i64 6, !dbg !1623
  %10 = load i8*, i8** %arrayidx3, align 8, !dbg !1623
  store i8* %10, i8** %ofile, align 8, !dbg !1624
  call void @llvm.dbg.declare(metadata i32* %numCols, metadata !1625, metadata !682), !dbg !1626
  %11 = load i8**, i8*** %argv.addr, align 8, !dbg !1627
  %arrayidx4 = getelementptr inbounds i8*, i8** %11, i64 1, !dbg !1627
  %12 = load i8*, i8** %arrayidx4, align 8, !dbg !1627
  %call5 = call i32 @atoi(i8* %12) #12, !dbg !1628
  store i32 %call5, i32* %numCols, align 4, !dbg !1626
  call void @llvm.dbg.declare(metadata i32* %numRows, metadata !1629, metadata !682), !dbg !1630
  %13 = load i8**, i8*** %argv.addr, align 8, !dbg !1631
  %arrayidx6 = getelementptr inbounds i8*, i8** %13, i64 1, !dbg !1631
  %14 = load i8*, i8** %arrayidx6, align 8, !dbg !1631
  %call7 = call i32 @atoi(i8* %14) #12, !dbg !1632
  store i32 %call7, i32* %numRows, align 4, !dbg !1630
  call void @llvm.dbg.declare(metadata i32* %layers, metadata !1633, metadata !682), !dbg !1634
  %15 = load i8**, i8*** %argv.addr, align 8, !dbg !1635
  %arrayidx8 = getelementptr inbounds i8*, i8** %15, i64 2, !dbg !1635
  %16 = load i8*, i8** %arrayidx8, align 8, !dbg !1635
  %call9 = call i32 @atoi(i8* %16) #12, !dbg !1636
  store i32 %call9, i32* %layers, align 4, !dbg !1634
  call void @llvm.dbg.declare(metadata float* %dx, metadata !1637, metadata !682), !dbg !1638
  %17 = load float, float* @chip_height, align 4, !dbg !1639
  %18 = load i32, i32* %numRows, align 4, !dbg !1640
  %conv = sitofp i32 %18 to float, !dbg !1640
  %div = fdiv float %17, %conv, !dbg !1641
  store float %div, float* %dx, align 4, !dbg !1638
  call void @llvm.dbg.declare(metadata float* %dy, metadata !1642, metadata !682), !dbg !1643
  %19 = load float, float* @chip_width, align 4, !dbg !1644
  %20 = load i32, i32* %numCols, align 4, !dbg !1645
  %conv10 = sitofp i32 %20 to float, !dbg !1645
  %div11 = fdiv float %19, %conv10, !dbg !1646
  store float %div11, float* %dy, align 4, !dbg !1643
  call void @llvm.dbg.declare(metadata float* %dz, metadata !1647, metadata !682), !dbg !1648
  %21 = load float, float* @t_chip, align 4, !dbg !1649
  %22 = load i32, i32* %layers, align 4, !dbg !1650
  %conv12 = sitofp i32 %22 to float, !dbg !1650
  %div13 = fdiv float %21, %conv12, !dbg !1651
  store float %div13, float* %dz, align 4, !dbg !1648
  call void @llvm.dbg.declare(metadata float* %Cap, metadata !1652, metadata !682), !dbg !1653
  %23 = load float, float* @t_chip, align 4, !dbg !1654
  %conv14 = fpext float %23 to double, !dbg !1654
  %mul = fmul double 8.750000e+05, %conv14, !dbg !1655
  %24 = load float, float* %dx, align 4, !dbg !1656
  %conv15 = fpext float %24 to double, !dbg !1656
  %mul16 = fmul double %mul, %conv15, !dbg !1657
  %25 = load float, float* %dy, align 4, !dbg !1658
  %conv17 = fpext float %25 to double, !dbg !1658
  %mul18 = fmul double %mul16, %conv17, !dbg !1659
  %conv19 = fptrunc double %mul18 to float, !dbg !1660
  store float %conv19, float* %Cap, align 4, !dbg !1653
  call void @llvm.dbg.declare(metadata float* %Rx, metadata !1661, metadata !682), !dbg !1662
  %26 = load float, float* %dy, align 4, !dbg !1663
  %conv20 = fpext float %26 to double, !dbg !1663
  %27 = load float, float* @t_chip, align 4, !dbg !1664
  %conv21 = fpext float %27 to double, !dbg !1664
  %mul22 = fmul double 2.000000e+02, %conv21, !dbg !1665
  %28 = load float, float* %dx, align 4, !dbg !1666
  %conv23 = fpext float %28 to double, !dbg !1666
  %mul24 = fmul double %mul22, %conv23, !dbg !1667
  %div25 = fdiv double %conv20, %mul24, !dbg !1668
  %conv26 = fptrunc double %div25 to float, !dbg !1663
  store float %conv26, float* %Rx, align 4, !dbg !1662
  call void @llvm.dbg.declare(metadata float* %Ry, metadata !1669, metadata !682), !dbg !1670
  %29 = load float, float* %dx, align 4, !dbg !1671
  %conv27 = fpext float %29 to double, !dbg !1671
  %30 = load float, float* @t_chip, align 4, !dbg !1672
  %conv28 = fpext float %30 to double, !dbg !1672
  %mul29 = fmul double 2.000000e+02, %conv28, !dbg !1673
  %31 = load float, float* %dy, align 4, !dbg !1674
  %conv30 = fpext float %31 to double, !dbg !1674
  %mul31 = fmul double %mul29, %conv30, !dbg !1675
  %div32 = fdiv double %conv27, %mul31, !dbg !1676
  %conv33 = fptrunc double %div32 to float, !dbg !1671
  store float %conv33, float* %Ry, align 4, !dbg !1670
  call void @llvm.dbg.declare(metadata float* %Rz, metadata !1677, metadata !682), !dbg !1678
  %32 = load float, float* %dz, align 4, !dbg !1679
  %33 = load float, float* %dx, align 4, !dbg !1680
  %mul34 = fmul float 1.000000e+02, %33, !dbg !1681
  %34 = load float, float* %dy, align 4, !dbg !1682
  %mul35 = fmul float %mul34, %34, !dbg !1683
  %div36 = fdiv float %32, %mul35, !dbg !1684
  store float %div36, float* %Rz, align 4, !dbg !1678
  call void @llvm.dbg.declare(metadata float* %max_slope, metadata !1685, metadata !682), !dbg !1686
  %35 = load float, float* @t_chip, align 4, !dbg !1687
  %conv37 = fpext float %35 to double, !dbg !1687
  %mul38 = fmul double 5.000000e-01, %conv37, !dbg !1688
  %mul39 = fmul double %mul38, 1.750000e+06, !dbg !1689
  %div40 = fdiv double 3.000000e+06, %mul39, !dbg !1690
  %conv41 = fptrunc double %div40 to float, !dbg !1691
  store float %conv41, float* %max_slope, align 4, !dbg !1686
  call void @llvm.dbg.declare(metadata float* %dt, metadata !1692, metadata !682), !dbg !1693
  %36 = load float, float* %max_slope, align 4, !dbg !1694
  %conv42 = fpext float %36 to double, !dbg !1694
  %div43 = fdiv double 1.000000e-03, %conv42, !dbg !1695
  %conv44 = fptrunc double %div43 to float, !dbg !1696
  store float %conv44, float* %dt, align 4, !dbg !1693
  call void @llvm.dbg.declare(metadata float** %powerIn, metadata !1697, metadata !682), !dbg !1698
  call void @llvm.dbg.declare(metadata float** %tempOut, metadata !1699, metadata !682), !dbg !1700
  call void @llvm.dbg.declare(metadata float** %tempIn, metadata !1701, metadata !682), !dbg !1702
  call void @llvm.dbg.declare(metadata float** %tempCopy, metadata !1703, metadata !682), !dbg !1704
  call void @llvm.dbg.declare(metadata i32* %size, metadata !1705, metadata !682), !dbg !1706
  %37 = load i32, i32* %numCols, align 4, !dbg !1707
  %38 = load i32, i32* %numRows, align 4, !dbg !1708
  %mul45 = mul nsw i32 %37, %38, !dbg !1709
  %39 = load i32, i32* %layers, align 4, !dbg !1710
  %mul46 = mul nsw i32 %mul45, %39, !dbg !1711
  store i32 %mul46, i32* %size, align 4, !dbg !1706
  %40 = load i32, i32* %size, align 4, !dbg !1712
  %conv47 = sext i32 %40 to i64, !dbg !1712
  %call48 = call noalias i8* @calloc(i64 %conv47, i64 4) #10, !dbg !1713
  %41 = bitcast i8* %call48 to float*, !dbg !1714
  store float* %41, float** %powerIn, align 8, !dbg !1715
  %42 = load i32, i32* %size, align 4, !dbg !1716
  %conv49 = sext i32 %42 to i64, !dbg !1716
  %mul50 = mul i64 %conv49, 4, !dbg !1717
  %call51 = call noalias i8* @malloc(i64 %mul50) #10, !dbg !1718
  %43 = bitcast i8* %call51 to float*, !dbg !1719
  store float* %43, float** %tempCopy, align 8, !dbg !1720
  %44 = load i32, i32* %size, align 4, !dbg !1721
  %conv52 = sext i32 %44 to i64, !dbg !1721
  %call53 = call noalias i8* @calloc(i64 %conv52, i64 4) #10, !dbg !1722
  %45 = bitcast i8* %call53 to float*, !dbg !1723
  store float* %45, float** %tempIn, align 8, !dbg !1724
  %46 = load i32, i32* %size, align 4, !dbg !1725
  %conv54 = sext i32 %46 to i64, !dbg !1725
  %call55 = call noalias i8* @calloc(i64 %conv54, i64 4) #10, !dbg !1726
  %47 = bitcast i8* %call55 to float*, !dbg !1727
  store float* %47, float** %tempOut, align 8, !dbg !1728
  call void @llvm.dbg.declare(metadata float** %answer, metadata !1729, metadata !682), !dbg !1730
  %48 = load i32, i32* %size, align 4, !dbg !1731
  %conv56 = sext i32 %48 to i64, !dbg !1731
  %call57 = call noalias i8* @calloc(i64 %conv56, i64 4) #10, !dbg !1732
  %49 = bitcast i8* %call57 to float*, !dbg !1733
  store float* %49, float** %answer, align 8, !dbg !1730
  %50 = load float*, float** %powerIn, align 8, !dbg !1734
  %51 = load i32, i32* %numRows, align 4, !dbg !1735
  %52 = load i32, i32* %numCols, align 4, !dbg !1736
  %53 = load i32, i32* %layers, align 4, !dbg !1737
  %54 = load i8*, i8** %pfile, align 8, !dbg !1738
  call void @_Z9readinputPfiiiPc(float* %50, i32 %51, i32 %52, i32 %53, i8* %54), !dbg !1739
  %55 = load float*, float** %tempIn, align 8, !dbg !1740
  %56 = load i32, i32* %numRows, align 4, !dbg !1741
  %57 = load i32, i32* %numCols, align 4, !dbg !1742
  %58 = load i32, i32* %layers, align 4, !dbg !1743
  %59 = load i8*, i8** %tfile, align 8, !dbg !1744
  call void @_Z9readinputPfiiiPc(float* %55, i32 %56, i32 %57, i32 %58, i8* %59), !dbg !1745
  %60 = load float*, float** %tempCopy, align 8, !dbg !1746
  %61 = bitcast float* %60 to i8*, !dbg !1747
  %62 = load float*, float** %tempIn, align 8, !dbg !1748
  %63 = bitcast float* %62 to i8*, !dbg !1747
  %64 = load i32, i32* %size, align 4, !dbg !1749
  %conv58 = sext i32 %64 to i64, !dbg !1749
  %mul59 = mul i64 %conv58, 4, !dbg !1750
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %61, i8* %63, i64 %mul59, i32 4, i1 false), !dbg !1747
  %65 = load float*, float** %powerIn, align 8, !dbg !1751
  %66 = load float*, float** %tempIn, align 8, !dbg !1752
  %67 = load float*, float** %tempOut, align 8, !dbg !1753
  %68 = load i32, i32* %numCols, align 4, !dbg !1754
  %69 = load i32, i32* %numRows, align 4, !dbg !1755
  %70 = load i32, i32* %layers, align 4, !dbg !1756
  %71 = load float, float* %Cap, align 4, !dbg !1757
  %72 = load float, float* %Rx, align 4, !dbg !1758
  %73 = load float, float* %Ry, align 4, !dbg !1759
  %74 = load float, float* %Rz, align 4, !dbg !1760
  %75 = load float, float* %dt, align 4, !dbg !1761
  %76 = load i32, i32* %iterations, align 4, !dbg !1762
  call void @_Z12hotspot_opt1PfS_S_iiifffffi(float* %65, float* %66, float* %67, i32 %68, i32 %69, i32 %70, float %71, float %72, float %73, float %74, float %75, i32 %76), !dbg !1763
  %77 = load float*, float** %powerIn, align 8, !dbg !1764
  %78 = load float*, float** %tempCopy, align 8, !dbg !1765
  %79 = load float*, float** %answer, align 8, !dbg !1766
  %80 = load i32, i32* %numCols, align 4, !dbg !1767
  %81 = load i32, i32* %numRows, align 4, !dbg !1768
  %82 = load i32, i32* %layers, align 4, !dbg !1769
  %83 = load float, float* %Cap, align 4, !dbg !1770
  %84 = load float, float* %Rx, align 4, !dbg !1771
  %85 = load float, float* %Ry, align 4, !dbg !1772
  %86 = load float, float* %Rz, align 4, !dbg !1773
  %87 = load float, float* %dt, align 4, !dbg !1774
  %88 = load i32, i32* %iterations, align 4, !dbg !1775
  call void @_Z14computeTempCPUPfS_S_iiifffffi(float* %77, float* %78, float* %79, i32 %80, i32 %81, i32 %82, float %83, float %84, float %85, float %86, float %87, i32 %88), !dbg !1776
  call void @llvm.dbg.declare(metadata float* %acc, metadata !1777, metadata !682), !dbg !1778
  %89 = load float*, float** %tempOut, align 8, !dbg !1779
  %90 = load float*, float** %answer, align 8, !dbg !1780
  %91 = load i32, i32* %numRows, align 4, !dbg !1781
  %92 = load i32, i32* %numCols, align 4, !dbg !1782
  %mul60 = mul nsw i32 %91, %92, !dbg !1783
  %93 = load i32, i32* %layers, align 4, !dbg !1784
  %mul61 = mul nsw i32 %mul60, %93, !dbg !1785
  %call62 = call float @_Z8accuracyPfS_i(float* %89, float* %90, i32 %mul61), !dbg !1786
  store float %call62, float* %acc, align 4, !dbg !1778
  %94 = load float, float* %acc, align 4, !dbg !1787
  %conv63 = fpext float %94 to double, !dbg !1787
  %call64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.18, i32 0, i32 0), double %conv63), !dbg !1788
  %95 = load float*, float** %tempOut, align 8, !dbg !1789
  %96 = load i32, i32* %numRows, align 4, !dbg !1790
  %97 = load i32, i32* %numCols, align 4, !dbg !1791
  %98 = load i32, i32* %layers, align 4, !dbg !1792
  %99 = load i8*, i8** %ofile, align 8, !dbg !1793
  call void @_Z11writeoutputPfiiiPc(float* %95, i32 %96, i32 %97, i32 %98, i8* %99), !dbg !1794
  %100 = load float*, float** %tempIn, align 8, !dbg !1795
  %101 = bitcast float* %100 to i8*, !dbg !1795
  call void @free(i8* %101) #10, !dbg !1796
  %102 = load float*, float** %tempOut, align 8, !dbg !1797
  %103 = bitcast float* %102 to i8*, !dbg !1797
  call void @free(i8* %103) #10, !dbg !1798
  %104 = load float*, float** %powerIn, align 8, !dbg !1799
  %105 = bitcast float* %104 to i8*, !dbg !1799
  call void @free(i8* %105) #10, !dbg !1800
  ret i32 0, !dbg !1802
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #9

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @cudaFuncSetCacheConfig(i8*, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inlinehint uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind }
attributes #11 = { noreturn nounwind }
attributes #12 = { nounwind readonly }

!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!665, !666}
!llvm.ident = !{!667}

!0 = distinct !DIGlobalVariable(name: "t_chip", scope: !1, file: !2, line: 25, type: !104, isLocal: false, isDefinition: true)
!1 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, retainedTypes: !101, globals: !108, imports: !112)
!2 = !DIFile(filename: "3D.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!3 = !{!4, !12, !18}
!4 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !5, line: 807, size: 32, align: 32, elements: !6, identifier: "_ZTS14cudaMemcpyKind")
!5 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!6 = !{!7, !8, !9, !10, !11}
!7 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!8 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!10 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!11 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaFuncCache", file: !5, line: 1123, size: 32, align: 32, elements: !13, identifier: "_ZTS13cudaFuncCache")
!13 = !{!14, !15, !16, !17}
!14 = !DIEnumerator(name: "cudaFuncCachePreferNone", value: 0)
!15 = !DIEnumerator(name: "cudaFuncCachePreferShared", value: 1)
!16 = !DIEnumerator(name: "cudaFuncCachePreferL1", value: 2)
!17 = !DIEnumerator(name: "cudaFuncCachePreferEqual", value: 3)
!18 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !5, line: 156, size: 32, align: 32, elements: !19, identifier: "_ZTS9cudaError")
!19 = !{!20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100}
!20 = !DIEnumerator(name: "cudaSuccess", value: 0)
!21 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 1)
!22 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2)
!23 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3)
!24 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 4)
!25 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 5)
!26 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 6)
!27 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 7)
!28 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 8)
!29 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9)
!30 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 10)
!31 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 11)
!32 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12)
!33 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13)
!34 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 14)
!35 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 15)
!36 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16)
!37 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17)
!38 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18)
!39 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19)
!40 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20)
!41 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21)
!42 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22)
!43 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23)
!44 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24)
!45 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25)
!46 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26)
!47 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27)
!48 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28)
!49 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 29)
!50 = !DIEnumerator(name: "cudaErrorUnknown", value: 30)
!51 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31)
!52 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32)
!53 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 33)
!54 = !DIEnumerator(name: "cudaErrorNotReady", value: 34)
!55 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35)
!56 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 36)
!57 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37)
!58 = !DIEnumerator(name: "cudaErrorNoDevice", value: 38)
!59 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 39)
!60 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 40)
!61 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 41)
!62 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 42)
!63 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43)
!64 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44)
!65 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45)
!66 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46)
!67 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 47)
!68 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 48)
!69 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49)
!70 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 50)
!71 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 51)
!72 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 54)
!73 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 55)
!74 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 56)
!75 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 57)
!76 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 58)
!77 = !DIEnumerator(name: "cudaErrorAssert", value: 59)
!78 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 60)
!79 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 61)
!80 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 62)
!81 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 63)
!82 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 64)
!83 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65)
!84 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66)
!85 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67)
!86 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68)
!87 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69)
!88 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 70)
!89 = !DIEnumerator(name: "cudaErrorNotSupported", value: 71)
!90 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 72)
!91 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 73)
!92 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 74)
!93 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 75)
!94 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 76)
!95 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 77)
!96 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 78)
!97 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 79)
!98 = !DIEnumerator(name: "cudaErrorNvlinkUncorrectable", value: 80)
!99 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127)
!100 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000)
!101 = !{!102, !104, !105, !106}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64, align: 64)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!104 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64, align: 64)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64, align: 64)
!107 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!108 = !{!0, !109, !110, !111}
!109 = distinct !DIGlobalVariable(name: "chip_height", scope: !1, file: !2, line: 26, type: !104, isLocal: false, isDefinition: true)
!110 = distinct !DIGlobalVariable(name: "chip_width", scope: !1, file: !2, line: 26, type: !104, isLocal: false, isDefinition: true)
!111 = distinct !DIGlobalVariable(name: "amb_temp", scope: !1, file: !2, line: 27, type: !104, isLocal: false, isDefinition: true)
!112 = !{!113, !120, !124, !126, !128, !130, !132, !136, !138, !140, !142, !144, !146, !148, !150, !152, !154, !156, !158, !160, !162, !164, !168, !170, !172, !174, !179, !184, !186, !188, !193, !197, !199, !201, !203, !205, !207, !209, !211, !213, !218, !222, !224, !226, !230, !232, !234, !236, !238, !240, !244, !246, !248, !252, !260, !264, !266, !268, !272, !274, !276, !280, !282, !284, !288, !290, !292, !294, !296, !298, !300, !302, !304, !306, !311, !313, !315, !319, !321, !323, !325, !327, !329, !331, !333, !337, !341, !343, !345, !350, !352, !354, !356, !358, !360, !362, !366, !372, !376, !380, !385, !387, !391, !395, !406, !410, !414, !418, !422, !427, !429, !433, !437, !441, !449, !453, !457, !461, !465, !470, !476, !480, !484, !486, !494, !498, !506, !508, !510, !514, !518, !522, !527, !531, !536, !537, !538, !539, !542, !543, !544, !545, !546, !547, !548, !551, !553, !555, !557, !559, !561, !563, !565, !568, !570, !572, !574, !576, !578, !580, !582, !584, !586, !588, !590, !592, !594, !596, !598, !600, !602, !604, !606, !608, !610, !612, !614, !616, !618, !620, !622, !624, !626, !628, !630, !632, !636, !637, !639, !641, !643, !645, !647, !649, !651, !653, !655, !657, !659, !661, !663}
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !116, line: 189)
!114 = !DINamespace(name: "std", scope: null, file: !115, line: 188)
!115 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!116 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !115, file: !115, line: 44, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!117 = !DISubroutineType(types: !118)
!118 = !{!119, !119}
!119 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !121, line: 190)
!121 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !115, file: !115, line: 46, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!122 = !DISubroutineType(types: !123)
!123 = !{!104, !104}
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !125, line: 191)
!125 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !115, file: !115, line: 48, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !127, line: 192)
!127 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !115, file: !115, line: 50, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !129, line: 193)
!129 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !115, file: !115, line: 52, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !131, line: 194)
!131 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !115, file: !115, line: 56, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !133, line: 195)
!133 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !115, file: !115, line: 54, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DISubroutineType(types: !135)
!135 = !{!104, !104, !104}
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !137, line: 196)
!137 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !115, file: !115, line: 58, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !139, line: 197)
!139 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !115, file: !115, line: 60, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !141, line: 198)
!141 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !115, file: !115, line: 62, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !143, line: 199)
!143 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !115, file: !115, line: 64, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !145, line: 200)
!145 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !115, file: !115, line: 66, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !147, line: 201)
!147 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !115, file: !115, line: 68, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !149, line: 202)
!149 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !115, file: !115, line: 72, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !151, line: 203)
!151 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !115, file: !115, line: 70, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !153, line: 204)
!153 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !115, file: !115, line: 76, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !155, line: 205)
!155 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !115, file: !115, line: 74, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !157, line: 206)
!157 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !115, file: !115, line: 78, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !159, line: 207)
!159 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !115, file: !115, line: 80, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !161, line: 208)
!161 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !115, file: !115, line: 82, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !163, line: 209)
!163 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !115, file: !115, line: 84, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !165, line: 210)
!165 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !115, file: !115, line: 86, type: !166, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DISubroutineType(types: !167)
!167 = !{!104, !104, !104, !104}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !169, line: 211)
!169 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !115, file: !115, line: 88, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !171, line: 212)
!171 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !115, file: !115, line: 90, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !173, line: 213)
!173 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !115, file: !115, line: 92, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !175, line: 214)
!175 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !115, file: !115, line: 94, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DISubroutineType(types: !177)
!177 = !{!178, !104}
!178 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !180, line: 215)
!180 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !115, file: !115, line: 96, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{!104, !104, !183}
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 64, align: 64)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !185, line: 216)
!185 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !115, file: !115, line: 98, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !187, line: 217)
!187 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !115, file: !115, line: 100, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !189, line: 218)
!189 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !115, file: !115, line: 102, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DISubroutineType(types: !191)
!191 = !{!192, !104}
!192 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !194, line: 219)
!194 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !115, file: !115, line: 106, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DISubroutineType(types: !196)
!196 = !{!192, !104, !104}
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !198, line: 220)
!198 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !115, file: !115, line: 105, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !200, line: 221)
!200 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !115, file: !115, line: 108, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !202, line: 222)
!202 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !115, file: !115, line: 112, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !204, line: 223)
!204 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !115, file: !115, line: 111, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !206, line: 224)
!206 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !115, file: !115, line: 114, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !208, line: 225)
!208 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !115, file: !115, line: 116, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !210, line: 226)
!210 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !115, file: !115, line: 118, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !212, line: 227)
!212 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !115, file: !115, line: 120, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !214, line: 228)
!214 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !115, file: !115, line: 121, type: !215, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DISubroutineType(types: !216)
!216 = !{!217, !217}
!217 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !219, line: 229)
!219 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !115, file: !115, line: 123, type: !220, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!220 = !DISubroutineType(types: !221)
!221 = !{!104, !104, !178}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !223, line: 230)
!223 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !115, file: !115, line: 125, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !225, line: 231)
!225 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !115, file: !115, line: 126, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !227, line: 232)
!227 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !115, file: !115, line: 128, type: !228, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DISubroutineType(types: !229)
!229 = !{!119, !104}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !231, line: 233)
!231 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !115, file: !115, line: 138, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !233, line: 234)
!233 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !115, file: !115, line: 130, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !235, line: 235)
!235 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !115, file: !115, line: 132, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !237, line: 236)
!237 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !115, file: !115, line: 134, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !239, line: 237)
!239 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !115, file: !115, line: 136, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !241, line: 238)
!241 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !115, file: !115, line: 140, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DISubroutineType(types: !243)
!243 = !{!217, !104}
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !245, line: 239)
!245 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !115, file: !115, line: 142, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !247, line: 240)
!247 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !115, file: !115, line: 143, type: !228, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !249, line: 241)
!249 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !115, file: !115, line: 145, type: !250, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DISubroutineType(types: !251)
!251 = !{!104, !104, !105}
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !253, line: 242)
!253 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !115, file: !115, line: 146, type: !254, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DISubroutineType(types: !255)
!255 = !{!256, !257}
!256 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !258, size: 64, align: 64)
!258 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !259)
!259 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !261, line: 243)
!261 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !115, file: !115, line: 147, type: !262, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DISubroutineType(types: !263)
!263 = !{!104, !257}
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !265, line: 244)
!265 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !115, file: !115, line: 149, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !267, line: 245)
!267 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !115, file: !115, line: 151, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !269, line: 246)
!269 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !115, file: !115, line: 153, type: !270, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!270 = !DISubroutineType(types: !271)
!271 = !{!104, !104, !256}
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !273, line: 247)
!273 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !115, file: !115, line: 158, type: !220, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !275, line: 248)
!275 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !115, file: !115, line: 160, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !277, line: 249)
!277 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !115, file: !115, line: 162, type: !278, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!278 = !DISubroutineType(types: !279)
!279 = !{!104, !104, !104, !183}
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !281, line: 250)
!281 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !115, file: !115, line: 164, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !283, line: 251)
!283 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !115, file: !115, line: 166, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !285, line: 252)
!285 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !115, file: !115, line: 168, type: !286, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{!104, !104, !217}
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !289, line: 253)
!289 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !115, file: !115, line: 170, type: !220, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !291, line: 254)
!291 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !115, file: !115, line: 172, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !293, line: 255)
!293 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !115, file: !115, line: 174, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !295, line: 256)
!295 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !115, file: !115, line: 176, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !297, line: 257)
!297 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !115, file: !115, line: 178, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !299, line: 258)
!299 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !115, file: !115, line: 180, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !301, line: 259)
!301 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !115, file: !115, line: 182, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !303, line: 260)
!303 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !115, file: !115, line: 184, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !305, line: 261)
!305 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !115, file: !115, line: 186, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !307, line: 102)
!307 = !DISubprogram(name: "acos", scope: !308, file: !308, line: 54, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!309 = !DISubroutineType(types: !310)
!310 = !{!256, !256}
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !312, line: 121)
!312 = !DISubprogram(name: "asin", scope: !308, file: !308, line: 56, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !314, line: 140)
!314 = !DISubprogram(name: "atan", scope: !308, file: !308, line: 58, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !316, line: 159)
!316 = !DISubprogram(name: "atan2", scope: !308, file: !308, line: 60, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!317 = !DISubroutineType(types: !318)
!318 = !{!256, !256, !256}
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !320, line: 180)
!320 = !DISubprogram(name: "ceil", scope: !308, file: !308, line: 178, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !322, line: 199)
!322 = !DISubprogram(name: "cos", scope: !308, file: !308, line: 63, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !324, line: 218)
!324 = !DISubprogram(name: "cosh", scope: !308, file: !308, line: 72, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !326, line: 237)
!326 = !DISubprogram(name: "exp", scope: !308, file: !308, line: 100, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !328, line: 256)
!328 = !DISubprogram(name: "fabs", scope: !308, file: !308, line: 181, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !330, line: 275)
!330 = !DISubprogram(name: "floor", scope: !308, file: !308, line: 184, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !332, line: 294)
!332 = !DISubprogram(name: "fmod", scope: !308, file: !308, line: 187, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !334, line: 315)
!334 = !DISubprogram(name: "frexp", scope: !308, file: !308, line: 103, type: !335, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DISubroutineType(types: !336)
!336 = !{!256, !256, !183}
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !338, line: 334)
!338 = !DISubprogram(name: "ldexp", scope: !308, file: !308, line: 106, type: !339, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!339 = !DISubroutineType(types: !340)
!340 = !{!256, !256, !178}
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !342, line: 353)
!342 = !DISubprogram(name: "log", scope: !308, file: !308, line: 109, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !344, line: 372)
!344 = !DISubprogram(name: "log10", scope: !308, file: !308, line: 112, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !346, line: 391)
!346 = !DISubprogram(name: "modf", scope: !308, file: !308, line: 115, type: !347, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!347 = !DISubroutineType(types: !348)
!348 = !{!256, !256, !349}
!349 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !256, size: 64, align: 64)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !351, line: 403)
!351 = !DISubprogram(name: "pow", scope: !308, file: !308, line: 153, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !353, line: 440)
!353 = !DISubprogram(name: "sin", scope: !308, file: !308, line: 65, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !355, line: 459)
!355 = !DISubprogram(name: "sinh", scope: !308, file: !308, line: 74, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !357, line: 478)
!357 = !DISubprogram(name: "sqrt", scope: !308, file: !308, line: 156, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !359, line: 497)
!359 = !DISubprogram(name: "tan", scope: !308, file: !308, line: 67, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !361, line: 516)
!361 = !DISubprogram(name: "tanh", scope: !308, file: !308, line: 76, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !363, line: 118)
!363 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !364, line: 101, baseType: !365)
!364 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!365 = !DICompositeType(tag: DW_TAG_structure_type, file: !364, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !367, line: 119)
!367 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !364, line: 109, baseType: !368)
!368 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !364, line: 105, size: 128, align: 64, elements: !369, identifier: "_ZTS6ldiv_t")
!369 = !{!370, !371}
!370 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !368, file: !364, line: 107, baseType: !217, size: 64, align: 64)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !368, file: !364, line: 108, baseType: !217, size: 64, align: 64, offset: 64)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !373, line: 121)
!373 = !DISubprogram(name: "abort", scope: !364, file: !364, line: 515, type: !374, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!374 = !DISubroutineType(types: !375)
!375 = !{null}
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !377, line: 122)
!377 = !DISubprogram(name: "abs", scope: !364, file: !364, line: 774, type: !378, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!378 = !DISubroutineType(types: !379)
!379 = !{!178, !178}
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !381, line: 123)
!381 = !DISubprogram(name: "atexit", scope: !364, file: !364, line: 519, type: !382, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!382 = !DISubroutineType(types: !383)
!383 = !{!178, !384}
!384 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !374, size: 64, align: 64)
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !386, line: 129)
!386 = !DISubprogram(name: "atof", scope: !364, file: !364, line: 144, type: !254, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !388, line: 130)
!388 = !DISubprogram(name: "atoi", scope: !364, file: !364, line: 147, type: !389, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!389 = !DISubroutineType(types: !390)
!390 = !{!178, !257}
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !392, line: 131)
!392 = !DISubprogram(name: "atol", scope: !364, file: !364, line: 150, type: !393, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!393 = !DISubroutineType(types: !394)
!394 = !{!217, !257}
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !396, line: 132)
!396 = !DISubprogram(name: "bsearch", scope: !364, file: !364, line: 754, type: !397, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!397 = !DISubroutineType(types: !398)
!398 = !{!103, !106, !106, !399, !399, !402}
!399 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !400, line: 62, baseType: !401)
!400 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!401 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !364, line: 741, baseType: !403)
!403 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !404, size: 64, align: 64)
!404 = !DISubroutineType(types: !405)
!405 = !{!178, !106, !106}
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !407, line: 133)
!407 = !DISubprogram(name: "calloc", scope: !364, file: !364, line: 468, type: !408, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!408 = !DISubroutineType(types: !409)
!409 = !{!103, !399, !399}
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !411, line: 134)
!411 = !DISubprogram(name: "div", scope: !364, file: !364, line: 788, type: !412, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!412 = !DISubroutineType(types: !413)
!413 = !{!363, !178, !178}
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !415, line: 135)
!415 = !DISubprogram(name: "exit", scope: !364, file: !364, line: 543, type: !416, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!416 = !DISubroutineType(types: !417)
!417 = !{null, !178}
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !419, line: 136)
!419 = !DISubprogram(name: "free", scope: !364, file: !364, line: 483, type: !420, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!420 = !DISubroutineType(types: !421)
!421 = !{null, !103}
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !423, line: 137)
!423 = !DISubprogram(name: "getenv", scope: !364, file: !364, line: 564, type: !424, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!424 = !DISubroutineType(types: !425)
!425 = !{!426, !257}
!426 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !259, size: 64, align: 64)
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !428, line: 138)
!428 = !DISubprogram(name: "labs", scope: !364, file: !364, line: 775, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !430, line: 139)
!430 = !DISubprogram(name: "ldiv", scope: !364, file: !364, line: 790, type: !431, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!431 = !DISubroutineType(types: !432)
!432 = !{!367, !217, !217}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !434, line: 140)
!434 = !DISubprogram(name: "malloc", scope: !364, file: !364, line: 466, type: !435, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!435 = !DISubroutineType(types: !436)
!436 = !{!103, !399}
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !438, line: 142)
!438 = !DISubprogram(name: "mblen", scope: !364, file: !364, line: 862, type: !439, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!439 = !DISubroutineType(types: !440)
!440 = !{!178, !257, !399}
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !442, line: 143)
!442 = !DISubprogram(name: "mbstowcs", scope: !364, file: !364, line: 873, type: !443, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!443 = !DISubroutineType(types: !444)
!444 = !{!399, !445, !448, !399}
!445 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !446)
!446 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !447, size: 64, align: 64)
!447 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!448 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !257)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !450, line: 144)
!450 = !DISubprogram(name: "mbtowc", scope: !364, file: !364, line: 865, type: !451, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!451 = !DISubroutineType(types: !452)
!452 = !{!178, !445, !448, !399}
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !454, line: 146)
!454 = !DISubprogram(name: "qsort", scope: !364, file: !364, line: 764, type: !455, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!455 = !DISubroutineType(types: !456)
!456 = !{null, !103, !399, !399, !402}
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !458, line: 152)
!458 = !DISubprogram(name: "rand", scope: !364, file: !364, line: 374, type: !459, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!459 = !DISubroutineType(types: !460)
!460 = !{!178}
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !462, line: 153)
!462 = !DISubprogram(name: "realloc", scope: !364, file: !364, line: 480, type: !463, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!463 = !DISubroutineType(types: !464)
!464 = !{!103, !103, !399}
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !466, line: 154)
!466 = !DISubprogram(name: "srand", scope: !364, file: !364, line: 376, type: !467, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DISubroutineType(types: !468)
!468 = !{null, !469}
!469 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !471, line: 155)
!471 = !DISubprogram(name: "strtod", scope: !364, file: !364, line: 164, type: !472, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!472 = !DISubroutineType(types: !473)
!473 = !{!256, !448, !474}
!474 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !475)
!475 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !426, size: 64, align: 64)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !477, line: 156)
!477 = !DISubprogram(name: "strtol", scope: !364, file: !364, line: 183, type: !478, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DISubroutineType(types: !479)
!479 = !{!217, !448, !474, !178}
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !481, line: 157)
!481 = !DISubprogram(name: "strtoul", scope: !364, file: !364, line: 187, type: !482, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!482 = !DISubroutineType(types: !483)
!483 = !{!401, !448, !474, !178}
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !485, line: 158)
!485 = !DISubprogram(name: "system", scope: !364, file: !364, line: 716, type: !389, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !487, line: 160)
!487 = !DISubprogram(name: "wcstombs", scope: !364, file: !364, line: 876, type: !488, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DISubroutineType(types: !489)
!489 = !{!399, !490, !491, !399}
!490 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !426)
!491 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !492)
!492 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !493, size: 64, align: 64)
!493 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !447)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !495, line: 161)
!495 = !DISubprogram(name: "wctomb", scope: !364, file: !364, line: 869, type: !496, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DISubroutineType(types: !497)
!497 = !{!178, !426, !447}
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !499, entity: !501, line: 214)
!499 = !DINamespace(name: "__gnu_cxx", scope: null, file: !500, line: 220)
!500 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!501 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !364, line: 121, baseType: !502)
!502 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !364, line: 117, size: 128, align: 64, elements: !503, identifier: "_ZTS7lldiv_t")
!503 = !{!504, !505}
!504 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !502, file: !364, line: 119, baseType: !119, size: 64, align: 64)
!505 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !502, file: !364, line: 120, baseType: !119, size: 64, align: 64, offset: 64)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !499, entity: !507, line: 220)
!507 = !DISubprogram(name: "_Exit", scope: !364, file: !364, line: 557, type: !416, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !499, entity: !509, line: 224)
!509 = !DISubprogram(name: "llabs", scope: !364, file: !364, line: 779, type: !117, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !499, entity: !511, line: 230)
!511 = !DISubprogram(name: "lldiv", scope: !364, file: !364, line: 796, type: !512, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DISubroutineType(types: !513)
!513 = !{!501, !119, !119}
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !499, entity: !515, line: 241)
!515 = !DISubprogram(name: "atoll", scope: !364, file: !364, line: 157, type: !516, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DISubroutineType(types: !517)
!517 = !{!119, !257}
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !499, entity: !519, line: 242)
!519 = !DISubprogram(name: "strtoll", scope: !364, file: !364, line: 209, type: !520, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DISubroutineType(types: !521)
!521 = !{!119, !448, !474, !178}
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !499, entity: !523, line: 243)
!523 = !DISubprogram(name: "strtoull", scope: !364, file: !364, line: 214, type: !524, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!524 = !DISubroutineType(types: !525)
!525 = !{!526, !448, !474, !178}
!526 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !499, entity: !528, line: 245)
!528 = !DISubprogram(name: "strtof", scope: !364, file: !364, line: 172, type: !529, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!529 = !DISubroutineType(types: !530)
!530 = !{!104, !448, !474}
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !499, entity: !532, line: 246)
!532 = !DISubprogram(name: "strtold", scope: !364, file: !364, line: 175, type: !533, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!533 = !DISubroutineType(types: !534)
!534 = !{!535, !448, !474}
!535 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !501, line: 254)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !507, line: 256)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !509, line: 258)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !540, line: 259)
!540 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !499, file: !541, line: 227, type: !512, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!541 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !511, line: 260)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !515, line: 262)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !528, line: 263)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !519, line: 264)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !523, line: 265)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !532, line: 266)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !549, line: 397)
!549 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !550, file: !550, line: 1342, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!550 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !552, line: 398)
!552 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !550, file: !550, line: 1370, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !554, line: 399)
!554 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !550, file: !550, line: 1337, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !556, line: 400)
!556 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !550, file: !550, line: 1375, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !558, line: 401)
!558 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !550, file: !550, line: 1327, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !560, line: 402)
!560 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !550, file: !550, line: 1332, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !562, line: 403)
!562 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !550, file: !550, line: 1380, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !564, line: 404)
!564 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !550, file: !550, line: 1430, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !566, line: 405)
!566 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !567, file: !567, line: 667, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !569, line: 406)
!569 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !550, file: !550, line: 1189, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !571, line: 407)
!571 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !550, file: !550, line: 1243, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !573, line: 408)
!573 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !550, file: !550, line: 1312, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !575, line: 409)
!575 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !550, file: !550, line: 1490, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !577, line: 410)
!577 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !550, file: !550, line: 1480, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !579, line: 411)
!579 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !567, file: !567, line: 657, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !581, line: 412)
!581 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !550, file: !550, line: 1294, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !583, line: 413)
!583 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !550, file: !550, line: 1385, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !585, line: 414)
!585 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !567, file: !567, line: 607, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !587, line: 415)
!587 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !550, file: !550, line: 1616, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !589, line: 416)
!589 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !567, file: !567, line: 597, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !591, line: 417)
!591 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !550, file: !550, line: 1568, type: !166, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !593, line: 418)
!593 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !567, file: !567, line: 622, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !595, line: 419)
!595 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !567, file: !567, line: 617, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !597, line: 420)
!597 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !550, file: !550, line: 1553, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !599, line: 421)
!599 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !550, file: !550, line: 1543, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !601, line: 422)
!601 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !550, file: !550, line: 1390, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !603, line: 423)
!603 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !550, file: !550, line: 1621, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !605, line: 424)
!605 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !550, file: !550, line: 1520, type: !220, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !607, line: 425)
!607 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !550, file: !550, line: 1515, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !609, line: 426)
!609 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !550, file: !550, line: 1149, type: !228, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !611, line: 427)
!611 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !550, file: !550, line: 1602, type: !228, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !613, line: 428)
!613 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !550, file: !550, line: 1356, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !615, line: 429)
!615 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !550, file: !550, line: 1365, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !617, line: 430)
!617 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !550, file: !550, line: 1285, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !619, line: 431)
!619 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !550, file: !550, line: 1626, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !621, line: 432)
!621 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !550, file: !550, line: 1347, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !623, line: 433)
!623 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !550, file: !550, line: 1140, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !625, line: 434)
!625 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !550, file: !550, line: 1607, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !627, line: 435)
!627 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !550, file: !550, line: 1548, type: !250, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !629, line: 436)
!629 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !550, file: !550, line: 1154, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !631, line: 437)
!631 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !550, file: !550, line: 1218, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !633, line: 438)
!633 = !DISubprogram(name: "nexttowardf", scope: !308, file: !308, line: 294, type: !634, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!634 = !DISubroutineType(types: !635)
!635 = !{!104, !104, !535}
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !633, line: 439)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !638, line: 440)
!638 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !550, file: !550, line: 1583, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !640, line: 441)
!640 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !550, file: !550, line: 1558, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !642, line: 442)
!642 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !550, file: !550, line: 1563, type: !278, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !644, line: 443)
!644 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !550, file: !550, line: 1135, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !646, line: 444)
!646 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !550, file: !550, line: 1597, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !648, line: 445)
!648 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !550, file: !550, line: 1530, type: !286, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !650, line: 446)
!650 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !550, file: !550, line: 1525, type: !220, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !652, line: 447)
!652 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !550, file: !550, line: 1234, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !654, line: 448)
!654 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !550, file: !550, line: 1317, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !656, line: 449)
!656 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !567, file: !567, line: 907, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !658, line: 450)
!658 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !550, file: !550, line: 1276, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !660, line: 451)
!660 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !550, file: !550, line: 1322, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !662, line: 452)
!662 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !550, file: !550, line: 1592, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !664, line: 453)
!664 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !567, file: !567, line: 662, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!665 = !{i32 2, !"Dwarf Version", i32 4}
!666 = !{i32 2, !"Debug Info Version", i32 3}
!667 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!668 = distinct !DISubprogram(name: "get_time", linkageName: "_Z8get_timev", scope: !669, file: !669, line: 1, type: !670, isLocal: false, isDefinition: true, scopeLine: 1, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !672)
!669 = !DIFile(filename: "./opt1.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!670 = !DISubroutineType(types: !671)
!671 = !{!119}
!672 = !{}
!673 = !DILocalVariable(name: "tv", scope: !668, file: !669, line: 2, type: !674)
!674 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !675, line: 30, size: 128, align: 64, elements: !676, identifier: "_ZTS7timeval")
!675 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!676 = !{!677, !680}
!677 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !674, file: !675, line: 32, baseType: !678, size: 64, align: 64)
!678 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !679, line: 139, baseType: !217)
!679 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!680 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !674, file: !675, line: 33, baseType: !681, size: 64, align: 64, offset: 64)
!681 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !679, line: 141, baseType: !217)
!682 = !DIExpression()
!683 = !DILocation(line: 2, column: 17, scope: !668)
!684 = !DILocation(line: 3, column: 2, scope: !668)
!685 = !DILocation(line: 4, column: 13, scope: !668)
!686 = !DILocation(line: 4, column: 20, scope: !668)
!687 = !DILocation(line: 4, column: 36, scope: !668)
!688 = !DILocation(line: 4, column: 31, scope: !668)
!689 = !DILocation(line: 4, column: 2, scope: !668)
!690 = distinct !DISubprogram(name: "hotspotOpt1", linkageName: "_Z11hotspotOpt1PfS_S_fiiifffffff", scope: !669, file: !669, line: 7, type: !691, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !672)
!691 = !DISubroutineType(types: !692)
!692 = !{null, !105, !105, !105, !104, !178, !178, !178, !104, !104, !104, !104, !104, !104, !104}
!693 = !DILocalVariable(name: "p", arg: 1, scope: !690, file: !669, line: 7, type: !105)
!694 = !DILocation(line: 7, column: 36, scope: !690)
!695 = !DILocalVariable(name: "tIn", arg: 2, scope: !690, file: !669, line: 7, type: !105)
!696 = !DILocation(line: 7, column: 46, scope: !690)
!697 = !DILocalVariable(name: "tOut", arg: 3, scope: !690, file: !669, line: 7, type: !105)
!698 = !DILocation(line: 7, column: 58, scope: !690)
!699 = !DILocalVariable(name: "sdc", arg: 4, scope: !690, file: !669, line: 7, type: !104)
!700 = !DILocation(line: 7, column: 70, scope: !690)
!701 = !DILocalVariable(name: "nx", arg: 5, scope: !690, file: !669, line: 8, type: !178)
!702 = !DILocation(line: 8, column: 13, scope: !690)
!703 = !DILocalVariable(name: "ny", arg: 6, scope: !690, file: !669, line: 8, type: !178)
!704 = !DILocation(line: 8, column: 21, scope: !690)
!705 = !DILocalVariable(name: "nz", arg: 7, scope: !690, file: !669, line: 8, type: !178)
!706 = !DILocation(line: 8, column: 29, scope: !690)
!707 = !DILocalVariable(name: "ce", arg: 8, scope: !690, file: !669, line: 9, type: !104)
!708 = !DILocation(line: 9, column: 15, scope: !690)
!709 = !DILocalVariable(name: "cw", arg: 9, scope: !690, file: !669, line: 9, type: !104)
!710 = !DILocation(line: 9, column: 25, scope: !690)
!711 = !DILocalVariable(name: "cn", arg: 10, scope: !690, file: !669, line: 10, type: !104)
!712 = !DILocation(line: 10, column: 15, scope: !690)
!713 = !DILocalVariable(name: "cs", arg: 11, scope: !690, file: !669, line: 10, type: !104)
!714 = !DILocation(line: 10, column: 25, scope: !690)
!715 = !DILocalVariable(name: "ct", arg: 12, scope: !690, file: !669, line: 11, type: !104)
!716 = !DILocation(line: 11, column: 15, scope: !690)
!717 = !DILocalVariable(name: "cb", arg: 13, scope: !690, file: !669, line: 11, type: !104)
!718 = !DILocation(line: 11, column: 25, scope: !690)
!719 = !DILocalVariable(name: "cc", arg: 14, scope: !690, file: !669, line: 12, type: !104)
!720 = !DILocation(line: 12, column: 15, scope: !690)
!721 = !DILocation(line: 13, column: 1, scope: !690)
!722 = !DILocation(line: 13, column: 1, scope: !723)
!723 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 1)
!724 = !DILocation(line: 13, column: 1, scope: !725)
!725 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 2)
!726 = !DILocation(line: 13, column: 1, scope: !727)
!727 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 3)
!728 = !DILocation(line: 13, column: 1, scope: !729)
!729 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 4)
!730 = !DILocation(line: 13, column: 1, scope: !731)
!731 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 5)
!732 = !DILocation(line: 13, column: 1, scope: !733)
!733 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 6)
!734 = !DILocation(line: 13, column: 1, scope: !735)
!735 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 7)
!736 = !DILocation(line: 13, column: 1, scope: !737)
!737 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 8)
!738 = !DILocation(line: 13, column: 1, scope: !739)
!739 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 9)
!740 = !DILocation(line: 13, column: 1, scope: !741)
!741 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 10)
!742 = !DILocation(line: 13, column: 1, scope: !743)
!743 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 11)
!744 = !DILocation(line: 13, column: 1, scope: !745)
!745 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 12)
!746 = !DILocation(line: 13, column: 1, scope: !747)
!747 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 13)
!748 = !DILocation(line: 13, column: 1, scope: !749)
!749 = !DILexicalBlockFile(scope: !690, file: !669, discriminator: 14)
!750 = !DILocation(line: 55, column: 1, scope: !690)
!751 = distinct !DISubprogram(name: "hotspot_opt1", linkageName: "_Z12hotspot_opt1PfS_S_iiifffffi", scope: !669, file: !669, line: 57, type: !752, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !672)
!752 = !DISubroutineType(types: !753)
!753 = !{null, !105, !105, !105, !178, !178, !178, !104, !104, !104, !104, !104, !178}
!754 = !DILocalVariable(name: "p", arg: 1, scope: !751, file: !669, line: 57, type: !105)
!755 = !DILocation(line: 57, column: 26, scope: !751)
!756 = !DILocalVariable(name: "tIn", arg: 2, scope: !751, file: !669, line: 57, type: !105)
!757 = !DILocation(line: 57, column: 36, scope: !751)
!758 = !DILocalVariable(name: "tOut", arg: 3, scope: !751, file: !669, line: 57, type: !105)
!759 = !DILocation(line: 57, column: 48, scope: !751)
!760 = !DILocalVariable(name: "nx", arg: 4, scope: !751, file: !669, line: 58, type: !178)
!761 = !DILocation(line: 58, column: 13, scope: !751)
!762 = !DILocalVariable(name: "ny", arg: 5, scope: !751, file: !669, line: 58, type: !178)
!763 = !DILocation(line: 58, column: 21, scope: !751)
!764 = !DILocalVariable(name: "nz", arg: 6, scope: !751, file: !669, line: 58, type: !178)
!765 = !DILocation(line: 58, column: 29, scope: !751)
!766 = !DILocalVariable(name: "Cap", arg: 7, scope: !751, file: !669, line: 59, type: !104)
!767 = !DILocation(line: 59, column: 15, scope: !751)
!768 = !DILocalVariable(name: "Rx", arg: 8, scope: !751, file: !669, line: 60, type: !104)
!769 = !DILocation(line: 60, column: 15, scope: !751)
!770 = !DILocalVariable(name: "Ry", arg: 9, scope: !751, file: !669, line: 60, type: !104)
!771 = !DILocation(line: 60, column: 25, scope: !751)
!772 = !DILocalVariable(name: "Rz", arg: 10, scope: !751, file: !669, line: 60, type: !104)
!773 = !DILocation(line: 60, column: 35, scope: !751)
!774 = !DILocalVariable(name: "dt", arg: 11, scope: !751, file: !669, line: 61, type: !104)
!775 = !DILocation(line: 61, column: 15, scope: !751)
!776 = !DILocalVariable(name: "numiter", arg: 12, scope: !751, file: !669, line: 61, type: !178)
!777 = !DILocation(line: 61, column: 23, scope: !751)
!778 = !DILocalVariable(name: "ce", scope: !751, file: !669, line: 63, type: !104)
!779 = !DILocation(line: 63, column: 11, scope: !751)
!780 = !DILocalVariable(name: "cw", scope: !751, file: !669, line: 63, type: !104)
!781 = !DILocation(line: 63, column: 15, scope: !751)
!782 = !DILocalVariable(name: "cn", scope: !751, file: !669, line: 63, type: !104)
!783 = !DILocation(line: 63, column: 19, scope: !751)
!784 = !DILocalVariable(name: "cs", scope: !751, file: !669, line: 63, type: !104)
!785 = !DILocation(line: 63, column: 23, scope: !751)
!786 = !DILocalVariable(name: "ct", scope: !751, file: !669, line: 63, type: !104)
!787 = !DILocation(line: 63, column: 27, scope: !751)
!788 = !DILocalVariable(name: "cb", scope: !751, file: !669, line: 63, type: !104)
!789 = !DILocation(line: 63, column: 31, scope: !751)
!790 = !DILocalVariable(name: "cc", scope: !751, file: !669, line: 63, type: !104)
!791 = !DILocation(line: 63, column: 35, scope: !751)
!792 = !DILocalVariable(name: "stepDivCap", scope: !751, file: !669, line: 64, type: !104)
!793 = !DILocation(line: 64, column: 11, scope: !751)
!794 = !DILocation(line: 64, column: 24, scope: !751)
!795 = !DILocation(line: 64, column: 29, scope: !751)
!796 = !DILocation(line: 64, column: 27, scope: !751)
!797 = !DILocation(line: 65, column: 14, scope: !751)
!798 = !DILocation(line: 65, column: 26, scope: !751)
!799 = !DILocation(line: 65, column: 24, scope: !751)
!800 = !DILocation(line: 65, column: 13, scope: !751)
!801 = !DILocation(line: 65, column: 8, scope: !751)
!802 = !DILocation(line: 66, column: 14, scope: !751)
!803 = !DILocation(line: 66, column: 26, scope: !751)
!804 = !DILocation(line: 66, column: 24, scope: !751)
!805 = !DILocation(line: 66, column: 13, scope: !751)
!806 = !DILocation(line: 66, column: 8, scope: !751)
!807 = !DILocation(line: 67, column: 14, scope: !751)
!808 = !DILocation(line: 67, column: 26, scope: !751)
!809 = !DILocation(line: 67, column: 24, scope: !751)
!810 = !DILocation(line: 67, column: 13, scope: !751)
!811 = !DILocation(line: 67, column: 8, scope: !751)
!812 = !DILocation(line: 69, column: 21, scope: !751)
!813 = !DILocation(line: 69, column: 20, scope: !751)
!814 = !DILocation(line: 69, column: 30, scope: !751)
!815 = !DILocation(line: 69, column: 29, scope: !751)
!816 = !DILocation(line: 69, column: 24, scope: !751)
!817 = !DILocation(line: 69, column: 39, scope: !751)
!818 = !DILocation(line: 69, column: 38, scope: !751)
!819 = !DILocation(line: 69, column: 33, scope: !751)
!820 = !DILocation(line: 69, column: 14, scope: !751)
!821 = !DILocation(line: 69, column: 10, scope: !751)
!822 = !DILocation(line: 69, column: 8, scope: !751)
!823 = !DILocalVariable(name: "s", scope: !751, file: !669, line: 71, type: !399)
!824 = !DILocation(line: 71, column: 12, scope: !751)
!825 = !DILocation(line: 71, column: 32, scope: !751)
!826 = !DILocation(line: 71, column: 30, scope: !751)
!827 = !DILocation(line: 71, column: 37, scope: !751)
!828 = !DILocation(line: 71, column: 35, scope: !751)
!829 = !DILocation(line: 71, column: 42, scope: !751)
!830 = !DILocation(line: 71, column: 40, scope: !751)
!831 = !DILocalVariable(name: "tIn_d", scope: !751, file: !669, line: 72, type: !105)
!832 = !DILocation(line: 72, column: 13, scope: !751)
!833 = !DILocalVariable(name: "tOut_d", scope: !751, file: !669, line: 72, type: !105)
!834 = !DILocation(line: 72, column: 21, scope: !751)
!835 = !DILocalVariable(name: "p_d", scope: !751, file: !669, line: 72, type: !105)
!836 = !DILocation(line: 72, column: 30, scope: !751)
!837 = !DILocation(line: 73, column: 16, scope: !751)
!838 = !DILocation(line: 73, column: 29, scope: !751)
!839 = !DILocation(line: 73, column: 5, scope: !751)
!840 = !DILocation(line: 74, column: 16, scope: !751)
!841 = !DILocation(line: 74, column: 31, scope: !751)
!842 = !DILocation(line: 74, column: 5, scope: !751)
!843 = !DILocation(line: 75, column: 16, scope: !751)
!844 = !DILocation(line: 75, column: 32, scope: !751)
!845 = !DILocation(line: 75, column: 5, scope: !751)
!846 = !DILocation(line: 76, column: 16, scope: !751)
!847 = !DILocation(line: 76, column: 23, scope: !751)
!848 = !DILocation(line: 76, column: 28, scope: !751)
!849 = !DILocation(line: 76, column: 5, scope: !751)
!850 = !DILocation(line: 77, column: 16, scope: !751)
!851 = !DILocation(line: 77, column: 21, scope: !751)
!852 = !DILocation(line: 77, column: 24, scope: !751)
!853 = !DILocation(line: 77, column: 5, scope: !751)
!854 = !DILocation(line: 79, column: 5, scope: !751)
!855 = !DILocalVariable(name: "block_dim", scope: !751, file: !669, line: 81, type: !856)
!856 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !857, line: 427, baseType: !858)
!857 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!858 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !857, line: 417, size: 96, align: 32, elements: !859, identifier: "_ZTS4dim3")
!859 = !{!860, !861, !862, !863, !867, !876}
!860 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !858, file: !857, line: 419, baseType: !469, size: 32, align: 32)
!861 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !858, file: !857, line: 419, baseType: !469, size: 32, align: 32, offset: 32)
!862 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !858, file: !857, line: 419, baseType: !469, size: 32, align: 32, offset: 64)
!863 = !DISubprogram(name: "dim3", scope: !858, file: !857, line: 421, type: !864, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!864 = !DISubroutineType(types: !865)
!865 = !{null, !866, !469, !469, !469}
!866 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !858, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!867 = !DISubprogram(name: "dim3", scope: !858, file: !857, line: 422, type: !868, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!868 = !DISubroutineType(types: !869)
!869 = !{null, !866, !870}
!870 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !857, line: 383, baseType: !871)
!871 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !857, line: 190, size: 96, align: 32, elements: !872, identifier: "_ZTS5uint3")
!872 = !{!873, !874, !875}
!873 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !871, file: !857, line: 192, baseType: !469, size: 32, align: 32)
!874 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !871, file: !857, line: 192, baseType: !469, size: 32, align: 32, offset: 32)
!875 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !871, file: !857, line: 192, baseType: !469, size: 32, align: 32, offset: 64)
!876 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !858, file: !857, line: 423, type: !877, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!877 = !DISubroutineType(types: !878)
!878 = !{!870, !866}
!879 = !DILocation(line: 81, column: 10, scope: !751)
!880 = !DILocalVariable(name: "grid_dim", scope: !751, file: !669, line: 82, type: !856)
!881 = !DILocation(line: 82, column: 10, scope: !751)
!882 = !DILocation(line: 82, column: 19, scope: !751)
!883 = !DILocation(line: 82, column: 22, scope: !751)
!884 = !DILocation(line: 82, column: 28, scope: !751)
!885 = !DILocation(line: 82, column: 31, scope: !751)
!886 = !DILocalVariable(name: "start", scope: !751, file: !669, line: 84, type: !119)
!887 = !DILocation(line: 84, column: 15, scope: !751)
!888 = !DILocation(line: 84, column: 23, scope: !751)
!889 = !DILocalVariable(name: "i", scope: !890, file: !669, line: 85, type: !178)
!890 = distinct !DILexicalBlock(scope: !751, file: !669, line: 85, column: 5)
!891 = !DILocation(line: 85, column: 14, scope: !890)
!892 = !DILocation(line: 85, column: 10, scope: !890)
!893 = !DILocation(line: 85, column: 21, scope: !894)
!894 = !DILexicalBlockFile(scope: !895, file: !669, discriminator: 1)
!895 = distinct !DILexicalBlock(scope: !890, file: !669, line: 85, column: 5)
!896 = !DILocation(line: 85, column: 25, scope: !894)
!897 = !DILocation(line: 85, column: 23, scope: !894)
!898 = !DILocation(line: 85, column: 5, scope: !894)
!899 = !DILocation(line: 86, column: 23, scope: !900)
!900 = distinct !DILexicalBlock(scope: !895, file: !669, line: 85, column: 39)
!901 = !DILocation(line: 86, column: 33, scope: !900)
!902 = !DILocation(line: 86, column: 20, scope: !900)
!903 = !DILocation(line: 86, column: 9, scope: !900)
!904 = !DILocation(line: 87, column: 14, scope: !900)
!905 = !DILocation(line: 87, column: 19, scope: !900)
!906 = !DILocation(line: 87, column: 26, scope: !900)
!907 = !DILocation(line: 87, column: 34, scope: !900)
!908 = !DILocation(line: 87, column: 46, scope: !900)
!909 = !DILocation(line: 87, column: 50, scope: !900)
!910 = !DILocation(line: 87, column: 54, scope: !900)
!911 = !DILocation(line: 87, column: 58, scope: !900)
!912 = !DILocation(line: 87, column: 62, scope: !900)
!913 = !DILocation(line: 87, column: 66, scope: !900)
!914 = !DILocation(line: 87, column: 70, scope: !900)
!915 = !DILocation(line: 87, column: 74, scope: !900)
!916 = !DILocation(line: 87, column: 78, scope: !900)
!917 = !DILocation(line: 87, column: 82, scope: !900)
!918 = !DILocation(line: 86, column: 9, scope: !919)
!919 = !DILexicalBlockFile(scope: !900, file: !669, discriminator: 1)
!920 = !DILocalVariable(name: "t", scope: !900, file: !669, line: 88, type: !105)
!921 = !DILocation(line: 88, column: 16, scope: !900)
!922 = !DILocation(line: 88, column: 20, scope: !900)
!923 = !DILocation(line: 89, column: 17, scope: !900)
!924 = !DILocation(line: 89, column: 15, scope: !900)
!925 = !DILocation(line: 90, column: 18, scope: !900)
!926 = !DILocation(line: 90, column: 16, scope: !900)
!927 = !DILocation(line: 91, column: 5, scope: !900)
!928 = !DILocation(line: 85, column: 34, scope: !929)
!929 = !DILexicalBlockFile(scope: !895, file: !669, discriminator: 2)
!930 = !DILocation(line: 85, column: 5, scope: !929)
!931 = distinct !{!931, !932}
!932 = !DILocation(line: 85, column: 5, scope: !751)
!933 = !DILocation(line: 92, column: 5, scope: !751)
!934 = !DILocalVariable(name: "stop", scope: !751, file: !669, line: 93, type: !119)
!935 = !DILocation(line: 93, column: 15, scope: !751)
!936 = !DILocation(line: 93, column: 22, scope: !751)
!937 = !DILocalVariable(name: "time", scope: !751, file: !669, line: 94, type: !104)
!938 = !DILocation(line: 94, column: 11, scope: !751)
!939 = !DILocation(line: 94, column: 27, scope: !751)
!940 = !DILocation(line: 94, column: 34, scope: !751)
!941 = !DILocation(line: 94, column: 32, scope: !751)
!942 = !DILocation(line: 94, column: 26, scope: !751)
!943 = !DILocation(line: 94, column: 40, scope: !751)
!944 = !DILocation(line: 94, column: 25, scope: !751)
!945 = !DILocation(line: 95, column: 31, scope: !751)
!946 = !DILocation(line: 95, column: 5, scope: !751)
!947 = !DILocation(line: 96, column: 16, scope: !751)
!948 = !DILocation(line: 96, column: 22, scope: !751)
!949 = !DILocation(line: 96, column: 30, scope: !751)
!950 = !DILocation(line: 96, column: 5, scope: !751)
!951 = !DILocation(line: 97, column: 14, scope: !751)
!952 = !DILocation(line: 97, column: 5, scope: !751)
!953 = !DILocation(line: 98, column: 14, scope: !751)
!954 = !DILocation(line: 98, column: 5, scope: !751)
!955 = !DILocation(line: 99, column: 14, scope: !751)
!956 = !DILocation(line: 99, column: 5, scope: !751)
!957 = !DILocation(line: 100, column: 5, scope: !751)
!958 = distinct !DISubprogram(name: "cudaFuncSetCacheConfig<void (float *, float *, float *, float, int, int, int, float, float, float, float, float, float, float)>", linkageName: "_ZL22cudaFuncSetCacheConfigIFvPfS0_S0_fiiifffffffEE9cudaErrorPT_13cudaFuncCache", scope: !959, file: !959, line: 1303, type: !960, isLocal: true, isDefinition: true, scopeLine: 1307, flags: DIFlagPrototyped, isOptimized: false, unit: !1, templateParams: !964, variables: !672)
!959 = !DIFile(filename: "/usr/local/cuda/include/cuda_runtime.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!960 = !DISubroutineType(types: !961)
!961 = !{!962, !963, !12}
!962 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !5, line: 1477, baseType: !18)
!963 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !691, size: 64, align: 64)
!964 = !{!965}
!965 = !DITemplateTypeParameter(name: "T", type: !691)
!966 = !DILocalVariable(name: "func", arg: 1, scope: !958, file: !959, line: 1304, type: !963)
!967 = !DILocation(line: 1304, column: 23, scope: !958)
!968 = !DILocalVariable(name: "cacheConfig", arg: 2, scope: !958, file: !959, line: 1305, type: !12)
!969 = !DILocation(line: 1305, column: 23, scope: !958)
!970 = !DILocation(line: 1308, column: 48, scope: !958)
!971 = !DILocation(line: 1308, column: 35, scope: !958)
!972 = !DILocation(line: 1308, column: 54, scope: !958)
!973 = !DILocation(line: 1308, column: 10, scope: !958)
!974 = !DILocation(line: 1308, column: 3, scope: !958)
!975 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !858, file: !857, line: 421, type: !864, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !1, declaration: !863, variables: !672)
!976 = !DILocalVariable(name: "this", arg: 1, scope: !975, type: !977, flags: DIFlagArtificial | DIFlagObjectPointer)
!977 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !858, size: 64, align: 64)
!978 = !DILocation(line: 0, scope: !975)
!979 = !DILocalVariable(name: "vx", arg: 2, scope: !975, file: !857, line: 421, type: !469)
!980 = !DILocation(line: 421, column: 43, scope: !975)
!981 = !DILocalVariable(name: "vy", arg: 3, scope: !975, file: !857, line: 421, type: !469)
!982 = !DILocation(line: 421, column: 64, scope: !975)
!983 = !DILocalVariable(name: "vz", arg: 4, scope: !975, file: !857, line: 421, type: !469)
!984 = !DILocation(line: 421, column: 85, scope: !975)
!985 = !DILocation(line: 421, column: 95, scope: !975)
!986 = !DILocation(line: 421, column: 97, scope: !975)
!987 = !DILocation(line: 421, column: 102, scope: !975)
!988 = !DILocation(line: 421, column: 104, scope: !975)
!989 = !DILocation(line: 421, column: 109, scope: !975)
!990 = !DILocation(line: 421, column: 111, scope: !975)
!991 = !DILocation(line: 421, column: 116, scope: !975)
!992 = distinct !DISubprogram(name: "fatal", linkageName: "_Z5fatalPKc", scope: !2, file: !2, line: 29, type: !993, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !672)
!993 = !DISubroutineType(types: !994)
!994 = !{null, !257}
!995 = !DILocalVariable(name: "s", arg: 1, scope: !992, file: !2, line: 29, type: !257)
!996 = !DILocation(line: 29, column: 24, scope: !992)
!997 = !DILocation(line: 31, column: 13, scope: !992)
!998 = !DILocation(line: 31, column: 36, scope: !992)
!999 = !DILocation(line: 31, column: 5, scope: !992)
!1000 = !DILocation(line: 32, column: 1, scope: !992)
!1001 = distinct !DISubprogram(name: "readinput", linkageName: "_Z9readinputPfiiiPc", scope: !2, file: !2, line: 34, type: !1002, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !672)
!1002 = !DISubroutineType(types: !1003)
!1003 = !{null, !105, !178, !178, !178, !426}
!1004 = !DILocalVariable(name: "vect", arg: 1, scope: !1001, file: !2, line: 34, type: !105)
!1005 = !DILocation(line: 34, column: 23, scope: !1001)
!1006 = !DILocalVariable(name: "grid_rows", arg: 2, scope: !1001, file: !2, line: 34, type: !178)
!1007 = !DILocation(line: 34, column: 33, scope: !1001)
!1008 = !DILocalVariable(name: "grid_cols", arg: 3, scope: !1001, file: !2, line: 34, type: !178)
!1009 = !DILocation(line: 34, column: 48, scope: !1001)
!1010 = !DILocalVariable(name: "layers", arg: 4, scope: !1001, file: !2, line: 34, type: !178)
!1011 = !DILocation(line: 34, column: 63, scope: !1001)
!1012 = !DILocalVariable(name: "file", arg: 5, scope: !1001, file: !2, line: 34, type: !426)
!1013 = !DILocation(line: 34, column: 77, scope: !1001)
!1014 = !DILocalVariable(name: "i", scope: !1001, file: !2, line: 35, type: !178)
!1015 = !DILocation(line: 35, column: 9, scope: !1001)
!1016 = !DILocalVariable(name: "j", scope: !1001, file: !2, line: 35, type: !178)
!1017 = !DILocation(line: 35, column: 11, scope: !1001)
!1018 = !DILocalVariable(name: "k", scope: !1001, file: !2, line: 35, type: !178)
!1019 = !DILocation(line: 35, column: 13, scope: !1001)
!1020 = !DILocalVariable(name: "fp", scope: !1001, file: !2, line: 36, type: !1021)
!1021 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1022, size: 64, align: 64)
!1022 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1023, line: 48, baseType: !1024)
!1023 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!1024 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !1025, line: 241, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!1025 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/hotspot3D")
!1026 = !DILocation(line: 36, column: 11, scope: !1001)
!1027 = !DILocalVariable(name: "str", scope: !1001, file: !2, line: 37, type: !1028)
!1028 = !DICompositeType(tag: DW_TAG_array_type, baseType: !259, size: 2048, align: 8, elements: !1029)
!1029 = !{!1030}
!1030 = !DISubrange(count: 256)
!1031 = !DILocation(line: 37, column: 10, scope: !1001)
!1032 = !DILocalVariable(name: "val", scope: !1001, file: !2, line: 38, type: !104)
!1033 = !DILocation(line: 38, column: 11, scope: !1001)
!1034 = !DILocation(line: 40, column: 22, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1001, file: !2, line: 40, column: 9)
!1036 = !DILocation(line: 40, column: 16, scope: !1035)
!1037 = !DILocation(line: 40, column: 14, scope: !1035)
!1038 = !DILocation(line: 40, column: 35, scope: !1035)
!1039 = !DILocation(line: 40, column: 9, scope: !1001)
!1040 = !DILocation(line: 41, column: 7, scope: !1035)
!1041 = !DILocation(line: 44, column: 11, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1001, file: !2, line: 44, column: 5)
!1043 = !DILocation(line: 44, column: 10, scope: !1042)
!1044 = !DILocation(line: 44, column: 15, scope: !1045)
!1045 = !DILexicalBlockFile(scope: !1046, file: !2, discriminator: 1)
!1046 = distinct !DILexicalBlock(scope: !1042, file: !2, line: 44, column: 5)
!1047 = !DILocation(line: 44, column: 20, scope: !1045)
!1048 = !DILocation(line: 44, column: 29, scope: !1045)
!1049 = !DILocation(line: 44, column: 17, scope: !1045)
!1050 = !DILocation(line: 44, column: 5, scope: !1045)
!1051 = !DILocation(line: 45, column: 13, scope: !1052)
!1052 = distinct !DILexicalBlock(scope: !1046, file: !2, line: 45, column: 7)
!1053 = !DILocation(line: 45, column: 12, scope: !1052)
!1054 = !DILocation(line: 45, column: 17, scope: !1055)
!1055 = !DILexicalBlockFile(scope: !1056, file: !2, discriminator: 1)
!1056 = distinct !DILexicalBlock(scope: !1052, file: !2, line: 45, column: 7)
!1057 = !DILocation(line: 45, column: 22, scope: !1055)
!1058 = !DILocation(line: 45, column: 31, scope: !1055)
!1059 = !DILocation(line: 45, column: 19, scope: !1055)
!1060 = !DILocation(line: 45, column: 7, scope: !1055)
!1061 = !DILocation(line: 46, column: 15, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1056, file: !2, line: 46, column: 9)
!1063 = !DILocation(line: 46, column: 14, scope: !1062)
!1064 = !DILocation(line: 46, column: 19, scope: !1065)
!1065 = !DILexicalBlockFile(scope: !1066, file: !2, discriminator: 1)
!1066 = distinct !DILexicalBlock(scope: !1062, file: !2, line: 46, column: 9)
!1067 = !DILocation(line: 46, column: 24, scope: !1065)
!1068 = !DILocation(line: 46, column: 30, scope: !1065)
!1069 = !DILocation(line: 46, column: 21, scope: !1065)
!1070 = !DILocation(line: 46, column: 9, scope: !1065)
!1071 = !DILocation(line: 48, column: 23, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1073, file: !2, line: 48, column: 17)
!1073 = distinct !DILexicalBlock(scope: !1066, file: !2, line: 47, column: 11)
!1074 = !DILocation(line: 48, column: 38, scope: !1072)
!1075 = !DILocation(line: 48, column: 17, scope: !1072)
!1076 = !DILocation(line: 48, column: 42, scope: !1072)
!1077 = !DILocation(line: 48, column: 17, scope: !1073)
!1078 = !DILocation(line: 48, column: 51, scope: !1079)
!1079 = !DILexicalBlockFile(scope: !1072, file: !2, discriminator: 1)
!1080 = !DILocation(line: 49, column: 22, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1073, file: !2, line: 49, column: 17)
!1082 = !DILocation(line: 49, column: 17, scope: !1081)
!1083 = !DILocation(line: 49, column: 17, scope: !1073)
!1084 = !DILocation(line: 50, column: 15, scope: !1081)
!1085 = !DILocation(line: 51, column: 25, scope: !1086)
!1086 = distinct !DILexicalBlock(scope: !1073, file: !2, line: 51, column: 17)
!1087 = !DILocation(line: 51, column: 18, scope: !1086)
!1088 = !DILocation(line: 51, column: 42, scope: !1086)
!1089 = !DILocation(line: 51, column: 17, scope: !1073)
!1090 = !DILocation(line: 52, column: 15, scope: !1086)
!1091 = !DILocation(line: 53, column: 57, scope: !1073)
!1092 = !DILocation(line: 53, column: 13, scope: !1073)
!1093 = !DILocation(line: 53, column: 18, scope: !1073)
!1094 = !DILocation(line: 53, column: 20, scope: !1073)
!1095 = !DILocation(line: 53, column: 19, scope: !1073)
!1096 = !DILocation(line: 53, column: 30, scope: !1073)
!1097 = !DILocation(line: 53, column: 29, scope: !1073)
!1098 = !DILocation(line: 53, column: 32, scope: !1073)
!1099 = !DILocation(line: 53, column: 34, scope: !1073)
!1100 = !DILocation(line: 53, column: 33, scope: !1073)
!1101 = !DILocation(line: 53, column: 44, scope: !1073)
!1102 = !DILocation(line: 53, column: 43, scope: !1073)
!1103 = !DILocation(line: 53, column: 31, scope: !1073)
!1104 = !DILocation(line: 53, column: 55, scope: !1073)
!1105 = !DILocation(line: 54, column: 11, scope: !1073)
!1106 = !DILocation(line: 46, column: 35, scope: !1107)
!1107 = !DILexicalBlockFile(scope: !1066, file: !2, discriminator: 2)
!1108 = !DILocation(line: 46, column: 9, scope: !1107)
!1109 = distinct !{!1109, !1110}
!1110 = !DILocation(line: 46, column: 9, scope: !1056)
!1111 = !DILocation(line: 54, column: 11, scope: !1112)
!1112 = !DILexicalBlockFile(scope: !1062, file: !2, discriminator: 1)
!1113 = !DILocation(line: 45, column: 36, scope: !1114)
!1114 = !DILexicalBlockFile(scope: !1056, file: !2, discriminator: 2)
!1115 = !DILocation(line: 45, column: 7, scope: !1114)
!1116 = distinct !{!1116, !1117}
!1117 = !DILocation(line: 45, column: 7, scope: !1046)
!1118 = !DILocation(line: 54, column: 11, scope: !1119)
!1119 = !DILexicalBlockFile(scope: !1052, file: !2, discriminator: 2)
!1120 = !DILocation(line: 44, column: 34, scope: !1121)
!1121 = !DILexicalBlockFile(scope: !1046, file: !2, discriminator: 2)
!1122 = !DILocation(line: 44, column: 5, scope: !1121)
!1123 = distinct !{!1123, !1124}
!1124 = !DILocation(line: 44, column: 5, scope: !1001)
!1125 = !DILocation(line: 56, column: 12, scope: !1001)
!1126 = !DILocation(line: 56, column: 5, scope: !1001)
!1127 = !DILocation(line: 58, column: 1, scope: !1001)
!1128 = distinct !DISubprogram(name: "writeoutput", linkageName: "_Z11writeoutputPfiiiPc", scope: !2, file: !2, line: 61, type: !1002, isLocal: false, isDefinition: true, scopeLine: 61, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !672)
!1129 = !DILocalVariable(name: "vect", arg: 1, scope: !1128, file: !2, line: 61, type: !105)
!1130 = !DILocation(line: 61, column: 25, scope: !1128)
!1131 = !DILocalVariable(name: "grid_rows", arg: 2, scope: !1128, file: !2, line: 61, type: !178)
!1132 = !DILocation(line: 61, column: 35, scope: !1128)
!1133 = !DILocalVariable(name: "grid_cols", arg: 3, scope: !1128, file: !2, line: 61, type: !178)
!1134 = !DILocation(line: 61, column: 50, scope: !1128)
!1135 = !DILocalVariable(name: "layers", arg: 4, scope: !1128, file: !2, line: 61, type: !178)
!1136 = !DILocation(line: 61, column: 65, scope: !1128)
!1137 = !DILocalVariable(name: "file", arg: 5, scope: !1128, file: !2, line: 61, type: !426)
!1138 = !DILocation(line: 61, column: 79, scope: !1128)
!1139 = !DILocalVariable(name: "i", scope: !1128, file: !2, line: 63, type: !178)
!1140 = !DILocation(line: 63, column: 9, scope: !1128)
!1141 = !DILocalVariable(name: "j", scope: !1128, file: !2, line: 63, type: !178)
!1142 = !DILocation(line: 63, column: 11, scope: !1128)
!1143 = !DILocalVariable(name: "k", scope: !1128, file: !2, line: 63, type: !178)
!1144 = !DILocation(line: 63, column: 13, scope: !1128)
!1145 = !DILocalVariable(name: "index", scope: !1128, file: !2, line: 63, type: !178)
!1146 = !DILocation(line: 63, column: 16, scope: !1128)
!1147 = !DILocalVariable(name: "fp", scope: !1128, file: !2, line: 64, type: !1021)
!1148 = !DILocation(line: 64, column: 11, scope: !1128)
!1149 = !DILocalVariable(name: "str", scope: !1128, file: !2, line: 65, type: !1028)
!1150 = !DILocation(line: 65, column: 10, scope: !1128)
!1151 = !DILocation(line: 67, column: 21, scope: !1152)
!1152 = distinct !DILexicalBlock(scope: !1128, file: !2, line: 67, column: 9)
!1153 = !DILocation(line: 67, column: 15, scope: !1152)
!1154 = !DILocation(line: 67, column: 13, scope: !1152)
!1155 = !DILocation(line: 67, column: 34, scope: !1152)
!1156 = !DILocation(line: 67, column: 9, scope: !1128)
!1157 = !DILocation(line: 68, column: 7, scope: !1152)
!1158 = !DILocation(line: 70, column: 11, scope: !1159)
!1159 = distinct !DILexicalBlock(scope: !1128, file: !2, line: 70, column: 5)
!1160 = !DILocation(line: 70, column: 10, scope: !1159)
!1161 = !DILocation(line: 70, column: 15, scope: !1162)
!1162 = !DILexicalBlockFile(scope: !1163, file: !2, discriminator: 1)
!1163 = distinct !DILexicalBlock(scope: !1159, file: !2, line: 70, column: 5)
!1164 = !DILocation(line: 70, column: 19, scope: !1162)
!1165 = !DILocation(line: 70, column: 17, scope: !1162)
!1166 = !DILocation(line: 70, column: 5, scope: !1162)
!1167 = !DILocation(line: 71, column: 13, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1163, file: !2, line: 71, column: 7)
!1169 = !DILocation(line: 71, column: 12, scope: !1168)
!1170 = !DILocation(line: 71, column: 17, scope: !1171)
!1171 = !DILexicalBlockFile(scope: !1172, file: !2, discriminator: 1)
!1172 = distinct !DILexicalBlock(scope: !1168, file: !2, line: 71, column: 7)
!1173 = !DILocation(line: 71, column: 21, scope: !1171)
!1174 = !DILocation(line: 71, column: 19, scope: !1171)
!1175 = !DILocation(line: 71, column: 7, scope: !1171)
!1176 = !DILocation(line: 72, column: 15, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !1172, file: !2, line: 72, column: 9)
!1178 = !DILocation(line: 72, column: 14, scope: !1177)
!1179 = !DILocation(line: 72, column: 19, scope: !1180)
!1180 = !DILexicalBlockFile(scope: !1181, file: !2, discriminator: 1)
!1181 = distinct !DILexicalBlock(scope: !1177, file: !2, line: 72, column: 9)
!1182 = !DILocation(line: 72, column: 23, scope: !1180)
!1183 = !DILocation(line: 72, column: 21, scope: !1180)
!1184 = !DILocation(line: 72, column: 9, scope: !1180)
!1185 = !DILocation(line: 74, column: 21, scope: !1186)
!1186 = distinct !DILexicalBlock(scope: !1181, file: !2, line: 73, column: 11)
!1187 = !DILocation(line: 74, column: 38, scope: !1186)
!1188 = !DILocation(line: 74, column: 45, scope: !1186)
!1189 = !DILocation(line: 74, column: 50, scope: !1186)
!1190 = !DILocation(line: 74, column: 52, scope: !1186)
!1191 = !DILocation(line: 74, column: 51, scope: !1186)
!1192 = !DILocation(line: 74, column: 62, scope: !1186)
!1193 = !DILocation(line: 74, column: 61, scope: !1186)
!1194 = !DILocation(line: 74, column: 64, scope: !1186)
!1195 = !DILocation(line: 74, column: 66, scope: !1186)
!1196 = !DILocation(line: 74, column: 65, scope: !1186)
!1197 = !DILocation(line: 74, column: 76, scope: !1186)
!1198 = !DILocation(line: 74, column: 75, scope: !1186)
!1199 = !DILocation(line: 74, column: 63, scope: !1186)
!1200 = !DILocation(line: 74, column: 13, scope: !1186)
!1201 = !DILocation(line: 75, column: 19, scope: !1186)
!1202 = !DILocation(line: 75, column: 23, scope: !1186)
!1203 = !DILocation(line: 75, column: 13, scope: !1186)
!1204 = !DILocation(line: 76, column: 18, scope: !1186)
!1205 = !DILocation(line: 77, column: 11, scope: !1186)
!1206 = !DILocation(line: 72, column: 32, scope: !1207)
!1207 = !DILexicalBlockFile(scope: !1181, file: !2, discriminator: 2)
!1208 = !DILocation(line: 72, column: 9, scope: !1207)
!1209 = distinct !{!1209, !1210}
!1210 = !DILocation(line: 72, column: 9, scope: !1172)
!1211 = !DILocation(line: 77, column: 11, scope: !1212)
!1212 = !DILexicalBlockFile(scope: !1177, file: !2, discriminator: 1)
!1213 = !DILocation(line: 71, column: 33, scope: !1214)
!1214 = !DILexicalBlockFile(scope: !1172, file: !2, discriminator: 2)
!1215 = !DILocation(line: 71, column: 7, scope: !1214)
!1216 = distinct !{!1216, !1217}
!1217 = !DILocation(line: 71, column: 7, scope: !1163)
!1218 = !DILocation(line: 77, column: 11, scope: !1219)
!1219 = !DILexicalBlockFile(scope: !1168, file: !2, discriminator: 2)
!1220 = !DILocation(line: 70, column: 31, scope: !1221)
!1221 = !DILexicalBlockFile(scope: !1163, file: !2, discriminator: 2)
!1222 = !DILocation(line: 70, column: 5, scope: !1221)
!1223 = distinct !{!1223, !1224}
!1224 = !DILocation(line: 70, column: 5, scope: !1128)
!1225 = !DILocation(line: 79, column: 12, scope: !1128)
!1226 = !DILocation(line: 79, column: 5, scope: !1128)
!1227 = !DILocation(line: 80, column: 1, scope: !1128)
!1228 = distinct !DISubprogram(name: "computeTempCPU", linkageName: "_Z14computeTempCPUPfS_S_iiifffffi", scope: !2, file: !2, line: 82, type: !752, isLocal: false, isDefinition: true, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !672)
!1229 = !DILocalVariable(name: "pIn", arg: 1, scope: !1228, file: !2, line: 82, type: !105)
!1230 = !DILocation(line: 82, column: 28, scope: !1228)
!1231 = !DILocalVariable(name: "tIn", arg: 2, scope: !1228, file: !2, line: 82, type: !105)
!1232 = !DILocation(line: 82, column: 40, scope: !1228)
!1233 = !DILocalVariable(name: "tOut", arg: 3, scope: !1228, file: !2, line: 82, type: !105)
!1234 = !DILocation(line: 82, column: 52, scope: !1228)
!1235 = !DILocalVariable(name: "nx", arg: 4, scope: !1228, file: !2, line: 83, type: !178)
!1236 = !DILocation(line: 83, column: 13, scope: !1228)
!1237 = !DILocalVariable(name: "ny", arg: 5, scope: !1228, file: !2, line: 83, type: !178)
!1238 = !DILocation(line: 83, column: 21, scope: !1228)
!1239 = !DILocalVariable(name: "nz", arg: 6, scope: !1228, file: !2, line: 83, type: !178)
!1240 = !DILocation(line: 83, column: 29, scope: !1228)
!1241 = !DILocalVariable(name: "Cap", arg: 7, scope: !1228, file: !2, line: 83, type: !104)
!1242 = !DILocation(line: 83, column: 39, scope: !1228)
!1243 = !DILocalVariable(name: "Rx", arg: 8, scope: !1228, file: !2, line: 84, type: !104)
!1244 = !DILocation(line: 84, column: 15, scope: !1228)
!1245 = !DILocalVariable(name: "Ry", arg: 9, scope: !1228, file: !2, line: 84, type: !104)
!1246 = !DILocation(line: 84, column: 25, scope: !1228)
!1247 = !DILocalVariable(name: "Rz", arg: 10, scope: !1228, file: !2, line: 84, type: !104)
!1248 = !DILocation(line: 84, column: 35, scope: !1228)
!1249 = !DILocalVariable(name: "dt", arg: 11, scope: !1228, file: !2, line: 85, type: !104)
!1250 = !DILocation(line: 85, column: 15, scope: !1228)
!1251 = !DILocalVariable(name: "numiter", arg: 12, scope: !1228, file: !2, line: 85, type: !178)
!1252 = !DILocation(line: 85, column: 23, scope: !1228)
!1253 = !DILocalVariable(name: "ce", scope: !1228, file: !2, line: 86, type: !104)
!1254 = !DILocation(line: 86, column: 11, scope: !1228)
!1255 = !DILocalVariable(name: "cw", scope: !1228, file: !2, line: 86, type: !104)
!1256 = !DILocation(line: 86, column: 15, scope: !1228)
!1257 = !DILocalVariable(name: "cn", scope: !1228, file: !2, line: 86, type: !104)
!1258 = !DILocation(line: 86, column: 19, scope: !1228)
!1259 = !DILocalVariable(name: "cs", scope: !1228, file: !2, line: 86, type: !104)
!1260 = !DILocation(line: 86, column: 23, scope: !1228)
!1261 = !DILocalVariable(name: "ct", scope: !1228, file: !2, line: 86, type: !104)
!1262 = !DILocation(line: 86, column: 27, scope: !1228)
!1263 = !DILocalVariable(name: "cb", scope: !1228, file: !2, line: 86, type: !104)
!1264 = !DILocation(line: 86, column: 31, scope: !1228)
!1265 = !DILocalVariable(name: "cc", scope: !1228, file: !2, line: 86, type: !104)
!1266 = !DILocation(line: 86, column: 35, scope: !1228)
!1267 = !DILocalVariable(name: "stepDivCap", scope: !1228, file: !2, line: 87, type: !104)
!1268 = !DILocation(line: 87, column: 11, scope: !1228)
!1269 = !DILocation(line: 87, column: 24, scope: !1228)
!1270 = !DILocation(line: 87, column: 29, scope: !1228)
!1271 = !DILocation(line: 87, column: 27, scope: !1228)
!1272 = !DILocation(line: 88, column: 14, scope: !1228)
!1273 = !DILocation(line: 88, column: 26, scope: !1228)
!1274 = !DILocation(line: 88, column: 24, scope: !1228)
!1275 = !DILocation(line: 88, column: 13, scope: !1228)
!1276 = !DILocation(line: 88, column: 8, scope: !1228)
!1277 = !DILocation(line: 89, column: 14, scope: !1228)
!1278 = !DILocation(line: 89, column: 26, scope: !1228)
!1279 = !DILocation(line: 89, column: 24, scope: !1228)
!1280 = !DILocation(line: 89, column: 13, scope: !1228)
!1281 = !DILocation(line: 89, column: 8, scope: !1228)
!1282 = !DILocation(line: 90, column: 14, scope: !1228)
!1283 = !DILocation(line: 90, column: 26, scope: !1228)
!1284 = !DILocation(line: 90, column: 24, scope: !1228)
!1285 = !DILocation(line: 90, column: 13, scope: !1228)
!1286 = !DILocation(line: 90, column: 8, scope: !1228)
!1287 = !DILocation(line: 92, column: 21, scope: !1228)
!1288 = !DILocation(line: 92, column: 20, scope: !1228)
!1289 = !DILocation(line: 92, column: 30, scope: !1228)
!1290 = !DILocation(line: 92, column: 29, scope: !1228)
!1291 = !DILocation(line: 92, column: 24, scope: !1228)
!1292 = !DILocation(line: 92, column: 39, scope: !1228)
!1293 = !DILocation(line: 92, column: 38, scope: !1228)
!1294 = !DILocation(line: 92, column: 33, scope: !1228)
!1295 = !DILocation(line: 92, column: 14, scope: !1228)
!1296 = !DILocation(line: 92, column: 10, scope: !1228)
!1297 = !DILocation(line: 92, column: 8, scope: !1228)
!1298 = !DILocalVariable(name: "c", scope: !1228, file: !2, line: 94, type: !178)
!1299 = !DILocation(line: 94, column: 9, scope: !1228)
!1300 = !DILocalVariable(name: "w", scope: !1228, file: !2, line: 94, type: !178)
!1301 = !DILocation(line: 94, column: 11, scope: !1228)
!1302 = !DILocalVariable(name: "e", scope: !1228, file: !2, line: 94, type: !178)
!1303 = !DILocation(line: 94, column: 13, scope: !1228)
!1304 = !DILocalVariable(name: "n", scope: !1228, file: !2, line: 94, type: !178)
!1305 = !DILocation(line: 94, column: 15, scope: !1228)
!1306 = !DILocalVariable(name: "s", scope: !1228, file: !2, line: 94, type: !178)
!1307 = !DILocation(line: 94, column: 17, scope: !1228)
!1308 = !DILocalVariable(name: "b", scope: !1228, file: !2, line: 94, type: !178)
!1309 = !DILocation(line: 94, column: 19, scope: !1228)
!1310 = !DILocalVariable(name: "t", scope: !1228, file: !2, line: 94, type: !178)
!1311 = !DILocation(line: 94, column: 21, scope: !1228)
!1312 = !DILocalVariable(name: "x", scope: !1228, file: !2, line: 95, type: !178)
!1313 = !DILocation(line: 95, column: 9, scope: !1228)
!1314 = !DILocalVariable(name: "y", scope: !1228, file: !2, line: 95, type: !178)
!1315 = !DILocation(line: 95, column: 11, scope: !1228)
!1316 = !DILocalVariable(name: "z", scope: !1228, file: !2, line: 95, type: !178)
!1317 = !DILocation(line: 95, column: 13, scope: !1228)
!1318 = !DILocalVariable(name: "i", scope: !1228, file: !2, line: 96, type: !178)
!1319 = !DILocation(line: 96, column: 9, scope: !1228)
!1320 = !DILocation(line: 97, column: 5, scope: !1228)
!1321 = distinct !{!1321, !1320}
!1322 = !DILocation(line: 98, column: 15, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1324, file: !2, line: 98, column: 9)
!1324 = distinct !DILexicalBlock(scope: !1228, file: !2, line: 97, column: 7)
!1325 = !DILocation(line: 98, column: 13, scope: !1323)
!1326 = !DILocation(line: 98, column: 20, scope: !1327)
!1327 = !DILexicalBlockFile(scope: !1328, file: !2, discriminator: 1)
!1328 = distinct !DILexicalBlock(scope: !1323, file: !2, line: 98, column: 9)
!1329 = !DILocation(line: 98, column: 24, scope: !1327)
!1330 = !DILocation(line: 98, column: 22, scope: !1327)
!1331 = !DILocation(line: 98, column: 9, scope: !1327)
!1332 = !DILocation(line: 99, column: 19, scope: !1333)
!1333 = distinct !DILexicalBlock(scope: !1328, file: !2, line: 99, column: 13)
!1334 = !DILocation(line: 99, column: 17, scope: !1333)
!1335 = !DILocation(line: 99, column: 24, scope: !1336)
!1336 = !DILexicalBlockFile(scope: !1337, file: !2, discriminator: 1)
!1337 = distinct !DILexicalBlock(scope: !1333, file: !2, line: 99, column: 13)
!1338 = !DILocation(line: 99, column: 28, scope: !1336)
!1339 = !DILocation(line: 99, column: 26, scope: !1336)
!1340 = !DILocation(line: 99, column: 13, scope: !1336)
!1341 = !DILocation(line: 100, column: 23, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1337, file: !2, line: 100, column: 17)
!1343 = !DILocation(line: 100, column: 21, scope: !1342)
!1344 = !DILocation(line: 100, column: 28, scope: !1345)
!1345 = !DILexicalBlockFile(scope: !1346, file: !2, discriminator: 1)
!1346 = distinct !DILexicalBlock(scope: !1342, file: !2, line: 100, column: 17)
!1347 = !DILocation(line: 100, column: 32, scope: !1345)
!1348 = !DILocation(line: 100, column: 30, scope: !1345)
!1349 = !DILocation(line: 100, column: 17, scope: !1345)
!1350 = !DILocation(line: 102, column: 25, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1346, file: !2, line: 101, column: 17)
!1352 = !DILocation(line: 102, column: 29, scope: !1351)
!1353 = !DILocation(line: 102, column: 33, scope: !1351)
!1354 = !DILocation(line: 102, column: 31, scope: !1351)
!1355 = !DILocation(line: 102, column: 27, scope: !1351)
!1356 = !DILocation(line: 102, column: 38, scope: !1351)
!1357 = !DILocation(line: 102, column: 42, scope: !1351)
!1358 = !DILocation(line: 102, column: 40, scope: !1351)
!1359 = !DILocation(line: 102, column: 47, scope: !1351)
!1360 = !DILocation(line: 102, column: 45, scope: !1351)
!1361 = !DILocation(line: 102, column: 36, scope: !1351)
!1362 = !DILocation(line: 102, column: 23, scope: !1351)
!1363 = !DILocation(line: 104, column: 26, scope: !1351)
!1364 = !DILocation(line: 104, column: 28, scope: !1351)
!1365 = !DILocation(line: 104, column: 25, scope: !1351)
!1366 = !DILocation(line: 104, column: 36, scope: !1367)
!1367 = !DILexicalBlockFile(scope: !1351, file: !2, discriminator: 1)
!1368 = !DILocation(line: 104, column: 25, scope: !1367)
!1369 = !DILocation(line: 104, column: 45, scope: !1370)
!1370 = !DILexicalBlockFile(scope: !1351, file: !2, discriminator: 2)
!1371 = !DILocation(line: 104, column: 47, scope: !1370)
!1372 = !DILocation(line: 104, column: 25, scope: !1370)
!1373 = !DILocation(line: 104, column: 25, scope: !1374)
!1374 = !DILexicalBlockFile(scope: !1351, file: !2, discriminator: 3)
!1375 = !DILocation(line: 104, column: 23, scope: !1374)
!1376 = !DILocation(line: 105, column: 26, scope: !1351)
!1377 = !DILocation(line: 105, column: 31, scope: !1351)
!1378 = !DILocation(line: 105, column: 34, scope: !1351)
!1379 = !DILocation(line: 105, column: 28, scope: !1351)
!1380 = !DILocation(line: 105, column: 25, scope: !1351)
!1381 = !DILocation(line: 105, column: 41, scope: !1367)
!1382 = !DILocation(line: 105, column: 25, scope: !1367)
!1383 = !DILocation(line: 105, column: 45, scope: !1370)
!1384 = !DILocation(line: 105, column: 47, scope: !1370)
!1385 = !DILocation(line: 105, column: 25, scope: !1370)
!1386 = !DILocation(line: 105, column: 25, scope: !1374)
!1387 = !DILocation(line: 105, column: 23, scope: !1374)
!1388 = !DILocation(line: 106, column: 26, scope: !1351)
!1389 = !DILocation(line: 106, column: 28, scope: !1351)
!1390 = !DILocation(line: 106, column: 25, scope: !1351)
!1391 = !DILocation(line: 106, column: 36, scope: !1367)
!1392 = !DILocation(line: 106, column: 25, scope: !1367)
!1393 = !DILocation(line: 106, column: 45, scope: !1370)
!1394 = !DILocation(line: 106, column: 49, scope: !1370)
!1395 = !DILocation(line: 106, column: 47, scope: !1370)
!1396 = !DILocation(line: 106, column: 25, scope: !1370)
!1397 = !DILocation(line: 106, column: 25, scope: !1374)
!1398 = !DILocation(line: 106, column: 23, scope: !1374)
!1399 = !DILocation(line: 107, column: 26, scope: !1351)
!1400 = !DILocation(line: 107, column: 31, scope: !1351)
!1401 = !DILocation(line: 107, column: 34, scope: !1351)
!1402 = !DILocation(line: 107, column: 28, scope: !1351)
!1403 = !DILocation(line: 107, column: 25, scope: !1351)
!1404 = !DILocation(line: 107, column: 41, scope: !1367)
!1405 = !DILocation(line: 107, column: 25, scope: !1367)
!1406 = !DILocation(line: 107, column: 45, scope: !1370)
!1407 = !DILocation(line: 107, column: 49, scope: !1370)
!1408 = !DILocation(line: 107, column: 47, scope: !1370)
!1409 = !DILocation(line: 107, column: 25, scope: !1370)
!1410 = !DILocation(line: 107, column: 25, scope: !1374)
!1411 = !DILocation(line: 107, column: 23, scope: !1374)
!1412 = !DILocation(line: 108, column: 26, scope: !1351)
!1413 = !DILocation(line: 108, column: 28, scope: !1351)
!1414 = !DILocation(line: 108, column: 25, scope: !1351)
!1415 = !DILocation(line: 108, column: 36, scope: !1367)
!1416 = !DILocation(line: 108, column: 25, scope: !1367)
!1417 = !DILocation(line: 108, column: 45, scope: !1370)
!1418 = !DILocation(line: 108, column: 49, scope: !1370)
!1419 = !DILocation(line: 108, column: 54, scope: !1370)
!1420 = !DILocation(line: 108, column: 52, scope: !1370)
!1421 = !DILocation(line: 108, column: 47, scope: !1370)
!1422 = !DILocation(line: 108, column: 25, scope: !1370)
!1423 = !DILocation(line: 108, column: 25, scope: !1374)
!1424 = !DILocation(line: 108, column: 23, scope: !1374)
!1425 = !DILocation(line: 109, column: 26, scope: !1351)
!1426 = !DILocation(line: 109, column: 31, scope: !1351)
!1427 = !DILocation(line: 109, column: 34, scope: !1351)
!1428 = !DILocation(line: 109, column: 28, scope: !1351)
!1429 = !DILocation(line: 109, column: 25, scope: !1351)
!1430 = !DILocation(line: 109, column: 41, scope: !1367)
!1431 = !DILocation(line: 109, column: 25, scope: !1367)
!1432 = !DILocation(line: 109, column: 45, scope: !1370)
!1433 = !DILocation(line: 109, column: 49, scope: !1370)
!1434 = !DILocation(line: 109, column: 54, scope: !1370)
!1435 = !DILocation(line: 109, column: 52, scope: !1370)
!1436 = !DILocation(line: 109, column: 47, scope: !1370)
!1437 = !DILocation(line: 109, column: 25, scope: !1370)
!1438 = !DILocation(line: 109, column: 25, scope: !1374)
!1439 = !DILocation(line: 109, column: 23, scope: !1374)
!1440 = !DILocation(line: 111, column: 31, scope: !1351)
!1441 = !DILocation(line: 111, column: 35, scope: !1351)
!1442 = !DILocation(line: 111, column: 38, scope: !1351)
!1443 = !DILocation(line: 111, column: 37, scope: !1351)
!1444 = !DILocation(line: 111, column: 43, scope: !1351)
!1445 = !DILocation(line: 111, column: 47, scope: !1351)
!1446 = !DILocation(line: 111, column: 50, scope: !1351)
!1447 = !DILocation(line: 111, column: 49, scope: !1351)
!1448 = !DILocation(line: 111, column: 41, scope: !1351)
!1449 = !DILocation(line: 111, column: 55, scope: !1351)
!1450 = !DILocation(line: 111, column: 59, scope: !1351)
!1451 = !DILocation(line: 111, column: 62, scope: !1351)
!1452 = !DILocation(line: 111, column: 61, scope: !1351)
!1453 = !DILocation(line: 111, column: 53, scope: !1351)
!1454 = !DILocation(line: 111, column: 67, scope: !1351)
!1455 = !DILocation(line: 111, column: 71, scope: !1351)
!1456 = !DILocation(line: 111, column: 74, scope: !1351)
!1457 = !DILocation(line: 111, column: 73, scope: !1351)
!1458 = !DILocation(line: 111, column: 65, scope: !1351)
!1459 = !DILocation(line: 111, column: 79, scope: !1351)
!1460 = !DILocation(line: 111, column: 83, scope: !1351)
!1461 = !DILocation(line: 111, column: 86, scope: !1351)
!1462 = !DILocation(line: 111, column: 85, scope: !1351)
!1463 = !DILocation(line: 111, column: 77, scope: !1351)
!1464 = !DILocation(line: 111, column: 91, scope: !1351)
!1465 = !DILocation(line: 111, column: 95, scope: !1351)
!1466 = !DILocation(line: 111, column: 98, scope: !1351)
!1467 = !DILocation(line: 111, column: 97, scope: !1351)
!1468 = !DILocation(line: 111, column: 89, scope: !1351)
!1469 = !DILocation(line: 111, column: 103, scope: !1351)
!1470 = !DILocation(line: 111, column: 107, scope: !1351)
!1471 = !DILocation(line: 111, column: 110, scope: !1351)
!1472 = !DILocation(line: 111, column: 109, scope: !1351)
!1473 = !DILocation(line: 111, column: 101, scope: !1351)
!1474 = !DILocation(line: 111, column: 116, scope: !1351)
!1475 = !DILocation(line: 111, column: 119, scope: !1351)
!1476 = !DILocation(line: 111, column: 118, scope: !1351)
!1477 = !DILocation(line: 111, column: 126, scope: !1351)
!1478 = !DILocation(line: 111, column: 130, scope: !1351)
!1479 = !DILocation(line: 111, column: 124, scope: !1351)
!1480 = !DILocation(line: 111, column: 113, scope: !1351)
!1481 = !DILocation(line: 111, column: 135, scope: !1351)
!1482 = !DILocation(line: 111, column: 138, scope: !1351)
!1483 = !DILocation(line: 111, column: 137, scope: !1351)
!1484 = !DILocation(line: 111, column: 133, scope: !1351)
!1485 = !DILocation(line: 111, column: 21, scope: !1351)
!1486 = !DILocation(line: 111, column: 26, scope: !1351)
!1487 = !DILocation(line: 111, column: 29, scope: !1351)
!1488 = !DILocation(line: 112, column: 17, scope: !1351)
!1489 = !DILocation(line: 100, column: 37, scope: !1490)
!1490 = !DILexicalBlockFile(scope: !1346, file: !2, discriminator: 2)
!1491 = !DILocation(line: 100, column: 17, scope: !1490)
!1492 = distinct !{!1492, !1493}
!1493 = !DILocation(line: 100, column: 17, scope: !1337)
!1494 = !DILocation(line: 112, column: 17, scope: !1495)
!1495 = !DILexicalBlockFile(scope: !1342, file: !2, discriminator: 1)
!1496 = !DILocation(line: 99, column: 33, scope: !1497)
!1497 = !DILexicalBlockFile(scope: !1337, file: !2, discriminator: 2)
!1498 = !DILocation(line: 99, column: 13, scope: !1497)
!1499 = distinct !{!1499, !1500}
!1500 = !DILocation(line: 99, column: 13, scope: !1328)
!1501 = !DILocation(line: 112, column: 17, scope: !1502)
!1502 = !DILexicalBlockFile(scope: !1333, file: !2, discriminator: 2)
!1503 = !DILocation(line: 98, column: 29, scope: !1504)
!1504 = !DILexicalBlockFile(scope: !1328, file: !2, discriminator: 2)
!1505 = !DILocation(line: 98, column: 9, scope: !1504)
!1506 = distinct !{!1506, !1507}
!1507 = !DILocation(line: 98, column: 9, scope: !1324)
!1508 = !DILocalVariable(name: "temp", scope: !1324, file: !2, line: 113, type: !105)
!1509 = !DILocation(line: 113, column: 16, scope: !1324)
!1510 = !DILocation(line: 113, column: 23, scope: !1324)
!1511 = !DILocation(line: 114, column: 15, scope: !1324)
!1512 = !DILocation(line: 114, column: 13, scope: !1324)
!1513 = !DILocation(line: 115, column: 16, scope: !1324)
!1514 = !DILocation(line: 115, column: 14, scope: !1324)
!1515 = !DILocation(line: 116, column: 10, scope: !1324)
!1516 = !DILocation(line: 117, column: 5, scope: !1324)
!1517 = !DILocation(line: 118, column: 11, scope: !1228)
!1518 = !DILocation(line: 118, column: 15, scope: !1228)
!1519 = !DILocation(line: 118, column: 13, scope: !1228)
!1520 = !DILocation(line: 117, column: 5, scope: !1521)
!1521 = !DILexicalBlockFile(scope: !1324, file: !2, discriminator: 1)
!1522 = !DILocation(line: 120, column: 1, scope: !1228)
!1523 = distinct !DISubprogram(name: "accuracy", linkageName: "_Z8accuracyPfS_i", scope: !2, file: !2, line: 122, type: !1524, isLocal: false, isDefinition: true, scopeLine: 123, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !672)
!1524 = !DISubroutineType(types: !1525)
!1525 = !{!104, !105, !105, !178}
!1526 = !DILocalVariable(name: "arr1", arg: 1, scope: !1523, file: !2, line: 122, type: !105)
!1527 = !DILocation(line: 122, column: 23, scope: !1523)
!1528 = !DILocalVariable(name: "arr2", arg: 2, scope: !1523, file: !2, line: 122, type: !105)
!1529 = !DILocation(line: 122, column: 36, scope: !1523)
!1530 = !DILocalVariable(name: "len", arg: 3, scope: !1523, file: !2, line: 122, type: !178)
!1531 = !DILocation(line: 122, column: 46, scope: !1523)
!1532 = !DILocalVariable(name: "err", scope: !1523, file: !2, line: 124, type: !104)
!1533 = !DILocation(line: 124, column: 11, scope: !1523)
!1534 = !DILocalVariable(name: "i", scope: !1523, file: !2, line: 125, type: !178)
!1535 = !DILocation(line: 125, column: 9, scope: !1523)
!1536 = !DILocation(line: 126, column: 11, scope: !1537)
!1537 = distinct !DILexicalBlock(scope: !1523, file: !2, line: 126, column: 5)
!1538 = !DILocation(line: 126, column: 9, scope: !1537)
!1539 = !DILocation(line: 126, column: 16, scope: !1540)
!1540 = !DILexicalBlockFile(scope: !1541, file: !2, discriminator: 1)
!1541 = distinct !DILexicalBlock(scope: !1537, file: !2, line: 126, column: 5)
!1542 = !DILocation(line: 126, column: 20, scope: !1540)
!1543 = !DILocation(line: 126, column: 18, scope: !1540)
!1544 = !DILocation(line: 126, column: 5, scope: !1540)
!1545 = !DILocation(line: 128, column: 17, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1541, file: !2, line: 127, column: 5)
!1547 = !DILocation(line: 128, column: 22, scope: !1546)
!1548 = !DILocation(line: 128, column: 25, scope: !1546)
!1549 = !DILocation(line: 128, column: 30, scope: !1546)
!1550 = !DILocation(line: 128, column: 24, scope: !1546)
!1551 = !DILocation(line: 128, column: 37, scope: !1546)
!1552 = !DILocation(line: 128, column: 42, scope: !1546)
!1553 = !DILocation(line: 128, column: 45, scope: !1546)
!1554 = !DILocation(line: 128, column: 50, scope: !1546)
!1555 = !DILocation(line: 128, column: 44, scope: !1546)
!1556 = !DILocation(line: 128, column: 34, scope: !1546)
!1557 = !DILocation(line: 128, column: 13, scope: !1546)
!1558 = !DILocation(line: 129, column: 5, scope: !1546)
!1559 = !DILocation(line: 126, column: 26, scope: !1560)
!1560 = !DILexicalBlockFile(scope: !1541, file: !2, discriminator: 2)
!1561 = !DILocation(line: 126, column: 5, scope: !1560)
!1562 = distinct !{!1562, !1563}
!1563 = !DILocation(line: 126, column: 5, scope: !1523)
!1564 = !DILocation(line: 131, column: 24, scope: !1523)
!1565 = !DILocation(line: 131, column: 28, scope: !1523)
!1566 = !DILocation(line: 131, column: 27, scope: !1523)
!1567 = !DILocation(line: 131, column: 19, scope: !1523)
!1568 = !DILocation(line: 131, column: 5, scope: !1523)
!1569 = distinct !DISubprogram(name: "usage", linkageName: "_Z5usageiPPc", scope: !2, file: !2, line: 135, type: !1570, isLocal: false, isDefinition: true, scopeLine: 136, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !672)
!1570 = !DISubroutineType(types: !1571)
!1571 = !{null, !178, !475}
!1572 = !DILocalVariable(name: "argc", arg: 1, scope: !1569, file: !2, line: 135, type: !178)
!1573 = !DILocation(line: 135, column: 16, scope: !1569)
!1574 = !DILocalVariable(name: "argv", arg: 2, scope: !1569, file: !2, line: 135, type: !475)
!1575 = !DILocation(line: 135, column: 29, scope: !1569)
!1576 = !DILocation(line: 137, column: 13, scope: !1569)
!1577 = !DILocation(line: 137, column: 106, scope: !1569)
!1578 = !DILocation(line: 137, column: 5, scope: !1569)
!1579 = !DILocation(line: 138, column: 13, scope: !1569)
!1580 = !DILocation(line: 138, column: 5, scope: !1569)
!1581 = !DILocation(line: 139, column: 13, scope: !1569)
!1582 = !DILocation(line: 139, column: 5, scope: !1569)
!1583 = !DILocation(line: 141, column: 13, scope: !1569)
!1584 = !DILocation(line: 141, column: 5, scope: !1569)
!1585 = !DILocation(line: 142, column: 13, scope: !1569)
!1586 = !DILocation(line: 142, column: 5, scope: !1569)
!1587 = !DILocation(line: 143, column: 13, scope: !1569)
!1588 = !DILocation(line: 143, column: 5, scope: !1569)
!1589 = !DILocation(line: 144, column: 13, scope: !1569)
!1590 = !DILocation(line: 144, column: 5, scope: !1569)
!1591 = !DILocation(line: 145, column: 5, scope: !1569)
!1592 = !DILocation(line: 146, column: 1, scope: !1569)
!1593 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 148, type: !1594, isLocal: false, isDefinition: true, scopeLine: 149, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !672)
!1594 = !DISubroutineType(types: !1595)
!1595 = !{!178, !178, !475}
!1596 = !DILocalVariable(name: "argc", arg: 1, scope: !1593, file: !2, line: 148, type: !178)
!1597 = !DILocation(line: 148, column: 14, scope: !1593)
!1598 = !DILocalVariable(name: "argv", arg: 2, scope: !1593, file: !2, line: 148, type: !475)
!1599 = !DILocation(line: 148, column: 27, scope: !1593)
!1600 = !DILocation(line: 150, column: 9, scope: !1601)
!1601 = distinct !DILexicalBlock(scope: !1593, file: !2, line: 150, column: 9)
!1602 = !DILocation(line: 150, column: 14, scope: !1601)
!1603 = !DILocation(line: 150, column: 9, scope: !1593)
!1604 = !DILocation(line: 152, column: 15, scope: !1605)
!1605 = distinct !DILexicalBlock(scope: !1601, file: !2, line: 151, column: 5)
!1606 = !DILocation(line: 152, column: 20, scope: !1605)
!1607 = !DILocation(line: 152, column: 9, scope: !1605)
!1608 = !DILocation(line: 153, column: 5, scope: !1605)
!1609 = !DILocalVariable(name: "pfile", scope: !1593, file: !2, line: 155, type: !426)
!1610 = !DILocation(line: 155, column: 11, scope: !1593)
!1611 = !DILocalVariable(name: "tfile", scope: !1593, file: !2, line: 155, type: !426)
!1612 = !DILocation(line: 155, column: 19, scope: !1593)
!1613 = !DILocalVariable(name: "ofile", scope: !1593, file: !2, line: 155, type: !426)
!1614 = !DILocation(line: 155, column: 27, scope: !1593)
!1615 = !DILocalVariable(name: "iterations", scope: !1593, file: !2, line: 156, type: !178)
!1616 = !DILocation(line: 156, column: 9, scope: !1593)
!1617 = !DILocation(line: 156, column: 27, scope: !1593)
!1618 = !DILocation(line: 156, column: 22, scope: !1593)
!1619 = !DILocation(line: 158, column: 13, scope: !1593)
!1620 = !DILocation(line: 158, column: 11, scope: !1593)
!1621 = !DILocation(line: 159, column: 13, scope: !1593)
!1622 = !DILocation(line: 159, column: 11, scope: !1593)
!1623 = !DILocation(line: 160, column: 13, scope: !1593)
!1624 = !DILocation(line: 160, column: 11, scope: !1593)
!1625 = !DILocalVariable(name: "numCols", scope: !1593, file: !2, line: 161, type: !178)
!1626 = !DILocation(line: 161, column: 9, scope: !1593)
!1627 = !DILocation(line: 161, column: 24, scope: !1593)
!1628 = !DILocation(line: 161, column: 19, scope: !1593)
!1629 = !DILocalVariable(name: "numRows", scope: !1593, file: !2, line: 162, type: !178)
!1630 = !DILocation(line: 162, column: 9, scope: !1593)
!1631 = !DILocation(line: 162, column: 24, scope: !1593)
!1632 = !DILocation(line: 162, column: 19, scope: !1593)
!1633 = !DILocalVariable(name: "layers", scope: !1593, file: !2, line: 163, type: !178)
!1634 = !DILocation(line: 163, column: 9, scope: !1593)
!1635 = !DILocation(line: 163, column: 23, scope: !1593)
!1636 = !DILocation(line: 163, column: 18, scope: !1593)
!1637 = !DILocalVariable(name: "dx", scope: !1593, file: !2, line: 167, type: !104)
!1638 = !DILocation(line: 167, column: 11, scope: !1593)
!1639 = !DILocation(line: 167, column: 16, scope: !1593)
!1640 = !DILocation(line: 167, column: 28, scope: !1593)
!1641 = !DILocation(line: 167, column: 27, scope: !1593)
!1642 = !DILocalVariable(name: "dy", scope: !1593, file: !2, line: 168, type: !104)
!1643 = !DILocation(line: 168, column: 11, scope: !1593)
!1644 = !DILocation(line: 168, column: 16, scope: !1593)
!1645 = !DILocation(line: 168, column: 27, scope: !1593)
!1646 = !DILocation(line: 168, column: 26, scope: !1593)
!1647 = !DILocalVariable(name: "dz", scope: !1593, file: !2, line: 169, type: !104)
!1648 = !DILocation(line: 169, column: 11, scope: !1593)
!1649 = !DILocation(line: 169, column: 16, scope: !1593)
!1650 = !DILocation(line: 169, column: 23, scope: !1593)
!1651 = !DILocation(line: 169, column: 22, scope: !1593)
!1652 = !DILocalVariable(name: "Cap", scope: !1593, file: !2, line: 171, type: !104)
!1653 = !DILocation(line: 171, column: 11, scope: !1593)
!1654 = !DILocation(line: 171, column: 46, scope: !1593)
!1655 = !DILocation(line: 171, column: 44, scope: !1593)
!1656 = !DILocation(line: 171, column: 55, scope: !1593)
!1657 = !DILocation(line: 171, column: 53, scope: !1593)
!1658 = !DILocation(line: 171, column: 60, scope: !1593)
!1659 = !DILocation(line: 171, column: 58, scope: !1593)
!1660 = !DILocation(line: 171, column: 17, scope: !1593)
!1661 = !DILocalVariable(name: "Rx", scope: !1593, file: !2, line: 172, type: !104)
!1662 = !DILocation(line: 172, column: 11, scope: !1593)
!1663 = !DILocation(line: 172, column: 16, scope: !1593)
!1664 = !DILocation(line: 172, column: 35, scope: !1593)
!1665 = !DILocation(line: 172, column: 33, scope: !1593)
!1666 = !DILocation(line: 172, column: 44, scope: !1593)
!1667 = !DILocation(line: 172, column: 42, scope: !1593)
!1668 = !DILocation(line: 172, column: 19, scope: !1593)
!1669 = !DILocalVariable(name: "Ry", scope: !1593, file: !2, line: 173, type: !104)
!1670 = !DILocation(line: 173, column: 11, scope: !1593)
!1671 = !DILocation(line: 173, column: 16, scope: !1593)
!1672 = !DILocation(line: 173, column: 35, scope: !1593)
!1673 = !DILocation(line: 173, column: 33, scope: !1593)
!1674 = !DILocation(line: 173, column: 44, scope: !1593)
!1675 = !DILocation(line: 173, column: 42, scope: !1593)
!1676 = !DILocation(line: 173, column: 19, scope: !1593)
!1677 = !DILocalVariable(name: "Rz", scope: !1593, file: !2, line: 174, type: !104)
!1678 = !DILocation(line: 174, column: 11, scope: !1593)
!1679 = !DILocation(line: 174, column: 16, scope: !1593)
!1680 = !DILocation(line: 174, column: 29, scope: !1593)
!1681 = !DILocation(line: 174, column: 27, scope: !1593)
!1682 = !DILocation(line: 174, column: 34, scope: !1593)
!1683 = !DILocation(line: 174, column: 32, scope: !1593)
!1684 = !DILocation(line: 174, column: 19, scope: !1593)
!1685 = !DILocalVariable(name: "max_slope", scope: !1593, file: !2, line: 176, type: !104)
!1686 = !DILocation(line: 176, column: 11, scope: !1593)
!1687 = !DILocation(line: 176, column: 47, scope: !1593)
!1688 = !DILocation(line: 176, column: 45, scope: !1593)
!1689 = !DILocation(line: 176, column: 54, scope: !1593)
!1690 = !DILocation(line: 176, column: 30, scope: !1593)
!1691 = !DILocation(line: 176, column: 23, scope: !1593)
!1692 = !DILocalVariable(name: "dt", scope: !1593, file: !2, line: 177, type: !104)
!1693 = !DILocation(line: 177, column: 11, scope: !1593)
!1694 = !DILocation(line: 177, column: 28, scope: !1593)
!1695 = !DILocation(line: 177, column: 26, scope: !1593)
!1696 = !DILocation(line: 177, column: 16, scope: !1593)
!1697 = !DILocalVariable(name: "powerIn", scope: !1593, file: !2, line: 180, type: !105)
!1698 = !DILocation(line: 180, column: 12, scope: !1593)
!1699 = !DILocalVariable(name: "tempOut", scope: !1593, file: !2, line: 180, type: !105)
!1700 = !DILocation(line: 180, column: 22, scope: !1593)
!1701 = !DILocalVariable(name: "tempIn", scope: !1593, file: !2, line: 180, type: !105)
!1702 = !DILocation(line: 180, column: 32, scope: !1593)
!1703 = !DILocalVariable(name: "tempCopy", scope: !1593, file: !2, line: 180, type: !105)
!1704 = !DILocation(line: 180, column: 41, scope: !1593)
!1705 = !DILocalVariable(name: "size", scope: !1593, file: !2, line: 181, type: !178)
!1706 = !DILocation(line: 181, column: 9, scope: !1593)
!1707 = !DILocation(line: 181, column: 16, scope: !1593)
!1708 = !DILocation(line: 181, column: 26, scope: !1593)
!1709 = !DILocation(line: 181, column: 24, scope: !1593)
!1710 = !DILocation(line: 181, column: 36, scope: !1593)
!1711 = !DILocation(line: 181, column: 34, scope: !1593)
!1712 = !DILocation(line: 183, column: 30, scope: !1593)
!1713 = !DILocation(line: 183, column: 23, scope: !1593)
!1714 = !DILocation(line: 183, column: 15, scope: !1593)
!1715 = !DILocation(line: 183, column: 13, scope: !1593)
!1716 = !DILocation(line: 184, column: 31, scope: !1593)
!1717 = !DILocation(line: 184, column: 36, scope: !1593)
!1718 = !DILocation(line: 184, column: 24, scope: !1593)
!1719 = !DILocation(line: 184, column: 16, scope: !1593)
!1720 = !DILocation(line: 184, column: 14, scope: !1593)
!1721 = !DILocation(line: 185, column: 29, scope: !1593)
!1722 = !DILocation(line: 185, column: 22, scope: !1593)
!1723 = !DILocation(line: 185, column: 14, scope: !1593)
!1724 = !DILocation(line: 185, column: 12, scope: !1593)
!1725 = !DILocation(line: 186, column: 30, scope: !1593)
!1726 = !DILocation(line: 186, column: 23, scope: !1593)
!1727 = !DILocation(line: 186, column: 15, scope: !1593)
!1728 = !DILocation(line: 186, column: 13, scope: !1593)
!1729 = !DILocalVariable(name: "answer", scope: !1593, file: !2, line: 187, type: !105)
!1730 = !DILocation(line: 187, column: 12, scope: !1593)
!1731 = !DILocation(line: 187, column: 36, scope: !1593)
!1732 = !DILocation(line: 187, column: 29, scope: !1593)
!1733 = !DILocation(line: 187, column: 21, scope: !1593)
!1734 = !DILocation(line: 189, column: 15, scope: !1593)
!1735 = !DILocation(line: 189, column: 23, scope: !1593)
!1736 = !DILocation(line: 189, column: 32, scope: !1593)
!1737 = !DILocation(line: 189, column: 41, scope: !1593)
!1738 = !DILocation(line: 189, column: 48, scope: !1593)
!1739 = !DILocation(line: 189, column: 5, scope: !1593)
!1740 = !DILocation(line: 190, column: 15, scope: !1593)
!1741 = !DILocation(line: 190, column: 23, scope: !1593)
!1742 = !DILocation(line: 190, column: 32, scope: !1593)
!1743 = !DILocation(line: 190, column: 41, scope: !1593)
!1744 = !DILocation(line: 190, column: 49, scope: !1593)
!1745 = !DILocation(line: 190, column: 5, scope: !1593)
!1746 = !DILocation(line: 192, column: 12, scope: !1593)
!1747 = !DILocation(line: 192, column: 5, scope: !1593)
!1748 = !DILocation(line: 192, column: 21, scope: !1593)
!1749 = !DILocation(line: 192, column: 29, scope: !1593)
!1750 = !DILocation(line: 192, column: 34, scope: !1593)
!1751 = !DILocation(line: 194, column: 18, scope: !1593)
!1752 = !DILocation(line: 194, column: 27, scope: !1593)
!1753 = !DILocation(line: 194, column: 35, scope: !1593)
!1754 = !DILocation(line: 194, column: 44, scope: !1593)
!1755 = !DILocation(line: 194, column: 53, scope: !1593)
!1756 = !DILocation(line: 194, column: 62, scope: !1593)
!1757 = !DILocation(line: 194, column: 70, scope: !1593)
!1758 = !DILocation(line: 194, column: 75, scope: !1593)
!1759 = !DILocation(line: 194, column: 79, scope: !1593)
!1760 = !DILocation(line: 194, column: 83, scope: !1593)
!1761 = !DILocation(line: 194, column: 87, scope: !1593)
!1762 = !DILocation(line: 194, column: 90, scope: !1593)
!1763 = !DILocation(line: 194, column: 5, scope: !1593)
!1764 = !DILocation(line: 196, column: 20, scope: !1593)
!1765 = !DILocation(line: 196, column: 29, scope: !1593)
!1766 = !DILocation(line: 196, column: 39, scope: !1593)
!1767 = !DILocation(line: 196, column: 47, scope: !1593)
!1768 = !DILocation(line: 196, column: 56, scope: !1593)
!1769 = !DILocation(line: 196, column: 65, scope: !1593)
!1770 = !DILocation(line: 196, column: 73, scope: !1593)
!1771 = !DILocation(line: 196, column: 78, scope: !1593)
!1772 = !DILocation(line: 196, column: 82, scope: !1593)
!1773 = !DILocation(line: 196, column: 86, scope: !1593)
!1774 = !DILocation(line: 196, column: 90, scope: !1593)
!1775 = !DILocation(line: 196, column: 93, scope: !1593)
!1776 = !DILocation(line: 196, column: 5, scope: !1593)
!1777 = !DILocalVariable(name: "acc", scope: !1593, file: !2, line: 198, type: !104)
!1778 = !DILocation(line: 198, column: 11, scope: !1593)
!1779 = !DILocation(line: 198, column: 26, scope: !1593)
!1780 = !DILocation(line: 198, column: 34, scope: !1593)
!1781 = !DILocation(line: 198, column: 41, scope: !1593)
!1782 = !DILocation(line: 198, column: 49, scope: !1593)
!1783 = !DILocation(line: 198, column: 48, scope: !1593)
!1784 = !DILocation(line: 198, column: 57, scope: !1593)
!1785 = !DILocation(line: 198, column: 56, scope: !1593)
!1786 = !DILocation(line: 198, column: 17, scope: !1593)
!1787 = !DILocation(line: 199, column: 29, scope: !1593)
!1788 = !DILocation(line: 199, column: 5, scope: !1593)
!1789 = !DILocation(line: 200, column: 17, scope: !1593)
!1790 = !DILocation(line: 200, column: 25, scope: !1593)
!1791 = !DILocation(line: 200, column: 34, scope: !1593)
!1792 = !DILocation(line: 200, column: 43, scope: !1593)
!1793 = !DILocation(line: 200, column: 51, scope: !1593)
!1794 = !DILocation(line: 200, column: 5, scope: !1593)
!1795 = !DILocation(line: 201, column: 10, scope: !1593)
!1796 = !DILocation(line: 201, column: 5, scope: !1593)
!1797 = !DILocation(line: 202, column: 10, scope: !1593)
!1798 = !DILocation(line: 202, column: 5, scope: !1593)
!1799 = !DILocation(line: 202, column: 25, scope: !1593)
!1800 = !DILocation(line: 202, column: 20, scope: !1801)
!1801 = !DILexicalBlockFile(scope: !1593, file: !2, discriminator: 1)
!1802 = !DILocation(line: 203, column: 5, scope: !1593)
