; ModuleID = 'gaussian.cu'
source_filename = "gaussian.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32 }

$_ZN4dim3C2Ejjj = comdat any

@Size = global i32 0, align 4, !dbg !0
@a = global float* null, align 8, !dbg !101
@b = global float* null, align 8, !dbg !102
@finalVec = global float* null, align 8, !dbg !103
@m = global float* null, align 8, !dbg !104
@fp = global %struct._IO_FILE* null, align 8, !dbg !105
@totalKernelTime = global i32 0, align 4, !dbg !111
@.str = private unnamed_addr constant [56 x i8] c"WG size of kernel 1 = %d, WG size of kernel 2= %d X %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c"Usage: gaussian -f filename / -s size [-q]\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [62 x i8] c"-q (quiet) suppresses printing the matrix and result values.\0A\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"-f (filename) path of input file\0A\00", align 1
@.str.4 = private unnamed_addr constant [66 x i8] c"-s (size) size of matrix. Create matrix and rhs in this program \0A\00", align 1
@.str.5 = private unnamed_addr constant [68 x i8] c"The first line of the file contains the dimension of the matrix, n.\00", align 1
@.str.6 = private unnamed_addr constant [43 x i8] c"The second line of the file is a newline.\0A\00", align 1
@.str.7 = private unnamed_addr constant [64 x i8] c"The next n lines contain n tab separated values for the matrix.\00", align 1
@.str.8 = private unnamed_addr constant [41 x i8] c"The next line of the file is a newline.\0A\00", align 1
@.str.9 = private unnamed_addr constant [70 x i8] c"The next line of the file is a 1xn vector with tab separated values.\0A\00", align 1
@.str.10 = private unnamed_addr constant [52 x i8] c"The next line of the file is a newline. (optional)\0A\00", align 1
@.str.11 = private unnamed_addr constant [69 x i8] c"The final line of the file is the pre-computed solution. (optional)\0A\00", align 1
@.str.12 = private unnamed_addr constant [23 x i8] c"Example: matrix4.txt:\0A\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"4\0A\00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.15 = private unnamed_addr constant [19 x i8] c"-0.6\09-0.5\090.7\090.3\0A\00", align 1
@.str.16 = private unnamed_addr constant [19 x i8] c"-0.3\09-0.9\090.3\090.7\0A\00", align 1
@.str.17 = private unnamed_addr constant [21 x i8] c"-0.4\09-0.5\09-0.3\09-0.8\0A\00", align 1
@.str.18 = private unnamed_addr constant [18 x i8] c"0.0\09-0.1\090.2\090.9\0A\00", align 1
@.str.19 = private unnamed_addr constant [24 x i8] c"-0.85\09-0.68\090.24\09-0.53\0A\00", align 1
@.str.20 = private unnamed_addr constant [19 x i8] c"0.7\090.0\09-0.4\09-0.5\0A\00", align 1
@.str.21 = private unnamed_addr constant [47 x i8] c"Create matrix internally in parse, size = %d \0A\00", align 1
@.str.22 = private unnamed_addr constant [20 x i8] c"Read file from %s \0A\00", align 1
@.str.23 = private unnamed_addr constant [15 x i8] c"Matrix m is: \0A\00", align 1
@.str.24 = private unnamed_addr constant [15 x i8] c"Matrix a is: \0A\00", align 1
@.str.25 = private unnamed_addr constant [14 x i8] c"Array b is: \0A\00", align 1
@.str.26 = private unnamed_addr constant [25 x i8] c"The final solution is: \0A\00", align 1
@.str.27 = private unnamed_addr constant [49 x i8] c"\0ATime total (including memory transfers)\09%f sec\0A\00", align 1
@.str.28 = private unnamed_addr constant [31 x i8] c"Time for CUDA kernels:\09%f sec\0A\00", align 1
@.str.29 = private unnamed_addr constant [23 x i8] c"Total Device found: %d\00", align 1
@.str.30 = private unnamed_addr constant [22 x i8] c"\0ADevice Name \09\09 - %s \00", align 1
@.str.31 = private unnamed_addr constant [40 x i8] c"\0A**************************************\00", align 1
@.str.32 = private unnamed_addr constant [33 x i8] c"\0ATotal Global Memory\09\09\09 - %lu KB\00", align 1
@.str.33 = private unnamed_addr constant [46 x i8] c"\0AShared memory available per block \09 - %lu KB\00", align 1
@.str.34 = private unnamed_addr constant [45 x i8] c"\0ANumber of registers per thread block \09 - %d\00", align 1
@.str.35 = private unnamed_addr constant [31 x i8] c"\0AWarp size in threads \09\09\09 - %d\00", align 1
@.str.36 = private unnamed_addr constant [31 x i8] c"\0AMemory Pitch \09\09\09\09 - %zu bytes\00", align 1
@.str.37 = private unnamed_addr constant [35 x i8] c"\0AMaximum threads per block \09\09 - %d\00", align 1
@.str.38 = private unnamed_addr constant [47 x i8] c"\0AMaximum Thread Dimension (block) \09 - %d %d %d\00", align 1
@.str.39 = private unnamed_addr constant [46 x i8] c"\0AMaximum Thread Dimension (grid) \09 - %d %d %d\00", align 1
@.str.40 = private unnamed_addr constant [39 x i8] c"\0ATotal constant memory \09\09\09 - %zu bytes\00", align 1
@.str.41 = private unnamed_addr constant [23 x i8] c"\0ACUDA ver \09\09\09\09 - %d.%d\00", align 1
@.str.42 = private unnamed_addr constant [26 x i8] c"\0AClock rate \09\09\09\09 - %d KHz\00", align 1
@.str.43 = private unnamed_addr constant [35 x i8] c"\0ATexture Alignment \09\09\09 - %zu bytes\00", align 1
@.str.44 = private unnamed_addr constant [26 x i8] c"\0ADevice Overlap \09\09\09\09 - %s\00", align 1
@.str.45 = private unnamed_addr constant [8 x i8] c"Allowed\00", align 1
@.str.46 = private unnamed_addr constant [12 x i8] c"Not Allowed\00", align 1
@.str.47 = private unnamed_addr constant [38 x i8] c"\0ANumber of Multi processors \09\09 - %d\0A\0A\00", align 1
@.str.48 = private unnamed_addr constant [4 x i8] c"\0A%s\00", align 1
@.str.49 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.50 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.51 = private unnamed_addr constant [5 x i8] c"Fan2\00", align 1
@.str.52 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.53 = private unnamed_addr constant [7 x i8] c"%8.2f \00", align 1
@.str.54 = private unnamed_addr constant [6 x i8] c"%.2f \00", align 1
@.str.55 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.56 = private unnamed_addr constant [21 x i8] c"Cuda error: %s: %s.\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @_Z13create_matrixPfi(float* %m, i32 %size) #0 !dbg !670 {
entry:
  %m.addr = alloca float*, align 8
  %size.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %lamda = alloca float, align 4
  %saved_stack = alloca i8*, align 8
  %coe_i = alloca float, align 4
  store float* %m, float** %m.addr, align 8
  call void @llvm.dbg.declare(metadata float** %m.addr, metadata !674, metadata !675), !dbg !676
  store i32 %size, i32* %size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !677, metadata !675), !dbg !678
  call void @llvm.dbg.declare(metadata i32* %i, metadata !679, metadata !675), !dbg !680
  call void @llvm.dbg.declare(metadata i32* %j, metadata !681, metadata !675), !dbg !682
  call void @llvm.dbg.declare(metadata float* %lamda, metadata !683, metadata !675), !dbg !684
  store float 0xBF847AE140000000, float* %lamda, align 4, !dbg !684
  %0 = load i32, i32* %size.addr, align 4, !dbg !685
  %mul = mul nsw i32 2, %0, !dbg !686
  %sub = sub nsw i32 %mul, 1, !dbg !687
  %1 = zext i32 %sub to i64, !dbg !688
  %2 = call i8* @llvm.stacksave(), !dbg !688
  store i8* %2, i8** %saved_stack, align 8, !dbg !688
  %vla = alloca float, i64 %1, align 16, !dbg !688
  call void @llvm.dbg.declare(metadata float* %vla, metadata !689, metadata !693), !dbg !694
  call void @llvm.dbg.declare(metadata float* %coe_i, metadata !695, metadata !675), !dbg !696
  store float 0.000000e+00, float* %coe_i, align 4, !dbg !696
  store i32 0, i32* %i, align 4, !dbg !697
  br label %for.cond, !dbg !699

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !700
  %4 = load i32, i32* %size.addr, align 4, !dbg !703
  %cmp = icmp slt i32 %3, %4, !dbg !704
  br i1 %cmp, label %for.body, label %for.end, !dbg !705

for.body:                                         ; preds = %for.cond
  %5 = load float, float* %lamda, align 4, !dbg !706
  %6 = load i32, i32* %i, align 4, !dbg !708
  %conv = sitofp i32 %6 to float, !dbg !708
  %mul1 = fmul float %5, %conv, !dbg !709
  %conv2 = fpext float %mul1 to double, !dbg !706
  %call = call double @exp(double %conv2) #2, !dbg !710
  %mul3 = fmul double 1.000000e+01, %call, !dbg !711
  %conv4 = fptrunc double %mul3 to float, !dbg !712
  store float %conv4, float* %coe_i, align 4, !dbg !713
  %7 = load i32, i32* %size.addr, align 4, !dbg !714
  %sub5 = sub nsw i32 %7, 1, !dbg !715
  %8 = load i32, i32* %i, align 4, !dbg !716
  %add = add nsw i32 %sub5, %8, !dbg !717
  store i32 %add, i32* %j, align 4, !dbg !718
  %9 = load float, float* %coe_i, align 4, !dbg !719
  %10 = load i32, i32* %j, align 4, !dbg !720
  %idxprom = sext i32 %10 to i64, !dbg !721
  %arrayidx = getelementptr inbounds float, float* %vla, i64 %idxprom, !dbg !721
  store float %9, float* %arrayidx, align 4, !dbg !722
  %11 = load i32, i32* %size.addr, align 4, !dbg !723
  %sub6 = sub nsw i32 %11, 1, !dbg !724
  %12 = load i32, i32* %i, align 4, !dbg !725
  %sub7 = sub nsw i32 %sub6, %12, !dbg !726
  store i32 %sub7, i32* %j, align 4, !dbg !727
  %13 = load float, float* %coe_i, align 4, !dbg !728
  %14 = load i32, i32* %j, align 4, !dbg !729
  %idxprom8 = sext i32 %14 to i64, !dbg !730
  %arrayidx9 = getelementptr inbounds float, float* %vla, i64 %idxprom8, !dbg !730
  store float %13, float* %arrayidx9, align 4, !dbg !731
  br label %for.inc, !dbg !732

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !733
  %inc = add nsw i32 %15, 1, !dbg !733
  store i32 %inc, i32* %i, align 4, !dbg !733
  br label %for.cond, !dbg !735, !llvm.loop !736

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !738
  br label %for.cond10, !dbg !740

for.cond10:                                       ; preds = %for.inc28, %for.end
  %16 = load i32, i32* %i, align 4, !dbg !741
  %17 = load i32, i32* %size.addr, align 4, !dbg !744
  %cmp11 = icmp slt i32 %16, %17, !dbg !745
  br i1 %cmp11, label %for.body12, label %for.end30, !dbg !746

for.body12:                                       ; preds = %for.cond10
  store i32 0, i32* %j, align 4, !dbg !747
  br label %for.cond13, !dbg !750

for.cond13:                                       ; preds = %for.inc25, %for.body12
  %18 = load i32, i32* %j, align 4, !dbg !751
  %19 = load i32, i32* %size.addr, align 4, !dbg !754
  %cmp14 = icmp slt i32 %18, %19, !dbg !755
  br i1 %cmp14, label %for.body15, label %for.end27, !dbg !756

for.body15:                                       ; preds = %for.cond13
  %20 = load i32, i32* %size.addr, align 4, !dbg !757
  %sub16 = sub nsw i32 %20, 1, !dbg !759
  %21 = load i32, i32* %i, align 4, !dbg !760
  %sub17 = sub nsw i32 %sub16, %21, !dbg !761
  %22 = load i32, i32* %j, align 4, !dbg !762
  %add18 = add nsw i32 %sub17, %22, !dbg !763
  %idxprom19 = sext i32 %add18 to i64, !dbg !764
  %arrayidx20 = getelementptr inbounds float, float* %vla, i64 %idxprom19, !dbg !764
  %23 = load float, float* %arrayidx20, align 4, !dbg !764
  %24 = load float*, float** %m.addr, align 8, !dbg !765
  %25 = load i32, i32* %i, align 4, !dbg !766
  %26 = load i32, i32* %size.addr, align 4, !dbg !767
  %mul21 = mul nsw i32 %25, %26, !dbg !768
  %27 = load i32, i32* %j, align 4, !dbg !769
  %add22 = add nsw i32 %mul21, %27, !dbg !770
  %idxprom23 = sext i32 %add22 to i64, !dbg !765
  %arrayidx24 = getelementptr inbounds float, float* %24, i64 %idxprom23, !dbg !765
  store float %23, float* %arrayidx24, align 4, !dbg !771
  br label %for.inc25, !dbg !772

for.inc25:                                        ; preds = %for.body15
  %28 = load i32, i32* %j, align 4, !dbg !773
  %inc26 = add nsw i32 %28, 1, !dbg !773
  store i32 %inc26, i32* %j, align 4, !dbg !773
  br label %for.cond13, !dbg !775, !llvm.loop !776

for.end27:                                        ; preds = %for.cond13
  br label %for.inc28, !dbg !778

for.inc28:                                        ; preds = %for.end27
  %29 = load i32, i32* %i, align 4, !dbg !779
  %inc29 = add nsw i32 %29, 1, !dbg !779
  store i32 %inc29, i32* %i, align 4, !dbg !779
  br label %for.cond10, !dbg !781, !llvm.loop !782

for.end30:                                        ; preds = %for.cond10
  %30 = load i8*, i8** %saved_stack, align 8, !dbg !784
  call void @llvm.stackrestore(i8* %30), !dbg !784
  ret void, !dbg !784
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #2

; Function Attrs: nounwind
declare double @exp(double) #3

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #2

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #4 !dbg !785 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %verbose = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %flag = alloca i8, align 1
  %time_start = alloca %struct.timeval, align 8
  %time_end = alloca %struct.timeval, align 8
  %time_total = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !788, metadata !675), !dbg !789
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !790, metadata !675), !dbg !791
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str, i32 0, i32 0), i32 512, i32 4, i32 4), !dbg !792
  call void @llvm.dbg.declare(metadata i32* %verbose, metadata !793, metadata !675), !dbg !794
  store i32 1, i32* %verbose, align 4, !dbg !794
  call void @llvm.dbg.declare(metadata i32* %i, metadata !795, metadata !675), !dbg !796
  call void @llvm.dbg.declare(metadata i32* %j, metadata !797, metadata !675), !dbg !798
  call void @llvm.dbg.declare(metadata i8* %flag, metadata !799, metadata !675), !dbg !800
  %0 = load i32, i32* %argc.addr, align 4, !dbg !801
  %cmp = icmp slt i32 %0, 2, !dbg !803
  br i1 %cmp, label %if.then, label %if.end, !dbg !804

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i32 0, i32 0)), !dbg !805
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.2, i32 0, i32 0)), !dbg !807
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i32 0, i32 0)), !dbg !808
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.4, i32 0, i32 0)), !dbg !809
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.5, i32 0, i32 0)), !dbg !810
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.6, i32 0, i32 0)), !dbg !811
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.7, i32 0, i32 0)), !dbg !812
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.8, i32 0, i32 0)), !dbg !813
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.9, i32 0, i32 0)), !dbg !814
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.10, i32 0, i32 0)), !dbg !815
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.11, i32 0, i32 0)), !dbg !816
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.12, i32 0, i32 0)), !dbg !817
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0)), !dbg !818
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i32 0, i32 0)), !dbg !819
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.15, i32 0, i32 0)), !dbg !820
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16, i32 0, i32 0)), !dbg !821
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.17, i32 0, i32 0)), !dbg !822
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.18, i32 0, i32 0)), !dbg !823
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i32 0, i32 0)), !dbg !824
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.19, i32 0, i32 0)), !dbg !825
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i32 0, i32 0)), !dbg !826
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.20, i32 0, i32 0)), !dbg !827
  call void @exit(i32 0) #10, !dbg !828
  unreachable, !dbg !828

if.end:                                           ; preds = %entry
  store i32 1, i32* %i, align 4, !dbg !829
  br label %for.cond, !dbg !831

for.cond:                                         ; preds = %for.inc60, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !832
  %2 = load i32, i32* %argc.addr, align 4, !dbg !835
  %cmp23 = icmp slt i32 %1, %2, !dbg !836
  br i1 %cmp23, label %for.body, label %for.end62, !dbg !837

for.body:                                         ; preds = %for.cond
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !838
  %4 = load i32, i32* %i, align 4, !dbg !841
  %idxprom = sext i32 %4 to i64, !dbg !838
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 %idxprom, !dbg !838
  %5 = load i8*, i8** %arrayidx, align 8, !dbg !838
  %arrayidx24 = getelementptr inbounds i8, i8* %5, i64 0, !dbg !838
  %6 = load i8, i8* %arrayidx24, align 1, !dbg !838
  %conv = sext i8 %6 to i32, !dbg !838
  %cmp25 = icmp eq i32 %conv, 45, !dbg !842
  br i1 %cmp25, label %if.then26, label %if.end59, !dbg !843

if.then26:                                        ; preds = %for.body
  %7 = load i8**, i8*** %argv.addr, align 8, !dbg !844
  %8 = load i32, i32* %i, align 4, !dbg !846
  %idxprom27 = sext i32 %8 to i64, !dbg !844
  %arrayidx28 = getelementptr inbounds i8*, i8** %7, i64 %idxprom27, !dbg !844
  %9 = load i8*, i8** %arrayidx28, align 8, !dbg !844
  %arrayidx29 = getelementptr inbounds i8, i8* %9, i64 1, !dbg !844
  %10 = load i8, i8* %arrayidx29, align 1, !dbg !844
  store i8 %10, i8* %flag, align 1, !dbg !847
  %11 = load i8, i8* %flag, align 1, !dbg !848
  %conv30 = sext i8 %11 to i32, !dbg !848
  switch i32 %conv30, label %sw.epilog [
    i32 115, label %sw.bb
    i32 102, label %sw.bb51
    i32 113, label %sw.bb58
  ], !dbg !849

sw.bb:                                            ; preds = %if.then26
  %12 = load i32, i32* %i, align 4, !dbg !850
  %inc = add nsw i32 %12, 1, !dbg !850
  store i32 %inc, i32* %i, align 4, !dbg !850
  %13 = load i8**, i8*** %argv.addr, align 8, !dbg !852
  %14 = load i32, i32* %i, align 4, !dbg !853
  %idxprom31 = sext i32 %14 to i64, !dbg !852
  %arrayidx32 = getelementptr inbounds i8*, i8** %13, i64 %idxprom31, !dbg !852
  %15 = load i8*, i8** %arrayidx32, align 8, !dbg !852
  %call33 = call i32 @atoi(i8* %15) #11, !dbg !854
  store i32 %call33, i32* @Size, align 4, !dbg !855
  %16 = load i32, i32* @Size, align 4, !dbg !856
  %call34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.21, i32 0, i32 0), i32 %16), !dbg !857
  %17 = load i32, i32* @Size, align 4, !dbg !858
  %18 = load i32, i32* @Size, align 4, !dbg !859
  %mul = mul nsw i32 %17, %18, !dbg !860
  %conv35 = sext i32 %mul to i64, !dbg !858
  %mul36 = mul i64 %conv35, 4, !dbg !861
  %call37 = call noalias i8* @malloc(i64 %mul36) #2, !dbg !862
  %19 = bitcast i8* %call37 to float*, !dbg !863
  store float* %19, float** @a, align 8, !dbg !864
  %20 = load float*, float** @a, align 8, !dbg !865
  %21 = load i32, i32* @Size, align 4, !dbg !866
  call void @_Z13create_matrixPfi(float* %20, i32 %21), !dbg !867
  %22 = load i32, i32* @Size, align 4, !dbg !868
  %conv38 = sext i32 %22 to i64, !dbg !868
  %mul39 = mul i64 %conv38, 4, !dbg !869
  %call40 = call noalias i8* @malloc(i64 %mul39) #2, !dbg !870
  %23 = bitcast i8* %call40 to float*, !dbg !871
  store float* %23, float** @b, align 8, !dbg !872
  store i32 0, i32* %j, align 4, !dbg !873
  br label %for.cond41, !dbg !875

for.cond41:                                       ; preds = %for.inc, %sw.bb
  %24 = load i32, i32* %j, align 4, !dbg !876
  %25 = load i32, i32* @Size, align 4, !dbg !879
  %cmp42 = icmp slt i32 %24, %25, !dbg !880
  br i1 %cmp42, label %for.body43, label %for.end, !dbg !881

for.body43:                                       ; preds = %for.cond41
  %26 = load float*, float** @b, align 8, !dbg !882
  %27 = load i32, i32* %j, align 4, !dbg !883
  %idxprom44 = sext i32 %27 to i64, !dbg !882
  %arrayidx45 = getelementptr inbounds float, float* %26, i64 %idxprom44, !dbg !882
  store float 1.000000e+00, float* %arrayidx45, align 4, !dbg !884
  br label %for.inc, !dbg !882

for.inc:                                          ; preds = %for.body43
  %28 = load i32, i32* %j, align 4, !dbg !885
  %inc46 = add nsw i32 %28, 1, !dbg !885
  store i32 %inc46, i32* %j, align 4, !dbg !885
  br label %for.cond41, !dbg !887, !llvm.loop !888

for.end:                                          ; preds = %for.cond41
  %29 = load i32, i32* @Size, align 4, !dbg !890
  %30 = load i32, i32* @Size, align 4, !dbg !891
  %mul47 = mul nsw i32 %29, %30, !dbg !892
  %conv48 = sext i32 %mul47 to i64, !dbg !890
  %mul49 = mul i64 %conv48, 4, !dbg !893
  %call50 = call noalias i8* @malloc(i64 %mul49) #2, !dbg !894
  %31 = bitcast i8* %call50 to float*, !dbg !895
  store float* %31, float** @m, align 8, !dbg !896
  br label %sw.epilog, !dbg !897

sw.bb51:                                          ; preds = %if.then26
  %32 = load i32, i32* %i, align 4, !dbg !898
  %inc52 = add nsw i32 %32, 1, !dbg !898
  store i32 %inc52, i32* %i, align 4, !dbg !898
  %33 = load i8**, i8*** %argv.addr, align 8, !dbg !899
  %34 = load i32, i32* %i, align 4, !dbg !900
  %idxprom53 = sext i32 %34 to i64, !dbg !899
  %arrayidx54 = getelementptr inbounds i8*, i8** %33, i64 %idxprom53, !dbg !899
  %35 = load i8*, i8** %arrayidx54, align 8, !dbg !899
  %call55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.22, i32 0, i32 0), i8* %35), !dbg !901
  %36 = load i8**, i8*** %argv.addr, align 8, !dbg !902
  %37 = load i32, i32* %i, align 4, !dbg !903
  %idxprom56 = sext i32 %37 to i64, !dbg !902
  %arrayidx57 = getelementptr inbounds i8*, i8** %36, i64 %idxprom56, !dbg !902
  %38 = load i8*, i8** %arrayidx57, align 8, !dbg !902
  call void @_Z15InitProblemOncePc(i8* %38), !dbg !904
  br label %sw.epilog, !dbg !905

sw.bb58:                                          ; preds = %if.then26
  store i32 0, i32* %verbose, align 4, !dbg !906
  br label %sw.epilog, !dbg !907

sw.epilog:                                        ; preds = %if.then26, %sw.bb58, %sw.bb51, %for.end
  br label %if.end59, !dbg !908

if.end59:                                         ; preds = %sw.epilog, %for.body
  br label %for.inc60, !dbg !909

for.inc60:                                        ; preds = %if.end59
  %39 = load i32, i32* %i, align 4, !dbg !910
  %inc61 = add nsw i32 %39, 1, !dbg !910
  store i32 %inc61, i32* %i, align 4, !dbg !910
  br label %for.cond, !dbg !912, !llvm.loop !913

