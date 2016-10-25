; ModuleID = 'track_ellipse_kernel.cu'
source_filename = "track_ellipse_kernel.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.MAT = type { i32, i32, i32, i32, i32, double**, double* }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@host_I_array = global float** null, align 8, !dbg !0
@host_IMGVF_array = global float** null, align 8, !dbg !105
@device_I_array = global float** null, align 8, !dbg !106
@device_IMGVF_array = global float** null, align 8, !dbg !107
@host_m_array = global i32* null, align 8, !dbg !108
@host_n_array = global i32* null, align 8, !dbg !109
@device_m_array = global i32* null, align 8, !dbg !110
@device_n_array = global i32* null, align 8, !dbg !111
@host_I_all = global float* null, align 8, !dbg !112
@total_mem_size = global i32 0, align 4, !dbg !113
@.str = private unnamed_addr constant [23 x i8] c"MGVF kernel error: %s\0A\00", align 1

; Function Attrs: uwtable
define void @_Z12IMGVF_kernelPPfS0_PiS1_fffif(float** %IMGVF_array, float** %I_array, i32* %m_array, i32* %n_array, float %vx, float %vy, float %e, i32 %max_iterations, float %cutoff) #0 !dbg !672 {
entry:
  %IMGVF_array.addr = alloca float**, align 8
  %I_array.addr = alloca float**, align 8
  %m_array.addr = alloca i32*, align 8
  %n_array.addr = alloca i32*, align 8
  %vx.addr = alloca float, align 4
  %vy.addr = alloca float, align 4
  %e.addr = alloca float, align 4
  %max_iterations.addr = alloca i32, align 4
  %cutoff.addr = alloca float, align 4
  store float** %IMGVF_array, float*** %IMGVF_array.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %IMGVF_array.addr, metadata !676, metadata !677), !dbg !678
  store float** %I_array, float*** %I_array.addr, align 8
  call void @llvm.dbg.declare(metadata float*** %I_array.addr, metadata !679, metadata !677), !dbg !680
  store i32* %m_array, i32** %m_array.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %m_array.addr, metadata !681, metadata !677), !dbg !682
  store i32* %n_array, i32** %n_array.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %n_array.addr, metadata !683, metadata !677), !dbg !684
  store float %vx, float* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata float* %vx.addr, metadata !685, metadata !677), !dbg !686
  store float %vy, float* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata float* %vy.addr, metadata !687, metadata !677), !dbg !688
  store float %e, float* %e.addr, align 4
  call void @llvm.dbg.declare(metadata float* %e.addr, metadata !689, metadata !677), !dbg !690
  store i32 %max_iterations, i32* %max_iterations.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %max_iterations.addr, metadata !691, metadata !677), !dbg !692
  store float %cutoff, float* %cutoff.addr, align 4
  call void @llvm.dbg.declare(metadata float* %cutoff.addr, metadata !693, metadata !677), !dbg !694
  %0 = bitcast float*** %IMGVF_array.addr to i8*, !dbg !695
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !695
  %2 = icmp eq i32 %1, 0, !dbg !695
  br i1 %2, label %setup.next, label %setup.end, !dbg !695

setup.next:                                       ; preds = %entry
  %3 = bitcast float*** %I_array.addr to i8*, !dbg !696
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !696
  %5 = icmp eq i32 %4, 0, !dbg !696
  br i1 %5, label %setup.next1, label %setup.end, !dbg !696

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32** %m_array.addr to i8*, !dbg !698
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !698
  %8 = icmp eq i32 %7, 0, !dbg !698
  br i1 %8, label %setup.next2, label %setup.end, !dbg !698

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32** %n_array.addr to i8*, !dbg !700
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !700
  %11 = icmp eq i32 %10, 0, !dbg !700
  br i1 %11, label %setup.next3, label %setup.end, !dbg !700

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast float* %vx.addr to i8*, !dbg !702
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 32), !dbg !702
  %14 = icmp eq i32 %13, 0, !dbg !702
  br i1 %14, label %setup.next4, label %setup.end, !dbg !702

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast float* %vy.addr to i8*, !dbg !704
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 4, i64 36), !dbg !704
  %17 = icmp eq i32 %16, 0, !dbg !704
  br i1 %17, label %setup.next5, label %setup.end, !dbg !704

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast float* %e.addr to i8*, !dbg !706
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 4, i64 40), !dbg !706
  %20 = icmp eq i32 %19, 0, !dbg !706
  br i1 %20, label %setup.next6, label %setup.end, !dbg !706

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32* %max_iterations.addr to i8*, !dbg !708
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 4, i64 44), !dbg !708
  %23 = icmp eq i32 %22, 0, !dbg !708
  br i1 %23, label %setup.next7, label %setup.end, !dbg !708

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast float* %cutoff.addr to i8*, !dbg !710
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 4, i64 48), !dbg !710
  %26 = icmp eq i32 %25, 0, !dbg !710
  br i1 %26, label %setup.next8, label %setup.end, !dbg !710

setup.next8:                                      ; preds = %setup.next7
  %27 = call i32 @cudaLaunch(i8* bitcast (void (float**, float**, i32*, i32*, float, float, float, i32, float)* @_Z12IMGVF_kernelPPfS0_PiS1_fffif to i8*)), !dbg !712
  br label %setup.end, !dbg !712

setup.end:                                        ; preds = %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !714
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @IMGVF_cuda(%struct.MAT** %I, %struct.MAT** %IMGVF, double %vx, double %vy, double %e, i32 %max_iterations, double %cutoff, i32 %num_cells) #0 !dbg !715 {
entry:
  %I.addr = alloca %struct.MAT**, align 8
  %IMGVF.addr = alloca %struct.MAT**, align 8
  %vx.addr = alloca double, align 8
  %vy.addr = alloca double, align 8
  %e.addr = alloca double, align 8
  %max_iterations.addr = alloca i32, align 4
  %cutoff.addr = alloca double, align 8
  %num_cells.addr = alloca i32, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp1 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp1.coerce = alloca { i64, i32 }, align 4
  %error = alloca i32, align 4
  store %struct.MAT** %I, %struct.MAT*** %I.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.MAT*** %I.addr, metadata !732, metadata !677), !dbg !733
  store %struct.MAT** %IMGVF, %struct.MAT*** %IMGVF.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.MAT*** %IMGVF.addr, metadata !734, metadata !677), !dbg !735
  store double %vx, double* %vx.addr, align 8
  call void @llvm.dbg.declare(metadata double* %vx.addr, metadata !736, metadata !677), !dbg !737
  store double %vy, double* %vy.addr, align 8
  call void @llvm.dbg.declare(metadata double* %vy.addr, metadata !738, metadata !677), !dbg !739
  store double %e, double* %e.addr, align 8
  call void @llvm.dbg.declare(metadata double* %e.addr, metadata !740, metadata !677), !dbg !741
  store i32 %max_iterations, i32* %max_iterations.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %max_iterations.addr, metadata !742, metadata !677), !dbg !743
  store double %cutoff, double* %cutoff.addr, align 8
  call void @llvm.dbg.declare(metadata double* %cutoff.addr, metadata !744, metadata !677), !dbg !745
  store i32 %num_cells, i32* %num_cells.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num_cells.addr, metadata !746, metadata !677), !dbg !747
  %0 = load %struct.MAT**, %struct.MAT*** %I.addr, align 8, !dbg !748
  %1 = load i32, i32* %num_cells.addr, align 4, !dbg !749
  call void @IMGVF_cuda_init(%struct.MAT** %0, i32 %1), !dbg !750
  %2 = load i32, i32* %num_cells.addr, align 4, !dbg !751
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 %2, i32 1, i32 1), !dbg !751
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp1, i32 320, i32 1, i32 1), !dbg !752
  %3 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !754
  %4 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !754
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 12, i32 4, i1 false), !dbg !754
  %5 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !754
  %6 = load i64, i64* %5, align 4, !dbg !754
  %7 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !754
  %8 = load i32, i32* %7, align 4, !dbg !754
  %9 = bitcast { i64, i32 }* %agg.tmp1.coerce to i8*, !dbg !754
  %10 = bitcast %struct.dim3* %agg.tmp1 to i8*, !dbg !754
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 12, i32 4, i1 false), !dbg !754
  %11 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp1.coerce, i32 0, i32 0, !dbg !754
  %12 = load i64, i64* %11, align 4, !dbg !754
  %13 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp1.coerce, i32 0, i32 1, !dbg !754
  %14 = load i32, i32* %13, align 4, !dbg !754
  %call = call i32 @cudaConfigureCall(i64 %6, i32 %8, i64 %12, i32 %14, i64 0, %struct.CUstream_st* null), !dbg !755
  %tobool = icmp ne i32 %call, 0, !dbg !754
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !757

kcall.configok:                                   ; preds = %entry
  %15 = load float**, float*** @device_IMGVF_array, align 8, !dbg !758
  %16 = load float**, float*** @device_I_array, align 8, !dbg !759
  %17 = load i32*, i32** @device_m_array, align 8, !dbg !760
  %18 = load i32*, i32** @device_n_array, align 8, !dbg !761
  %19 = load double, double* %vx.addr, align 8, !dbg !762
  %conv = fptrunc double %19 to float, !dbg !762
  %20 = load double, double* %vy.addr, align 8, !dbg !763
  %conv2 = fptrunc double %20 to float, !dbg !763
  %21 = load double, double* %e.addr, align 8, !dbg !764
  %conv3 = fptrunc double %21 to float, !dbg !764
  %22 = load i32, i32* %max_iterations.addr, align 4, !dbg !765
  %23 = load double, double* %cutoff.addr, align 8, !dbg !766
  %conv4 = fptrunc double %23 to float, !dbg !766
  call void @_Z12IMGVF_kernelPPfS0_PiS1_fffif(float** %15, float** %16, i32* %17, i32* %18, float %conv, float %conv2, float %conv3, i32 %22, float %conv4), !dbg !767
  br label %kcall.end, !dbg !767

kcall.end:                                        ; preds = %kcall.configok, %entry
  %call5 = call i32 @cudaThreadSynchronize(), !dbg !769
  call void @llvm.dbg.declare(metadata i32* %error, metadata !770, metadata !677), !dbg !772
  %call6 = call i32 @cudaGetLastError(), !dbg !773
  store i32 %call6, i32* %error, align 4, !dbg !772
  %24 = load i32, i32* %error, align 4, !dbg !774
  %cmp = icmp ne i32 %24, 0, !dbg !776
  br i1 %cmp, label %if.then, label %if.end, !dbg !777

if.then:                                          ; preds = %kcall.end
  %25 = load i32, i32* %error, align 4, !dbg !778
  %call7 = call i8* @cudaGetErrorString(i32 %25), !dbg !780
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0), i8* %call7), !dbg !781
  call void @exit(i32 1) #7, !dbg !783
  unreachable, !dbg !783

if.end:                                           ; preds = %kcall.end
  %26 = load %struct.MAT**, %struct.MAT*** %IMGVF.addr, align 8, !dbg !784
  %27 = load i32, i32* %num_cells.addr, align 4, !dbg !785
  call void @IMGVF_cuda_cleanup(%struct.MAT** %26, i32 %27), !dbg !786
  ret void, !dbg !787
}

