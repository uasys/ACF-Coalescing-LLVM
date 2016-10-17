; ModuleID = 'streamcluster_cuda_cpu.cpp'
source_filename = "streamcluster_cuda_cpu.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.Points = type { i64, i32, %struct.Point* }
%struct.Point = type { float, float*, i64, float }
%union.pthread_barrier_t = type { i64, [24 x i8] }
%struct.pkmedian_arg_t = type { %struct.Points*, i64, i64, i64*, i32, %union.pthread_barrier_t* }
%class.PStream = type { i32 (...)** }
%class.SimStream = type { %class.PStream, i64 }
%class.FileStream = type { %class.PStream, %struct._IO_FILE* }

$_ZN9SimStreamC2El = comdat any

$_ZN10FileStreamC2EPc = comdat any

$_ZN7PStreamC2Ev = comdat any

$_ZN9SimStream4readEPfii = comdat any

$_ZN9SimStream6ferrorEv = comdat any

$_ZN9SimStream4feofEv = comdat any

$_ZN9SimStreamD2Ev = comdat any

$_ZN9SimStreamD0Ev = comdat any

$_ZN7PStreamD2Ev = comdat any

$_ZN7PStreamD0Ev = comdat any

$__clang_call_terminate = comdat any

$_ZN10FileStream4readEPfii = comdat any

$_ZN10FileStream6ferrorEv = comdat any

$_ZN10FileStream4feofEv = comdat any

$_ZN10FileStreamD2Ev = comdat any

$_ZN10FileStreamD0Ev = comdat any

$_ZTV9SimStream = comdat any

$_ZTS9SimStream = comdat any

$_ZTS7PStream = comdat any

$_ZTI7PStream = comdat any

$_ZTI9SimStream = comdat any

$_ZTV7PStream = comdat any

$_ZTV10FileStream = comdat any

$_ZTS10FileStream = comdat any

$_ZTI10FileStream = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@isCoordChanged = global i8 0, align 1
@serial_t = global double 0.000000e+00, align 8
@cpu_to_gpu_t = global double 0.000000e+00, align 8
@gpu_to_cpu_t = global double 0.000000e+00, align 8
@alloc_t = global double 0.000000e+00, align 8
@kernel_t = global double 0.000000e+00, align 8
@free_t = global double 0.000000e+00, align 8
@time_local_search = global double 0.000000e+00, align 8
@time_speedy = global double 0.000000e+00, align 8
@time_select_feasible = global double 0.000000e+00, align 8
@time_gain = global double 0.000000e+00, align 8
@time_shuffle = global double 0.000000e+00, align 8
@time_gain_dist = global double 0.000000e+00, align 8
@time_gain_init = global double 0.000000e+00, align 8
@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@_ZL5nproc = internal global i32 0, align 4
@_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE9totalcost = internal global float 0.000000e+00, align 4
@_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE4open = internal global i8 0, align 1
@_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE5costs = internal global float* null, align 8
@_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i = internal global i32 0, align 4
@_ZL9is_center = internal global i8* null, align 8
@_ZL12center_table = internal global i32* null, align 8
@_ZL17switch_membership = internal global i8* null, align 8
@_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k = internal global i64 0, align 8
@_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE8feasible = internal global i32* null, align 8
@_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE11numfeasible = internal global i32 0, align 4
@_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs = internal global float* null, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [18 x i8] c"error opening %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"%lf\0A\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"%lf \00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@.str.7 = private unnamed_addr constant [32 x i8] c"not enough memory for a chunk!\0A\00", align 1
@.str.8 = private unnamed_addr constant [16 x i8] c"read %d points\0A\00", align 1
@.str.9 = private unnamed_addr constant [21 x i8] c"error reading data!\0A\00", align 1
@.str.10 = private unnamed_addr constant [21 x i8] c"finish local search\0A\00", align 1
@.str.11 = private unnamed_addr constant [33 x i8] c"oops! no more space for centers\0A\00", align 1
@.str.12 = private unnamed_addr constant [24 x i8] c"PARSEC Benchmark Suite\0A\00", align 1
@.str.13 = private unnamed_addr constant [64 x i8] c"usage: %s k1 k2 d n chunksize clustersize infile outfile nproc\0A\00", align 1
@.str.14 = private unnamed_addr constant [47 x i8] c"  k1:          Min. number of centers allowed\0A\00", align 1
@.str.15 = private unnamed_addr constant [47 x i8] c"  k2:          Max. number of centers allowed\0A\00", align 1
@.str.16 = private unnamed_addr constant [45 x i8] c"  d:           Dimension of each data point\0A\00", align 1
@.str.17 = private unnamed_addr constant [38 x i8] c"  n:           Number of data points\0A\00", align 1
@.str.18 = private unnamed_addr constant [57 x i8] c"  chunksize:   Number of data points to handle per step\0A\00", align 1
@.str.19 = private unnamed_addr constant [55 x i8] c"  clustersize: Maximum number of intermediate centers\0A\00", align 1
@.str.20 = private unnamed_addr constant [37 x i8] c"  infile:      Input file (if n<=0)\0A\00", align 1
@.str.21 = private unnamed_addr constant [28 x i8] c"  outfile:     Output file\0A\00", align 1
@.str.22 = private unnamed_addr constant [41 x i8] c"  nproc:       Number of threads to use\0A\00", align 1
@.str.23 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.24 = private unnamed_addr constant [77 x i8] c"if n > 0, points will be randomly generated instead of reading from infile.\0A\00", align 1
@.str.25 = private unnamed_addr constant [13 x i8] c"time = %lfs\0A\00", align 1
@.str.26 = private unnamed_addr constant [19 x i8] c"time pgain = %lfs\0A\00", align 1
@.str.27 = private unnamed_addr constant [24 x i8] c"time pgain_dist = %lfs\0A\00", align 1
@.str.28 = private unnamed_addr constant [24 x i8] c"time pgain_init = %lfs\0A\00", align 1
@.str.29 = private unnamed_addr constant [21 x i8] c"time pselect = %lfs\0A\00", align 1
@.str.30 = private unnamed_addr constant [21 x i8] c"time pspeedy = %lfs\0A\00", align 1
@.str.31 = private unnamed_addr constant [22 x i8] c"time pshuffle = %lfs\0A\00", align 1
@.str.32 = private unnamed_addr constant [25 x i8] c"time localSearch = %lfs\0A\00", align 1
@.str.33 = private unnamed_addr constant [34 x i8] c"====CUDA Timing info (pgain)====\0A\00", align 1
@.str.34 = private unnamed_addr constant [20 x i8] c"time serial = %lfs\0A\00", align 1
@.str.35 = private unnamed_addr constant [36 x i8] c"time CPU to GPU memory copy = %lfs\0A\00", align 1
@.str.36 = private unnamed_addr constant [41 x i8] c"time GPU to CPU memory copy back = %lfs\0A\00", align 1
@.str.37 = private unnamed_addr constant [24 x i8] c"time GPU malloc = %lfs\0A\00", align 1
@.str.38 = private unnamed_addr constant [22 x i8] c"time GPU free = %lfs\0A\00", align 1
@.str.39 = private unnamed_addr constant [20 x i8] c"time kernel = %lfs\0A\00", align 1
@_ZTV9SimStream = linkonce_odr unnamed_addr constant [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTI9SimStream to i8*), i8* bitcast (i64 (%class.SimStream*, float*, i32, i32)* @_ZN9SimStream4readEPfii to i8*), i8* bitcast (i32 (%class.SimStream*)* @_ZN9SimStream6ferrorEv to i8*), i8* bitcast (i32 (%class.SimStream*)* @_ZN9SimStream4feofEv to i8*), i8* bitcast (void (%class.SimStream*)* @_ZN9SimStreamD2Ev to i8*), i8* bitcast (void (%class.SimStream*)* @_ZN9SimStreamD0Ev to i8*)], comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTS9SimStream = linkonce_odr constant [11 x i8] c"9SimStream\00", comdat
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTS7PStream = linkonce_odr constant [9 x i8] c"7PStream\00", comdat
@_ZTI7PStream = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @_ZTS7PStream, i32 0, i32 0) }, comdat
@_ZTI9SimStream = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @_ZTS9SimStream, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTI7PStream to i8*) }, comdat
@_ZTV7PStream = linkonce_odr unnamed_addr constant [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTI7PStream to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void (%class.PStream*)* @_ZN7PStreamD2Ev to i8*), i8* bitcast (void (%class.PStream*)* @_ZN7PStreamD0Ev to i8*)], comdat, align 8
@_ZTV10FileStream = linkonce_odr unnamed_addr constant [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTI10FileStream to i8*), i8* bitcast (i64 (%class.FileStream*, float*, i32, i32)* @_ZN10FileStream4readEPfii to i8*), i8* bitcast (i32 (%class.FileStream*)* @_ZN10FileStream6ferrorEv to i8*), i8* bitcast (i32 (%class.FileStream*)* @_ZN10FileStream4feofEv to i8*), i8* bitcast (void (%class.FileStream*)* @_ZN10FileStreamD2Ev to i8*), i8* bitcast (void (%class.FileStream*)* @_ZN10FileStreamD0Ev to i8*)], comdat, align 8
@.str.40 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.41 = private unnamed_addr constant [24 x i8] c"error opening file %s\0A.\00", align 1
@_ZTS10FileStream = linkonce_odr constant [13 x i8] c"10FileStream\00", comdat
@_ZTI10FileStream = linkonce_odr constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @_ZTS10FileStream, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTI7PStream to i8*) }, comdat
@.str.42 = private unnamed_addr constant [21 x i8] c"closing file stream\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_streamcluster_cuda_cpu.cpp, i8* null }]

; Function Attrs: uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !661 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !664
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #2, !dbg !665
  ret void, !dbg !664
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #2

; Function Attrs: uwtable
define void @_Z9inttofileiPc(i32 %data, i8* %filename) #0 !dbg !667 {
entry:
  %data.addr = alloca i32, align 4
  %filename.addr = alloca i8*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !670, metadata !671), !dbg !672
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !673, metadata !671), !dbg !674
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !675, metadata !671), !dbg !676
  %0 = load i8*, i8** %filename.addr, align 8, !dbg !677
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)), !dbg !678
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !676
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !679
  %2 = load i32, i32* %data.addr, align 4, !dbg !680
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %2), !dbg !681
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !682
  %call2 = call i32 @fclose(%struct._IO_FILE* %3), !dbg !683
  ret void, !dbg !684
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define double @_Z7gettimev() #4 !dbg !685 {
entry:
  %t = alloca %struct.timeval, align 8
  call void @llvm.dbg.declare(metadata %struct.timeval* %t, metadata !688, metadata !671), !dbg !696
  %call = call i32 @gettimeofday(%struct.timeval* %t, %struct.timezone* null) #2, !dbg !697
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %t, i32 0, i32 0, !dbg !698
  %0 = load i64, i64* %tv_sec, align 8, !dbg !698
  %conv = sitofp i64 %0 to double, !dbg !699
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %t, i32 0, i32 1, !dbg !700
  %1 = load i64, i64* %tv_usec, align 8, !dbg !700
  %conv1 = sitofp i64 %1 to double, !dbg !701
  %mul = fmul double %conv1, 1.000000e-06, !dbg !702
  %add = fadd double %conv, %mul, !dbg !703
  ret double %add, !dbg !704
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #5

; Function Attrs: nounwind uwtable
define i32 @_Z11isIdenticalPfS_i(float* %i, float* %j, i32 %D) #4 !dbg !705 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca float*, align 8
  %j.addr = alloca float*, align 8
  %D.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %equal = alloca i32, align 4
  store float* %i, float** %i.addr, align 8
  call void @llvm.dbg.declare(metadata float** %i.addr, metadata !708, metadata !671), !dbg !709
  store float* %j, float** %j.addr, align 8
  call void @llvm.dbg.declare(metadata float** %j.addr, metadata !710, metadata !671), !dbg !711
  store i32 %D, i32* %D.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %D.addr, metadata !712, metadata !671), !dbg !713
  call void @llvm.dbg.declare(metadata i32* %a, metadata !714, metadata !671), !dbg !715
  store i32 0, i32* %a, align 4, !dbg !715
  call void @llvm.dbg.declare(metadata i32* %equal, metadata !716, metadata !671), !dbg !717
  store i32 1, i32* %equal, align 4, !dbg !717
  br label %while.cond, !dbg !718

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %equal, align 4, !dbg !719
  %tobool = icmp ne i32 %0, 0, !dbg !719
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !721

land.rhs:                                         ; preds = %while.cond
  %1 = load i32, i32* %a, align 4, !dbg !722
  %2 = load i32, i32* %D.addr, align 4, !dbg !724
  %cmp = icmp slt i32 %1, %2, !dbg !725
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %3 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %3, label %while.body, label %while.end, !dbg !726

while.body:                                       ; preds = %land.end
  %4 = load i32, i32* %a, align 4, !dbg !728
  %idxprom = sext i32 %4 to i64, !dbg !731
  %5 = load float*, float** %i.addr, align 8, !dbg !731
  %arrayidx = getelementptr inbounds float, float* %5, i64 %idxprom, !dbg !731
  %6 = load float, float* %arrayidx, align 4, !dbg !731
  %7 = load i32, i32* %a, align 4, !dbg !732
  %idxprom1 = sext i32 %7 to i64, !dbg !733
  %8 = load float*, float** %j.addr, align 8, !dbg !733
  %arrayidx2 = getelementptr inbounds float, float* %8, i64 %idxprom1, !dbg !733
  %9 = load float, float* %arrayidx2, align 4, !dbg !733
  %cmp3 = fcmp une float %6, %9, !dbg !734
  br i1 %cmp3, label %if.then, label %if.else, !dbg !735

if.then:                                          ; preds = %while.body
  store i32 0, i32* %equal, align 4, !dbg !736
  br label %if.end, !dbg !738

if.else:                                          ; preds = %while.body
  %10 = load i32, i32* %a, align 4, !dbg !739
  %inc = add nsw i32 %10, 1, !dbg !739
  store i32 %inc, i32* %a, align 4, !dbg !739
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond, !dbg !740, !llvm.loop !742

while.end:                                        ; preds = %land.end
  %11 = load i32, i32* %equal, align 4, !dbg !743
  %tobool4 = icmp ne i32 %11, 0, !dbg !743
  br i1 %tobool4, label %if.then5, label %if.else6, !dbg !745

if.then5:                                         ; preds = %while.end
  store i32 1, i32* %retval, align 4, !dbg !746
  br label %return, !dbg !746

if.else6:                                         ; preds = %while.end
  store i32 0, i32* %retval, align 4, !dbg !748
  br label %return, !dbg !748

return:                                           ; preds = %if.else6, %if.then5
  %12 = load i32, i32* %retval, align 4, !dbg !749
  ret i32 %12, !dbg !749
}

; Function Attrs: nounwind uwtable
define void @_Z7shuffleP6Points(%struct.Points* %points) #4 !dbg !750 {
entry:
  %points.addr = alloca %struct.Points*, align 8
  %t1 = alloca double, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %temp = alloca %struct.Point, align 8
  %t2 = alloca double, align 8
  store %struct.Points* %points, %struct.Points** %points.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !753, metadata !671), !dbg !754
  call void @llvm.dbg.declare(metadata double* %t1, metadata !755, metadata !671), !dbg !756
  %call = call double @_Z7gettimev(), !dbg !757
  store double %call, double* %t1, align 8, !dbg !756
  call void @llvm.dbg.declare(metadata i64* %i, metadata !758, metadata !671), !dbg !759
  call void @llvm.dbg.declare(metadata i64* %j, metadata !760, metadata !671), !dbg !761
  call void @llvm.dbg.declare(metadata %struct.Point* %temp, metadata !762, metadata !671), !dbg !763
  store i64 0, i64* %i, align 8, !dbg !764
  br label %for.cond, !dbg !766

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !767
  %1 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !770
  %num = getelementptr inbounds %struct.Points, %struct.Points* %1, i32 0, i32 0, !dbg !771
  %2 = load i64, i64* %num, align 8, !dbg !771
  %sub = sub nsw i64 %2, 1, !dbg !772
  %cmp = icmp slt i64 %0, %sub, !dbg !773
  br i1 %cmp, label %for.body, label %for.end, !dbg !774

for.body:                                         ; preds = %for.cond
  %call1 = call i64 @lrand48() #2, !dbg !775
  %3 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !777
  %num2 = getelementptr inbounds %struct.Points, %struct.Points* %3, i32 0, i32 0, !dbg !778
  %4 = load i64, i64* %num2, align 8, !dbg !778
  %5 = load i64, i64* %i, align 8, !dbg !779
  %sub3 = sub nsw i64 %4, %5, !dbg !780
  %rem = srem i64 %call1, %sub3, !dbg !781
  %6 = load i64, i64* %i, align 8, !dbg !782
  %add = add nsw i64 %rem, %6, !dbg !783
  store i64 %add, i64* %j, align 8, !dbg !784
  %7 = load i64, i64* %i, align 8, !dbg !785
  %8 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !786
  %p = getelementptr inbounds %struct.Points, %struct.Points* %8, i32 0, i32 2, !dbg !787
  %9 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !787
  %arrayidx = getelementptr inbounds %struct.Point, %struct.Point* %9, i64 %7, !dbg !786
  %10 = bitcast %struct.Point* %temp to i8*, !dbg !788
  %11 = bitcast %struct.Point* %arrayidx to i8*, !dbg !788
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 32, i32 8, i1 false), !dbg !788
  %12 = load i64, i64* %i, align 8, !dbg !789
  %13 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !790
  %p4 = getelementptr inbounds %struct.Points, %struct.Points* %13, i32 0, i32 2, !dbg !791
  %14 = load %struct.Point*, %struct.Point** %p4, align 8, !dbg !791
  %arrayidx5 = getelementptr inbounds %struct.Point, %struct.Point* %14, i64 %12, !dbg !790
  %15 = load i64, i64* %j, align 8, !dbg !792
  %16 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !793
  %p6 = getelementptr inbounds %struct.Points, %struct.Points* %16, i32 0, i32 2, !dbg !794
  %17 = load %struct.Point*, %struct.Point** %p6, align 8, !dbg !794
  %arrayidx7 = getelementptr inbounds %struct.Point, %struct.Point* %17, i64 %15, !dbg !793
  %18 = bitcast %struct.Point* %arrayidx5 to i8*, !dbg !795
  %19 = bitcast %struct.Point* %arrayidx7 to i8*, !dbg !795
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 32, i32 8, i1 false), !dbg !795
  %20 = load i64, i64* %j, align 8, !dbg !796
  %21 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !797
  %p8 = getelementptr inbounds %struct.Points, %struct.Points* %21, i32 0, i32 2, !dbg !798
  %22 = load %struct.Point*, %struct.Point** %p8, align 8, !dbg !798
  %arrayidx9 = getelementptr inbounds %struct.Point, %struct.Point* %22, i64 %20, !dbg !797
  %23 = bitcast %struct.Point* %arrayidx9 to i8*, !dbg !799
  %24 = bitcast %struct.Point* %temp to i8*, !dbg !799
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %24, i64 32, i32 8, i1 false), !dbg !799
  br label %for.inc, !dbg !800

for.inc:                                          ; preds = %for.body
  %25 = load i64, i64* %i, align 8, !dbg !801
  %inc = add nsw i64 %25, 1, !dbg !801
  store i64 %inc, i64* %i, align 8, !dbg !801
  br label %for.cond, !dbg !803, !llvm.loop !804

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata double* %t2, metadata !806, metadata !671), !dbg !807
  %call10 = call double @_Z7gettimev(), !dbg !808
  store double %call10, double* %t2, align 8, !dbg !807
  %26 = load double, double* %t2, align 8, !dbg !809
  %27 = load double, double* %t1, align 8, !dbg !810
  %sub11 = fsub double %26, %27, !dbg !811
  %28 = load double, double* @time_shuffle, align 8, !dbg !812
  %add12 = fadd double %28, %sub11, !dbg !812
  store double %add12, double* @time_shuffle, align 8, !dbg !812
  ret void, !dbg !813
}

; Function Attrs: nounwind
declare i64 @lrand48() #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #6

; Function Attrs: nounwind uwtable
define void @_Z10intshufflePii(i32* %intarray, i32 %length) #4 !dbg !814 {
entry:
  %intarray.addr = alloca i32*, align 8
  %length.addr = alloca i32, align 4
  %t1 = alloca double, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %temp = alloca i32, align 4
  %t2 = alloca double, align 8
  store i32* %intarray, i32** %intarray.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %intarray.addr, metadata !817, metadata !671), !dbg !818
  store i32 %length, i32* %length.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %length.addr, metadata !819, metadata !671), !dbg !820
  call void @llvm.dbg.declare(metadata double* %t1, metadata !821, metadata !671), !dbg !822
  %call = call double @_Z7gettimev(), !dbg !823
  store double %call, double* %t1, align 8, !dbg !822
  call void @llvm.dbg.declare(metadata i64* %i, metadata !824, metadata !671), !dbg !825
  call void @llvm.dbg.declare(metadata i64* %j, metadata !826, metadata !671), !dbg !827
  call void @llvm.dbg.declare(metadata i32* %temp, metadata !828, metadata !671), !dbg !829
  store i64 0, i64* %i, align 8, !dbg !830
  br label %for.cond, !dbg !832

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !833
  %1 = load i32, i32* %length.addr, align 4, !dbg !836
  %conv = sext i32 %1 to i64, !dbg !836
  %cmp = icmp slt i64 %0, %conv, !dbg !837
  br i1 %cmp, label %for.body, label %for.end, !dbg !838

for.body:                                         ; preds = %for.cond
  %call1 = call i64 @lrand48() #2, !dbg !839
  %2 = load i32, i32* %length.addr, align 4, !dbg !841
  %conv2 = sext i32 %2 to i64, !dbg !841
  %3 = load i64, i64* %i, align 8, !dbg !842
  %sub = sub nsw i64 %conv2, %3, !dbg !843
  %rem = srem i64 %call1, %sub, !dbg !844
  %4 = load i64, i64* %i, align 8, !dbg !845
  %add = add nsw i64 %rem, %4, !dbg !846
  store i64 %add, i64* %j, align 8, !dbg !847
  %5 = load i64, i64* %i, align 8, !dbg !848
  %6 = load i32*, i32** %intarray.addr, align 8, !dbg !849
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %5, !dbg !849
  %7 = load i32, i32* %arrayidx, align 4, !dbg !849
  store i32 %7, i32* %temp, align 4, !dbg !850
  %8 = load i64, i64* %j, align 8, !dbg !851
  %9 = load i32*, i32** %intarray.addr, align 8, !dbg !852
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %8, !dbg !852
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !852
  %11 = load i64, i64* %i, align 8, !dbg !853
  %12 = load i32*, i32** %intarray.addr, align 8, !dbg !854
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 %11, !dbg !854
  store i32 %10, i32* %arrayidx4, align 4, !dbg !855
  %13 = load i32, i32* %temp, align 4, !dbg !856
  %14 = load i64, i64* %j, align 8, !dbg !857
  %15 = load i32*, i32** %intarray.addr, align 8, !dbg !858
  %arrayidx5 = getelementptr inbounds i32, i32* %15, i64 %14, !dbg !858
  store i32 %13, i32* %arrayidx5, align 4, !dbg !859
  br label %for.inc, !dbg !860

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !861
  %inc = add nsw i64 %16, 1, !dbg !861
  store i64 %inc, i64* %i, align 8, !dbg !861
  br label %for.cond, !dbg !863, !llvm.loop !864

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata double* %t2, metadata !866, metadata !671), !dbg !867
  %call6 = call double @_Z7gettimev(), !dbg !868
  store double %call6, double* %t2, align 8, !dbg !867
  %17 = load double, double* %t2, align 8, !dbg !869
  %18 = load double, double* %t1, align 8, !dbg !870
  %sub7 = fsub double %17, %18, !dbg !871
  %19 = load double, double* @time_shuffle, align 8, !dbg !872
  %add8 = fadd double %19, %sub7, !dbg !872
  store double %add8, double* @time_shuffle, align 8, !dbg !872
  ret void, !dbg !873
}

; Function Attrs: nounwind uwtable
define float @_Z4dist5PointS_i(%struct.Point* byval align 8 %p1, %struct.Point* byval align 8 %p2, i32 %dim) #4 !dbg !874 {
entry:
  %dim.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %result = alloca float, align 4
  call void @llvm.dbg.declare(metadata %struct.Point* %p1, metadata !877, metadata !671), !dbg !878
  call void @llvm.dbg.declare(metadata %struct.Point* %p2, metadata !879, metadata !671), !dbg !880
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !881, metadata !671), !dbg !882
  call void @llvm.dbg.declare(metadata i32* %i, metadata !883, metadata !671), !dbg !884
  call void @llvm.dbg.declare(metadata float* %result, metadata !885, metadata !671), !dbg !886
  store float 0.000000e+00, float* %result, align 4, !dbg !886
  store i32 0, i32* %i, align 4, !dbg !887
  br label %for.cond, !dbg !889

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !890
  %1 = load i32, i32* %dim.addr, align 4, !dbg !893
  %cmp = icmp slt i32 %0, %1, !dbg !894
  br i1 %cmp, label %for.body, label %for.end, !dbg !895

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !896
  %idxprom = sext i32 %2 to i64, !dbg !897
  %coord = getelementptr inbounds %struct.Point, %struct.Point* %p1, i32 0, i32 1, !dbg !898
  %3 = load float*, float** %coord, align 8, !dbg !898
  %arrayidx = getelementptr inbounds float, float* %3, i64 %idxprom, !dbg !897
  %4 = load float, float* %arrayidx, align 4, !dbg !897
  %5 = load i32, i32* %i, align 4, !dbg !899
  %idxprom1 = sext i32 %5 to i64, !dbg !900
  %coord2 = getelementptr inbounds %struct.Point, %struct.Point* %p2, i32 0, i32 1, !dbg !901
  %6 = load float*, float** %coord2, align 8, !dbg !901
  %arrayidx3 = getelementptr inbounds float, float* %6, i64 %idxprom1, !dbg !900
  %7 = load float, float* %arrayidx3, align 4, !dbg !900
  %sub = fsub float %4, %7, !dbg !902
  %8 = load i32, i32* %i, align 4, !dbg !903
  %idxprom4 = sext i32 %8 to i64, !dbg !904
  %coord5 = getelementptr inbounds %struct.Point, %struct.Point* %p1, i32 0, i32 1, !dbg !905
  %9 = load float*, float** %coord5, align 8, !dbg !905
  %arrayidx6 = getelementptr inbounds float, float* %9, i64 %idxprom4, !dbg !904
  %10 = load float, float* %arrayidx6, align 4, !dbg !904
  %11 = load i32, i32* %i, align 4, !dbg !906
  %idxprom7 = sext i32 %11 to i64, !dbg !907
  %coord8 = getelementptr inbounds %struct.Point, %struct.Point* %p2, i32 0, i32 1, !dbg !908
  %12 = load float*, float** %coord8, align 8, !dbg !908
  %arrayidx9 = getelementptr inbounds float, float* %12, i64 %idxprom7, !dbg !907
  %13 = load float, float* %arrayidx9, align 4, !dbg !907
  %sub10 = fsub float %10, %13, !dbg !909
  %mul = fmul float %sub, %sub10, !dbg !910
  %14 = load float, float* %result, align 4, !dbg !911
  %add = fadd float %14, %mul, !dbg !911
  store float %add, float* %result, align 4, !dbg !911
  br label %for.inc, !dbg !912

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !913
  %inc = add nsw i32 %15, 1, !dbg !913
  store i32 %inc, i32* %i, align 4, !dbg !913
  br label %for.cond, !dbg !915, !llvm.loop !916

for.end:                                          ; preds = %for.cond
  %16 = load float, float* %result, align 4, !dbg !918
  ret float %16, !dbg !919
}

; Function Attrs: nounwind uwtable
define float @_Z7pspeedyP6PointsfPliP17pthread_barrier_t(%struct.Points* %points, float %z, i64* %kcenter, i32 %pid, %union.pthread_barrier_t* %barrier) #4 !dbg !83 {
entry:
  %points.addr = alloca %struct.Points*, align 8
  %z.addr = alloca float, align 4
  %kcenter.addr = alloca i64*, align 8
  %pid.addr = alloca i32, align 4
  %barrier.addr = alloca %union.pthread_barrier_t*, align 8
  %t1 = alloca double, align 8
  %bsize = alloca i64, align 8
  %k1 = alloca i64, align 8
  %k2 = alloca i64, align 8
  %k = alloca i32, align 4
  %distance = alloca float, align 4
  %agg.tmp = alloca %struct.Point, align 8
  %agg.tmp6 = alloca %struct.Point, align 8
  %k33 = alloca i32, align 4
  %distance39 = alloca float, align 4
  %agg.tmp40 = alloca %struct.Point, align 8
  %agg.tmp44 = alloca %struct.Point, align 8
  %to_open = alloca i8, align 1
  %k95 = alloca i32, align 4
  %distance101 = alloca float, align 4
  %agg.tmp102 = alloca %struct.Point, align 8
  %agg.tmp106 = alloca %struct.Point, align 8
  %mytotal = alloca float, align 4
  %k146 = alloca i32, align 4
  %i = alloca i32, align 4
  %t2 = alloca double, align 8
  store %struct.Points* %points, %struct.Points** %points.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !920, metadata !671), !dbg !921
  store float %z, float* %z.addr, align 4
  call void @llvm.dbg.declare(metadata float* %z.addr, metadata !922, metadata !671), !dbg !923
  store i64* %kcenter, i64** %kcenter.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %kcenter.addr, metadata !924, metadata !671), !dbg !925
  store i32 %pid, i32* %pid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pid.addr, metadata !926, metadata !671), !dbg !927
  store %union.pthread_barrier_t* %barrier, %union.pthread_barrier_t** %barrier.addr, align 8
  call void @llvm.dbg.declare(metadata %union.pthread_barrier_t** %barrier.addr, metadata !928, metadata !671), !dbg !929
  call void @llvm.dbg.declare(metadata double* %t1, metadata !930, metadata !671), !dbg !931
  %call = call double @_Z7gettimev(), !dbg !932
  store double %call, double* %t1, align 8, !dbg !931
  call void @llvm.dbg.declare(metadata i64* %bsize, metadata !933, metadata !671), !dbg !934
  %0 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !935
  %num = getelementptr inbounds %struct.Points, %struct.Points* %0, i32 0, i32 0, !dbg !936
  %1 = load i64, i64* %num, align 8, !dbg !936
  %2 = load i32, i32* @_ZL5nproc, align 4, !dbg !937
  %conv = sext i32 %2 to i64, !dbg !937
  %div = sdiv i64 %1, %conv, !dbg !938
  store i64 %div, i64* %bsize, align 8, !dbg !934
  call void @llvm.dbg.declare(metadata i64* %k1, metadata !939, metadata !671), !dbg !940
  %3 = load i64, i64* %bsize, align 8, !dbg !941
  %4 = load i32, i32* %pid.addr, align 4, !dbg !942
  %conv1 = sext i32 %4 to i64, !dbg !942
  %mul = mul nsw i64 %3, %conv1, !dbg !943
  store i64 %mul, i64* %k1, align 8, !dbg !940
  call void @llvm.dbg.declare(metadata i64* %k2, metadata !944, metadata !671), !dbg !945
  %5 = load i64, i64* %k1, align 8, !dbg !946
  %6 = load i64, i64* %bsize, align 8, !dbg !947
  %add = add nsw i64 %5, %6, !dbg !948
  store i64 %add, i64* %k2, align 8, !dbg !945
  %7 = load i32, i32* %pid.addr, align 4, !dbg !949
  %8 = load i32, i32* @_ZL5nproc, align 4, !dbg !951
  %sub = sub nsw i32 %8, 1, !dbg !952
  %cmp = icmp eq i32 %7, %sub, !dbg !953
  br i1 %cmp, label %if.then, label %if.end, !dbg !954

if.then:                                          ; preds = %entry
  %9 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !955
  %num2 = getelementptr inbounds %struct.Points, %struct.Points* %9, i32 0, i32 0, !dbg !957
  %10 = load i64, i64* %num2, align 8, !dbg !957
  store i64 %10, i64* %k2, align 8, !dbg !958
  br label %if.end, !dbg !959

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i32* %k, metadata !960, metadata !671), !dbg !962
  %11 = load i64, i64* %k1, align 8, !dbg !963
  %conv3 = trunc i64 %11 to i32, !dbg !963
  store i32 %conv3, i32* %k, align 4, !dbg !962
  br label %for.cond, !dbg !964

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i32, i32* %k, align 4, !dbg !965
  %conv4 = sext i32 %12 to i64, !dbg !965
  %13 = load i64, i64* %k2, align 8, !dbg !968
  %cmp5 = icmp slt i64 %conv4, %13, !dbg !969
  br i1 %cmp5, label %for.body, label %for.end, !dbg !970

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata float* %distance, metadata !971, metadata !671), !dbg !973
  %14 = load i32, i32* %k, align 4, !dbg !974
  %idxprom = sext i32 %14 to i64, !dbg !975
  %15 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !975
  %p = getelementptr inbounds %struct.Points, %struct.Points* %15, i32 0, i32 2, !dbg !976
  %16 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !976
  %arrayidx = getelementptr inbounds %struct.Point, %struct.Point* %16, i64 %idxprom, !dbg !975
  %17 = bitcast %struct.Point* %agg.tmp to i8*, !dbg !975
  %18 = bitcast %struct.Point* %arrayidx to i8*, !dbg !975
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 32, i32 8, i1 false), !dbg !975
  %19 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !977
  %p7 = getelementptr inbounds %struct.Points, %struct.Points* %19, i32 0, i32 2, !dbg !978
  %20 = load %struct.Point*, %struct.Point** %p7, align 8, !dbg !978
  %arrayidx8 = getelementptr inbounds %struct.Point, %struct.Point* %20, i64 0, !dbg !977
  %21 = bitcast %struct.Point* %agg.tmp6 to i8*, !dbg !977
  %22 = bitcast %struct.Point* %arrayidx8 to i8*, !dbg !977
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %21, i8* %22, i64 32, i32 8, i1 false), !dbg !979
  %23 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !981
  %dim = getelementptr inbounds %struct.Points, %struct.Points* %23, i32 0, i32 1, !dbg !982
  %24 = load i32, i32* %dim, align 8, !dbg !982
  %call9 = call float @_Z4dist5PointS_i(%struct.Point* byval align 8 %agg.tmp, %struct.Point* byval align 8 %agg.tmp6, i32 %24), !dbg !983
  store float %call9, float* %distance, align 4, !dbg !973
  %25 = load float, float* %distance, align 4, !dbg !985
  %26 = load i32, i32* %k, align 4, !dbg !986
  %idxprom10 = sext i32 %26 to i64, !dbg !987
  %27 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !987
  %p11 = getelementptr inbounds %struct.Points, %struct.Points* %27, i32 0, i32 2, !dbg !988
  %28 = load %struct.Point*, %struct.Point** %p11, align 8, !dbg !988
  %arrayidx12 = getelementptr inbounds %struct.Point, %struct.Point* %28, i64 %idxprom10, !dbg !987
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx12, i32 0, i32 0, !dbg !989
  %29 = load float, float* %weight, align 8, !dbg !989
  %mul13 = fmul float %25, %29, !dbg !990
  %30 = load i32, i32* %k, align 4, !dbg !991
  %idxprom14 = sext i32 %30 to i64, !dbg !992
  %31 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !992
  %p15 = getelementptr inbounds %struct.Points, %struct.Points* %31, i32 0, i32 2, !dbg !993
  %32 = load %struct.Point*, %struct.Point** %p15, align 8, !dbg !993
  %arrayidx16 = getelementptr inbounds %struct.Point, %struct.Point* %32, i64 %idxprom14, !dbg !992
  %cost = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx16, i32 0, i32 3, !dbg !994
  store float %mul13, float* %cost, align 8, !dbg !995
  %33 = load i32, i32* %k, align 4, !dbg !996
  %idxprom17 = sext i32 %33 to i64, !dbg !997
  %34 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !997
  %p18 = getelementptr inbounds %struct.Points, %struct.Points* %34, i32 0, i32 2, !dbg !998
  %35 = load %struct.Point*, %struct.Point** %p18, align 8, !dbg !998
  %arrayidx19 = getelementptr inbounds %struct.Point, %struct.Point* %35, i64 %idxprom17, !dbg !997
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx19, i32 0, i32 2, !dbg !999
  store i64 0, i64* %assign, align 8, !dbg !1000
  br label %for.inc, !dbg !1001

for.inc:                                          ; preds = %for.body
  %36 = load i32, i32* %k, align 4, !dbg !1002
  %inc = add nsw i32 %36, 1, !dbg !1002
  store i32 %inc, i32* %k, align 4, !dbg !1002
  br label %for.cond, !dbg !1004, !llvm.loop !1005

for.end:                                          ; preds = %for.cond
  %37 = load i32, i32* %pid.addr, align 4, !dbg !1007
  %cmp20 = icmp eq i32 %37, 0, !dbg !1009
  br i1 %cmp20, label %if.then21, label %if.end25, !dbg !1010

if.then21:                                        ; preds = %for.end
  %38 = load i64*, i64** %kcenter.addr, align 8, !dbg !1011
  store i64 1, i64* %38, align 8, !dbg !1013
  %39 = load i32, i32* @_ZL5nproc, align 4, !dbg !1014
  %conv22 = sext i32 %39 to i64, !dbg !1014
  %mul23 = mul i64 4, %conv22, !dbg !1015
  %call24 = call noalias i8* @malloc(i64 %mul23) #2, !dbg !1016
  %40 = bitcast i8* %call24 to float*, !dbg !1017
  store float* %40, float** @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE5costs, align 8, !dbg !1018
  br label %if.end25, !dbg !1019

if.end25:                                         ; preds = %if.then21, %for.end
  %41 = load i32, i32* %pid.addr, align 4, !dbg !1020
  %cmp26 = icmp ne i32 %41, 0, !dbg !1022
  br i1 %cmp26, label %if.then27, label %if.else, !dbg !1023

if.then27:                                        ; preds = %if.end25
  br label %while.body, !dbg !1024

while.body:                                       ; preds = %if.then27, %for.end78
  %42 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1026
  %conv28 = sext i32 %42 to i64, !dbg !1026
  %43 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1029
  %num29 = getelementptr inbounds %struct.Points, %struct.Points* %43, i32 0, i32 0, !dbg !1030
  %44 = load i64, i64* %num29, align 8, !dbg !1030
  %cmp30 = icmp sge i64 %conv28, %44, !dbg !1031
  br i1 %cmp30, label %if.then31, label %if.end32, !dbg !1032

if.then31:                                        ; preds = %while.body
  br label %while.end, !dbg !1033

if.end32:                                         ; preds = %while.body
  call void @llvm.dbg.declare(metadata i32* %k33, metadata !1035, metadata !671), !dbg !1037
  %45 = load i64, i64* %k1, align 8, !dbg !1038
  %conv34 = trunc i64 %45 to i32, !dbg !1038
  store i32 %conv34, i32* %k33, align 4, !dbg !1037
  br label %for.cond35, !dbg !1039

for.cond35:                                       ; preds = %for.inc76, %if.end32
  %46 = load i32, i32* %k33, align 4, !dbg !1040
  %conv36 = sext i32 %46 to i64, !dbg !1040
  %47 = load i64, i64* %k2, align 8, !dbg !1043
  %cmp37 = icmp slt i64 %conv36, %47, !dbg !1044
  br i1 %cmp37, label %for.body38, label %for.end78, !dbg !1045

for.body38:                                       ; preds = %for.cond35
  call void @llvm.dbg.declare(metadata float* %distance39, metadata !1046, metadata !671), !dbg !1048
  %48 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1049
  %idxprom41 = sext i32 %48 to i64, !dbg !1050
  %49 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1050
  %p42 = getelementptr inbounds %struct.Points, %struct.Points* %49, i32 0, i32 2, !dbg !1051
  %50 = load %struct.Point*, %struct.Point** %p42, align 8, !dbg !1051
  %arrayidx43 = getelementptr inbounds %struct.Point, %struct.Point* %50, i64 %idxprom41, !dbg !1050
  %51 = bitcast %struct.Point* %agg.tmp40 to i8*, !dbg !1050
  %52 = bitcast %struct.Point* %arrayidx43 to i8*, !dbg !1050
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %51, i8* %52, i64 32, i32 8, i1 false), !dbg !1050
  %53 = load i32, i32* %k33, align 4, !dbg !1052
  %idxprom45 = sext i32 %53 to i64, !dbg !1053
  %54 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1053
  %p46 = getelementptr inbounds %struct.Points, %struct.Points* %54, i32 0, i32 2, !dbg !1054
  %55 = load %struct.Point*, %struct.Point** %p46, align 8, !dbg !1054
  %arrayidx47 = getelementptr inbounds %struct.Point, %struct.Point* %55, i64 %idxprom45, !dbg !1053
  %56 = bitcast %struct.Point* %agg.tmp44 to i8*, !dbg !1053
  %57 = bitcast %struct.Point* %arrayidx47 to i8*, !dbg !1053
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %56, i8* %57, i64 32, i32 8, i1 false), !dbg !1055
  %58 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1057
  %dim48 = getelementptr inbounds %struct.Points, %struct.Points* %58, i32 0, i32 1, !dbg !1058
  %59 = load i32, i32* %dim48, align 8, !dbg !1058
  %call49 = call float @_Z4dist5PointS_i(%struct.Point* byval align 8 %agg.tmp40, %struct.Point* byval align 8 %agg.tmp44, i32 %59), !dbg !1059
  store float %call49, float* %distance39, align 4, !dbg !1048
  %60 = load float, float* %distance39, align 4, !dbg !1061
  %61 = load i32, i32* %k33, align 4, !dbg !1063
  %idxprom50 = sext i32 %61 to i64, !dbg !1064
  %62 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1064
  %p51 = getelementptr inbounds %struct.Points, %struct.Points* %62, i32 0, i32 2, !dbg !1065
  %63 = load %struct.Point*, %struct.Point** %p51, align 8, !dbg !1065
  %arrayidx52 = getelementptr inbounds %struct.Point, %struct.Point* %63, i64 %idxprom50, !dbg !1064
  %weight53 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx52, i32 0, i32 0, !dbg !1066
  %64 = load float, float* %weight53, align 8, !dbg !1066
  %mul54 = fmul float %60, %64, !dbg !1067
  %65 = load i32, i32* %k33, align 4, !dbg !1068
  %idxprom55 = sext i32 %65 to i64, !dbg !1069
  %66 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1069
  %p56 = getelementptr inbounds %struct.Points, %struct.Points* %66, i32 0, i32 2, !dbg !1070
  %67 = load %struct.Point*, %struct.Point** %p56, align 8, !dbg !1070
  %arrayidx57 = getelementptr inbounds %struct.Point, %struct.Point* %67, i64 %idxprom55, !dbg !1069
  %cost58 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx57, i32 0, i32 3, !dbg !1071
  %68 = load float, float* %cost58, align 8, !dbg !1071
  %cmp59 = fcmp olt float %mul54, %68, !dbg !1072
  br i1 %cmp59, label %if.then60, label %if.end75, !dbg !1073

if.then60:                                        ; preds = %for.body38
  %69 = load float, float* %distance39, align 4, !dbg !1074
  %70 = load i32, i32* %k33, align 4, !dbg !1076
  %idxprom61 = sext i32 %70 to i64, !dbg !1077
  %71 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1077
  %p62 = getelementptr inbounds %struct.Points, %struct.Points* %71, i32 0, i32 2, !dbg !1078
  %72 = load %struct.Point*, %struct.Point** %p62, align 8, !dbg !1078
  %arrayidx63 = getelementptr inbounds %struct.Point, %struct.Point* %72, i64 %idxprom61, !dbg !1077
  %weight64 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx63, i32 0, i32 0, !dbg !1079
  %73 = load float, float* %weight64, align 8, !dbg !1079
  %mul65 = fmul float %69, %73, !dbg !1080
  %74 = load i32, i32* %k33, align 4, !dbg !1081
  %idxprom66 = sext i32 %74 to i64, !dbg !1082
  %75 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1082
  %p67 = getelementptr inbounds %struct.Points, %struct.Points* %75, i32 0, i32 2, !dbg !1083
  %76 = load %struct.Point*, %struct.Point** %p67, align 8, !dbg !1083
  %arrayidx68 = getelementptr inbounds %struct.Point, %struct.Point* %76, i64 %idxprom66, !dbg !1082
  %cost69 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx68, i32 0, i32 3, !dbg !1084
  store float %mul65, float* %cost69, align 8, !dbg !1085
  %77 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1086
  %conv70 = sext i32 %77 to i64, !dbg !1086
  %78 = load i32, i32* %k33, align 4, !dbg !1087
  %idxprom71 = sext i32 %78 to i64, !dbg !1088
  %79 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1088
  %p72 = getelementptr inbounds %struct.Points, %struct.Points* %79, i32 0, i32 2, !dbg !1089
  %80 = load %struct.Point*, %struct.Point** %p72, align 8, !dbg !1089
  %arrayidx73 = getelementptr inbounds %struct.Point, %struct.Point* %80, i64 %idxprom71, !dbg !1088
  %assign74 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx73, i32 0, i32 2, !dbg !1090
  store i64 %conv70, i64* %assign74, align 8, !dbg !1091
  br label %if.end75, !dbg !1092

if.end75:                                         ; preds = %if.then60, %for.body38
  br label %for.inc76, !dbg !1093

for.inc76:                                        ; preds = %if.end75
  %81 = load i32, i32* %k33, align 4, !dbg !1094
  %inc77 = add nsw i32 %81, 1, !dbg !1094
  store i32 %inc77, i32* %k33, align 4, !dbg !1094
  br label %for.cond35, !dbg !1096, !llvm.loop !1097

for.end78:                                        ; preds = %for.cond35
  br label %while.body, !dbg !1099, !llvm.loop !1101

while.end:                                        ; preds = %if.then31
  br label %if.end145, !dbg !1102

if.else:                                          ; preds = %if.end25
  store i32 1, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1103
  br label %for.cond79, !dbg !1106

for.cond79:                                       ; preds = %for.inc142, %if.else
  %82 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1107
  %conv80 = sext i32 %82 to i64, !dbg !1107
  %83 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1110
  %num81 = getelementptr inbounds %struct.Points, %struct.Points* %83, i32 0, i32 0, !dbg !1111
  %84 = load i64, i64* %num81, align 8, !dbg !1111
  %cmp82 = icmp slt i64 %conv80, %84, !dbg !1112
  br i1 %cmp82, label %for.body83, label %for.end144, !dbg !1113

for.body83:                                       ; preds = %for.cond79
  call void @llvm.dbg.declare(metadata i8* %to_open, metadata !1114, metadata !671), !dbg !1116
  %call84 = call i64 @lrand48() #2, !dbg !1117
  %conv85 = sitofp i64 %call84 to float, !dbg !1117
  %div86 = fdiv float %conv85, 0x41E0000000000000, !dbg !1118
  %85 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1119
  %idxprom87 = sext i32 %85 to i64, !dbg !1120
  %86 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1120
  %p88 = getelementptr inbounds %struct.Points, %struct.Points* %86, i32 0, i32 2, !dbg !1121
  %87 = load %struct.Point*, %struct.Point** %p88, align 8, !dbg !1121
  %arrayidx89 = getelementptr inbounds %struct.Point, %struct.Point* %87, i64 %idxprom87, !dbg !1120
  %cost90 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx89, i32 0, i32 3, !dbg !1122
  %88 = load float, float* %cost90, align 8, !dbg !1122
  %89 = load float, float* %z.addr, align 4, !dbg !1123
  %div91 = fdiv float %88, %89, !dbg !1124
  %cmp92 = fcmp olt float %div86, %div91, !dbg !1125
  %frombool = zext i1 %cmp92 to i8, !dbg !1116
  store i8 %frombool, i8* %to_open, align 1, !dbg !1116
  %90 = load i8, i8* %to_open, align 1, !dbg !1126
  %tobool = trunc i8 %90 to i1, !dbg !1126
  br i1 %tobool, label %if.then93, label %if.end141, !dbg !1128

if.then93:                                        ; preds = %for.body83
  %91 = load i64*, i64** %kcenter.addr, align 8, !dbg !1129
  %92 = load i64, i64* %91, align 8, !dbg !1131
  %inc94 = add nsw i64 %92, 1, !dbg !1131
  store i64 %inc94, i64* %91, align 8, !dbg !1131
  store i8 1, i8* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE4open, align 1, !dbg !1132
  call void @llvm.dbg.declare(metadata i32* %k95, metadata !1133, metadata !671), !dbg !1135
  %93 = load i64, i64* %k1, align 8, !dbg !1136
  %conv96 = trunc i64 %93 to i32, !dbg !1136
  store i32 %conv96, i32* %k95, align 4, !dbg !1135
  br label %for.cond97, !dbg !1137

for.cond97:                                       ; preds = %for.inc138, %if.then93
  %94 = load i32, i32* %k95, align 4, !dbg !1138
  %conv98 = sext i32 %94 to i64, !dbg !1138
  %95 = load i64, i64* %k2, align 8, !dbg !1141
  %cmp99 = icmp slt i64 %conv98, %95, !dbg !1142
  br i1 %cmp99, label %for.body100, label %for.end140, !dbg !1143

for.body100:                                      ; preds = %for.cond97
  call void @llvm.dbg.declare(metadata float* %distance101, metadata !1144, metadata !671), !dbg !1146
  %96 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1147
  %idxprom103 = sext i32 %96 to i64, !dbg !1148
  %97 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1148
  %p104 = getelementptr inbounds %struct.Points, %struct.Points* %97, i32 0, i32 2, !dbg !1149
  %98 = load %struct.Point*, %struct.Point** %p104, align 8, !dbg !1149
  %arrayidx105 = getelementptr inbounds %struct.Point, %struct.Point* %98, i64 %idxprom103, !dbg !1148
  %99 = bitcast %struct.Point* %agg.tmp102 to i8*, !dbg !1148
  %100 = bitcast %struct.Point* %arrayidx105 to i8*, !dbg !1148
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %99, i8* %100, i64 32, i32 8, i1 false), !dbg !1148
  %101 = load i32, i32* %k95, align 4, !dbg !1150
  %idxprom107 = sext i32 %101 to i64, !dbg !1151
  %102 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1151
  %p108 = getelementptr inbounds %struct.Points, %struct.Points* %102, i32 0, i32 2, !dbg !1152
  %103 = load %struct.Point*, %struct.Point** %p108, align 8, !dbg !1152
  %arrayidx109 = getelementptr inbounds %struct.Point, %struct.Point* %103, i64 %idxprom107, !dbg !1151
  %104 = bitcast %struct.Point* %agg.tmp106 to i8*, !dbg !1151
  %105 = bitcast %struct.Point* %arrayidx109 to i8*, !dbg !1151
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %104, i8* %105, i64 32, i32 8, i1 false), !dbg !1153
  %106 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1155
  %dim110 = getelementptr inbounds %struct.Points, %struct.Points* %106, i32 0, i32 1, !dbg !1156
  %107 = load i32, i32* %dim110, align 8, !dbg !1156
  %call111 = call float @_Z4dist5PointS_i(%struct.Point* byval align 8 %agg.tmp102, %struct.Point* byval align 8 %agg.tmp106, i32 %107), !dbg !1157
  store float %call111, float* %distance101, align 4, !dbg !1146
  %108 = load float, float* %distance101, align 4, !dbg !1159
  %109 = load i32, i32* %k95, align 4, !dbg !1161
  %idxprom112 = sext i32 %109 to i64, !dbg !1162
  %110 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1162
  %p113 = getelementptr inbounds %struct.Points, %struct.Points* %110, i32 0, i32 2, !dbg !1163
  %111 = load %struct.Point*, %struct.Point** %p113, align 8, !dbg !1163
  %arrayidx114 = getelementptr inbounds %struct.Point, %struct.Point* %111, i64 %idxprom112, !dbg !1162
  %weight115 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx114, i32 0, i32 0, !dbg !1164
  %112 = load float, float* %weight115, align 8, !dbg !1164
  %mul116 = fmul float %108, %112, !dbg !1165
  %113 = load i32, i32* %k95, align 4, !dbg !1166
  %idxprom117 = sext i32 %113 to i64, !dbg !1167
  %114 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1167
  %p118 = getelementptr inbounds %struct.Points, %struct.Points* %114, i32 0, i32 2, !dbg !1168
  %115 = load %struct.Point*, %struct.Point** %p118, align 8, !dbg !1168
  %arrayidx119 = getelementptr inbounds %struct.Point, %struct.Point* %115, i64 %idxprom117, !dbg !1167
  %cost120 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx119, i32 0, i32 3, !dbg !1169
  %116 = load float, float* %cost120, align 8, !dbg !1169
  %cmp121 = fcmp olt float %mul116, %116, !dbg !1170
  br i1 %cmp121, label %if.then122, label %if.end137, !dbg !1171

if.then122:                                       ; preds = %for.body100
  %117 = load float, float* %distance101, align 4, !dbg !1172
  %118 = load i32, i32* %k95, align 4, !dbg !1174
  %idxprom123 = sext i32 %118 to i64, !dbg !1175
  %119 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1175
  %p124 = getelementptr inbounds %struct.Points, %struct.Points* %119, i32 0, i32 2, !dbg !1176
  %120 = load %struct.Point*, %struct.Point** %p124, align 8, !dbg !1176
  %arrayidx125 = getelementptr inbounds %struct.Point, %struct.Point* %120, i64 %idxprom123, !dbg !1175
  %weight126 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx125, i32 0, i32 0, !dbg !1177
  %121 = load float, float* %weight126, align 8, !dbg !1177
  %mul127 = fmul float %117, %121, !dbg !1178
  %122 = load i32, i32* %k95, align 4, !dbg !1179
  %idxprom128 = sext i32 %122 to i64, !dbg !1180
  %123 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1180
  %p129 = getelementptr inbounds %struct.Points, %struct.Points* %123, i32 0, i32 2, !dbg !1181
  %124 = load %struct.Point*, %struct.Point** %p129, align 8, !dbg !1181
  %arrayidx130 = getelementptr inbounds %struct.Point, %struct.Point* %124, i64 %idxprom128, !dbg !1180
  %cost131 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx130, i32 0, i32 3, !dbg !1182
  store float %mul127, float* %cost131, align 8, !dbg !1183
  %125 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1184
  %conv132 = sext i32 %125 to i64, !dbg !1184
  %126 = load i32, i32* %k95, align 4, !dbg !1185
  %idxprom133 = sext i32 %126 to i64, !dbg !1186
  %127 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1186
  %p134 = getelementptr inbounds %struct.Points, %struct.Points* %127, i32 0, i32 2, !dbg !1187
  %128 = load %struct.Point*, %struct.Point** %p134, align 8, !dbg !1187
  %arrayidx135 = getelementptr inbounds %struct.Point, %struct.Point* %128, i64 %idxprom133, !dbg !1186
  %assign136 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx135, i32 0, i32 2, !dbg !1188
  store i64 %conv132, i64* %assign136, align 8, !dbg !1189
  br label %if.end137, !dbg !1190

if.end137:                                        ; preds = %if.then122, %for.body100
  br label %for.inc138, !dbg !1191

for.inc138:                                       ; preds = %if.end137
  %129 = load i32, i32* %k95, align 4, !dbg !1192
  %inc139 = add nsw i32 %129, 1, !dbg !1192
  store i32 %inc139, i32* %k95, align 4, !dbg !1192
  br label %for.cond97, !dbg !1194, !llvm.loop !1195

for.end140:                                       ; preds = %for.cond97
  store i8 0, i8* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE4open, align 1, !dbg !1197
  br label %if.end141, !dbg !1198

if.end141:                                        ; preds = %for.end140, %for.body83
  br label %for.inc142, !dbg !1199

for.inc142:                                       ; preds = %if.end141
  %130 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1200
  %inc143 = add nsw i32 %130, 1, !dbg !1200
  store i32 %inc143, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1200
  br label %for.cond79, !dbg !1202, !llvm.loop !1203

for.end144:                                       ; preds = %for.cond79
  store i8 1, i8* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE4open, align 1, !dbg !1205
  br label %if.end145

if.end145:                                        ; preds = %for.end144, %while.end
  store i8 0, i8* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE4open, align 1, !dbg !1206
  call void @llvm.dbg.declare(metadata float* %mytotal, metadata !1207, metadata !671), !dbg !1208
  store float 0.000000e+00, float* %mytotal, align 4, !dbg !1208
  call void @llvm.dbg.declare(metadata i32* %k146, metadata !1209, metadata !671), !dbg !1211
  %131 = load i64, i64* %k1, align 8, !dbg !1212
  %conv147 = trunc i64 %131 to i32, !dbg !1212
  store i32 %conv147, i32* %k146, align 4, !dbg !1211
  br label %for.cond148, !dbg !1213

for.cond148:                                      ; preds = %for.inc157, %if.end145
  %132 = load i32, i32* %k146, align 4, !dbg !1214
  %conv149 = sext i32 %132 to i64, !dbg !1214
  %133 = load i64, i64* %k2, align 8, !dbg !1217
  %cmp150 = icmp slt i64 %conv149, %133, !dbg !1218
  br i1 %cmp150, label %for.body151, label %for.end159, !dbg !1219

for.body151:                                      ; preds = %for.cond148
  %134 = load i32, i32* %k146, align 4, !dbg !1220
  %idxprom152 = sext i32 %134 to i64, !dbg !1222
  %135 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1222
  %p153 = getelementptr inbounds %struct.Points, %struct.Points* %135, i32 0, i32 2, !dbg !1223
  %136 = load %struct.Point*, %struct.Point** %p153, align 8, !dbg !1223
  %arrayidx154 = getelementptr inbounds %struct.Point, %struct.Point* %136, i64 %idxprom152, !dbg !1222
  %cost155 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx154, i32 0, i32 3, !dbg !1224
  %137 = load float, float* %cost155, align 8, !dbg !1224
  %138 = load float, float* %mytotal, align 4, !dbg !1225
  %add156 = fadd float %138, %137, !dbg !1225
  store float %add156, float* %mytotal, align 4, !dbg !1225
  br label %for.inc157, !dbg !1226

for.inc157:                                       ; preds = %for.body151
  %139 = load i32, i32* %k146, align 4, !dbg !1227
  %inc158 = add nsw i32 %139, 1, !dbg !1227
  store i32 %inc158, i32* %k146, align 4, !dbg !1227
  br label %for.cond148, !dbg !1229, !llvm.loop !1230

for.end159:                                       ; preds = %for.cond148
  %140 = load float, float* %mytotal, align 4, !dbg !1232
  %141 = load i32, i32* %pid.addr, align 4, !dbg !1233
  %idxprom160 = sext i32 %141 to i64, !dbg !1234
  %142 = load float*, float** @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE5costs, align 8, !dbg !1234
  %arrayidx161 = getelementptr inbounds float, float* %142, i64 %idxprom160, !dbg !1234
  store float %140, float* %arrayidx161, align 4, !dbg !1235
  %143 = load i32, i32* %pid.addr, align 4, !dbg !1236
  %cmp162 = icmp eq i32 %143, 0, !dbg !1238
  br i1 %cmp162, label %if.then163, label %if.end175, !dbg !1239

if.then163:                                       ; preds = %for.end159
  %144 = load float, float* %z.addr, align 4, !dbg !1240
  %145 = load i64*, i64** %kcenter.addr, align 8, !dbg !1242
  %146 = load i64, i64* %145, align 8, !dbg !1243
  %conv164 = sitofp i64 %146 to float, !dbg !1244
  %mul165 = fmul float %144, %conv164, !dbg !1245
  store float %mul165, float* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE9totalcost, align 4, !dbg !1246
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1247, metadata !671), !dbg !1249
  store i32 0, i32* %i, align 4, !dbg !1249
  br label %for.cond166, !dbg !1250

for.cond166:                                      ; preds = %for.inc172, %if.then163
  %147 = load i32, i32* %i, align 4, !dbg !1251
  %148 = load i32, i32* @_ZL5nproc, align 4, !dbg !1254
  %cmp167 = icmp slt i32 %147, %148, !dbg !1255
  br i1 %cmp167, label %for.body168, label %for.end174, !dbg !1256

for.body168:                                      ; preds = %for.cond166
  %149 = load i32, i32* %i, align 4, !dbg !1257
  %idxprom169 = sext i32 %149 to i64, !dbg !1259
  %150 = load float*, float** @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE5costs, align 8, !dbg !1259
  %arrayidx170 = getelementptr inbounds float, float* %150, i64 %idxprom169, !dbg !1259
  %151 = load float, float* %arrayidx170, align 4, !dbg !1259
  %152 = load float, float* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE9totalcost, align 4, !dbg !1260
  %add171 = fadd float %152, %151, !dbg !1260
  store float %add171, float* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE9totalcost, align 4, !dbg !1260
  br label %for.inc172, !dbg !1261

for.inc172:                                       ; preds = %for.body168
  %153 = load i32, i32* %i, align 4, !dbg !1262
  %inc173 = add nsw i32 %153, 1, !dbg !1262
  store i32 %inc173, i32* %i, align 4, !dbg !1262
  br label %for.cond166, !dbg !1264, !llvm.loop !1265

for.end174:                                       ; preds = %for.cond166
  %154 = load float*, float** @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE5costs, align 8, !dbg !1267
  %155 = bitcast float* %154 to i8*, !dbg !1267
  call void @free(i8* %155) #2, !dbg !1268
  br label %if.end175, !dbg !1269

if.end175:                                        ; preds = %for.end174, %for.end159
  call void @llvm.dbg.declare(metadata double* %t2, metadata !1270, metadata !671), !dbg !1271
  %call176 = call double @_Z7gettimev(), !dbg !1272
  store double %call176, double* %t2, align 8, !dbg !1271
  %156 = load i32, i32* %pid.addr, align 4, !dbg !1273
  %cmp177 = icmp eq i32 %156, 0, !dbg !1275
  br i1 %cmp177, label %if.then178, label %if.end181, !dbg !1276

if.then178:                                       ; preds = %if.end175
  %157 = load double, double* %t2, align 8, !dbg !1277
  %158 = load double, double* %t1, align 8, !dbg !1279
  %sub179 = fsub double %157, %158, !dbg !1280
  %159 = load double, double* @time_speedy, align 8, !dbg !1281
  %add180 = fadd double %159, %sub179, !dbg !1281
  store double %add180, double* @time_speedy, align 8, !dbg !1281
  br label %if.end181, !dbg !1282

if.end181:                                        ; preds = %if.then178, %if.end175
  %160 = load float, float* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE9totalcost, align 4, !dbg !1283
  ret float %160, !dbg !1284
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #5

; Function Attrs: nounwind
declare void @free(i8*) #5

; Function Attrs: uwtable
define float @_Z3pFLP6PointsPiifPliflfiP17pthread_barrier_t(%struct.Points* %points, i32* %feasible, i32 %numfeasible, float %z, i64* %k, i32 %kmax, float %cost, i64 %iter, float %e, i32 %pid, %union.pthread_barrier_t* %barrier) #0 !dbg !1285 {
entry:
  %points.addr = alloca %struct.Points*, align 8
  %feasible.addr = alloca i32*, align 8
  %numfeasible.addr = alloca i32, align 4
  %z.addr = alloca float, align 4
  %k.addr = alloca i64*, align 8
  %kmax.addr = alloca i32, align 4
  %cost.addr = alloca float, align 4
  %iter.addr = alloca i64, align 8
  %e.addr = alloca float, align 4
  %pid.addr = alloca i32, align 4
  %barrier.addr = alloca %union.pthread_barrier_t*, align 8
  %i = alloca i64, align 8
  %x = alloca i64, align 8
  %change = alloca float, align 4
  %numberOfPoints = alloca i64, align 8
  store %struct.Points* %points, %struct.Points** %points.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !1288, metadata !671), !dbg !1289
  store i32* %feasible, i32** %feasible.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %feasible.addr, metadata !1290, metadata !671), !dbg !1291
  store i32 %numfeasible, i32* %numfeasible.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numfeasible.addr, metadata !1292, metadata !671), !dbg !1293
  store float %z, float* %z.addr, align 4
  call void @llvm.dbg.declare(metadata float* %z.addr, metadata !1294, metadata !671), !dbg !1295
  store i64* %k, i64** %k.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %k.addr, metadata !1296, metadata !671), !dbg !1297
  store i32 %kmax, i32* %kmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %kmax.addr, metadata !1298, metadata !671), !dbg !1299
  store float %cost, float* %cost.addr, align 4
  call void @llvm.dbg.declare(metadata float* %cost.addr, metadata !1300, metadata !671), !dbg !1301
  store i64 %iter, i64* %iter.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %iter.addr, metadata !1302, metadata !671), !dbg !1303
  store float %e, float* %e.addr, align 4
  call void @llvm.dbg.declare(metadata float* %e.addr, metadata !1304, metadata !671), !dbg !1305
  store i32 %pid, i32* %pid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pid.addr, metadata !1306, metadata !671), !dbg !1307
  store %union.pthread_barrier_t* %barrier, %union.pthread_barrier_t** %barrier.addr, align 8
  call void @llvm.dbg.declare(metadata %union.pthread_barrier_t** %barrier.addr, metadata !1308, metadata !671), !dbg !1309
  call void @llvm.dbg.declare(metadata i64* %i, metadata !1310, metadata !671), !dbg !1311
  call void @llvm.dbg.declare(metadata i64* %x, metadata !1312, metadata !671), !dbg !1313
  call void @llvm.dbg.declare(metadata float* %change, metadata !1314, metadata !671), !dbg !1315
  call void @llvm.dbg.declare(metadata i64* %numberOfPoints, metadata !1316, metadata !671), !dbg !1317
  %0 = load float, float* %cost.addr, align 4, !dbg !1318
  store float %0, float* %change, align 4, !dbg !1319
  br label %while.cond, !dbg !1320

while.cond:                                       ; preds = %for.end, %entry
  %1 = load float, float* %change, align 4, !dbg !1321
  %2 = load float, float* %cost.addr, align 4, !dbg !1323
  %div = fdiv float %1, %2, !dbg !1324
  %conv = fpext float %div to double, !dbg !1321
  %3 = load float, float* %e.addr, align 4, !dbg !1325
  %conv1 = fpext float %3 to double, !dbg !1325
  %mul = fmul double 1.000000e+00, %conv1, !dbg !1326
  %cmp = fcmp ogt double %conv, %mul, !dbg !1327
  br i1 %cmp, label %while.body, label %while.end, !dbg !1328

while.body:                                       ; preds = %while.cond
  store float 0.000000e+00, float* %change, align 4, !dbg !1329
  %4 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1331
  %num = getelementptr inbounds %struct.Points, %struct.Points* %4, i32 0, i32 0, !dbg !1332
  %5 = load i64, i64* %num, align 8, !dbg !1332
  store i64 %5, i64* %numberOfPoints, align 8, !dbg !1333
  %6 = load i32, i32* %pid.addr, align 4, !dbg !1334
  %cmp2 = icmp eq i32 %6, 0, !dbg !1336
  br i1 %cmp2, label %if.then, label %if.end, !dbg !1337

if.then:                                          ; preds = %while.body
  %7 = load i32*, i32** %feasible.addr, align 8, !dbg !1338
  %8 = load i32, i32* %numfeasible.addr, align 4, !dbg !1340
  call void @_Z10intshufflePii(i32* %7, i32 %8), !dbg !1341
  br label %if.end, !dbg !1342

if.end:                                           ; preds = %if.then, %while.body
  store i64 0, i64* %i, align 8, !dbg !1343
  br label %for.cond, !dbg !1345

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !1346
  %10 = load i64, i64* %iter.addr, align 8, !dbg !1349
  %cmp3 = icmp slt i64 %9, %10, !dbg !1350
  br i1 %cmp3, label %for.body, label %for.end, !dbg !1351

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !1352
  %12 = load i32, i32* %numfeasible.addr, align 4, !dbg !1354
  %conv4 = sext i32 %12 to i64, !dbg !1354
  %rem = srem i64 %11, %conv4, !dbg !1355
  store i64 %rem, i64* %x, align 8, !dbg !1356
  %13 = load i64, i64* %x, align 8, !dbg !1357
  %14 = load i32*, i32** %feasible.addr, align 8, !dbg !1358
  %arrayidx = getelementptr inbounds i32, i32* %14, i64 %13, !dbg !1358
  %15 = load i32, i32* %arrayidx, align 4, !dbg !1358
  %conv5 = sext i32 %15 to i64, !dbg !1358
  %16 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1359
  %17 = load float, float* %z.addr, align 4, !dbg !1360
  %18 = load i64*, i64** %k.addr, align 8, !dbg !1361
  %19 = load i32, i32* %kmax.addr, align 4, !dbg !1362
  %20 = load i8*, i8** @_ZL9is_center, align 8, !dbg !1363
  %21 = load i32*, i32** @_ZL12center_table, align 8, !dbg !1364
  %22 = load i8*, i8** @_ZL17switch_membership, align 8, !dbg !1365
  %23 = load i8, i8* @isCoordChanged, align 1, !dbg !1366
  %tobool = trunc i8 %23 to i1, !dbg !1366
  %call = call float @_Z5pgainlP6PointsfPliPbPiS2_bPdS4_S4_S4_S4_S4_(i64 %conv5, %struct.Points* %16, float %17, i64* %18, i32 %19, i8* %20, i32* %21, i8* %22, i1 zeroext %tobool, double* @serial_t, double* @cpu_to_gpu_t, double* @gpu_to_cpu_t, double* @alloc_t, double* @kernel_t, double* @free_t), !dbg !1367
  %24 = load float, float* %change, align 4, !dbg !1368
  %add = fadd float %24, %call, !dbg !1368
  store float %add, float* %change, align 4, !dbg !1368
  br label %for.inc, !dbg !1369

for.inc:                                          ; preds = %for.body
  %25 = load i64, i64* %i, align 8, !dbg !1370
  %inc = add nsw i64 %25, 1, !dbg !1370
  store i64 %inc, i64* %i, align 8, !dbg !1370
  br label %for.cond, !dbg !1372, !llvm.loop !1373

for.end:                                          ; preds = %for.cond
  %26 = load float, float* %change, align 4, !dbg !1375
  %27 = load float, float* %cost.addr, align 4, !dbg !1376
  %sub = fsub float %27, %26, !dbg !1376
  store float %sub, float* %cost.addr, align 4, !dbg !1376
  br label %while.cond, !dbg !1377, !llvm.loop !1379

while.end:                                        ; preds = %while.cond
  %28 = load float, float* %cost.addr, align 4, !dbg !1380
  ret float %28, !dbg !1381
}

declare float @_Z5pgainlP6PointsfPliPbPiS2_bPdS4_S4_S4_S4_S4_(i64, %struct.Points*, float, i64*, i32, i8*, i32*, i8*, i1 zeroext, double*, double*, double*, double*, double*, double*) #1

; Function Attrs: nounwind uwtable
define i32 @_Z19selectfeasible_fastP6PointsPPiiiP17pthread_barrier_t(%struct.Points* %points, i32** %feasible, i32 %kmin, i32 %pid, %union.pthread_barrier_t* %barrier) #4 !dbg !1382 {
entry:
  %retval = alloca i32, align 4
  %points.addr = alloca %struct.Points*, align 8
  %feasible.addr = alloca i32**, align 8
  %kmin.addr = alloca i32, align 4
  %pid.addr = alloca i32, align 4
  %barrier.addr = alloca %union.pthread_barrier_t*, align 8
  %t1 = alloca double, align 8
  %numfeasible = alloca i32, align 4
  %accumweight = alloca float*, align 8
  %totalweight = alloca float, align 4
  %k1 = alloca i64, align 8
  %k2 = alloca i64, align 8
  %w = alloca float, align 4
  %l = alloca i32, align 4
  %r = alloca i32, align 4
  %k = alloca i32, align 4
  %i = alloca i32, align 4
  %i31 = alloca i32, align 4
  %i51 = alloca i32, align 4
  %t2 = alloca double, align 8
  store %struct.Points* %points, %struct.Points** %points.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !1386, metadata !671), !dbg !1387
  store i32** %feasible, i32*** %feasible.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %feasible.addr, metadata !1388, metadata !671), !dbg !1389
  store i32 %kmin, i32* %kmin.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %kmin.addr, metadata !1390, metadata !671), !dbg !1391
  store i32 %pid, i32* %pid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pid.addr, metadata !1392, metadata !671), !dbg !1393
  store %union.pthread_barrier_t* %barrier, %union.pthread_barrier_t** %barrier.addr, align 8
  call void @llvm.dbg.declare(metadata %union.pthread_barrier_t** %barrier.addr, metadata !1394, metadata !671), !dbg !1395
  call void @llvm.dbg.declare(metadata double* %t1, metadata !1396, metadata !671), !dbg !1397
  %call = call double @_Z7gettimev(), !dbg !1398
  store double %call, double* %t1, align 8, !dbg !1397
  call void @llvm.dbg.declare(metadata i32* %numfeasible, metadata !1399, metadata !671), !dbg !1400
  %0 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1401
  %num = getelementptr inbounds %struct.Points, %struct.Points* %0, i32 0, i32 0, !dbg !1402
  %1 = load i64, i64* %num, align 8, !dbg !1402
  %conv = trunc i64 %1 to i32, !dbg !1401
  store i32 %conv, i32* %numfeasible, align 4, !dbg !1400
  %2 = load i32, i32* %numfeasible, align 4, !dbg !1403
  %conv1 = sitofp i32 %2 to double, !dbg !1403
  %3 = load i32, i32* %kmin.addr, align 4, !dbg !1405
  %mul = mul nsw i32 3, %3, !dbg !1406
  %conv2 = sitofp i32 %mul to double, !dbg !1407
  %4 = load i32, i32* %kmin.addr, align 4, !dbg !1408
  %conv3 = sitofp i32 %4 to float, !dbg !1408
  %conv4 = fpext float %conv3 to double, !dbg !1409
  %call5 = call double @log(double %conv4) #2, !dbg !1410
  %mul6 = fmul double %conv2, %call5, !dbg !1411
  %cmp = fcmp ogt double %conv1, %mul6, !dbg !1412
  br i1 %cmp, label %if.then, label %if.end, !dbg !1413

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %kmin.addr, align 4, !dbg !1414
  %mul7 = mul nsw i32 3, %5, !dbg !1415
  %conv8 = sitofp i32 %mul7 to double, !dbg !1416
  %6 = load i32, i32* %kmin.addr, align 4, !dbg !1417
  %conv9 = sitofp i32 %6 to float, !dbg !1417
  %conv10 = fpext float %conv9 to double, !dbg !1418
  %call11 = call double @log(double %conv10) #2, !dbg !1419
  %mul12 = fmul double %conv8, %call11, !dbg !1420
  %conv13 = fptosi double %mul12 to i32, !dbg !1421
  store i32 %conv13, i32* %numfeasible, align 4, !dbg !1422
  br label %if.end, !dbg !1423

if.end:                                           ; preds = %if.then, %entry
  %7 = load i32, i32* %numfeasible, align 4, !dbg !1424
  %conv14 = sext i32 %7 to i64, !dbg !1424
  %mul15 = mul i64 %conv14, 4, !dbg !1425
  %call16 = call noalias i8* @malloc(i64 %mul15) #2, !dbg !1426
  %8 = bitcast i8* %call16 to i32*, !dbg !1427
  %9 = load i32**, i32*** %feasible.addr, align 8, !dbg !1428
  store i32* %8, i32** %9, align 8, !dbg !1429
  call void @llvm.dbg.declare(metadata float** %accumweight, metadata !1430, metadata !671), !dbg !1431
  call void @llvm.dbg.declare(metadata float* %totalweight, metadata !1432, metadata !671), !dbg !1433
  call void @llvm.dbg.declare(metadata i64* %k1, metadata !1434, metadata !671), !dbg !1435
  store i64 0, i64* %k1, align 8, !dbg !1435
  call void @llvm.dbg.declare(metadata i64* %k2, metadata !1436, metadata !671), !dbg !1437
  %10 = load i32, i32* %numfeasible, align 4, !dbg !1438
  %conv17 = sext i32 %10 to i64, !dbg !1438
  store i64 %conv17, i64* %k2, align 8, !dbg !1437
  call void @llvm.dbg.declare(metadata float* %w, metadata !1439, metadata !671), !dbg !1440
  call void @llvm.dbg.declare(metadata i32* %l, metadata !1441, metadata !671), !dbg !1442
  call void @llvm.dbg.declare(metadata i32* %r, metadata !1443, metadata !671), !dbg !1444
  call void @llvm.dbg.declare(metadata i32* %k, metadata !1445, metadata !671), !dbg !1446
  %11 = load i32, i32* %numfeasible, align 4, !dbg !1447
  %conv18 = sext i32 %11 to i64, !dbg !1447
  %12 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1449
  %num19 = getelementptr inbounds %struct.Points, %struct.Points* %12, i32 0, i32 0, !dbg !1450
  %13 = load i64, i64* %num19, align 8, !dbg !1450
  %cmp20 = icmp eq i64 %conv18, %13, !dbg !1451
  br i1 %cmp20, label %if.then21, label %if.end25, !dbg !1452

if.then21:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1453, metadata !671), !dbg !1456
  %14 = load i64, i64* %k1, align 8, !dbg !1457
  %conv22 = trunc i64 %14 to i32, !dbg !1457
  store i32 %conv22, i32* %i, align 4, !dbg !1456
  br label %for.cond, !dbg !1458

for.cond:                                         ; preds = %for.inc, %if.then21
  %15 = load i32, i32* %i, align 4, !dbg !1459
  %conv23 = sext i32 %15 to i64, !dbg !1459
  %16 = load i64, i64* %k2, align 8, !dbg !1462
  %cmp24 = icmp slt i64 %conv23, %16, !dbg !1463
  br i1 %cmp24, label %for.body, label %for.end, !dbg !1464

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !1465
  %18 = load i32, i32* %i, align 4, !dbg !1466
  %idxprom = sext i32 %18 to i64, !dbg !1467
  %19 = load i32**, i32*** %feasible.addr, align 8, !dbg !1468
  %20 = load i32*, i32** %19, align 8, !dbg !1469
  %arrayidx = getelementptr inbounds i32, i32* %20, i64 %idxprom, !dbg !1467
  store i32 %17, i32* %arrayidx, align 4, !dbg !1470
  br label %for.inc, !dbg !1467

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !1471
  %inc = add nsw i32 %21, 1, !dbg !1471
  store i32 %inc, i32* %i, align 4, !dbg !1471
  br label %for.cond, !dbg !1473, !llvm.loop !1474

for.end:                                          ; preds = %for.cond
  %22 = load i32, i32* %numfeasible, align 4, !dbg !1476
  store i32 %22, i32* %retval, align 4, !dbg !1477
  br label %return, !dbg !1477

if.end25:                                         ; preds = %if.end
  %23 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1478
  %num26 = getelementptr inbounds %struct.Points, %struct.Points* %23, i32 0, i32 0, !dbg !1479
  %24 = load i64, i64* %num26, align 8, !dbg !1479
  %mul27 = mul i64 4, %24, !dbg !1480
  %call28 = call noalias i8* @malloc(i64 %mul27) #2, !dbg !1481
  %25 = bitcast i8* %call28 to float*, !dbg !1482
  store float* %25, float** %accumweight, align 8, !dbg !1483
  %26 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1484
  %p = getelementptr inbounds %struct.Points, %struct.Points* %26, i32 0, i32 2, !dbg !1485
  %27 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !1485
  %arrayidx29 = getelementptr inbounds %struct.Point, %struct.Point* %27, i64 0, !dbg !1484
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx29, i32 0, i32 0, !dbg !1486
  %28 = load float, float* %weight, align 8, !dbg !1486
  %29 = load float*, float** %accumweight, align 8, !dbg !1487
  %arrayidx30 = getelementptr inbounds float, float* %29, i64 0, !dbg !1487
  store float %28, float* %arrayidx30, align 4, !dbg !1488
  store float 0.000000e+00, float* %totalweight, align 4, !dbg !1489
  call void @llvm.dbg.declare(metadata i32* %i31, metadata !1490, metadata !671), !dbg !1492
  store i32 1, i32* %i31, align 4, !dbg !1492
  br label %for.cond32, !dbg !1493

for.cond32:                                       ; preds = %for.inc45, %if.end25
  %30 = load i32, i32* %i31, align 4, !dbg !1494
  %conv33 = sext i32 %30 to i64, !dbg !1494
  %31 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1497
  %num34 = getelementptr inbounds %struct.Points, %struct.Points* %31, i32 0, i32 0, !dbg !1498
  %32 = load i64, i64* %num34, align 8, !dbg !1498
  %cmp35 = icmp slt i64 %conv33, %32, !dbg !1499
  br i1 %cmp35, label %for.body36, label %for.end47, !dbg !1500

for.body36:                                       ; preds = %for.cond32
  %33 = load i32, i32* %i31, align 4, !dbg !1501
  %sub = sub nsw i32 %33, 1, !dbg !1503
  %idxprom37 = sext i32 %sub to i64, !dbg !1504
  %34 = load float*, float** %accumweight, align 8, !dbg !1504
  %arrayidx38 = getelementptr inbounds float, float* %34, i64 %idxprom37, !dbg !1504
  %35 = load float, float* %arrayidx38, align 4, !dbg !1504
  %36 = load i32, i32* %i31, align 4, !dbg !1505
  %idxprom39 = sext i32 %36 to i64, !dbg !1506
  %37 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1506
  %p40 = getelementptr inbounds %struct.Points, %struct.Points* %37, i32 0, i32 2, !dbg !1507
  %38 = load %struct.Point*, %struct.Point** %p40, align 8, !dbg !1507
  %arrayidx41 = getelementptr inbounds %struct.Point, %struct.Point* %38, i64 %idxprom39, !dbg !1506
  %weight42 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx41, i32 0, i32 0, !dbg !1508
  %39 = load float, float* %weight42, align 8, !dbg !1508
  %add = fadd float %35, %39, !dbg !1509
  %40 = load i32, i32* %i31, align 4, !dbg !1510
  %idxprom43 = sext i32 %40 to i64, !dbg !1511
  %41 = load float*, float** %accumweight, align 8, !dbg !1511
  %arrayidx44 = getelementptr inbounds float, float* %41, i64 %idxprom43, !dbg !1511
  store float %add, float* %arrayidx44, align 4, !dbg !1512
  br label %for.inc45, !dbg !1513

for.inc45:                                        ; preds = %for.body36
  %42 = load i32, i32* %i31, align 4, !dbg !1514
  %inc46 = add nsw i32 %42, 1, !dbg !1514
  store i32 %inc46, i32* %i31, align 4, !dbg !1514
  br label %for.cond32, !dbg !1516, !llvm.loop !1517

for.end47:                                        ; preds = %for.cond32
  %43 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1519
  %num48 = getelementptr inbounds %struct.Points, %struct.Points* %43, i32 0, i32 0, !dbg !1520
  %44 = load i64, i64* %num48, align 8, !dbg !1520
  %sub49 = sub nsw i64 %44, 1, !dbg !1521
  %45 = load float*, float** %accumweight, align 8, !dbg !1522
  %arrayidx50 = getelementptr inbounds float, float* %45, i64 %sub49, !dbg !1522
  %46 = load float, float* %arrayidx50, align 4, !dbg !1522
  store float %46, float* %totalweight, align 4, !dbg !1523
  call void @llvm.dbg.declare(metadata i32* %i51, metadata !1524, metadata !671), !dbg !1526
  %47 = load i64, i64* %k1, align 8, !dbg !1527
  %conv52 = trunc i64 %47 to i32, !dbg !1527
  store i32 %conv52, i32* %i51, align 4, !dbg !1526
  br label %for.cond53, !dbg !1528

for.cond53:                                       ; preds = %for.inc80, %for.end47
  %48 = load i32, i32* %i51, align 4, !dbg !1529
  %conv54 = sext i32 %48 to i64, !dbg !1529
  %49 = load i64, i64* %k2, align 8, !dbg !1532
  %cmp55 = icmp slt i64 %conv54, %49, !dbg !1533
  br i1 %cmp55, label %for.body56, label %for.end82, !dbg !1534

for.body56:                                       ; preds = %for.cond53
  %call57 = call i64 @lrand48() #2, !dbg !1535
  %conv58 = sitofp i64 %call57 to float, !dbg !1535
  %div = fdiv float %conv58, 0x41E0000000000000, !dbg !1537
  %50 = load float, float* %totalweight, align 4, !dbg !1538
  %mul59 = fmul float %div, %50, !dbg !1539
  store float %mul59, float* %w, align 4, !dbg !1540
  store i32 0, i32* %l, align 4, !dbg !1541
  %51 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1542
  %num60 = getelementptr inbounds %struct.Points, %struct.Points* %51, i32 0, i32 0, !dbg !1543
  %52 = load i64, i64* %num60, align 8, !dbg !1543
  %sub61 = sub nsw i64 %52, 1, !dbg !1544
  %conv62 = trunc i64 %sub61 to i32, !dbg !1542
  store i32 %conv62, i32* %r, align 4, !dbg !1545
  %53 = load float*, float** %accumweight, align 8, !dbg !1546
  %arrayidx63 = getelementptr inbounds float, float* %53, i64 0, !dbg !1546
  %54 = load float, float* %arrayidx63, align 4, !dbg !1546
  %55 = load float, float* %w, align 4, !dbg !1548
  %cmp64 = fcmp ogt float %54, %55, !dbg !1549
  br i1 %cmp64, label %if.then65, label %if.end68, !dbg !1550

if.then65:                                        ; preds = %for.body56
  %56 = load i32, i32* %i51, align 4, !dbg !1551
  %idxprom66 = sext i32 %56 to i64, !dbg !1553
  %57 = load i32**, i32*** %feasible.addr, align 8, !dbg !1554
  %58 = load i32*, i32** %57, align 8, !dbg !1555
  %arrayidx67 = getelementptr inbounds i32, i32* %58, i64 %idxprom66, !dbg !1553
  store i32 0, i32* %arrayidx67, align 4, !dbg !1556
  br label %for.inc80, !dbg !1557

if.end68:                                         ; preds = %for.body56
  br label %while.cond, !dbg !1558

while.cond:                                       ; preds = %if.end77, %if.end68
  %59 = load i32, i32* %l, align 4, !dbg !1559
  %add69 = add nsw i32 %59, 1, !dbg !1561
  %60 = load i32, i32* %r, align 4, !dbg !1562
  %cmp70 = icmp slt i32 %add69, %60, !dbg !1563
  br i1 %cmp70, label %while.body, label %while.end, !dbg !1564

while.body:                                       ; preds = %while.cond
  %61 = load i32, i32* %l, align 4, !dbg !1565
  %62 = load i32, i32* %r, align 4, !dbg !1567
  %add71 = add nsw i32 %61, %62, !dbg !1568
  %div72 = sdiv i32 %add71, 2, !dbg !1569
  store i32 %div72, i32* %k, align 4, !dbg !1570
  %63 = load i32, i32* %k, align 4, !dbg !1571
  %idxprom73 = sext i32 %63 to i64, !dbg !1573
  %64 = load float*, float** %accumweight, align 8, !dbg !1573
  %arrayidx74 = getelementptr inbounds float, float* %64, i64 %idxprom73, !dbg !1573
  %65 = load float, float* %arrayidx74, align 4, !dbg !1573
  %66 = load float, float* %w, align 4, !dbg !1574
  %cmp75 = fcmp ogt float %65, %66, !dbg !1575
  br i1 %cmp75, label %if.then76, label %if.else, !dbg !1576

if.then76:                                        ; preds = %while.body
  %67 = load i32, i32* %k, align 4, !dbg !1577
  store i32 %67, i32* %r, align 4, !dbg !1579
  br label %if.end77, !dbg !1580

if.else:                                          ; preds = %while.body
  %68 = load i32, i32* %k, align 4, !dbg !1581
  store i32 %68, i32* %l, align 4, !dbg !1583
  br label %if.end77

if.end77:                                         ; preds = %if.else, %if.then76
  br label %while.cond, !dbg !1584, !llvm.loop !1586

while.end:                                        ; preds = %while.cond
  %69 = load i32, i32* %r, align 4, !dbg !1587
  %70 = load i32, i32* %i51, align 4, !dbg !1588
  %idxprom78 = sext i32 %70 to i64, !dbg !1589
  %71 = load i32**, i32*** %feasible.addr, align 8, !dbg !1590
  %72 = load i32*, i32** %71, align 8, !dbg !1591
  %arrayidx79 = getelementptr inbounds i32, i32* %72, i64 %idxprom78, !dbg !1589
  store i32 %69, i32* %arrayidx79, align 4, !dbg !1592
  br label %for.inc80, !dbg !1593

for.inc80:                                        ; preds = %while.end, %if.then65
  %73 = load i32, i32* %i51, align 4, !dbg !1594
  %inc81 = add nsw i32 %73, 1, !dbg !1594
  store i32 %inc81, i32* %i51, align 4, !dbg !1594
  br label %for.cond53, !dbg !1596, !llvm.loop !1597

for.end82:                                        ; preds = %for.cond53
  %74 = load float*, float** %accumweight, align 8, !dbg !1599
  %75 = bitcast float* %74 to i8*, !dbg !1599
  call void @free(i8* %75) #2, !dbg !1600
  call void @llvm.dbg.declare(metadata double* %t2, metadata !1601, metadata !671), !dbg !1602
  %call83 = call double @_Z7gettimev(), !dbg !1603
  store double %call83, double* %t2, align 8, !dbg !1602
  %76 = load double, double* %t2, align 8, !dbg !1604
  %77 = load double, double* %t1, align 8, !dbg !1605
  %sub84 = fsub double %76, %77, !dbg !1606
  %78 = load double, double* @time_select_feasible, align 8, !dbg !1607
  %add85 = fadd double %78, %sub84, !dbg !1607
  store double %add85, double* @time_select_feasible, align 8, !dbg !1607
  %79 = load i32, i32* %numfeasible, align 4, !dbg !1608
  store i32 %79, i32* %retval, align 4, !dbg !1609
  br label %return, !dbg !1609

return:                                           ; preds = %for.end82, %for.end
  %80 = load i32, i32* %retval, align 4, !dbg !1610
  ret i32 %80, !dbg !1610
}

; Function Attrs: nounwind
declare double @log(double) #5

; Function Attrs: uwtable
define float @_Z8pkmedianP6PointsllPliP17pthread_barrier_t(%struct.Points* %points, i64 %kmin, i64 %kmax, i64* %kfinal, i32 %pid, %union.pthread_barrier_t* %barrier) #0 !dbg !90 {
entry:
  %retval = alloca float, align 4
  %points.addr = alloca %struct.Points*, align 8
  %kmin.addr = alloca i64, align 8
  %kmax.addr = alloca i64, align 8
  %kfinal.addr = alloca i64*, align 8
  %pid.addr = alloca i32, align 4
  %barrier.addr = alloca %union.pthread_barrier_t*, align 8
  %i = alloca i32, align 4
  %cost = alloca float, align 4
  %lastcost = alloca float, align 4
  %hiz = alloca float, align 4
  %loz = alloca float, align 4
  %z = alloca float, align 4
  %numberOfPoints = alloca i64, align 8
  %ptDimension = alloca i64, align 8
  %bsize = alloca i64, align 8
  %k1 = alloca i64, align 8
  %k2 = alloca i64, align 8
  %myhiz = alloca float, align 4
  %kk = alloca i64, align 8
  %agg.tmp = alloca %struct.Point, align 8
  %agg.tmp10 = alloca %struct.Point, align 8
  %i20 = alloca i32, align 4
  %kk37 = alloca i64, align 8
  %i81 = alloca i32, align 4
  store %struct.Points* %points, %struct.Points** %points.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !1611, metadata !671), !dbg !1612
  store i64 %kmin, i64* %kmin.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %kmin.addr, metadata !1613, metadata !671), !dbg !1614
  store i64 %kmax, i64* %kmax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %kmax.addr, metadata !1615, metadata !671), !dbg !1616
  store i64* %kfinal, i64** %kfinal.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %kfinal.addr, metadata !1617, metadata !671), !dbg !1618
  store i32 %pid, i32* %pid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pid.addr, metadata !1619, metadata !671), !dbg !1620
  store %union.pthread_barrier_t* %barrier, %union.pthread_barrier_t** %barrier.addr, align 8
  call void @llvm.dbg.declare(metadata %union.pthread_barrier_t** %barrier.addr, metadata !1621, metadata !671), !dbg !1622
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1623, metadata !671), !dbg !1624
  call void @llvm.dbg.declare(metadata float* %cost, metadata !1625, metadata !671), !dbg !1626
  call void @llvm.dbg.declare(metadata float* %lastcost, metadata !1627, metadata !671), !dbg !1628
  call void @llvm.dbg.declare(metadata float* %hiz, metadata !1629, metadata !671), !dbg !1630
  call void @llvm.dbg.declare(metadata float* %loz, metadata !1631, metadata !671), !dbg !1632
  call void @llvm.dbg.declare(metadata float* %z, metadata !1633, metadata !671), !dbg !1634
  %0 = load i32, i32* %pid.addr, align 4, !dbg !1635
  %cmp = icmp eq i32 %0, 0, !dbg !1637
  br i1 %cmp, label %if.then, label %if.end, !dbg !1638

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @_ZL5nproc, align 4, !dbg !1639
  %conv = sext i32 %1 to i64, !dbg !1639
  %call = call noalias i8* @calloc(i64 %conv, i64 4) #2, !dbg !1641
  %2 = bitcast i8* %call to float*, !dbg !1642
  store float* %2, float** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs, align 8, !dbg !1643
  br label %if.end, !dbg !1644

if.end:                                           ; preds = %if.then, %entry
  store float 0.000000e+00, float* %loz, align 4, !dbg !1645
  store float 0.000000e+00, float* %hiz, align 4, !dbg !1646
  call void @llvm.dbg.declare(metadata i64* %numberOfPoints, metadata !1647, metadata !671), !dbg !1648
  %3 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1649
  %num = getelementptr inbounds %struct.Points, %struct.Points* %3, i32 0, i32 0, !dbg !1650
  %4 = load i64, i64* %num, align 8, !dbg !1650
  store i64 %4, i64* %numberOfPoints, align 8, !dbg !1648
  call void @llvm.dbg.declare(metadata i64* %ptDimension, metadata !1651, metadata !671), !dbg !1652
  %5 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1653
  %dim = getelementptr inbounds %struct.Points, %struct.Points* %5, i32 0, i32 1, !dbg !1654
  %6 = load i32, i32* %dim, align 8, !dbg !1654
  %conv1 = sext i32 %6 to i64, !dbg !1653
  store i64 %conv1, i64* %ptDimension, align 8, !dbg !1652
  call void @llvm.dbg.declare(metadata i64* %bsize, metadata !1655, metadata !671), !dbg !1656
  %7 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1657
  %num2 = getelementptr inbounds %struct.Points, %struct.Points* %7, i32 0, i32 0, !dbg !1658
  %8 = load i64, i64* %num2, align 8, !dbg !1658
  %9 = load i32, i32* @_ZL5nproc, align 4, !dbg !1659
  %conv3 = sext i32 %9 to i64, !dbg !1659
  %div = sdiv i64 %8, %conv3, !dbg !1660
  store i64 %div, i64* %bsize, align 8, !dbg !1656
  call void @llvm.dbg.declare(metadata i64* %k1, metadata !1661, metadata !671), !dbg !1662
  %10 = load i64, i64* %bsize, align 8, !dbg !1663
  %11 = load i32, i32* %pid.addr, align 4, !dbg !1664
  %conv4 = sext i32 %11 to i64, !dbg !1664
  %mul = mul nsw i64 %10, %conv4, !dbg !1665
  store i64 %mul, i64* %k1, align 8, !dbg !1662
  call void @llvm.dbg.declare(metadata i64* %k2, metadata !1666, metadata !671), !dbg !1667
  %12 = load i64, i64* %k1, align 8, !dbg !1668
  %13 = load i64, i64* %bsize, align 8, !dbg !1669
  %add = add nsw i64 %12, %13, !dbg !1670
  store i64 %add, i64* %k2, align 8, !dbg !1667
  %14 = load i32, i32* %pid.addr, align 4, !dbg !1671
  %15 = load i32, i32* @_ZL5nproc, align 4, !dbg !1673
  %sub = sub nsw i32 %15, 1, !dbg !1674
  %cmp5 = icmp eq i32 %14, %sub, !dbg !1675
  br i1 %cmp5, label %if.then6, label %if.end8, !dbg !1676

if.then6:                                         ; preds = %if.end
  %16 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1677
  %num7 = getelementptr inbounds %struct.Points, %struct.Points* %16, i32 0, i32 0, !dbg !1679
  %17 = load i64, i64* %num7, align 8, !dbg !1679
  store i64 %17, i64* %k2, align 8, !dbg !1680
  br label %if.end8, !dbg !1681

if.end8:                                          ; preds = %if.then6, %if.end
  call void @llvm.dbg.declare(metadata float* %myhiz, metadata !1682, metadata !671), !dbg !1683
  store float 0.000000e+00, float* %myhiz, align 4, !dbg !1683
  call void @llvm.dbg.declare(metadata i64* %kk, metadata !1684, metadata !671), !dbg !1686
  %18 = load i64, i64* %k1, align 8, !dbg !1687
  store i64 %18, i64* %kk, align 8, !dbg !1686
  br label %for.cond, !dbg !1688

for.cond:                                         ; preds = %for.inc, %if.end8
  %19 = load i64, i64* %kk, align 8, !dbg !1689
  %20 = load i64, i64* %k2, align 8, !dbg !1692
  %cmp9 = icmp slt i64 %19, %20, !dbg !1693
  br i1 %cmp9, label %for.body, label %for.end, !dbg !1694

for.body:                                         ; preds = %for.cond
  %21 = load i64, i64* %kk, align 8, !dbg !1695
  %22 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1697
  %p = getelementptr inbounds %struct.Points, %struct.Points* %22, i32 0, i32 2, !dbg !1698
  %23 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !1698
  %arrayidx = getelementptr inbounds %struct.Point, %struct.Point* %23, i64 %21, !dbg !1697
  %24 = bitcast %struct.Point* %agg.tmp to i8*, !dbg !1697
  %25 = bitcast %struct.Point* %arrayidx to i8*, !dbg !1697
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %24, i8* %25, i64 32, i32 8, i1 false), !dbg !1697
  %26 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1699
  %p11 = getelementptr inbounds %struct.Points, %struct.Points* %26, i32 0, i32 2, !dbg !1700
  %27 = load %struct.Point*, %struct.Point** %p11, align 8, !dbg !1700
  %arrayidx12 = getelementptr inbounds %struct.Point, %struct.Point* %27, i64 0, !dbg !1699
  %28 = bitcast %struct.Point* %agg.tmp10 to i8*, !dbg !1699
  %29 = bitcast %struct.Point* %arrayidx12 to i8*, !dbg !1699
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 32, i32 8, i1 false), !dbg !1701
  %30 = load i64, i64* %ptDimension, align 8, !dbg !1703
  %conv13 = trunc i64 %30 to i32, !dbg !1703
  %call14 = call float @_Z4dist5PointS_i(%struct.Point* byval align 8 %agg.tmp, %struct.Point* byval align 8 %agg.tmp10, i32 %conv13), !dbg !1704
  %31 = load i64, i64* %kk, align 8, !dbg !1706
  %32 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1707
  %p15 = getelementptr inbounds %struct.Points, %struct.Points* %32, i32 0, i32 2, !dbg !1708
  %33 = load %struct.Point*, %struct.Point** %p15, align 8, !dbg !1708
  %arrayidx16 = getelementptr inbounds %struct.Point, %struct.Point* %33, i64 %31, !dbg !1707
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx16, i32 0, i32 0, !dbg !1709
  %34 = load float, float* %weight, align 8, !dbg !1709
  %mul17 = fmul float %call14, %34, !dbg !1710
  %35 = load float, float* %myhiz, align 4, !dbg !1711
  %add18 = fadd float %35, %mul17, !dbg !1711
  store float %add18, float* %myhiz, align 4, !dbg !1711
  br label %for.inc, !dbg !1712

for.inc:                                          ; preds = %for.body
  %36 = load i64, i64* %kk, align 8, !dbg !1713
  %inc = add nsw i64 %36, 1, !dbg !1713
  store i64 %inc, i64* %kk, align 8, !dbg !1713
  br label %for.cond, !dbg !1715, !llvm.loop !1716

for.end:                                          ; preds = %for.cond
  %37 = load float, float* %myhiz, align 4, !dbg !1718
  %38 = load i32, i32* %pid.addr, align 4, !dbg !1719
  %idxprom = sext i32 %38 to i64, !dbg !1720
  %39 = load float*, float** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs, align 8, !dbg !1720
  %arrayidx19 = getelementptr inbounds float, float* %39, i64 %idxprom, !dbg !1720
  store float %37, float* %arrayidx19, align 4, !dbg !1721
  call void @llvm.dbg.declare(metadata i32* %i20, metadata !1722, metadata !671), !dbg !1724
  store i32 0, i32* %i20, align 4, !dbg !1724
  br label %for.cond21, !dbg !1725

for.cond21:                                       ; preds = %for.inc27, %for.end
  %40 = load i32, i32* %i20, align 4, !dbg !1726
  %41 = load i32, i32* @_ZL5nproc, align 4, !dbg !1729
  %cmp22 = icmp slt i32 %40, %41, !dbg !1730
  br i1 %cmp22, label %for.body23, label %for.end29, !dbg !1731

for.body23:                                       ; preds = %for.cond21
  %42 = load i32, i32* %i20, align 4, !dbg !1732
  %idxprom24 = sext i32 %42 to i64, !dbg !1734
  %43 = load float*, float** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs, align 8, !dbg !1734
  %arrayidx25 = getelementptr inbounds float, float* %43, i64 %idxprom24, !dbg !1734
  %44 = load float, float* %arrayidx25, align 4, !dbg !1734
  %45 = load float, float* %hiz, align 4, !dbg !1735
  %add26 = fadd float %45, %44, !dbg !1735
  store float %add26, float* %hiz, align 4, !dbg !1735
  br label %for.inc27, !dbg !1736

for.inc27:                                        ; preds = %for.body23
  %46 = load i32, i32* %i20, align 4, !dbg !1737
  %inc28 = add nsw i32 %46, 1, !dbg !1737
  store i32 %inc28, i32* %i20, align 4, !dbg !1737
  br label %for.cond21, !dbg !1739, !llvm.loop !1740

for.end29:                                        ; preds = %for.cond21
  store float 0.000000e+00, float* %loz, align 4, !dbg !1742
  %47 = load float, float* %hiz, align 4, !dbg !1743
  %48 = load float, float* %loz, align 4, !dbg !1744
  %add30 = fadd float %47, %48, !dbg !1745
  %conv31 = fpext float %add30 to double, !dbg !1746
  %div32 = fdiv double %conv31, 2.000000e+00, !dbg !1747
  %conv33 = fptrunc double %div32 to float, !dbg !1746
  store float %conv33, float* %z, align 4, !dbg !1748
  %49 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1749
  %num34 = getelementptr inbounds %struct.Points, %struct.Points* %49, i32 0, i32 0, !dbg !1751
  %50 = load i64, i64* %num34, align 8, !dbg !1751
  %51 = load i64, i64* %kmax.addr, align 8, !dbg !1752
  %cmp35 = icmp sle i64 %50, %51, !dbg !1753
  br i1 %cmp35, label %if.then36, label %if.end52, !dbg !1754

if.then36:                                        ; preds = %for.end29
  call void @llvm.dbg.declare(metadata i64* %kk37, metadata !1755, metadata !671), !dbg !1758
  %52 = load i64, i64* %k1, align 8, !dbg !1759
  store i64 %52, i64* %kk37, align 8, !dbg !1758
  br label %for.cond38, !dbg !1760

for.cond38:                                       ; preds = %for.inc46, %if.then36
  %53 = load i64, i64* %kk37, align 8, !dbg !1761
  %54 = load i64, i64* %k2, align 8, !dbg !1764
  %cmp39 = icmp slt i64 %53, %54, !dbg !1765
  br i1 %cmp39, label %for.body40, label %for.end48, !dbg !1766

for.body40:                                       ; preds = %for.cond38
  %55 = load i64, i64* %kk37, align 8, !dbg !1767
  %56 = load i64, i64* %kk37, align 8, !dbg !1769
  %57 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1770
  %p41 = getelementptr inbounds %struct.Points, %struct.Points* %57, i32 0, i32 2, !dbg !1771
  %58 = load %struct.Point*, %struct.Point** %p41, align 8, !dbg !1771
  %arrayidx42 = getelementptr inbounds %struct.Point, %struct.Point* %58, i64 %56, !dbg !1770
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx42, i32 0, i32 2, !dbg !1772
  store i64 %55, i64* %assign, align 8, !dbg !1773
  %59 = load i64, i64* %kk37, align 8, !dbg !1774
  %60 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1775
  %p43 = getelementptr inbounds %struct.Points, %struct.Points* %60, i32 0, i32 2, !dbg !1776
  %61 = load %struct.Point*, %struct.Point** %p43, align 8, !dbg !1776
  %arrayidx44 = getelementptr inbounds %struct.Point, %struct.Point* %61, i64 %59, !dbg !1775
  %cost45 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx44, i32 0, i32 3, !dbg !1777
  store float 0.000000e+00, float* %cost45, align 8, !dbg !1778
  br label %for.inc46, !dbg !1779

for.inc46:                                        ; preds = %for.body40
  %62 = load i64, i64* %kk37, align 8, !dbg !1780
  %inc47 = add nsw i64 %62, 1, !dbg !1780
  store i64 %inc47, i64* %kk37, align 8, !dbg !1780
  br label %for.cond38, !dbg !1782, !llvm.loop !1783

for.end48:                                        ; preds = %for.cond38
  store float 0.000000e+00, float* %cost, align 4, !dbg !1785
  %63 = load i32, i32* %pid.addr, align 4, !dbg !1786
  %cmp49 = icmp eq i32 %63, 0, !dbg !1788
  br i1 %cmp49, label %if.then50, label %if.end51, !dbg !1789

if.then50:                                        ; preds = %for.end48
  %64 = load float*, float** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs, align 8, !dbg !1790
  %65 = bitcast float* %64 to i8*, !dbg !1790
  call void @free(i8* %65) #2, !dbg !1792
  %66 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1793
  %67 = load i64*, i64** %kfinal.addr, align 8, !dbg !1794
  store i64 %66, i64* %67, align 8, !dbg !1795
  br label %if.end51, !dbg !1796

if.end51:                                         ; preds = %if.then50, %for.end48
  %68 = load float, float* %cost, align 4, !dbg !1797
  store float %68, float* %retval, align 4, !dbg !1798
  br label %return, !dbg !1798

if.end52:                                         ; preds = %for.end29
  %69 = load i32, i32* %pid.addr, align 4, !dbg !1799
  %cmp53 = icmp eq i32 %69, 0, !dbg !1801
  br i1 %cmp53, label %if.then54, label %if.end55, !dbg !1802

if.then54:                                        ; preds = %if.end52
  %70 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1803
  call void @_Z7shuffleP6Points(%struct.Points* %70), !dbg !1805
  br label %if.end55, !dbg !1805

if.end55:                                         ; preds = %if.then54, %if.end52
  %71 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1806
  %72 = load float, float* %z, align 4, !dbg !1807
  %73 = load i32, i32* %pid.addr, align 4, !dbg !1808
  %74 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier.addr, align 8, !dbg !1809
  %call56 = call float @_Z7pspeedyP6PointsfPliP17pthread_barrier_t(%struct.Points* %71, float %72, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, i32 %73, %union.pthread_barrier_t* %74), !dbg !1810
  store float %call56, float* %cost, align 4, !dbg !1811
  store i32 0, i32* %i, align 4, !dbg !1812
  br label %while.cond, !dbg !1813

while.cond:                                       ; preds = %while.body, %if.end55
  %75 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1814
  %76 = load i64, i64* %kmin.addr, align 8, !dbg !1816
  %cmp57 = icmp slt i64 %75, %76, !dbg !1817
  br i1 %cmp57, label %land.rhs, label %land.end, !dbg !1818

land.rhs:                                         ; preds = %while.cond
  %77 = load i32, i32* %i, align 4, !dbg !1819
  %cmp58 = icmp slt i32 %77, 1, !dbg !1821
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %78 = phi i1 [ false, %while.cond ], [ %cmp58, %land.rhs ]
  br i1 %78, label %while.body, label %while.end, !dbg !1822

while.body:                                       ; preds = %land.end
  %79 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1824
  %80 = load float, float* %z, align 4, !dbg !1826
  %81 = load i32, i32* %pid.addr, align 4, !dbg !1827
  %82 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier.addr, align 8, !dbg !1828
  %call59 = call float @_Z7pspeedyP6PointsfPliP17pthread_barrier_t(%struct.Points* %79, float %80, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, i32 %81, %union.pthread_barrier_t* %82), !dbg !1829
  store float %call59, float* %cost, align 4, !dbg !1830
  %83 = load i32, i32* %i, align 4, !dbg !1831
  %inc60 = add nsw i32 %83, 1, !dbg !1831
  store i32 %inc60, i32* %i, align 4, !dbg !1831
  br label %while.cond, !dbg !1832, !llvm.loop !1834

while.end:                                        ; preds = %land.end
  br label %while.cond61, !dbg !1835

while.cond61:                                     ; preds = %if.end73, %while.end
  %84 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1836
  %85 = load i64, i64* %kmin.addr, align 8, !dbg !1837
  %cmp62 = icmp slt i64 %84, %85, !dbg !1838
  br i1 %cmp62, label %while.body63, label %while.end76, !dbg !1839

while.body63:                                     ; preds = %while.cond61
  %86 = load i32, i32* %i, align 4, !dbg !1840
  %cmp64 = icmp sge i32 %86, 1, !dbg !1843
  br i1 %cmp64, label %if.then65, label %if.end70, !dbg !1844

if.then65:                                        ; preds = %while.body63
  %87 = load float, float* %z, align 4, !dbg !1845
  store float %87, float* %hiz, align 4, !dbg !1848
  %88 = load float, float* %hiz, align 4, !dbg !1849
  %89 = load float, float* %loz, align 4, !dbg !1850
  %add66 = fadd float %88, %89, !dbg !1851
  %conv67 = fpext float %add66 to double, !dbg !1852
  %div68 = fdiv double %conv67, 2.000000e+00, !dbg !1853
  %conv69 = fptrunc double %div68 to float, !dbg !1852
  store float %conv69, float* %z, align 4, !dbg !1854
  store i32 0, i32* %i, align 4, !dbg !1855
  br label %if.end70, !dbg !1856

if.end70:                                         ; preds = %if.then65, %while.body63
  %90 = load i32, i32* %pid.addr, align 4, !dbg !1857
  %cmp71 = icmp eq i32 %90, 0, !dbg !1859
  br i1 %cmp71, label %if.then72, label %if.end73, !dbg !1860

if.then72:                                        ; preds = %if.end70
  %91 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1861
  call void @_Z7shuffleP6Points(%struct.Points* %91), !dbg !1863
  br label %if.end73, !dbg !1863

if.end73:                                         ; preds = %if.then72, %if.end70
  %92 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1864
  %93 = load float, float* %z, align 4, !dbg !1865
  %94 = load i32, i32* %pid.addr, align 4, !dbg !1866
  %95 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier.addr, align 8, !dbg !1867
  %call74 = call float @_Z7pspeedyP6PointsfPliP17pthread_barrier_t(%struct.Points* %92, float %93, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, i32 %94, %union.pthread_barrier_t* %95), !dbg !1868
  store float %call74, float* %cost, align 4, !dbg !1869
  %96 = load i32, i32* %i, align 4, !dbg !1870
  %inc75 = add nsw i32 %96, 1, !dbg !1870
  store i32 %inc75, i32* %i, align 4, !dbg !1870
  br label %while.cond61, !dbg !1871, !llvm.loop !1872

while.end76:                                      ; preds = %while.cond61
  %97 = load i32, i32* %pid.addr, align 4, !dbg !1873
  %cmp77 = icmp eq i32 %97, 0, !dbg !1875
  br i1 %cmp77, label %if.then78, label %if.end95, !dbg !1876

if.then78:                                        ; preds = %while.end76
  %98 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1877
  %99 = load i64, i64* %kmin.addr, align 8, !dbg !1879
  %conv79 = trunc i64 %99 to i32, !dbg !1879
  %100 = load i32, i32* %pid.addr, align 4, !dbg !1880
  %101 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier.addr, align 8, !dbg !1881
  %call80 = call i32 @_Z19selectfeasible_fastP6PointsPPiiiP17pthread_barrier_t(%struct.Points* %98, i32** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE8feasible, i32 %conv79, i32 %100, %union.pthread_barrier_t* %101), !dbg !1882
  store i32 %call80, i32* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE11numfeasible, align 4, !dbg !1883
  call void @llvm.dbg.declare(metadata i32* %i81, metadata !1884, metadata !671), !dbg !1886
  store i32 0, i32* %i81, align 4, !dbg !1886
  br label %for.cond82, !dbg !1887

for.cond82:                                       ; preds = %for.inc92, %if.then78
  %102 = load i32, i32* %i81, align 4, !dbg !1888
  %conv83 = sext i32 %102 to i64, !dbg !1888
  %103 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1891
  %num84 = getelementptr inbounds %struct.Points, %struct.Points* %103, i32 0, i32 0, !dbg !1892
  %104 = load i64, i64* %num84, align 8, !dbg !1892
  %cmp85 = icmp slt i64 %conv83, %104, !dbg !1893
  br i1 %cmp85, label %for.body86, label %for.end94, !dbg !1894

for.body86:                                       ; preds = %for.cond82
  %105 = load i32, i32* %i81, align 4, !dbg !1895
  %idxprom87 = sext i32 %105 to i64, !dbg !1897
  %106 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1897
  %p88 = getelementptr inbounds %struct.Points, %struct.Points* %106, i32 0, i32 2, !dbg !1898
  %107 = load %struct.Point*, %struct.Point** %p88, align 8, !dbg !1898
  %arrayidx89 = getelementptr inbounds %struct.Point, %struct.Point* %107, i64 %idxprom87, !dbg !1897
  %assign90 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx89, i32 0, i32 2, !dbg !1899
  %108 = load i64, i64* %assign90, align 8, !dbg !1899
  %109 = load i8*, i8** @_ZL9is_center, align 8, !dbg !1900
  %arrayidx91 = getelementptr inbounds i8, i8* %109, i64 %108, !dbg !1900
  store i8 1, i8* %arrayidx91, align 1, !dbg !1901
  br label %for.inc92, !dbg !1902

for.inc92:                                        ; preds = %for.body86
  %110 = load i32, i32* %i81, align 4, !dbg !1903
  %inc93 = add nsw i32 %110, 1, !dbg !1903
  store i32 %inc93, i32* %i81, align 4, !dbg !1903
  br label %for.cond82, !dbg !1905, !llvm.loop !1906

for.end94:                                        ; preds = %for.cond82
  br label %if.end95, !dbg !1908

if.end95:                                         ; preds = %for.end94, %while.end76
  br label %while.body97, !dbg !1909

while.body97:                                     ; preds = %if.end95, %if.end162
  %111 = load float, float* %cost, align 4, !dbg !1910
  store float %111, float* %lastcost, align 4, !dbg !1912
  %112 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1913
  %113 = load i32*, i32** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE8feasible, align 8, !dbg !1914
  %114 = load i32, i32* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE11numfeasible, align 4, !dbg !1915
  %115 = load float, float* %z, align 4, !dbg !1916
  %116 = load i64, i64* %kmax.addr, align 8, !dbg !1917
  %conv98 = trunc i64 %116 to i32, !dbg !1917
  %117 = load float, float* %cost, align 4, !dbg !1918
  %118 = load i64, i64* %kmax.addr, align 8, !dbg !1919
  %mul99 = mul nsw i64 3, %118, !dbg !1920
  %conv100 = sitofp i64 %mul99 to double, !dbg !1921
  %119 = load i64, i64* %kmax.addr, align 8, !dbg !1922
  %conv101 = sitofp i64 %119 to float, !dbg !1922
  %conv102 = fpext float %conv101 to double, !dbg !1923
  %call103 = call double @log(double %conv102) #2, !dbg !1924
  %mul104 = fmul double %conv100, %call103, !dbg !1925
  %conv105 = fptosi double %mul104 to i64, !dbg !1926
  %120 = load i32, i32* %pid.addr, align 4, !dbg !1927
  %121 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier.addr, align 8, !dbg !1928
  %call106 = call float @_Z3pFLP6PointsPiifPliflfiP17pthread_barrier_t(%struct.Points* %112, i32* %113, i32 %114, float %115, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, i32 %conv98, float %117, i64 %conv105, float 0x3FB99999A0000000, i32 %120, %union.pthread_barrier_t* %121), !dbg !1929
  store float %call106, float* %cost, align 4, !dbg !1930
  %122 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1931
  %conv107 = sitofp i64 %122 to double, !dbg !1931
  %123 = load i64, i64* %kmax.addr, align 8, !dbg !1933
  %conv108 = sitofp i64 %123 to double, !dbg !1933
  %mul109 = fmul double 1.100000e+00, %conv108, !dbg !1934
  %cmp110 = fcmp ole double %conv107, %mul109, !dbg !1935
  br i1 %cmp110, label %land.lhs.true, label %lor.lhs.false, !dbg !1936

land.lhs.true:                                    ; preds = %while.body97
  %124 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1937
  %conv111 = sitofp i64 %124 to double, !dbg !1937
  %125 = load i64, i64* %kmin.addr, align 8, !dbg !1939
  %conv112 = sitofp i64 %125 to double, !dbg !1939
  %mul113 = fmul double 9.000000e-01, %conv112, !dbg !1940
  %cmp114 = fcmp oge double %conv111, %mul113, !dbg !1941
  br i1 %cmp114, label %if.then120, label %lor.lhs.false, !dbg !1942

lor.lhs.false:                                    ; preds = %land.lhs.true, %while.body97
  %126 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1943
  %127 = load i64, i64* %kmax.addr, align 8, !dbg !1944
  %add115 = add nsw i64 %127, 2, !dbg !1945
  %cmp116 = icmp sle i64 %126, %add115, !dbg !1946
  br i1 %cmp116, label %land.lhs.true117, label %if.end130, !dbg !1947

land.lhs.true117:                                 ; preds = %lor.lhs.false
  %128 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1948
  %129 = load i64, i64* %kmin.addr, align 8, !dbg !1949
  %sub118 = sub nsw i64 %129, 2, !dbg !1950
  %cmp119 = icmp sge i64 %128, %sub118, !dbg !1951
  br i1 %cmp119, label %if.then120, label %if.end130, !dbg !1952

if.then120:                                       ; preds = %land.lhs.true117, %land.lhs.true
  %130 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1954
  %131 = load i32*, i32** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE8feasible, align 8, !dbg !1956
  %132 = load i32, i32* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE11numfeasible, align 4, !dbg !1957
  %133 = load float, float* %z, align 4, !dbg !1958
  %134 = load i64, i64* %kmax.addr, align 8, !dbg !1959
  %conv121 = trunc i64 %134 to i32, !dbg !1959
  %135 = load float, float* %cost, align 4, !dbg !1960
  %136 = load i64, i64* %kmax.addr, align 8, !dbg !1961
  %mul122 = mul nsw i64 3, %136, !dbg !1962
  %conv123 = sitofp i64 %mul122 to double, !dbg !1963
  %137 = load i64, i64* %kmax.addr, align 8, !dbg !1964
  %conv124 = sitofp i64 %137 to float, !dbg !1964
  %conv125 = fpext float %conv124 to double, !dbg !1965
  %call126 = call double @log(double %conv125) #2, !dbg !1966
  %mul127 = fmul double %conv123, %call126, !dbg !1967
  %conv128 = fptosi double %mul127 to i64, !dbg !1968
  %138 = load i32, i32* %pid.addr, align 4, !dbg !1969
  %139 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier.addr, align 8, !dbg !1970
  %call129 = call float @_Z3pFLP6PointsPiifPliflfiP17pthread_barrier_t(%struct.Points* %130, i32* %131, i32 %132, float %133, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, i32 %conv121, float %135, i64 %conv128, float 0x3F50624DE0000000, i32 %138, %union.pthread_barrier_t* %139), !dbg !1971
  store float %call129, float* %cost, align 4, !dbg !1972
  br label %if.end130, !dbg !1973

if.end130:                                        ; preds = %if.then120, %land.lhs.true117, %lor.lhs.false
  %140 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1974
  %141 = load i64, i64* %kmax.addr, align 8, !dbg !1976
  %cmp131 = icmp sgt i64 %140, %141, !dbg !1977
  br i1 %cmp131, label %if.then132, label %if.end141, !dbg !1978

if.then132:                                       ; preds = %if.end130
  %142 = load float, float* %z, align 4, !dbg !1979
  store float %142, float* %loz, align 4, !dbg !1981
  %143 = load float, float* %hiz, align 4, !dbg !1982
  %144 = load float, float* %loz, align 4, !dbg !1983
  %add133 = fadd float %143, %144, !dbg !1984
  %conv134 = fpext float %add133 to double, !dbg !1985
  %div135 = fdiv double %conv134, 2.000000e+00, !dbg !1986
  %conv136 = fptrunc double %div135 to float, !dbg !1985
  store float %conv136, float* %z, align 4, !dbg !1987
  %145 = load float, float* %z, align 4, !dbg !1988
  %146 = load float, float* %loz, align 4, !dbg !1989
  %sub137 = fsub float %145, %146, !dbg !1990
  %147 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1991
  %conv138 = sitofp i64 %147 to float, !dbg !1991
  %mul139 = fmul float %sub137, %conv138, !dbg !1992
  %148 = load float, float* %cost, align 4, !dbg !1993
  %add140 = fadd float %148, %mul139, !dbg !1993
  store float %add140, float* %cost, align 4, !dbg !1993
  br label %if.end141, !dbg !1994

if.end141:                                        ; preds = %if.then132, %if.end130
  %149 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1995
  %150 = load i64, i64* %kmin.addr, align 8, !dbg !1997
  %cmp142 = icmp slt i64 %149, %150, !dbg !1998
  br i1 %cmp142, label %if.then143, label %if.end152, !dbg !1999

if.then143:                                       ; preds = %if.end141
  %151 = load float, float* %z, align 4, !dbg !2000
  store float %151, float* %hiz, align 4, !dbg !2002
  %152 = load float, float* %hiz, align 4, !dbg !2003
  %153 = load float, float* %loz, align 4, !dbg !2004
  %add144 = fadd float %152, %153, !dbg !2005
  %conv145 = fpext float %add144 to double, !dbg !2006
  %div146 = fdiv double %conv145, 2.000000e+00, !dbg !2007
  %conv147 = fptrunc double %div146 to float, !dbg !2006
  store float %conv147, float* %z, align 4, !dbg !2008
  %154 = load float, float* %z, align 4, !dbg !2009
  %155 = load float, float* %hiz, align 4, !dbg !2010
  %sub148 = fsub float %154, %155, !dbg !2011
  %156 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !2012
  %conv149 = sitofp i64 %156 to float, !dbg !2012
  %mul150 = fmul float %sub148, %conv149, !dbg !2013
  %157 = load float, float* %cost, align 4, !dbg !2014
  %add151 = fadd float %157, %mul150, !dbg !2014
  store float %add151, float* %cost, align 4, !dbg !2014
  br label %if.end152, !dbg !2015

if.end152:                                        ; preds = %if.then143, %if.end141
  %158 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !2016
  %159 = load i64, i64* %kmax.addr, align 8, !dbg !2018
  %cmp153 = icmp sle i64 %158, %159, !dbg !2019
  br i1 %cmp153, label %land.lhs.true154, label %lor.lhs.false156, !dbg !2020

land.lhs.true154:                                 ; preds = %if.end152
  %160 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !2021
  %161 = load i64, i64* %kmin.addr, align 8, !dbg !2023
  %cmp155 = icmp sge i64 %160, %161, !dbg !2024
  br i1 %cmp155, label %if.then161, label %lor.lhs.false156, !dbg !2025

lor.lhs.false156:                                 ; preds = %land.lhs.true154, %if.end152
  %162 = load float, float* %loz, align 4, !dbg !2026
  %conv157 = fpext float %162 to double, !dbg !2026
  %163 = load float, float* %hiz, align 4, !dbg !2028
  %conv158 = fpext float %163 to double, !dbg !2028
  %mul159 = fmul double 9.990000e-01, %conv158, !dbg !2029
  %cmp160 = fcmp oge double %conv157, %mul159, !dbg !2030
  br i1 %cmp160, label %if.then161, label %if.end162, !dbg !2031

if.then161:                                       ; preds = %lor.lhs.false156, %land.lhs.true154
  br label %while.end163, !dbg !2032

if.end162:                                        ; preds = %lor.lhs.false156
  br label %while.body97, !dbg !2034, !llvm.loop !2035

while.end163:                                     ; preds = %if.then161
  %164 = load i32, i32* %pid.addr, align 4, !dbg !2036
  %cmp164 = icmp eq i32 %164, 0, !dbg !2038
  br i1 %cmp164, label %if.then165, label %if.end166, !dbg !2039

if.then165:                                       ; preds = %while.end163
  %165 = load i32*, i32** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE8feasible, align 8, !dbg !2040
  %166 = bitcast i32* %165 to i8*, !dbg !2040
  call void @free(i8* %166) #2, !dbg !2042
  %167 = load float*, float** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs, align 8, !dbg !2043
  %168 = bitcast float* %167 to i8*, !dbg !2043
  call void @free(i8* %168) #2, !dbg !2044
  %169 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !2045
  %170 = load i64*, i64** %kfinal.addr, align 8, !dbg !2046
  store i64 %169, i64* %170, align 8, !dbg !2047
  br label %if.end166, !dbg !2048

if.end166:                                        ; preds = %if.then165, %while.end163
  %171 = load float, float* %cost, align 4, !dbg !2049
  store float %171, float* %retval, align 4, !dbg !2050
  br label %return, !dbg !2050

return:                                           ; preds = %if.end166, %if.end51
  %172 = load float, float* %retval, align 4, !dbg !2051
  ret float %172, !dbg !2051
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #5

; Function Attrs: nounwind uwtable
define i32 @_Z11contcentersP6Points(%struct.Points* %points) #4 !dbg !2052 {
entry:
  %points.addr = alloca %struct.Points*, align 8
  %i = alloca i64, align 8
  %ii = alloca i64, align 8
  %relweight = alloca float, align 4
  store %struct.Points* %points, %struct.Points** %points.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !2055, metadata !671), !dbg !2056
  call void @llvm.dbg.declare(metadata i64* %i, metadata !2057, metadata !671), !dbg !2058
  call void @llvm.dbg.declare(metadata i64* %ii, metadata !2059, metadata !671), !dbg !2060
  call void @llvm.dbg.declare(metadata float* %relweight, metadata !2061, metadata !671), !dbg !2062
  store i64 0, i64* %i, align 8, !dbg !2063
  br label %for.cond, !dbg !2065

for.cond:                                         ; preds = %for.inc48, %entry
  %0 = load i64, i64* %i, align 8, !dbg !2066
  %1 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2069
  %num = getelementptr inbounds %struct.Points, %struct.Points* %1, i32 0, i32 0, !dbg !2070
  %2 = load i64, i64* %num, align 8, !dbg !2070
  %cmp = icmp slt i64 %0, %2, !dbg !2071
  br i1 %cmp, label %for.body, label %for.end50, !dbg !2072

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !2073
  %4 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2076
  %p = getelementptr inbounds %struct.Points, %struct.Points* %4, i32 0, i32 2, !dbg !2077
  %5 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !2077
  %arrayidx = getelementptr inbounds %struct.Point, %struct.Point* %5, i64 %3, !dbg !2076
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx, i32 0, i32 2, !dbg !2078
  %6 = load i64, i64* %assign, align 8, !dbg !2078
  %7 = load i64, i64* %i, align 8, !dbg !2079
  %cmp1 = icmp ne i64 %6, %7, !dbg !2080
  br i1 %cmp1, label %if.then, label %if.end, !dbg !2081

if.then:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !2082
  %9 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2084
  %p2 = getelementptr inbounds %struct.Points, %struct.Points* %9, i32 0, i32 2, !dbg !2085
  %10 = load %struct.Point*, %struct.Point** %p2, align 8, !dbg !2085
  %arrayidx3 = getelementptr inbounds %struct.Point, %struct.Point* %10, i64 %8, !dbg !2084
  %assign4 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx3, i32 0, i32 2, !dbg !2086
  %11 = load i64, i64* %assign4, align 8, !dbg !2086
  %12 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2087
  %p5 = getelementptr inbounds %struct.Points, %struct.Points* %12, i32 0, i32 2, !dbg !2088
  %13 = load %struct.Point*, %struct.Point** %p5, align 8, !dbg !2088
  %arrayidx6 = getelementptr inbounds %struct.Point, %struct.Point* %13, i64 %11, !dbg !2087
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx6, i32 0, i32 0, !dbg !2089
  %14 = load float, float* %weight, align 8, !dbg !2089
  %15 = load i64, i64* %i, align 8, !dbg !2090
  %16 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2091
  %p7 = getelementptr inbounds %struct.Points, %struct.Points* %16, i32 0, i32 2, !dbg !2092
  %17 = load %struct.Point*, %struct.Point** %p7, align 8, !dbg !2092
  %arrayidx8 = getelementptr inbounds %struct.Point, %struct.Point* %17, i64 %15, !dbg !2091
  %weight9 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx8, i32 0, i32 0, !dbg !2093
  %18 = load float, float* %weight9, align 8, !dbg !2093
  %add = fadd float %14, %18, !dbg !2094
  store float %add, float* %relweight, align 4, !dbg !2095
  %19 = load i64, i64* %i, align 8, !dbg !2096
  %20 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2097
  %p10 = getelementptr inbounds %struct.Points, %struct.Points* %20, i32 0, i32 2, !dbg !2098
  %21 = load %struct.Point*, %struct.Point** %p10, align 8, !dbg !2098
  %arrayidx11 = getelementptr inbounds %struct.Point, %struct.Point* %21, i64 %19, !dbg !2097
  %weight12 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx11, i32 0, i32 0, !dbg !2099
  %22 = load float, float* %weight12, align 8, !dbg !2099
  %23 = load float, float* %relweight, align 4, !dbg !2100
  %div = fdiv float %22, %23, !dbg !2101
  store float %div, float* %relweight, align 4, !dbg !2102
  store i64 0, i64* %ii, align 8, !dbg !2103
  br label %for.cond13, !dbg !2105

for.cond13:                                       ; preds = %for.inc, %if.then
  %24 = load i64, i64* %ii, align 8, !dbg !2106
  %25 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2109
  %dim = getelementptr inbounds %struct.Points, %struct.Points* %25, i32 0, i32 1, !dbg !2110
  %26 = load i32, i32* %dim, align 8, !dbg !2110
  %conv = sext i32 %26 to i64, !dbg !2109
  %cmp14 = icmp slt i64 %24, %conv, !dbg !2111
  br i1 %cmp14, label %for.body15, label %for.end, !dbg !2112

for.body15:                                       ; preds = %for.cond13
  %27 = load float, float* %relweight, align 4, !dbg !2113
  %conv16 = fpext float %27 to double, !dbg !2113
  %sub = fsub double 1.000000e+00, %conv16, !dbg !2115
  %28 = load i64, i64* %ii, align 8, !dbg !2116
  %29 = load i64, i64* %i, align 8, !dbg !2117
  %30 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2118
  %p17 = getelementptr inbounds %struct.Points, %struct.Points* %30, i32 0, i32 2, !dbg !2119
  %31 = load %struct.Point*, %struct.Point** %p17, align 8, !dbg !2119
  %arrayidx18 = getelementptr inbounds %struct.Point, %struct.Point* %31, i64 %29, !dbg !2118
  %assign19 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx18, i32 0, i32 2, !dbg !2120
  %32 = load i64, i64* %assign19, align 8, !dbg !2120
  %33 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2121
  %p20 = getelementptr inbounds %struct.Points, %struct.Points* %33, i32 0, i32 2, !dbg !2122
  %34 = load %struct.Point*, %struct.Point** %p20, align 8, !dbg !2122
  %arrayidx21 = getelementptr inbounds %struct.Point, %struct.Point* %34, i64 %32, !dbg !2121
  %coord = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx21, i32 0, i32 1, !dbg !2123
  %35 = load float*, float** %coord, align 8, !dbg !2123
  %arrayidx22 = getelementptr inbounds float, float* %35, i64 %28, !dbg !2121
  %36 = load float, float* %arrayidx22, align 4, !dbg !2124
  %conv23 = fpext float %36 to double, !dbg !2124
  %mul = fmul double %conv23, %sub, !dbg !2124
  %conv24 = fptrunc double %mul to float, !dbg !2124
  store float %conv24, float* %arrayidx22, align 4, !dbg !2124
  %37 = load i64, i64* %ii, align 8, !dbg !2125
  %38 = load i64, i64* %i, align 8, !dbg !2126
  %39 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2127
  %p25 = getelementptr inbounds %struct.Points, %struct.Points* %39, i32 0, i32 2, !dbg !2128
  %40 = load %struct.Point*, %struct.Point** %p25, align 8, !dbg !2128
  %arrayidx26 = getelementptr inbounds %struct.Point, %struct.Point* %40, i64 %38, !dbg !2127
  %coord27 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx26, i32 0, i32 1, !dbg !2129
  %41 = load float*, float** %coord27, align 8, !dbg !2129
  %arrayidx28 = getelementptr inbounds float, float* %41, i64 %37, !dbg !2127
  %42 = load float, float* %arrayidx28, align 4, !dbg !2127
  %43 = load float, float* %relweight, align 4, !dbg !2130
  %mul29 = fmul float %42, %43, !dbg !2131
  %44 = load i64, i64* %ii, align 8, !dbg !2132
  %45 = load i64, i64* %i, align 8, !dbg !2133
  %46 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2134
  %p30 = getelementptr inbounds %struct.Points, %struct.Points* %46, i32 0, i32 2, !dbg !2135
  %47 = load %struct.Point*, %struct.Point** %p30, align 8, !dbg !2135
  %arrayidx31 = getelementptr inbounds %struct.Point, %struct.Point* %47, i64 %45, !dbg !2134
  %assign32 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx31, i32 0, i32 2, !dbg !2136
  %48 = load i64, i64* %assign32, align 8, !dbg !2136
  %49 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2137
  %p33 = getelementptr inbounds %struct.Points, %struct.Points* %49, i32 0, i32 2, !dbg !2138
  %50 = load %struct.Point*, %struct.Point** %p33, align 8, !dbg !2138
  %arrayidx34 = getelementptr inbounds %struct.Point, %struct.Point* %50, i64 %48, !dbg !2137
  %coord35 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx34, i32 0, i32 1, !dbg !2139
  %51 = load float*, float** %coord35, align 8, !dbg !2139
  %arrayidx36 = getelementptr inbounds float, float* %51, i64 %44, !dbg !2137
  %52 = load float, float* %arrayidx36, align 4, !dbg !2140
  %add37 = fadd float %52, %mul29, !dbg !2140
  store float %add37, float* %arrayidx36, align 4, !dbg !2140
  br label %for.inc, !dbg !2141

for.inc:                                          ; preds = %for.body15
  %53 = load i64, i64* %ii, align 8, !dbg !2142
  %inc = add nsw i64 %53, 1, !dbg !2142
  store i64 %inc, i64* %ii, align 8, !dbg !2142
  br label %for.cond13, !dbg !2144, !llvm.loop !2145

for.end:                                          ; preds = %for.cond13
  %54 = load i64, i64* %i, align 8, !dbg !2147
  %55 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2148
  %p38 = getelementptr inbounds %struct.Points, %struct.Points* %55, i32 0, i32 2, !dbg !2149
  %56 = load %struct.Point*, %struct.Point** %p38, align 8, !dbg !2149
  %arrayidx39 = getelementptr inbounds %struct.Point, %struct.Point* %56, i64 %54, !dbg !2148
  %weight40 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx39, i32 0, i32 0, !dbg !2150
  %57 = load float, float* %weight40, align 8, !dbg !2150
  %58 = load i64, i64* %i, align 8, !dbg !2151
  %59 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2152
  %p41 = getelementptr inbounds %struct.Points, %struct.Points* %59, i32 0, i32 2, !dbg !2153
  %60 = load %struct.Point*, %struct.Point** %p41, align 8, !dbg !2153
  %arrayidx42 = getelementptr inbounds %struct.Point, %struct.Point* %60, i64 %58, !dbg !2152
  %assign43 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx42, i32 0, i32 2, !dbg !2154
  %61 = load i64, i64* %assign43, align 8, !dbg !2154
  %62 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2155
  %p44 = getelementptr inbounds %struct.Points, %struct.Points* %62, i32 0, i32 2, !dbg !2156
  %63 = load %struct.Point*, %struct.Point** %p44, align 8, !dbg !2156
  %arrayidx45 = getelementptr inbounds %struct.Point, %struct.Point* %63, i64 %61, !dbg !2155
  %weight46 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx45, i32 0, i32 0, !dbg !2157
  %64 = load float, float* %weight46, align 8, !dbg !2158
  %add47 = fadd float %64, %57, !dbg !2158
  store float %add47, float* %weight46, align 8, !dbg !2158
  br label %if.end, !dbg !2159

if.end:                                           ; preds = %for.end, %for.body
  br label %for.inc48, !dbg !2160

for.inc48:                                        ; preds = %if.end
  %65 = load i64, i64* %i, align 8, !dbg !2161
  %inc49 = add nsw i64 %65, 1, !dbg !2161
  store i64 %inc49, i64* %i, align 8, !dbg !2161
  br label %for.cond, !dbg !2163, !llvm.loop !2164

for.end50:                                        ; preds = %for.cond
  ret i32 0, !dbg !2166
}

; Function Attrs: nounwind uwtable
define void @_Z11copycentersP6PointsS0_Pll(%struct.Points* %points, %struct.Points* %centers, i64* %centerIDs, i64 %offset) #4 !dbg !2167 {
entry:
  %points.addr = alloca %struct.Points*, align 8
  %centers.addr = alloca %struct.Points*, align 8
  %centerIDs.addr = alloca i64*, align 8
  %offset.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %k = alloca i64, align 8
  %is_a_median = alloca i8*, align 8
  store %struct.Points* %points, %struct.Points** %points.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !2170, metadata !671), !dbg !2171
  store %struct.Points* %centers, %struct.Points** %centers.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %centers.addr, metadata !2172, metadata !671), !dbg !2173
  store i64* %centerIDs, i64** %centerIDs.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %centerIDs.addr, metadata !2174, metadata !671), !dbg !2175
  store i64 %offset, i64* %offset.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %offset.addr, metadata !2176, metadata !671), !dbg !2177
  call void @llvm.dbg.declare(metadata i64* %i, metadata !2178, metadata !671), !dbg !2179
  call void @llvm.dbg.declare(metadata i64* %k, metadata !2180, metadata !671), !dbg !2181
  call void @llvm.dbg.declare(metadata i8** %is_a_median, metadata !2182, metadata !671), !dbg !2183
  %0 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2184
  %num = getelementptr inbounds %struct.Points, %struct.Points* %0, i32 0, i32 0, !dbg !2185
  %1 = load i64, i64* %num, align 8, !dbg !2185
  %call = call noalias i8* @calloc(i64 %1, i64 1) #2, !dbg !2186
  store i8* %call, i8** %is_a_median, align 8, !dbg !2183
  store i64 0, i64* %i, align 8, !dbg !2187
  br label %for.cond, !dbg !2189

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !2190
  %3 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2193
  %num1 = getelementptr inbounds %struct.Points, %struct.Points* %3, i32 0, i32 0, !dbg !2194
  %4 = load i64, i64* %num1, align 8, !dbg !2194
  %cmp = icmp slt i64 %2, %4, !dbg !2195
  br i1 %cmp, label %for.body, label %for.end, !dbg !2196

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !2197
  %6 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2199
  %p = getelementptr inbounds %struct.Points, %struct.Points* %6, i32 0, i32 2, !dbg !2200
  %7 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !2200
  %arrayidx = getelementptr inbounds %struct.Point, %struct.Point* %7, i64 %5, !dbg !2199
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx, i32 0, i32 2, !dbg !2201
  %8 = load i64, i64* %assign, align 8, !dbg !2201
  %9 = load i8*, i8** %is_a_median, align 8, !dbg !2202
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %8, !dbg !2202
  store i8 1, i8* %arrayidx2, align 1, !dbg !2203
  br label %for.inc, !dbg !2204

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !2205
  %inc = add nsw i64 %10, 1, !dbg !2205
  store i64 %inc, i64* %i, align 8, !dbg !2205
  br label %for.cond, !dbg !2207, !llvm.loop !2208

for.end:                                          ; preds = %for.cond
  %11 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2210
  %num3 = getelementptr inbounds %struct.Points, %struct.Points* %11, i32 0, i32 0, !dbg !2211
  %12 = load i64, i64* %num3, align 8, !dbg !2211
  store i64 %12, i64* %k, align 8, !dbg !2212
  store i64 0, i64* %i, align 8, !dbg !2213
  br label %for.cond4, !dbg !2215

for.cond4:                                        ; preds = %for.inc21, %for.end
  %13 = load i64, i64* %i, align 8, !dbg !2216
  %14 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2219
  %num5 = getelementptr inbounds %struct.Points, %struct.Points* %14, i32 0, i32 0, !dbg !2220
  %15 = load i64, i64* %num5, align 8, !dbg !2220
  %cmp6 = icmp slt i64 %13, %15, !dbg !2221
  br i1 %cmp6, label %for.body7, label %for.end23, !dbg !2222

for.body7:                                        ; preds = %for.cond4
  %16 = load i64, i64* %i, align 8, !dbg !2223
  %17 = load i8*, i8** %is_a_median, align 8, !dbg !2226
  %arrayidx8 = getelementptr inbounds i8, i8* %17, i64 %16, !dbg !2226
  %18 = load i8, i8* %arrayidx8, align 1, !dbg !2226
  %tobool = trunc i8 %18 to i1, !dbg !2226
  br i1 %tobool, label %if.then, label %if.end, !dbg !2227

if.then:                                          ; preds = %for.body7
  %19 = load i64, i64* %k, align 8, !dbg !2228
  %20 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2230
  %p9 = getelementptr inbounds %struct.Points, %struct.Points* %20, i32 0, i32 2, !dbg !2231
  %21 = load %struct.Point*, %struct.Point** %p9, align 8, !dbg !2231
  %arrayidx10 = getelementptr inbounds %struct.Point, %struct.Point* %21, i64 %19, !dbg !2230
  %coord = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx10, i32 0, i32 1, !dbg !2232
  %22 = load float*, float** %coord, align 8, !dbg !2232
  %23 = bitcast float* %22 to i8*, !dbg !2233
  %24 = load i64, i64* %i, align 8, !dbg !2234
  %25 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2235
  %p11 = getelementptr inbounds %struct.Points, %struct.Points* %25, i32 0, i32 2, !dbg !2236
  %26 = load %struct.Point*, %struct.Point** %p11, align 8, !dbg !2236
  %arrayidx12 = getelementptr inbounds %struct.Point, %struct.Point* %26, i64 %24, !dbg !2235
  %coord13 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx12, i32 0, i32 1, !dbg !2237
  %27 = load float*, float** %coord13, align 8, !dbg !2237
  %28 = bitcast float* %27 to i8*, !dbg !2233
  %29 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2238
  %dim = getelementptr inbounds %struct.Points, %struct.Points* %29, i32 0, i32 1, !dbg !2239
  %30 = load i32, i32* %dim, align 8, !dbg !2239
  %conv = sext i32 %30 to i64, !dbg !2238
  %mul = mul i64 %conv, 4, !dbg !2240
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %28, i64 %mul, i32 4, i1 false), !dbg !2233
  %31 = load i64, i64* %i, align 8, !dbg !2241
  %32 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2242
  %p14 = getelementptr inbounds %struct.Points, %struct.Points* %32, i32 0, i32 2, !dbg !2243
  %33 = load %struct.Point*, %struct.Point** %p14, align 8, !dbg !2243
  %arrayidx15 = getelementptr inbounds %struct.Point, %struct.Point* %33, i64 %31, !dbg !2242
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx15, i32 0, i32 0, !dbg !2244
  %34 = load float, float* %weight, align 8, !dbg !2244
  %35 = load i64, i64* %k, align 8, !dbg !2245
  %36 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2246
  %p16 = getelementptr inbounds %struct.Points, %struct.Points* %36, i32 0, i32 2, !dbg !2247
  %37 = load %struct.Point*, %struct.Point** %p16, align 8, !dbg !2247
  %arrayidx17 = getelementptr inbounds %struct.Point, %struct.Point* %37, i64 %35, !dbg !2246
  %weight18 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx17, i32 0, i32 0, !dbg !2248
  store float %34, float* %weight18, align 8, !dbg !2249
  %38 = load i64, i64* %i, align 8, !dbg !2250
  %39 = load i64, i64* %offset.addr, align 8, !dbg !2251
  %add = add nsw i64 %38, %39, !dbg !2252
  %40 = load i64, i64* %k, align 8, !dbg !2253
  %41 = load i64*, i64** %centerIDs.addr, align 8, !dbg !2254
  %arrayidx19 = getelementptr inbounds i64, i64* %41, i64 %40, !dbg !2254
  store i64 %add, i64* %arrayidx19, align 8, !dbg !2255
  %42 = load i64, i64* %k, align 8, !dbg !2256
  %inc20 = add nsw i64 %42, 1, !dbg !2256
  store i64 %inc20, i64* %k, align 8, !dbg !2256
  br label %if.end, !dbg !2257

if.end:                                           ; preds = %if.then, %for.body7
  br label %for.inc21, !dbg !2258

for.inc21:                                        ; preds = %if.end
  %43 = load i64, i64* %i, align 8, !dbg !2259
  %inc22 = add nsw i64 %43, 1, !dbg !2259
  store i64 %inc22, i64* %i, align 8, !dbg !2259
  br label %for.cond4, !dbg !2261, !llvm.loop !2262

for.end23:                                        ; preds = %for.cond4
  %44 = load i64, i64* %k, align 8, !dbg !2264
  %45 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2265
  %num24 = getelementptr inbounds %struct.Points, %struct.Points* %45, i32 0, i32 0, !dbg !2266
  store i64 %44, i64* %num24, align 8, !dbg !2267
  %46 = load i8*, i8** %is_a_median, align 8, !dbg !2268
  call void @free(i8* %46) #2, !dbg !2269
  ret void, !dbg !2270
}

; Function Attrs: uwtable
define i8* @_Z14localSearchSubPv(i8* %arg_) #0 !dbg !2271 {
entry:
  %arg_.addr = alloca i8*, align 8
  %arg = alloca %struct.pkmedian_arg_t*, align 8
  store i8* %arg_, i8** %arg_.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg_.addr, metadata !2274, metadata !671), !dbg !2275
  call void @llvm.dbg.declare(metadata %struct.pkmedian_arg_t** %arg, metadata !2276, metadata !671), !dbg !2277
  %0 = load i8*, i8** %arg_.addr, align 8, !dbg !2278
  %1 = bitcast i8* %0 to %struct.pkmedian_arg_t*, !dbg !2279
  store %struct.pkmedian_arg_t* %1, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2277
  %2 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2280
  %points = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %2, i32 0, i32 0, !dbg !2281
  %3 = load %struct.Points*, %struct.Points** %points, align 8, !dbg !2281
  %4 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2282
  %kmin = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %4, i32 0, i32 1, !dbg !2283
  %5 = load i64, i64* %kmin, align 8, !dbg !2283
  %6 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2284
  %kmax = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %6, i32 0, i32 2, !dbg !2285
  %7 = load i64, i64* %kmax, align 8, !dbg !2285
  %8 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2286
  %kfinal = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %8, i32 0, i32 3, !dbg !2287
  %9 = load i64*, i64** %kfinal, align 8, !dbg !2287
  %10 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2288
  %pid = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %10, i32 0, i32 4, !dbg !2289
  %11 = load i32, i32* %pid, align 8, !dbg !2289
  %12 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2290
  %barrier = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %12, i32 0, i32 5, !dbg !2291
  %13 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier, align 8, !dbg !2291
  %call = call float @_Z8pkmedianP6PointsllPliP17pthread_barrier_t(%struct.Points* %3, i64 %5, i64 %7, i64* %9, i32 %11, %union.pthread_barrier_t* %13), !dbg !2292
  ret i8* null, !dbg !2293
}

; Function Attrs: uwtable
define void @_Z11localSearchP6PointsllPl(%struct.Points* %points, i64 %kmin, i64 %kmax, i64* %kfinal) #0 !dbg !2294 {
entry:
  %points.addr = alloca %struct.Points*, align 8
  %kmin.addr = alloca i64, align 8
  %kmax.addr = alloca i64, align 8
  %kfinal.addr = alloca i64*, align 8
  %t1 = alloca double, align 8
  %barrier = alloca %union.pthread_barrier_t, align 8
  %threads = alloca i64*, align 8
  %arg = alloca %struct.pkmedian_arg_t*, align 8
  %i = alloca i32, align 4
  %i20 = alloca i32, align 4
  %t2 = alloca double, align 8
  store %struct.Points* %points, %struct.Points** %points.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !2297, metadata !671), !dbg !2298
  store i64 %kmin, i64* %kmin.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %kmin.addr, metadata !2299, metadata !671), !dbg !2300
  store i64 %kmax, i64* %kmax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %kmax.addr, metadata !2301, metadata !671), !dbg !2302
  store i64* %kfinal, i64** %kfinal.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %kfinal.addr, metadata !2303, metadata !671), !dbg !2304
  call void @llvm.dbg.declare(metadata double* %t1, metadata !2305, metadata !671), !dbg !2306
  %call = call double @_Z7gettimev(), !dbg !2307
  store double %call, double* %t1, align 8, !dbg !2306
  call void @llvm.dbg.declare(metadata %union.pthread_barrier_t* %barrier, metadata !2308, metadata !671), !dbg !2309
  call void @llvm.dbg.declare(metadata i64** %threads, metadata !2310, metadata !671), !dbg !2313
  %0 = load i32, i32* @_ZL5nproc, align 4, !dbg !2314
  %1 = sext i32 %0 to i64, !dbg !2315
  %2 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %1, i64 8), !dbg !2315
  %3 = extractvalue { i64, i1 } %2, 1, !dbg !2315
  %4 = extractvalue { i64, i1 } %2, 0, !dbg !2315
  %5 = select i1 %3, i64 -1, i64 %4, !dbg !2315
  %call1 = call i8* @_Znam(i64 %5) #14, !dbg !2316
  %6 = bitcast i8* %call1 to i64*, !dbg !2315
  store i64* %6, i64** %threads, align 8, !dbg !2313
  call void @llvm.dbg.declare(metadata %struct.pkmedian_arg_t** %arg, metadata !2318, metadata !671), !dbg !2319
  %7 = load i32, i32* @_ZL5nproc, align 4, !dbg !2320
  %8 = sext i32 %7 to i64, !dbg !2321
  %9 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %8, i64 48), !dbg !2321
  %10 = extractvalue { i64, i1 } %9, 1, !dbg !2321
  %11 = extractvalue { i64, i1 } %9, 0, !dbg !2321
  %12 = select i1 %10, i64 -1, i64 %11, !dbg !2321
  %call2 = call i8* @_Znam(i64 %12) #14, !dbg !2322
  %13 = bitcast i8* %call2 to %struct.pkmedian_arg_t*, !dbg !2321
  store %struct.pkmedian_arg_t* %13, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2319
  call void @llvm.dbg.declare(metadata i32* %i, metadata !2323, metadata !671), !dbg !2325
  store i32 0, i32* %i, align 4, !dbg !2325
  br label %for.cond, !dbg !2326

for.cond:                                         ; preds = %for.inc, %entry
  %14 = load i32, i32* %i, align 4, !dbg !2327
  %15 = load i32, i32* @_ZL5nproc, align 4, !dbg !2330
  %cmp = icmp slt i32 %14, %15, !dbg !2331
  br i1 %cmp, label %for.body, label %for.end, !dbg !2332

for.body:                                         ; preds = %for.cond
  %16 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2333
  %17 = load i32, i32* %i, align 4, !dbg !2335
  %idxprom = sext i32 %17 to i64, !dbg !2336
  %18 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2336
  %arrayidx = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %18, i64 %idxprom, !dbg !2336
  %points3 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %arrayidx, i32 0, i32 0, !dbg !2337
  store %struct.Points* %16, %struct.Points** %points3, align 8, !dbg !2338
  %19 = load i64, i64* %kmin.addr, align 8, !dbg !2339
  %20 = load i32, i32* %i, align 4, !dbg !2340
  %idxprom4 = sext i32 %20 to i64, !dbg !2341
  %21 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2341
  %arrayidx5 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %21, i64 %idxprom4, !dbg !2341
  %kmin6 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %arrayidx5, i32 0, i32 1, !dbg !2342
  store i64 %19, i64* %kmin6, align 8, !dbg !2343
  %22 = load i64, i64* %kmax.addr, align 8, !dbg !2344
  %23 = load i32, i32* %i, align 4, !dbg !2345
  %idxprom7 = sext i32 %23 to i64, !dbg !2346
  %24 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2346
  %arrayidx8 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %24, i64 %idxprom7, !dbg !2346
  %kmax9 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %arrayidx8, i32 0, i32 2, !dbg !2347
  store i64 %22, i64* %kmax9, align 8, !dbg !2348
  %25 = load i32, i32* %i, align 4, !dbg !2349
  %26 = load i32, i32* %i, align 4, !dbg !2350
  %idxprom10 = sext i32 %26 to i64, !dbg !2351
  %27 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2351
  %arrayidx11 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %27, i64 %idxprom10, !dbg !2351
  %pid = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %arrayidx11, i32 0, i32 4, !dbg !2352
  store i32 %25, i32* %pid, align 8, !dbg !2353
  %28 = load i64*, i64** %kfinal.addr, align 8, !dbg !2354
  %29 = load i32, i32* %i, align 4, !dbg !2355
  %idxprom12 = sext i32 %29 to i64, !dbg !2356
  %30 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2356
  %arrayidx13 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %30, i64 %idxprom12, !dbg !2356
  %kfinal14 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %arrayidx13, i32 0, i32 3, !dbg !2357
  store i64* %28, i64** %kfinal14, align 8, !dbg !2358
  %31 = load i32, i32* %i, align 4, !dbg !2359
  %idxprom15 = sext i32 %31 to i64, !dbg !2360
  %32 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2360
  %arrayidx16 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %32, i64 %idxprom15, !dbg !2360
  %barrier17 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %arrayidx16, i32 0, i32 5, !dbg !2361
  store %union.pthread_barrier_t* %barrier, %union.pthread_barrier_t** %barrier17, align 8, !dbg !2362
  %33 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2363
  %arrayidx18 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %33, i64 0, !dbg !2363
  %34 = bitcast %struct.pkmedian_arg_t* %arrayidx18 to i8*, !dbg !2364
  %call19 = call i8* @_Z14localSearchSubPv(i8* %34), !dbg !2365
  br label %for.inc, !dbg !2366

for.inc:                                          ; preds = %for.body
  %35 = load i32, i32* %i, align 4, !dbg !2367
  %inc = add nsw i32 %35, 1, !dbg !2367
  store i32 %inc, i32* %i, align 4, !dbg !2367
  br label %for.cond, !dbg !2369, !llvm.loop !2370

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i20, metadata !2372, metadata !671), !dbg !2374
  store i32 0, i32* %i20, align 4, !dbg !2374
  br label %for.cond21, !dbg !2375

for.cond21:                                       ; preds = %for.inc24, %for.end
  %36 = load i32, i32* %i20, align 4, !dbg !2376
  %37 = load i32, i32* @_ZL5nproc, align 4, !dbg !2379
  %cmp22 = icmp slt i32 %36, %37, !dbg !2380
  br i1 %cmp22, label %for.body23, label %for.end26, !dbg !2381

for.body23:                                       ; preds = %for.cond21
  br label %for.inc24, !dbg !2382

for.inc24:                                        ; preds = %for.body23
  %38 = load i32, i32* %i20, align 4, !dbg !2384
  %inc25 = add nsw i32 %38, 1, !dbg !2384
  store i32 %inc25, i32* %i20, align 4, !dbg !2384
  br label %for.cond21, !dbg !2386, !llvm.loop !2387

for.end26:                                        ; preds = %for.cond21
  %39 = load i64*, i64** %threads, align 8, !dbg !2389
  %isnull = icmp eq i64* %39, null, !dbg !2390
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !2390

delete.notnull:                                   ; preds = %for.end26
  %40 = bitcast i64* %39 to i8*, !dbg !2391
  call void @_ZdaPv(i8* %40) #15, !dbg !2391
  br label %delete.end, !dbg !2391

delete.end:                                       ; preds = %delete.notnull, %for.end26
  %41 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2392
  %isnull27 = icmp eq %struct.pkmedian_arg_t* %41, null, !dbg !2393
  br i1 %isnull27, label %delete.end29, label %delete.notnull28, !dbg !2393

delete.notnull28:                                 ; preds = %delete.end
  %42 = bitcast %struct.pkmedian_arg_t* %41 to i8*, !dbg !2394
  call void @_ZdaPv(i8* %42) #15, !dbg !2394
  br label %delete.end29, !dbg !2394

delete.end29:                                     ; preds = %delete.notnull28, %delete.end
  call void @llvm.dbg.declare(metadata double* %t2, metadata !2395, metadata !671), !dbg !2396
  %call30 = call double @_Z7gettimev(), !dbg !2397
  store double %call30, double* %t2, align 8, !dbg !2396
  %43 = load double, double* %t2, align 8, !dbg !2398
  %44 = load double, double* %t1, align 8, !dbg !2399
  %sub = fsub double %43, %44, !dbg !2400
  %45 = load double, double* @time_local_search, align 8, !dbg !2401
  %add = fadd double %45, %sub, !dbg !2401
  store double %add, double* @time_local_search, align 8, !dbg !2401
  ret void, !dbg !2402
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #3

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #7

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #8

; Function Attrs: uwtable
define void @_Z12outcenterIDsP6PointsPlPc(%struct.Points* %centers, i64* %centerIDs, i8* %outfile) #0 !dbg !2403 {
entry:
  %centers.addr = alloca %struct.Points*, align 8
  %centerIDs.addr = alloca i64*, align 8
  %outfile.addr = alloca i8*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  %is_a_median = alloca i32*, align 8
  %i = alloca i32, align 4
  %i6 = alloca i32, align 4
  %k = alloca i32, align 4
  store %struct.Points* %centers, %struct.Points** %centers.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %centers.addr, metadata !2406, metadata !671), !dbg !2407
  store i64* %centerIDs, i64** %centerIDs.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %centerIDs.addr, metadata !2408, metadata !671), !dbg !2409
  store i8* %outfile, i8** %outfile.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %outfile.addr, metadata !2410, metadata !671), !dbg !2411
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !2412, metadata !671), !dbg !2413
  %0 = load i8*, i8** %outfile.addr, align 8, !dbg !2414
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)), !dbg !2415
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !2413
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !2416
  %cmp = icmp eq %struct._IO_FILE* %1, null, !dbg !2418
  br i1 %cmp, label %if.then, label %if.end, !dbg !2419

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2420
  %3 = load i8*, i8** %outfile.addr, align 8, !dbg !2422
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i32 0, i32 0), i8* %3), !dbg !2423
  call void @exit(i32 1) #16, !dbg !2424
  unreachable, !dbg !2424

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %is_a_median, metadata !2425, metadata !671), !dbg !2426
  %4 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2427
  %num = getelementptr inbounds %struct.Points, %struct.Points* %4, i32 0, i32 0, !dbg !2428
  %5 = load i64, i64* %num, align 8, !dbg !2428
  %call2 = call noalias i8* @calloc(i64 4, i64 %5) #2, !dbg !2429
  %6 = bitcast i8* %call2 to i32*, !dbg !2430
  store i32* %6, i32** %is_a_median, align 8, !dbg !2426
  call void @llvm.dbg.declare(metadata i32* %i, metadata !2431, metadata !671), !dbg !2433
  store i32 0, i32* %i, align 4, !dbg !2433
  br label %for.cond, !dbg !2434

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i32, i32* %i, align 4, !dbg !2435
  %conv = sext i32 %7 to i64, !dbg !2435
  %8 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2438
  %num3 = getelementptr inbounds %struct.Points, %struct.Points* %8, i32 0, i32 0, !dbg !2439
  %9 = load i64, i64* %num3, align 8, !dbg !2439
  %cmp4 = icmp slt i64 %conv, %9, !dbg !2440
  br i1 %cmp4, label %for.body, label %for.end, !dbg !2441

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !2442
  %idxprom = sext i32 %10 to i64, !dbg !2444
  %11 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2444
  %p = getelementptr inbounds %struct.Points, %struct.Points* %11, i32 0, i32 2, !dbg !2445
  %12 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !2445
  %arrayidx = getelementptr inbounds %struct.Point, %struct.Point* %12, i64 %idxprom, !dbg !2444
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx, i32 0, i32 2, !dbg !2446
  %13 = load i64, i64* %assign, align 8, !dbg !2446
  %14 = load i32*, i32** %is_a_median, align 8, !dbg !2447
  %arrayidx5 = getelementptr inbounds i32, i32* %14, i64 %13, !dbg !2447
  store i32 1, i32* %arrayidx5, align 4, !dbg !2448
  br label %for.inc, !dbg !2449

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !2450
  %inc = add nsw i32 %15, 1, !dbg !2450
  store i32 %inc, i32* %i, align 4, !dbg !2450
  br label %for.cond, !dbg !2452, !llvm.loop !2453

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i6, metadata !2455, metadata !671), !dbg !2457
  store i32 0, i32* %i6, align 4, !dbg !2457
  br label %for.cond7, !dbg !2458

for.cond7:                                        ; preds = %for.inc38, %for.end
  %16 = load i32, i32* %i6, align 4, !dbg !2459
  %conv8 = sext i32 %16 to i64, !dbg !2459
  %17 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2462
  %num9 = getelementptr inbounds %struct.Points, %struct.Points* %17, i32 0, i32 0, !dbg !2463
  %18 = load i64, i64* %num9, align 8, !dbg !2463
  %cmp10 = icmp slt i64 %conv8, %18, !dbg !2464
  br i1 %cmp10, label %for.body11, label %for.end40, !dbg !2465

for.body11:                                       ; preds = %for.cond7
  %19 = load i32, i32* %i6, align 4, !dbg !2466
  %idxprom12 = sext i32 %19 to i64, !dbg !2469
  %20 = load i32*, i32** %is_a_median, align 8, !dbg !2469
  %arrayidx13 = getelementptr inbounds i32, i32* %20, i64 %idxprom12, !dbg !2469
  %21 = load i32, i32* %arrayidx13, align 4, !dbg !2469
  %tobool = icmp ne i32 %21, 0, !dbg !2469
  br i1 %tobool, label %if.then14, label %if.end37, !dbg !2470

if.then14:                                        ; preds = %for.body11
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !2471
  %23 = load i32, i32* %i6, align 4, !dbg !2473
  %idxprom15 = sext i32 %23 to i64, !dbg !2474
  %24 = load i64*, i64** %centerIDs.addr, align 8, !dbg !2474
  %arrayidx16 = getelementptr inbounds i64, i64* %24, i64 %idxprom15, !dbg !2474
  %25 = load i64, i64* %arrayidx16, align 8, !dbg !2474
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i64 %25), !dbg !2475
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !2476
  %27 = load i32, i32* %i6, align 4, !dbg !2477
  %idxprom18 = sext i32 %27 to i64, !dbg !2478
  %28 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2478
  %p19 = getelementptr inbounds %struct.Points, %struct.Points* %28, i32 0, i32 2, !dbg !2479
  %29 = load %struct.Point*, %struct.Point** %p19, align 8, !dbg !2479
  %arrayidx20 = getelementptr inbounds %struct.Point, %struct.Point* %29, i64 %idxprom18, !dbg !2478
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx20, i32 0, i32 0, !dbg !2480
  %30 = load float, float* %weight, align 8, !dbg !2480
  %conv21 = fpext float %30 to double, !dbg !2478
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), double %conv21), !dbg !2481
  call void @llvm.dbg.declare(metadata i32* %k, metadata !2482, metadata !671), !dbg !2484
  store i32 0, i32* %k, align 4, !dbg !2484
  br label %for.cond23, !dbg !2485

for.cond23:                                       ; preds = %for.inc33, %if.then14
  %31 = load i32, i32* %k, align 4, !dbg !2486
  %32 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2489
  %dim = getelementptr inbounds %struct.Points, %struct.Points* %32, i32 0, i32 1, !dbg !2490
  %33 = load i32, i32* %dim, align 8, !dbg !2490
  %cmp24 = icmp slt i32 %31, %33, !dbg !2491
  br i1 %cmp24, label %for.body25, label %for.end35, !dbg !2492

for.body25:                                       ; preds = %for.cond23
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !2493
  %35 = load i32, i32* %k, align 4, !dbg !2495
  %idxprom26 = sext i32 %35 to i64, !dbg !2496
  %36 = load i32, i32* %i6, align 4, !dbg !2497
  %idxprom27 = sext i32 %36 to i64, !dbg !2496
  %37 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2496
  %p28 = getelementptr inbounds %struct.Points, %struct.Points* %37, i32 0, i32 2, !dbg !2498
  %38 = load %struct.Point*, %struct.Point** %p28, align 8, !dbg !2498
  %arrayidx29 = getelementptr inbounds %struct.Point, %struct.Point* %38, i64 %idxprom27, !dbg !2496
  %coord = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx29, i32 0, i32 1, !dbg !2499
  %39 = load float*, float** %coord, align 8, !dbg !2499
  %arrayidx30 = getelementptr inbounds float, float* %39, i64 %idxprom26, !dbg !2496
  %40 = load float, float* %arrayidx30, align 4, !dbg !2496
  %conv31 = fpext float %40 to double, !dbg !2496
  %call32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), double %conv31), !dbg !2500
  br label %for.inc33, !dbg !2501

for.inc33:                                        ; preds = %for.body25
  %41 = load i32, i32* %k, align 4, !dbg !2502
  %inc34 = add nsw i32 %41, 1, !dbg !2502
  store i32 %inc34, i32* %k, align 4, !dbg !2502
  br label %for.cond23, !dbg !2504, !llvm.loop !2505

for.end35:                                        ; preds = %for.cond23
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !2507
  %call36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0)), !dbg !2508
  br label %if.end37, !dbg !2509

if.end37:                                         ; preds = %for.end35, %for.body11
  br label %for.inc38, !dbg !2510

for.inc38:                                        ; preds = %if.end37
  %43 = load i32, i32* %i6, align 4, !dbg !2511
  %inc39 = add nsw i32 %43, 1, !dbg !2511
  store i32 %inc39, i32* %i6, align 4, !dbg !2511
  br label %for.cond7, !dbg !2513, !llvm.loop !2514

for.end40:                                        ; preds = %for.cond7
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !2516
  %call41 = call i32 @fclose(%struct._IO_FILE* %44), !dbg !2517
  ret void, !dbg !2518
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #9

; Function Attrs: uwtable
define void @_Z13streamClusterP7PStreamllillPc(%class.PStream* %stream, i64 %kmin, i64 %kmax, i32 %dim, i64 %chunksize, i64 %centersize, i8* %outfile) #0 !dbg !2519 {
entry:
  %stream.addr = alloca %class.PStream*, align 8
  %kmin.addr = alloca i64, align 8
  %kmax.addr = alloca i64, align 8
  %dim.addr = alloca i32, align 4
  %chunksize.addr = alloca i64, align 8
  %centersize.addr = alloca i64, align 8
  %outfile.addr = alloca i8*, align 8
  %block = alloca float*, align 8
  %centerBlock = alloca float*, align 8
  %centerIDs = alloca i64*, align 8
  %points = alloca %struct.Points, align 8
  %i = alloca i32, align 4
  %centers = alloca %struct.Points, align 8
  %i25 = alloca i32, align 4
  %IDoffset = alloca i64, align 8
  %kfinal = alloca i64, align 8
  %numRead = alloca i64, align 8
  %i60 = alloca i32, align 4
  store %class.PStream* %stream, %class.PStream** %stream.addr, align 8
  call void @llvm.dbg.declare(metadata %class.PStream** %stream.addr, metadata !2539, metadata !671), !dbg !2540
  store i64 %kmin, i64* %kmin.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %kmin.addr, metadata !2541, metadata !671), !dbg !2542
  store i64 %kmax, i64* %kmax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %kmax.addr, metadata !2543, metadata !671), !dbg !2544
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !2545, metadata !671), !dbg !2546
  store i64 %chunksize, i64* %chunksize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %chunksize.addr, metadata !2547, metadata !671), !dbg !2548
  store i64 %centersize, i64* %centersize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %centersize.addr, metadata !2549, metadata !671), !dbg !2550
  store i8* %outfile, i8** %outfile.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %outfile.addr, metadata !2551, metadata !671), !dbg !2552
  call void @llvm.dbg.declare(metadata float** %block, metadata !2553, metadata !671), !dbg !2554
  %0 = load i64, i64* %chunksize.addr, align 8, !dbg !2555
  %1 = load i32, i32* %dim.addr, align 4, !dbg !2556
  %conv = sext i32 %1 to i64, !dbg !2556
  %mul = mul nsw i64 %0, %conv, !dbg !2557
  %mul1 = mul i64 %mul, 4, !dbg !2558
  %call = call noalias i8* @malloc(i64 %mul1) #2, !dbg !2559
  %2 = bitcast i8* %call to float*, !dbg !2560
  store float* %2, float** %block, align 8, !dbg !2554
  call void @llvm.dbg.declare(metadata float** %centerBlock, metadata !2561, metadata !671), !dbg !2562
  %3 = load i64, i64* %centersize.addr, align 8, !dbg !2563
  %4 = load i32, i32* %dim.addr, align 4, !dbg !2564
  %conv2 = sext i32 %4 to i64, !dbg !2564
  %mul3 = mul nsw i64 %3, %conv2, !dbg !2565
  %mul4 = mul i64 %mul3, 4, !dbg !2566
  %call5 = call noalias i8* @malloc(i64 %mul4) #2, !dbg !2567
  %5 = bitcast i8* %call5 to float*, !dbg !2568
  store float* %5, float** %centerBlock, align 8, !dbg !2562
  call void @llvm.dbg.declare(metadata i64** %centerIDs, metadata !2569, metadata !671), !dbg !2570
  %6 = load i64, i64* %centersize.addr, align 8, !dbg !2571
  %7 = load i32, i32* %dim.addr, align 4, !dbg !2572
  %conv6 = sext i32 %7 to i64, !dbg !2572
  %mul7 = mul nsw i64 %6, %conv6, !dbg !2573
  %mul8 = mul i64 %mul7, 8, !dbg !2574
  %call9 = call noalias i8* @malloc(i64 %mul8) #2, !dbg !2575
  %8 = bitcast i8* %call9 to i64*, !dbg !2576
  store i64* %8, i64** %centerIDs, align 8, !dbg !2570
  %9 = load float*, float** %block, align 8, !dbg !2577
  %cmp = icmp eq float* %9, null, !dbg !2579
  br i1 %cmp, label %if.then, label %if.end, !dbg !2580

if.then:                                          ; preds = %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2581
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.7, i32 0, i32 0)), !dbg !2583
  call void @exit(i32 1) #16, !dbg !2584
  unreachable, !dbg !2584

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.Points* %points, metadata !2585, metadata !671), !dbg !2586
  %11 = load i32, i32* %dim.addr, align 4, !dbg !2587
  %dim11 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 1, !dbg !2588
  store i32 %11, i32* %dim11, align 8, !dbg !2589
  %12 = load i64, i64* %chunksize.addr, align 8, !dbg !2590
  %num = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 0, !dbg !2591
  store i64 %12, i64* %num, align 8, !dbg !2592
  %13 = load i64, i64* %chunksize.addr, align 8, !dbg !2593
  %mul12 = mul i64 %13, 32, !dbg !2594
  %call13 = call noalias i8* @malloc(i64 %mul12) #2, !dbg !2595
  %14 = bitcast i8* %call13 to %struct.Point*, !dbg !2596
  %p = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 2, !dbg !2597
  store %struct.Point* %14, %struct.Point** %p, align 8, !dbg !2598
  call void @llvm.dbg.declare(metadata i32* %i, metadata !2599, metadata !671), !dbg !2601
  store i32 0, i32* %i, align 4, !dbg !2601
  br label %for.cond, !dbg !2602

for.cond:                                         ; preds = %for.inc, %if.end
  %15 = load i32, i32* %i, align 4, !dbg !2603
  %conv14 = sext i32 %15 to i64, !dbg !2603
  %16 = load i64, i64* %chunksize.addr, align 8, !dbg !2606
  %cmp15 = icmp slt i64 %conv14, %16, !dbg !2607
  br i1 %cmp15, label %for.body, label %for.end, !dbg !2608

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !2609
  %18 = load i32, i32* %dim.addr, align 4, !dbg !2611
  %mul16 = mul nsw i32 %17, %18, !dbg !2612
  %idxprom = sext i32 %mul16 to i64, !dbg !2613
  %19 = load float*, float** %block, align 8, !dbg !2613
  %arrayidx = getelementptr inbounds float, float* %19, i64 %idxprom, !dbg !2613
  %20 = load i32, i32* %i, align 4, !dbg !2614
  %idxprom17 = sext i32 %20 to i64, !dbg !2615
  %p18 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 2, !dbg !2616
  %21 = load %struct.Point*, %struct.Point** %p18, align 8, !dbg !2616
  %arrayidx19 = getelementptr inbounds %struct.Point, %struct.Point* %21, i64 %idxprom17, !dbg !2615
  %coord = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx19, i32 0, i32 1, !dbg !2617
  store float* %arrayidx, float** %coord, align 8, !dbg !2618
  br label %for.inc, !dbg !2619

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !2620
  %inc = add nsw i32 %22, 1, !dbg !2620
  store i32 %inc, i32* %i, align 4, !dbg !2620
  br label %for.cond, !dbg !2622, !llvm.loop !2623

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.Points* %centers, metadata !2625, metadata !671), !dbg !2626
  %23 = load i32, i32* %dim.addr, align 4, !dbg !2627
  %dim20 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 1, !dbg !2628
  store i32 %23, i32* %dim20, align 8, !dbg !2629
  %24 = load i64, i64* %centersize.addr, align 8, !dbg !2630
  %mul21 = mul i64 %24, 32, !dbg !2631
  %call22 = call noalias i8* @malloc(i64 %mul21) #2, !dbg !2632
  %25 = bitcast i8* %call22 to %struct.Point*, !dbg !2633
  %p23 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 2, !dbg !2634
  store %struct.Point* %25, %struct.Point** %p23, align 8, !dbg !2635
  %num24 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 0, !dbg !2636
  store i64 0, i64* %num24, align 8, !dbg !2637
  call void @llvm.dbg.declare(metadata i32* %i25, metadata !2638, metadata !671), !dbg !2640
  store i32 0, i32* %i25, align 4, !dbg !2640
  br label %for.cond26, !dbg !2641

for.cond26:                                       ; preds = %for.inc40, %for.end
  %26 = load i32, i32* %i25, align 4, !dbg !2642
  %conv27 = sext i32 %26 to i64, !dbg !2642
  %27 = load i64, i64* %centersize.addr, align 8, !dbg !2645
  %cmp28 = icmp slt i64 %conv27, %27, !dbg !2646
  br i1 %cmp28, label %for.body29, label %for.end42, !dbg !2647

for.body29:                                       ; preds = %for.cond26
  %28 = load i32, i32* %i25, align 4, !dbg !2648
  %29 = load i32, i32* %dim.addr, align 4, !dbg !2650
  %mul30 = mul nsw i32 %28, %29, !dbg !2651
  %idxprom31 = sext i32 %mul30 to i64, !dbg !2652
  %30 = load float*, float** %centerBlock, align 8, !dbg !2652
  %arrayidx32 = getelementptr inbounds float, float* %30, i64 %idxprom31, !dbg !2652
  %31 = load i32, i32* %i25, align 4, !dbg !2653
  %idxprom33 = sext i32 %31 to i64, !dbg !2654
  %p34 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 2, !dbg !2655
  %32 = load %struct.Point*, %struct.Point** %p34, align 8, !dbg !2655
  %arrayidx35 = getelementptr inbounds %struct.Point, %struct.Point* %32, i64 %idxprom33, !dbg !2654
  %coord36 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx35, i32 0, i32 1, !dbg !2656
  store float* %arrayidx32, float** %coord36, align 8, !dbg !2657
  %33 = load i32, i32* %i25, align 4, !dbg !2658
  %idxprom37 = sext i32 %33 to i64, !dbg !2659
  %p38 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 2, !dbg !2660
  %34 = load %struct.Point*, %struct.Point** %p38, align 8, !dbg !2660
  %arrayidx39 = getelementptr inbounds %struct.Point, %struct.Point* %34, i64 %idxprom37, !dbg !2659
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx39, i32 0, i32 0, !dbg !2661
  store float 1.000000e+00, float* %weight, align 8, !dbg !2662
  br label %for.inc40, !dbg !2663

for.inc40:                                        ; preds = %for.body29
  %35 = load i32, i32* %i25, align 4, !dbg !2664
  %inc41 = add nsw i32 %35, 1, !dbg !2664
  store i32 %inc41, i32* %i25, align 4, !dbg !2664
  br label %for.cond26, !dbg !2666, !llvm.loop !2667

for.end42:                                        ; preds = %for.cond26
  call void @llvm.dbg.declare(metadata i64* %IDoffset, metadata !2669, metadata !671), !dbg !2670
  store i64 0, i64* %IDoffset, align 8, !dbg !2670
  call void @llvm.dbg.declare(metadata i64* %kfinal, metadata !2671, metadata !671), !dbg !2672
  br label %while.body, !dbg !2673

while.body:                                       ; preds = %for.end42, %if.end94
  call void @llvm.dbg.declare(metadata i64* %numRead, metadata !2674, metadata !671), !dbg !2676
  %36 = load %class.PStream*, %class.PStream** %stream.addr, align 8, !dbg !2677
  %37 = bitcast %class.PStream* %36 to i64 (%class.PStream*, float*, i32, i32)***, !dbg !2678
  %vtable = load i64 (%class.PStream*, float*, i32, i32)**, i64 (%class.PStream*, float*, i32, i32)*** %37, align 8, !dbg !2678
  %vfn = getelementptr inbounds i64 (%class.PStream*, float*, i32, i32)*, i64 (%class.PStream*, float*, i32, i32)** %vtable, i64 0, !dbg !2678
  %38 = load i64 (%class.PStream*, float*, i32, i32)*, i64 (%class.PStream*, float*, i32, i32)** %vfn, align 8, !dbg !2678
  %39 = load float*, float** %block, align 8, !dbg !2679
  %40 = load i32, i32* %dim.addr, align 4, !dbg !2680
  %41 = load i64, i64* %chunksize.addr, align 8, !dbg !2681
  %conv43 = trunc i64 %41 to i32, !dbg !2681
  %call44 = call i64 %38(%class.PStream* %36, float* %39, i32 %40, i32 %conv43), !dbg !2678
  store i64 %call44, i64* %numRead, align 8, !dbg !2676
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2682
  %43 = load i64, i64* %numRead, align 8, !dbg !2683
  %call45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i32 0, i32 0), i64 %43), !dbg !2684
  %44 = load %class.PStream*, %class.PStream** %stream.addr, align 8, !dbg !2685
  %45 = bitcast %class.PStream* %44 to i32 (%class.PStream*)***, !dbg !2687
  %vtable46 = load i32 (%class.PStream*)**, i32 (%class.PStream*)*** %45, align 8, !dbg !2687
  %vfn47 = getelementptr inbounds i32 (%class.PStream*)*, i32 (%class.PStream*)** %vtable46, i64 1, !dbg !2687
  %46 = load i32 (%class.PStream*)*, i32 (%class.PStream*)** %vfn47, align 8, !dbg !2687
  %call48 = call i32 %46(%class.PStream* %44), !dbg !2687
  %tobool = icmp ne i32 %call48, 0, !dbg !2685
  br i1 %tobool, label %if.then56, label %lor.lhs.false, !dbg !2688

lor.lhs.false:                                    ; preds = %while.body
  %47 = load i64, i64* %numRead, align 8, !dbg !2689
  %48 = load i64, i64* %chunksize.addr, align 8, !dbg !2691
  %conv49 = trunc i64 %48 to i32, !dbg !2691
  %conv50 = zext i32 %conv49 to i64, !dbg !2692
  %cmp51 = icmp ult i64 %47, %conv50, !dbg !2693
  br i1 %cmp51, label %land.lhs.true, label %if.end58, !dbg !2694

land.lhs.true:                                    ; preds = %lor.lhs.false
  %49 = load %class.PStream*, %class.PStream** %stream.addr, align 8, !dbg !2695
  %50 = bitcast %class.PStream* %49 to i32 (%class.PStream*)***, !dbg !2697
  %vtable52 = load i32 (%class.PStream*)**, i32 (%class.PStream*)*** %50, align 8, !dbg !2697
  %vfn53 = getelementptr inbounds i32 (%class.PStream*)*, i32 (%class.PStream*)** %vtable52, i64 2, !dbg !2697
  %51 = load i32 (%class.PStream*)*, i32 (%class.PStream*)** %vfn53, align 8, !dbg !2697
  %call54 = call i32 %51(%class.PStream* %49), !dbg !2697
  %tobool55 = icmp ne i32 %call54, 0, !dbg !2695
  br i1 %tobool55, label %if.end58, label %if.then56, !dbg !2698

if.then56:                                        ; preds = %land.lhs.true, %while.body
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2699
  %call57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.9, i32 0, i32 0)), !dbg !2701
  call void @exit(i32 1) #16, !dbg !2702
  unreachable, !dbg !2702

if.end58:                                         ; preds = %land.lhs.true, %lor.lhs.false
  %53 = load i64, i64* %numRead, align 8, !dbg !2703
  %num59 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 0, !dbg !2704
  store i64 %53, i64* %num59, align 8, !dbg !2705
  call void @llvm.dbg.declare(metadata i32* %i60, metadata !2706, metadata !671), !dbg !2708
  store i32 0, i32* %i60, align 4, !dbg !2708
  br label %for.cond61, !dbg !2709

for.cond61:                                       ; preds = %for.inc70, %if.end58
  %54 = load i32, i32* %i60, align 4, !dbg !2710
  %conv62 = sext i32 %54 to i64, !dbg !2710
  %num63 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 0, !dbg !2713
  %55 = load i64, i64* %num63, align 8, !dbg !2713
  %cmp64 = icmp slt i64 %conv62, %55, !dbg !2714
  br i1 %cmp64, label %for.body65, label %for.end72, !dbg !2715

for.body65:                                       ; preds = %for.cond61
  %56 = load i32, i32* %i60, align 4, !dbg !2716
  %idxprom66 = sext i32 %56 to i64, !dbg !2718
  %p67 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 2, !dbg !2719
  %57 = load %struct.Point*, %struct.Point** %p67, align 8, !dbg !2719
  %arrayidx68 = getelementptr inbounds %struct.Point, %struct.Point* %57, i64 %idxprom66, !dbg !2718
  %weight69 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx68, i32 0, i32 0, !dbg !2720
  store float 1.000000e+00, float* %weight69, align 8, !dbg !2721
  br label %for.inc70, !dbg !2722

for.inc70:                                        ; preds = %for.body65
  %58 = load i32, i32* %i60, align 4, !dbg !2723
  %inc71 = add nsw i32 %58, 1, !dbg !2723
  store i32 %inc71, i32* %i60, align 4, !dbg !2723
  br label %for.cond61, !dbg !2725, !llvm.loop !2726

for.end72:                                        ; preds = %for.cond61
  %num73 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 0, !dbg !2728
  %59 = load i64, i64* %num73, align 8, !dbg !2728
  %mul74 = mul i64 %59, 1, !dbg !2729
  %call75 = call noalias i8* @malloc(i64 %mul74) #2, !dbg !2730
  store i8* %call75, i8** @_ZL17switch_membership, align 8, !dbg !2731
  %num76 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 0, !dbg !2732
  %60 = load i64, i64* %num76, align 8, !dbg !2732
  %call77 = call noalias i8* @calloc(i64 %60, i64 1) #2, !dbg !2733
  store i8* %call77, i8** @_ZL9is_center, align 8, !dbg !2734
  %num78 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 0, !dbg !2735
  %61 = load i64, i64* %num78, align 8, !dbg !2735
  %mul79 = mul i64 %61, 4, !dbg !2736
  %call80 = call noalias i8* @malloc(i64 %mul79) #2, !dbg !2737
  %62 = bitcast i8* %call80 to i32*, !dbg !2738
  store i32* %62, i32** @_ZL12center_table, align 8, !dbg !2739
  %63 = load i64, i64* %kmin.addr, align 8, !dbg !2740
  %64 = load i64, i64* %kmax.addr, align 8, !dbg !2741
  call void @_Z11localSearchP6PointsllPl(%struct.Points* %points, i64 %63, i64 %64, i64* %kfinal), !dbg !2742
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2743
  %call81 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %65, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i32 0, i32 0)), !dbg !2744
  %call82 = call i32 @_Z11contcentersP6Points(%struct.Points* %points), !dbg !2745
  store i8 1, i8* @isCoordChanged, align 1, !dbg !2746
  %66 = load i64, i64* %kfinal, align 8, !dbg !2747
  %num83 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 0, !dbg !2749
  %67 = load i64, i64* %num83, align 8, !dbg !2749
  %add = add nsw i64 %66, %67, !dbg !2750
  %68 = load i64, i64* %centersize.addr, align 8, !dbg !2751
  %cmp84 = icmp sgt i64 %add, %68, !dbg !2752
  br i1 %cmp84, label %if.then85, label %if.end87, !dbg !2753

if.then85:                                        ; preds = %for.end72
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2754
  %call86 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %69, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.11, i32 0, i32 0)), !dbg !2756
  call void @exit(i32 1) #16, !dbg !2757
  unreachable, !dbg !2757

if.end87:                                         ; preds = %for.end72
  %70 = load i64*, i64** %centerIDs, align 8, !dbg !2758
  %71 = load i64, i64* %IDoffset, align 8, !dbg !2759
  call void @_Z11copycentersP6PointsS0_Pll(%struct.Points* %points, %struct.Points* %centers, i64* %70, i64 %71), !dbg !2760
  %72 = load i64, i64* %numRead, align 8, !dbg !2761
  %73 = load i64, i64* %IDoffset, align 8, !dbg !2762
  %add88 = add i64 %73, %72, !dbg !2762
  store i64 %add88, i64* %IDoffset, align 8, !dbg !2762
  %74 = load i8*, i8** @_ZL9is_center, align 8, !dbg !2763
  call void @free(i8* %74) #2, !dbg !2764
  %75 = load i8*, i8** @_ZL17switch_membership, align 8, !dbg !2765
  call void @free(i8* %75) #2, !dbg !2766
  %76 = load i32*, i32** @_ZL12center_table, align 8, !dbg !2767
  %77 = bitcast i32* %76 to i8*, !dbg !2767
  call void @free(i8* %77) #2, !dbg !2768
  %78 = load %class.PStream*, %class.PStream** %stream.addr, align 8, !dbg !2769
  %79 = bitcast %class.PStream* %78 to i32 (%class.PStream*)***, !dbg !2771
  %vtable89 = load i32 (%class.PStream*)**, i32 (%class.PStream*)*** %79, align 8, !dbg !2771
  %vfn90 = getelementptr inbounds i32 (%class.PStream*)*, i32 (%class.PStream*)** %vtable89, i64 2, !dbg !2771
  %80 = load i32 (%class.PStream*)*, i32 (%class.PStream*)** %vfn90, align 8, !dbg !2771
  %call91 = call i32 %80(%class.PStream* %78), !dbg !2771
  %tobool92 = icmp ne i32 %call91, 0, !dbg !2769
  br i1 %tobool92, label %if.then93, label %if.end94, !dbg !2772

if.then93:                                        ; preds = %if.end87
  br label %while.end, !dbg !2773

if.end94:                                         ; preds = %if.end87
  br label %while.body, !dbg !2775, !llvm.loop !2777

while.end:                                        ; preds = %if.then93
  %num95 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 0, !dbg !2778
  %81 = load i64, i64* %num95, align 8, !dbg !2778
  %mul96 = mul i64 %81, 1, !dbg !2779
  %call97 = call noalias i8* @malloc(i64 %mul96) #2, !dbg !2780
  store i8* %call97, i8** @_ZL17switch_membership, align 8, !dbg !2781
  %num98 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 0, !dbg !2782
  %82 = load i64, i64* %num98, align 8, !dbg !2782
  %call99 = call noalias i8* @calloc(i64 %82, i64 1) #2, !dbg !2783
  store i8* %call99, i8** @_ZL9is_center, align 8, !dbg !2784
  %num100 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 0, !dbg !2785
  %83 = load i64, i64* %num100, align 8, !dbg !2785
  %mul101 = mul i64 %83, 4, !dbg !2786
  %call102 = call noalias i8* @malloc(i64 %mul101) #2, !dbg !2787
  %84 = bitcast i8* %call102 to i32*, !dbg !2788
  store i32* %84, i32** @_ZL12center_table, align 8, !dbg !2789
  %85 = load i64, i64* %kmin.addr, align 8, !dbg !2790
  %86 = load i64, i64* %kmax.addr, align 8, !dbg !2791
  call void @_Z11localSearchP6PointsllPl(%struct.Points* %centers, i64 %85, i64 %86, i64* %kfinal), !dbg !2792
  %call103 = call i32 @_Z11contcentersP6Points(%struct.Points* %centers), !dbg !2793
  %87 = load i64*, i64** %centerIDs, align 8, !dbg !2794
  %88 = load i8*, i8** %outfile.addr, align 8, !dbg !2795
  call void @_Z12outcenterIDsP6PointsPlPc(%struct.Points* %centers, i64* %87, i8* %88), !dbg !2796
  ret void, !dbg !2797
}

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #10 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2798 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %outfilename = alloca i8*, align 8
  %infilename = alloca i8*, align 8
  %kmin = alloca i64, align 8
  %kmax = alloca i64, align 8
  %n = alloca i64, align 8
  %chunksize = alloca i64, align 8
  %clustersize = alloca i64, align 8
  %dim = alloca i32, align 4
  %stream = alloca %class.PStream*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %t1 = alloca double, align 8
  %t2 = alloca double, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !2802, metadata !671), !dbg !2803
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !2804, metadata !671), !dbg !2805
  call void @llvm.dbg.declare(metadata i8** %outfilename, metadata !2806, metadata !671), !dbg !2807
  %call = call i8* @_Znam(i64 1024) #14, !dbg !2808
  store i8* %call, i8** %outfilename, align 8, !dbg !2807
  call void @llvm.dbg.declare(metadata i8** %infilename, metadata !2809, metadata !671), !dbg !2810
  %call1 = call i8* @_Znam(i64 1024) #14, !dbg !2811
  store i8* %call1, i8** %infilename, align 8, !dbg !2810
  call void @llvm.dbg.declare(metadata i64* %kmin, metadata !2812, metadata !671), !dbg !2813
  call void @llvm.dbg.declare(metadata i64* %kmax, metadata !2814, metadata !671), !dbg !2815
  call void @llvm.dbg.declare(metadata i64* %n, metadata !2816, metadata !671), !dbg !2817
  call void @llvm.dbg.declare(metadata i64* %chunksize, metadata !2818, metadata !671), !dbg !2819
  call void @llvm.dbg.declare(metadata i64* %clustersize, metadata !2820, metadata !671), !dbg !2821
  call void @llvm.dbg.declare(metadata i32* %dim, metadata !2822, metadata !671), !dbg !2823
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.12, i32 0, i32 0)), !dbg !2824
  %call3 = call i32 @fflush(%struct._IO_FILE* null), !dbg !2825
  %0 = load i32, i32* %argc.addr, align 4, !dbg !2826
  %cmp = icmp slt i32 %0, 10, !dbg !2828
  br i1 %cmp, label %if.then, label %if.end, !dbg !2829

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2830
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !2832
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 0, !dbg !2832
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !2832
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.13, i32 0, i32 0), i8* %3), !dbg !2833
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2834
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.14, i32 0, i32 0)), !dbg !2835
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2836
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i32 0, i32 0)), !dbg !2837
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2838
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.16, i32 0, i32 0)), !dbg !2839
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2840
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.17, i32 0, i32 0)), !dbg !2841
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2842
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.18, i32 0, i32 0)), !dbg !2843
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2844
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.19, i32 0, i32 0)), !dbg !2845
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2846
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20, i32 0, i32 0)), !dbg !2847
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2848
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.21, i32 0, i32 0)), !dbg !2849
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2850
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.22, i32 0, i32 0)), !dbg !2851
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2852
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.23, i32 0, i32 0)), !dbg !2853
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2854
  %call15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.24, i32 0, i32 0)), !dbg !2855
  call void @exit(i32 1) #16, !dbg !2856
  unreachable, !dbg !2856

if.end:                                           ; preds = %entry
  %15 = load i8**, i8*** %argv.addr, align 8, !dbg !2857
  %arrayidx16 = getelementptr inbounds i8*, i8** %15, i64 1, !dbg !2857
  %16 = load i8*, i8** %arrayidx16, align 8, !dbg !2857
  %call17 = call i32 @atoi(i8* %16) #17, !dbg !2858
  %conv = sext i32 %call17 to i64, !dbg !2858
  store i64 %conv, i64* %kmin, align 8, !dbg !2859
  %17 = load i8**, i8*** %argv.addr, align 8, !dbg !2860
  %arrayidx18 = getelementptr inbounds i8*, i8** %17, i64 2, !dbg !2860
  %18 = load i8*, i8** %arrayidx18, align 8, !dbg !2860
  %call19 = call i32 @atoi(i8* %18) #17, !dbg !2861
  %conv20 = sext i32 %call19 to i64, !dbg !2861
  store i64 %conv20, i64* %kmax, align 8, !dbg !2862
  %19 = load i8**, i8*** %argv.addr, align 8, !dbg !2863
  %arrayidx21 = getelementptr inbounds i8*, i8** %19, i64 3, !dbg !2863
  %20 = load i8*, i8** %arrayidx21, align 8, !dbg !2863
  %call22 = call i32 @atoi(i8* %20) #17, !dbg !2864
  store i32 %call22, i32* %dim, align 4, !dbg !2865
  %21 = load i8**, i8*** %argv.addr, align 8, !dbg !2866
  %arrayidx23 = getelementptr inbounds i8*, i8** %21, i64 4, !dbg !2866
  %22 = load i8*, i8** %arrayidx23, align 8, !dbg !2866
  %call24 = call i32 @atoi(i8* %22) #17, !dbg !2867
  %conv25 = sext i32 %call24 to i64, !dbg !2867
  store i64 %conv25, i64* %n, align 8, !dbg !2868
  %23 = load i8**, i8*** %argv.addr, align 8, !dbg !2869
  %arrayidx26 = getelementptr inbounds i8*, i8** %23, i64 5, !dbg !2869
  %24 = load i8*, i8** %arrayidx26, align 8, !dbg !2869
  %call27 = call i32 @atoi(i8* %24) #17, !dbg !2870
  %conv28 = sext i32 %call27 to i64, !dbg !2870
  store i64 %conv28, i64* %chunksize, align 8, !dbg !2871
  %25 = load i8**, i8*** %argv.addr, align 8, !dbg !2872
  %arrayidx29 = getelementptr inbounds i8*, i8** %25, i64 6, !dbg !2872
  %26 = load i8*, i8** %arrayidx29, align 8, !dbg !2872
  %call30 = call i32 @atoi(i8* %26) #17, !dbg !2873
  %conv31 = sext i32 %call30 to i64, !dbg !2873
  store i64 %conv31, i64* %clustersize, align 8, !dbg !2874
  %27 = load i8*, i8** %infilename, align 8, !dbg !2875
  %28 = load i8**, i8*** %argv.addr, align 8, !dbg !2876
  %arrayidx32 = getelementptr inbounds i8*, i8** %28, i64 7, !dbg !2876
  %29 = load i8*, i8** %arrayidx32, align 8, !dbg !2876
  %call33 = call i8* @strcpy(i8* %27, i8* %29) #2, !dbg !2877
  %30 = load i8*, i8** %outfilename, align 8, !dbg !2878
  %31 = load i8**, i8*** %argv.addr, align 8, !dbg !2879
  %arrayidx34 = getelementptr inbounds i8*, i8** %31, i64 8, !dbg !2879
  %32 = load i8*, i8** %arrayidx34, align 8, !dbg !2879
  %call35 = call i8* @strcpy(i8* %30, i8* %32) #2, !dbg !2880
  %33 = load i8**, i8*** %argv.addr, align 8, !dbg !2881
  %arrayidx36 = getelementptr inbounds i8*, i8** %33, i64 9, !dbg !2881
  %34 = load i8*, i8** %arrayidx36, align 8, !dbg !2881
  %call37 = call i32 @atoi(i8* %34) #17, !dbg !2882
  store i32 %call37, i32* @_ZL5nproc, align 4, !dbg !2883
  call void @srand48(i64 1) #2, !dbg !2884
  call void @llvm.dbg.declare(metadata %class.PStream** %stream, metadata !2885, metadata !671), !dbg !2886
  %35 = load i64, i64* %n, align 8, !dbg !2887
  %cmp38 = icmp sgt i64 %35, 0, !dbg !2889
  br i1 %cmp38, label %if.then39, label %if.else, !dbg !2890

if.then39:                                        ; preds = %if.end
  %call40 = call i8* @_Znwm(i64 16) #14, !dbg !2891
  %36 = bitcast i8* %call40 to %class.SimStream*, !dbg !2891
  %37 = load i64, i64* %n, align 8, !dbg !2893
  invoke void @_ZN9SimStreamC2El(%class.SimStream* %36, i64 %37)
          to label %invoke.cont unwind label %lpad, !dbg !2894

invoke.cont:                                      ; preds = %if.then39
  %38 = bitcast %class.SimStream* %36 to %class.PStream*, !dbg !2895
  store %class.PStream* %38, %class.PStream** %stream, align 8, !dbg !2897
  br label %if.end44, !dbg !2898

lpad:                                             ; preds = %if.then39
  %39 = landingpad { i8*, i32 }
          cleanup, !dbg !2899
  %40 = extractvalue { i8*, i32 } %39, 0, !dbg !2899
  store i8* %40, i8** %exn.slot, align 8, !dbg !2899
  %41 = extractvalue { i8*, i32 } %39, 1, !dbg !2899
  store i32 %41, i32* %ehselector.slot, align 4, !dbg !2899
  call void @_ZdlPv(i8* %call40) #15, !dbg !2900
  br label %eh.resume, !dbg !2900

if.else:                                          ; preds = %if.end
  %call41 = call i8* @_Znwm(i64 16) #14, !dbg !2902
  %42 = bitcast i8* %call41 to %class.FileStream*, !dbg !2902
  %43 = load i8*, i8** %infilename, align 8, !dbg !2904
  invoke void @_ZN10FileStreamC2EPc(%class.FileStream* %42, i8* %43)
          to label %invoke.cont43 unwind label %lpad42, !dbg !2905

invoke.cont43:                                    ; preds = %if.else
  %44 = bitcast %class.FileStream* %42 to %class.PStream*, !dbg !2906
  store %class.PStream* %44, %class.PStream** %stream, align 8, !dbg !2908
  br label %if.end44

lpad42:                                           ; preds = %if.else
  %45 = landingpad { i8*, i32 }
          cleanup, !dbg !2909
  %46 = extractvalue { i8*, i32 } %45, 0, !dbg !2909
  store i8* %46, i8** %exn.slot, align 8, !dbg !2909
  %47 = extractvalue { i8*, i32 } %45, 1, !dbg !2909
  store i32 %47, i32* %ehselector.slot, align 4, !dbg !2909
  call void @_ZdlPv(i8* %call41) #15, !dbg !2910
  br label %eh.resume, !dbg !2910

if.end44:                                         ; preds = %invoke.cont43, %invoke.cont
  call void @llvm.dbg.declare(metadata double* %t1, metadata !2912, metadata !671), !dbg !2913
  %call45 = call double @_Z7gettimev(), !dbg !2914
  store double %call45, double* %t1, align 8, !dbg !2913
  store double 0.000000e+00, double* @serial_t, align 8, !dbg !2915
  store double 0.000000e+00, double* @cpu_to_gpu_t, align 8, !dbg !2916
  store double 0.000000e+00, double* @gpu_to_cpu_t, align 8, !dbg !2917
  store double 0.000000e+00, double* @alloc_t, align 8, !dbg !2918
  store double 0.000000e+00, double* @free_t, align 8, !dbg !2919
  store double 0.000000e+00, double* @kernel_t, align 8, !dbg !2920
  store i8 0, i8* @isCoordChanged, align 1, !dbg !2921
  %48 = load %class.PStream*, %class.PStream** %stream, align 8, !dbg !2922
  %49 = load i64, i64* %kmin, align 8, !dbg !2923
  %50 = load i64, i64* %kmax, align 8, !dbg !2924
  %51 = load i32, i32* %dim, align 4, !dbg !2925
  %52 = load i64, i64* %chunksize, align 8, !dbg !2926
  %53 = load i64, i64* %clustersize, align 8, !dbg !2927
  %54 = load i8*, i8** %outfilename, align 8, !dbg !2928
  call void @_Z13streamClusterP7PStreamllillPc(%class.PStream* %48, i64 %49, i64 %50, i32 %51, i64 %52, i64 %53, i8* %54), !dbg !2929
  call void @_Z10freeDevMemv(), !dbg !2930
  call void @_Z11freeHostMemv(), !dbg !2931
  call void @llvm.dbg.declare(metadata double* %t2, metadata !2932, metadata !671), !dbg !2933
  %call46 = call double @_Z7gettimev(), !dbg !2934
  store double %call46, double* %t2, align 8, !dbg !2933
  %55 = load double, double* %t2, align 8, !dbg !2935
  %56 = load double, double* %t1, align 8, !dbg !2936
  %sub = fsub double %55, %56, !dbg !2937
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.25, i32 0, i32 0), double %sub), !dbg !2938
  %57 = load %class.PStream*, %class.PStream** %stream, align 8, !dbg !2939
  %isnull = icmp eq %class.PStream* %57, null, !dbg !2940
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !2940

delete.notnull:                                   ; preds = %if.end44
  %58 = bitcast %class.PStream* %57 to void (%class.PStream*)***, !dbg !2941
  %vtable = load void (%class.PStream*)**, void (%class.PStream*)*** %58, align 8, !dbg !2941
  %vfn = getelementptr inbounds void (%class.PStream*)*, void (%class.PStream*)** %vtable, i64 4, !dbg !2941
  %59 = load void (%class.PStream*)*, void (%class.PStream*)** %vfn, align 8, !dbg !2941
  call void %59(%class.PStream* %57), !dbg !2941
  br label %delete.end, !dbg !2941

delete.end:                                       ; preds = %delete.notnull, %if.end44
  %60 = load double, double* @time_gain, align 8, !dbg !2943
  %call48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.26, i32 0, i32 0), double %60), !dbg !2944
  %61 = load double, double* @time_gain_dist, align 8, !dbg !2945
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.27, i32 0, i32 0), double %61), !dbg !2946
  %62 = load double, double* @time_gain_init, align 8, !dbg !2947
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.28, i32 0, i32 0), double %62), !dbg !2948
  %63 = load double, double* @time_select_feasible, align 8, !dbg !2949
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.29, i32 0, i32 0), double %63), !dbg !2950
  %64 = load double, double* @time_speedy, align 8, !dbg !2951
  %call52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.30, i32 0, i32 0), double %64), !dbg !2952
  %65 = load double, double* @time_shuffle, align 8, !dbg !2953
  %call53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31, i32 0, i32 0), double %65), !dbg !2954
  %66 = load double, double* @time_local_search, align 8, !dbg !2955
  %call54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.32, i32 0, i32 0), double %66), !dbg !2956
  %call55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0)), !dbg !2957
  %call56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.33, i32 0, i32 0)), !dbg !2958
  %67 = load double, double* @serial_t, align 8, !dbg !2959
  %div = fdiv double %67, 1.000000e+03, !dbg !2960
  %call57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.34, i32 0, i32 0), double %div), !dbg !2961
  %68 = load double, double* @cpu_to_gpu_t, align 8, !dbg !2962
  %div58 = fdiv double %68, 1.000000e+03, !dbg !2963
  %call59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.35, i32 0, i32 0), double %div58), !dbg !2964
  %69 = load double, double* @gpu_to_cpu_t, align 8, !dbg !2965
  %div60 = fdiv double %69, 1.000000e+03, !dbg !2966
  %call61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.36, i32 0, i32 0), double %div60), !dbg !2967
  %70 = load double, double* @alloc_t, align 8, !dbg !2968
  %div62 = fdiv double %70, 1.000000e+03, !dbg !2969
  %call63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.37, i32 0, i32 0), double %div62), !dbg !2970
  %71 = load double, double* @free_t, align 8, !dbg !2971
  %div64 = fdiv double %71, 1.000000e+03, !dbg !2972
  %call65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.38, i32 0, i32 0), double %div64), !dbg !2973
  %72 = load double, double* @kernel_t, align 8, !dbg !2974
  %div66 = fdiv double %72, 1.000000e+03, !dbg !2975
  %call67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.39, i32 0, i32 0), double %div66), !dbg !2976
  ret i32 0, !dbg !2977

eh.resume:                                        ; preds = %lpad42, %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !2978
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !2978
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !2978
  %lpad.val68 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !2978
  resume { i8*, i32 } %lpad.val68, !dbg !2978
}

declare i32 @printf(i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #11

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #5

; Function Attrs: nounwind
declare void @srand48(i64) #5

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #7

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9SimStreamC2El(%class.SimStream* %this, i64 %n_) unnamed_addr #4 comdat align 2 !dbg !2980 {
entry:
  %this.addr = alloca %class.SimStream*, align 8
  %n_.addr = alloca i64, align 8
  store %class.SimStream* %this, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.SimStream** %this.addr, metadata !2999, metadata !671), !dbg !3001
  store i64 %n_, i64* %n_.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n_.addr, metadata !3002, metadata !671), !dbg !3003
  %this1 = load %class.SimStream*, %class.SimStream** %this.addr, align 8
  %0 = bitcast %class.SimStream* %this1 to %class.PStream*, !dbg !3004
  call void @_ZN7PStreamC2Ev(%class.PStream* %0) #2, !dbg !3005
  %1 = bitcast %class.SimStream* %this1 to i32 (...)***, !dbg !3004
  store i32 (...)** bitcast (i8** getelementptr inbounds ([7 x i8*], [7 x i8*]* @_ZTV9SimStream, i32 0, i32 2) to i32 (...)**), i32 (...)*** %1, align 8, !dbg !3004
  %2 = load i64, i64* %n_.addr, align 8, !dbg !3006
  %n = getelementptr inbounds %class.SimStream, %class.SimStream* %this1, i32 0, i32 1, !dbg !3008
  store i64 %2, i64* %n, align 8, !dbg !3009
  ret void, !dbg !3010
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #8

; Function Attrs: uwtable
define linkonce_odr void @_ZN10FileStreamC2EPc(%class.FileStream* %this, i8* %filename) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !3011 {
entry:
  %this.addr = alloca %class.FileStream*, align 8
  %filename.addr = alloca i8*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %class.FileStream* %this, %class.FileStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.FileStream** %this.addr, metadata !3030, metadata !671), !dbg !3032
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !3033, metadata !671), !dbg !3034
  %this1 = load %class.FileStream*, %class.FileStream** %this.addr, align 8
  %0 = bitcast %class.FileStream* %this1 to %class.PStream*, !dbg !3035
  call void @_ZN7PStreamC2Ev(%class.PStream* %0) #2, !dbg !3036
  %1 = bitcast %class.FileStream* %this1 to i32 (...)***, !dbg !3035
  store i32 (...)** bitcast (i8** getelementptr inbounds ([7 x i8*], [7 x i8*]* @_ZTV10FileStream, i32 0, i32 2) to i32 (...)**), i32 (...)*** %1, align 8, !dbg !3035
  %2 = load i8*, i8** %filename.addr, align 8, !dbg !3037
  %call = invoke %struct._IO_FILE* @fopen(i8* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.40, i32 0, i32 0))
          to label %invoke.cont unwind label %lpad, !dbg !3039

invoke.cont:                                      ; preds = %entry
  %fp = getelementptr inbounds %class.FileStream, %class.FileStream* %this1, i32 0, i32 1, !dbg !3040
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !3042
  %fp2 = getelementptr inbounds %class.FileStream, %class.FileStream* %this1, i32 0, i32 1, !dbg !3043
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %fp2, align 8, !dbg !3043
  %cmp = icmp eq %struct._IO_FILE* %3, null, !dbg !3045
  br i1 %cmp, label %if.then, label %if.end, !dbg !3046

if.then:                                          ; preds = %invoke.cont
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !3047
  %5 = load i8*, i8** %filename.addr, align 8, !dbg !3049
  %call4 = invoke i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.41, i32 0, i32 0), i8* %5)
          to label %invoke.cont3 unwind label %lpad, !dbg !3050

invoke.cont3:                                     ; preds = %if.then
  call void @exit(i32 1) #16, !dbg !3051
  unreachable, !dbg !3051

lpad:                                             ; preds = %if.then, %entry
  %6 = landingpad { i8*, i32 }
          cleanup, !dbg !3052
  %7 = extractvalue { i8*, i32 } %6, 0, !dbg !3052
  store i8* %7, i8** %exn.slot, align 8, !dbg !3052
  %8 = extractvalue { i8*, i32 } %6, 1, !dbg !3052
  store i32 %8, i32* %ehselector.slot, align 4, !dbg !3052
  %9 = bitcast %class.FileStream* %this1 to %class.PStream*, !dbg !3052
  invoke void @_ZN7PStreamD2Ev(%class.PStream* %9)
          to label %invoke.cont5 unwind label %terminate.lpad, !dbg !3052

if.end:                                           ; preds = %invoke.cont
  ret void, !dbg !3053

invoke.cont5:                                     ; preds = %lpad
  br label %eh.resume, !dbg !3055

eh.resume:                                        ; preds = %invoke.cont5
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !3057
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !3057
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !3057
  %lpad.val6 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !3057
  resume { i8*, i32 } %lpad.val6, !dbg !3057

terminate.lpad:                                   ; preds = %lpad
  %10 = landingpad { i8*, i32 }
          catch i8* null, !dbg !3059
  %11 = extractvalue { i8*, i32 } %10, 0, !dbg !3059
  call void @__clang_call_terminate(i8* %11) #16, !dbg !3059
  unreachable, !dbg !3059
}

declare void @_Z10freeDevMemv() #1

declare void @_Z11freeHostMemv() #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN7PStreamC2Ev(%class.PStream* %this) unnamed_addr #12 comdat align 2 !dbg !3061 {
entry:
  %this.addr = alloca %class.PStream*, align 8
  store %class.PStream* %this, %class.PStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.PStream** %this.addr, metadata !3063, metadata !671), !dbg !3064
  %this1 = load %class.PStream*, %class.PStream** %this.addr, align 8
  %0 = bitcast %class.PStream* %this1 to i32 (...)***, !dbg !3065
  store i32 (...)** bitcast (i8** getelementptr inbounds ([7 x i8*], [7 x i8*]* @_ZTV7PStream, i32 0, i32 2) to i32 (...)**), i32 (...)*** %0, align 8, !dbg !3065
  ret void, !dbg !3065
}

; Function Attrs: nounwind uwtable
define linkonce_odr i64 @_ZN9SimStream4readEPfii(%class.SimStream* %this, float* %dest, i32 %dim, i32 %num) unnamed_addr #4 comdat align 2 !dbg !3066 {
entry:
  %this.addr = alloca %class.SimStream*, align 8
  %dest.addr = alloca float*, align 8
  %dim.addr = alloca i32, align 4
  %num.addr = alloca i32, align 4
  %count = alloca i64, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  store %class.SimStream* %this, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.SimStream** %this.addr, metadata !3067, metadata !671), !dbg !3068
  store float* %dest, float** %dest.addr, align 8
  call void @llvm.dbg.declare(metadata float** %dest.addr, metadata !3069, metadata !671), !dbg !3070
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !3071, metadata !671), !dbg !3072
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !3073, metadata !671), !dbg !3074
  %this1 = load %class.SimStream*, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %count, metadata !3075, metadata !671), !dbg !3076
  store i64 0, i64* %count, align 8, !dbg !3076
  call void @llvm.dbg.declare(metadata i32* %i, metadata !3077, metadata !671), !dbg !3079
  store i32 0, i32* %i, align 4, !dbg !3079
  br label %for.cond, !dbg !3080

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32, i32* %i, align 4, !dbg !3081
  %1 = load i32, i32* %num.addr, align 4, !dbg !3084
  %cmp = icmp slt i32 %0, %1, !dbg !3085
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !3086

land.rhs:                                         ; preds = %for.cond
  %n = getelementptr inbounds %class.SimStream, %class.SimStream* %this1, i32 0, i32 1, !dbg !3087
  %2 = load i64, i64* %n, align 8, !dbg !3087
  %cmp2 = icmp sgt i64 %2, 0, !dbg !3089
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %3 = phi i1 [ false, %for.cond ], [ %cmp2, %land.rhs ]
  br i1 %3, label %for.body, label %for.end10, !dbg !3090

for.body:                                         ; preds = %land.end
  call void @llvm.dbg.declare(metadata i32* %k, metadata !3092, metadata !671), !dbg !3095
  store i32 0, i32* %k, align 4, !dbg !3095
  br label %for.cond3, !dbg !3096

for.cond3:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %k, align 4, !dbg !3097
  %5 = load i32, i32* %dim.addr, align 4, !dbg !3100
  %cmp4 = icmp slt i32 %4, %5, !dbg !3101
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !3102

for.body5:                                        ; preds = %for.cond3
  %call = call i64 @lrand48() #2, !dbg !3103
  %conv = sitofp i64 %call to float, !dbg !3103
  %div = fdiv float %conv, 0x41E0000000000000, !dbg !3105
  %6 = load i32, i32* %i, align 4, !dbg !3106
  %7 = load i32, i32* %dim.addr, align 4, !dbg !3107
  %mul = mul nsw i32 %6, %7, !dbg !3108
  %8 = load i32, i32* %k, align 4, !dbg !3109
  %add = add nsw i32 %mul, %8, !dbg !3110
  %idxprom = sext i32 %add to i64, !dbg !3111
  %9 = load float*, float** %dest.addr, align 8, !dbg !3111
  %arrayidx = getelementptr inbounds float, float* %9, i64 %idxprom, !dbg !3111
  store float %div, float* %arrayidx, align 4, !dbg !3112
  br label %for.inc, !dbg !3113

for.inc:                                          ; preds = %for.body5
  %10 = load i32, i32* %k, align 4, !dbg !3114
  %inc = add nsw i32 %10, 1, !dbg !3114
  store i32 %inc, i32* %k, align 4, !dbg !3114
  br label %for.cond3, !dbg !3116, !llvm.loop !3117

for.end:                                          ; preds = %for.cond3
  %n6 = getelementptr inbounds %class.SimStream, %class.SimStream* %this1, i32 0, i32 1, !dbg !3119
  %11 = load i64, i64* %n6, align 8, !dbg !3120
  %dec = add nsw i64 %11, -1, !dbg !3120
  store i64 %dec, i64* %n6, align 8, !dbg !3120
  %12 = load i64, i64* %count, align 8, !dbg !3121
  %inc7 = add i64 %12, 1, !dbg !3121
  store i64 %inc7, i64* %count, align 8, !dbg !3121
  br label %for.inc8, !dbg !3122

for.inc8:                                         ; preds = %for.end
  %13 = load i32, i32* %i, align 4, !dbg !3123
  %inc9 = add nsw i32 %13, 1, !dbg !3123
  store i32 %inc9, i32* %i, align 4, !dbg !3123
  br label %for.cond, !dbg !3125, !llvm.loop !3126

for.end10:                                        ; preds = %land.end
  %14 = load i64, i64* %count, align 8, !dbg !3128
  ret i64 %14, !dbg !3129
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZN9SimStream6ferrorEv(%class.SimStream* %this) unnamed_addr #4 comdat align 2 !dbg !3130 {
entry:
  %this.addr = alloca %class.SimStream*, align 8
  store %class.SimStream* %this, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.SimStream** %this.addr, metadata !3131, metadata !671), !dbg !3132
  %this1 = load %class.SimStream*, %class.SimStream** %this.addr, align 8
  ret i32 0, !dbg !3133
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZN9SimStream4feofEv(%class.SimStream* %this) unnamed_addr #4 comdat align 2 !dbg !3134 {
entry:
  %this.addr = alloca %class.SimStream*, align 8
  store %class.SimStream* %this, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.SimStream** %this.addr, metadata !3135, metadata !671), !dbg !3136
  %this1 = load %class.SimStream*, %class.SimStream** %this.addr, align 8
  %n = getelementptr inbounds %class.SimStream, %class.SimStream* %this1, i32 0, i32 1, !dbg !3137
  %0 = load i64, i64* %n, align 8, !dbg !3137
  %cmp = icmp sle i64 %0, 0, !dbg !3138
  %conv = zext i1 %cmp to i32, !dbg !3137
  ret i32 %conv, !dbg !3139
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9SimStreamD2Ev(%class.SimStream* %this) unnamed_addr #4 comdat align 2 !dbg !3140 {
entry:
  %this.addr = alloca %class.SimStream*, align 8
  store %class.SimStream* %this, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.SimStream** %this.addr, metadata !3141, metadata !671), !dbg !3142
  %this1 = load %class.SimStream*, %class.SimStream** %this.addr, align 8
  %0 = bitcast %class.SimStream* %this1 to %class.PStream*, !dbg !3143
  call void @_ZN7PStreamD2Ev(%class.PStream* %0), !dbg !3143
  ret void, !dbg !3145
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN9SimStreamD0Ev(%class.SimStream* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !3146 {
entry:
  %this.addr = alloca %class.SimStream*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %class.SimStream* %this, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.SimStream** %this.addr, metadata !3147, metadata !671), !dbg !3148
  %this1 = load %class.SimStream*, %class.SimStream** %this.addr, align 8
  invoke void @_ZN9SimStreamD2Ev(%class.SimStream* %this1)
          to label %invoke.cont unwind label %lpad, !dbg !3149

invoke.cont:                                      ; preds = %entry
  %0 = bitcast %class.SimStream* %this1 to i8*, !dbg !3150
  call void @_ZdlPv(i8* %0) #15, !dbg !3150
  ret void, !dbg !3152

lpad:                                             ; preds = %entry
  %1 = landingpad { i8*, i32 }
          cleanup, !dbg !3153
  %2 = extractvalue { i8*, i32 } %1, 0, !dbg !3153
  store i8* %2, i8** %exn.slot, align 8, !dbg !3153
  %3 = extractvalue { i8*, i32 } %1, 1, !dbg !3153
  store i32 %3, i32* %ehselector.slot, align 4, !dbg !3153
  %4 = bitcast %class.SimStream* %this1 to i8*, !dbg !3154
  call void @_ZdlPv(i8* %4) #15, !dbg !3154
  br label %eh.resume, !dbg !3154

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !3156
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !3156
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !3156
  %lpad.val2 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !3156
  resume { i8*, i32 } %lpad.val2, !dbg !3156
}

declare void @__cxa_pure_virtual() unnamed_addr

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN7PStreamD2Ev(%class.PStream* %this) unnamed_addr #4 comdat align 2 !dbg !3158 {
entry:
  %this.addr = alloca %class.PStream*, align 8
  store %class.PStream* %this, %class.PStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.PStream** %this.addr, metadata !3159, metadata !671), !dbg !3160
  %this1 = load %class.PStream*, %class.PStream** %this.addr, align 8
  ret void, !dbg !3161
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN7PStreamD0Ev(%class.PStream* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !3162 {
entry:
  %this.addr = alloca %class.PStream*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %class.PStream* %this, %class.PStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.PStream** %this.addr, metadata !3163, metadata !671), !dbg !3164
  %this1 = load %class.PStream*, %class.PStream** %this.addr, align 8
  invoke void @_ZN7PStreamD2Ev(%class.PStream* %this1)
          to label %invoke.cont unwind label %lpad, !dbg !3165

invoke.cont:                                      ; preds = %entry
  %0 = bitcast %class.PStream* %this1 to i8*, !dbg !3166
  call void @_ZdlPv(i8* %0) #15, !dbg !3166
  ret void, !dbg !3168

lpad:                                             ; preds = %entry
  %1 = landingpad { i8*, i32 }
          cleanup, !dbg !3169
  %2 = extractvalue { i8*, i32 } %1, 0, !dbg !3169
  store i8* %2, i8** %exn.slot, align 8, !dbg !3169
  %3 = extractvalue { i8*, i32 } %1, 1, !dbg !3169
  store i32 %3, i32* %ehselector.slot, align 4, !dbg !3169
  %4 = bitcast %class.PStream* %this1 to i8*, !dbg !3170
  call void @_ZdlPv(i8* %4) #15, !dbg !3170
  br label %eh.resume, !dbg !3170

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !3172
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !3172
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !3172
  %lpad.val2 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !3172
  resume { i8*, i32 } %lpad.val2, !dbg !3172
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #13 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #2
  call void @_ZSt9terminatev() #16
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: uwtable
define linkonce_odr i64 @_ZN10FileStream4readEPfii(%class.FileStream* %this, float* %dest, i32 %dim, i32 %num) unnamed_addr #0 comdat align 2 !dbg !3174 {
entry:
  %this.addr = alloca %class.FileStream*, align 8
  %dest.addr = alloca float*, align 8
  %dim.addr = alloca i32, align 4
  %num.addr = alloca i32, align 4
  store %class.FileStream* %this, %class.FileStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.FileStream** %this.addr, metadata !3175, metadata !671), !dbg !3176
  store float* %dest, float** %dest.addr, align 8
  call void @llvm.dbg.declare(metadata float** %dest.addr, metadata !3177, metadata !671), !dbg !3178
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !3179, metadata !671), !dbg !3180
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !3181, metadata !671), !dbg !3182
  %this1 = load %class.FileStream*, %class.FileStream** %this.addr, align 8
  %0 = load float*, float** %dest.addr, align 8, !dbg !3183
  %1 = bitcast float* %0 to i8*, !dbg !3183
  %2 = load i32, i32* %dim.addr, align 4, !dbg !3184
  %conv = sext i32 %2 to i64, !dbg !3184
  %mul = mul i64 4, %conv, !dbg !3185
  %3 = load i32, i32* %num.addr, align 4, !dbg !3186
  %conv2 = sext i32 %3 to i64, !dbg !3186
  %fp = getelementptr inbounds %class.FileStream, %class.FileStream* %this1, i32 0, i32 1, !dbg !3187
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !3187
  %call = call i64 @fread(i8* %1, i64 %mul, i64 %conv2, %struct._IO_FILE* %4), !dbg !3188
  ret i64 %call, !dbg !3189
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZN10FileStream6ferrorEv(%class.FileStream* %this) unnamed_addr #4 comdat align 2 !dbg !3190 {
entry:
  %this.addr = alloca %class.FileStream*, align 8
  store %class.FileStream* %this, %class.FileStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.FileStream** %this.addr, metadata !3191, metadata !671), !dbg !3192
  %this1 = load %class.FileStream*, %class.FileStream** %this.addr, align 8
  %fp = getelementptr inbounds %class.FileStream, %class.FileStream* %this1, i32 0, i32 1, !dbg !3193
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !3193
  %call = call i32 @ferror(%struct._IO_FILE* %0) #2, !dbg !3194
  ret i32 %call, !dbg !3195
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZN10FileStream4feofEv(%class.FileStream* %this) unnamed_addr #4 comdat align 2 !dbg !3196 {
entry:
  %this.addr = alloca %class.FileStream*, align 8
  store %class.FileStream* %this, %class.FileStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.FileStream** %this.addr, metadata !3197, metadata !671), !dbg !3198
  %this1 = load %class.FileStream*, %class.FileStream** %this.addr, align 8
  %fp = getelementptr inbounds %class.FileStream, %class.FileStream* %this1, i32 0, i32 1, !dbg !3199
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !3199
  %call = call i32 @feof(%struct._IO_FILE* %0) #2, !dbg !3200
  ret i32 %call, !dbg !3201
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN10FileStreamD2Ev(%class.FileStream* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !3202 {
entry:
  %this.addr = alloca %class.FileStream*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %class.FileStream* %this, %class.FileStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.FileStream** %this.addr, metadata !3203, metadata !671), !dbg !3204
  %this1 = load %class.FileStream*, %class.FileStream** %this.addr, align 8
  %0 = bitcast %class.FileStream* %this1 to i32 (...)***, !dbg !3205
  store i32 (...)** bitcast (i8** getelementptr inbounds ([7 x i8*], [7 x i8*]* @_ZTV10FileStream, i32 0, i32 2) to i32 (...)**), i32 (...)*** %0, align 8, !dbg !3205
  %call = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.42, i32 0, i32 0))
          to label %invoke.cont unwind label %lpad, !dbg !3206

invoke.cont:                                      ; preds = %entry
  %fp = getelementptr inbounds %class.FileStream, %class.FileStream* %this1, i32 0, i32 1, !dbg !3208
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !3208
  %call3 = invoke i32 @fclose(%struct._IO_FILE* %1)
          to label %invoke.cont2 unwind label %lpad, !dbg !3209

invoke.cont2:                                     ; preds = %invoke.cont
  %2 = bitcast %class.FileStream* %this1 to %class.PStream*, !dbg !3210
  call void @_ZN7PStreamD2Ev(%class.PStream* %2), !dbg !3210
  ret void, !dbg !3211

lpad:                                             ; preds = %invoke.cont, %entry
  %3 = landingpad { i8*, i32 }
          cleanup, !dbg !3212
  %4 = extractvalue { i8*, i32 } %3, 0, !dbg !3212
  store i8* %4, i8** %exn.slot, align 8, !dbg !3212
  %5 = extractvalue { i8*, i32 } %3, 1, !dbg !3212
  store i32 %5, i32* %ehselector.slot, align 4, !dbg !3212
  %6 = bitcast %class.FileStream* %this1 to %class.PStream*, !dbg !3212
  invoke void @_ZN7PStreamD2Ev(%class.PStream* %6)
          to label %invoke.cont4 unwind label %terminate.lpad, !dbg !3212

invoke.cont4:                                     ; preds = %lpad
  br label %eh.resume, !dbg !3214

eh.resume:                                        ; preds = %invoke.cont4
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !3216
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !3216
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !3216
  %lpad.val5 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !3216
  resume { i8*, i32 } %lpad.val5, !dbg !3216

terminate.lpad:                                   ; preds = %lpad
  %7 = landingpad { i8*, i32 }
          catch i8* null, !dbg !3218
  %8 = extractvalue { i8*, i32 } %7, 0, !dbg !3218
  call void @__clang_call_terminate(i8* %8) #16, !dbg !3218
  unreachable, !dbg !3218
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN10FileStreamD0Ev(%class.FileStream* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !3220 {
entry:
  %this.addr = alloca %class.FileStream*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %class.FileStream* %this, %class.FileStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.FileStream** %this.addr, metadata !3221, metadata !671), !dbg !3222
  %this1 = load %class.FileStream*, %class.FileStream** %this.addr, align 8
  invoke void @_ZN10FileStreamD2Ev(%class.FileStream* %this1)
          to label %invoke.cont unwind label %lpad, !dbg !3223

invoke.cont:                                      ; preds = %entry
  %0 = bitcast %class.FileStream* %this1 to i8*, !dbg !3224
  call void @_ZdlPv(i8* %0) #15, !dbg !3224
  ret void, !dbg !3226

lpad:                                             ; preds = %entry
  %1 = landingpad { i8*, i32 }
          cleanup, !dbg !3227
  %2 = extractvalue { i8*, i32 } %1, 0, !dbg !3227
  store i8* %2, i8** %exn.slot, align 8, !dbg !3227
  %3 = extractvalue { i8*, i32 } %1, 1, !dbg !3227
  store i32 %3, i32* %ehselector.slot, align 4, !dbg !3227
  %4 = bitcast %class.FileStream* %this1 to i8*, !dbg !3228
  call void @_ZdlPv(i8* %4) #15, !dbg !3228
  br label %eh.resume, !dbg !3228

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !3230
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !3230
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !3230
  %lpad.val2 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !3230
  resume { i8*, i32 } %lpad.val2, !dbg !3230
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #5

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE*) #5

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_streamcluster_cuda_cpu.cpp() #0 section ".text.startup" !dbg !3232 {
entry:
  call void @__cxx_global_var_init(), !dbg !3234
  ret void
}

attributes #0 = { uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nobuiltin "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { norecurse uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { noinline noreturn nounwind }
attributes #14 = { builtin }
attributes #15 = { builtin nounwind }
attributes #16 = { noreturn nounwind }
attributes #17 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!658, !659}
!llvm.ident = !{!660}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 0c0654cbe42ce8060cf9bfeea18254aa37aceca3) (http://llvm.org/git/llvm.git 008f70d21cc2b33cebd1d4443052e62d3fbea6e8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !49, imports: !100)
!1 = !DIFile(filename: "streamcluster_cuda_cpu.cpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!2 = !{}
!3 = !{!4, !5, !6, !7, !8, !9, !11, !34, !23, !48}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!6 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!8 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, align: 64)
!10 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pkmedian_arg_t", file: !13, line: 53, size: 384, align: 64, elements: !14, identifier: "_ZTS14pkmedian_arg_t")
!13 = !DIFile(filename: "./streamcluster_header.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!14 = !{!15, !31, !32, !33, !35, !36}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "points", scope: !12, file: !13, line: 55, baseType: !16, size: 64, align: 64)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64, align: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "Points", file: !13, line: 51, baseType: !18)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !13, line: 47, size: 192, align: 64, elements: !19, identifier: "_ZTS6Points")
!19 = !{!20, !21, !22}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !18, file: !13, line: 48, baseType: !8, size: 64, align: 64)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "dim", scope: !18, file: !13, line: 49, baseType: !6, size: 32, align: 32, offset: 64)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !18, file: !13, line: 50, baseType: !23, size: 64, align: 64, offset: 128)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64, align: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "Point", file: !13, line: 44, baseType: !25)
!25 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !13, line: 39, size: 256, align: 64, elements: !26, identifier: "_ZTS5Point")
!26 = !{!27, !28, !29, !30}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "weight", scope: !25, file: !13, line: 40, baseType: !5, size: 32, align: 32)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "coord", scope: !25, file: !13, line: 41, baseType: !4, size: 64, align: 64, offset: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "assign", scope: !25, file: !13, line: 42, baseType: !8, size: 64, align: 64, offset: 128)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "cost", scope: !25, file: !13, line: 43, baseType: !5, size: 32, align: 32, offset: 192)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "kmin", scope: !12, file: !13, line: 56, baseType: !8, size: 64, align: 64, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "kmax", scope: !12, file: !13, line: 57, baseType: !8, size: 64, align: 64, offset: 128)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "kfinal", scope: !12, file: !13, line: 58, baseType: !34, size: 64, align: 64, offset: 192)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64, align: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "pid", scope: !12, file: !13, line: 59, baseType: !6, size: 32, align: 32, offset: 256)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "barrier", scope: !12, file: !13, line: 60, baseType: !37, size: 64, align: 64, offset: 320)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64, align: 64)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_barrier_t", file: !39, line: 243, baseType: !40)
!39 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!40 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !39, line: 239, size: 256, align: 64, elements: !41, identifier: "_ZTS17pthread_barrier_t")
!41 = !{!42, !47}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !40, file: !39, line: 241, baseType: !43, size: 256, align: 8)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 256, align: 8, elements: !45)
!44 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!45 = !{!46}
!46 = !DISubrange(count: 32)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !40, file: !39, line: 242, baseType: !8, size: 64, align: 64)
!48 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!49 = !{!50, !67, !68, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !86, !87, !88, !89, !93, !94, !95, !96, !97, !98, !99}
!50 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !51, file: !53, line: 74, type: !54, isLocal: true, isDefinition: true, variable: %"class.std::ios_base::Init"* @_ZStL8__ioinit)
!51 = !DINamespace(name: "std", scope: null, file: !52, line: 194)
!52 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!53 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/iostream", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!54 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !56, file: !55, line: 601, size: 8, align: 8, elements: !57, identifier: "_ZTSNSt8ios_base4InitE")
!55 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/ios_base.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!56 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !51, file: !55, line: 228, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt8ios_base")
!57 = !{!58, !61, !62, !66}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_S_refcount", scope: !54, file: !55, line: 609, baseType: !59, flags: DIFlagStaticMember)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Atomic_word", file: !60, line: 32, baseType: !6)
!60 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/atomic_word.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_S_synced_with_stdio", scope: !54, file: !55, line: 610, baseType: !10, flags: DIFlagStaticMember)
!62 = !DISubprogram(name: "Init", scope: !54, file: !55, line: 605, type: !63, isLocal: false, isDefinition: false, scopeLine: 605, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!63 = !DISubroutineType(types: !64)
!64 = !{null, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!66 = !DISubprogram(name: "~Init", scope: !54, file: !55, line: 606, type: !63, isLocal: false, isDefinition: false, scopeLine: 606, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!67 = distinct !DIGlobalVariable(name: "isCoordChanged", scope: !0, file: !1, line: 35, type: !10, isLocal: false, isDefinition: true, variable: i8* @isCoordChanged)
!68 = distinct !DIGlobalVariable(name: "serial_t", scope: !0, file: !1, line: 38, type: !69, isLocal: false, isDefinition: true, variable: double* @serial_t)
!69 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!70 = distinct !DIGlobalVariable(name: "cpu_to_gpu_t", scope: !0, file: !1, line: 39, type: !69, isLocal: false, isDefinition: true, variable: double* @cpu_to_gpu_t)
!71 = distinct !DIGlobalVariable(name: "gpu_to_cpu_t", scope: !0, file: !1, line: 40, type: !69, isLocal: false, isDefinition: true, variable: double* @gpu_to_cpu_t)
!72 = distinct !DIGlobalVariable(name: "alloc_t", scope: !0, file: !1, line: 41, type: !69, isLocal: false, isDefinition: true, variable: double* @alloc_t)
!73 = distinct !DIGlobalVariable(name: "kernel_t", scope: !0, file: !1, line: 42, type: !69, isLocal: false, isDefinition: true, variable: double* @kernel_t)
!74 = distinct !DIGlobalVariable(name: "free_t", scope: !0, file: !1, line: 43, type: !69, isLocal: false, isDefinition: true, variable: double* @free_t)
!75 = distinct !DIGlobalVariable(name: "time_local_search", scope: !0, file: !1, line: 47, type: !69, isLocal: false, isDefinition: true, variable: double* @time_local_search)
!76 = distinct !DIGlobalVariable(name: "time_speedy", scope: !0, file: !1, line: 48, type: !69, isLocal: false, isDefinition: true, variable: double* @time_speedy)
!77 = distinct !DIGlobalVariable(name: "time_select_feasible", scope: !0, file: !1, line: 49, type: !69, isLocal: false, isDefinition: true, variable: double* @time_select_feasible)
!78 = distinct !DIGlobalVariable(name: "time_gain", scope: !0, file: !1, line: 50, type: !69, isLocal: false, isDefinition: true, variable: double* @time_gain)
!79 = distinct !DIGlobalVariable(name: "time_shuffle", scope: !0, file: !1, line: 51, type: !69, isLocal: false, isDefinition: true, variable: double* @time_shuffle)
!80 = distinct !DIGlobalVariable(name: "time_gain_dist", scope: !0, file: !1, line: 52, type: !69, isLocal: false, isDefinition: true, variable: double* @time_gain_dist)
!81 = distinct !DIGlobalVariable(name: "time_gain_init", scope: !0, file: !1, line: 53, type: !69, isLocal: false, isDefinition: true, variable: double* @time_gain_init)
!82 = distinct !DIGlobalVariable(name: "totalcost", scope: !83, file: !1, line: 175, type: !5, isLocal: true, isDefinition: true, variable: float* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE9totalcost)
!83 = distinct !DISubprogram(name: "pspeedy", linkageName: "_Z7pspeedyP6PointsfPliP17pthread_barrier_t", scope: !1, file: !1, line: 160, type: !84, isLocal: false, isDefinition: true, scopeLine: 161, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!5, !16, !5, !34, !6, !37}
!86 = distinct !DIGlobalVariable(name: "open", scope: !83, file: !1, line: 177, type: !10, isLocal: true, isDefinition: true, variable: i8* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE4open)
!87 = distinct !DIGlobalVariable(name: "costs", scope: !83, file: !1, line: 178, type: !4, isLocal: true, isDefinition: true, variable: float** @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE5costs)
!88 = distinct !DIGlobalVariable(name: "i", scope: !83, file: !1, line: 179, type: !6, isLocal: true, isDefinition: true, variable: i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i)
!89 = distinct !DIGlobalVariable(name: "k", scope: !90, file: !1, line: 448, type: !8, isLocal: true, isDefinition: true, variable: i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k)
!90 = distinct !DISubprogram(name: "pkmedian", linkageName: "_Z8pkmedianP6PointsllPliP17pthread_barrier_t", scope: !1, file: !1, line: 440, type: !91, isLocal: false, isDefinition: true, scopeLine: 442, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!5, !16, !8, !8, !34, !6, !37}
!93 = distinct !DIGlobalVariable(name: "feasible", scope: !90, file: !1, line: 449, type: !7, isLocal: true, isDefinition: true, variable: i32** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE8feasible)
!94 = distinct !DIGlobalVariable(name: "numfeasible", scope: !90, file: !1, line: 450, type: !6, isLocal: true, isDefinition: true, variable: i32* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE11numfeasible)
!95 = distinct !DIGlobalVariable(name: "hizs", scope: !90, file: !1, line: 451, type: !4, isLocal: true, isDefinition: true, variable: float** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs)
!96 = distinct !DIGlobalVariable(name: "nproc", linkageName: "_ZL5nproc", scope: !0, file: !1, line: 34, type: !6, isLocal: true, isDefinition: true, variable: i32* @_ZL5nproc)
!97 = distinct !DIGlobalVariable(name: "is_center", linkageName: "_ZL9is_center", scope: !0, file: !1, line: 32, type: !9, isLocal: true, isDefinition: true, variable: i8** @_ZL9is_center)
!98 = distinct !DIGlobalVariable(name: "center_table", linkageName: "_ZL12center_table", scope: !0, file: !1, line: 33, type: !7, isLocal: true, isDefinition: true, variable: i32** @_ZL12center_table)
!99 = distinct !DIGlobalVariable(name: "switch_membership", linkageName: "_ZL17switch_membership", scope: !0, file: !1, line: 31, type: !9, isLocal: true, isDefinition: true, variable: i8** @_ZL17switch_membership)
!100 = !{!101, !116, !119, !123, !132, !140, !144, !151, !155, !159, !161, !163, !167, !178, !182, !188, !194, !196, !200, !204, !208, !212, !224, !226, !230, !234, !238, !240, !246, !250, !254, !256, !258, !262, !270, !274, !278, !282, !284, !290, !292, !298, !302, !306, !310, !314, !318, !322, !324, !326, !330, !334, !338, !340, !344, !348, !350, !352, !356, !362, !367, !372, !373, !374, !375, !379, !382, !386, !391, !396, !398, !400, !402, !404, !406, !408, !410, !412, !414, !416, !418, !420, !422, !424, !431, !433, !434, !436, !438, !440, !442, !446, !448, !450, !452, !454, !456, !458, !460, !462, !466, !470, !472, !476, !480, !482, !487, !492, !496, !498, !500, !502, !504, !511, !515, !519, !523, !527, !531, !536, !540, !542, !546, !552, !556, !563, !565, !569, !573, !577, !581, !583, !585, !589, !591, !595, !597, !599, !603, !607, !611, !615, !619, !621, !623, !627, !631, !635, !639, !641, !643, !647, !651, !652, !653, !654, !655, !656, !657}
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !102, line: 64)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !103, line: 106, baseType: !104)
!103 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !103, line: 94, baseType: !105)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !103, line: 82, size: 64, align: 32, elements: !106, identifier: "_ZTS11__mbstate_t")
!106 = !{!107, !108}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !105, file: !103, line: 84, baseType: !6, size: 32, align: 32)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !105, file: !103, line: 93, baseType: !109, size: 32, align: 32, offset: 32)
!109 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !105, file: !103, line: 85, size: 32, align: 32, elements: !110, identifier: "_ZTSN11__mbstate_tUt_E")
!110 = !{!111, !112}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !109, file: !103, line: 88, baseType: !48, size: 32, align: 32)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !109, file: !103, line: 92, baseType: !113, size: 32, align: 8)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 32, align: 8, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: 4)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !117, line: 139)
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !118, line: 132, baseType: !48)
!118 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !120, line: 141)
!120 = !DISubprogram(name: "btowc", scope: !103, file: !103, line: 356, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!121 = !DISubroutineType(types: !122)
!122 = !{!117, !6}
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !124, line: 142)
!124 = !DISubprogram(name: "fgetwc", scope: !103, file: !103, line: 748, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!125 = !DISubroutineType(types: !126)
!126 = !{!117, !127}
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !128, size: 64, align: 64)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !129, line: 64, baseType: !130)
!129 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!130 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !131, line: 241, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!131 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !133, line: 143)
!133 = !DISubprogram(name: "fgetws", scope: !103, file: !103, line: 777, type: !134, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DISubroutineType(types: !135)
!135 = !{!136, !138, !6, !139}
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64, align: 64)
!137 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!138 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !136)
!139 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !127)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !141, line: 144)
!141 = !DISubprogram(name: "fputwc", scope: !103, file: !103, line: 762, type: !142, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DISubroutineType(types: !143)
!143 = !{!117, !137, !127}
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !145, line: 145)
!145 = !DISubprogram(name: "fputws", scope: !103, file: !103, line: 784, type: !146, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!146 = !DISubroutineType(types: !147)
!147 = !{!6, !148, !139}
!148 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !149)
!149 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 64, align: 64)
!150 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !137)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !152, line: 146)
!152 = !DISubprogram(name: "fwide", scope: !103, file: !103, line: 590, type: !153, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{!6, !127, !6}
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !156, line: 147)
!156 = !DISubprogram(name: "fwprintf", scope: !103, file: !103, line: 597, type: !157, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DISubroutineType(types: !158)
!158 = !{!6, !139, !148, null}
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !160, line: 148)
!160 = !DISubprogram(name: "fwscanf", scope: !103, file: !103, line: 638, type: !157, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !162, line: 149)
!162 = !DISubprogram(name: "getwc", scope: !103, file: !103, line: 749, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !164, line: 150)
!164 = !DISubprogram(name: "getwchar", scope: !103, file: !103, line: 755, type: !165, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DISubroutineType(types: !166)
!166 = !{!117}
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !168, line: 151)
!168 = !DISubprogram(name: "mbrlen", scope: !103, file: !103, line: 379, type: !169, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DISubroutineType(types: !170)
!170 = !{!171, !173, !171, !176}
!171 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !118, line: 62, baseType: !172)
!172 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!173 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !174)
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64, align: 64)
!175 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !44)
!176 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !177)
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64, align: 64)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !179, line: 152)
!179 = !DISubprogram(name: "mbrtowc", scope: !103, file: !103, line: 368, type: !180, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DISubroutineType(types: !181)
!181 = !{!171, !138, !173, !171, !176}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !183, line: 153)
!183 = !DISubprogram(name: "mbsinit", scope: !103, file: !103, line: 364, type: !184, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DISubroutineType(types: !185)
!185 = !{!6, !186}
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64, align: 64)
!187 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !102)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !189, line: 154)
!189 = !DISubprogram(name: "mbsrtowcs", scope: !103, file: !103, line: 411, type: !190, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DISubroutineType(types: !191)
!191 = !{!171, !138, !192, !171, !176}
!192 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !193)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64, align: 64)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !195, line: 155)
!195 = !DISubprogram(name: "putwc", scope: !103, file: !103, line: 763, type: !142, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !197, line: 156)
!197 = !DISubprogram(name: "putwchar", scope: !103, file: !103, line: 769, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DISubroutineType(types: !199)
!199 = !{!117, !137}
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !201, line: 158)
!201 = !DISubprogram(name: "swprintf", scope: !103, file: !103, line: 607, type: !202, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DISubroutineType(types: !203)
!203 = !{!6, !138, !171, !148, null}
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !205, line: 160)
!205 = !DISubprogram(name: "swscanf", scope: !103, file: !103, line: 648, type: !206, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DISubroutineType(types: !207)
!207 = !{!6, !148, !148, null}
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !209, line: 161)
!209 = !DISubprogram(name: "ungetwc", scope: !103, file: !103, line: 792, type: !210, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DISubroutineType(types: !211)
!211 = !{!117, !117, !127}
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !213, line: 162)
!213 = !DISubprogram(name: "vfwprintf", scope: !103, file: !103, line: 615, type: !214, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DISubroutineType(types: !215)
!215 = !{!6, !139, !148, !216}
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64, align: 64)
!217 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !1, size: 192, align: 64, elements: !218, identifier: "_ZTS13__va_list_tag")
!218 = !{!219, !220, !221, !223}
!219 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !217, file: !1, baseType: !48, size: 32, align: 32)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !217, file: !1, baseType: !48, size: 32, align: 32, offset: 32)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !217, file: !1, baseType: !222, size: 64, align: 64, offset: 64)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!223 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !217, file: !1, baseType: !222, size: 64, align: 64, offset: 128)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !225, line: 164)
!225 = !DISubprogram(name: "vfwscanf", scope: !103, file: !103, line: 692, type: !214, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !227, line: 167)
!227 = !DISubprogram(name: "vswprintf", scope: !103, file: !103, line: 628, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DISubroutineType(types: !229)
!229 = !{!6, !138, !171, !148, !216}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !231, line: 170)
!231 = !DISubprogram(name: "vswscanf", scope: !103, file: !103, line: 704, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DISubroutineType(types: !233)
!233 = !{!6, !148, !148, !216}
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !235, line: 172)
!235 = !DISubprogram(name: "vwprintf", scope: !103, file: !103, line: 623, type: !236, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DISubroutineType(types: !237)
!237 = !{!6, !148, !216}
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !239, line: 174)
!239 = !DISubprogram(name: "vwscanf", scope: !103, file: !103, line: 700, type: !236, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !241, line: 176)
!241 = !DISubprogram(name: "wcrtomb", scope: !103, file: !103, line: 373, type: !242, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DISubroutineType(types: !243)
!243 = !{!171, !244, !137, !176}
!244 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !245)
!245 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, align: 64)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !247, line: 177)
!247 = !DISubprogram(name: "wcscat", scope: !103, file: !103, line: 157, type: !248, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DISubroutineType(types: !249)
!249 = !{!136, !138, !148}
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !251, line: 178)
!251 = !DISubprogram(name: "wcscmp", scope: !103, file: !103, line: 166, type: !252, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DISubroutineType(types: !253)
!253 = !{!6, !149, !149}
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !255, line: 179)
!255 = !DISubprogram(name: "wcscoll", scope: !103, file: !103, line: 195, type: !252, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !257, line: 180)
!257 = !DISubprogram(name: "wcscpy", scope: !103, file: !103, line: 147, type: !248, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !259, line: 181)
!259 = !DISubprogram(name: "wcscspn", scope: !103, file: !103, line: 255, type: !260, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DISubroutineType(types: !261)
!261 = !{!171, !149, !149}
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !263, line: 182)
!263 = !DISubprogram(name: "wcsftime", scope: !103, file: !103, line: 858, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DISubroutineType(types: !265)
!265 = !{!171, !138, !171, !148, !266}
!266 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !267)
!267 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !268, size: 64, align: 64)
!268 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !269)
!269 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !103, line: 137, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !271, line: 183)
!271 = !DISubprogram(name: "wcslen", scope: !103, file: !103, line: 290, type: !272, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!272 = !DISubroutineType(types: !273)
!273 = !{!171, !149}
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !275, line: 184)
!275 = !DISubprogram(name: "wcsncat", scope: !103, file: !103, line: 161, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!276 = !DISubroutineType(types: !277)
!277 = !{!136, !138, !148, !171}
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !279, line: 185)
!279 = !DISubprogram(name: "wcsncmp", scope: !103, file: !103, line: 169, type: !280, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!280 = !DISubroutineType(types: !281)
!281 = !{!6, !149, !149, !171}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !283, line: 186)
!283 = !DISubprogram(name: "wcsncpy", scope: !103, file: !103, line: 152, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !285, line: 187)
!285 = !DISubprogram(name: "wcsrtombs", scope: !103, file: !103, line: 417, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{!171, !244, !288, !171, !176}
!288 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !289)
!289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !149, size: 64, align: 64)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !291, line: 188)
!291 = !DISubprogram(name: "wcsspn", scope: !103, file: !103, line: 259, type: !260, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !293, line: 189)
!293 = !DISubprogram(name: "wcstod", scope: !103, file: !103, line: 453, type: !294, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DISubroutineType(types: !295)
!295 = !{!69, !148, !296}
!296 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !297)
!297 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64, align: 64)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !299, line: 191)
!299 = !DISubprogram(name: "wcstof", scope: !103, file: !103, line: 460, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DISubroutineType(types: !301)
!301 = !{!5, !148, !296}
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !303, line: 193)
!303 = !DISubprogram(name: "wcstok", scope: !103, file: !103, line: 285, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DISubroutineType(types: !305)
!305 = !{!136, !138, !148, !296}
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !307, line: 194)
!307 = !DISubprogram(name: "wcstol", scope: !103, file: !103, line: 471, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{!8, !148, !296, !6}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !311, line: 195)
!311 = !DISubprogram(name: "wcstoul", scope: !103, file: !103, line: 476, type: !312, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DISubroutineType(types: !313)
!313 = !{!172, !148, !296, !6}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !315, line: 196)
!315 = !DISubprogram(name: "wcsxfrm", scope: !103, file: !103, line: 199, type: !316, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DISubroutineType(types: !317)
!317 = !{!171, !138, !148, !171}
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !319, line: 197)
!319 = !DISubprogram(name: "wctob", scope: !103, file: !103, line: 360, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!320 = !DISubroutineType(types: !321)
!321 = !{!6, !117}
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !323, line: 198)
!323 = !DISubprogram(name: "wmemcmp", scope: !103, file: !103, line: 328, type: !280, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !325, line: 199)
!325 = !DISubprogram(name: "wmemcpy", scope: !103, file: !103, line: 332, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !327, line: 200)
!327 = !DISubprogram(name: "wmemmove", scope: !103, file: !103, line: 337, type: !328, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!328 = !DISubroutineType(types: !329)
!329 = !{!136, !136, !149, !171}
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !331, line: 201)
!331 = !DISubprogram(name: "wmemset", scope: !103, file: !103, line: 341, type: !332, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!332 = !DISubroutineType(types: !333)
!333 = !{!136, !136, !137, !171}
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !335, line: 202)
!335 = !DISubprogram(name: "wprintf", scope: !103, file: !103, line: 604, type: !336, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DISubroutineType(types: !337)
!337 = !{!6, !148, null}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !339, line: 203)
!339 = !DISubprogram(name: "wscanf", scope: !103, file: !103, line: 645, type: !336, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !341, line: 204)
!341 = !DISubprogram(name: "wcschr", scope: !103, file: !103, line: 230, type: !342, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DISubroutineType(types: !343)
!343 = !{!136, !149, !137}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !345, line: 205)
!345 = !DISubprogram(name: "wcspbrk", scope: !103, file: !103, line: 269, type: !346, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!346 = !DISubroutineType(types: !347)
!347 = !{!136, !149, !149}
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !349, line: 206)
!349 = !DISubprogram(name: "wcsrchr", scope: !103, file: !103, line: 240, type: !342, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !351, line: 207)
!351 = !DISubprogram(name: "wcsstr", scope: !103, file: !103, line: 280, type: !346, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !353, line: 208)
!353 = !DISubprogram(name: "wmemchr", scope: !103, file: !103, line: 323, type: !354, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DISubroutineType(types: !355)
!355 = !{!136, !149, !137, !171}
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !358, line: 248)
!357 = !DINamespace(name: "__gnu_cxx", scope: null, file: !52, line: 220)
!358 = !DISubprogram(name: "wcstold", scope: !103, file: !103, line: 462, type: !359, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!359 = !DISubroutineType(types: !360)
!360 = !{!361, !148, !296}
!361 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !363, line: 257)
!363 = !DISubprogram(name: "wcstoll", scope: !103, file: !103, line: 486, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{!366, !148, !296, !6}
!366 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !368, line: 258)
!368 = !DISubprogram(name: "wcstoull", scope: !103, file: !103, line: 493, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{!371, !148, !296, !6}
!371 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !358, line: 264)
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !363, line: 265)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !368, line: 266)
!375 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !376, entity: !378, line: 56)
!376 = !DINamespace(name: "__gnu_debug", scope: null, file: !377, line: 54)
!377 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/debug/debug.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!378 = !DINamespace(name: "__debug", scope: !51, file: !377, line: 48)
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !380, line: 53)
!380 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !381, line: 53, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!381 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !383, line: 54)
!383 = !DISubprogram(name: "setlocale", scope: !381, file: !381, line: 124, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{!245, !6, !174}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !387, line: 55)
!387 = !DISubprogram(name: "localeconv", scope: !381, file: !381, line: 127, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{!390}
!390 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !380, size: 64, align: 64)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !392, line: 64)
!392 = !DISubprogram(name: "isalnum", scope: !393, file: !393, line: 110, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!393 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!394 = !DISubroutineType(types: !395)
!395 = !{!6, !6}
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !397, line: 65)
!397 = !DISubprogram(name: "isalpha", scope: !393, file: !393, line: 111, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !399, line: 66)
!399 = !DISubprogram(name: "iscntrl", scope: !393, file: !393, line: 112, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !401, line: 67)
!401 = !DISubprogram(name: "isdigit", scope: !393, file: !393, line: 113, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !403, line: 68)
!403 = !DISubprogram(name: "isgraph", scope: !393, file: !393, line: 115, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !405, line: 69)
!405 = !DISubprogram(name: "islower", scope: !393, file: !393, line: 114, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !407, line: 70)
!407 = !DISubprogram(name: "isprint", scope: !393, file: !393, line: 116, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !409, line: 71)
!409 = !DISubprogram(name: "ispunct", scope: !393, file: !393, line: 117, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !411, line: 72)
!411 = !DISubprogram(name: "isspace", scope: !393, file: !393, line: 118, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !413, line: 73)
!413 = !DISubprogram(name: "isupper", scope: !393, file: !393, line: 119, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !415, line: 74)
!415 = !DISubprogram(name: "isxdigit", scope: !393, file: !393, line: 120, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !417, line: 75)
!417 = !DISubprogram(name: "tolower", scope: !393, file: !393, line: 124, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !419, line: 76)
!419 = !DISubprogram(name: "toupper", scope: !393, file: !393, line: 127, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !421, line: 44)
!421 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !51, file: !52, line: 196, baseType: !172)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !423, line: 45)
!423 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !51, file: !52, line: 197, baseType: !8)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !425, line: 82)
!425 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !426, line: 186, baseType: !427)
!426 = !DIFile(filename: "/usr/include/wctype.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!427 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !428, size: 64, align: 64)
!428 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !429)
!429 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !430, line: 40, baseType: !6)
!430 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !432, line: 83)
!432 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !426, line: 52, baseType: !172)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !117, line: 84)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !435, line: 86)
!435 = !DISubprogram(name: "iswalnum", scope: !426, file: !426, line: 111, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !437, line: 87)
!437 = !DISubprogram(name: "iswalpha", scope: !426, file: !426, line: 117, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !439, line: 89)
!439 = !DISubprogram(name: "iswblank", scope: !426, file: !426, line: 162, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !441, line: 91)
!441 = !DISubprogram(name: "iswcntrl", scope: !426, file: !426, line: 120, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !443, line: 92)
!443 = !DISubprogram(name: "iswctype", scope: !426, file: !426, line: 175, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!444 = !DISubroutineType(types: !445)
!445 = !{!6, !117, !432}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !447, line: 93)
!447 = !DISubprogram(name: "iswdigit", scope: !426, file: !426, line: 124, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !449, line: 94)
!449 = !DISubprogram(name: "iswgraph", scope: !426, file: !426, line: 128, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !451, line: 95)
!451 = !DISubprogram(name: "iswlower", scope: !426, file: !426, line: 133, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !453, line: 96)
!453 = !DISubprogram(name: "iswprint", scope: !426, file: !426, line: 136, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !455, line: 97)
!455 = !DISubprogram(name: "iswpunct", scope: !426, file: !426, line: 141, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !457, line: 98)
!457 = !DISubprogram(name: "iswspace", scope: !426, file: !426, line: 146, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !459, line: 99)
!459 = !DISubprogram(name: "iswupper", scope: !426, file: !426, line: 151, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !461, line: 100)
!461 = !DISubprogram(name: "iswxdigit", scope: !426, file: !426, line: 156, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !463, line: 101)
!463 = !DISubprogram(name: "towctrans", scope: !426, file: !426, line: 221, type: !464, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!464 = !DISubroutineType(types: !465)
!465 = !{!117, !117, !425}
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !467, line: 102)
!467 = !DISubprogram(name: "towlower", scope: !426, file: !426, line: 194, type: !468, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!468 = !DISubroutineType(types: !469)
!469 = !{!117, !117}
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !471, line: 103)
!471 = !DISubprogram(name: "towupper", scope: !426, file: !426, line: 197, type: !468, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !473, line: 104)
!473 = !DISubprogram(name: "wctrans", scope: !426, file: !426, line: 218, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DISubroutineType(types: !475)
!475 = !{!425, !174}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !477, line: 105)
!477 = !DISubprogram(name: "wctype", scope: !426, file: !426, line: 171, type: !478, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DISubroutineType(types: !479)
!479 = !{!432, !174}
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !481, line: 98)
!481 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !129, line: 48, baseType: !130)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !483, line: 99)
!483 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !129, line: 110, baseType: !484)
!484 = !DIDerivedType(tag: DW_TAG_typedef, name: "_G_fpos_t", file: !485, line: 25, baseType: !486)
!485 = !DIFile(filename: "/usr/include/_G_config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!486 = !DICompositeType(tag: DW_TAG_structure_type, file: !485, line: 21, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !488, line: 101)
!488 = !DISubprogram(name: "clearerr", scope: !129, file: !129, line: 826, type: !489, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!489 = !DISubroutineType(types: !490)
!490 = !{null, !491}
!491 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !481, size: 64, align: 64)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !493, line: 102)
!493 = !DISubprogram(name: "fclose", scope: !129, file: !129, line: 237, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!494 = !DISubroutineType(types: !495)
!495 = !{!6, !491}
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !497, line: 103)
!497 = !DISubprogram(name: "feof", scope: !129, file: !129, line: 828, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !499, line: 104)
!499 = !DISubprogram(name: "ferror", scope: !129, file: !129, line: 830, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !501, line: 105)
!501 = !DISubprogram(name: "fflush", scope: !129, file: !129, line: 242, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !503, line: 106)
!503 = !DISubprogram(name: "fgetc", scope: !129, file: !129, line: 531, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !505, line: 107)
!505 = !DISubprogram(name: "fgetpos", scope: !129, file: !129, line: 798, type: !506, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DISubroutineType(types: !507)
!507 = !{!6, !508, !509}
!508 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !491)
!509 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !510)
!510 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !483, size: 64, align: 64)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !512, line: 108)
!512 = !DISubprogram(name: "fgets", scope: !129, file: !129, line: 622, type: !513, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DISubroutineType(types: !514)
!514 = !{!245, !244, !6, !508}
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !516, line: 109)
!516 = !DISubprogram(name: "fopen", scope: !129, file: !129, line: 272, type: !517, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!517 = !DISubroutineType(types: !518)
!518 = !{!491, !173, !173}
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !520, line: 110)
!520 = !DISubprogram(name: "fprintf", scope: !129, file: !129, line: 356, type: !521, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!521 = !DISubroutineType(types: !522)
!522 = !{!6, !508, !173, null}
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !524, line: 111)
!524 = !DISubprogram(name: "fputc", scope: !129, file: !129, line: 573, type: !525, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!525 = !DISubroutineType(types: !526)
!526 = !{!6, !6, !491}
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !528, line: 112)
!528 = !DISubprogram(name: "fputs", scope: !129, file: !129, line: 689, type: !529, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!529 = !DISubroutineType(types: !530)
!530 = !{!6, !173, !508}
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !532, line: 113)
!532 = !DISubprogram(name: "fread", scope: !129, file: !129, line: 709, type: !533, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!533 = !DISubroutineType(types: !534)
!534 = !{!171, !535, !171, !171, !508}
!535 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !222)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !537, line: 114)
!537 = !DISubprogram(name: "freopen", scope: !129, file: !129, line: 278, type: !538, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DISubroutineType(types: !539)
!539 = !{!491, !173, !173, !508}
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !541, line: 115)
!541 = !DISubprogram(name: "fscanf", scope: !129, file: !129, line: 425, type: !521, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !543, line: 116)
!543 = !DISubprogram(name: "fseek", scope: !129, file: !129, line: 749, type: !544, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DISubroutineType(types: !545)
!545 = !{!6, !491, !8, !6}
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !547, line: 117)
!547 = !DISubprogram(name: "fsetpos", scope: !129, file: !129, line: 803, type: !548, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DISubroutineType(types: !549)
!549 = !{!6, !491, !550}
!550 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !551, size: 64, align: 64)
!551 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !483)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !553, line: 118)
!553 = !DISubprogram(name: "ftell", scope: !129, file: !129, line: 754, type: !554, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!554 = !DISubroutineType(types: !555)
!555 = !{!8, !491}
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !557, line: 119)
!557 = !DISubprogram(name: "fwrite", scope: !129, file: !129, line: 715, type: !558, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!558 = !DISubroutineType(types: !559)
!559 = !{!171, !560, !171, !171, !508}
!560 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !561)
!561 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !562, size: 64, align: 64)
!562 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !564, line: 120)
!564 = !DISubprogram(name: "getc", scope: !129, file: !129, line: 532, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !566, line: 121)
!566 = !DISubprogram(name: "getchar", scope: !129, file: !129, line: 538, type: !567, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DISubroutineType(types: !568)
!568 = !{!6}
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !570, line: 124)
!570 = !DISubprogram(name: "gets", scope: !129, file: !129, line: 638, type: !571, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DISubroutineType(types: !572)
!572 = !{!245, !245}
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !574, line: 126)
!574 = !DISubprogram(name: "perror", scope: !129, file: !129, line: 846, type: !575, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!575 = !DISubroutineType(types: !576)
!576 = !{null, !174}
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !578, line: 127)
!578 = !DISubprogram(name: "printf", scope: !129, file: !129, line: 362, type: !579, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!579 = !DISubroutineType(types: !580)
!580 = !{!6, !173, null}
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !582, line: 128)
!582 = !DISubprogram(name: "putc", scope: !129, file: !129, line: 574, type: !525, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !584, line: 129)
!584 = !DISubprogram(name: "putchar", scope: !129, file: !129, line: 580, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !586, line: 130)
!586 = !DISubprogram(name: "puts", scope: !129, file: !129, line: 695, type: !587, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!587 = !DISubroutineType(types: !588)
!588 = !{!6, !174}
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !590, line: 131)
!590 = !DISubprogram(name: "remove", scope: !129, file: !129, line: 178, type: !587, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !592, line: 132)
!592 = !DISubprogram(name: "rename", scope: !129, file: !129, line: 180, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!593 = !DISubroutineType(types: !594)
!594 = !{!6, !174, !174}
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !596, line: 133)
!596 = !DISubprogram(name: "rewind", scope: !129, file: !129, line: 759, type: !489, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !598, line: 134)
!598 = !DISubprogram(name: "scanf", scope: !129, file: !129, line: 431, type: !579, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !600, line: 135)
!600 = !DISubprogram(name: "setbuf", scope: !129, file: !129, line: 332, type: !601, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!601 = !DISubroutineType(types: !602)
!602 = !{null, !508, !244}
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !604, line: 136)
!604 = !DISubprogram(name: "setvbuf", scope: !129, file: !129, line: 336, type: !605, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!605 = !DISubroutineType(types: !606)
!606 = !{!6, !508, !244, !6, !171}
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !608, line: 137)
!608 = !DISubprogram(name: "sprintf", scope: !129, file: !129, line: 364, type: !609, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!609 = !DISubroutineType(types: !610)
!610 = !{!6, !244, !173, null}
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !612, line: 138)
!612 = !DISubprogram(name: "sscanf", scope: !129, file: !129, line: 433, type: !613, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!613 = !DISubroutineType(types: !614)
!614 = !{!6, !173, !173, null}
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !616, line: 139)
!616 = !DISubprogram(name: "tmpfile", scope: !129, file: !129, line: 195, type: !617, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!617 = !DISubroutineType(types: !618)
!618 = !{!491}
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !620, line: 141)
!620 = !DISubprogram(name: "tmpnam", scope: !129, file: !129, line: 209, type: !571, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !622, line: 143)
!622 = !DISubprogram(name: "ungetc", scope: !129, file: !129, line: 702, type: !525, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !624, line: 144)
!624 = !DISubprogram(name: "vfprintf", scope: !129, file: !129, line: 371, type: !625, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!625 = !DISubroutineType(types: !626)
!626 = !{!6, !508, !173, !216}
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !628, line: 145)
!628 = !DISubprogram(name: "vprintf", scope: !129, file: !129, line: 377, type: !629, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!629 = !DISubroutineType(types: !630)
!630 = !{!6, !173, !216}
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !632, line: 146)
!632 = !DISubprogram(name: "vsprintf", scope: !129, file: !129, line: 379, type: !633, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!633 = !DISubroutineType(types: !634)
!634 = !{!6, !244, !173, !216}
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !636, line: 175)
!636 = !DISubprogram(name: "snprintf", scope: !129, file: !129, line: 386, type: !637, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!637 = !DISubroutineType(types: !638)
!638 = !{!6, !244, !171, !173, null}
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !640, line: 176)
!640 = !DISubprogram(name: "vfscanf", scope: !129, file: !129, line: 471, type: !625, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !642, line: 177)
!642 = !DISubprogram(name: "vscanf", scope: !129, file: !129, line: 479, type: !629, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !644, line: 178)
!644 = !DISubprogram(name: "vsnprintf", scope: !129, file: !129, line: 390, type: !645, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!645 = !DISubroutineType(types: !646)
!646 = !{!6, !244, !171, !173, !216}
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !648, line: 179)
!648 = !DISubprogram(name: "vsscanf", scope: !129, file: !129, line: 483, type: !649, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!649 = !DISubroutineType(types: !650)
!650 = !{!6, !173, !173, !216}
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !636, line: 185)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !640, line: 186)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !642, line: 187)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !644, line: 188)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !51, entity: !648, line: 189)
!656 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !0, entity: !51, line: 35)
!657 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !0, entity: !51, line: 18)
!658 = !{i32 2, !"Dwarf Version", i32 4}
!659 = !{i32 2, !"Debug Info Version", i32 3}
!660 = !{!"clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 0c0654cbe42ce8060cf9bfeea18254aa37aceca3) (http://llvm.org/git/llvm.git 008f70d21cc2b33cebd1d4443052e62d3fbea6e8)"}
!661 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !53, file: !53, line: 74, type: !662, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!662 = !DISubroutineType(types: !663)
!663 = !{null}
!664 = !DILocation(line: 74, column: 25, scope: !661)
!665 = !DILocation(line: 74, column: 25, scope: !666)
!666 = !DILexicalBlockFile(scope: !661, file: !53, discriminator: 1)
!667 = distinct !DISubprogram(name: "inttofile", linkageName: "_Z9inttofileiPc", scope: !1, file: !1, line: 56, type: !668, isLocal: false, isDefinition: true, scopeLine: 56, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!668 = !DISubroutineType(types: !669)
!669 = !{null, !6, !245}
!670 = !DILocalVariable(name: "data", arg: 1, scope: !667, file: !1, line: 56, type: !6)
!671 = !DIExpression()
!672 = !DILocation(line: 56, column: 20, scope: !667)
!673 = !DILocalVariable(name: "filename", arg: 2, scope: !667, file: !1, line: 56, type: !245)
!674 = !DILocation(line: 56, column: 32, scope: !667)
!675 = !DILocalVariable(name: "fp", scope: !667, file: !1, line: 57, type: !491)
!676 = !DILocation(line: 57, column: 8, scope: !667)
!677 = !DILocation(line: 57, column: 19, scope: !667)
!678 = !DILocation(line: 57, column: 13, scope: !667)
!679 = !DILocation(line: 58, column: 10, scope: !667)
!680 = !DILocation(line: 58, column: 21, scope: !667)
!681 = !DILocation(line: 58, column: 2, scope: !667)
!682 = !DILocation(line: 59, column: 9, scope: !667)
!683 = !DILocation(line: 59, column: 2, scope: !667)
!684 = !DILocation(line: 60, column: 1, scope: !667)
!685 = distinct !DISubprogram(name: "gettime", linkageName: "_Z7gettimev", scope: !1, file: !1, line: 62, type: !686, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!686 = !DISubroutineType(types: !687)
!687 = !{!69}
!688 = !DILocalVariable(name: "t", scope: !685, file: !1, line: 63, type: !689)
!689 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !690, line: 30, size: 128, align: 64, elements: !691, identifier: "_ZTS7timeval")
!690 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!691 = !{!692, !694}
!692 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !689, file: !690, line: 32, baseType: !693, size: 64, align: 64)
!693 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !430, line: 139, baseType: !8)
!694 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !689, file: !690, line: 33, baseType: !695, size: 64, align: 64, offset: 64)
!695 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !430, line: 141, baseType: !8)
!696 = !DILocation(line: 63, column: 18, scope: !685)
!697 = !DILocation(line: 64, column: 3, scope: !685)
!698 = !DILocation(line: 65, column: 12, scope: !685)
!699 = !DILocation(line: 65, column: 10, scope: !685)
!700 = !DILocation(line: 65, column: 21, scope: !685)
!701 = !DILocation(line: 65, column: 19, scope: !685)
!702 = !DILocation(line: 65, column: 28, scope: !685)
!703 = !DILocation(line: 65, column: 18, scope: !685)
!704 = !DILocation(line: 65, column: 3, scope: !685)
!705 = distinct !DISubprogram(name: "isIdentical", linkageName: "_Z11isIdenticalPfS_i", scope: !1, file: !1, line: 68, type: !706, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!706 = !DISubroutineType(types: !707)
!707 = !{!6, !4, !4, !6}
!708 = !DILocalVariable(name: "i", arg: 1, scope: !705, file: !1, line: 68, type: !4)
!709 = !DILocation(line: 68, column: 24, scope: !705)
!710 = !DILocalVariable(name: "j", arg: 2, scope: !705, file: !1, line: 68, type: !4)
!711 = !DILocation(line: 68, column: 34, scope: !705)
!712 = !DILocalVariable(name: "D", arg: 3, scope: !705, file: !1, line: 68, type: !6)
!713 = !DILocation(line: 68, column: 41, scope: !705)
!714 = !DILocalVariable(name: "a", scope: !705, file: !1, line: 71, type: !6)
!715 = !DILocation(line: 71, column: 7, scope: !705)
!716 = !DILocalVariable(name: "equal", scope: !705, file: !1, line: 72, type: !6)
!717 = !DILocation(line: 72, column: 7, scope: !705)
!718 = !DILocation(line: 74, column: 3, scope: !705)
!719 = !DILocation(line: 74, column: 10, scope: !720)
!720 = !DILexicalBlockFile(scope: !705, file: !1, discriminator: 1)
!721 = !DILocation(line: 74, column: 16, scope: !720)
!722 = !DILocation(line: 74, column: 19, scope: !723)
!723 = !DILexicalBlockFile(scope: !705, file: !1, discriminator: 2)
!724 = !DILocation(line: 74, column: 23, scope: !723)
!725 = !DILocation(line: 74, column: 21, scope: !723)
!726 = !DILocation(line: 74, column: 3, scope: !727)
!727 = !DILexicalBlockFile(scope: !705, file: !1, discriminator: 3)
!728 = !DILocation(line: 75, column: 11, scope: !729)
!729 = distinct !DILexicalBlock(scope: !730, file: !1, line: 75, column: 9)
!730 = distinct !DILexicalBlock(scope: !705, file: !1, line: 74, column: 26)
!731 = !DILocation(line: 75, column: 9, scope: !729)
!732 = !DILocation(line: 75, column: 19, scope: !729)
!733 = !DILocation(line: 75, column: 17, scope: !729)
!734 = !DILocation(line: 75, column: 14, scope: !729)
!735 = !DILocation(line: 75, column: 9, scope: !730)
!736 = !DILocation(line: 75, column: 29, scope: !737)
!737 = !DILexicalBlockFile(scope: !729, file: !1, discriminator: 1)
!738 = !DILocation(line: 75, column: 23, scope: !737)
!739 = !DILocation(line: 76, column: 11, scope: !729)
!740 = !DILocation(line: 74, column: 3, scope: !741)
!741 = !DILexicalBlockFile(scope: !705, file: !1, discriminator: 4)
!742 = distinct !{!742, !718}
!743 = !DILocation(line: 78, column: 7, scope: !744)
!744 = distinct !DILexicalBlock(scope: !705, file: !1, line: 78, column: 7)
!745 = !DILocation(line: 78, column: 7, scope: !705)
!746 = !DILocation(line: 78, column: 14, scope: !747)
!747 = !DILexicalBlockFile(scope: !744, file: !1, discriminator: 1)
!748 = !DILocation(line: 79, column: 8, scope: !744)
!749 = !DILocation(line: 81, column: 1, scope: !705)
!750 = distinct !DISubprogram(name: "shuffle", linkageName: "_Z7shuffleP6Points", scope: !1, file: !1, line: 95, type: !751, isLocal: false, isDefinition: true, scopeLine: 96, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!751 = !DISubroutineType(types: !752)
!752 = !{null, !16}
!753 = !DILocalVariable(name: "points", arg: 1, scope: !750, file: !1, line: 95, type: !16)
!754 = !DILocation(line: 95, column: 22, scope: !750)
!755 = !DILocalVariable(name: "t1", scope: !750, file: !1, line: 98, type: !69)
!756 = !DILocation(line: 98, column: 10, scope: !750)
!757 = !DILocation(line: 98, column: 15, scope: !750)
!758 = !DILocalVariable(name: "i", scope: !750, file: !1, line: 100, type: !8)
!759 = !DILocation(line: 100, column: 8, scope: !750)
!760 = !DILocalVariable(name: "j", scope: !750, file: !1, line: 100, type: !8)
!761 = !DILocation(line: 100, column: 11, scope: !750)
!762 = !DILocalVariable(name: "temp", scope: !750, file: !1, line: 101, type: !24)
!763 = !DILocation(line: 101, column: 9, scope: !750)
!764 = !DILocation(line: 102, column: 9, scope: !765)
!765 = distinct !DILexicalBlock(scope: !750, file: !1, line: 102, column: 3)
!766 = !DILocation(line: 102, column: 8, scope: !765)
!767 = !DILocation(line: 102, column: 12, scope: !768)
!768 = !DILexicalBlockFile(scope: !769, file: !1, discriminator: 1)
!769 = distinct !DILexicalBlock(scope: !765, file: !1, line: 102, column: 3)
!770 = !DILocation(line: 102, column: 14, scope: !768)
!771 = !DILocation(line: 102, column: 22, scope: !768)
!772 = !DILocation(line: 102, column: 25, scope: !768)
!773 = !DILocation(line: 102, column: 13, scope: !768)
!774 = !DILocation(line: 102, column: 3, scope: !768)
!775 = !DILocation(line: 103, column: 8, scope: !776)
!776 = distinct !DILexicalBlock(scope: !769, file: !1, line: 102, column: 33)
!777 = !DILocation(line: 103, column: 19, scope: !776)
!778 = !DILocation(line: 103, column: 27, scope: !776)
!779 = !DILocation(line: 103, column: 33, scope: !776)
!780 = !DILocation(line: 103, column: 31, scope: !776)
!781 = !DILocation(line: 103, column: 17, scope: !776)
!782 = !DILocation(line: 103, column: 39, scope: !776)
!783 = !DILocation(line: 103, column: 37, scope: !776)
!784 = !DILocation(line: 103, column: 6, scope: !776)
!785 = !DILocation(line: 104, column: 22, scope: !776)
!786 = !DILocation(line: 104, column: 12, scope: !776)
!787 = !DILocation(line: 104, column: 20, scope: !776)
!788 = !DILocation(line: 104, column: 10, scope: !776)
!789 = !DILocation(line: 105, column: 15, scope: !776)
!790 = !DILocation(line: 105, column: 5, scope: !776)
!791 = !DILocation(line: 105, column: 13, scope: !776)
!792 = !DILocation(line: 105, column: 30, scope: !776)
!793 = !DILocation(line: 105, column: 20, scope: !776)
!794 = !DILocation(line: 105, column: 28, scope: !776)
!795 = !DILocation(line: 105, column: 18, scope: !776)
!796 = !DILocation(line: 106, column: 15, scope: !776)
!797 = !DILocation(line: 106, column: 5, scope: !776)
!798 = !DILocation(line: 106, column: 13, scope: !776)
!799 = !DILocation(line: 106, column: 18, scope: !776)
!800 = !DILocation(line: 107, column: 3, scope: !776)
!801 = !DILocation(line: 102, column: 29, scope: !802)
!802 = !DILexicalBlockFile(scope: !769, file: !1, discriminator: 2)
!803 = !DILocation(line: 102, column: 3, scope: !802)
!804 = distinct !{!804, !805}
!805 = !DILocation(line: 102, column: 3, scope: !750)
!806 = !DILocalVariable(name: "t2", scope: !750, file: !1, line: 109, type: !69)
!807 = !DILocation(line: 109, column: 10, scope: !750)
!808 = !DILocation(line: 109, column: 15, scope: !750)
!809 = !DILocation(line: 110, column: 19, scope: !750)
!810 = !DILocation(line: 110, column: 22, scope: !750)
!811 = !DILocation(line: 110, column: 21, scope: !750)
!812 = !DILocation(line: 110, column: 16, scope: !750)
!813 = !DILocation(line: 112, column: 1, scope: !750)
!814 = distinct !DISubprogram(name: "intshuffle", linkageName: "_Z10intshufflePii", scope: !1, file: !1, line: 115, type: !815, isLocal: false, isDefinition: true, scopeLine: 116, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!815 = !DISubroutineType(types: !816)
!816 = !{null, !7, !6}
!817 = !DILocalVariable(name: "intarray", arg: 1, scope: !814, file: !1, line: 115, type: !7)
!818 = !DILocation(line: 115, column: 22, scope: !814)
!819 = !DILocalVariable(name: "length", arg: 2, scope: !814, file: !1, line: 115, type: !6)
!820 = !DILocation(line: 115, column: 36, scope: !814)
!821 = !DILocalVariable(name: "t1", scope: !814, file: !1, line: 118, type: !69)
!822 = !DILocation(line: 118, column: 10, scope: !814)
!823 = !DILocation(line: 118, column: 15, scope: !814)
!824 = !DILocalVariable(name: "i", scope: !814, file: !1, line: 120, type: !8)
!825 = !DILocation(line: 120, column: 8, scope: !814)
!826 = !DILocalVariable(name: "j", scope: !814, file: !1, line: 120, type: !8)
!827 = !DILocation(line: 120, column: 11, scope: !814)
!828 = !DILocalVariable(name: "temp", scope: !814, file: !1, line: 121, type: !6)
!829 = !DILocation(line: 121, column: 7, scope: !814)
!830 = !DILocation(line: 122, column: 9, scope: !831)
!831 = distinct !DILexicalBlock(scope: !814, file: !1, line: 122, column: 3)
!832 = !DILocation(line: 122, column: 8, scope: !831)
!833 = !DILocation(line: 122, column: 12, scope: !834)
!834 = !DILexicalBlockFile(scope: !835, file: !1, discriminator: 1)
!835 = distinct !DILexicalBlock(scope: !831, file: !1, line: 122, column: 3)
!836 = !DILocation(line: 122, column: 14, scope: !834)
!837 = !DILocation(line: 122, column: 13, scope: !834)
!838 = !DILocation(line: 122, column: 3, scope: !834)
!839 = !DILocation(line: 123, column: 8, scope: !840)
!840 = distinct !DILexicalBlock(scope: !835, file: !1, line: 122, column: 26)
!841 = !DILocation(line: 123, column: 19, scope: !840)
!842 = !DILocation(line: 123, column: 28, scope: !840)
!843 = !DILocation(line: 123, column: 26, scope: !840)
!844 = !DILocation(line: 123, column: 17, scope: !840)
!845 = !DILocation(line: 123, column: 32, scope: !840)
!846 = !DILocation(line: 123, column: 31, scope: !840)
!847 = !DILocation(line: 123, column: 6, scope: !840)
!848 = !DILocation(line: 124, column: 21, scope: !840)
!849 = !DILocation(line: 124, column: 12, scope: !840)
!850 = !DILocation(line: 124, column: 10, scope: !840)
!851 = !DILocation(line: 125, column: 26, scope: !840)
!852 = !DILocation(line: 125, column: 17, scope: !840)
!853 = !DILocation(line: 125, column: 14, scope: !840)
!854 = !DILocation(line: 125, column: 5, scope: !840)
!855 = !DILocation(line: 125, column: 16, scope: !840)
!856 = !DILocation(line: 126, column: 17, scope: !840)
!857 = !DILocation(line: 126, column: 14, scope: !840)
!858 = !DILocation(line: 126, column: 5, scope: !840)
!859 = !DILocation(line: 126, column: 16, scope: !840)
!860 = !DILocation(line: 127, column: 3, scope: !840)
!861 = !DILocation(line: 122, column: 22, scope: !862)
!862 = !DILexicalBlockFile(scope: !835, file: !1, discriminator: 2)
!863 = !DILocation(line: 122, column: 3, scope: !862)
!864 = distinct !{!864, !865}
!865 = !DILocation(line: 122, column: 3, scope: !814)
!866 = !DILocalVariable(name: "t2", scope: !814, file: !1, line: 129, type: !69)
!867 = !DILocation(line: 129, column: 10, scope: !814)
!868 = !DILocation(line: 129, column: 15, scope: !814)
!869 = !DILocation(line: 130, column: 19, scope: !814)
!870 = !DILocation(line: 130, column: 22, scope: !814)
!871 = !DILocation(line: 130, column: 21, scope: !814)
!872 = !DILocation(line: 130, column: 16, scope: !814)
!873 = !DILocation(line: 132, column: 1, scope: !814)
!874 = distinct !DISubprogram(name: "dist", linkageName: "_Z4dist5PointS_i", scope: !1, file: !1, line: 145, type: !875, isLocal: false, isDefinition: true, scopeLine: 146, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!875 = !DISubroutineType(types: !876)
!876 = !{!5, !24, !24, !6}
!877 = !DILocalVariable(name: "p1", arg: 1, scope: !874, file: !1, line: 145, type: !24)
!878 = !DILocation(line: 145, column: 18, scope: !874)
!879 = !DILocalVariable(name: "p2", arg: 2, scope: !874, file: !1, line: 145, type: !24)
!880 = !DILocation(line: 145, column: 28, scope: !874)
!881 = !DILocalVariable(name: "dim", arg: 3, scope: !874, file: !1, line: 145, type: !6)
!882 = !DILocation(line: 145, column: 36, scope: !874)
!883 = !DILocalVariable(name: "i", scope: !874, file: !1, line: 147, type: !6)
!884 = !DILocation(line: 147, column: 7, scope: !874)
!885 = !DILocalVariable(name: "result", scope: !874, file: !1, line: 148, type: !5)
!886 = !DILocation(line: 148, column: 9, scope: !874)
!887 = !DILocation(line: 149, column: 9, scope: !888)
!888 = distinct !DILexicalBlock(scope: !874, file: !1, line: 149, column: 3)
!889 = !DILocation(line: 149, column: 8, scope: !888)
!890 = !DILocation(line: 149, column: 12, scope: !891)
!891 = !DILexicalBlockFile(scope: !892, file: !1, discriminator: 1)
!892 = distinct !DILexicalBlock(scope: !888, file: !1, line: 149, column: 3)
!893 = !DILocation(line: 149, column: 14, scope: !891)
!894 = !DILocation(line: 149, column: 13, scope: !891)
!895 = !DILocation(line: 149, column: 3, scope: !891)
!896 = !DILocation(line: 150, column: 25, scope: !892)
!897 = !DILocation(line: 150, column: 16, scope: !892)
!898 = !DILocation(line: 150, column: 19, scope: !892)
!899 = !DILocation(line: 150, column: 39, scope: !892)
!900 = !DILocation(line: 150, column: 30, scope: !892)
!901 = !DILocation(line: 150, column: 33, scope: !892)
!902 = !DILocation(line: 150, column: 28, scope: !892)
!903 = !DILocation(line: 150, column: 53, scope: !892)
!904 = !DILocation(line: 150, column: 44, scope: !892)
!905 = !DILocation(line: 150, column: 47, scope: !892)
!906 = !DILocation(line: 150, column: 67, scope: !892)
!907 = !DILocation(line: 150, column: 58, scope: !892)
!908 = !DILocation(line: 150, column: 61, scope: !892)
!909 = !DILocation(line: 150, column: 56, scope: !892)
!910 = !DILocation(line: 150, column: 42, scope: !892)
!911 = !DILocation(line: 150, column: 12, scope: !892)
!912 = !DILocation(line: 150, column: 5, scope: !892)
!913 = !DILocation(line: 149, column: 19, scope: !914)
!914 = !DILexicalBlockFile(scope: !892, file: !1, discriminator: 2)
!915 = !DILocation(line: 149, column: 3, scope: !914)
!916 = distinct !{!916, !917}
!917 = !DILocation(line: 149, column: 3, scope: !874)
!918 = !DILocation(line: 156, column: 10, scope: !874)
!919 = !DILocation(line: 156, column: 3, scope: !874)
!920 = !DILocalVariable(name: "points", arg: 1, scope: !83, file: !1, line: 160, type: !16)
!921 = !DILocation(line: 160, column: 23, scope: !83)
!922 = !DILocalVariable(name: "z", arg: 2, scope: !83, file: !1, line: 160, type: !5)
!923 = !DILocation(line: 160, column: 37, scope: !83)
!924 = !DILocalVariable(name: "kcenter", arg: 3, scope: !83, file: !1, line: 160, type: !34)
!925 = !DILocation(line: 160, column: 46, scope: !83)
!926 = !DILocalVariable(name: "pid", arg: 4, scope: !83, file: !1, line: 160, type: !6)
!927 = !DILocation(line: 160, column: 59, scope: !83)
!928 = !DILocalVariable(name: "barrier", arg: 5, scope: !83, file: !1, line: 160, type: !37)
!929 = !DILocation(line: 160, column: 83, scope: !83)
!930 = !DILocalVariable(name: "t1", scope: !83, file: !1, line: 163, type: !69)
!931 = !DILocation(line: 163, column: 10, scope: !83)
!932 = !DILocation(line: 163, column: 15, scope: !83)
!933 = !DILocalVariable(name: "bsize", scope: !83, file: !1, line: 170, type: !8)
!934 = !DILocation(line: 170, column: 8, scope: !83)
!935 = !DILocation(line: 170, column: 16, scope: !83)
!936 = !DILocation(line: 170, column: 24, scope: !83)
!937 = !DILocation(line: 170, column: 28, scope: !83)
!938 = !DILocation(line: 170, column: 27, scope: !83)
!939 = !DILocalVariable(name: "k1", scope: !83, file: !1, line: 171, type: !8)
!940 = !DILocation(line: 171, column: 8, scope: !83)
!941 = !DILocation(line: 171, column: 13, scope: !83)
!942 = !DILocation(line: 171, column: 21, scope: !83)
!943 = !DILocation(line: 171, column: 19, scope: !83)
!944 = !DILocalVariable(name: "k2", scope: !83, file: !1, line: 172, type: !8)
!945 = !DILocation(line: 172, column: 8, scope: !83)
!946 = !DILocation(line: 172, column: 13, scope: !83)
!947 = !DILocation(line: 172, column: 18, scope: !83)
!948 = !DILocation(line: 172, column: 16, scope: !83)
!949 = !DILocation(line: 173, column: 7, scope: !950)
!950 = distinct !DILexicalBlock(scope: !83, file: !1, line: 173, column: 7)
!951 = !DILocation(line: 173, column: 14, scope: !950)
!952 = !DILocation(line: 173, column: 19, scope: !950)
!953 = !DILocation(line: 173, column: 11, scope: !950)
!954 = !DILocation(line: 173, column: 7, scope: !83)
!955 = !DILocation(line: 173, column: 29, scope: !956)
!956 = !DILexicalBlockFile(scope: !950, file: !1, discriminator: 1)
!957 = !DILocation(line: 173, column: 37, scope: !956)
!958 = !DILocation(line: 173, column: 27, scope: !956)
!959 = !DILocation(line: 173, column: 24, scope: !956)
!960 = !DILocalVariable(name: "k", scope: !961, file: !1, line: 193, type: !6)
!961 = distinct !DILexicalBlock(scope: !83, file: !1, line: 193, column: 3)
!962 = !DILocation(line: 193, column: 12, scope: !961)
!963 = !DILocation(line: 193, column: 16, scope: !961)
!964 = !DILocation(line: 193, column: 8, scope: !961)
!965 = !DILocation(line: 193, column: 20, scope: !966)
!966 = !DILexicalBlockFile(scope: !967, file: !1, discriminator: 1)
!967 = distinct !DILexicalBlock(scope: !961, file: !1, line: 193, column: 3)
!968 = !DILocation(line: 193, column: 24, scope: !966)
!969 = !DILocation(line: 193, column: 22, scope: !966)
!970 = !DILocation(line: 193, column: 3, scope: !966)
!971 = !DILocalVariable(name: "distance", scope: !972, file: !1, line: 194, type: !5)
!972 = distinct !DILexicalBlock(scope: !967, file: !1, line: 193, column: 37)
!973 = !DILocation(line: 194, column: 11, scope: !972)
!974 = !DILocation(line: 194, column: 37, scope: !972)
!975 = !DILocation(line: 194, column: 27, scope: !972)
!976 = !DILocation(line: 194, column: 35, scope: !972)
!977 = !DILocation(line: 194, column: 40, scope: !972)
!978 = !DILocation(line: 194, column: 48, scope: !972)
!979 = !DILocation(line: 194, column: 40, scope: !980)
!980 = !DILexicalBlockFile(scope: !972, file: !1, discriminator: 1)
!981 = !DILocation(line: 194, column: 53, scope: !972)
!982 = !DILocation(line: 194, column: 61, scope: !972)
!983 = !DILocation(line: 194, column: 22, scope: !984)
!984 = !DILexicalBlockFile(scope: !972, file: !1, discriminator: 2)
!985 = !DILocation(line: 195, column: 25, scope: !972)
!986 = !DILocation(line: 195, column: 46, scope: !972)
!987 = !DILocation(line: 195, column: 36, scope: !972)
!988 = !DILocation(line: 195, column: 44, scope: !972)
!989 = !DILocation(line: 195, column: 49, scope: !972)
!990 = !DILocation(line: 195, column: 34, scope: !972)
!991 = !DILocation(line: 195, column: 15, scope: !972)
!992 = !DILocation(line: 195, column: 5, scope: !972)
!993 = !DILocation(line: 195, column: 13, scope: !972)
!994 = !DILocation(line: 195, column: 18, scope: !972)
!995 = !DILocation(line: 195, column: 23, scope: !972)
!996 = !DILocation(line: 196, column: 15, scope: !972)
!997 = !DILocation(line: 196, column: 5, scope: !972)
!998 = !DILocation(line: 196, column: 13, scope: !972)
!999 = !DILocation(line: 196, column: 18, scope: !972)
!1000 = !DILocation(line: 196, column: 24, scope: !972)
!1001 = !DILocation(line: 197, column: 3, scope: !972)
!1002 = !DILocation(line: 193, column: 29, scope: !1003)
!1003 = !DILexicalBlockFile(scope: !967, file: !1, discriminator: 2)
!1004 = !DILocation(line: 193, column: 3, scope: !1003)
!1005 = distinct !{!1005, !1006}
!1006 = !DILocation(line: 193, column: 3, scope: !83)
!1007 = !DILocation(line: 199, column: 7, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !83, file: !1, line: 199, column: 7)
!1009 = !DILocation(line: 199, column: 10, scope: !1008)
!1010 = !DILocation(line: 199, column: 7, scope: !83)
!1011 = !DILocation(line: 200, column: 6, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !1008, file: !1, line: 199, column: 18)
!1013 = !DILocation(line: 200, column: 14, scope: !1012)
!1014 = !DILocation(line: 201, column: 42, scope: !1012)
!1015 = !DILocation(line: 201, column: 41, scope: !1012)
!1016 = !DILocation(line: 201, column: 21, scope: !1012)
!1017 = !DILocation(line: 201, column: 13, scope: !1012)
!1018 = !DILocation(line: 201, column: 11, scope: !1012)
!1019 = !DILocation(line: 202, column: 3, scope: !1012)
!1020 = !DILocation(line: 204, column: 7, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !83, file: !1, line: 204, column: 7)
!1022 = !DILocation(line: 204, column: 11, scope: !1021)
!1023 = !DILocation(line: 204, column: 7, scope: !83)
!1024 = !DILocation(line: 205, column: 5, scope: !1025)
!1025 = distinct !DILexicalBlock(scope: !1021, file: !1, line: 204, column: 18)
!1026 = !DILocation(line: 211, column: 11, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1028, file: !1, line: 211, column: 11)
!1028 = distinct !DILexicalBlock(scope: !1025, file: !1, line: 205, column: 14)
!1029 = !DILocation(line: 211, column: 16, scope: !1027)
!1030 = !DILocation(line: 211, column: 24, scope: !1027)
!1031 = !DILocation(line: 211, column: 13, scope: !1027)
!1032 = !DILocation(line: 211, column: 11, scope: !1028)
!1033 = !DILocation(line: 211, column: 30, scope: !1034)
!1034 = !DILexicalBlockFile(scope: !1027, file: !1, discriminator: 1)
!1035 = !DILocalVariable(name: "k", scope: !1036, file: !1, line: 212, type: !6)
!1036 = distinct !DILexicalBlock(scope: !1028, file: !1, line: 212, column: 7)
!1037 = !DILocation(line: 212, column: 16, scope: !1036)
!1038 = !DILocation(line: 212, column: 20, scope: !1036)
!1039 = !DILocation(line: 212, column: 12, scope: !1036)
!1040 = !DILocation(line: 212, column: 24, scope: !1041)
!1041 = !DILexicalBlockFile(scope: !1042, file: !1, discriminator: 1)
!1042 = distinct !DILexicalBlock(scope: !1036, file: !1, line: 212, column: 7)
!1043 = !DILocation(line: 212, column: 28, scope: !1041)
!1044 = !DILocation(line: 212, column: 26, scope: !1041)
!1045 = !DILocation(line: 212, column: 7, scope: !1041)
!1046 = !DILocalVariable(name: "distance", scope: !1047, file: !1, line: 214, type: !5)
!1047 = distinct !DILexicalBlock(scope: !1042, file: !1, line: 213, column: 2)
!1048 = !DILocation(line: 214, column: 10, scope: !1047)
!1049 = !DILocation(line: 214, column: 36, scope: !1047)
!1050 = !DILocation(line: 214, column: 26, scope: !1047)
!1051 = !DILocation(line: 214, column: 34, scope: !1047)
!1052 = !DILocation(line: 214, column: 49, scope: !1047)
!1053 = !DILocation(line: 214, column: 39, scope: !1047)
!1054 = !DILocation(line: 214, column: 47, scope: !1047)
!1055 = !DILocation(line: 214, column: 39, scope: !1056)
!1056 = !DILexicalBlockFile(scope: !1047, file: !1, discriminator: 1)
!1057 = !DILocation(line: 214, column: 52, scope: !1047)
!1058 = !DILocation(line: 214, column: 60, scope: !1047)
!1059 = !DILocation(line: 214, column: 21, scope: !1060)
!1060 = !DILexicalBlockFile(scope: !1047, file: !1, discriminator: 2)
!1061 = !DILocation(line: 215, column: 8, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1047, file: !1, line: 215, column: 8)
!1063 = !DILocation(line: 215, column: 27, scope: !1062)
!1064 = !DILocation(line: 215, column: 17, scope: !1062)
!1065 = !DILocation(line: 215, column: 25, scope: !1062)
!1066 = !DILocation(line: 215, column: 30, scope: !1062)
!1067 = !DILocation(line: 215, column: 16, scope: !1062)
!1068 = !DILocation(line: 215, column: 49, scope: !1062)
!1069 = !DILocation(line: 215, column: 39, scope: !1062)
!1070 = !DILocation(line: 215, column: 47, scope: !1062)
!1071 = !DILocation(line: 215, column: 52, scope: !1062)
!1072 = !DILocation(line: 215, column: 37, scope: !1062)
!1073 = !DILocation(line: 215, column: 8, scope: !1047)
!1074 = !DILocation(line: 217, column: 28, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1062, file: !1, line: 216, column: 6)
!1076 = !DILocation(line: 217, column: 49, scope: !1075)
!1077 = !DILocation(line: 217, column: 39, scope: !1075)
!1078 = !DILocation(line: 217, column: 47, scope: !1075)
!1079 = !DILocation(line: 217, column: 52, scope: !1075)
!1080 = !DILocation(line: 217, column: 37, scope: !1075)
!1081 = !DILocation(line: 217, column: 18, scope: !1075)
!1082 = !DILocation(line: 217, column: 8, scope: !1075)
!1083 = !DILocation(line: 217, column: 16, scope: !1075)
!1084 = !DILocation(line: 217, column: 21, scope: !1075)
!1085 = !DILocation(line: 217, column: 26, scope: !1075)
!1086 = !DILocation(line: 218, column: 28, scope: !1075)
!1087 = !DILocation(line: 218, column: 18, scope: !1075)
!1088 = !DILocation(line: 218, column: 8, scope: !1075)
!1089 = !DILocation(line: 218, column: 16, scope: !1075)
!1090 = !DILocation(line: 218, column: 21, scope: !1075)
!1091 = !DILocation(line: 218, column: 27, scope: !1075)
!1092 = !DILocation(line: 219, column: 6, scope: !1075)
!1093 = !DILocation(line: 220, column: 2, scope: !1047)
!1094 = !DILocation(line: 212, column: 33, scope: !1095)
!1095 = !DILexicalBlockFile(scope: !1042, file: !1, discriminator: 2)
!1096 = !DILocation(line: 212, column: 7, scope: !1095)
!1097 = distinct !{!1097, !1098}
!1098 = !DILocation(line: 212, column: 7, scope: !1028)
!1099 = !DILocation(line: 205, column: 5, scope: !1100)
!1100 = !DILexicalBlockFile(scope: !1025, file: !1, discriminator: 1)
!1101 = distinct !{!1101, !1024}
!1102 = !DILocation(line: 226, column: 3, scope: !1025)
!1103 = !DILocation(line: 228, column: 11, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1105, file: !1, line: 228, column: 5)
!1105 = distinct !DILexicalBlock(scope: !1021, file: !1, line: 227, column: 9)
!1106 = !DILocation(line: 228, column: 9, scope: !1104)
!1107 = !DILocation(line: 228, column: 16, scope: !1108)
!1108 = !DILexicalBlockFile(scope: !1109, file: !1, discriminator: 1)
!1109 = distinct !DILexicalBlock(scope: !1104, file: !1, line: 228, column: 5)
!1110 = !DILocation(line: 228, column: 20, scope: !1108)
!1111 = !DILocation(line: 228, column: 28, scope: !1108)
!1112 = !DILocation(line: 228, column: 18, scope: !1108)
!1113 = !DILocation(line: 228, column: 5, scope: !1108)
!1114 = !DILocalVariable(name: "to_open", scope: !1115, file: !1, line: 229, type: !10)
!1115 = distinct !DILexicalBlock(scope: !1109, file: !1, line: 228, column: 40)
!1116 = !DILocation(line: 229, column: 12, scope: !1115)
!1117 = !DILocation(line: 229, column: 30, scope: !1115)
!1118 = !DILocation(line: 229, column: 39, scope: !1115)
!1119 = !DILocation(line: 229, column: 67, scope: !1115)
!1120 = !DILocation(line: 229, column: 57, scope: !1115)
!1121 = !DILocation(line: 229, column: 65, scope: !1115)
!1122 = !DILocation(line: 229, column: 70, scope: !1115)
!1123 = !DILocation(line: 229, column: 75, scope: !1115)
!1124 = !DILocation(line: 229, column: 74, scope: !1115)
!1125 = !DILocation(line: 229, column: 55, scope: !1115)
!1126 = !DILocation(line: 230, column: 11, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1115, file: !1, line: 230, column: 11)
!1128 = !DILocation(line: 230, column: 11, scope: !1115)
!1129 = !DILocation(line: 231, column: 4, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1127, file: !1, line: 230, column: 22)
!1131 = !DILocation(line: 231, column: 12, scope: !1130)
!1132 = !DILocation(line: 235, column: 7, scope: !1130)
!1133 = !DILocalVariable(name: "k", scope: !1134, file: !1, line: 240, type: !6)
!1134 = distinct !DILexicalBlock(scope: !1130, file: !1, line: 240, column: 2)
!1135 = !DILocation(line: 240, column: 11, scope: !1134)
!1136 = !DILocation(line: 240, column: 15, scope: !1134)
!1137 = !DILocation(line: 240, column: 7, scope: !1134)
!1138 = !DILocation(line: 240, column: 19, scope: !1139)
!1139 = !DILexicalBlockFile(scope: !1140, file: !1, discriminator: 1)
!1140 = distinct !DILexicalBlock(scope: !1134, file: !1, line: 240, column: 2)
!1141 = !DILocation(line: 240, column: 23, scope: !1139)
!1142 = !DILocation(line: 240, column: 21, scope: !1139)
!1143 = !DILocation(line: 240, column: 2, scope: !1139)
!1144 = !DILocalVariable(name: "distance", scope: !1145, file: !1, line: 241, type: !5)
!1145 = distinct !DILexicalBlock(scope: !1140, file: !1, line: 240, column: 34)
!1146 = !DILocation(line: 241, column: 10, scope: !1145)
!1147 = !DILocation(line: 241, column: 36, scope: !1145)
!1148 = !DILocation(line: 241, column: 26, scope: !1145)
!1149 = !DILocation(line: 241, column: 34, scope: !1145)
!1150 = !DILocation(line: 241, column: 49, scope: !1145)
!1151 = !DILocation(line: 241, column: 39, scope: !1145)
!1152 = !DILocation(line: 241, column: 47, scope: !1145)
!1153 = !DILocation(line: 241, column: 39, scope: !1154)
!1154 = !DILexicalBlockFile(scope: !1145, file: !1, discriminator: 1)
!1155 = !DILocation(line: 241, column: 52, scope: !1145)
!1156 = !DILocation(line: 241, column: 60, scope: !1145)
!1157 = !DILocation(line: 241, column: 21, scope: !1158)
!1158 = !DILexicalBlockFile(scope: !1145, file: !1, discriminator: 2)
!1159 = !DILocation(line: 242, column: 8, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1145, file: !1, line: 242, column: 8)
!1161 = !DILocation(line: 242, column: 27, scope: !1160)
!1162 = !DILocation(line: 242, column: 17, scope: !1160)
!1163 = !DILocation(line: 242, column: 25, scope: !1160)
!1164 = !DILocation(line: 242, column: 30, scope: !1160)
!1165 = !DILocation(line: 242, column: 16, scope: !1160)
!1166 = !DILocation(line: 242, column: 49, scope: !1160)
!1167 = !DILocation(line: 242, column: 39, scope: !1160)
!1168 = !DILocation(line: 242, column: 47, scope: !1160)
!1169 = !DILocation(line: 242, column: 52, scope: !1160)
!1170 = !DILocation(line: 242, column: 37, scope: !1160)
!1171 = !DILocation(line: 242, column: 8, scope: !1145)
!1172 = !DILocation(line: 243, column: 26, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1160, file: !1, line: 242, column: 60)
!1174 = !DILocation(line: 243, column: 47, scope: !1173)
!1175 = !DILocation(line: 243, column: 37, scope: !1173)
!1176 = !DILocation(line: 243, column: 45, scope: !1173)
!1177 = !DILocation(line: 243, column: 50, scope: !1173)
!1178 = !DILocation(line: 243, column: 35, scope: !1173)
!1179 = !DILocation(line: 243, column: 16, scope: !1173)
!1180 = !DILocation(line: 243, column: 6, scope: !1173)
!1181 = !DILocation(line: 243, column: 14, scope: !1173)
!1182 = !DILocation(line: 243, column: 19, scope: !1173)
!1183 = !DILocation(line: 243, column: 24, scope: !1173)
!1184 = !DILocation(line: 244, column: 26, scope: !1173)
!1185 = !DILocation(line: 244, column: 16, scope: !1173)
!1186 = !DILocation(line: 244, column: 6, scope: !1173)
!1187 = !DILocation(line: 244, column: 14, scope: !1173)
!1188 = !DILocation(line: 244, column: 19, scope: !1173)
!1189 = !DILocation(line: 244, column: 25, scope: !1173)
!1190 = !DILocation(line: 245, column: 4, scope: !1173)
!1191 = !DILocation(line: 246, column: 2, scope: !1145)
!1192 = !DILocation(line: 240, column: 28, scope: !1193)
!1193 = !DILexicalBlockFile(scope: !1140, file: !1, discriminator: 2)
!1194 = !DILocation(line: 240, column: 2, scope: !1193)
!1195 = distinct !{!1195, !1196}
!1196 = !DILocation(line: 240, column: 2, scope: !1130)
!1197 = !DILocation(line: 250, column: 7, scope: !1130)
!1198 = !DILocation(line: 254, column: 7, scope: !1130)
!1199 = !DILocation(line: 255, column: 5, scope: !1115)
!1200 = !DILocation(line: 228, column: 34, scope: !1201)
!1201 = !DILexicalBlockFile(scope: !1109, file: !1, discriminator: 2)
!1202 = !DILocation(line: 228, column: 5, scope: !1201)
!1203 = distinct !{!1203, !1204}
!1204 = !DILocation(line: 228, column: 5, scope: !1105)
!1205 = !DILocation(line: 259, column: 10, scope: !1105)
!1206 = !DILocation(line: 268, column: 8, scope: !83)
!1207 = !DILocalVariable(name: "mytotal", scope: !83, file: !1, line: 269, type: !5)
!1208 = !DILocation(line: 269, column: 9, scope: !83)
!1209 = !DILocalVariable(name: "k", scope: !1210, file: !1, line: 270, type: !6)
!1210 = distinct !DILexicalBlock(scope: !83, file: !1, line: 270, column: 3)
!1211 = !DILocation(line: 270, column: 12, scope: !1210)
!1212 = !DILocation(line: 270, column: 16, scope: !1210)
!1213 = !DILocation(line: 270, column: 8, scope: !1210)
!1214 = !DILocation(line: 270, column: 20, scope: !1215)
!1215 = !DILexicalBlockFile(scope: !1216, file: !1, discriminator: 1)
!1216 = distinct !DILexicalBlock(scope: !1210, file: !1, line: 270, column: 3)
!1217 = !DILocation(line: 270, column: 24, scope: !1215)
!1218 = !DILocation(line: 270, column: 22, scope: !1215)
!1219 = !DILocation(line: 270, column: 3, scope: !1215)
!1220 = !DILocation(line: 271, column: 26, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1216, file: !1, line: 270, column: 35)
!1222 = !DILocation(line: 271, column: 16, scope: !1221)
!1223 = !DILocation(line: 271, column: 24, scope: !1221)
!1224 = !DILocation(line: 271, column: 29, scope: !1221)
!1225 = !DILocation(line: 271, column: 13, scope: !1221)
!1226 = !DILocation(line: 272, column: 3, scope: !1221)
!1227 = !DILocation(line: 270, column: 29, scope: !1228)
!1228 = !DILexicalBlockFile(scope: !1216, file: !1, discriminator: 2)
!1229 = !DILocation(line: 270, column: 3, scope: !1228)
!1230 = distinct !{!1230, !1231}
!1231 = !DILocation(line: 270, column: 3, scope: !83)
!1232 = !DILocation(line: 273, column: 16, scope: !83)
!1233 = !DILocation(line: 273, column: 9, scope: !83)
!1234 = !DILocation(line: 273, column: 3, scope: !83)
!1235 = !DILocation(line: 273, column: 14, scope: !83)
!1236 = !DILocation(line: 278, column: 7, scope: !1237)
!1237 = distinct !DILexicalBlock(scope: !83, file: !1, line: 278, column: 7)
!1238 = !DILocation(line: 278, column: 11, scope: !1237)
!1239 = !DILocation(line: 278, column: 7, scope: !83)
!1240 = !DILocation(line: 280, column: 17, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1237, file: !1, line: 279, column: 5)
!1242 = !DILocation(line: 280, column: 21, scope: !1241)
!1243 = !DILocation(line: 280, column: 20, scope: !1241)
!1244 = !DILocation(line: 280, column: 19, scope: !1241)
!1245 = !DILocation(line: 280, column: 18, scope: !1241)
!1246 = !DILocation(line: 280, column: 16, scope: !1241)
!1247 = !DILocalVariable(name: "i", scope: !1248, file: !1, line: 281, type: !6)
!1248 = distinct !DILexicalBlock(scope: !1241, file: !1, line: 281, column: 7)
!1249 = !DILocation(line: 281, column: 16, scope: !1248)
!1250 = !DILocation(line: 281, column: 12, scope: !1248)
!1251 = !DILocation(line: 281, column: 23, scope: !1252)
!1252 = !DILexicalBlockFile(scope: !1253, file: !1, discriminator: 1)
!1253 = distinct !DILexicalBlock(scope: !1248, file: !1, line: 281, column: 7)
!1254 = !DILocation(line: 281, column: 27, scope: !1252)
!1255 = !DILocation(line: 281, column: 25, scope: !1252)
!1256 = !DILocation(line: 281, column: 7, scope: !1252)
!1257 = !DILocation(line: 283, column: 23, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1253, file: !1, line: 282, column: 2)
!1259 = !DILocation(line: 283, column: 17, scope: !1258)
!1260 = !DILocation(line: 283, column: 14, scope: !1258)
!1261 = !DILocation(line: 284, column: 2, scope: !1258)
!1262 = !DILocation(line: 281, column: 35, scope: !1263)
!1263 = !DILexicalBlockFile(scope: !1253, file: !1, discriminator: 2)
!1264 = !DILocation(line: 281, column: 7, scope: !1263)
!1265 = distinct !{!1265, !1266}
!1266 = !DILocation(line: 281, column: 7, scope: !1241)
!1267 = !DILocation(line: 285, column: 12, scope: !1241)
!1268 = !DILocation(line: 285, column: 7, scope: !1241)
!1269 = !DILocation(line: 286, column: 5, scope: !1241)
!1270 = !DILocalVariable(name: "t2", scope: !83, file: !1, line: 301, type: !69)
!1271 = !DILocation(line: 301, column: 10, scope: !83)
!1272 = !DILocation(line: 301, column: 15, scope: !83)
!1273 = !DILocation(line: 302, column: 7, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !83, file: !1, line: 302, column: 7)
!1275 = !DILocation(line: 302, column: 10, scope: !1274)
!1276 = !DILocation(line: 302, column: 7, scope: !83)
!1277 = !DILocation(line: 303, column: 20, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1274, file: !1, line: 302, column: 17)
!1279 = !DILocation(line: 303, column: 24, scope: !1278)
!1280 = !DILocation(line: 303, column: 23, scope: !1278)
!1281 = !DILocation(line: 303, column: 17, scope: !1278)
!1282 = !DILocation(line: 304, column: 3, scope: !1278)
!1283 = !DILocation(line: 306, column: 10, scope: !83)
!1284 = !DILocation(line: 306, column: 3, scope: !83)
!1285 = distinct !DISubprogram(name: "pFL", linkageName: "_Z3pFLP6PointsPiifPliflfiP17pthread_barrier_t", scope: !1, file: !1, line: 317, type: !1286, isLocal: false, isDefinition: true, scopeLine: 320, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{!5, !16, !7, !6, !5, !34, !6, !5, !8, !5, !6, !37}
!1288 = !DILocalVariable(name: "points", arg: 1, scope: !1285, file: !1, line: 317, type: !16)
!1289 = !DILocation(line: 317, column: 19, scope: !1285)
!1290 = !DILocalVariable(name: "feasible", arg: 2, scope: !1285, file: !1, line: 317, type: !7)
!1291 = !DILocation(line: 317, column: 32, scope: !1285)
!1292 = !DILocalVariable(name: "numfeasible", arg: 3, scope: !1285, file: !1, line: 317, type: !6)
!1293 = !DILocation(line: 317, column: 46, scope: !1285)
!1294 = !DILocalVariable(name: "z", arg: 4, scope: !1285, file: !1, line: 318, type: !5)
!1295 = !DILocation(line: 318, column: 10, scope: !1285)
!1296 = !DILocalVariable(name: "k", arg: 5, scope: !1285, file: !1, line: 318, type: !34)
!1297 = !DILocation(line: 318, column: 19, scope: !1285)
!1298 = !DILocalVariable(name: "kmax", arg: 6, scope: !1285, file: !1, line: 318, type: !6)
!1299 = !DILocation(line: 318, column: 26, scope: !1285)
!1300 = !DILocalVariable(name: "cost", arg: 7, scope: !1285, file: !1, line: 318, type: !5)
!1301 = !DILocation(line: 318, column: 38, scope: !1285)
!1302 = !DILocalVariable(name: "iter", arg: 8, scope: !1285, file: !1, line: 318, type: !8)
!1303 = !DILocation(line: 318, column: 49, scope: !1285)
!1304 = !DILocalVariable(name: "e", arg: 9, scope: !1285, file: !1, line: 318, type: !5)
!1305 = !DILocation(line: 318, column: 61, scope: !1285)
!1306 = !DILocalVariable(name: "pid", arg: 10, scope: !1285, file: !1, line: 319, type: !6)
!1307 = !DILocation(line: 319, column: 8, scope: !1285)
!1308 = !DILocalVariable(name: "barrier", arg: 11, scope: !1285, file: !1, line: 319, type: !37)
!1309 = !DILocation(line: 319, column: 32, scope: !1285)
!1310 = !DILocalVariable(name: "i", scope: !1285, file: !1, line: 324, type: !8)
!1311 = !DILocation(line: 324, column: 8, scope: !1285)
!1312 = !DILocalVariable(name: "x", scope: !1285, file: !1, line: 325, type: !8)
!1313 = !DILocation(line: 325, column: 8, scope: !1285)
!1314 = !DILocalVariable(name: "change", scope: !1285, file: !1, line: 326, type: !5)
!1315 = !DILocation(line: 326, column: 9, scope: !1285)
!1316 = !DILocalVariable(name: "numberOfPoints", scope: !1285, file: !1, line: 327, type: !8)
!1317 = !DILocation(line: 327, column: 8, scope: !1285)
!1318 = !DILocation(line: 329, column: 12, scope: !1285)
!1319 = !DILocation(line: 329, column: 10, scope: !1285)
!1320 = !DILocation(line: 332, column: 3, scope: !1285)
!1321 = !DILocation(line: 332, column: 10, scope: !1322)
!1322 = !DILexicalBlockFile(scope: !1285, file: !1, discriminator: 1)
!1323 = !DILocation(line: 332, column: 17, scope: !1322)
!1324 = !DILocation(line: 332, column: 16, scope: !1322)
!1325 = !DILocation(line: 332, column: 28, scope: !1322)
!1326 = !DILocation(line: 332, column: 27, scope: !1322)
!1327 = !DILocation(line: 332, column: 22, scope: !1322)
!1328 = !DILocation(line: 332, column: 3, scope: !1322)
!1329 = !DILocation(line: 333, column: 12, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1285, file: !1, line: 332, column: 31)
!1331 = !DILocation(line: 334, column: 22, scope: !1330)
!1332 = !DILocation(line: 334, column: 30, scope: !1330)
!1333 = !DILocation(line: 334, column: 20, scope: !1330)
!1334 = !DILocation(line: 337, column: 9, scope: !1335)
!1335 = distinct !DILexicalBlock(scope: !1330, file: !1, line: 337, column: 9)
!1336 = !DILocation(line: 337, column: 13, scope: !1335)
!1337 = !DILocation(line: 337, column: 9, scope: !1330)
!1338 = !DILocation(line: 338, column: 18, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1335, file: !1, line: 337, column: 20)
!1340 = !DILocation(line: 338, column: 28, scope: !1339)
!1341 = !DILocation(line: 338, column: 7, scope: !1339)
!1342 = !DILocation(line: 339, column: 5, scope: !1339)
!1343 = !DILocation(line: 344, column: 11, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1330, file: !1, line: 344, column: 5)
!1345 = !DILocation(line: 344, column: 10, scope: !1344)
!1346 = !DILocation(line: 344, column: 14, scope: !1347)
!1347 = !DILexicalBlockFile(scope: !1348, file: !1, discriminator: 1)
!1348 = distinct !DILexicalBlock(scope: !1344, file: !1, line: 344, column: 5)
!1349 = !DILocation(line: 344, column: 16, scope: !1347)
!1350 = !DILocation(line: 344, column: 15, scope: !1347)
!1351 = !DILocation(line: 344, column: 5, scope: !1347)
!1352 = !DILocation(line: 345, column: 10, scope: !1353)
!1353 = distinct !DILexicalBlock(scope: !1348, file: !1, line: 344, column: 26)
!1354 = !DILocation(line: 345, column: 12, scope: !1353)
!1355 = !DILocation(line: 345, column: 11, scope: !1353)
!1356 = !DILocation(line: 345, column: 8, scope: !1353)
!1357 = !DILocation(line: 346, column: 31, scope: !1353)
!1358 = !DILocation(line: 346, column: 22, scope: !1353)
!1359 = !DILocation(line: 346, column: 35, scope: !1353)
!1360 = !DILocation(line: 346, column: 43, scope: !1353)
!1361 = !DILocation(line: 346, column: 46, scope: !1353)
!1362 = !DILocation(line: 346, column: 49, scope: !1353)
!1363 = !DILocation(line: 346, column: 55, scope: !1353)
!1364 = !DILocation(line: 346, column: 66, scope: !1353)
!1365 = !DILocation(line: 346, column: 80, scope: !1353)
!1366 = !DILocation(line: 346, column: 99, scope: !1353)
!1367 = !DILocation(line: 346, column: 16, scope: !1353)
!1368 = !DILocation(line: 346, column: 13, scope: !1353)
!1369 = !DILocation(line: 348, column: 5, scope: !1353)
!1370 = !DILocation(line: 344, column: 22, scope: !1371)
!1371 = !DILexicalBlockFile(scope: !1348, file: !1, discriminator: 2)
!1372 = !DILocation(line: 344, column: 5, scope: !1371)
!1373 = distinct !{!1373, !1374}
!1374 = !DILocation(line: 344, column: 5, scope: !1330)
!1375 = !DILocation(line: 350, column: 13, scope: !1330)
!1376 = !DILocation(line: 350, column: 10, scope: !1330)
!1377 = !DILocation(line: 332, column: 3, scope: !1378)
!1378 = !DILexicalBlockFile(scope: !1285, file: !1, discriminator: 2)
!1379 = distinct !{!1379, !1320}
!1380 = !DILocation(line: 361, column: 10, scope: !1285)
!1381 = !DILocation(line: 361, column: 3, scope: !1285)
!1382 = distinct !DISubprogram(name: "selectfeasible_fast", linkageName: "_Z19selectfeasible_fastP6PointsPPiiiP17pthread_barrier_t", scope: !1, file: !1, line: 364, type: !1383, isLocal: false, isDefinition: true, scopeLine: 365, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!1383 = !DISubroutineType(types: !1384)
!1384 = !{!6, !16, !1385, !6, !6, !37}
!1385 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!1386 = !DILocalVariable(name: "points", arg: 1, scope: !1382, file: !1, line: 364, type: !16)
!1387 = !DILocation(line: 364, column: 33, scope: !1382)
!1388 = !DILocalVariable(name: "feasible", arg: 2, scope: !1382, file: !1, line: 364, type: !1385)
!1389 = !DILocation(line: 364, column: 47, scope: !1382)
!1390 = !DILocalVariable(name: "kmin", arg: 3, scope: !1382, file: !1, line: 364, type: !6)
!1391 = !DILocation(line: 364, column: 61, scope: !1382)
!1392 = !DILocalVariable(name: "pid", arg: 4, scope: !1382, file: !1, line: 364, type: !6)
!1393 = !DILocation(line: 364, column: 71, scope: !1382)
!1394 = !DILocalVariable(name: "barrier", arg: 5, scope: !1382, file: !1, line: 364, type: !37)
!1395 = !DILocation(line: 364, column: 95, scope: !1382)
!1396 = !DILocalVariable(name: "t1", scope: !1382, file: !1, line: 367, type: !69)
!1397 = !DILocation(line: 367, column: 10, scope: !1382)
!1398 = !DILocation(line: 367, column: 15, scope: !1382)
!1399 = !DILocalVariable(name: "numfeasible", scope: !1382, file: !1, line: 370, type: !6)
!1400 = !DILocation(line: 370, column: 7, scope: !1382)
!1401 = !DILocation(line: 370, column: 21, scope: !1382)
!1402 = !DILocation(line: 370, column: 29, scope: !1382)
!1403 = !DILocation(line: 371, column: 7, scope: !1404)
!1404 = distinct !DILexicalBlock(scope: !1382, file: !1, line: 371, column: 7)
!1405 = !DILocation(line: 371, column: 27, scope: !1404)
!1406 = !DILocation(line: 371, column: 26, scope: !1404)
!1407 = !DILocation(line: 371, column: 22, scope: !1404)
!1408 = !DILocation(line: 371, column: 43, scope: !1404)
!1409 = !DILocation(line: 371, column: 36, scope: !1404)
!1410 = !DILocation(line: 371, column: 32, scope: !1404)
!1411 = !DILocation(line: 371, column: 31, scope: !1404)
!1412 = !DILocation(line: 371, column: 19, scope: !1404)
!1413 = !DILocation(line: 371, column: 7, scope: !1382)
!1414 = !DILocation(line: 372, column: 30, scope: !1404)
!1415 = !DILocation(line: 372, column: 29, scope: !1404)
!1416 = !DILocation(line: 372, column: 25, scope: !1404)
!1417 = !DILocation(line: 372, column: 46, scope: !1404)
!1418 = !DILocation(line: 372, column: 39, scope: !1404)
!1419 = !DILocation(line: 372, column: 35, scope: !1404)
!1420 = !DILocation(line: 372, column: 34, scope: !1404)
!1421 = !DILocation(line: 372, column: 24, scope: !1404)
!1422 = !DILocation(line: 372, column: 17, scope: !1404)
!1423 = !DILocation(line: 372, column: 5, scope: !1404)
!1424 = !DILocation(line: 373, column: 29, scope: !1382)
!1425 = !DILocation(line: 373, column: 40, scope: !1382)
!1426 = !DILocation(line: 373, column: 22, scope: !1382)
!1427 = !DILocation(line: 373, column: 15, scope: !1382)
!1428 = !DILocation(line: 373, column: 4, scope: !1382)
!1429 = !DILocation(line: 373, column: 13, scope: !1382)
!1430 = !DILocalVariable(name: "accumweight", scope: !1382, file: !1, line: 375, type: !4)
!1431 = !DILocation(line: 375, column: 10, scope: !1382)
!1432 = !DILocalVariable(name: "totalweight", scope: !1382, file: !1, line: 376, type: !5)
!1433 = !DILocation(line: 376, column: 9, scope: !1382)
!1434 = !DILocalVariable(name: "k1", scope: !1382, file: !1, line: 388, type: !8)
!1435 = !DILocation(line: 388, column: 8, scope: !1382)
!1436 = !DILocalVariable(name: "k2", scope: !1382, file: !1, line: 389, type: !8)
!1437 = !DILocation(line: 389, column: 8, scope: !1382)
!1438 = !DILocation(line: 389, column: 13, scope: !1382)
!1439 = !DILocalVariable(name: "w", scope: !1382, file: !1, line: 391, type: !5)
!1440 = !DILocation(line: 391, column: 9, scope: !1382)
!1441 = !DILocalVariable(name: "l", scope: !1382, file: !1, line: 392, type: !6)
!1442 = !DILocation(line: 392, column: 7, scope: !1382)
!1443 = !DILocalVariable(name: "r", scope: !1382, file: !1, line: 392, type: !6)
!1444 = !DILocation(line: 392, column: 9, scope: !1382)
!1445 = !DILocalVariable(name: "k", scope: !1382, file: !1, line: 392, type: !6)
!1446 = !DILocation(line: 392, column: 11, scope: !1382)
!1447 = !DILocation(line: 395, column: 7, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1382, file: !1, line: 395, column: 7)
!1449 = !DILocation(line: 395, column: 22, scope: !1448)
!1450 = !DILocation(line: 395, column: 30, scope: !1448)
!1451 = !DILocation(line: 395, column: 19, scope: !1448)
!1452 = !DILocation(line: 395, column: 7, scope: !1382)
!1453 = !DILocalVariable(name: "i", scope: !1454, file: !1, line: 396, type: !6)
!1454 = distinct !DILexicalBlock(scope: !1455, file: !1, line: 396, column: 5)
!1455 = distinct !DILexicalBlock(scope: !1448, file: !1, line: 395, column: 35)
!1456 = !DILocation(line: 396, column: 14, scope: !1454)
!1457 = !DILocation(line: 396, column: 16, scope: !1454)
!1458 = !DILocation(line: 396, column: 10, scope: !1454)
!1459 = !DILocation(line: 396, column: 19, scope: !1460)
!1460 = !DILexicalBlockFile(scope: !1461, file: !1, discriminator: 1)
!1461 = distinct !DILexicalBlock(scope: !1454, file: !1, line: 396, column: 5)
!1462 = !DILocation(line: 396, column: 21, scope: !1460)
!1463 = !DILocation(line: 396, column: 20, scope: !1460)
!1464 = !DILocation(line: 396, column: 5, scope: !1460)
!1465 = !DILocation(line: 397, column: 24, scope: !1461)
!1466 = !DILocation(line: 397, column: 19, scope: !1461)
!1467 = !DILocation(line: 397, column: 7, scope: !1461)
!1468 = !DILocation(line: 397, column: 9, scope: !1461)
!1469 = !DILocation(line: 397, column: 8, scope: !1461)
!1470 = !DILocation(line: 397, column: 22, scope: !1461)
!1471 = !DILocation(line: 396, column: 25, scope: !1472)
!1472 = !DILexicalBlockFile(scope: !1461, file: !1, discriminator: 2)
!1473 = !DILocation(line: 396, column: 5, scope: !1472)
!1474 = distinct !{!1474, !1475}
!1475 = !DILocation(line: 396, column: 5, scope: !1455)
!1476 = !DILocation(line: 398, column: 12, scope: !1455)
!1477 = !DILocation(line: 398, column: 5, scope: !1455)
!1478 = !DILocation(line: 401, column: 45, scope: !1382)
!1479 = !DILocation(line: 401, column: 53, scope: !1382)
!1480 = !DILocation(line: 401, column: 44, scope: !1382)
!1481 = !DILocation(line: 401, column: 24, scope: !1382)
!1482 = !DILocation(line: 401, column: 16, scope: !1382)
!1483 = !DILocation(line: 401, column: 14, scope: !1382)
!1484 = !DILocation(line: 402, column: 20, scope: !1382)
!1485 = !DILocation(line: 402, column: 28, scope: !1382)
!1486 = !DILocation(line: 402, column: 33, scope: !1382)
!1487 = !DILocation(line: 402, column: 3, scope: !1382)
!1488 = !DILocation(line: 402, column: 18, scope: !1382)
!1489 = !DILocation(line: 403, column: 14, scope: !1382)
!1490 = !DILocalVariable(name: "i", scope: !1491, file: !1, line: 404, type: !6)
!1491 = distinct !DILexicalBlock(scope: !1382, file: !1, line: 404, column: 3)
!1492 = !DILocation(line: 404, column: 12, scope: !1491)
!1493 = !DILocation(line: 404, column: 8, scope: !1491)
!1494 = !DILocation(line: 404, column: 19, scope: !1495)
!1495 = !DILexicalBlockFile(scope: !1496, file: !1, discriminator: 1)
!1496 = distinct !DILexicalBlock(scope: !1491, file: !1, line: 404, column: 3)
!1497 = !DILocation(line: 404, column: 23, scope: !1495)
!1498 = !DILocation(line: 404, column: 31, scope: !1495)
!1499 = !DILocation(line: 404, column: 21, scope: !1495)
!1500 = !DILocation(line: 404, column: 3, scope: !1495)
!1501 = !DILocation(line: 405, column: 34, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1496, file: !1, line: 404, column: 42)
!1503 = !DILocation(line: 405, column: 35, scope: !1502)
!1504 = !DILocation(line: 405, column: 22, scope: !1502)
!1505 = !DILocation(line: 405, column: 51, scope: !1502)
!1506 = !DILocation(line: 405, column: 41, scope: !1502)
!1507 = !DILocation(line: 405, column: 49, scope: !1502)
!1508 = !DILocation(line: 405, column: 54, scope: !1502)
!1509 = !DILocation(line: 405, column: 39, scope: !1502)
!1510 = !DILocation(line: 405, column: 17, scope: !1502)
!1511 = !DILocation(line: 405, column: 5, scope: !1502)
!1512 = !DILocation(line: 405, column: 20, scope: !1502)
!1513 = !DILocation(line: 406, column: 3, scope: !1502)
!1514 = !DILocation(line: 404, column: 37, scope: !1515)
!1515 = !DILexicalBlockFile(scope: !1496, file: !1, discriminator: 2)
!1516 = !DILocation(line: 404, column: 3, scope: !1515)
!1517 = distinct !{!1517, !1518}
!1518 = !DILocation(line: 404, column: 3, scope: !1382)
!1519 = !DILocation(line: 407, column: 27, scope: !1382)
!1520 = !DILocation(line: 407, column: 35, scope: !1382)
!1521 = !DILocation(line: 407, column: 38, scope: !1382)
!1522 = !DILocation(line: 407, column: 15, scope: !1382)
!1523 = !DILocation(line: 407, column: 14, scope: !1382)
!1524 = !DILocalVariable(name: "i", scope: !1525, file: !1, line: 409, type: !6)
!1525 = distinct !DILexicalBlock(scope: !1382, file: !1, line: 409, column: 3)
!1526 = !DILocation(line: 409, column: 11, scope: !1525)
!1527 = !DILocation(line: 409, column: 13, scope: !1525)
!1528 = !DILocation(line: 409, column: 7, scope: !1525)
!1529 = !DILocation(line: 409, column: 17, scope: !1530)
!1530 = !DILexicalBlockFile(scope: !1531, file: !1, discriminator: 1)
!1531 = distinct !DILexicalBlock(scope: !1525, file: !1, line: 409, column: 3)
!1532 = !DILocation(line: 409, column: 19, scope: !1530)
!1533 = !DILocation(line: 409, column: 18, scope: !1530)
!1534 = !DILocation(line: 409, column: 3, scope: !1530)
!1535 = !DILocation(line: 410, column: 10, scope: !1536)
!1536 = distinct !DILexicalBlock(scope: !1531, file: !1, line: 409, column: 29)
!1537 = !DILocation(line: 410, column: 19, scope: !1536)
!1538 = !DILocation(line: 410, column: 36, scope: !1536)
!1539 = !DILocation(line: 410, column: 35, scope: !1536)
!1540 = !DILocation(line: 410, column: 7, scope: !1536)
!1541 = !DILocation(line: 412, column: 6, scope: !1536)
!1542 = !DILocation(line: 413, column: 7, scope: !1536)
!1543 = !DILocation(line: 413, column: 15, scope: !1536)
!1544 = !DILocation(line: 413, column: 18, scope: !1536)
!1545 = !DILocation(line: 413, column: 6, scope: !1536)
!1546 = !DILocation(line: 414, column: 9, scope: !1547)
!1547 = distinct !DILexicalBlock(scope: !1536, file: !1, line: 414, column: 9)
!1548 = !DILocation(line: 414, column: 26, scope: !1547)
!1549 = !DILocation(line: 414, column: 24, scope: !1547)
!1550 = !DILocation(line: 414, column: 9, scope: !1536)
!1551 = !DILocation(line: 415, column: 19, scope: !1552)
!1552 = distinct !DILexicalBlock(scope: !1547, file: !1, line: 414, column: 31)
!1553 = !DILocation(line: 415, column: 7, scope: !1552)
!1554 = !DILocation(line: 415, column: 9, scope: !1552)
!1555 = !DILocation(line: 415, column: 8, scope: !1552)
!1556 = !DILocation(line: 415, column: 21, scope: !1552)
!1557 = !DILocation(line: 416, column: 7, scope: !1552)
!1558 = !DILocation(line: 418, column: 5, scope: !1536)
!1559 = !DILocation(line: 418, column: 12, scope: !1560)
!1560 = !DILexicalBlockFile(scope: !1536, file: !1, discriminator: 1)
!1561 = !DILocation(line: 418, column: 13, scope: !1560)
!1562 = !DILocation(line: 418, column: 18, scope: !1560)
!1563 = !DILocation(line: 418, column: 16, scope: !1560)
!1564 = !DILocation(line: 418, column: 5, scope: !1560)
!1565 = !DILocation(line: 419, column: 12, scope: !1566)
!1566 = distinct !DILexicalBlock(scope: !1536, file: !1, line: 418, column: 22)
!1567 = !DILocation(line: 419, column: 14, scope: !1566)
!1568 = !DILocation(line: 419, column: 13, scope: !1566)
!1569 = !DILocation(line: 419, column: 16, scope: !1566)
!1570 = !DILocation(line: 419, column: 9, scope: !1566)
!1571 = !DILocation(line: 420, column: 23, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1566, file: !1, line: 420, column: 11)
!1573 = !DILocation(line: 420, column: 11, scope: !1572)
!1574 = !DILocation(line: 420, column: 28, scope: !1572)
!1575 = !DILocation(line: 420, column: 26, scope: !1572)
!1576 = !DILocation(line: 420, column: 11, scope: !1566)
!1577 = !DILocation(line: 421, column: 6, scope: !1578)
!1578 = distinct !DILexicalBlock(scope: !1572, file: !1, line: 420, column: 32)
!1579 = !DILocation(line: 421, column: 4, scope: !1578)
!1580 = !DILocation(line: 422, column: 7, scope: !1578)
!1581 = !DILocation(line: 424, column: 4, scope: !1582)
!1582 = distinct !DILexicalBlock(scope: !1572, file: !1, line: 423, column: 12)
!1583 = !DILocation(line: 424, column: 3, scope: !1582)
!1584 = !DILocation(line: 418, column: 5, scope: !1585)
!1585 = !DILexicalBlockFile(scope: !1536, file: !1, discriminator: 2)
!1586 = distinct !{!1586, !1558}
!1587 = !DILocation(line: 427, column: 20, scope: !1536)
!1588 = !DILocation(line: 427, column: 17, scope: !1536)
!1589 = !DILocation(line: 427, column: 5, scope: !1536)
!1590 = !DILocation(line: 427, column: 7, scope: !1536)
!1591 = !DILocation(line: 427, column: 6, scope: !1536)
!1592 = !DILocation(line: 427, column: 19, scope: !1536)
!1593 = !DILocation(line: 428, column: 3, scope: !1536)
!1594 = !DILocation(line: 409, column: 24, scope: !1595)
!1595 = !DILexicalBlockFile(scope: !1531, file: !1, discriminator: 2)
!1596 = !DILocation(line: 409, column: 3, scope: !1595)
!1597 = distinct !{!1597, !1598}
!1598 = !DILocation(line: 409, column: 3, scope: !1382)
!1599 = !DILocation(line: 430, column: 8, scope: !1382)
!1600 = !DILocation(line: 430, column: 3, scope: !1382)
!1601 = !DILocalVariable(name: "t2", scope: !1382, file: !1, line: 433, type: !69)
!1602 = !DILocation(line: 433, column: 10, scope: !1382)
!1603 = !DILocation(line: 433, column: 15, scope: !1382)
!1604 = !DILocation(line: 434, column: 27, scope: !1382)
!1605 = !DILocation(line: 434, column: 30, scope: !1382)
!1606 = !DILocation(line: 434, column: 29, scope: !1382)
!1607 = !DILocation(line: 434, column: 24, scope: !1382)
!1608 = !DILocation(line: 436, column: 10, scope: !1382)
!1609 = !DILocation(line: 436, column: 3, scope: !1382)
!1610 = !DILocation(line: 437, column: 1, scope: !1382)
!1611 = !DILocalVariable(name: "points", arg: 1, scope: !90, file: !1, line: 440, type: !16)
!1612 = !DILocation(line: 440, column: 24, scope: !90)
!1613 = !DILocalVariable(name: "kmin", arg: 2, scope: !90, file: !1, line: 440, type: !8)
!1614 = !DILocation(line: 440, column: 37, scope: !90)
!1615 = !DILocalVariable(name: "kmax", arg: 3, scope: !90, file: !1, line: 440, type: !8)
!1616 = !DILocation(line: 440, column: 48, scope: !90)
!1617 = !DILocalVariable(name: "kfinal", arg: 4, scope: !90, file: !1, line: 440, type: !34)
!1618 = !DILocation(line: 440, column: 60, scope: !90)
!1619 = !DILocalVariable(name: "pid", arg: 5, scope: !90, file: !1, line: 441, type: !6)
!1620 = !DILocation(line: 441, column: 13, scope: !90)
!1621 = !DILocalVariable(name: "barrier", arg: 6, scope: !90, file: !1, line: 441, type: !37)
!1622 = !DILocation(line: 441, column: 37, scope: !90)
!1623 = !DILocalVariable(name: "i", scope: !90, file: !1, line: 443, type: !6)
!1624 = !DILocation(line: 443, column: 7, scope: !90)
!1625 = !DILocalVariable(name: "cost", scope: !90, file: !1, line: 444, type: !5)
!1626 = !DILocation(line: 444, column: 9, scope: !90)
!1627 = !DILocalVariable(name: "lastcost", scope: !90, file: !1, line: 445, type: !5)
!1628 = !DILocation(line: 445, column: 9, scope: !90)
!1629 = !DILocalVariable(name: "hiz", scope: !90, file: !1, line: 446, type: !5)
!1630 = !DILocation(line: 446, column: 9, scope: !90)
!1631 = !DILocalVariable(name: "loz", scope: !90, file: !1, line: 446, type: !5)
!1632 = !DILocation(line: 446, column: 14, scope: !90)
!1633 = !DILocalVariable(name: "z", scope: !90, file: !1, line: 446, type: !5)
!1634 = !DILocation(line: 446, column: 19, scope: !90)
!1635 = !DILocation(line: 453, column: 7, scope: !1636)
!1636 = distinct !DILexicalBlock(scope: !90, file: !1, line: 453, column: 7)
!1637 = !DILocation(line: 453, column: 10, scope: !1636)
!1638 = !DILocation(line: 453, column: 7, scope: !90)
!1639 = !DILocation(line: 453, column: 38, scope: !1640)
!1640 = !DILexicalBlockFile(scope: !1636, file: !1, discriminator: 1)
!1641 = !DILocation(line: 453, column: 31, scope: !1640)
!1642 = !DILocation(line: 453, column: 23, scope: !1640)
!1643 = !DILocation(line: 453, column: 21, scope: !1640)
!1644 = !DILocation(line: 453, column: 16, scope: !1640)
!1645 = !DILocation(line: 454, column: 13, scope: !90)
!1646 = !DILocation(line: 454, column: 7, scope: !90)
!1647 = !DILocalVariable(name: "numberOfPoints", scope: !90, file: !1, line: 455, type: !8)
!1648 = !DILocation(line: 455, column: 8, scope: !90)
!1649 = !DILocation(line: 455, column: 25, scope: !90)
!1650 = !DILocation(line: 455, column: 33, scope: !90)
!1651 = !DILocalVariable(name: "ptDimension", scope: !90, file: !1, line: 456, type: !8)
!1652 = !DILocation(line: 456, column: 8, scope: !90)
!1653 = !DILocation(line: 456, column: 22, scope: !90)
!1654 = !DILocation(line: 456, column: 30, scope: !90)
!1655 = !DILocalVariable(name: "bsize", scope: !90, file: !1, line: 459, type: !8)
!1656 = !DILocation(line: 459, column: 8, scope: !90)
!1657 = !DILocation(line: 459, column: 16, scope: !90)
!1658 = !DILocation(line: 459, column: 24, scope: !90)
!1659 = !DILocation(line: 459, column: 28, scope: !90)
!1660 = !DILocation(line: 459, column: 27, scope: !90)
!1661 = !DILocalVariable(name: "k1", scope: !90, file: !1, line: 460, type: !8)
!1662 = !DILocation(line: 460, column: 8, scope: !90)
!1663 = !DILocation(line: 460, column: 13, scope: !90)
!1664 = !DILocation(line: 460, column: 21, scope: !90)
!1665 = !DILocation(line: 460, column: 19, scope: !90)
!1666 = !DILocalVariable(name: "k2", scope: !90, file: !1, line: 461, type: !8)
!1667 = !DILocation(line: 461, column: 8, scope: !90)
!1668 = !DILocation(line: 461, column: 13, scope: !90)
!1669 = !DILocation(line: 461, column: 18, scope: !90)
!1670 = !DILocation(line: 461, column: 16, scope: !90)
!1671 = !DILocation(line: 462, column: 7, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !90, file: !1, line: 462, column: 7)
!1673 = !DILocation(line: 462, column: 14, scope: !1672)
!1674 = !DILocation(line: 462, column: 19, scope: !1672)
!1675 = !DILocation(line: 462, column: 11, scope: !1672)
!1676 = !DILocation(line: 462, column: 7, scope: !90)
!1677 = !DILocation(line: 462, column: 29, scope: !1678)
!1678 = !DILexicalBlockFile(scope: !1672, file: !1, discriminator: 1)
!1679 = !DILocation(line: 462, column: 37, scope: !1678)
!1680 = !DILocation(line: 462, column: 27, scope: !1678)
!1681 = !DILocation(line: 462, column: 24, scope: !1678)
!1682 = !DILocalVariable(name: "myhiz", scope: !90, file: !1, line: 476, type: !5)
!1683 = !DILocation(line: 476, column: 9, scope: !90)
!1684 = !DILocalVariable(name: "kk", scope: !1685, file: !1, line: 477, type: !8)
!1685 = distinct !DILexicalBlock(scope: !90, file: !1, line: 477, column: 3)
!1686 = !DILocation(line: 477, column: 13, scope: !1685)
!1687 = !DILocation(line: 477, column: 16, scope: !1685)
!1688 = !DILocation(line: 477, column: 8, scope: !1685)
!1689 = !DILocation(line: 477, column: 19, scope: !1690)
!1690 = !DILexicalBlockFile(scope: !1691, file: !1, discriminator: 1)
!1691 = distinct !DILexicalBlock(scope: !1685, file: !1, line: 477, column: 3)
!1692 = !DILocation(line: 477, column: 24, scope: !1690)
!1693 = !DILocation(line: 477, column: 22, scope: !1690)
!1694 = !DILocation(line: 477, column: 3, scope: !1690)
!1695 = !DILocation(line: 478, column: 29, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1691, file: !1, line: 477, column: 35)
!1697 = !DILocation(line: 478, column: 19, scope: !1696)
!1698 = !DILocation(line: 478, column: 27, scope: !1696)
!1699 = !DILocation(line: 478, column: 34, scope: !1696)
!1700 = !DILocation(line: 478, column: 42, scope: !1696)
!1701 = !DILocation(line: 478, column: 34, scope: !1702)
!1702 = !DILexicalBlockFile(scope: !1696, file: !1, discriminator: 1)
!1703 = !DILocation(line: 479, column: 9, scope: !1696)
!1704 = !DILocation(line: 478, column: 14, scope: !1705)
!1705 = !DILexicalBlockFile(scope: !1696, file: !1, discriminator: 2)
!1706 = !DILocation(line: 479, column: 32, scope: !1696)
!1707 = !DILocation(line: 479, column: 22, scope: !1696)
!1708 = !DILocation(line: 479, column: 30, scope: !1696)
!1709 = !DILocation(line: 479, column: 36, scope: !1696)
!1710 = !DILocation(line: 479, column: 21, scope: !1696)
!1711 = !DILocation(line: 478, column: 11, scope: !1696)
!1712 = !DILocation(line: 480, column: 3, scope: !1696)
!1713 = !DILocation(line: 477, column: 30, scope: !1714)
!1714 = !DILexicalBlockFile(scope: !1691, file: !1, discriminator: 2)
!1715 = !DILocation(line: 477, column: 3, scope: !1714)
!1716 = distinct !{!1716, !1717}
!1717 = !DILocation(line: 477, column: 3, scope: !90)
!1718 = !DILocation(line: 481, column: 15, scope: !90)
!1719 = !DILocation(line: 481, column: 8, scope: !90)
!1720 = !DILocation(line: 481, column: 3, scope: !90)
!1721 = !DILocation(line: 481, column: 13, scope: !90)
!1722 = !DILocalVariable(name: "i", scope: !1723, file: !1, line: 487, type: !6)
!1723 = distinct !DILexicalBlock(scope: !90, file: !1, line: 487, column: 3)
!1724 = !DILocation(line: 487, column: 12, scope: !1723)
!1725 = !DILocation(line: 487, column: 8, scope: !1723)
!1726 = !DILocation(line: 487, column: 19, scope: !1727)
!1727 = !DILexicalBlockFile(scope: !1728, file: !1, discriminator: 1)
!1728 = distinct !DILexicalBlock(scope: !1723, file: !1, line: 487, column: 3)
!1729 = !DILocation(line: 487, column: 23, scope: !1727)
!1730 = !DILocation(line: 487, column: 21, scope: !1727)
!1731 = !DILocation(line: 487, column: 3, scope: !1727)
!1732 = !DILocation(line: 488, column: 17, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1728, file: !1, line: 487, column: 38)
!1734 = !DILocation(line: 488, column: 12, scope: !1733)
!1735 = !DILocation(line: 488, column: 9, scope: !1733)
!1736 = !DILocation(line: 489, column: 3, scope: !1733)
!1737 = !DILocation(line: 487, column: 31, scope: !1738)
!1738 = !DILexicalBlockFile(scope: !1728, file: !1, discriminator: 2)
!1739 = !DILocation(line: 487, column: 3, scope: !1738)
!1740 = distinct !{!1740, !1741}
!1741 = !DILocation(line: 487, column: 3, scope: !90)
!1742 = !DILocation(line: 491, column: 6, scope: !90)
!1743 = !DILocation(line: 491, column: 17, scope: !90)
!1744 = !DILocation(line: 491, column: 21, scope: !90)
!1745 = !DILocation(line: 491, column: 20, scope: !90)
!1746 = !DILocation(line: 491, column: 16, scope: !90)
!1747 = !DILocation(line: 491, column: 25, scope: !90)
!1748 = !DILocation(line: 491, column: 14, scope: !90)
!1749 = !DILocation(line: 493, column: 7, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !90, file: !1, line: 493, column: 7)
!1751 = !DILocation(line: 493, column: 15, scope: !1750)
!1752 = !DILocation(line: 493, column: 22, scope: !1750)
!1753 = !DILocation(line: 493, column: 19, scope: !1750)
!1754 = !DILocation(line: 493, column: 7, scope: !90)
!1755 = !DILocalVariable(name: "kk", scope: !1756, file: !1, line: 495, type: !8)
!1756 = distinct !DILexicalBlock(scope: !1757, file: !1, line: 495, column: 5)
!1757 = distinct !DILexicalBlock(scope: !1750, file: !1, line: 493, column: 28)
!1758 = !DILocation(line: 495, column: 15, scope: !1756)
!1759 = !DILocation(line: 495, column: 18, scope: !1756)
!1760 = !DILocation(line: 495, column: 10, scope: !1756)
!1761 = !DILocation(line: 495, column: 21, scope: !1762)
!1762 = !DILexicalBlockFile(scope: !1763, file: !1, discriminator: 1)
!1763 = distinct !DILexicalBlock(scope: !1756, file: !1, line: 495, column: 5)
!1764 = !DILocation(line: 495, column: 24, scope: !1762)
!1765 = !DILocation(line: 495, column: 23, scope: !1762)
!1766 = !DILocation(line: 495, column: 5, scope: !1762)
!1767 = !DILocation(line: 496, column: 30, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1763, file: !1, line: 495, column: 33)
!1769 = !DILocation(line: 496, column: 17, scope: !1768)
!1770 = !DILocation(line: 496, column: 7, scope: !1768)
!1771 = !DILocation(line: 496, column: 15, scope: !1768)
!1772 = !DILocation(line: 496, column: 21, scope: !1768)
!1773 = !DILocation(line: 496, column: 28, scope: !1768)
!1774 = !DILocation(line: 497, column: 17, scope: !1768)
!1775 = !DILocation(line: 497, column: 7, scope: !1768)
!1776 = !DILocation(line: 497, column: 15, scope: !1768)
!1777 = !DILocation(line: 497, column: 21, scope: !1768)
!1778 = !DILocation(line: 497, column: 26, scope: !1768)
!1779 = !DILocation(line: 498, column: 5, scope: !1768)
!1780 = !DILocation(line: 495, column: 29, scope: !1781)
!1781 = !DILexicalBlockFile(scope: !1763, file: !1, discriminator: 2)
!1782 = !DILocation(line: 495, column: 5, scope: !1781)
!1783 = distinct !{!1783, !1784}
!1784 = !DILocation(line: 495, column: 5, scope: !1757)
!1785 = !DILocation(line: 499, column: 10, scope: !1757)
!1786 = !DILocation(line: 500, column: 9, scope: !1787)
!1787 = distinct !DILexicalBlock(scope: !1757, file: !1, line: 500, column: 9)
!1788 = !DILocation(line: 500, column: 12, scope: !1787)
!1789 = !DILocation(line: 500, column: 9, scope: !1757)
!1790 = !DILocation(line: 501, column: 12, scope: !1791)
!1791 = distinct !DILexicalBlock(scope: !1787, file: !1, line: 500, column: 19)
!1792 = !DILocation(line: 501, column: 7, scope: !1791)
!1793 = !DILocation(line: 502, column: 17, scope: !1791)
!1794 = !DILocation(line: 502, column: 8, scope: !1791)
!1795 = !DILocation(line: 502, column: 15, scope: !1791)
!1796 = !DILocation(line: 503, column: 5, scope: !1791)
!1797 = !DILocation(line: 504, column: 12, scope: !1757)
!1798 = !DILocation(line: 504, column: 5, scope: !1757)
!1799 = !DILocation(line: 507, column: 7, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !90, file: !1, line: 507, column: 7)
!1801 = !DILocation(line: 507, column: 11, scope: !1800)
!1802 = !DILocation(line: 507, column: 7, scope: !90)
!1803 = !DILocation(line: 507, column: 26, scope: !1804)
!1804 = !DILexicalBlockFile(scope: !1800, file: !1, discriminator: 1)
!1805 = !DILocation(line: 507, column: 18, scope: !1804)
!1806 = !DILocation(line: 508, column: 18, scope: !90)
!1807 = !DILocation(line: 508, column: 26, scope: !90)
!1808 = !DILocation(line: 508, column: 33, scope: !90)
!1809 = !DILocation(line: 508, column: 38, scope: !90)
!1810 = !DILocation(line: 508, column: 10, scope: !90)
!1811 = !DILocation(line: 508, column: 8, scope: !90)
!1812 = !DILocation(line: 514, column: 4, scope: !90)
!1813 = !DILocation(line: 516, column: 3, scope: !90)
!1814 = !DILocation(line: 516, column: 11, scope: !1815)
!1815 = !DILexicalBlockFile(scope: !90, file: !1, discriminator: 1)
!1816 = !DILocation(line: 516, column: 15, scope: !1815)
!1817 = !DILocation(line: 516, column: 13, scope: !1815)
!1818 = !DILocation(line: 516, column: 20, scope: !1815)
!1819 = !DILocation(line: 516, column: 23, scope: !1820)
!1820 = !DILexicalBlockFile(scope: !90, file: !1, discriminator: 2)
!1821 = !DILocation(line: 516, column: 24, scope: !1820)
!1822 = !DILocation(line: 516, column: 3, scope: !1823)
!1823 = !DILexicalBlockFile(scope: !90, file: !1, discriminator: 3)
!1824 = !DILocation(line: 517, column: 20, scope: !1825)
!1825 = distinct !DILexicalBlock(scope: !90, file: !1, line: 516, column: 30)
!1826 = !DILocation(line: 517, column: 28, scope: !1825)
!1827 = !DILocation(line: 517, column: 35, scope: !1825)
!1828 = !DILocation(line: 517, column: 40, scope: !1825)
!1829 = !DILocation(line: 517, column: 12, scope: !1825)
!1830 = !DILocation(line: 517, column: 10, scope: !1825)
!1831 = !DILocation(line: 518, column: 6, scope: !1825)
!1832 = !DILocation(line: 516, column: 3, scope: !1833)
!1833 = !DILexicalBlockFile(scope: !90, file: !1, discriminator: 4)
!1834 = distinct !{!1834, !1813}
!1835 = !DILocation(line: 526, column: 3, scope: !90)
!1836 = !DILocation(line: 526, column: 10, scope: !1815)
!1837 = !DILocation(line: 526, column: 14, scope: !1815)
!1838 = !DILocation(line: 526, column: 12, scope: !1815)
!1839 = !DILocation(line: 526, column: 3, scope: !1815)
!1840 = !DILocation(line: 533, column: 9, scope: !1841)
!1841 = distinct !DILexicalBlock(scope: !1842, file: !1, line: 533, column: 9)
!1842 = distinct !DILexicalBlock(scope: !90, file: !1, line: 526, column: 20)
!1843 = !DILocation(line: 533, column: 11, scope: !1841)
!1844 = !DILocation(line: 533, column: 9, scope: !1842)
!1845 = !DILocation(line: 533, column: 23, scope: !1846)
!1846 = !DILexicalBlockFile(scope: !1847, file: !1, discriminator: 1)
!1847 = distinct !DILexicalBlock(scope: !1841, file: !1, line: 533, column: 18)
!1848 = !DILocation(line: 533, column: 22, scope: !1846)
!1849 = !DILocation(line: 533, column: 29, scope: !1846)
!1850 = !DILocation(line: 533, column: 33, scope: !1846)
!1851 = !DILocation(line: 533, column: 32, scope: !1846)
!1852 = !DILocation(line: 533, column: 28, scope: !1846)
!1853 = !DILocation(line: 533, column: 37, scope: !1846)
!1854 = !DILocation(line: 533, column: 27, scope: !1846)
!1855 = !DILocation(line: 533, column: 44, scope: !1846)
!1856 = !DILocation(line: 533, column: 47, scope: !1846)
!1857 = !DILocation(line: 534, column: 9, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1842, file: !1, line: 534, column: 9)
!1859 = !DILocation(line: 534, column: 13, scope: !1858)
!1860 = !DILocation(line: 534, column: 9, scope: !1842)
!1861 = !DILocation(line: 534, column: 28, scope: !1862)
!1862 = !DILexicalBlockFile(scope: !1858, file: !1, discriminator: 1)
!1863 = !DILocation(line: 534, column: 20, scope: !1862)
!1864 = !DILocation(line: 535, column: 20, scope: !1842)
!1865 = !DILocation(line: 535, column: 28, scope: !1842)
!1866 = !DILocation(line: 535, column: 35, scope: !1842)
!1867 = !DILocation(line: 535, column: 40, scope: !1842)
!1868 = !DILocation(line: 535, column: 12, scope: !1842)
!1869 = !DILocation(line: 535, column: 10, scope: !1842)
!1870 = !DILocation(line: 536, column: 6, scope: !1842)
!1871 = !DILocation(line: 526, column: 3, scope: !1820)
!1872 = distinct !{!1872, !1835}
!1873 = !DILocation(line: 544, column: 7, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !90, file: !1, line: 544, column: 7)
!1875 = !DILocation(line: 544, column: 11, scope: !1874)
!1876 = !DILocation(line: 544, column: 7, scope: !90)
!1877 = !DILocation(line: 546, column: 41, scope: !1878)
!1878 = distinct !DILexicalBlock(scope: !1874, file: !1, line: 545, column: 5)
!1879 = !DILocation(line: 546, column: 58, scope: !1878)
!1880 = !DILocation(line: 546, column: 63, scope: !1878)
!1881 = !DILocation(line: 546, column: 67, scope: !1878)
!1882 = !DILocation(line: 546, column: 21, scope: !1878)
!1883 = !DILocation(line: 546, column: 19, scope: !1878)
!1884 = !DILocalVariable(name: "i", scope: !1885, file: !1, line: 547, type: !6)
!1885 = distinct !DILexicalBlock(scope: !1878, file: !1, line: 547, column: 7)
!1886 = !DILocation(line: 547, column: 16, scope: !1885)
!1887 = !DILocation(line: 547, column: 12, scope: !1885)
!1888 = !DILocation(line: 547, column: 23, scope: !1889)
!1889 = !DILexicalBlockFile(scope: !1890, file: !1, discriminator: 1)
!1890 = distinct !DILexicalBlock(scope: !1885, file: !1, line: 547, column: 7)
!1891 = !DILocation(line: 547, column: 26, scope: !1889)
!1892 = !DILocation(line: 547, column: 34, scope: !1889)
!1893 = !DILocation(line: 547, column: 24, scope: !1889)
!1894 = !DILocation(line: 547, column: 7, scope: !1889)
!1895 = !DILocation(line: 548, column: 22, scope: !1896)
!1896 = distinct !DILexicalBlock(scope: !1890, file: !1, line: 547, column: 45)
!1897 = !DILocation(line: 548, column: 12, scope: !1896)
!1898 = !DILocation(line: 548, column: 20, scope: !1896)
!1899 = !DILocation(line: 548, column: 25, scope: !1896)
!1900 = !DILocation(line: 548, column: 2, scope: !1896)
!1901 = !DILocation(line: 548, column: 32, scope: !1896)
!1902 = !DILocation(line: 549, column: 7, scope: !1896)
!1903 = !DILocation(line: 547, column: 40, scope: !1904)
!1904 = !DILexicalBlockFile(scope: !1890, file: !1, discriminator: 2)
!1905 = !DILocation(line: 547, column: 7, scope: !1904)
!1906 = distinct !{!1906, !1907}
!1907 = !DILocation(line: 547, column: 7, scope: !1878)
!1908 = !DILocation(line: 550, column: 5, scope: !1878)
!1909 = !DILocation(line: 556, column: 3, scope: !90)
!1910 = !DILocation(line: 567, column: 16, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !90, file: !1, line: 556, column: 12)
!1912 = !DILocation(line: 567, column: 14, scope: !1911)
!1913 = !DILocation(line: 568, column: 16, scope: !1911)
!1914 = !DILocation(line: 568, column: 24, scope: !1911)
!1915 = !DILocation(line: 568, column: 34, scope: !1911)
!1916 = !DILocation(line: 569, column: 9, scope: !1911)
!1917 = !DILocation(line: 569, column: 16, scope: !1911)
!1918 = !DILocation(line: 569, column: 22, scope: !1911)
!1919 = !DILocation(line: 569, column: 40, scope: !1911)
!1920 = !DILocation(line: 569, column: 39, scope: !1911)
!1921 = !DILocation(line: 569, column: 35, scope: !1911)
!1922 = !DILocation(line: 569, column: 56, scope: !1911)
!1923 = !DILocation(line: 569, column: 49, scope: !1911)
!1924 = !DILocation(line: 569, column: 45, scope: !1911)
!1925 = !DILocation(line: 569, column: 44, scope: !1911)
!1926 = !DILocation(line: 569, column: 34, scope: !1911)
!1927 = !DILocation(line: 569, column: 69, scope: !1911)
!1928 = !DILocation(line: 569, column: 74, scope: !1911)
!1929 = !DILocation(line: 568, column: 12, scope: !1911)
!1930 = !DILocation(line: 568, column: 10, scope: !1911)
!1931 = !DILocation(line: 572, column: 11, scope: !1932)
!1932 = distinct !DILexicalBlock(scope: !1911, file: !1, line: 572, column: 9)
!1933 = !DILocation(line: 572, column: 22, scope: !1932)
!1934 = !DILocation(line: 572, column: 21, scope: !1932)
!1935 = !DILocation(line: 572, column: 13, scope: !1932)
!1936 = !DILocation(line: 572, column: 27, scope: !1932)
!1937 = !DILocation(line: 572, column: 30, scope: !1938)
!1938 = !DILexicalBlockFile(scope: !1932, file: !1, discriminator: 1)
!1939 = !DILocation(line: 572, column: 41, scope: !1938)
!1940 = !DILocation(line: 572, column: 40, scope: !1938)
!1941 = !DILocation(line: 572, column: 32, scope: !1938)
!1942 = !DILocation(line: 572, column: 47, scope: !1938)
!1943 = !DILocation(line: 573, column: 4, scope: !1932)
!1944 = !DILocation(line: 573, column: 9, scope: !1932)
!1945 = !DILocation(line: 573, column: 13, scope: !1932)
!1946 = !DILocation(line: 573, column: 6, scope: !1932)
!1947 = !DILocation(line: 573, column: 16, scope: !1932)
!1948 = !DILocation(line: 573, column: 19, scope: !1938)
!1949 = !DILocation(line: 573, column: 24, scope: !1938)
!1950 = !DILocation(line: 573, column: 28, scope: !1938)
!1951 = !DILocation(line: 573, column: 21, scope: !1938)
!1952 = !DILocation(line: 572, column: 9, scope: !1953)
!1953 = !DILexicalBlockFile(scope: !1911, file: !1, discriminator: 2)
!1954 = !DILocation(line: 584, column: 18, scope: !1955)
!1955 = distinct !DILexicalBlock(scope: !1932, file: !1, line: 573, column: 34)
!1956 = !DILocation(line: 584, column: 26, scope: !1955)
!1957 = !DILocation(line: 584, column: 36, scope: !1955)
!1958 = !DILocation(line: 585, column: 4, scope: !1955)
!1959 = !DILocation(line: 585, column: 11, scope: !1955)
!1960 = !DILocation(line: 585, column: 17, scope: !1955)
!1961 = !DILocation(line: 585, column: 35, scope: !1955)
!1962 = !DILocation(line: 585, column: 34, scope: !1955)
!1963 = !DILocation(line: 585, column: 30, scope: !1955)
!1964 = !DILocation(line: 585, column: 51, scope: !1955)
!1965 = !DILocation(line: 585, column: 44, scope: !1955)
!1966 = !DILocation(line: 585, column: 40, scope: !1955)
!1967 = !DILocation(line: 585, column: 39, scope: !1955)
!1968 = !DILocation(line: 585, column: 29, scope: !1955)
!1969 = !DILocation(line: 585, column: 66, scope: !1955)
!1970 = !DILocation(line: 585, column: 71, scope: !1955)
!1971 = !DILocation(line: 584, column: 14, scope: !1955)
!1972 = !DILocation(line: 584, column: 12, scope: !1955)
!1973 = !DILocation(line: 586, column: 5, scope: !1955)
!1974 = !DILocation(line: 588, column: 9, scope: !1975)
!1975 = distinct !DILexicalBlock(scope: !1911, file: !1, line: 588, column: 9)
!1976 = !DILocation(line: 588, column: 13, scope: !1975)
!1977 = !DILocation(line: 588, column: 11, scope: !1975)
!1978 = !DILocation(line: 588, column: 9, scope: !1911)
!1979 = !DILocation(line: 591, column: 13, scope: !1980)
!1980 = distinct !DILexicalBlock(scope: !1975, file: !1, line: 588, column: 19)
!1981 = !DILocation(line: 591, column: 11, scope: !1980)
!1982 = !DILocation(line: 591, column: 21, scope: !1980)
!1983 = !DILocation(line: 591, column: 25, scope: !1980)
!1984 = !DILocation(line: 591, column: 24, scope: !1980)
!1985 = !DILocation(line: 591, column: 20, scope: !1980)
!1986 = !DILocation(line: 591, column: 29, scope: !1980)
!1987 = !DILocation(line: 591, column: 18, scope: !1980)
!1988 = !DILocation(line: 592, column: 16, scope: !1980)
!1989 = !DILocation(line: 592, column: 18, scope: !1980)
!1990 = !DILocation(line: 592, column: 17, scope: !1980)
!1991 = !DILocation(line: 592, column: 23, scope: !1980)
!1992 = !DILocation(line: 592, column: 22, scope: !1980)
!1993 = !DILocation(line: 592, column: 12, scope: !1980)
!1994 = !DILocation(line: 593, column: 5, scope: !1980)
!1995 = !DILocation(line: 594, column: 9, scope: !1996)
!1996 = distinct !DILexicalBlock(scope: !1911, file: !1, line: 594, column: 9)
!1997 = !DILocation(line: 594, column: 13, scope: !1996)
!1998 = !DILocation(line: 594, column: 11, scope: !1996)
!1999 = !DILocation(line: 594, column: 9, scope: !1911)
!2000 = !DILocation(line: 597, column: 13, scope: !2001)
!2001 = distinct !DILexicalBlock(scope: !1996, file: !1, line: 594, column: 19)
!2002 = !DILocation(line: 597, column: 11, scope: !2001)
!2003 = !DILocation(line: 597, column: 21, scope: !2001)
!2004 = !DILocation(line: 597, column: 25, scope: !2001)
!2005 = !DILocation(line: 597, column: 24, scope: !2001)
!2006 = !DILocation(line: 597, column: 20, scope: !2001)
!2007 = !DILocation(line: 597, column: 29, scope: !2001)
!2008 = !DILocation(line: 597, column: 18, scope: !2001)
!2009 = !DILocation(line: 598, column: 16, scope: !2001)
!2010 = !DILocation(line: 598, column: 18, scope: !2001)
!2011 = !DILocation(line: 598, column: 17, scope: !2001)
!2012 = !DILocation(line: 598, column: 23, scope: !2001)
!2013 = !DILocation(line: 598, column: 22, scope: !2001)
!2014 = !DILocation(line: 598, column: 12, scope: !2001)
!2015 = !DILocation(line: 599, column: 5, scope: !2001)
!2016 = !DILocation(line: 603, column: 11, scope: !2017)
!2017 = distinct !DILexicalBlock(scope: !1911, file: !1, line: 603, column: 9)
!2018 = !DILocation(line: 603, column: 16, scope: !2017)
!2019 = !DILocation(line: 603, column: 13, scope: !2017)
!2020 = !DILocation(line: 603, column: 21, scope: !2017)
!2021 = !DILocation(line: 603, column: 24, scope: !2022)
!2022 = !DILexicalBlockFile(scope: !2017, file: !1, discriminator: 1)
!2023 = !DILocation(line: 603, column: 29, scope: !2022)
!2024 = !DILocation(line: 603, column: 26, scope: !2022)
!2025 = !DILocation(line: 603, column: 35, scope: !2022)
!2026 = !DILocation(line: 603, column: 39, scope: !2027)
!2027 = !DILexicalBlockFile(scope: !2017, file: !1, discriminator: 2)
!2028 = !DILocation(line: 603, column: 54, scope: !2027)
!2029 = !DILocation(line: 603, column: 53, scope: !2027)
!2030 = !DILocation(line: 603, column: 43, scope: !2027)
!2031 = !DILocation(line: 603, column: 9, scope: !2027)
!2032 = !DILocation(line: 605, column: 2, scope: !2033)
!2033 = distinct !DILexicalBlock(scope: !2017, file: !1, line: 604, column: 7)
!2034 = !DILocation(line: 556, column: 3, scope: !1815)
!2035 = distinct !{!2035, !1909}
!2036 = !DILocation(line: 613, column: 7, scope: !2037)
!2037 = distinct !DILexicalBlock(scope: !90, file: !1, line: 613, column: 7)
!2038 = !DILocation(line: 613, column: 10, scope: !2037)
!2039 = !DILocation(line: 613, column: 7, scope: !90)
!2040 = !DILocation(line: 614, column: 10, scope: !2041)
!2041 = distinct !DILexicalBlock(scope: !2037, file: !1, line: 613, column: 16)
!2042 = !DILocation(line: 614, column: 5, scope: !2041)
!2043 = !DILocation(line: 615, column: 10, scope: !2041)
!2044 = !DILocation(line: 615, column: 5, scope: !2041)
!2045 = !DILocation(line: 616, column: 15, scope: !2041)
!2046 = !DILocation(line: 616, column: 6, scope: !2041)
!2047 = !DILocation(line: 616, column: 13, scope: !2041)
!2048 = !DILocation(line: 617, column: 3, scope: !2041)
!2049 = !DILocation(line: 619, column: 10, scope: !90)
!2050 = !DILocation(line: 619, column: 3, scope: !90)
!2051 = !DILocation(line: 620, column: 1, scope: !90)
!2052 = distinct !DISubprogram(name: "contcenters", linkageName: "_Z11contcentersP6Points", scope: !1, file: !1, line: 623, type: !2053, isLocal: false, isDefinition: true, scopeLine: 624, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!2053 = !DISubroutineType(types: !2054)
!2054 = !{!6, !16}
!2055 = !DILocalVariable(name: "points", arg: 1, scope: !2052, file: !1, line: 623, type: !16)
!2056 = !DILocation(line: 623, column: 25, scope: !2052)
!2057 = !DILocalVariable(name: "i", scope: !2052, file: !1, line: 625, type: !8)
!2058 = !DILocation(line: 625, column: 8, scope: !2052)
!2059 = !DILocalVariable(name: "ii", scope: !2052, file: !1, line: 625, type: !8)
!2060 = !DILocation(line: 625, column: 11, scope: !2052)
!2061 = !DILocalVariable(name: "relweight", scope: !2052, file: !1, line: 626, type: !5)
!2062 = !DILocation(line: 626, column: 9, scope: !2052)
!2063 = !DILocation(line: 628, column: 9, scope: !2064)
!2064 = distinct !DILexicalBlock(scope: !2052, file: !1, line: 628, column: 3)
!2065 = !DILocation(line: 628, column: 8, scope: !2064)
!2066 = !DILocation(line: 628, column: 12, scope: !2067)
!2067 = !DILexicalBlockFile(scope: !2068, file: !1, discriminator: 1)
!2068 = distinct !DILexicalBlock(scope: !2064, file: !1, line: 628, column: 3)
!2069 = !DILocation(line: 628, column: 14, scope: !2067)
!2070 = !DILocation(line: 628, column: 22, scope: !2067)
!2071 = !DILocation(line: 628, column: 13, scope: !2067)
!2072 = !DILocation(line: 628, column: 3, scope: !2067)
!2073 = !DILocation(line: 630, column: 19, scope: !2074)
!2074 = distinct !DILexicalBlock(scope: !2075, file: !1, line: 630, column: 9)
!2075 = distinct !DILexicalBlock(scope: !2068, file: !1, line: 628, column: 31)
!2076 = !DILocation(line: 630, column: 9, scope: !2074)
!2077 = !DILocation(line: 630, column: 17, scope: !2074)
!2078 = !DILocation(line: 630, column: 22, scope: !2074)
!2079 = !DILocation(line: 630, column: 32, scope: !2074)
!2080 = !DILocation(line: 630, column: 29, scope: !2074)
!2081 = !DILocation(line: 630, column: 9, scope: !2075)
!2082 = !DILocation(line: 631, column: 37, scope: !2083)
!2083 = distinct !DILexicalBlock(scope: !2074, file: !1, line: 630, column: 35)
!2084 = !DILocation(line: 631, column: 27, scope: !2083)
!2085 = !DILocation(line: 631, column: 35, scope: !2083)
!2086 = !DILocation(line: 631, column: 40, scope: !2083)
!2087 = !DILocation(line: 631, column: 17, scope: !2083)
!2088 = !DILocation(line: 631, column: 25, scope: !2083)
!2089 = !DILocation(line: 631, column: 48, scope: !2083)
!2090 = !DILocation(line: 631, column: 67, scope: !2083)
!2091 = !DILocation(line: 631, column: 57, scope: !2083)
!2092 = !DILocation(line: 631, column: 65, scope: !2083)
!2093 = !DILocation(line: 631, column: 70, scope: !2083)
!2094 = !DILocation(line: 631, column: 55, scope: !2083)
!2095 = !DILocation(line: 631, column: 16, scope: !2083)
!2096 = !DILocation(line: 632, column: 29, scope: !2083)
!2097 = !DILocation(line: 632, column: 19, scope: !2083)
!2098 = !DILocation(line: 632, column: 27, scope: !2083)
!2099 = !DILocation(line: 632, column: 32, scope: !2083)
!2100 = !DILocation(line: 632, column: 39, scope: !2083)
!2101 = !DILocation(line: 632, column: 38, scope: !2083)
!2102 = !DILocation(line: 632, column: 17, scope: !2083)
!2103 = !DILocation(line: 633, column: 14, scope: !2104)
!2104 = distinct !DILexicalBlock(scope: !2083, file: !1, line: 633, column: 7)
!2105 = !DILocation(line: 633, column: 12, scope: !2104)
!2106 = !DILocation(line: 633, column: 17, scope: !2107)
!2107 = !DILexicalBlockFile(scope: !2108, file: !1, discriminator: 1)
!2108 = distinct !DILexicalBlock(scope: !2104, file: !1, line: 633, column: 7)
!2109 = !DILocation(line: 633, column: 20, scope: !2107)
!2110 = !DILocation(line: 633, column: 28, scope: !2107)
!2111 = !DILocation(line: 633, column: 19, scope: !2107)
!2112 = !DILocation(line: 633, column: 7, scope: !2107)
!2113 = !DILocation(line: 634, column: 51, scope: !2114)
!2114 = distinct !DILexicalBlock(scope: !2108, file: !1, line: 633, column: 38)
!2115 = !DILocation(line: 634, column: 50, scope: !2114)
!2116 = !DILocation(line: 634, column: 42, scope: !2114)
!2117 = !DILocation(line: 634, column: 25, scope: !2114)
!2118 = !DILocation(line: 634, column: 15, scope: !2114)
!2119 = !DILocation(line: 634, column: 23, scope: !2114)
!2120 = !DILocation(line: 634, column: 28, scope: !2114)
!2121 = !DILocation(line: 634, column: 5, scope: !2114)
!2122 = !DILocation(line: 634, column: 13, scope: !2114)
!2123 = !DILocation(line: 634, column: 36, scope: !2114)
!2124 = !DILocation(line: 634, column: 45, scope: !2114)
!2125 = !DILocation(line: 636, column: 24, scope: !2114)
!2126 = !DILocation(line: 636, column: 15, scope: !2114)
!2127 = !DILocation(line: 636, column: 5, scope: !2114)
!2128 = !DILocation(line: 636, column: 13, scope: !2114)
!2129 = !DILocation(line: 636, column: 18, scope: !2114)
!2130 = !DILocation(line: 636, column: 28, scope: !2114)
!2131 = !DILocation(line: 636, column: 27, scope: !2114)
!2132 = !DILocation(line: 635, column: 42, scope: !2114)
!2133 = !DILocation(line: 635, column: 25, scope: !2114)
!2134 = !DILocation(line: 635, column: 15, scope: !2114)
!2135 = !DILocation(line: 635, column: 23, scope: !2114)
!2136 = !DILocation(line: 635, column: 28, scope: !2114)
!2137 = !DILocation(line: 635, column: 5, scope: !2114)
!2138 = !DILocation(line: 635, column: 13, scope: !2114)
!2139 = !DILocation(line: 635, column: 36, scope: !2114)
!2140 = !DILocation(line: 635, column: 45, scope: !2114)
!2141 = !DILocation(line: 637, column: 7, scope: !2114)
!2142 = !DILocation(line: 633, column: 34, scope: !2143)
!2143 = !DILexicalBlockFile(scope: !2108, file: !1, discriminator: 2)
!2144 = !DILocation(line: 633, column: 7, scope: !2143)
!2145 = distinct !{!2145, !2146}
!2146 = !DILocation(line: 633, column: 7, scope: !2083)
!2147 = !DILocation(line: 638, column: 58, scope: !2083)
!2148 = !DILocation(line: 638, column: 48, scope: !2083)
!2149 = !DILocation(line: 638, column: 56, scope: !2083)
!2150 = !DILocation(line: 638, column: 61, scope: !2083)
!2151 = !DILocation(line: 638, column: 27, scope: !2083)
!2152 = !DILocation(line: 638, column: 17, scope: !2083)
!2153 = !DILocation(line: 638, column: 25, scope: !2083)
!2154 = !DILocation(line: 638, column: 30, scope: !2083)
!2155 = !DILocation(line: 638, column: 7, scope: !2083)
!2156 = !DILocation(line: 638, column: 15, scope: !2083)
!2157 = !DILocation(line: 638, column: 38, scope: !2083)
!2158 = !DILocation(line: 638, column: 45, scope: !2083)
!2159 = !DILocation(line: 639, column: 5, scope: !2083)
!2160 = !DILocation(line: 640, column: 3, scope: !2075)
!2161 = !DILocation(line: 628, column: 27, scope: !2162)
!2162 = !DILexicalBlockFile(scope: !2068, file: !1, discriminator: 2)
!2163 = !DILocation(line: 628, column: 3, scope: !2162)
!2164 = distinct !{!2164, !2165}
!2165 = !DILocation(line: 628, column: 3, scope: !2052)
!2166 = !DILocation(line: 642, column: 3, scope: !2052)
!2167 = distinct !DISubprogram(name: "copycenters", linkageName: "_Z11copycentersP6PointsS0_Pll", scope: !1, file: !1, line: 646, type: !2168, isLocal: false, isDefinition: true, scopeLine: 647, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!2168 = !DISubroutineType(types: !2169)
!2169 = !{null, !16, !16, !34, !8}
!2170 = !DILocalVariable(name: "points", arg: 1, scope: !2167, file: !1, line: 646, type: !16)
!2171 = !DILocation(line: 646, column: 26, scope: !2167)
!2172 = !DILocalVariable(name: "centers", arg: 2, scope: !2167, file: !1, line: 646, type: !16)
!2173 = !DILocation(line: 646, column: 42, scope: !2167)
!2174 = !DILocalVariable(name: "centerIDs", arg: 3, scope: !2167, file: !1, line: 646, type: !34)
!2175 = !DILocation(line: 646, column: 57, scope: !2167)
!2176 = !DILocalVariable(name: "offset", arg: 4, scope: !2167, file: !1, line: 646, type: !8)
!2177 = !DILocation(line: 646, column: 73, scope: !2167)
!2178 = !DILocalVariable(name: "i", scope: !2167, file: !1, line: 648, type: !8)
!2179 = !DILocation(line: 648, column: 8, scope: !2167)
!2180 = !DILocalVariable(name: "k", scope: !2167, file: !1, line: 649, type: !8)
!2181 = !DILocation(line: 649, column: 8, scope: !2167)
!2182 = !DILocalVariable(name: "is_a_median", scope: !2167, file: !1, line: 651, type: !9)
!2183 = !DILocation(line: 651, column: 9, scope: !2167)
!2184 = !DILocation(line: 651, column: 39, scope: !2167)
!2185 = !DILocation(line: 651, column: 47, scope: !2167)
!2186 = !DILocation(line: 651, column: 32, scope: !2167)
!2187 = !DILocation(line: 654, column: 11, scope: !2188)
!2188 = distinct !DILexicalBlock(scope: !2167, file: !1, line: 654, column: 3)
!2189 = !DILocation(line: 654, column: 9, scope: !2188)
!2190 = !DILocation(line: 654, column: 16, scope: !2191)
!2191 = !DILexicalBlockFile(scope: !2192, file: !1, discriminator: 1)
!2192 = distinct !DILexicalBlock(scope: !2188, file: !1, line: 654, column: 3)
!2193 = !DILocation(line: 654, column: 20, scope: !2191)
!2194 = !DILocation(line: 654, column: 28, scope: !2191)
!2195 = !DILocation(line: 654, column: 18, scope: !2191)
!2196 = !DILocation(line: 654, column: 3, scope: !2191)
!2197 = !DILocation(line: 655, column: 27, scope: !2198)
!2198 = distinct !DILexicalBlock(scope: !2192, file: !1, line: 654, column: 39)
!2199 = !DILocation(line: 655, column: 17, scope: !2198)
!2200 = !DILocation(line: 655, column: 25, scope: !2198)
!2201 = !DILocation(line: 655, column: 30, scope: !2198)
!2202 = !DILocation(line: 655, column: 5, scope: !2198)
!2203 = !DILocation(line: 655, column: 38, scope: !2198)
!2204 = !DILocation(line: 656, column: 3, scope: !2198)
!2205 = !DILocation(line: 654, column: 34, scope: !2206)
!2206 = !DILexicalBlockFile(scope: !2192, file: !1, discriminator: 2)
!2207 = !DILocation(line: 654, column: 3, scope: !2206)
!2208 = distinct !{!2208, !2209}
!2209 = !DILocation(line: 654, column: 3, scope: !2167)
!2210 = !DILocation(line: 658, column: 5, scope: !2167)
!2211 = !DILocation(line: 658, column: 14, scope: !2167)
!2212 = !DILocation(line: 658, column: 4, scope: !2167)
!2213 = !DILocation(line: 661, column: 11, scope: !2214)
!2214 = distinct !DILexicalBlock(scope: !2167, file: !1, line: 661, column: 3)
!2215 = !DILocation(line: 661, column: 9, scope: !2214)
!2216 = !DILocation(line: 661, column: 16, scope: !2217)
!2217 = !DILexicalBlockFile(scope: !2218, file: !1, discriminator: 1)
!2218 = distinct !DILexicalBlock(scope: !2214, file: !1, line: 661, column: 3)
!2219 = !DILocation(line: 661, column: 20, scope: !2217)
!2220 = !DILocation(line: 661, column: 28, scope: !2217)
!2221 = !DILocation(line: 661, column: 18, scope: !2217)
!2222 = !DILocation(line: 661, column: 3, scope: !2217)
!2223 = !DILocation(line: 662, column: 22, scope: !2224)
!2224 = distinct !DILexicalBlock(scope: !2225, file: !1, line: 662, column: 10)
!2225 = distinct !DILexicalBlock(scope: !2218, file: !1, line: 661, column: 39)
!2226 = !DILocation(line: 662, column: 10, scope: !2224)
!2227 = !DILocation(line: 662, column: 10, scope: !2225)
!2228 = !DILocation(line: 663, column: 26, scope: !2229)
!2229 = distinct !DILexicalBlock(scope: !2224, file: !1, line: 662, column: 27)
!2230 = !DILocation(line: 663, column: 15, scope: !2229)
!2231 = !DILocation(line: 663, column: 24, scope: !2229)
!2232 = !DILocation(line: 663, column: 29, scope: !2229)
!2233 = !DILocation(line: 663, column: 7, scope: !2229)
!2234 = !DILocation(line: 663, column: 46, scope: !2229)
!2235 = !DILocation(line: 663, column: 36, scope: !2229)
!2236 = !DILocation(line: 663, column: 44, scope: !2229)
!2237 = !DILocation(line: 663, column: 49, scope: !2229)
!2238 = !DILocation(line: 663, column: 56, scope: !2229)
!2239 = !DILocation(line: 663, column: 64, scope: !2229)
!2240 = !DILocation(line: 663, column: 68, scope: !2229)
!2241 = !DILocation(line: 664, column: 40, scope: !2229)
!2242 = !DILocation(line: 664, column: 30, scope: !2229)
!2243 = !DILocation(line: 664, column: 38, scope: !2229)
!2244 = !DILocation(line: 664, column: 43, scope: !2229)
!2245 = !DILocation(line: 664, column: 18, scope: !2229)
!2246 = !DILocation(line: 664, column: 7, scope: !2229)
!2247 = !DILocation(line: 664, column: 16, scope: !2229)
!2248 = !DILocation(line: 664, column: 21, scope: !2229)
!2249 = !DILocation(line: 664, column: 28, scope: !2229)
!2250 = !DILocation(line: 665, column: 22, scope: !2229)
!2251 = !DILocation(line: 665, column: 26, scope: !2229)
!2252 = !DILocation(line: 665, column: 24, scope: !2229)
!2253 = !DILocation(line: 665, column: 17, scope: !2229)
!2254 = !DILocation(line: 665, column: 7, scope: !2229)
!2255 = !DILocation(line: 665, column: 20, scope: !2229)
!2256 = !DILocation(line: 666, column: 8, scope: !2229)
!2257 = !DILocation(line: 667, column: 5, scope: !2229)
!2258 = !DILocation(line: 668, column: 3, scope: !2225)
!2259 = !DILocation(line: 661, column: 34, scope: !2260)
!2260 = !DILexicalBlockFile(scope: !2218, file: !1, discriminator: 2)
!2261 = !DILocation(line: 661, column: 3, scope: !2260)
!2262 = distinct !{!2262, !2263}
!2263 = !DILocation(line: 661, column: 3, scope: !2167)
!2264 = !DILocation(line: 670, column: 18, scope: !2167)
!2265 = !DILocation(line: 670, column: 3, scope: !2167)
!2266 = !DILocation(line: 670, column: 12, scope: !2167)
!2267 = !DILocation(line: 670, column: 16, scope: !2167)
!2268 = !DILocation(line: 672, column: 8, scope: !2167)
!2269 = !DILocation(line: 672, column: 3, scope: !2167)
!2270 = !DILocation(line: 673, column: 1, scope: !2167)
!2271 = distinct !DISubprogram(name: "localSearchSub", linkageName: "_Z14localSearchSubPv", scope: !1, file: !1, line: 677, type: !2272, isLocal: false, isDefinition: true, scopeLine: 677, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!2272 = !DISubroutineType(types: !2273)
!2273 = !{!222, !222}
!2274 = !DILocalVariable(name: "arg_", arg: 1, scope: !2271, file: !1, line: 677, type: !222)
!2275 = !DILocation(line: 677, column: 28, scope: !2271)
!2276 = !DILocalVariable(name: "arg", scope: !2271, file: !1, line: 678, type: !11)
!2277 = !DILocation(line: 678, column: 19, scope: !2271)
!2278 = !DILocation(line: 678, column: 41, scope: !2271)
!2279 = !DILocation(line: 678, column: 24, scope: !2271)
!2280 = !DILocation(line: 679, column: 12, scope: !2271)
!2281 = !DILocation(line: 679, column: 17, scope: !2271)
!2282 = !DILocation(line: 679, column: 24, scope: !2271)
!2283 = !DILocation(line: 679, column: 29, scope: !2271)
!2284 = !DILocation(line: 679, column: 34, scope: !2271)
!2285 = !DILocation(line: 679, column: 39, scope: !2271)
!2286 = !DILocation(line: 679, column: 44, scope: !2271)
!2287 = !DILocation(line: 679, column: 49, scope: !2271)
!2288 = !DILocation(line: 679, column: 56, scope: !2271)
!2289 = !DILocation(line: 679, column: 61, scope: !2271)
!2290 = !DILocation(line: 679, column: 65, scope: !2271)
!2291 = !DILocation(line: 679, column: 70, scope: !2271)
!2292 = !DILocation(line: 679, column: 3, scope: !2271)
!2293 = !DILocation(line: 681, column: 3, scope: !2271)
!2294 = distinct !DISubprogram(name: "localSearch", linkageName: "_Z11localSearchP6PointsllPl", scope: !1, file: !1, line: 684, type: !2295, isLocal: false, isDefinition: true, scopeLine: 684, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!2295 = !DISubroutineType(types: !2296)
!2296 = !{null, !16, !8, !8, !34}
!2297 = !DILocalVariable(name: "points", arg: 1, scope: !2294, file: !1, line: 684, type: !16)
!2298 = !DILocation(line: 684, column: 27, scope: !2294)
!2299 = !DILocalVariable(name: "kmin", arg: 2, scope: !2294, file: !1, line: 684, type: !8)
!2300 = !DILocation(line: 684, column: 40, scope: !2294)
!2301 = !DILocalVariable(name: "kmax", arg: 3, scope: !2294, file: !1, line: 684, type: !8)
!2302 = !DILocation(line: 684, column: 51, scope: !2294)
!2303 = !DILocalVariable(name: "kfinal", arg: 4, scope: !2294, file: !1, line: 684, type: !34)
!2304 = !DILocation(line: 684, column: 63, scope: !2294)
!2305 = !DILocalVariable(name: "t1", scope: !2294, file: !1, line: 686, type: !69)
!2306 = !DILocation(line: 686, column: 10, scope: !2294)
!2307 = !DILocation(line: 686, column: 15, scope: !2294)
!2308 = !DILocalVariable(name: "barrier", scope: !2294, file: !1, line: 689, type: !38)
!2309 = !DILocation(line: 689, column: 23, scope: !2294)
!2310 = !DILocalVariable(name: "threads", scope: !2294, file: !1, line: 693, type: !2311)
!2311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2312, size: 64, align: 64)
!2312 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !39, line: 60, baseType: !172)
!2313 = !DILocation(line: 693, column: 16, scope: !2294)
!2314 = !DILocation(line: 693, column: 40, scope: !2294)
!2315 = !DILocation(line: 693, column: 26, scope: !2294)
!2316 = !DILocation(line: 693, column: 26, scope: !2317)
!2317 = !DILexicalBlockFile(scope: !2294, file: !1, discriminator: 1)
!2318 = !DILocalVariable(name: "arg", scope: !2294, file: !1, line: 694, type: !11)
!2319 = !DILocation(line: 694, column: 21, scope: !2294)
!2320 = !DILocation(line: 694, column: 46, scope: !2294)
!2321 = !DILocation(line: 694, column: 27, scope: !2294)
!2322 = !DILocation(line: 694, column: 27, scope: !2317)
!2323 = !DILocalVariable(name: "i", scope: !2324, file: !1, line: 697, type: !6)
!2324 = distinct !DILexicalBlock(scope: !2294, file: !1, line: 697, column: 5)
!2325 = !DILocation(line: 697, column: 14, scope: !2324)
!2326 = !DILocation(line: 697, column: 10, scope: !2324)
!2327 = !DILocation(line: 697, column: 21, scope: !2328)
!2328 = !DILexicalBlockFile(scope: !2329, file: !1, discriminator: 1)
!2329 = distinct !DILexicalBlock(scope: !2324, file: !1, line: 697, column: 5)
!2330 = !DILocation(line: 697, column: 25, scope: !2328)
!2331 = !DILocation(line: 697, column: 23, scope: !2328)
!2332 = !DILocation(line: 697, column: 5, scope: !2328)
!2333 = !DILocation(line: 698, column: 23, scope: !2334)
!2334 = distinct !DILexicalBlock(scope: !2329, file: !1, line: 697, column: 38)
!2335 = !DILocation(line: 698, column: 11, scope: !2334)
!2336 = !DILocation(line: 698, column: 7, scope: !2334)
!2337 = !DILocation(line: 698, column: 14, scope: !2334)
!2338 = !DILocation(line: 698, column: 21, scope: !2334)
!2339 = !DILocation(line: 699, column: 21, scope: !2334)
!2340 = !DILocation(line: 699, column: 11, scope: !2334)
!2341 = !DILocation(line: 699, column: 7, scope: !2334)
!2342 = !DILocation(line: 699, column: 14, scope: !2334)
!2343 = !DILocation(line: 699, column: 19, scope: !2334)
!2344 = !DILocation(line: 700, column: 21, scope: !2334)
!2345 = !DILocation(line: 700, column: 11, scope: !2334)
!2346 = !DILocation(line: 700, column: 7, scope: !2334)
!2347 = !DILocation(line: 700, column: 14, scope: !2334)
!2348 = !DILocation(line: 700, column: 19, scope: !2334)
!2349 = !DILocation(line: 701, column: 20, scope: !2334)
!2350 = !DILocation(line: 701, column: 11, scope: !2334)
!2351 = !DILocation(line: 701, column: 7, scope: !2334)
!2352 = !DILocation(line: 701, column: 14, scope: !2334)
!2353 = !DILocation(line: 701, column: 18, scope: !2334)
!2354 = !DILocation(line: 702, column: 23, scope: !2334)
!2355 = !DILocation(line: 702, column: 11, scope: !2334)
!2356 = !DILocation(line: 702, column: 7, scope: !2334)
!2357 = !DILocation(line: 702, column: 14, scope: !2334)
!2358 = !DILocation(line: 702, column: 21, scope: !2334)
!2359 = !DILocation(line: 704, column: 11, scope: !2334)
!2360 = !DILocation(line: 704, column: 7, scope: !2334)
!2361 = !DILocation(line: 704, column: 14, scope: !2334)
!2362 = !DILocation(line: 704, column: 22, scope: !2334)
!2363 = !DILocation(line: 708, column: 23, scope: !2334)
!2364 = !DILocation(line: 708, column: 22, scope: !2334)
!2365 = !DILocation(line: 708, column: 7, scope: !2334)
!2366 = !DILocation(line: 710, column: 5, scope: !2334)
!2367 = !DILocation(line: 697, column: 33, scope: !2368)
!2368 = !DILexicalBlockFile(scope: !2329, file: !1, discriminator: 2)
!2369 = !DILocation(line: 697, column: 5, scope: !2368)
!2370 = distinct !{!2370, !2371}
!2371 = !DILocation(line: 697, column: 5, scope: !2294)
!2372 = !DILocalVariable(name: "i", scope: !2373, file: !1, line: 712, type: !6)
!2373 = distinct !DILexicalBlock(scope: !2294, file: !1, line: 712, column: 5)
!2374 = !DILocation(line: 712, column: 15, scope: !2373)
!2375 = !DILocation(line: 712, column: 11, scope: !2373)
!2376 = !DILocation(line: 712, column: 22, scope: !2377)
!2377 = !DILexicalBlockFile(scope: !2378, file: !1, discriminator: 1)
!2378 = distinct !DILexicalBlock(scope: !2373, file: !1, line: 712, column: 5)
!2379 = !DILocation(line: 712, column: 26, scope: !2377)
!2380 = !DILocation(line: 712, column: 24, scope: !2377)
!2381 = !DILocation(line: 712, column: 5, scope: !2377)
!2382 = !DILocation(line: 716, column: 5, scope: !2383)
!2383 = distinct !DILexicalBlock(scope: !2378, file: !1, line: 712, column: 38)
!2384 = !DILocation(line: 712, column: 34, scope: !2385)
!2385 = !DILexicalBlockFile(scope: !2378, file: !1, discriminator: 2)
!2386 = !DILocation(line: 712, column: 5, scope: !2385)
!2387 = distinct !{!2387, !2388}
!2388 = !DILocation(line: 712, column: 5, scope: !2294)
!2389 = !DILocation(line: 718, column: 14, scope: !2294)
!2390 = !DILocation(line: 718, column: 5, scope: !2294)
!2391 = !DILocation(line: 718, column: 5, scope: !2317)
!2392 = !DILocation(line: 719, column: 14, scope: !2294)
!2393 = !DILocation(line: 719, column: 5, scope: !2294)
!2394 = !DILocation(line: 719, column: 5, scope: !2317)
!2395 = !DILocalVariable(name: "t2", scope: !2294, file: !1, line: 725, type: !69)
!2396 = !DILocation(line: 725, column: 10, scope: !2294)
!2397 = !DILocation(line: 725, column: 15, scope: !2294)
!2398 = !DILocation(line: 726, column: 24, scope: !2294)
!2399 = !DILocation(line: 726, column: 27, scope: !2294)
!2400 = !DILocation(line: 726, column: 26, scope: !2294)
!2401 = !DILocation(line: 726, column: 21, scope: !2294)
!2402 = !DILocation(line: 729, column: 1, scope: !2294)
!2403 = distinct !DISubprogram(name: "outcenterIDs", linkageName: "_Z12outcenterIDsP6PointsPlPc", scope: !1, file: !1, line: 732, type: !2404, isLocal: false, isDefinition: true, scopeLine: 732, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!2404 = !DISubroutineType(types: !2405)
!2405 = !{null, !16, !34, !245}
!2406 = !DILocalVariable(name: "centers", arg: 1, scope: !2403, file: !1, line: 732, type: !16)
!2407 = !DILocation(line: 732, column: 28, scope: !2403)
!2408 = !DILocalVariable(name: "centerIDs", arg: 2, scope: !2403, file: !1, line: 732, type: !34)
!2409 = !DILocation(line: 732, column: 43, scope: !2403)
!2410 = !DILocalVariable(name: "outfile", arg: 3, scope: !2403, file: !1, line: 732, type: !245)
!2411 = !DILocation(line: 732, column: 60, scope: !2403)
!2412 = !DILocalVariable(name: "fp", scope: !2403, file: !1, line: 733, type: !491)
!2413 = !DILocation(line: 733, column: 9, scope: !2403)
!2414 = !DILocation(line: 733, column: 20, scope: !2403)
!2415 = !DILocation(line: 733, column: 14, scope: !2403)
!2416 = !DILocation(line: 734, column: 7, scope: !2417)
!2417 = distinct !DILexicalBlock(scope: !2403, file: !1, line: 734, column: 7)
!2418 = !DILocation(line: 734, column: 9, scope: !2417)
!2419 = !DILocation(line: 734, column: 7, scope: !2403)
!2420 = !DILocation(line: 735, column: 13, scope: !2421)
!2421 = distinct !DILexicalBlock(scope: !2417, file: !1, line: 734, column: 18)
!2422 = !DILocation(line: 735, column: 42, scope: !2421)
!2423 = !DILocation(line: 735, column: 5, scope: !2421)
!2424 = !DILocation(line: 736, column: 5, scope: !2421)
!2425 = !DILocalVariable(name: "is_a_median", scope: !2403, file: !1, line: 738, type: !7)
!2426 = !DILocation(line: 738, column: 8, scope: !2403)
!2427 = !DILocation(line: 738, column: 49, scope: !2403)
!2428 = !DILocation(line: 738, column: 58, scope: !2403)
!2429 = !DILocation(line: 738, column: 28, scope: !2403)
!2430 = !DILocation(line: 738, column: 22, scope: !2403)
!2431 = !DILocalVariable(name: "i", scope: !2432, file: !1, line: 739, type: !6)
!2432 = distinct !DILexicalBlock(scope: !2403, file: !1, line: 739, column: 3)
!2433 = !DILocation(line: 739, column: 12, scope: !2432)
!2434 = !DILocation(line: 739, column: 8, scope: !2432)
!2435 = !DILocation(line: 739, column: 19, scope: !2436)
!2436 = !DILexicalBlockFile(scope: !2437, file: !1, discriminator: 1)
!2437 = distinct !DILexicalBlock(scope: !2432, file: !1, line: 739, column: 3)
!2438 = !DILocation(line: 739, column: 22, scope: !2436)
!2439 = !DILocation(line: 739, column: 31, scope: !2436)
!2440 = !DILocation(line: 739, column: 20, scope: !2436)
!2441 = !DILocation(line: 739, column: 3, scope: !2436)
!2442 = !DILocation(line: 740, column: 28, scope: !2443)
!2443 = distinct !DILexicalBlock(scope: !2437, file: !1, line: 739, column: 42)
!2444 = !DILocation(line: 740, column: 17, scope: !2443)
!2445 = !DILocation(line: 740, column: 26, scope: !2443)
!2446 = !DILocation(line: 740, column: 31, scope: !2443)
!2447 = !DILocation(line: 740, column: 5, scope: !2443)
!2448 = !DILocation(line: 740, column: 39, scope: !2443)
!2449 = !DILocation(line: 741, column: 3, scope: !2443)
!2450 = !DILocation(line: 739, column: 37, scope: !2451)
!2451 = !DILexicalBlockFile(scope: !2437, file: !1, discriminator: 2)
!2452 = !DILocation(line: 739, column: 3, scope: !2451)
!2453 = distinct !{!2453, !2454}
!2454 = !DILocation(line: 739, column: 3, scope: !2403)
!2455 = !DILocalVariable(name: "i", scope: !2456, file: !1, line: 743, type: !6)
!2456 = distinct !DILexicalBlock(scope: !2403, file: !1, line: 743, column: 3)
!2457 = !DILocation(line: 743, column: 12, scope: !2456)
!2458 = !DILocation(line: 743, column: 8, scope: !2456)
!2459 = !DILocation(line: 743, column: 19, scope: !2460)
!2460 = !DILexicalBlockFile(scope: !2461, file: !1, discriminator: 1)
!2461 = distinct !DILexicalBlock(scope: !2456, file: !1, line: 743, column: 3)
!2462 = !DILocation(line: 743, column: 23, scope: !2460)
!2463 = !DILocation(line: 743, column: 32, scope: !2460)
!2464 = !DILocation(line: 743, column: 21, scope: !2460)
!2465 = !DILocation(line: 743, column: 3, scope: !2460)
!2466 = !DILocation(line: 744, column: 21, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2468, file: !1, line: 744, column: 9)
!2468 = distinct !DILexicalBlock(scope: !2461, file: !1, line: 743, column: 43)
!2469 = !DILocation(line: 744, column: 9, scope: !2467)
!2470 = !DILocation(line: 744, column: 9, scope: !2468)
!2471 = !DILocation(line: 745, column: 15, scope: !2472)
!2472 = distinct !DILexicalBlock(scope: !2467, file: !1, line: 744, column: 26)
!2473 = !DILocation(line: 745, column: 37, scope: !2472)
!2474 = !DILocation(line: 745, column: 27, scope: !2472)
!2475 = !DILocation(line: 745, column: 7, scope: !2472)
!2476 = !DILocation(line: 746, column: 15, scope: !2472)
!2477 = !DILocation(line: 746, column: 39, scope: !2472)
!2478 = !DILocation(line: 746, column: 28, scope: !2472)
!2479 = !DILocation(line: 746, column: 37, scope: !2472)
!2480 = !DILocation(line: 746, column: 42, scope: !2472)
!2481 = !DILocation(line: 746, column: 7, scope: !2472)
!2482 = !DILocalVariable(name: "k", scope: !2483, file: !1, line: 747, type: !6)
!2483 = distinct !DILexicalBlock(scope: !2472, file: !1, line: 747, column: 7)
!2484 = !DILocation(line: 747, column: 16, scope: !2483)
!2485 = !DILocation(line: 747, column: 12, scope: !2483)
!2486 = !DILocation(line: 747, column: 23, scope: !2487)
!2487 = !DILexicalBlockFile(scope: !2488, file: !1, discriminator: 1)
!2488 = distinct !DILexicalBlock(scope: !2483, file: !1, line: 747, column: 7)
!2489 = !DILocation(line: 747, column: 27, scope: !2487)
!2490 = !DILocation(line: 747, column: 36, scope: !2487)
!2491 = !DILocation(line: 747, column: 25, scope: !2487)
!2492 = !DILocation(line: 747, column: 7, scope: !2487)
!2493 = !DILocation(line: 748, column: 10, scope: !2494)
!2494 = distinct !DILexicalBlock(scope: !2488, file: !1, line: 747, column: 47)
!2495 = !DILocation(line: 748, column: 42, scope: !2494)
!2496 = !DILocation(line: 748, column: 22, scope: !2494)
!2497 = !DILocation(line: 748, column: 33, scope: !2494)
!2498 = !DILocation(line: 748, column: 31, scope: !2494)
!2499 = !DILocation(line: 748, column: 36, scope: !2494)
!2500 = !DILocation(line: 748, column: 2, scope: !2494)
!2501 = !DILocation(line: 749, column: 7, scope: !2494)
!2502 = !DILocation(line: 747, column: 42, scope: !2503)
!2503 = !DILexicalBlockFile(scope: !2488, file: !1, discriminator: 2)
!2504 = !DILocation(line: 747, column: 7, scope: !2503)
!2505 = distinct !{!2505, !2506}
!2506 = !DILocation(line: 747, column: 7, scope: !2472)
!2507 = !DILocation(line: 750, column: 15, scope: !2472)
!2508 = !DILocation(line: 750, column: 7, scope: !2472)
!2509 = !DILocation(line: 751, column: 5, scope: !2472)
!2510 = !DILocation(line: 752, column: 3, scope: !2468)
!2511 = !DILocation(line: 743, column: 38, scope: !2512)
!2512 = !DILexicalBlockFile(scope: !2461, file: !1, discriminator: 2)
!2513 = !DILocation(line: 743, column: 3, scope: !2512)
!2514 = distinct !{!2514, !2515}
!2515 = !DILocation(line: 743, column: 3, scope: !2403)
!2516 = !DILocation(line: 753, column: 10, scope: !2403)
!2517 = !DILocation(line: 753, column: 3, scope: !2403)
!2518 = !DILocation(line: 754, column: 1, scope: !2403)
!2519 = distinct !DISubprogram(name: "streamCluster", linkageName: "_Z13streamClusterP7PStreamllillPc", scope: !1, file: !1, line: 756, type: !2520, isLocal: false, isDefinition: true, scopeLine: 759, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!2520 = !DISubroutineType(types: !2521)
!2521 = !{null, !2522, !8, !8, !6, !8, !8, !245}
!2522 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2523, size: 64, align: 64)
!2523 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "PStream", file: !13, line: 63, size: 64, align: 64, elements: !2524, vtableHolder: !2523, identifier: "_ZTS7PStream")
!2524 = !{!2525, !2528, !2532, !2535, !2536}
!2525 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$PStream", scope: !13, file: !13, baseType: !2526, size: 64, flags: DIFlagArtificial)
!2526 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2527, size: 64)
!2527 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !567, size: 64)
!2528 = !DISubprogram(name: "read", linkageName: "_ZN7PStream4readEPfii", scope: !2523, file: !13, line: 65, type: !2529, isLocal: false, isDefinition: false, scopeLine: 65, containingType: !2523, virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2529 = !DISubroutineType(types: !2530)
!2530 = !{!171, !2531, !4, !6, !6}
!2531 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2523, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2532 = !DISubprogram(name: "ferror", linkageName: "_ZN7PStream6ferrorEv", scope: !2523, file: !13, line: 66, type: !2533, isLocal: false, isDefinition: false, scopeLine: 66, containingType: !2523, virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2533 = !DISubroutineType(types: !2534)
!2534 = !{!6, !2531}
!2535 = !DISubprogram(name: "feof", linkageName: "_ZN7PStream4feofEv", scope: !2523, file: !13, line: 67, type: !2533, isLocal: false, isDefinition: false, scopeLine: 67, containingType: !2523, virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2536 = !DISubprogram(name: "~PStream", scope: !2523, file: !13, line: 68, type: !2537, isLocal: false, isDefinition: false, scopeLine: 68, containingType: !2523, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2537 = !DISubroutineType(types: !2538)
!2538 = !{null, !2531}
!2539 = !DILocalVariable(name: "stream", arg: 1, scope: !2519, file: !1, line: 756, type: !2522)
!2540 = !DILocation(line: 756, column: 30, scope: !2519)
!2541 = !DILocalVariable(name: "kmin", arg: 2, scope: !2519, file: !1, line: 757, type: !8)
!2542 = !DILocation(line: 757, column: 12, scope: !2519)
!2543 = !DILocalVariable(name: "kmax", arg: 3, scope: !2519, file: !1, line: 757, type: !8)
!2544 = !DILocation(line: 757, column: 23, scope: !2519)
!2545 = !DILocalVariable(name: "dim", arg: 4, scope: !2519, file: !1, line: 757, type: !6)
!2546 = !DILocation(line: 757, column: 33, scope: !2519)
!2547 = !DILocalVariable(name: "chunksize", arg: 5, scope: !2519, file: !1, line: 758, type: !8)
!2548 = !DILocation(line: 758, column: 12, scope: !2519)
!2549 = !DILocalVariable(name: "centersize", arg: 6, scope: !2519, file: !1, line: 758, type: !8)
!2550 = !DILocation(line: 758, column: 28, scope: !2519)
!2551 = !DILocalVariable(name: "outfile", arg: 7, scope: !2519, file: !1, line: 758, type: !245)
!2552 = !DILocation(line: 758, column: 46, scope: !2519)
!2553 = !DILocalVariable(name: "block", scope: !2519, file: !1, line: 760, type: !4)
!2554 = !DILocation(line: 760, column: 10, scope: !2519)
!2555 = !DILocation(line: 760, column: 34, scope: !2519)
!2556 = !DILocation(line: 760, column: 44, scope: !2519)
!2557 = !DILocation(line: 760, column: 43, scope: !2519)
!2558 = !DILocation(line: 760, column: 47, scope: !2519)
!2559 = !DILocation(line: 760, column: 26, scope: !2519)
!2560 = !DILocation(line: 760, column: 18, scope: !2519)
!2561 = !DILocalVariable(name: "centerBlock", scope: !2519, file: !1, line: 761, type: !4)
!2562 = !DILocation(line: 761, column: 10, scope: !2519)
!2563 = !DILocation(line: 761, column: 39, scope: !2519)
!2564 = !DILocation(line: 761, column: 50, scope: !2519)
!2565 = !DILocation(line: 761, column: 49, scope: !2519)
!2566 = !DILocation(line: 761, column: 53, scope: !2519)
!2567 = !DILocation(line: 761, column: 32, scope: !2519)
!2568 = !DILocation(line: 761, column: 24, scope: !2519)
!2569 = !DILocalVariable(name: "centerIDs", scope: !2519, file: !1, line: 762, type: !34)
!2570 = !DILocation(line: 762, column: 9, scope: !2519)
!2571 = !DILocation(line: 762, column: 35, scope: !2519)
!2572 = !DILocation(line: 762, column: 46, scope: !2519)
!2573 = !DILocation(line: 762, column: 45, scope: !2519)
!2574 = !DILocation(line: 762, column: 49, scope: !2519)
!2575 = !DILocation(line: 762, column: 28, scope: !2519)
!2576 = !DILocation(line: 762, column: 21, scope: !2519)
!2577 = !DILocation(line: 764, column: 7, scope: !2578)
!2578 = distinct !DILexicalBlock(scope: !2519, file: !1, line: 764, column: 7)
!2579 = !DILocation(line: 764, column: 13, scope: !2578)
!2580 = !DILocation(line: 764, column: 7, scope: !2519)
!2581 = !DILocation(line: 765, column: 13, scope: !2582)
!2582 = distinct !DILexicalBlock(scope: !2578, file: !1, line: 764, column: 23)
!2583 = !DILocation(line: 765, column: 5, scope: !2582)
!2584 = !DILocation(line: 766, column: 5, scope: !2582)
!2585 = !DILocalVariable(name: "points", scope: !2519, file: !1, line: 769, type: !17)
!2586 = !DILocation(line: 769, column: 10, scope: !2519)
!2587 = !DILocation(line: 770, column: 16, scope: !2519)
!2588 = !DILocation(line: 770, column: 10, scope: !2519)
!2589 = !DILocation(line: 770, column: 14, scope: !2519)
!2590 = !DILocation(line: 771, column: 16, scope: !2519)
!2591 = !DILocation(line: 771, column: 10, scope: !2519)
!2592 = !DILocation(line: 771, column: 14, scope: !2519)
!2593 = !DILocation(line: 772, column: 30, scope: !2519)
!2594 = !DILocation(line: 772, column: 39, scope: !2519)
!2595 = !DILocation(line: 772, column: 23, scope: !2519)
!2596 = !DILocation(line: 772, column: 14, scope: !2519)
!2597 = !DILocation(line: 772, column: 10, scope: !2519)
!2598 = !DILocation(line: 772, column: 12, scope: !2519)
!2599 = !DILocalVariable(name: "i", scope: !2600, file: !1, line: 773, type: !6)
!2600 = distinct !DILexicalBlock(scope: !2519, file: !1, line: 773, column: 3)
!2601 = !DILocation(line: 773, column: 12, scope: !2600)
!2602 = !DILocation(line: 773, column: 8, scope: !2600)
!2603 = !DILocation(line: 773, column: 19, scope: !2604)
!2604 = !DILexicalBlockFile(scope: !2605, file: !1, discriminator: 1)
!2605 = distinct !DILexicalBlock(scope: !2600, file: !1, line: 773, column: 3)
!2606 = !DILocation(line: 773, column: 23, scope: !2604)
!2607 = !DILocation(line: 773, column: 21, scope: !2604)
!2608 = !DILocation(line: 773, column: 3, scope: !2604)
!2609 = !DILocation(line: 774, column: 32, scope: !2610)
!2610 = distinct !DILexicalBlock(scope: !2605, file: !1, line: 773, column: 40)
!2611 = !DILocation(line: 774, column: 34, scope: !2610)
!2612 = !DILocation(line: 774, column: 33, scope: !2610)
!2613 = !DILocation(line: 774, column: 26, scope: !2610)
!2614 = !DILocation(line: 774, column: 14, scope: !2610)
!2615 = !DILocation(line: 774, column: 5, scope: !2610)
!2616 = !DILocation(line: 774, column: 12, scope: !2610)
!2617 = !DILocation(line: 774, column: 17, scope: !2610)
!2618 = !DILocation(line: 774, column: 23, scope: !2610)
!2619 = !DILocation(line: 775, column: 3, scope: !2610)
!2620 = !DILocation(line: 773, column: 35, scope: !2621)
!2621 = !DILexicalBlockFile(scope: !2605, file: !1, discriminator: 2)
!2622 = !DILocation(line: 773, column: 3, scope: !2621)
!2623 = distinct !{!2623, !2624}
!2624 = !DILocation(line: 773, column: 3, scope: !2519)
!2625 = !DILocalVariable(name: "centers", scope: !2519, file: !1, line: 778, type: !17)
!2626 = !DILocation(line: 778, column: 10, scope: !2519)
!2627 = !DILocation(line: 779, column: 17, scope: !2519)
!2628 = !DILocation(line: 779, column: 11, scope: !2519)
!2629 = !DILocation(line: 779, column: 15, scope: !2519)
!2630 = !DILocation(line: 780, column: 31, scope: !2519)
!2631 = !DILocation(line: 780, column: 41, scope: !2519)
!2632 = !DILocation(line: 780, column: 24, scope: !2519)
!2633 = !DILocation(line: 780, column: 15, scope: !2519)
!2634 = !DILocation(line: 780, column: 11, scope: !2519)
!2635 = !DILocation(line: 780, column: 13, scope: !2519)
!2636 = !DILocation(line: 781, column: 11, scope: !2519)
!2637 = !DILocation(line: 781, column: 15, scope: !2519)
!2638 = !DILocalVariable(name: "i", scope: !2639, file: !1, line: 783, type: !6)
!2639 = distinct !DILexicalBlock(scope: !2519, file: !1, line: 783, column: 3)
!2640 = !DILocation(line: 783, column: 12, scope: !2639)
!2641 = !DILocation(line: 783, column: 8, scope: !2639)
!2642 = !DILocation(line: 783, column: 19, scope: !2643)
!2643 = !DILexicalBlockFile(scope: !2644, file: !1, discriminator: 1)
!2644 = distinct !DILexicalBlock(scope: !2639, file: !1, line: 783, column: 3)
!2645 = !DILocation(line: 783, column: 22, scope: !2643)
!2646 = !DILocation(line: 783, column: 20, scope: !2643)
!2647 = !DILocation(line: 783, column: 3, scope: !2643)
!2648 = !DILocation(line: 784, column: 39, scope: !2649)
!2649 = distinct !DILexicalBlock(scope: !2644, file: !1, line: 783, column: 40)
!2650 = !DILocation(line: 784, column: 41, scope: !2649)
!2651 = !DILocation(line: 784, column: 40, scope: !2649)
!2652 = !DILocation(line: 784, column: 27, scope: !2649)
!2653 = !DILocation(line: 784, column: 15, scope: !2649)
!2654 = !DILocation(line: 784, column: 5, scope: !2649)
!2655 = !DILocation(line: 784, column: 13, scope: !2649)
!2656 = !DILocation(line: 784, column: 18, scope: !2649)
!2657 = !DILocation(line: 784, column: 24, scope: !2649)
!2658 = !DILocation(line: 785, column: 15, scope: !2649)
!2659 = !DILocation(line: 785, column: 5, scope: !2649)
!2660 = !DILocation(line: 785, column: 13, scope: !2649)
!2661 = !DILocation(line: 785, column: 18, scope: !2649)
!2662 = !DILocation(line: 785, column: 25, scope: !2649)
!2663 = !DILocation(line: 786, column: 3, scope: !2649)
!2664 = !DILocation(line: 783, column: 35, scope: !2665)
!2665 = !DILexicalBlockFile(scope: !2644, file: !1, discriminator: 2)
!2666 = !DILocation(line: 783, column: 3, scope: !2665)
!2667 = distinct !{!2667, !2668}
!2668 = !DILocation(line: 783, column: 3, scope: !2519)
!2669 = !DILocalVariable(name: "IDoffset", scope: !2519, file: !1, line: 788, type: !8)
!2670 = !DILocation(line: 788, column: 8, scope: !2519)
!2671 = !DILocalVariable(name: "kfinal", scope: !2519, file: !1, line: 789, type: !8)
!2672 = !DILocation(line: 789, column: 8, scope: !2519)
!2673 = !DILocation(line: 790, column: 3, scope: !2519)
!2674 = !DILocalVariable(name: "numRead", scope: !2675, file: !1, line: 792, type: !171)
!2675 = distinct !DILexicalBlock(scope: !2519, file: !1, line: 790, column: 12)
!2676 = !DILocation(line: 792, column: 12, scope: !2675)
!2677 = !DILocation(line: 792, column: 23, scope: !2675)
!2678 = !DILocation(line: 792, column: 31, scope: !2675)
!2679 = !DILocation(line: 792, column: 36, scope: !2675)
!2680 = !DILocation(line: 792, column: 43, scope: !2675)
!2681 = !DILocation(line: 792, column: 48, scope: !2675)
!2682 = !DILocation(line: 793, column: 13, scope: !2675)
!2683 = !DILocation(line: 793, column: 39, scope: !2675)
!2684 = !DILocation(line: 793, column: 5, scope: !2675)
!2685 = !DILocation(line: 795, column: 9, scope: !2686)
!2686 = distinct !DILexicalBlock(scope: !2675, file: !1, line: 795, column: 9)
!2687 = !DILocation(line: 795, column: 17, scope: !2686)
!2688 = !DILocation(line: 795, column: 26, scope: !2686)
!2689 = !DILocation(line: 795, column: 29, scope: !2690)
!2690 = !DILexicalBlockFile(scope: !2686, file: !1, discriminator: 1)
!2691 = !DILocation(line: 795, column: 53, scope: !2690)
!2692 = !DILocation(line: 795, column: 39, scope: !2690)
!2693 = !DILocation(line: 795, column: 37, scope: !2690)
!2694 = !DILocation(line: 795, column: 63, scope: !2690)
!2695 = !DILocation(line: 795, column: 67, scope: !2696)
!2696 = !DILexicalBlockFile(scope: !2686, file: !1, discriminator: 2)
!2697 = !DILocation(line: 795, column: 75, scope: !2696)
!2698 = !DILocation(line: 795, column: 9, scope: !2696)
!2699 = !DILocation(line: 796, column: 15, scope: !2700)
!2700 = distinct !DILexicalBlock(scope: !2686, file: !1, line: 795, column: 84)
!2701 = !DILocation(line: 796, column: 7, scope: !2700)
!2702 = !DILocation(line: 797, column: 7, scope: !2700)
!2703 = !DILocation(line: 800, column: 18, scope: !2675)
!2704 = !DILocation(line: 800, column: 12, scope: !2675)
!2705 = !DILocation(line: 800, column: 16, scope: !2675)
!2706 = !DILocalVariable(name: "i", scope: !2707, file: !1, line: 801, type: !6)
!2707 = distinct !DILexicalBlock(scope: !2675, file: !1, line: 801, column: 5)
!2708 = !DILocation(line: 801, column: 14, scope: !2707)
!2709 = !DILocation(line: 801, column: 10, scope: !2707)
!2710 = !DILocation(line: 801, column: 21, scope: !2711)
!2711 = !DILexicalBlockFile(scope: !2712, file: !1, discriminator: 1)
!2712 = distinct !DILexicalBlock(scope: !2707, file: !1, line: 801, column: 5)
!2713 = !DILocation(line: 801, column: 32, scope: !2711)
!2714 = !DILocation(line: 801, column: 23, scope: !2711)
!2715 = !DILocation(line: 801, column: 5, scope: !2711)
!2716 = !DILocation(line: 802, column: 16, scope: !2717)
!2717 = distinct !DILexicalBlock(scope: !2712, file: !1, line: 801, column: 43)
!2718 = !DILocation(line: 802, column: 7, scope: !2717)
!2719 = !DILocation(line: 802, column: 14, scope: !2717)
!2720 = !DILocation(line: 802, column: 19, scope: !2717)
!2721 = !DILocation(line: 802, column: 26, scope: !2717)
!2722 = !DILocation(line: 803, column: 5, scope: !2717)
!2723 = !DILocation(line: 801, column: 38, scope: !2724)
!2724 = !DILexicalBlockFile(scope: !2712, file: !1, discriminator: 2)
!2725 = !DILocation(line: 801, column: 5, scope: !2724)
!2726 = distinct !{!2726, !2727}
!2727 = !DILocation(line: 801, column: 5, scope: !2675)
!2728 = !DILocation(line: 805, column: 46, scope: !2675)
!2729 = !DILocation(line: 805, column: 49, scope: !2675)
!2730 = !DILocation(line: 805, column: 32, scope: !2675)
!2731 = !DILocation(line: 805, column: 23, scope: !2675)
!2732 = !DILocation(line: 806, column: 38, scope: !2675)
!2733 = !DILocation(line: 806, column: 24, scope: !2675)
!2734 = !DILocation(line: 806, column: 15, scope: !2675)
!2735 = !DILocation(line: 807, column: 40, scope: !2675)
!2736 = !DILocation(line: 807, column: 43, scope: !2675)
!2737 = !DILocation(line: 807, column: 26, scope: !2675)
!2738 = !DILocation(line: 807, column: 20, scope: !2675)
!2739 = !DILocation(line: 807, column: 18, scope: !2675)
!2740 = !DILocation(line: 809, column: 25, scope: !2675)
!2741 = !DILocation(line: 809, column: 31, scope: !2675)
!2742 = !DILocation(line: 809, column: 5, scope: !2675)
!2743 = !DILocation(line: 811, column: 13, scope: !2675)
!2744 = !DILocation(line: 811, column: 5, scope: !2675)
!2745 = !DILocation(line: 813, column: 5, scope: !2675)
!2746 = !DILocation(line: 814, column: 17, scope: !2675)
!2747 = !DILocation(line: 816, column: 9, scope: !2748)
!2748 = distinct !DILexicalBlock(scope: !2675, file: !1, line: 816, column: 9)
!2749 = !DILocation(line: 816, column: 26, scope: !2748)
!2750 = !DILocation(line: 816, column: 16, scope: !2748)
!2751 = !DILocation(line: 816, column: 32, scope: !2748)
!2752 = !DILocation(line: 816, column: 30, scope: !2748)
!2753 = !DILocation(line: 816, column: 9, scope: !2675)
!2754 = !DILocation(line: 818, column: 15, scope: !2755)
!2755 = distinct !DILexicalBlock(scope: !2748, file: !1, line: 816, column: 45)
!2756 = !DILocation(line: 818, column: 7, scope: !2755)
!2757 = !DILocation(line: 819, column: 7, scope: !2755)
!2758 = !DILocation(line: 826, column: 36, scope: !2675)
!2759 = !DILocation(line: 826, column: 47, scope: !2675)
!2760 = !DILocation(line: 826, column: 5, scope: !2675)
!2761 = !DILocation(line: 827, column: 17, scope: !2675)
!2762 = !DILocation(line: 827, column: 14, scope: !2675)
!2763 = !DILocation(line: 833, column: 10, scope: !2675)
!2764 = !DILocation(line: 833, column: 5, scope: !2675)
!2765 = !DILocation(line: 834, column: 10, scope: !2675)
!2766 = !DILocation(line: 834, column: 5, scope: !2675)
!2767 = !DILocation(line: 835, column: 10, scope: !2675)
!2768 = !DILocation(line: 835, column: 5, scope: !2675)
!2769 = !DILocation(line: 837, column: 9, scope: !2770)
!2770 = distinct !DILexicalBlock(scope: !2675, file: !1, line: 837, column: 9)
!2771 = !DILocation(line: 837, column: 17, scope: !2770)
!2772 = !DILocation(line: 837, column: 9, scope: !2675)
!2773 = !DILocation(line: 838, column: 7, scope: !2774)
!2774 = distinct !DILexicalBlock(scope: !2770, file: !1, line: 837, column: 26)
!2775 = !DILocation(line: 790, column: 3, scope: !2776)
!2776 = !DILexicalBlockFile(scope: !2519, file: !1, discriminator: 1)
!2777 = distinct !{!2777, !2673}
!2778 = !DILocation(line: 843, column: 45, scope: !2519)
!2779 = !DILocation(line: 843, column: 48, scope: !2519)
!2780 = !DILocation(line: 843, column: 30, scope: !2519)
!2781 = !DILocation(line: 843, column: 21, scope: !2519)
!2782 = !DILocation(line: 844, column: 37, scope: !2519)
!2783 = !DILocation(line: 844, column: 22, scope: !2519)
!2784 = !DILocation(line: 844, column: 13, scope: !2519)
!2785 = !DILocation(line: 845, column: 39, scope: !2519)
!2786 = !DILocation(line: 845, column: 42, scope: !2519)
!2787 = !DILocation(line: 845, column: 24, scope: !2519)
!2788 = !DILocation(line: 845, column: 18, scope: !2519)
!2789 = !DILocation(line: 845, column: 16, scope: !2519)
!2790 = !DILocation(line: 847, column: 26, scope: !2519)
!2791 = !DILocation(line: 847, column: 32, scope: !2519)
!2792 = !DILocation(line: 847, column: 3, scope: !2519)
!2793 = !DILocation(line: 848, column: 3, scope: !2519)
!2794 = !DILocation(line: 849, column: 27, scope: !2519)
!2795 = !DILocation(line: 849, column: 38, scope: !2519)
!2796 = !DILocation(line: 849, column: 3, scope: !2519)
!2797 = !DILocation(line: 850, column: 1, scope: !2519)
!2798 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 852, type: !2799, isLocal: false, isDefinition: true, scopeLine: 853, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!2799 = !DISubroutineType(types: !2800)
!2800 = !{!6, !6, !2801}
!2801 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !245, size: 64, align: 64)
!2802 = !DILocalVariable(name: "argc", arg: 1, scope: !2798, file: !1, line: 852, type: !6)
!2803 = !DILocation(line: 852, column: 14, scope: !2798)
!2804 = !DILocalVariable(name: "argv", arg: 2, scope: !2798, file: !1, line: 852, type: !2801)
!2805 = !DILocation(line: 852, column: 27, scope: !2798)
!2806 = !DILocalVariable(name: "outfilename", scope: !2798, file: !1, line: 854, type: !245)
!2807 = !DILocation(line: 854, column: 9, scope: !2798)
!2808 = !DILocation(line: 854, column: 23, scope: !2798)
!2809 = !DILocalVariable(name: "infilename", scope: !2798, file: !1, line: 855, type: !245)
!2810 = !DILocation(line: 855, column: 9, scope: !2798)
!2811 = !DILocation(line: 855, column: 22, scope: !2798)
!2812 = !DILocalVariable(name: "kmin", scope: !2798, file: !1, line: 856, type: !8)
!2813 = !DILocation(line: 856, column: 8, scope: !2798)
!2814 = !DILocalVariable(name: "kmax", scope: !2798, file: !1, line: 856, type: !8)
!2815 = !DILocation(line: 856, column: 14, scope: !2798)
!2816 = !DILocalVariable(name: "n", scope: !2798, file: !1, line: 856, type: !8)
!2817 = !DILocation(line: 856, column: 20, scope: !2798)
!2818 = !DILocalVariable(name: "chunksize", scope: !2798, file: !1, line: 856, type: !8)
!2819 = !DILocation(line: 856, column: 23, scope: !2798)
!2820 = !DILocalVariable(name: "clustersize", scope: !2798, file: !1, line: 856, type: !8)
!2821 = !DILocation(line: 856, column: 34, scope: !2798)
!2822 = !DILocalVariable(name: "dim", scope: !2798, file: !1, line: 857, type: !6)
!2823 = !DILocation(line: 857, column: 7, scope: !2798)
!2824 = !DILocation(line: 864, column: 9, scope: !2798)
!2825 = !DILocation(line: 865, column: 2, scope: !2798)
!2826 = !DILocation(line: 871, column: 7, scope: !2827)
!2827 = distinct !DILexicalBlock(scope: !2798, file: !1, line: 871, column: 7)
!2828 = !DILocation(line: 871, column: 11, scope: !2827)
!2829 = !DILocation(line: 871, column: 7, scope: !2798)
!2830 = !DILocation(line: 872, column: 13, scope: !2831)
!2831 = distinct !DILexicalBlock(scope: !2827, file: !1, line: 871, column: 16)
!2832 = !DILocation(line: 873, column: 6, scope: !2831)
!2833 = !DILocation(line: 872, column: 5, scope: !2831)
!2834 = !DILocation(line: 874, column: 13, scope: !2831)
!2835 = !DILocation(line: 874, column: 5, scope: !2831)
!2836 = !DILocation(line: 875, column: 13, scope: !2831)
!2837 = !DILocation(line: 875, column: 5, scope: !2831)
!2838 = !DILocation(line: 876, column: 13, scope: !2831)
!2839 = !DILocation(line: 876, column: 5, scope: !2831)
!2840 = !DILocation(line: 877, column: 13, scope: !2831)
!2841 = !DILocation(line: 877, column: 5, scope: !2831)
!2842 = !DILocation(line: 878, column: 13, scope: !2831)
!2843 = !DILocation(line: 878, column: 5, scope: !2831)
!2844 = !DILocation(line: 879, column: 13, scope: !2831)
!2845 = !DILocation(line: 879, column: 5, scope: !2831)
!2846 = !DILocation(line: 880, column: 13, scope: !2831)
!2847 = !DILocation(line: 880, column: 5, scope: !2831)
!2848 = !DILocation(line: 881, column: 13, scope: !2831)
!2849 = !DILocation(line: 881, column: 5, scope: !2831)
!2850 = !DILocation(line: 882, column: 13, scope: !2831)
!2851 = !DILocation(line: 882, column: 5, scope: !2831)
!2852 = !DILocation(line: 883, column: 13, scope: !2831)
!2853 = !DILocation(line: 883, column: 5, scope: !2831)
!2854 = !DILocation(line: 884, column: 13, scope: !2831)
!2855 = !DILocation(line: 884, column: 5, scope: !2831)
!2856 = !DILocation(line: 885, column: 5, scope: !2831)
!2857 = !DILocation(line: 887, column: 15, scope: !2798)
!2858 = !DILocation(line: 887, column: 10, scope: !2798)
!2859 = !DILocation(line: 887, column: 8, scope: !2798)
!2860 = !DILocation(line: 888, column: 15, scope: !2798)
!2861 = !DILocation(line: 888, column: 10, scope: !2798)
!2862 = !DILocation(line: 888, column: 8, scope: !2798)
!2863 = !DILocation(line: 889, column: 14, scope: !2798)
!2864 = !DILocation(line: 889, column: 9, scope: !2798)
!2865 = !DILocation(line: 889, column: 7, scope: !2798)
!2866 = !DILocation(line: 890, column: 12, scope: !2798)
!2867 = !DILocation(line: 890, column: 7, scope: !2798)
!2868 = !DILocation(line: 890, column: 5, scope: !2798)
!2869 = !DILocation(line: 891, column: 20, scope: !2798)
!2870 = !DILocation(line: 891, column: 15, scope: !2798)
!2871 = !DILocation(line: 891, column: 13, scope: !2798)
!2872 = !DILocation(line: 892, column: 22, scope: !2798)
!2873 = !DILocation(line: 892, column: 17, scope: !2798)
!2874 = !DILocation(line: 892, column: 15, scope: !2798)
!2875 = !DILocation(line: 893, column: 10, scope: !2798)
!2876 = !DILocation(line: 893, column: 22, scope: !2798)
!2877 = !DILocation(line: 893, column: 3, scope: !2798)
!2878 = !DILocation(line: 894, column: 10, scope: !2798)
!2879 = !DILocation(line: 894, column: 23, scope: !2798)
!2880 = !DILocation(line: 894, column: 3, scope: !2798)
!2881 = !DILocation(line: 895, column: 16, scope: !2798)
!2882 = !DILocation(line: 895, column: 11, scope: !2798)
!2883 = !DILocation(line: 895, column: 9, scope: !2798)
!2884 = !DILocation(line: 897, column: 3, scope: !2798)
!2885 = !DILocalVariable(name: "stream", scope: !2798, file: !1, line: 898, type: !2522)
!2886 = !DILocation(line: 898, column: 12, scope: !2798)
!2887 = !DILocation(line: 899, column: 7, scope: !2888)
!2888 = distinct !DILexicalBlock(scope: !2798, file: !1, line: 899, column: 7)
!2889 = !DILocation(line: 899, column: 9, scope: !2888)
!2890 = !DILocation(line: 899, column: 7, scope: !2798)
!2891 = !DILocation(line: 900, column: 14, scope: !2892)
!2892 = distinct !DILexicalBlock(scope: !2888, file: !1, line: 899, column: 15)
!2893 = !DILocation(line: 900, column: 28, scope: !2892)
!2894 = !DILocation(line: 900, column: 18, scope: !2892)
!2895 = !DILocation(line: 900, column: 14, scope: !2896)
!2896 = !DILexicalBlockFile(scope: !2892, file: !1, discriminator: 1)
!2897 = !DILocation(line: 900, column: 12, scope: !2896)
!2898 = !DILocation(line: 901, column: 3, scope: !2892)
!2899 = !DILocation(line: 959, column: 1, scope: !2892)
!2900 = !DILocation(line: 900, column: 14, scope: !2901)
!2901 = !DILexicalBlockFile(scope: !2892, file: !1, discriminator: 2)
!2902 = !DILocation(line: 903, column: 14, scope: !2903)
!2903 = distinct !DILexicalBlock(scope: !2888, file: !1, line: 902, column: 8)
!2904 = !DILocation(line: 903, column: 29, scope: !2903)
!2905 = !DILocation(line: 903, column: 18, scope: !2903)
!2906 = !DILocation(line: 903, column: 14, scope: !2907)
!2907 = !DILexicalBlockFile(scope: !2903, file: !1, discriminator: 1)
!2908 = !DILocation(line: 903, column: 12, scope: !2907)
!2909 = !DILocation(line: 959, column: 1, scope: !2907)
!2910 = !DILocation(line: 903, column: 14, scope: !2911)
!2911 = !DILexicalBlockFile(scope: !2903, file: !1, discriminator: 2)
!2912 = !DILocalVariable(name: "t1", scope: !2798, file: !1, line: 906, type: !69)
!2913 = !DILocation(line: 906, column: 10, scope: !2798)
!2914 = !DILocation(line: 906, column: 15, scope: !2798)
!2915 = !DILocation(line: 912, column: 11, scope: !2798)
!2916 = !DILocation(line: 913, column: 15, scope: !2798)
!2917 = !DILocation(line: 914, column: 15, scope: !2798)
!2918 = !DILocation(line: 915, column: 10, scope: !2798)
!2919 = !DILocation(line: 916, column: 9, scope: !2798)
!2920 = !DILocation(line: 917, column: 11, scope: !2798)
!2921 = !DILocation(line: 919, column: 17, scope: !2798)
!2922 = !DILocation(line: 921, column: 17, scope: !2798)
!2923 = !DILocation(line: 921, column: 25, scope: !2798)
!2924 = !DILocation(line: 921, column: 31, scope: !2798)
!2925 = !DILocation(line: 921, column: 37, scope: !2798)
!2926 = !DILocation(line: 921, column: 42, scope: !2798)
!2927 = !DILocation(line: 921, column: 53, scope: !2798)
!2928 = !DILocation(line: 921, column: 66, scope: !2798)
!2929 = !DILocation(line: 921, column: 3, scope: !2798)
!2930 = !DILocation(line: 923, column: 2, scope: !2798)
!2931 = !DILocation(line: 924, column: 2, scope: !2798)
!2932 = !DILocalVariable(name: "t2", scope: !2798, file: !1, line: 930, type: !69)
!2933 = !DILocation(line: 930, column: 10, scope: !2798)
!2934 = !DILocation(line: 930, column: 15, scope: !2798)
!2935 = !DILocation(line: 932, column: 26, scope: !2798)
!2936 = !DILocation(line: 932, column: 29, scope: !2798)
!2937 = !DILocation(line: 932, column: 28, scope: !2798)
!2938 = !DILocation(line: 932, column: 3, scope: !2798)
!2939 = !DILocation(line: 934, column: 10, scope: !2798)
!2940 = !DILocation(line: 934, column: 3, scope: !2798)
!2941 = !DILocation(line: 934, column: 3, scope: !2942)
!2942 = !DILexicalBlockFile(scope: !2798, file: !1, discriminator: 1)
!2943 = !DILocation(line: 937, column: 33, scope: !2798)
!2944 = !DILocation(line: 937, column: 3, scope: !2798)
!2945 = !DILocation(line: 938, column: 38, scope: !2798)
!2946 = !DILocation(line: 938, column: 3, scope: !2798)
!2947 = !DILocation(line: 939, column: 38, scope: !2798)
!2948 = !DILocation(line: 939, column: 3, scope: !2798)
!2949 = !DILocation(line: 940, column: 35, scope: !2798)
!2950 = !DILocation(line: 940, column: 3, scope: !2798)
!2951 = !DILocation(line: 941, column: 35, scope: !2798)
!2952 = !DILocation(line: 941, column: 3, scope: !2798)
!2953 = !DILocation(line: 942, column: 36, scope: !2798)
!2954 = !DILocation(line: 942, column: 3, scope: !2798)
!2955 = !DILocation(line: 943, column: 39, scope: !2798)
!2956 = !DILocation(line: 943, column: 3, scope: !2798)
!2957 = !DILocation(line: 944, column: 3, scope: !2798)
!2958 = !DILocation(line: 945, column: 3, scope: !2798)
!2959 = !DILocation(line: 946, column: 34, scope: !2798)
!2960 = !DILocation(line: 946, column: 42, scope: !2798)
!2961 = !DILocation(line: 946, column: 3, scope: !2798)
!2962 = !DILocation(line: 947, column: 50, scope: !2798)
!2963 = !DILocation(line: 947, column: 62, scope: !2798)
!2964 = !DILocation(line: 947, column: 3, scope: !2798)
!2965 = !DILocation(line: 948, column: 55, scope: !2798)
!2966 = !DILocation(line: 948, column: 67, scope: !2798)
!2967 = !DILocation(line: 948, column: 3, scope: !2798)
!2968 = !DILocation(line: 949, column: 38, scope: !2798)
!2969 = !DILocation(line: 949, column: 45, scope: !2798)
!2970 = !DILocation(line: 949, column: 3, scope: !2798)
!2971 = !DILocation(line: 950, column: 36, scope: !2798)
!2972 = !DILocation(line: 950, column: 42, scope: !2798)
!2973 = !DILocation(line: 950, column: 3, scope: !2798)
!2974 = !DILocation(line: 951, column: 34, scope: !2798)
!2975 = !DILocation(line: 951, column: 42, scope: !2798)
!2976 = !DILocation(line: 951, column: 3, scope: !2798)
!2977 = !DILocation(line: 958, column: 3, scope: !2798)
!2978 = !DILocation(line: 900, column: 14, scope: !2979)
!2979 = !DILexicalBlockFile(scope: !2892, file: !1, discriminator: 3)
!2980 = distinct !DISubprogram(name: "SimStream", linkageName: "_ZN9SimStreamC2El", scope: !2981, file: !13, line: 75, type: !2986, isLocal: false, isDefinition: true, scopeLine: 75, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !2985, variables: !2)
!2981 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "SimStream", file: !13, line: 73, size: 128, align: 64, elements: !2982, vtableHolder: !2523, identifier: "_ZTS9SimStream")
!2982 = !{!2983, !2984, !2985, !2989, !2992, !2995, !2996}
!2983 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2981, baseType: !2523, flags: DIFlagPublic)
!2984 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !2981, file: !13, line: 98, baseType: !8, size: 64, align: 64, offset: 64)
!2985 = !DISubprogram(name: "SimStream", scope: !2981, file: !13, line: 75, type: !2986, isLocal: false, isDefinition: false, scopeLine: 75, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2986 = !DISubroutineType(types: !2987)
!2987 = !{null, !2988, !8}
!2988 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2981, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2989 = !DISubprogram(name: "read", linkageName: "_ZN9SimStream4readEPfii", scope: !2981, file: !13, line: 78, type: !2990, isLocal: false, isDefinition: false, scopeLine: 78, containingType: !2981, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2990 = !DISubroutineType(types: !2991)
!2991 = !{!171, !2988, !4, !6, !6}
!2992 = !DISubprogram(name: "ferror", linkageName: "_ZN9SimStream6ferrorEv", scope: !2981, file: !13, line: 89, type: !2993, isLocal: false, isDefinition: false, scopeLine: 89, containingType: !2981, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2993 = !DISubroutineType(types: !2994)
!2994 = !{!6, !2988}
!2995 = !DISubprogram(name: "feof", linkageName: "_ZN9SimStream4feofEv", scope: !2981, file: !13, line: 92, type: !2993, isLocal: false, isDefinition: false, scopeLine: 92, containingType: !2981, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2996 = !DISubprogram(name: "~SimStream", scope: !2981, file: !13, line: 95, type: !2997, isLocal: false, isDefinition: false, scopeLine: 95, containingType: !2981, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2997 = !DISubroutineType(types: !2998)
!2998 = !{null, !2988}
!2999 = !DILocalVariable(name: "this", arg: 1, scope: !2980, type: !3000, flags: DIFlagArtificial | DIFlagObjectPointer)
!3000 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2981, size: 64, align: 64)
!3001 = !DILocation(line: 0, scope: !2980)
!3002 = !DILocalVariable(name: "n_", arg: 2, scope: !2980, file: !13, line: 75, type: !8)
!3003 = !DILocation(line: 75, column: 18, scope: !2980)
!3004 = !DILocation(line: 75, column: 23, scope: !2980)
!3005 = !DILocation(line: 75, column: 3, scope: !2980)
!3006 = !DILocation(line: 76, column: 9, scope: !3007)
!3007 = distinct !DILexicalBlock(scope: !2980, file: !13, line: 75, column: 23)
!3008 = !DILocation(line: 76, column: 5, scope: !3007)
!3009 = !DILocation(line: 76, column: 7, scope: !3007)
!3010 = !DILocation(line: 77, column: 3, scope: !2980)
!3011 = distinct !DISubprogram(name: "FileStream", linkageName: "_ZN10FileStreamC2EPc", scope: !3012, file: !13, line: 103, type: !3017, isLocal: false, isDefinition: true, scopeLine: 103, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !3016, variables: !2)
!3012 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "FileStream", file: !13, line: 101, size: 128, align: 64, elements: !3013, vtableHolder: !2523, identifier: "_ZTS10FileStream")
!3013 = !{!3014, !3015, !3016, !3020, !3023, !3026, !3027}
!3014 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !3012, baseType: !2523, flags: DIFlagPublic)
!3015 = !DIDerivedType(tag: DW_TAG_member, name: "fp", scope: !3012, file: !13, line: 124, baseType: !491, size: 64, align: 64, offset: 64)
!3016 = !DISubprogram(name: "FileStream", scope: !3012, file: !13, line: 103, type: !3017, isLocal: false, isDefinition: false, scopeLine: 103, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!3017 = !DISubroutineType(types: !3018)
!3018 = !{null, !3019, !245}
!3019 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3012, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!3020 = !DISubprogram(name: "read", linkageName: "_ZN10FileStream4readEPfii", scope: !3012, file: !13, line: 110, type: !3021, isLocal: false, isDefinition: false, scopeLine: 110, containingType: !3012, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!3021 = !DISubroutineType(types: !3022)
!3022 = !{!171, !3019, !4, !6, !6}
!3023 = !DISubprogram(name: "ferror", linkageName: "_ZN10FileStream6ferrorEv", scope: !3012, file: !13, line: 113, type: !3024, isLocal: false, isDefinition: false, scopeLine: 113, containingType: !3012, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!3024 = !DISubroutineType(types: !3025)
!3025 = !{!6, !3019}
!3026 = !DISubprogram(name: "feof", linkageName: "_ZN10FileStream4feofEv", scope: !3012, file: !13, line: 116, type: !3024, isLocal: false, isDefinition: false, scopeLine: 116, containingType: !3012, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!3027 = !DISubprogram(name: "~FileStream", scope: !3012, file: !13, line: 119, type: !3028, isLocal: false, isDefinition: false, scopeLine: 119, containingType: !3012, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!3028 = !DISubroutineType(types: !3029)
!3029 = !{null, !3019}
!3030 = !DILocalVariable(name: "this", arg: 1, scope: !3011, type: !3031, flags: DIFlagArtificial | DIFlagObjectPointer)
!3031 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3012, size: 64, align: 64)
!3032 = !DILocation(line: 0, scope: !3011)
!3033 = !DILocalVariable(name: "filename", arg: 2, scope: !3011, file: !13, line: 103, type: !245)
!3034 = !DILocation(line: 103, column: 20, scope: !3011)
!3035 = !DILocation(line: 103, column: 30, scope: !3011)
!3036 = !DILocation(line: 103, column: 3, scope: !3011)
!3037 = !DILocation(line: 104, column: 17, scope: !3038)
!3038 = distinct !DILexicalBlock(scope: !3011, file: !13, line: 103, column: 30)
!3039 = !DILocation(line: 104, column: 10, scope: !3038)
!3040 = !DILocation(line: 104, column: 5, scope: !3041)
!3041 = !DILexicalBlockFile(scope: !3038, file: !13, discriminator: 1)
!3042 = !DILocation(line: 104, column: 8, scope: !3041)
!3043 = !DILocation(line: 105, column: 9, scope: !3044)
!3044 = distinct !DILexicalBlock(scope: !3038, file: !13, line: 105, column: 9)
!3045 = !DILocation(line: 105, column: 12, scope: !3044)
!3046 = !DILocation(line: 105, column: 9, scope: !3038)
!3047 = !DILocation(line: 106, column: 15, scope: !3048)
!3048 = distinct !DILexicalBlock(scope: !3044, file: !13, line: 105, column: 22)
!3049 = !DILocation(line: 106, column: 49, scope: !3048)
!3050 = !DILocation(line: 106, column: 7, scope: !3048)
!3051 = !DILocation(line: 107, column: 7, scope: !3048)
!3052 = !DILocation(line: 109, column: 3, scope: !3038)
!3053 = !DILocation(line: 109, column: 3, scope: !3054)
!3054 = !DILexicalBlockFile(scope: !3011, file: !13, discriminator: 1)
!3055 = !DILocation(line: 109, column: 3, scope: !3056)
!3056 = !DILexicalBlockFile(scope: !3038, file: !13, discriminator: 2)
!3057 = !DILocation(line: 109, column: 3, scope: !3058)
!3058 = !DILexicalBlockFile(scope: !3038, file: !13, discriminator: 3)
!3059 = !DILocation(line: 109, column: 3, scope: !3060)
!3060 = !DILexicalBlockFile(scope: !3038, file: !13, discriminator: 4)
!3061 = distinct !DISubprogram(name: "PStream", linkageName: "_ZN7PStreamC2Ev", scope: !2523, file: !13, line: 63, type: !2537, isLocal: false, isDefinition: true, scopeLine: 63, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !3062, variables: !2)
!3062 = !DISubprogram(name: "PStream", scope: !2523, type: !2537, isLocal: false, isDefinition: false, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!3063 = !DILocalVariable(name: "this", arg: 1, scope: !3061, type: !2522, flags: DIFlagArtificial | DIFlagObjectPointer)
!3064 = !DILocation(line: 0, scope: !3061)
!3065 = !DILocation(line: 63, column: 7, scope: !3061)
!3066 = distinct !DISubprogram(name: "read", linkageName: "_ZN9SimStream4readEPfii", scope: !2981, file: !13, line: 78, type: !2990, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !2989, variables: !2)
!3067 = !DILocalVariable(name: "this", arg: 1, scope: !3066, type: !3000, flags: DIFlagArtificial | DIFlagObjectPointer)
!3068 = !DILocation(line: 0, scope: !3066)
!3069 = !DILocalVariable(name: "dest", arg: 2, scope: !3066, file: !13, line: 78, type: !4)
!3070 = !DILocation(line: 78, column: 23, scope: !3066)
!3071 = !DILocalVariable(name: "dim", arg: 3, scope: !3066, file: !13, line: 78, type: !6)
!3072 = !DILocation(line: 78, column: 33, scope: !3066)
!3073 = !DILocalVariable(name: "num", arg: 4, scope: !3066, file: !13, line: 78, type: !6)
!3074 = !DILocation(line: 78, column: 42, scope: !3066)
!3075 = !DILocalVariable(name: "count", scope: !3066, file: !13, line: 79, type: !171)
!3076 = !DILocation(line: 79, column: 12, scope: !3066)
!3077 = !DILocalVariable(name: "i", scope: !3078, file: !13, line: 80, type: !6)
!3078 = distinct !DILexicalBlock(scope: !3066, file: !13, line: 80, column: 5)
!3079 = !DILocation(line: 80, column: 14, scope: !3078)
!3080 = !DILocation(line: 80, column: 10, scope: !3078)
!3081 = !DILocation(line: 80, column: 21, scope: !3082)
!3082 = !DILexicalBlockFile(scope: !3083, file: !13, discriminator: 1)
!3083 = distinct !DILexicalBlock(scope: !3078, file: !13, line: 80, column: 5)
!3084 = !DILocation(line: 80, column: 25, scope: !3082)
!3085 = !DILocation(line: 80, column: 23, scope: !3082)
!3086 = !DILocation(line: 80, column: 29, scope: !3082)
!3087 = !DILocation(line: 80, column: 32, scope: !3088)
!3088 = !DILexicalBlockFile(scope: !3083, file: !13, discriminator: 2)
!3089 = !DILocation(line: 80, column: 34, scope: !3088)
!3090 = !DILocation(line: 80, column: 5, scope: !3091)
!3091 = !DILexicalBlockFile(scope: !3078, file: !13, discriminator: 3)
!3092 = !DILocalVariable(name: "k", scope: !3093, file: !13, line: 81, type: !6)
!3093 = distinct !DILexicalBlock(scope: !3094, file: !13, line: 81, column: 7)
!3094 = distinct !DILexicalBlock(scope: !3083, file: !13, line: 80, column: 45)
!3095 = !DILocation(line: 81, column: 16, scope: !3093)
!3096 = !DILocation(line: 81, column: 12, scope: !3093)
!3097 = !DILocation(line: 81, column: 23, scope: !3098)
!3098 = !DILexicalBlockFile(scope: !3099, file: !13, discriminator: 1)
!3099 = distinct !DILexicalBlock(scope: !3093, file: !13, line: 81, column: 7)
!3100 = !DILocation(line: 81, column: 27, scope: !3098)
!3101 = !DILocation(line: 81, column: 25, scope: !3098)
!3102 = !DILocation(line: 81, column: 7, scope: !3098)
!3103 = !DILocation(line: 82, column: 20, scope: !3104)
!3104 = distinct !DILexicalBlock(scope: !3099, file: !13, line: 81, column: 38)
!3105 = !DILocation(line: 82, column: 29, scope: !3104)
!3106 = !DILocation(line: 82, column: 7, scope: !3104)
!3107 = !DILocation(line: 82, column: 9, scope: !3104)
!3108 = !DILocation(line: 82, column: 8, scope: !3104)
!3109 = !DILocation(line: 82, column: 15, scope: !3104)
!3110 = !DILocation(line: 82, column: 13, scope: !3104)
!3111 = !DILocation(line: 82, column: 2, scope: !3104)
!3112 = !DILocation(line: 82, column: 18, scope: !3104)
!3113 = !DILocation(line: 83, column: 7, scope: !3104)
!3114 = !DILocation(line: 81, column: 33, scope: !3115)
!3115 = !DILexicalBlockFile(scope: !3099, file: !13, discriminator: 2)
!3116 = !DILocation(line: 81, column: 7, scope: !3115)
!3117 = distinct !{!3117, !3118}
!3118 = !DILocation(line: 81, column: 7, scope: !3094)
!3119 = !DILocation(line: 84, column: 7, scope: !3094)
!3120 = !DILocation(line: 84, column: 8, scope: !3094)
!3121 = !DILocation(line: 85, column: 12, scope: !3094)
!3122 = !DILocation(line: 86, column: 5, scope: !3094)
!3123 = !DILocation(line: 80, column: 40, scope: !3124)
!3124 = !DILexicalBlockFile(scope: !3083, file: !13, discriminator: 4)
!3125 = !DILocation(line: 80, column: 5, scope: !3124)
!3126 = distinct !{!3126, !3127}
!3127 = !DILocation(line: 80, column: 5, scope: !3066)
!3128 = !DILocation(line: 87, column: 12, scope: !3066)
!3129 = !DILocation(line: 87, column: 5, scope: !3066)
!3130 = distinct !DISubprogram(name: "ferror", linkageName: "_ZN9SimStream6ferrorEv", scope: !2981, file: !13, line: 89, type: !2993, isLocal: false, isDefinition: true, scopeLine: 89, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !2992, variables: !2)
!3131 = !DILocalVariable(name: "this", arg: 1, scope: !3130, type: !3000, flags: DIFlagArtificial | DIFlagObjectPointer)
!3132 = !DILocation(line: 0, scope: !3130)
!3133 = !DILocation(line: 90, column: 5, scope: !3130)
!3134 = distinct !DISubprogram(name: "feof", linkageName: "_ZN9SimStream4feofEv", scope: !2981, file: !13, line: 92, type: !2993, isLocal: false, isDefinition: true, scopeLine: 92, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !2995, variables: !2)
!3135 = !DILocalVariable(name: "this", arg: 1, scope: !3134, type: !3000, flags: DIFlagArtificial | DIFlagObjectPointer)
!3136 = !DILocation(line: 0, scope: !3134)
!3137 = !DILocation(line: 93, column: 12, scope: !3134)
!3138 = !DILocation(line: 93, column: 14, scope: !3134)
!3139 = !DILocation(line: 93, column: 5, scope: !3134)
!3140 = distinct !DISubprogram(name: "~SimStream", linkageName: "_ZN9SimStreamD2Ev", scope: !2981, file: !13, line: 95, type: !2997, isLocal: false, isDefinition: true, scopeLine: 95, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !2996, variables: !2)
!3141 = !DILocalVariable(name: "this", arg: 1, scope: !3140, type: !3000, flags: DIFlagArtificial | DIFlagObjectPointer)
!3142 = !DILocation(line: 0, scope: !3140)
!3143 = !DILocation(line: 96, column: 3, scope: !3144)
!3144 = distinct !DILexicalBlock(scope: !3140, file: !13, line: 95, column: 16)
!3145 = !DILocation(line: 96, column: 3, scope: !3140)
!3146 = distinct !DISubprogram(name: "~SimStream", linkageName: "_ZN9SimStreamD0Ev", scope: !2981, file: !13, line: 95, type: !2997, isLocal: false, isDefinition: true, scopeLine: 95, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !2996, variables: !2)
!3147 = !DILocalVariable(name: "this", arg: 1, scope: !3146, type: !3000, flags: DIFlagArtificial | DIFlagObjectPointer)
!3148 = !DILocation(line: 0, scope: !3146)
!3149 = !DILocation(line: 95, column: 16, scope: !3146)
!3150 = !DILocation(line: 95, column: 16, scope: !3151)
!3151 = !DILexicalBlockFile(scope: !3146, file: !13, discriminator: 1)
!3152 = !DILocation(line: 96, column: 3, scope: !3146)
!3153 = !DILocation(line: 96, column: 3, scope: !3151)
!3154 = !DILocation(line: 95, column: 16, scope: !3155)
!3155 = !DILexicalBlockFile(scope: !3146, file: !13, discriminator: 2)
!3156 = !DILocation(line: 95, column: 16, scope: !3157)
!3157 = !DILexicalBlockFile(scope: !3146, file: !13, discriminator: 3)
!3158 = distinct !DISubprogram(name: "~PStream", linkageName: "_ZN7PStreamD2Ev", scope: !2523, file: !13, line: 68, type: !2537, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !2536, variables: !2)
!3159 = !DILocalVariable(name: "this", arg: 1, scope: !3158, type: !2522, flags: DIFlagArtificial | DIFlagObjectPointer)
!3160 = !DILocation(line: 0, scope: !3158)
!3161 = !DILocation(line: 69, column: 3, scope: !3158)
!3162 = distinct !DISubprogram(name: "~PStream", linkageName: "_ZN7PStreamD0Ev", scope: !2523, file: !13, line: 68, type: !2537, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !2536, variables: !2)
!3163 = !DILocalVariable(name: "this", arg: 1, scope: !3162, type: !2522, flags: DIFlagArtificial | DIFlagObjectPointer)
!3164 = !DILocation(line: 0, scope: !3162)
!3165 = !DILocation(line: 68, column: 22, scope: !3162)
!3166 = !DILocation(line: 68, column: 22, scope: !3167)
!3167 = !DILexicalBlockFile(scope: !3162, file: !13, discriminator: 1)
!3168 = !DILocation(line: 69, column: 3, scope: !3162)
!3169 = !DILocation(line: 69, column: 3, scope: !3167)
!3170 = !DILocation(line: 68, column: 22, scope: !3171)
!3171 = !DILexicalBlockFile(scope: !3162, file: !13, discriminator: 2)
!3172 = !DILocation(line: 68, column: 22, scope: !3173)
!3173 = !DILexicalBlockFile(scope: !3162, file: !13, discriminator: 3)
!3174 = distinct !DISubprogram(name: "read", linkageName: "_ZN10FileStream4readEPfii", scope: !3012, file: !13, line: 110, type: !3021, isLocal: false, isDefinition: true, scopeLine: 110, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !3020, variables: !2)
!3175 = !DILocalVariable(name: "this", arg: 1, scope: !3174, type: !3031, flags: DIFlagArtificial | DIFlagObjectPointer)
!3176 = !DILocation(line: 0, scope: !3174)
!3177 = !DILocalVariable(name: "dest", arg: 2, scope: !3174, file: !13, line: 110, type: !4)
!3178 = !DILocation(line: 110, column: 23, scope: !3174)
!3179 = !DILocalVariable(name: "dim", arg: 3, scope: !3174, file: !13, line: 110, type: !6)
!3180 = !DILocation(line: 110, column: 33, scope: !3174)
!3181 = !DILocalVariable(name: "num", arg: 4, scope: !3174, file: !13, line: 110, type: !6)
!3182 = !DILocation(line: 110, column: 42, scope: !3174)
!3183 = !DILocation(line: 111, column: 23, scope: !3174)
!3184 = !DILocation(line: 111, column: 43, scope: !3174)
!3185 = !DILocation(line: 111, column: 42, scope: !3174)
!3186 = !DILocation(line: 111, column: 48, scope: !3174)
!3187 = !DILocation(line: 111, column: 53, scope: !3174)
!3188 = !DILocation(line: 111, column: 12, scope: !3174)
!3189 = !DILocation(line: 111, column: 5, scope: !3174)
!3190 = distinct !DISubprogram(name: "ferror", linkageName: "_ZN10FileStream6ferrorEv", scope: !3012, file: !13, line: 113, type: !3024, isLocal: false, isDefinition: true, scopeLine: 113, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !3023, variables: !2)
!3191 = !DILocalVariable(name: "this", arg: 1, scope: !3190, type: !3031, flags: DIFlagArtificial | DIFlagObjectPointer)
!3192 = !DILocation(line: 0, scope: !3190)
!3193 = !DILocation(line: 114, column: 24, scope: !3190)
!3194 = !DILocation(line: 114, column: 12, scope: !3190)
!3195 = !DILocation(line: 114, column: 5, scope: !3190)
!3196 = distinct !DISubprogram(name: "feof", linkageName: "_ZN10FileStream4feofEv", scope: !3012, file: !13, line: 116, type: !3024, isLocal: false, isDefinition: true, scopeLine: 116, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !3026, variables: !2)
!3197 = !DILocalVariable(name: "this", arg: 1, scope: !3196, type: !3031, flags: DIFlagArtificial | DIFlagObjectPointer)
!3198 = !DILocation(line: 0, scope: !3196)
!3199 = !DILocation(line: 117, column: 22, scope: !3196)
!3200 = !DILocation(line: 117, column: 12, scope: !3196)
!3201 = !DILocation(line: 117, column: 5, scope: !3196)
!3202 = distinct !DISubprogram(name: "~FileStream", linkageName: "_ZN10FileStreamD2Ev", scope: !3012, file: !13, line: 119, type: !3028, isLocal: false, isDefinition: true, scopeLine: 119, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !3027, variables: !2)
!3203 = !DILocalVariable(name: "this", arg: 1, scope: !3202, type: !3031, flags: DIFlagArtificial | DIFlagObjectPointer)
!3204 = !DILocation(line: 0, scope: !3202)
!3205 = !DILocation(line: 119, column: 17, scope: !3202)
!3206 = !DILocation(line: 120, column: 5, scope: !3207)
!3207 = distinct !DILexicalBlock(scope: !3202, file: !13, line: 119, column: 17)
!3208 = !DILocation(line: 121, column: 12, scope: !3207)
!3209 = !DILocation(line: 121, column: 5, scope: !3207)
!3210 = !DILocation(line: 122, column: 3, scope: !3207)
!3211 = !DILocation(line: 122, column: 3, scope: !3202)
!3212 = !DILocation(line: 122, column: 3, scope: !3213)
!3213 = !DILexicalBlockFile(scope: !3207, file: !13, discriminator: 1)
!3214 = !DILocation(line: 122, column: 3, scope: !3215)
!3215 = !DILexicalBlockFile(scope: !3207, file: !13, discriminator: 2)
!3216 = !DILocation(line: 122, column: 3, scope: !3217)
!3217 = !DILexicalBlockFile(scope: !3207, file: !13, discriminator: 3)
!3218 = !DILocation(line: 122, column: 3, scope: !3219)
!3219 = !DILexicalBlockFile(scope: !3207, file: !13, discriminator: 4)
!3220 = distinct !DISubprogram(name: "~FileStream", linkageName: "_ZN10FileStreamD0Ev", scope: !3012, file: !13, line: 119, type: !3028, isLocal: false, isDefinition: true, scopeLine: 119, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !3027, variables: !2)
!3221 = !DILocalVariable(name: "this", arg: 1, scope: !3220, type: !3031, flags: DIFlagArtificial | DIFlagObjectPointer)
!3222 = !DILocation(line: 0, scope: !3220)
!3223 = !DILocation(line: 119, column: 17, scope: !3220)
!3224 = !DILocation(line: 119, column: 17, scope: !3225)
!3225 = !DILexicalBlockFile(scope: !3220, file: !13, discriminator: 1)
!3226 = !DILocation(line: 122, column: 3, scope: !3220)
!3227 = !DILocation(line: 122, column: 3, scope: !3225)
!3228 = !DILocation(line: 119, column: 17, scope: !3229)
!3229 = !DILexicalBlockFile(scope: !3220, file: !13, discriminator: 2)
!3230 = !DILocation(line: 119, column: 17, scope: !3231)
!3231 = !DILexicalBlockFile(scope: !3220, file: !13, discriminator: 3)
!3232 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_streamcluster_cuda_cpu.cpp", scope: !1, file: !1, type: !3233, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !0, variables: !2)
!3233 = !DISubroutineType(types: !2)
!3234 = !DILocation(line: 0, scope: !3232)