for.end62:                                        ; preds = %for.cond
  call void @_Z10InitPerRunv(), !dbg !915
  call void @llvm.dbg.declare(metadata %struct.timeval* %time_start, metadata !916, metadata !675), !dbg !925
  %call63 = call i32 @gettimeofday(%struct.timeval* %time_start, %struct.timezone* null) #2, !dbg !926
  call void @_Z10ForwardSubv(), !dbg !927
  call void @llvm.dbg.declare(metadata %struct.timeval* %time_end, metadata !928, metadata !675), !dbg !929
  %call64 = call i32 @gettimeofday(%struct.timeval* %time_end, %struct.timezone* null) #2, !dbg !930
  call void @llvm.dbg.declare(metadata i32* %time_total, metadata !931, metadata !675), !dbg !932
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %time_end, i32 0, i32 0, !dbg !933
  %40 = load i64, i64* %tv_sec, align 8, !dbg !933
  %mul65 = mul nsw i64 %40, 1000000, !dbg !934
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %time_end, i32 0, i32 1, !dbg !935
  %41 = load i64, i64* %tv_usec, align 8, !dbg !935
  %add = add nsw i64 %mul65, %41, !dbg !936
  %tv_sec66 = getelementptr inbounds %struct.timeval, %struct.timeval* %time_start, i32 0, i32 0, !dbg !937
  %42 = load i64, i64* %tv_sec66, align 8, !dbg !937
  %mul67 = mul nsw i64 %42, 1000000, !dbg !938
  %tv_usec68 = getelementptr inbounds %struct.timeval, %struct.timeval* %time_start, i32 0, i32 1, !dbg !939
  %43 = load i64, i64* %tv_usec68, align 8, !dbg !939
  %add69 = add nsw i64 %mul67, %43, !dbg !940
  %sub = sub nsw i64 %add, %add69, !dbg !941
  %conv70 = trunc i64 %sub to i32, !dbg !942
  store i32 %conv70, i32* %time_total, align 4, !dbg !932
  %44 = load i32, i32* %verbose, align 4, !dbg !943
  %tobool = icmp ne i32 %44, 0, !dbg !943
  br i1 %tobool, label %if.then71, label %if.end75, !dbg !945

if.then71:                                        ; preds = %for.end62
  %call72 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.23, i32 0, i32 0)), !dbg !946
  %45 = load float*, float** @m, align 8, !dbg !948
  %46 = load i32, i32* @Size, align 4, !dbg !949
  %47 = load i32, i32* @Size, align 4, !dbg !950
  call void @_Z8PrintMatPfii(float* %45, i32 %46, i32 %47), !dbg !951
  %call73 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.24, i32 0, i32 0)), !dbg !952
  %48 = load float*, float** @a, align 8, !dbg !953
  %49 = load i32, i32* @Size, align 4, !dbg !954
  %50 = load i32, i32* @Size, align 4, !dbg !955
  call void @_Z8PrintMatPfii(float* %48, i32 %49, i32 %50), !dbg !956
  %call74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.25, i32 0, i32 0)), !dbg !957
  %51 = load float*, float** @b, align 8, !dbg !958
  %52 = load i32, i32* @Size, align 4, !dbg !959
  call void @_Z8PrintAryPfi(float* %51, i32 %52), !dbg !960
  br label %if.end75, !dbg !961

if.end75:                                         ; preds = %if.then71, %for.end62
  call void @_Z7BackSubv(), !dbg !962
  %53 = load i32, i32* %verbose, align 4, !dbg !963
  %tobool76 = icmp ne i32 %53, 0, !dbg !963
  br i1 %tobool76, label %if.then77, label %if.end79, !dbg !965

if.then77:                                        ; preds = %if.end75
  %call78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.26, i32 0, i32 0)), !dbg !966
  %54 = load float*, float** @finalVec, align 8, !dbg !968
  %55 = load i32, i32* @Size, align 4, !dbg !969
  call void @_Z8PrintAryPfi(float* %54, i32 %55), !dbg !970
  br label %if.end79, !dbg !971

if.end79:                                         ; preds = %if.then77, %if.end75
  %56 = load i32, i32* %time_total, align 4, !dbg !972
  %conv80 = uitofp i32 %56 to double, !dbg !972
  %mul81 = fmul double %conv80, 1.000000e-06, !dbg !973
  %call82 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.27, i32 0, i32 0), double %mul81), !dbg !974
  %57 = load i32, i32* @totalKernelTime, align 4, !dbg !975
  %conv83 = uitofp i32 %57 to double, !dbg !975
  %mul84 = fmul double %conv83, 1.000000e-06, !dbg !976
  %call85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.28, i32 0, i32 0), double %mul84), !dbg !977
  %58 = load float*, float** @m, align 8, !dbg !978
  %59 = bitcast float* %58 to i8*, !dbg !978
  call void @free(i8* %59) #2, !dbg !979
  %60 = load float*, float** @a, align 8, !dbg !980
  %61 = bitcast float* %60 to i8*, !dbg !980
  call void @free(i8* %61) #2, !dbg !981
  %62 = load float*, float** @b, align 8, !dbg !982
  %63 = bitcast float* %62 to i8*, !dbg !982
  call void @free(i8* %63) #2, !dbg !983
  %64 = load i32, i32* %retval, align 4, !dbg !984
  ret i32 %64, !dbg !984
}

declare i32 @printf(i8*, ...) #5

; Function Attrs: noreturn nounwind
declare void @exit(i32) #6

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #7

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: uwtable
define void @_Z15InitProblemOncePc(i8* %filename) #8 !dbg !985 {
entry:
  %filename.addr = alloca i8*, align 8
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !988, metadata !675), !dbg !989
  %0 = load i8*, i8** %filename.addr, align 8, !dbg !990
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.49, i32 0, i32 0)), !dbg !991
  store %struct._IO_FILE* %call, %struct._IO_FILE** @fp, align 8, !dbg !992
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !993
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.50, i32 0, i32 0), i32* @Size), !dbg !994
  %2 = load i32, i32* @Size, align 4, !dbg !995
  %3 = load i32, i32* @Size, align 4, !dbg !996
  %mul = mul nsw i32 %2, %3, !dbg !997
  %conv = sext i32 %mul to i64, !dbg !995
  %mul2 = mul i64 %conv, 4, !dbg !998
  %call3 = call noalias i8* @malloc(i64 %mul2) #2, !dbg !999
  %4 = bitcast i8* %call3 to float*, !dbg !1000
  store float* %4, float** @a, align 8, !dbg !1001
  %5 = load float*, float** @a, align 8, !dbg !1002
  %6 = load i32, i32* @Size, align 4, !dbg !1003
  %7 = load i32, i32* @Size, align 4, !dbg !1004
  call void @_Z7InitMatPfii(float* %5, i32 %6, i32 %7), !dbg !1005
  %8 = load i32, i32* @Size, align 4, !dbg !1006
  %conv4 = sext i32 %8 to i64, !dbg !1006
  %mul5 = mul i64 %conv4, 4, !dbg !1007
  %call6 = call noalias i8* @malloc(i64 %mul5) #2, !dbg !1008
  %9 = bitcast i8* %call6 to float*, !dbg !1009
  store float* %9, float** @b, align 8, !dbg !1010
  %10 = load float*, float** @b, align 8, !dbg !1011
  %11 = load i32, i32* @Size, align 4, !dbg !1012
  call void @_Z7InitAryPfi(float* %10, i32 %11), !dbg !1013
  %12 = load i32, i32* @Size, align 4, !dbg !1014
  %13 = load i32, i32* @Size, align 4, !dbg !1015
  %mul7 = mul nsw i32 %12, %13, !dbg !1016
  %conv8 = sext i32 %mul7 to i64, !dbg !1014
  %mul9 = mul i64 %conv8, 4, !dbg !1017
  %call10 = call noalias i8* @malloc(i64 %mul9) #2, !dbg !1018
  %14 = bitcast i8* %call10 to float*, !dbg !1019
  store float* %14, float** @m, align 8, !dbg !1020
  ret void, !dbg !1021
}

; Function Attrs: nounwind uwtable
define void @_Z10InitPerRunv() #0 !dbg !1022 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1023, metadata !675), !dbg !1024
  store i32 0, i32* %i, align 4, !dbg !1025
  br label %for.cond, !dbg !1027

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1028
  %1 = load i32, i32* @Size, align 4, !dbg !1031
  %2 = load i32, i32* @Size, align 4, !dbg !1032
  %mul = mul nsw i32 %1, %2, !dbg !1033
  %cmp = icmp slt i32 %0, %mul, !dbg !1034
  br i1 %cmp, label %for.body, label %for.end, !dbg !1035

for.body:                                         ; preds = %for.cond
  %3 = load float*, float** @m, align 8, !dbg !1036
  %4 = load i32, i32* %i, align 4, !dbg !1037
  %idx.ext = sext i32 %4 to i64, !dbg !1038
  %add.ptr = getelementptr inbounds float, float* %3, i64 %idx.ext, !dbg !1038
  store float 0.000000e+00, float* %add.ptr, align 4, !dbg !1039
  br label %for.inc, !dbg !1040

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !1041
  %inc = add nsw i32 %5, 1, !dbg !1041
  store i32 %inc, i32* %i, align 4, !dbg !1041
  br label %for.cond, !dbg !1043, !llvm.loop !1044

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1046
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #3

; Function Attrs: uwtable
define void @_Z10ForwardSubv() #8 !dbg !1047 {
entry:
  %t = alloca i32, align 4
  %m_cuda = alloca float*, align 8
  %a_cuda = alloca float*, align 8
  %b_cuda = alloca float*, align 8
  %block_size = alloca i32, align 4
  %grid_size = alloca i32, align 4
  %dimBlock = alloca %struct.dim3, align 4
  %dimGrid = alloca %struct.dim3, align 4
  %blockSize2d = alloca i32, align 4
  %gridSize2d = alloca i32, align 4
  %dimBlockXY = alloca %struct.dim3, align 4
  %dimGridXY = alloca %struct.dim3, align 4
  %time_start = alloca %struct.timeval, align 8
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp29 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp29.coerce = alloca { i64, i32 }, align 4
  %agg.tmp33 = alloca %struct.dim3, align 4
  %agg.tmp34 = alloca %struct.dim3, align 4
  %agg.tmp33.coerce = alloca { i64, i32 }, align 4
  %agg.tmp34.coerce = alloca { i64, i32 }, align 4
  %time_end = alloca %struct.timeval, align 8
  call void @llvm.dbg.declare(metadata i32* %t, metadata !1048, metadata !675), !dbg !1049
  call void @llvm.dbg.declare(metadata float** %m_cuda, metadata !1050, metadata !675), !dbg !1051
  call void @llvm.dbg.declare(metadata float** %a_cuda, metadata !1052, metadata !675), !dbg !1053
  call void @llvm.dbg.declare(metadata float** %b_cuda, metadata !1054, metadata !675), !dbg !1055
  %0 = bitcast float** %m_cuda to i8**, !dbg !1056
  %1 = load i32, i32* @Size, align 4, !dbg !1057
  %2 = load i32, i32* @Size, align 4, !dbg !1058
  %mul = mul nsw i32 %1, %2, !dbg !1059
  %conv = sext i32 %mul to i64, !dbg !1057
  %mul1 = mul i64 %conv, 4, !dbg !1060
  %call = call i32 @cudaMalloc(i8** %0, i64 %mul1), !dbg !1061
  %3 = bitcast float** %a_cuda to i8**, !dbg !1062
  %4 = load i32, i32* @Size, align 4, !dbg !1063
  %5 = load i32, i32* @Size, align 4, !dbg !1064
  %mul2 = mul nsw i32 %4, %5, !dbg !1065
  %conv3 = sext i32 %mul2 to i64, !dbg !1063
  %mul4 = mul i64 %conv3, 4, !dbg !1066
  %call5 = call i32 @cudaMalloc(i8** %3, i64 %mul4), !dbg !1067
  %6 = bitcast float** %b_cuda to i8**, !dbg !1068
  %7 = load i32, i32* @Size, align 4, !dbg !1069
  %conv6 = sext i32 %7 to i64, !dbg !1069
  %mul7 = mul i64 %conv6, 4, !dbg !1070
  %call8 = call i32 @cudaMalloc(i8** %6, i64 %mul7), !dbg !1071
  %8 = load float*, float** %m_cuda, align 8, !dbg !1072
  %9 = bitcast float* %8 to i8*, !dbg !1072
  %10 = load float*, float** @m, align 8, !dbg !1073
  %11 = bitcast float* %10 to i8*, !dbg !1073
  %12 = load i32, i32* @Size, align 4, !dbg !1074
  %13 = load i32, i32* @Size, align 4, !dbg !1075
  %mul9 = mul nsw i32 %12, %13, !dbg !1076
  %conv10 = sext i32 %mul9 to i64, !dbg !1074
  %mul11 = mul i64 %conv10, 4, !dbg !1077
  %call12 = call i32 @cudaMemcpy(i8* %9, i8* %11, i64 %mul11, i32 1), !dbg !1078
  %14 = load float*, float** %a_cuda, align 8, !dbg !1079
  %15 = bitcast float* %14 to i8*, !dbg !1079
  %16 = load float*, float** @a, align 8, !dbg !1080
  %17 = bitcast float* %16 to i8*, !dbg !1080
  %18 = load i32, i32* @Size, align 4, !dbg !1081
  %19 = load i32, i32* @Size, align 4, !dbg !1082
  %mul13 = mul nsw i32 %18, %19, !dbg !1083
  %conv14 = sext i32 %mul13 to i64, !dbg !1081
  %mul15 = mul i64 %conv14, 4, !dbg !1084
  %call16 = call i32 @cudaMemcpy(i8* %15, i8* %17, i64 %mul15, i32 1), !dbg !1085
  %20 = load float*, float** %b_cuda, align 8, !dbg !1086
  %21 = bitcast float* %20 to i8*, !dbg !1086
  %22 = load float*, float** @b, align 8, !dbg !1087
  %23 = bitcast float* %22 to i8*, !dbg !1087
  %24 = load i32, i32* @Size, align 4, !dbg !1088
  %conv17 = sext i32 %24 to i64, !dbg !1088
  %mul18 = mul i64 %conv17, 4, !dbg !1089
  %call19 = call i32 @cudaMemcpy(i8* %21, i8* %23, i64 %mul18, i32 1), !dbg !1090
  call void @llvm.dbg.declare(metadata i32* %block_size, metadata !1091, metadata !675), !dbg !1092
  call void @llvm.dbg.declare(metadata i32* %grid_size, metadata !1093, metadata !675), !dbg !1094
  store i32 512, i32* %block_size, align 4, !dbg !1095
  %25 = load i32, i32* @Size, align 4, !dbg !1096
  %26 = load i32, i32* %block_size, align 4, !dbg !1097
  %div = sdiv i32 %25, %26, !dbg !1098
  %27 = load i32, i32* @Size, align 4, !dbg !1099
  %28 = load i32, i32* %block_size, align 4, !dbg !1100
  %rem = srem i32 %27, %28, !dbg !1101
  %tobool = icmp ne i32 %rem, 0, !dbg !1102
  %lnot = xor i1 %tobool, true, !dbg !1103
  %cond = select i1 %lnot, i32 0, i32 1, !dbg !1103
  %add = add nsw i32 %div, %cond, !dbg !1104
  store i32 %add, i32* %grid_size, align 4, !dbg !1105
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimBlock, metadata !1106, metadata !675), !dbg !1130
  %29 = load i32, i32* %block_size, align 4, !dbg !1131
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimBlock, i32 %29, i32 1, i32 1), !dbg !1130
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimGrid, metadata !1132, metadata !675), !dbg !1133
  %30 = load i32, i32* %grid_size, align 4, !dbg !1134
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimGrid, i32 %30, i32 1, i32 1), !dbg !1133
  call void @llvm.dbg.declare(metadata i32* %blockSize2d, metadata !1135, metadata !675), !dbg !1136
  call void @llvm.dbg.declare(metadata i32* %gridSize2d, metadata !1137, metadata !675), !dbg !1138
  store i32 4, i32* %blockSize2d, align 4, !dbg !1139
  %31 = load i32, i32* @Size, align 4, !dbg !1140
  %32 = load i32, i32* %blockSize2d, align 4, !dbg !1141
  %div20 = sdiv i32 %31, %32, !dbg !1142
  %33 = load i32, i32* @Size, align 4, !dbg !1143
  %34 = load i32, i32* %blockSize2d, align 4, !dbg !1144
  %rem21 = srem i32 %33, %34, !dbg !1145
  %tobool22 = icmp ne i32 %rem21, 0, !dbg !1143
  %cond23 = select i1 %tobool22, i32 0, i32 1, !dbg !1143
  %tobool24 = icmp ne i32 %cond23, 0, !dbg !1146
  %lnot25 = xor i1 %tobool24, true, !dbg !1147
  %conv26 = zext i1 %lnot25 to i32, !dbg !1148
  %add27 = add nsw i32 %div20, %conv26, !dbg !1149
  store i32 %add27, i32* %gridSize2d, align 4, !dbg !1150
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimBlockXY, metadata !1151, metadata !675), !dbg !1152
  %35 = load i32, i32* %blockSize2d, align 4, !dbg !1153
  %36 = load i32, i32* %blockSize2d, align 4, !dbg !1154
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimBlockXY, i32 %35, i32 %36, i32 1), !dbg !1152
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimGridXY, metadata !1155, metadata !675), !dbg !1156
  %37 = load i32, i32* %gridSize2d, align 4, !dbg !1157
  %38 = load i32, i32* %gridSize2d, align 4, !dbg !1158
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimGridXY, i32 %37, i32 %38, i32 1), !dbg !1156
  call void @llvm.dbg.declare(metadata %struct.timeval* %time_start, metadata !1159, metadata !675), !dbg !1160
  %call28 = call i32 @gettimeofday(%struct.timeval* %time_start, %struct.timezone* null) #2, !dbg !1161
  store i32 0, i32* %t, align 4, !dbg !1162
  br label %for.cond, !dbg !1164

for.cond:                                         ; preds = %for.inc, %entry
  %39 = load i32, i32* %t, align 4, !dbg !1165
  %40 = load i32, i32* @Size, align 4, !dbg !1168
  %sub = sub nsw i32 %40, 1, !dbg !1169
  %cmp = icmp slt i32 %39, %sub, !dbg !1170
  br i1 %cmp, label %for.body, label %for.end, !dbg !1171

for.body:                                         ; preds = %for.cond
  %41 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1172
  %42 = bitcast %struct.dim3* %dimGrid to i8*, !dbg !1172
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* %42, i64 12, i32 4, i1 false), !dbg !1172
  %43 = bitcast %struct.dim3* %agg.tmp29 to i8*, !dbg !1174
  %44 = bitcast %struct.dim3* %dimBlock to i8*, !dbg !1174
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* %44, i64 12, i32 4, i1 false), !dbg !1174
  %45 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1175
  %46 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1175
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* %46, i64 12, i32 4, i1 false), !dbg !1175
  %47 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !1175
  %48 = load i64, i64* %47, align 4, !dbg !1175
  %49 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !1175
  %50 = load i32, i32* %49, align 4, !dbg !1175
  %51 = bitcast { i64, i32 }* %agg.tmp29.coerce to i8*, !dbg !1175
  %52 = bitcast %struct.dim3* %agg.tmp29 to i8*, !dbg !1175
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %51, i8* %52, i64 12, i32 4, i1 false), !dbg !1175
  %53 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp29.coerce, i32 0, i32 0, !dbg !1175
  %54 = load i64, i64* %53, align 4, !dbg !1175
  %55 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp29.coerce, i32 0, i32 1, !dbg !1175
  %56 = load i32, i32* %55, align 4, !dbg !1175
  %call30 = call i32 @cudaConfigureCall(i64 %48, i32 %50, i64 %54, i32 %56, i64 0, %struct.CUstream_st* null), !dbg !1175
  %tobool31 = icmp ne i32 %call30, 0, !dbg !1175
  br i1 %tobool31, label %kcall.end, label %kcall.configok, !dbg !1176

kcall.configok:                                   ; preds = %for.body
  %57 = load float*, float** %m_cuda, align 8, !dbg !1177
  %58 = load float*, float** %a_cuda, align 8, !dbg !1179
  %59 = load i32, i32* @Size, align 4, !dbg !1180
  %60 = load i32, i32* %t, align 4, !dbg !1181
  call void @_Z4Fan1PfS_ii(float* %57, float* %58, i32 %59, i32 %60), !dbg !1182
  br label %kcall.end, !dbg !1182

kcall.end:                                        ; preds = %kcall.configok, %for.body
  %call32 = call i32 @cudaThreadSynchronize(), !dbg !1183
  %61 = bitcast %struct.dim3* %agg.tmp33 to i8*, !dbg !1184
  %62 = bitcast %struct.dim3* %dimGridXY to i8*, !dbg !1184
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %61, i8* %62, i64 12, i32 4, i1 false), !dbg !1184
  %63 = bitcast %struct.dim3* %agg.tmp34 to i8*, !dbg !1185
  %64 = bitcast %struct.dim3* %dimBlockXY to i8*, !dbg !1185
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %63, i8* %64, i64 12, i32 4, i1 false), !dbg !1185
  %65 = bitcast { i64, i32 }* %agg.tmp33.coerce to i8*, !dbg !1186
  %66 = bitcast %struct.dim3* %agg.tmp33 to i8*, !dbg !1186
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %65, i8* %66, i64 12, i32 4, i1 false), !dbg !1186
  %67 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp33.coerce, i32 0, i32 0, !dbg !1186
  %68 = load i64, i64* %67, align 4, !dbg !1186
  %69 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp33.coerce, i32 0, i32 1, !dbg !1186
  %70 = load i32, i32* %69, align 4, !dbg !1186
  %71 = bitcast { i64, i32 }* %agg.tmp34.coerce to i8*, !dbg !1186
  %72 = bitcast %struct.dim3* %agg.tmp34 to i8*, !dbg !1186
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %71, i8* %72, i64 12, i32 4, i1 false), !dbg !1186
  %73 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp34.coerce, i32 0, i32 0, !dbg !1186
  %74 = load i64, i64* %73, align 4, !dbg !1186
  %75 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp34.coerce, i32 0, i32 1, !dbg !1186
  %76 = load i32, i32* %75, align 4, !dbg !1186
  %call35 = call i32 @cudaConfigureCall(i64 %68, i32 %70, i64 %74, i32 %76, i64 0, %struct.CUstream_st* null), !dbg !1186
  %tobool36 = icmp ne i32 %call35, 0, !dbg !1186
  br i1 %tobool36, label %kcall.end39, label %kcall.configok37, !dbg !1187

kcall.configok37:                                 ; preds = %kcall.end
  %77 = load float*, float** %m_cuda, align 8, !dbg !1188
  %78 = load float*, float** %a_cuda, align 8, !dbg !1189
  %79 = load float*, float** %b_cuda, align 8, !dbg !1190
  %80 = load i32, i32* @Size, align 4, !dbg !1191
  %81 = load i32, i32* @Size, align 4, !dbg !1192
  %82 = load i32, i32* %t, align 4, !dbg !1193
  %sub38 = sub nsw i32 %81, %82, !dbg !1194
  %83 = load i32, i32* %t, align 4, !dbg !1195
  call void @_Z4Fan2PfS_S_iii(float* %77, float* %78, float* %79, i32 %80, i32 %sub38, i32 %83), !dbg !1196
  br label %kcall.end39, !dbg !1196

kcall.end39:                                      ; preds = %kcall.configok37, %kcall.end
  %call40 = call i32 @cudaThreadSynchronize(), !dbg !1197
  call void @_Z14checkCUDAErrorPKc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0)), !dbg !1198
  br label %for.inc, !dbg !1199