; Function Attrs: uwtable
define void @IMGVF_cuda_init(%struct.MAT** %IE, i32 %num_cells) #0 !dbg !788 {
entry:
  %IE.addr = alloca %struct.MAT**, align 8
  %num_cells.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %cell_num = alloca i32, align 4
  %total_size = alloca i32, align 4
  %I = alloca %struct.MAT*, align 8
  %size = alloca i32, align 4
  %device_I_all = alloca float*, align 8
  %device_IMGVF_all = alloca float*, align 8
  %offset = alloca i32, align 4
  %I35 = alloca %struct.MAT*, align 8
  %m38 = alloca i32, align 4
  %n40 = alloca i32, align 4
  %size42 = alloca i32, align 4
  %device_I = alloca float*, align 8
  %device_IMGVF = alloca float*, align 8
  store %struct.MAT** %IE, %struct.MAT*** %IE.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.MAT*** %IE.addr, metadata !791, metadata !677), !dbg !792
  store i32 %num_cells, i32* %num_cells.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num_cells.addr, metadata !793, metadata !677), !dbg !794
  %0 = load i32, i32* %num_cells.addr, align 4, !dbg !795
  %conv = sext i32 %0 to i64, !dbg !795
  %mul = mul i64 8, %conv, !dbg !796
  %call = call noalias i8* @malloc(i64 %mul) #8, !dbg !797
  %1 = bitcast i8* %call to float**, !dbg !798
  store float** %1, float*** @host_I_array, align 8, !dbg !799
  %2 = load i32, i32* %num_cells.addr, align 4, !dbg !800
  %conv1 = sext i32 %2 to i64, !dbg !800
  %mul2 = mul i64 8, %conv1, !dbg !801
  %call3 = call noalias i8* @malloc(i64 %mul2) #8, !dbg !802
  %3 = bitcast i8* %call3 to float**, !dbg !803
  store float** %3, float*** @host_IMGVF_array, align 8, !dbg !804
  %4 = load i32, i32* %num_cells.addr, align 4, !dbg !805
  %conv4 = sext i32 %4 to i64, !dbg !805
  %mul5 = mul i64 %conv4, 8, !dbg !806
  %call6 = call i32 @cudaMalloc(i8** bitcast (float*** @device_I_array to i8**), i64 %mul5), !dbg !807
  %5 = load i32, i32* %num_cells.addr, align 4, !dbg !808
  %conv7 = sext i32 %5 to i64, !dbg !808
  %mul8 = mul i64 %conv7, 8, !dbg !809
  %call9 = call i32 @cudaMalloc(i8** bitcast (float*** @device_IMGVF_array to i8**), i64 %mul8), !dbg !810
  %6 = load i32, i32* %num_cells.addr, align 4, !dbg !811
  %conv10 = sext i32 %6 to i64, !dbg !811
  %mul11 = mul i64 4, %conv10, !dbg !812
  %call12 = call noalias i8* @malloc(i64 %mul11) #8, !dbg !813
  %7 = bitcast i8* %call12 to i32*, !dbg !814
  store i32* %7, i32** @host_m_array, align 8, !dbg !815
  %8 = load i32, i32* %num_cells.addr, align 4, !dbg !816
  %conv13 = sext i32 %8 to i64, !dbg !816
  %mul14 = mul i64 4, %conv13, !dbg !817
  %call15 = call noalias i8* @malloc(i64 %mul14) #8, !dbg !818
  %9 = bitcast i8* %call15 to i32*, !dbg !819
  store i32* %9, i32** @host_n_array, align 8, !dbg !820
  %10 = load i32, i32* %num_cells.addr, align 4, !dbg !821
  %conv16 = sext i32 %10 to i64, !dbg !821
  %mul17 = mul i64 %conv16, 4, !dbg !822
  %call18 = call i32 @cudaMalloc(i8** bitcast (i32** @device_m_array to i8**), i64 %mul17), !dbg !823
  %11 = load i32, i32* %num_cells.addr, align 4, !dbg !824
  %conv19 = sext i32 %11 to i64, !dbg !824
  %mul20 = mul i64 %conv19, 4, !dbg !825
  %call21 = call i32 @cudaMalloc(i8** bitcast (i32** @device_n_array to i8**), i64 %mul20), !dbg !826
  call void @llvm.dbg.declare(metadata i32* %i, metadata !827, metadata !677), !dbg !828
  call void @llvm.dbg.declare(metadata i32* %j, metadata !829, metadata !677), !dbg !830
  call void @llvm.dbg.declare(metadata i32* %cell_num, metadata !831, metadata !677), !dbg !832
  call void @llvm.dbg.declare(metadata i32* %total_size, metadata !833, metadata !677), !dbg !834
  store i32 0, i32* %total_size, align 4, !dbg !834
  store i32 0, i32* %cell_num, align 4, !dbg !835
  br label %for.cond, !dbg !837

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i32, i32* %cell_num, align 4, !dbg !838
  %13 = load i32, i32* %num_cells.addr, align 4, !dbg !841
  %cmp = icmp slt i32 %12, %13, !dbg !842
  br i1 %cmp, label %for.body, label %for.end, !dbg !843

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.MAT** %I, metadata !844, metadata !677), !dbg !846
  %14 = load %struct.MAT**, %struct.MAT*** %IE.addr, align 8, !dbg !847
  %15 = load i32, i32* %cell_num, align 4, !dbg !848
  %idxprom = sext i32 %15 to i64, !dbg !847
  %arrayidx = getelementptr inbounds %struct.MAT*, %struct.MAT** %14, i64 %idxprom, !dbg !847
  %16 = load %struct.MAT*, %struct.MAT** %arrayidx, align 8, !dbg !847
  store %struct.MAT* %16, %struct.MAT** %I, align 8, !dbg !846
  call void @llvm.dbg.declare(metadata i32* %size, metadata !849, metadata !677), !dbg !850
  %17 = load %struct.MAT*, %struct.MAT** %I, align 8, !dbg !851
  %m = getelementptr inbounds %struct.MAT, %struct.MAT* %17, i32 0, i32 0, !dbg !852
  %18 = load i32, i32* %m, align 8, !dbg !852
  %19 = load %struct.MAT*, %struct.MAT** %I, align 8, !dbg !853
  %n = getelementptr inbounds %struct.MAT, %struct.MAT* %19, i32 0, i32 1, !dbg !854
  %20 = load i32, i32* %n, align 4, !dbg !854
  %mul22 = mul i32 %18, %20, !dbg !855
  store i32 %mul22, i32* %size, align 4, !dbg !850
  %21 = load i32, i32* %size, align 4, !dbg !856
  %22 = load i32, i32* %total_size, align 4, !dbg !857
  %add = add nsw i32 %22, %21, !dbg !857
  store i32 %add, i32* %total_size, align 4, !dbg !857
  br label %for.inc, !dbg !858

for.inc:                                          ; preds = %for.body
  %23 = load i32, i32* %cell_num, align 4, !dbg !859
  %inc = add nsw i32 %23, 1, !dbg !859
  store i32 %inc, i32* %cell_num, align 4, !dbg !859
  br label %for.cond, !dbg !861, !llvm.loop !862

for.end:                                          ; preds = %for.cond
  %24 = load i32, i32* %total_size, align 4, !dbg !864
  %conv23 = sext i32 %24 to i64, !dbg !864
  %mul24 = mul i64 %conv23, 4, !dbg !865
  %conv25 = trunc i64 %mul24 to i32, !dbg !864
  store i32 %conv25, i32* @total_mem_size, align 4, !dbg !866
  %25 = load i32, i32* @total_mem_size, align 4, !dbg !867
  %conv26 = sext i32 %25 to i64, !dbg !867
  %call27 = call noalias i8* @malloc(i64 %conv26) #8, !dbg !868
  %26 = bitcast i8* %call27 to float*, !dbg !869
  store float* %26, float** @host_I_all, align 8, !dbg !870
  call void @llvm.dbg.declare(metadata float** %device_I_all, metadata !871, metadata !677), !dbg !872
  call void @llvm.dbg.declare(metadata float** %device_IMGVF_all, metadata !873, metadata !677), !dbg !874
  %27 = bitcast float** %device_I_all to i8**, !dbg !875
  %28 = load i32, i32* @total_mem_size, align 4, !dbg !876
  %conv28 = sext i32 %28 to i64, !dbg !876
  %call29 = call i32 @cudaMalloc(i8** %27, i64 %conv28), !dbg !877
  %29 = bitcast float** %device_IMGVF_all to i8**, !dbg !878
  %30 = load i32, i32* @total_mem_size, align 4, !dbg !879
  %conv30 = sext i32 %30 to i64, !dbg !879
  %call31 = call i32 @cudaMalloc(i8** %29, i64 %conv30), !dbg !880
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !881, metadata !677), !dbg !882
  store i32 0, i32* %offset, align 4, !dbg !882
  store i32 0, i32* %cell_num, align 4, !dbg !883
  br label %for.cond32, !dbg !885

for.cond32:                                       ; preds = %for.inc79, %for.end
  %31 = load i32, i32* %cell_num, align 4, !dbg !886
  %32 = load i32, i32* %num_cells.addr, align 4, !dbg !889
  %cmp33 = icmp slt i32 %31, %32, !dbg !890
  br i1 %cmp33, label %for.body34, label %for.end81, !dbg !891

for.body34:                                       ; preds = %for.cond32
  call void @llvm.dbg.declare(metadata %struct.MAT** %I35, metadata !892, metadata !677), !dbg !894
  %33 = load %struct.MAT**, %struct.MAT*** %IE.addr, align 8, !dbg !895
  %34 = load i32, i32* %cell_num, align 4, !dbg !896
  %idxprom36 = sext i32 %34 to i64, !dbg !895
  %arrayidx37 = getelementptr inbounds %struct.MAT*, %struct.MAT** %33, i64 %idxprom36, !dbg !895
  %35 = load %struct.MAT*, %struct.MAT** %arrayidx37, align 8, !dbg !895
  store %struct.MAT* %35, %struct.MAT** %I35, align 8, !dbg !894
  call void @llvm.dbg.declare(metadata i32* %m38, metadata !897, metadata !677), !dbg !898
  %36 = load %struct.MAT*, %struct.MAT** %I35, align 8, !dbg !899
  %m39 = getelementptr inbounds %struct.MAT, %struct.MAT* %36, i32 0, i32 0, !dbg !900
  %37 = load i32, i32* %m39, align 8, !dbg !900
  store i32 %37, i32* %m38, align 4, !dbg !898
  call void @llvm.dbg.declare(metadata i32* %n40, metadata !901, metadata !677), !dbg !902
  %38 = load %struct.MAT*, %struct.MAT** %I35, align 8, !dbg !903
  %n41 = getelementptr inbounds %struct.MAT, %struct.MAT* %38, i32 0, i32 1, !dbg !904
  %39 = load i32, i32* %n41, align 4, !dbg !904
  store i32 %39, i32* %n40, align 4, !dbg !902
  call void @llvm.dbg.declare(metadata i32* %size42, metadata !905, metadata !677), !dbg !906
  %40 = load i32, i32* %m38, align 4, !dbg !907
  %41 = load i32, i32* %n40, align 4, !dbg !908
  %mul43 = mul nsw i32 %40, %41, !dbg !909
  store i32 %mul43, i32* %size42, align 4, !dbg !906
  %42 = load i32, i32* %m38, align 4, !dbg !910
  %43 = load i32*, i32** @host_m_array, align 8, !dbg !911
  %44 = load i32, i32* %cell_num, align 4, !dbg !912
  %idxprom44 = sext i32 %44 to i64, !dbg !911
  %arrayidx45 = getelementptr inbounds i32, i32* %43, i64 %idxprom44, !dbg !911
  store i32 %42, i32* %arrayidx45, align 4, !dbg !913
  %45 = load i32, i32* %n40, align 4, !dbg !914
  %46 = load i32*, i32** @host_n_array, align 8, !dbg !915
  %47 = load i32, i32* %cell_num, align 4, !dbg !916
  %idxprom46 = sext i32 %47 to i64, !dbg !915
  %arrayidx47 = getelementptr inbounds i32, i32* %46, i64 %idxprom46, !dbg !915
  store i32 %45, i32* %arrayidx47, align 4, !dbg !917
  call void @llvm.dbg.declare(metadata float** %device_I, metadata !918, metadata !677), !dbg !919
  %48 = load float*, float** %device_I_all, align 8, !dbg !920
  %49 = load i32, i32* %offset, align 4, !dbg !921
  %idxprom48 = sext i32 %49 to i64, !dbg !920
  %arrayidx49 = getelementptr inbounds float, float* %48, i64 %idxprom48, !dbg !920
  store float* %arrayidx49, float** %device_I, align 8, !dbg !919
  call void @llvm.dbg.declare(metadata float** %device_IMGVF, metadata !922, metadata !677), !dbg !923
  %50 = load float*, float** %device_IMGVF_all, align 8, !dbg !924
  %51 = load i32, i32* %offset, align 4, !dbg !925
  %idxprom50 = sext i32 %51 to i64, !dbg !924
  %arrayidx51 = getelementptr inbounds float, float* %50, i64 %idxprom50, !dbg !924
  store float* %arrayidx51, float** %device_IMGVF, align 8, !dbg !923
  %52 = load float*, float** %device_I, align 8, !dbg !926
  %53 = load float**, float*** @host_I_array, align 8, !dbg !927
  %54 = load i32, i32* %cell_num, align 4, !dbg !928
  %idxprom52 = sext i32 %54 to i64, !dbg !927
  %arrayidx53 = getelementptr inbounds float*, float** %53, i64 %idxprom52, !dbg !927
  store float* %52, float** %arrayidx53, align 8, !dbg !929
  %55 = load float*, float** %device_IMGVF, align 8, !dbg !930
  %56 = load float**, float*** @host_IMGVF_array, align 8, !dbg !931
  %57 = load i32, i32* %cell_num, align 4, !dbg !932
  %idxprom54 = sext i32 %57 to i64, !dbg !931
  %arrayidx55 = getelementptr inbounds float*, float** %56, i64 %idxprom54, !dbg !931
  store float* %55, float** %arrayidx55, align 8, !dbg !933
  store i32 0, i32* %i, align 4, !dbg !934
  br label %for.cond56, !dbg !936

for.cond56:                                       ; preds = %for.inc75, %for.body34
  %58 = load i32, i32* %i, align 4, !dbg !937
  %59 = load i32, i32* %m38, align 4, !dbg !940
  %cmp57 = icmp slt i32 %58, %59, !dbg !941
  br i1 %cmp57, label %for.body58, label %for.end77, !dbg !942

for.body58:                                       ; preds = %for.cond56
  store i32 0, i32* %j, align 4, !dbg !943
  br label %for.cond59, !dbg !945

for.cond59:                                       ; preds = %for.inc72, %for.body58
  %60 = load i32, i32* %j, align 4, !dbg !946
  %61 = load i32, i32* %n40, align 4, !dbg !949
  %cmp60 = icmp slt i32 %60, %61, !dbg !950
  br i1 %cmp60, label %for.body61, label %for.end74, !dbg !951

for.body61:                                       ; preds = %for.cond59
  %62 = load %struct.MAT*, %struct.MAT** %I35, align 8, !dbg !952
  %me = getelementptr inbounds %struct.MAT, %struct.MAT* %62, i32 0, i32 5, !dbg !952
  %63 = load double**, double*** %me, align 8, !dbg !952
  %64 = load i32, i32* %i, align 4, !dbg !952
  %idxprom62 = sext i32 %64 to i64, !dbg !952
  %arrayidx63 = getelementptr inbounds double*, double** %63, i64 %idxprom62, !dbg !952
  %65 = load double*, double** %arrayidx63, align 8, !dbg !952
  %66 = load i32, i32* %j, align 4, !dbg !952
  %idxprom64 = sext i32 %66 to i64, !dbg !952
  %arrayidx65 = getelementptr inbounds double, double* %65, i64 %idxprom64, !dbg !952
  %67 = load double, double* %arrayidx65, align 8, !dbg !952
  %conv66 = fptrunc double %67 to float, !dbg !952
  %68 = load float*, float** @host_I_all, align 8, !dbg !953
  %69 = load i32, i32* %offset, align 4, !dbg !954
  %70 = load i32, i32* %i, align 4, !dbg !955
  %71 = load i32, i32* %n40, align 4, !dbg !956
  %mul67 = mul nsw i32 %70, %71, !dbg !957
  %add68 = add nsw i32 %69, %mul67, !dbg !958
  %72 = load i32, i32* %j, align 4, !dbg !959
  %add69 = add nsw i32 %add68, %72, !dbg !960
  %idxprom70 = sext i32 %add69 to i64, !dbg !953
  %arrayidx71 = getelementptr inbounds float, float* %68, i64 %idxprom70, !dbg !953
  store float %conv66, float* %arrayidx71, align 4, !dbg !961
  br label %for.inc72, !dbg !953

