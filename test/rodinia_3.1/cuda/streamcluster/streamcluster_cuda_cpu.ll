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

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external global i8
@isCoordChanged = global i8 0, align 1, !dbg !19
@serial_t = global double 0.000000e+00, align 8, !dbg !68
@cpu_to_gpu_t = global double 0.000000e+00, align 8, !dbg !70
@gpu_to_cpu_t = global double 0.000000e+00, align 8, !dbg !71
@alloc_t = global double 0.000000e+00, align 8, !dbg !72
@kernel_t = global double 0.000000e+00, align 8, !dbg !73
@free_t = global double 0.000000e+00, align 8, !dbg !74
@time_local_search = global double 0.000000e+00, align 8, !dbg !75
@time_speedy = global double 0.000000e+00, align 8, !dbg !76
@time_select_feasible = global double 0.000000e+00, align 8, !dbg !77
@time_gain = global double 0.000000e+00, align 8, !dbg !78
@time_shuffle = global double 0.000000e+00, align 8, !dbg !79
@time_gain_dist = global double 0.000000e+00, align 8, !dbg !80
@time_gain_init = global double 0.000000e+00, align 8, !dbg !81
@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@_ZL5nproc = internal global i32 0, align 4, !dbg !96
@_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE9totalcost = internal global float 0.000000e+00, align 4, !dbg !82
@_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE4open = internal global i8 0, align 1, !dbg !86
@_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE5costs = internal global float* null, align 8, !dbg !87
@_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i = internal global i32 0, align 4, !dbg !88
@_ZL9is_center = internal global i8* null, align 8, !dbg !97
@_ZL12center_table = internal global i32* null, align 8, !dbg !98
@_ZL17switch_membership = internal global i8* null, align 8, !dbg !99
@_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k = internal global i64 0, align 8, !dbg !89
@_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE8feasible = internal global i32* null, align 8, !dbg !93
@_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE11numfeasible = internal global i32 0, align 4, !dbg !94
@_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs = internal global float* null, align 8, !dbg !95
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
  %4 = load float*, float** %i.addr, align 8, !dbg !728
  %5 = load i32, i32* %a, align 4, !dbg !731
  %idxprom = sext i32 %5 to i64, !dbg !728
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom, !dbg !728
  %6 = load float, float* %arrayidx, align 4, !dbg !728
  %7 = load float*, float** %j.addr, align 8, !dbg !732
  %8 = load i32, i32* %a, align 4, !dbg !733
  %idxprom1 = sext i32 %8 to i64, !dbg !732
  %arrayidx2 = getelementptr inbounds float, float* %7, i64 %idxprom1, !dbg !732
  %9 = load float, float* %arrayidx2, align 4, !dbg !732
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
  %7 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !785
  %p = getelementptr inbounds %struct.Points, %struct.Points* %7, i32 0, i32 2, !dbg !786
  %8 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !786
  %9 = load i64, i64* %i, align 8, !dbg !787
  %arrayidx = getelementptr inbounds %struct.Point, %struct.Point* %8, i64 %9, !dbg !785
  %10 = bitcast %struct.Point* %temp to i8*, !dbg !788
  %11 = bitcast %struct.Point* %arrayidx to i8*, !dbg !788
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 32, i32 8, i1 false), !dbg !788
  %12 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !789
  %p4 = getelementptr inbounds %struct.Points, %struct.Points* %12, i32 0, i32 2, !dbg !790
  %13 = load %struct.Point*, %struct.Point** %p4, align 8, !dbg !790
  %14 = load i64, i64* %j, align 8, !dbg !791
  %arrayidx5 = getelementptr inbounds %struct.Point, %struct.Point* %13, i64 %14, !dbg !789
  %15 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !792
  %p6 = getelementptr inbounds %struct.Points, %struct.Points* %15, i32 0, i32 2, !dbg !793
  %16 = load %struct.Point*, %struct.Point** %p6, align 8, !dbg !793
  %17 = load i64, i64* %i, align 8, !dbg !794
  %arrayidx7 = getelementptr inbounds %struct.Point, %struct.Point* %16, i64 %17, !dbg !792
  %18 = bitcast %struct.Point* %arrayidx7 to i8*, !dbg !795
  %19 = bitcast %struct.Point* %arrayidx5 to i8*, !dbg !795
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 32, i32 8, i1 false), !dbg !795
  %20 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !796
  %p8 = getelementptr inbounds %struct.Points, %struct.Points* %20, i32 0, i32 2, !dbg !797
  %21 = load %struct.Point*, %struct.Point** %p8, align 8, !dbg !797
  %22 = load i64, i64* %j, align 8, !dbg !798
  %arrayidx9 = getelementptr inbounds %struct.Point, %struct.Point* %21, i64 %22, !dbg !796
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
  %5 = load i32*, i32** %intarray.addr, align 8, !dbg !848
  %6 = load i64, i64* %i, align 8, !dbg !849
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !848
  %7 = load i32, i32* %arrayidx, align 4, !dbg !848
  store i32 %7, i32* %temp, align 4, !dbg !850
  %8 = load i32*, i32** %intarray.addr, align 8, !dbg !851
  %9 = load i64, i64* %j, align 8, !dbg !852
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !851
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !851
  %11 = load i32*, i32** %intarray.addr, align 8, !dbg !853
  %12 = load i64, i64* %i, align 8, !dbg !854
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !853
  store i32 %10, i32* %arrayidx4, align 4, !dbg !855
  %13 = load i32, i32* %temp, align 4, !dbg !856
  %14 = load i32*, i32** %intarray.addr, align 8, !dbg !857
  %15 = load i64, i64* %j, align 8, !dbg !858
  %arrayidx5 = getelementptr inbounds i32, i32* %14, i64 %15, !dbg !857
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
  %coord = getelementptr inbounds %struct.Point, %struct.Point* %p1, i32 0, i32 1, !dbg !896
  %2 = load float*, float** %coord, align 8, !dbg !896
  %3 = load i32, i32* %i, align 4, !dbg !897
  %idxprom = sext i32 %3 to i64, !dbg !898
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom, !dbg !898
  %4 = load float, float* %arrayidx, align 4, !dbg !898
  %coord1 = getelementptr inbounds %struct.Point, %struct.Point* %p2, i32 0, i32 1, !dbg !899
  %5 = load float*, float** %coord1, align 8, !dbg !899
  %6 = load i32, i32* %i, align 4, !dbg !900
  %idxprom2 = sext i32 %6 to i64, !dbg !901
  %arrayidx3 = getelementptr inbounds float, float* %5, i64 %idxprom2, !dbg !901
  %7 = load float, float* %arrayidx3, align 4, !dbg !901
  %sub = fsub float %4, %7, !dbg !902
  %coord4 = getelementptr inbounds %struct.Point, %struct.Point* %p1, i32 0, i32 1, !dbg !903
  %8 = load float*, float** %coord4, align 8, !dbg !903
  %9 = load i32, i32* %i, align 4, !dbg !904
  %idxprom5 = sext i32 %9 to i64, !dbg !905
  %arrayidx6 = getelementptr inbounds float, float* %8, i64 %idxprom5, !dbg !905
  %10 = load float, float* %arrayidx6, align 4, !dbg !905
  %coord7 = getelementptr inbounds %struct.Point, %struct.Point* %p2, i32 0, i32 1, !dbg !906
  %11 = load float*, float** %coord7, align 8, !dbg !906
  %12 = load i32, i32* %i, align 4, !dbg !907
  %idxprom8 = sext i32 %12 to i64, !dbg !908
  %arrayidx9 = getelementptr inbounds float, float* %11, i64 %idxprom8, !dbg !908
  %13 = load float, float* %arrayidx9, align 4, !dbg !908
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
  %14 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !974
  %p = getelementptr inbounds %struct.Points, %struct.Points* %14, i32 0, i32 2, !dbg !975
  %15 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !975
  %16 = load i32, i32* %k, align 4, !dbg !976
  %idxprom = sext i32 %16 to i64, !dbg !974
  %arrayidx = getelementptr inbounds %struct.Point, %struct.Point* %15, i64 %idxprom, !dbg !974
  %17 = bitcast %struct.Point* %agg.tmp to i8*, !dbg !974
  %18 = bitcast %struct.Point* %arrayidx to i8*, !dbg !974
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 32, i32 8, i1 false), !dbg !974
  %19 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !977
  %p7 = getelementptr inbounds %struct.Points, %struct.Points* %19, i32 0, i32 2, !dbg !978
  %20 = load %struct.Point*, %struct.Point** %p7, align 8, !dbg !978
  %arrayidx8 = getelementptr inbounds %struct.Point, %struct.Point* %20, i64 0, !dbg !977
  %21 = bitcast %struct.Point* %agg.tmp6 to i8*, !dbg !977
  %22 = bitcast %struct.Point* %arrayidx8 to i8*, !dbg !977
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %21, i8* %22, i64 32, i32 8, i1 false), !dbg !977
  %23 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !979
  %dim = getelementptr inbounds %struct.Points, %struct.Points* %23, i32 0, i32 1, !dbg !980
  %24 = load i32, i32* %dim, align 8, !dbg !980
  %call9 = call float @_Z4dist5PointS_i(%struct.Point* byval align 8 %agg.tmp, %struct.Point* byval align 8 %agg.tmp6, i32 %24), !dbg !981
  store float %call9, float* %distance, align 4, !dbg !973
  %25 = load float, float* %distance, align 4, !dbg !982
  %26 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !983
  %p10 = getelementptr inbounds %struct.Points, %struct.Points* %26, i32 0, i32 2, !dbg !984
  %27 = load %struct.Point*, %struct.Point** %p10, align 8, !dbg !984
  %28 = load i32, i32* %k, align 4, !dbg !985
  %idxprom11 = sext i32 %28 to i64, !dbg !983
  %arrayidx12 = getelementptr inbounds %struct.Point, %struct.Point* %27, i64 %idxprom11, !dbg !983
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx12, i32 0, i32 0, !dbg !986
  %29 = load float, float* %weight, align 8, !dbg !986
  %mul13 = fmul float %25, %29, !dbg !987
  %30 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !988
  %p14 = getelementptr inbounds %struct.Points, %struct.Points* %30, i32 0, i32 2, !dbg !989
  %31 = load %struct.Point*, %struct.Point** %p14, align 8, !dbg !989
  %32 = load i32, i32* %k, align 4, !dbg !990
  %idxprom15 = sext i32 %32 to i64, !dbg !988
  %arrayidx16 = getelementptr inbounds %struct.Point, %struct.Point* %31, i64 %idxprom15, !dbg !988
  %cost = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx16, i32 0, i32 3, !dbg !991
  store float %mul13, float* %cost, align 8, !dbg !992
  %33 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !993
  %p17 = getelementptr inbounds %struct.Points, %struct.Points* %33, i32 0, i32 2, !dbg !994
  %34 = load %struct.Point*, %struct.Point** %p17, align 8, !dbg !994
  %35 = load i32, i32* %k, align 4, !dbg !995
  %idxprom18 = sext i32 %35 to i64, !dbg !993
  %arrayidx19 = getelementptr inbounds %struct.Point, %struct.Point* %34, i64 %idxprom18, !dbg !993
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx19, i32 0, i32 2, !dbg !996
  store i64 0, i64* %assign, align 8, !dbg !997
  br label %for.inc, !dbg !998

for.inc:                                          ; preds = %for.body
  %36 = load i32, i32* %k, align 4, !dbg !999
  %inc = add nsw i32 %36, 1, !dbg !999
  store i32 %inc, i32* %k, align 4, !dbg !999
  br label %for.cond, !dbg !1001, !llvm.loop !1002

for.end:                                          ; preds = %for.cond
  %37 = load i32, i32* %pid.addr, align 4, !dbg !1004
  %cmp20 = icmp eq i32 %37, 0, !dbg !1006
  br i1 %cmp20, label %if.then21, label %if.end25, !dbg !1007

if.then21:                                        ; preds = %for.end
  %38 = load i64*, i64** %kcenter.addr, align 8, !dbg !1008
  store i64 1, i64* %38, align 8, !dbg !1010
  %39 = load i32, i32* @_ZL5nproc, align 4, !dbg !1011
  %conv22 = sext i32 %39 to i64, !dbg !1011
  %mul23 = mul i64 4, %conv22, !dbg !1012
  %call24 = call noalias i8* @malloc(i64 %mul23) #2, !dbg !1013
  %40 = bitcast i8* %call24 to float*, !dbg !1014
  store float* %40, float** @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE5costs, align 8, !dbg !1015
  br label %if.end25, !dbg !1016

if.end25:                                         ; preds = %if.then21, %for.end
  %41 = load i32, i32* %pid.addr, align 4, !dbg !1017
  %cmp26 = icmp ne i32 %41, 0, !dbg !1019
  br i1 %cmp26, label %if.then27, label %if.else, !dbg !1020

if.then27:                                        ; preds = %if.end25
  br label %while.body, !dbg !1021

while.body:                                       ; preds = %if.then27, %for.end78
  %42 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1023
  %conv28 = sext i32 %42 to i64, !dbg !1023
  %43 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1026
  %num29 = getelementptr inbounds %struct.Points, %struct.Points* %43, i32 0, i32 0, !dbg !1027
  %44 = load i64, i64* %num29, align 8, !dbg !1027
  %cmp30 = icmp sge i64 %conv28, %44, !dbg !1028
  br i1 %cmp30, label %if.then31, label %if.end32, !dbg !1029

if.then31:                                        ; preds = %while.body
  br label %while.end, !dbg !1030

if.end32:                                         ; preds = %while.body
  call void @llvm.dbg.declare(metadata i32* %k33, metadata !1032, metadata !671), !dbg !1034
  %45 = load i64, i64* %k1, align 8, !dbg !1035
  %conv34 = trunc i64 %45 to i32, !dbg !1035
  store i32 %conv34, i32* %k33, align 4, !dbg !1034
  br label %for.cond35, !dbg !1036

for.cond35:                                       ; preds = %for.inc76, %if.end32
  %46 = load i32, i32* %k33, align 4, !dbg !1037
  %conv36 = sext i32 %46 to i64, !dbg !1037
  %47 = load i64, i64* %k2, align 8, !dbg !1040
  %cmp37 = icmp slt i64 %conv36, %47, !dbg !1041
  br i1 %cmp37, label %for.body38, label %for.end78, !dbg !1042

for.body38:                                       ; preds = %for.cond35
  call void @llvm.dbg.declare(metadata float* %distance39, metadata !1043, metadata !671), !dbg !1045
  %48 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1046
  %p41 = getelementptr inbounds %struct.Points, %struct.Points* %48, i32 0, i32 2, !dbg !1047
  %49 = load %struct.Point*, %struct.Point** %p41, align 8, !dbg !1047
  %50 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1048
  %idxprom42 = sext i32 %50 to i64, !dbg !1046
  %arrayidx43 = getelementptr inbounds %struct.Point, %struct.Point* %49, i64 %idxprom42, !dbg !1046
  %51 = bitcast %struct.Point* %agg.tmp40 to i8*, !dbg !1046
  %52 = bitcast %struct.Point* %arrayidx43 to i8*, !dbg !1046
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %51, i8* %52, i64 32, i32 8, i1 false), !dbg !1046
  %53 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1049
  %p45 = getelementptr inbounds %struct.Points, %struct.Points* %53, i32 0, i32 2, !dbg !1050
  %54 = load %struct.Point*, %struct.Point** %p45, align 8, !dbg !1050
  %55 = load i32, i32* %k33, align 4, !dbg !1051
  %idxprom46 = sext i32 %55 to i64, !dbg !1049
  %arrayidx47 = getelementptr inbounds %struct.Point, %struct.Point* %54, i64 %idxprom46, !dbg !1049
  %56 = bitcast %struct.Point* %agg.tmp44 to i8*, !dbg !1049
  %57 = bitcast %struct.Point* %arrayidx47 to i8*, !dbg !1049
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %56, i8* %57, i64 32, i32 8, i1 false), !dbg !1049
  %58 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1052
  %dim48 = getelementptr inbounds %struct.Points, %struct.Points* %58, i32 0, i32 1, !dbg !1053
  %59 = load i32, i32* %dim48, align 8, !dbg !1053
  %call49 = call float @_Z4dist5PointS_i(%struct.Point* byval align 8 %agg.tmp40, %struct.Point* byval align 8 %agg.tmp44, i32 %59), !dbg !1054
  store float %call49, float* %distance39, align 4, !dbg !1045
  %60 = load float, float* %distance39, align 4, !dbg !1055
  %61 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1057
  %p50 = getelementptr inbounds %struct.Points, %struct.Points* %61, i32 0, i32 2, !dbg !1058
  %62 = load %struct.Point*, %struct.Point** %p50, align 8, !dbg !1058
  %63 = load i32, i32* %k33, align 4, !dbg !1059
  %idxprom51 = sext i32 %63 to i64, !dbg !1057
  %arrayidx52 = getelementptr inbounds %struct.Point, %struct.Point* %62, i64 %idxprom51, !dbg !1057
  %weight53 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx52, i32 0, i32 0, !dbg !1060
  %64 = load float, float* %weight53, align 8, !dbg !1060
  %mul54 = fmul float %60, %64, !dbg !1061
  %65 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1062
  %p55 = getelementptr inbounds %struct.Points, %struct.Points* %65, i32 0, i32 2, !dbg !1063
  %66 = load %struct.Point*, %struct.Point** %p55, align 8, !dbg !1063
  %67 = load i32, i32* %k33, align 4, !dbg !1064
  %idxprom56 = sext i32 %67 to i64, !dbg !1062
  %arrayidx57 = getelementptr inbounds %struct.Point, %struct.Point* %66, i64 %idxprom56, !dbg !1062
  %cost58 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx57, i32 0, i32 3, !dbg !1065
  %68 = load float, float* %cost58, align 8, !dbg !1065
  %cmp59 = fcmp olt float %mul54, %68, !dbg !1066
  br i1 %cmp59, label %if.then60, label %if.end75, !dbg !1067

if.then60:                                        ; preds = %for.body38
  %69 = load float, float* %distance39, align 4, !dbg !1068
  %70 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1070
  %p61 = getelementptr inbounds %struct.Points, %struct.Points* %70, i32 0, i32 2, !dbg !1071
  %71 = load %struct.Point*, %struct.Point** %p61, align 8, !dbg !1071
  %72 = load i32, i32* %k33, align 4, !dbg !1072
  %idxprom62 = sext i32 %72 to i64, !dbg !1070
  %arrayidx63 = getelementptr inbounds %struct.Point, %struct.Point* %71, i64 %idxprom62, !dbg !1070
  %weight64 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx63, i32 0, i32 0, !dbg !1073
  %73 = load float, float* %weight64, align 8, !dbg !1073
  %mul65 = fmul float %69, %73, !dbg !1074
  %74 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1075
  %p66 = getelementptr inbounds %struct.Points, %struct.Points* %74, i32 0, i32 2, !dbg !1076
  %75 = load %struct.Point*, %struct.Point** %p66, align 8, !dbg !1076
  %76 = load i32, i32* %k33, align 4, !dbg !1077
  %idxprom67 = sext i32 %76 to i64, !dbg !1075
  %arrayidx68 = getelementptr inbounds %struct.Point, %struct.Point* %75, i64 %idxprom67, !dbg !1075
  %cost69 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx68, i32 0, i32 3, !dbg !1078
  store float %mul65, float* %cost69, align 8, !dbg !1079
  %77 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1080
  %conv70 = sext i32 %77 to i64, !dbg !1080
  %78 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1081
  %p71 = getelementptr inbounds %struct.Points, %struct.Points* %78, i32 0, i32 2, !dbg !1082
  %79 = load %struct.Point*, %struct.Point** %p71, align 8, !dbg !1082
  %80 = load i32, i32* %k33, align 4, !dbg !1083
  %idxprom72 = sext i32 %80 to i64, !dbg !1081
  %arrayidx73 = getelementptr inbounds %struct.Point, %struct.Point* %79, i64 %idxprom72, !dbg !1081
  %assign74 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx73, i32 0, i32 2, !dbg !1084
  store i64 %conv70, i64* %assign74, align 8, !dbg !1085
  br label %if.end75, !dbg !1086

if.end75:                                         ; preds = %if.then60, %for.body38
  br label %for.inc76, !dbg !1087

for.inc76:                                        ; preds = %if.end75
  %81 = load i32, i32* %k33, align 4, !dbg !1088
  %inc77 = add nsw i32 %81, 1, !dbg !1088
  store i32 %inc77, i32* %k33, align 4, !dbg !1088
  br label %for.cond35, !dbg !1090, !llvm.loop !1091

for.end78:                                        ; preds = %for.cond35
  br label %while.body, !dbg !1093, !llvm.loop !1095

while.end:                                        ; preds = %if.then31
  br label %if.end145, !dbg !1096

if.else:                                          ; preds = %if.end25
  store i32 1, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1097
  br label %for.cond79, !dbg !1100

for.cond79:                                       ; preds = %for.inc142, %if.else
  %82 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1101
  %conv80 = sext i32 %82 to i64, !dbg !1101
  %83 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1104
  %num81 = getelementptr inbounds %struct.Points, %struct.Points* %83, i32 0, i32 0, !dbg !1105
  %84 = load i64, i64* %num81, align 8, !dbg !1105
  %cmp82 = icmp slt i64 %conv80, %84, !dbg !1106
  br i1 %cmp82, label %for.body83, label %for.end144, !dbg !1107

for.body83:                                       ; preds = %for.cond79
  call void @llvm.dbg.declare(metadata i8* %to_open, metadata !1108, metadata !671), !dbg !1110
  %call84 = call i64 @lrand48() #2, !dbg !1111
  %conv85 = sitofp i64 %call84 to float, !dbg !1111
  %div86 = fdiv float %conv85, 0x41E0000000000000, !dbg !1112
  %85 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1113
  %p87 = getelementptr inbounds %struct.Points, %struct.Points* %85, i32 0, i32 2, !dbg !1114
  %86 = load %struct.Point*, %struct.Point** %p87, align 8, !dbg !1114
  %87 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1115
  %idxprom88 = sext i32 %87 to i64, !dbg !1113
  %arrayidx89 = getelementptr inbounds %struct.Point, %struct.Point* %86, i64 %idxprom88, !dbg !1113
  %cost90 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx89, i32 0, i32 3, !dbg !1116
  %88 = load float, float* %cost90, align 8, !dbg !1116
  %89 = load float, float* %z.addr, align 4, !dbg !1117
  %div91 = fdiv float %88, %89, !dbg !1118
  %cmp92 = fcmp olt float %div86, %div91, !dbg !1119
  %frombool = zext i1 %cmp92 to i8, !dbg !1110
  store i8 %frombool, i8* %to_open, align 1, !dbg !1110
  %90 = load i8, i8* %to_open, align 1, !dbg !1120
  %tobool = trunc i8 %90 to i1, !dbg !1120
  br i1 %tobool, label %if.then93, label %if.end141, !dbg !1122

if.then93:                                        ; preds = %for.body83
  %91 = load i64*, i64** %kcenter.addr, align 8, !dbg !1123
  %92 = load i64, i64* %91, align 8, !dbg !1125
  %inc94 = add nsw i64 %92, 1, !dbg !1125
  store i64 %inc94, i64* %91, align 8, !dbg !1125
  store i8 1, i8* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE4open, align 1, !dbg !1126
  call void @llvm.dbg.declare(metadata i32* %k95, metadata !1127, metadata !671), !dbg !1129
  %93 = load i64, i64* %k1, align 8, !dbg !1130
  %conv96 = trunc i64 %93 to i32, !dbg !1130
  store i32 %conv96, i32* %k95, align 4, !dbg !1129
  br label %for.cond97, !dbg !1131

for.cond97:                                       ; preds = %for.inc138, %if.then93
  %94 = load i32, i32* %k95, align 4, !dbg !1132
  %conv98 = sext i32 %94 to i64, !dbg !1132
  %95 = load i64, i64* %k2, align 8, !dbg !1135
  %cmp99 = icmp slt i64 %conv98, %95, !dbg !1136
  br i1 %cmp99, label %for.body100, label %for.end140, !dbg !1137

for.body100:                                      ; preds = %for.cond97
  call void @llvm.dbg.declare(metadata float* %distance101, metadata !1138, metadata !671), !dbg !1140
  %96 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1141
  %p103 = getelementptr inbounds %struct.Points, %struct.Points* %96, i32 0, i32 2, !dbg !1142
  %97 = load %struct.Point*, %struct.Point** %p103, align 8, !dbg !1142
  %98 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1143
  %idxprom104 = sext i32 %98 to i64, !dbg !1141
  %arrayidx105 = getelementptr inbounds %struct.Point, %struct.Point* %97, i64 %idxprom104, !dbg !1141
  %99 = bitcast %struct.Point* %agg.tmp102 to i8*, !dbg !1141
  %100 = bitcast %struct.Point* %arrayidx105 to i8*, !dbg !1141
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %99, i8* %100, i64 32, i32 8, i1 false), !dbg !1141
  %101 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1144
  %p107 = getelementptr inbounds %struct.Points, %struct.Points* %101, i32 0, i32 2, !dbg !1145
  %102 = load %struct.Point*, %struct.Point** %p107, align 8, !dbg !1145
  %103 = load i32, i32* %k95, align 4, !dbg !1146
  %idxprom108 = sext i32 %103 to i64, !dbg !1144
  %arrayidx109 = getelementptr inbounds %struct.Point, %struct.Point* %102, i64 %idxprom108, !dbg !1144
  %104 = bitcast %struct.Point* %agg.tmp106 to i8*, !dbg !1144
  %105 = bitcast %struct.Point* %arrayidx109 to i8*, !dbg !1144
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %104, i8* %105, i64 32, i32 8, i1 false), !dbg !1144
  %106 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1147
  %dim110 = getelementptr inbounds %struct.Points, %struct.Points* %106, i32 0, i32 1, !dbg !1148
  %107 = load i32, i32* %dim110, align 8, !dbg !1148
  %call111 = call float @_Z4dist5PointS_i(%struct.Point* byval align 8 %agg.tmp102, %struct.Point* byval align 8 %agg.tmp106, i32 %107), !dbg !1149
  store float %call111, float* %distance101, align 4, !dbg !1140
  %108 = load float, float* %distance101, align 4, !dbg !1150
  %109 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1152
  %p112 = getelementptr inbounds %struct.Points, %struct.Points* %109, i32 0, i32 2, !dbg !1153
  %110 = load %struct.Point*, %struct.Point** %p112, align 8, !dbg !1153
  %111 = load i32, i32* %k95, align 4, !dbg !1154
  %idxprom113 = sext i32 %111 to i64, !dbg !1152
  %arrayidx114 = getelementptr inbounds %struct.Point, %struct.Point* %110, i64 %idxprom113, !dbg !1152
  %weight115 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx114, i32 0, i32 0, !dbg !1155
  %112 = load float, float* %weight115, align 8, !dbg !1155
  %mul116 = fmul float %108, %112, !dbg !1156
  %113 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1157
  %p117 = getelementptr inbounds %struct.Points, %struct.Points* %113, i32 0, i32 2, !dbg !1158
  %114 = load %struct.Point*, %struct.Point** %p117, align 8, !dbg !1158
  %115 = load i32, i32* %k95, align 4, !dbg !1159
  %idxprom118 = sext i32 %115 to i64, !dbg !1157
  %arrayidx119 = getelementptr inbounds %struct.Point, %struct.Point* %114, i64 %idxprom118, !dbg !1157
  %cost120 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx119, i32 0, i32 3, !dbg !1160
  %116 = load float, float* %cost120, align 8, !dbg !1160
  %cmp121 = fcmp olt float %mul116, %116, !dbg !1161
  br i1 %cmp121, label %if.then122, label %if.end137, !dbg !1162

if.then122:                                       ; preds = %for.body100
  %117 = load float, float* %distance101, align 4, !dbg !1163
  %118 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1165
  %p123 = getelementptr inbounds %struct.Points, %struct.Points* %118, i32 0, i32 2, !dbg !1166
  %119 = load %struct.Point*, %struct.Point** %p123, align 8, !dbg !1166
  %120 = load i32, i32* %k95, align 4, !dbg !1167
  %idxprom124 = sext i32 %120 to i64, !dbg !1165
  %arrayidx125 = getelementptr inbounds %struct.Point, %struct.Point* %119, i64 %idxprom124, !dbg !1165
  %weight126 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx125, i32 0, i32 0, !dbg !1168
  %121 = load float, float* %weight126, align 8, !dbg !1168
  %mul127 = fmul float %117, %121, !dbg !1169
  %122 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1170
  %p128 = getelementptr inbounds %struct.Points, %struct.Points* %122, i32 0, i32 2, !dbg !1171
  %123 = load %struct.Point*, %struct.Point** %p128, align 8, !dbg !1171
  %124 = load i32, i32* %k95, align 4, !dbg !1172
  %idxprom129 = sext i32 %124 to i64, !dbg !1170
  %arrayidx130 = getelementptr inbounds %struct.Point, %struct.Point* %123, i64 %idxprom129, !dbg !1170
  %cost131 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx130, i32 0, i32 3, !dbg !1173
  store float %mul127, float* %cost131, align 8, !dbg !1174
  %125 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1175
  %conv132 = sext i32 %125 to i64, !dbg !1175
  %126 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1176
  %p133 = getelementptr inbounds %struct.Points, %struct.Points* %126, i32 0, i32 2, !dbg !1177
  %127 = load %struct.Point*, %struct.Point** %p133, align 8, !dbg !1177
  %128 = load i32, i32* %k95, align 4, !dbg !1178
  %idxprom134 = sext i32 %128 to i64, !dbg !1176
  %arrayidx135 = getelementptr inbounds %struct.Point, %struct.Point* %127, i64 %idxprom134, !dbg !1176
  %assign136 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx135, i32 0, i32 2, !dbg !1179
  store i64 %conv132, i64* %assign136, align 8, !dbg !1180
  br label %if.end137, !dbg !1181

if.end137:                                        ; preds = %if.then122, %for.body100
  br label %for.inc138, !dbg !1182

for.inc138:                                       ; preds = %if.end137
  %129 = load i32, i32* %k95, align 4, !dbg !1183
  %inc139 = add nsw i32 %129, 1, !dbg !1183
  store i32 %inc139, i32* %k95, align 4, !dbg !1183
  br label %for.cond97, !dbg !1185, !llvm.loop !1186

for.end140:                                       ; preds = %for.cond97
  store i8 0, i8* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE4open, align 1, !dbg !1188
  br label %if.end141, !dbg !1189

if.end141:                                        ; preds = %for.end140, %for.body83
  br label %for.inc142, !dbg !1190

for.inc142:                                       ; preds = %if.end141
  %130 = load i32, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1191
  %inc143 = add nsw i32 %130, 1, !dbg !1191
  store i32 %inc143, i32* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE1i, align 4, !dbg !1191
  br label %for.cond79, !dbg !1193, !llvm.loop !1194

for.end144:                                       ; preds = %for.cond79
  store i8 1, i8* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE4open, align 1, !dbg !1196
  br label %if.end145

if.end145:                                        ; preds = %for.end144, %while.end
  store i8 0, i8* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE4open, align 1, !dbg !1197
  call void @llvm.dbg.declare(metadata float* %mytotal, metadata !1198, metadata !671), !dbg !1199
  store float 0.000000e+00, float* %mytotal, align 4, !dbg !1199
  call void @llvm.dbg.declare(metadata i32* %k146, metadata !1200, metadata !671), !dbg !1202
  %131 = load i64, i64* %k1, align 8, !dbg !1203
  %conv147 = trunc i64 %131 to i32, !dbg !1203
  store i32 %conv147, i32* %k146, align 4, !dbg !1202
  br label %for.cond148, !dbg !1204

for.cond148:                                      ; preds = %for.inc157, %if.end145
  %132 = load i32, i32* %k146, align 4, !dbg !1205
  %conv149 = sext i32 %132 to i64, !dbg !1205
  %133 = load i64, i64* %k2, align 8, !dbg !1208
  %cmp150 = icmp slt i64 %conv149, %133, !dbg !1209
  br i1 %cmp150, label %for.body151, label %for.end159, !dbg !1210

for.body151:                                      ; preds = %for.cond148
  %134 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1211
  %p152 = getelementptr inbounds %struct.Points, %struct.Points* %134, i32 0, i32 2, !dbg !1213
  %135 = load %struct.Point*, %struct.Point** %p152, align 8, !dbg !1213
  %136 = load i32, i32* %k146, align 4, !dbg !1214
  %idxprom153 = sext i32 %136 to i64, !dbg !1211
  %arrayidx154 = getelementptr inbounds %struct.Point, %struct.Point* %135, i64 %idxprom153, !dbg !1211
  %cost155 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx154, i32 0, i32 3, !dbg !1215
  %137 = load float, float* %cost155, align 8, !dbg !1215
  %138 = load float, float* %mytotal, align 4, !dbg !1216
  %add156 = fadd float %138, %137, !dbg !1216
  store float %add156, float* %mytotal, align 4, !dbg !1216
  br label %for.inc157, !dbg !1217

for.inc157:                                       ; preds = %for.body151
  %139 = load i32, i32* %k146, align 4, !dbg !1218
  %inc158 = add nsw i32 %139, 1, !dbg !1218
  store i32 %inc158, i32* %k146, align 4, !dbg !1218
  br label %for.cond148, !dbg !1220, !llvm.loop !1221

for.end159:                                       ; preds = %for.cond148
  %140 = load float, float* %mytotal, align 4, !dbg !1223
  %141 = load float*, float** @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE5costs, align 8, !dbg !1224
  %142 = load i32, i32* %pid.addr, align 4, !dbg !1225
  %idxprom160 = sext i32 %142 to i64, !dbg !1224
  %arrayidx161 = getelementptr inbounds float, float* %141, i64 %idxprom160, !dbg !1224
  store float %140, float* %arrayidx161, align 4, !dbg !1226
  %143 = load i32, i32* %pid.addr, align 4, !dbg !1227
  %cmp162 = icmp eq i32 %143, 0, !dbg !1229
  br i1 %cmp162, label %if.then163, label %if.end175, !dbg !1230

if.then163:                                       ; preds = %for.end159
  %144 = load float, float* %z.addr, align 4, !dbg !1231
  %145 = load i64*, i64** %kcenter.addr, align 8, !dbg !1233
  %146 = load i64, i64* %145, align 8, !dbg !1234
  %conv164 = sitofp i64 %146 to float, !dbg !1235
  %mul165 = fmul float %144, %conv164, !dbg !1236
  store float %mul165, float* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE9totalcost, align 4, !dbg !1237
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1238, metadata !671), !dbg !1240
  store i32 0, i32* %i, align 4, !dbg !1240
  br label %for.cond166, !dbg !1241

for.cond166:                                      ; preds = %for.inc172, %if.then163
  %147 = load i32, i32* %i, align 4, !dbg !1242
  %148 = load i32, i32* @_ZL5nproc, align 4, !dbg !1245
  %cmp167 = icmp slt i32 %147, %148, !dbg !1246
  br i1 %cmp167, label %for.body168, label %for.end174, !dbg !1247

for.body168:                                      ; preds = %for.cond166
  %149 = load float*, float** @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE5costs, align 8, !dbg !1248
  %150 = load i32, i32* %i, align 4, !dbg !1250
  %idxprom169 = sext i32 %150 to i64, !dbg !1248
  %arrayidx170 = getelementptr inbounds float, float* %149, i64 %idxprom169, !dbg !1248
  %151 = load float, float* %arrayidx170, align 4, !dbg !1248
  %152 = load float, float* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE9totalcost, align 4, !dbg !1251
  %add171 = fadd float %152, %151, !dbg !1251
  store float %add171, float* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE9totalcost, align 4, !dbg !1251
  br label %for.inc172, !dbg !1252

for.inc172:                                       ; preds = %for.body168
  %153 = load i32, i32* %i, align 4, !dbg !1253
  %inc173 = add nsw i32 %153, 1, !dbg !1253
  store i32 %inc173, i32* %i, align 4, !dbg !1253
  br label %for.cond166, !dbg !1255, !llvm.loop !1256

for.end174:                                       ; preds = %for.cond166
  %154 = load float*, float** @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE5costs, align 8, !dbg !1258
  %155 = bitcast float* %154 to i8*, !dbg !1258
  call void @free(i8* %155) #2, !dbg !1259
  br label %if.end175, !dbg !1260

if.end175:                                        ; preds = %for.end174, %for.end159
  call void @llvm.dbg.declare(metadata double* %t2, metadata !1261, metadata !671), !dbg !1262
  %call176 = call double @_Z7gettimev(), !dbg !1263
  store double %call176, double* %t2, align 8, !dbg !1262
  %156 = load i32, i32* %pid.addr, align 4, !dbg !1264
  %cmp177 = icmp eq i32 %156, 0, !dbg !1266
  br i1 %cmp177, label %if.then178, label %if.end181, !dbg !1267

if.then178:                                       ; preds = %if.end175
  %157 = load double, double* %t2, align 8, !dbg !1268
  %158 = load double, double* %t1, align 8, !dbg !1270
  %sub179 = fsub double %157, %158, !dbg !1271
  %159 = load double, double* @time_speedy, align 8, !dbg !1272
  %add180 = fadd double %159, %sub179, !dbg !1272
  store double %add180, double* @time_speedy, align 8, !dbg !1272
  br label %if.end181, !dbg !1273

if.end181:                                        ; preds = %if.then178, %if.end175
  %160 = load float, float* @_ZZ7pspeedyP6PointsfPliP17pthread_barrier_tE9totalcost, align 4, !dbg !1274
  ret float %160, !dbg !1275
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #5

; Function Attrs: nounwind
declare void @free(i8*) #5

; Function Attrs: uwtable
define float @_Z3pFLP6PointsPiifPliflfiP17pthread_barrier_t(%struct.Points* %points, i32* %feasible, i32 %numfeasible, float %z, i64* %k, i32 %kmax, float %cost, i64 %iter, float %e, i32 %pid, %union.pthread_barrier_t* %barrier) #0 !dbg !1276 {
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
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !1279, metadata !671), !dbg !1280
  store i32* %feasible, i32** %feasible.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %feasible.addr, metadata !1281, metadata !671), !dbg !1282
  store i32 %numfeasible, i32* %numfeasible.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numfeasible.addr, metadata !1283, metadata !671), !dbg !1284
  store float %z, float* %z.addr, align 4
  call void @llvm.dbg.declare(metadata float* %z.addr, metadata !1285, metadata !671), !dbg !1286
  store i64* %k, i64** %k.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %k.addr, metadata !1287, metadata !671), !dbg !1288
  store i32 %kmax, i32* %kmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %kmax.addr, metadata !1289, metadata !671), !dbg !1290
  store float %cost, float* %cost.addr, align 4
  call void @llvm.dbg.declare(metadata float* %cost.addr, metadata !1291, metadata !671), !dbg !1292
  store i64 %iter, i64* %iter.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %iter.addr, metadata !1293, metadata !671), !dbg !1294
  store float %e, float* %e.addr, align 4
  call void @llvm.dbg.declare(metadata float* %e.addr, metadata !1295, metadata !671), !dbg !1296
  store i32 %pid, i32* %pid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pid.addr, metadata !1297, metadata !671), !dbg !1298
  store %union.pthread_barrier_t* %barrier, %union.pthread_barrier_t** %barrier.addr, align 8
  call void @llvm.dbg.declare(metadata %union.pthread_barrier_t** %barrier.addr, metadata !1299, metadata !671), !dbg !1300
  call void @llvm.dbg.declare(metadata i64* %i, metadata !1301, metadata !671), !dbg !1302
  call void @llvm.dbg.declare(metadata i64* %x, metadata !1303, metadata !671), !dbg !1304
  call void @llvm.dbg.declare(metadata float* %change, metadata !1305, metadata !671), !dbg !1306
  call void @llvm.dbg.declare(metadata i64* %numberOfPoints, metadata !1307, metadata !671), !dbg !1308
  %0 = load float, float* %cost.addr, align 4, !dbg !1309
  store float %0, float* %change, align 4, !dbg !1310
  br label %while.cond, !dbg !1311

while.cond:                                       ; preds = %for.end, %entry
  %1 = load float, float* %change, align 4, !dbg !1312
  %2 = load float, float* %cost.addr, align 4, !dbg !1314
  %div = fdiv float %1, %2, !dbg !1315
  %conv = fpext float %div to double, !dbg !1312
  %3 = load float, float* %e.addr, align 4, !dbg !1316
  %conv1 = fpext float %3 to double, !dbg !1316
  %mul = fmul double 1.000000e+00, %conv1, !dbg !1317
  %cmp = fcmp ogt double %conv, %mul, !dbg !1318
  br i1 %cmp, label %while.body, label %while.end, !dbg !1319

while.body:                                       ; preds = %while.cond
  store float 0.000000e+00, float* %change, align 4, !dbg !1320
  %4 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1322
  %num = getelementptr inbounds %struct.Points, %struct.Points* %4, i32 0, i32 0, !dbg !1323
  %5 = load i64, i64* %num, align 8, !dbg !1323
  store i64 %5, i64* %numberOfPoints, align 8, !dbg !1324
  %6 = load i32, i32* %pid.addr, align 4, !dbg !1325
  %cmp2 = icmp eq i32 %6, 0, !dbg !1327
  br i1 %cmp2, label %if.then, label %if.end, !dbg !1328

if.then:                                          ; preds = %while.body
  %7 = load i32*, i32** %feasible.addr, align 8, !dbg !1329
  %8 = load i32, i32* %numfeasible.addr, align 4, !dbg !1331
  call void @_Z10intshufflePii(i32* %7, i32 %8), !dbg !1332
  br label %if.end, !dbg !1333

if.end:                                           ; preds = %if.then, %while.body
  store i64 0, i64* %i, align 8, !dbg !1334
  br label %for.cond, !dbg !1336

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !1337
  %10 = load i64, i64* %iter.addr, align 8, !dbg !1340
  %cmp3 = icmp slt i64 %9, %10, !dbg !1341
  br i1 %cmp3, label %for.body, label %for.end, !dbg !1342

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !1343
  %12 = load i32, i32* %numfeasible.addr, align 4, !dbg !1345
  %conv4 = sext i32 %12 to i64, !dbg !1345
  %rem = srem i64 %11, %conv4, !dbg !1346
  store i64 %rem, i64* %x, align 8, !dbg !1347
  %13 = load i32*, i32** %feasible.addr, align 8, !dbg !1348
  %14 = load i64, i64* %x, align 8, !dbg !1349
  %arrayidx = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !1348
  %15 = load i32, i32* %arrayidx, align 4, !dbg !1348
  %conv5 = sext i32 %15 to i64, !dbg !1348
  %16 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1350
  %17 = load float, float* %z.addr, align 4, !dbg !1351
  %18 = load i64*, i64** %k.addr, align 8, !dbg !1352
  %19 = load i32, i32* %kmax.addr, align 4, !dbg !1353
  %20 = load i8*, i8** @_ZL9is_center, align 8, !dbg !1354
  %21 = load i32*, i32** @_ZL12center_table, align 8, !dbg !1355
  %22 = load i8*, i8** @_ZL17switch_membership, align 8, !dbg !1356
  %23 = load i8, i8* @isCoordChanged, align 1, !dbg !1357
  %tobool = trunc i8 %23 to i1, !dbg !1357
  %call = call float @_Z5pgainlP6PointsfPliPbPiS2_bPdS4_S4_S4_S4_S4_(i64 %conv5, %struct.Points* %16, float %17, i64* %18, i32 %19, i8* %20, i32* %21, i8* %22, i1 zeroext %tobool, double* @serial_t, double* @cpu_to_gpu_t, double* @gpu_to_cpu_t, double* @alloc_t, double* @kernel_t, double* @free_t), !dbg !1358
  %24 = load float, float* %change, align 4, !dbg !1359
  %add = fadd float %24, %call, !dbg !1359
  store float %add, float* %change, align 4, !dbg !1359
  br label %for.inc, !dbg !1360

for.inc:                                          ; preds = %for.body
  %25 = load i64, i64* %i, align 8, !dbg !1361
  %inc = add nsw i64 %25, 1, !dbg !1361
  store i64 %inc, i64* %i, align 8, !dbg !1361
  br label %for.cond, !dbg !1363, !llvm.loop !1364

for.end:                                          ; preds = %for.cond
  %26 = load float, float* %change, align 4, !dbg !1366
  %27 = load float, float* %cost.addr, align 4, !dbg !1367
  %sub = fsub float %27, %26, !dbg !1367
  store float %sub, float* %cost.addr, align 4, !dbg !1367
  br label %while.cond, !dbg !1368, !llvm.loop !1370

while.end:                                        ; preds = %while.cond
  %28 = load float, float* %cost.addr, align 4, !dbg !1371
  ret float %28, !dbg !1372
}

declare float @_Z5pgainlP6PointsfPliPbPiS2_bPdS4_S4_S4_S4_S4_(i64, %struct.Points*, float, i64*, i32, i8*, i32*, i8*, i1 zeroext, double*, double*, double*, double*, double*, double*) #1

; Function Attrs: nounwind uwtable
define i32 @_Z19selectfeasible_fastP6PointsPPiiiP17pthread_barrier_t(%struct.Points* %points, i32** %feasible, i32 %kmin, i32 %pid, %union.pthread_barrier_t* %barrier) #4 !dbg !1373 {
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
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !1377, metadata !671), !dbg !1378
  store i32** %feasible, i32*** %feasible.addr, align 8
  call void @llvm.dbg.declare(metadata i32*** %feasible.addr, metadata !1379, metadata !671), !dbg !1380
  store i32 %kmin, i32* %kmin.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %kmin.addr, metadata !1381, metadata !671), !dbg !1382
  store i32 %pid, i32* %pid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pid.addr, metadata !1383, metadata !671), !dbg !1384
  store %union.pthread_barrier_t* %barrier, %union.pthread_barrier_t** %barrier.addr, align 8
  call void @llvm.dbg.declare(metadata %union.pthread_barrier_t** %barrier.addr, metadata !1385, metadata !671), !dbg !1386
  call void @llvm.dbg.declare(metadata double* %t1, metadata !1387, metadata !671), !dbg !1388
  %call = call double @_Z7gettimev(), !dbg !1389
  store double %call, double* %t1, align 8, !dbg !1388
  call void @llvm.dbg.declare(metadata i32* %numfeasible, metadata !1390, metadata !671), !dbg !1391
  %0 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1392
  %num = getelementptr inbounds %struct.Points, %struct.Points* %0, i32 0, i32 0, !dbg !1393
  %1 = load i64, i64* %num, align 8, !dbg !1393
  %conv = trunc i64 %1 to i32, !dbg !1392
  store i32 %conv, i32* %numfeasible, align 4, !dbg !1391
  %2 = load i32, i32* %numfeasible, align 4, !dbg !1394
  %conv1 = sitofp i32 %2 to double, !dbg !1394
  %3 = load i32, i32* %kmin.addr, align 4, !dbg !1396
  %mul = mul nsw i32 3, %3, !dbg !1397
  %conv2 = sitofp i32 %mul to double, !dbg !1398
  %4 = load i32, i32* %kmin.addr, align 4, !dbg !1399
  %conv3 = sitofp i32 %4 to float, !dbg !1399
  %conv4 = fpext float %conv3 to double, !dbg !1400
  %call5 = call double @log(double %conv4) #2, !dbg !1401
  %mul6 = fmul double %conv2, %call5, !dbg !1402
  %cmp = fcmp ogt double %conv1, %mul6, !dbg !1403
  br i1 %cmp, label %if.then, label %if.end, !dbg !1404

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %kmin.addr, align 4, !dbg !1405
  %mul7 = mul nsw i32 3, %5, !dbg !1406
  %conv8 = sitofp i32 %mul7 to double, !dbg !1407
  %6 = load i32, i32* %kmin.addr, align 4, !dbg !1408
  %conv9 = sitofp i32 %6 to float, !dbg !1408
  %conv10 = fpext float %conv9 to double, !dbg !1409
  %call11 = call double @log(double %conv10) #2, !dbg !1410
  %mul12 = fmul double %conv8, %call11, !dbg !1411
  %conv13 = fptosi double %mul12 to i32, !dbg !1412
  store i32 %conv13, i32* %numfeasible, align 4, !dbg !1413
  br label %if.end, !dbg !1414

if.end:                                           ; preds = %if.then, %entry
  %7 = load i32, i32* %numfeasible, align 4, !dbg !1415
  %conv14 = sext i32 %7 to i64, !dbg !1415
  %mul15 = mul i64 %conv14, 4, !dbg !1416
  %call16 = call noalias i8* @malloc(i64 %mul15) #2, !dbg !1417
  %8 = bitcast i8* %call16 to i32*, !dbg !1418
  %9 = load i32**, i32*** %feasible.addr, align 8, !dbg !1419
  store i32* %8, i32** %9, align 8, !dbg !1420
  call void @llvm.dbg.declare(metadata float** %accumweight, metadata !1421, metadata !671), !dbg !1422
  call void @llvm.dbg.declare(metadata float* %totalweight, metadata !1423, metadata !671), !dbg !1424
  call void @llvm.dbg.declare(metadata i64* %k1, metadata !1425, metadata !671), !dbg !1426
  store i64 0, i64* %k1, align 8, !dbg !1426
  call void @llvm.dbg.declare(metadata i64* %k2, metadata !1427, metadata !671), !dbg !1428
  %10 = load i32, i32* %numfeasible, align 4, !dbg !1429
  %conv17 = sext i32 %10 to i64, !dbg !1429
  store i64 %conv17, i64* %k2, align 8, !dbg !1428
  call void @llvm.dbg.declare(metadata float* %w, metadata !1430, metadata !671), !dbg !1431
  call void @llvm.dbg.declare(metadata i32* %l, metadata !1432, metadata !671), !dbg !1433
  call void @llvm.dbg.declare(metadata i32* %r, metadata !1434, metadata !671), !dbg !1435
  call void @llvm.dbg.declare(metadata i32* %k, metadata !1436, metadata !671), !dbg !1437
  %11 = load i32, i32* %numfeasible, align 4, !dbg !1438
  %conv18 = sext i32 %11 to i64, !dbg !1438
  %12 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1440
  %num19 = getelementptr inbounds %struct.Points, %struct.Points* %12, i32 0, i32 0, !dbg !1441
  %13 = load i64, i64* %num19, align 8, !dbg !1441
  %cmp20 = icmp eq i64 %conv18, %13, !dbg !1442
  br i1 %cmp20, label %if.then21, label %if.end25, !dbg !1443

if.then21:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1444, metadata !671), !dbg !1447
  %14 = load i64, i64* %k1, align 8, !dbg !1448
  %conv22 = trunc i64 %14 to i32, !dbg !1448
  store i32 %conv22, i32* %i, align 4, !dbg !1447
  br label %for.cond, !dbg !1449

for.cond:                                         ; preds = %for.inc, %if.then21
  %15 = load i32, i32* %i, align 4, !dbg !1450
  %conv23 = sext i32 %15 to i64, !dbg !1450
  %16 = load i64, i64* %k2, align 8, !dbg !1453
  %cmp24 = icmp slt i64 %conv23, %16, !dbg !1454
  br i1 %cmp24, label %for.body, label %for.end, !dbg !1455

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !1456
  %18 = load i32**, i32*** %feasible.addr, align 8, !dbg !1457
  %19 = load i32*, i32** %18, align 8, !dbg !1458
  %20 = load i32, i32* %i, align 4, !dbg !1459
  %idxprom = sext i32 %20 to i64, !dbg !1460
  %arrayidx = getelementptr inbounds i32, i32* %19, i64 %idxprom, !dbg !1460
  store i32 %17, i32* %arrayidx, align 4, !dbg !1461
  br label %for.inc, !dbg !1460

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !1462
  %inc = add nsw i32 %21, 1, !dbg !1462
  store i32 %inc, i32* %i, align 4, !dbg !1462
  br label %for.cond, !dbg !1464, !llvm.loop !1465

for.end:                                          ; preds = %for.cond
  %22 = load i32, i32* %numfeasible, align 4, !dbg !1467
  store i32 %22, i32* %retval, align 4, !dbg !1468
  br label %return, !dbg !1468

if.end25:                                         ; preds = %if.end
  %23 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1469
  %num26 = getelementptr inbounds %struct.Points, %struct.Points* %23, i32 0, i32 0, !dbg !1470
  %24 = load i64, i64* %num26, align 8, !dbg !1470
  %mul27 = mul i64 4, %24, !dbg !1471
  %call28 = call noalias i8* @malloc(i64 %mul27) #2, !dbg !1472
  %25 = bitcast i8* %call28 to float*, !dbg !1473
  store float* %25, float** %accumweight, align 8, !dbg !1474
  %26 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1475
  %p = getelementptr inbounds %struct.Points, %struct.Points* %26, i32 0, i32 2, !dbg !1476
  %27 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !1476
  %arrayidx29 = getelementptr inbounds %struct.Point, %struct.Point* %27, i64 0, !dbg !1475
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx29, i32 0, i32 0, !dbg !1477
  %28 = load float, float* %weight, align 8, !dbg !1477
  %29 = load float*, float** %accumweight, align 8, !dbg !1478
  %arrayidx30 = getelementptr inbounds float, float* %29, i64 0, !dbg !1478
  store float %28, float* %arrayidx30, align 4, !dbg !1479
  store float 0.000000e+00, float* %totalweight, align 4, !dbg !1480
  call void @llvm.dbg.declare(metadata i32* %i31, metadata !1481, metadata !671), !dbg !1483
  store i32 1, i32* %i31, align 4, !dbg !1483
  br label %for.cond32, !dbg !1484

for.cond32:                                       ; preds = %for.inc45, %if.end25
  %30 = load i32, i32* %i31, align 4, !dbg !1485
  %conv33 = sext i32 %30 to i64, !dbg !1485
  %31 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1488
  %num34 = getelementptr inbounds %struct.Points, %struct.Points* %31, i32 0, i32 0, !dbg !1489
  %32 = load i64, i64* %num34, align 8, !dbg !1489
  %cmp35 = icmp slt i64 %conv33, %32, !dbg !1490
  br i1 %cmp35, label %for.body36, label %for.end47, !dbg !1491

for.body36:                                       ; preds = %for.cond32
  %33 = load float*, float** %accumweight, align 8, !dbg !1492
  %34 = load i32, i32* %i31, align 4, !dbg !1494
  %sub = sub nsw i32 %34, 1, !dbg !1495
  %idxprom37 = sext i32 %sub to i64, !dbg !1492
  %arrayidx38 = getelementptr inbounds float, float* %33, i64 %idxprom37, !dbg !1492
  %35 = load float, float* %arrayidx38, align 4, !dbg !1492
  %36 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1496
  %p39 = getelementptr inbounds %struct.Points, %struct.Points* %36, i32 0, i32 2, !dbg !1497
  %37 = load %struct.Point*, %struct.Point** %p39, align 8, !dbg !1497
  %38 = load i32, i32* %i31, align 4, !dbg !1498
  %idxprom40 = sext i32 %38 to i64, !dbg !1496
  %arrayidx41 = getelementptr inbounds %struct.Point, %struct.Point* %37, i64 %idxprom40, !dbg !1496
  %weight42 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx41, i32 0, i32 0, !dbg !1499
  %39 = load float, float* %weight42, align 8, !dbg !1499
  %add = fadd float %35, %39, !dbg !1500
  %40 = load float*, float** %accumweight, align 8, !dbg !1501
  %41 = load i32, i32* %i31, align 4, !dbg !1502
  %idxprom43 = sext i32 %41 to i64, !dbg !1501
  %arrayidx44 = getelementptr inbounds float, float* %40, i64 %idxprom43, !dbg !1501
  store float %add, float* %arrayidx44, align 4, !dbg !1503
  br label %for.inc45, !dbg !1504

for.inc45:                                        ; preds = %for.body36
  %42 = load i32, i32* %i31, align 4, !dbg !1505
  %inc46 = add nsw i32 %42, 1, !dbg !1505
  store i32 %inc46, i32* %i31, align 4, !dbg !1505
  br label %for.cond32, !dbg !1507, !llvm.loop !1508

for.end47:                                        ; preds = %for.cond32
  %43 = load float*, float** %accumweight, align 8, !dbg !1510
  %44 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1511
  %num48 = getelementptr inbounds %struct.Points, %struct.Points* %44, i32 0, i32 0, !dbg !1512
  %45 = load i64, i64* %num48, align 8, !dbg !1512
  %sub49 = sub nsw i64 %45, 1, !dbg !1513
  %arrayidx50 = getelementptr inbounds float, float* %43, i64 %sub49, !dbg !1510
  %46 = load float, float* %arrayidx50, align 4, !dbg !1510
  store float %46, float* %totalweight, align 4, !dbg !1514
  call void @llvm.dbg.declare(metadata i32* %i51, metadata !1515, metadata !671), !dbg !1517
  %47 = load i64, i64* %k1, align 8, !dbg !1518
  %conv52 = trunc i64 %47 to i32, !dbg !1518
  store i32 %conv52, i32* %i51, align 4, !dbg !1517
  br label %for.cond53, !dbg !1519

for.cond53:                                       ; preds = %for.inc80, %for.end47
  %48 = load i32, i32* %i51, align 4, !dbg !1520
  %conv54 = sext i32 %48 to i64, !dbg !1520
  %49 = load i64, i64* %k2, align 8, !dbg !1523
  %cmp55 = icmp slt i64 %conv54, %49, !dbg !1524
  br i1 %cmp55, label %for.body56, label %for.end82, !dbg !1525

for.body56:                                       ; preds = %for.cond53
  %call57 = call i64 @lrand48() #2, !dbg !1526
  %conv58 = sitofp i64 %call57 to float, !dbg !1526
  %div = fdiv float %conv58, 0x41E0000000000000, !dbg !1528
  %50 = load float, float* %totalweight, align 4, !dbg !1529
  %mul59 = fmul float %div, %50, !dbg !1530
  store float %mul59, float* %w, align 4, !dbg !1531
  store i32 0, i32* %l, align 4, !dbg !1532
  %51 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1533
  %num60 = getelementptr inbounds %struct.Points, %struct.Points* %51, i32 0, i32 0, !dbg !1534
  %52 = load i64, i64* %num60, align 8, !dbg !1534
  %sub61 = sub nsw i64 %52, 1, !dbg !1535
  %conv62 = trunc i64 %sub61 to i32, !dbg !1533
  store i32 %conv62, i32* %r, align 4, !dbg !1536
  %53 = load float*, float** %accumweight, align 8, !dbg !1537
  %arrayidx63 = getelementptr inbounds float, float* %53, i64 0, !dbg !1537
  %54 = load float, float* %arrayidx63, align 4, !dbg !1537
  %55 = load float, float* %w, align 4, !dbg !1539
  %cmp64 = fcmp ogt float %54, %55, !dbg !1540
  br i1 %cmp64, label %if.then65, label %if.end68, !dbg !1541

if.then65:                                        ; preds = %for.body56
  %56 = load i32**, i32*** %feasible.addr, align 8, !dbg !1542
  %57 = load i32*, i32** %56, align 8, !dbg !1544
  %58 = load i32, i32* %i51, align 4, !dbg !1545
  %idxprom66 = sext i32 %58 to i64, !dbg !1546
  %arrayidx67 = getelementptr inbounds i32, i32* %57, i64 %idxprom66, !dbg !1546
  store i32 0, i32* %arrayidx67, align 4, !dbg !1547
  br label %for.inc80, !dbg !1548

if.end68:                                         ; preds = %for.body56
  br label %while.cond, !dbg !1549

while.cond:                                       ; preds = %if.end77, %if.end68
  %59 = load i32, i32* %l, align 4, !dbg !1550
  %add69 = add nsw i32 %59, 1, !dbg !1552
  %60 = load i32, i32* %r, align 4, !dbg !1553
  %cmp70 = icmp slt i32 %add69, %60, !dbg !1554
  br i1 %cmp70, label %while.body, label %while.end, !dbg !1555

while.body:                                       ; preds = %while.cond
  %61 = load i32, i32* %l, align 4, !dbg !1556
  %62 = load i32, i32* %r, align 4, !dbg !1558
  %add71 = add nsw i32 %61, %62, !dbg !1559
  %div72 = sdiv i32 %add71, 2, !dbg !1560
  store i32 %div72, i32* %k, align 4, !dbg !1561
  %63 = load float*, float** %accumweight, align 8, !dbg !1562
  %64 = load i32, i32* %k, align 4, !dbg !1564
  %idxprom73 = sext i32 %64 to i64, !dbg !1562
  %arrayidx74 = getelementptr inbounds float, float* %63, i64 %idxprom73, !dbg !1562
  %65 = load float, float* %arrayidx74, align 4, !dbg !1562
  %66 = load float, float* %w, align 4, !dbg !1565
  %cmp75 = fcmp ogt float %65, %66, !dbg !1566
  br i1 %cmp75, label %if.then76, label %if.else, !dbg !1567

if.then76:                                        ; preds = %while.body
  %67 = load i32, i32* %k, align 4, !dbg !1568
  store i32 %67, i32* %r, align 4, !dbg !1570
  br label %if.end77, !dbg !1571

if.else:                                          ; preds = %while.body
  %68 = load i32, i32* %k, align 4, !dbg !1572
  store i32 %68, i32* %l, align 4, !dbg !1574
  br label %if.end77

if.end77:                                         ; preds = %if.else, %if.then76
  br label %while.cond, !dbg !1575, !llvm.loop !1577

while.end:                                        ; preds = %while.cond
  %69 = load i32, i32* %r, align 4, !dbg !1578
  %70 = load i32**, i32*** %feasible.addr, align 8, !dbg !1579
  %71 = load i32*, i32** %70, align 8, !dbg !1580
  %72 = load i32, i32* %i51, align 4, !dbg !1581
  %idxprom78 = sext i32 %72 to i64, !dbg !1582
  %arrayidx79 = getelementptr inbounds i32, i32* %71, i64 %idxprom78, !dbg !1582
  store i32 %69, i32* %arrayidx79, align 4, !dbg !1583
  br label %for.inc80, !dbg !1584

for.inc80:                                        ; preds = %while.end, %if.then65
  %73 = load i32, i32* %i51, align 4, !dbg !1585
  %inc81 = add nsw i32 %73, 1, !dbg !1585
  store i32 %inc81, i32* %i51, align 4, !dbg !1585
  br label %for.cond53, !dbg !1587, !llvm.loop !1588

for.end82:                                        ; preds = %for.cond53
  %74 = load float*, float** %accumweight, align 8, !dbg !1590
  %75 = bitcast float* %74 to i8*, !dbg !1590
  call void @free(i8* %75) #2, !dbg !1591
  call void @llvm.dbg.declare(metadata double* %t2, metadata !1592, metadata !671), !dbg !1593
  %call83 = call double @_Z7gettimev(), !dbg !1594
  store double %call83, double* %t2, align 8, !dbg !1593
  %76 = load double, double* %t2, align 8, !dbg !1595
  %77 = load double, double* %t1, align 8, !dbg !1596
  %sub84 = fsub double %76, %77, !dbg !1597
  %78 = load double, double* @time_select_feasible, align 8, !dbg !1598
  %add85 = fadd double %78, %sub84, !dbg !1598
  store double %add85, double* @time_select_feasible, align 8, !dbg !1598
  %79 = load i32, i32* %numfeasible, align 4, !dbg !1599
  store i32 %79, i32* %retval, align 4, !dbg !1600
  br label %return, !dbg !1600

return:                                           ; preds = %for.end82, %for.end
  %80 = load i32, i32* %retval, align 4, !dbg !1601
  ret i32 %80, !dbg !1601
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
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !1602, metadata !671), !dbg !1603
  store i64 %kmin, i64* %kmin.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %kmin.addr, metadata !1604, metadata !671), !dbg !1605
  store i64 %kmax, i64* %kmax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %kmax.addr, metadata !1606, metadata !671), !dbg !1607
  store i64* %kfinal, i64** %kfinal.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %kfinal.addr, metadata !1608, metadata !671), !dbg !1609
  store i32 %pid, i32* %pid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pid.addr, metadata !1610, metadata !671), !dbg !1611
  store %union.pthread_barrier_t* %barrier, %union.pthread_barrier_t** %barrier.addr, align 8
  call void @llvm.dbg.declare(metadata %union.pthread_barrier_t** %barrier.addr, metadata !1612, metadata !671), !dbg !1613
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1614, metadata !671), !dbg !1615
  call void @llvm.dbg.declare(metadata float* %cost, metadata !1616, metadata !671), !dbg !1617
  call void @llvm.dbg.declare(metadata float* %lastcost, metadata !1618, metadata !671), !dbg !1619
  call void @llvm.dbg.declare(metadata float* %hiz, metadata !1620, metadata !671), !dbg !1621
  call void @llvm.dbg.declare(metadata float* %loz, metadata !1622, metadata !671), !dbg !1623
  call void @llvm.dbg.declare(metadata float* %z, metadata !1624, metadata !671), !dbg !1625
  %0 = load i32, i32* %pid.addr, align 4, !dbg !1626
  %cmp = icmp eq i32 %0, 0, !dbg !1628
  br i1 %cmp, label %if.then, label %if.end, !dbg !1629

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @_ZL5nproc, align 4, !dbg !1630
  %conv = sext i32 %1 to i64, !dbg !1630
  %call = call noalias i8* @calloc(i64 %conv, i64 4) #2, !dbg !1632
  %2 = bitcast i8* %call to float*, !dbg !1633
  store float* %2, float** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs, align 8, !dbg !1634
  br label %if.end, !dbg !1635

if.end:                                           ; preds = %if.then, %entry
  store float 0.000000e+00, float* %loz, align 4, !dbg !1636
  store float 0.000000e+00, float* %hiz, align 4, !dbg !1637
  call void @llvm.dbg.declare(metadata i64* %numberOfPoints, metadata !1638, metadata !671), !dbg !1639
  %3 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1640
  %num = getelementptr inbounds %struct.Points, %struct.Points* %3, i32 0, i32 0, !dbg !1641
  %4 = load i64, i64* %num, align 8, !dbg !1641
  store i64 %4, i64* %numberOfPoints, align 8, !dbg !1639
  call void @llvm.dbg.declare(metadata i64* %ptDimension, metadata !1642, metadata !671), !dbg !1643
  %5 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1644
  %dim = getelementptr inbounds %struct.Points, %struct.Points* %5, i32 0, i32 1, !dbg !1645
  %6 = load i32, i32* %dim, align 8, !dbg !1645
  %conv1 = sext i32 %6 to i64, !dbg !1644
  store i64 %conv1, i64* %ptDimension, align 8, !dbg !1643
  call void @llvm.dbg.declare(metadata i64* %bsize, metadata !1646, metadata !671), !dbg !1647
  %7 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1648
  %num2 = getelementptr inbounds %struct.Points, %struct.Points* %7, i32 0, i32 0, !dbg !1649
  %8 = load i64, i64* %num2, align 8, !dbg !1649
  %9 = load i32, i32* @_ZL5nproc, align 4, !dbg !1650
  %conv3 = sext i32 %9 to i64, !dbg !1650
  %div = sdiv i64 %8, %conv3, !dbg !1651
  store i64 %div, i64* %bsize, align 8, !dbg !1647
  call void @llvm.dbg.declare(metadata i64* %k1, metadata !1652, metadata !671), !dbg !1653
  %10 = load i64, i64* %bsize, align 8, !dbg !1654
  %11 = load i32, i32* %pid.addr, align 4, !dbg !1655
  %conv4 = sext i32 %11 to i64, !dbg !1655
  %mul = mul nsw i64 %10, %conv4, !dbg !1656
  store i64 %mul, i64* %k1, align 8, !dbg !1653
  call void @llvm.dbg.declare(metadata i64* %k2, metadata !1657, metadata !671), !dbg !1658
  %12 = load i64, i64* %k1, align 8, !dbg !1659
  %13 = load i64, i64* %bsize, align 8, !dbg !1660
  %add = add nsw i64 %12, %13, !dbg !1661
  store i64 %add, i64* %k2, align 8, !dbg !1658
  %14 = load i32, i32* %pid.addr, align 4, !dbg !1662
  %15 = load i32, i32* @_ZL5nproc, align 4, !dbg !1664
  %sub = sub nsw i32 %15, 1, !dbg !1665
  %cmp5 = icmp eq i32 %14, %sub, !dbg !1666
  br i1 %cmp5, label %if.then6, label %if.end8, !dbg !1667

if.then6:                                         ; preds = %if.end
  %16 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1668
  %num7 = getelementptr inbounds %struct.Points, %struct.Points* %16, i32 0, i32 0, !dbg !1670
  %17 = load i64, i64* %num7, align 8, !dbg !1670
  store i64 %17, i64* %k2, align 8, !dbg !1671
  br label %if.end8, !dbg !1672

if.end8:                                          ; preds = %if.then6, %if.end
  call void @llvm.dbg.declare(metadata float* %myhiz, metadata !1673, metadata !671), !dbg !1674
  store float 0.000000e+00, float* %myhiz, align 4, !dbg !1674
  call void @llvm.dbg.declare(metadata i64* %kk, metadata !1675, metadata !671), !dbg !1677
  %18 = load i64, i64* %k1, align 8, !dbg !1678
  store i64 %18, i64* %kk, align 8, !dbg !1677
  br label %for.cond, !dbg !1679

for.cond:                                         ; preds = %for.inc, %if.end8
  %19 = load i64, i64* %kk, align 8, !dbg !1680
  %20 = load i64, i64* %k2, align 8, !dbg !1683
  %cmp9 = icmp slt i64 %19, %20, !dbg !1684
  br i1 %cmp9, label %for.body, label %for.end, !dbg !1685

for.body:                                         ; preds = %for.cond
  %21 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1686
  %p = getelementptr inbounds %struct.Points, %struct.Points* %21, i32 0, i32 2, !dbg !1688
  %22 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !1688
  %23 = load i64, i64* %kk, align 8, !dbg !1689
  %arrayidx = getelementptr inbounds %struct.Point, %struct.Point* %22, i64 %23, !dbg !1686
  %24 = bitcast %struct.Point* %agg.tmp to i8*, !dbg !1686
  %25 = bitcast %struct.Point* %arrayidx to i8*, !dbg !1686
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %24, i8* %25, i64 32, i32 8, i1 false), !dbg !1686
  %26 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1690
  %p11 = getelementptr inbounds %struct.Points, %struct.Points* %26, i32 0, i32 2, !dbg !1691
  %27 = load %struct.Point*, %struct.Point** %p11, align 8, !dbg !1691
  %arrayidx12 = getelementptr inbounds %struct.Point, %struct.Point* %27, i64 0, !dbg !1690
  %28 = bitcast %struct.Point* %agg.tmp10 to i8*, !dbg !1690
  %29 = bitcast %struct.Point* %arrayidx12 to i8*, !dbg !1690
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 32, i32 8, i1 false), !dbg !1690
  %30 = load i64, i64* %ptDimension, align 8, !dbg !1692
  %conv13 = trunc i64 %30 to i32, !dbg !1692
  %call14 = call float @_Z4dist5PointS_i(%struct.Point* byval align 8 %agg.tmp, %struct.Point* byval align 8 %agg.tmp10, i32 %conv13), !dbg !1693
  %31 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1694
  %p15 = getelementptr inbounds %struct.Points, %struct.Points* %31, i32 0, i32 2, !dbg !1695
  %32 = load %struct.Point*, %struct.Point** %p15, align 8, !dbg !1695
  %33 = load i64, i64* %kk, align 8, !dbg !1696
  %arrayidx16 = getelementptr inbounds %struct.Point, %struct.Point* %32, i64 %33, !dbg !1694
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx16, i32 0, i32 0, !dbg !1697
  %34 = load float, float* %weight, align 8, !dbg !1697
  %mul17 = fmul float %call14, %34, !dbg !1698
  %35 = load float, float* %myhiz, align 4, !dbg !1699
  %add18 = fadd float %35, %mul17, !dbg !1699
  store float %add18, float* %myhiz, align 4, !dbg !1699
  br label %for.inc, !dbg !1700

for.inc:                                          ; preds = %for.body
  %36 = load i64, i64* %kk, align 8, !dbg !1701
  %inc = add nsw i64 %36, 1, !dbg !1701
  store i64 %inc, i64* %kk, align 8, !dbg !1701
  br label %for.cond, !dbg !1703, !llvm.loop !1704

for.end:                                          ; preds = %for.cond
  %37 = load float, float* %myhiz, align 4, !dbg !1706
  %38 = load float*, float** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs, align 8, !dbg !1707
  %39 = load i32, i32* %pid.addr, align 4, !dbg !1708
  %idxprom = sext i32 %39 to i64, !dbg !1707
  %arrayidx19 = getelementptr inbounds float, float* %38, i64 %idxprom, !dbg !1707
  store float %37, float* %arrayidx19, align 4, !dbg !1709
  call void @llvm.dbg.declare(metadata i32* %i20, metadata !1710, metadata !671), !dbg !1712
  store i32 0, i32* %i20, align 4, !dbg !1712
  br label %for.cond21, !dbg !1713

for.cond21:                                       ; preds = %for.inc27, %for.end
  %40 = load i32, i32* %i20, align 4, !dbg !1714
  %41 = load i32, i32* @_ZL5nproc, align 4, !dbg !1717
  %cmp22 = icmp slt i32 %40, %41, !dbg !1718
  br i1 %cmp22, label %for.body23, label %for.end29, !dbg !1719

for.body23:                                       ; preds = %for.cond21
  %42 = load float*, float** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs, align 8, !dbg !1720
  %43 = load i32, i32* %i20, align 4, !dbg !1722
  %idxprom24 = sext i32 %43 to i64, !dbg !1720
  %arrayidx25 = getelementptr inbounds float, float* %42, i64 %idxprom24, !dbg !1720
  %44 = load float, float* %arrayidx25, align 4, !dbg !1720
  %45 = load float, float* %hiz, align 4, !dbg !1723
  %add26 = fadd float %45, %44, !dbg !1723
  store float %add26, float* %hiz, align 4, !dbg !1723
  br label %for.inc27, !dbg !1724

for.inc27:                                        ; preds = %for.body23
  %46 = load i32, i32* %i20, align 4, !dbg !1725
  %inc28 = add nsw i32 %46, 1, !dbg !1725
  store i32 %inc28, i32* %i20, align 4, !dbg !1725
  br label %for.cond21, !dbg !1727, !llvm.loop !1728

for.end29:                                        ; preds = %for.cond21
  store float 0.000000e+00, float* %loz, align 4, !dbg !1730
  %47 = load float, float* %hiz, align 4, !dbg !1731
  %48 = load float, float* %loz, align 4, !dbg !1732
  %add30 = fadd float %47, %48, !dbg !1733
  %conv31 = fpext float %add30 to double, !dbg !1734
  %div32 = fdiv double %conv31, 2.000000e+00, !dbg !1735
  %conv33 = fptrunc double %div32 to float, !dbg !1734
  store float %conv33, float* %z, align 4, !dbg !1736
  %49 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1737
  %num34 = getelementptr inbounds %struct.Points, %struct.Points* %49, i32 0, i32 0, !dbg !1739
  %50 = load i64, i64* %num34, align 8, !dbg !1739
  %51 = load i64, i64* %kmax.addr, align 8, !dbg !1740
  %cmp35 = icmp sle i64 %50, %51, !dbg !1741
  br i1 %cmp35, label %if.then36, label %if.end52, !dbg !1742

if.then36:                                        ; preds = %for.end29
  call void @llvm.dbg.declare(metadata i64* %kk37, metadata !1743, metadata !671), !dbg !1746
  %52 = load i64, i64* %k1, align 8, !dbg !1747
  store i64 %52, i64* %kk37, align 8, !dbg !1746
  br label %for.cond38, !dbg !1748

for.cond38:                                       ; preds = %for.inc46, %if.then36
  %53 = load i64, i64* %kk37, align 8, !dbg !1749
  %54 = load i64, i64* %k2, align 8, !dbg !1752
  %cmp39 = icmp slt i64 %53, %54, !dbg !1753
  br i1 %cmp39, label %for.body40, label %for.end48, !dbg !1754

for.body40:                                       ; preds = %for.cond38
  %55 = load i64, i64* %kk37, align 8, !dbg !1755
  %56 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1757
  %p41 = getelementptr inbounds %struct.Points, %struct.Points* %56, i32 0, i32 2, !dbg !1758
  %57 = load %struct.Point*, %struct.Point** %p41, align 8, !dbg !1758
  %58 = load i64, i64* %kk37, align 8, !dbg !1759
  %arrayidx42 = getelementptr inbounds %struct.Point, %struct.Point* %57, i64 %58, !dbg !1757
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx42, i32 0, i32 2, !dbg !1760
  store i64 %55, i64* %assign, align 8, !dbg !1761
  %59 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1762
  %p43 = getelementptr inbounds %struct.Points, %struct.Points* %59, i32 0, i32 2, !dbg !1763
  %60 = load %struct.Point*, %struct.Point** %p43, align 8, !dbg !1763
  %61 = load i64, i64* %kk37, align 8, !dbg !1764
  %arrayidx44 = getelementptr inbounds %struct.Point, %struct.Point* %60, i64 %61, !dbg !1762
  %cost45 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx44, i32 0, i32 3, !dbg !1765
  store float 0.000000e+00, float* %cost45, align 8, !dbg !1766
  br label %for.inc46, !dbg !1767

for.inc46:                                        ; preds = %for.body40
  %62 = load i64, i64* %kk37, align 8, !dbg !1768
  %inc47 = add nsw i64 %62, 1, !dbg !1768
  store i64 %inc47, i64* %kk37, align 8, !dbg !1768
  br label %for.cond38, !dbg !1770, !llvm.loop !1771

for.end48:                                        ; preds = %for.cond38
  store float 0.000000e+00, float* %cost, align 4, !dbg !1773
  %63 = load i32, i32* %pid.addr, align 4, !dbg !1774
  %cmp49 = icmp eq i32 %63, 0, !dbg !1776
  br i1 %cmp49, label %if.then50, label %if.end51, !dbg !1777

if.then50:                                        ; preds = %for.end48
  %64 = load float*, float** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs, align 8, !dbg !1778
  %65 = bitcast float* %64 to i8*, !dbg !1778
  call void @free(i8* %65) #2, !dbg !1780
  %66 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1781
  %67 = load i64*, i64** %kfinal.addr, align 8, !dbg !1782
  store i64 %66, i64* %67, align 8, !dbg !1783
  br label %if.end51, !dbg !1784

if.end51:                                         ; preds = %if.then50, %for.end48
  %68 = load float, float* %cost, align 4, !dbg !1785
  store float %68, float* %retval, align 4, !dbg !1786
  br label %return, !dbg !1786

if.end52:                                         ; preds = %for.end29
  %69 = load i32, i32* %pid.addr, align 4, !dbg !1787
  %cmp53 = icmp eq i32 %69, 0, !dbg !1789
  br i1 %cmp53, label %if.then54, label %if.end55, !dbg !1790

if.then54:                                        ; preds = %if.end52
  %70 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1791
  call void @_Z7shuffleP6Points(%struct.Points* %70), !dbg !1793
  br label %if.end55, !dbg !1793

if.end55:                                         ; preds = %if.then54, %if.end52
  %71 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1794
  %72 = load float, float* %z, align 4, !dbg !1795
  %73 = load i32, i32* %pid.addr, align 4, !dbg !1796
  %74 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier.addr, align 8, !dbg !1797
  %call56 = call float @_Z7pspeedyP6PointsfPliP17pthread_barrier_t(%struct.Points* %71, float %72, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, i32 %73, %union.pthread_barrier_t* %74), !dbg !1798
  store float %call56, float* %cost, align 4, !dbg !1799
  store i32 0, i32* %i, align 4, !dbg !1800
  br label %while.cond, !dbg !1801

while.cond:                                       ; preds = %while.body, %if.end55
  %75 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1802
  %76 = load i64, i64* %kmin.addr, align 8, !dbg !1804
  %cmp57 = icmp slt i64 %75, %76, !dbg !1805
  br i1 %cmp57, label %land.rhs, label %land.end, !dbg !1806

land.rhs:                                         ; preds = %while.cond
  %77 = load i32, i32* %i, align 4, !dbg !1807
  %cmp58 = icmp slt i32 %77, 1, !dbg !1809
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %78 = phi i1 [ false, %while.cond ], [ %cmp58, %land.rhs ]
  br i1 %78, label %while.body, label %while.end, !dbg !1810

while.body:                                       ; preds = %land.end
  %79 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1812
  %80 = load float, float* %z, align 4, !dbg !1814
  %81 = load i32, i32* %pid.addr, align 4, !dbg !1815
  %82 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier.addr, align 8, !dbg !1816
  %call59 = call float @_Z7pspeedyP6PointsfPliP17pthread_barrier_t(%struct.Points* %79, float %80, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, i32 %81, %union.pthread_barrier_t* %82), !dbg !1817
  store float %call59, float* %cost, align 4, !dbg !1818
  %83 = load i32, i32* %i, align 4, !dbg !1819
  %inc60 = add nsw i32 %83, 1, !dbg !1819
  store i32 %inc60, i32* %i, align 4, !dbg !1819
  br label %while.cond, !dbg !1820, !llvm.loop !1822

while.end:                                        ; preds = %land.end
  br label %while.cond61, !dbg !1823

while.cond61:                                     ; preds = %if.end73, %while.end
  %84 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1824
  %85 = load i64, i64* %kmin.addr, align 8, !dbg !1825
  %cmp62 = icmp slt i64 %84, %85, !dbg !1826
  br i1 %cmp62, label %while.body63, label %while.end76, !dbg !1827

while.body63:                                     ; preds = %while.cond61
  %86 = load i32, i32* %i, align 4, !dbg !1828
  %cmp64 = icmp sge i32 %86, 1, !dbg !1831
  br i1 %cmp64, label %if.then65, label %if.end70, !dbg !1832

if.then65:                                        ; preds = %while.body63
  %87 = load float, float* %z, align 4, !dbg !1833
  store float %87, float* %hiz, align 4, !dbg !1836
  %88 = load float, float* %hiz, align 4, !dbg !1837
  %89 = load float, float* %loz, align 4, !dbg !1838
  %add66 = fadd float %88, %89, !dbg !1839
  %conv67 = fpext float %add66 to double, !dbg !1840
  %div68 = fdiv double %conv67, 2.000000e+00, !dbg !1841
  %conv69 = fptrunc double %div68 to float, !dbg !1840
  store float %conv69, float* %z, align 4, !dbg !1842
  store i32 0, i32* %i, align 4, !dbg !1843
  br label %if.end70, !dbg !1844

if.end70:                                         ; preds = %if.then65, %while.body63
  %90 = load i32, i32* %pid.addr, align 4, !dbg !1845
  %cmp71 = icmp eq i32 %90, 0, !dbg !1847
  br i1 %cmp71, label %if.then72, label %if.end73, !dbg !1848

if.then72:                                        ; preds = %if.end70
  %91 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1849
  call void @_Z7shuffleP6Points(%struct.Points* %91), !dbg !1851
  br label %if.end73, !dbg !1851

if.end73:                                         ; preds = %if.then72, %if.end70
  %92 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1852
  %93 = load float, float* %z, align 4, !dbg !1853
  %94 = load i32, i32* %pid.addr, align 4, !dbg !1854
  %95 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier.addr, align 8, !dbg !1855
  %call74 = call float @_Z7pspeedyP6PointsfPliP17pthread_barrier_t(%struct.Points* %92, float %93, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, i32 %94, %union.pthread_barrier_t* %95), !dbg !1856
  store float %call74, float* %cost, align 4, !dbg !1857
  %96 = load i32, i32* %i, align 4, !dbg !1858
  %inc75 = add nsw i32 %96, 1, !dbg !1858
  store i32 %inc75, i32* %i, align 4, !dbg !1858
  br label %while.cond61, !dbg !1859, !llvm.loop !1860

while.end76:                                      ; preds = %while.cond61
  %97 = load i32, i32* %pid.addr, align 4, !dbg !1861
  %cmp77 = icmp eq i32 %97, 0, !dbg !1863
  br i1 %cmp77, label %if.then78, label %if.end95, !dbg !1864

if.then78:                                        ; preds = %while.end76
  %98 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1865
  %99 = load i64, i64* %kmin.addr, align 8, !dbg !1867
  %conv79 = trunc i64 %99 to i32, !dbg !1867
  %100 = load i32, i32* %pid.addr, align 4, !dbg !1868
  %101 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier.addr, align 8, !dbg !1869
  %call80 = call i32 @_Z19selectfeasible_fastP6PointsPPiiiP17pthread_barrier_t(%struct.Points* %98, i32** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE8feasible, i32 %conv79, i32 %100, %union.pthread_barrier_t* %101), !dbg !1870
  store i32 %call80, i32* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE11numfeasible, align 4, !dbg !1871
  call void @llvm.dbg.declare(metadata i32* %i81, metadata !1872, metadata !671), !dbg !1874
  store i32 0, i32* %i81, align 4, !dbg !1874
  br label %for.cond82, !dbg !1875

for.cond82:                                       ; preds = %for.inc92, %if.then78
  %102 = load i32, i32* %i81, align 4, !dbg !1876
  %conv83 = sext i32 %102 to i64, !dbg !1876
  %103 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1879
  %num84 = getelementptr inbounds %struct.Points, %struct.Points* %103, i32 0, i32 0, !dbg !1880
  %104 = load i64, i64* %num84, align 8, !dbg !1880
  %cmp85 = icmp slt i64 %conv83, %104, !dbg !1881
  br i1 %cmp85, label %for.body86, label %for.end94, !dbg !1882

for.body86:                                       ; preds = %for.cond82
  %105 = load i8*, i8** @_ZL9is_center, align 8, !dbg !1883
  %106 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1885
  %p87 = getelementptr inbounds %struct.Points, %struct.Points* %106, i32 0, i32 2, !dbg !1886
  %107 = load %struct.Point*, %struct.Point** %p87, align 8, !dbg !1886
  %108 = load i32, i32* %i81, align 4, !dbg !1887
  %idxprom88 = sext i32 %108 to i64, !dbg !1885
  %arrayidx89 = getelementptr inbounds %struct.Point, %struct.Point* %107, i64 %idxprom88, !dbg !1885
  %assign90 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx89, i32 0, i32 2, !dbg !1888
  %109 = load i64, i64* %assign90, align 8, !dbg !1888
  %arrayidx91 = getelementptr inbounds i8, i8* %105, i64 %109, !dbg !1883
  store i8 1, i8* %arrayidx91, align 1, !dbg !1889
  br label %for.inc92, !dbg !1890

for.inc92:                                        ; preds = %for.body86
  %110 = load i32, i32* %i81, align 4, !dbg !1891
  %inc93 = add nsw i32 %110, 1, !dbg !1891
  store i32 %inc93, i32* %i81, align 4, !dbg !1891
  br label %for.cond82, !dbg !1893, !llvm.loop !1894

for.end94:                                        ; preds = %for.cond82
  br label %if.end95, !dbg !1896

if.end95:                                         ; preds = %for.end94, %while.end76
  br label %while.body97, !dbg !1897

while.body97:                                     ; preds = %if.end95, %if.end162
  %111 = load float, float* %cost, align 4, !dbg !1898
  store float %111, float* %lastcost, align 4, !dbg !1900
  %112 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1901
  %113 = load i32*, i32** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE8feasible, align 8, !dbg !1902
  %114 = load i32, i32* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE11numfeasible, align 4, !dbg !1903
  %115 = load float, float* %z, align 4, !dbg !1904
  %116 = load i64, i64* %kmax.addr, align 8, !dbg !1905
  %conv98 = trunc i64 %116 to i32, !dbg !1905
  %117 = load float, float* %cost, align 4, !dbg !1906
  %118 = load i64, i64* %kmax.addr, align 8, !dbg !1907
  %mul99 = mul nsw i64 3, %118, !dbg !1908
  %conv100 = sitofp i64 %mul99 to double, !dbg !1909
  %119 = load i64, i64* %kmax.addr, align 8, !dbg !1910
  %conv101 = sitofp i64 %119 to float, !dbg !1910
  %conv102 = fpext float %conv101 to double, !dbg !1911
  %call103 = call double @log(double %conv102) #2, !dbg !1912
  %mul104 = fmul double %conv100, %call103, !dbg !1913
  %conv105 = fptosi double %mul104 to i64, !dbg !1914
  %120 = load i32, i32* %pid.addr, align 4, !dbg !1915
  %121 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier.addr, align 8, !dbg !1916
  %call106 = call float @_Z3pFLP6PointsPiifPliflfiP17pthread_barrier_t(%struct.Points* %112, i32* %113, i32 %114, float %115, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, i32 %conv98, float %117, i64 %conv105, float 0x3FB99999A0000000, i32 %120, %union.pthread_barrier_t* %121), !dbg !1917
  store float %call106, float* %cost, align 4, !dbg !1918
  %122 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1919
  %conv107 = sitofp i64 %122 to double, !dbg !1919
  %123 = load i64, i64* %kmax.addr, align 8, !dbg !1921
  %conv108 = sitofp i64 %123 to double, !dbg !1921
  %mul109 = fmul double 1.100000e+00, %conv108, !dbg !1922
  %cmp110 = fcmp ole double %conv107, %mul109, !dbg !1923
  br i1 %cmp110, label %land.lhs.true, label %lor.lhs.false, !dbg !1924

land.lhs.true:                                    ; preds = %while.body97
  %124 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1925
  %conv111 = sitofp i64 %124 to double, !dbg !1925
  %125 = load i64, i64* %kmin.addr, align 8, !dbg !1927
  %conv112 = sitofp i64 %125 to double, !dbg !1927
  %mul113 = fmul double 9.000000e-01, %conv112, !dbg !1928
  %cmp114 = fcmp oge double %conv111, %mul113, !dbg !1929
  br i1 %cmp114, label %if.then120, label %lor.lhs.false, !dbg !1930

lor.lhs.false:                                    ; preds = %land.lhs.true, %while.body97
  %126 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1931
  %127 = load i64, i64* %kmax.addr, align 8, !dbg !1932
  %add115 = add nsw i64 %127, 2, !dbg !1933
  %cmp116 = icmp sle i64 %126, %add115, !dbg !1934
  br i1 %cmp116, label %land.lhs.true117, label %if.end130, !dbg !1935

land.lhs.true117:                                 ; preds = %lor.lhs.false
  %128 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1936
  %129 = load i64, i64* %kmin.addr, align 8, !dbg !1937
  %sub118 = sub nsw i64 %129, 2, !dbg !1938
  %cmp119 = icmp sge i64 %128, %sub118, !dbg !1939
  br i1 %cmp119, label %if.then120, label %if.end130, !dbg !1940

if.then120:                                       ; preds = %land.lhs.true117, %land.lhs.true
  %130 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1942
  %131 = load i32*, i32** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE8feasible, align 8, !dbg !1944
  %132 = load i32, i32* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE11numfeasible, align 4, !dbg !1945
  %133 = load float, float* %z, align 4, !dbg !1946
  %134 = load i64, i64* %kmax.addr, align 8, !dbg !1947
  %conv121 = trunc i64 %134 to i32, !dbg !1947
  %135 = load float, float* %cost, align 4, !dbg !1948
  %136 = load i64, i64* %kmax.addr, align 8, !dbg !1949
  %mul122 = mul nsw i64 3, %136, !dbg !1950
  %conv123 = sitofp i64 %mul122 to double, !dbg !1951
  %137 = load i64, i64* %kmax.addr, align 8, !dbg !1952
  %conv124 = sitofp i64 %137 to float, !dbg !1952
  %conv125 = fpext float %conv124 to double, !dbg !1953
  %call126 = call double @log(double %conv125) #2, !dbg !1954
  %mul127 = fmul double %conv123, %call126, !dbg !1955
  %conv128 = fptosi double %mul127 to i64, !dbg !1956
  %138 = load i32, i32* %pid.addr, align 4, !dbg !1957
  %139 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier.addr, align 8, !dbg !1958
  %call129 = call float @_Z3pFLP6PointsPiifPliflfiP17pthread_barrier_t(%struct.Points* %130, i32* %131, i32 %132, float %133, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, i32 %conv121, float %135, i64 %conv128, float 0x3F50624DE0000000, i32 %138, %union.pthread_barrier_t* %139), !dbg !1959
  store float %call129, float* %cost, align 4, !dbg !1960
  br label %if.end130, !dbg !1961

if.end130:                                        ; preds = %if.then120, %land.lhs.true117, %lor.lhs.false
  %140 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1962
  %141 = load i64, i64* %kmax.addr, align 8, !dbg !1964
  %cmp131 = icmp sgt i64 %140, %141, !dbg !1965
  br i1 %cmp131, label %if.then132, label %if.end141, !dbg !1966

if.then132:                                       ; preds = %if.end130
  %142 = load float, float* %z, align 4, !dbg !1967
  store float %142, float* %loz, align 4, !dbg !1969
  %143 = load float, float* %hiz, align 4, !dbg !1970
  %144 = load float, float* %loz, align 4, !dbg !1971
  %add133 = fadd float %143, %144, !dbg !1972
  %conv134 = fpext float %add133 to double, !dbg !1973
  %div135 = fdiv double %conv134, 2.000000e+00, !dbg !1974
  %conv136 = fptrunc double %div135 to float, !dbg !1973
  store float %conv136, float* %z, align 4, !dbg !1975
  %145 = load float, float* %z, align 4, !dbg !1976
  %146 = load float, float* %loz, align 4, !dbg !1977
  %sub137 = fsub float %145, %146, !dbg !1978
  %147 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1979
  %conv138 = sitofp i64 %147 to float, !dbg !1979
  %mul139 = fmul float %sub137, %conv138, !dbg !1980
  %148 = load float, float* %cost, align 4, !dbg !1981
  %add140 = fadd float %148, %mul139, !dbg !1981
  store float %add140, float* %cost, align 4, !dbg !1981
  br label %if.end141, !dbg !1982

if.end141:                                        ; preds = %if.then132, %if.end130
  %149 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !1983
  %150 = load i64, i64* %kmin.addr, align 8, !dbg !1985
  %cmp142 = icmp slt i64 %149, %150, !dbg !1986
  br i1 %cmp142, label %if.then143, label %if.end152, !dbg !1987

if.then143:                                       ; preds = %if.end141
  %151 = load float, float* %z, align 4, !dbg !1988
  store float %151, float* %hiz, align 4, !dbg !1990
  %152 = load float, float* %hiz, align 4, !dbg !1991
  %153 = load float, float* %loz, align 4, !dbg !1992
  %add144 = fadd float %152, %153, !dbg !1993
  %conv145 = fpext float %add144 to double, !dbg !1994
  %div146 = fdiv double %conv145, 2.000000e+00, !dbg !1995
  %conv147 = fptrunc double %div146 to float, !dbg !1994
  store float %conv147, float* %z, align 4, !dbg !1996
  %154 = load float, float* %z, align 4, !dbg !1997
  %155 = load float, float* %hiz, align 4, !dbg !1998
  %sub148 = fsub float %154, %155, !dbg !1999
  %156 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !2000
  %conv149 = sitofp i64 %156 to float, !dbg !2000
  %mul150 = fmul float %sub148, %conv149, !dbg !2001
  %157 = load float, float* %cost, align 4, !dbg !2002
  %add151 = fadd float %157, %mul150, !dbg !2002
  store float %add151, float* %cost, align 4, !dbg !2002
  br label %if.end152, !dbg !2003

if.end152:                                        ; preds = %if.then143, %if.end141
  %158 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !2004
  %159 = load i64, i64* %kmax.addr, align 8, !dbg !2006
  %cmp153 = icmp sle i64 %158, %159, !dbg !2007
  br i1 %cmp153, label %land.lhs.true154, label %lor.lhs.false156, !dbg !2008

land.lhs.true154:                                 ; preds = %if.end152
  %160 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !2009
  %161 = load i64, i64* %kmin.addr, align 8, !dbg !2011
  %cmp155 = icmp sge i64 %160, %161, !dbg !2012
  br i1 %cmp155, label %if.then161, label %lor.lhs.false156, !dbg !2013

lor.lhs.false156:                                 ; preds = %land.lhs.true154, %if.end152
  %162 = load float, float* %loz, align 4, !dbg !2014
  %conv157 = fpext float %162 to double, !dbg !2014
  %163 = load float, float* %hiz, align 4, !dbg !2016
  %conv158 = fpext float %163 to double, !dbg !2016
  %mul159 = fmul double 9.990000e-01, %conv158, !dbg !2017
  %cmp160 = fcmp oge double %conv157, %mul159, !dbg !2018
  br i1 %cmp160, label %if.then161, label %if.end162, !dbg !2019

if.then161:                                       ; preds = %lor.lhs.false156, %land.lhs.true154
  br label %while.end163, !dbg !2020

if.end162:                                        ; preds = %lor.lhs.false156
  br label %while.body97, !dbg !2022, !llvm.loop !2023

while.end163:                                     ; preds = %if.then161
  %164 = load i32, i32* %pid.addr, align 4, !dbg !2024
  %cmp164 = icmp eq i32 %164, 0, !dbg !2026
  br i1 %cmp164, label %if.then165, label %if.end166, !dbg !2027

if.then165:                                       ; preds = %while.end163
  %165 = load i32*, i32** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE8feasible, align 8, !dbg !2028
  %166 = bitcast i32* %165 to i8*, !dbg !2028
  call void @free(i8* %166) #2, !dbg !2030
  %167 = load float*, float** @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE4hizs, align 8, !dbg !2031
  %168 = bitcast float* %167 to i8*, !dbg !2031
  call void @free(i8* %168) #2, !dbg !2032
  %169 = load i64, i64* @_ZZ8pkmedianP6PointsllPliP17pthread_barrier_tE1k, align 8, !dbg !2033
  %170 = load i64*, i64** %kfinal.addr, align 8, !dbg !2034
  store i64 %169, i64* %170, align 8, !dbg !2035
  br label %if.end166, !dbg !2036

if.end166:                                        ; preds = %if.then165, %while.end163
  %171 = load float, float* %cost, align 4, !dbg !2037
  store float %171, float* %retval, align 4, !dbg !2038
  br label %return, !dbg !2038

return:                                           ; preds = %if.end166, %if.end51
  %172 = load float, float* %retval, align 4, !dbg !2039
  ret float %172, !dbg !2039
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #5

; Function Attrs: nounwind uwtable
define i32 @_Z11contcentersP6Points(%struct.Points* %points) #4 !dbg !2040 {
entry:
  %points.addr = alloca %struct.Points*, align 8
  %i = alloca i64, align 8
  %ii = alloca i64, align 8
  %relweight = alloca float, align 4
  store %struct.Points* %points, %struct.Points** %points.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !2043, metadata !671), !dbg !2044
  call void @llvm.dbg.declare(metadata i64* %i, metadata !2045, metadata !671), !dbg !2046
  call void @llvm.dbg.declare(metadata i64* %ii, metadata !2047, metadata !671), !dbg !2048
  call void @llvm.dbg.declare(metadata float* %relweight, metadata !2049, metadata !671), !dbg !2050
  store i64 0, i64* %i, align 8, !dbg !2051
  br label %for.cond, !dbg !2053

for.cond:                                         ; preds = %for.inc48, %entry
  %0 = load i64, i64* %i, align 8, !dbg !2054
  %1 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2057
  %num = getelementptr inbounds %struct.Points, %struct.Points* %1, i32 0, i32 0, !dbg !2058
  %2 = load i64, i64* %num, align 8, !dbg !2058
  %cmp = icmp slt i64 %0, %2, !dbg !2059
  br i1 %cmp, label %for.body, label %for.end50, !dbg !2060

for.body:                                         ; preds = %for.cond
  %3 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2061
  %p = getelementptr inbounds %struct.Points, %struct.Points* %3, i32 0, i32 2, !dbg !2064
  %4 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !2064
  %5 = load i64, i64* %i, align 8, !dbg !2065
  %arrayidx = getelementptr inbounds %struct.Point, %struct.Point* %4, i64 %5, !dbg !2061
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx, i32 0, i32 2, !dbg !2066
  %6 = load i64, i64* %assign, align 8, !dbg !2066
  %7 = load i64, i64* %i, align 8, !dbg !2067
  %cmp1 = icmp ne i64 %6, %7, !dbg !2068
  br i1 %cmp1, label %if.then, label %if.end, !dbg !2069

if.then:                                          ; preds = %for.body
  %8 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2070
  %p2 = getelementptr inbounds %struct.Points, %struct.Points* %8, i32 0, i32 2, !dbg !2072
  %9 = load %struct.Point*, %struct.Point** %p2, align 8, !dbg !2072
  %10 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2073
  %p3 = getelementptr inbounds %struct.Points, %struct.Points* %10, i32 0, i32 2, !dbg !2074
  %11 = load %struct.Point*, %struct.Point** %p3, align 8, !dbg !2074
  %12 = load i64, i64* %i, align 8, !dbg !2075
  %arrayidx4 = getelementptr inbounds %struct.Point, %struct.Point* %11, i64 %12, !dbg !2073
  %assign5 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx4, i32 0, i32 2, !dbg !2076
  %13 = load i64, i64* %assign5, align 8, !dbg !2076
  %arrayidx6 = getelementptr inbounds %struct.Point, %struct.Point* %9, i64 %13, !dbg !2070
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx6, i32 0, i32 0, !dbg !2077
  %14 = load float, float* %weight, align 8, !dbg !2077
  %15 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2078
  %p7 = getelementptr inbounds %struct.Points, %struct.Points* %15, i32 0, i32 2, !dbg !2079
  %16 = load %struct.Point*, %struct.Point** %p7, align 8, !dbg !2079
  %17 = load i64, i64* %i, align 8, !dbg !2080
  %arrayidx8 = getelementptr inbounds %struct.Point, %struct.Point* %16, i64 %17, !dbg !2078
  %weight9 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx8, i32 0, i32 0, !dbg !2081
  %18 = load float, float* %weight9, align 8, !dbg !2081
  %add = fadd float %14, %18, !dbg !2082
  store float %add, float* %relweight, align 4, !dbg !2083
  %19 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2084
  %p10 = getelementptr inbounds %struct.Points, %struct.Points* %19, i32 0, i32 2, !dbg !2085
  %20 = load %struct.Point*, %struct.Point** %p10, align 8, !dbg !2085
  %21 = load i64, i64* %i, align 8, !dbg !2086
  %arrayidx11 = getelementptr inbounds %struct.Point, %struct.Point* %20, i64 %21, !dbg !2084
  %weight12 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx11, i32 0, i32 0, !dbg !2087
  %22 = load float, float* %weight12, align 8, !dbg !2087
  %23 = load float, float* %relweight, align 4, !dbg !2088
  %div = fdiv float %22, %23, !dbg !2089
  store float %div, float* %relweight, align 4, !dbg !2090
  store i64 0, i64* %ii, align 8, !dbg !2091
  br label %for.cond13, !dbg !2093

for.cond13:                                       ; preds = %for.inc, %if.then
  %24 = load i64, i64* %ii, align 8, !dbg !2094
  %25 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2097
  %dim = getelementptr inbounds %struct.Points, %struct.Points* %25, i32 0, i32 1, !dbg !2098
  %26 = load i32, i32* %dim, align 8, !dbg !2098
  %conv = sext i32 %26 to i64, !dbg !2097
  %cmp14 = icmp slt i64 %24, %conv, !dbg !2099
  br i1 %cmp14, label %for.body15, label %for.end, !dbg !2100

for.body15:                                       ; preds = %for.cond13
  %27 = load float, float* %relweight, align 4, !dbg !2101
  %conv16 = fpext float %27 to double, !dbg !2101
  %sub = fsub double 1.000000e+00, %conv16, !dbg !2103
  %28 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2104
  %p17 = getelementptr inbounds %struct.Points, %struct.Points* %28, i32 0, i32 2, !dbg !2105
  %29 = load %struct.Point*, %struct.Point** %p17, align 8, !dbg !2105
  %30 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2106
  %p18 = getelementptr inbounds %struct.Points, %struct.Points* %30, i32 0, i32 2, !dbg !2107
  %31 = load %struct.Point*, %struct.Point** %p18, align 8, !dbg !2107
  %32 = load i64, i64* %i, align 8, !dbg !2108
  %arrayidx19 = getelementptr inbounds %struct.Point, %struct.Point* %31, i64 %32, !dbg !2106
  %assign20 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx19, i32 0, i32 2, !dbg !2109
  %33 = load i64, i64* %assign20, align 8, !dbg !2109
  %arrayidx21 = getelementptr inbounds %struct.Point, %struct.Point* %29, i64 %33, !dbg !2104
  %coord = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx21, i32 0, i32 1, !dbg !2110
  %34 = load float*, float** %coord, align 8, !dbg !2110
  %35 = load i64, i64* %ii, align 8, !dbg !2111
  %arrayidx22 = getelementptr inbounds float, float* %34, i64 %35, !dbg !2104
  %36 = load float, float* %arrayidx22, align 4, !dbg !2112
  %conv23 = fpext float %36 to double, !dbg !2112
  %mul = fmul double %conv23, %sub, !dbg !2112
  %conv24 = fptrunc double %mul to float, !dbg !2112
  store float %conv24, float* %arrayidx22, align 4, !dbg !2112
  %37 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2113
  %p25 = getelementptr inbounds %struct.Points, %struct.Points* %37, i32 0, i32 2, !dbg !2114
  %38 = load %struct.Point*, %struct.Point** %p25, align 8, !dbg !2114
  %39 = load i64, i64* %i, align 8, !dbg !2115
  %arrayidx26 = getelementptr inbounds %struct.Point, %struct.Point* %38, i64 %39, !dbg !2113
  %coord27 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx26, i32 0, i32 1, !dbg !2116
  %40 = load float*, float** %coord27, align 8, !dbg !2116
  %41 = load i64, i64* %ii, align 8, !dbg !2117
  %arrayidx28 = getelementptr inbounds float, float* %40, i64 %41, !dbg !2113
  %42 = load float, float* %arrayidx28, align 4, !dbg !2113
  %43 = load float, float* %relweight, align 4, !dbg !2118
  %mul29 = fmul float %42, %43, !dbg !2119
  %44 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2120
  %p30 = getelementptr inbounds %struct.Points, %struct.Points* %44, i32 0, i32 2, !dbg !2121
  %45 = load %struct.Point*, %struct.Point** %p30, align 8, !dbg !2121
  %46 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2122
  %p31 = getelementptr inbounds %struct.Points, %struct.Points* %46, i32 0, i32 2, !dbg !2123
  %47 = load %struct.Point*, %struct.Point** %p31, align 8, !dbg !2123
  %48 = load i64, i64* %i, align 8, !dbg !2124
  %arrayidx32 = getelementptr inbounds %struct.Point, %struct.Point* %47, i64 %48, !dbg !2122
  %assign33 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx32, i32 0, i32 2, !dbg !2125
  %49 = load i64, i64* %assign33, align 8, !dbg !2125
  %arrayidx34 = getelementptr inbounds %struct.Point, %struct.Point* %45, i64 %49, !dbg !2120
  %coord35 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx34, i32 0, i32 1, !dbg !2126
  %50 = load float*, float** %coord35, align 8, !dbg !2126
  %51 = load i64, i64* %ii, align 8, !dbg !2127
  %arrayidx36 = getelementptr inbounds float, float* %50, i64 %51, !dbg !2120
  %52 = load float, float* %arrayidx36, align 4, !dbg !2128
  %add37 = fadd float %52, %mul29, !dbg !2128
  store float %add37, float* %arrayidx36, align 4, !dbg !2128
  br label %for.inc, !dbg !2129

for.inc:                                          ; preds = %for.body15
  %53 = load i64, i64* %ii, align 8, !dbg !2130
  %inc = add nsw i64 %53, 1, !dbg !2130
  store i64 %inc, i64* %ii, align 8, !dbg !2130
  br label %for.cond13, !dbg !2132, !llvm.loop !2133

for.end:                                          ; preds = %for.cond13
  %54 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2135
  %p38 = getelementptr inbounds %struct.Points, %struct.Points* %54, i32 0, i32 2, !dbg !2136
  %55 = load %struct.Point*, %struct.Point** %p38, align 8, !dbg !2136
  %56 = load i64, i64* %i, align 8, !dbg !2137
  %arrayidx39 = getelementptr inbounds %struct.Point, %struct.Point* %55, i64 %56, !dbg !2135
  %weight40 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx39, i32 0, i32 0, !dbg !2138
  %57 = load float, float* %weight40, align 8, !dbg !2138
  %58 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2139
  %p41 = getelementptr inbounds %struct.Points, %struct.Points* %58, i32 0, i32 2, !dbg !2140
  %59 = load %struct.Point*, %struct.Point** %p41, align 8, !dbg !2140
  %60 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2141
  %p42 = getelementptr inbounds %struct.Points, %struct.Points* %60, i32 0, i32 2, !dbg !2142
  %61 = load %struct.Point*, %struct.Point** %p42, align 8, !dbg !2142
  %62 = load i64, i64* %i, align 8, !dbg !2143
  %arrayidx43 = getelementptr inbounds %struct.Point, %struct.Point* %61, i64 %62, !dbg !2141
  %assign44 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx43, i32 0, i32 2, !dbg !2144
  %63 = load i64, i64* %assign44, align 8, !dbg !2144
  %arrayidx45 = getelementptr inbounds %struct.Point, %struct.Point* %59, i64 %63, !dbg !2139
  %weight46 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx45, i32 0, i32 0, !dbg !2145
  %64 = load float, float* %weight46, align 8, !dbg !2146
  %add47 = fadd float %64, %57, !dbg !2146
  store float %add47, float* %weight46, align 8, !dbg !2146
  br label %if.end, !dbg !2147

if.end:                                           ; preds = %for.end, %for.body
  br label %for.inc48, !dbg !2148

for.inc48:                                        ; preds = %if.end
  %65 = load i64, i64* %i, align 8, !dbg !2149
  %inc49 = add nsw i64 %65, 1, !dbg !2149
  store i64 %inc49, i64* %i, align 8, !dbg !2149
  br label %for.cond, !dbg !2151, !llvm.loop !2152

for.end50:                                        ; preds = %for.cond
  ret i32 0, !dbg !2154
}

; Function Attrs: nounwind uwtable
define void @_Z11copycentersP6PointsS0_Pll(%struct.Points* %points, %struct.Points* %centers, i64* %centerIDs, i64 %offset) #4 !dbg !2155 {
entry:
  %points.addr = alloca %struct.Points*, align 8
  %centers.addr = alloca %struct.Points*, align 8
  %centerIDs.addr = alloca i64*, align 8
  %offset.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %k = alloca i64, align 8
  %is_a_median = alloca i8*, align 8
  store %struct.Points* %points, %struct.Points** %points.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !2158, metadata !671), !dbg !2159
  store %struct.Points* %centers, %struct.Points** %centers.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %centers.addr, metadata !2160, metadata !671), !dbg !2161
  store i64* %centerIDs, i64** %centerIDs.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %centerIDs.addr, metadata !2162, metadata !671), !dbg !2163
  store i64 %offset, i64* %offset.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %offset.addr, metadata !2164, metadata !671), !dbg !2165
  call void @llvm.dbg.declare(metadata i64* %i, metadata !2166, metadata !671), !dbg !2167
  call void @llvm.dbg.declare(metadata i64* %k, metadata !2168, metadata !671), !dbg !2169
  call void @llvm.dbg.declare(metadata i8** %is_a_median, metadata !2170, metadata !671), !dbg !2171
  %0 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2172
  %num = getelementptr inbounds %struct.Points, %struct.Points* %0, i32 0, i32 0, !dbg !2173
  %1 = load i64, i64* %num, align 8, !dbg !2173
  %call = call noalias i8* @calloc(i64 %1, i64 1) #2, !dbg !2174
  store i8* %call, i8** %is_a_median, align 8, !dbg !2171
  store i64 0, i64* %i, align 8, !dbg !2175
  br label %for.cond, !dbg !2177

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !2178
  %3 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2181
  %num1 = getelementptr inbounds %struct.Points, %struct.Points* %3, i32 0, i32 0, !dbg !2182
  %4 = load i64, i64* %num1, align 8, !dbg !2182
  %cmp = icmp slt i64 %2, %4, !dbg !2183
  br i1 %cmp, label %for.body, label %for.end, !dbg !2184

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %is_a_median, align 8, !dbg !2185
  %6 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2187
  %p = getelementptr inbounds %struct.Points, %struct.Points* %6, i32 0, i32 2, !dbg !2188
  %7 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !2188
  %8 = load i64, i64* %i, align 8, !dbg !2189
  %arrayidx = getelementptr inbounds %struct.Point, %struct.Point* %7, i64 %8, !dbg !2187
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx, i32 0, i32 2, !dbg !2190
  %9 = load i64, i64* %assign, align 8, !dbg !2190
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i64 %9, !dbg !2185
  store i8 1, i8* %arrayidx2, align 1, !dbg !2191
  br label %for.inc, !dbg !2192

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !2193
  %inc = add nsw i64 %10, 1, !dbg !2193
  store i64 %inc, i64* %i, align 8, !dbg !2193
  br label %for.cond, !dbg !2195, !llvm.loop !2196

for.end:                                          ; preds = %for.cond
  %11 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2198
  %num3 = getelementptr inbounds %struct.Points, %struct.Points* %11, i32 0, i32 0, !dbg !2199
  %12 = load i64, i64* %num3, align 8, !dbg !2199
  store i64 %12, i64* %k, align 8, !dbg !2200
  store i64 0, i64* %i, align 8, !dbg !2201
  br label %for.cond4, !dbg !2203

for.cond4:                                        ; preds = %for.inc21, %for.end
  %13 = load i64, i64* %i, align 8, !dbg !2204
  %14 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2207
  %num5 = getelementptr inbounds %struct.Points, %struct.Points* %14, i32 0, i32 0, !dbg !2208
  %15 = load i64, i64* %num5, align 8, !dbg !2208
  %cmp6 = icmp slt i64 %13, %15, !dbg !2209
  br i1 %cmp6, label %for.body7, label %for.end23, !dbg !2210

for.body7:                                        ; preds = %for.cond4
  %16 = load i8*, i8** %is_a_median, align 8, !dbg !2211
  %17 = load i64, i64* %i, align 8, !dbg !2214
  %arrayidx8 = getelementptr inbounds i8, i8* %16, i64 %17, !dbg !2211
  %18 = load i8, i8* %arrayidx8, align 1, !dbg !2211
  %tobool = trunc i8 %18 to i1, !dbg !2211
  br i1 %tobool, label %if.then, label %if.end, !dbg !2215

if.then:                                          ; preds = %for.body7
  %19 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2216
  %p9 = getelementptr inbounds %struct.Points, %struct.Points* %19, i32 0, i32 2, !dbg !2218
  %20 = load %struct.Point*, %struct.Point** %p9, align 8, !dbg !2218
  %21 = load i64, i64* %k, align 8, !dbg !2219
  %arrayidx10 = getelementptr inbounds %struct.Point, %struct.Point* %20, i64 %21, !dbg !2216
  %coord = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx10, i32 0, i32 1, !dbg !2220
  %22 = load float*, float** %coord, align 8, !dbg !2220
  %23 = bitcast float* %22 to i8*, !dbg !2221
  %24 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2222
  %p11 = getelementptr inbounds %struct.Points, %struct.Points* %24, i32 0, i32 2, !dbg !2223
  %25 = load %struct.Point*, %struct.Point** %p11, align 8, !dbg !2223
  %26 = load i64, i64* %i, align 8, !dbg !2224
  %arrayidx12 = getelementptr inbounds %struct.Point, %struct.Point* %25, i64 %26, !dbg !2222
  %coord13 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx12, i32 0, i32 1, !dbg !2225
  %27 = load float*, float** %coord13, align 8, !dbg !2225
  %28 = bitcast float* %27 to i8*, !dbg !2221
  %29 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2226
  %dim = getelementptr inbounds %struct.Points, %struct.Points* %29, i32 0, i32 1, !dbg !2227
  %30 = load i32, i32* %dim, align 8, !dbg !2227
  %conv = sext i32 %30 to i64, !dbg !2226
  %mul = mul i64 %conv, 4, !dbg !2228
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %28, i64 %mul, i32 4, i1 false), !dbg !2221
  %31 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2229
  %p14 = getelementptr inbounds %struct.Points, %struct.Points* %31, i32 0, i32 2, !dbg !2230
  %32 = load %struct.Point*, %struct.Point** %p14, align 8, !dbg !2230
  %33 = load i64, i64* %i, align 8, !dbg !2231
  %arrayidx15 = getelementptr inbounds %struct.Point, %struct.Point* %32, i64 %33, !dbg !2229
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx15, i32 0, i32 0, !dbg !2232
  %34 = load float, float* %weight, align 8, !dbg !2232
  %35 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2233
  %p16 = getelementptr inbounds %struct.Points, %struct.Points* %35, i32 0, i32 2, !dbg !2234
  %36 = load %struct.Point*, %struct.Point** %p16, align 8, !dbg !2234
  %37 = load i64, i64* %k, align 8, !dbg !2235
  %arrayidx17 = getelementptr inbounds %struct.Point, %struct.Point* %36, i64 %37, !dbg !2233
  %weight18 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx17, i32 0, i32 0, !dbg !2236
  store float %34, float* %weight18, align 8, !dbg !2237
  %38 = load i64, i64* %i, align 8, !dbg !2238
  %39 = load i64, i64* %offset.addr, align 8, !dbg !2239
  %add = add nsw i64 %38, %39, !dbg !2240
  %40 = load i64*, i64** %centerIDs.addr, align 8, !dbg !2241
  %41 = load i64, i64* %k, align 8, !dbg !2242
  %arrayidx19 = getelementptr inbounds i64, i64* %40, i64 %41, !dbg !2241
  store i64 %add, i64* %arrayidx19, align 8, !dbg !2243
  %42 = load i64, i64* %k, align 8, !dbg !2244
  %inc20 = add nsw i64 %42, 1, !dbg !2244
  store i64 %inc20, i64* %k, align 8, !dbg !2244
  br label %if.end, !dbg !2245

if.end:                                           ; preds = %if.then, %for.body7
  br label %for.inc21, !dbg !2246

for.inc21:                                        ; preds = %if.end
  %43 = load i64, i64* %i, align 8, !dbg !2247
  %inc22 = add nsw i64 %43, 1, !dbg !2247
  store i64 %inc22, i64* %i, align 8, !dbg !2247
  br label %for.cond4, !dbg !2249, !llvm.loop !2250

for.end23:                                        ; preds = %for.cond4
  %44 = load i64, i64* %k, align 8, !dbg !2252
  %45 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2253
  %num24 = getelementptr inbounds %struct.Points, %struct.Points* %45, i32 0, i32 0, !dbg !2254
  store i64 %44, i64* %num24, align 8, !dbg !2255
  %46 = load i8*, i8** %is_a_median, align 8, !dbg !2256
  call void @free(i8* %46) #2, !dbg !2257
  ret void, !dbg !2258
}

; Function Attrs: uwtable
define i8* @_Z14localSearchSubPv(i8* %arg_) #0 !dbg !2259 {
entry:
  %arg_.addr = alloca i8*, align 8
  %arg = alloca %struct.pkmedian_arg_t*, align 8
  store i8* %arg_, i8** %arg_.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg_.addr, metadata !2262, metadata !671), !dbg !2263
  call void @llvm.dbg.declare(metadata %struct.pkmedian_arg_t** %arg, metadata !2264, metadata !671), !dbg !2265
  %0 = load i8*, i8** %arg_.addr, align 8, !dbg !2266
  %1 = bitcast i8* %0 to %struct.pkmedian_arg_t*, !dbg !2267
  store %struct.pkmedian_arg_t* %1, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2265
  %2 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2268
  %points = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %2, i32 0, i32 0, !dbg !2269
  %3 = load %struct.Points*, %struct.Points** %points, align 8, !dbg !2269
  %4 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2270
  %kmin = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %4, i32 0, i32 1, !dbg !2271
  %5 = load i64, i64* %kmin, align 8, !dbg !2271
  %6 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2272
  %kmax = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %6, i32 0, i32 2, !dbg !2273
  %7 = load i64, i64* %kmax, align 8, !dbg !2273
  %8 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2274
  %kfinal = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %8, i32 0, i32 3, !dbg !2275
  %9 = load i64*, i64** %kfinal, align 8, !dbg !2275
  %10 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2276
  %pid = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %10, i32 0, i32 4, !dbg !2277
  %11 = load i32, i32* %pid, align 8, !dbg !2277
  %12 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2278
  %barrier = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %12, i32 0, i32 5, !dbg !2279
  %13 = load %union.pthread_barrier_t*, %union.pthread_barrier_t** %barrier, align 8, !dbg !2279
  %call = call float @_Z8pkmedianP6PointsllPliP17pthread_barrier_t(%struct.Points* %3, i64 %5, i64 %7, i64* %9, i32 %11, %union.pthread_barrier_t* %13), !dbg !2280
  ret i8* null, !dbg !2281
}

; Function Attrs: uwtable
define void @_Z11localSearchP6PointsllPl(%struct.Points* %points, i64 %kmin, i64 %kmax, i64* %kfinal) #0 !dbg !2282 {
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
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !2285, metadata !671), !dbg !2286
  store i64 %kmin, i64* %kmin.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %kmin.addr, metadata !2287, metadata !671), !dbg !2288
  store i64 %kmax, i64* %kmax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %kmax.addr, metadata !2289, metadata !671), !dbg !2290
  store i64* %kfinal, i64** %kfinal.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %kfinal.addr, metadata !2291, metadata !671), !dbg !2292
  call void @llvm.dbg.declare(metadata double* %t1, metadata !2293, metadata !671), !dbg !2294
  %call = call double @_Z7gettimev(), !dbg !2295
  store double %call, double* %t1, align 8, !dbg !2294
  call void @llvm.dbg.declare(metadata %union.pthread_barrier_t* %barrier, metadata !2296, metadata !671), !dbg !2297
  call void @llvm.dbg.declare(metadata i64** %threads, metadata !2298, metadata !671), !dbg !2301
  %0 = load i32, i32* @_ZL5nproc, align 4, !dbg !2302
  %1 = sext i32 %0 to i64, !dbg !2303
  %2 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %1, i64 8), !dbg !2303
  %3 = extractvalue { i64, i1 } %2, 1, !dbg !2303
  %4 = extractvalue { i64, i1 } %2, 0, !dbg !2303
  %5 = select i1 %3, i64 -1, i64 %4, !dbg !2303
  %call1 = call i8* @_Znam(i64 %5) #14, !dbg !2303
  %6 = bitcast i8* %call1 to i64*, !dbg !2303
  store i64* %6, i64** %threads, align 8, !dbg !2301
  call void @llvm.dbg.declare(metadata %struct.pkmedian_arg_t** %arg, metadata !2304, metadata !671), !dbg !2305
  %7 = load i32, i32* @_ZL5nproc, align 4, !dbg !2306
  %8 = sext i32 %7 to i64, !dbg !2307
  %9 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %8, i64 48), !dbg !2307
  %10 = extractvalue { i64, i1 } %9, 1, !dbg !2307
  %11 = extractvalue { i64, i1 } %9, 0, !dbg !2307
  %12 = select i1 %10, i64 -1, i64 %11, !dbg !2307
  %call2 = call i8* @_Znam(i64 %12) #14, !dbg !2307
  %13 = bitcast i8* %call2 to %struct.pkmedian_arg_t*, !dbg !2307
  store %struct.pkmedian_arg_t* %13, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2305
  call void @llvm.dbg.declare(metadata i32* %i, metadata !2308, metadata !671), !dbg !2310
  store i32 0, i32* %i, align 4, !dbg !2310
  br label %for.cond, !dbg !2311

for.cond:                                         ; preds = %for.inc, %entry
  %14 = load i32, i32* %i, align 4, !dbg !2312
  %15 = load i32, i32* @_ZL5nproc, align 4, !dbg !2315
  %cmp = icmp slt i32 %14, %15, !dbg !2316
  br i1 %cmp, label %for.body, label %for.end, !dbg !2317

for.body:                                         ; preds = %for.cond
  %16 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2318
  %17 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2320
  %18 = load i32, i32* %i, align 4, !dbg !2321
  %idxprom = sext i32 %18 to i64, !dbg !2320
  %arrayidx = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %17, i64 %idxprom, !dbg !2320
  %points3 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %arrayidx, i32 0, i32 0, !dbg !2322
  store %struct.Points* %16, %struct.Points** %points3, align 8, !dbg !2323
  %19 = load i64, i64* %kmin.addr, align 8, !dbg !2324
  %20 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2325
  %21 = load i32, i32* %i, align 4, !dbg !2326
  %idxprom4 = sext i32 %21 to i64, !dbg !2325
  %arrayidx5 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %20, i64 %idxprom4, !dbg !2325
  %kmin6 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %arrayidx5, i32 0, i32 1, !dbg !2327
  store i64 %19, i64* %kmin6, align 8, !dbg !2328
  %22 = load i64, i64* %kmax.addr, align 8, !dbg !2329
  %23 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2330
  %24 = load i32, i32* %i, align 4, !dbg !2331
  %idxprom7 = sext i32 %24 to i64, !dbg !2330
  %arrayidx8 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %23, i64 %idxprom7, !dbg !2330
  %kmax9 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %arrayidx8, i32 0, i32 2, !dbg !2332
  store i64 %22, i64* %kmax9, align 8, !dbg !2333
  %25 = load i32, i32* %i, align 4, !dbg !2334
  %26 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2335
  %27 = load i32, i32* %i, align 4, !dbg !2336
  %idxprom10 = sext i32 %27 to i64, !dbg !2335
  %arrayidx11 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %26, i64 %idxprom10, !dbg !2335
  %pid = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %arrayidx11, i32 0, i32 4, !dbg !2337
  store i32 %25, i32* %pid, align 8, !dbg !2338
  %28 = load i64*, i64** %kfinal.addr, align 8, !dbg !2339
  %29 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2340
  %30 = load i32, i32* %i, align 4, !dbg !2341
  %idxprom12 = sext i32 %30 to i64, !dbg !2340
  %arrayidx13 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %29, i64 %idxprom12, !dbg !2340
  %kfinal14 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %arrayidx13, i32 0, i32 3, !dbg !2342
  store i64* %28, i64** %kfinal14, align 8, !dbg !2343
  %31 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2344
  %32 = load i32, i32* %i, align 4, !dbg !2345
  %idxprom15 = sext i32 %32 to i64, !dbg !2344
  %arrayidx16 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %31, i64 %idxprom15, !dbg !2344
  %barrier17 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %arrayidx16, i32 0, i32 5, !dbg !2346
  store %union.pthread_barrier_t* %barrier, %union.pthread_barrier_t** %barrier17, align 8, !dbg !2347
  %33 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2348
  %arrayidx18 = getelementptr inbounds %struct.pkmedian_arg_t, %struct.pkmedian_arg_t* %33, i64 0, !dbg !2348
  %34 = bitcast %struct.pkmedian_arg_t* %arrayidx18 to i8*, !dbg !2349
  %call19 = call i8* @_Z14localSearchSubPv(i8* %34), !dbg !2350
  br label %for.inc, !dbg !2351

for.inc:                                          ; preds = %for.body
  %35 = load i32, i32* %i, align 4, !dbg !2352
  %inc = add nsw i32 %35, 1, !dbg !2352
  store i32 %inc, i32* %i, align 4, !dbg !2352
  br label %for.cond, !dbg !2354, !llvm.loop !2355

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i20, metadata !2357, metadata !671), !dbg !2359
  store i32 0, i32* %i20, align 4, !dbg !2359
  br label %for.cond21, !dbg !2360

for.cond21:                                       ; preds = %for.inc24, %for.end
  %36 = load i32, i32* %i20, align 4, !dbg !2361
  %37 = load i32, i32* @_ZL5nproc, align 4, !dbg !2364
  %cmp22 = icmp slt i32 %36, %37, !dbg !2365
  br i1 %cmp22, label %for.body23, label %for.end26, !dbg !2366

for.body23:                                       ; preds = %for.cond21
  br label %for.inc24, !dbg !2367

for.inc24:                                        ; preds = %for.body23
  %38 = load i32, i32* %i20, align 4, !dbg !2369
  %inc25 = add nsw i32 %38, 1, !dbg !2369
  store i32 %inc25, i32* %i20, align 4, !dbg !2369
  br label %for.cond21, !dbg !2371, !llvm.loop !2372

for.end26:                                        ; preds = %for.cond21
  %39 = load i64*, i64** %threads, align 8, !dbg !2374
  %isnull = icmp eq i64* %39, null, !dbg !2375
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !2375

delete.notnull:                                   ; preds = %for.end26
  %40 = bitcast i64* %39 to i8*, !dbg !2376
  call void @_ZdaPv(i8* %40) #15, !dbg !2376
  br label %delete.end, !dbg !2376

delete.end:                                       ; preds = %delete.notnull, %for.end26
  %41 = load %struct.pkmedian_arg_t*, %struct.pkmedian_arg_t** %arg, align 8, !dbg !2378
  %isnull27 = icmp eq %struct.pkmedian_arg_t* %41, null, !dbg !2379
  br i1 %isnull27, label %delete.end29, label %delete.notnull28, !dbg !2379

delete.notnull28:                                 ; preds = %delete.end
  %42 = bitcast %struct.pkmedian_arg_t* %41 to i8*, !dbg !2380
  call void @_ZdaPv(i8* %42) #15, !dbg !2380
  br label %delete.end29, !dbg !2380

delete.end29:                                     ; preds = %delete.notnull28, %delete.end
  call void @llvm.dbg.declare(metadata double* %t2, metadata !2381, metadata !671), !dbg !2382
  %call30 = call double @_Z7gettimev(), !dbg !2383
  store double %call30, double* %t2, align 8, !dbg !2382
  %43 = load double, double* %t2, align 8, !dbg !2384
  %44 = load double, double* %t1, align 8, !dbg !2385
  %sub = fsub double %43, %44, !dbg !2386
  %45 = load double, double* @time_local_search, align 8, !dbg !2387
  %add = fadd double %45, %sub, !dbg !2387
  store double %add, double* @time_local_search, align 8, !dbg !2387
  ret void, !dbg !2388
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #3

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #7

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #8

; Function Attrs: uwtable
define void @_Z12outcenterIDsP6PointsPlPc(%struct.Points* %centers, i64* %centerIDs, i8* %outfile) #0 !dbg !2389 {
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
  call void @llvm.dbg.declare(metadata %struct.Points** %centers.addr, metadata !2392, metadata !671), !dbg !2393
  store i64* %centerIDs, i64** %centerIDs.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %centerIDs.addr, metadata !2394, metadata !671), !dbg !2395
  store i8* %outfile, i8** %outfile.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %outfile.addr, metadata !2396, metadata !671), !dbg !2397
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !2398, metadata !671), !dbg !2399
  %0 = load i8*, i8** %outfile.addr, align 8, !dbg !2400
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)), !dbg !2401
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !2399
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !2402
  %cmp = icmp eq %struct._IO_FILE* %1, null, !dbg !2404
  br i1 %cmp, label %if.then, label %if.end, !dbg !2405

if.then:                                          ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2406
  %3 = load i8*, i8** %outfile.addr, align 8, !dbg !2408
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i32 0, i32 0), i8* %3), !dbg !2409
  call void @exit(i32 1) #16, !dbg !2410
  unreachable, !dbg !2410

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %is_a_median, metadata !2411, metadata !671), !dbg !2412
  %4 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2413
  %num = getelementptr inbounds %struct.Points, %struct.Points* %4, i32 0, i32 0, !dbg !2414
  %5 = load i64, i64* %num, align 8, !dbg !2414
  %call2 = call noalias i8* @calloc(i64 4, i64 %5) #2, !dbg !2415
  %6 = bitcast i8* %call2 to i32*, !dbg !2416
  store i32* %6, i32** %is_a_median, align 8, !dbg !2412
  call void @llvm.dbg.declare(metadata i32* %i, metadata !2417, metadata !671), !dbg !2419
  store i32 0, i32* %i, align 4, !dbg !2419
  br label %for.cond, !dbg !2420

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i32, i32* %i, align 4, !dbg !2421
  %conv = sext i32 %7 to i64, !dbg !2421
  %8 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2424
  %num3 = getelementptr inbounds %struct.Points, %struct.Points* %8, i32 0, i32 0, !dbg !2425
  %9 = load i64, i64* %num3, align 8, !dbg !2425
  %cmp4 = icmp slt i64 %conv, %9, !dbg !2426
  br i1 %cmp4, label %for.body, label %for.end, !dbg !2427

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %is_a_median, align 8, !dbg !2428
  %11 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2430
  %p = getelementptr inbounds %struct.Points, %struct.Points* %11, i32 0, i32 2, !dbg !2431
  %12 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !2431
  %13 = load i32, i32* %i, align 4, !dbg !2432
  %idxprom = sext i32 %13 to i64, !dbg !2430
  %arrayidx = getelementptr inbounds %struct.Point, %struct.Point* %12, i64 %idxprom, !dbg !2430
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx, i32 0, i32 2, !dbg !2433
  %14 = load i64, i64* %assign, align 8, !dbg !2433
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 %14, !dbg !2428
  store i32 1, i32* %arrayidx5, align 4, !dbg !2434
  br label %for.inc, !dbg !2435

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !2436
  %inc = add nsw i32 %15, 1, !dbg !2436
  store i32 %inc, i32* %i, align 4, !dbg !2436
  br label %for.cond, !dbg !2438, !llvm.loop !2439

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i6, metadata !2441, metadata !671), !dbg !2443
  store i32 0, i32* %i6, align 4, !dbg !2443
  br label %for.cond7, !dbg !2444

for.cond7:                                        ; preds = %for.inc38, %for.end
  %16 = load i32, i32* %i6, align 4, !dbg !2445
  %conv8 = sext i32 %16 to i64, !dbg !2445
  %17 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2448
  %num9 = getelementptr inbounds %struct.Points, %struct.Points* %17, i32 0, i32 0, !dbg !2449
  %18 = load i64, i64* %num9, align 8, !dbg !2449
  %cmp10 = icmp slt i64 %conv8, %18, !dbg !2450
  br i1 %cmp10, label %for.body11, label %for.end40, !dbg !2451

for.body11:                                       ; preds = %for.cond7
  %19 = load i32*, i32** %is_a_median, align 8, !dbg !2452
  %20 = load i32, i32* %i6, align 4, !dbg !2455
  %idxprom12 = sext i32 %20 to i64, !dbg !2452
  %arrayidx13 = getelementptr inbounds i32, i32* %19, i64 %idxprom12, !dbg !2452
  %21 = load i32, i32* %arrayidx13, align 4, !dbg !2452
  %tobool = icmp ne i32 %21, 0, !dbg !2452
  br i1 %tobool, label %if.then14, label %if.end37, !dbg !2456

if.then14:                                        ; preds = %for.body11
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !2457
  %23 = load i64*, i64** %centerIDs.addr, align 8, !dbg !2459
  %24 = load i32, i32* %i6, align 4, !dbg !2460
  %idxprom15 = sext i32 %24 to i64, !dbg !2459
  %arrayidx16 = getelementptr inbounds i64, i64* %23, i64 %idxprom15, !dbg !2459
  %25 = load i64, i64* %arrayidx16, align 8, !dbg !2459
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i64 %25), !dbg !2461
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !2462
  %27 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2463
  %p18 = getelementptr inbounds %struct.Points, %struct.Points* %27, i32 0, i32 2, !dbg !2464
  %28 = load %struct.Point*, %struct.Point** %p18, align 8, !dbg !2464
  %29 = load i32, i32* %i6, align 4, !dbg !2465
  %idxprom19 = sext i32 %29 to i64, !dbg !2463
  %arrayidx20 = getelementptr inbounds %struct.Point, %struct.Point* %28, i64 %idxprom19, !dbg !2463
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx20, i32 0, i32 0, !dbg !2466
  %30 = load float, float* %weight, align 8, !dbg !2466
  %conv21 = fpext float %30 to double, !dbg !2463
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), double %conv21), !dbg !2467
  call void @llvm.dbg.declare(metadata i32* %k, metadata !2468, metadata !671), !dbg !2470
  store i32 0, i32* %k, align 4, !dbg !2470
  br label %for.cond23, !dbg !2471

for.cond23:                                       ; preds = %for.inc33, %if.then14
  %31 = load i32, i32* %k, align 4, !dbg !2472
  %32 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2475
  %dim = getelementptr inbounds %struct.Points, %struct.Points* %32, i32 0, i32 1, !dbg !2476
  %33 = load i32, i32* %dim, align 8, !dbg !2476
  %cmp24 = icmp slt i32 %31, %33, !dbg !2477
  br i1 %cmp24, label %for.body25, label %for.end35, !dbg !2478

for.body25:                                       ; preds = %for.cond23
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !2479
  %35 = load %struct.Points*, %struct.Points** %centers.addr, align 8, !dbg !2481
  %p26 = getelementptr inbounds %struct.Points, %struct.Points* %35, i32 0, i32 2, !dbg !2482
  %36 = load %struct.Point*, %struct.Point** %p26, align 8, !dbg !2482
  %37 = load i32, i32* %i6, align 4, !dbg !2483
  %idxprom27 = sext i32 %37 to i64, !dbg !2481
  %arrayidx28 = getelementptr inbounds %struct.Point, %struct.Point* %36, i64 %idxprom27, !dbg !2481
  %coord = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx28, i32 0, i32 1, !dbg !2484
  %38 = load float*, float** %coord, align 8, !dbg !2484
  %39 = load i32, i32* %k, align 4, !dbg !2485
  %idxprom29 = sext i32 %39 to i64, !dbg !2481
  %arrayidx30 = getelementptr inbounds float, float* %38, i64 %idxprom29, !dbg !2481
  %40 = load float, float* %arrayidx30, align 4, !dbg !2481
  %conv31 = fpext float %40 to double, !dbg !2481
  %call32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), double %conv31), !dbg !2486
  br label %for.inc33, !dbg !2487

for.inc33:                                        ; preds = %for.body25
  %41 = load i32, i32* %k, align 4, !dbg !2488
  %inc34 = add nsw i32 %41, 1, !dbg !2488
  store i32 %inc34, i32* %k, align 4, !dbg !2488
  br label %for.cond23, !dbg !2490, !llvm.loop !2491

for.end35:                                        ; preds = %for.cond23
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !2493
  %call36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0)), !dbg !2494
  br label %if.end37, !dbg !2495

if.end37:                                         ; preds = %for.end35, %for.body11
  br label %for.inc38, !dbg !2496

for.inc38:                                        ; preds = %if.end37
  %43 = load i32, i32* %i6, align 4, !dbg !2497
  %inc39 = add nsw i32 %43, 1, !dbg !2497
  store i32 %inc39, i32* %i6, align 4, !dbg !2497
  br label %for.cond7, !dbg !2499, !llvm.loop !2500

for.end40:                                        ; preds = %for.cond7
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !2502
  %call41 = call i32 @fclose(%struct._IO_FILE* %44), !dbg !2503
  ret void, !dbg !2504
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #9

; Function Attrs: uwtable
define void @_Z13streamClusterP7PStreamllillPc(%class.PStream* %stream, i64 %kmin, i64 %kmax, i32 %dim, i64 %chunksize, i64 %centersize, i8* %outfile) #0 !dbg !2505 {
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
  call void @llvm.dbg.declare(metadata %class.PStream** %stream.addr, metadata !2525, metadata !671), !dbg !2526
  store i64 %kmin, i64* %kmin.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %kmin.addr, metadata !2527, metadata !671), !dbg !2528
  store i64 %kmax, i64* %kmax.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %kmax.addr, metadata !2529, metadata !671), !dbg !2530
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !2531, metadata !671), !dbg !2532
  store i64 %chunksize, i64* %chunksize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %chunksize.addr, metadata !2533, metadata !671), !dbg !2534
  store i64 %centersize, i64* %centersize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %centersize.addr, metadata !2535, metadata !671), !dbg !2536
  store i8* %outfile, i8** %outfile.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %outfile.addr, metadata !2537, metadata !671), !dbg !2538
  call void @llvm.dbg.declare(metadata float** %block, metadata !2539, metadata !671), !dbg !2540
  %0 = load i64, i64* %chunksize.addr, align 8, !dbg !2541
  %1 = load i32, i32* %dim.addr, align 4, !dbg !2542
  %conv = sext i32 %1 to i64, !dbg !2542
  %mul = mul nsw i64 %0, %conv, !dbg !2543
  %mul1 = mul i64 %mul, 4, !dbg !2544
  %call = call noalias i8* @malloc(i64 %mul1) #2, !dbg !2545
  %2 = bitcast i8* %call to float*, !dbg !2546
  store float* %2, float** %block, align 8, !dbg !2540
  call void @llvm.dbg.declare(metadata float** %centerBlock, metadata !2547, metadata !671), !dbg !2548
  %3 = load i64, i64* %centersize.addr, align 8, !dbg !2549
  %4 = load i32, i32* %dim.addr, align 4, !dbg !2550
  %conv2 = sext i32 %4 to i64, !dbg !2550
  %mul3 = mul nsw i64 %3, %conv2, !dbg !2551
  %mul4 = mul i64 %mul3, 4, !dbg !2552
  %call5 = call noalias i8* @malloc(i64 %mul4) #2, !dbg !2553
  %5 = bitcast i8* %call5 to float*, !dbg !2554
  store float* %5, float** %centerBlock, align 8, !dbg !2548
  call void @llvm.dbg.declare(metadata i64** %centerIDs, metadata !2555, metadata !671), !dbg !2556
  %6 = load i64, i64* %centersize.addr, align 8, !dbg !2557
  %7 = load i32, i32* %dim.addr, align 4, !dbg !2558
  %conv6 = sext i32 %7 to i64, !dbg !2558
  %mul7 = mul nsw i64 %6, %conv6, !dbg !2559
  %mul8 = mul i64 %mul7, 8, !dbg !2560
  %call9 = call noalias i8* @malloc(i64 %mul8) #2, !dbg !2561
  %8 = bitcast i8* %call9 to i64*, !dbg !2562
  store i64* %8, i64** %centerIDs, align 8, !dbg !2556
  %9 = load float*, float** %block, align 8, !dbg !2563
  %cmp = icmp eq float* %9, null, !dbg !2565
  br i1 %cmp, label %if.then, label %if.end, !dbg !2566

if.then:                                          ; preds = %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2567
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.7, i32 0, i32 0)), !dbg !2569
  call void @exit(i32 1) #16, !dbg !2570
  unreachable, !dbg !2570

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.Points* %points, metadata !2571, metadata !671), !dbg !2572
  %11 = load i32, i32* %dim.addr, align 4, !dbg !2573
  %dim11 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 1, !dbg !2574
  store i32 %11, i32* %dim11, align 8, !dbg !2575
  %12 = load i64, i64* %chunksize.addr, align 8, !dbg !2576
  %num = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 0, !dbg !2577
  store i64 %12, i64* %num, align 8, !dbg !2578
  %13 = load i64, i64* %chunksize.addr, align 8, !dbg !2579
  %mul12 = mul i64 %13, 32, !dbg !2580
  %call13 = call noalias i8* @malloc(i64 %mul12) #2, !dbg !2581
  %14 = bitcast i8* %call13 to %struct.Point*, !dbg !2582
  %p = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 2, !dbg !2583
  store %struct.Point* %14, %struct.Point** %p, align 8, !dbg !2584
  call void @llvm.dbg.declare(metadata i32* %i, metadata !2585, metadata !671), !dbg !2587
  store i32 0, i32* %i, align 4, !dbg !2587
  br label %for.cond, !dbg !2588

for.cond:                                         ; preds = %for.inc, %if.end
  %15 = load i32, i32* %i, align 4, !dbg !2589
  %conv14 = sext i32 %15 to i64, !dbg !2589
  %16 = load i64, i64* %chunksize.addr, align 8, !dbg !2592
  %cmp15 = icmp slt i64 %conv14, %16, !dbg !2593
  br i1 %cmp15, label %for.body, label %for.end, !dbg !2594

for.body:                                         ; preds = %for.cond
  %17 = load float*, float** %block, align 8, !dbg !2595
  %18 = load i32, i32* %i, align 4, !dbg !2597
  %19 = load i32, i32* %dim.addr, align 4, !dbg !2598
  %mul16 = mul nsw i32 %18, %19, !dbg !2599
  %idxprom = sext i32 %mul16 to i64, !dbg !2595
  %arrayidx = getelementptr inbounds float, float* %17, i64 %idxprom, !dbg !2595
  %p17 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 2, !dbg !2600
  %20 = load %struct.Point*, %struct.Point** %p17, align 8, !dbg !2600
  %21 = load i32, i32* %i, align 4, !dbg !2601
  %idxprom18 = sext i32 %21 to i64, !dbg !2602
  %arrayidx19 = getelementptr inbounds %struct.Point, %struct.Point* %20, i64 %idxprom18, !dbg !2602
  %coord = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx19, i32 0, i32 1, !dbg !2603
  store float* %arrayidx, float** %coord, align 8, !dbg !2604
  br label %for.inc, !dbg !2605

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !2606
  %inc = add nsw i32 %22, 1, !dbg !2606
  store i32 %inc, i32* %i, align 4, !dbg !2606
  br label %for.cond, !dbg !2608, !llvm.loop !2609

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.Points* %centers, metadata !2611, metadata !671), !dbg !2612
  %23 = load i32, i32* %dim.addr, align 4, !dbg !2613
  %dim20 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 1, !dbg !2614
  store i32 %23, i32* %dim20, align 8, !dbg !2615
  %24 = load i64, i64* %centersize.addr, align 8, !dbg !2616
  %mul21 = mul i64 %24, 32, !dbg !2617
  %call22 = call noalias i8* @malloc(i64 %mul21) #2, !dbg !2618
  %25 = bitcast i8* %call22 to %struct.Point*, !dbg !2619
  %p23 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 2, !dbg !2620
  store %struct.Point* %25, %struct.Point** %p23, align 8, !dbg !2621
  %num24 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 0, !dbg !2622
  store i64 0, i64* %num24, align 8, !dbg !2623
  call void @llvm.dbg.declare(metadata i32* %i25, metadata !2624, metadata !671), !dbg !2626
  store i32 0, i32* %i25, align 4, !dbg !2626
  br label %for.cond26, !dbg !2627

for.cond26:                                       ; preds = %for.inc40, %for.end
  %26 = load i32, i32* %i25, align 4, !dbg !2628
  %conv27 = sext i32 %26 to i64, !dbg !2628
  %27 = load i64, i64* %centersize.addr, align 8, !dbg !2631
  %cmp28 = icmp slt i64 %conv27, %27, !dbg !2632
  br i1 %cmp28, label %for.body29, label %for.end42, !dbg !2633

for.body29:                                       ; preds = %for.cond26
  %28 = load float*, float** %centerBlock, align 8, !dbg !2634
  %29 = load i32, i32* %i25, align 4, !dbg !2636
  %30 = load i32, i32* %dim.addr, align 4, !dbg !2637
  %mul30 = mul nsw i32 %29, %30, !dbg !2638
  %idxprom31 = sext i32 %mul30 to i64, !dbg !2634
  %arrayidx32 = getelementptr inbounds float, float* %28, i64 %idxprom31, !dbg !2634
  %p33 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 2, !dbg !2639
  %31 = load %struct.Point*, %struct.Point** %p33, align 8, !dbg !2639
  %32 = load i32, i32* %i25, align 4, !dbg !2640
  %idxprom34 = sext i32 %32 to i64, !dbg !2641
  %arrayidx35 = getelementptr inbounds %struct.Point, %struct.Point* %31, i64 %idxprom34, !dbg !2641
  %coord36 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx35, i32 0, i32 1, !dbg !2642
  store float* %arrayidx32, float** %coord36, align 8, !dbg !2643
  %p37 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 2, !dbg !2644
  %33 = load %struct.Point*, %struct.Point** %p37, align 8, !dbg !2644
  %34 = load i32, i32* %i25, align 4, !dbg !2645
  %idxprom38 = sext i32 %34 to i64, !dbg !2646
  %arrayidx39 = getelementptr inbounds %struct.Point, %struct.Point* %33, i64 %idxprom38, !dbg !2646
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx39, i32 0, i32 0, !dbg !2647
  store float 1.000000e+00, float* %weight, align 8, !dbg !2648
  br label %for.inc40, !dbg !2649

for.inc40:                                        ; preds = %for.body29
  %35 = load i32, i32* %i25, align 4, !dbg !2650
  %inc41 = add nsw i32 %35, 1, !dbg !2650
  store i32 %inc41, i32* %i25, align 4, !dbg !2650
  br label %for.cond26, !dbg !2652, !llvm.loop !2653

for.end42:                                        ; preds = %for.cond26
  call void @llvm.dbg.declare(metadata i64* %IDoffset, metadata !2655, metadata !671), !dbg !2656
  store i64 0, i64* %IDoffset, align 8, !dbg !2656
  call void @llvm.dbg.declare(metadata i64* %kfinal, metadata !2657, metadata !671), !dbg !2658
  br label %while.body, !dbg !2659

while.body:                                       ; preds = %for.end42, %if.end94
  call void @llvm.dbg.declare(metadata i64* %numRead, metadata !2660, metadata !671), !dbg !2662
  %36 = load %class.PStream*, %class.PStream** %stream.addr, align 8, !dbg !2663
  %37 = bitcast %class.PStream* %36 to i64 (%class.PStream*, float*, i32, i32)***, !dbg !2664
  %vtable = load i64 (%class.PStream*, float*, i32, i32)**, i64 (%class.PStream*, float*, i32, i32)*** %37, align 8, !dbg !2664
  %vfn = getelementptr inbounds i64 (%class.PStream*, float*, i32, i32)*, i64 (%class.PStream*, float*, i32, i32)** %vtable, i64 0, !dbg !2664
  %38 = load i64 (%class.PStream*, float*, i32, i32)*, i64 (%class.PStream*, float*, i32, i32)** %vfn, align 8, !dbg !2664
  %39 = load float*, float** %block, align 8, !dbg !2665
  %40 = load i32, i32* %dim.addr, align 4, !dbg !2666
  %41 = load i64, i64* %chunksize.addr, align 8, !dbg !2667
  %conv43 = trunc i64 %41 to i32, !dbg !2667
  %call44 = call i64 %38(%class.PStream* %36, float* %39, i32 %40, i32 %conv43), !dbg !2664
  store i64 %call44, i64* %numRead, align 8, !dbg !2662
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2668
  %43 = load i64, i64* %numRead, align 8, !dbg !2669
  %call45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i32 0, i32 0), i64 %43), !dbg !2670
  %44 = load %class.PStream*, %class.PStream** %stream.addr, align 8, !dbg !2671
  %45 = bitcast %class.PStream* %44 to i32 (%class.PStream*)***, !dbg !2673
  %vtable46 = load i32 (%class.PStream*)**, i32 (%class.PStream*)*** %45, align 8, !dbg !2673
  %vfn47 = getelementptr inbounds i32 (%class.PStream*)*, i32 (%class.PStream*)** %vtable46, i64 1, !dbg !2673
  %46 = load i32 (%class.PStream*)*, i32 (%class.PStream*)** %vfn47, align 8, !dbg !2673
  %call48 = call i32 %46(%class.PStream* %44), !dbg !2673
  %tobool = icmp ne i32 %call48, 0, !dbg !2671
  br i1 %tobool, label %if.then56, label %lor.lhs.false, !dbg !2674

lor.lhs.false:                                    ; preds = %while.body
  %47 = load i64, i64* %numRead, align 8, !dbg !2675
  %48 = load i64, i64* %chunksize.addr, align 8, !dbg !2677
  %conv49 = trunc i64 %48 to i32, !dbg !2677
  %conv50 = zext i32 %conv49 to i64, !dbg !2678
  %cmp51 = icmp ult i64 %47, %conv50, !dbg !2679
  br i1 %cmp51, label %land.lhs.true, label %if.end58, !dbg !2680

land.lhs.true:                                    ; preds = %lor.lhs.false
  %49 = load %class.PStream*, %class.PStream** %stream.addr, align 8, !dbg !2681
  %50 = bitcast %class.PStream* %49 to i32 (%class.PStream*)***, !dbg !2683
  %vtable52 = load i32 (%class.PStream*)**, i32 (%class.PStream*)*** %50, align 8, !dbg !2683
  %vfn53 = getelementptr inbounds i32 (%class.PStream*)*, i32 (%class.PStream*)** %vtable52, i64 2, !dbg !2683
  %51 = load i32 (%class.PStream*)*, i32 (%class.PStream*)** %vfn53, align 8, !dbg !2683
  %call54 = call i32 %51(%class.PStream* %49), !dbg !2683
  %tobool55 = icmp ne i32 %call54, 0, !dbg !2681
  br i1 %tobool55, label %if.end58, label %if.then56, !dbg !2684

if.then56:                                        ; preds = %land.lhs.true, %while.body
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2685
  %call57 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.9, i32 0, i32 0)), !dbg !2687
  call void @exit(i32 1) #16, !dbg !2688
  unreachable, !dbg !2688

if.end58:                                         ; preds = %land.lhs.true, %lor.lhs.false
  %53 = load i64, i64* %numRead, align 8, !dbg !2689
  %num59 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 0, !dbg !2690
  store i64 %53, i64* %num59, align 8, !dbg !2691
  call void @llvm.dbg.declare(metadata i32* %i60, metadata !2692, metadata !671), !dbg !2694
  store i32 0, i32* %i60, align 4, !dbg !2694
  br label %for.cond61, !dbg !2695

for.cond61:                                       ; preds = %for.inc70, %if.end58
  %54 = load i32, i32* %i60, align 4, !dbg !2696
  %conv62 = sext i32 %54 to i64, !dbg !2696
  %num63 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 0, !dbg !2699
  %55 = load i64, i64* %num63, align 8, !dbg !2699
  %cmp64 = icmp slt i64 %conv62, %55, !dbg !2700
  br i1 %cmp64, label %for.body65, label %for.end72, !dbg !2701

for.body65:                                       ; preds = %for.cond61
  %p66 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 2, !dbg !2702
  %56 = load %struct.Point*, %struct.Point** %p66, align 8, !dbg !2702
  %57 = load i32, i32* %i60, align 4, !dbg !2704
  %idxprom67 = sext i32 %57 to i64, !dbg !2705
  %arrayidx68 = getelementptr inbounds %struct.Point, %struct.Point* %56, i64 %idxprom67, !dbg !2705
  %weight69 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx68, i32 0, i32 0, !dbg !2706
  store float 1.000000e+00, float* %weight69, align 8, !dbg !2707
  br label %for.inc70, !dbg !2708

for.inc70:                                        ; preds = %for.body65
  %58 = load i32, i32* %i60, align 4, !dbg !2709
  %inc71 = add nsw i32 %58, 1, !dbg !2709
  store i32 %inc71, i32* %i60, align 4, !dbg !2709
  br label %for.cond61, !dbg !2711, !llvm.loop !2712

for.end72:                                        ; preds = %for.cond61
  %num73 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 0, !dbg !2714
  %59 = load i64, i64* %num73, align 8, !dbg !2714
  %mul74 = mul i64 %59, 1, !dbg !2715
  %call75 = call noalias i8* @malloc(i64 %mul74) #2, !dbg !2716
  store i8* %call75, i8** @_ZL17switch_membership, align 8, !dbg !2717
  %num76 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 0, !dbg !2718
  %60 = load i64, i64* %num76, align 8, !dbg !2718
  %call77 = call noalias i8* @calloc(i64 %60, i64 1) #2, !dbg !2719
  store i8* %call77, i8** @_ZL9is_center, align 8, !dbg !2720
  %num78 = getelementptr inbounds %struct.Points, %struct.Points* %points, i32 0, i32 0, !dbg !2721
  %61 = load i64, i64* %num78, align 8, !dbg !2721
  %mul79 = mul i64 %61, 4, !dbg !2722
  %call80 = call noalias i8* @malloc(i64 %mul79) #2, !dbg !2723
  %62 = bitcast i8* %call80 to i32*, !dbg !2724
  store i32* %62, i32** @_ZL12center_table, align 8, !dbg !2725
  %63 = load i64, i64* %kmin.addr, align 8, !dbg !2726
  %64 = load i64, i64* %kmax.addr, align 8, !dbg !2727
  call void @_Z11localSearchP6PointsllPl(%struct.Points* %points, i64 %63, i64 %64, i64* %kfinal), !dbg !2728
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2729
  %call81 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %65, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i32 0, i32 0)), !dbg !2730
  %call82 = call i32 @_Z11contcentersP6Points(%struct.Points* %points), !dbg !2731
  store i8 1, i8* @isCoordChanged, align 1, !dbg !2732
  %66 = load i64, i64* %kfinal, align 8, !dbg !2733
  %num83 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 0, !dbg !2735
  %67 = load i64, i64* %num83, align 8, !dbg !2735
  %add = add nsw i64 %66, %67, !dbg !2736
  %68 = load i64, i64* %centersize.addr, align 8, !dbg !2737
  %cmp84 = icmp sgt i64 %add, %68, !dbg !2738
  br i1 %cmp84, label %if.then85, label %if.end87, !dbg !2739

if.then85:                                        ; preds = %for.end72
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2740
  %call86 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %69, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.11, i32 0, i32 0)), !dbg !2742
  call void @exit(i32 1) #16, !dbg !2743
  unreachable, !dbg !2743

if.end87:                                         ; preds = %for.end72
  %70 = load i64*, i64** %centerIDs, align 8, !dbg !2744
  %71 = load i64, i64* %IDoffset, align 8, !dbg !2745
  call void @_Z11copycentersP6PointsS0_Pll(%struct.Points* %points, %struct.Points* %centers, i64* %70, i64 %71), !dbg !2746
  %72 = load i64, i64* %numRead, align 8, !dbg !2747
  %73 = load i64, i64* %IDoffset, align 8, !dbg !2748
  %add88 = add i64 %73, %72, !dbg !2748
  store i64 %add88, i64* %IDoffset, align 8, !dbg !2748
  %74 = load i8*, i8** @_ZL9is_center, align 8, !dbg !2749
  call void @free(i8* %74) #2, !dbg !2750
  %75 = load i8*, i8** @_ZL17switch_membership, align 8, !dbg !2751
  call void @free(i8* %75) #2, !dbg !2752
  %76 = load i32*, i32** @_ZL12center_table, align 8, !dbg !2753
  %77 = bitcast i32* %76 to i8*, !dbg !2753
  call void @free(i8* %77) #2, !dbg !2754
  %78 = load %class.PStream*, %class.PStream** %stream.addr, align 8, !dbg !2755
  %79 = bitcast %class.PStream* %78 to i32 (%class.PStream*)***, !dbg !2757
  %vtable89 = load i32 (%class.PStream*)**, i32 (%class.PStream*)*** %79, align 8, !dbg !2757
  %vfn90 = getelementptr inbounds i32 (%class.PStream*)*, i32 (%class.PStream*)** %vtable89, i64 2, !dbg !2757
  %80 = load i32 (%class.PStream*)*, i32 (%class.PStream*)** %vfn90, align 8, !dbg !2757
  %call91 = call i32 %80(%class.PStream* %78), !dbg !2757
  %tobool92 = icmp ne i32 %call91, 0, !dbg !2755
  br i1 %tobool92, label %if.then93, label %if.end94, !dbg !2758

if.then93:                                        ; preds = %if.end87
  br label %while.end, !dbg !2759

if.end94:                                         ; preds = %if.end87
  br label %while.body, !dbg !2761, !llvm.loop !2763

while.end:                                        ; preds = %if.then93
  %num95 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 0, !dbg !2764
  %81 = load i64, i64* %num95, align 8, !dbg !2764
  %mul96 = mul i64 %81, 1, !dbg !2765
  %call97 = call noalias i8* @malloc(i64 %mul96) #2, !dbg !2766
  store i8* %call97, i8** @_ZL17switch_membership, align 8, !dbg !2767
  %num98 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 0, !dbg !2768
  %82 = load i64, i64* %num98, align 8, !dbg !2768
  %call99 = call noalias i8* @calloc(i64 %82, i64 1) #2, !dbg !2769
  store i8* %call99, i8** @_ZL9is_center, align 8, !dbg !2770
  %num100 = getelementptr inbounds %struct.Points, %struct.Points* %centers, i32 0, i32 0, !dbg !2771
  %83 = load i64, i64* %num100, align 8, !dbg !2771
  %mul101 = mul i64 %83, 4, !dbg !2772
  %call102 = call noalias i8* @malloc(i64 %mul101) #2, !dbg !2773
  %84 = bitcast i8* %call102 to i32*, !dbg !2774
  store i32* %84, i32** @_ZL12center_table, align 8, !dbg !2775
  %85 = load i64, i64* %kmin.addr, align 8, !dbg !2776
  %86 = load i64, i64* %kmax.addr, align 8, !dbg !2777
  call void @_Z11localSearchP6PointsllPl(%struct.Points* %centers, i64 %85, i64 %86, i64* %kfinal), !dbg !2778
  %call103 = call i32 @_Z11contcentersP6Points(%struct.Points* %centers), !dbg !2779
  %87 = load i64*, i64** %centerIDs, align 8, !dbg !2780
  %88 = load i8*, i8** %outfile.addr, align 8, !dbg !2781
  call void @_Z12outcenterIDsP6PointsPlPc(%struct.Points* %centers, i64* %87, i8* %88), !dbg !2782
  ret void, !dbg !2783
}

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #10 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2784 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !2788, metadata !671), !dbg !2789
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !2790, metadata !671), !dbg !2791
  call void @llvm.dbg.declare(metadata i8** %outfilename, metadata !2792, metadata !671), !dbg !2793
  %call = call i8* @_Znam(i64 1024) #14, !dbg !2794
  store i8* %call, i8** %outfilename, align 8, !dbg !2793
  call void @llvm.dbg.declare(metadata i8** %infilename, metadata !2795, metadata !671), !dbg !2796
  %call1 = call i8* @_Znam(i64 1024) #14, !dbg !2797
  store i8* %call1, i8** %infilename, align 8, !dbg !2796
  call void @llvm.dbg.declare(metadata i64* %kmin, metadata !2798, metadata !671), !dbg !2799
  call void @llvm.dbg.declare(metadata i64* %kmax, metadata !2800, metadata !671), !dbg !2801
  call void @llvm.dbg.declare(metadata i64* %n, metadata !2802, metadata !671), !dbg !2803
  call void @llvm.dbg.declare(metadata i64* %chunksize, metadata !2804, metadata !671), !dbg !2805
  call void @llvm.dbg.declare(metadata i64* %clustersize, metadata !2806, metadata !671), !dbg !2807
  call void @llvm.dbg.declare(metadata i32* %dim, metadata !2808, metadata !671), !dbg !2809
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.12, i32 0, i32 0)), !dbg !2810
  %call3 = call i32 @fflush(%struct._IO_FILE* null), !dbg !2811
  %0 = load i32, i32* %argc.addr, align 4, !dbg !2812
  %cmp = icmp slt i32 %0, 10, !dbg !2814
  br i1 %cmp, label %if.then, label %if.end, !dbg !2815

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2816
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !2818
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 0, !dbg !2818
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !2818
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.13, i32 0, i32 0), i8* %3), !dbg !2819
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2820
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.14, i32 0, i32 0)), !dbg !2821
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2822
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i32 0, i32 0)), !dbg !2823
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2824
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.16, i32 0, i32 0)), !dbg !2825
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2826
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.17, i32 0, i32 0)), !dbg !2827
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2828
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.18, i32 0, i32 0)), !dbg !2829
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2830
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.19, i32 0, i32 0)), !dbg !2831
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2832
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.20, i32 0, i32 0)), !dbg !2833
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2834
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.21, i32 0, i32 0)), !dbg !2835
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2836
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.22, i32 0, i32 0)), !dbg !2837
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2838
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.23, i32 0, i32 0)), !dbg !2839
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2840
  %call15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.24, i32 0, i32 0)), !dbg !2841
  call void @exit(i32 1) #16, !dbg !2842
  unreachable, !dbg !2842

if.end:                                           ; preds = %entry
  %15 = load i8**, i8*** %argv.addr, align 8, !dbg !2843
  %arrayidx16 = getelementptr inbounds i8*, i8** %15, i64 1, !dbg !2843
  %16 = load i8*, i8** %arrayidx16, align 8, !dbg !2843
  %call17 = call i32 @atoi(i8* %16) #17, !dbg !2844
  %conv = sext i32 %call17 to i64, !dbg !2844
  store i64 %conv, i64* %kmin, align 8, !dbg !2845
  %17 = load i8**, i8*** %argv.addr, align 8, !dbg !2846
  %arrayidx18 = getelementptr inbounds i8*, i8** %17, i64 2, !dbg !2846
  %18 = load i8*, i8** %arrayidx18, align 8, !dbg !2846
  %call19 = call i32 @atoi(i8* %18) #17, !dbg !2847
  %conv20 = sext i32 %call19 to i64, !dbg !2847
  store i64 %conv20, i64* %kmax, align 8, !dbg !2848
  %19 = load i8**, i8*** %argv.addr, align 8, !dbg !2849
  %arrayidx21 = getelementptr inbounds i8*, i8** %19, i64 3, !dbg !2849
  %20 = load i8*, i8** %arrayidx21, align 8, !dbg !2849
  %call22 = call i32 @atoi(i8* %20) #17, !dbg !2850
  store i32 %call22, i32* %dim, align 4, !dbg !2851
  %21 = load i8**, i8*** %argv.addr, align 8, !dbg !2852
  %arrayidx23 = getelementptr inbounds i8*, i8** %21, i64 4, !dbg !2852
  %22 = load i8*, i8** %arrayidx23, align 8, !dbg !2852
  %call24 = call i32 @atoi(i8* %22) #17, !dbg !2853
  %conv25 = sext i32 %call24 to i64, !dbg !2853
  store i64 %conv25, i64* %n, align 8, !dbg !2854
  %23 = load i8**, i8*** %argv.addr, align 8, !dbg !2855
  %arrayidx26 = getelementptr inbounds i8*, i8** %23, i64 5, !dbg !2855
  %24 = load i8*, i8** %arrayidx26, align 8, !dbg !2855
  %call27 = call i32 @atoi(i8* %24) #17, !dbg !2856
  %conv28 = sext i32 %call27 to i64, !dbg !2856
  store i64 %conv28, i64* %chunksize, align 8, !dbg !2857
  %25 = load i8**, i8*** %argv.addr, align 8, !dbg !2858
  %arrayidx29 = getelementptr inbounds i8*, i8** %25, i64 6, !dbg !2858
  %26 = load i8*, i8** %arrayidx29, align 8, !dbg !2858
  %call30 = call i32 @atoi(i8* %26) #17, !dbg !2859
  %conv31 = sext i32 %call30 to i64, !dbg !2859
  store i64 %conv31, i64* %clustersize, align 8, !dbg !2860
  %27 = load i8*, i8** %infilename, align 8, !dbg !2861
  %28 = load i8**, i8*** %argv.addr, align 8, !dbg !2862
  %arrayidx32 = getelementptr inbounds i8*, i8** %28, i64 7, !dbg !2862
  %29 = load i8*, i8** %arrayidx32, align 8, !dbg !2862
  %call33 = call i8* @strcpy(i8* %27, i8* %29) #2, !dbg !2863
  %30 = load i8*, i8** %outfilename, align 8, !dbg !2864
  %31 = load i8**, i8*** %argv.addr, align 8, !dbg !2865
  %arrayidx34 = getelementptr inbounds i8*, i8** %31, i64 8, !dbg !2865
  %32 = load i8*, i8** %arrayidx34, align 8, !dbg !2865
  %call35 = call i8* @strcpy(i8* %30, i8* %32) #2, !dbg !2866
  %33 = load i8**, i8*** %argv.addr, align 8, !dbg !2867
  %arrayidx36 = getelementptr inbounds i8*, i8** %33, i64 9, !dbg !2867
  %34 = load i8*, i8** %arrayidx36, align 8, !dbg !2867
  %call37 = call i32 @atoi(i8* %34) #17, !dbg !2868
  store i32 %call37, i32* @_ZL5nproc, align 4, !dbg !2869
  call void @srand48(i64 1) #2, !dbg !2870
  call void @llvm.dbg.declare(metadata %class.PStream** %stream, metadata !2871, metadata !671), !dbg !2872
  %35 = load i64, i64* %n, align 8, !dbg !2873
  %cmp38 = icmp sgt i64 %35, 0, !dbg !2875
  br i1 %cmp38, label %if.then39, label %if.else, !dbg !2876

if.then39:                                        ; preds = %if.end
  %call40 = call i8* @_Znwm(i64 16) #14, !dbg !2877
  %36 = bitcast i8* %call40 to %class.SimStream*, !dbg !2877
  %37 = load i64, i64* %n, align 8, !dbg !2879
  invoke void @_ZN9SimStreamC2El(%class.SimStream* %36, i64 %37)
          to label %invoke.cont unwind label %lpad, !dbg !2880

invoke.cont:                                      ; preds = %if.then39
  %38 = bitcast %class.SimStream* %36 to %class.PStream*, !dbg !2881
  store %class.PStream* %38, %class.PStream** %stream, align 8, !dbg !2883
  br label %if.end44, !dbg !2884

lpad:                                             ; preds = %if.then39
  %39 = landingpad { i8*, i32 }
          cleanup, !dbg !2885
  %40 = extractvalue { i8*, i32 } %39, 0, !dbg !2885
  store i8* %40, i8** %exn.slot, align 8, !dbg !2885
  %41 = extractvalue { i8*, i32 } %39, 1, !dbg !2885
  store i32 %41, i32* %ehselector.slot, align 4, !dbg !2885
  call void @_ZdlPv(i8* %call40) #15, !dbg !2886
  br label %eh.resume, !dbg !2886

if.else:                                          ; preds = %if.end
  %call41 = call i8* @_Znwm(i64 16) #14, !dbg !2888
  %42 = bitcast i8* %call41 to %class.FileStream*, !dbg !2888
  %43 = load i8*, i8** %infilename, align 8, !dbg !2890
  invoke void @_ZN10FileStreamC2EPc(%class.FileStream* %42, i8* %43)
          to label %invoke.cont43 unwind label %lpad42, !dbg !2891

invoke.cont43:                                    ; preds = %if.else
  %44 = bitcast %class.FileStream* %42 to %class.PStream*, !dbg !2892
  store %class.PStream* %44, %class.PStream** %stream, align 8, !dbg !2894
  br label %if.end44

lpad42:                                           ; preds = %if.else
  %45 = landingpad { i8*, i32 }
          cleanup, !dbg !2895
  %46 = extractvalue { i8*, i32 } %45, 0, !dbg !2895
  store i8* %46, i8** %exn.slot, align 8, !dbg !2895
  %47 = extractvalue { i8*, i32 } %45, 1, !dbg !2895
  store i32 %47, i32* %ehselector.slot, align 4, !dbg !2895
  call void @_ZdlPv(i8* %call41) #15, !dbg !2896
  br label %eh.resume, !dbg !2896

if.end44:                                         ; preds = %invoke.cont43, %invoke.cont
  call void @llvm.dbg.declare(metadata double* %t1, metadata !2898, metadata !671), !dbg !2899
  %call45 = call double @_Z7gettimev(), !dbg !2900
  store double %call45, double* %t1, align 8, !dbg !2899
  store double 0.000000e+00, double* @serial_t, align 8, !dbg !2901
  store double 0.000000e+00, double* @cpu_to_gpu_t, align 8, !dbg !2902
  store double 0.000000e+00, double* @gpu_to_cpu_t, align 8, !dbg !2903
  store double 0.000000e+00, double* @alloc_t, align 8, !dbg !2904
  store double 0.000000e+00, double* @free_t, align 8, !dbg !2905
  store double 0.000000e+00, double* @kernel_t, align 8, !dbg !2906
  store i8 0, i8* @isCoordChanged, align 1, !dbg !2907
  %48 = load %class.PStream*, %class.PStream** %stream, align 8, !dbg !2908
  %49 = load i64, i64* %kmin, align 8, !dbg !2909
  %50 = load i64, i64* %kmax, align 8, !dbg !2910
  %51 = load i32, i32* %dim, align 4, !dbg !2911
  %52 = load i64, i64* %chunksize, align 8, !dbg !2912
  %53 = load i64, i64* %clustersize, align 8, !dbg !2913
  %54 = load i8*, i8** %outfilename, align 8, !dbg !2914
  call void @_Z13streamClusterP7PStreamllillPc(%class.PStream* %48, i64 %49, i64 %50, i32 %51, i64 %52, i64 %53, i8* %54), !dbg !2915
  call void @_Z10freeDevMemv(), !dbg !2916
  call void @_Z11freeHostMemv(), !dbg !2917
  call void @llvm.dbg.declare(metadata double* %t2, metadata !2918, metadata !671), !dbg !2919
  %call46 = call double @_Z7gettimev(), !dbg !2920
  store double %call46, double* %t2, align 8, !dbg !2919
  %55 = load double, double* %t2, align 8, !dbg !2921
  %56 = load double, double* %t1, align 8, !dbg !2922
  %sub = fsub double %55, %56, !dbg !2923
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.25, i32 0, i32 0), double %sub), !dbg !2924
  %57 = load %class.PStream*, %class.PStream** %stream, align 8, !dbg !2925
  %isnull = icmp eq %class.PStream* %57, null, !dbg !2926
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !2926

delete.notnull:                                   ; preds = %if.end44
  %58 = bitcast %class.PStream* %57 to void (%class.PStream*)***, !dbg !2927
  %vtable = load void (%class.PStream*)**, void (%class.PStream*)*** %58, align 8, !dbg !2927
  %vfn = getelementptr inbounds void (%class.PStream*)*, void (%class.PStream*)** %vtable, i64 4, !dbg !2927
  %59 = load void (%class.PStream*)*, void (%class.PStream*)** %vfn, align 8, !dbg !2927
  call void %59(%class.PStream* %57), !dbg !2927
  br label %delete.end, !dbg !2927

delete.end:                                       ; preds = %delete.notnull, %if.end44
  %60 = load double, double* @time_gain, align 8, !dbg !2929
  %call48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.26, i32 0, i32 0), double %60), !dbg !2930
  %61 = load double, double* @time_gain_dist, align 8, !dbg !2931
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.27, i32 0, i32 0), double %61), !dbg !2932
  %62 = load double, double* @time_gain_init, align 8, !dbg !2933
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.28, i32 0, i32 0), double %62), !dbg !2934
  %63 = load double, double* @time_select_feasible, align 8, !dbg !2935
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.29, i32 0, i32 0), double %63), !dbg !2936
  %64 = load double, double* @time_speedy, align 8, !dbg !2937
  %call52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.30, i32 0, i32 0), double %64), !dbg !2938
  %65 = load double, double* @time_shuffle, align 8, !dbg !2939
  %call53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.31, i32 0, i32 0), double %65), !dbg !2940
  %66 = load double, double* @time_local_search, align 8, !dbg !2941
  %call54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.32, i32 0, i32 0), double %66), !dbg !2942
  %call55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0)), !dbg !2943
  %call56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.33, i32 0, i32 0)), !dbg !2944
  %67 = load double, double* @serial_t, align 8, !dbg !2945
  %div = fdiv double %67, 1.000000e+03, !dbg !2946
  %call57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.34, i32 0, i32 0), double %div), !dbg !2947
  %68 = load double, double* @cpu_to_gpu_t, align 8, !dbg !2948
  %div58 = fdiv double %68, 1.000000e+03, !dbg !2949
  %call59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.35, i32 0, i32 0), double %div58), !dbg !2950
  %69 = load double, double* @gpu_to_cpu_t, align 8, !dbg !2951
  %div60 = fdiv double %69, 1.000000e+03, !dbg !2952
  %call61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.36, i32 0, i32 0), double %div60), !dbg !2953
  %70 = load double, double* @alloc_t, align 8, !dbg !2954
  %div62 = fdiv double %70, 1.000000e+03, !dbg !2955
  %call63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.37, i32 0, i32 0), double %div62), !dbg !2956
  %71 = load double, double* @free_t, align 8, !dbg !2957
  %div64 = fdiv double %71, 1.000000e+03, !dbg !2958
  %call65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.38, i32 0, i32 0), double %div64), !dbg !2959
  %72 = load double, double* @kernel_t, align 8, !dbg !2960
  %div66 = fdiv double %72, 1.000000e+03, !dbg !2961
  %call67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.39, i32 0, i32 0), double %div66), !dbg !2962
  ret i32 0, !dbg !2963

eh.resume:                                        ; preds = %lpad42, %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !2964
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !2964
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !2964
  %lpad.val68 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !2964
  resume { i8*, i32 } %lpad.val68, !dbg !2964
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
define linkonce_odr void @_ZN9SimStreamC2El(%class.SimStream* %this, i64 %n_) unnamed_addr #4 comdat align 2 !dbg !2966 {
entry:
  %this.addr = alloca %class.SimStream*, align 8
  %n_.addr = alloca i64, align 8
  store %class.SimStream* %this, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.SimStream** %this.addr, metadata !2985, metadata !671), !dbg !2987
  store i64 %n_, i64* %n_.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %n_.addr, metadata !2988, metadata !671), !dbg !2989
  %this1 = load %class.SimStream*, %class.SimStream** %this.addr, align 8
  %0 = bitcast %class.SimStream* %this1 to %class.PStream*, !dbg !2990
  call void @_ZN7PStreamC2Ev(%class.PStream* %0) #2, !dbg !2991
  %1 = bitcast %class.SimStream* %this1 to i32 (...)***, !dbg !2990
  store i32 (...)** bitcast (i8** getelementptr inbounds ([7 x i8*], [7 x i8*]* @_ZTV9SimStream, i32 0, i32 2) to i32 (...)**), i32 (...)*** %1, align 8, !dbg !2990
  %2 = load i64, i64* %n_.addr, align 8, !dbg !2992
  %n = getelementptr inbounds %class.SimStream, %class.SimStream* %this1, i32 0, i32 1, !dbg !2994
  store i64 %2, i64* %n, align 8, !dbg !2995
  ret void, !dbg !2996
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #8

; Function Attrs: uwtable
define linkonce_odr void @_ZN10FileStreamC2EPc(%class.FileStream* %this, i8* %filename) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2997 {
entry:
  %this.addr = alloca %class.FileStream*, align 8
  %filename.addr = alloca i8*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %class.FileStream* %this, %class.FileStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.FileStream** %this.addr, metadata !3016, metadata !671), !dbg !3018
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !3019, metadata !671), !dbg !3020
  %this1 = load %class.FileStream*, %class.FileStream** %this.addr, align 8
  %0 = bitcast %class.FileStream* %this1 to %class.PStream*, !dbg !3021
  call void @_ZN7PStreamC2Ev(%class.PStream* %0) #2, !dbg !3022
  %1 = bitcast %class.FileStream* %this1 to i32 (...)***, !dbg !3021
  store i32 (...)** bitcast (i8** getelementptr inbounds ([7 x i8*], [7 x i8*]* @_ZTV10FileStream, i32 0, i32 2) to i32 (...)**), i32 (...)*** %1, align 8, !dbg !3021
  %2 = load i8*, i8** %filename.addr, align 8, !dbg !3023
  %call = invoke %struct._IO_FILE* @fopen(i8* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.40, i32 0, i32 0))
          to label %invoke.cont unwind label %lpad, !dbg !3025

invoke.cont:                                      ; preds = %entry
  %fp = getelementptr inbounds %class.FileStream, %class.FileStream* %this1, i32 0, i32 1, !dbg !3026
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !3028
  %fp2 = getelementptr inbounds %class.FileStream, %class.FileStream* %this1, i32 0, i32 1, !dbg !3029
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %fp2, align 8, !dbg !3029
  %cmp = icmp eq %struct._IO_FILE* %3, null, !dbg !3031
  br i1 %cmp, label %if.then, label %if.end, !dbg !3032

if.then:                                          ; preds = %invoke.cont
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !3033
  %5 = load i8*, i8** %filename.addr, align 8, !dbg !3035
  %call4 = invoke i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.41, i32 0, i32 0), i8* %5)
          to label %invoke.cont3 unwind label %lpad, !dbg !3036

invoke.cont3:                                     ; preds = %if.then
  call void @exit(i32 1) #16, !dbg !3037
  unreachable, !dbg !3037

lpad:                                             ; preds = %if.then, %entry
  %6 = landingpad { i8*, i32 }
          cleanup, !dbg !3038
  %7 = extractvalue { i8*, i32 } %6, 0, !dbg !3038
  store i8* %7, i8** %exn.slot, align 8, !dbg !3038
  %8 = extractvalue { i8*, i32 } %6, 1, !dbg !3038
  store i32 %8, i32* %ehselector.slot, align 4, !dbg !3038
  %9 = bitcast %class.FileStream* %this1 to %class.PStream*, !dbg !3038
  invoke void @_ZN7PStreamD2Ev(%class.PStream* %9)
          to label %invoke.cont5 unwind label %terminate.lpad, !dbg !3038

if.end:                                           ; preds = %invoke.cont
  ret void, !dbg !3039

invoke.cont5:                                     ; preds = %lpad
  br label %eh.resume, !dbg !3041

eh.resume:                                        ; preds = %invoke.cont5
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !3043
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !3043
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !3043
  %lpad.val6 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !3043
  resume { i8*, i32 } %lpad.val6, !dbg !3043

terminate.lpad:                                   ; preds = %lpad
  %10 = landingpad { i8*, i32 }
          catch i8* null, !dbg !3045
  %11 = extractvalue { i8*, i32 } %10, 0, !dbg !3045
  call void @__clang_call_terminate(i8* %11) #16, !dbg !3045
  unreachable, !dbg !3045
}

declare void @_Z10freeDevMemv() #1

declare void @_Z11freeHostMemv() #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN7PStreamC2Ev(%class.PStream* %this) unnamed_addr #12 comdat align 2 !dbg !3047 {
entry:
  %this.addr = alloca %class.PStream*, align 8
  store %class.PStream* %this, %class.PStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.PStream** %this.addr, metadata !3049, metadata !671), !dbg !3050
  %this1 = load %class.PStream*, %class.PStream** %this.addr, align 8
  %0 = bitcast %class.PStream* %this1 to i32 (...)***, !dbg !3051
  store i32 (...)** bitcast (i8** getelementptr inbounds ([7 x i8*], [7 x i8*]* @_ZTV7PStream, i32 0, i32 2) to i32 (...)**), i32 (...)*** %0, align 8, !dbg !3051
  ret void, !dbg !3051
}

; Function Attrs: nounwind uwtable
define linkonce_odr i64 @_ZN9SimStream4readEPfii(%class.SimStream* %this, float* %dest, i32 %dim, i32 %num) unnamed_addr #4 comdat align 2 !dbg !3052 {
entry:
  %this.addr = alloca %class.SimStream*, align 8
  %dest.addr = alloca float*, align 8
  %dim.addr = alloca i32, align 4
  %num.addr = alloca i32, align 4
  %count = alloca i64, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  store %class.SimStream* %this, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.SimStream** %this.addr, metadata !3053, metadata !671), !dbg !3054
  store float* %dest, float** %dest.addr, align 8
  call void @llvm.dbg.declare(metadata float** %dest.addr, metadata !3055, metadata !671), !dbg !3056
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !3057, metadata !671), !dbg !3058
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !3059, metadata !671), !dbg !3060
  %this1 = load %class.SimStream*, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %count, metadata !3061, metadata !671), !dbg !3062
  store i64 0, i64* %count, align 8, !dbg !3062
  call void @llvm.dbg.declare(metadata i32* %i, metadata !3063, metadata !671), !dbg !3065
  store i32 0, i32* %i, align 4, !dbg !3065
  br label %for.cond, !dbg !3066

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32, i32* %i, align 4, !dbg !3067
  %1 = load i32, i32* %num.addr, align 4, !dbg !3070
  %cmp = icmp slt i32 %0, %1, !dbg !3071
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !3072

land.rhs:                                         ; preds = %for.cond
  %n = getelementptr inbounds %class.SimStream, %class.SimStream* %this1, i32 0, i32 1, !dbg !3073
  %2 = load i64, i64* %n, align 8, !dbg !3073
  %cmp2 = icmp sgt i64 %2, 0, !dbg !3075
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %3 = phi i1 [ false, %for.cond ], [ %cmp2, %land.rhs ]
  br i1 %3, label %for.body, label %for.end10, !dbg !3076

for.body:                                         ; preds = %land.end
  call void @llvm.dbg.declare(metadata i32* %k, metadata !3078, metadata !671), !dbg !3081
  store i32 0, i32* %k, align 4, !dbg !3081
  br label %for.cond3, !dbg !3082

for.cond3:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %k, align 4, !dbg !3083
  %5 = load i32, i32* %dim.addr, align 4, !dbg !3086
  %cmp4 = icmp slt i32 %4, %5, !dbg !3087
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !3088

for.body5:                                        ; preds = %for.cond3
  %call = call i64 @lrand48() #2, !dbg !3089
  %conv = sitofp i64 %call to float, !dbg !3089
  %div = fdiv float %conv, 0x41E0000000000000, !dbg !3091
  %6 = load float*, float** %dest.addr, align 8, !dbg !3092
  %7 = load i32, i32* %i, align 4, !dbg !3093
  %8 = load i32, i32* %dim.addr, align 4, !dbg !3094
  %mul = mul nsw i32 %7, %8, !dbg !3095
  %9 = load i32, i32* %k, align 4, !dbg !3096
  %add = add nsw i32 %mul, %9, !dbg !3097
  %idxprom = sext i32 %add to i64, !dbg !3092
  %arrayidx = getelementptr inbounds float, float* %6, i64 %idxprom, !dbg !3092
  store float %div, float* %arrayidx, align 4, !dbg !3098
  br label %for.inc, !dbg !3099

for.inc:                                          ; preds = %for.body5
  %10 = load i32, i32* %k, align 4, !dbg !3100
  %inc = add nsw i32 %10, 1, !dbg !3100
  store i32 %inc, i32* %k, align 4, !dbg !3100
  br label %for.cond3, !dbg !3102, !llvm.loop !3103

for.end:                                          ; preds = %for.cond3
  %n6 = getelementptr inbounds %class.SimStream, %class.SimStream* %this1, i32 0, i32 1, !dbg !3105
  %11 = load i64, i64* %n6, align 8, !dbg !3106
  %dec = add nsw i64 %11, -1, !dbg !3106
  store i64 %dec, i64* %n6, align 8, !dbg !3106
  %12 = load i64, i64* %count, align 8, !dbg !3107
  %inc7 = add i64 %12, 1, !dbg !3107
  store i64 %inc7, i64* %count, align 8, !dbg !3107
  br label %for.inc8, !dbg !3108

for.inc8:                                         ; preds = %for.end
  %13 = load i32, i32* %i, align 4, !dbg !3109
  %inc9 = add nsw i32 %13, 1, !dbg !3109
  store i32 %inc9, i32* %i, align 4, !dbg !3109
  br label %for.cond, !dbg !3111, !llvm.loop !3112

for.end10:                                        ; preds = %land.end
  %14 = load i64, i64* %count, align 8, !dbg !3114
  ret i64 %14, !dbg !3115
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZN9SimStream6ferrorEv(%class.SimStream* %this) unnamed_addr #4 comdat align 2 !dbg !3116 {
entry:
  %this.addr = alloca %class.SimStream*, align 8
  store %class.SimStream* %this, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.SimStream** %this.addr, metadata !3117, metadata !671), !dbg !3118
  %this1 = load %class.SimStream*, %class.SimStream** %this.addr, align 8
  ret i32 0, !dbg !3119
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZN9SimStream4feofEv(%class.SimStream* %this) unnamed_addr #4 comdat align 2 !dbg !3120 {
entry:
  %this.addr = alloca %class.SimStream*, align 8
  store %class.SimStream* %this, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.SimStream** %this.addr, metadata !3121, metadata !671), !dbg !3122
  %this1 = load %class.SimStream*, %class.SimStream** %this.addr, align 8
  %n = getelementptr inbounds %class.SimStream, %class.SimStream* %this1, i32 0, i32 1, !dbg !3123
  %0 = load i64, i64* %n, align 8, !dbg !3123
  %cmp = icmp sle i64 %0, 0, !dbg !3124
  %conv = zext i1 %cmp to i32, !dbg !3123
  ret i32 %conv, !dbg !3125
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9SimStreamD2Ev(%class.SimStream* %this) unnamed_addr #4 comdat align 2 !dbg !3126 {
entry:
  %this.addr = alloca %class.SimStream*, align 8
  store %class.SimStream* %this, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.SimStream** %this.addr, metadata !3127, metadata !671), !dbg !3128
  %this1 = load %class.SimStream*, %class.SimStream** %this.addr, align 8
  %0 = bitcast %class.SimStream* %this1 to %class.PStream*, !dbg !3129
  call void @_ZN7PStreamD2Ev(%class.PStream* %0), !dbg !3129
  ret void, !dbg !3131
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN9SimStreamD0Ev(%class.SimStream* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !3132 {
entry:
  %this.addr = alloca %class.SimStream*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %class.SimStream* %this, %class.SimStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.SimStream** %this.addr, metadata !3133, metadata !671), !dbg !3134
  %this1 = load %class.SimStream*, %class.SimStream** %this.addr, align 8
  invoke void @_ZN9SimStreamD2Ev(%class.SimStream* %this1)
          to label %invoke.cont unwind label %lpad, !dbg !3135

invoke.cont:                                      ; preds = %entry
  %0 = bitcast %class.SimStream* %this1 to i8*, !dbg !3136
  call void @_ZdlPv(i8* %0) #15, !dbg !3136
  ret void, !dbg !3138

lpad:                                             ; preds = %entry
  %1 = landingpad { i8*, i32 }
          cleanup, !dbg !3139
  %2 = extractvalue { i8*, i32 } %1, 0, !dbg !3139
  store i8* %2, i8** %exn.slot, align 8, !dbg !3139
  %3 = extractvalue { i8*, i32 } %1, 1, !dbg !3139
  store i32 %3, i32* %ehselector.slot, align 4, !dbg !3139
  %4 = bitcast %class.SimStream* %this1 to i8*, !dbg !3140
  call void @_ZdlPv(i8* %4) #15, !dbg !3140
  br label %eh.resume, !dbg !3140

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !3142
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !3142
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !3142
  %lpad.val2 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !3142
  resume { i8*, i32 } %lpad.val2, !dbg !3142
}

declare void @__cxa_pure_virtual() unnamed_addr

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN7PStreamD2Ev(%class.PStream* %this) unnamed_addr #4 comdat align 2 !dbg !3144 {
entry:
  %this.addr = alloca %class.PStream*, align 8
  store %class.PStream* %this, %class.PStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.PStream** %this.addr, metadata !3145, metadata !671), !dbg !3146
  %this1 = load %class.PStream*, %class.PStream** %this.addr, align 8
  ret void, !dbg !3147
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN7PStreamD0Ev(%class.PStream* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !3148 {
entry:
  %this.addr = alloca %class.PStream*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %class.PStream* %this, %class.PStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.PStream** %this.addr, metadata !3149, metadata !671), !dbg !3150
  %this1 = load %class.PStream*, %class.PStream** %this.addr, align 8
  invoke void @_ZN7PStreamD2Ev(%class.PStream* %this1)
          to label %invoke.cont unwind label %lpad, !dbg !3151

invoke.cont:                                      ; preds = %entry
  %0 = bitcast %class.PStream* %this1 to i8*, !dbg !3152
  call void @_ZdlPv(i8* %0) #15, !dbg !3152
  ret void, !dbg !3154

lpad:                                             ; preds = %entry
  %1 = landingpad { i8*, i32 }
          cleanup, !dbg !3155
  %2 = extractvalue { i8*, i32 } %1, 0, !dbg !3155
  store i8* %2, i8** %exn.slot, align 8, !dbg !3155
  %3 = extractvalue { i8*, i32 } %1, 1, !dbg !3155
  store i32 %3, i32* %ehselector.slot, align 4, !dbg !3155
  %4 = bitcast %class.PStream* %this1 to i8*, !dbg !3156
  call void @_ZdlPv(i8* %4) #15, !dbg !3156
  br label %eh.resume, !dbg !3156

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !3158
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !3158
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !3158
  %lpad.val2 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !3158
  resume { i8*, i32 } %lpad.val2, !dbg !3158
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
define linkonce_odr i64 @_ZN10FileStream4readEPfii(%class.FileStream* %this, float* %dest, i32 %dim, i32 %num) unnamed_addr #0 comdat align 2 !dbg !3160 {
entry:
  %this.addr = alloca %class.FileStream*, align 8
  %dest.addr = alloca float*, align 8
  %dim.addr = alloca i32, align 4
  %num.addr = alloca i32, align 4
  store %class.FileStream* %this, %class.FileStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.FileStream** %this.addr, metadata !3161, metadata !671), !dbg !3162
  store float* %dest, float** %dest.addr, align 8
  call void @llvm.dbg.declare(metadata float** %dest.addr, metadata !3163, metadata !671), !dbg !3164
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !3165, metadata !671), !dbg !3166
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !3167, metadata !671), !dbg !3168
  %this1 = load %class.FileStream*, %class.FileStream** %this.addr, align 8
  %0 = load float*, float** %dest.addr, align 8, !dbg !3169
  %1 = bitcast float* %0 to i8*, !dbg !3169
  %2 = load i32, i32* %dim.addr, align 4, !dbg !3170
  %conv = sext i32 %2 to i64, !dbg !3170
  %mul = mul i64 4, %conv, !dbg !3171
  %3 = load i32, i32* %num.addr, align 4, !dbg !3172
  %conv2 = sext i32 %3 to i64, !dbg !3172
  %fp = getelementptr inbounds %class.FileStream, %class.FileStream* %this1, i32 0, i32 1, !dbg !3173
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !3173
  %call = call i64 @fread(i8* %1, i64 %mul, i64 %conv2, %struct._IO_FILE* %4), !dbg !3174
  ret i64 %call, !dbg !3175
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZN10FileStream6ferrorEv(%class.FileStream* %this) unnamed_addr #4 comdat align 2 !dbg !3176 {
entry:
  %this.addr = alloca %class.FileStream*, align 8
  store %class.FileStream* %this, %class.FileStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.FileStream** %this.addr, metadata !3177, metadata !671), !dbg !3178
  %this1 = load %class.FileStream*, %class.FileStream** %this.addr, align 8
  %fp = getelementptr inbounds %class.FileStream, %class.FileStream* %this1, i32 0, i32 1, !dbg !3179
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !3179
  %call = call i32 @ferror(%struct._IO_FILE* %0) #2, !dbg !3180
  ret i32 %call, !dbg !3181
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZN10FileStream4feofEv(%class.FileStream* %this) unnamed_addr #4 comdat align 2 !dbg !3182 {
entry:
  %this.addr = alloca %class.FileStream*, align 8
  store %class.FileStream* %this, %class.FileStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.FileStream** %this.addr, metadata !3183, metadata !671), !dbg !3184
  %this1 = load %class.FileStream*, %class.FileStream** %this.addr, align 8
  %fp = getelementptr inbounds %class.FileStream, %class.FileStream* %this1, i32 0, i32 1, !dbg !3185
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !3185
  %call = call i32 @feof(%struct._IO_FILE* %0) #2, !dbg !3186
  ret i32 %call, !dbg !3187
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN10FileStreamD2Ev(%class.FileStream* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !3188 {
entry:
  %this.addr = alloca %class.FileStream*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %class.FileStream* %this, %class.FileStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.FileStream** %this.addr, metadata !3189, metadata !671), !dbg !3190
  %this1 = load %class.FileStream*, %class.FileStream** %this.addr, align 8
  %0 = bitcast %class.FileStream* %this1 to i32 (...)***, !dbg !3191
  store i32 (...)** bitcast (i8** getelementptr inbounds ([7 x i8*], [7 x i8*]* @_ZTV10FileStream, i32 0, i32 2) to i32 (...)**), i32 (...)*** %0, align 8, !dbg !3191
  %call = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.42, i32 0, i32 0))
          to label %invoke.cont unwind label %lpad, !dbg !3192

invoke.cont:                                      ; preds = %entry
  %fp = getelementptr inbounds %class.FileStream, %class.FileStream* %this1, i32 0, i32 1, !dbg !3194
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !3194
  %call3 = invoke i32 @fclose(%struct._IO_FILE* %1)
          to label %invoke.cont2 unwind label %lpad, !dbg !3195

invoke.cont2:                                     ; preds = %invoke.cont
  %2 = bitcast %class.FileStream* %this1 to %class.PStream*, !dbg !3196
  call void @_ZN7PStreamD2Ev(%class.PStream* %2), !dbg !3196
  ret void, !dbg !3197

lpad:                                             ; preds = %invoke.cont, %entry
  %3 = landingpad { i8*, i32 }
          cleanup, !dbg !3198
  %4 = extractvalue { i8*, i32 } %3, 0, !dbg !3198
  store i8* %4, i8** %exn.slot, align 8, !dbg !3198
  %5 = extractvalue { i8*, i32 } %3, 1, !dbg !3198
  store i32 %5, i32* %ehselector.slot, align 4, !dbg !3198
  %6 = bitcast %class.FileStream* %this1 to %class.PStream*, !dbg !3198
  invoke void @_ZN7PStreamD2Ev(%class.PStream* %6)
          to label %invoke.cont4 unwind label %terminate.lpad, !dbg !3198

invoke.cont4:                                     ; preds = %lpad
  br label %eh.resume, !dbg !3200

eh.resume:                                        ; preds = %invoke.cont4
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !3202
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !3202
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !3202
  %lpad.val5 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !3202
  resume { i8*, i32 } %lpad.val5, !dbg !3202

terminate.lpad:                                   ; preds = %lpad
  %7 = landingpad { i8*, i32 }
          catch i8* null, !dbg !3204
  %8 = extractvalue { i8*, i32 } %7, 0, !dbg !3204
  call void @__clang_call_terminate(i8* %8) #16, !dbg !3204
  unreachable, !dbg !3204
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN10FileStreamD0Ev(%class.FileStream* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !3206 {
entry:
  %this.addr = alloca %class.FileStream*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %class.FileStream* %this, %class.FileStream** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.FileStream** %this.addr, metadata !3207, metadata !671), !dbg !3208
  %this1 = load %class.FileStream*, %class.FileStream** %this.addr, align 8
  invoke void @_ZN10FileStreamD2Ev(%class.FileStream* %this1)
          to label %invoke.cont unwind label %lpad, !dbg !3209

invoke.cont:                                      ; preds = %entry
  %0 = bitcast %class.FileStream* %this1 to i8*, !dbg !3210
  call void @_ZdlPv(i8* %0) #15, !dbg !3210
  ret void, !dbg !3212

lpad:                                             ; preds = %entry
  %1 = landingpad { i8*, i32 }
          cleanup, !dbg !3213
  %2 = extractvalue { i8*, i32 } %1, 0, !dbg !3213
  store i8* %2, i8** %exn.slot, align 8, !dbg !3213
  %3 = extractvalue { i8*, i32 } %1, 1, !dbg !3213
  store i32 %3, i32* %ehselector.slot, align 4, !dbg !3213
  %4 = bitcast %class.FileStream* %this1 to i8*, !dbg !3214
  call void @_ZdlPv(i8* %4) #15, !dbg !3214
  br label %eh.resume, !dbg !3214

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !3216
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !3216
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !3216
  %lpad.val2 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !3216
  resume { i8*, i32 } %lpad.val2, !dbg !3216
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #5

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE*) #5

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_streamcluster_cuda_cpu.cpp() #0 section ".text.startup" !dbg !3218 {
entry:
  call void @__cxx_global_var_init(), !dbg !3220
  ret void
}

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { noinline noreturn nounwind }
attributes #14 = { builtin }
attributes #15 = { builtin nounwind }
attributes #16 = { noreturn nounwind }
attributes #17 = { nounwind readonly }

!llvm.dbg.cu = !{!20}
!llvm.module.flags = !{!658, !659}
!llvm.ident = !{!660}

!0 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !1, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!1 = !DINamespace(name: "std", scope: null, file: !2, line: 194)
!2 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!3 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/iostream", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!4 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 601, size: 8, align: 8, elements: !7, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/ios_base.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !1, file: !5, line: 228, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt8ios_base")
!7 = !{!8, !12, !14, !18}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "_S_refcount", scope: !4, file: !5, line: 609, baseType: !9, flags: DIFlagStaticMember)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Atomic_word", file: !10, line: 32, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/atomic_word.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "_S_synced_with_stdio", scope: !4, file: !5, line: 610, baseType: !13, flags: DIFlagStaticMember)
!13 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!14 = !DISubprogram(name: "Init", scope: !4, file: !5, line: 605, type: !15, isLocal: false, isDefinition: false, scopeLine: 605, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!18 = !DISubprogram(name: "~Init", scope: !4, file: !5, line: 606, type: !15, isLocal: false, isDefinition: false, scopeLine: 606, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!19 = distinct !DIGlobalVariable(name: "isCoordChanged", scope: !20, file: !21, line: 35, type: !13, isLocal: false, isDefinition: true)
!20 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !21, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !22, retainedTypes: !23, globals: !67, imports: !100)
!21 = !DIFile(filename: "streamcluster_cuda_cpu.cpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!22 = !{}
!23 = !{!24, !25, !11, !26, !27, !28, !29, !52, !41, !66}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64, align: 64)
!25 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!27 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64, align: 64)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pkmedian_arg_t", file: !31, line: 53, size: 384, align: 64, elements: !32, identifier: "_ZTS14pkmedian_arg_t")
!31 = !DIFile(filename: "./streamcluster_header.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!32 = !{!33, !49, !50, !51, !53, !54}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "points", scope: !30, file: !31, line: 55, baseType: !34, size: 64, align: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64, align: 64)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "Points", file: !31, line: 51, baseType: !36)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !31, line: 47, size: 192, align: 64, elements: !37, identifier: "_ZTS6Points")
!37 = !{!38, !39, !40}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !36, file: !31, line: 48, baseType: !27, size: 64, align: 64)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "dim", scope: !36, file: !31, line: 49, baseType: !11, size: 32, align: 32, offset: 64)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !36, file: !31, line: 50, baseType: !41, size: 64, align: 64, offset: 128)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64, align: 64)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "Point", file: !31, line: 44, baseType: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !31, line: 39, size: 256, align: 64, elements: !44, identifier: "_ZTS5Point")
!44 = !{!45, !46, !47, !48}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "weight", scope: !43, file: !31, line: 40, baseType: !25, size: 32, align: 32)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "coord", scope: !43, file: !31, line: 41, baseType: !24, size: 64, align: 64, offset: 64)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "assign", scope: !43, file: !31, line: 42, baseType: !27, size: 64, align: 64, offset: 128)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "cost", scope: !43, file: !31, line: 43, baseType: !25, size: 32, align: 32, offset: 192)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "kmin", scope: !30, file: !31, line: 56, baseType: !27, size: 64, align: 64, offset: 64)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "kmax", scope: !30, file: !31, line: 57, baseType: !27, size: 64, align: 64, offset: 128)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "kfinal", scope: !30, file: !31, line: 58, baseType: !52, size: 64, align: 64, offset: 192)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64, align: 64)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "pid", scope: !30, file: !31, line: 59, baseType: !11, size: 32, align: 32, offset: 256)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "barrier", scope: !30, file: !31, line: 60, baseType: !55, size: 64, align: 64, offset: 320)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64, align: 64)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_barrier_t", file: !57, line: 243, baseType: !58)
!57 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!58 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !57, line: 239, size: 256, align: 64, elements: !59, identifier: "_ZTS17pthread_barrier_t")
!59 = !{!60, !65}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !58, file: !57, line: 241, baseType: !61, size: 256, align: 8)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !62, size: 256, align: 8, elements: !63)
!62 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!63 = !{!64}
!64 = !DISubrange(count: 32)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !58, file: !57, line: 242, baseType: !27, size: 64, align: 64)
!66 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!67 = !{!0, !19, !68, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !86, !87, !88, !89, !93, !94, !95, !96, !97, !98, !99}
!68 = distinct !DIGlobalVariable(name: "serial_t", scope: !20, file: !21, line: 38, type: !69, isLocal: false, isDefinition: true)
!69 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!70 = distinct !DIGlobalVariable(name: "cpu_to_gpu_t", scope: !20, file: !21, line: 39, type: !69, isLocal: false, isDefinition: true)
!71 = distinct !DIGlobalVariable(name: "gpu_to_cpu_t", scope: !20, file: !21, line: 40, type: !69, isLocal: false, isDefinition: true)
!72 = distinct !DIGlobalVariable(name: "alloc_t", scope: !20, file: !21, line: 41, type: !69, isLocal: false, isDefinition: true)
!73 = distinct !DIGlobalVariable(name: "kernel_t", scope: !20, file: !21, line: 42, type: !69, isLocal: false, isDefinition: true)
!74 = distinct !DIGlobalVariable(name: "free_t", scope: !20, file: !21, line: 43, type: !69, isLocal: false, isDefinition: true)
!75 = distinct !DIGlobalVariable(name: "time_local_search", scope: !20, file: !21, line: 47, type: !69, isLocal: false, isDefinition: true)
!76 = distinct !DIGlobalVariable(name: "time_speedy", scope: !20, file: !21, line: 48, type: !69, isLocal: false, isDefinition: true)
!77 = distinct !DIGlobalVariable(name: "time_select_feasible", scope: !20, file: !21, line: 49, type: !69, isLocal: false, isDefinition: true)
!78 = distinct !DIGlobalVariable(name: "time_gain", scope: !20, file: !21, line: 50, type: !69, isLocal: false, isDefinition: true)
!79 = distinct !DIGlobalVariable(name: "time_shuffle", scope: !20, file: !21, line: 51, type: !69, isLocal: false, isDefinition: true)
!80 = distinct !DIGlobalVariable(name: "time_gain_dist", scope: !20, file: !21, line: 52, type: !69, isLocal: false, isDefinition: true)
!81 = distinct !DIGlobalVariable(name: "time_gain_init", scope: !20, file: !21, line: 53, type: !69, isLocal: false, isDefinition: true)
!82 = distinct !DIGlobalVariable(name: "totalcost", scope: !83, file: !21, line: 175, type: !25, isLocal: true, isDefinition: true)
!83 = distinct !DISubprogram(name: "pspeedy", linkageName: "_Z7pspeedyP6PointsfPliP17pthread_barrier_t", scope: !21, file: !21, line: 160, type: !84, isLocal: false, isDefinition: true, scopeLine: 161, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!84 = !DISubroutineType(types: !85)
!85 = !{!25, !34, !25, !52, !11, !55}
!86 = distinct !DIGlobalVariable(name: "open", scope: !83, file: !21, line: 177, type: !13, isLocal: true, isDefinition: true)
!87 = distinct !DIGlobalVariable(name: "costs", scope: !83, file: !21, line: 178, type: !24, isLocal: true, isDefinition: true)
!88 = distinct !DIGlobalVariable(name: "i", scope: !83, file: !21, line: 179, type: !11, isLocal: true, isDefinition: true)
!89 = distinct !DIGlobalVariable(name: "k", scope: !90, file: !21, line: 448, type: !27, isLocal: true, isDefinition: true)
!90 = distinct !DISubprogram(name: "pkmedian", linkageName: "_Z8pkmedianP6PointsllPliP17pthread_barrier_t", scope: !21, file: !21, line: 440, type: !91, isLocal: false, isDefinition: true, scopeLine: 442, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!91 = !DISubroutineType(types: !92)
!92 = !{!25, !34, !27, !27, !52, !11, !55}
!93 = distinct !DIGlobalVariable(name: "feasible", scope: !90, file: !21, line: 449, type: !26, isLocal: true, isDefinition: true)
!94 = distinct !DIGlobalVariable(name: "numfeasible", scope: !90, file: !21, line: 450, type: !11, isLocal: true, isDefinition: true)
!95 = distinct !DIGlobalVariable(name: "hizs", scope: !90, file: !21, line: 451, type: !24, isLocal: true, isDefinition: true)
!96 = distinct !DIGlobalVariable(name: "nproc", linkageName: "_ZL5nproc", scope: !20, file: !21, line: 34, type: !11, isLocal: true, isDefinition: true)
!97 = distinct !DIGlobalVariable(name: "is_center", linkageName: "_ZL9is_center", scope: !20, file: !21, line: 32, type: !28, isLocal: true, isDefinition: true)
!98 = distinct !DIGlobalVariable(name: "center_table", linkageName: "_ZL12center_table", scope: !20, file: !21, line: 33, type: !26, isLocal: true, isDefinition: true)
!99 = distinct !DIGlobalVariable(name: "switch_membership", linkageName: "_ZL17switch_membership", scope: !20, file: !21, line: 31, type: !28, isLocal: true, isDefinition: true)
!100 = !{!101, !116, !119, !123, !132, !140, !144, !151, !155, !159, !161, !163, !167, !178, !182, !188, !194, !196, !200, !204, !208, !212, !224, !226, !230, !234, !238, !240, !246, !250, !254, !256, !258, !262, !270, !274, !278, !282, !284, !290, !292, !298, !302, !306, !310, !314, !318, !322, !324, !326, !330, !334, !338, !340, !344, !348, !350, !352, !356, !362, !367, !372, !373, !374, !375, !379, !382, !386, !391, !396, !398, !400, !402, !404, !406, !408, !410, !412, !414, !416, !418, !420, !422, !424, !431, !433, !434, !436, !438, !440, !442, !446, !448, !450, !452, !454, !456, !458, !460, !462, !466, !470, !472, !476, !480, !482, !487, !492, !496, !498, !500, !502, !504, !511, !515, !519, !523, !527, !531, !536, !540, !542, !546, !552, !556, !563, !565, !569, !573, !577, !581, !583, !585, !589, !591, !595, !597, !599, !603, !607, !611, !615, !619, !621, !623, !627, !631, !635, !639, !641, !643, !647, !651, !652, !653, !654, !655, !656, !657}
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !102, line: 64)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !103, line: 106, baseType: !104)
!103 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !103, line: 94, baseType: !105)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !103, line: 82, size: 64, align: 32, elements: !106, identifier: "_ZTS11__mbstate_t")
!106 = !{!107, !108}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !105, file: !103, line: 84, baseType: !11, size: 32, align: 32)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !105, file: !103, line: 93, baseType: !109, size: 32, align: 32, offset: 32)
!109 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !105, file: !103, line: 85, size: 32, align: 32, elements: !110, identifier: "_ZTSN11__mbstate_tUt_E")
!110 = !{!111, !112}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !109, file: !103, line: 88, baseType: !66, size: 32, align: 32)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !109, file: !103, line: 92, baseType: !113, size: 32, align: 8)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !62, size: 32, align: 8, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: 4)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !117, line: 139)
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !118, line: 132, baseType: !66)
!118 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !120, line: 141)
!120 = !DISubprogram(name: "btowc", scope: !103, file: !103, line: 356, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!121 = !DISubroutineType(types: !122)
!122 = !{!117, !11}
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !124, line: 142)
!124 = !DISubprogram(name: "fgetwc", scope: !103, file: !103, line: 748, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!125 = !DISubroutineType(types: !126)
!126 = !{!117, !127}
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !128, size: 64, align: 64)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !129, line: 64, baseType: !130)
!129 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!130 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !131, line: 241, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!131 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !133, line: 143)
!133 = !DISubprogram(name: "fgetws", scope: !103, file: !103, line: 777, type: !134, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DISubroutineType(types: !135)
!135 = !{!136, !138, !11, !139}
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64, align: 64)
!137 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!138 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !136)
!139 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !127)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !141, line: 144)
!141 = !DISubprogram(name: "fputwc", scope: !103, file: !103, line: 762, type: !142, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DISubroutineType(types: !143)
!143 = !{!117, !137, !127}
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !145, line: 145)
!145 = !DISubprogram(name: "fputws", scope: !103, file: !103, line: 784, type: !146, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!146 = !DISubroutineType(types: !147)
!147 = !{!11, !148, !139}
!148 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !149)
!149 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 64, align: 64)
!150 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !137)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !152, line: 146)
!152 = !DISubprogram(name: "fwide", scope: !103, file: !103, line: 590, type: !153, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{!11, !127, !11}
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !156, line: 147)
!156 = !DISubprogram(name: "fwprintf", scope: !103, file: !103, line: 597, type: !157, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DISubroutineType(types: !158)
!158 = !{!11, !139, !148, null}
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !160, line: 148)
!160 = !DISubprogram(name: "fwscanf", scope: !103, file: !103, line: 638, type: !157, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !162, line: 149)
!162 = !DISubprogram(name: "getwc", scope: !103, file: !103, line: 749, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !164, line: 150)
!164 = !DISubprogram(name: "getwchar", scope: !103, file: !103, line: 755, type: !165, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DISubroutineType(types: !166)
!166 = !{!117}
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !168, line: 151)
!168 = !DISubprogram(name: "mbrlen", scope: !103, file: !103, line: 379, type: !169, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DISubroutineType(types: !170)
!170 = !{!171, !173, !171, !176}
!171 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !118, line: 62, baseType: !172)
!172 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!173 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !174)
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64, align: 64)
!175 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !62)
!176 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !177)
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64, align: 64)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !179, line: 152)
!179 = !DISubprogram(name: "mbrtowc", scope: !103, file: !103, line: 368, type: !180, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DISubroutineType(types: !181)
!181 = !{!171, !138, !173, !171, !176}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !183, line: 153)
!183 = !DISubprogram(name: "mbsinit", scope: !103, file: !103, line: 364, type: !184, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DISubroutineType(types: !185)
!185 = !{!11, !186}
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64, align: 64)
!187 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !102)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !189, line: 154)
!189 = !DISubprogram(name: "mbsrtowcs", scope: !103, file: !103, line: 411, type: !190, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DISubroutineType(types: !191)
!191 = !{!171, !138, !192, !171, !176}
!192 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !193)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64, align: 64)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !195, line: 155)
!195 = !DISubprogram(name: "putwc", scope: !103, file: !103, line: 763, type: !142, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !197, line: 156)
!197 = !DISubprogram(name: "putwchar", scope: !103, file: !103, line: 769, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DISubroutineType(types: !199)
!199 = !{!117, !137}
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !201, line: 158)
!201 = !DISubprogram(name: "swprintf", scope: !103, file: !103, line: 607, type: !202, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DISubroutineType(types: !203)
!203 = !{!11, !138, !171, !148, null}
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !205, line: 160)
!205 = !DISubprogram(name: "swscanf", scope: !103, file: !103, line: 648, type: !206, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DISubroutineType(types: !207)
!207 = !{!11, !148, !148, null}
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !209, line: 161)
!209 = !DISubprogram(name: "ungetwc", scope: !103, file: !103, line: 792, type: !210, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DISubroutineType(types: !211)
!211 = !{!117, !117, !127}
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !213, line: 162)
!213 = !DISubprogram(name: "vfwprintf", scope: !103, file: !103, line: 615, type: !214, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DISubroutineType(types: !215)
!215 = !{!11, !139, !148, !216}
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !217, size: 64, align: 64)
!217 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !21, size: 192, align: 64, elements: !218, identifier: "_ZTS13__va_list_tag")
!218 = !{!219, !220, !221, !223}
!219 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !217, file: !21, baseType: !66, size: 32, align: 32)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !217, file: !21, baseType: !66, size: 32, align: 32, offset: 32)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !217, file: !21, baseType: !222, size: 64, align: 64, offset: 64)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!223 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !217, file: !21, baseType: !222, size: 64, align: 64, offset: 128)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !225, line: 164)
!225 = !DISubprogram(name: "vfwscanf", scope: !103, file: !103, line: 692, type: !214, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !227, line: 167)
!227 = !DISubprogram(name: "vswprintf", scope: !103, file: !103, line: 628, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DISubroutineType(types: !229)
!229 = !{!11, !138, !171, !148, !216}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !231, line: 170)
!231 = !DISubprogram(name: "vswscanf", scope: !103, file: !103, line: 704, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DISubroutineType(types: !233)
!233 = !{!11, !148, !148, !216}
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !235, line: 172)
!235 = !DISubprogram(name: "vwprintf", scope: !103, file: !103, line: 623, type: !236, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DISubroutineType(types: !237)
!237 = !{!11, !148, !216}
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !239, line: 174)
!239 = !DISubprogram(name: "vwscanf", scope: !103, file: !103, line: 700, type: !236, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !241, line: 176)
!241 = !DISubprogram(name: "wcrtomb", scope: !103, file: !103, line: 373, type: !242, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DISubroutineType(types: !243)
!243 = !{!171, !244, !137, !176}
!244 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !245)
!245 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64, align: 64)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !247, line: 177)
!247 = !DISubprogram(name: "wcscat", scope: !103, file: !103, line: 157, type: !248, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DISubroutineType(types: !249)
!249 = !{!136, !138, !148}
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !251, line: 178)
!251 = !DISubprogram(name: "wcscmp", scope: !103, file: !103, line: 166, type: !252, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DISubroutineType(types: !253)
!253 = !{!11, !149, !149}
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !255, line: 179)
!255 = !DISubprogram(name: "wcscoll", scope: !103, file: !103, line: 195, type: !252, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !257, line: 180)
!257 = !DISubprogram(name: "wcscpy", scope: !103, file: !103, line: 147, type: !248, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !259, line: 181)
!259 = !DISubprogram(name: "wcscspn", scope: !103, file: !103, line: 255, type: !260, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DISubroutineType(types: !261)
!261 = !{!171, !149, !149}
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !263, line: 182)
!263 = !DISubprogram(name: "wcsftime", scope: !103, file: !103, line: 858, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DISubroutineType(types: !265)
!265 = !{!171, !138, !171, !148, !266}
!266 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !267)
!267 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !268, size: 64, align: 64)
!268 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !269)
!269 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !103, line: 137, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !271, line: 183)
!271 = !DISubprogram(name: "wcslen", scope: !103, file: !103, line: 290, type: !272, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!272 = !DISubroutineType(types: !273)
!273 = !{!171, !149}
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !275, line: 184)
!275 = !DISubprogram(name: "wcsncat", scope: !103, file: !103, line: 161, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!276 = !DISubroutineType(types: !277)
!277 = !{!136, !138, !148, !171}
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !279, line: 185)
!279 = !DISubprogram(name: "wcsncmp", scope: !103, file: !103, line: 169, type: !280, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!280 = !DISubroutineType(types: !281)
!281 = !{!11, !149, !149, !171}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !283, line: 186)
!283 = !DISubprogram(name: "wcsncpy", scope: !103, file: !103, line: 152, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !285, line: 187)
!285 = !DISubprogram(name: "wcsrtombs", scope: !103, file: !103, line: 417, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{!171, !244, !288, !171, !176}
!288 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !289)
!289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !149, size: 64, align: 64)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !291, line: 188)
!291 = !DISubprogram(name: "wcsspn", scope: !103, file: !103, line: 259, type: !260, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !293, line: 189)
!293 = !DISubprogram(name: "wcstod", scope: !103, file: !103, line: 453, type: !294, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DISubroutineType(types: !295)
!295 = !{!69, !148, !296}
!296 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !297)
!297 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64, align: 64)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !299, line: 191)
!299 = !DISubprogram(name: "wcstof", scope: !103, file: !103, line: 460, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DISubroutineType(types: !301)
!301 = !{!25, !148, !296}
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !303, line: 193)
!303 = !DISubprogram(name: "wcstok", scope: !103, file: !103, line: 285, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DISubroutineType(types: !305)
!305 = !{!136, !138, !148, !296}
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !307, line: 194)
!307 = !DISubprogram(name: "wcstol", scope: !103, file: !103, line: 471, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{!27, !148, !296, !11}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !311, line: 195)
!311 = !DISubprogram(name: "wcstoul", scope: !103, file: !103, line: 476, type: !312, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DISubroutineType(types: !313)
!313 = !{!172, !148, !296, !11}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !315, line: 196)
!315 = !DISubprogram(name: "wcsxfrm", scope: !103, file: !103, line: 199, type: !316, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DISubroutineType(types: !317)
!317 = !{!171, !138, !148, !171}
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !319, line: 197)
!319 = !DISubprogram(name: "wctob", scope: !103, file: !103, line: 360, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!320 = !DISubroutineType(types: !321)
!321 = !{!11, !117}
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !323, line: 198)
!323 = !DISubprogram(name: "wmemcmp", scope: !103, file: !103, line: 328, type: !280, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !325, line: 199)
!325 = !DISubprogram(name: "wmemcpy", scope: !103, file: !103, line: 332, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !327, line: 200)
!327 = !DISubprogram(name: "wmemmove", scope: !103, file: !103, line: 337, type: !328, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!328 = !DISubroutineType(types: !329)
!329 = !{!136, !136, !149, !171}
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !331, line: 201)
!331 = !DISubprogram(name: "wmemset", scope: !103, file: !103, line: 341, type: !332, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!332 = !DISubroutineType(types: !333)
!333 = !{!136, !136, !137, !171}
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !335, line: 202)
!335 = !DISubprogram(name: "wprintf", scope: !103, file: !103, line: 604, type: !336, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DISubroutineType(types: !337)
!337 = !{!11, !148, null}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !339, line: 203)
!339 = !DISubprogram(name: "wscanf", scope: !103, file: !103, line: 645, type: !336, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !341, line: 204)
!341 = !DISubprogram(name: "wcschr", scope: !103, file: !103, line: 230, type: !342, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DISubroutineType(types: !343)
!343 = !{!136, !149, !137}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !345, line: 205)
!345 = !DISubprogram(name: "wcspbrk", scope: !103, file: !103, line: 269, type: !346, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!346 = !DISubroutineType(types: !347)
!347 = !{!136, !149, !149}
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !349, line: 206)
!349 = !DISubprogram(name: "wcsrchr", scope: !103, file: !103, line: 240, type: !342, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !351, line: 207)
!351 = !DISubprogram(name: "wcsstr", scope: !103, file: !103, line: 280, type: !346, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !353, line: 208)
!353 = !DISubprogram(name: "wmemchr", scope: !103, file: !103, line: 323, type: !354, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DISubroutineType(types: !355)
!355 = !{!136, !149, !137, !171}
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !358, line: 248)
!357 = !DINamespace(name: "__gnu_cxx", scope: null, file: !2, line: 220)
!358 = !DISubprogram(name: "wcstold", scope: !103, file: !103, line: 462, type: !359, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!359 = !DISubroutineType(types: !360)
!360 = !{!361, !148, !296}
!361 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !363, line: 257)
!363 = !DISubprogram(name: "wcstoll", scope: !103, file: !103, line: 486, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{!366, !148, !296, !11}
!366 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !368, line: 258)
!368 = !DISubprogram(name: "wcstoull", scope: !103, file: !103, line: 493, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{!371, !148, !296, !11}
!371 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !358, line: 264)
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !363, line: 265)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !368, line: 266)
!375 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !376, entity: !378, line: 56)
!376 = !DINamespace(name: "__gnu_debug", scope: null, file: !377, line: 54)
!377 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/debug/debug.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!378 = !DINamespace(name: "__debug", scope: !1, file: !377, line: 48)
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !380, line: 53)
!380 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !381, line: 53, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!381 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !383, line: 54)
!383 = !DISubprogram(name: "setlocale", scope: !381, file: !381, line: 124, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{!245, !11, !174}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !387, line: 55)
!387 = !DISubprogram(name: "localeconv", scope: !381, file: !381, line: 127, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{!390}
!390 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !380, size: 64, align: 64)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !392, line: 64)
!392 = !DISubprogram(name: "isalnum", scope: !393, file: !393, line: 110, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!393 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!394 = !DISubroutineType(types: !395)
!395 = !{!11, !11}
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !397, line: 65)
!397 = !DISubprogram(name: "isalpha", scope: !393, file: !393, line: 111, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !399, line: 66)
!399 = !DISubprogram(name: "iscntrl", scope: !393, file: !393, line: 112, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !401, line: 67)
!401 = !DISubprogram(name: "isdigit", scope: !393, file: !393, line: 113, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !403, line: 68)
!403 = !DISubprogram(name: "isgraph", scope: !393, file: !393, line: 115, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !405, line: 69)
!405 = !DISubprogram(name: "islower", scope: !393, file: !393, line: 114, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !407, line: 70)
!407 = !DISubprogram(name: "isprint", scope: !393, file: !393, line: 116, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !409, line: 71)
!409 = !DISubprogram(name: "ispunct", scope: !393, file: !393, line: 117, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !411, line: 72)
!411 = !DISubprogram(name: "isspace", scope: !393, file: !393, line: 118, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !413, line: 73)
!413 = !DISubprogram(name: "isupper", scope: !393, file: !393, line: 119, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !415, line: 74)
!415 = !DISubprogram(name: "isxdigit", scope: !393, file: !393, line: 120, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !417, line: 75)
!417 = !DISubprogram(name: "tolower", scope: !393, file: !393, line: 124, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !419, line: 76)
!419 = !DISubprogram(name: "toupper", scope: !393, file: !393, line: 127, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !421, line: 44)
!421 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !1, file: !2, line: 196, baseType: !172)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !423, line: 45)
!423 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !1, file: !2, line: 197, baseType: !27)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !425, line: 82)
!425 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !426, line: 186, baseType: !427)
!426 = !DIFile(filename: "/usr/include/wctype.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!427 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !428, size: 64, align: 64)
!428 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !429)
!429 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !430, line: 40, baseType: !11)
!430 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !432, line: 83)
!432 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !426, line: 52, baseType: !172)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !117, line: 84)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !435, line: 86)
!435 = !DISubprogram(name: "iswalnum", scope: !426, file: !426, line: 111, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !437, line: 87)
!437 = !DISubprogram(name: "iswalpha", scope: !426, file: !426, line: 117, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !439, line: 89)
!439 = !DISubprogram(name: "iswblank", scope: !426, file: !426, line: 162, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !441, line: 91)
!441 = !DISubprogram(name: "iswcntrl", scope: !426, file: !426, line: 120, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !443, line: 92)
!443 = !DISubprogram(name: "iswctype", scope: !426, file: !426, line: 175, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!444 = !DISubroutineType(types: !445)
!445 = !{!11, !117, !432}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !447, line: 93)
!447 = !DISubprogram(name: "iswdigit", scope: !426, file: !426, line: 124, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !449, line: 94)
!449 = !DISubprogram(name: "iswgraph", scope: !426, file: !426, line: 128, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !451, line: 95)
!451 = !DISubprogram(name: "iswlower", scope: !426, file: !426, line: 133, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !453, line: 96)
!453 = !DISubprogram(name: "iswprint", scope: !426, file: !426, line: 136, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !455, line: 97)
!455 = !DISubprogram(name: "iswpunct", scope: !426, file: !426, line: 141, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !457, line: 98)
!457 = !DISubprogram(name: "iswspace", scope: !426, file: !426, line: 146, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !459, line: 99)
!459 = !DISubprogram(name: "iswupper", scope: !426, file: !426, line: 151, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !461, line: 100)
!461 = !DISubprogram(name: "iswxdigit", scope: !426, file: !426, line: 156, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !463, line: 101)
!463 = !DISubprogram(name: "towctrans", scope: !426, file: !426, line: 221, type: !464, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!464 = !DISubroutineType(types: !465)
!465 = !{!117, !117, !425}
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !467, line: 102)
!467 = !DISubprogram(name: "towlower", scope: !426, file: !426, line: 194, type: !468, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!468 = !DISubroutineType(types: !469)
!469 = !{!117, !117}
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !471, line: 103)
!471 = !DISubprogram(name: "towupper", scope: !426, file: !426, line: 197, type: !468, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !473, line: 104)
!473 = !DISubprogram(name: "wctrans", scope: !426, file: !426, line: 218, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DISubroutineType(types: !475)
!475 = !{!425, !174}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !477, line: 105)
!477 = !DISubprogram(name: "wctype", scope: !426, file: !426, line: 171, type: !478, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DISubroutineType(types: !479)
!479 = !{!432, !174}
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !481, line: 98)
!481 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !129, line: 48, baseType: !130)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !483, line: 99)
!483 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !129, line: 110, baseType: !484)
!484 = !DIDerivedType(tag: DW_TAG_typedef, name: "_G_fpos_t", file: !485, line: 25, baseType: !486)
!485 = !DIFile(filename: "/usr/include/_G_config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!486 = !DICompositeType(tag: DW_TAG_structure_type, file: !485, line: 21, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !488, line: 101)
!488 = !DISubprogram(name: "clearerr", scope: !129, file: !129, line: 826, type: !489, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!489 = !DISubroutineType(types: !490)
!490 = !{null, !491}
!491 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !481, size: 64, align: 64)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !493, line: 102)
!493 = !DISubprogram(name: "fclose", scope: !129, file: !129, line: 237, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!494 = !DISubroutineType(types: !495)
!495 = !{!11, !491}
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !497, line: 103)
!497 = !DISubprogram(name: "feof", scope: !129, file: !129, line: 828, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !499, line: 104)
!499 = !DISubprogram(name: "ferror", scope: !129, file: !129, line: 830, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !501, line: 105)
!501 = !DISubprogram(name: "fflush", scope: !129, file: !129, line: 242, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !503, line: 106)
!503 = !DISubprogram(name: "fgetc", scope: !129, file: !129, line: 531, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !505, line: 107)
!505 = !DISubprogram(name: "fgetpos", scope: !129, file: !129, line: 798, type: !506, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DISubroutineType(types: !507)
!507 = !{!11, !508, !509}
!508 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !491)
!509 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !510)
!510 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !483, size: 64, align: 64)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !512, line: 108)
!512 = !DISubprogram(name: "fgets", scope: !129, file: !129, line: 622, type: !513, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DISubroutineType(types: !514)
!514 = !{!245, !244, !11, !508}
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !516, line: 109)
!516 = !DISubprogram(name: "fopen", scope: !129, file: !129, line: 272, type: !517, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!517 = !DISubroutineType(types: !518)
!518 = !{!491, !173, !173}
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !520, line: 110)
!520 = !DISubprogram(name: "fprintf", scope: !129, file: !129, line: 356, type: !521, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!521 = !DISubroutineType(types: !522)
!522 = !{!11, !508, !173, null}
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !524, line: 111)
!524 = !DISubprogram(name: "fputc", scope: !129, file: !129, line: 573, type: !525, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!525 = !DISubroutineType(types: !526)
!526 = !{!11, !11, !491}
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !528, line: 112)
!528 = !DISubprogram(name: "fputs", scope: !129, file: !129, line: 689, type: !529, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!529 = !DISubroutineType(types: !530)
!530 = !{!11, !173, !508}
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !532, line: 113)
!532 = !DISubprogram(name: "fread", scope: !129, file: !129, line: 709, type: !533, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!533 = !DISubroutineType(types: !534)
!534 = !{!171, !535, !171, !171, !508}
!535 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !222)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !537, line: 114)
!537 = !DISubprogram(name: "freopen", scope: !129, file: !129, line: 278, type: !538, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DISubroutineType(types: !539)
!539 = !{!491, !173, !173, !508}
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !541, line: 115)
!541 = !DISubprogram(name: "fscanf", scope: !129, file: !129, line: 425, type: !521, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !543, line: 116)
!543 = !DISubprogram(name: "fseek", scope: !129, file: !129, line: 749, type: !544, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DISubroutineType(types: !545)
!545 = !{!11, !491, !27, !11}
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !547, line: 117)
!547 = !DISubprogram(name: "fsetpos", scope: !129, file: !129, line: 803, type: !548, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DISubroutineType(types: !549)
!549 = !{!11, !491, !550}
!550 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !551, size: 64, align: 64)
!551 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !483)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !553, line: 118)
!553 = !DISubprogram(name: "ftell", scope: !129, file: !129, line: 754, type: !554, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!554 = !DISubroutineType(types: !555)
!555 = !{!27, !491}
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !557, line: 119)
!557 = !DISubprogram(name: "fwrite", scope: !129, file: !129, line: 715, type: !558, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!558 = !DISubroutineType(types: !559)
!559 = !{!171, !560, !171, !171, !508}
!560 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !561)
!561 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !562, size: 64, align: 64)
!562 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !564, line: 120)
!564 = !DISubprogram(name: "getc", scope: !129, file: !129, line: 532, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !566, line: 121)
!566 = !DISubprogram(name: "getchar", scope: !129, file: !129, line: 538, type: !567, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DISubroutineType(types: !568)
!568 = !{!11}
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !570, line: 124)
!570 = !DISubprogram(name: "gets", scope: !129, file: !129, line: 638, type: !571, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DISubroutineType(types: !572)
!572 = !{!245, !245}
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !574, line: 126)
!574 = !DISubprogram(name: "perror", scope: !129, file: !129, line: 846, type: !575, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!575 = !DISubroutineType(types: !576)
!576 = !{null, !174}
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !578, line: 127)
!578 = !DISubprogram(name: "printf", scope: !129, file: !129, line: 362, type: !579, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!579 = !DISubroutineType(types: !580)
!580 = !{!11, !173, null}
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !582, line: 128)
!582 = !DISubprogram(name: "putc", scope: !129, file: !129, line: 574, type: !525, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !584, line: 129)
!584 = !DISubprogram(name: "putchar", scope: !129, file: !129, line: 580, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !586, line: 130)
!586 = !DISubprogram(name: "puts", scope: !129, file: !129, line: 695, type: !587, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!587 = !DISubroutineType(types: !588)
!588 = !{!11, !174}
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !590, line: 131)
!590 = !DISubprogram(name: "remove", scope: !129, file: !129, line: 178, type: !587, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !592, line: 132)
!592 = !DISubprogram(name: "rename", scope: !129, file: !129, line: 180, type: !593, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!593 = !DISubroutineType(types: !594)
!594 = !{!11, !174, !174}
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !596, line: 133)
!596 = !DISubprogram(name: "rewind", scope: !129, file: !129, line: 759, type: !489, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !598, line: 134)
!598 = !DISubprogram(name: "scanf", scope: !129, file: !129, line: 431, type: !579, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !600, line: 135)
!600 = !DISubprogram(name: "setbuf", scope: !129, file: !129, line: 332, type: !601, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!601 = !DISubroutineType(types: !602)
!602 = !{null, !508, !244}
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !604, line: 136)
!604 = !DISubprogram(name: "setvbuf", scope: !129, file: !129, line: 336, type: !605, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!605 = !DISubroutineType(types: !606)
!606 = !{!11, !508, !244, !11, !171}
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !608, line: 137)
!608 = !DISubprogram(name: "sprintf", scope: !129, file: !129, line: 364, type: !609, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!609 = !DISubroutineType(types: !610)
!610 = !{!11, !244, !173, null}
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !612, line: 138)
!612 = !DISubprogram(name: "sscanf", scope: !129, file: !129, line: 433, type: !613, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!613 = !DISubroutineType(types: !614)
!614 = !{!11, !173, !173, null}
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !616, line: 139)
!616 = !DISubprogram(name: "tmpfile", scope: !129, file: !129, line: 195, type: !617, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!617 = !DISubroutineType(types: !618)
!618 = !{!491}
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !620, line: 141)
!620 = !DISubprogram(name: "tmpnam", scope: !129, file: !129, line: 209, type: !571, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !622, line: 143)
!622 = !DISubprogram(name: "ungetc", scope: !129, file: !129, line: 702, type: !525, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !624, line: 144)
!624 = !DISubprogram(name: "vfprintf", scope: !129, file: !129, line: 371, type: !625, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!625 = !DISubroutineType(types: !626)
!626 = !{!11, !508, !173, !216}
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !628, line: 145)
!628 = !DISubprogram(name: "vprintf", scope: !129, file: !129, line: 377, type: !629, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!629 = !DISubroutineType(types: !630)
!630 = !{!11, !173, !216}
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !632, line: 146)
!632 = !DISubprogram(name: "vsprintf", scope: !129, file: !129, line: 379, type: !633, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!633 = !DISubroutineType(types: !634)
!634 = !{!11, !244, !173, !216}
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !636, line: 175)
!636 = !DISubprogram(name: "snprintf", scope: !129, file: !129, line: 386, type: !637, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!637 = !DISubroutineType(types: !638)
!638 = !{!11, !244, !171, !173, null}
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !640, line: 176)
!640 = !DISubprogram(name: "vfscanf", scope: !129, file: !129, line: 471, type: !625, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !642, line: 177)
!642 = !DISubprogram(name: "vscanf", scope: !129, file: !129, line: 479, type: !629, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !644, line: 178)
!644 = !DISubprogram(name: "vsnprintf", scope: !129, file: !129, line: 390, type: !645, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!645 = !DISubroutineType(types: !646)
!646 = !{!11, !244, !171, !173, !216}
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !357, entity: !648, line: 179)
!648 = !DISubprogram(name: "vsscanf", scope: !129, file: !129, line: 483, type: !649, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!649 = !DISubroutineType(types: !650)
!650 = !{!11, !173, !173, !216}
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !636, line: 185)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !640, line: 186)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !642, line: 187)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !644, line: 188)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !648, line: 189)
!656 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !20, entity: !1, line: 35)
!657 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !20, entity: !1, line: 18)
!658 = !{i32 2, !"Dwarf Version", i32 4}
!659 = !{i32 2, !"Debug Info Version", i32 3}
!660 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!661 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !3, file: !3, line: 74, type: !662, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!662 = !DISubroutineType(types: !663)
!663 = !{null}
!664 = !DILocation(line: 74, column: 25, scope: !661)
!665 = !DILocation(line: 74, column: 25, scope: !666)
!666 = !DILexicalBlockFile(scope: !661, file: !3, discriminator: 1)
!667 = distinct !DISubprogram(name: "inttofile", linkageName: "_Z9inttofileiPc", scope: !21, file: !21, line: 56, type: !668, isLocal: false, isDefinition: true, scopeLine: 56, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!668 = !DISubroutineType(types: !669)
!669 = !{null, !11, !245}
!670 = !DILocalVariable(name: "data", arg: 1, scope: !667, file: !21, line: 56, type: !11)
!671 = !DIExpression()
!672 = !DILocation(line: 56, column: 20, scope: !667)
!673 = !DILocalVariable(name: "filename", arg: 2, scope: !667, file: !21, line: 56, type: !245)
!674 = !DILocation(line: 56, column: 32, scope: !667)
!675 = !DILocalVariable(name: "fp", scope: !667, file: !21, line: 57, type: !491)
!676 = !DILocation(line: 57, column: 8, scope: !667)
!677 = !DILocation(line: 57, column: 19, scope: !667)
!678 = !DILocation(line: 57, column: 13, scope: !667)
!679 = !DILocation(line: 58, column: 10, scope: !667)
!680 = !DILocation(line: 58, column: 21, scope: !667)
!681 = !DILocation(line: 58, column: 2, scope: !667)
!682 = !DILocation(line: 59, column: 9, scope: !667)
!683 = !DILocation(line: 59, column: 2, scope: !667)
!684 = !DILocation(line: 60, column: 1, scope: !667)
!685 = distinct !DISubprogram(name: "gettime", linkageName: "_Z7gettimev", scope: !21, file: !21, line: 62, type: !686, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!686 = !DISubroutineType(types: !687)
!687 = !{!69}
!688 = !DILocalVariable(name: "t", scope: !685, file: !21, line: 63, type: !689)
!689 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !690, line: 30, size: 128, align: 64, elements: !691, identifier: "_ZTS7timeval")
!690 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!691 = !{!692, !694}
!692 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !689, file: !690, line: 32, baseType: !693, size: 64, align: 64)
!693 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !430, line: 139, baseType: !27)
!694 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !689, file: !690, line: 33, baseType: !695, size: 64, align: 64, offset: 64)
!695 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !430, line: 141, baseType: !27)
!696 = !DILocation(line: 63, column: 18, scope: !685)
!697 = !DILocation(line: 64, column: 3, scope: !685)
!698 = !DILocation(line: 65, column: 12, scope: !685)
!699 = !DILocation(line: 65, column: 10, scope: !685)
!700 = !DILocation(line: 65, column: 21, scope: !685)
!701 = !DILocation(line: 65, column: 19, scope: !685)
!702 = !DILocation(line: 65, column: 28, scope: !685)
!703 = !DILocation(line: 65, column: 18, scope: !685)
!704 = !DILocation(line: 65, column: 3, scope: !685)
!705 = distinct !DISubprogram(name: "isIdentical", linkageName: "_Z11isIdenticalPfS_i", scope: !21, file: !21, line: 68, type: !706, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!706 = !DISubroutineType(types: !707)
!707 = !{!11, !24, !24, !11}
!708 = !DILocalVariable(name: "i", arg: 1, scope: !705, file: !21, line: 68, type: !24)
!709 = !DILocation(line: 68, column: 24, scope: !705)
!710 = !DILocalVariable(name: "j", arg: 2, scope: !705, file: !21, line: 68, type: !24)
!711 = !DILocation(line: 68, column: 34, scope: !705)
!712 = !DILocalVariable(name: "D", arg: 3, scope: !705, file: !21, line: 68, type: !11)
!713 = !DILocation(line: 68, column: 41, scope: !705)
!714 = !DILocalVariable(name: "a", scope: !705, file: !21, line: 71, type: !11)
!715 = !DILocation(line: 71, column: 7, scope: !705)
!716 = !DILocalVariable(name: "equal", scope: !705, file: !21, line: 72, type: !11)
!717 = !DILocation(line: 72, column: 7, scope: !705)
!718 = !DILocation(line: 74, column: 3, scope: !705)
!719 = !DILocation(line: 74, column: 10, scope: !720)
!720 = !DILexicalBlockFile(scope: !705, file: !21, discriminator: 1)
!721 = !DILocation(line: 74, column: 16, scope: !720)
!722 = !DILocation(line: 74, column: 19, scope: !723)
!723 = !DILexicalBlockFile(scope: !705, file: !21, discriminator: 2)
!724 = !DILocation(line: 74, column: 23, scope: !723)
!725 = !DILocation(line: 74, column: 21, scope: !723)
!726 = !DILocation(line: 74, column: 3, scope: !727)
!727 = !DILexicalBlockFile(scope: !705, file: !21, discriminator: 3)
!728 = !DILocation(line: 75, column: 9, scope: !729)
!729 = distinct !DILexicalBlock(scope: !730, file: !21, line: 75, column: 9)
!730 = distinct !DILexicalBlock(scope: !705, file: !21, line: 74, column: 26)
!731 = !DILocation(line: 75, column: 11, scope: !729)
!732 = !DILocation(line: 75, column: 17, scope: !729)
!733 = !DILocation(line: 75, column: 19, scope: !729)
!734 = !DILocation(line: 75, column: 14, scope: !729)
!735 = !DILocation(line: 75, column: 9, scope: !730)
!736 = !DILocation(line: 75, column: 29, scope: !737)
!737 = !DILexicalBlockFile(scope: !729, file: !21, discriminator: 1)
!738 = !DILocation(line: 75, column: 23, scope: !737)
!739 = !DILocation(line: 76, column: 11, scope: !729)
!740 = !DILocation(line: 74, column: 3, scope: !741)
!741 = !DILexicalBlockFile(scope: !705, file: !21, discriminator: 4)
!742 = distinct !{!742, !718}
!743 = !DILocation(line: 78, column: 7, scope: !744)
!744 = distinct !DILexicalBlock(scope: !705, file: !21, line: 78, column: 7)
!745 = !DILocation(line: 78, column: 7, scope: !705)
!746 = !DILocation(line: 78, column: 14, scope: !747)
!747 = !DILexicalBlockFile(scope: !744, file: !21, discriminator: 1)
!748 = !DILocation(line: 79, column: 8, scope: !744)
!749 = !DILocation(line: 81, column: 1, scope: !705)
!750 = distinct !DISubprogram(name: "shuffle", linkageName: "_Z7shuffleP6Points", scope: !21, file: !21, line: 95, type: !751, isLocal: false, isDefinition: true, scopeLine: 96, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!751 = !DISubroutineType(types: !752)
!752 = !{null, !34}
!753 = !DILocalVariable(name: "points", arg: 1, scope: !750, file: !21, line: 95, type: !34)
!754 = !DILocation(line: 95, column: 22, scope: !750)
!755 = !DILocalVariable(name: "t1", scope: !750, file: !21, line: 98, type: !69)
!756 = !DILocation(line: 98, column: 10, scope: !750)
!757 = !DILocation(line: 98, column: 15, scope: !750)
!758 = !DILocalVariable(name: "i", scope: !750, file: !21, line: 100, type: !27)
!759 = !DILocation(line: 100, column: 8, scope: !750)
!760 = !DILocalVariable(name: "j", scope: !750, file: !21, line: 100, type: !27)
!761 = !DILocation(line: 100, column: 11, scope: !750)
!762 = !DILocalVariable(name: "temp", scope: !750, file: !21, line: 101, type: !42)
!763 = !DILocation(line: 101, column: 9, scope: !750)
!764 = !DILocation(line: 102, column: 9, scope: !765)
!765 = distinct !DILexicalBlock(scope: !750, file: !21, line: 102, column: 3)
!766 = !DILocation(line: 102, column: 8, scope: !765)
!767 = !DILocation(line: 102, column: 12, scope: !768)
!768 = !DILexicalBlockFile(scope: !769, file: !21, discriminator: 1)
!769 = distinct !DILexicalBlock(scope: !765, file: !21, line: 102, column: 3)
!770 = !DILocation(line: 102, column: 14, scope: !768)
!771 = !DILocation(line: 102, column: 22, scope: !768)
!772 = !DILocation(line: 102, column: 25, scope: !768)
!773 = !DILocation(line: 102, column: 13, scope: !768)
!774 = !DILocation(line: 102, column: 3, scope: !768)
!775 = !DILocation(line: 103, column: 8, scope: !776)
!776 = distinct !DILexicalBlock(scope: !769, file: !21, line: 102, column: 33)
!777 = !DILocation(line: 103, column: 19, scope: !776)
!778 = !DILocation(line: 103, column: 27, scope: !776)
!779 = !DILocation(line: 103, column: 33, scope: !776)
!780 = !DILocation(line: 103, column: 31, scope: !776)
!781 = !DILocation(line: 103, column: 17, scope: !776)
!782 = !DILocation(line: 103, column: 39, scope: !776)
!783 = !DILocation(line: 103, column: 37, scope: !776)
!784 = !DILocation(line: 103, column: 6, scope: !776)
!785 = !DILocation(line: 104, column: 12, scope: !776)
!786 = !DILocation(line: 104, column: 20, scope: !776)
!787 = !DILocation(line: 104, column: 22, scope: !776)
!788 = !DILocation(line: 104, column: 10, scope: !776)
!789 = !DILocation(line: 105, column: 20, scope: !776)
!790 = !DILocation(line: 105, column: 28, scope: !776)
!791 = !DILocation(line: 105, column: 30, scope: !776)
!792 = !DILocation(line: 105, column: 5, scope: !776)
!793 = !DILocation(line: 105, column: 13, scope: !776)
!794 = !DILocation(line: 105, column: 15, scope: !776)
!795 = !DILocation(line: 105, column: 18, scope: !776)
!796 = !DILocation(line: 106, column: 5, scope: !776)
!797 = !DILocation(line: 106, column: 13, scope: !776)
!798 = !DILocation(line: 106, column: 15, scope: !776)
!799 = !DILocation(line: 106, column: 18, scope: !776)
!800 = !DILocation(line: 107, column: 3, scope: !776)
!801 = !DILocation(line: 102, column: 29, scope: !802)
!802 = !DILexicalBlockFile(scope: !769, file: !21, discriminator: 2)
!803 = !DILocation(line: 102, column: 3, scope: !802)
!804 = distinct !{!804, !805}
!805 = !DILocation(line: 102, column: 3, scope: !750)
!806 = !DILocalVariable(name: "t2", scope: !750, file: !21, line: 109, type: !69)
!807 = !DILocation(line: 109, column: 10, scope: !750)
!808 = !DILocation(line: 109, column: 15, scope: !750)
!809 = !DILocation(line: 110, column: 19, scope: !750)
!810 = !DILocation(line: 110, column: 22, scope: !750)
!811 = !DILocation(line: 110, column: 21, scope: !750)
!812 = !DILocation(line: 110, column: 16, scope: !750)
!813 = !DILocation(line: 112, column: 1, scope: !750)
!814 = distinct !DISubprogram(name: "intshuffle", linkageName: "_Z10intshufflePii", scope: !21, file: !21, line: 115, type: !815, isLocal: false, isDefinition: true, scopeLine: 116, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!815 = !DISubroutineType(types: !816)
!816 = !{null, !26, !11}
!817 = !DILocalVariable(name: "intarray", arg: 1, scope: !814, file: !21, line: 115, type: !26)
!818 = !DILocation(line: 115, column: 22, scope: !814)
!819 = !DILocalVariable(name: "length", arg: 2, scope: !814, file: !21, line: 115, type: !11)
!820 = !DILocation(line: 115, column: 36, scope: !814)
!821 = !DILocalVariable(name: "t1", scope: !814, file: !21, line: 118, type: !69)
!822 = !DILocation(line: 118, column: 10, scope: !814)
!823 = !DILocation(line: 118, column: 15, scope: !814)
!824 = !DILocalVariable(name: "i", scope: !814, file: !21, line: 120, type: !27)
!825 = !DILocation(line: 120, column: 8, scope: !814)
!826 = !DILocalVariable(name: "j", scope: !814, file: !21, line: 120, type: !27)
!827 = !DILocation(line: 120, column: 11, scope: !814)
!828 = !DILocalVariable(name: "temp", scope: !814, file: !21, line: 121, type: !11)
!829 = !DILocation(line: 121, column: 7, scope: !814)
!830 = !DILocation(line: 122, column: 9, scope: !831)
!831 = distinct !DILexicalBlock(scope: !814, file: !21, line: 122, column: 3)
!832 = !DILocation(line: 122, column: 8, scope: !831)
!833 = !DILocation(line: 122, column: 12, scope: !834)
!834 = !DILexicalBlockFile(scope: !835, file: !21, discriminator: 1)
!835 = distinct !DILexicalBlock(scope: !831, file: !21, line: 122, column: 3)
!836 = !DILocation(line: 122, column: 14, scope: !834)
!837 = !DILocation(line: 122, column: 13, scope: !834)
!838 = !DILocation(line: 122, column: 3, scope: !834)
!839 = !DILocation(line: 123, column: 8, scope: !840)
!840 = distinct !DILexicalBlock(scope: !835, file: !21, line: 122, column: 26)
!841 = !DILocation(line: 123, column: 19, scope: !840)
!842 = !DILocation(line: 123, column: 28, scope: !840)
!843 = !DILocation(line: 123, column: 26, scope: !840)
!844 = !DILocation(line: 123, column: 17, scope: !840)
!845 = !DILocation(line: 123, column: 32, scope: !840)
!846 = !DILocation(line: 123, column: 31, scope: !840)
!847 = !DILocation(line: 123, column: 6, scope: !840)
!848 = !DILocation(line: 124, column: 12, scope: !840)
!849 = !DILocation(line: 124, column: 21, scope: !840)
!850 = !DILocation(line: 124, column: 10, scope: !840)
!851 = !DILocation(line: 125, column: 17, scope: !840)
!852 = !DILocation(line: 125, column: 26, scope: !840)
!853 = !DILocation(line: 125, column: 5, scope: !840)
!854 = !DILocation(line: 125, column: 14, scope: !840)
!855 = !DILocation(line: 125, column: 16, scope: !840)
!856 = !DILocation(line: 126, column: 17, scope: !840)
!857 = !DILocation(line: 126, column: 5, scope: !840)
!858 = !DILocation(line: 126, column: 14, scope: !840)
!859 = !DILocation(line: 126, column: 16, scope: !840)
!860 = !DILocation(line: 127, column: 3, scope: !840)
!861 = !DILocation(line: 122, column: 22, scope: !862)
!862 = !DILexicalBlockFile(scope: !835, file: !21, discriminator: 2)
!863 = !DILocation(line: 122, column: 3, scope: !862)
!864 = distinct !{!864, !865}
!865 = !DILocation(line: 122, column: 3, scope: !814)
!866 = !DILocalVariable(name: "t2", scope: !814, file: !21, line: 129, type: !69)
!867 = !DILocation(line: 129, column: 10, scope: !814)
!868 = !DILocation(line: 129, column: 15, scope: !814)
!869 = !DILocation(line: 130, column: 19, scope: !814)
!870 = !DILocation(line: 130, column: 22, scope: !814)
!871 = !DILocation(line: 130, column: 21, scope: !814)
!872 = !DILocation(line: 130, column: 16, scope: !814)
!873 = !DILocation(line: 132, column: 1, scope: !814)
!874 = distinct !DISubprogram(name: "dist", linkageName: "_Z4dist5PointS_i", scope: !21, file: !21, line: 145, type: !875, isLocal: false, isDefinition: true, scopeLine: 146, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!875 = !DISubroutineType(types: !876)
!876 = !{!25, !42, !42, !11}
!877 = !DILocalVariable(name: "p1", arg: 1, scope: !874, file: !21, line: 145, type: !42)
!878 = !DILocation(line: 145, column: 18, scope: !874)
!879 = !DILocalVariable(name: "p2", arg: 2, scope: !874, file: !21, line: 145, type: !42)
!880 = !DILocation(line: 145, column: 28, scope: !874)
!881 = !DILocalVariable(name: "dim", arg: 3, scope: !874, file: !21, line: 145, type: !11)
!882 = !DILocation(line: 145, column: 36, scope: !874)
!883 = !DILocalVariable(name: "i", scope: !874, file: !21, line: 147, type: !11)
!884 = !DILocation(line: 147, column: 7, scope: !874)
!885 = !DILocalVariable(name: "result", scope: !874, file: !21, line: 148, type: !25)
!886 = !DILocation(line: 148, column: 9, scope: !874)
!887 = !DILocation(line: 149, column: 9, scope: !888)
!888 = distinct !DILexicalBlock(scope: !874, file: !21, line: 149, column: 3)
!889 = !DILocation(line: 149, column: 8, scope: !888)
!890 = !DILocation(line: 149, column: 12, scope: !891)
!891 = !DILexicalBlockFile(scope: !892, file: !21, discriminator: 1)
!892 = distinct !DILexicalBlock(scope: !888, file: !21, line: 149, column: 3)
!893 = !DILocation(line: 149, column: 14, scope: !891)
!894 = !DILocation(line: 149, column: 13, scope: !891)
!895 = !DILocation(line: 149, column: 3, scope: !891)
!896 = !DILocation(line: 150, column: 19, scope: !892)
!897 = !DILocation(line: 150, column: 25, scope: !892)
!898 = !DILocation(line: 150, column: 16, scope: !892)
!899 = !DILocation(line: 150, column: 33, scope: !892)
!900 = !DILocation(line: 150, column: 39, scope: !892)
!901 = !DILocation(line: 150, column: 30, scope: !892)
!902 = !DILocation(line: 150, column: 28, scope: !892)
!903 = !DILocation(line: 150, column: 47, scope: !892)
!904 = !DILocation(line: 150, column: 53, scope: !892)
!905 = !DILocation(line: 150, column: 44, scope: !892)
!906 = !DILocation(line: 150, column: 61, scope: !892)
!907 = !DILocation(line: 150, column: 67, scope: !892)
!908 = !DILocation(line: 150, column: 58, scope: !892)
!909 = !DILocation(line: 150, column: 56, scope: !892)
!910 = !DILocation(line: 150, column: 42, scope: !892)
!911 = !DILocation(line: 150, column: 12, scope: !892)
!912 = !DILocation(line: 150, column: 5, scope: !892)
!913 = !DILocation(line: 149, column: 19, scope: !914)
!914 = !DILexicalBlockFile(scope: !892, file: !21, discriminator: 2)
!915 = !DILocation(line: 149, column: 3, scope: !914)
!916 = distinct !{!916, !917}
!917 = !DILocation(line: 149, column: 3, scope: !874)
!918 = !DILocation(line: 156, column: 10, scope: !874)
!919 = !DILocation(line: 156, column: 3, scope: !874)
!920 = !DILocalVariable(name: "points", arg: 1, scope: !83, file: !21, line: 160, type: !34)
!921 = !DILocation(line: 160, column: 23, scope: !83)
!922 = !DILocalVariable(name: "z", arg: 2, scope: !83, file: !21, line: 160, type: !25)
!923 = !DILocation(line: 160, column: 37, scope: !83)
!924 = !DILocalVariable(name: "kcenter", arg: 3, scope: !83, file: !21, line: 160, type: !52)
!925 = !DILocation(line: 160, column: 46, scope: !83)
!926 = !DILocalVariable(name: "pid", arg: 4, scope: !83, file: !21, line: 160, type: !11)
!927 = !DILocation(line: 160, column: 59, scope: !83)
!928 = !DILocalVariable(name: "barrier", arg: 5, scope: !83, file: !21, line: 160, type: !55)
!929 = !DILocation(line: 160, column: 83, scope: !83)
!930 = !DILocalVariable(name: "t1", scope: !83, file: !21, line: 163, type: !69)
!931 = !DILocation(line: 163, column: 10, scope: !83)
!932 = !DILocation(line: 163, column: 15, scope: !83)
!933 = !DILocalVariable(name: "bsize", scope: !83, file: !21, line: 170, type: !27)
!934 = !DILocation(line: 170, column: 8, scope: !83)
!935 = !DILocation(line: 170, column: 16, scope: !83)
!936 = !DILocation(line: 170, column: 24, scope: !83)
!937 = !DILocation(line: 170, column: 28, scope: !83)
!938 = !DILocation(line: 170, column: 27, scope: !83)
!939 = !DILocalVariable(name: "k1", scope: !83, file: !21, line: 171, type: !27)
!940 = !DILocation(line: 171, column: 8, scope: !83)
!941 = !DILocation(line: 171, column: 13, scope: !83)
!942 = !DILocation(line: 171, column: 21, scope: !83)
!943 = !DILocation(line: 171, column: 19, scope: !83)
!944 = !DILocalVariable(name: "k2", scope: !83, file: !21, line: 172, type: !27)
!945 = !DILocation(line: 172, column: 8, scope: !83)
!946 = !DILocation(line: 172, column: 13, scope: !83)
!947 = !DILocation(line: 172, column: 18, scope: !83)
!948 = !DILocation(line: 172, column: 16, scope: !83)
!949 = !DILocation(line: 173, column: 7, scope: !950)
!950 = distinct !DILexicalBlock(scope: !83, file: !21, line: 173, column: 7)
!951 = !DILocation(line: 173, column: 14, scope: !950)
!952 = !DILocation(line: 173, column: 19, scope: !950)
!953 = !DILocation(line: 173, column: 11, scope: !950)
!954 = !DILocation(line: 173, column: 7, scope: !83)
!955 = !DILocation(line: 173, column: 29, scope: !956)
!956 = !DILexicalBlockFile(scope: !950, file: !21, discriminator: 1)
!957 = !DILocation(line: 173, column: 37, scope: !956)
!958 = !DILocation(line: 173, column: 27, scope: !956)
!959 = !DILocation(line: 173, column: 24, scope: !956)
!960 = !DILocalVariable(name: "k", scope: !961, file: !21, line: 193, type: !11)
!961 = distinct !DILexicalBlock(scope: !83, file: !21, line: 193, column: 3)
!962 = !DILocation(line: 193, column: 12, scope: !961)
!963 = !DILocation(line: 193, column: 16, scope: !961)
!964 = !DILocation(line: 193, column: 8, scope: !961)
!965 = !DILocation(line: 193, column: 20, scope: !966)
!966 = !DILexicalBlockFile(scope: !967, file: !21, discriminator: 1)
!967 = distinct !DILexicalBlock(scope: !961, file: !21, line: 193, column: 3)
!968 = !DILocation(line: 193, column: 24, scope: !966)
!969 = !DILocation(line: 193, column: 22, scope: !966)
!970 = !DILocation(line: 193, column: 3, scope: !966)
!971 = !DILocalVariable(name: "distance", scope: !972, file: !21, line: 194, type: !25)
!972 = distinct !DILexicalBlock(scope: !967, file: !21, line: 193, column: 37)
!973 = !DILocation(line: 194, column: 11, scope: !972)
!974 = !DILocation(line: 194, column: 27, scope: !972)
!975 = !DILocation(line: 194, column: 35, scope: !972)
!976 = !DILocation(line: 194, column: 37, scope: !972)
!977 = !DILocation(line: 194, column: 40, scope: !972)
!978 = !DILocation(line: 194, column: 48, scope: !972)
!979 = !DILocation(line: 194, column: 53, scope: !972)
!980 = !DILocation(line: 194, column: 61, scope: !972)
!981 = !DILocation(line: 194, column: 22, scope: !972)
!982 = !DILocation(line: 195, column: 25, scope: !972)
!983 = !DILocation(line: 195, column: 36, scope: !972)
!984 = !DILocation(line: 195, column: 44, scope: !972)
!985 = !DILocation(line: 195, column: 46, scope: !972)
!986 = !DILocation(line: 195, column: 49, scope: !972)
!987 = !DILocation(line: 195, column: 34, scope: !972)
!988 = !DILocation(line: 195, column: 5, scope: !972)
!989 = !DILocation(line: 195, column: 13, scope: !972)
!990 = !DILocation(line: 195, column: 15, scope: !972)
!991 = !DILocation(line: 195, column: 18, scope: !972)
!992 = !DILocation(line: 195, column: 23, scope: !972)
!993 = !DILocation(line: 196, column: 5, scope: !972)
!994 = !DILocation(line: 196, column: 13, scope: !972)
!995 = !DILocation(line: 196, column: 15, scope: !972)
!996 = !DILocation(line: 196, column: 18, scope: !972)
!997 = !DILocation(line: 196, column: 24, scope: !972)
!998 = !DILocation(line: 197, column: 3, scope: !972)
!999 = !DILocation(line: 193, column: 29, scope: !1000)
!1000 = !DILexicalBlockFile(scope: !967, file: !21, discriminator: 2)
!1001 = !DILocation(line: 193, column: 3, scope: !1000)
!1002 = distinct !{!1002, !1003}
!1003 = !DILocation(line: 193, column: 3, scope: !83)
!1004 = !DILocation(line: 199, column: 7, scope: !1005)
!1005 = distinct !DILexicalBlock(scope: !83, file: !21, line: 199, column: 7)
!1006 = !DILocation(line: 199, column: 10, scope: !1005)
!1007 = !DILocation(line: 199, column: 7, scope: !83)
!1008 = !DILocation(line: 200, column: 6, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !1005, file: !21, line: 199, column: 18)
!1010 = !DILocation(line: 200, column: 14, scope: !1009)
!1011 = !DILocation(line: 201, column: 42, scope: !1009)
!1012 = !DILocation(line: 201, column: 41, scope: !1009)
!1013 = !DILocation(line: 201, column: 21, scope: !1009)
!1014 = !DILocation(line: 201, column: 13, scope: !1009)
!1015 = !DILocation(line: 201, column: 11, scope: !1009)
!1016 = !DILocation(line: 202, column: 3, scope: !1009)
!1017 = !DILocation(line: 204, column: 7, scope: !1018)
!1018 = distinct !DILexicalBlock(scope: !83, file: !21, line: 204, column: 7)
!1019 = !DILocation(line: 204, column: 11, scope: !1018)
!1020 = !DILocation(line: 204, column: 7, scope: !83)
!1021 = !DILocation(line: 205, column: 5, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1018, file: !21, line: 204, column: 18)
!1023 = !DILocation(line: 211, column: 11, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1025, file: !21, line: 211, column: 11)
!1025 = distinct !DILexicalBlock(scope: !1022, file: !21, line: 205, column: 14)
!1026 = !DILocation(line: 211, column: 16, scope: !1024)
!1027 = !DILocation(line: 211, column: 24, scope: !1024)
!1028 = !DILocation(line: 211, column: 13, scope: !1024)
!1029 = !DILocation(line: 211, column: 11, scope: !1025)
!1030 = !DILocation(line: 211, column: 30, scope: !1031)
!1031 = !DILexicalBlockFile(scope: !1024, file: !21, discriminator: 1)
!1032 = !DILocalVariable(name: "k", scope: !1033, file: !21, line: 212, type: !11)
!1033 = distinct !DILexicalBlock(scope: !1025, file: !21, line: 212, column: 7)
!1034 = !DILocation(line: 212, column: 16, scope: !1033)
!1035 = !DILocation(line: 212, column: 20, scope: !1033)
!1036 = !DILocation(line: 212, column: 12, scope: !1033)
!1037 = !DILocation(line: 212, column: 24, scope: !1038)
!1038 = !DILexicalBlockFile(scope: !1039, file: !21, discriminator: 1)
!1039 = distinct !DILexicalBlock(scope: !1033, file: !21, line: 212, column: 7)
!1040 = !DILocation(line: 212, column: 28, scope: !1038)
!1041 = !DILocation(line: 212, column: 26, scope: !1038)
!1042 = !DILocation(line: 212, column: 7, scope: !1038)
!1043 = !DILocalVariable(name: "distance", scope: !1044, file: !21, line: 214, type: !25)
!1044 = distinct !DILexicalBlock(scope: !1039, file: !21, line: 213, column: 2)
!1045 = !DILocation(line: 214, column: 10, scope: !1044)
!1046 = !DILocation(line: 214, column: 26, scope: !1044)
!1047 = !DILocation(line: 214, column: 34, scope: !1044)
!1048 = !DILocation(line: 214, column: 36, scope: !1044)
!1049 = !DILocation(line: 214, column: 39, scope: !1044)
!1050 = !DILocation(line: 214, column: 47, scope: !1044)
!1051 = !DILocation(line: 214, column: 49, scope: !1044)
!1052 = !DILocation(line: 214, column: 52, scope: !1044)
!1053 = !DILocation(line: 214, column: 60, scope: !1044)
!1054 = !DILocation(line: 214, column: 21, scope: !1044)
!1055 = !DILocation(line: 215, column: 8, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1044, file: !21, line: 215, column: 8)
!1057 = !DILocation(line: 215, column: 17, scope: !1056)
!1058 = !DILocation(line: 215, column: 25, scope: !1056)
!1059 = !DILocation(line: 215, column: 27, scope: !1056)
!1060 = !DILocation(line: 215, column: 30, scope: !1056)
!1061 = !DILocation(line: 215, column: 16, scope: !1056)
!1062 = !DILocation(line: 215, column: 39, scope: !1056)
!1063 = !DILocation(line: 215, column: 47, scope: !1056)
!1064 = !DILocation(line: 215, column: 49, scope: !1056)
!1065 = !DILocation(line: 215, column: 52, scope: !1056)
!1066 = !DILocation(line: 215, column: 37, scope: !1056)
!1067 = !DILocation(line: 215, column: 8, scope: !1044)
!1068 = !DILocation(line: 217, column: 28, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1056, file: !21, line: 216, column: 6)
!1070 = !DILocation(line: 217, column: 39, scope: !1069)
!1071 = !DILocation(line: 217, column: 47, scope: !1069)
!1072 = !DILocation(line: 217, column: 49, scope: !1069)
!1073 = !DILocation(line: 217, column: 52, scope: !1069)
!1074 = !DILocation(line: 217, column: 37, scope: !1069)
!1075 = !DILocation(line: 217, column: 8, scope: !1069)
!1076 = !DILocation(line: 217, column: 16, scope: !1069)
!1077 = !DILocation(line: 217, column: 18, scope: !1069)
!1078 = !DILocation(line: 217, column: 21, scope: !1069)
!1079 = !DILocation(line: 217, column: 26, scope: !1069)
!1080 = !DILocation(line: 218, column: 28, scope: !1069)
!1081 = !DILocation(line: 218, column: 8, scope: !1069)
!1082 = !DILocation(line: 218, column: 16, scope: !1069)
!1083 = !DILocation(line: 218, column: 18, scope: !1069)
!1084 = !DILocation(line: 218, column: 21, scope: !1069)
!1085 = !DILocation(line: 218, column: 27, scope: !1069)
!1086 = !DILocation(line: 219, column: 6, scope: !1069)
!1087 = !DILocation(line: 220, column: 2, scope: !1044)
!1088 = !DILocation(line: 212, column: 33, scope: !1089)
!1089 = !DILexicalBlockFile(scope: !1039, file: !21, discriminator: 2)
!1090 = !DILocation(line: 212, column: 7, scope: !1089)
!1091 = distinct !{!1091, !1092}
!1092 = !DILocation(line: 212, column: 7, scope: !1025)
!1093 = !DILocation(line: 205, column: 5, scope: !1094)
!1094 = !DILexicalBlockFile(scope: !1022, file: !21, discriminator: 1)
!1095 = distinct !{!1095, !1021}
!1096 = !DILocation(line: 226, column: 3, scope: !1022)
!1097 = !DILocation(line: 228, column: 11, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1099, file: !21, line: 228, column: 5)
!1099 = distinct !DILexicalBlock(scope: !1018, file: !21, line: 227, column: 9)
!1100 = !DILocation(line: 228, column: 9, scope: !1098)
!1101 = !DILocation(line: 228, column: 16, scope: !1102)
!1102 = !DILexicalBlockFile(scope: !1103, file: !21, discriminator: 1)
!1103 = distinct !DILexicalBlock(scope: !1098, file: !21, line: 228, column: 5)
!1104 = !DILocation(line: 228, column: 20, scope: !1102)
!1105 = !DILocation(line: 228, column: 28, scope: !1102)
!1106 = !DILocation(line: 228, column: 18, scope: !1102)
!1107 = !DILocation(line: 228, column: 5, scope: !1102)
!1108 = !DILocalVariable(name: "to_open", scope: !1109, file: !21, line: 229, type: !13)
!1109 = distinct !DILexicalBlock(scope: !1103, file: !21, line: 228, column: 40)
!1110 = !DILocation(line: 229, column: 12, scope: !1109)
!1111 = !DILocation(line: 229, column: 30, scope: !1109)
!1112 = !DILocation(line: 229, column: 39, scope: !1109)
!1113 = !DILocation(line: 229, column: 57, scope: !1109)
!1114 = !DILocation(line: 229, column: 65, scope: !1109)
!1115 = !DILocation(line: 229, column: 67, scope: !1109)
!1116 = !DILocation(line: 229, column: 70, scope: !1109)
!1117 = !DILocation(line: 229, column: 75, scope: !1109)
!1118 = !DILocation(line: 229, column: 74, scope: !1109)
!1119 = !DILocation(line: 229, column: 55, scope: !1109)
!1120 = !DILocation(line: 230, column: 11, scope: !1121)
!1121 = distinct !DILexicalBlock(scope: !1109, file: !21, line: 230, column: 11)
!1122 = !DILocation(line: 230, column: 11, scope: !1109)
!1123 = !DILocation(line: 231, column: 4, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1121, file: !21, line: 230, column: 22)
!1125 = !DILocation(line: 231, column: 12, scope: !1124)
!1126 = !DILocation(line: 235, column: 7, scope: !1124)
!1127 = !DILocalVariable(name: "k", scope: !1128, file: !21, line: 240, type: !11)
!1128 = distinct !DILexicalBlock(scope: !1124, file: !21, line: 240, column: 2)
!1129 = !DILocation(line: 240, column: 11, scope: !1128)
!1130 = !DILocation(line: 240, column: 15, scope: !1128)
!1131 = !DILocation(line: 240, column: 7, scope: !1128)
!1132 = !DILocation(line: 240, column: 19, scope: !1133)
!1133 = !DILexicalBlockFile(scope: !1134, file: !21, discriminator: 1)
!1134 = distinct !DILexicalBlock(scope: !1128, file: !21, line: 240, column: 2)
!1135 = !DILocation(line: 240, column: 23, scope: !1133)
!1136 = !DILocation(line: 240, column: 21, scope: !1133)
!1137 = !DILocation(line: 240, column: 2, scope: !1133)
!1138 = !DILocalVariable(name: "distance", scope: !1139, file: !21, line: 241, type: !25)
!1139 = distinct !DILexicalBlock(scope: !1134, file: !21, line: 240, column: 34)
!1140 = !DILocation(line: 241, column: 10, scope: !1139)
!1141 = !DILocation(line: 241, column: 26, scope: !1139)
!1142 = !DILocation(line: 241, column: 34, scope: !1139)
!1143 = !DILocation(line: 241, column: 36, scope: !1139)
!1144 = !DILocation(line: 241, column: 39, scope: !1139)
!1145 = !DILocation(line: 241, column: 47, scope: !1139)
!1146 = !DILocation(line: 241, column: 49, scope: !1139)
!1147 = !DILocation(line: 241, column: 52, scope: !1139)
!1148 = !DILocation(line: 241, column: 60, scope: !1139)
!1149 = !DILocation(line: 241, column: 21, scope: !1139)
!1150 = !DILocation(line: 242, column: 8, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1139, file: !21, line: 242, column: 8)
!1152 = !DILocation(line: 242, column: 17, scope: !1151)
!1153 = !DILocation(line: 242, column: 25, scope: !1151)
!1154 = !DILocation(line: 242, column: 27, scope: !1151)
!1155 = !DILocation(line: 242, column: 30, scope: !1151)
!1156 = !DILocation(line: 242, column: 16, scope: !1151)
!1157 = !DILocation(line: 242, column: 39, scope: !1151)
!1158 = !DILocation(line: 242, column: 47, scope: !1151)
!1159 = !DILocation(line: 242, column: 49, scope: !1151)
!1160 = !DILocation(line: 242, column: 52, scope: !1151)
!1161 = !DILocation(line: 242, column: 37, scope: !1151)
!1162 = !DILocation(line: 242, column: 8, scope: !1139)
!1163 = !DILocation(line: 243, column: 26, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1151, file: !21, line: 242, column: 60)
!1165 = !DILocation(line: 243, column: 37, scope: !1164)
!1166 = !DILocation(line: 243, column: 45, scope: !1164)
!1167 = !DILocation(line: 243, column: 47, scope: !1164)
!1168 = !DILocation(line: 243, column: 50, scope: !1164)
!1169 = !DILocation(line: 243, column: 35, scope: !1164)
!1170 = !DILocation(line: 243, column: 6, scope: !1164)
!1171 = !DILocation(line: 243, column: 14, scope: !1164)
!1172 = !DILocation(line: 243, column: 16, scope: !1164)
!1173 = !DILocation(line: 243, column: 19, scope: !1164)
!1174 = !DILocation(line: 243, column: 24, scope: !1164)
!1175 = !DILocation(line: 244, column: 26, scope: !1164)
!1176 = !DILocation(line: 244, column: 6, scope: !1164)
!1177 = !DILocation(line: 244, column: 14, scope: !1164)
!1178 = !DILocation(line: 244, column: 16, scope: !1164)
!1179 = !DILocation(line: 244, column: 19, scope: !1164)
!1180 = !DILocation(line: 244, column: 25, scope: !1164)
!1181 = !DILocation(line: 245, column: 4, scope: !1164)
!1182 = !DILocation(line: 246, column: 2, scope: !1139)
!1183 = !DILocation(line: 240, column: 28, scope: !1184)
!1184 = !DILexicalBlockFile(scope: !1134, file: !21, discriminator: 2)
!1185 = !DILocation(line: 240, column: 2, scope: !1184)
!1186 = distinct !{!1186, !1187}
!1187 = !DILocation(line: 240, column: 2, scope: !1124)
!1188 = !DILocation(line: 250, column: 7, scope: !1124)
!1189 = !DILocation(line: 254, column: 7, scope: !1124)
!1190 = !DILocation(line: 255, column: 5, scope: !1109)
!1191 = !DILocation(line: 228, column: 34, scope: !1192)
!1192 = !DILexicalBlockFile(scope: !1103, file: !21, discriminator: 2)
!1193 = !DILocation(line: 228, column: 5, scope: !1192)
!1194 = distinct !{!1194, !1195}
!1195 = !DILocation(line: 228, column: 5, scope: !1099)
!1196 = !DILocation(line: 259, column: 10, scope: !1099)
!1197 = !DILocation(line: 268, column: 8, scope: !83)
!1198 = !DILocalVariable(name: "mytotal", scope: !83, file: !21, line: 269, type: !25)
!1199 = !DILocation(line: 269, column: 9, scope: !83)
!1200 = !DILocalVariable(name: "k", scope: !1201, file: !21, line: 270, type: !11)
!1201 = distinct !DILexicalBlock(scope: !83, file: !21, line: 270, column: 3)
!1202 = !DILocation(line: 270, column: 12, scope: !1201)
!1203 = !DILocation(line: 270, column: 16, scope: !1201)
!1204 = !DILocation(line: 270, column: 8, scope: !1201)
!1205 = !DILocation(line: 270, column: 20, scope: !1206)
!1206 = !DILexicalBlockFile(scope: !1207, file: !21, discriminator: 1)
!1207 = distinct !DILexicalBlock(scope: !1201, file: !21, line: 270, column: 3)
!1208 = !DILocation(line: 270, column: 24, scope: !1206)
!1209 = !DILocation(line: 270, column: 22, scope: !1206)
!1210 = !DILocation(line: 270, column: 3, scope: !1206)
!1211 = !DILocation(line: 271, column: 16, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1207, file: !21, line: 270, column: 35)
!1213 = !DILocation(line: 271, column: 24, scope: !1212)
!1214 = !DILocation(line: 271, column: 26, scope: !1212)
!1215 = !DILocation(line: 271, column: 29, scope: !1212)
!1216 = !DILocation(line: 271, column: 13, scope: !1212)
!1217 = !DILocation(line: 272, column: 3, scope: !1212)
!1218 = !DILocation(line: 270, column: 29, scope: !1219)
!1219 = !DILexicalBlockFile(scope: !1207, file: !21, discriminator: 2)
!1220 = !DILocation(line: 270, column: 3, scope: !1219)
!1221 = distinct !{!1221, !1222}
!1222 = !DILocation(line: 270, column: 3, scope: !83)
!1223 = !DILocation(line: 273, column: 16, scope: !83)
!1224 = !DILocation(line: 273, column: 3, scope: !83)
!1225 = !DILocation(line: 273, column: 9, scope: !83)
!1226 = !DILocation(line: 273, column: 14, scope: !83)
!1227 = !DILocation(line: 278, column: 7, scope: !1228)
!1228 = distinct !DILexicalBlock(scope: !83, file: !21, line: 278, column: 7)
!1229 = !DILocation(line: 278, column: 11, scope: !1228)
!1230 = !DILocation(line: 278, column: 7, scope: !83)
!1231 = !DILocation(line: 280, column: 17, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1228, file: !21, line: 279, column: 5)
!1233 = !DILocation(line: 280, column: 21, scope: !1232)
!1234 = !DILocation(line: 280, column: 20, scope: !1232)
!1235 = !DILocation(line: 280, column: 19, scope: !1232)
!1236 = !DILocation(line: 280, column: 18, scope: !1232)
!1237 = !DILocation(line: 280, column: 16, scope: !1232)
!1238 = !DILocalVariable(name: "i", scope: !1239, file: !21, line: 281, type: !11)
!1239 = distinct !DILexicalBlock(scope: !1232, file: !21, line: 281, column: 7)
!1240 = !DILocation(line: 281, column: 16, scope: !1239)
!1241 = !DILocation(line: 281, column: 12, scope: !1239)
!1242 = !DILocation(line: 281, column: 23, scope: !1243)
!1243 = !DILexicalBlockFile(scope: !1244, file: !21, discriminator: 1)
!1244 = distinct !DILexicalBlock(scope: !1239, file: !21, line: 281, column: 7)
!1245 = !DILocation(line: 281, column: 27, scope: !1243)
!1246 = !DILocation(line: 281, column: 25, scope: !1243)
!1247 = !DILocation(line: 281, column: 7, scope: !1243)
!1248 = !DILocation(line: 283, column: 17, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1244, file: !21, line: 282, column: 2)
!1250 = !DILocation(line: 283, column: 23, scope: !1249)
!1251 = !DILocation(line: 283, column: 14, scope: !1249)
!1252 = !DILocation(line: 284, column: 2, scope: !1249)
!1253 = !DILocation(line: 281, column: 35, scope: !1254)
!1254 = !DILexicalBlockFile(scope: !1244, file: !21, discriminator: 2)
!1255 = !DILocation(line: 281, column: 7, scope: !1254)
!1256 = distinct !{!1256, !1257}
!1257 = !DILocation(line: 281, column: 7, scope: !1232)
!1258 = !DILocation(line: 285, column: 12, scope: !1232)
!1259 = !DILocation(line: 285, column: 7, scope: !1232)
!1260 = !DILocation(line: 286, column: 5, scope: !1232)
!1261 = !DILocalVariable(name: "t2", scope: !83, file: !21, line: 301, type: !69)
!1262 = !DILocation(line: 301, column: 10, scope: !83)
!1263 = !DILocation(line: 301, column: 15, scope: !83)
!1264 = !DILocation(line: 302, column: 7, scope: !1265)
!1265 = distinct !DILexicalBlock(scope: !83, file: !21, line: 302, column: 7)
!1266 = !DILocation(line: 302, column: 10, scope: !1265)
!1267 = !DILocation(line: 302, column: 7, scope: !83)
!1268 = !DILocation(line: 303, column: 20, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1265, file: !21, line: 302, column: 17)
!1270 = !DILocation(line: 303, column: 24, scope: !1269)
!1271 = !DILocation(line: 303, column: 23, scope: !1269)
!1272 = !DILocation(line: 303, column: 17, scope: !1269)
!1273 = !DILocation(line: 304, column: 3, scope: !1269)
!1274 = !DILocation(line: 306, column: 10, scope: !83)
!1275 = !DILocation(line: 306, column: 3, scope: !83)
!1276 = distinct !DISubprogram(name: "pFL", linkageName: "_Z3pFLP6PointsPiifPliflfiP17pthread_barrier_t", scope: !21, file: !21, line: 317, type: !1277, isLocal: false, isDefinition: true, scopeLine: 320, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!1277 = !DISubroutineType(types: !1278)
!1278 = !{!25, !34, !26, !11, !25, !52, !11, !25, !27, !25, !11, !55}
!1279 = !DILocalVariable(name: "points", arg: 1, scope: !1276, file: !21, line: 317, type: !34)
!1280 = !DILocation(line: 317, column: 19, scope: !1276)
!1281 = !DILocalVariable(name: "feasible", arg: 2, scope: !1276, file: !21, line: 317, type: !26)
!1282 = !DILocation(line: 317, column: 32, scope: !1276)
!1283 = !DILocalVariable(name: "numfeasible", arg: 3, scope: !1276, file: !21, line: 317, type: !11)
!1284 = !DILocation(line: 317, column: 46, scope: !1276)
!1285 = !DILocalVariable(name: "z", arg: 4, scope: !1276, file: !21, line: 318, type: !25)
!1286 = !DILocation(line: 318, column: 10, scope: !1276)
!1287 = !DILocalVariable(name: "k", arg: 5, scope: !1276, file: !21, line: 318, type: !52)
!1288 = !DILocation(line: 318, column: 19, scope: !1276)
!1289 = !DILocalVariable(name: "kmax", arg: 6, scope: !1276, file: !21, line: 318, type: !11)
!1290 = !DILocation(line: 318, column: 26, scope: !1276)
!1291 = !DILocalVariable(name: "cost", arg: 7, scope: !1276, file: !21, line: 318, type: !25)
!1292 = !DILocation(line: 318, column: 38, scope: !1276)
!1293 = !DILocalVariable(name: "iter", arg: 8, scope: !1276, file: !21, line: 318, type: !27)
!1294 = !DILocation(line: 318, column: 49, scope: !1276)
!1295 = !DILocalVariable(name: "e", arg: 9, scope: !1276, file: !21, line: 318, type: !25)
!1296 = !DILocation(line: 318, column: 61, scope: !1276)
!1297 = !DILocalVariable(name: "pid", arg: 10, scope: !1276, file: !21, line: 319, type: !11)
!1298 = !DILocation(line: 319, column: 8, scope: !1276)
!1299 = !DILocalVariable(name: "barrier", arg: 11, scope: !1276, file: !21, line: 319, type: !55)
!1300 = !DILocation(line: 319, column: 32, scope: !1276)
!1301 = !DILocalVariable(name: "i", scope: !1276, file: !21, line: 324, type: !27)
!1302 = !DILocation(line: 324, column: 8, scope: !1276)
!1303 = !DILocalVariable(name: "x", scope: !1276, file: !21, line: 325, type: !27)
!1304 = !DILocation(line: 325, column: 8, scope: !1276)
!1305 = !DILocalVariable(name: "change", scope: !1276, file: !21, line: 326, type: !25)
!1306 = !DILocation(line: 326, column: 9, scope: !1276)
!1307 = !DILocalVariable(name: "numberOfPoints", scope: !1276, file: !21, line: 327, type: !27)
!1308 = !DILocation(line: 327, column: 8, scope: !1276)
!1309 = !DILocation(line: 329, column: 12, scope: !1276)
!1310 = !DILocation(line: 329, column: 10, scope: !1276)
!1311 = !DILocation(line: 332, column: 3, scope: !1276)
!1312 = !DILocation(line: 332, column: 10, scope: !1313)
!1313 = !DILexicalBlockFile(scope: !1276, file: !21, discriminator: 1)
!1314 = !DILocation(line: 332, column: 17, scope: !1313)
!1315 = !DILocation(line: 332, column: 16, scope: !1313)
!1316 = !DILocation(line: 332, column: 28, scope: !1313)
!1317 = !DILocation(line: 332, column: 27, scope: !1313)
!1318 = !DILocation(line: 332, column: 22, scope: !1313)
!1319 = !DILocation(line: 332, column: 3, scope: !1313)
!1320 = !DILocation(line: 333, column: 12, scope: !1321)
!1321 = distinct !DILexicalBlock(scope: !1276, file: !21, line: 332, column: 31)
!1322 = !DILocation(line: 334, column: 22, scope: !1321)
!1323 = !DILocation(line: 334, column: 30, scope: !1321)
!1324 = !DILocation(line: 334, column: 20, scope: !1321)
!1325 = !DILocation(line: 337, column: 9, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1321, file: !21, line: 337, column: 9)
!1327 = !DILocation(line: 337, column: 13, scope: !1326)
!1328 = !DILocation(line: 337, column: 9, scope: !1321)
!1329 = !DILocation(line: 338, column: 18, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1326, file: !21, line: 337, column: 20)
!1331 = !DILocation(line: 338, column: 28, scope: !1330)
!1332 = !DILocation(line: 338, column: 7, scope: !1330)
!1333 = !DILocation(line: 339, column: 5, scope: !1330)
!1334 = !DILocation(line: 344, column: 11, scope: !1335)
!1335 = distinct !DILexicalBlock(scope: !1321, file: !21, line: 344, column: 5)
!1336 = !DILocation(line: 344, column: 10, scope: !1335)
!1337 = !DILocation(line: 344, column: 14, scope: !1338)
!1338 = !DILexicalBlockFile(scope: !1339, file: !21, discriminator: 1)
!1339 = distinct !DILexicalBlock(scope: !1335, file: !21, line: 344, column: 5)
!1340 = !DILocation(line: 344, column: 16, scope: !1338)
!1341 = !DILocation(line: 344, column: 15, scope: !1338)
!1342 = !DILocation(line: 344, column: 5, scope: !1338)
!1343 = !DILocation(line: 345, column: 10, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1339, file: !21, line: 344, column: 26)
!1345 = !DILocation(line: 345, column: 12, scope: !1344)
!1346 = !DILocation(line: 345, column: 11, scope: !1344)
!1347 = !DILocation(line: 345, column: 8, scope: !1344)
!1348 = !DILocation(line: 346, column: 22, scope: !1344)
!1349 = !DILocation(line: 346, column: 31, scope: !1344)
!1350 = !DILocation(line: 346, column: 35, scope: !1344)
!1351 = !DILocation(line: 346, column: 43, scope: !1344)
!1352 = !DILocation(line: 346, column: 46, scope: !1344)
!1353 = !DILocation(line: 346, column: 49, scope: !1344)
!1354 = !DILocation(line: 346, column: 55, scope: !1344)
!1355 = !DILocation(line: 346, column: 66, scope: !1344)
!1356 = !DILocation(line: 346, column: 80, scope: !1344)
!1357 = !DILocation(line: 346, column: 99, scope: !1344)
!1358 = !DILocation(line: 346, column: 16, scope: !1344)
!1359 = !DILocation(line: 346, column: 13, scope: !1344)
!1360 = !DILocation(line: 348, column: 5, scope: !1344)
!1361 = !DILocation(line: 344, column: 22, scope: !1362)
!1362 = !DILexicalBlockFile(scope: !1339, file: !21, discriminator: 2)
!1363 = !DILocation(line: 344, column: 5, scope: !1362)
!1364 = distinct !{!1364, !1365}
!1365 = !DILocation(line: 344, column: 5, scope: !1321)
!1366 = !DILocation(line: 350, column: 13, scope: !1321)
!1367 = !DILocation(line: 350, column: 10, scope: !1321)
!1368 = !DILocation(line: 332, column: 3, scope: !1369)
!1369 = !DILexicalBlockFile(scope: !1276, file: !21, discriminator: 2)
!1370 = distinct !{!1370, !1311}
!1371 = !DILocation(line: 361, column: 10, scope: !1276)
!1372 = !DILocation(line: 361, column: 3, scope: !1276)
!1373 = distinct !DISubprogram(name: "selectfeasible_fast", linkageName: "_Z19selectfeasible_fastP6PointsPPiiiP17pthread_barrier_t", scope: !21, file: !21, line: 364, type: !1374, isLocal: false, isDefinition: true, scopeLine: 365, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!1374 = !DISubroutineType(types: !1375)
!1375 = !{!11, !34, !1376, !11, !11, !55}
!1376 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, align: 64)
!1377 = !DILocalVariable(name: "points", arg: 1, scope: !1373, file: !21, line: 364, type: !34)
!1378 = !DILocation(line: 364, column: 33, scope: !1373)
!1379 = !DILocalVariable(name: "feasible", arg: 2, scope: !1373, file: !21, line: 364, type: !1376)
!1380 = !DILocation(line: 364, column: 47, scope: !1373)
!1381 = !DILocalVariable(name: "kmin", arg: 3, scope: !1373, file: !21, line: 364, type: !11)
!1382 = !DILocation(line: 364, column: 61, scope: !1373)
!1383 = !DILocalVariable(name: "pid", arg: 4, scope: !1373, file: !21, line: 364, type: !11)
!1384 = !DILocation(line: 364, column: 71, scope: !1373)
!1385 = !DILocalVariable(name: "barrier", arg: 5, scope: !1373, file: !21, line: 364, type: !55)
!1386 = !DILocation(line: 364, column: 95, scope: !1373)
!1387 = !DILocalVariable(name: "t1", scope: !1373, file: !21, line: 367, type: !69)
!1388 = !DILocation(line: 367, column: 10, scope: !1373)
!1389 = !DILocation(line: 367, column: 15, scope: !1373)
!1390 = !DILocalVariable(name: "numfeasible", scope: !1373, file: !21, line: 370, type: !11)
!1391 = !DILocation(line: 370, column: 7, scope: !1373)
!1392 = !DILocation(line: 370, column: 21, scope: !1373)
!1393 = !DILocation(line: 370, column: 29, scope: !1373)
!1394 = !DILocation(line: 371, column: 7, scope: !1395)
!1395 = distinct !DILexicalBlock(scope: !1373, file: !21, line: 371, column: 7)
!1396 = !DILocation(line: 371, column: 27, scope: !1395)
!1397 = !DILocation(line: 371, column: 26, scope: !1395)
!1398 = !DILocation(line: 371, column: 22, scope: !1395)
!1399 = !DILocation(line: 371, column: 43, scope: !1395)
!1400 = !DILocation(line: 371, column: 36, scope: !1395)
!1401 = !DILocation(line: 371, column: 32, scope: !1395)
!1402 = !DILocation(line: 371, column: 31, scope: !1395)
!1403 = !DILocation(line: 371, column: 19, scope: !1395)
!1404 = !DILocation(line: 371, column: 7, scope: !1373)
!1405 = !DILocation(line: 372, column: 30, scope: !1395)
!1406 = !DILocation(line: 372, column: 29, scope: !1395)
!1407 = !DILocation(line: 372, column: 25, scope: !1395)
!1408 = !DILocation(line: 372, column: 46, scope: !1395)
!1409 = !DILocation(line: 372, column: 39, scope: !1395)
!1410 = !DILocation(line: 372, column: 35, scope: !1395)
!1411 = !DILocation(line: 372, column: 34, scope: !1395)
!1412 = !DILocation(line: 372, column: 24, scope: !1395)
!1413 = !DILocation(line: 372, column: 17, scope: !1395)
!1414 = !DILocation(line: 372, column: 5, scope: !1395)
!1415 = !DILocation(line: 373, column: 29, scope: !1373)
!1416 = !DILocation(line: 373, column: 40, scope: !1373)
!1417 = !DILocation(line: 373, column: 22, scope: !1373)
!1418 = !DILocation(line: 373, column: 15, scope: !1373)
!1419 = !DILocation(line: 373, column: 4, scope: !1373)
!1420 = !DILocation(line: 373, column: 13, scope: !1373)
!1421 = !DILocalVariable(name: "accumweight", scope: !1373, file: !21, line: 375, type: !24)
!1422 = !DILocation(line: 375, column: 10, scope: !1373)
!1423 = !DILocalVariable(name: "totalweight", scope: !1373, file: !21, line: 376, type: !25)
!1424 = !DILocation(line: 376, column: 9, scope: !1373)
!1425 = !DILocalVariable(name: "k1", scope: !1373, file: !21, line: 388, type: !27)
!1426 = !DILocation(line: 388, column: 8, scope: !1373)
!1427 = !DILocalVariable(name: "k2", scope: !1373, file: !21, line: 389, type: !27)
!1428 = !DILocation(line: 389, column: 8, scope: !1373)
!1429 = !DILocation(line: 389, column: 13, scope: !1373)
!1430 = !DILocalVariable(name: "w", scope: !1373, file: !21, line: 391, type: !25)
!1431 = !DILocation(line: 391, column: 9, scope: !1373)
!1432 = !DILocalVariable(name: "l", scope: !1373, file: !21, line: 392, type: !11)
!1433 = !DILocation(line: 392, column: 7, scope: !1373)
!1434 = !DILocalVariable(name: "r", scope: !1373, file: !21, line: 392, type: !11)
!1435 = !DILocation(line: 392, column: 9, scope: !1373)
!1436 = !DILocalVariable(name: "k", scope: !1373, file: !21, line: 392, type: !11)
!1437 = !DILocation(line: 392, column: 11, scope: !1373)
!1438 = !DILocation(line: 395, column: 7, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1373, file: !21, line: 395, column: 7)
!1440 = !DILocation(line: 395, column: 22, scope: !1439)
!1441 = !DILocation(line: 395, column: 30, scope: !1439)
!1442 = !DILocation(line: 395, column: 19, scope: !1439)
!1443 = !DILocation(line: 395, column: 7, scope: !1373)
!1444 = !DILocalVariable(name: "i", scope: !1445, file: !21, line: 396, type: !11)
!1445 = distinct !DILexicalBlock(scope: !1446, file: !21, line: 396, column: 5)
!1446 = distinct !DILexicalBlock(scope: !1439, file: !21, line: 395, column: 35)
!1447 = !DILocation(line: 396, column: 14, scope: !1445)
!1448 = !DILocation(line: 396, column: 16, scope: !1445)
!1449 = !DILocation(line: 396, column: 10, scope: !1445)
!1450 = !DILocation(line: 396, column: 19, scope: !1451)
!1451 = !DILexicalBlockFile(scope: !1452, file: !21, discriminator: 1)
!1452 = distinct !DILexicalBlock(scope: !1445, file: !21, line: 396, column: 5)
!1453 = !DILocation(line: 396, column: 21, scope: !1451)
!1454 = !DILocation(line: 396, column: 20, scope: !1451)
!1455 = !DILocation(line: 396, column: 5, scope: !1451)
!1456 = !DILocation(line: 397, column: 24, scope: !1452)
!1457 = !DILocation(line: 397, column: 9, scope: !1452)
!1458 = !DILocation(line: 397, column: 8, scope: !1452)
!1459 = !DILocation(line: 397, column: 19, scope: !1452)
!1460 = !DILocation(line: 397, column: 7, scope: !1452)
!1461 = !DILocation(line: 397, column: 22, scope: !1452)
!1462 = !DILocation(line: 396, column: 25, scope: !1463)
!1463 = !DILexicalBlockFile(scope: !1452, file: !21, discriminator: 2)
!1464 = !DILocation(line: 396, column: 5, scope: !1463)
!1465 = distinct !{!1465, !1466}
!1466 = !DILocation(line: 396, column: 5, scope: !1446)
!1467 = !DILocation(line: 398, column: 12, scope: !1446)
!1468 = !DILocation(line: 398, column: 5, scope: !1446)
!1469 = !DILocation(line: 401, column: 45, scope: !1373)
!1470 = !DILocation(line: 401, column: 53, scope: !1373)
!1471 = !DILocation(line: 401, column: 44, scope: !1373)
!1472 = !DILocation(line: 401, column: 24, scope: !1373)
!1473 = !DILocation(line: 401, column: 16, scope: !1373)
!1474 = !DILocation(line: 401, column: 14, scope: !1373)
!1475 = !DILocation(line: 402, column: 20, scope: !1373)
!1476 = !DILocation(line: 402, column: 28, scope: !1373)
!1477 = !DILocation(line: 402, column: 33, scope: !1373)
!1478 = !DILocation(line: 402, column: 3, scope: !1373)
!1479 = !DILocation(line: 402, column: 18, scope: !1373)
!1480 = !DILocation(line: 403, column: 14, scope: !1373)
!1481 = !DILocalVariable(name: "i", scope: !1482, file: !21, line: 404, type: !11)
!1482 = distinct !DILexicalBlock(scope: !1373, file: !21, line: 404, column: 3)
!1483 = !DILocation(line: 404, column: 12, scope: !1482)
!1484 = !DILocation(line: 404, column: 8, scope: !1482)
!1485 = !DILocation(line: 404, column: 19, scope: !1486)
!1486 = !DILexicalBlockFile(scope: !1487, file: !21, discriminator: 1)
!1487 = distinct !DILexicalBlock(scope: !1482, file: !21, line: 404, column: 3)
!1488 = !DILocation(line: 404, column: 23, scope: !1486)
!1489 = !DILocation(line: 404, column: 31, scope: !1486)
!1490 = !DILocation(line: 404, column: 21, scope: !1486)
!1491 = !DILocation(line: 404, column: 3, scope: !1486)
!1492 = !DILocation(line: 405, column: 22, scope: !1493)
!1493 = distinct !DILexicalBlock(scope: !1487, file: !21, line: 404, column: 42)
!1494 = !DILocation(line: 405, column: 34, scope: !1493)
!1495 = !DILocation(line: 405, column: 35, scope: !1493)
!1496 = !DILocation(line: 405, column: 41, scope: !1493)
!1497 = !DILocation(line: 405, column: 49, scope: !1493)
!1498 = !DILocation(line: 405, column: 51, scope: !1493)
!1499 = !DILocation(line: 405, column: 54, scope: !1493)
!1500 = !DILocation(line: 405, column: 39, scope: !1493)
!1501 = !DILocation(line: 405, column: 5, scope: !1493)
!1502 = !DILocation(line: 405, column: 17, scope: !1493)
!1503 = !DILocation(line: 405, column: 20, scope: !1493)
!1504 = !DILocation(line: 406, column: 3, scope: !1493)
!1505 = !DILocation(line: 404, column: 37, scope: !1506)
!1506 = !DILexicalBlockFile(scope: !1487, file: !21, discriminator: 2)
!1507 = !DILocation(line: 404, column: 3, scope: !1506)
!1508 = distinct !{!1508, !1509}
!1509 = !DILocation(line: 404, column: 3, scope: !1373)
!1510 = !DILocation(line: 407, column: 15, scope: !1373)
!1511 = !DILocation(line: 407, column: 27, scope: !1373)
!1512 = !DILocation(line: 407, column: 35, scope: !1373)
!1513 = !DILocation(line: 407, column: 38, scope: !1373)
!1514 = !DILocation(line: 407, column: 14, scope: !1373)
!1515 = !DILocalVariable(name: "i", scope: !1516, file: !21, line: 409, type: !11)
!1516 = distinct !DILexicalBlock(scope: !1373, file: !21, line: 409, column: 3)
!1517 = !DILocation(line: 409, column: 11, scope: !1516)
!1518 = !DILocation(line: 409, column: 13, scope: !1516)
!1519 = !DILocation(line: 409, column: 7, scope: !1516)
!1520 = !DILocation(line: 409, column: 17, scope: !1521)
!1521 = !DILexicalBlockFile(scope: !1522, file: !21, discriminator: 1)
!1522 = distinct !DILexicalBlock(scope: !1516, file: !21, line: 409, column: 3)
!1523 = !DILocation(line: 409, column: 19, scope: !1521)
!1524 = !DILocation(line: 409, column: 18, scope: !1521)
!1525 = !DILocation(line: 409, column: 3, scope: !1521)
!1526 = !DILocation(line: 410, column: 10, scope: !1527)
!1527 = distinct !DILexicalBlock(scope: !1522, file: !21, line: 409, column: 29)
!1528 = !DILocation(line: 410, column: 19, scope: !1527)
!1529 = !DILocation(line: 410, column: 36, scope: !1527)
!1530 = !DILocation(line: 410, column: 35, scope: !1527)
!1531 = !DILocation(line: 410, column: 7, scope: !1527)
!1532 = !DILocation(line: 412, column: 6, scope: !1527)
!1533 = !DILocation(line: 413, column: 7, scope: !1527)
!1534 = !DILocation(line: 413, column: 15, scope: !1527)
!1535 = !DILocation(line: 413, column: 18, scope: !1527)
!1536 = !DILocation(line: 413, column: 6, scope: !1527)
!1537 = !DILocation(line: 414, column: 9, scope: !1538)
!1538 = distinct !DILexicalBlock(scope: !1527, file: !21, line: 414, column: 9)
!1539 = !DILocation(line: 414, column: 26, scope: !1538)
!1540 = !DILocation(line: 414, column: 24, scope: !1538)
!1541 = !DILocation(line: 414, column: 9, scope: !1527)
!1542 = !DILocation(line: 415, column: 9, scope: !1543)
!1543 = distinct !DILexicalBlock(scope: !1538, file: !21, line: 414, column: 31)
!1544 = !DILocation(line: 415, column: 8, scope: !1543)
!1545 = !DILocation(line: 415, column: 19, scope: !1543)
!1546 = !DILocation(line: 415, column: 7, scope: !1543)
!1547 = !DILocation(line: 415, column: 21, scope: !1543)
!1548 = !DILocation(line: 416, column: 7, scope: !1543)
!1549 = !DILocation(line: 418, column: 5, scope: !1527)
!1550 = !DILocation(line: 418, column: 12, scope: !1551)
!1551 = !DILexicalBlockFile(scope: !1527, file: !21, discriminator: 1)
!1552 = !DILocation(line: 418, column: 13, scope: !1551)
!1553 = !DILocation(line: 418, column: 18, scope: !1551)
!1554 = !DILocation(line: 418, column: 16, scope: !1551)
!1555 = !DILocation(line: 418, column: 5, scope: !1551)
!1556 = !DILocation(line: 419, column: 12, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1527, file: !21, line: 418, column: 22)
!1558 = !DILocation(line: 419, column: 14, scope: !1557)
!1559 = !DILocation(line: 419, column: 13, scope: !1557)
!1560 = !DILocation(line: 419, column: 16, scope: !1557)
!1561 = !DILocation(line: 419, column: 9, scope: !1557)
!1562 = !DILocation(line: 420, column: 11, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !1557, file: !21, line: 420, column: 11)
!1564 = !DILocation(line: 420, column: 23, scope: !1563)
!1565 = !DILocation(line: 420, column: 28, scope: !1563)
!1566 = !DILocation(line: 420, column: 26, scope: !1563)
!1567 = !DILocation(line: 420, column: 11, scope: !1557)
!1568 = !DILocation(line: 421, column: 6, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1563, file: !21, line: 420, column: 32)
!1570 = !DILocation(line: 421, column: 4, scope: !1569)
!1571 = !DILocation(line: 422, column: 7, scope: !1569)
!1572 = !DILocation(line: 424, column: 4, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1563, file: !21, line: 423, column: 12)
!1574 = !DILocation(line: 424, column: 3, scope: !1573)
!1575 = !DILocation(line: 418, column: 5, scope: !1576)
!1576 = !DILexicalBlockFile(scope: !1527, file: !21, discriminator: 2)
!1577 = distinct !{!1577, !1549}
!1578 = !DILocation(line: 427, column: 20, scope: !1527)
!1579 = !DILocation(line: 427, column: 7, scope: !1527)
!1580 = !DILocation(line: 427, column: 6, scope: !1527)
!1581 = !DILocation(line: 427, column: 17, scope: !1527)
!1582 = !DILocation(line: 427, column: 5, scope: !1527)
!1583 = !DILocation(line: 427, column: 19, scope: !1527)
!1584 = !DILocation(line: 428, column: 3, scope: !1527)
!1585 = !DILocation(line: 409, column: 24, scope: !1586)
!1586 = !DILexicalBlockFile(scope: !1522, file: !21, discriminator: 2)
!1587 = !DILocation(line: 409, column: 3, scope: !1586)
!1588 = distinct !{!1588, !1589}
!1589 = !DILocation(line: 409, column: 3, scope: !1373)
!1590 = !DILocation(line: 430, column: 8, scope: !1373)
!1591 = !DILocation(line: 430, column: 3, scope: !1373)
!1592 = !DILocalVariable(name: "t2", scope: !1373, file: !21, line: 433, type: !69)
!1593 = !DILocation(line: 433, column: 10, scope: !1373)
!1594 = !DILocation(line: 433, column: 15, scope: !1373)
!1595 = !DILocation(line: 434, column: 27, scope: !1373)
!1596 = !DILocation(line: 434, column: 30, scope: !1373)
!1597 = !DILocation(line: 434, column: 29, scope: !1373)
!1598 = !DILocation(line: 434, column: 24, scope: !1373)
!1599 = !DILocation(line: 436, column: 10, scope: !1373)
!1600 = !DILocation(line: 436, column: 3, scope: !1373)
!1601 = !DILocation(line: 437, column: 1, scope: !1373)
!1602 = !DILocalVariable(name: "points", arg: 1, scope: !90, file: !21, line: 440, type: !34)
!1603 = !DILocation(line: 440, column: 24, scope: !90)
!1604 = !DILocalVariable(name: "kmin", arg: 2, scope: !90, file: !21, line: 440, type: !27)
!1605 = !DILocation(line: 440, column: 37, scope: !90)
!1606 = !DILocalVariable(name: "kmax", arg: 3, scope: !90, file: !21, line: 440, type: !27)
!1607 = !DILocation(line: 440, column: 48, scope: !90)
!1608 = !DILocalVariable(name: "kfinal", arg: 4, scope: !90, file: !21, line: 440, type: !52)
!1609 = !DILocation(line: 440, column: 60, scope: !90)
!1610 = !DILocalVariable(name: "pid", arg: 5, scope: !90, file: !21, line: 441, type: !11)
!1611 = !DILocation(line: 441, column: 13, scope: !90)
!1612 = !DILocalVariable(name: "barrier", arg: 6, scope: !90, file: !21, line: 441, type: !55)
!1613 = !DILocation(line: 441, column: 37, scope: !90)
!1614 = !DILocalVariable(name: "i", scope: !90, file: !21, line: 443, type: !11)
!1615 = !DILocation(line: 443, column: 7, scope: !90)
!1616 = !DILocalVariable(name: "cost", scope: !90, file: !21, line: 444, type: !25)
!1617 = !DILocation(line: 444, column: 9, scope: !90)
!1618 = !DILocalVariable(name: "lastcost", scope: !90, file: !21, line: 445, type: !25)
!1619 = !DILocation(line: 445, column: 9, scope: !90)
!1620 = !DILocalVariable(name: "hiz", scope: !90, file: !21, line: 446, type: !25)
!1621 = !DILocation(line: 446, column: 9, scope: !90)
!1622 = !DILocalVariable(name: "loz", scope: !90, file: !21, line: 446, type: !25)
!1623 = !DILocation(line: 446, column: 14, scope: !90)
!1624 = !DILocalVariable(name: "z", scope: !90, file: !21, line: 446, type: !25)
!1625 = !DILocation(line: 446, column: 19, scope: !90)
!1626 = !DILocation(line: 453, column: 7, scope: !1627)
!1627 = distinct !DILexicalBlock(scope: !90, file: !21, line: 453, column: 7)
!1628 = !DILocation(line: 453, column: 10, scope: !1627)
!1629 = !DILocation(line: 453, column: 7, scope: !90)
!1630 = !DILocation(line: 453, column: 38, scope: !1631)
!1631 = !DILexicalBlockFile(scope: !1627, file: !21, discriminator: 1)
!1632 = !DILocation(line: 453, column: 31, scope: !1631)
!1633 = !DILocation(line: 453, column: 23, scope: !1631)
!1634 = !DILocation(line: 453, column: 21, scope: !1631)
!1635 = !DILocation(line: 453, column: 16, scope: !1631)
!1636 = !DILocation(line: 454, column: 13, scope: !90)
!1637 = !DILocation(line: 454, column: 7, scope: !90)
!1638 = !DILocalVariable(name: "numberOfPoints", scope: !90, file: !21, line: 455, type: !27)
!1639 = !DILocation(line: 455, column: 8, scope: !90)
!1640 = !DILocation(line: 455, column: 25, scope: !90)
!1641 = !DILocation(line: 455, column: 33, scope: !90)
!1642 = !DILocalVariable(name: "ptDimension", scope: !90, file: !21, line: 456, type: !27)
!1643 = !DILocation(line: 456, column: 8, scope: !90)
!1644 = !DILocation(line: 456, column: 22, scope: !90)
!1645 = !DILocation(line: 456, column: 30, scope: !90)
!1646 = !DILocalVariable(name: "bsize", scope: !90, file: !21, line: 459, type: !27)
!1647 = !DILocation(line: 459, column: 8, scope: !90)
!1648 = !DILocation(line: 459, column: 16, scope: !90)
!1649 = !DILocation(line: 459, column: 24, scope: !90)
!1650 = !DILocation(line: 459, column: 28, scope: !90)
!1651 = !DILocation(line: 459, column: 27, scope: !90)
!1652 = !DILocalVariable(name: "k1", scope: !90, file: !21, line: 460, type: !27)
!1653 = !DILocation(line: 460, column: 8, scope: !90)
!1654 = !DILocation(line: 460, column: 13, scope: !90)
!1655 = !DILocation(line: 460, column: 21, scope: !90)
!1656 = !DILocation(line: 460, column: 19, scope: !90)
!1657 = !DILocalVariable(name: "k2", scope: !90, file: !21, line: 461, type: !27)
!1658 = !DILocation(line: 461, column: 8, scope: !90)
!1659 = !DILocation(line: 461, column: 13, scope: !90)
!1660 = !DILocation(line: 461, column: 18, scope: !90)
!1661 = !DILocation(line: 461, column: 16, scope: !90)
!1662 = !DILocation(line: 462, column: 7, scope: !1663)
!1663 = distinct !DILexicalBlock(scope: !90, file: !21, line: 462, column: 7)
!1664 = !DILocation(line: 462, column: 14, scope: !1663)
!1665 = !DILocation(line: 462, column: 19, scope: !1663)
!1666 = !DILocation(line: 462, column: 11, scope: !1663)
!1667 = !DILocation(line: 462, column: 7, scope: !90)
!1668 = !DILocation(line: 462, column: 29, scope: !1669)
!1669 = !DILexicalBlockFile(scope: !1663, file: !21, discriminator: 1)
!1670 = !DILocation(line: 462, column: 37, scope: !1669)
!1671 = !DILocation(line: 462, column: 27, scope: !1669)
!1672 = !DILocation(line: 462, column: 24, scope: !1669)
!1673 = !DILocalVariable(name: "myhiz", scope: !90, file: !21, line: 476, type: !25)
!1674 = !DILocation(line: 476, column: 9, scope: !90)
!1675 = !DILocalVariable(name: "kk", scope: !1676, file: !21, line: 477, type: !27)
!1676 = distinct !DILexicalBlock(scope: !90, file: !21, line: 477, column: 3)
!1677 = !DILocation(line: 477, column: 13, scope: !1676)
!1678 = !DILocation(line: 477, column: 16, scope: !1676)
!1679 = !DILocation(line: 477, column: 8, scope: !1676)
!1680 = !DILocation(line: 477, column: 19, scope: !1681)
!1681 = !DILexicalBlockFile(scope: !1682, file: !21, discriminator: 1)
!1682 = distinct !DILexicalBlock(scope: !1676, file: !21, line: 477, column: 3)
!1683 = !DILocation(line: 477, column: 24, scope: !1681)
!1684 = !DILocation(line: 477, column: 22, scope: !1681)
!1685 = !DILocation(line: 477, column: 3, scope: !1681)
!1686 = !DILocation(line: 478, column: 19, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1682, file: !21, line: 477, column: 35)
!1688 = !DILocation(line: 478, column: 27, scope: !1687)
!1689 = !DILocation(line: 478, column: 29, scope: !1687)
!1690 = !DILocation(line: 478, column: 34, scope: !1687)
!1691 = !DILocation(line: 478, column: 42, scope: !1687)
!1692 = !DILocation(line: 479, column: 9, scope: !1687)
!1693 = !DILocation(line: 478, column: 14, scope: !1687)
!1694 = !DILocation(line: 479, column: 22, scope: !1687)
!1695 = !DILocation(line: 479, column: 30, scope: !1687)
!1696 = !DILocation(line: 479, column: 32, scope: !1687)
!1697 = !DILocation(line: 479, column: 36, scope: !1687)
!1698 = !DILocation(line: 479, column: 21, scope: !1687)
!1699 = !DILocation(line: 478, column: 11, scope: !1687)
!1700 = !DILocation(line: 480, column: 3, scope: !1687)
!1701 = !DILocation(line: 477, column: 30, scope: !1702)
!1702 = !DILexicalBlockFile(scope: !1682, file: !21, discriminator: 2)
!1703 = !DILocation(line: 477, column: 3, scope: !1702)
!1704 = distinct !{!1704, !1705}
!1705 = !DILocation(line: 477, column: 3, scope: !90)
!1706 = !DILocation(line: 481, column: 15, scope: !90)
!1707 = !DILocation(line: 481, column: 3, scope: !90)
!1708 = !DILocation(line: 481, column: 8, scope: !90)
!1709 = !DILocation(line: 481, column: 13, scope: !90)
!1710 = !DILocalVariable(name: "i", scope: !1711, file: !21, line: 487, type: !11)
!1711 = distinct !DILexicalBlock(scope: !90, file: !21, line: 487, column: 3)
!1712 = !DILocation(line: 487, column: 12, scope: !1711)
!1713 = !DILocation(line: 487, column: 8, scope: !1711)
!1714 = !DILocation(line: 487, column: 19, scope: !1715)
!1715 = !DILexicalBlockFile(scope: !1716, file: !21, discriminator: 1)
!1716 = distinct !DILexicalBlock(scope: !1711, file: !21, line: 487, column: 3)
!1717 = !DILocation(line: 487, column: 23, scope: !1715)
!1718 = !DILocation(line: 487, column: 21, scope: !1715)
!1719 = !DILocation(line: 487, column: 3, scope: !1715)
!1720 = !DILocation(line: 488, column: 12, scope: !1721)
!1721 = distinct !DILexicalBlock(scope: !1716, file: !21, line: 487, column: 38)
!1722 = !DILocation(line: 488, column: 17, scope: !1721)
!1723 = !DILocation(line: 488, column: 9, scope: !1721)
!1724 = !DILocation(line: 489, column: 3, scope: !1721)
!1725 = !DILocation(line: 487, column: 31, scope: !1726)
!1726 = !DILexicalBlockFile(scope: !1716, file: !21, discriminator: 2)
!1727 = !DILocation(line: 487, column: 3, scope: !1726)
!1728 = distinct !{!1728, !1729}
!1729 = !DILocation(line: 487, column: 3, scope: !90)
!1730 = !DILocation(line: 491, column: 6, scope: !90)
!1731 = !DILocation(line: 491, column: 17, scope: !90)
!1732 = !DILocation(line: 491, column: 21, scope: !90)
!1733 = !DILocation(line: 491, column: 20, scope: !90)
!1734 = !DILocation(line: 491, column: 16, scope: !90)
!1735 = !DILocation(line: 491, column: 25, scope: !90)
!1736 = !DILocation(line: 491, column: 14, scope: !90)
!1737 = !DILocation(line: 493, column: 7, scope: !1738)
!1738 = distinct !DILexicalBlock(scope: !90, file: !21, line: 493, column: 7)
!1739 = !DILocation(line: 493, column: 15, scope: !1738)
!1740 = !DILocation(line: 493, column: 22, scope: !1738)
!1741 = !DILocation(line: 493, column: 19, scope: !1738)
!1742 = !DILocation(line: 493, column: 7, scope: !90)
!1743 = !DILocalVariable(name: "kk", scope: !1744, file: !21, line: 495, type: !27)
!1744 = distinct !DILexicalBlock(scope: !1745, file: !21, line: 495, column: 5)
!1745 = distinct !DILexicalBlock(scope: !1738, file: !21, line: 493, column: 28)
!1746 = !DILocation(line: 495, column: 15, scope: !1744)
!1747 = !DILocation(line: 495, column: 18, scope: !1744)
!1748 = !DILocation(line: 495, column: 10, scope: !1744)
!1749 = !DILocation(line: 495, column: 21, scope: !1750)
!1750 = !DILexicalBlockFile(scope: !1751, file: !21, discriminator: 1)
!1751 = distinct !DILexicalBlock(scope: !1744, file: !21, line: 495, column: 5)
!1752 = !DILocation(line: 495, column: 24, scope: !1750)
!1753 = !DILocation(line: 495, column: 23, scope: !1750)
!1754 = !DILocation(line: 495, column: 5, scope: !1750)
!1755 = !DILocation(line: 496, column: 30, scope: !1756)
!1756 = distinct !DILexicalBlock(scope: !1751, file: !21, line: 495, column: 33)
!1757 = !DILocation(line: 496, column: 7, scope: !1756)
!1758 = !DILocation(line: 496, column: 15, scope: !1756)
!1759 = !DILocation(line: 496, column: 17, scope: !1756)
!1760 = !DILocation(line: 496, column: 21, scope: !1756)
!1761 = !DILocation(line: 496, column: 28, scope: !1756)
!1762 = !DILocation(line: 497, column: 7, scope: !1756)
!1763 = !DILocation(line: 497, column: 15, scope: !1756)
!1764 = !DILocation(line: 497, column: 17, scope: !1756)
!1765 = !DILocation(line: 497, column: 21, scope: !1756)
!1766 = !DILocation(line: 497, column: 26, scope: !1756)
!1767 = !DILocation(line: 498, column: 5, scope: !1756)
!1768 = !DILocation(line: 495, column: 29, scope: !1769)
!1769 = !DILexicalBlockFile(scope: !1751, file: !21, discriminator: 2)
!1770 = !DILocation(line: 495, column: 5, scope: !1769)
!1771 = distinct !{!1771, !1772}
!1772 = !DILocation(line: 495, column: 5, scope: !1745)
!1773 = !DILocation(line: 499, column: 10, scope: !1745)
!1774 = !DILocation(line: 500, column: 9, scope: !1775)
!1775 = distinct !DILexicalBlock(scope: !1745, file: !21, line: 500, column: 9)
!1776 = !DILocation(line: 500, column: 12, scope: !1775)
!1777 = !DILocation(line: 500, column: 9, scope: !1745)
!1778 = !DILocation(line: 501, column: 12, scope: !1779)
!1779 = distinct !DILexicalBlock(scope: !1775, file: !21, line: 500, column: 19)
!1780 = !DILocation(line: 501, column: 7, scope: !1779)
!1781 = !DILocation(line: 502, column: 17, scope: !1779)
!1782 = !DILocation(line: 502, column: 8, scope: !1779)
!1783 = !DILocation(line: 502, column: 15, scope: !1779)
!1784 = !DILocation(line: 503, column: 5, scope: !1779)
!1785 = !DILocation(line: 504, column: 12, scope: !1745)
!1786 = !DILocation(line: 504, column: 5, scope: !1745)
!1787 = !DILocation(line: 507, column: 7, scope: !1788)
!1788 = distinct !DILexicalBlock(scope: !90, file: !21, line: 507, column: 7)
!1789 = !DILocation(line: 507, column: 11, scope: !1788)
!1790 = !DILocation(line: 507, column: 7, scope: !90)
!1791 = !DILocation(line: 507, column: 26, scope: !1792)
!1792 = !DILexicalBlockFile(scope: !1788, file: !21, discriminator: 1)
!1793 = !DILocation(line: 507, column: 18, scope: !1792)
!1794 = !DILocation(line: 508, column: 18, scope: !90)
!1795 = !DILocation(line: 508, column: 26, scope: !90)
!1796 = !DILocation(line: 508, column: 33, scope: !90)
!1797 = !DILocation(line: 508, column: 38, scope: !90)
!1798 = !DILocation(line: 508, column: 10, scope: !90)
!1799 = !DILocation(line: 508, column: 8, scope: !90)
!1800 = !DILocation(line: 514, column: 4, scope: !90)
!1801 = !DILocation(line: 516, column: 3, scope: !90)
!1802 = !DILocation(line: 516, column: 11, scope: !1803)
!1803 = !DILexicalBlockFile(scope: !90, file: !21, discriminator: 1)
!1804 = !DILocation(line: 516, column: 15, scope: !1803)
!1805 = !DILocation(line: 516, column: 13, scope: !1803)
!1806 = !DILocation(line: 516, column: 20, scope: !1803)
!1807 = !DILocation(line: 516, column: 23, scope: !1808)
!1808 = !DILexicalBlockFile(scope: !90, file: !21, discriminator: 2)
!1809 = !DILocation(line: 516, column: 24, scope: !1808)
!1810 = !DILocation(line: 516, column: 3, scope: !1811)
!1811 = !DILexicalBlockFile(scope: !90, file: !21, discriminator: 3)
!1812 = !DILocation(line: 517, column: 20, scope: !1813)
!1813 = distinct !DILexicalBlock(scope: !90, file: !21, line: 516, column: 30)
!1814 = !DILocation(line: 517, column: 28, scope: !1813)
!1815 = !DILocation(line: 517, column: 35, scope: !1813)
!1816 = !DILocation(line: 517, column: 40, scope: !1813)
!1817 = !DILocation(line: 517, column: 12, scope: !1813)
!1818 = !DILocation(line: 517, column: 10, scope: !1813)
!1819 = !DILocation(line: 518, column: 6, scope: !1813)
!1820 = !DILocation(line: 516, column: 3, scope: !1821)
!1821 = !DILexicalBlockFile(scope: !90, file: !21, discriminator: 4)
!1822 = distinct !{!1822, !1801}
!1823 = !DILocation(line: 526, column: 3, scope: !90)
!1824 = !DILocation(line: 526, column: 10, scope: !1803)
!1825 = !DILocation(line: 526, column: 14, scope: !1803)
!1826 = !DILocation(line: 526, column: 12, scope: !1803)
!1827 = !DILocation(line: 526, column: 3, scope: !1803)
!1828 = !DILocation(line: 533, column: 9, scope: !1829)
!1829 = distinct !DILexicalBlock(scope: !1830, file: !21, line: 533, column: 9)
!1830 = distinct !DILexicalBlock(scope: !90, file: !21, line: 526, column: 20)
!1831 = !DILocation(line: 533, column: 11, scope: !1829)
!1832 = !DILocation(line: 533, column: 9, scope: !1830)
!1833 = !DILocation(line: 533, column: 23, scope: !1834)
!1834 = !DILexicalBlockFile(scope: !1835, file: !21, discriminator: 1)
!1835 = distinct !DILexicalBlock(scope: !1829, file: !21, line: 533, column: 18)
!1836 = !DILocation(line: 533, column: 22, scope: !1834)
!1837 = !DILocation(line: 533, column: 29, scope: !1834)
!1838 = !DILocation(line: 533, column: 33, scope: !1834)
!1839 = !DILocation(line: 533, column: 32, scope: !1834)
!1840 = !DILocation(line: 533, column: 28, scope: !1834)
!1841 = !DILocation(line: 533, column: 37, scope: !1834)
!1842 = !DILocation(line: 533, column: 27, scope: !1834)
!1843 = !DILocation(line: 533, column: 44, scope: !1834)
!1844 = !DILocation(line: 533, column: 47, scope: !1834)
!1845 = !DILocation(line: 534, column: 9, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1830, file: !21, line: 534, column: 9)
!1847 = !DILocation(line: 534, column: 13, scope: !1846)
!1848 = !DILocation(line: 534, column: 9, scope: !1830)
!1849 = !DILocation(line: 534, column: 28, scope: !1850)
!1850 = !DILexicalBlockFile(scope: !1846, file: !21, discriminator: 1)
!1851 = !DILocation(line: 534, column: 20, scope: !1850)
!1852 = !DILocation(line: 535, column: 20, scope: !1830)
!1853 = !DILocation(line: 535, column: 28, scope: !1830)
!1854 = !DILocation(line: 535, column: 35, scope: !1830)
!1855 = !DILocation(line: 535, column: 40, scope: !1830)
!1856 = !DILocation(line: 535, column: 12, scope: !1830)
!1857 = !DILocation(line: 535, column: 10, scope: !1830)
!1858 = !DILocation(line: 536, column: 6, scope: !1830)
!1859 = !DILocation(line: 526, column: 3, scope: !1808)
!1860 = distinct !{!1860, !1823}
!1861 = !DILocation(line: 544, column: 7, scope: !1862)
!1862 = distinct !DILexicalBlock(scope: !90, file: !21, line: 544, column: 7)
!1863 = !DILocation(line: 544, column: 11, scope: !1862)
!1864 = !DILocation(line: 544, column: 7, scope: !90)
!1865 = !DILocation(line: 546, column: 41, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1862, file: !21, line: 545, column: 5)
!1867 = !DILocation(line: 546, column: 58, scope: !1866)
!1868 = !DILocation(line: 546, column: 63, scope: !1866)
!1869 = !DILocation(line: 546, column: 67, scope: !1866)
!1870 = !DILocation(line: 546, column: 21, scope: !1866)
!1871 = !DILocation(line: 546, column: 19, scope: !1866)
!1872 = !DILocalVariable(name: "i", scope: !1873, file: !21, line: 547, type: !11)
!1873 = distinct !DILexicalBlock(scope: !1866, file: !21, line: 547, column: 7)
!1874 = !DILocation(line: 547, column: 16, scope: !1873)
!1875 = !DILocation(line: 547, column: 12, scope: !1873)
!1876 = !DILocation(line: 547, column: 23, scope: !1877)
!1877 = !DILexicalBlockFile(scope: !1878, file: !21, discriminator: 1)
!1878 = distinct !DILexicalBlock(scope: !1873, file: !21, line: 547, column: 7)
!1879 = !DILocation(line: 547, column: 26, scope: !1877)
!1880 = !DILocation(line: 547, column: 34, scope: !1877)
!1881 = !DILocation(line: 547, column: 24, scope: !1877)
!1882 = !DILocation(line: 547, column: 7, scope: !1877)
!1883 = !DILocation(line: 548, column: 2, scope: !1884)
!1884 = distinct !DILexicalBlock(scope: !1878, file: !21, line: 547, column: 45)
!1885 = !DILocation(line: 548, column: 12, scope: !1884)
!1886 = !DILocation(line: 548, column: 20, scope: !1884)
!1887 = !DILocation(line: 548, column: 22, scope: !1884)
!1888 = !DILocation(line: 548, column: 25, scope: !1884)
!1889 = !DILocation(line: 548, column: 32, scope: !1884)
!1890 = !DILocation(line: 549, column: 7, scope: !1884)
!1891 = !DILocation(line: 547, column: 40, scope: !1892)
!1892 = !DILexicalBlockFile(scope: !1878, file: !21, discriminator: 2)
!1893 = !DILocation(line: 547, column: 7, scope: !1892)
!1894 = distinct !{!1894, !1895}
!1895 = !DILocation(line: 547, column: 7, scope: !1866)
!1896 = !DILocation(line: 550, column: 5, scope: !1866)
!1897 = !DILocation(line: 556, column: 3, scope: !90)
!1898 = !DILocation(line: 567, column: 16, scope: !1899)
!1899 = distinct !DILexicalBlock(scope: !90, file: !21, line: 556, column: 12)
!1900 = !DILocation(line: 567, column: 14, scope: !1899)
!1901 = !DILocation(line: 568, column: 16, scope: !1899)
!1902 = !DILocation(line: 568, column: 24, scope: !1899)
!1903 = !DILocation(line: 568, column: 34, scope: !1899)
!1904 = !DILocation(line: 569, column: 9, scope: !1899)
!1905 = !DILocation(line: 569, column: 16, scope: !1899)
!1906 = !DILocation(line: 569, column: 22, scope: !1899)
!1907 = !DILocation(line: 569, column: 40, scope: !1899)
!1908 = !DILocation(line: 569, column: 39, scope: !1899)
!1909 = !DILocation(line: 569, column: 35, scope: !1899)
!1910 = !DILocation(line: 569, column: 56, scope: !1899)
!1911 = !DILocation(line: 569, column: 49, scope: !1899)
!1912 = !DILocation(line: 569, column: 45, scope: !1899)
!1913 = !DILocation(line: 569, column: 44, scope: !1899)
!1914 = !DILocation(line: 569, column: 34, scope: !1899)
!1915 = !DILocation(line: 569, column: 69, scope: !1899)
!1916 = !DILocation(line: 569, column: 74, scope: !1899)
!1917 = !DILocation(line: 568, column: 12, scope: !1899)
!1918 = !DILocation(line: 568, column: 10, scope: !1899)
!1919 = !DILocation(line: 572, column: 11, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1899, file: !21, line: 572, column: 9)
!1921 = !DILocation(line: 572, column: 22, scope: !1920)
!1922 = !DILocation(line: 572, column: 21, scope: !1920)
!1923 = !DILocation(line: 572, column: 13, scope: !1920)
!1924 = !DILocation(line: 572, column: 27, scope: !1920)
!1925 = !DILocation(line: 572, column: 30, scope: !1926)
!1926 = !DILexicalBlockFile(scope: !1920, file: !21, discriminator: 1)
!1927 = !DILocation(line: 572, column: 41, scope: !1926)
!1928 = !DILocation(line: 572, column: 40, scope: !1926)
!1929 = !DILocation(line: 572, column: 32, scope: !1926)
!1930 = !DILocation(line: 572, column: 47, scope: !1926)
!1931 = !DILocation(line: 573, column: 4, scope: !1920)
!1932 = !DILocation(line: 573, column: 9, scope: !1920)
!1933 = !DILocation(line: 573, column: 13, scope: !1920)
!1934 = !DILocation(line: 573, column: 6, scope: !1920)
!1935 = !DILocation(line: 573, column: 16, scope: !1920)
!1936 = !DILocation(line: 573, column: 19, scope: !1926)
!1937 = !DILocation(line: 573, column: 24, scope: !1926)
!1938 = !DILocation(line: 573, column: 28, scope: !1926)
!1939 = !DILocation(line: 573, column: 21, scope: !1926)
!1940 = !DILocation(line: 572, column: 9, scope: !1941)
!1941 = !DILexicalBlockFile(scope: !1899, file: !21, discriminator: 2)
!1942 = !DILocation(line: 584, column: 18, scope: !1943)
!1943 = distinct !DILexicalBlock(scope: !1920, file: !21, line: 573, column: 34)
!1944 = !DILocation(line: 584, column: 26, scope: !1943)
!1945 = !DILocation(line: 584, column: 36, scope: !1943)
!1946 = !DILocation(line: 585, column: 4, scope: !1943)
!1947 = !DILocation(line: 585, column: 11, scope: !1943)
!1948 = !DILocation(line: 585, column: 17, scope: !1943)
!1949 = !DILocation(line: 585, column: 35, scope: !1943)
!1950 = !DILocation(line: 585, column: 34, scope: !1943)
!1951 = !DILocation(line: 585, column: 30, scope: !1943)
!1952 = !DILocation(line: 585, column: 51, scope: !1943)
!1953 = !DILocation(line: 585, column: 44, scope: !1943)
!1954 = !DILocation(line: 585, column: 40, scope: !1943)
!1955 = !DILocation(line: 585, column: 39, scope: !1943)
!1956 = !DILocation(line: 585, column: 29, scope: !1943)
!1957 = !DILocation(line: 585, column: 66, scope: !1943)
!1958 = !DILocation(line: 585, column: 71, scope: !1943)
!1959 = !DILocation(line: 584, column: 14, scope: !1943)
!1960 = !DILocation(line: 584, column: 12, scope: !1943)
!1961 = !DILocation(line: 586, column: 5, scope: !1943)
!1962 = !DILocation(line: 588, column: 9, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1899, file: !21, line: 588, column: 9)
!1964 = !DILocation(line: 588, column: 13, scope: !1963)
!1965 = !DILocation(line: 588, column: 11, scope: !1963)
!1966 = !DILocation(line: 588, column: 9, scope: !1899)
!1967 = !DILocation(line: 591, column: 13, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1963, file: !21, line: 588, column: 19)
!1969 = !DILocation(line: 591, column: 11, scope: !1968)
!1970 = !DILocation(line: 591, column: 21, scope: !1968)
!1971 = !DILocation(line: 591, column: 25, scope: !1968)
!1972 = !DILocation(line: 591, column: 24, scope: !1968)
!1973 = !DILocation(line: 591, column: 20, scope: !1968)
!1974 = !DILocation(line: 591, column: 29, scope: !1968)
!1975 = !DILocation(line: 591, column: 18, scope: !1968)
!1976 = !DILocation(line: 592, column: 16, scope: !1968)
!1977 = !DILocation(line: 592, column: 18, scope: !1968)
!1978 = !DILocation(line: 592, column: 17, scope: !1968)
!1979 = !DILocation(line: 592, column: 23, scope: !1968)
!1980 = !DILocation(line: 592, column: 22, scope: !1968)
!1981 = !DILocation(line: 592, column: 12, scope: !1968)
!1982 = !DILocation(line: 593, column: 5, scope: !1968)
!1983 = !DILocation(line: 594, column: 9, scope: !1984)
!1984 = distinct !DILexicalBlock(scope: !1899, file: !21, line: 594, column: 9)
!1985 = !DILocation(line: 594, column: 13, scope: !1984)
!1986 = !DILocation(line: 594, column: 11, scope: !1984)
!1987 = !DILocation(line: 594, column: 9, scope: !1899)
!1988 = !DILocation(line: 597, column: 13, scope: !1989)
!1989 = distinct !DILexicalBlock(scope: !1984, file: !21, line: 594, column: 19)
!1990 = !DILocation(line: 597, column: 11, scope: !1989)
!1991 = !DILocation(line: 597, column: 21, scope: !1989)
!1992 = !DILocation(line: 597, column: 25, scope: !1989)
!1993 = !DILocation(line: 597, column: 24, scope: !1989)
!1994 = !DILocation(line: 597, column: 20, scope: !1989)
!1995 = !DILocation(line: 597, column: 29, scope: !1989)
!1996 = !DILocation(line: 597, column: 18, scope: !1989)
!1997 = !DILocation(line: 598, column: 16, scope: !1989)
!1998 = !DILocation(line: 598, column: 18, scope: !1989)
!1999 = !DILocation(line: 598, column: 17, scope: !1989)
!2000 = !DILocation(line: 598, column: 23, scope: !1989)
!2001 = !DILocation(line: 598, column: 22, scope: !1989)
!2002 = !DILocation(line: 598, column: 12, scope: !1989)
!2003 = !DILocation(line: 599, column: 5, scope: !1989)
!2004 = !DILocation(line: 603, column: 11, scope: !2005)
!2005 = distinct !DILexicalBlock(scope: !1899, file: !21, line: 603, column: 9)
!2006 = !DILocation(line: 603, column: 16, scope: !2005)
!2007 = !DILocation(line: 603, column: 13, scope: !2005)
!2008 = !DILocation(line: 603, column: 21, scope: !2005)
!2009 = !DILocation(line: 603, column: 24, scope: !2010)
!2010 = !DILexicalBlockFile(scope: !2005, file: !21, discriminator: 1)
!2011 = !DILocation(line: 603, column: 29, scope: !2010)
!2012 = !DILocation(line: 603, column: 26, scope: !2010)
!2013 = !DILocation(line: 603, column: 35, scope: !2010)
!2014 = !DILocation(line: 603, column: 39, scope: !2015)
!2015 = !DILexicalBlockFile(scope: !2005, file: !21, discriminator: 2)
!2016 = !DILocation(line: 603, column: 54, scope: !2015)
!2017 = !DILocation(line: 603, column: 53, scope: !2015)
!2018 = !DILocation(line: 603, column: 43, scope: !2015)
!2019 = !DILocation(line: 603, column: 9, scope: !2015)
!2020 = !DILocation(line: 605, column: 2, scope: !2021)
!2021 = distinct !DILexicalBlock(scope: !2005, file: !21, line: 604, column: 7)
!2022 = !DILocation(line: 556, column: 3, scope: !1803)
!2023 = distinct !{!2023, !1897}
!2024 = !DILocation(line: 613, column: 7, scope: !2025)
!2025 = distinct !DILexicalBlock(scope: !90, file: !21, line: 613, column: 7)
!2026 = !DILocation(line: 613, column: 10, scope: !2025)
!2027 = !DILocation(line: 613, column: 7, scope: !90)
!2028 = !DILocation(line: 614, column: 10, scope: !2029)
!2029 = distinct !DILexicalBlock(scope: !2025, file: !21, line: 613, column: 16)
!2030 = !DILocation(line: 614, column: 5, scope: !2029)
!2031 = !DILocation(line: 615, column: 10, scope: !2029)
!2032 = !DILocation(line: 615, column: 5, scope: !2029)
!2033 = !DILocation(line: 616, column: 15, scope: !2029)
!2034 = !DILocation(line: 616, column: 6, scope: !2029)
!2035 = !DILocation(line: 616, column: 13, scope: !2029)
!2036 = !DILocation(line: 617, column: 3, scope: !2029)
!2037 = !DILocation(line: 619, column: 10, scope: !90)
!2038 = !DILocation(line: 619, column: 3, scope: !90)
!2039 = !DILocation(line: 620, column: 1, scope: !90)
!2040 = distinct !DISubprogram(name: "contcenters", linkageName: "_Z11contcentersP6Points", scope: !21, file: !21, line: 623, type: !2041, isLocal: false, isDefinition: true, scopeLine: 624, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!2041 = !DISubroutineType(types: !2042)
!2042 = !{!11, !34}
!2043 = !DILocalVariable(name: "points", arg: 1, scope: !2040, file: !21, line: 623, type: !34)
!2044 = !DILocation(line: 623, column: 25, scope: !2040)
!2045 = !DILocalVariable(name: "i", scope: !2040, file: !21, line: 625, type: !27)
!2046 = !DILocation(line: 625, column: 8, scope: !2040)
!2047 = !DILocalVariable(name: "ii", scope: !2040, file: !21, line: 625, type: !27)
!2048 = !DILocation(line: 625, column: 11, scope: !2040)
!2049 = !DILocalVariable(name: "relweight", scope: !2040, file: !21, line: 626, type: !25)
!2050 = !DILocation(line: 626, column: 9, scope: !2040)
!2051 = !DILocation(line: 628, column: 9, scope: !2052)
!2052 = distinct !DILexicalBlock(scope: !2040, file: !21, line: 628, column: 3)
!2053 = !DILocation(line: 628, column: 8, scope: !2052)
!2054 = !DILocation(line: 628, column: 12, scope: !2055)
!2055 = !DILexicalBlockFile(scope: !2056, file: !21, discriminator: 1)
!2056 = distinct !DILexicalBlock(scope: !2052, file: !21, line: 628, column: 3)
!2057 = !DILocation(line: 628, column: 14, scope: !2055)
!2058 = !DILocation(line: 628, column: 22, scope: !2055)
!2059 = !DILocation(line: 628, column: 13, scope: !2055)
!2060 = !DILocation(line: 628, column: 3, scope: !2055)
!2061 = !DILocation(line: 630, column: 9, scope: !2062)
!2062 = distinct !DILexicalBlock(scope: !2063, file: !21, line: 630, column: 9)
!2063 = distinct !DILexicalBlock(scope: !2056, file: !21, line: 628, column: 31)
!2064 = !DILocation(line: 630, column: 17, scope: !2062)
!2065 = !DILocation(line: 630, column: 19, scope: !2062)
!2066 = !DILocation(line: 630, column: 22, scope: !2062)
!2067 = !DILocation(line: 630, column: 32, scope: !2062)
!2068 = !DILocation(line: 630, column: 29, scope: !2062)
!2069 = !DILocation(line: 630, column: 9, scope: !2063)
!2070 = !DILocation(line: 631, column: 17, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !2062, file: !21, line: 630, column: 35)
!2072 = !DILocation(line: 631, column: 25, scope: !2071)
!2073 = !DILocation(line: 631, column: 27, scope: !2071)
!2074 = !DILocation(line: 631, column: 35, scope: !2071)
!2075 = !DILocation(line: 631, column: 37, scope: !2071)
!2076 = !DILocation(line: 631, column: 40, scope: !2071)
!2077 = !DILocation(line: 631, column: 48, scope: !2071)
!2078 = !DILocation(line: 631, column: 57, scope: !2071)
!2079 = !DILocation(line: 631, column: 65, scope: !2071)
!2080 = !DILocation(line: 631, column: 67, scope: !2071)
!2081 = !DILocation(line: 631, column: 70, scope: !2071)
!2082 = !DILocation(line: 631, column: 55, scope: !2071)
!2083 = !DILocation(line: 631, column: 16, scope: !2071)
!2084 = !DILocation(line: 632, column: 19, scope: !2071)
!2085 = !DILocation(line: 632, column: 27, scope: !2071)
!2086 = !DILocation(line: 632, column: 29, scope: !2071)
!2087 = !DILocation(line: 632, column: 32, scope: !2071)
!2088 = !DILocation(line: 632, column: 39, scope: !2071)
!2089 = !DILocation(line: 632, column: 38, scope: !2071)
!2090 = !DILocation(line: 632, column: 17, scope: !2071)
!2091 = !DILocation(line: 633, column: 14, scope: !2092)
!2092 = distinct !DILexicalBlock(scope: !2071, file: !21, line: 633, column: 7)
!2093 = !DILocation(line: 633, column: 12, scope: !2092)
!2094 = !DILocation(line: 633, column: 17, scope: !2095)
!2095 = !DILexicalBlockFile(scope: !2096, file: !21, discriminator: 1)
!2096 = distinct !DILexicalBlock(scope: !2092, file: !21, line: 633, column: 7)
!2097 = !DILocation(line: 633, column: 20, scope: !2095)
!2098 = !DILocation(line: 633, column: 28, scope: !2095)
!2099 = !DILocation(line: 633, column: 19, scope: !2095)
!2100 = !DILocation(line: 633, column: 7, scope: !2095)
!2101 = !DILocation(line: 634, column: 51, scope: !2102)
!2102 = distinct !DILexicalBlock(scope: !2096, file: !21, line: 633, column: 38)
!2103 = !DILocation(line: 634, column: 50, scope: !2102)
!2104 = !DILocation(line: 634, column: 5, scope: !2102)
!2105 = !DILocation(line: 634, column: 13, scope: !2102)
!2106 = !DILocation(line: 634, column: 15, scope: !2102)
!2107 = !DILocation(line: 634, column: 23, scope: !2102)
!2108 = !DILocation(line: 634, column: 25, scope: !2102)
!2109 = !DILocation(line: 634, column: 28, scope: !2102)
!2110 = !DILocation(line: 634, column: 36, scope: !2102)
!2111 = !DILocation(line: 634, column: 42, scope: !2102)
!2112 = !DILocation(line: 634, column: 45, scope: !2102)
!2113 = !DILocation(line: 636, column: 5, scope: !2102)
!2114 = !DILocation(line: 636, column: 13, scope: !2102)
!2115 = !DILocation(line: 636, column: 15, scope: !2102)
!2116 = !DILocation(line: 636, column: 18, scope: !2102)
!2117 = !DILocation(line: 636, column: 24, scope: !2102)
!2118 = !DILocation(line: 636, column: 28, scope: !2102)
!2119 = !DILocation(line: 636, column: 27, scope: !2102)
!2120 = !DILocation(line: 635, column: 5, scope: !2102)
!2121 = !DILocation(line: 635, column: 13, scope: !2102)
!2122 = !DILocation(line: 635, column: 15, scope: !2102)
!2123 = !DILocation(line: 635, column: 23, scope: !2102)
!2124 = !DILocation(line: 635, column: 25, scope: !2102)
!2125 = !DILocation(line: 635, column: 28, scope: !2102)
!2126 = !DILocation(line: 635, column: 36, scope: !2102)
!2127 = !DILocation(line: 635, column: 42, scope: !2102)
!2128 = !DILocation(line: 635, column: 45, scope: !2102)
!2129 = !DILocation(line: 637, column: 7, scope: !2102)
!2130 = !DILocation(line: 633, column: 34, scope: !2131)
!2131 = !DILexicalBlockFile(scope: !2096, file: !21, discriminator: 2)
!2132 = !DILocation(line: 633, column: 7, scope: !2131)
!2133 = distinct !{!2133, !2134}
!2134 = !DILocation(line: 633, column: 7, scope: !2071)
!2135 = !DILocation(line: 638, column: 48, scope: !2071)
!2136 = !DILocation(line: 638, column: 56, scope: !2071)
!2137 = !DILocation(line: 638, column: 58, scope: !2071)
!2138 = !DILocation(line: 638, column: 61, scope: !2071)
!2139 = !DILocation(line: 638, column: 7, scope: !2071)
!2140 = !DILocation(line: 638, column: 15, scope: !2071)
!2141 = !DILocation(line: 638, column: 17, scope: !2071)
!2142 = !DILocation(line: 638, column: 25, scope: !2071)
!2143 = !DILocation(line: 638, column: 27, scope: !2071)
!2144 = !DILocation(line: 638, column: 30, scope: !2071)
!2145 = !DILocation(line: 638, column: 38, scope: !2071)
!2146 = !DILocation(line: 638, column: 45, scope: !2071)
!2147 = !DILocation(line: 639, column: 5, scope: !2071)
!2148 = !DILocation(line: 640, column: 3, scope: !2063)
!2149 = !DILocation(line: 628, column: 27, scope: !2150)
!2150 = !DILexicalBlockFile(scope: !2056, file: !21, discriminator: 2)
!2151 = !DILocation(line: 628, column: 3, scope: !2150)
!2152 = distinct !{!2152, !2153}
!2153 = !DILocation(line: 628, column: 3, scope: !2040)
!2154 = !DILocation(line: 642, column: 3, scope: !2040)
!2155 = distinct !DISubprogram(name: "copycenters", linkageName: "_Z11copycentersP6PointsS0_Pll", scope: !21, file: !21, line: 646, type: !2156, isLocal: false, isDefinition: true, scopeLine: 647, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!2156 = !DISubroutineType(types: !2157)
!2157 = !{null, !34, !34, !52, !27}
!2158 = !DILocalVariable(name: "points", arg: 1, scope: !2155, file: !21, line: 646, type: !34)
!2159 = !DILocation(line: 646, column: 26, scope: !2155)
!2160 = !DILocalVariable(name: "centers", arg: 2, scope: !2155, file: !21, line: 646, type: !34)
!2161 = !DILocation(line: 646, column: 42, scope: !2155)
!2162 = !DILocalVariable(name: "centerIDs", arg: 3, scope: !2155, file: !21, line: 646, type: !52)
!2163 = !DILocation(line: 646, column: 57, scope: !2155)
!2164 = !DILocalVariable(name: "offset", arg: 4, scope: !2155, file: !21, line: 646, type: !27)
!2165 = !DILocation(line: 646, column: 73, scope: !2155)
!2166 = !DILocalVariable(name: "i", scope: !2155, file: !21, line: 648, type: !27)
!2167 = !DILocation(line: 648, column: 8, scope: !2155)
!2168 = !DILocalVariable(name: "k", scope: !2155, file: !21, line: 649, type: !27)
!2169 = !DILocation(line: 649, column: 8, scope: !2155)
!2170 = !DILocalVariable(name: "is_a_median", scope: !2155, file: !21, line: 651, type: !28)
!2171 = !DILocation(line: 651, column: 9, scope: !2155)
!2172 = !DILocation(line: 651, column: 39, scope: !2155)
!2173 = !DILocation(line: 651, column: 47, scope: !2155)
!2174 = !DILocation(line: 651, column: 32, scope: !2155)
!2175 = !DILocation(line: 654, column: 11, scope: !2176)
!2176 = distinct !DILexicalBlock(scope: !2155, file: !21, line: 654, column: 3)
!2177 = !DILocation(line: 654, column: 9, scope: !2176)
!2178 = !DILocation(line: 654, column: 16, scope: !2179)
!2179 = !DILexicalBlockFile(scope: !2180, file: !21, discriminator: 1)
!2180 = distinct !DILexicalBlock(scope: !2176, file: !21, line: 654, column: 3)
!2181 = !DILocation(line: 654, column: 20, scope: !2179)
!2182 = !DILocation(line: 654, column: 28, scope: !2179)
!2183 = !DILocation(line: 654, column: 18, scope: !2179)
!2184 = !DILocation(line: 654, column: 3, scope: !2179)
!2185 = !DILocation(line: 655, column: 5, scope: !2186)
!2186 = distinct !DILexicalBlock(scope: !2180, file: !21, line: 654, column: 39)
!2187 = !DILocation(line: 655, column: 17, scope: !2186)
!2188 = !DILocation(line: 655, column: 25, scope: !2186)
!2189 = !DILocation(line: 655, column: 27, scope: !2186)
!2190 = !DILocation(line: 655, column: 30, scope: !2186)
!2191 = !DILocation(line: 655, column: 38, scope: !2186)
!2192 = !DILocation(line: 656, column: 3, scope: !2186)
!2193 = !DILocation(line: 654, column: 34, scope: !2194)
!2194 = !DILexicalBlockFile(scope: !2180, file: !21, discriminator: 2)
!2195 = !DILocation(line: 654, column: 3, scope: !2194)
!2196 = distinct !{!2196, !2197}
!2197 = !DILocation(line: 654, column: 3, scope: !2155)
!2198 = !DILocation(line: 658, column: 5, scope: !2155)
!2199 = !DILocation(line: 658, column: 14, scope: !2155)
!2200 = !DILocation(line: 658, column: 4, scope: !2155)
!2201 = !DILocation(line: 661, column: 11, scope: !2202)
!2202 = distinct !DILexicalBlock(scope: !2155, file: !21, line: 661, column: 3)
!2203 = !DILocation(line: 661, column: 9, scope: !2202)
!2204 = !DILocation(line: 661, column: 16, scope: !2205)
!2205 = !DILexicalBlockFile(scope: !2206, file: !21, discriminator: 1)
!2206 = distinct !DILexicalBlock(scope: !2202, file: !21, line: 661, column: 3)
!2207 = !DILocation(line: 661, column: 20, scope: !2205)
!2208 = !DILocation(line: 661, column: 28, scope: !2205)
!2209 = !DILocation(line: 661, column: 18, scope: !2205)
!2210 = !DILocation(line: 661, column: 3, scope: !2205)
!2211 = !DILocation(line: 662, column: 10, scope: !2212)
!2212 = distinct !DILexicalBlock(scope: !2213, file: !21, line: 662, column: 10)
!2213 = distinct !DILexicalBlock(scope: !2206, file: !21, line: 661, column: 39)
!2214 = !DILocation(line: 662, column: 22, scope: !2212)
!2215 = !DILocation(line: 662, column: 10, scope: !2213)
!2216 = !DILocation(line: 663, column: 15, scope: !2217)
!2217 = distinct !DILexicalBlock(scope: !2212, file: !21, line: 662, column: 27)
!2218 = !DILocation(line: 663, column: 24, scope: !2217)
!2219 = !DILocation(line: 663, column: 26, scope: !2217)
!2220 = !DILocation(line: 663, column: 29, scope: !2217)
!2221 = !DILocation(line: 663, column: 7, scope: !2217)
!2222 = !DILocation(line: 663, column: 36, scope: !2217)
!2223 = !DILocation(line: 663, column: 44, scope: !2217)
!2224 = !DILocation(line: 663, column: 46, scope: !2217)
!2225 = !DILocation(line: 663, column: 49, scope: !2217)
!2226 = !DILocation(line: 663, column: 56, scope: !2217)
!2227 = !DILocation(line: 663, column: 64, scope: !2217)
!2228 = !DILocation(line: 663, column: 68, scope: !2217)
!2229 = !DILocation(line: 664, column: 30, scope: !2217)
!2230 = !DILocation(line: 664, column: 38, scope: !2217)
!2231 = !DILocation(line: 664, column: 40, scope: !2217)
!2232 = !DILocation(line: 664, column: 43, scope: !2217)
!2233 = !DILocation(line: 664, column: 7, scope: !2217)
!2234 = !DILocation(line: 664, column: 16, scope: !2217)
!2235 = !DILocation(line: 664, column: 18, scope: !2217)
!2236 = !DILocation(line: 664, column: 21, scope: !2217)
!2237 = !DILocation(line: 664, column: 28, scope: !2217)
!2238 = !DILocation(line: 665, column: 22, scope: !2217)
!2239 = !DILocation(line: 665, column: 26, scope: !2217)
!2240 = !DILocation(line: 665, column: 24, scope: !2217)
!2241 = !DILocation(line: 665, column: 7, scope: !2217)
!2242 = !DILocation(line: 665, column: 17, scope: !2217)
!2243 = !DILocation(line: 665, column: 20, scope: !2217)
!2244 = !DILocation(line: 666, column: 8, scope: !2217)
!2245 = !DILocation(line: 667, column: 5, scope: !2217)
!2246 = !DILocation(line: 668, column: 3, scope: !2213)
!2247 = !DILocation(line: 661, column: 34, scope: !2248)
!2248 = !DILexicalBlockFile(scope: !2206, file: !21, discriminator: 2)
!2249 = !DILocation(line: 661, column: 3, scope: !2248)
!2250 = distinct !{!2250, !2251}
!2251 = !DILocation(line: 661, column: 3, scope: !2155)
!2252 = !DILocation(line: 670, column: 18, scope: !2155)
!2253 = !DILocation(line: 670, column: 3, scope: !2155)
!2254 = !DILocation(line: 670, column: 12, scope: !2155)
!2255 = !DILocation(line: 670, column: 16, scope: !2155)
!2256 = !DILocation(line: 672, column: 8, scope: !2155)
!2257 = !DILocation(line: 672, column: 3, scope: !2155)
!2258 = !DILocation(line: 673, column: 1, scope: !2155)
!2259 = distinct !DISubprogram(name: "localSearchSub", linkageName: "_Z14localSearchSubPv", scope: !21, file: !21, line: 677, type: !2260, isLocal: false, isDefinition: true, scopeLine: 677, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!2260 = !DISubroutineType(types: !2261)
!2261 = !{!222, !222}
!2262 = !DILocalVariable(name: "arg_", arg: 1, scope: !2259, file: !21, line: 677, type: !222)
!2263 = !DILocation(line: 677, column: 28, scope: !2259)
!2264 = !DILocalVariable(name: "arg", scope: !2259, file: !21, line: 678, type: !29)
!2265 = !DILocation(line: 678, column: 19, scope: !2259)
!2266 = !DILocation(line: 678, column: 41, scope: !2259)
!2267 = !DILocation(line: 678, column: 24, scope: !2259)
!2268 = !DILocation(line: 679, column: 12, scope: !2259)
!2269 = !DILocation(line: 679, column: 17, scope: !2259)
!2270 = !DILocation(line: 679, column: 24, scope: !2259)
!2271 = !DILocation(line: 679, column: 29, scope: !2259)
!2272 = !DILocation(line: 679, column: 34, scope: !2259)
!2273 = !DILocation(line: 679, column: 39, scope: !2259)
!2274 = !DILocation(line: 679, column: 44, scope: !2259)
!2275 = !DILocation(line: 679, column: 49, scope: !2259)
!2276 = !DILocation(line: 679, column: 56, scope: !2259)
!2277 = !DILocation(line: 679, column: 61, scope: !2259)
!2278 = !DILocation(line: 679, column: 65, scope: !2259)
!2279 = !DILocation(line: 679, column: 70, scope: !2259)
!2280 = !DILocation(line: 679, column: 3, scope: !2259)
!2281 = !DILocation(line: 681, column: 3, scope: !2259)
!2282 = distinct !DISubprogram(name: "localSearch", linkageName: "_Z11localSearchP6PointsllPl", scope: !21, file: !21, line: 684, type: !2283, isLocal: false, isDefinition: true, scopeLine: 684, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!2283 = !DISubroutineType(types: !2284)
!2284 = !{null, !34, !27, !27, !52}
!2285 = !DILocalVariable(name: "points", arg: 1, scope: !2282, file: !21, line: 684, type: !34)
!2286 = !DILocation(line: 684, column: 27, scope: !2282)
!2287 = !DILocalVariable(name: "kmin", arg: 2, scope: !2282, file: !21, line: 684, type: !27)
!2288 = !DILocation(line: 684, column: 40, scope: !2282)
!2289 = !DILocalVariable(name: "kmax", arg: 3, scope: !2282, file: !21, line: 684, type: !27)
!2290 = !DILocation(line: 684, column: 51, scope: !2282)
!2291 = !DILocalVariable(name: "kfinal", arg: 4, scope: !2282, file: !21, line: 684, type: !52)
!2292 = !DILocation(line: 684, column: 63, scope: !2282)
!2293 = !DILocalVariable(name: "t1", scope: !2282, file: !21, line: 686, type: !69)
!2294 = !DILocation(line: 686, column: 10, scope: !2282)
!2295 = !DILocation(line: 686, column: 15, scope: !2282)
!2296 = !DILocalVariable(name: "barrier", scope: !2282, file: !21, line: 689, type: !56)
!2297 = !DILocation(line: 689, column: 23, scope: !2282)
!2298 = !DILocalVariable(name: "threads", scope: !2282, file: !21, line: 693, type: !2299)
!2299 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2300, size: 64, align: 64)
!2300 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !57, line: 60, baseType: !172)
!2301 = !DILocation(line: 693, column: 16, scope: !2282)
!2302 = !DILocation(line: 693, column: 40, scope: !2282)
!2303 = !DILocation(line: 693, column: 26, scope: !2282)
!2304 = !DILocalVariable(name: "arg", scope: !2282, file: !21, line: 694, type: !29)
!2305 = !DILocation(line: 694, column: 21, scope: !2282)
!2306 = !DILocation(line: 694, column: 46, scope: !2282)
!2307 = !DILocation(line: 694, column: 27, scope: !2282)
!2308 = !DILocalVariable(name: "i", scope: !2309, file: !21, line: 697, type: !11)
!2309 = distinct !DILexicalBlock(scope: !2282, file: !21, line: 697, column: 5)
!2310 = !DILocation(line: 697, column: 14, scope: !2309)
!2311 = !DILocation(line: 697, column: 10, scope: !2309)
!2312 = !DILocation(line: 697, column: 21, scope: !2313)
!2313 = !DILexicalBlockFile(scope: !2314, file: !21, discriminator: 1)
!2314 = distinct !DILexicalBlock(scope: !2309, file: !21, line: 697, column: 5)
!2315 = !DILocation(line: 697, column: 25, scope: !2313)
!2316 = !DILocation(line: 697, column: 23, scope: !2313)
!2317 = !DILocation(line: 697, column: 5, scope: !2313)
!2318 = !DILocation(line: 698, column: 23, scope: !2319)
!2319 = distinct !DILexicalBlock(scope: !2314, file: !21, line: 697, column: 38)
!2320 = !DILocation(line: 698, column: 7, scope: !2319)
!2321 = !DILocation(line: 698, column: 11, scope: !2319)
!2322 = !DILocation(line: 698, column: 14, scope: !2319)
!2323 = !DILocation(line: 698, column: 21, scope: !2319)
!2324 = !DILocation(line: 699, column: 21, scope: !2319)
!2325 = !DILocation(line: 699, column: 7, scope: !2319)
!2326 = !DILocation(line: 699, column: 11, scope: !2319)
!2327 = !DILocation(line: 699, column: 14, scope: !2319)
!2328 = !DILocation(line: 699, column: 19, scope: !2319)
!2329 = !DILocation(line: 700, column: 21, scope: !2319)
!2330 = !DILocation(line: 700, column: 7, scope: !2319)
!2331 = !DILocation(line: 700, column: 11, scope: !2319)
!2332 = !DILocation(line: 700, column: 14, scope: !2319)
!2333 = !DILocation(line: 700, column: 19, scope: !2319)
!2334 = !DILocation(line: 701, column: 20, scope: !2319)
!2335 = !DILocation(line: 701, column: 7, scope: !2319)
!2336 = !DILocation(line: 701, column: 11, scope: !2319)
!2337 = !DILocation(line: 701, column: 14, scope: !2319)
!2338 = !DILocation(line: 701, column: 18, scope: !2319)
!2339 = !DILocation(line: 702, column: 23, scope: !2319)
!2340 = !DILocation(line: 702, column: 7, scope: !2319)
!2341 = !DILocation(line: 702, column: 11, scope: !2319)
!2342 = !DILocation(line: 702, column: 14, scope: !2319)
!2343 = !DILocation(line: 702, column: 21, scope: !2319)
!2344 = !DILocation(line: 704, column: 7, scope: !2319)
!2345 = !DILocation(line: 704, column: 11, scope: !2319)
!2346 = !DILocation(line: 704, column: 14, scope: !2319)
!2347 = !DILocation(line: 704, column: 22, scope: !2319)
!2348 = !DILocation(line: 708, column: 23, scope: !2319)
!2349 = !DILocation(line: 708, column: 22, scope: !2319)
!2350 = !DILocation(line: 708, column: 7, scope: !2319)
!2351 = !DILocation(line: 710, column: 5, scope: !2319)
!2352 = !DILocation(line: 697, column: 33, scope: !2353)
!2353 = !DILexicalBlockFile(scope: !2314, file: !21, discriminator: 2)
!2354 = !DILocation(line: 697, column: 5, scope: !2353)
!2355 = distinct !{!2355, !2356}
!2356 = !DILocation(line: 697, column: 5, scope: !2282)
!2357 = !DILocalVariable(name: "i", scope: !2358, file: !21, line: 712, type: !11)
!2358 = distinct !DILexicalBlock(scope: !2282, file: !21, line: 712, column: 5)
!2359 = !DILocation(line: 712, column: 15, scope: !2358)
!2360 = !DILocation(line: 712, column: 11, scope: !2358)
!2361 = !DILocation(line: 712, column: 22, scope: !2362)
!2362 = !DILexicalBlockFile(scope: !2363, file: !21, discriminator: 1)
!2363 = distinct !DILexicalBlock(scope: !2358, file: !21, line: 712, column: 5)
!2364 = !DILocation(line: 712, column: 26, scope: !2362)
!2365 = !DILocation(line: 712, column: 24, scope: !2362)
!2366 = !DILocation(line: 712, column: 5, scope: !2362)
!2367 = !DILocation(line: 716, column: 5, scope: !2368)
!2368 = distinct !DILexicalBlock(scope: !2363, file: !21, line: 712, column: 38)
!2369 = !DILocation(line: 712, column: 34, scope: !2370)
!2370 = !DILexicalBlockFile(scope: !2363, file: !21, discriminator: 2)
!2371 = !DILocation(line: 712, column: 5, scope: !2370)
!2372 = distinct !{!2372, !2373}
!2373 = !DILocation(line: 712, column: 5, scope: !2282)
!2374 = !DILocation(line: 718, column: 14, scope: !2282)
!2375 = !DILocation(line: 718, column: 5, scope: !2282)
!2376 = !DILocation(line: 718, column: 5, scope: !2377)
!2377 = !DILexicalBlockFile(scope: !2282, file: !21, discriminator: 1)
!2378 = !DILocation(line: 719, column: 14, scope: !2282)
!2379 = !DILocation(line: 719, column: 5, scope: !2282)
!2380 = !DILocation(line: 719, column: 5, scope: !2377)
!2381 = !DILocalVariable(name: "t2", scope: !2282, file: !21, line: 725, type: !69)
!2382 = !DILocation(line: 725, column: 10, scope: !2282)
!2383 = !DILocation(line: 725, column: 15, scope: !2282)
!2384 = !DILocation(line: 726, column: 24, scope: !2282)
!2385 = !DILocation(line: 726, column: 27, scope: !2282)
!2386 = !DILocation(line: 726, column: 26, scope: !2282)
!2387 = !DILocation(line: 726, column: 21, scope: !2282)
!2388 = !DILocation(line: 729, column: 1, scope: !2282)
!2389 = distinct !DISubprogram(name: "outcenterIDs", linkageName: "_Z12outcenterIDsP6PointsPlPc", scope: !21, file: !21, line: 732, type: !2390, isLocal: false, isDefinition: true, scopeLine: 732, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!2390 = !DISubroutineType(types: !2391)
!2391 = !{null, !34, !52, !245}
!2392 = !DILocalVariable(name: "centers", arg: 1, scope: !2389, file: !21, line: 732, type: !34)
!2393 = !DILocation(line: 732, column: 28, scope: !2389)
!2394 = !DILocalVariable(name: "centerIDs", arg: 2, scope: !2389, file: !21, line: 732, type: !52)
!2395 = !DILocation(line: 732, column: 43, scope: !2389)
!2396 = !DILocalVariable(name: "outfile", arg: 3, scope: !2389, file: !21, line: 732, type: !245)
!2397 = !DILocation(line: 732, column: 60, scope: !2389)
!2398 = !DILocalVariable(name: "fp", scope: !2389, file: !21, line: 733, type: !491)
!2399 = !DILocation(line: 733, column: 9, scope: !2389)
!2400 = !DILocation(line: 733, column: 20, scope: !2389)
!2401 = !DILocation(line: 733, column: 14, scope: !2389)
!2402 = !DILocation(line: 734, column: 7, scope: !2403)
!2403 = distinct !DILexicalBlock(scope: !2389, file: !21, line: 734, column: 7)
!2404 = !DILocation(line: 734, column: 9, scope: !2403)
!2405 = !DILocation(line: 734, column: 7, scope: !2389)
!2406 = !DILocation(line: 735, column: 13, scope: !2407)
!2407 = distinct !DILexicalBlock(scope: !2403, file: !21, line: 734, column: 18)
!2408 = !DILocation(line: 735, column: 42, scope: !2407)
!2409 = !DILocation(line: 735, column: 5, scope: !2407)
!2410 = !DILocation(line: 736, column: 5, scope: !2407)
!2411 = !DILocalVariable(name: "is_a_median", scope: !2389, file: !21, line: 738, type: !26)
!2412 = !DILocation(line: 738, column: 8, scope: !2389)
!2413 = !DILocation(line: 738, column: 49, scope: !2389)
!2414 = !DILocation(line: 738, column: 58, scope: !2389)
!2415 = !DILocation(line: 738, column: 28, scope: !2389)
!2416 = !DILocation(line: 738, column: 22, scope: !2389)
!2417 = !DILocalVariable(name: "i", scope: !2418, file: !21, line: 739, type: !11)
!2418 = distinct !DILexicalBlock(scope: !2389, file: !21, line: 739, column: 3)
!2419 = !DILocation(line: 739, column: 12, scope: !2418)
!2420 = !DILocation(line: 739, column: 8, scope: !2418)
!2421 = !DILocation(line: 739, column: 19, scope: !2422)
!2422 = !DILexicalBlockFile(scope: !2423, file: !21, discriminator: 1)
!2423 = distinct !DILexicalBlock(scope: !2418, file: !21, line: 739, column: 3)
!2424 = !DILocation(line: 739, column: 22, scope: !2422)
!2425 = !DILocation(line: 739, column: 31, scope: !2422)
!2426 = !DILocation(line: 739, column: 20, scope: !2422)
!2427 = !DILocation(line: 739, column: 3, scope: !2422)
!2428 = !DILocation(line: 740, column: 5, scope: !2429)
!2429 = distinct !DILexicalBlock(scope: !2423, file: !21, line: 739, column: 42)
!2430 = !DILocation(line: 740, column: 17, scope: !2429)
!2431 = !DILocation(line: 740, column: 26, scope: !2429)
!2432 = !DILocation(line: 740, column: 28, scope: !2429)
!2433 = !DILocation(line: 740, column: 31, scope: !2429)
!2434 = !DILocation(line: 740, column: 39, scope: !2429)
!2435 = !DILocation(line: 741, column: 3, scope: !2429)
!2436 = !DILocation(line: 739, column: 37, scope: !2437)
!2437 = !DILexicalBlockFile(scope: !2423, file: !21, discriminator: 2)
!2438 = !DILocation(line: 739, column: 3, scope: !2437)
!2439 = distinct !{!2439, !2440}
!2440 = !DILocation(line: 739, column: 3, scope: !2389)
!2441 = !DILocalVariable(name: "i", scope: !2442, file: !21, line: 743, type: !11)
!2442 = distinct !DILexicalBlock(scope: !2389, file: !21, line: 743, column: 3)
!2443 = !DILocation(line: 743, column: 12, scope: !2442)
!2444 = !DILocation(line: 743, column: 8, scope: !2442)
!2445 = !DILocation(line: 743, column: 19, scope: !2446)
!2446 = !DILexicalBlockFile(scope: !2447, file: !21, discriminator: 1)
!2447 = distinct !DILexicalBlock(scope: !2442, file: !21, line: 743, column: 3)
!2448 = !DILocation(line: 743, column: 23, scope: !2446)
!2449 = !DILocation(line: 743, column: 32, scope: !2446)
!2450 = !DILocation(line: 743, column: 21, scope: !2446)
!2451 = !DILocation(line: 743, column: 3, scope: !2446)
!2452 = !DILocation(line: 744, column: 9, scope: !2453)
!2453 = distinct !DILexicalBlock(scope: !2454, file: !21, line: 744, column: 9)
!2454 = distinct !DILexicalBlock(scope: !2447, file: !21, line: 743, column: 43)
!2455 = !DILocation(line: 744, column: 21, scope: !2453)
!2456 = !DILocation(line: 744, column: 9, scope: !2454)
!2457 = !DILocation(line: 745, column: 15, scope: !2458)
!2458 = distinct !DILexicalBlock(scope: !2453, file: !21, line: 744, column: 26)
!2459 = !DILocation(line: 745, column: 27, scope: !2458)
!2460 = !DILocation(line: 745, column: 37, scope: !2458)
!2461 = !DILocation(line: 745, column: 7, scope: !2458)
!2462 = !DILocation(line: 746, column: 15, scope: !2458)
!2463 = !DILocation(line: 746, column: 28, scope: !2458)
!2464 = !DILocation(line: 746, column: 37, scope: !2458)
!2465 = !DILocation(line: 746, column: 39, scope: !2458)
!2466 = !DILocation(line: 746, column: 42, scope: !2458)
!2467 = !DILocation(line: 746, column: 7, scope: !2458)
!2468 = !DILocalVariable(name: "k", scope: !2469, file: !21, line: 747, type: !11)
!2469 = distinct !DILexicalBlock(scope: !2458, file: !21, line: 747, column: 7)
!2470 = !DILocation(line: 747, column: 16, scope: !2469)
!2471 = !DILocation(line: 747, column: 12, scope: !2469)
!2472 = !DILocation(line: 747, column: 23, scope: !2473)
!2473 = !DILexicalBlockFile(scope: !2474, file: !21, discriminator: 1)
!2474 = distinct !DILexicalBlock(scope: !2469, file: !21, line: 747, column: 7)
!2475 = !DILocation(line: 747, column: 27, scope: !2473)
!2476 = !DILocation(line: 747, column: 36, scope: !2473)
!2477 = !DILocation(line: 747, column: 25, scope: !2473)
!2478 = !DILocation(line: 747, column: 7, scope: !2473)
!2479 = !DILocation(line: 748, column: 10, scope: !2480)
!2480 = distinct !DILexicalBlock(scope: !2474, file: !21, line: 747, column: 47)
!2481 = !DILocation(line: 748, column: 22, scope: !2480)
!2482 = !DILocation(line: 748, column: 31, scope: !2480)
!2483 = !DILocation(line: 748, column: 33, scope: !2480)
!2484 = !DILocation(line: 748, column: 36, scope: !2480)
!2485 = !DILocation(line: 748, column: 42, scope: !2480)
!2486 = !DILocation(line: 748, column: 2, scope: !2480)
!2487 = !DILocation(line: 749, column: 7, scope: !2480)
!2488 = !DILocation(line: 747, column: 42, scope: !2489)
!2489 = !DILexicalBlockFile(scope: !2474, file: !21, discriminator: 2)
!2490 = !DILocation(line: 747, column: 7, scope: !2489)
!2491 = distinct !{!2491, !2492}
!2492 = !DILocation(line: 747, column: 7, scope: !2458)
!2493 = !DILocation(line: 750, column: 15, scope: !2458)
!2494 = !DILocation(line: 750, column: 7, scope: !2458)
!2495 = !DILocation(line: 751, column: 5, scope: !2458)
!2496 = !DILocation(line: 752, column: 3, scope: !2454)
!2497 = !DILocation(line: 743, column: 38, scope: !2498)
!2498 = !DILexicalBlockFile(scope: !2447, file: !21, discriminator: 2)
!2499 = !DILocation(line: 743, column: 3, scope: !2498)
!2500 = distinct !{!2500, !2501}
!2501 = !DILocation(line: 743, column: 3, scope: !2389)
!2502 = !DILocation(line: 753, column: 10, scope: !2389)
!2503 = !DILocation(line: 753, column: 3, scope: !2389)
!2504 = !DILocation(line: 754, column: 1, scope: !2389)
!2505 = distinct !DISubprogram(name: "streamCluster", linkageName: "_Z13streamClusterP7PStreamllillPc", scope: !21, file: !21, line: 756, type: !2506, isLocal: false, isDefinition: true, scopeLine: 759, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!2506 = !DISubroutineType(types: !2507)
!2507 = !{null, !2508, !27, !27, !11, !27, !27, !245}
!2508 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2509, size: 64, align: 64)
!2509 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "PStream", file: !31, line: 63, size: 64, align: 64, elements: !2510, vtableHolder: !2509, identifier: "_ZTS7PStream")
!2510 = !{!2511, !2514, !2518, !2521, !2522}
!2511 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$PStream", scope: !31, file: !31, baseType: !2512, size: 64, flags: DIFlagArtificial)
!2512 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2513, size: 64)
!2513 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !567, size: 64)
!2514 = !DISubprogram(name: "read", linkageName: "_ZN7PStream4readEPfii", scope: !2509, file: !31, line: 65, type: !2515, isLocal: false, isDefinition: false, scopeLine: 65, containingType: !2509, virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2515 = !DISubroutineType(types: !2516)
!2516 = !{!171, !2517, !24, !11, !11}
!2517 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2509, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2518 = !DISubprogram(name: "ferror", linkageName: "_ZN7PStream6ferrorEv", scope: !2509, file: !31, line: 66, type: !2519, isLocal: false, isDefinition: false, scopeLine: 66, containingType: !2509, virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2519 = !DISubroutineType(types: !2520)
!2520 = !{!11, !2517}
!2521 = !DISubprogram(name: "feof", linkageName: "_ZN7PStream4feofEv", scope: !2509, file: !31, line: 67, type: !2519, isLocal: false, isDefinition: false, scopeLine: 67, containingType: !2509, virtuality: DW_VIRTUALITY_pure_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2522 = !DISubprogram(name: "~PStream", scope: !2509, file: !31, line: 68, type: !2523, isLocal: false, isDefinition: false, scopeLine: 68, containingType: !2509, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2523 = !DISubroutineType(types: !2524)
!2524 = !{null, !2517}
!2525 = !DILocalVariable(name: "stream", arg: 1, scope: !2505, file: !21, line: 756, type: !2508)
!2526 = !DILocation(line: 756, column: 30, scope: !2505)
!2527 = !DILocalVariable(name: "kmin", arg: 2, scope: !2505, file: !21, line: 757, type: !27)
!2528 = !DILocation(line: 757, column: 12, scope: !2505)
!2529 = !DILocalVariable(name: "kmax", arg: 3, scope: !2505, file: !21, line: 757, type: !27)
!2530 = !DILocation(line: 757, column: 23, scope: !2505)
!2531 = !DILocalVariable(name: "dim", arg: 4, scope: !2505, file: !21, line: 757, type: !11)
!2532 = !DILocation(line: 757, column: 33, scope: !2505)
!2533 = !DILocalVariable(name: "chunksize", arg: 5, scope: !2505, file: !21, line: 758, type: !27)
!2534 = !DILocation(line: 758, column: 12, scope: !2505)
!2535 = !DILocalVariable(name: "centersize", arg: 6, scope: !2505, file: !21, line: 758, type: !27)
!2536 = !DILocation(line: 758, column: 28, scope: !2505)
!2537 = !DILocalVariable(name: "outfile", arg: 7, scope: !2505, file: !21, line: 758, type: !245)
!2538 = !DILocation(line: 758, column: 46, scope: !2505)
!2539 = !DILocalVariable(name: "block", scope: !2505, file: !21, line: 760, type: !24)
!2540 = !DILocation(line: 760, column: 10, scope: !2505)
!2541 = !DILocation(line: 760, column: 34, scope: !2505)
!2542 = !DILocation(line: 760, column: 44, scope: !2505)
!2543 = !DILocation(line: 760, column: 43, scope: !2505)
!2544 = !DILocation(line: 760, column: 47, scope: !2505)
!2545 = !DILocation(line: 760, column: 26, scope: !2505)
!2546 = !DILocation(line: 760, column: 18, scope: !2505)
!2547 = !DILocalVariable(name: "centerBlock", scope: !2505, file: !21, line: 761, type: !24)
!2548 = !DILocation(line: 761, column: 10, scope: !2505)
!2549 = !DILocation(line: 761, column: 39, scope: !2505)
!2550 = !DILocation(line: 761, column: 50, scope: !2505)
!2551 = !DILocation(line: 761, column: 49, scope: !2505)
!2552 = !DILocation(line: 761, column: 53, scope: !2505)
!2553 = !DILocation(line: 761, column: 32, scope: !2505)
!2554 = !DILocation(line: 761, column: 24, scope: !2505)
!2555 = !DILocalVariable(name: "centerIDs", scope: !2505, file: !21, line: 762, type: !52)
!2556 = !DILocation(line: 762, column: 9, scope: !2505)
!2557 = !DILocation(line: 762, column: 35, scope: !2505)
!2558 = !DILocation(line: 762, column: 46, scope: !2505)
!2559 = !DILocation(line: 762, column: 45, scope: !2505)
!2560 = !DILocation(line: 762, column: 49, scope: !2505)
!2561 = !DILocation(line: 762, column: 28, scope: !2505)
!2562 = !DILocation(line: 762, column: 21, scope: !2505)
!2563 = !DILocation(line: 764, column: 7, scope: !2564)
!2564 = distinct !DILexicalBlock(scope: !2505, file: !21, line: 764, column: 7)
!2565 = !DILocation(line: 764, column: 13, scope: !2564)
!2566 = !DILocation(line: 764, column: 7, scope: !2505)
!2567 = !DILocation(line: 765, column: 13, scope: !2568)
!2568 = distinct !DILexicalBlock(scope: !2564, file: !21, line: 764, column: 23)
!2569 = !DILocation(line: 765, column: 5, scope: !2568)
!2570 = !DILocation(line: 766, column: 5, scope: !2568)
!2571 = !DILocalVariable(name: "points", scope: !2505, file: !21, line: 769, type: !35)
!2572 = !DILocation(line: 769, column: 10, scope: !2505)
!2573 = !DILocation(line: 770, column: 16, scope: !2505)
!2574 = !DILocation(line: 770, column: 10, scope: !2505)
!2575 = !DILocation(line: 770, column: 14, scope: !2505)
!2576 = !DILocation(line: 771, column: 16, scope: !2505)
!2577 = !DILocation(line: 771, column: 10, scope: !2505)
!2578 = !DILocation(line: 771, column: 14, scope: !2505)
!2579 = !DILocation(line: 772, column: 30, scope: !2505)
!2580 = !DILocation(line: 772, column: 39, scope: !2505)
!2581 = !DILocation(line: 772, column: 23, scope: !2505)
!2582 = !DILocation(line: 772, column: 14, scope: !2505)
!2583 = !DILocation(line: 772, column: 10, scope: !2505)
!2584 = !DILocation(line: 772, column: 12, scope: !2505)
!2585 = !DILocalVariable(name: "i", scope: !2586, file: !21, line: 773, type: !11)
!2586 = distinct !DILexicalBlock(scope: !2505, file: !21, line: 773, column: 3)
!2587 = !DILocation(line: 773, column: 12, scope: !2586)
!2588 = !DILocation(line: 773, column: 8, scope: !2586)
!2589 = !DILocation(line: 773, column: 19, scope: !2590)
!2590 = !DILexicalBlockFile(scope: !2591, file: !21, discriminator: 1)
!2591 = distinct !DILexicalBlock(scope: !2586, file: !21, line: 773, column: 3)
!2592 = !DILocation(line: 773, column: 23, scope: !2590)
!2593 = !DILocation(line: 773, column: 21, scope: !2590)
!2594 = !DILocation(line: 773, column: 3, scope: !2590)
!2595 = !DILocation(line: 774, column: 26, scope: !2596)
!2596 = distinct !DILexicalBlock(scope: !2591, file: !21, line: 773, column: 40)
!2597 = !DILocation(line: 774, column: 32, scope: !2596)
!2598 = !DILocation(line: 774, column: 34, scope: !2596)
!2599 = !DILocation(line: 774, column: 33, scope: !2596)
!2600 = !DILocation(line: 774, column: 12, scope: !2596)
!2601 = !DILocation(line: 774, column: 14, scope: !2596)
!2602 = !DILocation(line: 774, column: 5, scope: !2596)
!2603 = !DILocation(line: 774, column: 17, scope: !2596)
!2604 = !DILocation(line: 774, column: 23, scope: !2596)
!2605 = !DILocation(line: 775, column: 3, scope: !2596)
!2606 = !DILocation(line: 773, column: 35, scope: !2607)
!2607 = !DILexicalBlockFile(scope: !2591, file: !21, discriminator: 2)
!2608 = !DILocation(line: 773, column: 3, scope: !2607)
!2609 = distinct !{!2609, !2610}
!2610 = !DILocation(line: 773, column: 3, scope: !2505)
!2611 = !DILocalVariable(name: "centers", scope: !2505, file: !21, line: 778, type: !35)
!2612 = !DILocation(line: 778, column: 10, scope: !2505)
!2613 = !DILocation(line: 779, column: 17, scope: !2505)
!2614 = !DILocation(line: 779, column: 11, scope: !2505)
!2615 = !DILocation(line: 779, column: 15, scope: !2505)
!2616 = !DILocation(line: 780, column: 31, scope: !2505)
!2617 = !DILocation(line: 780, column: 41, scope: !2505)
!2618 = !DILocation(line: 780, column: 24, scope: !2505)
!2619 = !DILocation(line: 780, column: 15, scope: !2505)
!2620 = !DILocation(line: 780, column: 11, scope: !2505)
!2621 = !DILocation(line: 780, column: 13, scope: !2505)
!2622 = !DILocation(line: 781, column: 11, scope: !2505)
!2623 = !DILocation(line: 781, column: 15, scope: !2505)
!2624 = !DILocalVariable(name: "i", scope: !2625, file: !21, line: 783, type: !11)
!2625 = distinct !DILexicalBlock(scope: !2505, file: !21, line: 783, column: 3)
!2626 = !DILocation(line: 783, column: 12, scope: !2625)
!2627 = !DILocation(line: 783, column: 8, scope: !2625)
!2628 = !DILocation(line: 783, column: 19, scope: !2629)
!2629 = !DILexicalBlockFile(scope: !2630, file: !21, discriminator: 1)
!2630 = distinct !DILexicalBlock(scope: !2625, file: !21, line: 783, column: 3)
!2631 = !DILocation(line: 783, column: 22, scope: !2629)
!2632 = !DILocation(line: 783, column: 20, scope: !2629)
!2633 = !DILocation(line: 783, column: 3, scope: !2629)
!2634 = !DILocation(line: 784, column: 27, scope: !2635)
!2635 = distinct !DILexicalBlock(scope: !2630, file: !21, line: 783, column: 40)
!2636 = !DILocation(line: 784, column: 39, scope: !2635)
!2637 = !DILocation(line: 784, column: 41, scope: !2635)
!2638 = !DILocation(line: 784, column: 40, scope: !2635)
!2639 = !DILocation(line: 784, column: 13, scope: !2635)
!2640 = !DILocation(line: 784, column: 15, scope: !2635)
!2641 = !DILocation(line: 784, column: 5, scope: !2635)
!2642 = !DILocation(line: 784, column: 18, scope: !2635)
!2643 = !DILocation(line: 784, column: 24, scope: !2635)
!2644 = !DILocation(line: 785, column: 13, scope: !2635)
!2645 = !DILocation(line: 785, column: 15, scope: !2635)
!2646 = !DILocation(line: 785, column: 5, scope: !2635)
!2647 = !DILocation(line: 785, column: 18, scope: !2635)
!2648 = !DILocation(line: 785, column: 25, scope: !2635)
!2649 = !DILocation(line: 786, column: 3, scope: !2635)
!2650 = !DILocation(line: 783, column: 35, scope: !2651)
!2651 = !DILexicalBlockFile(scope: !2630, file: !21, discriminator: 2)
!2652 = !DILocation(line: 783, column: 3, scope: !2651)
!2653 = distinct !{!2653, !2654}
!2654 = !DILocation(line: 783, column: 3, scope: !2505)
!2655 = !DILocalVariable(name: "IDoffset", scope: !2505, file: !21, line: 788, type: !27)
!2656 = !DILocation(line: 788, column: 8, scope: !2505)
!2657 = !DILocalVariable(name: "kfinal", scope: !2505, file: !21, line: 789, type: !27)
!2658 = !DILocation(line: 789, column: 8, scope: !2505)
!2659 = !DILocation(line: 790, column: 3, scope: !2505)
!2660 = !DILocalVariable(name: "numRead", scope: !2661, file: !21, line: 792, type: !171)
!2661 = distinct !DILexicalBlock(scope: !2505, file: !21, line: 790, column: 12)
!2662 = !DILocation(line: 792, column: 12, scope: !2661)
!2663 = !DILocation(line: 792, column: 23, scope: !2661)
!2664 = !DILocation(line: 792, column: 31, scope: !2661)
!2665 = !DILocation(line: 792, column: 36, scope: !2661)
!2666 = !DILocation(line: 792, column: 43, scope: !2661)
!2667 = !DILocation(line: 792, column: 48, scope: !2661)
!2668 = !DILocation(line: 793, column: 13, scope: !2661)
!2669 = !DILocation(line: 793, column: 39, scope: !2661)
!2670 = !DILocation(line: 793, column: 5, scope: !2661)
!2671 = !DILocation(line: 795, column: 9, scope: !2672)
!2672 = distinct !DILexicalBlock(scope: !2661, file: !21, line: 795, column: 9)
!2673 = !DILocation(line: 795, column: 17, scope: !2672)
!2674 = !DILocation(line: 795, column: 26, scope: !2672)
!2675 = !DILocation(line: 795, column: 29, scope: !2676)
!2676 = !DILexicalBlockFile(scope: !2672, file: !21, discriminator: 1)
!2677 = !DILocation(line: 795, column: 53, scope: !2676)
!2678 = !DILocation(line: 795, column: 39, scope: !2676)
!2679 = !DILocation(line: 795, column: 37, scope: !2676)
!2680 = !DILocation(line: 795, column: 63, scope: !2676)
!2681 = !DILocation(line: 795, column: 67, scope: !2682)
!2682 = !DILexicalBlockFile(scope: !2672, file: !21, discriminator: 2)
!2683 = !DILocation(line: 795, column: 75, scope: !2682)
!2684 = !DILocation(line: 795, column: 9, scope: !2682)
!2685 = !DILocation(line: 796, column: 15, scope: !2686)
!2686 = distinct !DILexicalBlock(scope: !2672, file: !21, line: 795, column: 84)
!2687 = !DILocation(line: 796, column: 7, scope: !2686)
!2688 = !DILocation(line: 797, column: 7, scope: !2686)
!2689 = !DILocation(line: 800, column: 18, scope: !2661)
!2690 = !DILocation(line: 800, column: 12, scope: !2661)
!2691 = !DILocation(line: 800, column: 16, scope: !2661)
!2692 = !DILocalVariable(name: "i", scope: !2693, file: !21, line: 801, type: !11)
!2693 = distinct !DILexicalBlock(scope: !2661, file: !21, line: 801, column: 5)
!2694 = !DILocation(line: 801, column: 14, scope: !2693)
!2695 = !DILocation(line: 801, column: 10, scope: !2693)
!2696 = !DILocation(line: 801, column: 21, scope: !2697)
!2697 = !DILexicalBlockFile(scope: !2698, file: !21, discriminator: 1)
!2698 = distinct !DILexicalBlock(scope: !2693, file: !21, line: 801, column: 5)
!2699 = !DILocation(line: 801, column: 32, scope: !2697)
!2700 = !DILocation(line: 801, column: 23, scope: !2697)
!2701 = !DILocation(line: 801, column: 5, scope: !2697)
!2702 = !DILocation(line: 802, column: 14, scope: !2703)
!2703 = distinct !DILexicalBlock(scope: !2698, file: !21, line: 801, column: 43)
!2704 = !DILocation(line: 802, column: 16, scope: !2703)
!2705 = !DILocation(line: 802, column: 7, scope: !2703)
!2706 = !DILocation(line: 802, column: 19, scope: !2703)
!2707 = !DILocation(line: 802, column: 26, scope: !2703)
!2708 = !DILocation(line: 803, column: 5, scope: !2703)
!2709 = !DILocation(line: 801, column: 38, scope: !2710)
!2710 = !DILexicalBlockFile(scope: !2698, file: !21, discriminator: 2)
!2711 = !DILocation(line: 801, column: 5, scope: !2710)
!2712 = distinct !{!2712, !2713}
!2713 = !DILocation(line: 801, column: 5, scope: !2661)
!2714 = !DILocation(line: 805, column: 46, scope: !2661)
!2715 = !DILocation(line: 805, column: 49, scope: !2661)
!2716 = !DILocation(line: 805, column: 32, scope: !2661)
!2717 = !DILocation(line: 805, column: 23, scope: !2661)
!2718 = !DILocation(line: 806, column: 38, scope: !2661)
!2719 = !DILocation(line: 806, column: 24, scope: !2661)
!2720 = !DILocation(line: 806, column: 15, scope: !2661)
!2721 = !DILocation(line: 807, column: 40, scope: !2661)
!2722 = !DILocation(line: 807, column: 43, scope: !2661)
!2723 = !DILocation(line: 807, column: 26, scope: !2661)
!2724 = !DILocation(line: 807, column: 20, scope: !2661)
!2725 = !DILocation(line: 807, column: 18, scope: !2661)
!2726 = !DILocation(line: 809, column: 25, scope: !2661)
!2727 = !DILocation(line: 809, column: 31, scope: !2661)
!2728 = !DILocation(line: 809, column: 5, scope: !2661)
!2729 = !DILocation(line: 811, column: 13, scope: !2661)
!2730 = !DILocation(line: 811, column: 5, scope: !2661)
!2731 = !DILocation(line: 813, column: 5, scope: !2661)
!2732 = !DILocation(line: 814, column: 17, scope: !2661)
!2733 = !DILocation(line: 816, column: 9, scope: !2734)
!2734 = distinct !DILexicalBlock(scope: !2661, file: !21, line: 816, column: 9)
!2735 = !DILocation(line: 816, column: 26, scope: !2734)
!2736 = !DILocation(line: 816, column: 16, scope: !2734)
!2737 = !DILocation(line: 816, column: 32, scope: !2734)
!2738 = !DILocation(line: 816, column: 30, scope: !2734)
!2739 = !DILocation(line: 816, column: 9, scope: !2661)
!2740 = !DILocation(line: 818, column: 15, scope: !2741)
!2741 = distinct !DILexicalBlock(scope: !2734, file: !21, line: 816, column: 45)
!2742 = !DILocation(line: 818, column: 7, scope: !2741)
!2743 = !DILocation(line: 819, column: 7, scope: !2741)
!2744 = !DILocation(line: 826, column: 36, scope: !2661)
!2745 = !DILocation(line: 826, column: 47, scope: !2661)
!2746 = !DILocation(line: 826, column: 5, scope: !2661)
!2747 = !DILocation(line: 827, column: 17, scope: !2661)
!2748 = !DILocation(line: 827, column: 14, scope: !2661)
!2749 = !DILocation(line: 833, column: 10, scope: !2661)
!2750 = !DILocation(line: 833, column: 5, scope: !2661)
!2751 = !DILocation(line: 834, column: 10, scope: !2661)
!2752 = !DILocation(line: 834, column: 5, scope: !2661)
!2753 = !DILocation(line: 835, column: 10, scope: !2661)
!2754 = !DILocation(line: 835, column: 5, scope: !2661)
!2755 = !DILocation(line: 837, column: 9, scope: !2756)
!2756 = distinct !DILexicalBlock(scope: !2661, file: !21, line: 837, column: 9)
!2757 = !DILocation(line: 837, column: 17, scope: !2756)
!2758 = !DILocation(line: 837, column: 9, scope: !2661)
!2759 = !DILocation(line: 838, column: 7, scope: !2760)
!2760 = distinct !DILexicalBlock(scope: !2756, file: !21, line: 837, column: 26)
!2761 = !DILocation(line: 790, column: 3, scope: !2762)
!2762 = !DILexicalBlockFile(scope: !2505, file: !21, discriminator: 1)
!2763 = distinct !{!2763, !2659}
!2764 = !DILocation(line: 843, column: 45, scope: !2505)
!2765 = !DILocation(line: 843, column: 48, scope: !2505)
!2766 = !DILocation(line: 843, column: 30, scope: !2505)
!2767 = !DILocation(line: 843, column: 21, scope: !2505)
!2768 = !DILocation(line: 844, column: 37, scope: !2505)
!2769 = !DILocation(line: 844, column: 22, scope: !2505)
!2770 = !DILocation(line: 844, column: 13, scope: !2505)
!2771 = !DILocation(line: 845, column: 39, scope: !2505)
!2772 = !DILocation(line: 845, column: 42, scope: !2505)
!2773 = !DILocation(line: 845, column: 24, scope: !2505)
!2774 = !DILocation(line: 845, column: 18, scope: !2505)
!2775 = !DILocation(line: 845, column: 16, scope: !2505)
!2776 = !DILocation(line: 847, column: 26, scope: !2505)
!2777 = !DILocation(line: 847, column: 32, scope: !2505)
!2778 = !DILocation(line: 847, column: 3, scope: !2505)
!2779 = !DILocation(line: 848, column: 3, scope: !2505)
!2780 = !DILocation(line: 849, column: 27, scope: !2505)
!2781 = !DILocation(line: 849, column: 38, scope: !2505)
!2782 = !DILocation(line: 849, column: 3, scope: !2505)
!2783 = !DILocation(line: 850, column: 1, scope: !2505)
!2784 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 852, type: !2785, isLocal: false, isDefinition: true, scopeLine: 853, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !22)
!2785 = !DISubroutineType(types: !2786)
!2786 = !{!11, !11, !2787}
!2787 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !245, size: 64, align: 64)
!2788 = !DILocalVariable(name: "argc", arg: 1, scope: !2784, file: !21, line: 852, type: !11)
!2789 = !DILocation(line: 852, column: 14, scope: !2784)
!2790 = !DILocalVariable(name: "argv", arg: 2, scope: !2784, file: !21, line: 852, type: !2787)
!2791 = !DILocation(line: 852, column: 27, scope: !2784)
!2792 = !DILocalVariable(name: "outfilename", scope: !2784, file: !21, line: 854, type: !245)
!2793 = !DILocation(line: 854, column: 9, scope: !2784)
!2794 = !DILocation(line: 854, column: 23, scope: !2784)
!2795 = !DILocalVariable(name: "infilename", scope: !2784, file: !21, line: 855, type: !245)
!2796 = !DILocation(line: 855, column: 9, scope: !2784)
!2797 = !DILocation(line: 855, column: 22, scope: !2784)
!2798 = !DILocalVariable(name: "kmin", scope: !2784, file: !21, line: 856, type: !27)
!2799 = !DILocation(line: 856, column: 8, scope: !2784)
!2800 = !DILocalVariable(name: "kmax", scope: !2784, file: !21, line: 856, type: !27)
!2801 = !DILocation(line: 856, column: 14, scope: !2784)
!2802 = !DILocalVariable(name: "n", scope: !2784, file: !21, line: 856, type: !27)
!2803 = !DILocation(line: 856, column: 20, scope: !2784)
!2804 = !DILocalVariable(name: "chunksize", scope: !2784, file: !21, line: 856, type: !27)
!2805 = !DILocation(line: 856, column: 23, scope: !2784)
!2806 = !DILocalVariable(name: "clustersize", scope: !2784, file: !21, line: 856, type: !27)
!2807 = !DILocation(line: 856, column: 34, scope: !2784)
!2808 = !DILocalVariable(name: "dim", scope: !2784, file: !21, line: 857, type: !11)
!2809 = !DILocation(line: 857, column: 7, scope: !2784)
!2810 = !DILocation(line: 864, column: 9, scope: !2784)
!2811 = !DILocation(line: 865, column: 2, scope: !2784)
!2812 = !DILocation(line: 871, column: 7, scope: !2813)
!2813 = distinct !DILexicalBlock(scope: !2784, file: !21, line: 871, column: 7)
!2814 = !DILocation(line: 871, column: 11, scope: !2813)
!2815 = !DILocation(line: 871, column: 7, scope: !2784)
!2816 = !DILocation(line: 872, column: 13, scope: !2817)
!2817 = distinct !DILexicalBlock(scope: !2813, file: !21, line: 871, column: 16)
!2818 = !DILocation(line: 873, column: 6, scope: !2817)
!2819 = !DILocation(line: 872, column: 5, scope: !2817)
!2820 = !DILocation(line: 874, column: 13, scope: !2817)
!2821 = !DILocation(line: 874, column: 5, scope: !2817)
!2822 = !DILocation(line: 875, column: 13, scope: !2817)
!2823 = !DILocation(line: 875, column: 5, scope: !2817)
!2824 = !DILocation(line: 876, column: 13, scope: !2817)
!2825 = !DILocation(line: 876, column: 5, scope: !2817)
!2826 = !DILocation(line: 877, column: 13, scope: !2817)
!2827 = !DILocation(line: 877, column: 5, scope: !2817)
!2828 = !DILocation(line: 878, column: 13, scope: !2817)
!2829 = !DILocation(line: 878, column: 5, scope: !2817)
!2830 = !DILocation(line: 879, column: 13, scope: !2817)
!2831 = !DILocation(line: 879, column: 5, scope: !2817)
!2832 = !DILocation(line: 880, column: 13, scope: !2817)
!2833 = !DILocation(line: 880, column: 5, scope: !2817)
!2834 = !DILocation(line: 881, column: 13, scope: !2817)
!2835 = !DILocation(line: 881, column: 5, scope: !2817)
!2836 = !DILocation(line: 882, column: 13, scope: !2817)
!2837 = !DILocation(line: 882, column: 5, scope: !2817)
!2838 = !DILocation(line: 883, column: 13, scope: !2817)
!2839 = !DILocation(line: 883, column: 5, scope: !2817)
!2840 = !DILocation(line: 884, column: 13, scope: !2817)
!2841 = !DILocation(line: 884, column: 5, scope: !2817)
!2842 = !DILocation(line: 885, column: 5, scope: !2817)
!2843 = !DILocation(line: 887, column: 15, scope: !2784)
!2844 = !DILocation(line: 887, column: 10, scope: !2784)
!2845 = !DILocation(line: 887, column: 8, scope: !2784)
!2846 = !DILocation(line: 888, column: 15, scope: !2784)
!2847 = !DILocation(line: 888, column: 10, scope: !2784)
!2848 = !DILocation(line: 888, column: 8, scope: !2784)
!2849 = !DILocation(line: 889, column: 14, scope: !2784)
!2850 = !DILocation(line: 889, column: 9, scope: !2784)
!2851 = !DILocation(line: 889, column: 7, scope: !2784)
!2852 = !DILocation(line: 890, column: 12, scope: !2784)
!2853 = !DILocation(line: 890, column: 7, scope: !2784)
!2854 = !DILocation(line: 890, column: 5, scope: !2784)
!2855 = !DILocation(line: 891, column: 20, scope: !2784)
!2856 = !DILocation(line: 891, column: 15, scope: !2784)
!2857 = !DILocation(line: 891, column: 13, scope: !2784)
!2858 = !DILocation(line: 892, column: 22, scope: !2784)
!2859 = !DILocation(line: 892, column: 17, scope: !2784)
!2860 = !DILocation(line: 892, column: 15, scope: !2784)
!2861 = !DILocation(line: 893, column: 10, scope: !2784)
!2862 = !DILocation(line: 893, column: 22, scope: !2784)
!2863 = !DILocation(line: 893, column: 3, scope: !2784)
!2864 = !DILocation(line: 894, column: 10, scope: !2784)
!2865 = !DILocation(line: 894, column: 23, scope: !2784)
!2866 = !DILocation(line: 894, column: 3, scope: !2784)
!2867 = !DILocation(line: 895, column: 16, scope: !2784)
!2868 = !DILocation(line: 895, column: 11, scope: !2784)
!2869 = !DILocation(line: 895, column: 9, scope: !2784)
!2870 = !DILocation(line: 897, column: 3, scope: !2784)
!2871 = !DILocalVariable(name: "stream", scope: !2784, file: !21, line: 898, type: !2508)
!2872 = !DILocation(line: 898, column: 12, scope: !2784)
!2873 = !DILocation(line: 899, column: 7, scope: !2874)
!2874 = distinct !DILexicalBlock(scope: !2784, file: !21, line: 899, column: 7)
!2875 = !DILocation(line: 899, column: 9, scope: !2874)
!2876 = !DILocation(line: 899, column: 7, scope: !2784)
!2877 = !DILocation(line: 900, column: 14, scope: !2878)
!2878 = distinct !DILexicalBlock(scope: !2874, file: !21, line: 899, column: 15)
!2879 = !DILocation(line: 900, column: 28, scope: !2878)
!2880 = !DILocation(line: 900, column: 18, scope: !2878)
!2881 = !DILocation(line: 900, column: 14, scope: !2882)
!2882 = !DILexicalBlockFile(scope: !2878, file: !21, discriminator: 1)
!2883 = !DILocation(line: 900, column: 12, scope: !2882)
!2884 = !DILocation(line: 901, column: 3, scope: !2878)
!2885 = !DILocation(line: 959, column: 1, scope: !2878)
!2886 = !DILocation(line: 900, column: 14, scope: !2887)
!2887 = !DILexicalBlockFile(scope: !2878, file: !21, discriminator: 2)
!2888 = !DILocation(line: 903, column: 14, scope: !2889)
!2889 = distinct !DILexicalBlock(scope: !2874, file: !21, line: 902, column: 8)
!2890 = !DILocation(line: 903, column: 29, scope: !2889)
!2891 = !DILocation(line: 903, column: 18, scope: !2889)
!2892 = !DILocation(line: 903, column: 14, scope: !2893)
!2893 = !DILexicalBlockFile(scope: !2889, file: !21, discriminator: 1)
!2894 = !DILocation(line: 903, column: 12, scope: !2893)
!2895 = !DILocation(line: 959, column: 1, scope: !2893)
!2896 = !DILocation(line: 903, column: 14, scope: !2897)
!2897 = !DILexicalBlockFile(scope: !2889, file: !21, discriminator: 2)
!2898 = !DILocalVariable(name: "t1", scope: !2784, file: !21, line: 906, type: !69)
!2899 = !DILocation(line: 906, column: 10, scope: !2784)
!2900 = !DILocation(line: 906, column: 15, scope: !2784)
!2901 = !DILocation(line: 912, column: 11, scope: !2784)
!2902 = !DILocation(line: 913, column: 15, scope: !2784)
!2903 = !DILocation(line: 914, column: 15, scope: !2784)
!2904 = !DILocation(line: 915, column: 10, scope: !2784)
!2905 = !DILocation(line: 916, column: 9, scope: !2784)
!2906 = !DILocation(line: 917, column: 11, scope: !2784)
!2907 = !DILocation(line: 919, column: 17, scope: !2784)
!2908 = !DILocation(line: 921, column: 17, scope: !2784)
!2909 = !DILocation(line: 921, column: 25, scope: !2784)
!2910 = !DILocation(line: 921, column: 31, scope: !2784)
!2911 = !DILocation(line: 921, column: 37, scope: !2784)
!2912 = !DILocation(line: 921, column: 42, scope: !2784)
!2913 = !DILocation(line: 921, column: 53, scope: !2784)
!2914 = !DILocation(line: 921, column: 66, scope: !2784)
!2915 = !DILocation(line: 921, column: 3, scope: !2784)
!2916 = !DILocation(line: 923, column: 2, scope: !2784)
!2917 = !DILocation(line: 924, column: 2, scope: !2784)
!2918 = !DILocalVariable(name: "t2", scope: !2784, file: !21, line: 930, type: !69)
!2919 = !DILocation(line: 930, column: 10, scope: !2784)
!2920 = !DILocation(line: 930, column: 15, scope: !2784)
!2921 = !DILocation(line: 932, column: 26, scope: !2784)
!2922 = !DILocation(line: 932, column: 29, scope: !2784)
!2923 = !DILocation(line: 932, column: 28, scope: !2784)
!2924 = !DILocation(line: 932, column: 3, scope: !2784)
!2925 = !DILocation(line: 934, column: 10, scope: !2784)
!2926 = !DILocation(line: 934, column: 3, scope: !2784)
!2927 = !DILocation(line: 934, column: 3, scope: !2928)
!2928 = !DILexicalBlockFile(scope: !2784, file: !21, discriminator: 1)
!2929 = !DILocation(line: 937, column: 33, scope: !2784)
!2930 = !DILocation(line: 937, column: 3, scope: !2784)
!2931 = !DILocation(line: 938, column: 38, scope: !2784)
!2932 = !DILocation(line: 938, column: 3, scope: !2784)
!2933 = !DILocation(line: 939, column: 38, scope: !2784)
!2934 = !DILocation(line: 939, column: 3, scope: !2784)
!2935 = !DILocation(line: 940, column: 35, scope: !2784)
!2936 = !DILocation(line: 940, column: 3, scope: !2784)
!2937 = !DILocation(line: 941, column: 35, scope: !2784)
!2938 = !DILocation(line: 941, column: 3, scope: !2784)
!2939 = !DILocation(line: 942, column: 36, scope: !2784)
!2940 = !DILocation(line: 942, column: 3, scope: !2784)
!2941 = !DILocation(line: 943, column: 39, scope: !2784)
!2942 = !DILocation(line: 943, column: 3, scope: !2784)
!2943 = !DILocation(line: 944, column: 3, scope: !2784)
!2944 = !DILocation(line: 945, column: 3, scope: !2784)
!2945 = !DILocation(line: 946, column: 34, scope: !2784)
!2946 = !DILocation(line: 946, column: 42, scope: !2784)
!2947 = !DILocation(line: 946, column: 3, scope: !2784)
!2948 = !DILocation(line: 947, column: 50, scope: !2784)
!2949 = !DILocation(line: 947, column: 62, scope: !2784)
!2950 = !DILocation(line: 947, column: 3, scope: !2784)
!2951 = !DILocation(line: 948, column: 55, scope: !2784)
!2952 = !DILocation(line: 948, column: 67, scope: !2784)
!2953 = !DILocation(line: 948, column: 3, scope: !2784)
!2954 = !DILocation(line: 949, column: 38, scope: !2784)
!2955 = !DILocation(line: 949, column: 45, scope: !2784)
!2956 = !DILocation(line: 949, column: 3, scope: !2784)
!2957 = !DILocation(line: 950, column: 36, scope: !2784)
!2958 = !DILocation(line: 950, column: 42, scope: !2784)
!2959 = !DILocation(line: 950, column: 3, scope: !2784)
!2960 = !DILocation(line: 951, column: 34, scope: !2784)
!2961 = !DILocation(line: 951, column: 42, scope: !2784)
!2962 = !DILocation(line: 951, column: 3, scope: !2784)
!2963 = !DILocation(line: 958, column: 3, scope: !2784)
!2964 = !DILocation(line: 900, column: 14, scope: !2965)
!2965 = !DILexicalBlockFile(scope: !2878, file: !21, discriminator: 3)
!2966 = distinct !DISubprogram(name: "SimStream", linkageName: "_ZN9SimStreamC2El", scope: !2967, file: !31, line: 75, type: !2972, isLocal: false, isDefinition: true, scopeLine: 75, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !2971, variables: !22)
!2967 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "SimStream", file: !31, line: 73, size: 128, align: 64, elements: !2968, vtableHolder: !2509, identifier: "_ZTS9SimStream")
!2968 = !{!2969, !2970, !2971, !2975, !2978, !2981, !2982}
!2969 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2967, baseType: !2509, flags: DIFlagPublic)
!2970 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !2967, file: !31, line: 98, baseType: !27, size: 64, align: 64, offset: 64)
!2971 = !DISubprogram(name: "SimStream", scope: !2967, file: !31, line: 75, type: !2972, isLocal: false, isDefinition: false, scopeLine: 75, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2972 = !DISubroutineType(types: !2973)
!2973 = !{null, !2974, !27}
!2974 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2967, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2975 = !DISubprogram(name: "read", linkageName: "_ZN9SimStream4readEPfii", scope: !2967, file: !31, line: 78, type: !2976, isLocal: false, isDefinition: false, scopeLine: 78, containingType: !2967, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2976 = !DISubroutineType(types: !2977)
!2977 = !{!171, !2974, !24, !11, !11}
!2978 = !DISubprogram(name: "ferror", linkageName: "_ZN9SimStream6ferrorEv", scope: !2967, file: !31, line: 89, type: !2979, isLocal: false, isDefinition: false, scopeLine: 89, containingType: !2967, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2979 = !DISubroutineType(types: !2980)
!2980 = !{!11, !2974}
!2981 = !DISubprogram(name: "feof", linkageName: "_ZN9SimStream4feofEv", scope: !2967, file: !31, line: 92, type: !2979, isLocal: false, isDefinition: false, scopeLine: 92, containingType: !2967, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2982 = !DISubprogram(name: "~SimStream", scope: !2967, file: !31, line: 95, type: !2983, isLocal: false, isDefinition: false, scopeLine: 95, containingType: !2967, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!2983 = !DISubroutineType(types: !2984)
!2984 = !{null, !2974}
!2985 = !DILocalVariable(name: "this", arg: 1, scope: !2966, type: !2986, flags: DIFlagArtificial | DIFlagObjectPointer)
!2986 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2967, size: 64, align: 64)
!2987 = !DILocation(line: 0, scope: !2966)
!2988 = !DILocalVariable(name: "n_", arg: 2, scope: !2966, file: !31, line: 75, type: !27)
!2989 = !DILocation(line: 75, column: 18, scope: !2966)
!2990 = !DILocation(line: 75, column: 23, scope: !2966)
!2991 = !DILocation(line: 75, column: 3, scope: !2966)
!2992 = !DILocation(line: 76, column: 9, scope: !2993)
!2993 = distinct !DILexicalBlock(scope: !2966, file: !31, line: 75, column: 23)
!2994 = !DILocation(line: 76, column: 5, scope: !2993)
!2995 = !DILocation(line: 76, column: 7, scope: !2993)
!2996 = !DILocation(line: 77, column: 3, scope: !2966)
!2997 = distinct !DISubprogram(name: "FileStream", linkageName: "_ZN10FileStreamC2EPc", scope: !2998, file: !31, line: 103, type: !3003, isLocal: false, isDefinition: true, scopeLine: 103, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !3002, variables: !22)
!2998 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "FileStream", file: !31, line: 101, size: 128, align: 64, elements: !2999, vtableHolder: !2509, identifier: "_ZTS10FileStream")
!2999 = !{!3000, !3001, !3002, !3006, !3009, !3012, !3013}
!3000 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2998, baseType: !2509, flags: DIFlagPublic)
!3001 = !DIDerivedType(tag: DW_TAG_member, name: "fp", scope: !2998, file: !31, line: 124, baseType: !491, size: 64, align: 64, offset: 64)
!3002 = !DISubprogram(name: "FileStream", scope: !2998, file: !31, line: 103, type: !3003, isLocal: false, isDefinition: false, scopeLine: 103, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!3003 = !DISubroutineType(types: !3004)
!3004 = !{null, !3005, !245}
!3005 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2998, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!3006 = !DISubprogram(name: "read", linkageName: "_ZN10FileStream4readEPfii", scope: !2998, file: !31, line: 110, type: !3007, isLocal: false, isDefinition: false, scopeLine: 110, containingType: !2998, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!3007 = !DISubroutineType(types: !3008)
!3008 = !{!171, !3005, !24, !11, !11}
!3009 = !DISubprogram(name: "ferror", linkageName: "_ZN10FileStream6ferrorEv", scope: !2998, file: !31, line: 113, type: !3010, isLocal: false, isDefinition: false, scopeLine: 113, containingType: !2998, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 1, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!3010 = !DISubroutineType(types: !3011)
!3011 = !{!11, !3005}
!3012 = !DISubprogram(name: "feof", linkageName: "_ZN10FileStream4feofEv", scope: !2998, file: !31, line: 116, type: !3010, isLocal: false, isDefinition: false, scopeLine: 116, containingType: !2998, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 2, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!3013 = !DISubprogram(name: "~FileStream", scope: !2998, file: !31, line: 119, type: !3014, isLocal: false, isDefinition: false, scopeLine: 119, containingType: !2998, virtuality: DW_VIRTUALITY_virtual, virtualIndex: 0, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!3014 = !DISubroutineType(types: !3015)
!3015 = !{null, !3005}
!3016 = !DILocalVariable(name: "this", arg: 1, scope: !2997, type: !3017, flags: DIFlagArtificial | DIFlagObjectPointer)
!3017 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2998, size: 64, align: 64)
!3018 = !DILocation(line: 0, scope: !2997)
!3019 = !DILocalVariable(name: "filename", arg: 2, scope: !2997, file: !31, line: 103, type: !245)
!3020 = !DILocation(line: 103, column: 20, scope: !2997)
!3021 = !DILocation(line: 103, column: 30, scope: !2997)
!3022 = !DILocation(line: 103, column: 3, scope: !2997)
!3023 = !DILocation(line: 104, column: 17, scope: !3024)
!3024 = distinct !DILexicalBlock(scope: !2997, file: !31, line: 103, column: 30)
!3025 = !DILocation(line: 104, column: 10, scope: !3024)
!3026 = !DILocation(line: 104, column: 5, scope: !3027)
!3027 = !DILexicalBlockFile(scope: !3024, file: !31, discriminator: 1)
!3028 = !DILocation(line: 104, column: 8, scope: !3027)
!3029 = !DILocation(line: 105, column: 9, scope: !3030)
!3030 = distinct !DILexicalBlock(scope: !3024, file: !31, line: 105, column: 9)
!3031 = !DILocation(line: 105, column: 12, scope: !3030)
!3032 = !DILocation(line: 105, column: 9, scope: !3024)
!3033 = !DILocation(line: 106, column: 15, scope: !3034)
!3034 = distinct !DILexicalBlock(scope: !3030, file: !31, line: 105, column: 22)
!3035 = !DILocation(line: 106, column: 49, scope: !3034)
!3036 = !DILocation(line: 106, column: 7, scope: !3034)
!3037 = !DILocation(line: 107, column: 7, scope: !3034)
!3038 = !DILocation(line: 109, column: 3, scope: !3024)
!3039 = !DILocation(line: 109, column: 3, scope: !3040)
!3040 = !DILexicalBlockFile(scope: !2997, file: !31, discriminator: 1)
!3041 = !DILocation(line: 109, column: 3, scope: !3042)
!3042 = !DILexicalBlockFile(scope: !3024, file: !31, discriminator: 2)
!3043 = !DILocation(line: 109, column: 3, scope: !3044)
!3044 = !DILexicalBlockFile(scope: !3024, file: !31, discriminator: 3)
!3045 = !DILocation(line: 109, column: 3, scope: !3046)
!3046 = !DILexicalBlockFile(scope: !3024, file: !31, discriminator: 4)
!3047 = distinct !DISubprogram(name: "PStream", linkageName: "_ZN7PStreamC2Ev", scope: !2509, file: !31, line: 63, type: !2523, isLocal: false, isDefinition: true, scopeLine: 63, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !3048, variables: !22)
!3048 = !DISubprogram(name: "PStream", scope: !2509, type: !2523, isLocal: false, isDefinition: false, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!3049 = !DILocalVariable(name: "this", arg: 1, scope: !3047, type: !2508, flags: DIFlagArtificial | DIFlagObjectPointer)
!3050 = !DILocation(line: 0, scope: !3047)
!3051 = !DILocation(line: 63, column: 7, scope: !3047)
!3052 = distinct !DISubprogram(name: "read", linkageName: "_ZN9SimStream4readEPfii", scope: !2967, file: !31, line: 78, type: !2976, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !2975, variables: !22)
!3053 = !DILocalVariable(name: "this", arg: 1, scope: !3052, type: !2986, flags: DIFlagArtificial | DIFlagObjectPointer)
!3054 = !DILocation(line: 0, scope: !3052)
!3055 = !DILocalVariable(name: "dest", arg: 2, scope: !3052, file: !31, line: 78, type: !24)
!3056 = !DILocation(line: 78, column: 23, scope: !3052)
!3057 = !DILocalVariable(name: "dim", arg: 3, scope: !3052, file: !31, line: 78, type: !11)
!3058 = !DILocation(line: 78, column: 33, scope: !3052)
!3059 = !DILocalVariable(name: "num", arg: 4, scope: !3052, file: !31, line: 78, type: !11)
!3060 = !DILocation(line: 78, column: 42, scope: !3052)
!3061 = !DILocalVariable(name: "count", scope: !3052, file: !31, line: 79, type: !171)
!3062 = !DILocation(line: 79, column: 12, scope: !3052)
!3063 = !DILocalVariable(name: "i", scope: !3064, file: !31, line: 80, type: !11)
!3064 = distinct !DILexicalBlock(scope: !3052, file: !31, line: 80, column: 5)
!3065 = !DILocation(line: 80, column: 14, scope: !3064)
!3066 = !DILocation(line: 80, column: 10, scope: !3064)
!3067 = !DILocation(line: 80, column: 21, scope: !3068)
!3068 = !DILexicalBlockFile(scope: !3069, file: !31, discriminator: 1)
!3069 = distinct !DILexicalBlock(scope: !3064, file: !31, line: 80, column: 5)
!3070 = !DILocation(line: 80, column: 25, scope: !3068)
!3071 = !DILocation(line: 80, column: 23, scope: !3068)
!3072 = !DILocation(line: 80, column: 29, scope: !3068)
!3073 = !DILocation(line: 80, column: 32, scope: !3074)
!3074 = !DILexicalBlockFile(scope: !3069, file: !31, discriminator: 2)
!3075 = !DILocation(line: 80, column: 34, scope: !3074)
!3076 = !DILocation(line: 80, column: 5, scope: !3077)
!3077 = !DILexicalBlockFile(scope: !3064, file: !31, discriminator: 3)
!3078 = !DILocalVariable(name: "k", scope: !3079, file: !31, line: 81, type: !11)
!3079 = distinct !DILexicalBlock(scope: !3080, file: !31, line: 81, column: 7)
!3080 = distinct !DILexicalBlock(scope: !3069, file: !31, line: 80, column: 45)
!3081 = !DILocation(line: 81, column: 16, scope: !3079)
!3082 = !DILocation(line: 81, column: 12, scope: !3079)
!3083 = !DILocation(line: 81, column: 23, scope: !3084)
!3084 = !DILexicalBlockFile(scope: !3085, file: !31, discriminator: 1)
!3085 = distinct !DILexicalBlock(scope: !3079, file: !31, line: 81, column: 7)
!3086 = !DILocation(line: 81, column: 27, scope: !3084)
!3087 = !DILocation(line: 81, column: 25, scope: !3084)
!3088 = !DILocation(line: 81, column: 7, scope: !3084)
!3089 = !DILocation(line: 82, column: 20, scope: !3090)
!3090 = distinct !DILexicalBlock(scope: !3085, file: !31, line: 81, column: 38)
!3091 = !DILocation(line: 82, column: 29, scope: !3090)
!3092 = !DILocation(line: 82, column: 2, scope: !3090)
!3093 = !DILocation(line: 82, column: 7, scope: !3090)
!3094 = !DILocation(line: 82, column: 9, scope: !3090)
!3095 = !DILocation(line: 82, column: 8, scope: !3090)
!3096 = !DILocation(line: 82, column: 15, scope: !3090)
!3097 = !DILocation(line: 82, column: 13, scope: !3090)
!3098 = !DILocation(line: 82, column: 18, scope: !3090)
!3099 = !DILocation(line: 83, column: 7, scope: !3090)
!3100 = !DILocation(line: 81, column: 33, scope: !3101)
!3101 = !DILexicalBlockFile(scope: !3085, file: !31, discriminator: 2)
!3102 = !DILocation(line: 81, column: 7, scope: !3101)
!3103 = distinct !{!3103, !3104}
!3104 = !DILocation(line: 81, column: 7, scope: !3080)
!3105 = !DILocation(line: 84, column: 7, scope: !3080)
!3106 = !DILocation(line: 84, column: 8, scope: !3080)
!3107 = !DILocation(line: 85, column: 12, scope: !3080)
!3108 = !DILocation(line: 86, column: 5, scope: !3080)
!3109 = !DILocation(line: 80, column: 40, scope: !3110)
!3110 = !DILexicalBlockFile(scope: !3069, file: !31, discriminator: 4)
!3111 = !DILocation(line: 80, column: 5, scope: !3110)
!3112 = distinct !{!3112, !3113}
!3113 = !DILocation(line: 80, column: 5, scope: !3052)
!3114 = !DILocation(line: 87, column: 12, scope: !3052)
!3115 = !DILocation(line: 87, column: 5, scope: !3052)
!3116 = distinct !DISubprogram(name: "ferror", linkageName: "_ZN9SimStream6ferrorEv", scope: !2967, file: !31, line: 89, type: !2979, isLocal: false, isDefinition: true, scopeLine: 89, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !2978, variables: !22)
!3117 = !DILocalVariable(name: "this", arg: 1, scope: !3116, type: !2986, flags: DIFlagArtificial | DIFlagObjectPointer)
!3118 = !DILocation(line: 0, scope: !3116)
!3119 = !DILocation(line: 90, column: 5, scope: !3116)
!3120 = distinct !DISubprogram(name: "feof", linkageName: "_ZN9SimStream4feofEv", scope: !2967, file: !31, line: 92, type: !2979, isLocal: false, isDefinition: true, scopeLine: 92, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !2981, variables: !22)
!3121 = !DILocalVariable(name: "this", arg: 1, scope: !3120, type: !2986, flags: DIFlagArtificial | DIFlagObjectPointer)
!3122 = !DILocation(line: 0, scope: !3120)
!3123 = !DILocation(line: 93, column: 12, scope: !3120)
!3124 = !DILocation(line: 93, column: 14, scope: !3120)
!3125 = !DILocation(line: 93, column: 5, scope: !3120)
!3126 = distinct !DISubprogram(name: "~SimStream", linkageName: "_ZN9SimStreamD2Ev", scope: !2967, file: !31, line: 95, type: !2983, isLocal: false, isDefinition: true, scopeLine: 95, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !2982, variables: !22)
!3127 = !DILocalVariable(name: "this", arg: 1, scope: !3126, type: !2986, flags: DIFlagArtificial | DIFlagObjectPointer)
!3128 = !DILocation(line: 0, scope: !3126)
!3129 = !DILocation(line: 96, column: 3, scope: !3130)
!3130 = distinct !DILexicalBlock(scope: !3126, file: !31, line: 95, column: 16)
!3131 = !DILocation(line: 96, column: 3, scope: !3126)
!3132 = distinct !DISubprogram(name: "~SimStream", linkageName: "_ZN9SimStreamD0Ev", scope: !2967, file: !31, line: 95, type: !2983, isLocal: false, isDefinition: true, scopeLine: 95, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !2982, variables: !22)
!3133 = !DILocalVariable(name: "this", arg: 1, scope: !3132, type: !2986, flags: DIFlagArtificial | DIFlagObjectPointer)
!3134 = !DILocation(line: 0, scope: !3132)
!3135 = !DILocation(line: 95, column: 16, scope: !3132)
!3136 = !DILocation(line: 95, column: 16, scope: !3137)
!3137 = !DILexicalBlockFile(scope: !3132, file: !31, discriminator: 1)
!3138 = !DILocation(line: 96, column: 3, scope: !3132)
!3139 = !DILocation(line: 96, column: 3, scope: !3137)
!3140 = !DILocation(line: 95, column: 16, scope: !3141)
!3141 = !DILexicalBlockFile(scope: !3132, file: !31, discriminator: 2)
!3142 = !DILocation(line: 95, column: 16, scope: !3143)
!3143 = !DILexicalBlockFile(scope: !3132, file: !31, discriminator: 3)
!3144 = distinct !DISubprogram(name: "~PStream", linkageName: "_ZN7PStreamD2Ev", scope: !2509, file: !31, line: 68, type: !2523, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !2522, variables: !22)
!3145 = !DILocalVariable(name: "this", arg: 1, scope: !3144, type: !2508, flags: DIFlagArtificial | DIFlagObjectPointer)
!3146 = !DILocation(line: 0, scope: !3144)
!3147 = !DILocation(line: 69, column: 3, scope: !3144)
!3148 = distinct !DISubprogram(name: "~PStream", linkageName: "_ZN7PStreamD0Ev", scope: !2509, file: !31, line: 68, type: !2523, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !2522, variables: !22)
!3149 = !DILocalVariable(name: "this", arg: 1, scope: !3148, type: !2508, flags: DIFlagArtificial | DIFlagObjectPointer)
!3150 = !DILocation(line: 0, scope: !3148)
!3151 = !DILocation(line: 68, column: 22, scope: !3148)
!3152 = !DILocation(line: 68, column: 22, scope: !3153)
!3153 = !DILexicalBlockFile(scope: !3148, file: !31, discriminator: 1)
!3154 = !DILocation(line: 69, column: 3, scope: !3148)
!3155 = !DILocation(line: 69, column: 3, scope: !3153)
!3156 = !DILocation(line: 68, column: 22, scope: !3157)
!3157 = !DILexicalBlockFile(scope: !3148, file: !31, discriminator: 2)
!3158 = !DILocation(line: 68, column: 22, scope: !3159)
!3159 = !DILexicalBlockFile(scope: !3148, file: !31, discriminator: 3)
!3160 = distinct !DISubprogram(name: "read", linkageName: "_ZN10FileStream4readEPfii", scope: !2998, file: !31, line: 110, type: !3007, isLocal: false, isDefinition: true, scopeLine: 110, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !3006, variables: !22)
!3161 = !DILocalVariable(name: "this", arg: 1, scope: !3160, type: !3017, flags: DIFlagArtificial | DIFlagObjectPointer)
!3162 = !DILocation(line: 0, scope: !3160)
!3163 = !DILocalVariable(name: "dest", arg: 2, scope: !3160, file: !31, line: 110, type: !24)
!3164 = !DILocation(line: 110, column: 23, scope: !3160)
!3165 = !DILocalVariable(name: "dim", arg: 3, scope: !3160, file: !31, line: 110, type: !11)
!3166 = !DILocation(line: 110, column: 33, scope: !3160)
!3167 = !DILocalVariable(name: "num", arg: 4, scope: !3160, file: !31, line: 110, type: !11)
!3168 = !DILocation(line: 110, column: 42, scope: !3160)
!3169 = !DILocation(line: 111, column: 23, scope: !3160)
!3170 = !DILocation(line: 111, column: 43, scope: !3160)
!3171 = !DILocation(line: 111, column: 42, scope: !3160)
!3172 = !DILocation(line: 111, column: 48, scope: !3160)
!3173 = !DILocation(line: 111, column: 53, scope: !3160)
!3174 = !DILocation(line: 111, column: 12, scope: !3160)
!3175 = !DILocation(line: 111, column: 5, scope: !3160)
!3176 = distinct !DISubprogram(name: "ferror", linkageName: "_ZN10FileStream6ferrorEv", scope: !2998, file: !31, line: 113, type: !3010, isLocal: false, isDefinition: true, scopeLine: 113, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !3009, variables: !22)
!3177 = !DILocalVariable(name: "this", arg: 1, scope: !3176, type: !3017, flags: DIFlagArtificial | DIFlagObjectPointer)
!3178 = !DILocation(line: 0, scope: !3176)
!3179 = !DILocation(line: 114, column: 24, scope: !3176)
!3180 = !DILocation(line: 114, column: 12, scope: !3176)
!3181 = !DILocation(line: 114, column: 5, scope: !3176)
!3182 = distinct !DISubprogram(name: "feof", linkageName: "_ZN10FileStream4feofEv", scope: !2998, file: !31, line: 116, type: !3010, isLocal: false, isDefinition: true, scopeLine: 116, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !3012, variables: !22)
!3183 = !DILocalVariable(name: "this", arg: 1, scope: !3182, type: !3017, flags: DIFlagArtificial | DIFlagObjectPointer)
!3184 = !DILocation(line: 0, scope: !3182)
!3185 = !DILocation(line: 117, column: 22, scope: !3182)
!3186 = !DILocation(line: 117, column: 12, scope: !3182)
!3187 = !DILocation(line: 117, column: 5, scope: !3182)
!3188 = distinct !DISubprogram(name: "~FileStream", linkageName: "_ZN10FileStreamD2Ev", scope: !2998, file: !31, line: 119, type: !3014, isLocal: false, isDefinition: true, scopeLine: 119, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !3013, variables: !22)
!3189 = !DILocalVariable(name: "this", arg: 1, scope: !3188, type: !3017, flags: DIFlagArtificial | DIFlagObjectPointer)
!3190 = !DILocation(line: 0, scope: !3188)
!3191 = !DILocation(line: 119, column: 17, scope: !3188)
!3192 = !DILocation(line: 120, column: 5, scope: !3193)
!3193 = distinct !DILexicalBlock(scope: !3188, file: !31, line: 119, column: 17)
!3194 = !DILocation(line: 121, column: 12, scope: !3193)
!3195 = !DILocation(line: 121, column: 5, scope: !3193)
!3196 = !DILocation(line: 122, column: 3, scope: !3193)
!3197 = !DILocation(line: 122, column: 3, scope: !3188)
!3198 = !DILocation(line: 122, column: 3, scope: !3199)
!3199 = !DILexicalBlockFile(scope: !3193, file: !31, discriminator: 1)
!3200 = !DILocation(line: 122, column: 3, scope: !3201)
!3201 = !DILexicalBlockFile(scope: !3193, file: !31, discriminator: 2)
!3202 = !DILocation(line: 122, column: 3, scope: !3203)
!3203 = !DILexicalBlockFile(scope: !3193, file: !31, discriminator: 3)
!3204 = !DILocation(line: 122, column: 3, scope: !3205)
!3205 = !DILexicalBlockFile(scope: !3193, file: !31, discriminator: 4)
!3206 = distinct !DISubprogram(name: "~FileStream", linkageName: "_ZN10FileStreamD0Ev", scope: !2998, file: !31, line: 119, type: !3014, isLocal: false, isDefinition: true, scopeLine: 119, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !3013, variables: !22)
!3207 = !DILocalVariable(name: "this", arg: 1, scope: !3206, type: !3017, flags: DIFlagArtificial | DIFlagObjectPointer)
!3208 = !DILocation(line: 0, scope: !3206)
!3209 = !DILocation(line: 119, column: 17, scope: !3206)
!3210 = !DILocation(line: 119, column: 17, scope: !3211)
!3211 = !DILexicalBlockFile(scope: !3206, file: !31, discriminator: 1)
!3212 = !DILocation(line: 122, column: 3, scope: !3206)
!3213 = !DILocation(line: 122, column: 3, scope: !3211)
!3214 = !DILocation(line: 119, column: 17, scope: !3215)
!3215 = !DILexicalBlockFile(scope: !3206, file: !31, discriminator: 2)
!3216 = !DILocation(line: 119, column: 17, scope: !3217)
!3217 = !DILexicalBlockFile(scope: !3206, file: !31, discriminator: 3)
!3218 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_streamcluster_cuda_cpu.cpp", scope: !21, file: !21, type: !3219, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !20, variables: !22)
!3219 = !DISubroutineType(types: !22)
!3220 = !DILocation(line: 0, scope: !3218)