for.inc:                                          ; preds = %kcall.end39
  %84 = load i32, i32* %t, align 4, !dbg !1200
  %inc = add nsw i32 %84, 1, !dbg !1200
  store i32 %inc, i32* %t, align 4, !dbg !1200
  br label %for.cond, !dbg !1202, !llvm.loop !1203

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.timeval* %time_end, metadata !1205, metadata !675), !dbg !1206
  %call41 = call i32 @gettimeofday(%struct.timeval* %time_end, %struct.timezone* null) #2, !dbg !1207
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %time_end, i32 0, i32 0, !dbg !1208
  %85 = load i64, i64* %tv_sec, align 8, !dbg !1208
  %mul42 = mul nsw i64 %85, 1000000, !dbg !1209
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %time_end, i32 0, i32 1, !dbg !1210
  %86 = load i64, i64* %tv_usec, align 8, !dbg !1210
  %add43 = add nsw i64 %mul42, %86, !dbg !1211
  %tv_sec44 = getelementptr inbounds %struct.timeval, %struct.timeval* %time_start, i32 0, i32 0, !dbg !1212
  %87 = load i64, i64* %tv_sec44, align 8, !dbg !1212
  %mul45 = mul nsw i64 %87, 1000000, !dbg !1213
  %tv_usec46 = getelementptr inbounds %struct.timeval, %struct.timeval* %time_start, i32 0, i32 1, !dbg !1214
  %88 = load i64, i64* %tv_usec46, align 8, !dbg !1214
  %add47 = add nsw i64 %mul45, %88, !dbg !1215
  %sub48 = sub nsw i64 %add43, %add47, !dbg !1216
  %conv49 = trunc i64 %sub48 to i32, !dbg !1217
  store i32 %conv49, i32* @totalKernelTime, align 4, !dbg !1218
  %89 = load float*, float** @m, align 8, !dbg !1219
  %90 = bitcast float* %89 to i8*, !dbg !1219
  %91 = load float*, float** %m_cuda, align 8, !dbg !1220
  %92 = bitcast float* %91 to i8*, !dbg !1220
  %93 = load i32, i32* @Size, align 4, !dbg !1221
  %94 = load i32, i32* @Size, align 4, !dbg !1222
  %mul50 = mul nsw i32 %93, %94, !dbg !1223
  %conv51 = sext i32 %mul50 to i64, !dbg !1221
  %mul52 = mul i64 %conv51, 4, !dbg !1224
  %call53 = call i32 @cudaMemcpy(i8* %90, i8* %92, i64 %mul52, i32 2), !dbg !1225
  %95 = load float*, float** @a, align 8, !dbg !1226
  %96 = bitcast float* %95 to i8*, !dbg !1226
  %97 = load float*, float** %a_cuda, align 8, !dbg !1227
  %98 = bitcast float* %97 to i8*, !dbg !1227
  %99 = load i32, i32* @Size, align 4, !dbg !1228
  %100 = load i32, i32* @Size, align 4, !dbg !1229
  %mul54 = mul nsw i32 %99, %100, !dbg !1230
  %conv55 = sext i32 %mul54 to i64, !dbg !1228
  %mul56 = mul i64 %conv55, 4, !dbg !1231
  %call57 = call i32 @cudaMemcpy(i8* %96, i8* %98, i64 %mul56, i32 2), !dbg !1232
  %101 = load float*, float** @b, align 8, !dbg !1233
  %102 = bitcast float* %101 to i8*, !dbg !1233
  %103 = load float*, float** %b_cuda, align 8, !dbg !1234
  %104 = bitcast float* %103 to i8*, !dbg !1234
  %105 = load i32, i32* @Size, align 4, !dbg !1235
  %conv58 = sext i32 %105 to i64, !dbg !1235
  %mul59 = mul i64 %conv58, 4, !dbg !1236
  %call60 = call i32 @cudaMemcpy(i8* %102, i8* %104, i64 %mul59, i32 2), !dbg !1237
  %106 = load float*, float** %m_cuda, align 8, !dbg !1238
  %107 = bitcast float* %106 to i8*, !dbg !1238
  %call61 = call i32 @cudaFree(i8* %107), !dbg !1239
  %108 = load float*, float** %a_cuda, align 8, !dbg !1240
  %109 = bitcast float* %108 to i8*, !dbg !1240
  %call62 = call i32 @cudaFree(i8* %109), !dbg !1241
  %110 = load float*, float** %b_cuda, align 8, !dbg !1242
  %111 = bitcast float* %110 to i8*, !dbg !1242
  %call63 = call i32 @cudaFree(i8* %111), !dbg !1243
  ret void, !dbg !1244
}

; Function Attrs: uwtable
define void @_Z8PrintMatPfii(float* %ary, i32 %nrow, i32 %ncol) #8 !dbg !1245 {
entry:
  %ary.addr = alloca float*, align 8
  %nrow.addr = alloca i32, align 4
  %ncol.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store float* %ary, float** %ary.addr, align 8
  call void @llvm.dbg.declare(metadata float** %ary.addr, metadata !1248, metadata !675), !dbg !1249
  store i32 %nrow, i32* %nrow.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nrow.addr, metadata !1250, metadata !675), !dbg !1251
  store i32 %ncol, i32* %ncol.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ncol.addr, metadata !1252, metadata !675), !dbg !1253
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1254, metadata !675), !dbg !1255
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1256, metadata !675), !dbg !1257
  store i32 0, i32* %i, align 4, !dbg !1258
  br label %for.cond, !dbg !1260

for.cond:                                         ; preds = %for.inc7, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1261
  %1 = load i32, i32* %nrow.addr, align 4, !dbg !1264
  %cmp = icmp slt i32 %0, %1, !dbg !1265
  br i1 %cmp, label %for.body, label %for.end9, !dbg !1266

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !1267
  br label %for.cond1, !dbg !1270

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !1271
  %3 = load i32, i32* %ncol.addr, align 4, !dbg !1274
  %cmp2 = icmp slt i32 %2, %3, !dbg !1275
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1276

for.body3:                                        ; preds = %for.cond1
  %4 = load float*, float** %ary.addr, align 8, !dbg !1277
  %5 = load i32, i32* @Size, align 4, !dbg !1279
  %6 = load i32, i32* %i, align 4, !dbg !1280
  %mul = mul nsw i32 %5, %6, !dbg !1281
  %idx.ext = sext i32 %mul to i64, !dbg !1282
  %add.ptr = getelementptr inbounds float, float* %4, i64 %idx.ext, !dbg !1282
  %7 = load i32, i32* %j, align 4, !dbg !1283
  %idx.ext4 = sext i32 %7 to i64, !dbg !1284
  %add.ptr5 = getelementptr inbounds float, float* %add.ptr, i64 %idx.ext4, !dbg !1284
  %8 = load float, float* %add.ptr5, align 4, !dbg !1285
  %conv = fpext float %8 to double, !dbg !1285
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.53, i32 0, i32 0), double %conv), !dbg !1286
  br label %for.inc, !dbg !1287

for.inc:                                          ; preds = %for.body3
  %9 = load i32, i32* %j, align 4, !dbg !1288
  %inc = add nsw i32 %9, 1, !dbg !1288
  store i32 %inc, i32* %j, align 4, !dbg !1288
  br label %for.cond1, !dbg !1290, !llvm.loop !1291

for.end:                                          ; preds = %for.cond1
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i32 0, i32 0)), !dbg !1293
  br label %for.inc7, !dbg !1294

for.inc7:                                         ; preds = %for.end
  %10 = load i32, i32* %i, align 4, !dbg !1295
  %inc8 = add nsw i32 %10, 1, !dbg !1295
  store i32 %inc8, i32* %i, align 4, !dbg !1295
  br label %for.cond, !dbg !1297, !llvm.loop !1298

for.end9:                                         ; preds = %for.cond
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i32 0, i32 0)), !dbg !1300
  ret void, !dbg !1301
}

; Function Attrs: uwtable
define void @_Z8PrintAryPfi(float* %ary, i32 %ary_size) #8 !dbg !1302 {
entry:
  %ary.addr = alloca float*, align 8
  %ary_size.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store float* %ary, float** %ary.addr, align 8
  call void @llvm.dbg.declare(metadata float** %ary.addr, metadata !1303, metadata !675), !dbg !1304
  store i32 %ary_size, i32* %ary_size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ary_size.addr, metadata !1305, metadata !675), !dbg !1306
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1307, metadata !675), !dbg !1308
  store i32 0, i32* %i, align 4, !dbg !1309
  br label %for.cond, !dbg !1311

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1312
  %1 = load i32, i32* %ary_size.addr, align 4, !dbg !1315
  %cmp = icmp slt i32 %0, %1, !dbg !1316
  br i1 %cmp, label %for.body, label %for.end, !dbg !1317

for.body:                                         ; preds = %for.cond
  %2 = load float*, float** %ary.addr, align 8, !dbg !1318
  %3 = load i32, i32* %i, align 4, !dbg !1320
  %idxprom = sext i32 %3 to i64, !dbg !1318
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom, !dbg !1318
  %4 = load float, float* %arrayidx, align 4, !dbg !1318
  %conv = fpext float %4 to double, !dbg !1318
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.54, i32 0, i32 0), double %conv), !dbg !1321
  br label %for.inc, !dbg !1322

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !1323
  %inc = add nsw i32 %5, 1, !dbg !1323
  store i32 %inc, i32* %i, align 4, !dbg !1323
  br label %for.cond, !dbg !1325, !llvm.loop !1326

for.end:                                          ; preds = %for.cond
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0)), !dbg !1328
  ret void, !dbg !1329
}

; Function Attrs: nounwind uwtable
define void @_Z7BackSubv() #0 !dbg !1330 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %0 = load i32, i32* @Size, align 4, !dbg !1331
  %conv = sext i32 %0 to i64, !dbg !1331
  %mul = mul i64 %conv, 4, !dbg !1332
  %call = call noalias i8* @malloc(i64 %mul) #2, !dbg !1333
  %1 = bitcast i8* %call to float*, !dbg !1334
  store float* %1, float** @finalVec, align 8, !dbg !1335
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1336, metadata !675), !dbg !1337
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1338, metadata !675), !dbg !1339
  store i32 0, i32* %i, align 4, !dbg !1340
  br label %for.cond, !dbg !1342

for.cond:                                         ; preds = %for.inc43, %entry
  %2 = load i32, i32* %i, align 4, !dbg !1343
  %3 = load i32, i32* @Size, align 4, !dbg !1346
  %cmp = icmp slt i32 %2, %3, !dbg !1347
  br i1 %cmp, label %for.body, label %for.end45, !dbg !1348

for.body:                                         ; preds = %for.cond
  %4 = load float*, float** @b, align 8, !dbg !1349
  %5 = load i32, i32* @Size, align 4, !dbg !1351
  %6 = load i32, i32* %i, align 4, !dbg !1352
  %sub = sub nsw i32 %5, %6, !dbg !1353
  %sub1 = sub nsw i32 %sub, 1, !dbg !1354
  %idxprom = sext i32 %sub1 to i64, !dbg !1349
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom, !dbg !1349
  %7 = load float, float* %arrayidx, align 4, !dbg !1349
  %8 = load float*, float** @finalVec, align 8, !dbg !1355
  %9 = load i32, i32* @Size, align 4, !dbg !1356
  %10 = load i32, i32* %i, align 4, !dbg !1357
  %sub2 = sub nsw i32 %9, %10, !dbg !1358
  %sub3 = sub nsw i32 %sub2, 1, !dbg !1359
  %idxprom4 = sext i32 %sub3 to i64, !dbg !1355
  %arrayidx5 = getelementptr inbounds float, float* %8, i64 %idxprom4, !dbg !1355
  store float %7, float* %arrayidx5, align 4, !dbg !1360
  store i32 0, i32* %j, align 4, !dbg !1361
  br label %for.cond6, !dbg !1363

for.cond6:                                        ; preds = %for.inc, %for.body
  %11 = load i32, i32* %j, align 4, !dbg !1364
  %12 = load i32, i32* %i, align 4, !dbg !1367
  %cmp7 = icmp slt i32 %11, %12, !dbg !1368
  br i1 %cmp7, label %for.body8, label %for.end, !dbg !1369

for.body8:                                        ; preds = %for.cond6
  %13 = load float*, float** @a, align 8, !dbg !1370
  %14 = load i32, i32* @Size, align 4, !dbg !1372
  %15 = load i32, i32* @Size, align 4, !dbg !1373
  %16 = load i32, i32* %i, align 4, !dbg !1374
  %sub9 = sub nsw i32 %15, %16, !dbg !1375
  %sub10 = sub nsw i32 %sub9, 1, !dbg !1376
  %mul11 = mul nsw i32 %14, %sub10, !dbg !1377
  %idx.ext = sext i32 %mul11 to i64, !dbg !1378
  %add.ptr = getelementptr inbounds float, float* %13, i64 %idx.ext, !dbg !1378
  %17 = load i32, i32* @Size, align 4, !dbg !1379
  %18 = load i32, i32* %j, align 4, !dbg !1380
  %sub12 = sub nsw i32 %17, %18, !dbg !1381
  %sub13 = sub nsw i32 %sub12, 1, !dbg !1382
  %idx.ext14 = sext i32 %sub13 to i64, !dbg !1383
  %add.ptr15 = getelementptr inbounds float, float* %add.ptr, i64 %idx.ext14, !dbg !1383
  %19 = load float, float* %add.ptr15, align 4, !dbg !1384
  %20 = load float*, float** @finalVec, align 8, !dbg !1385
  %21 = load i32, i32* @Size, align 4, !dbg !1386
  %22 = load i32, i32* %j, align 4, !dbg !1387
  %sub16 = sub nsw i32 %21, %22, !dbg !1388
  %sub17 = sub nsw i32 %sub16, 1, !dbg !1389
  %idxprom18 = sext i32 %sub17 to i64, !dbg !1385
  %arrayidx19 = getelementptr inbounds float, float* %20, i64 %idxprom18, !dbg !1385
  %23 = load float, float* %arrayidx19, align 4, !dbg !1385
  %mul20 = fmul float %19, %23, !dbg !1390
  %24 = load float*, float** @finalVec, align 8, !dbg !1391
  %25 = load i32, i32* @Size, align 4, !dbg !1392
  %26 = load i32, i32* %i, align 4, !dbg !1393
  %sub21 = sub nsw i32 %25, %26, !dbg !1394
  %sub22 = sub nsw i32 %sub21, 1, !dbg !1395
  %idxprom23 = sext i32 %sub22 to i64, !dbg !1391
  %arrayidx24 = getelementptr inbounds float, float* %24, i64 %idxprom23, !dbg !1391
  %27 = load float, float* %arrayidx24, align 4, !dbg !1396
  %sub25 = fsub float %27, %mul20, !dbg !1396
  store float %sub25, float* %arrayidx24, align 4, !dbg !1396
  br label %for.inc, !dbg !1397

for.inc:                                          ; preds = %for.body8
  %28 = load i32, i32* %j, align 4, !dbg !1398
  %inc = add nsw i32 %28, 1, !dbg !1398
  store i32 %inc, i32* %j, align 4, !dbg !1398
  br label %for.cond6, !dbg !1400, !llvm.loop !1401

for.end:                                          ; preds = %for.cond6
  %29 = load float*, float** @finalVec, align 8, !dbg !1403
  %30 = load i32, i32* @Size, align 4, !dbg !1404
  %31 = load i32, i32* %i, align 4, !dbg !1405
  %sub26 = sub nsw i32 %30, %31, !dbg !1406
  %sub27 = sub nsw i32 %sub26, 1, !dbg !1407
  %idxprom28 = sext i32 %sub27 to i64, !dbg !1403
  %arrayidx29 = getelementptr inbounds float, float* %29, i64 %idxprom28, !dbg !1403
  %32 = load float, float* %arrayidx29, align 4, !dbg !1403
  %33 = load float*, float** @a, align 8, !dbg !1408
  %34 = load i32, i32* @Size, align 4, !dbg !1409
  %35 = load i32, i32* @Size, align 4, !dbg !1410
  %36 = load i32, i32* %i, align 4, !dbg !1411
  %sub30 = sub nsw i32 %35, %36, !dbg !1412
  %sub31 = sub nsw i32 %sub30, 1, !dbg !1413
  %mul32 = mul nsw i32 %34, %sub31, !dbg !1414
  %idx.ext33 = sext i32 %mul32 to i64, !dbg !1415
  %add.ptr34 = getelementptr inbounds float, float* %33, i64 %idx.ext33, !dbg !1415
  %37 = load i32, i32* @Size, align 4, !dbg !1416
  %38 = load i32, i32* %i, align 4, !dbg !1417
  %sub35 = sub nsw i32 %37, %38, !dbg !1418
  %sub36 = sub nsw i32 %sub35, 1, !dbg !1419
  %idx.ext37 = sext i32 %sub36 to i64, !dbg !1420
  %add.ptr38 = getelementptr inbounds float, float* %add.ptr34, i64 %idx.ext37, !dbg !1420
  %39 = load float, float* %add.ptr38, align 4, !dbg !1421
  %div = fdiv float %32, %39, !dbg !1422
  %40 = load float*, float** @finalVec, align 8, !dbg !1423
  %41 = load i32, i32* @Size, align 4, !dbg !1424
  %42 = load i32, i32* %i, align 4, !dbg !1425
  %sub39 = sub nsw i32 %41, %42, !dbg !1426
  %sub40 = sub nsw i32 %sub39, 1, !dbg !1427
  %idxprom41 = sext i32 %sub40 to i64, !dbg !1423
  %arrayidx42 = getelementptr inbounds float, float* %40, i64 %idxprom41, !dbg !1423
  store float %div, float* %arrayidx42, align 4, !dbg !1428
  br label %for.inc43, !dbg !1429

for.inc43:                                        ; preds = %for.end
  %43 = load i32, i32* %i, align 4, !dbg !1430
  %inc44 = add nsw i32 %43, 1, !dbg !1430
  store i32 %inc44, i32* %i, align 4, !dbg !1430
  br label %for.cond, !dbg !1432, !llvm.loop !1433

for.end45:                                        ; preds = %for.cond
  ret void, !dbg !1435
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: uwtable
define void @_Z21PrintDevicePropertiesv() #8 !dbg !1436 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %nDevCount = alloca i32, align 4
  %nDeviceIdx = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.cudaDeviceProp* %deviceProp, metadata !1437, metadata !675), !dbg !1515
  call void @llvm.dbg.declare(metadata i32* %nDevCount, metadata !1516, metadata !675), !dbg !1517
  store i32 0, i32* %nDevCount, align 4, !dbg !1517
  %call = call i32 @cudaGetDeviceCount(i32* %nDevCount), !dbg !1518
  %0 = load i32, i32* %nDevCount, align 4, !dbg !1519
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.29, i32 0, i32 0), i32 %0), !dbg !1520
  call void @llvm.dbg.declare(metadata i32* %nDeviceIdx, metadata !1521, metadata !675), !dbg !1523
  store i32 0, i32* %nDeviceIdx, align 4, !dbg !1523
  br label %for.cond, !dbg !1524

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %nDeviceIdx, align 4, !dbg !1525
  %2 = load i32, i32* %nDevCount, align 4, !dbg !1528
  %cmp = icmp slt i32 %1, %2, !dbg !1529
  br i1 %cmp, label %for.body, label %for.end, !dbg !1530

for.body:                                         ; preds = %for.cond
  %3 = bitcast %struct.cudaDeviceProp* %deviceProp to i8*, !dbg !1531
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 648, i32 8, i1 false), !dbg !1531
  %4 = load i32, i32* %nDeviceIdx, align 4, !dbg !1533
  %call2 = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* %deviceProp, i32 %4), !dbg !1535
  %cmp3 = icmp eq i32 0, %call2, !dbg !1536
  br i1 %cmp3, label %if.then, label %if.else, !dbg !1537

if.then:                                          ; preds = %for.body
  %name = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 0, !dbg !1538
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %name, i32 0, i32 0, !dbg !1540
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.30, i32 0, i32 0), i8* %arraydecay), !dbg !1541
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.31, i32 0, i32 0)), !dbg !1542
  %totalGlobalMem = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 1, !dbg !1543
  %5 = load i64, i64* %totalGlobalMem, align 8, !dbg !1543
  %div = udiv i64 %5, 1024, !dbg !1544
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.32, i32 0, i32 0), i64 %div), !dbg !1545
  %sharedMemPerBlock = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 2, !dbg !1546
  %6 = load i64, i64* %sharedMemPerBlock, align 8, !dbg !1546
  %div7 = udiv i64 %6, 1024, !dbg !1547
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.33, i32 0, i32 0), i64 %div7), !dbg !1548
  %regsPerBlock = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 3, !dbg !1549
  %7 = load i32, i32* %regsPerBlock, align 8, !dbg !1549
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.34, i32 0, i32 0), i32 %7), !dbg !1550
  %warpSize = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 4, !dbg !1551
  %8 = load i32, i32* %warpSize, align 4, !dbg !1551
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.35, i32 0, i32 0), i32 %8), !dbg !1552
  %memPitch = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 5, !dbg !1553
  %9 = load i64, i64* %memPitch, align 8, !dbg !1553
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.36, i32 0, i32 0), i64 %9), !dbg !1554
  %maxThreadsPerBlock = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 6, !dbg !1555
  %10 = load i32, i32* %maxThreadsPerBlock, align 8, !dbg !1555
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.37, i32 0, i32 0), i32 %10), !dbg !1556
  %maxThreadsDim = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 7, !dbg !1557
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %maxThreadsDim, i64 0, i64 0, !dbg !1558
  %11 = load i32, i32* %arrayidx, align 4, !dbg !1558
  %maxThreadsDim13 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 7, !dbg !1559
  %arrayidx14 = getelementptr inbounds [3 x i32], [3 x i32]* %maxThreadsDim13, i64 0, i64 1, !dbg !1560
  %12 = load i32, i32* %arrayidx14, align 4, !dbg !1560
  %maxThreadsDim15 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 7, !dbg !1561
  %arrayidx16 = getelementptr inbounds [3 x i32], [3 x i32]* %maxThreadsDim15, i64 0, i64 2, !dbg !1562
  %13 = load i32, i32* %arrayidx16, align 4, !dbg !1562
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.38, i32 0, i32 0), i32 %11, i32 %12, i32 %13), !dbg !1563
  %maxGridSize = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 8, !dbg !1564
  %arrayidx18 = getelementptr inbounds [3 x i32], [3 x i32]* %maxGridSize, i64 0, i64 0, !dbg !1565
  %14 = load i32, i32* %arrayidx18, align 8, !dbg !1565
  %maxGridSize19 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 8, !dbg !1566
  %arrayidx20 = getelementptr inbounds [3 x i32], [3 x i32]* %maxGridSize19, i64 0, i64 1, !dbg !1567
  %15 = load i32, i32* %arrayidx20, align 4, !dbg !1567
  %maxGridSize21 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 8, !dbg !1568
  %arrayidx22 = getelementptr inbounds [3 x i32], [3 x i32]* %maxGridSize21, i64 0, i64 2, !dbg !1569
  %16 = load i32, i32* %arrayidx22, align 8, !dbg !1569
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.39, i32 0, i32 0), i32 %14, i32 %15, i32 %16), !dbg !1570
  %totalConstMem = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 10, !dbg !1571
  %17 = load i64, i64* %totalConstMem, align 8, !dbg !1571
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.40, i32 0, i32 0), i64 %17), !dbg !1572
  %major = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 11, !dbg !1573
  %18 = load i32, i32* %major, align 8, !dbg !1573
  %minor = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 12, !dbg !1574
  %19 = load i32, i32* %minor, align 4, !dbg !1574
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.41, i32 0, i32 0), i32 %18, i32 %19), !dbg !1575
  %clockRate = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 9, !dbg !1576
  %20 = load i32, i32* %clockRate, align 4, !dbg !1576
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.42, i32 0, i32 0), i32 %20), !dbg !1577
  %textureAlignment = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 13, !dbg !1578
  %21 = load i64, i64* %textureAlignment, align 8, !dbg !1578
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.43, i32 0, i32 0), i64 %21), !dbg !1579
  %deviceOverlap = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 15, !dbg !1580
  %22 = load i32, i32* %deviceOverlap, align 8, !dbg !1580
  %tobool = icmp ne i32 %22, 0, !dbg !1581
  %cond = select i1 %tobool, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.45, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.46, i32 0, i32 0), !dbg !1581
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.44, i32 0, i32 0), i8* %cond), !dbg !1582
  %multiProcessorCount = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 16, !dbg !1583
  %23 = load i32, i32* %multiProcessorCount, align 4, !dbg !1583
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.47, i32 0, i32 0), i32 %23), !dbg !1584
  br label %if.end, !dbg !1585

if.else:                                          ; preds = %for.body
  %call30 = call i32 @cudaGetLastError(), !dbg !1586
  %call31 = call i8* @cudaGetErrorString(i32 %call30), !dbg !1587
  %call32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.48, i32 0, i32 0), i8* %call31), !dbg !1589
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !1591

for.inc:                                          ; preds = %if.end
  %24 = load i32, i32* %nDeviceIdx, align 4, !dbg !1592
  %inc = add nsw i32 %24, 1, !dbg !1592
  store i32 %inc, i32* %nDeviceIdx, align 4, !dbg !1592
  br label %for.cond, !dbg !1594, !llvm.loop !1595

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1597
}

declare i32 @cudaGetDeviceCount(i32*) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #9

declare i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) #5

declare i8* @cudaGetErrorString(i32) #5

declare i32 @cudaGetLastError() #5

declare %struct._IO_FILE* @fopen(i8*, i8*) #5

declare i32 @fscanf(%struct._IO_FILE*, i8*, ...) #5

; Function Attrs: uwtable
define void @_Z7InitMatPfii(float* %ary, i32 %nrow, i32 %ncol) #8 !dbg !1598 {
entry:
  %ary.addr = alloca float*, align 8
  %nrow.addr = alloca i32, align 4
  %ncol.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store float* %ary, float** %ary.addr, align 8
  call void @llvm.dbg.declare(metadata float** %ary.addr, metadata !1599, metadata !675), !dbg !1600
  store i32 %nrow, i32* %nrow.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nrow.addr, metadata !1601, metadata !675), !dbg !1602
  store i32 %ncol, i32* %ncol.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ncol.addr, metadata !1603, metadata !675), !dbg !1604
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1605, metadata !675), !dbg !1606
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1607, metadata !675), !dbg !1608
  store i32 0, i32* %i, align 4, !dbg !1609
  br label %for.cond, !dbg !1611

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1612
  %1 = load i32, i32* %nrow.addr, align 4, !dbg !1615
  %cmp = icmp slt i32 %0, %1, !dbg !1616
  br i1 %cmp, label %for.body, label %for.end8, !dbg !1617

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !1618
  br label %for.cond1, !dbg !1621

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !1622
  %3 = load i32, i32* %ncol.addr, align 4, !dbg !1625
  %cmp2 = icmp slt i32 %2, %3, !dbg !1626
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1627