for.inc72:                                        ; preds = %for.body61
  %73 = load i32, i32* %j, align 4, !dbg !962
  %inc73 = add nsw i32 %73, 1, !dbg !962
  store i32 %inc73, i32* %j, align 4, !dbg !962
  br label %for.cond59, !dbg !964, !llvm.loop !965

for.end74:                                        ; preds = %for.cond59
  br label %for.inc75, !dbg !967

for.inc75:                                        ; preds = %for.end74
  %74 = load i32, i32* %i, align 4, !dbg !969
  %inc76 = add nsw i32 %74, 1, !dbg !969
  store i32 %inc76, i32* %i, align 4, !dbg !969
  br label %for.cond56, !dbg !971, !llvm.loop !972

for.end77:                                        ; preds = %for.cond56
  %75 = load i32, i32* %size42, align 4, !dbg !974
  %76 = load i32, i32* %offset, align 4, !dbg !975
  %add78 = add nsw i32 %76, %75, !dbg !975
  store i32 %add78, i32* %offset, align 4, !dbg !975
  br label %for.inc79, !dbg !976

for.inc79:                                        ; preds = %for.end77
  %77 = load i32, i32* %cell_num, align 4, !dbg !977
  %inc80 = add nsw i32 %77, 1, !dbg !977
  store i32 %inc80, i32* %cell_num, align 4, !dbg !977
  br label %for.cond32, !dbg !979, !llvm.loop !980

for.end81:                                        ; preds = %for.cond32
  %78 = load float*, float** %device_I_all, align 8, !dbg !982
  %79 = bitcast float* %78 to i8*, !dbg !982
  %80 = load float*, float** @host_I_all, align 8, !dbg !983
  %81 = bitcast float* %80 to i8*, !dbg !983
  %82 = load i32, i32* @total_mem_size, align 4, !dbg !984
  %conv82 = sext i32 %82 to i64, !dbg !984
  %call83 = call i32 @cudaMemcpy(i8* %79, i8* %81, i64 %conv82, i32 1), !dbg !985
  %83 = load float*, float** %device_IMGVF_all, align 8, !dbg !986
  %84 = bitcast float* %83 to i8*, !dbg !986
  %85 = load float*, float** @host_I_all, align 8, !dbg !987
  %86 = bitcast float* %85 to i8*, !dbg !987
  %87 = load i32, i32* @total_mem_size, align 4, !dbg !988
  %conv84 = sext i32 %87 to i64, !dbg !988
  %call85 = call i32 @cudaMemcpy(i8* %84, i8* %86, i64 %conv84, i32 1), !dbg !989
  %88 = load float**, float*** @device_I_array, align 8, !dbg !990
  %89 = bitcast float** %88 to i8*, !dbg !990
  %90 = load float**, float*** @host_I_array, align 8, !dbg !991
  %91 = bitcast float** %90 to i8*, !dbg !991
  %92 = load i32, i32* %num_cells.addr, align 4, !dbg !992
  %conv86 = sext i32 %92 to i64, !dbg !992
  %mul87 = mul i64 %conv86, 8, !dbg !993
  %call88 = call i32 @cudaMemcpy(i8* %89, i8* %91, i64 %mul87, i32 1), !dbg !994
  %93 = load float**, float*** @device_IMGVF_array, align 8, !dbg !995
  %94 = bitcast float** %93 to i8*, !dbg !995
  %95 = load float**, float*** @host_IMGVF_array, align 8, !dbg !996
  %96 = bitcast float** %95 to i8*, !dbg !996
  %97 = load i32, i32* %num_cells.addr, align 4, !dbg !997
  %conv89 = sext i32 %97 to i64, !dbg !997
  %mul90 = mul i64 %conv89, 8, !dbg !998
  %call91 = call i32 @cudaMemcpy(i8* %94, i8* %96, i64 %mul90, i32 1), !dbg !999
  %98 = load i32*, i32** @device_m_array, align 8, !dbg !1000
  %99 = bitcast i32* %98 to i8*, !dbg !1000
  %100 = load i32*, i32** @host_m_array, align 8, !dbg !1001
  %101 = bitcast i32* %100 to i8*, !dbg !1001
  %102 = load i32, i32* %num_cells.addr, align 4, !dbg !1002
  %conv92 = sext i32 %102 to i64, !dbg !1002
  %mul93 = mul i64 %conv92, 4, !dbg !1003
  %call94 = call i32 @cudaMemcpy(i8* %99, i8* %101, i64 %mul93, i32 1), !dbg !1004
  %103 = load i32*, i32** @device_n_array, align 8, !dbg !1005
  %104 = bitcast i32* %103 to i8*, !dbg !1005
  %105 = load i32*, i32** @host_n_array, align 8, !dbg !1006
  %106 = bitcast i32* %105 to i8*, !dbg !1006
  %107 = load i32, i32* %num_cells.addr, align 4, !dbg !1007
  %conv95 = sext i32 %107 to i64, !dbg !1007
  %mul96 = mul i64 %conv95, 4, !dbg !1008
  %call97 = call i32 @cudaMemcpy(i8* %104, i8* %106, i64 %mul96, i32 1), !dbg !1009
  ret void, !dbg !1010
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #2

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #3 comdat align 2 !dbg !1011 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1034, metadata !677), !dbg !1036
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1037, metadata !677), !dbg !1038
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1039, metadata !677), !dbg !1040
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1041, metadata !677), !dbg !1042
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1043
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1044
  store i32 %0, i32* %x, align 4, !dbg !1043
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1045
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1046
  store i32 %1, i32* %y, align 4, !dbg !1045
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1047
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1048
  store i32 %2, i32* %z, align 4, !dbg !1047
  ret void, !dbg !1049
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

declare i32 @cudaThreadSynchronize() #2

declare i32 @cudaGetLastError() #2

declare i32 @printf(i8*, ...) #2

declare i8* @cudaGetErrorString(i32) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: uwtable
define void @IMGVF_cuda_cleanup(%struct.MAT** %IMGVF_out_array, i32 %num_cells) #0 !dbg !1050 {
entry:
  %IMGVF_out_array.addr = alloca %struct.MAT**, align 8
  %num_cells.addr = alloca i32, align 4
  %cell_num = alloca i32, align 4
  %offset = alloca i32, align 4
  %IMGVF_out = alloca %struct.MAT*, align 8
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store %struct.MAT** %IMGVF_out_array, %struct.MAT*** %IMGVF_out_array.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.MAT*** %IMGVF_out_array.addr, metadata !1051, metadata !677), !dbg !1052
  store i32 %num_cells, i32* %num_cells.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num_cells.addr, metadata !1053, metadata !677), !dbg !1054
  %0 = load float*, float** @host_I_all, align 8, !dbg !1055
  %1 = bitcast float* %0 to i8*, !dbg !1055
  %2 = load float**, float*** @host_IMGVF_array, align 8, !dbg !1056
  %arrayidx = getelementptr inbounds float*, float** %2, i64 0, !dbg !1056
  %3 = load float*, float** %arrayidx, align 8, !dbg !1056
  %4 = bitcast float* %3 to i8*, !dbg !1056
  %5 = load i32, i32* @total_mem_size, align 4, !dbg !1057
  %conv = sext i32 %5 to i64, !dbg !1057
  %call = call i32 @cudaMemcpy(i8* %1, i8* %4, i64 %conv, i32 2), !dbg !1058
  call void @llvm.dbg.declare(metadata i32* %cell_num, metadata !1059, metadata !677), !dbg !1060
  call void @llvm.dbg.declare(metadata i32* %offset, metadata !1061, metadata !677), !dbg !1062
  store i32 0, i32* %offset, align 4, !dbg !1062
  store i32 0, i32* %cell_num, align 4, !dbg !1063
  br label %for.cond, !dbg !1065

for.cond:                                         ; preds = %for.inc23, %entry
  %6 = load i32, i32* %cell_num, align 4, !dbg !1066
  %7 = load i32, i32* %num_cells.addr, align 4, !dbg !1069
  %cmp = icmp slt i32 %6, %7, !dbg !1070
  br i1 %cmp, label %for.body, label %for.end25, !dbg !1071

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.MAT** %IMGVF_out, metadata !1072, metadata !677), !dbg !1074
  %8 = load %struct.MAT**, %struct.MAT*** %IMGVF_out_array.addr, align 8, !dbg !1075
  %9 = load i32, i32* %cell_num, align 4, !dbg !1076
  %idxprom = sext i32 %9 to i64, !dbg !1075
  %arrayidx1 = getelementptr inbounds %struct.MAT*, %struct.MAT** %8, i64 %idxprom, !dbg !1075
  %10 = load %struct.MAT*, %struct.MAT** %arrayidx1, align 8, !dbg !1075
  store %struct.MAT* %10, %struct.MAT** %IMGVF_out, align 8, !dbg !1074
  call void @llvm.dbg.declare(metadata i32* %m, metadata !1077, metadata !677), !dbg !1078
  %11 = load %struct.MAT*, %struct.MAT** %IMGVF_out, align 8, !dbg !1079
  %m2 = getelementptr inbounds %struct.MAT, %struct.MAT* %11, i32 0, i32 0, !dbg !1080
  %12 = load i32, i32* %m2, align 8, !dbg !1080
  store i32 %12, i32* %m, align 4, !dbg !1078
  call void @llvm.dbg.declare(metadata i32* %n, metadata !1081, metadata !677), !dbg !1082
  %13 = load %struct.MAT*, %struct.MAT** %IMGVF_out, align 8, !dbg !1083
  %n3 = getelementptr inbounds %struct.MAT, %struct.MAT* %13, i32 0, i32 1, !dbg !1084
  %14 = load i32, i32* %n3, align 4, !dbg !1084
  store i32 %14, i32* %n, align 4, !dbg !1082
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1085, metadata !677), !dbg !1086
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1087, metadata !677), !dbg !1088
  store i32 0, i32* %i, align 4, !dbg !1089
  br label %for.cond4, !dbg !1091

for.cond4:                                        ; preds = %for.inc18, %for.body
  %15 = load i32, i32* %i, align 4, !dbg !1092
  %16 = load i32, i32* %m, align 4, !dbg !1095
  %cmp5 = icmp slt i32 %15, %16, !dbg !1096
  br i1 %cmp5, label %for.body6, label %for.end20, !dbg !1097

for.body6:                                        ; preds = %for.cond4
  store i32 0, i32* %j, align 4, !dbg !1098
  br label %for.cond7, !dbg !1100

for.cond7:                                        ; preds = %for.inc, %for.body6
  %17 = load i32, i32* %j, align 4, !dbg !1101
  %18 = load i32, i32* %n, align 4, !dbg !1104
  %cmp8 = icmp slt i32 %17, %18, !dbg !1105
  br i1 %cmp8, label %for.body9, label %for.end, !dbg !1106

for.body9:                                        ; preds = %for.cond7
  %19 = load float*, float** @host_I_all, align 8, !dbg !1107
  %20 = load i32, i32* %offset, align 4, !dbg !1107
  %21 = load i32, i32* %i, align 4, !dbg !1107
  %22 = load i32, i32* %n, align 4, !dbg !1107
  %mul = mul nsw i32 %21, %22, !dbg !1107
  %add = add nsw i32 %20, %mul, !dbg !1107
  %23 = load i32, i32* %j, align 4, !dbg !1107
  %add10 = add nsw i32 %add, %23, !dbg !1107
  %idxprom11 = sext i32 %add10 to i64, !dbg !1107
  %arrayidx12 = getelementptr inbounds float, float* %19, i64 %idxprom11, !dbg !1107
  %24 = load float, float* %arrayidx12, align 4, !dbg !1107
  %conv13 = fpext float %24 to double, !dbg !1107
  %25 = load %struct.MAT*, %struct.MAT** %IMGVF_out, align 8, !dbg !1107
  %me = getelementptr inbounds %struct.MAT, %struct.MAT* %25, i32 0, i32 5, !dbg !1107
  %26 = load double**, double*** %me, align 8, !dbg !1107
  %27 = load i32, i32* %i, align 4, !dbg !1107
  %idxprom14 = sext i32 %27 to i64, !dbg !1107
  %arrayidx15 = getelementptr inbounds double*, double** %26, i64 %idxprom14, !dbg !1107
  %28 = load double*, double** %arrayidx15, align 8, !dbg !1107
  %29 = load i32, i32* %j, align 4, !dbg !1107
  %idxprom16 = sext i32 %29 to i64, !dbg !1107
  %arrayidx17 = getelementptr inbounds double, double* %28, i64 %idxprom16, !dbg !1107
  store double %conv13, double* %arrayidx17, align 8, !dbg !1107
  br label %for.inc, !dbg !1107

for.inc:                                          ; preds = %for.body9
  %30 = load i32, i32* %j, align 4, !dbg !1108
  %inc = add nsw i32 %30, 1, !dbg !1108
  store i32 %inc, i32* %j, align 4, !dbg !1108
  br label %for.cond7, !dbg !1110, !llvm.loop !1111

for.end:                                          ; preds = %for.cond7
  br label %for.inc18, !dbg !1113

for.inc18:                                        ; preds = %for.end
  %31 = load i32, i32* %i, align 4, !dbg !1115
  %inc19 = add nsw i32 %31, 1, !dbg !1115
  store i32 %inc19, i32* %i, align 4, !dbg !1115
  br label %for.cond4, !dbg !1117, !llvm.loop !1118