for.body3:                                        ; preds = %for.cond1
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !1628
  %5 = load float*, float** %ary.addr, align 8, !dbg !1630
  %6 = load i32, i32* @Size, align 4, !dbg !1631
  %7 = load i32, i32* %i, align 4, !dbg !1632
  %mul = mul nsw i32 %6, %7, !dbg !1633
  %idx.ext = sext i32 %mul to i64, !dbg !1634
  %add.ptr = getelementptr inbounds float, float* %5, i64 %idx.ext, !dbg !1634
  %8 = load i32, i32* %j, align 4, !dbg !1635
  %idx.ext4 = sext i32 %8 to i64, !dbg !1636
  %add.ptr5 = getelementptr inbounds float, float* %add.ptr, i64 %idx.ext4, !dbg !1636
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.52, i32 0, i32 0), float* %add.ptr5), !dbg !1637
  br label %for.inc, !dbg !1638

for.inc:                                          ; preds = %for.body3
  %9 = load i32, i32* %j, align 4, !dbg !1639
  %inc = add nsw i32 %9, 1, !dbg !1639
  store i32 %inc, i32* %j, align 4, !dbg !1639
  br label %for.cond1, !dbg !1641, !llvm.loop !1642

for.end:                                          ; preds = %for.cond1
  br label %for.inc6, !dbg !1644

for.inc6:                                         ; preds = %for.end
  %10 = load i32, i32* %i, align 4, !dbg !1645
  %inc7 = add nsw i32 %10, 1, !dbg !1645
  store i32 %inc7, i32* %i, align 4, !dbg !1645
  br label %for.cond, !dbg !1647, !llvm.loop !1648

for.end8:                                         ; preds = %for.cond
  ret void, !dbg !1650
}

; Function Attrs: uwtable
define void @_Z7InitAryPfi(float* %ary, i32 %ary_size) #8 !dbg !1651 {
entry:
  %ary.addr = alloca float*, align 8
  %ary_size.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store float* %ary, float** %ary.addr, align 8
  call void @llvm.dbg.declare(metadata float** %ary.addr, metadata !1652, metadata !675), !dbg !1653
  store i32 %ary_size, i32* %ary_size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ary_size.addr, metadata !1654, metadata !675), !dbg !1655
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1656, metadata !675), !dbg !1657
  store i32 0, i32* %i, align 4, !dbg !1658
  br label %for.cond, !dbg !1660

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1661
  %1 = load i32, i32* %ary_size.addr, align 4, !dbg !1664
  %cmp = icmp slt i32 %0, %1, !dbg !1665
  br i1 %cmp, label %for.body, label %for.end, !dbg !1666

for.body:                                         ; preds = %for.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !1667
  %3 = load float*, float** %ary.addr, align 8, !dbg !1669
  %4 = load i32, i32* %i, align 4, !dbg !1670
  %idxprom = sext i32 %4 to i64, !dbg !1669
  %arrayidx = getelementptr inbounds float, float* %3, i64 %idxprom, !dbg !1669
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.52, i32 0, i32 0), float* %arrayidx), !dbg !1671
  br label %for.inc, !dbg !1672

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !1673
  %inc = add nsw i32 %5, 1, !dbg !1673
  store i32 %inc, i32* %i, align 4, !dbg !1673
  br label %for.cond, !dbg !1675, !llvm.loop !1676

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1678
}

; Function Attrs: uwtable
define void @_Z4Fan1PfS_ii(float* %m_cuda, float* %a_cuda, i32 %Size, i32 %t) #8 !dbg !1679 {
entry:
  %m_cuda.addr = alloca float*, align 8
  %a_cuda.addr = alloca float*, align 8
  %Size.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  store float* %m_cuda, float** %m_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %m_cuda.addr, metadata !1682, metadata !675), !dbg !1683
  store float* %a_cuda, float** %a_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %a_cuda.addr, metadata !1684, metadata !675), !dbg !1685
  store i32 %Size, i32* %Size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %Size.addr, metadata !1686, metadata !675), !dbg !1687
  store i32 %t, i32* %t.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %t.addr, metadata !1688, metadata !675), !dbg !1689
  %0 = bitcast float** %m_cuda.addr to i8*, !dbg !1690
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !1690
  %2 = icmp eq i32 %1, 0, !dbg !1690
  br i1 %2, label %setup.next, label %setup.end, !dbg !1690

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %a_cuda.addr to i8*, !dbg !1691
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !1691
  %5 = icmp eq i32 %4, 0, !dbg !1691
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1691

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %Size.addr to i8*, !dbg !1693
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 16), !dbg !1693
  %8 = icmp eq i32 %7, 0, !dbg !1693
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1693

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %t.addr to i8*, !dbg !1695
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 20), !dbg !1695
  %11 = icmp eq i32 %10, 0, !dbg !1695
  br i1 %11, label %setup.next3, label %setup.end, !dbg !1695

setup.next3:                                      ; preds = %setup.next2
  %12 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, i32, i32)* @_Z4Fan1PfS_ii to i8*)), !dbg !1697
  br label %setup.end, !dbg !1697

setup.end:                                        ; preds = %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1699
}

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @_Z4Fan2PfS_S_iii(float* %m_cuda, float* %a_cuda, float* %b_cuda, i32 %Size, i32 %j1, i32 %t) #8 !dbg !1700 {
entry:
  %m_cuda.addr = alloca float*, align 8
  %a_cuda.addr = alloca float*, align 8
  %b_cuda.addr = alloca float*, align 8
  %Size.addr = alloca i32, align 4
  %j1.addr = alloca i32, align 4
  %t.addr = alloca i32, align 4
  store float* %m_cuda, float** %m_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %m_cuda.addr, metadata !1703, metadata !675), !dbg !1704
  store float* %a_cuda, float** %a_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %a_cuda.addr, metadata !1705, metadata !675), !dbg !1706
  store float* %b_cuda, float** %b_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %b_cuda.addr, metadata !1707, metadata !675), !dbg !1708
  store i32 %Size, i32* %Size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %Size.addr, metadata !1709, metadata !675), !dbg !1710
  store i32 %j1, i32* %j1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %j1.addr, metadata !1711, metadata !675), !dbg !1712
  store i32 %t, i32* %t.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %t.addr, metadata !1713, metadata !675), !dbg !1714
  %0 = bitcast float** %m_cuda.addr to i8*, !dbg !1715
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !1715
  %2 = icmp eq i32 %1, 0, !dbg !1715
  br i1 %2, label %setup.next, label %setup.end, !dbg !1715

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %a_cuda.addr to i8*, !dbg !1716
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !1716
  %5 = icmp eq i32 %4, 0, !dbg !1716
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1716

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %b_cuda.addr to i8*, !dbg !1718
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !1718
  %8 = icmp eq i32 %7, 0, !dbg !1718
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1718

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %Size.addr to i8*, !dbg !1720
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 24), !dbg !1720
  %11 = icmp eq i32 %10, 0, !dbg !1720
  br i1 %11, label %setup.next3, label %setup.end, !dbg !1720

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %j1.addr to i8*, !dbg !1722
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 28), !dbg !1722
  %14 = icmp eq i32 %13, 0, !dbg !1722
  br i1 %14, label %setup.next4, label %setup.end, !dbg !1722

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %t.addr to i8*, !dbg !1724
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 4, i64 32), !dbg !1724
  %17 = icmp eq i32 %16, 0, !dbg !1724
  br i1 %17, label %setup.next5, label %setup.end, !dbg !1724

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*, i32, i32, i32)* @_Z4Fan2PfS_S_iii to i8*)), !dbg !1726
  br label %setup.end, !dbg !1726

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1728
}

declare i32 @cudaMalloc(i8**, i64) #5

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #5

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #0 comdat align 2 !dbg !1729 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1730, metadata !675), !dbg !1732
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1733, metadata !675), !dbg !1734
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1735, metadata !675), !dbg !1736
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1737, metadata !675), !dbg !1738
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1739
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1740
  store i32 %0, i32* %x, align 4, !dbg !1739
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1741
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1742
  store i32 %1, i32* %y, align 4, !dbg !1741
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1743
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1744
  store i32 %2, i32* %z, align 4, !dbg !1743
  ret void, !dbg !1745
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #9

declare i32 @cudaThreadSynchronize() #5

; Function Attrs: uwtable
define void @_Z14checkCUDAErrorPKc(i8* %msg) #8 !dbg !1746 {
entry:
  %msg.addr = alloca i8*, align 8
  %err = alloca i32, align 4
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !1749, metadata !675), !dbg !1750
  call void @llvm.dbg.declare(metadata i32* %err, metadata !1751, metadata !675), !dbg !1753
  %call = call i32 @cudaGetLastError(), !dbg !1754
  store i32 %call, i32* %err, align 4, !dbg !1753
  %0 = load i32, i32* %err, align 4, !dbg !1755
  %cmp = icmp ne i32 0, %0, !dbg !1757
  br i1 %cmp, label %if.then, label %if.end, !dbg !1758

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1759
  %2 = load i8*, i8** %msg.addr, align 8, !dbg !1761
  %3 = load i32, i32* %err, align 4, !dbg !1762
  %call1 = call i8* @cudaGetErrorString(i32 %3), !dbg !1763
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.56, i32 0, i32 0), i8* %2, i8* %call1), !dbg !1764
  call void @exit(i32 1) #10, !dbg !1765
  unreachable, !dbg !1765

if.end:                                           ; preds = %entry
  ret void, !dbg !1766
}

declare i32 @cudaFree(i8*) #5

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { argmemonly nounwind }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind readonly }

!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!667, !668}
!llvm.ident = !{!669}