for.end20:                                        ; preds = %for.cond4
  %32 = load i32, i32* %m, align 4, !dbg !1120
  %33 = load i32, i32* %n, align 4, !dbg !1121
  %mul21 = mul nsw i32 %32, %33, !dbg !1122
  %34 = load i32, i32* %offset, align 4, !dbg !1123
  %add22 = add nsw i32 %34, %mul21, !dbg !1123
  store i32 %add22, i32* %offset, align 4, !dbg !1123
  br label %for.inc23, !dbg !1124

for.inc23:                                        ; preds = %for.end20
  %35 = load i32, i32* %cell_num, align 4, !dbg !1125
  %inc24 = add nsw i32 %35, 1, !dbg !1125
  store i32 %inc24, i32* %cell_num, align 4, !dbg !1125
  br label %for.cond, !dbg !1127, !llvm.loop !1128

for.end25:                                        ; preds = %for.cond
  %36 = load i32*, i32** @device_m_array, align 8, !dbg !1130
  %37 = bitcast i32* %36 to i8*, !dbg !1130
  %call26 = call i32 @cudaFree(i8* %37), !dbg !1131
  %38 = load i32*, i32** @device_n_array, align 8, !dbg !1132
  %39 = bitcast i32* %38 to i8*, !dbg !1132
  %call27 = call i32 @cudaFree(i8* %39), !dbg !1133
  %40 = load float**, float*** @device_IMGVF_array, align 8, !dbg !1134
  %41 = bitcast float** %40 to i8*, !dbg !1134
  %call28 = call i32 @cudaFree(i8* %41), !dbg !1135
  %42 = load float**, float*** @device_I_array, align 8, !dbg !1136
  %43 = bitcast float** %42 to i8*, !dbg !1136
  %call29 = call i32 @cudaFree(i8* %43), !dbg !1137
  %44 = load float**, float*** @host_IMGVF_array, align 8, !dbg !1138
  %arrayidx30 = getelementptr inbounds float*, float** %44, i64 0, !dbg !1138
  %45 = load float*, float** %arrayidx30, align 8, !dbg !1138
  %46 = bitcast float* %45 to i8*, !dbg !1138
  %call31 = call i32 @cudaFree(i8* %46), !dbg !1139
  %47 = load float**, float*** @host_I_array, align 8, !dbg !1140
  %arrayidx32 = getelementptr inbounds float*, float** %47, i64 0, !dbg !1140
  %48 = load float*, float** %arrayidx32, align 8, !dbg !1140
  %49 = bitcast float* %48 to i8*, !dbg !1140
  %call33 = call i32 @cudaFree(i8* %49), !dbg !1141
  %50 = load i32*, i32** @host_m_array, align 8, !dbg !1142
  %51 = bitcast i32* %50 to i8*, !dbg !1142
  call void @free(i8* %51) #8, !dbg !1143
  %52 = load i32*, i32** @host_n_array, align 8, !dbg !1144
  %53 = bitcast i32* %52 to i8*, !dbg !1144
  call void @free(i8* %53) #8, !dbg !1145
  %54 = load float**, float*** @host_IMGVF_array, align 8, !dbg !1146
  %55 = bitcast float** %54 to i8*, !dbg !1146
  call void @free(i8* %55) #8, !dbg !1147
  %56 = load float**, float*** @host_I_array, align 8, !dbg !1148
  %57 = bitcast float** %56 to i8*, !dbg !1148
  call void @free(i8* %57) #8, !dbg !1149
  %58 = load float*, float** @host_I_all, align 8, !dbg !1150
  %59 = bitcast float* %58 to i8*, !dbg !1150
  call void @free(i8* %59) #8, !dbg !1151
  ret void, !dbg !1152
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #6

declare i32 @cudaMalloc(i8**, i64) #2

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #2

declare i32 @cudaFree(i8*) #2

; Function Attrs: nounwind
declare void @free(i8*) #6

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!669, !670}
!llvm.ident = !{!671}

!0 = distinct !DIGlobalVariable(name: "host_I_array", scope: !1, file: !2, line: 12, type: !97, isLocal: false, isDefinition: true)
!1 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, retainedTypes: !95, globals: !104, imports: !117)
!2 = !DIFile(filename: "track_ellipse_kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!3 = !{!4, !88}
!4 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !5, line: 156, size: 32, align: 32, elements: !6, identifier: "_ZTS9cudaError")
!5 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87}
!7 = !DIEnumerator(name: "cudaSuccess", value: 0)
!8 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 1)
!9 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2)
!10 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3)
!11 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 4)
!12 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 5)
!13 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 6)
!14 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 7)
!15 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 8)
!16 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9)
!17 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 10)
!18 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 11)
!19 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12)
!20 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13)
!21 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 14)
!22 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 15)
!23 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16)
!24 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17)
!25 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18)
!26 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19)
!27 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20)
!28 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21)
!29 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22)
!30 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23)
!31 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24)
!32 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25)
!33 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26)
!34 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27)
!35 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28)
!36 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 29)
!37 = !DIEnumerator(name: "cudaErrorUnknown", value: 30)
!38 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31)
!39 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32)
!40 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 33)
!41 = !DIEnumerator(name: "cudaErrorNotReady", value: 34)
!42 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35)
!43 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 36)
!44 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37)
!45 = !DIEnumerator(name: "cudaErrorNoDevice", value: 38)
!46 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 39)
!47 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 40)
!48 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 41)
!49 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 42)
!50 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43)
!51 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44)
!52 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45)
!53 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46)
!54 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 47)
!55 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 48)
!56 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49)
!57 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 50)
!58 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 51)
!59 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 54)
!60 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 55)
!61 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 56)
!62 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 57)
!63 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 58)
!64 = !DIEnumerator(name: "cudaErrorAssert", value: 59)
!65 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 60)
!66 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 61)
!67 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 62)
!68 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 63)
!69 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 64)
!70 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65)
!71 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66)
!72 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67)
!73 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68)
!74 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69)
!75 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 70)
!76 = !DIEnumerator(name: "cudaErrorNotSupported", value: 71)
!77 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 72)
!78 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 73)
!79 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 74)
!80 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 75)
!81 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 76)
!82 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 77)
!83 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 78)
!84 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 79)
!85 = !DIEnumerator(name: "cudaErrorNvlinkUncorrectable", value: 80)
!86 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127)
!87 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000)
!88 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !5, line: 807, size: 32, align: 32, elements: !89, identifier: "_ZTS14cudaMemcpyKind")
!89 = !{!90, !91, !92, !93, !94}
!90 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!91 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!92 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!93 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!94 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!95 = !{!96, !97, !99, !101, !98, !103}
!96 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64, align: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64, align: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64, align: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64, align: 64)
!102 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!103 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!104 = !{!0, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114}
!105 = distinct !DIGlobalVariable(name: "host_IMGVF_array", scope: !1, file: !2, line: 12, type: !97, isLocal: false, isDefinition: true)
!106 = distinct !DIGlobalVariable(name: "device_I_array", scope: !1, file: !2, line: 13, type: !97, isLocal: false, isDefinition: true)
!107 = distinct !DIGlobalVariable(name: "device_IMGVF_array", scope: !1, file: !2, line: 13, type: !97, isLocal: false, isDefinition: true)
!108 = distinct !DIGlobalVariable(name: "host_m_array", scope: !1, file: !2, line: 15, type: !101, isLocal: false, isDefinition: true)
!109 = distinct !DIGlobalVariable(name: "host_n_array", scope: !1, file: !2, line: 15, type: !101, isLocal: false, isDefinition: true)
!110 = distinct !DIGlobalVariable(name: "device_m_array", scope: !1, file: !2, line: 16, type: !101, isLocal: false, isDefinition: true)
!111 = distinct !DIGlobalVariable(name: "device_n_array", scope: !1, file: !2, line: 16, type: !101, isLocal: false, isDefinition: true)
!112 = distinct !DIGlobalVariable(name: "host_I_all", scope: !1, file: !2, line: 20, type: !98, isLocal: false, isDefinition: true)
!113 = distinct !DIGlobalVariable(name: "total_mem_size", scope: !1, file: !2, line: 21, type: !102, isLocal: false, isDefinition: true)
!114 = distinct !DIGlobalVariable(name: "threads_per_block", scope: !1, file: !2, line: 24, type: !115, isLocal: true, isDefinition: true, expr: !116)
!115 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !102)
!116 = !DIExpression(DW_OP_constu, 320, DW_OP_stack_value)
!117 = !{!118, !125, !129, !131, !133, !135, !137, !141, !143, !145, !147, !149, !151, !153, !155, !157, !159, !161, !163, !165, !167, !169, !173, !175, !177, !179, !183, !187, !189, !191, !196, !200, !202, !204, !206, !208, !210, !212, !214, !216, !221, !225, !227, !229, !233, !235, !237, !239, !241, !243, !247, !249, !251, !255, !262, !266, !268, !270, !274, !276, !278, !282, !284, !286, !290, !292, !294, !296, !298, !300, !302, !304, !306, !308, !313, !315, !317, !321, !323, !325, !327, !329, !331, !333, !335, !339, !343, !345, !347, !352, !354, !356, !358, !360, !362, !364, !368, !374, !378, !382, !387, !389, !393, !397, !410, !414, !418, !422, !426, !431, !433, !437, !441, !445, !453, !457, !461, !465, !469, !474, !480, !484, !488, !490, !498, !502, !510, !512, !514, !518, !522, !526, !531, !535, !540, !541, !542, !543, !546, !547, !548, !549, !550, !551, !552, !555, !557, !559, !561, !563, !565, !567, !569, !572, !574, !576, !578, !580, !582, !584, !586, !588, !590, !592, !594, !596, !598, !600, !602, !604, !606, !608, !610, !612, !614, !616, !618, !620, !622, !624, !626, !628, !630, !632, !634, !636, !640, !641, !643, !645, !647, !649, !651, !653, !655, !657, !659, !661, !663, !665, !667}
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !121, line: 189)
!119 = !DINamespace(name: "std", scope: null, file: !120, line: 188)
!120 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!121 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !120, file: !120, line: 44, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!122 = !DISubroutineType(types: !123)
!123 = !{!124, !124}
!124 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !126, line: 190)
!126 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !120, file: !120, line: 46, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DISubroutineType(types: !128)
!128 = !{!96, !96}
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !130, line: 191)
!130 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !120, file: !120, line: 48, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !132, line: 192)
!132 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !120, file: !120, line: 50, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !134, line: 193)
!134 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !120, file: !120, line: 52, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !136, line: 194)
!136 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !120, file: !120, line: 56, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !138, line: 195)
!138 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !120, file: !120, line: 54, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DISubroutineType(types: !140)
!140 = !{!96, !96, !96}
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !142, line: 196)
!142 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !120, file: !120, line: 58, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !144, line: 197)
!144 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !120, file: !120, line: 60, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !146, line: 198)
!146 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !120, file: !120, line: 62, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !148, line: 199)
!148 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !120, file: !120, line: 64, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !150, line: 200)
!150 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !120, file: !120, line: 66, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !152, line: 201)
!152 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !120, file: !120, line: 68, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !154, line: 202)
!154 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !120, file: !120, line: 72, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !156, line: 203)
!156 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !120, file: !120, line: 70, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !158, line: 204)
!158 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !120, file: !120, line: 76, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !160, line: 205)
!160 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !120, file: !120, line: 74, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !162, line: 206)
!162 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !120, file: !120, line: 78, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !164, line: 207)
!164 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !120, file: !120, line: 80, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !166, line: 208)
!166 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !120, file: !120, line: 82, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !168, line: 209)
!168 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !120, file: !120, line: 84, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !170, line: 210)
!170 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !120, file: !120, line: 86, type: !171, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DISubroutineType(types: !172)
!172 = !{!96, !96, !96, !96}
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !174, line: 211)
!174 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !120, file: !120, line: 88, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !176, line: 212)
!176 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !120, file: !120, line: 90, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !178, line: 213)
!178 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !120, file: !120, line: 92, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !180, line: 214)
!180 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !120, file: !120, line: 94, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{!102, !96}
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !184, line: 215)
!184 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !120, file: !120, line: 96, type: !185, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DISubroutineType(types: !186)
!186 = !{!96, !96, !101}
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !188, line: 216)
!188 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !120, file: !120, line: 98, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !190, line: 217)
!190 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !120, file: !120, line: 100, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !192, line: 218)
!192 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !120, file: !120, line: 102, type: !193, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DISubroutineType(types: !194)
!194 = !{!195, !96}
!195 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !197, line: 219)
!197 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !120, file: !120, line: 106, type: !198, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DISubroutineType(types: !199)
!199 = !{!195, !96, !96}
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !201, line: 220)
!201 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !120, file: !120, line: 105, type: !198, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !203, line: 221)
!203 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !120, file: !120, line: 108, type: !193, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !205, line: 222)
!205 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !120, file: !120, line: 112, type: !198, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !207, line: 223)
!207 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !120, file: !120, line: 111, type: !198, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !209, line: 224)
!209 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !120, file: !120, line: 114, type: !198, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !211, line: 225)
!211 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !120, file: !120, line: 116, type: !193, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !213, line: 226)
!213 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !120, file: !120, line: 118, type: !193, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !215, line: 227)
!215 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !120, file: !120, line: 120, type: !198, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !217, line: 228)
!217 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !120, file: !120, line: 121, type: !218, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!218 = !DISubroutineType(types: !219)
!219 = !{!220, !220}
!220 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !222, line: 229)
!222 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !120, file: !120, line: 123, type: !223, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DISubroutineType(types: !224)
!224 = !{!96, !96, !102}
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !226, line: 230)
!226 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !120, file: !120, line: 125, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !228, line: 231)
!228 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !120, file: !120, line: 126, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !230, line: 232)
!230 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !120, file: !120, line: 128, type: !231, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DISubroutineType(types: !232)
!232 = !{!124, !96}
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !234, line: 233)
!234 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !120, file: !120, line: 138, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !236, line: 234)
!236 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !120, file: !120, line: 130, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !238, line: 235)
!238 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !120, file: !120, line: 132, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !240, line: 236)
!240 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !120, file: !120, line: 134, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !242, line: 237)
!242 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !120, file: !120, line: 136, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !244, line: 238)
!244 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !120, file: !120, line: 140, type: !245, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!245 = !DISubroutineType(types: !246)
!246 = !{!220, !96}
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !248, line: 239)
!248 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !120, file: !120, line: 142, type: !245, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !250, line: 240)
!250 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !120, file: !120, line: 143, type: !231, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !252, line: 241)
!252 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !120, file: !120, line: 145, type: !253, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!253 = !DISubroutineType(types: !254)
!254 = !{!96, !96, !98}
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !256, line: 242)
!256 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !120, file: !120, line: 146, type: !257, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!257 = !DISubroutineType(types: !258)
!258 = !{!103, !259}
!259 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !260, size: 64, align: 64)
!260 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !261)
!261 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !263, line: 243)
!263 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !120, file: !120, line: 147, type: !264, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DISubroutineType(types: !265)
!265 = !{!96, !259}
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !267, line: 244)
!267 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !120, file: !120, line: 149, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !269, line: 245)
!269 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !120, file: !120, line: 151, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !271, line: 246)
!271 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !120, file: !120, line: 153, type: !272, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!272 = !DISubroutineType(types: !273)
!273 = !{!96, !96, !103}
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !275, line: 247)
!275 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !120, file: !120, line: 158, type: !223, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !277, line: 248)
!277 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !120, file: !120, line: 160, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !279, line: 249)
!279 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !120, file: !120, line: 162, type: !280, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!280 = !DISubroutineType(types: !281)
!281 = !{!96, !96, !96, !101}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !283, line: 250)
!283 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !120, file: !120, line: 164, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !285, line: 251)
!285 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !120, file: !120, line: 166, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !287, line: 252)
!287 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !120, file: !120, line: 168, type: !288, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!288 = !DISubroutineType(types: !289)
!289 = !{!96, !96, !220}
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !291, line: 253)
!291 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !120, file: !120, line: 170, type: !223, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !293, line: 254)
!293 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !120, file: !120, line: 172, type: !193, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !295, line: 255)
!295 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !120, file: !120, line: 174, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !297, line: 256)
!297 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !120, file: !120, line: 176, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !299, line: 257)
!299 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !120, file: !120, line: 178, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !301, line: 258)
!301 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !120, file: !120, line: 180, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !303, line: 259)
!303 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !120, file: !120, line: 182, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !305, line: 260)
!305 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !120, file: !120, line: 184, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !307, line: 261)
!307 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !120, file: !120, line: 186, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !309, line: 102)
!309 = !DISubprogram(name: "acos", scope: !310, file: !310, line: 54, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!310 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!311 = !DISubroutineType(types: !312)
!312 = !{!103, !103}
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !314, line: 121)
!314 = !DISubprogram(name: "asin", scope: !310, file: !310, line: 56, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !316, line: 140)
!316 = !DISubprogram(name: "atan", scope: !310, file: !310, line: 58, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !318, line: 159)
!318 = !DISubprogram(name: "atan2", scope: !310, file: !310, line: 60, type: !319, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!319 = !DISubroutineType(types: !320)
!320 = !{!103, !103, !103}
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !322, line: 180)
!322 = !DISubprogram(name: "ceil", scope: !310, file: !310, line: 178, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !324, line: 199)
!324 = !DISubprogram(name: "cos", scope: !310, file: !310, line: 63, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !326, line: 218)
!326 = !DISubprogram(name: "cosh", scope: !310, file: !310, line: 72, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !328, line: 237)
!328 = !DISubprogram(name: "exp", scope: !310, file: !310, line: 100, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !330, line: 256)
!330 = !DISubprogram(name: "fabs", scope: !310, file: !310, line: 181, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !332, line: 275)
!332 = !DISubprogram(name: "floor", scope: !310, file: !310, line: 184, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !334, line: 294)
!334 = !DISubprogram(name: "fmod", scope: !310, file: !310, line: 187, type: !319, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !336, line: 315)
!336 = !DISubprogram(name: "frexp", scope: !310, file: !310, line: 103, type: !337, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!337 = !DISubroutineType(types: !338)
!338 = !{!103, !103, !101}
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !340, line: 334)
!340 = !DISubprogram(name: "ldexp", scope: !310, file: !310, line: 106, type: !341, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DISubroutineType(types: !342)
!342 = !{!103, !103, !102}
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !344, line: 353)
!344 = !DISubprogram(name: "log", scope: !310, file: !310, line: 109, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !346, line: 372)
!346 = !DISubprogram(name: "log10", scope: !310, file: !310, line: 112, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !348, line: 391)
!348 = !DISubprogram(name: "modf", scope: !310, file: !310, line: 115, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!103, !103, !351}
!351 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64, align: 64)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !353, line: 403)
!353 = !DISubprogram(name: "pow", scope: !310, file: !310, line: 153, type: !319, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !355, line: 440)
!355 = !DISubprogram(name: "sin", scope: !310, file: !310, line: 65, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !357, line: 459)
!357 = !DISubprogram(name: "sinh", scope: !310, file: !310, line: 74, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !359, line: 478)
!359 = !DISubprogram(name: "sqrt", scope: !310, file: !310, line: 156, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !361, line: 497)
!361 = !DISubprogram(name: "tan", scope: !310, file: !310, line: 67, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !363, line: 516)
!363 = !DISubprogram(name: "tanh", scope: !310, file: !310, line: 76, type: !311, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !365, line: 118)
!365 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !366, line: 101, baseType: !367)
!366 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!367 = !DICompositeType(tag: DW_TAG_structure_type, file: !366, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !369, line: 119)
!369 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !366, line: 109, baseType: !370)
!370 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !366, line: 105, size: 128, align: 64, elements: !371, identifier: "_ZTS6ldiv_t")
!371 = !{!372, !373}
!372 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !370, file: !366, line: 107, baseType: !220, size: 64, align: 64)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !370, file: !366, line: 108, baseType: !220, size: 64, align: 64, offset: 64)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !375, line: 121)
!375 = !DISubprogram(name: "abort", scope: !366, file: !366, line: 515, type: !376, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!376 = !DISubroutineType(types: !377)
!377 = !{null}
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !379, line: 122)
!379 = !DISubprogram(name: "abs", scope: !366, file: !366, line: 774, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !DISubroutineType(types: !381)
!381 = !{!102, !102}
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !383, line: 123)
!383 = !DISubprogram(name: "atexit", scope: !366, file: !366, line: 519, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{!102, !386}
!386 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !376, size: 64, align: 64)
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !388, line: 129)
!388 = !DISubprogram(name: "atof", scope: !366, file: !366, line: 144, type: !257, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !390, line: 130)
!390 = !DISubprogram(name: "atoi", scope: !366, file: !366, line: 147, type: !391, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!391 = !DISubroutineType(types: !392)
!392 = !{!102, !259}
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !394, line: 131)
!394 = !DISubprogram(name: "atol", scope: !366, file: !366, line: 150, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!395 = !DISubroutineType(types: !396)
!396 = !{!220, !259}
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !398, line: 132)
!398 = !DISubprogram(name: "bsearch", scope: !366, file: !366, line: 754, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!399 = !DISubroutineType(types: !400)
!400 = !{!100, !401, !401, !403, !403, !406}
!401 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !402, size: 64, align: 64)
!402 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!403 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !404, line: 62, baseType: !405)
!404 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!405 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!406 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !366, line: 741, baseType: !407)
!407 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !408, size: 64, align: 64)
!408 = !DISubroutineType(types: !409)
!409 = !{!102, !401, !401}
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !411, line: 133)
!411 = !DISubprogram(name: "calloc", scope: !366, file: !366, line: 468, type: !412, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!412 = !DISubroutineType(types: !413)
!413 = !{!100, !403, !403}
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !415, line: 134)
!415 = !DISubprogram(name: "div", scope: !366, file: !366, line: 788, type: !416, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!416 = !DISubroutineType(types: !417)
!417 = !{!365, !102, !102}
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !419, line: 135)
!419 = !DISubprogram(name: "exit", scope: !366, file: !366, line: 543, type: !420, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!420 = !DISubroutineType(types: !421)
!421 = !{null, !102}
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !423, line: 136)
!423 = !DISubprogram(name: "free", scope: !366, file: !366, line: 483, type: !424, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!424 = !DISubroutineType(types: !425)
!425 = !{null, !100}
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !427, line: 137)
!427 = !DISubprogram(name: "getenv", scope: !366, file: !366, line: 564, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!428 = !DISubroutineType(types: !429)
!429 = !{!430, !259}
!430 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !261, size: 64, align: 64)
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !432, line: 138)
!432 = !DISubprogram(name: "labs", scope: !366, file: !366, line: 775, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !434, line: 139)
!434 = !DISubprogram(name: "ldiv", scope: !366, file: !366, line: 790, type: !435, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!435 = !DISubroutineType(types: !436)
!436 = !{!369, !220, !220}
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !438, line: 140)
!438 = !DISubprogram(name: "malloc", scope: !366, file: !366, line: 466, type: !439, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!439 = !DISubroutineType(types: !440)
!440 = !{!100, !403}
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !442, line: 142)
!442 = !DISubprogram(name: "mblen", scope: !366, file: !366, line: 862, type: !443, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!443 = !DISubroutineType(types: !444)
!444 = !{!102, !259, !403}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !446, line: 143)
!446 = !DISubprogram(name: "mbstowcs", scope: !366, file: !366, line: 873, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DISubroutineType(types: !448)
!448 = !{!403, !449, !452, !403}
!449 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !450)
!450 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !451, size: 64, align: 64)
!451 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!452 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !259)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !454, line: 144)
!454 = !DISubprogram(name: "mbtowc", scope: !366, file: !366, line: 865, type: !455, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!455 = !DISubroutineType(types: !456)
!456 = !{!102, !449, !452, !403}
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !458, line: 146)
!458 = !DISubprogram(name: "qsort", scope: !366, file: !366, line: 764, type: !459, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!459 = !DISubroutineType(types: !460)
!460 = !{null, !100, !403, !403, !406}
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !462, line: 152)
!462 = !DISubprogram(name: "rand", scope: !366, file: !366, line: 374, type: !463, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!463 = !DISubroutineType(types: !464)
!464 = !{!102}
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !466, line: 153)
!466 = !DISubprogram(name: "realloc", scope: !366, file: !366, line: 480, type: !467, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DISubroutineType(types: !468)
!468 = !{!100, !100, !403}
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !470, line: 154)
!470 = !DISubprogram(name: "srand", scope: !366, file: !366, line: 376, type: !471, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DISubroutineType(types: !472)
!472 = !{null, !473}
!473 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !475, line: 155)
!475 = !DISubprogram(name: "strtod", scope: !366, file: !366, line: 164, type: !476, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!476 = !DISubroutineType(types: !477)
!477 = !{!103, !452, !478}
!478 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !479)
!479 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !430, size: 64, align: 64)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !481, line: 156)
!481 = !DISubprogram(name: "strtol", scope: !366, file: !366, line: 183, type: !482, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!482 = !DISubroutineType(types: !483)
!483 = !{!220, !452, !478, !102}
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !485, line: 157)
!485 = !DISubprogram(name: "strtoul", scope: !366, file: !366, line: 187, type: !486, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DISubroutineType(types: !487)
!487 = !{!405, !452, !478, !102}
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !489, line: 158)
!489 = !DISubprogram(name: "system", scope: !366, file: !366, line: 716, type: !391, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !491, line: 160)
!491 = !DISubprogram(name: "wcstombs", scope: !366, file: !366, line: 876, type: !492, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DISubroutineType(types: !493)
!493 = !{!403, !494, !495, !403}
!494 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !430)
!495 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !496)
!496 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !497, size: 64, align: 64)
!497 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !451)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !499, line: 161)
!499 = !DISubprogram(name: "wctomb", scope: !366, file: !366, line: 869, type: !500, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DISubroutineType(types: !501)
!501 = !{!102, !430, !451}
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !503, entity: !505, line: 214)
!503 = !DINamespace(name: "__gnu_cxx", scope: null, file: !504, line: 220)
!504 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!505 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !366, line: 121, baseType: !506)
!506 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !366, line: 117, size: 128, align: 64, elements: !507, identifier: "_ZTS7lldiv_t")
!507 = !{!508, !509}
!508 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !506, file: !366, line: 119, baseType: !124, size: 64, align: 64)
!509 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !506, file: !366, line: 120, baseType: !124, size: 64, align: 64, offset: 64)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !503, entity: !511, line: 220)
!511 = !DISubprogram(name: "_Exit", scope: !366, file: !366, line: 557, type: !420, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !503, entity: !513, line: 224)
!513 = !DISubprogram(name: "llabs", scope: !366, file: !366, line: 779, type: !122, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !503, entity: !515, line: 230)
!515 = !DISubprogram(name: "lldiv", scope: !366, file: !366, line: 796, type: !516, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DISubroutineType(types: !517)
!517 = !{!505, !124, !124}
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !503, entity: !519, line: 241)
!519 = !DISubprogram(name: "atoll", scope: !366, file: !366, line: 157, type: !520, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DISubroutineType(types: !521)
!521 = !{!124, !259}
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !503, entity: !523, line: 242)
!523 = !DISubprogram(name: "strtoll", scope: !366, file: !366, line: 209, type: !524, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!524 = !DISubroutineType(types: !525)
!525 = !{!124, !452, !478, !102}
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !503, entity: !527, line: 243)
!527 = !DISubprogram(name: "strtoull", scope: !366, file: !366, line: 214, type: !528, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!528 = !DISubroutineType(types: !529)
!529 = !{!530, !452, !478, !102}
!530 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !503, entity: !532, line: 245)
!532 = !DISubprogram(name: "strtof", scope: !366, file: !366, line: 172, type: !533, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!533 = !DISubroutineType(types: !534)
!534 = !{!96, !452, !478}
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !503, entity: !536, line: 246)
!536 = !DISubprogram(name: "strtold", scope: !366, file: !366, line: 175, type: !537, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!537 = !DISubroutineType(types: !538)
!538 = !{!539, !452, !478}
!539 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !505, line: 254)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !511, line: 256)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !513, line: 258)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !544, line: 259)
!544 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !503, file: !545, line: 227, type: !516, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!545 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !515, line: 260)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !519, line: 262)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !532, line: 263)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !523, line: 264)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !527, line: 265)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !536, line: 266)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !553, line: 397)
!553 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !554, file: !554, line: 1342, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!554 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !556, line: 398)
!556 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !554, file: !554, line: 1370, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !558, line: 399)
!558 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !554, file: !554, line: 1337, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !560, line: 400)
!560 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !554, file: !554, line: 1375, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !562, line: 401)
!562 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !554, file: !554, line: 1327, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !564, line: 402)
!564 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !554, file: !554, line: 1332, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !566, line: 403)
!566 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !554, file: !554, line: 1380, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !568, line: 404)
!568 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !554, file: !554, line: 1430, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !570, line: 405)
!570 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !571, file: !571, line: 667, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !573, line: 406)
!573 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !554, file: !554, line: 1189, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !575, line: 407)
!575 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !554, file: !554, line: 1243, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !577, line: 408)
!577 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !554, file: !554, line: 1312, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !579, line: 409)
!579 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !554, file: !554, line: 1490, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !581, line: 410)
!581 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !554, file: !554, line: 1480, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !583, line: 411)
!583 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !571, file: !571, line: 657, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !585, line: 412)
!585 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !554, file: !554, line: 1294, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !587, line: 413)
!587 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !554, file: !554, line: 1385, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !589, line: 414)
!589 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !571, file: !571, line: 607, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !591, line: 415)
!591 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !554, file: !554, line: 1616, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !593, line: 416)
!593 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !571, file: !571, line: 597, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !595, line: 417)
!595 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !554, file: !554, line: 1568, type: !171, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !597, line: 418)
!597 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !571, file: !571, line: 622, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !599, line: 419)
!599 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !571, file: !571, line: 617, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !601, line: 420)
!601 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !554, file: !554, line: 1553, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !603, line: 421)
!603 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !554, file: !554, line: 1543, type: !185, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !605, line: 422)
!605 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !554, file: !554, line: 1390, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !607, line: 423)
!607 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !554, file: !554, line: 1621, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !609, line: 424)
!609 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !554, file: !554, line: 1520, type: !223, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !611, line: 425)
!611 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !554, file: !554, line: 1515, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !613, line: 426)
!613 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !554, file: !554, line: 1149, type: !231, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !615, line: 427)
!615 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !554, file: !554, line: 1602, type: !231, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !617, line: 428)
!617 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !554, file: !554, line: 1356, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !619, line: 429)
!619 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !554, file: !554, line: 1365, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !621, line: 430)
!621 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !554, file: !554, line: 1285, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !623, line: 431)
!623 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !554, file: !554, line: 1626, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !625, line: 432)
!625 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !554, file: !554, line: 1347, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !627, line: 433)
!627 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !554, file: !554, line: 1140, type: !245, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !629, line: 434)
!629 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !554, file: !554, line: 1607, type: !245, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !631, line: 435)
!631 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !554, file: !554, line: 1548, type: !253, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !633, line: 436)
!633 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !554, file: !554, line: 1154, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !635, line: 437)
!635 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !554, file: !554, line: 1218, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !637, line: 438)
!637 = !DISubprogram(name: "nexttowardf", scope: !310, file: !310, line: 294, type: !638, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!638 = !DISubroutineType(types: !639)
!639 = !{!96, !96, !539}
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !637, line: 439)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !642, line: 440)
!642 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !554, file: !554, line: 1583, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !644, line: 441)
!644 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !554, file: !554, line: 1558, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !646, line: 442)
!646 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !554, file: !554, line: 1563, type: !280, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !648, line: 443)
!648 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !554, file: !554, line: 1135, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !650, line: 444)
!650 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !554, file: !554, line: 1597, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !652, line: 445)
!652 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !554, file: !554, line: 1530, type: !288, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !654, line: 446)
!654 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !554, file: !554, line: 1525, type: !223, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !656, line: 447)
!656 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !554, file: !554, line: 1234, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !658, line: 448)
!658 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !554, file: !554, line: 1317, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !660, line: 449)
!660 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !571, file: !571, line: 907, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !662, line: 450)
!662 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !554, file: !554, line: 1276, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !664, line: 451)
!664 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !554, file: !554, line: 1322, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !666, line: 452)
!666 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !554, file: !554, line: 1592, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !119, entity: !668, line: 453)
!668 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !571, file: !571, line: 662, type: !127, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!669 = !{i32 2, !"Dwarf Version", i32 4}
!670 = !{i32 2, !"Debug Info Version", i32 3}
!671 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!672 = distinct !DISubprogram(name: "IMGVF_kernel", linkageName: "_Z12IMGVF_kernelPPfS0_PiS1_fffif", scope: !2, file: !2, line: 43, type: !673, isLocal: false, isDefinition: true, scopeLine: 44, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !675)
!673 = !DISubroutineType(types: !674)
!674 = !{null, !97, !97, !101, !101, !96, !96, !96, !102, !96}
!675 = !{}
!676 = !DILocalVariable(name: "IMGVF_array", arg: 1, scope: !672, file: !2, line: 43, type: !97)
!677 = !DIExpression()
!678 = !DILocation(line: 43, column: 38, scope: !672)
!679 = !DILocalVariable(name: "I_array", arg: 2, scope: !672, file: !2, line: 43, type: !97)
!680 = !DILocation(line: 43, column: 59, scope: !672)
!681 = !DILocalVariable(name: "m_array", arg: 3, scope: !672, file: !2, line: 43, type: !101)
!682 = !DILocation(line: 43, column: 73, scope: !672)
!683 = !DILocalVariable(name: "n_array", arg: 4, scope: !672, file: !2, line: 43, type: !101)
!684 = !DILocation(line: 43, column: 87, scope: !672)
!685 = !DILocalVariable(name: "vx", arg: 5, scope: !672, file: !2, line: 44, type: !96)
!686 = !DILocation(line: 44, column: 15, scope: !672)
!687 = !DILocalVariable(name: "vy", arg: 6, scope: !672, file: !2, line: 44, type: !96)
!688 = !DILocation(line: 44, column: 25, scope: !672)
!689 = !DILocalVariable(name: "e", arg: 7, scope: !672, file: !2, line: 44, type: !96)
!690 = !DILocation(line: 44, column: 35, scope: !672)
!691 = !DILocalVariable(name: "max_iterations", arg: 8, scope: !672, file: !2, line: 44, type: !102)
!692 = !DILocation(line: 44, column: 42, scope: !672)
!693 = !DILocalVariable(name: "cutoff", arg: 9, scope: !672, file: !2, line: 44, type: !96)
!694 = !DILocation(line: 44, column: 64, scope: !672)
!695 = !DILocation(line: 44, column: 72, scope: !672)
!696 = !DILocation(line: 44, column: 72, scope: !697)
!697 = !DILexicalBlockFile(scope: !672, file: !2, discriminator: 1)
!698 = !DILocation(line: 44, column: 72, scope: !699)
!699 = !DILexicalBlockFile(scope: !672, file: !2, discriminator: 2)
!700 = !DILocation(line: 44, column: 72, scope: !701)
!701 = !DILexicalBlockFile(scope: !672, file: !2, discriminator: 3)
!702 = !DILocation(line: 44, column: 72, scope: !703)
!703 = !DILexicalBlockFile(scope: !672, file: !2, discriminator: 4)
!704 = !DILocation(line: 44, column: 72, scope: !705)
!705 = !DILexicalBlockFile(scope: !672, file: !2, discriminator: 5)
!706 = !DILocation(line: 44, column: 72, scope: !707)
!707 = !DILexicalBlockFile(scope: !672, file: !2, discriminator: 6)
!708 = !DILocation(line: 44, column: 72, scope: !709)
!709 = !DILexicalBlockFile(scope: !672, file: !2, discriminator: 7)
!710 = !DILocation(line: 44, column: 72, scope: !711)
!711 = !DILexicalBlockFile(scope: !672, file: !2, discriminator: 8)
!712 = !DILocation(line: 44, column: 72, scope: !713)
!713 = !DILexicalBlockFile(scope: !672, file: !2, discriminator: 9)
!714 = !DILocation(line: 225, column: 1, scope: !672)
!715 = distinct !DISubprogram(name: "IMGVF_cuda", scope: !2, file: !2, line: 229, type: !716, isLocal: false, isDefinition: true, scopeLine: 229, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !675)
!716 = !DISubroutineType(types: !717)
!717 = !{null, !718, !718, !103, !103, !103, !102, !103, !102}
!718 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !719, size: 64, align: 64)
!719 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !720, size: 64, align: 64)
!720 = !DIDerivedType(tag: DW_TAG_typedef, name: "MAT", file: !721, line: 60, baseType: !722)
!721 = !DIFile(filename: "../meschach_lib/matrix.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!722 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !721, line: 56, size: 320, align: 64, elements: !723, identifier: "_ZTS3MAT")
!723 = !{!724, !725, !726, !727, !728, !729, !731}
!724 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !722, file: !721, line: 57, baseType: !473, size: 32, align: 32)
!725 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !722, file: !721, line: 57, baseType: !473, size: 32, align: 32, offset: 32)
!726 = !DIDerivedType(tag: DW_TAG_member, name: "max_m", scope: !722, file: !721, line: 58, baseType: !473, size: 32, align: 32, offset: 64)
!727 = !DIDerivedType(tag: DW_TAG_member, name: "max_n", scope: !722, file: !721, line: 58, baseType: !473, size: 32, align: 32, offset: 96)
!728 = !DIDerivedType(tag: DW_TAG_member, name: "max_size", scope: !722, file: !721, line: 58, baseType: !473, size: 32, align: 32, offset: 128)
!729 = !DIDerivedType(tag: DW_TAG_member, name: "me", scope: !722, file: !721, line: 59, baseType: !730, size: 64, align: 64, offset: 192)
!730 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !351, size: 64, align: 64)
!731 = !DIDerivedType(tag: DW_TAG_member, name: "base", scope: !722, file: !721, line: 59, baseType: !351, size: 64, align: 64, offset: 256)
!732 = !DILocalVariable(name: "I", arg: 1, scope: !715, file: !2, line: 229, type: !718)
!733 = !DILocation(line: 229, column: 23, scope: !715)
!734 = !DILocalVariable(name: "IMGVF", arg: 2, scope: !715, file: !2, line: 229, type: !718)
!735 = !DILocation(line: 229, column: 32, scope: !715)
!736 = !DILocalVariable(name: "vx", arg: 3, scope: !715, file: !2, line: 229, type: !103)
!737 = !DILocation(line: 229, column: 46, scope: !715)
!738 = !DILocalVariable(name: "vy", arg: 4, scope: !715, file: !2, line: 229, type: !103)
!739 = !DILocation(line: 229, column: 57, scope: !715)
!740 = !DILocalVariable(name: "e", arg: 5, scope: !715, file: !2, line: 229, type: !103)
!741 = !DILocation(line: 229, column: 68, scope: !715)
!742 = !DILocalVariable(name: "max_iterations", arg: 6, scope: !715, file: !2, line: 229, type: !102)
!743 = !DILocation(line: 229, column: 75, scope: !715)
!744 = !DILocalVariable(name: "cutoff", arg: 7, scope: !715, file: !2, line: 229, type: !103)
!745 = !DILocation(line: 229, column: 98, scope: !715)
!746 = !DILocalVariable(name: "num_cells", arg: 8, scope: !715, file: !2, line: 229, type: !102)
!747 = !DILocation(line: 229, column: 110, scope: !715)
!748 = !DILocation(line: 232, column: 18, scope: !715)
!749 = !DILocation(line: 232, column: 21, scope: !715)
!750 = !DILocation(line: 232, column: 2, scope: !715)
!751 = !DILocation(line: 235, column: 19, scope: !715)
!752 = !DILocation(line: 235, column: 30, scope: !753)
!753 = !DILexicalBlockFile(scope: !715, file: !2, discriminator: 2)
!754 = !DILocation(line: 235, column: 15, scope: !715)
!755 = !DILocation(line: 235, column: 15, scope: !756)
!756 = !DILexicalBlockFile(scope: !715, file: !2, discriminator: 3)
!757 = !DILocation(line: 235, column: 2, scope: !715)
!758 = !DILocation(line: 236, column: 7, scope: !715)
!759 = !DILocation(line: 236, column: 27, scope: !715)
!760 = !DILocation(line: 236, column: 43, scope: !715)
!761 = !DILocation(line: 236, column: 59, scope: !715)
!762 = !DILocation(line: 237, column: 15, scope: !715)
!763 = !DILocation(line: 237, column: 27, scope: !715)
!764 = !DILocation(line: 237, column: 39, scope: !715)
!765 = !DILocation(line: 237, column: 42, scope: !715)
!766 = !DILocation(line: 237, column: 66, scope: !715)
!767 = !DILocation(line: 235, column: 2, scope: !768)
!768 = !DILexicalBlockFile(scope: !715, file: !2, discriminator: 1)
!769 = !DILocation(line: 240, column: 2, scope: !715)
!770 = !DILocalVariable(name: "error", scope: !715, file: !2, line: 241, type: !771)
!771 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !5, line: 1477, baseType: !4)
!772 = !DILocation(line: 241, column: 14, scope: !715)
!773 = !DILocation(line: 241, column: 22, scope: !715)
!774 = !DILocation(line: 242, column: 6, scope: !775)
!775 = distinct !DILexicalBlock(scope: !715, file: !2, line: 242, column: 6)
!776 = !DILocation(line: 242, column: 12, scope: !775)
!777 = !DILocation(line: 242, column: 6, scope: !715)
!778 = !DILocation(line: 243, column: 56, scope: !779)
!779 = distinct !DILexicalBlock(scope: !775, file: !2, line: 242, column: 28)
!780 = !DILocation(line: 243, column: 37, scope: !779)
!781 = !DILocation(line: 243, column: 3, scope: !782)
!782 = !DILexicalBlockFile(scope: !779, file: !2, discriminator: 1)
!783 = !DILocation(line: 244, column: 3, scope: !779)
!784 = !DILocation(line: 248, column: 21, scope: !715)
!785 = !DILocation(line: 248, column: 28, scope: !715)
!786 = !DILocation(line: 248, column: 2, scope: !715)
!787 = !DILocation(line: 249, column: 1, scope: !715)
!788 = distinct !DISubprogram(name: "IMGVF_cuda_init", scope: !2, file: !2, line: 253, type: !789, isLocal: false, isDefinition: true, scopeLine: 253, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !675)
!789 = !DISubroutineType(types: !790)
!790 = !{null, !718, !102}
!791 = !DILocalVariable(name: "IE", arg: 1, scope: !788, file: !2, line: 253, type: !718)
!792 = !DILocation(line: 253, column: 28, scope: !788)
!793 = !DILocalVariable(name: "num_cells", arg: 2, scope: !788, file: !2, line: 253, type: !102)
!794 = !DILocation(line: 253, column: 36, scope: !788)
!795 = !DILocation(line: 255, column: 53, scope: !788)
!796 = !DILocation(line: 255, column: 51, scope: !788)
!797 = !DILocation(line: 255, column: 28, scope: !788)
!798 = !DILocation(line: 255, column: 17, scope: !788)
!799 = !DILocation(line: 255, column: 15, scope: !788)
!800 = !DILocation(line: 256, column: 57, scope: !788)
!801 = !DILocation(line: 256, column: 55, scope: !788)
!802 = !DILocation(line: 256, column: 32, scope: !788)
!803 = !DILocation(line: 256, column: 21, scope: !788)
!804 = !DILocation(line: 256, column: 19, scope: !788)
!805 = !DILocation(line: 257, column: 40, scope: !788)
!806 = !DILocation(line: 257, column: 50, scope: !788)
!807 = !DILocation(line: 257, column: 2, scope: !788)
!808 = !DILocation(line: 258, column: 44, scope: !788)
!809 = !DILocation(line: 258, column: 54, scope: !788)
!810 = !DILocation(line: 258, column: 2, scope: !788)
!811 = !DILocation(line: 261, column: 46, scope: !788)
!812 = !DILocation(line: 261, column: 44, scope: !788)
!813 = !DILocation(line: 261, column: 25, scope: !788)
!814 = !DILocation(line: 261, column: 17, scope: !788)
!815 = !DILocation(line: 261, column: 15, scope: !788)
!816 = !DILocation(line: 262, column: 46, scope: !788)
!817 = !DILocation(line: 262, column: 44, scope: !788)
!818 = !DILocation(line: 262, column: 25, scope: !788)
!819 = !DILocation(line: 262, column: 17, scope: !788)
!820 = !DILocation(line: 262, column: 15, scope: !788)
!821 = !DILocation(line: 263, column: 40, scope: !788)
!822 = !DILocation(line: 263, column: 50, scope: !788)
!823 = !DILocation(line: 263, column: 2, scope: !788)
!824 = !DILocation(line: 264, column: 40, scope: !788)
!825 = !DILocation(line: 264, column: 50, scope: !788)
!826 = !DILocation(line: 264, column: 2, scope: !788)
!827 = !DILocalVariable(name: "i", scope: !788, file: !2, line: 267, type: !102)
!828 = !DILocation(line: 267, column: 6, scope: !788)
!829 = !DILocalVariable(name: "j", scope: !788, file: !2, line: 267, type: !102)
!830 = !DILocation(line: 267, column: 9, scope: !788)
!831 = !DILocalVariable(name: "cell_num", scope: !788, file: !2, line: 267, type: !102)
!832 = !DILocation(line: 267, column: 12, scope: !788)
!833 = !DILocalVariable(name: "total_size", scope: !788, file: !2, line: 268, type: !102)
!834 = !DILocation(line: 268, column: 6, scope: !788)
!835 = !DILocation(line: 269, column: 16, scope: !836)
!836 = distinct !DILexicalBlock(scope: !788, file: !2, line: 269, column: 2)
!837 = !DILocation(line: 269, column: 7, scope: !836)
!838 = !DILocation(line: 269, column: 21, scope: !839)
!839 = !DILexicalBlockFile(scope: !840, file: !2, discriminator: 1)
!840 = distinct !DILexicalBlock(scope: !836, file: !2, line: 269, column: 2)
!841 = !DILocation(line: 269, column: 32, scope: !839)
!842 = !DILocation(line: 269, column: 30, scope: !839)
!843 = !DILocation(line: 269, column: 2, scope: !839)
!844 = !DILocalVariable(name: "I", scope: !845, file: !2, line: 270, type: !719)
!845 = distinct !DILexicalBlock(scope: !840, file: !2, line: 269, column: 55)
!846 = !DILocation(line: 270, column: 8, scope: !845)
!847 = !DILocation(line: 270, column: 12, scope: !845)
!848 = !DILocation(line: 270, column: 15, scope: !845)
!849 = !DILocalVariable(name: "size", scope: !845, file: !2, line: 271, type: !102)
!850 = !DILocation(line: 271, column: 7, scope: !845)
!851 = !DILocation(line: 271, column: 14, scope: !845)
!852 = !DILocation(line: 271, column: 17, scope: !845)
!853 = !DILocation(line: 271, column: 21, scope: !845)
!854 = !DILocation(line: 271, column: 24, scope: !845)
!855 = !DILocation(line: 271, column: 19, scope: !845)
!856 = !DILocation(line: 272, column: 17, scope: !845)
!857 = !DILocation(line: 272, column: 14, scope: !845)
!858 = !DILocation(line: 273, column: 2, scope: !845)
!859 = !DILocation(line: 269, column: 51, scope: !860)
!860 = !DILexicalBlockFile(scope: !840, file: !2, discriminator: 2)
!861 = !DILocation(line: 269, column: 2, scope: !860)
!862 = distinct !{!862, !863}
!863 = !DILocation(line: 269, column: 2, scope: !788)
!864 = !DILocation(line: 274, column: 19, scope: !788)
!865 = !DILocation(line: 274, column: 30, scope: !788)
!866 = !DILocation(line: 274, column: 17, scope: !788)
!867 = !DILocation(line: 277, column: 32, scope: !788)
!868 = !DILocation(line: 277, column: 25, scope: !788)
!869 = !DILocation(line: 277, column: 15, scope: !788)
!870 = !DILocation(line: 277, column: 13, scope: !788)
!871 = !DILocalVariable(name: "device_I_all", scope: !788, file: !2, line: 280, type: !98)
!872 = !DILocation(line: 280, column: 9, scope: !788)
!873 = !DILocalVariable(name: "device_IMGVF_all", scope: !788, file: !2, line: 280, type: !98)
!874 = !DILocation(line: 280, column: 24, scope: !788)
!875 = !DILocation(line: 281, column: 14, scope: !788)
!876 = !DILocation(line: 281, column: 38, scope: !788)
!877 = !DILocation(line: 281, column: 2, scope: !788)
!878 = !DILocation(line: 282, column: 14, scope: !788)
!879 = !DILocation(line: 282, column: 42, scope: !788)
!880 = !DILocation(line: 282, column: 2, scope: !788)
!881 = !DILocalVariable(name: "offset", scope: !788, file: !2, line: 285, type: !102)
!882 = !DILocation(line: 285, column: 6, scope: !788)
!883 = !DILocation(line: 286, column: 16, scope: !884)
!884 = distinct !DILexicalBlock(scope: !788, file: !2, line: 286, column: 2)
!885 = !DILocation(line: 286, column: 7, scope: !884)
!886 = !DILocation(line: 286, column: 21, scope: !887)
!887 = !DILexicalBlockFile(scope: !888, file: !2, discriminator: 1)
!888 = distinct !DILexicalBlock(scope: !884, file: !2, line: 286, column: 2)
!889 = !DILocation(line: 286, column: 32, scope: !887)
!890 = !DILocation(line: 286, column: 30, scope: !887)
!891 = !DILocation(line: 286, column: 2, scope: !887)
!892 = !DILocalVariable(name: "I", scope: !893, file: !2, line: 287, type: !719)
!893 = distinct !DILexicalBlock(scope: !888, file: !2, line: 286, column: 55)
!894 = !DILocation(line: 287, column: 8, scope: !893)
!895 = !DILocation(line: 287, column: 12, scope: !893)
!896 = !DILocation(line: 287, column: 15, scope: !893)
!897 = !DILocalVariable(name: "m", scope: !893, file: !2, line: 290, type: !102)
!898 = !DILocation(line: 290, column: 7, scope: !893)
!899 = !DILocation(line: 290, column: 11, scope: !893)
!900 = !DILocation(line: 290, column: 14, scope: !893)
!901 = !DILocalVariable(name: "n", scope: !893, file: !2, line: 290, type: !102)
!902 = !DILocation(line: 290, column: 17, scope: !893)
!903 = !DILocation(line: 290, column: 21, scope: !893)
!904 = !DILocation(line: 290, column: 24, scope: !893)
!905 = !DILocalVariable(name: "size", scope: !893, file: !2, line: 291, type: !102)
!906 = !DILocation(line: 291, column: 7, scope: !893)
!907 = !DILocation(line: 291, column: 14, scope: !893)
!908 = !DILocation(line: 291, column: 18, scope: !893)
!909 = !DILocation(line: 291, column: 16, scope: !893)
!910 = !DILocation(line: 294, column: 28, scope: !893)
!911 = !DILocation(line: 294, column: 3, scope: !893)
!912 = !DILocation(line: 294, column: 16, scope: !893)
!913 = !DILocation(line: 294, column: 26, scope: !893)
!914 = !DILocation(line: 295, column: 28, scope: !893)
!915 = !DILocation(line: 295, column: 3, scope: !893)
!916 = !DILocation(line: 295, column: 16, scope: !893)
!917 = !DILocation(line: 295, column: 26, scope: !893)
!918 = !DILocalVariable(name: "device_I", scope: !893, file: !2, line: 298, type: !98)
!919 = !DILocation(line: 298, column: 10, scope: !893)
!920 = !DILocation(line: 298, column: 23, scope: !893)
!921 = !DILocation(line: 298, column: 36, scope: !893)
!922 = !DILocalVariable(name: "device_IMGVF", scope: !893, file: !2, line: 299, type: !98)
!923 = !DILocation(line: 299, column: 10, scope: !893)
!924 = !DILocation(line: 299, column: 27, scope: !893)
!925 = !DILocation(line: 299, column: 44, scope: !893)
!926 = !DILocation(line: 300, column: 28, scope: !893)
!927 = !DILocation(line: 300, column: 3, scope: !893)
!928 = !DILocation(line: 300, column: 16, scope: !893)
!929 = !DILocation(line: 300, column: 26, scope: !893)
!930 = !DILocation(line: 301, column: 32, scope: !893)
!931 = !DILocation(line: 301, column: 3, scope: !893)
!932 = !DILocation(line: 301, column: 20, scope: !893)
!933 = !DILocation(line: 301, column: 30, scope: !893)
!934 = !DILocation(line: 304, column: 10, scope: !935)
!935 = distinct !DILexicalBlock(scope: !893, file: !2, line: 304, column: 3)
!936 = !DILocation(line: 304, column: 8, scope: !935)
!937 = !DILocation(line: 304, column: 15, scope: !938)
!938 = !DILexicalBlockFile(scope: !939, file: !2, discriminator: 1)
!939 = distinct !DILexicalBlock(scope: !935, file: !2, line: 304, column: 3)
!940 = !DILocation(line: 304, column: 19, scope: !938)
!941 = !DILocation(line: 304, column: 17, scope: !938)
!942 = !DILocation(line: 304, column: 3, scope: !938)
!943 = !DILocation(line: 305, column: 11, scope: !944)
!944 = distinct !DILexicalBlock(scope: !939, file: !2, line: 305, column: 4)
!945 = !DILocation(line: 305, column: 9, scope: !944)
!946 = !DILocation(line: 305, column: 16, scope: !947)
!947 = !DILexicalBlockFile(scope: !948, file: !2, discriminator: 1)
!948 = distinct !DILexicalBlock(scope: !944, file: !2, line: 305, column: 4)
!949 = !DILocation(line: 305, column: 20, scope: !947)
!950 = !DILocation(line: 305, column: 18, scope: !947)
!951 = !DILocation(line: 305, column: 4, scope: !947)
!952 = !DILocation(line: 306, column: 48, scope: !948)
!953 = !DILocation(line: 306, column: 5, scope: !948)
!954 = !DILocation(line: 306, column: 16, scope: !948)
!955 = !DILocation(line: 306, column: 26, scope: !948)
!956 = !DILocation(line: 306, column: 30, scope: !948)
!957 = !DILocation(line: 306, column: 28, scope: !948)
!958 = !DILocation(line: 306, column: 23, scope: !948)
!959 = !DILocation(line: 306, column: 35, scope: !948)
!960 = !DILocation(line: 306, column: 33, scope: !948)
!961 = !DILocation(line: 306, column: 38, scope: !948)
!962 = !DILocation(line: 305, column: 24, scope: !963)
!963 = !DILexicalBlockFile(scope: !948, file: !2, discriminator: 2)
!964 = !DILocation(line: 305, column: 4, scope: !963)
!965 = distinct !{!965, !966}
!966 = !DILocation(line: 305, column: 4, scope: !939)
!967 = !DILocation(line: 306, column: 48, scope: !968)
!968 = !DILexicalBlockFile(scope: !944, file: !2, discriminator: 1)
!969 = !DILocation(line: 304, column: 23, scope: !970)
!970 = !DILexicalBlockFile(scope: !939, file: !2, discriminator: 2)
!971 = !DILocation(line: 304, column: 3, scope: !970)
!972 = distinct !{!972, !973}
!973 = !DILocation(line: 304, column: 3, scope: !893)
!974 = !DILocation(line: 308, column: 13, scope: !893)
!975 = !DILocation(line: 308, column: 10, scope: !893)
!976 = !DILocation(line: 309, column: 2, scope: !893)
!977 = !DILocation(line: 286, column: 51, scope: !978)
!978 = !DILexicalBlockFile(scope: !888, file: !2, discriminator: 2)
!979 = !DILocation(line: 286, column: 2, scope: !978)
!980 = distinct !{!980, !981}
!981 = !DILocation(line: 286, column: 2, scope: !788)
!982 = !DILocation(line: 312, column: 13, scope: !788)
!983 = !DILocation(line: 312, column: 27, scope: !788)
!984 = !DILocation(line: 312, column: 39, scope: !788)
!985 = !DILocation(line: 312, column: 2, scope: !788)
!986 = !DILocation(line: 313, column: 13, scope: !788)
!987 = !DILocation(line: 313, column: 31, scope: !788)
!988 = !DILocation(line: 313, column: 43, scope: !788)
!989 = !DILocation(line: 313, column: 2, scope: !788)
!990 = !DILocation(line: 316, column: 13, scope: !788)
!991 = !DILocation(line: 316, column: 29, scope: !788)
!992 = !DILocation(line: 316, column: 43, scope: !788)
!993 = !DILocation(line: 316, column: 53, scope: !788)
!994 = !DILocation(line: 316, column: 2, scope: !788)
!995 = !DILocation(line: 317, column: 13, scope: !788)
!996 = !DILocation(line: 317, column: 33, scope: !788)
!997 = !DILocation(line: 317, column: 51, scope: !788)
!998 = !DILocation(line: 317, column: 61, scope: !788)
!999 = !DILocation(line: 317, column: 2, scope: !788)
!1000 = !DILocation(line: 320, column: 13, scope: !788)
!1001 = !DILocation(line: 320, column: 29, scope: !788)
!1002 = !DILocation(line: 320, column: 43, scope: !788)
!1003 = !DILocation(line: 320, column: 53, scope: !788)
!1004 = !DILocation(line: 320, column: 2, scope: !788)
!1005 = !DILocation(line: 321, column: 13, scope: !788)
!1006 = !DILocation(line: 321, column: 29, scope: !788)
!1007 = !DILocation(line: 321, column: 43, scope: !788)
!1008 = !DILocation(line: 321, column: 53, scope: !788)
!1009 = !DILocation(line: 321, column: 2, scope: !788)
!1010 = !DILocation(line: 322, column: 1, scope: !788)
!1011 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1013, file: !1012, line: 421, type: !1019, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !1, declaration: !1018, variables: !675)
!1012 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/leukocyte/CUDA")
!1013 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1012, line: 417, size: 96, align: 32, elements: !1014, identifier: "_ZTS4dim3")
!1014 = !{!1015, !1016, !1017, !1018, !1022, !1031}
!1015 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1013, file: !1012, line: 419, baseType: !473, size: 32, align: 32)
!1016 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1013, file: !1012, line: 419, baseType: !473, size: 32, align: 32, offset: 32)
!1017 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1013, file: !1012, line: 419, baseType: !473, size: 32, align: 32, offset: 64)
!1018 = !DISubprogram(name: "dim3", scope: !1013, file: !1012, line: 421, type: !1019, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{null, !1021, !473, !473, !473}
!1021 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1013, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1022 = !DISubprogram(name: "dim3", scope: !1013, file: !1012, line: 422, type: !1023, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!1023 = !DISubroutineType(types: !1024)
!1024 = !{null, !1021, !1025}
!1025 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1012, line: 383, baseType: !1026)
!1026 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1012, line: 190, size: 96, align: 32, elements: !1027, identifier: "_ZTS5uint3")
!1027 = !{!1028, !1029, !1030}
!1028 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1026, file: !1012, line: 192, baseType: !473, size: 32, align: 32)
!1029 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1026, file: !1012, line: 192, baseType: !473, size: 32, align: 32, offset: 32)
!1030 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1026, file: !1012, line: 192, baseType: !473, size: 32, align: 32, offset: 64)
!1031 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1013, file: !1012, line: 423, type: !1032, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!1032 = !DISubroutineType(types: !1033)
!1033 = !{!1025, !1021}
!1034 = !DILocalVariable(name: "this", arg: 1, scope: !1011, type: !1035, flags: DIFlagArtificial | DIFlagObjectPointer)
!1035 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1013, size: 64, align: 64)
!1036 = !DILocation(line: 0, scope: !1011)
!1037 = !DILocalVariable(name: "vx", arg: 2, scope: !1011, file: !1012, line: 421, type: !473)
!1038 = !DILocation(line: 421, column: 43, scope: !1011)
!1039 = !DILocalVariable(name: "vy", arg: 3, scope: !1011, file: !1012, line: 421, type: !473)
!1040 = !DILocation(line: 421, column: 64, scope: !1011)
!1041 = !DILocalVariable(name: "vz", arg: 4, scope: !1011, file: !1012, line: 421, type: !473)
!1042 = !DILocation(line: 421, column: 85, scope: !1011)
!1043 = !DILocation(line: 421, column: 95, scope: !1011)
!1044 = !DILocation(line: 421, column: 97, scope: !1011)
!1045 = !DILocation(line: 421, column: 102, scope: !1011)
!1046 = !DILocation(line: 421, column: 104, scope: !1011)
!1047 = !DILocation(line: 421, column: 109, scope: !1011)
!1048 = !DILocation(line: 421, column: 111, scope: !1011)
!1049 = !DILocation(line: 421, column: 116, scope: !1011)
!1050 = distinct !DISubprogram(name: "IMGVF_cuda_cleanup", scope: !2, file: !2, line: 326, type: !789, isLocal: false, isDefinition: true, scopeLine: 326, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !675)
!1051 = !DILocalVariable(name: "IMGVF_out_array", arg: 1, scope: !1050, file: !2, line: 326, type: !718)
!1052 = !DILocation(line: 326, column: 31, scope: !1050)
!1053 = !DILocalVariable(name: "num_cells", arg: 2, scope: !1050, file: !2, line: 326, type: !102)
!1054 = !DILocation(line: 326, column: 52, scope: !1050)
!1055 = !DILocation(line: 328, column: 13, scope: !1050)
!1056 = !DILocation(line: 328, column: 25, scope: !1050)
!1057 = !DILocation(line: 328, column: 46, scope: !1050)
!1058 = !DILocation(line: 328, column: 2, scope: !1050)
!1059 = !DILocalVariable(name: "cell_num", scope: !1050, file: !2, line: 331, type: !102)
!1060 = !DILocation(line: 331, column: 6, scope: !1050)
!1061 = !DILocalVariable(name: "offset", scope: !1050, file: !2, line: 331, type: !102)
!1062 = !DILocation(line: 331, column: 16, scope: !1050)
!1063 = !DILocation(line: 332, column: 16, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1050, file: !2, line: 332, column: 2)
!1065 = !DILocation(line: 332, column: 7, scope: !1064)
!1066 = !DILocation(line: 332, column: 21, scope: !1067)
!1067 = !DILexicalBlockFile(scope: !1068, file: !2, discriminator: 1)
!1068 = distinct !DILexicalBlock(scope: !1064, file: !2, line: 332, column: 2)
!1069 = !DILocation(line: 332, column: 32, scope: !1067)
!1070 = !DILocation(line: 332, column: 30, scope: !1067)
!1071 = !DILocation(line: 332, column: 2, scope: !1067)
!1072 = !DILocalVariable(name: "IMGVF_out", scope: !1073, file: !2, line: 333, type: !719)
!1073 = distinct !DILexicalBlock(scope: !1068, file: !2, line: 332, column: 55)
!1074 = !DILocation(line: 333, column: 8, scope: !1073)
!1075 = !DILocation(line: 333, column: 20, scope: !1073)
!1076 = !DILocation(line: 333, column: 36, scope: !1073)
!1077 = !DILocalVariable(name: "m", scope: !1073, file: !2, line: 336, type: !102)
!1078 = !DILocation(line: 336, column: 7, scope: !1073)
!1079 = !DILocation(line: 336, column: 11, scope: !1073)
!1080 = !DILocation(line: 336, column: 22, scope: !1073)
!1081 = !DILocalVariable(name: "n", scope: !1073, file: !2, line: 336, type: !102)
!1082 = !DILocation(line: 336, column: 25, scope: !1073)
!1083 = !DILocation(line: 336, column: 29, scope: !1073)
!1084 = !DILocation(line: 336, column: 40, scope: !1073)
!1085 = !DILocalVariable(name: "i", scope: !1073, file: !2, line: 336, type: !102)
!1086 = !DILocation(line: 336, column: 43, scope: !1073)
!1087 = !DILocalVariable(name: "j", scope: !1073, file: !2, line: 336, type: !102)
!1088 = !DILocation(line: 336, column: 46, scope: !1073)
!1089 = !DILocation(line: 338, column: 10, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1073, file: !2, line: 338, column: 3)
!1091 = !DILocation(line: 338, column: 8, scope: !1090)
!1092 = !DILocation(line: 338, column: 15, scope: !1093)
!1093 = !DILexicalBlockFile(scope: !1094, file: !2, discriminator: 1)
!1094 = distinct !DILexicalBlock(scope: !1090, file: !2, line: 338, column: 3)
!1095 = !DILocation(line: 338, column: 19, scope: !1093)
!1096 = !DILocation(line: 338, column: 17, scope: !1093)
!1097 = !DILocation(line: 338, column: 3, scope: !1093)
!1098 = !DILocation(line: 339, column: 11, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1094, file: !2, line: 339, column: 4)
!1100 = !DILocation(line: 339, column: 9, scope: !1099)
!1101 = !DILocation(line: 339, column: 16, scope: !1102)
!1102 = !DILexicalBlockFile(scope: !1103, file: !2, discriminator: 1)
!1103 = distinct !DILexicalBlock(scope: !1099, file: !2, line: 339, column: 4)
!1104 = !DILocation(line: 339, column: 20, scope: !1102)
!1105 = !DILocation(line: 339, column: 18, scope: !1102)
!1106 = !DILocation(line: 339, column: 4, scope: !1102)
!1107 = !DILocation(line: 340, column: 5, scope: !1103)
!1108 = !DILocation(line: 339, column: 24, scope: !1109)
!1109 = !DILexicalBlockFile(scope: !1103, file: !2, discriminator: 2)
!1110 = !DILocation(line: 339, column: 4, scope: !1109)
!1111 = distinct !{!1111, !1112}
!1112 = !DILocation(line: 339, column: 4, scope: !1094)
!1113 = !DILocation(line: 340, column: 5, scope: !1114)
!1114 = !DILexicalBlockFile(scope: !1099, file: !2, discriminator: 1)
!1115 = !DILocation(line: 338, column: 23, scope: !1116)
!1116 = !DILexicalBlockFile(scope: !1094, file: !2, discriminator: 2)
!1117 = !DILocation(line: 338, column: 3, scope: !1116)
!1118 = distinct !{!1118, !1119}
!1119 = !DILocation(line: 338, column: 3, scope: !1073)
!1120 = !DILocation(line: 342, column: 14, scope: !1073)
!1121 = !DILocation(line: 342, column: 18, scope: !1073)
!1122 = !DILocation(line: 342, column: 16, scope: !1073)
!1123 = !DILocation(line: 342, column: 10, scope: !1073)
!1124 = !DILocation(line: 343, column: 2, scope: !1073)
!1125 = !DILocation(line: 332, column: 51, scope: !1126)
!1126 = !DILexicalBlockFile(scope: !1068, file: !2, discriminator: 2)
!1127 = !DILocation(line: 332, column: 2, scope: !1126)
!1128 = distinct !{!1128, !1129}
!1129 = !DILocation(line: 332, column: 2, scope: !1050)
!1130 = !DILocation(line: 346, column: 11, scope: !1050)
!1131 = !DILocation(line: 346, column: 2, scope: !1050)
!1132 = !DILocation(line: 347, column: 11, scope: !1050)
!1133 = !DILocation(line: 347, column: 2, scope: !1050)
!1134 = !DILocation(line: 348, column: 11, scope: !1050)
!1135 = !DILocation(line: 348, column: 2, scope: !1050)
!1136 = !DILocation(line: 349, column: 11, scope: !1050)
!1137 = !DILocation(line: 349, column: 2, scope: !1050)
!1138 = !DILocation(line: 350, column: 11, scope: !1050)
!1139 = !DILocation(line: 350, column: 2, scope: !1050)
!1140 = !DILocation(line: 351, column: 11, scope: !1050)
!1141 = !DILocation(line: 351, column: 2, scope: !1050)
!1142 = !DILocation(line: 354, column: 7, scope: !1050)
!1143 = !DILocation(line: 354, column: 2, scope: !1050)
!1144 = !DILocation(line: 355, column: 7, scope: !1050)
!1145 = !DILocation(line: 355, column: 2, scope: !1050)
!1146 = !DILocation(line: 356, column: 7, scope: !1050)
!1147 = !DILocation(line: 356, column: 2, scope: !1050)
!1148 = !DILocation(line: 357, column: 7, scope: !1050)
!1149 = !DILocation(line: 357, column: 2, scope: !1050)
!1150 = !DILocation(line: 358, column: 7, scope: !1050)
!1151 = !DILocation(line: 358, column: 2, scope: !1050)
!1152 = !DILocation(line: 359, column: 1, scope: !1050)