!0 = distinct !DIGlobalVariable(name: "Size", scope: !1, file: !2, line: 43, type: !179, isLocal: false, isDefinition: true)
!1 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, retainedTypes: !95, globals: !100, imports: !113)
!2 = !DIFile(filename: "gaussian.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!3 = !{!4, !88}
!4 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !5, line: 156, size: 32, align: 32, elements: !6, identifier: "_ZTS9cudaError")
!5 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
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
!95 = !{!96, !98}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64, align: 64)
!97 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64, align: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!100 = !{!0, !101, !102, !103, !104, !105, !111}
!101 = distinct !DIGlobalVariable(name: "a", scope: !1, file: !2, line: 44, type: !96, isLocal: false, isDefinition: true)
!102 = distinct !DIGlobalVariable(name: "b", scope: !1, file: !2, line: 44, type: !96, isLocal: false, isDefinition: true)
!103 = distinct !DIGlobalVariable(name: "finalVec", scope: !1, file: !2, line: 44, type: !96, isLocal: false, isDefinition: true)
!104 = distinct !DIGlobalVariable(name: "m", scope: !1, file: !2, line: 45, type: !96, isLocal: false, isDefinition: true)
!105 = distinct !DIGlobalVariable(name: "fp", scope: !1, file: !2, line: 47, type: !106, isLocal: false, isDefinition: true)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64, align: 64)
!107 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !108, line: 48, baseType: !109)
!108 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!109 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !110, line: 241, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!110 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!111 = distinct !DIGlobalVariable(name: "totalKernelTime", scope: !1, file: !2, line: 62, type: !112, isLocal: false, isDefinition: true)
!112 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!113 = !{!114, !121, !125, !127, !129, !131, !133, !137, !139, !141, !143, !145, !147, !149, !151, !153, !155, !157, !159, !161, !163, !165, !169, !171, !173, !175, !180, !185, !187, !189, !194, !198, !200, !202, !204, !206, !208, !210, !212, !214, !219, !223, !225, !227, !231, !233, !235, !237, !239, !241, !245, !247, !249, !253, !261, !265, !267, !269, !273, !275, !277, !281, !283, !285, !289, !291, !293, !295, !297, !299, !301, !303, !305, !307, !312, !314, !316, !320, !322, !324, !326, !328, !330, !332, !334, !338, !342, !344, !346, !351, !353, !355, !357, !359, !361, !363, !367, !373, !377, !381, !386, !388, !392, !396, !409, !413, !417, !421, !425, !430, !432, !436, !440, !444, !452, !456, !460, !464, !468, !472, !478, !482, !486, !488, !496, !500, !508, !510, !512, !516, !520, !524, !529, !533, !538, !539, !540, !541, !544, !545, !546, !547, !548, !549, !550, !553, !555, !557, !559, !561, !563, !565, !567, !570, !572, !574, !576, !578, !580, !582, !584, !586, !588, !590, !592, !594, !596, !598, !600, !602, !604, !606, !608, !610, !612, !614, !616, !618, !620, !622, !624, !626, !628, !630, !632, !634, !638, !639, !641, !643, !645, !647, !649, !651, !653, !655, !657, !659, !661, !663, !665}
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !117, line: 189)
!115 = !DINamespace(name: "std", scope: null, file: !116, line: 188)
!116 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!117 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !116, file: !116, line: 44, type: !118, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DISubroutineType(types: !119)
!119 = !{!120, !120}
!120 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !122, line: 190)
!122 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !116, file: !116, line: 46, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!123 = !DISubroutineType(types: !124)
!124 = !{!97, !97}
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !126, line: 191)
!126 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !116, file: !116, line: 48, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !128, line: 192)
!128 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !116, file: !116, line: 50, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !130, line: 193)
!130 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !116, file: !116, line: 52, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !132, line: 194)
!132 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !116, file: !116, line: 56, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !134, line: 195)
!134 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !116, file: !116, line: 54, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DISubroutineType(types: !136)
!136 = !{!97, !97, !97}
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !138, line: 196)
!138 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !116, file: !116, line: 58, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !140, line: 197)
!140 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !116, file: !116, line: 60, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !142, line: 198)
!142 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !116, file: !116, line: 62, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !144, line: 199)
!144 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !116, file: !116, line: 64, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !146, line: 200)
!146 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !116, file: !116, line: 66, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !148, line: 201)
!148 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !116, file: !116, line: 68, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !150, line: 202)
!150 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !116, file: !116, line: 72, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !152, line: 203)
!152 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !116, file: !116, line: 70, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !154, line: 204)
!154 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !116, file: !116, line: 76, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !156, line: 205)
!156 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !116, file: !116, line: 74, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !158, line: 206)
!158 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !116, file: !116, line: 78, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !160, line: 207)
!160 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !116, file: !116, line: 80, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !162, line: 208)
!162 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !116, file: !116, line: 82, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !164, line: 209)
!164 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !116, file: !116, line: 84, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !166, line: 210)
!166 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !116, file: !116, line: 86, type: !167, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DISubroutineType(types: !168)
!168 = !{!97, !97, !97, !97}
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !170, line: 211)
!170 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !116, file: !116, line: 88, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !172, line: 212)
!172 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !116, file: !116, line: 90, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !174, line: 213)
!174 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !116, file: !116, line: 92, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !176, line: 214)
!176 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !116, file: !116, line: 94, type: !177, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DISubroutineType(types: !178)
!178 = !{!179, !97}
!179 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !181, line: 215)
!181 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !116, file: !116, line: 96, type: !182, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!182 = !DISubroutineType(types: !183)
!183 = !{!97, !97, !184}
!184 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64, align: 64)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !186, line: 216)
!186 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !116, file: !116, line: 98, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !188, line: 217)
!188 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !116, file: !116, line: 100, type: !177, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !190, line: 218)
!190 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !116, file: !116, line: 102, type: !191, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!191 = !DISubroutineType(types: !192)
!192 = !{!193, !97}
!193 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !195, line: 219)
!195 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !116, file: !116, line: 106, type: !196, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DISubroutineType(types: !197)
!197 = !{!193, !97, !97}
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !199, line: 220)
!199 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !116, file: !116, line: 105, type: !196, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !201, line: 221)
!201 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !116, file: !116, line: 108, type: !191, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !203, line: 222)
!203 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !116, file: !116, line: 112, type: !196, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !205, line: 223)
!205 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !116, file: !116, line: 111, type: !196, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !207, line: 224)
!207 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !116, file: !116, line: 114, type: !196, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !209, line: 225)
!209 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !116, file: !116, line: 116, type: !191, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !211, line: 226)
!211 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !116, file: !116, line: 118, type: !191, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !213, line: 227)
!213 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !116, file: !116, line: 120, type: !196, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !215, line: 228)
!215 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !116, file: !116, line: 121, type: !216, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!216 = !DISubroutineType(types: !217)
!217 = !{!218, !218}
!218 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !220, line: 229)
!220 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !116, file: !116, line: 123, type: !221, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DISubroutineType(types: !222)
!222 = !{!97, !97, !179}
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !224, line: 230)
!224 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !116, file: !116, line: 125, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !226, line: 231)
!226 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !116, file: !116, line: 126, type: !118, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !228, line: 232)
!228 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !116, file: !116, line: 128, type: !229, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DISubroutineType(types: !230)
!230 = !{!120, !97}
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !232, line: 233)
!232 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !116, file: !116, line: 138, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !234, line: 234)
!234 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !116, file: !116, line: 130, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !236, line: 235)
!236 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !116, file: !116, line: 132, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !238, line: 236)
!238 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !116, file: !116, line: 134, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !240, line: 237)
!240 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !116, file: !116, line: 136, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !242, line: 238)
!242 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !116, file: !116, line: 140, type: !243, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!243 = !DISubroutineType(types: !244)
!244 = !{!218, !97}
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !246, line: 239)
!246 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !116, file: !116, line: 142, type: !243, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !248, line: 240)
!248 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !116, file: !116, line: 143, type: !229, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !250, line: 241)
!250 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !116, file: !116, line: 145, type: !251, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!251 = !DISubroutineType(types: !252)
!252 = !{!97, !97, !96}
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !254, line: 242)
!254 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !116, file: !116, line: 146, type: !255, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!255 = !DISubroutineType(types: !256)
!256 = !{!257, !258}
!257 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !259, size: 64, align: 64)
!259 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !260)
!260 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !262, line: 243)
!262 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !116, file: !116, line: 147, type: !263, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!263 = !DISubroutineType(types: !264)
!264 = !{!97, !258}
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !266, line: 244)
!266 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !116, file: !116, line: 149, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !268, line: 245)
!268 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !116, file: !116, line: 151, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !270, line: 246)
!270 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !116, file: !116, line: 153, type: !271, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!271 = !DISubroutineType(types: !272)
!272 = !{!97, !97, !257}
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !274, line: 247)
!274 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !116, file: !116, line: 158, type: !221, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !276, line: 248)
!276 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !116, file: !116, line: 160, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !278, line: 249)
!278 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !116, file: !116, line: 162, type: !279, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!279 = !DISubroutineType(types: !280)
!280 = !{!97, !97, !97, !184}
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !282, line: 250)
!282 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !116, file: !116, line: 164, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !284, line: 251)
!284 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !116, file: !116, line: 166, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !286, line: 252)
!286 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !116, file: !116, line: 168, type: !287, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!287 = !DISubroutineType(types: !288)
!288 = !{!97, !97, !218}
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !290, line: 253)
!290 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !116, file: !116, line: 170, type: !221, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !292, line: 254)
!292 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !116, file: !116, line: 172, type: !191, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !294, line: 255)
!294 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !116, file: !116, line: 174, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !296, line: 256)
!296 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !116, file: !116, line: 176, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !298, line: 257)
!298 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !116, file: !116, line: 178, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !300, line: 258)
!300 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !116, file: !116, line: 180, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !302, line: 259)
!302 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !116, file: !116, line: 182, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !304, line: 260)
!304 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !116, file: !116, line: 184, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !306, line: 261)
!306 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !116, file: !116, line: 186, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !308, line: 102)
!308 = !DISubprogram(name: "acos", scope: !309, file: !309, line: 54, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!309 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!310 = !DISubroutineType(types: !311)
!311 = !{!257, !257}
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !313, line: 121)
!313 = !DISubprogram(name: "asin", scope: !309, file: !309, line: 56, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !315, line: 140)
!315 = !DISubprogram(name: "atan", scope: !309, file: !309, line: 58, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !317, line: 159)
!317 = !DISubprogram(name: "atan2", scope: !309, file: !309, line: 60, type: !318, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DISubroutineType(types: !319)
!319 = !{!257, !257, !257}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !321, line: 180)
!321 = !DISubprogram(name: "ceil", scope: !309, file: !309, line: 178, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !323, line: 199)
!323 = !DISubprogram(name: "cos", scope: !309, file: !309, line: 63, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !325, line: 218)
!325 = !DISubprogram(name: "cosh", scope: !309, file: !309, line: 72, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !327, line: 237)
!327 = !DISubprogram(name: "exp", scope: !309, file: !309, line: 100, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !329, line: 256)
!329 = !DISubprogram(name: "fabs", scope: !309, file: !309, line: 181, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !331, line: 275)
!331 = !DISubprogram(name: "floor", scope: !309, file: !309, line: 184, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !333, line: 294)
!333 = !DISubprogram(name: "fmod", scope: !309, file: !309, line: 187, type: !318, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !335, line: 315)
!335 = !DISubprogram(name: "frexp", scope: !309, file: !309, line: 103, type: !336, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DISubroutineType(types: !337)
!337 = !{!257, !257, !184}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !339, line: 334)
!339 = !DISubprogram(name: "ldexp", scope: !309, file: !309, line: 106, type: !340, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DISubroutineType(types: !341)
!341 = !{!257, !257, !179}
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !343, line: 353)
!343 = !DISubprogram(name: "log", scope: !309, file: !309, line: 109, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !345, line: 372)
!345 = !DISubprogram(name: "log10", scope: !309, file: !309, line: 112, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !347, line: 391)
!347 = !DISubprogram(name: "modf", scope: !309, file: !309, line: 115, type: !348, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!348 = !DISubroutineType(types: !349)
!349 = !{!257, !257, !350}
!350 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !257, size: 64, align: 64)
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !352, line: 403)
!352 = !DISubprogram(name: "pow", scope: !309, file: !309, line: 153, type: !318, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !354, line: 440)
!354 = !DISubprogram(name: "sin", scope: !309, file: !309, line: 65, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !356, line: 459)
!356 = !DISubprogram(name: "sinh", scope: !309, file: !309, line: 74, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !358, line: 478)
!358 = !DISubprogram(name: "sqrt", scope: !309, file: !309, line: 156, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !360, line: 497)
!360 = !DISubprogram(name: "tan", scope: !309, file: !309, line: 67, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !362, line: 516)
!362 = !DISubprogram(name: "tanh", scope: !309, file: !309, line: 76, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !364, line: 118)
!364 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !365, line: 101, baseType: !366)
!365 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!366 = !DICompositeType(tag: DW_TAG_structure_type, file: !365, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !368, line: 119)
!368 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !365, line: 109, baseType: !369)
!369 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !365, line: 105, size: 128, align: 64, elements: !370, identifier: "_ZTS6ldiv_t")
!370 = !{!371, !372}
!371 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !369, file: !365, line: 107, baseType: !218, size: 64, align: 64)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !369, file: !365, line: 108, baseType: !218, size: 64, align: 64, offset: 64)
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !374, line: 121)
!374 = !DISubprogram(name: "abort", scope: !365, file: !365, line: 515, type: !375, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!375 = !DISubroutineType(types: !376)
!376 = !{null}
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !378, line: 122)
!378 = !DISubprogram(name: "abs", scope: !365, file: !365, line: 774, type: !379, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!379 = !DISubroutineType(types: !380)
!380 = !{!179, !179}
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !382, line: 123)
!382 = !DISubprogram(name: "atexit", scope: !365, file: !365, line: 519, type: !383, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!383 = !DISubroutineType(types: !384)
!384 = !{!179, !385}
!385 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !375, size: 64, align: 64)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !387, line: 129)
!387 = !DISubprogram(name: "atof", scope: !365, file: !365, line: 144, type: !255, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !389, line: 130)
!389 = !DISubprogram(name: "atoi", scope: !365, file: !365, line: 147, type: !390, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!390 = !DISubroutineType(types: !391)
!391 = !{!179, !258}
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !393, line: 131)
!393 = !DISubprogram(name: "atol", scope: !365, file: !365, line: 150, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!394 = !DISubroutineType(types: !395)
!395 = !{!218, !258}
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !397, line: 132)
!397 = !DISubprogram(name: "bsearch", scope: !365, file: !365, line: 754, type: !398, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!398 = !DISubroutineType(types: !399)
!399 = !{!99, !400, !400, !402, !402, !405}
!400 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !401, size: 64, align: 64)
!401 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !403, line: 62, baseType: !404)
!403 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!404 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !365, line: 741, baseType: !406)
!406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !407, size: 64, align: 64)
!407 = !DISubroutineType(types: !408)
!408 = !{!179, !400, !400}
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !410, line: 133)
!410 = !DISubprogram(name: "calloc", scope: !365, file: !365, line: 468, type: !411, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!411 = !DISubroutineType(types: !412)
!412 = !{!99, !402, !402}
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !414, line: 134)
!414 = !DISubprogram(name: "div", scope: !365, file: !365, line: 788, type: !415, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!415 = !DISubroutineType(types: !416)
!416 = !{!364, !179, !179}
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !418, line: 135)
!418 = !DISubprogram(name: "exit", scope: !365, file: !365, line: 543, type: !419, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!419 = !DISubroutineType(types: !420)
!420 = !{null, !179}
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !422, line: 136)
!422 = !DISubprogram(name: "free", scope: !365, file: !365, line: 483, type: !423, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!423 = !DISubroutineType(types: !424)
!424 = !{null, !99}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !426, line: 137)
!426 = !DISubprogram(name: "getenv", scope: !365, file: !365, line: 564, type: !427, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!427 = !DISubroutineType(types: !428)
!428 = !{!429, !258}
!429 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !260, size: 64, align: 64)
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !431, line: 138)
!431 = !DISubprogram(name: "labs", scope: !365, file: !365, line: 775, type: !216, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !433, line: 139)
!433 = !DISubprogram(name: "ldiv", scope: !365, file: !365, line: 790, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!434 = !DISubroutineType(types: !435)
!435 = !{!368, !218, !218}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !437, line: 140)
!437 = !DISubprogram(name: "malloc", scope: !365, file: !365, line: 466, type: !438, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DISubroutineType(types: !439)
!439 = !{!99, !402}
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !441, line: 142)
!441 = !DISubprogram(name: "mblen", scope: !365, file: !365, line: 862, type: !442, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!442 = !DISubroutineType(types: !443)
!443 = !{!179, !258, !402}
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !445, line: 143)
!445 = !DISubprogram(name: "mbstowcs", scope: !365, file: !365, line: 873, type: !446, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!446 = !DISubroutineType(types: !447)
!447 = !{!402, !448, !451, !402}
!448 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !449)
!449 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !450, size: 64, align: 64)
!450 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!451 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !258)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !453, line: 144)
!453 = !DISubprogram(name: "mbtowc", scope: !365, file: !365, line: 865, type: !454, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!454 = !DISubroutineType(types: !455)
!455 = !{!179, !448, !451, !402}
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !457, line: 146)
!457 = !DISubprogram(name: "qsort", scope: !365, file: !365, line: 764, type: !458, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!458 = !DISubroutineType(types: !459)
!459 = !{null, !99, !402, !402, !405}
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !461, line: 152)
!461 = !DISubprogram(name: "rand", scope: !365, file: !365, line: 374, type: !462, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!462 = !DISubroutineType(types: !463)
!463 = !{!179}
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !465, line: 153)
!465 = !DISubprogram(name: "realloc", scope: !365, file: !365, line: 480, type: !466, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!466 = !DISubroutineType(types: !467)
!467 = !{!99, !99, !402}
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !469, line: 154)
!469 = !DISubprogram(name: "srand", scope: !365, file: !365, line: 376, type: !470, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!470 = !DISubroutineType(types: !471)
!471 = !{null, !112}
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !473, line: 155)
!473 = !DISubprogram(name: "strtod", scope: !365, file: !365, line: 164, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DISubroutineType(types: !475)
!475 = !{!257, !451, !476}
!476 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !477)
!477 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !429, size: 64, align: 64)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !479, line: 156)
!479 = !DISubprogram(name: "strtol", scope: !365, file: !365, line: 183, type: !480, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!480 = !DISubroutineType(types: !481)
!481 = !{!218, !451, !476, !179}
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !483, line: 157)
!483 = !DISubprogram(name: "strtoul", scope: !365, file: !365, line: 187, type: !484, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DISubroutineType(types: !485)
!485 = !{!404, !451, !476, !179}
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !487, line: 158)
!487 = !DISubprogram(name: "system", scope: !365, file: !365, line: 716, type: !390, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !489, line: 160)
!489 = !DISubprogram(name: "wcstombs", scope: !365, file: !365, line: 876, type: !490, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DISubroutineType(types: !491)
!491 = !{!402, !492, !493, !402}
!492 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !429)
!493 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !494)
!494 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !495, size: 64, align: 64)
!495 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !450)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !497, line: 161)
!497 = !DISubprogram(name: "wctomb", scope: !365, file: !365, line: 869, type: !498, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DISubroutineType(types: !499)
!499 = !{!179, !429, !450}
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !503, line: 214)
!501 = !DINamespace(name: "__gnu_cxx", scope: null, file: !502, line: 220)
!502 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!503 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !365, line: 121, baseType: !504)
!504 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !365, line: 117, size: 128, align: 64, elements: !505, identifier: "_ZTS7lldiv_t")
!505 = !{!506, !507}
!506 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !504, file: !365, line: 119, baseType: !120, size: 64, align: 64)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !504, file: !365, line: 120, baseType: !120, size: 64, align: 64, offset: 64)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !509, line: 220)
!509 = !DISubprogram(name: "_Exit", scope: !365, file: !365, line: 557, type: !419, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !511, line: 224)
!511 = !DISubprogram(name: "llabs", scope: !365, file: !365, line: 779, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !513, line: 230)
!513 = !DISubprogram(name: "lldiv", scope: !365, file: !365, line: 796, type: !514, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DISubroutineType(types: !515)
!515 = !{!503, !120, !120}
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !517, line: 241)
!517 = !DISubprogram(name: "atoll", scope: !365, file: !365, line: 157, type: !518, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DISubroutineType(types: !519)
!519 = !{!120, !258}
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !521, line: 242)
!521 = !DISubprogram(name: "strtoll", scope: !365, file: !365, line: 209, type: !522, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DISubroutineType(types: !523)
!523 = !{!120, !451, !476, !179}
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !525, line: 243)
!525 = !DISubprogram(name: "strtoull", scope: !365, file: !365, line: 214, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DISubroutineType(types: !527)
!527 = !{!528, !451, !476, !179}
!528 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !530, line: 245)
!530 = !DISubprogram(name: "strtof", scope: !365, file: !365, line: 172, type: !531, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!531 = !DISubroutineType(types: !532)
!532 = !{!97, !451, !476}
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !534, line: 246)
!534 = !DISubprogram(name: "strtold", scope: !365, file: !365, line: 175, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!535 = !DISubroutineType(types: !536)
!536 = !{!537, !451, !476}
!537 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !503, line: 254)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !509, line: 256)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !511, line: 258)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !542, line: 259)
!542 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !501, file: !543, line: 227, type: !514, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!543 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !513, line: 260)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !517, line: 262)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !530, line: 263)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !521, line: 264)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !525, line: 265)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !534, line: 266)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !551, line: 397)
!551 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !552, file: !552, line: 1342, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!552 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !554, line: 398)
!554 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !552, file: !552, line: 1370, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !556, line: 399)
!556 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !552, file: !552, line: 1337, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !558, line: 400)
!558 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !552, file: !552, line: 1375, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !560, line: 401)
!560 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !552, file: !552, line: 1327, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !562, line: 402)
!562 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !552, file: !552, line: 1332, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !564, line: 403)
!564 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !552, file: !552, line: 1380, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !566, line: 404)
!566 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !552, file: !552, line: 1430, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !568, line: 405)
!568 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !569, file: !569, line: 667, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!569 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !571, line: 406)
!571 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !552, file: !552, line: 1189, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !573, line: 407)
!573 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !552, file: !552, line: 1243, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !575, line: 408)
!575 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !552, file: !552, line: 1312, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !577, line: 409)
!577 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !552, file: !552, line: 1490, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !579, line: 410)
!579 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !552, file: !552, line: 1480, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !581, line: 411)
!581 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !569, file: !569, line: 657, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !583, line: 412)
!583 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !552, file: !552, line: 1294, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !585, line: 413)
!585 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !552, file: !552, line: 1385, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !587, line: 414)
!587 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !569, file: !569, line: 607, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !589, line: 415)
!589 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !552, file: !552, line: 1616, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !591, line: 416)
!591 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !569, file: !569, line: 597, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !593, line: 417)
!593 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !552, file: !552, line: 1568, type: !167, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !595, line: 418)
!595 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !569, file: !569, line: 622, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !597, line: 419)
!597 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !569, file: !569, line: 617, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !599, line: 420)
!599 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !552, file: !552, line: 1553, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !601, line: 421)
!601 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !552, file: !552, line: 1543, type: !182, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !603, line: 422)
!603 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !552, file: !552, line: 1390, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !605, line: 423)
!605 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !552, file: !552, line: 1621, type: !177, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !607, line: 424)
!607 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !552, file: !552, line: 1520, type: !221, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !609, line: 425)
!609 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !552, file: !552, line: 1515, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !611, line: 426)
!611 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !552, file: !552, line: 1149, type: !229, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !613, line: 427)
!613 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !552, file: !552, line: 1602, type: !229, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !615, line: 428)
!615 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !552, file: !552, line: 1356, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !617, line: 429)
!617 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !552, file: !552, line: 1365, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !619, line: 430)
!619 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !552, file: !552, line: 1285, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !621, line: 431)
!621 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !552, file: !552, line: 1626, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !623, line: 432)
!623 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !552, file: !552, line: 1347, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !625, line: 433)
!625 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !552, file: !552, line: 1140, type: !243, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !627, line: 434)
!627 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !552, file: !552, line: 1607, type: !243, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !629, line: 435)
!629 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !552, file: !552, line: 1548, type: !251, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !631, line: 436)
!631 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !552, file: !552, line: 1154, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !633, line: 437)
!633 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !552, file: !552, line: 1218, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !635, line: 438)
!635 = !DISubprogram(name: "nexttowardf", scope: !309, file: !309, line: 294, type: !636, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!636 = !DISubroutineType(types: !637)
!637 = !{!97, !97, !537}
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !635, line: 439)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !640, line: 440)
!640 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !552, file: !552, line: 1583, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !642, line: 441)
!642 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !552, file: !552, line: 1558, type: !135, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !644, line: 442)
!644 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !552, file: !552, line: 1563, type: !279, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !646, line: 443)
!646 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !552, file: !552, line: 1135, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !648, line: 444)
!648 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !552, file: !552, line: 1597, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !650, line: 445)
!650 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !552, file: !552, line: 1530, type: !287, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !652, line: 446)
!652 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !552, file: !552, line: 1525, type: !221, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !654, line: 447)
!654 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !552, file: !552, line: 1234, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !656, line: 448)
!656 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !552, file: !552, line: 1317, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !658, line: 449)
!658 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !569, file: !569, line: 907, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !660, line: 450)
!660 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !552, file: !552, line: 1276, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !662, line: 451)
!662 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !552, file: !552, line: 1322, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !664, line: 452)
!664 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !552, file: !552, line: 1592, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !115, entity: !666, line: 453)
!666 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !569, file: !569, line: 662, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!667 = !{i32 2, !"Dwarf Version", i32 4}
!668 = !{i32 2, !"Debug Info Version", i32 3}
!669 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!670 = distinct !DISubprogram(name: "create_matrix", linkageName: "_Z13create_matrixPfi", scope: !2, file: !2, line: 66, type: !671, isLocal: false, isDefinition: true, scopeLine: 66, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!671 = !DISubroutineType(types: !672)
!672 = !{null, !96, !179}
!673 = !{}
!674 = !DILocalVariable(name: "m", arg: 1, scope: !670, file: !2, line: 66, type: !96)
!675 = !DIExpression()
!676 = !DILocation(line: 66, column: 22, scope: !670)
!677 = !DILocalVariable(name: "size", arg: 2, scope: !670, file: !2, line: 66, type: !179)
!678 = !DILocation(line: 66, column: 29, scope: !670)
!679 = !DILocalVariable(name: "i", scope: !670, file: !2, line: 67, type: !179)
!680 = !DILocation(line: 67, column: 7, scope: !670)
!681 = !DILocalVariable(name: "j", scope: !670, file: !2, line: 67, type: !179)
!682 = !DILocation(line: 67, column: 9, scope: !670)
!683 = !DILocalVariable(name: "lamda", scope: !670, file: !2, line: 68, type: !97)
!684 = !DILocation(line: 68, column: 9, scope: !670)
!685 = !DILocation(line: 69, column: 15, scope: !670)
!686 = !DILocation(line: 69, column: 14, scope: !670)
!687 = !DILocation(line: 69, column: 19, scope: !670)
!688 = !DILocation(line: 69, column: 3, scope: !670)
!689 = !DILocalVariable(name: "coe", scope: !670, file: !2, line: 69, type: !690)
!690 = !DICompositeType(tag: DW_TAG_array_type, baseType: !97, align: 32, elements: !691)
!691 = !{!692}
!692 = !DISubrange(count: -1)
!693 = !DIExpression(DW_OP_deref)
!694 = !DILocation(line: 69, column: 9, scope: !670)
!695 = !DILocalVariable(name: "coe_i", scope: !670, file: !2, line: 70, type: !97)
!696 = !DILocation(line: 70, column: 9, scope: !670)
!697 = !DILocation(line: 72, column: 9, scope: !698)
!698 = distinct !DILexicalBlock(scope: !670, file: !2, line: 72, column: 3)
!699 = !DILocation(line: 72, column: 8, scope: !698)
!700 = !DILocation(line: 72, column: 13, scope: !701)
!701 = !DILexicalBlockFile(scope: !702, file: !2, discriminator: 1)
!702 = distinct !DILexicalBlock(scope: !698, file: !2, line: 72, column: 3)
!703 = !DILocation(line: 72, column: 17, scope: !701)
!704 = !DILocation(line: 72, column: 15, scope: !701)
!705 = !DILocation(line: 72, column: 3, scope: !701)
!706 = !DILocation(line: 74, column: 22, scope: !707)
!707 = distinct !DILexicalBlock(scope: !702, file: !2, line: 73, column: 5)
!708 = !DILocation(line: 74, column: 28, scope: !707)
!709 = !DILocation(line: 74, column: 27, scope: !707)
!710 = !DILocation(line: 74, column: 18, scope: !707)
!711 = !DILocation(line: 74, column: 17, scope: !707)
!712 = !DILocation(line: 74, column: 15, scope: !707)
!713 = !DILocation(line: 74, column: 13, scope: !707)
!714 = !DILocation(line: 75, column: 9, scope: !707)
!715 = !DILocation(line: 75, column: 13, scope: !707)
!716 = !DILocation(line: 75, column: 16, scope: !707)
!717 = !DILocation(line: 75, column: 15, scope: !707)
!718 = !DILocation(line: 75, column: 8, scope: !707)
!719 = !DILocation(line: 76, column: 14, scope: !707)
!720 = !DILocation(line: 76, column: 11, scope: !707)
!721 = !DILocation(line: 76, column: 7, scope: !707)
!722 = !DILocation(line: 76, column: 13, scope: !707)
!723 = !DILocation(line: 77, column: 9, scope: !707)
!724 = !DILocation(line: 77, column: 13, scope: !707)
!725 = !DILocation(line: 77, column: 16, scope: !707)
!726 = !DILocation(line: 77, column: 15, scope: !707)
!727 = !DILocation(line: 77, column: 8, scope: !707)
!728 = !DILocation(line: 78, column: 14, scope: !707)
!729 = !DILocation(line: 78, column: 11, scope: !707)
!730 = !DILocation(line: 78, column: 7, scope: !707)
!731 = !DILocation(line: 78, column: 13, scope: !707)
!732 = !DILocation(line: 79, column: 5, scope: !707)
!733 = !DILocation(line: 72, column: 24, scope: !734)
!734 = !DILexicalBlockFile(scope: !702, file: !2, discriminator: 2)
!735 = !DILocation(line: 72, column: 3, scope: !734)
!736 = distinct !{!736, !737}
!737 = !DILocation(line: 72, column: 3, scope: !670)
!738 = !DILocation(line: 82, column: 9, scope: !739)
!739 = distinct !DILexicalBlock(scope: !670, file: !2, line: 82, column: 3)
!740 = !DILocation(line: 82, column: 8, scope: !739)
!741 = !DILocation(line: 82, column: 13, scope: !742)
!742 = !DILexicalBlockFile(scope: !743, file: !2, discriminator: 1)
!743 = distinct !DILexicalBlock(scope: !739, file: !2, line: 82, column: 3)
!744 = !DILocation(line: 82, column: 17, scope: !742)
!745 = !DILocation(line: 82, column: 15, scope: !742)
!746 = !DILocation(line: 82, column: 3, scope: !742)
!747 = !DILocation(line: 83, column: 13, scope: !748)
!748 = distinct !DILexicalBlock(scope: !749, file: !2, line: 83, column: 7)
!749 = distinct !DILexicalBlock(scope: !743, file: !2, line: 82, column: 28)
!750 = !DILocation(line: 83, column: 12, scope: !748)
!751 = !DILocation(line: 83, column: 17, scope: !752)
!752 = !DILexicalBlockFile(scope: !753, file: !2, discriminator: 1)
!753 = distinct !DILexicalBlock(scope: !748, file: !2, line: 83, column: 7)
!754 = !DILocation(line: 83, column: 21, scope: !752)
!755 = !DILocation(line: 83, column: 19, scope: !752)
!756 = !DILocation(line: 83, column: 7, scope: !752)
!757 = !DILocation(line: 84, column: 18, scope: !758)
!758 = distinct !DILexicalBlock(scope: !753, file: !2, line: 83, column: 32)
!759 = !DILocation(line: 84, column: 22, scope: !758)
!760 = !DILocation(line: 84, column: 25, scope: !758)
!761 = !DILocation(line: 84, column: 24, scope: !758)
!762 = !DILocation(line: 84, column: 27, scope: !758)
!763 = !DILocation(line: 84, column: 26, scope: !758)
!764 = !DILocation(line: 84, column: 14, scope: !758)
!765 = !DILocation(line: 84, column: 2, scope: !758)
!766 = !DILocation(line: 84, column: 4, scope: !758)
!767 = !DILocation(line: 84, column: 6, scope: !758)
!768 = !DILocation(line: 84, column: 5, scope: !758)
!769 = !DILocation(line: 84, column: 11, scope: !758)
!770 = !DILocation(line: 84, column: 10, scope: !758)
!771 = !DILocation(line: 84, column: 13, scope: !758)
!772 = !DILocation(line: 85, column: 7, scope: !758)
!773 = !DILocation(line: 83, column: 28, scope: !774)
!774 = !DILexicalBlockFile(scope: !753, file: !2, discriminator: 2)
!775 = !DILocation(line: 83, column: 7, scope: !774)
!776 = distinct !{!776, !777}
!777 = !DILocation(line: 83, column: 7, scope: !749)
!778 = !DILocation(line: 86, column: 3, scope: !749)
!779 = !DILocation(line: 82, column: 24, scope: !780)
!780 = !DILexicalBlockFile(scope: !743, file: !2, discriminator: 2)
!781 = !DILocation(line: 82, column: 3, scope: !780)
!782 = distinct !{!782, !783}
!783 = !DILocation(line: 82, column: 3, scope: !670)
!784 = !DILocation(line: 89, column: 1, scope: !670)
!785 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 92, type: !786, isLocal: false, isDefinition: true, scopeLine: 93, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!786 = !DISubroutineType(types: !787)
!787 = !{!179, !179, !477}
!788 = !DILocalVariable(name: "argc", arg: 1, scope: !785, file: !2, line: 92, type: !179)
!789 = !DILocation(line: 92, column: 14, scope: !785)
!790 = !DILocalVariable(name: "argv", arg: 2, scope: !785, file: !2, line: 92, type: !477)
!791 = !DILocation(line: 92, column: 26, scope: !785)
!792 = !DILocation(line: 94, column: 3, scope: !785)
!793 = !DILocalVariable(name: "verbose", scope: !785, file: !2, line: 95, type: !179)
!794 = !DILocation(line: 95, column: 9, scope: !785)
!795 = !DILocalVariable(name: "i", scope: !785, file: !2, line: 96, type: !179)
!796 = !DILocation(line: 96, column: 9, scope: !785)
!797 = !DILocalVariable(name: "j", scope: !785, file: !2, line: 96, type: !179)
!798 = !DILocation(line: 96, column: 12, scope: !785)
!799 = !DILocalVariable(name: "flag", scope: !785, file: !2, line: 97, type: !260)
!800 = !DILocation(line: 97, column: 10, scope: !785)
!801 = !DILocation(line: 98, column: 9, scope: !802)
!802 = distinct !DILexicalBlock(scope: !785, file: !2, line: 98, column: 9)
!803 = !DILocation(line: 98, column: 14, scope: !802)
!804 = !DILocation(line: 98, column: 9, scope: !785)
!805 = !DILocation(line: 99, column: 9, scope: !806)
!806 = distinct !DILexicalBlock(scope: !802, file: !2, line: 98, column: 19)
!807 = !DILocation(line: 100, column: 9, scope: !806)
!808 = !DILocation(line: 101, column: 9, scope: !806)
!809 = !DILocation(line: 102, column: 9, scope: !806)
!810 = !DILocation(line: 103, column: 9, scope: !806)
!811 = !DILocation(line: 104, column: 9, scope: !806)
!812 = !DILocation(line: 105, column: 9, scope: !806)
!813 = !DILocation(line: 106, column: 9, scope: !806)
!814 = !DILocation(line: 107, column: 9, scope: !806)
!815 = !DILocation(line: 108, column: 9, scope: !806)
!816 = !DILocation(line: 109, column: 9, scope: !806)
!817 = !DILocation(line: 110, column: 9, scope: !806)
!818 = !DILocation(line: 111, column: 9, scope: !806)
!819 = !DILocation(line: 112, column: 9, scope: !806)
!820 = !DILocation(line: 113, column: 9, scope: !806)
!821 = !DILocation(line: 114, column: 9, scope: !806)
!822 = !DILocation(line: 115, column: 9, scope: !806)
!823 = !DILocation(line: 116, column: 9, scope: !806)
!824 = !DILocation(line: 117, column: 9, scope: !806)
!825 = !DILocation(line: 118, column: 9, scope: !806)
!826 = !DILocation(line: 119, column: 9, scope: !806)
!827 = !DILocation(line: 120, column: 9, scope: !806)
!828 = !DILocation(line: 121, column: 9, scope: !806)
!829 = !DILocation(line: 128, column: 10, scope: !830)
!830 = distinct !DILexicalBlock(scope: !785, file: !2, line: 128, column: 5)
!831 = !DILocation(line: 128, column: 9, scope: !830)
!832 = !DILocation(line: 128, column: 13, scope: !833)
!833 = !DILexicalBlockFile(scope: !834, file: !2, discriminator: 1)
!834 = distinct !DILexicalBlock(scope: !830, file: !2, line: 128, column: 5)
!835 = !DILocation(line: 128, column: 15, scope: !833)
!836 = !DILocation(line: 128, column: 14, scope: !833)
!837 = !DILocation(line: 128, column: 5, scope: !833)
!838 = !DILocation(line: 129, column: 11, scope: !839)
!839 = distinct !DILexicalBlock(scope: !840, file: !2, line: 129, column: 11)
!840 = distinct !DILexicalBlock(scope: !834, file: !2, line: 128, column: 25)
!841 = !DILocation(line: 129, column: 16, scope: !839)
!842 = !DILocation(line: 129, column: 21, scope: !839)
!843 = !DILocation(line: 129, column: 11, scope: !840)
!844 = !DILocation(line: 130, column: 16, scope: !845)
!845 = distinct !DILexicalBlock(scope: !839, file: !2, line: 129, column: 28)
!846 = !DILocation(line: 130, column: 21, scope: !845)
!847 = !DILocation(line: 130, column: 14, scope: !845)
!848 = !DILocation(line: 131, column: 19, scope: !845)
!849 = !DILocation(line: 131, column: 11, scope: !845)
!850 = !DILocation(line: 133, column: 16, scope: !851)
!851 = distinct !DILexicalBlock(scope: !845, file: !2, line: 131, column: 25)
!852 = !DILocation(line: 134, column: 27, scope: !851)
!853 = !DILocation(line: 134, column: 32, scope: !851)
!854 = !DILocation(line: 134, column: 22, scope: !851)
!855 = !DILocation(line: 134, column: 20, scope: !851)
!856 = !DILocation(line: 135, column: 66, scope: !851)
!857 = !DILocation(line: 135, column: 8, scope: !851)
!858 = !DILocation(line: 137, column: 29, scope: !851)
!859 = !DILocation(line: 137, column: 36, scope: !851)
!860 = !DILocation(line: 137, column: 34, scope: !851)
!861 = !DILocation(line: 137, column: 41, scope: !851)
!862 = !DILocation(line: 137, column: 22, scope: !851)
!863 = !DILocation(line: 137, column: 12, scope: !851)
!864 = !DILocation(line: 137, column: 10, scope: !851)
!865 = !DILocation(line: 138, column: 22, scope: !851)
!866 = !DILocation(line: 138, column: 25, scope: !851)
!867 = !DILocation(line: 138, column: 8, scope: !851)
!868 = !DILocation(line: 140, column: 29, scope: !851)
!869 = !DILocation(line: 140, column: 34, scope: !851)
!870 = !DILocation(line: 140, column: 22, scope: !851)
!871 = !DILocation(line: 140, column: 12, scope: !851)
!872 = !DILocation(line: 140, column: 10, scope: !851)
!873 = !DILocation(line: 141, column: 15, scope: !874)
!874 = distinct !DILexicalBlock(scope: !851, file: !2, line: 141, column: 8)
!875 = !DILocation(line: 141, column: 13, scope: !874)
!876 = !DILocation(line: 141, column: 19, scope: !877)
!877 = !DILexicalBlockFile(scope: !878, file: !2, discriminator: 1)
!878 = distinct !DILexicalBlock(scope: !874, file: !2, line: 141, column: 8)
!879 = !DILocation(line: 141, column: 22, scope: !877)
!880 = !DILocation(line: 141, column: 20, scope: !877)
!881 = !DILocation(line: 141, column: 8, scope: !877)
!882 = !DILocation(line: 142, column: 7, scope: !878)
!883 = !DILocation(line: 142, column: 9, scope: !878)
!884 = !DILocation(line: 142, column: 11, scope: !878)
!885 = !DILocation(line: 141, column: 29, scope: !886)
!886 = !DILexicalBlockFile(scope: !878, file: !2, discriminator: 2)
!887 = !DILocation(line: 141, column: 8, scope: !886)
!888 = distinct !{!888, !889}
!889 = !DILocation(line: 141, column: 8, scope: !851)
!890 = !DILocation(line: 144, column: 29, scope: !851)
!891 = !DILocation(line: 144, column: 36, scope: !851)
!892 = !DILocation(line: 144, column: 34, scope: !851)
!893 = !DILocation(line: 144, column: 41, scope: !851)
!894 = !DILocation(line: 144, column: 22, scope: !851)
!895 = !DILocation(line: 144, column: 12, scope: !851)
!896 = !DILocation(line: 144, column: 10, scope: !851)
!897 = !DILocation(line: 145, column: 15, scope: !851)
!898 = !DILocation(line: 147, column: 16, scope: !851)
!899 = !DILocation(line: 148, column: 39, scope: !851)
!900 = !DILocation(line: 148, column: 44, scope: !851)
!901 = !DILocation(line: 148, column: 8, scope: !851)
!902 = !DILocation(line: 149, column: 24, scope: !851)
!903 = !DILocation(line: 149, column: 29, scope: !851)
!904 = !DILocation(line: 149, column: 8, scope: !851)
!905 = !DILocation(line: 150, column: 15, scope: !851)
!906 = !DILocation(line: 152, column: 16, scope: !851)
!907 = !DILocation(line: 153, column: 15, scope: !851)
!908 = !DILocation(line: 155, column: 7, scope: !845)
!909 = !DILocation(line: 156, column: 5, scope: !840)
!910 = !DILocation(line: 128, column: 21, scope: !911)
!911 = !DILexicalBlockFile(scope: !834, file: !2, discriminator: 2)
!912 = !DILocation(line: 128, column: 5, scope: !911)
!913 = distinct !{!913, !914}
!914 = !DILocation(line: 128, column: 5, scope: !785)
!915 = !DILocation(line: 159, column: 5, scope: !785)
!916 = !DILocalVariable(name: "time_start", scope: !785, file: !2, line: 161, type: !917)
!917 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !918, line: 30, size: 128, align: 64, elements: !919, identifier: "_ZTS7timeval")
!918 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!919 = !{!920, !923}
!920 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !917, file: !918, line: 32, baseType: !921, size: 64, align: 64)
!921 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !922, line: 139, baseType: !218)
!922 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!923 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !917, file: !918, line: 33, baseType: !924, size: 64, align: 64, offset: 64)
!924 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !922, line: 141, baseType: !218)
!925 = !DILocation(line: 161, column: 20, scope: !785)
!926 = !DILocation(line: 162, column: 5, scope: !785)
!927 = !DILocation(line: 165, column: 5, scope: !785)
!928 = !DILocalVariable(name: "time_end", scope: !785, file: !2, line: 168, type: !917)
!929 = !DILocation(line: 168, column: 20, scope: !785)
!930 = !DILocation(line: 169, column: 5, scope: !785)
!931 = !DILocalVariable(name: "time_total", scope: !785, file: !2, line: 170, type: !112)
!932 = !DILocation(line: 170, column: 18, scope: !785)
!933 = !DILocation(line: 170, column: 41, scope: !785)
!934 = !DILocation(line: 170, column: 48, scope: !785)
!935 = !DILocation(line: 170, column: 69, scope: !785)
!936 = !DILocation(line: 170, column: 58, scope: !785)
!937 = !DILocation(line: 170, column: 92, scope: !785)
!938 = !DILocation(line: 170, column: 99, scope: !785)
!939 = !DILocation(line: 170, column: 122, scope: !785)
!940 = !DILocation(line: 170, column: 109, scope: !785)
!941 = !DILocation(line: 170, column: 78, scope: !785)
!942 = !DILocation(line: 170, column: 31, scope: !785)
!943 = !DILocation(line: 172, column: 9, scope: !944)
!944 = distinct !DILexicalBlock(scope: !785, file: !2, line: 172, column: 9)
!945 = !DILocation(line: 172, column: 9, scope: !785)
!946 = !DILocation(line: 173, column: 9, scope: !947)
!947 = distinct !DILexicalBlock(scope: !944, file: !2, line: 172, column: 18)
!948 = !DILocation(line: 174, column: 18, scope: !947)
!949 = !DILocation(line: 174, column: 21, scope: !947)
!950 = !DILocation(line: 174, column: 27, scope: !947)
!951 = !DILocation(line: 174, column: 9, scope: !947)
!952 = !DILocation(line: 176, column: 9, scope: !947)
!953 = !DILocation(line: 177, column: 18, scope: !947)
!954 = !DILocation(line: 177, column: 21, scope: !947)
!955 = !DILocation(line: 177, column: 27, scope: !947)
!956 = !DILocation(line: 177, column: 9, scope: !947)
!957 = !DILocation(line: 179, column: 9, scope: !947)
!958 = !DILocation(line: 180, column: 18, scope: !947)
!959 = !DILocation(line: 180, column: 21, scope: !947)
!960 = !DILocation(line: 180, column: 9, scope: !947)
!961 = !DILocation(line: 181, column: 5, scope: !947)
!962 = !DILocation(line: 182, column: 5, scope: !785)
!963 = !DILocation(line: 183, column: 9, scope: !964)
!964 = distinct !DILexicalBlock(scope: !785, file: !2, line: 183, column: 9)
!965 = !DILocation(line: 183, column: 9, scope: !785)
!966 = !DILocation(line: 184, column: 9, scope: !967)
!967 = distinct !DILexicalBlock(scope: !964, file: !2, line: 183, column: 18)
!968 = !DILocation(line: 185, column: 18, scope: !967)
!969 = !DILocation(line: 185, column: 27, scope: !967)
!970 = !DILocation(line: 185, column: 9, scope: !967)
!971 = !DILocation(line: 186, column: 5, scope: !967)
!972 = !DILocation(line: 187, column: 67, scope: !785)
!973 = !DILocation(line: 187, column: 78, scope: !785)
!974 = !DILocation(line: 187, column: 5, scope: !785)
!975 = !DILocation(line: 188, column: 47, scope: !785)
!976 = !DILocation(line: 188, column: 63, scope: !785)
!977 = !DILocation(line: 188, column: 5, scope: !785)
!978 = !DILocation(line: 193, column: 10, scope: !785)
!979 = !DILocation(line: 193, column: 5, scope: !785)
!980 = !DILocation(line: 194, column: 10, scope: !785)
!981 = !DILocation(line: 194, column: 5, scope: !785)
!982 = !DILocation(line: 195, column: 10, scope: !785)
!983 = !DILocation(line: 195, column: 5, scope: !785)
!984 = !DILocation(line: 196, column: 1, scope: !785)
!985 = distinct !DISubprogram(name: "InitProblemOnce", linkageName: "_Z15InitProblemOncePc", scope: !2, file: !2, line: 243, type: !986, isLocal: false, isDefinition: true, scopeLine: 244, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!986 = !DISubroutineType(types: !987)
!987 = !{null, !429}
!988 = !DILocalVariable(name: "filename", arg: 1, scope: !985, file: !2, line: 243, type: !429)
!989 = !DILocation(line: 243, column: 28, scope: !985)
!990 = !DILocation(line: 251, column: 13, scope: !985)
!991 = !DILocation(line: 251, column: 7, scope: !985)
!992 = !DILocation(line: 251, column: 5, scope: !985)
!993 = !DILocation(line: 253, column: 9, scope: !985)
!994 = !DILocation(line: 253, column: 2, scope: !985)
!995 = !DILocation(line: 255, column: 23, scope: !985)
!996 = !DILocation(line: 255, column: 30, scope: !985)
!997 = !DILocation(line: 255, column: 28, scope: !985)
!998 = !DILocation(line: 255, column: 35, scope: !985)
!999 = !DILocation(line: 255, column: 16, scope: !985)
!1000 = !DILocation(line: 255, column: 6, scope: !985)
!1001 = !DILocation(line: 255, column: 4, scope: !985)
!1002 = !DILocation(line: 257, column: 10, scope: !985)
!1003 = !DILocation(line: 257, column: 13, scope: !985)
!1004 = !DILocation(line: 257, column: 19, scope: !985)
!1005 = !DILocation(line: 257, column: 2, scope: !985)
!1006 = !DILocation(line: 260, column: 23, scope: !985)
!1007 = !DILocation(line: 260, column: 28, scope: !985)
!1008 = !DILocation(line: 260, column: 16, scope: !985)
!1009 = !DILocation(line: 260, column: 6, scope: !985)
!1010 = !DILocation(line: 260, column: 4, scope: !985)
!1011 = !DILocation(line: 262, column: 10, scope: !985)
!1012 = !DILocation(line: 262, column: 13, scope: !985)
!1013 = !DILocation(line: 262, column: 2, scope: !985)
!1014 = !DILocation(line: 266, column: 24, scope: !985)
!1015 = !DILocation(line: 266, column: 31, scope: !985)
!1016 = !DILocation(line: 266, column: 29, scope: !985)
!1017 = !DILocation(line: 266, column: 36, scope: !985)
!1018 = !DILocation(line: 266, column: 17, scope: !985)
!1019 = !DILocation(line: 266, column: 7, scope: !985)
!1020 = !DILocation(line: 266, column: 5, scope: !985)
!1021 = !DILocation(line: 267, column: 1, scope: !985)
!1022 = distinct !DISubprogram(name: "InitPerRun", linkageName: "_Z10InitPerRunv", scope: !2, file: !2, line: 274, type: !375, isLocal: false, isDefinition: true, scopeLine: 275, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!1023 = !DILocalVariable(name: "i", scope: !1022, file: !2, line: 276, type: !179)
!1024 = !DILocation(line: 276, column: 6, scope: !1022)
!1025 = !DILocation(line: 277, column: 8, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1022, file: !2, line: 277, column: 2)
!1027 = !DILocation(line: 277, column: 7, scope: !1026)
!1028 = !DILocation(line: 277, column: 12, scope: !1029)
!1029 = !DILexicalBlockFile(scope: !1030, file: !2, discriminator: 1)
!1030 = distinct !DILexicalBlock(scope: !1026, file: !2, line: 277, column: 2)
!1031 = !DILocation(line: 277, column: 14, scope: !1029)
!1032 = !DILocation(line: 277, column: 19, scope: !1029)
!1033 = !DILocation(line: 277, column: 18, scope: !1029)
!1034 = !DILocation(line: 277, column: 13, scope: !1029)
!1035 = !DILocation(line: 277, column: 2, scope: !1029)
!1036 = !DILocation(line: 278, column: 6, scope: !1030)
!1037 = !DILocation(line: 278, column: 8, scope: !1030)
!1038 = !DILocation(line: 278, column: 7, scope: !1030)
!1039 = !DILocation(line: 278, column: 11, scope: !1030)
!1040 = !DILocation(line: 278, column: 4, scope: !1030)
!1041 = !DILocation(line: 277, column: 26, scope: !1042)
!1042 = !DILexicalBlockFile(scope: !1030, file: !2, discriminator: 2)
!1043 = !DILocation(line: 277, column: 2, scope: !1042)
!1044 = distinct !{!1044, !1045}
!1045 = !DILocation(line: 277, column: 2, scope: !1022)
!1046 = !DILocation(line: 279, column: 1, scope: !1022)
!1047 = distinct !DISubprogram(name: "ForwardSub", linkageName: "_Z10ForwardSubv", scope: !2, file: !2, line: 326, type: !375, isLocal: false, isDefinition: true, scopeLine: 327, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!1048 = !DILocalVariable(name: "t", scope: !1047, file: !2, line: 328, type: !179)
!1049 = !DILocation(line: 328, column: 6, scope: !1047)
!1050 = !DILocalVariable(name: "m_cuda", scope: !1047, file: !2, line: 329, type: !96)
!1051 = !DILocation(line: 329, column: 12, scope: !1047)
!1052 = !DILocalVariable(name: "a_cuda", scope: !1047, file: !2, line: 329, type: !96)
!1053 = !DILocation(line: 329, column: 20, scope: !1047)
!1054 = !DILocalVariable(name: "b_cuda", scope: !1047, file: !2, line: 329, type: !96)
!1055 = !DILocation(line: 329, column: 28, scope: !1047)
!1056 = !DILocation(line: 332, column: 13, scope: !1047)
!1057 = !DILocation(line: 332, column: 32, scope: !1047)
!1058 = !DILocation(line: 332, column: 39, scope: !1047)
!1059 = !DILocation(line: 332, column: 37, scope: !1047)
!1060 = !DILocation(line: 332, column: 44, scope: !1047)
!1061 = !DILocation(line: 332, column: 2, scope: !1047)
!1062 = !DILocation(line: 334, column: 13, scope: !1047)
!1063 = !DILocation(line: 334, column: 32, scope: !1047)
!1064 = !DILocation(line: 334, column: 39, scope: !1047)
!1065 = !DILocation(line: 334, column: 37, scope: !1047)
!1066 = !DILocation(line: 334, column: 44, scope: !1047)
!1067 = !DILocation(line: 334, column: 2, scope: !1047)
!1068 = !DILocation(line: 336, column: 13, scope: !1047)
!1069 = !DILocation(line: 336, column: 32, scope: !1047)
!1070 = !DILocation(line: 336, column: 37, scope: !1047)
!1071 = !DILocation(line: 336, column: 2, scope: !1047)
!1072 = !DILocation(line: 339, column: 13, scope: !1047)
!1073 = !DILocation(line: 339, column: 21, scope: !1047)
!1074 = !DILocation(line: 339, column: 24, scope: !1047)
!1075 = !DILocation(line: 339, column: 31, scope: !1047)
!1076 = !DILocation(line: 339, column: 29, scope: !1047)
!1077 = !DILocation(line: 339, column: 36, scope: !1047)
!1078 = !DILocation(line: 339, column: 2, scope: !1047)
!1079 = !DILocation(line: 340, column: 13, scope: !1047)
!1080 = !DILocation(line: 340, column: 21, scope: !1047)
!1081 = !DILocation(line: 340, column: 24, scope: !1047)
!1082 = !DILocation(line: 340, column: 31, scope: !1047)
!1083 = !DILocation(line: 340, column: 29, scope: !1047)
!1084 = !DILocation(line: 340, column: 36, scope: !1047)
!1085 = !DILocation(line: 340, column: 2, scope: !1047)
!1086 = !DILocation(line: 341, column: 13, scope: !1047)
!1087 = !DILocation(line: 341, column: 21, scope: !1047)
!1088 = !DILocation(line: 341, column: 24, scope: !1047)
!1089 = !DILocation(line: 341, column: 29, scope: !1047)
!1090 = !DILocation(line: 341, column: 2, scope: !1047)
!1091 = !DILocalVariable(name: "block_size", scope: !1047, file: !2, line: 343, type: !179)
!1092 = !DILocation(line: 343, column: 6, scope: !1047)
!1093 = !DILocalVariable(name: "grid_size", scope: !1047, file: !2, line: 343, type: !179)
!1094 = !DILocation(line: 343, column: 17, scope: !1047)
!1095 = !DILocation(line: 345, column: 13, scope: !1047)
!1096 = !DILocation(line: 346, column: 15, scope: !1047)
!1097 = !DILocation(line: 346, column: 20, scope: !1047)
!1098 = !DILocation(line: 346, column: 19, scope: !1047)
!1099 = !DILocation(line: 346, column: 37, scope: !1047)
!1100 = !DILocation(line: 346, column: 42, scope: !1047)
!1101 = !DILocation(line: 346, column: 41, scope: !1047)
!1102 = !DILocation(line: 346, column: 36, scope: !1047)
!1103 = !DILocation(line: 346, column: 35, scope: !1047)
!1104 = !DILocation(line: 346, column: 32, scope: !1047)
!1105 = !DILocation(line: 346, column: 12, scope: !1047)
!1106 = !DILocalVariable(name: "dimBlock", scope: !1047, file: !2, line: 350, type: !1107)
!1107 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1108, line: 427, baseType: !1109)
!1108 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/gaussian")
!1109 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1108, line: 417, size: 96, align: 32, elements: !1110, identifier: "_ZTS4dim3")
!1110 = !{!1111, !1112, !1113, !1114, !1118, !1127}
!1111 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1109, file: !1108, line: 419, baseType: !112, size: 32, align: 32)
!1112 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1109, file: !1108, line: 419, baseType: !112, size: 32, align: 32, offset: 32)
!1113 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1109, file: !1108, line: 419, baseType: !112, size: 32, align: 32, offset: 64)
!1114 = !DISubprogram(name: "dim3", scope: !1109, file: !1108, line: 421, type: !1115, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!1115 = !DISubroutineType(types: !1116)
!1116 = !{null, !1117, !112, !112, !112}
!1117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1109, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1118 = !DISubprogram(name: "dim3", scope: !1109, file: !1108, line: 422, type: !1119, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!1119 = !DISubroutineType(types: !1120)
!1120 = !{null, !1117, !1121}
!1121 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1108, line: 383, baseType: !1122)
!1122 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1108, line: 190, size: 96, align: 32, elements: !1123, identifier: "_ZTS5uint3")
!1123 = !{!1124, !1125, !1126}
!1124 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1122, file: !1108, line: 192, baseType: !112, size: 32, align: 32)
!1125 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1122, file: !1108, line: 192, baseType: !112, size: 32, align: 32, offset: 32)
!1126 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1122, file: !1108, line: 192, baseType: !112, size: 32, align: 32, offset: 64)
!1127 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1109, file: !1108, line: 423, type: !1128, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!1128 = !DISubroutineType(types: !1129)
!1129 = !{!1121, !1117}
!1130 = !DILocation(line: 350, column: 7, scope: !1047)
!1131 = !DILocation(line: 350, column: 16, scope: !1047)
!1132 = !DILocalVariable(name: "dimGrid", scope: !1047, file: !2, line: 351, type: !1107)
!1133 = !DILocation(line: 351, column: 7, scope: !1047)
!1134 = !DILocation(line: 351, column: 15, scope: !1047)
!1135 = !DILocalVariable(name: "blockSize2d", scope: !1047, file: !2, line: 354, type: !179)
!1136 = !DILocation(line: 354, column: 6, scope: !1047)
!1137 = !DILocalVariable(name: "gridSize2d", scope: !1047, file: !2, line: 354, type: !179)
!1138 = !DILocation(line: 354, column: 19, scope: !1047)
!1139 = !DILocation(line: 355, column: 14, scope: !1047)
!1140 = !DILocation(line: 356, column: 16, scope: !1047)
!1141 = !DILocation(line: 356, column: 21, scope: !1047)
!1142 = !DILocation(line: 356, column: 20, scope: !1047)
!1143 = !DILocation(line: 356, column: 39, scope: !1047)
!1144 = !DILocation(line: 356, column: 44, scope: !1047)
!1145 = !DILocation(line: 356, column: 43, scope: !1047)
!1146 = !DILocation(line: 356, column: 38, scope: !1047)
!1147 = !DILocation(line: 356, column: 37, scope: !1047)
!1148 = !DILocation(line: 356, column: 36, scope: !1047)
!1149 = !DILocation(line: 356, column: 34, scope: !1047)
!1150 = !DILocation(line: 356, column: 13, scope: !1047)
!1151 = !DILocalVariable(name: "dimBlockXY", scope: !1047, file: !2, line: 358, type: !1107)
!1152 = !DILocation(line: 358, column: 7, scope: !1047)
!1153 = !DILocation(line: 358, column: 18, scope: !1047)
!1154 = !DILocation(line: 358, column: 30, scope: !1047)
!1155 = !DILocalVariable(name: "dimGridXY", scope: !1047, file: !2, line: 359, type: !1107)
!1156 = !DILocation(line: 359, column: 7, scope: !1047)
!1157 = !DILocation(line: 359, column: 17, scope: !1047)
!1158 = !DILocation(line: 359, column: 28, scope: !1047)
!1159 = !DILocalVariable(name: "time_start", scope: !1047, file: !2, line: 362, type: !917)
!1160 = !DILocation(line: 362, column: 20, scope: !1047)
!1161 = !DILocation(line: 363, column: 5, scope: !1047)
!1162 = !DILocation(line: 364, column: 8, scope: !1163)
!1163 = distinct !DILexicalBlock(scope: !1047, file: !2, line: 364, column: 2)
!1164 = !DILocation(line: 364, column: 7, scope: !1163)
!1165 = !DILocation(line: 364, column: 12, scope: !1166)
!1166 = !DILexicalBlockFile(scope: !1167, file: !2, discriminator: 1)
!1167 = distinct !DILexicalBlock(scope: !1163, file: !2, line: 364, column: 2)
!1168 = !DILocation(line: 364, column: 15, scope: !1166)
!1169 = !DILocation(line: 364, column: 19, scope: !1166)
!1170 = !DILocation(line: 364, column: 13, scope: !1166)
!1171 = !DILocation(line: 364, column: 2, scope: !1166)
!1172 = !DILocation(line: 365, column: 10, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1167, file: !2, line: 364, column: 29)
!1174 = !DILocation(line: 365, column: 18, scope: !1173)
!1175 = !DILocation(line: 365, column: 7, scope: !1173)
!1176 = !DILocation(line: 365, column: 3, scope: !1173)
!1177 = !DILocation(line: 365, column: 30, scope: !1178)
!1178 = !DILexicalBlockFile(scope: !1173, file: !2, discriminator: 1)
!1179 = !DILocation(line: 365, column: 37, scope: !1178)
!1180 = !DILocation(line: 365, column: 44, scope: !1178)
!1181 = !DILocation(line: 365, column: 49, scope: !1178)
!1182 = !DILocation(line: 365, column: 3, scope: !1178)
!1183 = !DILocation(line: 366, column: 3, scope: !1173)
!1184 = !DILocation(line: 367, column: 10, scope: !1173)
!1185 = !DILocation(line: 367, column: 20, scope: !1173)
!1186 = !DILocation(line: 367, column: 7, scope: !1173)
!1187 = !DILocation(line: 367, column: 3, scope: !1173)
!1188 = !DILocation(line: 367, column: 34, scope: !1178)
!1189 = !DILocation(line: 367, column: 41, scope: !1178)
!1190 = !DILocation(line: 367, column: 48, scope: !1178)
!1191 = !DILocation(line: 367, column: 55, scope: !1178)
!1192 = !DILocation(line: 367, column: 60, scope: !1178)
!1193 = !DILocation(line: 367, column: 65, scope: !1178)
!1194 = !DILocation(line: 367, column: 64, scope: !1178)
!1195 = !DILocation(line: 367, column: 67, scope: !1178)
!1196 = !DILocation(line: 367, column: 3, scope: !1178)
!1197 = !DILocation(line: 368, column: 3, scope: !1173)
!1198 = !DILocation(line: 369, column: 3, scope: !1173)
!1199 = !DILocation(line: 370, column: 2, scope: !1173)
!1200 = !DILocation(line: 364, column: 25, scope: !1201)
!1201 = !DILexicalBlockFile(scope: !1167, file: !2, discriminator: 2)
!1202 = !DILocation(line: 364, column: 2, scope: !1201)
!1203 = distinct !{!1203, !1204}
!1204 = !DILocation(line: 364, column: 2, scope: !1047)
!1205 = !DILocalVariable(name: "time_end", scope: !1047, file: !2, line: 372, type: !917)
!1206 = !DILocation(line: 372, column: 17, scope: !1047)
!1207 = !DILocation(line: 373, column: 5, scope: !1047)
!1208 = !DILocation(line: 374, column: 33, scope: !1047)
!1209 = !DILocation(line: 374, column: 40, scope: !1047)
!1210 = !DILocation(line: 374, column: 61, scope: !1047)
!1211 = !DILocation(line: 374, column: 50, scope: !1047)
!1212 = !DILocation(line: 374, column: 84, scope: !1047)
!1213 = !DILocation(line: 374, column: 91, scope: !1047)
!1214 = !DILocation(line: 374, column: 114, scope: !1047)
!1215 = !DILocation(line: 374, column: 101, scope: !1047)
!1216 = !DILocation(line: 374, column: 70, scope: !1047)
!1217 = !DILocation(line: 374, column: 23, scope: !1047)
!1218 = !DILocation(line: 374, column: 21, scope: !1047)
!1219 = !DILocation(line: 377, column: 13, scope: !1047)
!1220 = !DILocation(line: 377, column: 16, scope: !1047)
!1221 = !DILocation(line: 377, column: 24, scope: !1047)
!1222 = !DILocation(line: 377, column: 31, scope: !1047)
!1223 = !DILocation(line: 377, column: 29, scope: !1047)
!1224 = !DILocation(line: 377, column: 36, scope: !1047)
!1225 = !DILocation(line: 377, column: 2, scope: !1047)
!1226 = !DILocation(line: 378, column: 13, scope: !1047)
!1227 = !DILocation(line: 378, column: 16, scope: !1047)
!1228 = !DILocation(line: 378, column: 24, scope: !1047)
!1229 = !DILocation(line: 378, column: 31, scope: !1047)
!1230 = !DILocation(line: 378, column: 29, scope: !1047)
!1231 = !DILocation(line: 378, column: 36, scope: !1047)
!1232 = !DILocation(line: 378, column: 2, scope: !1047)
!1233 = !DILocation(line: 379, column: 13, scope: !1047)
!1234 = !DILocation(line: 379, column: 16, scope: !1047)
!1235 = !DILocation(line: 379, column: 24, scope: !1047)
!1236 = !DILocation(line: 379, column: 29, scope: !1047)
!1237 = !DILocation(line: 379, column: 2, scope: !1047)
!1238 = !DILocation(line: 380, column: 11, scope: !1047)
!1239 = !DILocation(line: 380, column: 2, scope: !1047)
!1240 = !DILocation(line: 381, column: 11, scope: !1047)
!1241 = !DILocation(line: 381, column: 2, scope: !1047)
!1242 = !DILocation(line: 382, column: 11, scope: !1047)
!1243 = !DILocation(line: 382, column: 2, scope: !1047)
!1244 = !DILocation(line: 383, column: 1, scope: !1047)
!1245 = distinct !DISubprogram(name: "PrintMat", linkageName: "_Z8PrintMatPfii", scope: !2, file: !2, line: 421, type: !1246, isLocal: false, isDefinition: true, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!1246 = !DISubroutineType(types: !1247)
!1247 = !{null, !96, !179, !179}
!1248 = !DILocalVariable(name: "ary", arg: 1, scope: !1245, file: !2, line: 421, type: !96)
!1249 = !DILocation(line: 421, column: 22, scope: !1245)
!1250 = !DILocalVariable(name: "nrow", arg: 2, scope: !1245, file: !2, line: 421, type: !179)
!1251 = !DILocation(line: 421, column: 31, scope: !1245)
!1252 = !DILocalVariable(name: "ncol", arg: 3, scope: !1245, file: !2, line: 421, type: !179)
!1253 = !DILocation(line: 421, column: 41, scope: !1245)
!1254 = !DILocalVariable(name: "i", scope: !1245, file: !2, line: 423, type: !179)
!1255 = !DILocation(line: 423, column: 6, scope: !1245)
!1256 = !DILocalVariable(name: "j", scope: !1245, file: !2, line: 423, type: !179)
!1257 = !DILocation(line: 423, column: 9, scope: !1245)
!1258 = !DILocation(line: 425, column: 8, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1245, file: !2, line: 425, column: 2)
!1260 = !DILocation(line: 425, column: 7, scope: !1259)
!1261 = !DILocation(line: 425, column: 12, scope: !1262)
!1262 = !DILexicalBlockFile(scope: !1263, file: !2, discriminator: 1)
!1263 = distinct !DILexicalBlock(scope: !1259, file: !2, line: 425, column: 2)
!1264 = !DILocation(line: 425, column: 14, scope: !1262)
!1265 = !DILocation(line: 425, column: 13, scope: !1262)
!1266 = !DILocation(line: 425, column: 2, scope: !1262)
!1267 = !DILocation(line: 426, column: 9, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1269, file: !2, line: 426, column: 3)
!1269 = distinct !DILexicalBlock(scope: !1263, file: !2, line: 425, column: 25)
!1270 = !DILocation(line: 426, column: 8, scope: !1268)
!1271 = !DILocation(line: 426, column: 13, scope: !1272)
!1272 = !DILexicalBlockFile(scope: !1273, file: !2, discriminator: 1)
!1273 = distinct !DILexicalBlock(scope: !1268, file: !2, line: 426, column: 3)
!1274 = !DILocation(line: 426, column: 15, scope: !1272)
!1275 = !DILocation(line: 426, column: 14, scope: !1272)
!1276 = !DILocation(line: 426, column: 3, scope: !1272)
!1277 = !DILocation(line: 427, column: 23, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1273, file: !2, line: 426, column: 26)
!1279 = !DILocation(line: 427, column: 27, scope: !1278)
!1280 = !DILocation(line: 427, column: 32, scope: !1278)
!1281 = !DILocation(line: 427, column: 31, scope: !1278)
!1282 = !DILocation(line: 427, column: 26, scope: !1278)
!1283 = !DILocation(line: 427, column: 34, scope: !1278)
!1284 = !DILocation(line: 427, column: 33, scope: !1278)
!1285 = !DILocation(line: 427, column: 21, scope: !1278)
!1286 = !DILocation(line: 427, column: 4, scope: !1278)
!1287 = !DILocation(line: 428, column: 3, scope: !1278)
!1288 = !DILocation(line: 426, column: 22, scope: !1289)
!1289 = !DILexicalBlockFile(scope: !1273, file: !2, discriminator: 2)
!1290 = !DILocation(line: 426, column: 3, scope: !1289)
!1291 = distinct !{!1291, !1292}
!1292 = !DILocation(line: 426, column: 3, scope: !1269)
!1293 = !DILocation(line: 429, column: 3, scope: !1269)
!1294 = !DILocation(line: 430, column: 2, scope: !1269)
!1295 = !DILocation(line: 425, column: 21, scope: !1296)
!1296 = !DILexicalBlockFile(scope: !1263, file: !2, discriminator: 2)
!1297 = !DILocation(line: 425, column: 2, scope: !1296)
!1298 = distinct !{!1298, !1299}
!1299 = !DILocation(line: 425, column: 2, scope: !1245)
!1300 = !DILocation(line: 431, column: 2, scope: !1245)
!1301 = !DILocation(line: 432, column: 1, scope: !1245)
!1302 = distinct !DISubprogram(name: "PrintAry", linkageName: "_Z8PrintAryPfi", scope: !2, file: !2, line: 452, type: !671, isLocal: false, isDefinition: true, scopeLine: 453, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!1303 = !DILocalVariable(name: "ary", arg: 1, scope: !1302, file: !2, line: 452, type: !96)
!1304 = !DILocation(line: 452, column: 22, scope: !1302)
!1305 = !DILocalVariable(name: "ary_size", arg: 2, scope: !1302, file: !2, line: 452, type: !179)
!1306 = !DILocation(line: 452, column: 31, scope: !1302)
!1307 = !DILocalVariable(name: "i", scope: !1302, file: !2, line: 454, type: !179)
!1308 = !DILocation(line: 454, column: 6, scope: !1302)
!1309 = !DILocation(line: 455, column: 8, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1302, file: !2, line: 455, column: 2)
!1311 = !DILocation(line: 455, column: 7, scope: !1310)
!1312 = !DILocation(line: 455, column: 12, scope: !1313)
!1313 = !DILexicalBlockFile(scope: !1314, file: !2, discriminator: 1)
!1314 = distinct !DILexicalBlock(scope: !1310, file: !2, line: 455, column: 2)
!1315 = !DILocation(line: 455, column: 14, scope: !1313)
!1316 = !DILocation(line: 455, column: 13, scope: !1313)
!1317 = !DILocation(line: 455, column: 2, scope: !1313)
!1318 = !DILocation(line: 456, column: 19, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1314, file: !2, line: 455, column: 29)
!1320 = !DILocation(line: 456, column: 23, scope: !1319)
!1321 = !DILocation(line: 456, column: 3, scope: !1319)
!1322 = !DILocation(line: 457, column: 2, scope: !1319)
!1323 = !DILocation(line: 455, column: 25, scope: !1324)
!1324 = !DILexicalBlockFile(scope: !1314, file: !2, discriminator: 2)
!1325 = !DILocation(line: 455, column: 2, scope: !1324)
!1326 = distinct !{!1326, !1327}
!1327 = !DILocation(line: 455, column: 2, scope: !1302)
!1328 = !DILocation(line: 458, column: 2, scope: !1302)
!1329 = !DILocation(line: 459, column: 1, scope: !1302)
!1330 = distinct !DISubprogram(name: "BackSub", linkageName: "_Z7BackSubv", scope: !2, file: !2, line: 390, type: !375, isLocal: false, isDefinition: true, scopeLine: 391, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!1331 = !DILocation(line: 393, column: 30, scope: !1330)
!1332 = !DILocation(line: 393, column: 35, scope: !1330)
!1333 = !DILocation(line: 393, column: 23, scope: !1330)
!1334 = !DILocation(line: 393, column: 13, scope: !1330)
!1335 = !DILocation(line: 393, column: 11, scope: !1330)
!1336 = !DILocalVariable(name: "i", scope: !1330, file: !2, line: 395, type: !179)
!1337 = !DILocation(line: 395, column: 6, scope: !1330)
!1338 = !DILocalVariable(name: "j", scope: !1330, file: !2, line: 395, type: !179)
!1339 = !DILocation(line: 395, column: 8, scope: !1330)
!1340 = !DILocation(line: 396, column: 7, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1330, file: !2, line: 396, column: 2)
!1342 = !DILocation(line: 396, column: 6, scope: !1341)
!1343 = !DILocation(line: 396, column: 10, scope: !1344)
!1344 = !DILexicalBlockFile(scope: !1345, file: !2, discriminator: 1)
!1345 = distinct !DILexicalBlock(scope: !1341, file: !2, line: 396, column: 2)
!1346 = !DILocation(line: 396, column: 12, scope: !1344)
!1347 = !DILocation(line: 396, column: 11, scope: !1344)
!1348 = !DILocation(line: 396, column: 2, scope: !1344)
!1349 = !DILocation(line: 397, column: 22, scope: !1350)
!1350 = distinct !DILexicalBlock(scope: !1345, file: !2, line: 396, column: 21)
!1351 = !DILocation(line: 397, column: 24, scope: !1350)
!1352 = !DILocation(line: 397, column: 29, scope: !1350)
!1353 = !DILocation(line: 397, column: 28, scope: !1350)
!1354 = !DILocation(line: 397, column: 30, scope: !1350)
!1355 = !DILocation(line: 397, column: 3, scope: !1350)
!1356 = !DILocation(line: 397, column: 12, scope: !1350)
!1357 = !DILocation(line: 397, column: 17, scope: !1350)
!1358 = !DILocation(line: 397, column: 16, scope: !1350)
!1359 = !DILocation(line: 397, column: 18, scope: !1350)
!1360 = !DILocation(line: 397, column: 21, scope: !1350)
!1361 = !DILocation(line: 398, column: 8, scope: !1362)
!1362 = distinct !DILexicalBlock(scope: !1350, file: !2, line: 398, column: 3)
!1363 = !DILocation(line: 398, column: 7, scope: !1362)
!1364 = !DILocation(line: 398, column: 11, scope: !1365)
!1365 = !DILexicalBlockFile(scope: !1366, file: !2, discriminator: 1)
!1366 = distinct !DILexicalBlock(scope: !1362, file: !2, line: 398, column: 3)
!1367 = !DILocation(line: 398, column: 13, scope: !1365)
!1368 = !DILocation(line: 398, column: 12, scope: !1365)
!1369 = !DILocation(line: 398, column: 3, scope: !1365)
!1370 = !DILocation(line: 400, column: 26, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1366, file: !2, line: 399, column: 3)
!1372 = !DILocation(line: 400, column: 28, scope: !1371)
!1373 = !DILocation(line: 400, column: 34, scope: !1371)
!1374 = !DILocation(line: 400, column: 39, scope: !1371)
!1375 = !DILocation(line: 400, column: 38, scope: !1371)
!1376 = !DILocation(line: 400, column: 40, scope: !1371)
!1377 = !DILocation(line: 400, column: 32, scope: !1371)
!1378 = !DILocation(line: 400, column: 27, scope: !1371)
!1379 = !DILocation(line: 400, column: 45, scope: !1371)
!1380 = !DILocation(line: 400, column: 50, scope: !1371)
!1381 = !DILocation(line: 400, column: 49, scope: !1371)
!1382 = !DILocation(line: 400, column: 51, scope: !1371)
!1383 = !DILocation(line: 400, column: 43, scope: !1371)
!1384 = !DILocation(line: 400, column: 24, scope: !1371)
!1385 = !DILocation(line: 400, column: 58, scope: !1371)
!1386 = !DILocation(line: 400, column: 67, scope: !1371)
!1387 = !DILocation(line: 400, column: 72, scope: !1371)
!1388 = !DILocation(line: 400, column: 71, scope: !1371)
!1389 = !DILocation(line: 400, column: 73, scope: !1371)
!1390 = !DILocation(line: 400, column: 56, scope: !1371)
!1391 = !DILocation(line: 400, column: 4, scope: !1371)
!1392 = !DILocation(line: 400, column: 13, scope: !1371)
!1393 = !DILocation(line: 400, column: 18, scope: !1371)
!1394 = !DILocation(line: 400, column: 17, scope: !1371)
!1395 = !DILocation(line: 400, column: 19, scope: !1371)
!1396 = !DILocation(line: 400, column: 22, scope: !1371)
!1397 = !DILocation(line: 401, column: 3, scope: !1371)
!1398 = !DILocation(line: 398, column: 16, scope: !1399)
!1399 = !DILexicalBlockFile(scope: !1366, file: !2, discriminator: 2)
!1400 = !DILocation(line: 398, column: 3, scope: !1399)
!1401 = distinct !{!1401, !1402}
!1402 = !DILocation(line: 398, column: 3, scope: !1350)
!1403 = !DILocation(line: 402, column: 22, scope: !1350)
!1404 = !DILocation(line: 402, column: 31, scope: !1350)
!1405 = !DILocation(line: 402, column: 36, scope: !1350)
!1406 = !DILocation(line: 402, column: 35, scope: !1350)
!1407 = !DILocation(line: 402, column: 37, scope: !1350)
!1408 = !DILocation(line: 402, column: 44, scope: !1350)
!1409 = !DILocation(line: 402, column: 46, scope: !1350)
!1410 = !DILocation(line: 402, column: 52, scope: !1350)
!1411 = !DILocation(line: 402, column: 57, scope: !1350)
!1412 = !DILocation(line: 402, column: 56, scope: !1350)
!1413 = !DILocation(line: 402, column: 58, scope: !1350)
!1414 = !DILocation(line: 402, column: 50, scope: !1350)
!1415 = !DILocation(line: 402, column: 45, scope: !1350)
!1416 = !DILocation(line: 402, column: 63, scope: !1350)
!1417 = !DILocation(line: 402, column: 68, scope: !1350)
!1418 = !DILocation(line: 402, column: 67, scope: !1350)
!1419 = !DILocation(line: 402, column: 69, scope: !1350)
!1420 = !DILocation(line: 402, column: 61, scope: !1350)
!1421 = !DILocation(line: 402, column: 42, scope: !1350)
!1422 = !DILocation(line: 402, column: 40, scope: !1350)
!1423 = !DILocation(line: 402, column: 3, scope: !1350)
!1424 = !DILocation(line: 402, column: 12, scope: !1350)
!1425 = !DILocation(line: 402, column: 17, scope: !1350)
!1426 = !DILocation(line: 402, column: 16, scope: !1350)
!1427 = !DILocation(line: 402, column: 18, scope: !1350)
!1428 = !DILocation(line: 402, column: 21, scope: !1350)
!1429 = !DILocation(line: 403, column: 2, scope: !1350)
!1430 = !DILocation(line: 396, column: 18, scope: !1431)
!1431 = !DILexicalBlockFile(scope: !1345, file: !2, discriminator: 2)
!1432 = !DILocation(line: 396, column: 2, scope: !1431)
!1433 = distinct !{!1433, !1434}
!1434 = !DILocation(line: 396, column: 2, scope: !1330)
!1435 = !DILocation(line: 404, column: 1, scope: !1330)
!1436 = distinct !DISubprogram(name: "PrintDeviceProperties", linkageName: "_Z21PrintDevicePropertiesv", scope: !2, file: !2, line: 201, type: !375, isLocal: false, isDefinition: true, scopeLine: 201, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!1437 = !DILocalVariable(name: "deviceProp", scope: !1436, file: !2, line: 202, type: !1438)
!1438 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cudaDeviceProp", file: !5, line: 1307, size: 5184, align: 64, elements: !1439, identifier: "_ZTS14cudaDeviceProp")
!1439 = !{!1440, !1444, !1445, !1446, !1447, !1448, !1449, !1450, !1454, !1455, !1456, !1457, !1458, !1459, !1460, !1461, !1462, !1463, !1464, !1465, !1466, !1467, !1468, !1469, !1470, !1474, !1475, !1476, !1477, !1478, !1479, !1480, !1481, !1482, !1483, !1484, !1485, !1486, !1487, !1488, !1489, !1490, !1491, !1492, !1493, !1494, !1495, !1496, !1497, !1498, !1499, !1500, !1501, !1502, !1503, !1504, !1505, !1506, !1507, !1508, !1509, !1510, !1511, !1512, !1513, !1514}
!1440 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !1438, file: !5, line: 1309, baseType: !1441, size: 2048, align: 8)
!1441 = !DICompositeType(tag: DW_TAG_array_type, baseType: !260, size: 2048, align: 8, elements: !1442)
!1442 = !{!1443}
!1443 = !DISubrange(count: 256)
!1444 = !DIDerivedType(tag: DW_TAG_member, name: "totalGlobalMem", scope: !1438, file: !5, line: 1310, baseType: !402, size: 64, align: 64, offset: 2048)
!1445 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlock", scope: !1438, file: !5, line: 1311, baseType: !402, size: 64, align: 64, offset: 2112)
!1446 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerBlock", scope: !1438, file: !5, line: 1312, baseType: !179, size: 32, align: 32, offset: 2176)
!1447 = !DIDerivedType(tag: DW_TAG_member, name: "warpSize", scope: !1438, file: !5, line: 1313, baseType: !179, size: 32, align: 32, offset: 2208)
!1448 = !DIDerivedType(tag: DW_TAG_member, name: "memPitch", scope: !1438, file: !5, line: 1314, baseType: !402, size: 64, align: 64, offset: 2240)
!1449 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerBlock", scope: !1438, file: !5, line: 1315, baseType: !179, size: 32, align: 32, offset: 2304)
!1450 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsDim", scope: !1438, file: !5, line: 1316, baseType: !1451, size: 96, align: 32, offset: 2336)
!1451 = !DICompositeType(tag: DW_TAG_array_type, baseType: !179, size: 96, align: 32, elements: !1452)
!1452 = !{!1453}
!1453 = !DISubrange(count: 3)
!1454 = !DIDerivedType(tag: DW_TAG_member, name: "maxGridSize", scope: !1438, file: !5, line: 1317, baseType: !1451, size: 96, align: 32, offset: 2432)
!1455 = !DIDerivedType(tag: DW_TAG_member, name: "clockRate", scope: !1438, file: !5, line: 1318, baseType: !179, size: 32, align: 32, offset: 2528)
!1456 = !DIDerivedType(tag: DW_TAG_member, name: "totalConstMem", scope: !1438, file: !5, line: 1319, baseType: !402, size: 64, align: 64, offset: 2560)
!1457 = !DIDerivedType(tag: DW_TAG_member, name: "major", scope: !1438, file: !5, line: 1320, baseType: !179, size: 32, align: 32, offset: 2624)
!1458 = !DIDerivedType(tag: DW_TAG_member, name: "minor", scope: !1438, file: !5, line: 1321, baseType: !179, size: 32, align: 32, offset: 2656)
!1459 = !DIDerivedType(tag: DW_TAG_member, name: "textureAlignment", scope: !1438, file: !5, line: 1322, baseType: !402, size: 64, align: 64, offset: 2688)
!1460 = !DIDerivedType(tag: DW_TAG_member, name: "texturePitchAlignment", scope: !1438, file: !5, line: 1323, baseType: !402, size: 64, align: 64, offset: 2752)
!1461 = !DIDerivedType(tag: DW_TAG_member, name: "deviceOverlap", scope: !1438, file: !5, line: 1324, baseType: !179, size: 32, align: 32, offset: 2816)
!1462 = !DIDerivedType(tag: DW_TAG_member, name: "multiProcessorCount", scope: !1438, file: !5, line: 1325, baseType: !179, size: 32, align: 32, offset: 2848)
!1463 = !DIDerivedType(tag: DW_TAG_member, name: "kernelExecTimeoutEnabled", scope: !1438, file: !5, line: 1326, baseType: !179, size: 32, align: 32, offset: 2880)
!1464 = !DIDerivedType(tag: DW_TAG_member, name: "integrated", scope: !1438, file: !5, line: 1327, baseType: !179, size: 32, align: 32, offset: 2912)
!1465 = !DIDerivedType(tag: DW_TAG_member, name: "canMapHostMemory", scope: !1438, file: !5, line: 1328, baseType: !179, size: 32, align: 32, offset: 2944)
!1466 = !DIDerivedType(tag: DW_TAG_member, name: "computeMode", scope: !1438, file: !5, line: 1329, baseType: !179, size: 32, align: 32, offset: 2976)
!1467 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1D", scope: !1438, file: !5, line: 1330, baseType: !179, size: 32, align: 32, offset: 3008)
!1468 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DMipmap", scope: !1438, file: !5, line: 1331, baseType: !179, size: 32, align: 32, offset: 3040)
!1469 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLinear", scope: !1438, file: !5, line: 1332, baseType: !179, size: 32, align: 32, offset: 3072)
!1470 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2D", scope: !1438, file: !5, line: 1333, baseType: !1471, size: 64, align: 32, offset: 3104)
!1471 = !DICompositeType(tag: DW_TAG_array_type, baseType: !179, size: 64, align: 32, elements: !1472)
!1472 = !{!1473}
!1473 = !DISubrange(count: 2)
!1474 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DMipmap", scope: !1438, file: !5, line: 1334, baseType: !1471, size: 64, align: 32, offset: 3168)
!1475 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLinear", scope: !1438, file: !5, line: 1335, baseType: !1451, size: 96, align: 32, offset: 3232)
!1476 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DGather", scope: !1438, file: !5, line: 1336, baseType: !1471, size: 64, align: 32, offset: 3328)
!1477 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3D", scope: !1438, file: !5, line: 1337, baseType: !1451, size: 96, align: 32, offset: 3392)
!1478 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3DAlt", scope: !1438, file: !5, line: 1338, baseType: !1451, size: 96, align: 32, offset: 3488)
!1479 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemap", scope: !1438, file: !5, line: 1339, baseType: !179, size: 32, align: 32, offset: 3584)
!1480 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLayered", scope: !1438, file: !5, line: 1340, baseType: !1471, size: 64, align: 32, offset: 3616)
!1481 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLayered", scope: !1438, file: !5, line: 1341, baseType: !1451, size: 96, align: 32, offset: 3680)
!1482 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemapLayered", scope: !1438, file: !5, line: 1342, baseType: !1471, size: 64, align: 32, offset: 3776)
!1483 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1D", scope: !1438, file: !5, line: 1343, baseType: !179, size: 32, align: 32, offset: 3840)
!1484 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2D", scope: !1438, file: !5, line: 1344, baseType: !1471, size: 64, align: 32, offset: 3872)
!1485 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface3D", scope: !1438, file: !5, line: 1345, baseType: !1451, size: 96, align: 32, offset: 3936)
!1486 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1DLayered", scope: !1438, file: !5, line: 1346, baseType: !1471, size: 64, align: 32, offset: 4032)
!1487 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2DLayered", scope: !1438, file: !5, line: 1347, baseType: !1451, size: 96, align: 32, offset: 4096)
!1488 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemap", scope: !1438, file: !5, line: 1348, baseType: !179, size: 32, align: 32, offset: 4192)
!1489 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemapLayered", scope: !1438, file: !5, line: 1349, baseType: !1471, size: 64, align: 32, offset: 4224)
!1490 = !DIDerivedType(tag: DW_TAG_member, name: "surfaceAlignment", scope: !1438, file: !5, line: 1350, baseType: !402, size: 64, align: 64, offset: 4288)
!1491 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentKernels", scope: !1438, file: !5, line: 1351, baseType: !179, size: 32, align: 32, offset: 4352)
!1492 = !DIDerivedType(tag: DW_TAG_member, name: "ECCEnabled", scope: !1438, file: !5, line: 1352, baseType: !179, size: 32, align: 32, offset: 4384)
!1493 = !DIDerivedType(tag: DW_TAG_member, name: "pciBusID", scope: !1438, file: !5, line: 1353, baseType: !179, size: 32, align: 32, offset: 4416)
!1494 = !DIDerivedType(tag: DW_TAG_member, name: "pciDeviceID", scope: !1438, file: !5, line: 1354, baseType: !179, size: 32, align: 32, offset: 4448)
!1495 = !DIDerivedType(tag: DW_TAG_member, name: "pciDomainID", scope: !1438, file: !5, line: 1355, baseType: !179, size: 32, align: 32, offset: 4480)
!1496 = !DIDerivedType(tag: DW_TAG_member, name: "tccDriver", scope: !1438, file: !5, line: 1356, baseType: !179, size: 32, align: 32, offset: 4512)
!1497 = !DIDerivedType(tag: DW_TAG_member, name: "asyncEngineCount", scope: !1438, file: !5, line: 1357, baseType: !179, size: 32, align: 32, offset: 4544)
!1498 = !DIDerivedType(tag: DW_TAG_member, name: "unifiedAddressing", scope: !1438, file: !5, line: 1358, baseType: !179, size: 32, align: 32, offset: 4576)
!1499 = !DIDerivedType(tag: DW_TAG_member, name: "memoryClockRate", scope: !1438, file: !5, line: 1359, baseType: !179, size: 32, align: 32, offset: 4608)
!1500 = !DIDerivedType(tag: DW_TAG_member, name: "memoryBusWidth", scope: !1438, file: !5, line: 1360, baseType: !179, size: 32, align: 32, offset: 4640)
!1501 = !DIDerivedType(tag: DW_TAG_member, name: "l2CacheSize", scope: !1438, file: !5, line: 1361, baseType: !179, size: 32, align: 32, offset: 4672)
!1502 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerMultiProcessor", scope: !1438, file: !5, line: 1362, baseType: !179, size: 32, align: 32, offset: 4704)
!1503 = !DIDerivedType(tag: DW_TAG_member, name: "streamPrioritiesSupported", scope: !1438, file: !5, line: 1363, baseType: !179, size: 32, align: 32, offset: 4736)
!1504 = !DIDerivedType(tag: DW_TAG_member, name: "globalL1CacheSupported", scope: !1438, file: !5, line: 1364, baseType: !179, size: 32, align: 32, offset: 4768)
!1505 = !DIDerivedType(tag: DW_TAG_member, name: "localL1CacheSupported", scope: !1438, file: !5, line: 1365, baseType: !179, size: 32, align: 32, offset: 4800)
!1506 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerMultiprocessor", scope: !1438, file: !5, line: 1366, baseType: !402, size: 64, align: 64, offset: 4864)
!1507 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerMultiprocessor", scope: !1438, file: !5, line: 1367, baseType: !179, size: 32, align: 32, offset: 4928)
!1508 = !DIDerivedType(tag: DW_TAG_member, name: "managedMemory", scope: !1438, file: !5, line: 1368, baseType: !179, size: 32, align: 32, offset: 4960)
!1509 = !DIDerivedType(tag: DW_TAG_member, name: "isMultiGpuBoard", scope: !1438, file: !5, line: 1369, baseType: !179, size: 32, align: 32, offset: 4992)
!1510 = !DIDerivedType(tag: DW_TAG_member, name: "multiGpuBoardGroupID", scope: !1438, file: !5, line: 1370, baseType: !179, size: 32, align: 32, offset: 5024)
!1511 = !DIDerivedType(tag: DW_TAG_member, name: "hostNativeAtomicSupported", scope: !1438, file: !5, line: 1371, baseType: !179, size: 32, align: 32, offset: 5056)
!1512 = !DIDerivedType(tag: DW_TAG_member, name: "singleToDoublePrecisionPerfRatio", scope: !1438, file: !5, line: 1372, baseType: !179, size: 32, align: 32, offset: 5088)
!1513 = !DIDerivedType(tag: DW_TAG_member, name: "pageableMemoryAccess", scope: !1438, file: !5, line: 1373, baseType: !179, size: 32, align: 32, offset: 5120)
!1514 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentManagedAccess", scope: !1438, file: !5, line: 1374, baseType: !179, size: 32, align: 32, offset: 5152)
!1515 = !DILocation(line: 202, column: 17, scope: !1436)
!1516 = !DILocalVariable(name: "nDevCount", scope: !1436, file: !2, line: 203, type: !179)
!1517 = !DILocation(line: 203, column: 6, scope: !1436)
!1518 = !DILocation(line: 205, column: 2, scope: !1436)
!1519 = !DILocation(line: 206, column: 36, scope: !1436)
!1520 = !DILocation(line: 206, column: 2, scope: !1436)
!1521 = !DILocalVariable(name: "nDeviceIdx", scope: !1522, file: !2, line: 207, type: !179)
!1522 = distinct !DILexicalBlock(scope: !1436, file: !2, line: 207, column: 2)
!1523 = !DILocation(line: 207, column: 11, scope: !1522)
!1524 = !DILocation(line: 207, column: 7, scope: !1522)
!1525 = !DILocation(line: 207, column: 27, scope: !1526)
!1526 = !DILexicalBlockFile(scope: !1527, file: !2, discriminator: 1)
!1527 = distinct !DILexicalBlock(scope: !1522, file: !2, line: 207, column: 2)
!1528 = !DILocation(line: 207, column: 40, scope: !1526)
!1529 = !DILocation(line: 207, column: 38, scope: !1526)
!1530 = !DILocation(line: 207, column: 2, scope: !1526)
!1531 = !DILocation(line: 209, column: 6, scope: !1532)
!1532 = distinct !DILexicalBlock(scope: !1527, file: !2, line: 208, column: 2)
!1533 = !DILocation(line: 210, column: 62, scope: !1534)
!1534 = distinct !DILexicalBlock(scope: !1532, file: !2, line: 210, column: 10)
!1535 = !DILocation(line: 210, column: 25, scope: !1534)
!1536 = !DILocation(line: 210, column: 22, scope: !1534)
!1537 = !DILocation(line: 210, column: 10, scope: !1532)
!1538 = !DILocation(line: 212, column: 52, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1534, file: !2, line: 211, column: 10)
!1540 = !DILocation(line: 212, column: 41, scope: !1539)
!1541 = !DILocation(line: 212, column: 5, scope: !1539)
!1542 = !DILocation(line: 213, column: 8, scope: !1539)
!1543 = !DILocation(line: 214, column: 67, scope: !1539)
!1544 = !DILocation(line: 214, column: 81, scope: !1539)
!1545 = !DILocation(line: 214, column: 8, scope: !1539)
!1546 = !DILocation(line: 215, column: 78, scope: !1539)
!1547 = !DILocation(line: 215, column: 95, scope: !1539)
!1548 = !DILocation(line: 215, column: 8, scope: !1539)
!1549 = !DILocation(line: 216, column: 77, scope: !1539)
!1550 = !DILocation(line: 216, column: 8, scope: !1539)
!1551 = !DILocation(line: 217, column: 65, scope: !1539)
!1552 = !DILocation(line: 217, column: 8, scope: !1539)
!1553 = !DILocation(line: 218, column: 66, scope: !1539)
!1554 = !DILocation(line: 218, column: 8, scope: !1539)
!1555 = !DILocation(line: 219, column: 68, scope: !1539)
!1556 = !DILocation(line: 219, column: 8, scope: !1539)
!1557 = !DILocation(line: 220, column: 79, scope: !1539)
!1558 = !DILocation(line: 220, column: 68, scope: !1539)
!1559 = !DILocation(line: 220, column: 108, scope: !1539)
!1560 = !DILocation(line: 220, column: 97, scope: !1539)
!1561 = !DILocation(line: 220, column: 137, scope: !1539)
!1562 = !DILocation(line: 220, column: 126, scope: !1539)
!1563 = !DILocation(line: 220, column: 8, scope: !1539)
!1564 = !DILocation(line: 221, column: 78, scope: !1539)
!1565 = !DILocation(line: 221, column: 67, scope: !1539)
!1566 = !DILocation(line: 221, column: 105, scope: !1539)
!1567 = !DILocation(line: 221, column: 94, scope: !1539)
!1568 = !DILocation(line: 221, column: 132, scope: !1539)
!1569 = !DILocation(line: 221, column: 121, scope: !1539)
!1570 = !DILocation(line: 221, column: 8, scope: !1539)
!1571 = !DILocation(line: 222, column: 73, scope: !1539)
!1572 = !DILocation(line: 222, column: 8, scope: !1539)
!1573 = !DILocation(line: 223, column: 58, scope: !1539)
!1574 = !DILocation(line: 223, column: 76, scope: !1539)
!1575 = !DILocation(line: 223, column: 8, scope: !1539)
!1576 = !DILocation(line: 224, column: 61, scope: !1539)
!1577 = !DILocation(line: 224, column: 8, scope: !1539)
!1578 = !DILocation(line: 225, column: 69, scope: !1539)
!1579 = !DILocation(line: 225, column: 8, scope: !1539)
!1580 = !DILocation(line: 226, column: 62, scope: !1539)
!1581 = !DILocation(line: 226, column: 50, scope: !1539)
!1582 = !DILocation(line: 226, column: 8, scope: !1539)
!1583 = !DILocation(line: 227, column: 73, scope: !1539)
!1584 = !DILocation(line: 227, column: 8, scope: !1539)
!1585 = !DILocation(line: 228, column: 4, scope: !1539)
!1586 = !DILocation(line: 230, column: 45, scope: !1534)
!1587 = !DILocation(line: 230, column: 26, scope: !1588)
!1588 = !DILexicalBlockFile(scope: !1534, file: !2, discriminator: 1)
!1589 = !DILocation(line: 230, column: 10, scope: !1590)
!1590 = !DILexicalBlockFile(scope: !1534, file: !2, discriminator: 2)
!1591 = !DILocation(line: 231, column: 2, scope: !1532)
!1592 = !DILocation(line: 207, column: 51, scope: !1593)
!1593 = !DILexicalBlockFile(scope: !1527, file: !2, discriminator: 2)
!1594 = !DILocation(line: 207, column: 2, scope: !1593)
!1595 = distinct !{!1595, !1596}
!1596 = !DILocation(line: 207, column: 2, scope: !1436)
!1597 = !DILocation(line: 232, column: 1, scope: !1436)
!1598 = distinct !DISubprogram(name: "InitMat", linkageName: "_Z7InitMatPfii", scope: !2, file: !2, line: 406, type: !1246, isLocal: false, isDefinition: true, scopeLine: 407, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!1599 = !DILocalVariable(name: "ary", arg: 1, scope: !1598, file: !2, line: 406, type: !96)
!1600 = !DILocation(line: 406, column: 21, scope: !1598)
!1601 = !DILocalVariable(name: "nrow", arg: 2, scope: !1598, file: !2, line: 406, type: !179)
!1602 = !DILocation(line: 406, column: 30, scope: !1598)
!1603 = !DILocalVariable(name: "ncol", arg: 3, scope: !1598, file: !2, line: 406, type: !179)
!1604 = !DILocation(line: 406, column: 40, scope: !1598)
!1605 = !DILocalVariable(name: "i", scope: !1598, file: !2, line: 408, type: !179)
!1606 = !DILocation(line: 408, column: 6, scope: !1598)
!1607 = !DILocalVariable(name: "j", scope: !1598, file: !2, line: 408, type: !179)
!1608 = !DILocation(line: 408, column: 9, scope: !1598)
!1609 = !DILocation(line: 410, column: 8, scope: !1610)
!1610 = distinct !DILexicalBlock(scope: !1598, file: !2, line: 410, column: 2)
!1611 = !DILocation(line: 410, column: 7, scope: !1610)
!1612 = !DILocation(line: 410, column: 12, scope: !1613)
!1613 = !DILexicalBlockFile(scope: !1614, file: !2, discriminator: 1)
!1614 = distinct !DILexicalBlock(scope: !1610, file: !2, line: 410, column: 2)
!1615 = !DILocation(line: 410, column: 14, scope: !1613)
!1616 = !DILocation(line: 410, column: 13, scope: !1613)
!1617 = !DILocation(line: 410, column: 2, scope: !1613)
!1618 = !DILocation(line: 411, column: 9, scope: !1619)
!1619 = distinct !DILexicalBlock(scope: !1620, file: !2, line: 411, column: 3)
!1620 = distinct !DILexicalBlock(scope: !1614, file: !2, line: 410, column: 25)
!1621 = !DILocation(line: 411, column: 8, scope: !1619)
!1622 = !DILocation(line: 411, column: 13, scope: !1623)
!1623 = !DILexicalBlockFile(scope: !1624, file: !2, discriminator: 1)
!1624 = distinct !DILexicalBlock(scope: !1619, file: !2, line: 411, column: 3)
!1625 = !DILocation(line: 411, column: 15, scope: !1623)
!1626 = !DILocation(line: 411, column: 14, scope: !1623)
!1627 = !DILocation(line: 411, column: 3, scope: !1623)
!1628 = !DILocation(line: 412, column: 11, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1624, file: !2, line: 411, column: 26)
!1630 = !DILocation(line: 412, column: 22, scope: !1629)
!1631 = !DILocation(line: 412, column: 26, scope: !1629)
!1632 = !DILocation(line: 412, column: 31, scope: !1629)
!1633 = !DILocation(line: 412, column: 30, scope: !1629)
!1634 = !DILocation(line: 412, column: 25, scope: !1629)
!1635 = !DILocation(line: 412, column: 33, scope: !1629)
!1636 = !DILocation(line: 412, column: 32, scope: !1629)
!1637 = !DILocation(line: 412, column: 4, scope: !1629)
!1638 = !DILocation(line: 413, column: 3, scope: !1629)
!1639 = !DILocation(line: 411, column: 22, scope: !1640)
!1640 = !DILexicalBlockFile(scope: !1624, file: !2, discriminator: 2)
!1641 = !DILocation(line: 411, column: 3, scope: !1640)
!1642 = distinct !{!1642, !1643}
!1643 = !DILocation(line: 411, column: 3, scope: !1620)
!1644 = !DILocation(line: 414, column: 2, scope: !1620)
!1645 = !DILocation(line: 410, column: 21, scope: !1646)
!1646 = !DILexicalBlockFile(scope: !1614, file: !2, discriminator: 2)
!1647 = !DILocation(line: 410, column: 2, scope: !1646)
!1648 = distinct !{!1648, !1649}
!1649 = !DILocation(line: 410, column: 2, scope: !1598)
!1650 = !DILocation(line: 415, column: 1, scope: !1598)
!1651 = distinct !DISubprogram(name: "InitAry", linkageName: "_Z7InitAryPfi", scope: !2, file: !2, line: 439, type: !671, isLocal: false, isDefinition: true, scopeLine: 440, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!1652 = !DILocalVariable(name: "ary", arg: 1, scope: !1651, file: !2, line: 439, type: !96)
!1653 = !DILocation(line: 439, column: 21, scope: !1651)
!1654 = !DILocalVariable(name: "ary_size", arg: 2, scope: !1651, file: !2, line: 439, type: !179)
!1655 = !DILocation(line: 439, column: 30, scope: !1651)
!1656 = !DILocalVariable(name: "i", scope: !1651, file: !2, line: 441, type: !179)
!1657 = !DILocation(line: 441, column: 6, scope: !1651)
!1658 = !DILocation(line: 443, column: 8, scope: !1659)
!1659 = distinct !DILexicalBlock(scope: !1651, file: !2, line: 443, column: 2)
!1660 = !DILocation(line: 443, column: 7, scope: !1659)
!1661 = !DILocation(line: 443, column: 12, scope: !1662)
!1662 = !DILexicalBlockFile(scope: !1663, file: !2, discriminator: 1)
!1663 = distinct !DILexicalBlock(scope: !1659, file: !2, line: 443, column: 2)
!1664 = !DILocation(line: 443, column: 14, scope: !1662)
!1665 = !DILocation(line: 443, column: 13, scope: !1662)
!1666 = !DILocation(line: 443, column: 2, scope: !1662)
!1667 = !DILocation(line: 444, column: 10, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1663, file: !2, line: 443, column: 29)
!1669 = !DILocation(line: 444, column: 22, scope: !1668)
!1670 = !DILocation(line: 444, column: 26, scope: !1668)
!1671 = !DILocation(line: 444, column: 3, scope: !1668)
!1672 = !DILocation(line: 445, column: 2, scope: !1668)
!1673 = !DILocation(line: 443, column: 25, scope: !1674)
!1674 = !DILexicalBlockFile(scope: !1663, file: !2, discriminator: 2)
!1675 = !DILocation(line: 443, column: 2, scope: !1674)
!1676 = distinct !{!1676, !1677}
!1677 = !DILocation(line: 443, column: 2, scope: !1651)
!1678 = !DILocation(line: 446, column: 1, scope: !1651)
!1679 = distinct !DISubprogram(name: "Fan1", linkageName: "_Z4Fan1PfS_ii", scope: !2, file: !2, line: 289, type: !1680, isLocal: false, isDefinition: true, scopeLine: 290, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!1680 = !DISubroutineType(types: !1681)
!1681 = !{null, !96, !96, !179, !179}
!1682 = !DILocalVariable(name: "m_cuda", arg: 1, scope: !1679, file: !2, line: 289, type: !96)
!1683 = !DILocation(line: 289, column: 29, scope: !1679)
!1684 = !DILocalVariable(name: "a_cuda", arg: 2, scope: !1679, file: !2, line: 289, type: !96)
!1685 = !DILocation(line: 289, column: 44, scope: !1679)
!1686 = !DILocalVariable(name: "Size", arg: 3, scope: !1679, file: !2, line: 289, type: !179)
!1687 = !DILocation(line: 289, column: 56, scope: !1679)
!1688 = !DILocalVariable(name: "t", arg: 4, scope: !1679, file: !2, line: 289, type: !179)
!1689 = !DILocation(line: 289, column: 66, scope: !1679)
!1690 = !DILocation(line: 290, column: 1, scope: !1679)
!1691 = !DILocation(line: 290, column: 1, scope: !1692)
!1692 = !DILexicalBlockFile(scope: !1679, file: !2, discriminator: 1)
!1693 = !DILocation(line: 290, column: 1, scope: !1694)
!1694 = !DILexicalBlockFile(scope: !1679, file: !2, discriminator: 2)
!1695 = !DILocation(line: 290, column: 1, scope: !1696)
!1696 = !DILexicalBlockFile(scope: !1679, file: !2, discriminator: 3)
!1697 = !DILocation(line: 290, column: 1, scope: !1698)
!1698 = !DILexicalBlockFile(scope: !1679, file: !2, discriminator: 4)
!1699 = !DILocation(line: 296, column: 1, scope: !1679)
!1700 = distinct !DISubprogram(name: "Fan2", linkageName: "_Z4Fan2PfS_S_iii", scope: !2, file: !2, line: 303, type: !1701, isLocal: false, isDefinition: true, scopeLine: 304, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!1701 = !DISubroutineType(types: !1702)
!1702 = !{null, !96, !96, !96, !179, !179, !179}
!1703 = !DILocalVariable(name: "m_cuda", arg: 1, scope: !1700, file: !2, line: 303, type: !96)
!1704 = !DILocation(line: 303, column: 29, scope: !1700)
!1705 = !DILocalVariable(name: "a_cuda", arg: 2, scope: !1700, file: !2, line: 303, type: !96)
!1706 = !DILocation(line: 303, column: 44, scope: !1700)
!1707 = !DILocalVariable(name: "b_cuda", arg: 3, scope: !1700, file: !2, line: 303, type: !96)
!1708 = !DILocation(line: 303, column: 59, scope: !1700)
!1709 = !DILocalVariable(name: "Size", arg: 4, scope: !1700, file: !2, line: 303, type: !179)
!1710 = !DILocation(line: 303, column: 70, scope: !1700)
!1711 = !DILocalVariable(name: "j1", arg: 5, scope: !1700, file: !2, line: 303, type: !179)
!1712 = !DILocation(line: 303, column: 80, scope: !1700)
!1713 = !DILocalVariable(name: "t", arg: 6, scope: !1700, file: !2, line: 303, type: !179)
!1714 = !DILocation(line: 303, column: 88, scope: !1700)
!1715 = !DILocation(line: 304, column: 1, scope: !1700)
!1716 = !DILocation(line: 304, column: 1, scope: !1717)
!1717 = !DILexicalBlockFile(scope: !1700, file: !2, discriminator: 1)
!1718 = !DILocation(line: 304, column: 1, scope: !1719)
!1719 = !DILexicalBlockFile(scope: !1700, file: !2, discriminator: 2)
!1720 = !DILocation(line: 304, column: 1, scope: !1721)
!1721 = !DILexicalBlockFile(scope: !1700, file: !2, discriminator: 3)
!1722 = !DILocation(line: 304, column: 1, scope: !1723)
!1723 = !DILexicalBlockFile(scope: !1700, file: !2, discriminator: 4)
!1724 = !DILocation(line: 304, column: 1, scope: !1725)
!1725 = !DILexicalBlockFile(scope: !1700, file: !2, discriminator: 5)
!1726 = !DILocation(line: 304, column: 1, scope: !1727)
!1727 = !DILexicalBlockFile(scope: !1700, file: !2, discriminator: 6)
!1728 = !DILocation(line: 319, column: 1, scope: !1700)
!1729 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1109, file: !1108, line: 421, type: !1115, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !1, declaration: !1114, variables: !673)
!1730 = !DILocalVariable(name: "this", arg: 1, scope: !1729, type: !1731, flags: DIFlagArtificial | DIFlagObjectPointer)
!1731 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1109, size: 64, align: 64)
!1732 = !DILocation(line: 0, scope: !1729)
!1733 = !DILocalVariable(name: "vx", arg: 2, scope: !1729, file: !1108, line: 421, type: !112)
!1734 = !DILocation(line: 421, column: 43, scope: !1729)
!1735 = !DILocalVariable(name: "vy", arg: 3, scope: !1729, file: !1108, line: 421, type: !112)
!1736 = !DILocation(line: 421, column: 64, scope: !1729)
!1737 = !DILocalVariable(name: "vz", arg: 4, scope: !1729, file: !1108, line: 421, type: !112)
!1738 = !DILocation(line: 421, column: 85, scope: !1729)
!1739 = !DILocation(line: 421, column: 95, scope: !1729)
!1740 = !DILocation(line: 421, column: 97, scope: !1729)
!1741 = !DILocation(line: 421, column: 102, scope: !1729)
!1742 = !DILocation(line: 421, column: 104, scope: !1729)
!1743 = !DILocation(line: 421, column: 109, scope: !1729)
!1744 = !DILocation(line: 421, column: 111, scope: !1729)
!1745 = !DILocation(line: 421, column: 116, scope: !1729)
!1746 = distinct !DISubprogram(name: "checkCUDAError", linkageName: "_Z14checkCUDAErrorPKc", scope: !2, file: !2, line: 460, type: !1747, isLocal: false, isDefinition: true, scopeLine: 461, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !673)
!1747 = !DISubroutineType(types: !1748)
!1748 = !{null, !258}
!1749 = !DILocalVariable(name: "msg", arg: 1, scope: !1746, file: !2, line: 460, type: !258)
!1750 = !DILocation(line: 460, column: 33, scope: !1746)
!1751 = !DILocalVariable(name: "err", scope: !1746, file: !2, line: 462, type: !1752)
!1752 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !5, line: 1477, baseType: !4)
!1753 = !DILocation(line: 462, column: 17, scope: !1746)
!1754 = !DILocation(line: 462, column: 23, scope: !1746)
!1755 = !DILocation(line: 463, column: 24, scope: !1756)
!1756 = distinct !DILexicalBlock(scope: !1746, file: !2, line: 463, column: 9)
!1757 = !DILocation(line: 463, column: 21, scope: !1756)
!1758 = !DILocation(line: 463, column: 9, scope: !1746)
!1759 = !DILocation(line: 465, column: 17, scope: !1760)
!1760 = distinct !DILexicalBlock(scope: !1756, file: !2, line: 464, column: 5)
!1761 = !DILocation(line: 465, column: 50, scope: !1760)
!1762 = !DILocation(line: 466, column: 55, scope: !1760)
!1763 = !DILocation(line: 466, column: 35, scope: !1760)
!1764 = !DILocation(line: 465, column: 9, scope: !1760)
!1765 = !DILocation(line: 467, column: 9, scope: !1760)
!1766 = !DILocation(line: 469, column: 1, scope: !1746)
