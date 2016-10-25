; ModuleID = 'nn_cuda.cu'
source_filename = "nn_cuda.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.latLong = type { float, float }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl" }
%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl" = type { %struct.record*, %struct.record*, %struct.record* }
%struct.record = type { [53 x i8], float }
%"class.std::vector.0" = type { %"struct.std::_Vector_base.1" }
%"struct.std::_Vector_base.1" = type { %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl" }
%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl" = type { %struct.latLong*, %struct.latLong*, %struct.latLong* }
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque
%"class.std::allocator.2" = type { i8 }
%"class.std::allocator" = type { i8 }
%"class.__gnu_cxx::__normal_iterator" = type { %struct.latLong* }
%"class.__gnu_cxx::__normal_iterator.5" = type { %struct.record* }
%"class.__gnu_cxx::new_allocator" = type { i8 }
%"class.__gnu_cxx::new_allocator.3" = type { i8 }

$_ZNSt6vectorI6recordSaIS0_EEC2Ev = comdat any

$_ZNSt6vectorI7latLongSaIS0_EEC2Ev = comdat any

$_ZN4dim3C2Ejjj = comdat any

$_ZNSt6vectorI7latLongSaIS0_EEixEm = comdat any

$_ZNSt6vectorI6recordSaIS0_EEixEm = comdat any

$_ZNSt6vectorI7latLongSaIS0_EED2Ev = comdat any

$__clang_call_terminate = comdat any

$_ZNSt6vectorI6recordSaIS0_EED2Ev = comdat any

$_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_ = comdat any

$_ZNSt6vectorI6recordSaIS0_EE9push_backERKS0_ = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EEC2Ev = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implC2Ev = comdat any

$_ZNSaI6recordEC2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorI6recordEC2Ev = comdat any

$_ZSt8_DestroyIP6recordS0_EvT_S2_RSaIT0_E = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EED2Ev = comdat any

$_ZSt8_DestroyIP6recordEvT_S2_ = comdat any

$_ZNSt12_Destroy_auxILb1EE9__destroyIP6recordEEvT_S4_ = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implD2Ev = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10deallocateERS2_PS1_m = comdat any

$_ZN9__gnu_cxx13new_allocatorI6recordE10deallocateEPS1_m = comdat any

$_ZNSaI6recordED2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorI6recordED2Ev = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EEC2Ev = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implC2Ev = comdat any

$_ZNSaI7latLongEC2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorI7latLongEC2Ev = comdat any

$_ZSt8_DestroyIP7latLongS0_EvT_S2_RSaIT0_E = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EED2Ev = comdat any

$_ZSt8_DestroyIP7latLongEvT_S2_ = comdat any

$_ZNSt12_Destroy_auxILb1EE9__destroyIP7latLongEEvT_S4_ = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implD2Ev = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10deallocateERS2_PS1_m = comdat any

$_ZN9__gnu_cxx13new_allocatorI7latLongE10deallocateEPS1_m = comdat any

$_ZNSaI7latLongED2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorI7latLongED2Ev = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_ = comdat any

$_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_ = comdat any

$_ZNSt6vectorI7latLongSaIS0_EE3endEv = comdat any

$_ZN9__gnu_cxx13new_allocatorI7latLongE9constructEPS1_RKS1_ = comdat any

$_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_ = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEdeEv = comdat any

$_ZNKSt6vectorI7latLongSaIS0_EE12_M_check_lenEmPKc = comdat any

$_ZN9__gnu_cxxmiIP7latLongSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_ = comdat any

$_ZNSt6vectorI7latLongSaIS0_EE5beginEv = comdat any

$_ZNSt12_Vector_baseI7latLongSaIS0_EE11_M_allocateEm = comdat any

$_ZSt34__uninitialized_move_if_noexcept_aIP7latLongS1_SaIS0_EET0_T_S4_S3_RT1_ = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE7destroyERS2_PS1_ = comdat any

$_ZSt23__copy_move_backward_a2ILb0EP7latLongS1_ET1_T0_S3_S2_ = comdat any

$_ZSt12__miter_baseIP7latLongENSt11_Miter_baseIT_E13iterator_typeES3_ = comdat any

$_ZSt22__copy_move_backward_aILb0EP7latLongS1_ET1_T0_S3_S2_ = comdat any

$_ZSt12__niter_baseIP7latLongENSt11_Niter_baseIT_E13iterator_typeES3_ = comdat any

$_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI7latLongEEPT_PKS4_S7_S5_ = comdat any

$_ZNSt10_Iter_baseIP7latLongLb0EE7_S_baseES1_ = comdat any

$_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv = comdat any

$_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv = comdat any

$_ZSt3maxImERKT_S2_S2_ = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8max_sizeERKS2_ = comdat any

$_ZNKSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNK9__gnu_cxx13new_allocatorI7latLongE8max_sizeEv = comdat any

$_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEC2ERKS2_ = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m = comdat any

$_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv = comdat any

$_ZSt22__uninitialized_copy_aIP7latLongS1_S0_ET0_T_S3_S2_RSaIT1_E = comdat any

$_ZSt18uninitialized_copyIP7latLongS1_ET0_T_S3_S2_ = comdat any

$_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP7latLongS3_EET0_T_S5_S4_ = comdat any

$_ZSt4copyIP7latLongS1_ET0_T_S3_S2_ = comdat any

$_ZSt14__copy_move_a2ILb0EP7latLongS1_ET1_T0_S3_S2_ = comdat any

$_ZSt13__copy_move_aILb0EP7latLongS1_ET1_T0_S3_S2_ = comdat any

$_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI7latLongEEPT_PKS4_S7_S5_ = comdat any

$_ZN9__gnu_cxx13new_allocatorI7latLongE7destroyEPS1_ = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_ = comdat any

$_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_ = comdat any

$_ZNSt6vectorI6recordSaIS0_EE3endEv = comdat any

$_ZN9__gnu_cxx13new_allocatorI6recordE9constructEPS1_RKS1_ = comdat any

$_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_ = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEdeEv = comdat any

$_ZNKSt6vectorI6recordSaIS0_EE12_M_check_lenEmPKc = comdat any

$_ZN9__gnu_cxxmiIP6recordSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_ = comdat any

$_ZNSt6vectorI6recordSaIS0_EE5beginEv = comdat any

$_ZNSt12_Vector_baseI6recordSaIS0_EE11_M_allocateEm = comdat any

$_ZSt34__uninitialized_move_if_noexcept_aIP6recordS1_SaIS0_EET0_T_S4_S3_RT1_ = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE7destroyERS2_PS1_ = comdat any

$_ZSt23__copy_move_backward_a2ILb0EP6recordS1_ET1_T0_S3_S2_ = comdat any

$_ZSt12__miter_baseIP6recordENSt11_Miter_baseIT_E13iterator_typeES3_ = comdat any

$_ZSt22__copy_move_backward_aILb0EP6recordS1_ET1_T0_S3_S2_ = comdat any

$_ZSt12__niter_baseIP6recordENSt11_Niter_baseIT_E13iterator_typeES3_ = comdat any

$_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI6recordEEPT_PKS4_S7_S5_ = comdat any

$_ZNSt10_Iter_baseIP6recordLb0EE7_S_baseES1_ = comdat any

$_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv = comdat any

$_ZNKSt6vectorI6recordSaIS0_EE4sizeEv = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8max_sizeERKS2_ = comdat any

$_ZNKSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv = comdat any

$_ZNK9__gnu_cxx13new_allocatorI6recordE8max_sizeEv = comdat any

$_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEC2ERKS2_ = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m = comdat any

$_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv = comdat any

$_ZSt22__uninitialized_copy_aIP6recordS1_S0_ET0_T_S3_S2_RSaIT1_E = comdat any

$_ZSt18uninitialized_copyIP6recordS1_ET0_T_S3_S2_ = comdat any

$_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP6recordS3_EET0_T_S5_S4_ = comdat any

$_ZSt4copyIP6recordS1_ET0_T_S3_S2_ = comdat any

$_ZSt14__copy_move_a2ILb0EP6recordS1_ET1_T0_S3_S2_ = comdat any

$_ZSt13__copy_move_aILb0EP6recordS1_ET1_T0_S3_S2_ = comdat any

$_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI6recordEEPT_PKS4_S7_S5_ = comdat any

$_ZN9__gnu_cxx13new_allocatorI6recordE7destroyEPS1_ = comdat any

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [25 x i8] c"Error: Input too large.\0A\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"%s --> Distance=%f\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"error reading filelist\0A\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"error opening a db\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"Nearest Neighbor Usage\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.8 = private unnamed_addr constant [90 x i8] c"nearestNeighbor [filename] -r [int] -lat [float] -lng [float] [-hqt] [-p [int] -d [int]]\0A\00", align 1
@.str.9 = private unnamed_addr constant [10 x i8] c"example:\0A\00", align 1
@.str.10 = private unnamed_addr constant [55 x i8] c"$ ./nearestNeighbor filelist.txt -r 5 -lat 30 -lng 90\0A\00", align 1
@.str.11 = private unnamed_addr constant [59 x i8] c"filename     the filename that lists the data input files\0A\00", align 1
@.str.12 = private unnamed_addr constant [60 x i8] c"-r [int]     the number of records to return (default: 10)\0A\00", align 1
@.str.13 = private unnamed_addr constant [62 x i8] c"-lat [float] the latitude for nearest neighbors (default: 0)\0A\00", align 1
@.str.14 = private unnamed_addr constant [63 x i8] c"-lng [float] the longitude for nearest neighbors (default: 0)\0A\00", align 1
@.str.15 = private unnamed_addr constant [36 x i8] c"-h, --help   Display the help file\0A\00", align 1
@.str.16 = private unnamed_addr constant [52 x i8] c"-q           Quiet mode. Suppress all text output.\0A\00", align 1
@.str.17 = private unnamed_addr constant [40 x i8] c"-t           Print timing information.\0A\00", align 1
@.str.18 = private unnamed_addr constant [73 x i8] c"-p [int]     Choose the platform (must choose both platform and device)\0A\00", align 1
@.str.19 = private unnamed_addr constant [71 x i8] c"-d [int]     Choose the device (must choose both platform and device)\0A\00", align 1
@.str.20 = private unnamed_addr constant [60 x i8] c"Notes: 1. The filename is required as the first parameter.\0A\00", align 1
@.str.21 = private unnamed_addr constant [61 x i8] c"       2. If you declare either the device or the platform,\0A\00", align 1
@.str.22 = private unnamed_addr constant [35 x i8] c"          you must declare both.\0A\0A\00", align 1
@.str.23 = private unnamed_addr constant [22 x i8] c"vector::_M_insert_aux\00", align 1

; Function Attrs: uwtable
define void @_Z6euclidP7latLongPfiff(%struct.latLong* %d_locations, float* %d_distances, i32 %numRecords, float %lat, float %lng) #0 !dbg !1309 {
entry:
  %d_locations.addr = alloca %struct.latLong*, align 8
  %d_distances.addr = alloca float*, align 8
  %numRecords.addr = alloca i32, align 4
  %lat.addr = alloca float, align 4
  %lng.addr = alloca float, align 4
  store %struct.latLong* %d_locations, %struct.latLong** %d_locations.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %d_locations.addr, metadata !1314, metadata !1315), !dbg !1316
  store float* %d_distances, float** %d_distances.addr, align 8
  call void @llvm.dbg.declare(metadata float** %d_distances.addr, metadata !1317, metadata !1315), !dbg !1318
  store i32 %numRecords, i32* %numRecords.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numRecords.addr, metadata !1319, metadata !1315), !dbg !1320
  store float %lat, float* %lat.addr, align 4
  call void @llvm.dbg.declare(metadata float* %lat.addr, metadata !1321, metadata !1315), !dbg !1322
  store float %lng, float* %lng.addr, align 4
  call void @llvm.dbg.declare(metadata float* %lng.addr, metadata !1323, metadata !1315), !dbg !1324
  %0 = bitcast %struct.latLong** %d_locations.addr to i8*, !dbg !1325
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !1325
  %2 = icmp eq i32 %1, 0, !dbg !1325
  br i1 %2, label %setup.next, label %setup.end, !dbg !1325

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %d_distances.addr to i8*, !dbg !1326
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !1326
  %5 = icmp eq i32 %4, 0, !dbg !1326
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1326

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %numRecords.addr to i8*, !dbg !1328
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 4, i64 16), !dbg !1328
  %8 = icmp eq i32 %7, 0, !dbg !1328
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1328

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float* %lat.addr to i8*, !dbg !1330
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 20), !dbg !1330
  %11 = icmp eq i32 %10, 0, !dbg !1330
  br i1 %11, label %setup.next3, label %setup.end, !dbg !1330

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast float* %lng.addr to i8*, !dbg !1332
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 24), !dbg !1332
  %14 = icmp eq i32 %13, 0, !dbg !1332
  br i1 %14, label %setup.next4, label %setup.end, !dbg !1332

setup.next4:                                      ; preds = %setup.next3
  %15 = call i32 @cudaLaunch(i8* bitcast (void (%struct.latLong*, float*, i32, float, float)* @_Z6euclidP7latLongPfiff to i8*)), !dbg !1334
  br label %setup.end, !dbg !1334

setup.end:                                        ; preds = %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1336
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !1337 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %lat = alloca float, align 4
  %lng = alloca float, align 4
  %quiet = alloca i32, align 4
  %timing = alloca i32, align 4
  %platform = alloca i32, align 4
  %device = alloca i32, align 4
  %records = alloca %"class.std::vector", align 8
  %locations = alloca %"class.std::vector.0", align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %filename = alloca [100 x i8], align 16
  %resultsCount = alloca i32, align 4
  %cleanup.dest.slot = alloca i32
  %numRecords = alloca i32, align 4
  %distances = alloca float*, align 8
  %d_locations = alloca %struct.latLong*, align 8
  %d_distances = alloca float*, align 8
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %maxGridX = alloca i64, align 8
  %threadsPerBlock = alloca i64, align 8
  %totalDeviceMemory = alloca i64, align 8
  %freeDeviceMemory = alloca i64, align 8
  %usableDeviceMemory = alloca i64, align 8
  %maxThreads = alloca i64, align 8
  %blocks = alloca i64, align 8
  %gridY = alloca i64, align 8
  %gridX = alloca i64, align 8
  %gridDim = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp55 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp55.coerce = alloca { i64, i32 }, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1340, metadata !1315), !dbg !1341
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1342, metadata !1315), !dbg !1343
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1344, metadata !1315), !dbg !1345
  store i32 0, i32* %i, align 4, !dbg !1345
  call void @llvm.dbg.declare(metadata float* %lat, metadata !1346, metadata !1315), !dbg !1347
  call void @llvm.dbg.declare(metadata float* %lng, metadata !1348, metadata !1315), !dbg !1349
  call void @llvm.dbg.declare(metadata i32* %quiet, metadata !1350, metadata !1315), !dbg !1351
  store i32 0, i32* %quiet, align 4, !dbg !1351
  call void @llvm.dbg.declare(metadata i32* %timing, metadata !1352, metadata !1315), !dbg !1353
  store i32 0, i32* %timing, align 4, !dbg !1353
  call void @llvm.dbg.declare(metadata i32* %platform, metadata !1354, metadata !1315), !dbg !1355
  store i32 0, i32* %platform, align 4, !dbg !1355
  call void @llvm.dbg.declare(metadata i32* %device, metadata !1356, metadata !1315), !dbg !1357
  store i32 0, i32* %device, align 4, !dbg !1357
  call void @llvm.dbg.declare(metadata %"class.std::vector"* %records, metadata !1358, metadata !1315), !dbg !1359
  call void @_ZNSt6vectorI6recordSaIS0_EEC2Ev(%"class.std::vector"* %records), !dbg !1359
  call void @llvm.dbg.declare(metadata %"class.std::vector.0"* %locations, metadata !1360, metadata !1315), !dbg !1361
  invoke void @_ZNSt6vectorI7latLongSaIS0_EEC2Ev(%"class.std::vector.0"* %locations)
          to label %invoke.cont unwind label %lpad, !dbg !1361

invoke.cont:                                      ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %filename, metadata !1362, metadata !1315), !dbg !1366
  call void @llvm.dbg.declare(metadata i32* %resultsCount, metadata !1367, metadata !1315), !dbg !1368
  store i32 10, i32* %resultsCount, align 4, !dbg !1368
  %0 = load i32, i32* %argc.addr, align 4, !dbg !1369
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !1371
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %filename, i32 0, i32 0, !dbg !1372
  %call = invoke i32 @_Z16parseCommandlineiPPcS_PiPfS2_S1_S1_S1_S1_(i32 %0, i8** %1, i8* %arraydecay, i32* %resultsCount, float* %lat, float* %lng, i32* %quiet, i32* %timing, i32* %platform, i32* %device)
          to label %invoke.cont2 unwind label %lpad1, !dbg !1373

invoke.cont2:                                     ; preds = %invoke.cont
  %tobool = icmp ne i32 %call, 0, !dbg !1374
  br i1 %tobool, label %if.then, label %if.end, !dbg !1374

if.then:                                          ; preds = %invoke.cont2
  invoke void @_Z10printUsagev()
          to label %invoke.cont3 unwind label %lpad1, !dbg !1376

invoke.cont3:                                     ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1378
  store i32 1, i32* %cleanup.dest.slot, align 4
  br label %cleanup, !dbg !1378

lpad:                                             ; preds = %cleanup, %entry
  %2 = landingpad { i8*, i32 }
          cleanup, !dbg !1379
  %3 = extractvalue { i8*, i32 } %2, 0, !dbg !1379
  store i8* %3, i8** %exn.slot, align 8, !dbg !1379
  %4 = extractvalue { i8*, i32 } %2, 1, !dbg !1379
  store i32 %4, i32* %ehselector.slot, align 4, !dbg !1379
  br label %ehcleanup, !dbg !1379

lpad1:                                            ; preds = %invoke.cont83, %if.end82, %invoke.cont77, %invoke.cont73, %for.body, %invoke.cont66, %invoke.cont62, %kcall.end, %kcall.configok, %invoke.cont57, %invoke.cont53, %invoke.cont49, %invoke.cont47, %invoke.cont43, %invoke.cont37, %if.end26, %if.then23, %invoke.cont16, %cond.end, %invoke.cont9, %if.end8, %if.end, %if.then, %invoke.cont
  %5 = landingpad { i8*, i32 }
          cleanup, !dbg !1380
  %6 = extractvalue { i8*, i32 } %5, 0, !dbg !1380
  store i8* %6, i8** %exn.slot, align 8, !dbg !1380
  %7 = extractvalue { i8*, i32 } %5, 1, !dbg !1380
  store i32 %7, i32* %ehselector.slot, align 4, !dbg !1380
  invoke void @_ZNSt6vectorI7latLongSaIS0_EED2Ev(%"class.std::vector.0"* %locations)
          to label %invoke.cont88 unwind label %terminate.lpad, !dbg !1380

if.end:                                           ; preds = %invoke.cont2
  call void @llvm.dbg.declare(metadata i32* %numRecords, metadata !1381, metadata !1315), !dbg !1382
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %filename, i32 0, i32 0, !dbg !1383
  %call6 = invoke i32 @_Z8loadDataPcRSt6vectorI6recordSaIS1_EERS0_I7latLongSaIS5_EE(i8* %arraydecay4, %"class.std::vector"* dereferenceable(24) %records, %"class.std::vector.0"* dereferenceable(24) %locations)
          to label %invoke.cont5 unwind label %lpad1, !dbg !1384

invoke.cont5:                                     ; preds = %if.end
  store i32 %call6, i32* %numRecords, align 4, !dbg !1385
  %8 = load i32, i32* %resultsCount, align 4, !dbg !1387
  %9 = load i32, i32* %numRecords, align 4, !dbg !1389
  %cmp = icmp sgt i32 %8, %9, !dbg !1390
  br i1 %cmp, label %if.then7, label %if.end8, !dbg !1391

if.then7:                                         ; preds = %invoke.cont5
  %10 = load i32, i32* %numRecords, align 4, !dbg !1392
  store i32 %10, i32* %resultsCount, align 4, !dbg !1394
  br label %if.end8, !dbg !1395

if.end8:                                          ; preds = %if.then7, %invoke.cont5
  call void @llvm.dbg.declare(metadata float** %distances, metadata !1396, metadata !1315), !dbg !1397
  call void @llvm.dbg.declare(metadata %struct.latLong** %d_locations, metadata !1398, metadata !1315), !dbg !1399
  call void @llvm.dbg.declare(metadata float** %d_distances, metadata !1400, metadata !1315), !dbg !1401
  call void @llvm.dbg.declare(metadata %struct.cudaDeviceProp* %deviceProp, metadata !1402, metadata !1315), !dbg !1480
  %call10 = invoke i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* %deviceProp, i32 0)
          to label %invoke.cont9 unwind label %lpad1, !dbg !1481

invoke.cont9:                                     ; preds = %if.end8
  %call12 = invoke i32 @cudaThreadSynchronize()
          to label %invoke.cont11 unwind label %lpad1, !dbg !1482

invoke.cont11:                                    ; preds = %invoke.cont9
  call void @llvm.dbg.declare(metadata i64* %maxGridX, metadata !1483, metadata !1315), !dbg !1484
  %maxGridSize = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 8, !dbg !1485
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %maxGridSize, i64 0, i64 0, !dbg !1486
  %11 = load i32, i32* %arrayidx, align 8, !dbg !1486
  %conv = sext i32 %11 to i64, !dbg !1486
  store i64 %conv, i64* %maxGridX, align 8, !dbg !1484
  call void @llvm.dbg.declare(metadata i64* %threadsPerBlock, metadata !1487, metadata !1315), !dbg !1488
  %maxThreadsPerBlock = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 6, !dbg !1489
  %12 = load i32, i32* %maxThreadsPerBlock, align 8, !dbg !1489
  %cmp13 = icmp sgt i32 %12, 256, !dbg !1489
  br i1 %cmp13, label %cond.true, label %cond.false, !dbg !1489

cond.true:                                        ; preds = %invoke.cont11
  br label %cond.end, !dbg !1490

cond.false:                                       ; preds = %invoke.cont11
  %maxThreadsPerBlock14 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 6, !dbg !1491
  %13 = load i32, i32* %maxThreadsPerBlock14, align 8, !dbg !1491
  br label %cond.end, !dbg !1491

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 256, %cond.true ], [ %13, %cond.false ], !dbg !1493
  %conv15 = sext i32 %cond to i64, !dbg !1493
  store i64 %conv15, i64* %threadsPerBlock, align 8, !dbg !1495
  call void @llvm.dbg.declare(metadata i64* %totalDeviceMemory, metadata !1496, metadata !1315), !dbg !1497
  call void @llvm.dbg.declare(metadata i64* %freeDeviceMemory, metadata !1498, metadata !1315), !dbg !1499
  %call17 = invoke i32 @cudaMemGetInfo(i64* %freeDeviceMemory, i64* %totalDeviceMemory)
          to label %invoke.cont16 unwind label %lpad1, !dbg !1500

invoke.cont16:                                    ; preds = %cond.end
  %call19 = invoke i32 @cudaThreadSynchronize()
          to label %invoke.cont18 unwind label %lpad1, !dbg !1501

invoke.cont18:                                    ; preds = %invoke.cont16
  call void @llvm.dbg.declare(metadata i64* %usableDeviceMemory, metadata !1502, metadata !1315), !dbg !1503
  %14 = load i64, i64* %freeDeviceMemory, align 8, !dbg !1504
  %mul = mul i64 %14, 85, !dbg !1505
  %div = udiv i64 %mul, 100, !dbg !1506
  store i64 %div, i64* %usableDeviceMemory, align 8, !dbg !1503
  call void @llvm.dbg.declare(metadata i64* %maxThreads, metadata !1507, metadata !1315), !dbg !1508
  %15 = load i64, i64* %usableDeviceMemory, align 8, !dbg !1509
  %div20 = udiv i64 %15, 12, !dbg !1510
  store i64 %div20, i64* %maxThreads, align 8, !dbg !1508
  %16 = load i32, i32* %numRecords, align 4, !dbg !1511
  %conv21 = sext i32 %16 to i64, !dbg !1511
  %17 = load i64, i64* %maxThreads, align 8, !dbg !1513
  %cmp22 = icmp ugt i64 %conv21, %17, !dbg !1514
  br i1 %cmp22, label %if.then23, label %if.end26, !dbg !1515

if.then23:                                        ; preds = %invoke.cont18
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1516
  %call25 = invoke i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i32 0, i32 0))
          to label %invoke.cont24 unwind label %lpad1, !dbg !1518

invoke.cont24:                                    ; preds = %if.then23
  call void @exit(i32 1) #15, !dbg !1519
  unreachable, !dbg !1519

if.end26:                                         ; preds = %invoke.cont18
  call void @llvm.dbg.declare(metadata i64* %blocks, metadata !1520, metadata !1315), !dbg !1521
  %19 = load i32, i32* %numRecords, align 4, !dbg !1522
  %conv27 = sext i32 %19 to i64, !dbg !1522
  %20 = load i64, i64* %threadsPerBlock, align 8, !dbg !1522
  %add = add i64 %conv27, %20, !dbg !1522
  %sub = sub i64 %add, 1, !dbg !1522
  %21 = load i64, i64* %threadsPerBlock, align 8, !dbg !1522
  %div28 = udiv i64 %sub, %21, !dbg !1522
  store i64 %div28, i64* %blocks, align 8, !dbg !1521
  call void @llvm.dbg.declare(metadata i64* %gridY, metadata !1523, metadata !1315), !dbg !1524
  %22 = load i64, i64* %blocks, align 8, !dbg !1525
  %23 = load i64, i64* %maxGridX, align 8, !dbg !1525
  %add29 = add i64 %22, %23, !dbg !1525
  %sub30 = sub i64 %add29, 1, !dbg !1525
  %24 = load i64, i64* %maxGridX, align 8, !dbg !1525
  %div31 = udiv i64 %sub30, %24, !dbg !1525
  store i64 %div31, i64* %gridY, align 8, !dbg !1524
  call void @llvm.dbg.declare(metadata i64* %gridX, metadata !1526, metadata !1315), !dbg !1527
  %25 = load i64, i64* %blocks, align 8, !dbg !1528
  %26 = load i64, i64* %gridY, align 8, !dbg !1528
  %add32 = add i64 %25, %26, !dbg !1528
  %sub33 = sub i64 %add32, 1, !dbg !1528
  %27 = load i64, i64* %gridY, align 8, !dbg !1528
  %div34 = udiv i64 %sub33, %27, !dbg !1528
  store i64 %div34, i64* %gridX, align 8, !dbg !1527
  call void @llvm.dbg.declare(metadata %struct.dim3* %gridDim, metadata !1529, metadata !1315), !dbg !1553
  %28 = load i64, i64* %gridX, align 8, !dbg !1554
  %conv35 = trunc i64 %28 to i32, !dbg !1554
  %29 = load i64, i64* %gridY, align 8, !dbg !1555
  %conv36 = trunc i64 %29 to i32, !dbg !1555
  invoke void @_ZN4dim3C2Ejjj(%struct.dim3* %gridDim, i32 %conv35, i32 %conv36, i32 1)
          to label %invoke.cont37 unwind label %lpad1, !dbg !1553

invoke.cont37:                                    ; preds = %if.end26
  %30 = load i32, i32* %numRecords, align 4, !dbg !1556
  %conv38 = sext i32 %30 to i64, !dbg !1556
  %mul39 = mul i64 4, %conv38, !dbg !1557
  %call40 = call noalias i8* @malloc(i64 %mul39) #16, !dbg !1558
  %31 = bitcast i8* %call40 to float*, !dbg !1559
  store float* %31, float** %distances, align 8, !dbg !1560
  %32 = bitcast %struct.latLong** %d_locations to i8**, !dbg !1561
  %33 = load i32, i32* %numRecords, align 4, !dbg !1562
  %conv41 = sext i32 %33 to i64, !dbg !1562
  %mul42 = mul i64 8, %conv41, !dbg !1563
  %call44 = invoke i32 @cudaMalloc(i8** %32, i64 %mul42)
          to label %invoke.cont43 unwind label %lpad1, !dbg !1564

invoke.cont43:                                    ; preds = %invoke.cont37
  %34 = bitcast float** %d_distances to i8**, !dbg !1565
  %35 = load i32, i32* %numRecords, align 4, !dbg !1566
  %conv45 = sext i32 %35 to i64, !dbg !1566
  %mul46 = mul i64 4, %conv45, !dbg !1567
  %call48 = invoke i32 @cudaMalloc(i8** %34, i64 %mul46)
          to label %invoke.cont47 unwind label %lpad1, !dbg !1568

invoke.cont47:                                    ; preds = %invoke.cont43
  %36 = load %struct.latLong*, %struct.latLong** %d_locations, align 8, !dbg !1569
  %37 = bitcast %struct.latLong* %36 to i8*, !dbg !1569
  %call50 = invoke dereferenceable(8) %struct.latLong* @_ZNSt6vectorI7latLongSaIS0_EEixEm(%"class.std::vector.0"* %locations, i64 0)
          to label %invoke.cont49 unwind label %lpad1, !dbg !1570

invoke.cont49:                                    ; preds = %invoke.cont47
  %38 = bitcast %struct.latLong* %call50 to i8*, !dbg !1571
  %39 = load i32, i32* %numRecords, align 4, !dbg !1572
  %conv51 = sext i32 %39 to i64, !dbg !1572
  %mul52 = mul i64 8, %conv51, !dbg !1573
  %call54 = invoke i32 @cudaMemcpy(i8* %37, i8* %38, i64 %mul52, i32 1)
          to label %invoke.cont53 unwind label %lpad1, !dbg !1574

invoke.cont53:                                    ; preds = %invoke.cont49
  %40 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1575
  %41 = bitcast %struct.dim3* %gridDim to i8*, !dbg !1575
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* %41, i64 12, i32 4, i1 false), !dbg !1575
  %42 = load i64, i64* %threadsPerBlock, align 8, !dbg !1576
  %conv56 = trunc i64 %42 to i32, !dbg !1576
  invoke void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp55, i32 %conv56, i32 1, i32 1)
          to label %invoke.cont57 unwind label %lpad1, !dbg !1576

invoke.cont57:                                    ; preds = %invoke.cont53
  %43 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1577
  %44 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1577
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* %44, i64 12, i32 4, i1 false), !dbg !1578
  %45 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !1577
  %46 = load i64, i64* %45, align 4, !dbg !1577
  %47 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !1577
  %48 = load i32, i32* %47, align 4, !dbg !1577
  %49 = bitcast { i64, i32 }* %agg.tmp55.coerce to i8*, !dbg !1577
  %50 = bitcast %struct.dim3* %agg.tmp55 to i8*, !dbg !1577
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %49, i8* %50, i64 12, i32 4, i1 false), !dbg !1578
  %51 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp55.coerce, i32 0, i32 0, !dbg !1577
  %52 = load i64, i64* %51, align 4, !dbg !1577
  %53 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp55.coerce, i32 0, i32 1, !dbg !1577
  %54 = load i32, i32* %53, align 4, !dbg !1577
  %call59 = invoke i32 @cudaConfigureCall(i64 %46, i32 %48, i64 %52, i32 %54, i64 0, %struct.CUstream_st* null)
          to label %invoke.cont58 unwind label %lpad1, !dbg !1577

invoke.cont58:                                    ; preds = %invoke.cont57
  %tobool60 = icmp ne i32 %call59, 0, !dbg !1579
  br i1 %tobool60, label %kcall.end, label %kcall.configok, !dbg !1580

kcall.configok:                                   ; preds = %invoke.cont58
  %55 = load %struct.latLong*, %struct.latLong** %d_locations, align 8, !dbg !1581
  %56 = load float*, float** %d_distances, align 8, !dbg !1582
  %57 = load i32, i32* %numRecords, align 4, !dbg !1583
  %58 = load float, float* %lat, align 4, !dbg !1584
  %59 = load float, float* %lng, align 4, !dbg !1585
  invoke void @_Z6euclidP7latLongPfiff(%struct.latLong* %55, float* %56, i32 %57, float %58, float %59)
          to label %invoke.cont61 unwind label %lpad1, !dbg !1586

invoke.cont61:                                    ; preds = %kcall.configok
  br label %kcall.end, !dbg !1587

kcall.end:                                        ; preds = %invoke.cont61, %invoke.cont58
  %call63 = invoke i32 @cudaThreadSynchronize()
          to label %invoke.cont62 unwind label %lpad1, !dbg !1589

invoke.cont62:                                    ; preds = %kcall.end
  %60 = load float*, float** %distances, align 8, !dbg !1590
  %61 = bitcast float* %60 to i8*, !dbg !1590
  %62 = load float*, float** %d_distances, align 8, !dbg !1591
  %63 = bitcast float* %62 to i8*, !dbg !1591
  %64 = load i32, i32* %numRecords, align 4, !dbg !1592
  %conv64 = sext i32 %64 to i64, !dbg !1592
  %mul65 = mul i64 4, %conv64, !dbg !1593
  %call67 = invoke i32 @cudaMemcpy(i8* %61, i8* %63, i64 %mul65, i32 2)
          to label %invoke.cont66 unwind label %lpad1, !dbg !1594

invoke.cont66:                                    ; preds = %invoke.cont62
  %65 = load float*, float** %distances, align 8, !dbg !1595
  %66 = load i32, i32* %numRecords, align 4, !dbg !1596
  %67 = load i32, i32* %resultsCount, align 4, !dbg !1597
  invoke void @_Z10findLowestRSt6vectorI6recordSaIS0_EEPfii(%"class.std::vector"* dereferenceable(24) %records, float* %65, i32 %66, i32 %67)
          to label %invoke.cont68 unwind label %lpad1, !dbg !1598

invoke.cont68:                                    ; preds = %invoke.cont66
  %68 = load i32, i32* %quiet, align 4, !dbg !1599
  %tobool69 = icmp ne i32 %68, 0, !dbg !1599
  br i1 %tobool69, label %if.end82, label %if.then70, !dbg !1601

if.then70:                                        ; preds = %invoke.cont68
  store i32 0, i32* %i, align 4, !dbg !1602
  br label %for.cond, !dbg !1604

for.cond:                                         ; preds = %for.inc, %if.then70
  %69 = load i32, i32* %i, align 4, !dbg !1605
  %70 = load i32, i32* %resultsCount, align 4, !dbg !1608
  %cmp71 = icmp slt i32 %69, %70, !dbg !1609
  br i1 %cmp71, label %for.body, label %for.end, !dbg !1610

for.body:                                         ; preds = %for.cond
  %71 = load i32, i32* %i, align 4, !dbg !1611
  %conv72 = sext i32 %71 to i64, !dbg !1611
  %call74 = invoke dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %records, i64 %conv72)
          to label %invoke.cont73 unwind label %lpad1, !dbg !1613

invoke.cont73:                                    ; preds = %for.body
  %recString = getelementptr inbounds %struct.record, %struct.record* %call74, i32 0, i32 0, !dbg !1614
  %arraydecay75 = getelementptr inbounds [53 x i8], [53 x i8]* %recString, i32 0, i32 0, !dbg !1616
  %72 = load i32, i32* %i, align 4, !dbg !1617
  %conv76 = sext i32 %72 to i64, !dbg !1617
  %call78 = invoke dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %records, i64 %conv76)
          to label %invoke.cont77 unwind label %lpad1, !dbg !1618

invoke.cont77:                                    ; preds = %invoke.cont73
  %distance = getelementptr inbounds %struct.record, %struct.record* %call78, i32 0, i32 1, !dbg !1619
  %73 = load float, float* %distance, align 4, !dbg !1619
  %conv79 = fpext float %73 to double, !dbg !1621
  %call81 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i32 0, i32 0), i8* %arraydecay75, double %conv79)
          to label %invoke.cont80 unwind label %lpad1, !dbg !1622

invoke.cont80:                                    ; preds = %invoke.cont77
  br label %for.inc, !dbg !1623

for.inc:                                          ; preds = %invoke.cont80
  %74 = load i32, i32* %i, align 4, !dbg !1624
  %inc = add nsw i32 %74, 1, !dbg !1624
  store i32 %inc, i32* %i, align 4, !dbg !1624
  br label %for.cond, !dbg !1626, !llvm.loop !1627

for.end:                                          ; preds = %for.cond
  br label %if.end82, !dbg !1629

if.end82:                                         ; preds = %for.end, %invoke.cont68
  %75 = load float*, float** %distances, align 8, !dbg !1631
  %76 = bitcast float* %75 to i8*, !dbg !1631
  call void @free(i8* %76) #16, !dbg !1632
  %77 = load %struct.latLong*, %struct.latLong** %d_locations, align 8, !dbg !1633
  %78 = bitcast %struct.latLong* %77 to i8*, !dbg !1633
  %call84 = invoke i32 @cudaFree(i8* %78)
          to label %invoke.cont83 unwind label %lpad1, !dbg !1634

invoke.cont83:                                    ; preds = %if.end82
  %79 = load float*, float** %d_distances, align 8, !dbg !1635
  %80 = bitcast float* %79 to i8*, !dbg !1635
  %call86 = invoke i32 @cudaFree(i8* %80)
          to label %invoke.cont85 unwind label %lpad1, !dbg !1636

invoke.cont85:                                    ; preds = %invoke.cont83
  store i32 0, i32* %cleanup.dest.slot, align 4, !dbg !1637
  br label %cleanup, !dbg !1637

cleanup:                                          ; preds = %invoke.cont85, %invoke.cont3
  invoke void @_ZNSt6vectorI7latLongSaIS0_EED2Ev(%"class.std::vector.0"* %locations)
          to label %invoke.cont87 unwind label %lpad, !dbg !1638

invoke.cont87:                                    ; preds = %cleanup
  call void @_ZNSt6vectorI6recordSaIS0_EED2Ev(%"class.std::vector"* %records), !dbg !1639
  %cleanup.dest = load i32, i32* %cleanup.dest.slot, align 4
  switch i32 %cleanup.dest, label %unreachable [
    i32 0, label %cleanup.cont
    i32 1, label %cleanup.cont
  ]

cleanup.cont:                                     ; preds = %invoke.cont87, %invoke.cont87
  %81 = load i32, i32* %retval, align 4, !dbg !1640
  ret i32 %81, !dbg !1640

invoke.cont88:                                    ; preds = %lpad1
  br label %ehcleanup, !dbg !1642

ehcleanup:                                        ; preds = %invoke.cont88, %lpad
  invoke void @_ZNSt6vectorI6recordSaIS0_EED2Ev(%"class.std::vector"* %records)
          to label %invoke.cont90 unwind label %terminate.lpad, !dbg !1644

invoke.cont90:                                    ; preds = %ehcleanup
  br label %eh.resume, !dbg !1646

eh.resume:                                        ; preds = %invoke.cont90
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !1648
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !1648
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !1648
  %lpad.val91 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !1648
  resume { i8*, i32 } %lpad.val91, !dbg !1648

terminate.lpad:                                   ; preds = %ehcleanup, %lpad1
  %82 = landingpad { i8*, i32 }
          catch i8* null, !dbg !1650
  %83 = extractvalue { i8*, i32 } %82, 0, !dbg !1650
  call void @__clang_call_terminate(i8* %83) #15, !dbg !1650
  unreachable, !dbg !1650

unreachable:                                      ; preds = %invoke.cont87
  unreachable
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt6vectorI6recordSaIS0_EEC2Ev(%"class.std::vector"* %this) unnamed_addr #0 comdat align 2 !dbg !1652 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector"** %this.addr, metadata !1653, metadata !1315), !dbg !1655
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !1656
  call void @_ZNSt12_Vector_baseI6recordSaIS0_EEC2Ev(%"struct.std::_Vector_base"* %0), !dbg !1657
  ret void, !dbg !1658
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt6vectorI7latLongSaIS0_EEC2Ev(%"class.std::vector.0"* %this) unnamed_addr #0 comdat align 2 !dbg !1659 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector.0"** %this.addr, metadata !1660, metadata !1315), !dbg !1662
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !1663
  call void @_ZNSt12_Vector_baseI7latLongSaIS0_EEC2Ev(%"struct.std::_Vector_base.1"* %0), !dbg !1664
  ret void, !dbg !1665
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind uwtable
define i32 @_Z16parseCommandlineiPPcS_PiPfS2_S1_S1_S1_S1_(i32 %argc, i8** %argv, i8* %filename, i32* %r, float* %lat, float* %lng, i32* %q, i32* %t, i32* %p, i32* %d) #3 !dbg !1666 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %filename.addr = alloca i8*, align 8
  %r.addr = alloca i32*, align 8
  %lat.addr = alloca float*, align 8
  %lng.addr = alloca float*, align 8
  %q.addr = alloca i32*, align 8
  %t.addr = alloca i32*, align 8
  %p.addr = alloca i32*, align 8
  %d.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %flag = alloca i8, align 1
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1669, metadata !1315), !dbg !1670
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1671, metadata !1315), !dbg !1672
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !1673, metadata !1315), !dbg !1674
  store i32* %r, i32** %r.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %r.addr, metadata !1675, metadata !1315), !dbg !1676
  store float* %lat, float** %lat.addr, align 8
  call void @llvm.dbg.declare(metadata float** %lat.addr, metadata !1677, metadata !1315), !dbg !1678
  store float* %lng, float** %lng.addr, align 8
  call void @llvm.dbg.declare(metadata float** %lng.addr, metadata !1679, metadata !1315), !dbg !1680
  store i32* %q, i32** %q.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %q.addr, metadata !1681, metadata !1315), !dbg !1682
  store i32* %t, i32** %t.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %t.addr, metadata !1683, metadata !1315), !dbg !1684
  store i32* %p, i32** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %p.addr, metadata !1685, metadata !1315), !dbg !1686
  store i32* %d, i32** %d.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %d.addr, metadata !1687, metadata !1315), !dbg !1688
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1689, metadata !1315), !dbg !1690
  %0 = load i32, i32* %argc.addr, align 4, !dbg !1691
  %cmp = icmp slt i32 %0, 2, !dbg !1693
  br i1 %cmp, label %if.then, label %if.end, !dbg !1694

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !1695
  br label %return, !dbg !1695

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %filename.addr, align 8, !dbg !1697
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !1698
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 1, !dbg !1698
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !1698
  %call = call i8* @strncpy(i8* %1, i8* %3, i64 100) #16, !dbg !1699
  call void @llvm.dbg.declare(metadata i8* %flag, metadata !1700, metadata !1315), !dbg !1701
  store i32 1, i32* %i, align 4, !dbg !1702
  br label %for.cond, !dbg !1704

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !1705
  %5 = load i32, i32* %argc.addr, align 4, !dbg !1708
  %cmp1 = icmp slt i32 %4, %5, !dbg !1709
  br i1 %cmp1, label %for.body, label %for.end, !dbg !1710

for.body:                                         ; preds = %for.cond
  %6 = load i8**, i8*** %argv.addr, align 8, !dbg !1711
  %7 = load i32, i32* %i, align 4, !dbg !1714
  %idxprom = sext i32 %7 to i64, !dbg !1711
  %arrayidx2 = getelementptr inbounds i8*, i8** %6, i64 %idxprom, !dbg !1711
  %8 = load i8*, i8** %arrayidx2, align 8, !dbg !1711
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 0, !dbg !1711
  %9 = load i8, i8* %arrayidx3, align 1, !dbg !1711
  %conv = sext i8 %9 to i32, !dbg !1711
  %cmp4 = icmp eq i32 %conv, 45, !dbg !1715
  br i1 %cmp4, label %if.then5, label %if.end44, !dbg !1716

if.then5:                                         ; preds = %for.body
  %10 = load i8**, i8*** %argv.addr, align 8, !dbg !1717
  %11 = load i32, i32* %i, align 4, !dbg !1719
  %idxprom6 = sext i32 %11 to i64, !dbg !1717
  %arrayidx7 = getelementptr inbounds i8*, i8** %10, i64 %idxprom6, !dbg !1717
  %12 = load i8*, i8** %arrayidx7, align 8, !dbg !1717
  %arrayidx8 = getelementptr inbounds i8, i8* %12, i64 1, !dbg !1717
  %13 = load i8, i8* %arrayidx8, align 1, !dbg !1717
  store i8 %13, i8* %flag, align 1, !dbg !1720
  %14 = load i8, i8* %flag, align 1, !dbg !1721
  %conv9 = sext i8 %14 to i32, !dbg !1721
  switch i32 %conv9, label %sw.epilog [
    i32 114, label %sw.bb
    i32 108, label %sw.bb13
    i32 104, label %sw.bb31
    i32 113, label %sw.bb32
    i32 116, label %sw.bb33
    i32 112, label %sw.bb34
    i32 100, label %sw.bb39
  ], !dbg !1722

sw.bb:                                            ; preds = %if.then5
  %15 = load i32, i32* %i, align 4, !dbg !1723
  %inc = add nsw i32 %15, 1, !dbg !1723
  store i32 %inc, i32* %i, align 4, !dbg !1723
  %16 = load i8**, i8*** %argv.addr, align 8, !dbg !1725
  %17 = load i32, i32* %i, align 4, !dbg !1726
  %idxprom10 = sext i32 %17 to i64, !dbg !1725
  %arrayidx11 = getelementptr inbounds i8*, i8** %16, i64 %idxprom10, !dbg !1725
  %18 = load i8*, i8** %arrayidx11, align 8, !dbg !1725
  %call12 = call i32 @atoi(i8* %18) #17, !dbg !1727
  %19 = load i32*, i32** %r.addr, align 8, !dbg !1728
  store i32 %call12, i32* %19, align 4, !dbg !1729
  br label %sw.epilog, !dbg !1730

sw.bb13:                                          ; preds = %if.then5
  %20 = load i8**, i8*** %argv.addr, align 8, !dbg !1731
  %21 = load i32, i32* %i, align 4, !dbg !1733
  %idxprom14 = sext i32 %21 to i64, !dbg !1731
  %arrayidx15 = getelementptr inbounds i8*, i8** %20, i64 %idxprom14, !dbg !1731
  %22 = load i8*, i8** %arrayidx15, align 8, !dbg !1731
  %arrayidx16 = getelementptr inbounds i8, i8* %22, i64 2, !dbg !1731
  %23 = load i8, i8* %arrayidx16, align 1, !dbg !1731
  %conv17 = sext i8 %23 to i32, !dbg !1731
  %cmp18 = icmp eq i32 %conv17, 97, !dbg !1734
  br i1 %cmp18, label %if.then19, label %if.else, !dbg !1735

if.then19:                                        ; preds = %sw.bb13
  %24 = load i8**, i8*** %argv.addr, align 8, !dbg !1736
  %25 = load i32, i32* %i, align 4, !dbg !1738
  %add = add nsw i32 %25, 1, !dbg !1739
  %idxprom20 = sext i32 %add to i64, !dbg !1736
  %arrayidx21 = getelementptr inbounds i8*, i8** %24, i64 %idxprom20, !dbg !1736
  %26 = load i8*, i8** %arrayidx21, align 8, !dbg !1736
  %call22 = call double @atof(i8* %26) #17, !dbg !1740
  %conv23 = fptrunc double %call22 to float, !dbg !1740
  %27 = load float*, float** %lat.addr, align 8, !dbg !1741
  store float %conv23, float* %27, align 4, !dbg !1742
  br label %if.end29, !dbg !1743

if.else:                                          ; preds = %sw.bb13
  %28 = load i8**, i8*** %argv.addr, align 8, !dbg !1744
  %29 = load i32, i32* %i, align 4, !dbg !1746
  %add24 = add nsw i32 %29, 1, !dbg !1747
  %idxprom25 = sext i32 %add24 to i64, !dbg !1744
  %arrayidx26 = getelementptr inbounds i8*, i8** %28, i64 %idxprom25, !dbg !1744
  %30 = load i8*, i8** %arrayidx26, align 8, !dbg !1744
  %call27 = call double @atof(i8* %30) #17, !dbg !1748
  %conv28 = fptrunc double %call27 to float, !dbg !1748
  %31 = load float*, float** %lng.addr, align 8, !dbg !1749
  store float %conv28, float* %31, align 4, !dbg !1750
  br label %if.end29

if.end29:                                         ; preds = %if.else, %if.then19
  %32 = load i32, i32* %i, align 4, !dbg !1751
  %inc30 = add nsw i32 %32, 1, !dbg !1751
  store i32 %inc30, i32* %i, align 4, !dbg !1751
  br label %sw.epilog, !dbg !1752

sw.bb31:                                          ; preds = %if.then5
  store i32 1, i32* %retval, align 4, !dbg !1753
  br label %return, !dbg !1753

sw.bb32:                                          ; preds = %if.then5
  %33 = load i32*, i32** %q.addr, align 8, !dbg !1754
  store i32 1, i32* %33, align 4, !dbg !1755
  br label %sw.epilog, !dbg !1756

sw.bb33:                                          ; preds = %if.then5
  %34 = load i32*, i32** %t.addr, align 8, !dbg !1757
  store i32 1, i32* %34, align 4, !dbg !1758
  br label %sw.epilog, !dbg !1759

sw.bb34:                                          ; preds = %if.then5
  %35 = load i32, i32* %i, align 4, !dbg !1760
  %inc35 = add nsw i32 %35, 1, !dbg !1760
  store i32 %inc35, i32* %i, align 4, !dbg !1760
  %36 = load i8**, i8*** %argv.addr, align 8, !dbg !1761
  %37 = load i32, i32* %i, align 4, !dbg !1762
  %idxprom36 = sext i32 %37 to i64, !dbg !1761
  %arrayidx37 = getelementptr inbounds i8*, i8** %36, i64 %idxprom36, !dbg !1761
  %38 = load i8*, i8** %arrayidx37, align 8, !dbg !1761
  %call38 = call i32 @atoi(i8* %38) #17, !dbg !1763
  %39 = load i32*, i32** %p.addr, align 8, !dbg !1764
  store i32 %call38, i32* %39, align 4, !dbg !1765
  br label %sw.epilog, !dbg !1766

sw.bb39:                                          ; preds = %if.then5
  %40 = load i32, i32* %i, align 4, !dbg !1767
  %inc40 = add nsw i32 %40, 1, !dbg !1767
  store i32 %inc40, i32* %i, align 4, !dbg !1767
  %41 = load i8**, i8*** %argv.addr, align 8, !dbg !1768
  %42 = load i32, i32* %i, align 4, !dbg !1769
  %idxprom41 = sext i32 %42 to i64, !dbg !1768
  %arrayidx42 = getelementptr inbounds i8*, i8** %41, i64 %idxprom41, !dbg !1768
  %43 = load i8*, i8** %arrayidx42, align 8, !dbg !1768
  %call43 = call i32 @atoi(i8* %43) #17, !dbg !1770
  %44 = load i32*, i32** %d.addr, align 8, !dbg !1771
  store i32 %call43, i32* %44, align 4, !dbg !1772
  br label %sw.epilog, !dbg !1773

sw.epilog:                                        ; preds = %if.then5, %sw.bb39, %sw.bb34, %sw.bb33, %sw.bb32, %if.end29, %sw.bb
  br label %if.end44, !dbg !1774

if.end44:                                         ; preds = %sw.epilog, %for.body
  br label %for.inc, !dbg !1775

for.inc:                                          ; preds = %if.end44
  %45 = load i32, i32* %i, align 4, !dbg !1776
  %inc45 = add nsw i32 %45, 1, !dbg !1776
  store i32 %inc45, i32* %i, align 4, !dbg !1776
  br label %for.cond, !dbg !1778, !llvm.loop !1779

for.end:                                          ; preds = %for.cond
  %46 = load i32*, i32** %d.addr, align 8, !dbg !1781
  %47 = load i32, i32* %46, align 4, !dbg !1783
  %cmp46 = icmp sge i32 %47, 0, !dbg !1784
  br i1 %cmp46, label %land.lhs.true, label %lor.lhs.false, !dbg !1785

land.lhs.true:                                    ; preds = %for.end
  %48 = load i32*, i32** %p.addr, align 8, !dbg !1786
  %49 = load i32, i32* %48, align 4, !dbg !1788
  %cmp47 = icmp slt i32 %49, 0, !dbg !1789
  br i1 %cmp47, label %if.then51, label %lor.lhs.false, !dbg !1790

lor.lhs.false:                                    ; preds = %land.lhs.true, %for.end
  %50 = load i32*, i32** %p.addr, align 8, !dbg !1791
  %51 = load i32, i32* %50, align 4, !dbg !1793
  %cmp48 = icmp sge i32 %51, 0, !dbg !1794
  br i1 %cmp48, label %land.lhs.true49, label %if.end52, !dbg !1795

land.lhs.true49:                                  ; preds = %lor.lhs.false
  %52 = load i32*, i32** %d.addr, align 8, !dbg !1796
  %53 = load i32, i32* %52, align 4, !dbg !1798
  %cmp50 = icmp slt i32 %53, 0, !dbg !1799
  br i1 %cmp50, label %if.then51, label %if.end52, !dbg !1800

if.then51:                                        ; preds = %land.lhs.true49, %land.lhs.true
  store i32 1, i32* %retval, align 4, !dbg !1801
  br label %return, !dbg !1801

if.end52:                                         ; preds = %land.lhs.true49, %lor.lhs.false
  store i32 0, i32* %retval, align 4, !dbg !1802
  br label %return, !dbg !1802

return:                                           ; preds = %if.end52, %if.then51, %sw.bb31, %if.then
  %54 = load i32, i32* %retval, align 4, !dbg !1803
  ret i32 %54, !dbg !1803
}

; Function Attrs: uwtable
define void @_Z10printUsagev() #0 !dbg !1804 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i32 0, i32 0)), !dbg !1805
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)), !dbg !1806
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([90 x i8], [90 x i8]* @.str.8, i32 0, i32 0)), !dbg !1807
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)), !dbg !1808
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.9, i32 0, i32 0)), !dbg !1809
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.10, i32 0, i32 0)), !dbg !1810
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)), !dbg !1811
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.11, i32 0, i32 0)), !dbg !1812
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.12, i32 0, i32 0)), !dbg !1813
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.13, i32 0, i32 0)), !dbg !1814
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.14, i32 0, i32 0)), !dbg !1815
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)), !dbg !1816
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.15, i32 0, i32 0)), !dbg !1817
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.16, i32 0, i32 0)), !dbg !1818
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.17, i32 0, i32 0)), !dbg !1819
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)), !dbg !1820
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.18, i32 0, i32 0)), !dbg !1821
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.19, i32 0, i32 0)), !dbg !1822
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)), !dbg !1823
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)), !dbg !1824
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.20, i32 0, i32 0)), !dbg !1825
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.21, i32 0, i32 0)), !dbg !1826
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.22, i32 0, i32 0)), !dbg !1827
  ret void, !dbg !1828
}

; Function Attrs: uwtable
define i32 @_Z8loadDataPcRSt6vectorI6recordSaIS1_EERS0_I7latLongSaIS5_EE(i8* %filename, %"class.std::vector"* dereferenceable(24) %records, %"class.std::vector.0"* dereferenceable(24) %locations) #0 !dbg !1829 {
entry:
  %filename.addr = alloca i8*, align 8
  %records.addr = alloca %"class.std::vector"*, align 8
  %locations.addr = alloca %"class.std::vector.0"*, align 8
  %flist = alloca %struct._IO_FILE*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %dbname = alloca [64 x i8], align 16
  %recNum = alloca i32, align 4
  %record = alloca %struct.record, align 4
  %latLong = alloca %struct.latLong, align 4
  %substr = alloca [6 x i8], align 1
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !1832, metadata !1315), !dbg !1833
  store %"class.std::vector"* %records, %"class.std::vector"** %records.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector"** %records.addr, metadata !1834, metadata !1315), !dbg !1835
  store %"class.std::vector.0"* %locations, %"class.std::vector.0"** %locations.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector.0"** %locations.addr, metadata !1836, metadata !1315), !dbg !1837
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %flist, metadata !1838, metadata !1315), !dbg !1844
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !1845, metadata !1315), !dbg !1846
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1847, metadata !1315), !dbg !1848
  store i32 0, i32* %i, align 4, !dbg !1848
  call void @llvm.dbg.declare(metadata [64 x i8]* %dbname, metadata !1849, metadata !1315), !dbg !1853
  call void @llvm.dbg.declare(metadata i32* %recNum, metadata !1854, metadata !1315), !dbg !1855
  store i32 0, i32* %recNum, align 4, !dbg !1855
  %0 = load i8*, i8** %filename.addr, align 8, !dbg !1856
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0)), !dbg !1857
  store %struct._IO_FILE* %call, %struct._IO_FILE** %flist, align 8, !dbg !1858
  br label %while.cond, !dbg !1859

while.cond:                                       ; preds = %while.end, %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %flist, align 8, !dbg !1860
  %call1 = call i32 @feof(%struct._IO_FILE* %1) #16, !dbg !1862
  %tobool = icmp ne i32 %call1, 0, !dbg !1862
  %lnot = xor i1 %tobool, true, !dbg !1863
  br i1 %lnot, label %while.body, label %while.end48, !dbg !1864

while.body:                                       ; preds = %while.cond
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %flist, align 8, !dbg !1865
  %arraydecay = getelementptr inbounds [64 x i8], [64 x i8]* %dbname, i32 0, i32 0, !dbg !1868
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i8* %arraydecay), !dbg !1869
  %cmp = icmp ne i32 %call2, 1, !dbg !1870
  br i1 %cmp, label %if.then, label %if.end, !dbg !1871

if.then:                                          ; preds = %while.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1872
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.4, i32 0, i32 0)), !dbg !1874
  call void @exit(i32 0) #15, !dbg !1875
  unreachable, !dbg !1875

if.end:                                           ; preds = %while.body
  %arraydecay4 = getelementptr inbounds [64 x i8], [64 x i8]* %dbname, i32 0, i32 0, !dbg !1876
  %call5 = call %struct._IO_FILE* @fopen(i8* %arraydecay4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0)), !dbg !1877
  store %struct._IO_FILE* %call5, %struct._IO_FILE** %fp, align 8, !dbg !1878
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !1879
  %tobool6 = icmp ne %struct._IO_FILE* %4, null, !dbg !1879
  br i1 %tobool6, label %if.end9, label %if.then7, !dbg !1881

if.then7:                                         ; preds = %if.end
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i32 0, i32 0)), !dbg !1882
  call void @exit(i32 1) #15, !dbg !1884
  unreachable, !dbg !1884

if.end9:                                          ; preds = %if.end
  br label %while.cond10, !dbg !1885

while.cond10:                                     ; preds = %for.end41, %if.end9
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !1886
  %call11 = call i32 @feof(%struct._IO_FILE* %5) #16, !dbg !1888
  %tobool12 = icmp ne i32 %call11, 0, !dbg !1888
  %lnot13 = xor i1 %tobool12, true, !dbg !1889
  br i1 %lnot13, label %while.body14, label %while.end, !dbg !1890

while.body14:                                     ; preds = %while.cond10
  call void @llvm.dbg.declare(metadata %struct.record* %record, metadata !1891, metadata !1315), !dbg !1894
  call void @llvm.dbg.declare(metadata %struct.latLong* %latLong, metadata !1895, metadata !1315), !dbg !1896
  %recString = getelementptr inbounds %struct.record, %struct.record* %record, i32 0, i32 0, !dbg !1897
  %arraydecay15 = getelementptr inbounds [53 x i8], [53 x i8]* %recString, i32 0, i32 0, !dbg !1898
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !1899
  %call16 = call i8* @fgets(i8* %arraydecay15, i32 49, %struct._IO_FILE* %6), !dbg !1900
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !1901
  %call17 = call i32 @fgetc(%struct._IO_FILE* %7), !dbg !1902
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !1903
  %call18 = call i32 @feof(%struct._IO_FILE* %8) #16, !dbg !1905
  %tobool19 = icmp ne i32 %call18, 0, !dbg !1905
  br i1 %tobool19, label %if.then20, label %if.end21, !dbg !1906

if.then20:                                        ; preds = %while.body14
  br label %while.end, !dbg !1907

if.end21:                                         ; preds = %while.body14
  call void @llvm.dbg.declare(metadata [6 x i8]* %substr, metadata !1909, metadata !1315), !dbg !1913
  store i32 0, i32* %i, align 4, !dbg !1914
  br label %for.cond, !dbg !1916

for.cond:                                         ; preds = %for.inc, %if.end21
  %9 = load i32, i32* %i, align 4, !dbg !1917
  %cmp22 = icmp slt i32 %9, 5, !dbg !1920
  br i1 %cmp22, label %for.body, label %for.end, !dbg !1921

for.body:                                         ; preds = %for.cond
  %recString23 = getelementptr inbounds %struct.record, %struct.record* %record, i32 0, i32 0, !dbg !1922
  %arraydecay24 = getelementptr inbounds [53 x i8], [53 x i8]* %recString23, i32 0, i32 0, !dbg !1924
  %10 = load i32, i32* %i, align 4, !dbg !1925
  %idx.ext = sext i32 %10 to i64, !dbg !1926
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay24, i64 %idx.ext, !dbg !1926
  %add.ptr25 = getelementptr inbounds i8, i8* %add.ptr, i64 28, !dbg !1927
  %11 = load i8, i8* %add.ptr25, align 1, !dbg !1928
  %12 = load i32, i32* %i, align 4, !dbg !1929
  %idxprom = sext i32 %12 to i64, !dbg !1930
  %arrayidx = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 %idxprom, !dbg !1930
  store i8 %11, i8* %arrayidx, align 1, !dbg !1931
  br label %for.inc, !dbg !1930

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4, !dbg !1932
  %inc = add nsw i32 %13, 1, !dbg !1932
  store i32 %inc, i32* %i, align 4, !dbg !1932
  br label %for.cond, !dbg !1934, !llvm.loop !1935

for.end:                                          ; preds = %for.cond
  %arrayidx26 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 5, !dbg !1937
  store i8 0, i8* %arrayidx26, align 1, !dbg !1938
  %arraydecay27 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i32 0, i32 0, !dbg !1939
  %call28 = call double @atof(i8* %arraydecay27) #17, !dbg !1940
  %conv = fptrunc double %call28 to float, !dbg !1940
  %lat = getelementptr inbounds %struct.latLong, %struct.latLong* %latLong, i32 0, i32 0, !dbg !1941
  store float %conv, float* %lat, align 4, !dbg !1942
  store i32 0, i32* %i, align 4, !dbg !1943
  br label %for.cond29, !dbg !1945

for.cond29:                                       ; preds = %for.inc39, %for.end
  %14 = load i32, i32* %i, align 4, !dbg !1946
  %cmp30 = icmp slt i32 %14, 5, !dbg !1949
  br i1 %cmp30, label %for.body31, label %for.end41, !dbg !1950

for.body31:                                       ; preds = %for.cond29
  %recString32 = getelementptr inbounds %struct.record, %struct.record* %record, i32 0, i32 0, !dbg !1951
  %arraydecay33 = getelementptr inbounds [53 x i8], [53 x i8]* %recString32, i32 0, i32 0, !dbg !1953
  %15 = load i32, i32* %i, align 4, !dbg !1954
  %idx.ext34 = sext i32 %15 to i64, !dbg !1955
  %add.ptr35 = getelementptr inbounds i8, i8* %arraydecay33, i64 %idx.ext34, !dbg !1955
  %add.ptr36 = getelementptr inbounds i8, i8* %add.ptr35, i64 33, !dbg !1956
  %16 = load i8, i8* %add.ptr36, align 1, !dbg !1957
  %17 = load i32, i32* %i, align 4, !dbg !1958
  %idxprom37 = sext i32 %17 to i64, !dbg !1959
  %arrayidx38 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 %idxprom37, !dbg !1959
  store i8 %16, i8* %arrayidx38, align 1, !dbg !1960
  br label %for.inc39, !dbg !1959

for.inc39:                                        ; preds = %for.body31
  %18 = load i32, i32* %i, align 4, !dbg !1961
  %inc40 = add nsw i32 %18, 1, !dbg !1961
  store i32 %inc40, i32* %i, align 4, !dbg !1961
  br label %for.cond29, !dbg !1963, !llvm.loop !1964

for.end41:                                        ; preds = %for.cond29
  %arrayidx42 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 5, !dbg !1966
  store i8 0, i8* %arrayidx42, align 1, !dbg !1967
  %arraydecay43 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i32 0, i32 0, !dbg !1968
  %call44 = call double @atof(i8* %arraydecay43) #17, !dbg !1969
  %conv45 = fptrunc double %call44 to float, !dbg !1969
  %lng = getelementptr inbounds %struct.latLong, %struct.latLong* %latLong, i32 0, i32 1, !dbg !1970
  store float %conv45, float* %lng, align 4, !dbg !1971
  %19 = load %"class.std::vector.0"*, %"class.std::vector.0"** %locations.addr, align 8, !dbg !1972
  call void @_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_(%"class.std::vector.0"* %19, %struct.latLong* dereferenceable(8) %latLong), !dbg !1973
  %20 = load %"class.std::vector"*, %"class.std::vector"** %records.addr, align 8, !dbg !1974
  call void @_ZNSt6vectorI6recordSaIS0_EE9push_backERKS0_(%"class.std::vector"* %20, %struct.record* dereferenceable(60) %record), !dbg !1975
  %21 = load i32, i32* %recNum, align 4, !dbg !1976
  %inc46 = add nsw i32 %21, 1, !dbg !1976
  store i32 %inc46, i32* %recNum, align 4, !dbg !1976
  br label %while.cond10, !dbg !1977, !llvm.loop !1979

while.end:                                        ; preds = %if.then20, %while.cond10
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !1980
  %call47 = call i32 @fclose(%struct._IO_FILE* %22), !dbg !1981
  br label %while.cond, !dbg !1982, !llvm.loop !1984

while.end48:                                      ; preds = %while.cond
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %flist, align 8, !dbg !1985
  %call49 = call i32 @fclose(%struct._IO_FILE* %23), !dbg !1986
  %24 = load i32, i32* %recNum, align 4, !dbg !1987
  ret i32 %24, !dbg !1988
}

declare i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) #4

declare i32 @cudaThreadSynchronize() #4

declare i32 @cudaMemGetInfo(i64*, i64*) #4

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #3 comdat align 2 !dbg !1989 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1990, metadata !1315), !dbg !1992
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1993, metadata !1315), !dbg !1994
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1995, metadata !1315), !dbg !1996
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1997, metadata !1315), !dbg !1998
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1999
  %0 = load i32, i32* %vx.addr, align 4, !dbg !2000
  store i32 %0, i32* %x, align 4, !dbg !1999
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !2001
  %1 = load i32, i32* %vy.addr, align 4, !dbg !2002
  store i32 %1, i32* %y, align 4, !dbg !2001
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !2003
  %2 = load i32, i32* %vz.addr, align 4, !dbg !2004
  store i32 %2, i32* %z, align 4, !dbg !2003
  ret void, !dbg !2005
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #6

declare i32 @cudaMalloc(i8**, i64) #4

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #4

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(8) %struct.latLong* @_ZNSt6vectorI7latLongSaIS0_EEixEm(%"class.std::vector.0"* %this, i64 %__n) #3 comdat align 2 !dbg !2006 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector.0"** %this.addr, metadata !2007, metadata !1315), !dbg !2008
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !2009, metadata !1315), !dbg !2010
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2011
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0, !dbg !2011
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 0, !dbg !2012
  %1 = load %struct.latLong*, %struct.latLong** %_M_start, align 8, !dbg !2012
  %2 = load i64, i64* %__n.addr, align 8, !dbg !2013
  %add.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %1, i64 %2, !dbg !2014
  ret %struct.latLong* %add.ptr, !dbg !2015
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #7

; Function Attrs: uwtable
define void @_Z10findLowestRSt6vectorI6recordSaIS0_EEPfii(%"class.std::vector"* dereferenceable(24) %records, float* %distances, i32 %numRecords, i32 %topN) #0 !dbg !2016 {
entry:
  %records.addr = alloca %"class.std::vector"*, align 8
  %distances.addr = alloca float*, align 8
  %numRecords.addr = alloca i32, align 4
  %topN.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %val = alloca float, align 4
  %minLoc = alloca i32, align 4
  %tempRec = alloca %struct.record*, align 8
  %tempDist = alloca float, align 4
  store %"class.std::vector"* %records, %"class.std::vector"** %records.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector"** %records.addr, metadata !2019, metadata !1315), !dbg !2020
  store float* %distances, float** %distances.addr, align 8
  call void @llvm.dbg.declare(metadata float** %distances.addr, metadata !2021, metadata !1315), !dbg !2022
  store i32 %numRecords, i32* %numRecords.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numRecords.addr, metadata !2023, metadata !1315), !dbg !2024
  store i32 %topN, i32* %topN.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %topN.addr, metadata !2025, metadata !1315), !dbg !2026
  call void @llvm.dbg.declare(metadata i32* %i, metadata !2027, metadata !1315), !dbg !2028
  call void @llvm.dbg.declare(metadata i32* %j, metadata !2029, metadata !1315), !dbg !2030
  call void @llvm.dbg.declare(metadata float* %val, metadata !2031, metadata !1315), !dbg !2032
  call void @llvm.dbg.declare(metadata i32* %minLoc, metadata !2033, metadata !1315), !dbg !2034
  call void @llvm.dbg.declare(metadata %struct.record** %tempRec, metadata !2035, metadata !1315), !dbg !2037
  call void @llvm.dbg.declare(metadata float* %tempDist, metadata !2038, metadata !1315), !dbg !2039
  store i32 0, i32* %i, align 4, !dbg !2040
  br label %for.cond, !dbg !2042

for.cond:                                         ; preds = %for.inc25, %entry
  %0 = load i32, i32* %i, align 4, !dbg !2043
  %1 = load i32, i32* %topN.addr, align 4, !dbg !2046
  %cmp = icmp slt i32 %0, %1, !dbg !2047
  br i1 %cmp, label %for.body, label %for.end27, !dbg !2048

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !2049
  store i32 %2, i32* %minLoc, align 4, !dbg !2051
  %3 = load i32, i32* %i, align 4, !dbg !2052
  store i32 %3, i32* %j, align 4, !dbg !2054
  br label %for.cond1, !dbg !2055

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4, !dbg !2056
  %5 = load i32, i32* %numRecords.addr, align 4, !dbg !2059
  %cmp2 = icmp slt i32 %4, %5, !dbg !2060
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !2061

for.body3:                                        ; preds = %for.cond1
  %6 = load float*, float** %distances.addr, align 8, !dbg !2062
  %7 = load i32, i32* %j, align 4, !dbg !2064
  %idxprom = sext i32 %7 to i64, !dbg !2062
  %arrayidx = getelementptr inbounds float, float* %6, i64 %idxprom, !dbg !2062
  %8 = load float, float* %arrayidx, align 4, !dbg !2062
  store float %8, float* %val, align 4, !dbg !2065
  %9 = load float, float* %val, align 4, !dbg !2066
  %10 = load float*, float** %distances.addr, align 8, !dbg !2068
  %11 = load i32, i32* %minLoc, align 4, !dbg !2069
  %idxprom4 = sext i32 %11 to i64, !dbg !2068
  %arrayidx5 = getelementptr inbounds float, float* %10, i64 %idxprom4, !dbg !2068
  %12 = load float, float* %arrayidx5, align 4, !dbg !2068
  %cmp6 = fcmp olt float %9, %12, !dbg !2070
  br i1 %cmp6, label %if.then, label %if.end, !dbg !2071

if.then:                                          ; preds = %for.body3
  %13 = load i32, i32* %j, align 4, !dbg !2072
  store i32 %13, i32* %minLoc, align 4, !dbg !2074
  br label %if.end, !dbg !2075

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !2076

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %j, align 4, !dbg !2077
  %inc = add nsw i32 %14, 1, !dbg !2077
  store i32 %inc, i32* %j, align 4, !dbg !2077
  br label %for.cond1, !dbg !2079, !llvm.loop !2080

for.end:                                          ; preds = %for.cond1
  %15 = load %"class.std::vector"*, %"class.std::vector"** %records.addr, align 8, !dbg !2082
  %16 = load i32, i32* %i, align 4, !dbg !2083
  %conv = sext i32 %16 to i64, !dbg !2083
  %call = call dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %15, i64 %conv), !dbg !2082
  store %struct.record* %call, %struct.record** %tempRec, align 8, !dbg !2084
  %17 = load %"class.std::vector"*, %"class.std::vector"** %records.addr, align 8, !dbg !2085
  %18 = load i32, i32* %minLoc, align 4, !dbg !2086
  %conv7 = sext i32 %18 to i64, !dbg !2086
  %call8 = call dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %17, i64 %conv7), !dbg !2085
  %19 = load %"class.std::vector"*, %"class.std::vector"** %records.addr, align 8, !dbg !2087
  %20 = load i32, i32* %i, align 4, !dbg !2088
  %conv9 = sext i32 %20 to i64, !dbg !2088
  %call10 = call dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %19, i64 %conv9), !dbg !2089
  %21 = bitcast %struct.record* %call10 to i8*, !dbg !2091
  %22 = bitcast %struct.record* %call8 to i8*, !dbg !2091
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %21, i8* %22, i64 60, i32 4, i1 false), !dbg !2091
  %23 = load %struct.record*, %struct.record** %tempRec, align 8, !dbg !2092
  %24 = load %"class.std::vector"*, %"class.std::vector"** %records.addr, align 8, !dbg !2093
  %25 = load i32, i32* %minLoc, align 4, !dbg !2094
  %conv11 = sext i32 %25 to i64, !dbg !2094
  %call12 = call dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %24, i64 %conv11), !dbg !2093
  %26 = bitcast %struct.record* %call12 to i8*, !dbg !2095
  %27 = bitcast %struct.record* %23 to i8*, !dbg !2095
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 60, i32 4, i1 false), !dbg !2095
  %28 = load float*, float** %distances.addr, align 8, !dbg !2096
  %29 = load i32, i32* %i, align 4, !dbg !2097
  %idxprom13 = sext i32 %29 to i64, !dbg !2096
  %arrayidx14 = getelementptr inbounds float, float* %28, i64 %idxprom13, !dbg !2096
  %30 = load float, float* %arrayidx14, align 4, !dbg !2096
  store float %30, float* %tempDist, align 4, !dbg !2098
  %31 = load float*, float** %distances.addr, align 8, !dbg !2099
  %32 = load i32, i32* %minLoc, align 4, !dbg !2100
  %idxprom15 = sext i32 %32 to i64, !dbg !2099
  %arrayidx16 = getelementptr inbounds float, float* %31, i64 %idxprom15, !dbg !2099
  %33 = load float, float* %arrayidx16, align 4, !dbg !2099
  %34 = load float*, float** %distances.addr, align 8, !dbg !2101
  %35 = load i32, i32* %i, align 4, !dbg !2102
  %idxprom17 = sext i32 %35 to i64, !dbg !2101
  %arrayidx18 = getelementptr inbounds float, float* %34, i64 %idxprom17, !dbg !2101
  store float %33, float* %arrayidx18, align 4, !dbg !2103
  %36 = load float, float* %tempDist, align 4, !dbg !2104
  %37 = load float*, float** %distances.addr, align 8, !dbg !2105
  %38 = load i32, i32* %minLoc, align 4, !dbg !2106
  %idxprom19 = sext i32 %38 to i64, !dbg !2105
  %arrayidx20 = getelementptr inbounds float, float* %37, i64 %idxprom19, !dbg !2105
  store float %36, float* %arrayidx20, align 4, !dbg !2107
  %39 = load float*, float** %distances.addr, align 8, !dbg !2108
  %40 = load i32, i32* %i, align 4, !dbg !2109
  %idxprom21 = sext i32 %40 to i64, !dbg !2108
  %arrayidx22 = getelementptr inbounds float, float* %39, i64 %idxprom21, !dbg !2108
  %41 = load float, float* %arrayidx22, align 4, !dbg !2108
  %42 = load %"class.std::vector"*, %"class.std::vector"** %records.addr, align 8, !dbg !2110
  %43 = load i32, i32* %i, align 4, !dbg !2111
  %conv23 = sext i32 %43 to i64, !dbg !2111
  %call24 = call dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %42, i64 %conv23), !dbg !2110
  %distance = getelementptr inbounds %struct.record, %struct.record* %call24, i32 0, i32 1, !dbg !2112
  store float %41, float* %distance, align 4, !dbg !2113
  br label %for.inc25, !dbg !2114

for.inc25:                                        ; preds = %for.end
  %44 = load i32, i32* %i, align 4, !dbg !2115
  %inc26 = add nsw i32 %44, 1, !dbg !2115
  store i32 %inc26, i32* %i, align 4, !dbg !2115
  br label %for.cond, !dbg !2117, !llvm.loop !2118

for.end27:                                        ; preds = %for.cond
  ret void, !dbg !2120
}

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(60) %struct.record* @_ZNSt6vectorI6recordSaIS0_EEixEm(%"class.std::vector"* %this, i64 %__n) #3 comdat align 2 !dbg !2121 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector"** %this.addr, metadata !2122, metadata !1315), !dbg !2123
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !2124, metadata !1315), !dbg !2125
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !2126
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0, !dbg !2126
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 0, !dbg !2127
  %1 = load %struct.record*, %struct.record** %_M_start, align 8, !dbg !2127
  %2 = load i64, i64* %__n.addr, align 8, !dbg !2128
  %add.ptr = getelementptr inbounds %struct.record, %struct.record* %1, i64 %2, !dbg !2129
  ret %struct.record* %add.ptr, !dbg !2130
}

; Function Attrs: nounwind
declare void @free(i8*) #6

declare i32 @cudaFree(i8*) #4

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt6vectorI7latLongSaIS0_EED2Ev(%"class.std::vector.0"* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2131 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector.0"** %this.addr, metadata !2132, metadata !1315), !dbg !2133
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2134
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0, !dbg !2134
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 0, !dbg !2136
  %1 = load %struct.latLong*, %struct.latLong** %_M_start, align 8, !dbg !2136
  %2 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2137
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %2, i32 0, i32 0, !dbg !2137
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl2, i32 0, i32 1, !dbg !2138
  %3 = load %struct.latLong*, %struct.latLong** %_M_finish, align 8, !dbg !2138
  %4 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2139
  %call = invoke dereferenceable(1) %"class.std::allocator.2"* @_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %4)
          to label %invoke.cont unwind label %lpad, !dbg !2139

invoke.cont:                                      ; preds = %entry
  invoke void @_ZSt8_DestroyIP7latLongS0_EvT_S2_RSaIT0_E(%struct.latLong* %1, %struct.latLong* %3, %"class.std::allocator.2"* dereferenceable(1) %call)
          to label %invoke.cont3 unwind label %lpad, !dbg !2140

invoke.cont3:                                     ; preds = %invoke.cont
  %5 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2142
  call void @_ZNSt12_Vector_baseI7latLongSaIS0_EED2Ev(%"struct.std::_Vector_base.1"* %5), !dbg !2142
  ret void, !dbg !2142

lpad:                                             ; preds = %invoke.cont, %entry
  %6 = landingpad { i8*, i32 }
          cleanup, !dbg !2143
  %7 = extractvalue { i8*, i32 } %6, 0, !dbg !2143
  store i8* %7, i8** %exn.slot, align 8, !dbg !2143
  %8 = extractvalue { i8*, i32 } %6, 1, !dbg !2143
  store i32 %8, i32* %ehselector.slot, align 4, !dbg !2143
  %9 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2143
  invoke void @_ZNSt12_Vector_baseI7latLongSaIS0_EED2Ev(%"struct.std::_Vector_base.1"* %9)
          to label %invoke.cont4 unwind label %terminate.lpad, !dbg !2143

invoke.cont4:                                     ; preds = %lpad
  br label %eh.resume, !dbg !2145

eh.resume:                                        ; preds = %invoke.cont4
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !2147
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !2147
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !2147
  %lpad.val5 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !2147
  resume { i8*, i32 } %lpad.val5, !dbg !2147

terminate.lpad:                                   ; preds = %lpad
  %10 = landingpad { i8*, i32 }
          catch i8* null, !dbg !2149
  %11 = extractvalue { i8*, i32 } %10, 0, !dbg !2149
  call void @__clang_call_terminate(i8* %11) #15, !dbg !2149
  unreachable, !dbg !2149
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #8 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #16
  call void @_ZSt9terminatev() #15
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt6vectorI6recordSaIS0_EED2Ev(%"class.std::vector"* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2151 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector"** %this.addr, metadata !2152, metadata !1315), !dbg !2153
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !2154
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0, !dbg !2154
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 0, !dbg !2156
  %1 = load %struct.record*, %struct.record** %_M_start, align 8, !dbg !2156
  %2 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !2157
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %2, i32 0, i32 0, !dbg !2157
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl2, i32 0, i32 1, !dbg !2158
  %3 = load %struct.record*, %struct.record** %_M_finish, align 8, !dbg !2158
  %4 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !2159
  %call = invoke dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %4)
          to label %invoke.cont unwind label %lpad, !dbg !2159

invoke.cont:                                      ; preds = %entry
  invoke void @_ZSt8_DestroyIP6recordS0_EvT_S2_RSaIT0_E(%struct.record* %1, %struct.record* %3, %"class.std::allocator"* dereferenceable(1) %call)
          to label %invoke.cont3 unwind label %lpad, !dbg !2160

invoke.cont3:                                     ; preds = %invoke.cont
  %5 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !2162
  call void @_ZNSt12_Vector_baseI6recordSaIS0_EED2Ev(%"struct.std::_Vector_base"* %5), !dbg !2162
  ret void, !dbg !2162

lpad:                                             ; preds = %invoke.cont, %entry
  %6 = landingpad { i8*, i32 }
          cleanup, !dbg !2163
  %7 = extractvalue { i8*, i32 } %6, 0, !dbg !2163
  store i8* %7, i8** %exn.slot, align 8, !dbg !2163
  %8 = extractvalue { i8*, i32 } %6, 1, !dbg !2163
  store i32 %8, i32* %ehselector.slot, align 4, !dbg !2163
  %9 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !2163
  invoke void @_ZNSt12_Vector_baseI6recordSaIS0_EED2Ev(%"struct.std::_Vector_base"* %9)
          to label %invoke.cont4 unwind label %terminate.lpad, !dbg !2163

invoke.cont4:                                     ; preds = %lpad
  br label %eh.resume, !dbg !2165

eh.resume:                                        ; preds = %invoke.cont4
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !2167
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !2167
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !2167
  %lpad.val5 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !2167
  resume { i8*, i32 } %lpad.val5, !dbg !2167

terminate.lpad:                                   ; preds = %lpad
  %10 = landingpad { i8*, i32 }
          catch i8* null, !dbg !2169
  %11 = extractvalue { i8*, i32 } %10, 0, !dbg !2169
  call void @__clang_call_terminate(i8* %11) #15, !dbg !2169
  unreachable, !dbg !2169
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #4

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE*) #6

declare i32 @fscanf(%struct._IO_FILE*, i8*, ...) #4

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #4

declare i32 @fgetc(%struct._IO_FILE*) #4

; Function Attrs: nounwind readonly
declare double @atof(i8*) #9

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_(%"class.std::vector.0"* %this, %struct.latLong* dereferenceable(8) %__x) #0 comdat align 2 !dbg !2171 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  %__x.addr = alloca %struct.latLong*, align 8
  %agg.tmp = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector.0"** %this.addr, metadata !2172, metadata !1315), !dbg !2173
  store %struct.latLong* %__x, %struct.latLong** %__x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__x.addr, metadata !2174, metadata !1315), !dbg !2175
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2176
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0, !dbg !2176
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 1, !dbg !2178
  %1 = load %struct.latLong*, %struct.latLong** %_M_finish, align 8, !dbg !2178
  %2 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2179
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %2, i32 0, i32 0, !dbg !2179
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl2, i32 0, i32 2, !dbg !2180
  %3 = load %struct.latLong*, %struct.latLong** %_M_end_of_storage, align 8, !dbg !2180
  %cmp = icmp ne %struct.latLong* %1, %3, !dbg !2181
  br i1 %cmp, label %if.then, label %if.else, !dbg !2182

if.then:                                          ; preds = %entry
  %4 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2183
  %_M_impl3 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %4, i32 0, i32 0, !dbg !2183
  %5 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl3 to %"class.std::allocator.2"*, !dbg !2185
  %6 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2186
  %_M_impl4 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %6, i32 0, i32 0, !dbg !2186
  %_M_finish5 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl4, i32 0, i32 1, !dbg !2187
  %7 = load %struct.latLong*, %struct.latLong** %_M_finish5, align 8, !dbg !2187
  %8 = load %struct.latLong*, %struct.latLong** %__x.addr, align 8, !dbg !2188
  call void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator.2"* dereferenceable(1) %5, %struct.latLong* %7, %struct.latLong* dereferenceable(8) %8), !dbg !2189
  %9 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2190
  %_M_impl6 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %9, i32 0, i32 0, !dbg !2190
  %_M_finish7 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl6, i32 0, i32 1, !dbg !2191
  %10 = load %struct.latLong*, %struct.latLong** %_M_finish7, align 8, !dbg !2192
  %incdec.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %10, i32 1, !dbg !2192
  store %struct.latLong* %incdec.ptr, %struct.latLong** %_M_finish7, align 8, !dbg !2192
  br label %if.end, !dbg !2193

if.else:                                          ; preds = %entry
  %call = call %struct.latLong* @_ZNSt6vectorI7latLongSaIS0_EE3endEv(%"class.std::vector.0"* %this1), !dbg !2194
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %agg.tmp, i32 0, i32 0, !dbg !2194
  store %struct.latLong* %call, %struct.latLong** %coerce.dive, align 8, !dbg !2194
  %11 = load %struct.latLong*, %struct.latLong** %__x.addr, align 8, !dbg !2195
  %coerce.dive8 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %agg.tmp, i32 0, i32 0, !dbg !2196
  %12 = load %struct.latLong*, %struct.latLong** %coerce.dive8, align 8, !dbg !2196
  call void @_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector.0"* %this1, %struct.latLong* %12, %struct.latLong* dereferenceable(8) %11), !dbg !2197
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !2199
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt6vectorI6recordSaIS0_EE9push_backERKS0_(%"class.std::vector"* %this, %struct.record* dereferenceable(60) %__x) #0 comdat align 2 !dbg !2200 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  %__x.addr = alloca %struct.record*, align 8
  %agg.tmp = alloca %"class.__gnu_cxx::__normal_iterator.5", align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector"** %this.addr, metadata !2201, metadata !1315), !dbg !2202
  store %struct.record* %__x, %struct.record** %__x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__x.addr, metadata !2203, metadata !1315), !dbg !2204
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !2205
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0, !dbg !2205
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 1, !dbg !2207
  %1 = load %struct.record*, %struct.record** %_M_finish, align 8, !dbg !2207
  %2 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !2208
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %2, i32 0, i32 0, !dbg !2208
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl2, i32 0, i32 2, !dbg !2209
  %3 = load %struct.record*, %struct.record** %_M_end_of_storage, align 8, !dbg !2209
  %cmp = icmp ne %struct.record* %1, %3, !dbg !2210
  br i1 %cmp, label %if.then, label %if.else, !dbg !2211

if.then:                                          ; preds = %entry
  %4 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !2212
  %_M_impl3 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %4, i32 0, i32 0, !dbg !2212
  %5 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl3 to %"class.std::allocator"*, !dbg !2214
  %6 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !2215
  %_M_impl4 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %6, i32 0, i32 0, !dbg !2215
  %_M_finish5 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl4, i32 0, i32 1, !dbg !2216
  %7 = load %struct.record*, %struct.record** %_M_finish5, align 8, !dbg !2216
  %8 = load %struct.record*, %struct.record** %__x.addr, align 8, !dbg !2217
  call void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator"* dereferenceable(1) %5, %struct.record* %7, %struct.record* dereferenceable(60) %8), !dbg !2218
  %9 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !2219
  %_M_impl6 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %9, i32 0, i32 0, !dbg !2219
  %_M_finish7 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl6, i32 0, i32 1, !dbg !2220
  %10 = load %struct.record*, %struct.record** %_M_finish7, align 8, !dbg !2221
  %incdec.ptr = getelementptr inbounds %struct.record, %struct.record* %10, i32 1, !dbg !2221
  store %struct.record* %incdec.ptr, %struct.record** %_M_finish7, align 8, !dbg !2221
  br label %if.end, !dbg !2222

if.else:                                          ; preds = %entry
  %call = call %struct.record* @_ZNSt6vectorI6recordSaIS0_EE3endEv(%"class.std::vector"* %this1), !dbg !2223
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %agg.tmp, i32 0, i32 0, !dbg !2223
  store %struct.record* %call, %struct.record** %coerce.dive, align 8, !dbg !2223
  %11 = load %struct.record*, %struct.record** %__x.addr, align 8, !dbg !2224
  %coerce.dive8 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %agg.tmp, i32 0, i32 0, !dbg !2225
  %12 = load %struct.record*, %struct.record** %coerce.dive8, align 8, !dbg !2225
  call void @_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector"* %this1, %struct.record* %12, %struct.record* dereferenceable(60) %11), !dbg !2226
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !2228
}

declare i32 @fclose(%struct._IO_FILE*) #4

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8*, i64) #6

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #9

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI6recordSaIS0_EEC2Ev(%"struct.std::_Vector_base"* %this) unnamed_addr #0 comdat align 2 !dbg !2229 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %this, %"struct.std::_Vector_base"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base"** %this.addr, metadata !2230, metadata !1315), !dbg !2232
  %this1 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0, !dbg !2233
  call void @_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implC2Ev(%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl), !dbg !2233
  ret void, !dbg !2234
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implC2Ev(%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this) unnamed_addr #3 comdat align 2 !dbg !2235 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this, %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"** %this.addr, metadata !2236, metadata !1315), !dbg !2238
  %this1 = load %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"*, %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this1 to %"class.std::allocator"*, !dbg !2239
  call void @_ZNSaI6recordEC2Ev(%"class.std::allocator"* %0) #16, !dbg !2240
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this1, i32 0, i32 0, !dbg !2241
  store %struct.record* null, %struct.record** %_M_start, align 8, !dbg !2241
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this1, i32 0, i32 1, !dbg !2242
  store %struct.record* null, %struct.record** %_M_finish, align 8, !dbg !2242
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this1, i32 0, i32 2, !dbg !2243
  store %struct.record* null, %struct.record** %_M_end_of_storage, align 8, !dbg !2243
  ret void, !dbg !2244
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZNSaI6recordEC2Ev(%"class.std::allocator"* %this) unnamed_addr #3 comdat align 2 !dbg !2245 {
entry:
  %this.addr = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %this, %"class.std::allocator"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %this.addr, metadata !2246, metadata !1315), !dbg !2248
  %this1 = load %"class.std::allocator"*, %"class.std::allocator"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator"* %this1 to %"class.__gnu_cxx::new_allocator"*, !dbg !2249
  call void @_ZN9__gnu_cxx13new_allocatorI6recordEC2Ev(%"class.__gnu_cxx::new_allocator"* %0) #16, !dbg !2250
  ret void, !dbg !2251
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI6recordEC2Ev(%"class.__gnu_cxx::new_allocator"* %this) unnamed_addr #3 comdat align 2 !dbg !2252 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator"** %this.addr, metadata !2253, metadata !1315), !dbg !2255
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  ret void, !dbg !2256
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZSt8_DestroyIP6recordS0_EvT_S2_RSaIT0_E(%struct.record* %__first, %struct.record* %__last, %"class.std::allocator"* dereferenceable(1)) #10 comdat !dbg !2257 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %.addr = alloca %"class.std::allocator"*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !2263, metadata !1315), !dbg !2264
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !2265, metadata !1315), !dbg !2266
  store %"class.std::allocator"* %0, %"class.std::allocator"** %.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %.addr, metadata !2267, metadata !1315), !dbg !2268
  %1 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !2269
  %2 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !2270
  call void @_ZSt8_DestroyIP6recordEvT_S2_(%struct.record* %1, %struct.record* %2), !dbg !2271
  ret void, !dbg !2272
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %this) #3 comdat align 2 !dbg !2273 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %this, %"struct.std::_Vector_base"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base"** %this.addr, metadata !2274, metadata !1315), !dbg !2275
  %this1 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0, !dbg !2276
  %0 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl to %"class.std::allocator"*, !dbg !2277
  ret %"class.std::allocator"* %0, !dbg !2278
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI6recordSaIS0_EED2Ev(%"struct.std::_Vector_base"* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2279 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"struct.std::_Vector_base"* %this, %"struct.std::_Vector_base"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base"** %this.addr, metadata !2280, metadata !1315), !dbg !2281
  %this1 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0, !dbg !2282
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 0, !dbg !2284
  %0 = load %struct.record*, %struct.record** %_M_start, align 8, !dbg !2284
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0, !dbg !2285
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl2, i32 0, i32 2, !dbg !2286
  %1 = load %struct.record*, %struct.record** %_M_end_of_storage, align 8, !dbg !2286
  %_M_impl3 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0, !dbg !2287
  %_M_start4 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl3, i32 0, i32 0, !dbg !2288
  %2 = load %struct.record*, %struct.record** %_M_start4, align 8, !dbg !2288
  %sub.ptr.lhs.cast = ptrtoint %struct.record* %1 to i64, !dbg !2289
  %sub.ptr.rhs.cast = ptrtoint %struct.record* %2 to i64, !dbg !2289
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !2289
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 60, !dbg !2289
  invoke void @_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base"* %this1, %struct.record* %0, i64 %sub.ptr.div)
          to label %invoke.cont unwind label %lpad, !dbg !2290

invoke.cont:                                      ; preds = %entry
  %_M_impl5 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0, !dbg !2291
  call void @_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl5) #16, !dbg !2291
  ret void, !dbg !2291

lpad:                                             ; preds = %entry
  %3 = landingpad { i8*, i32 }
          cleanup, !dbg !2293
  %4 = extractvalue { i8*, i32 } %3, 0, !dbg !2293
  store i8* %4, i8** %exn.slot, align 8, !dbg !2293
  %5 = extractvalue { i8*, i32 } %3, 1, !dbg !2293
  store i32 %5, i32* %ehselector.slot, align 4, !dbg !2293
  %_M_impl6 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0, !dbg !2293
  call void @_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl6) #16, !dbg !2293
  br label %eh.resume, !dbg !2293

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !2295
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !2295
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !2295
  %lpad.val7 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !2295
  resume { i8*, i32 } %lpad.val7, !dbg !2295
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZSt8_DestroyIP6recordEvT_S2_(%struct.record* %__first, %struct.record* %__last) #10 comdat !dbg !2297 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !2301, metadata !1315), !dbg !2302
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !2303, metadata !1315), !dbg !2304
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !2305
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !2306
  call void @_ZNSt12_Destroy_auxILb1EE9__destroyIP6recordEEvT_S4_(%struct.record* %0, %struct.record* %1), !dbg !2307
  ret void, !dbg !2308
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZNSt12_Destroy_auxILb1EE9__destroyIP6recordEEvT_S4_(%struct.record*, %struct.record*) #3 comdat align 2 !dbg !2309 {
entry:
  %.addr = alloca %struct.record*, align 8
  %.addr1 = alloca %struct.record*, align 8
  store %struct.record* %0, %struct.record** %.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %.addr, metadata !2314, metadata !1315), !dbg !2315
  store %struct.record* %1, %struct.record** %.addr1, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %.addr1, metadata !2316, metadata !1315), !dbg !2317
  ret void, !dbg !2318
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base"* %this, %struct.record* %__p, i64 %__n) #0 comdat align 2 !dbg !2319 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  %__n.addr = alloca i64, align 8
  store %"struct.std::_Vector_base"* %this, %"struct.std::_Vector_base"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base"** %this.addr, metadata !2320, metadata !1315), !dbg !2321
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__p.addr, metadata !2322, metadata !1315), !dbg !2323
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !2324, metadata !1315), !dbg !2325
  %this1 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %this.addr, align 8
  %0 = load %struct.record*, %struct.record** %__p.addr, align 8, !dbg !2326
  %tobool = icmp ne %struct.record* %0, null, !dbg !2326
  br i1 %tobool, label %if.then, label %if.end, !dbg !2328

if.then:                                          ; preds = %entry
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0, !dbg !2329
  %1 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl to %"class.std::allocator"*, !dbg !2329
  %2 = load %struct.record*, %struct.record** %__p.addr, align 8, !dbg !2330
  %3 = load i64, i64* %__n.addr, align 8, !dbg !2331
  call void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10deallocateERS2_PS1_m(%"class.std::allocator"* dereferenceable(1) %1, %struct.record* %2, i64 %3), !dbg !2332
  br label %if.end, !dbg !2332

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !2333
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this) unnamed_addr #11 comdat align 2 !dbg !2334 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this, %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"** %this.addr, metadata !2336, metadata !1315), !dbg !2337
  %this1 = load %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"*, %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %this1 to %"class.std::allocator"*, !dbg !2338
  call void @_ZNSaI6recordED2Ev(%"class.std::allocator"* %0) #16, !dbg !2338
  ret void, !dbg !2340
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10deallocateERS2_PS1_m(%"class.std::allocator"* dereferenceable(1) %__a, %struct.record* %__p, i64 %__n) #0 comdat align 2 !dbg !2341 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %__a.addr, metadata !2342, metadata !1315), !dbg !2343
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__p.addr, metadata !2344, metadata !1315), !dbg !2345
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !2346, metadata !1315), !dbg !2347
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8, !dbg !2348
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*, !dbg !2348
  %2 = load %struct.record*, %struct.record** %__p.addr, align 8, !dbg !2349
  %3 = load i64, i64* %__n.addr, align 8, !dbg !2350
  call void @_ZN9__gnu_cxx13new_allocatorI6recordE10deallocateEPS1_m(%"class.__gnu_cxx::new_allocator"* %1, %struct.record* %2, i64 %3), !dbg !2351
  ret void, !dbg !2352
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI6recordE10deallocateEPS1_m(%"class.__gnu_cxx::new_allocator"* %this, %struct.record* %__p, i64) #3 comdat align 2 !dbg !2353 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  %.addr = alloca i64, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator"** %this.addr, metadata !2354, metadata !1315), !dbg !2355
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__p.addr, metadata !2356, metadata !1315), !dbg !2357
  store i64 %0, i64* %.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %.addr, metadata !2358, metadata !1315), !dbg !2359
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %1 = load %struct.record*, %struct.record** %__p.addr, align 8, !dbg !2360
  %2 = bitcast %struct.record* %1 to i8*, !dbg !2360
  call void @_ZdlPv(i8* %2) #16, !dbg !2361
  ret void, !dbg !2362
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #12

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZNSaI6recordED2Ev(%"class.std::allocator"* %this) unnamed_addr #3 comdat align 2 !dbg !2363 {
entry:
  %this.addr = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %this, %"class.std::allocator"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %this.addr, metadata !2364, metadata !1315), !dbg !2365
  %this1 = load %"class.std::allocator"*, %"class.std::allocator"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator"* %this1 to %"class.__gnu_cxx::new_allocator"*, !dbg !2366
  call void @_ZN9__gnu_cxx13new_allocatorI6recordED2Ev(%"class.__gnu_cxx::new_allocator"* %0) #16, !dbg !2366
  ret void, !dbg !2368
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI6recordED2Ev(%"class.__gnu_cxx::new_allocator"* %this) unnamed_addr #3 comdat align 2 !dbg !2369 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator"** %this.addr, metadata !2370, metadata !1315), !dbg !2371
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  ret void, !dbg !2372
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI7latLongSaIS0_EEC2Ev(%"struct.std::_Vector_base.1"* %this) unnamed_addr #0 comdat align 2 !dbg !2373 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base.1"*, align 8
  store %"struct.std::_Vector_base.1"* %this, %"struct.std::_Vector_base.1"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base.1"** %this.addr, metadata !2374, metadata !1315), !dbg !2376
  %this1 = load %"struct.std::_Vector_base.1"*, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0, !dbg !2377
  call void @_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implC2Ev(%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl), !dbg !2377
  ret void, !dbg !2378
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implC2Ev(%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this) unnamed_addr #3 comdat align 2 !dbg !2379 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this, %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"** %this.addr, metadata !2380, metadata !1315), !dbg !2382
  %this1 = load %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"*, %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this1 to %"class.std::allocator.2"*, !dbg !2383
  call void @_ZNSaI7latLongEC2Ev(%"class.std::allocator.2"* %0) #16, !dbg !2384
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this1, i32 0, i32 0, !dbg !2385
  store %struct.latLong* null, %struct.latLong** %_M_start, align 8, !dbg !2385
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this1, i32 0, i32 1, !dbg !2386
  store %struct.latLong* null, %struct.latLong** %_M_finish, align 8, !dbg !2386
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this1, i32 0, i32 2, !dbg !2387
  store %struct.latLong* null, %struct.latLong** %_M_end_of_storage, align 8, !dbg !2387
  ret void, !dbg !2388
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZNSaI7latLongEC2Ev(%"class.std::allocator.2"* %this) unnamed_addr #3 comdat align 2 !dbg !2389 {
entry:
  %this.addr = alloca %"class.std::allocator.2"*, align 8
  store %"class.std::allocator.2"* %this, %"class.std::allocator.2"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator.2"** %this.addr, metadata !2390, metadata !1315), !dbg !2392
  %this1 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator.2"* %this1 to %"class.__gnu_cxx::new_allocator.3"*, !dbg !2393
  call void @_ZN9__gnu_cxx13new_allocatorI7latLongEC2Ev(%"class.__gnu_cxx::new_allocator.3"* %0) #16, !dbg !2394
  ret void, !dbg !2395
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI7latLongEC2Ev(%"class.__gnu_cxx::new_allocator.3"* %this) unnamed_addr #3 comdat align 2 !dbg !2396 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator.3"** %this.addr, metadata !2397, metadata !1315), !dbg !2399
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  ret void, !dbg !2400
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZSt8_DestroyIP7latLongS0_EvT_S2_RSaIT0_E(%struct.latLong* %__first, %struct.latLong* %__last, %"class.std::allocator.2"* dereferenceable(1)) #10 comdat !dbg !2401 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %.addr = alloca %"class.std::allocator.2"*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !2406, metadata !1315), !dbg !2407
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !2408, metadata !1315), !dbg !2409
  store %"class.std::allocator.2"* %0, %"class.std::allocator.2"** %.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator.2"** %.addr, metadata !2410, metadata !1315), !dbg !2411
  %1 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !2412
  %2 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !2413
  call void @_ZSt8_DestroyIP7latLongEvT_S2_(%struct.latLong* %1, %struct.latLong* %2), !dbg !2414
  ret void, !dbg !2415
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(1) %"class.std::allocator.2"* @_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %this) #3 comdat align 2 !dbg !2416 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base.1"*, align 8
  store %"struct.std::_Vector_base.1"* %this, %"struct.std::_Vector_base.1"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base.1"** %this.addr, metadata !2417, metadata !1315), !dbg !2418
  %this1 = load %"struct.std::_Vector_base.1"*, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0, !dbg !2419
  %0 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl to %"class.std::allocator.2"*, !dbg !2420
  ret %"class.std::allocator.2"* %0, !dbg !2421
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI7latLongSaIS0_EED2Ev(%"struct.std::_Vector_base.1"* %this) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2422 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base.1"*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  store %"struct.std::_Vector_base.1"* %this, %"struct.std::_Vector_base.1"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base.1"** %this.addr, metadata !2423, metadata !1315), !dbg !2424
  %this1 = load %"struct.std::_Vector_base.1"*, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0, !dbg !2425
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 0, !dbg !2427
  %0 = load %struct.latLong*, %struct.latLong** %_M_start, align 8, !dbg !2427
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0, !dbg !2428
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl2, i32 0, i32 2, !dbg !2429
  %1 = load %struct.latLong*, %struct.latLong** %_M_end_of_storage, align 8, !dbg !2429
  %_M_impl3 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0, !dbg !2430
  %_M_start4 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl3, i32 0, i32 0, !dbg !2431
  %2 = load %struct.latLong*, %struct.latLong** %_M_start4, align 8, !dbg !2431
  %sub.ptr.lhs.cast = ptrtoint %struct.latLong* %1 to i64, !dbg !2432
  %sub.ptr.rhs.cast = ptrtoint %struct.latLong* %2 to i64, !dbg !2432
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !2432
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8, !dbg !2432
  invoke void @_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base.1"* %this1, %struct.latLong* %0, i64 %sub.ptr.div)
          to label %invoke.cont unwind label %lpad, !dbg !2433

invoke.cont:                                      ; preds = %entry
  %_M_impl5 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0, !dbg !2434
  call void @_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl5) #16, !dbg !2434
  ret void, !dbg !2434

lpad:                                             ; preds = %entry
  %3 = landingpad { i8*, i32 }
          cleanup, !dbg !2436
  %4 = extractvalue { i8*, i32 } %3, 0, !dbg !2436
  store i8* %4, i8** %exn.slot, align 8, !dbg !2436
  %5 = extractvalue { i8*, i32 } %3, 1, !dbg !2436
  store i32 %5, i32* %ehselector.slot, align 4, !dbg !2436
  %_M_impl6 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0, !dbg !2436
  call void @_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl6) #16, !dbg !2436
  br label %eh.resume, !dbg !2436

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !2438
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !2438
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !2438
  %lpad.val7 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !2438
  resume { i8*, i32 } %lpad.val7, !dbg !2438
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZSt8_DestroyIP7latLongEvT_S2_(%struct.latLong* %__first, %struct.latLong* %__last) #10 comdat !dbg !2440 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !2444, metadata !1315), !dbg !2445
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !2446, metadata !1315), !dbg !2447
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !2448
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !2449
  call void @_ZNSt12_Destroy_auxILb1EE9__destroyIP7latLongEEvT_S4_(%struct.latLong* %0, %struct.latLong* %1), !dbg !2450
  ret void, !dbg !2451
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZNSt12_Destroy_auxILb1EE9__destroyIP7latLongEEvT_S4_(%struct.latLong*, %struct.latLong*) #3 comdat align 2 !dbg !2452 {
entry:
  %.addr = alloca %struct.latLong*, align 8
  %.addr1 = alloca %struct.latLong*, align 8
  store %struct.latLong* %0, %struct.latLong** %.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %.addr, metadata !2454, metadata !1315), !dbg !2455
  store %struct.latLong* %1, %struct.latLong** %.addr1, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %.addr1, metadata !2456, metadata !1315), !dbg !2457
  ret void, !dbg !2458
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base.1"* %this, %struct.latLong* %__p, i64 %__n) #0 comdat align 2 !dbg !2459 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base.1"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  %__n.addr = alloca i64, align 8
  store %"struct.std::_Vector_base.1"* %this, %"struct.std::_Vector_base.1"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base.1"** %this.addr, metadata !2460, metadata !1315), !dbg !2461
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__p.addr, metadata !2462, metadata !1315), !dbg !2463
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !2464, metadata !1315), !dbg !2465
  %this1 = load %"struct.std::_Vector_base.1"*, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8, !dbg !2466
  %tobool = icmp ne %struct.latLong* %0, null, !dbg !2466
  br i1 %tobool, label %if.then, label %if.end, !dbg !2468

if.then:                                          ; preds = %entry
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0, !dbg !2469
  %1 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl to %"class.std::allocator.2"*, !dbg !2469
  %2 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8, !dbg !2470
  %3 = load i64, i64* %__n.addr, align 8, !dbg !2471
  call void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10deallocateERS2_PS1_m(%"class.std::allocator.2"* dereferenceable(1) %1, %struct.latLong* %2, i64 %3), !dbg !2472
  br label %if.end, !dbg !2472

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !2473
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implD2Ev(%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this) unnamed_addr #11 comdat align 2 !dbg !2474 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"*, align 8
  store %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this, %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"** %this.addr, metadata !2476, metadata !1315), !dbg !2477
  %this1 = load %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"*, %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"** %this.addr, align 8
  %0 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %this1 to %"class.std::allocator.2"*, !dbg !2478
  call void @_ZNSaI7latLongED2Ev(%"class.std::allocator.2"* %0) #16, !dbg !2478
  ret void, !dbg !2480
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10deallocateERS2_PS1_m(%"class.std::allocator.2"* dereferenceable(1) %__a, %struct.latLong* %__p, i64 %__n) #0 comdat align 2 !dbg !2481 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator.2"** %__a.addr, metadata !2482, metadata !1315), !dbg !2483
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__p.addr, metadata !2484, metadata !1315), !dbg !2485
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !2486, metadata !1315), !dbg !2487
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8, !dbg !2488
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*, !dbg !2488
  %2 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8, !dbg !2489
  %3 = load i64, i64* %__n.addr, align 8, !dbg !2490
  call void @_ZN9__gnu_cxx13new_allocatorI7latLongE10deallocateEPS1_m(%"class.__gnu_cxx::new_allocator.3"* %1, %struct.latLong* %2, i64 %3), !dbg !2491
  ret void, !dbg !2492
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI7latLongE10deallocateEPS1_m(%"class.__gnu_cxx::new_allocator.3"* %this, %struct.latLong* %__p, i64) #3 comdat align 2 !dbg !2493 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  %.addr = alloca i64, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator.3"** %this.addr, metadata !2494, metadata !1315), !dbg !2495
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__p.addr, metadata !2496, metadata !1315), !dbg !2497
  store i64 %0, i64* %.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %.addr, metadata !2498, metadata !1315), !dbg !2499
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %1 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8, !dbg !2500
  %2 = bitcast %struct.latLong* %1 to i8*, !dbg !2500
  call void @_ZdlPv(i8* %2) #16, !dbg !2501
  ret void, !dbg !2502
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZNSaI7latLongED2Ev(%"class.std::allocator.2"* %this) unnamed_addr #3 comdat align 2 !dbg !2503 {
entry:
  %this.addr = alloca %"class.std::allocator.2"*, align 8
  store %"class.std::allocator.2"* %this, %"class.std::allocator.2"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator.2"** %this.addr, metadata !2504, metadata !1315), !dbg !2505
  %this1 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %this.addr, align 8
  %0 = bitcast %"class.std::allocator.2"* %this1 to %"class.__gnu_cxx::new_allocator.3"*, !dbg !2506
  call void @_ZN9__gnu_cxx13new_allocatorI7latLongED2Ev(%"class.__gnu_cxx::new_allocator.3"* %0) #16, !dbg !2506
  ret void, !dbg !2508
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI7latLongED2Ev(%"class.__gnu_cxx::new_allocator.3"* %this) unnamed_addr #3 comdat align 2 !dbg !2509 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator.3"** %this.addr, metadata !2510, metadata !1315), !dbg !2511
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  ret void, !dbg !2512
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator.2"* dereferenceable(1) %__a, %struct.latLong* %__p, %struct.latLong* dereferenceable(8) %__arg) #0 comdat align 2 !dbg !2513 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  %__arg.addr = alloca %struct.latLong*, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator.2"** %__a.addr, metadata !2517, metadata !1315), !dbg !2518
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__p.addr, metadata !2519, metadata !1315), !dbg !2520
  store %struct.latLong* %__arg, %struct.latLong** %__arg.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__arg.addr, metadata !2521, metadata !1315), !dbg !2522
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8, !dbg !2523
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*, !dbg !2523
  %2 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8, !dbg !2524
  %3 = load %struct.latLong*, %struct.latLong** %__arg.addr, align 8, !dbg !2525
  call void @_ZN9__gnu_cxx13new_allocatorI7latLongE9constructEPS1_RKS1_(%"class.__gnu_cxx::new_allocator.3"* %1, %struct.latLong* %2, %struct.latLong* dereferenceable(8) %3), !dbg !2526
  ret void, !dbg !2527
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector.0"* %this, %struct.latLong* %__position.coerce, %struct.latLong* dereferenceable(8) %__x) #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2528 {
entry:
  %__position = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %this.addr = alloca %"class.std::vector.0"*, align 8
  %__x.addr = alloca %struct.latLong*, align 8
  %__x_copy = alloca %struct.latLong, align 4
  %__len = alloca i64, align 8
  %__elems_before = alloca i64, align 8
  %ref.tmp = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %__new_start = alloca %struct.latLong*, align 8
  %__new_finish = alloca %struct.latLong*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %__position, i32 0, i32 0
  store %struct.latLong* %__position.coerce, %struct.latLong** %coerce.dive, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector.0"** %this.addr, metadata !2530, metadata !1315), !dbg !2531
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::__normal_iterator"* %__position, metadata !2532, metadata !1315), !dbg !2533
  store %struct.latLong* %__x, %struct.latLong** %__x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__x.addr, metadata !2534, metadata !1315), !dbg !2535
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2536
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0, !dbg !2536
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 1, !dbg !2538
  %1 = load %struct.latLong*, %struct.latLong** %_M_finish, align 8, !dbg !2538
  %2 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2539
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %2, i32 0, i32 0, !dbg !2539
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl2, i32 0, i32 2, !dbg !2540
  %3 = load %struct.latLong*, %struct.latLong** %_M_end_of_storage, align 8, !dbg !2540
  %cmp = icmp ne %struct.latLong* %1, %3, !dbg !2541
  br i1 %cmp, label %if.then, label %if.else, !dbg !2542

if.then:                                          ; preds = %entry
  %4 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2543
  %_M_impl3 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %4, i32 0, i32 0, !dbg !2543
  %5 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl3 to %"class.std::allocator.2"*, !dbg !2545
  %6 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2546
  %_M_impl4 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %6, i32 0, i32 0, !dbg !2546
  %_M_finish5 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl4, i32 0, i32 1, !dbg !2547
  %7 = load %struct.latLong*, %struct.latLong** %_M_finish5, align 8, !dbg !2547
  %8 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2548
  %_M_impl6 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %8, i32 0, i32 0, !dbg !2548
  %_M_finish7 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl6, i32 0, i32 1, !dbg !2548
  %9 = load %struct.latLong*, %struct.latLong** %_M_finish7, align 8, !dbg !2548
  %add.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %9, i64 -1, !dbg !2548
  call void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator.2"* dereferenceable(1) %5, %struct.latLong* %7, %struct.latLong* dereferenceable(8) %add.ptr), !dbg !2549
  %10 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2550
  %_M_impl8 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %10, i32 0, i32 0, !dbg !2550
  %_M_finish9 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl8, i32 0, i32 1, !dbg !2551
  %11 = load %struct.latLong*, %struct.latLong** %_M_finish9, align 8, !dbg !2552
  %incdec.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %11, i32 1, !dbg !2552
  store %struct.latLong* %incdec.ptr, %struct.latLong** %_M_finish9, align 8, !dbg !2552
  call void @llvm.dbg.declare(metadata %struct.latLong* %__x_copy, metadata !2553, metadata !1315), !dbg !2554
  %12 = load %struct.latLong*, %struct.latLong** %__x.addr, align 8, !dbg !2555
  %13 = bitcast %struct.latLong* %__x_copy to i8*, !dbg !2555
  %14 = bitcast %struct.latLong* %12 to i8*, !dbg !2555
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 8, i32 4, i1 false), !dbg !2555
  %call = call dereferenceable(8) %struct.latLong** @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %__position), !dbg !2556
  %15 = load %struct.latLong*, %struct.latLong** %call, align 8, !dbg !2556
  %16 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2556
  %_M_impl10 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %16, i32 0, i32 0, !dbg !2556
  %_M_finish11 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl10, i32 0, i32 1, !dbg !2556
  %17 = load %struct.latLong*, %struct.latLong** %_M_finish11, align 8, !dbg !2556
  %add.ptr12 = getelementptr inbounds %struct.latLong, %struct.latLong* %17, i64 -2, !dbg !2556
  %18 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2556
  %_M_impl13 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %18, i32 0, i32 0, !dbg !2556
  %_M_finish14 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl13, i32 0, i32 1, !dbg !2556
  %19 = load %struct.latLong*, %struct.latLong** %_M_finish14, align 8, !dbg !2556
  %add.ptr15 = getelementptr inbounds %struct.latLong, %struct.latLong* %19, i64 -1, !dbg !2556
  %call16 = call %struct.latLong* @_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_(%struct.latLong* %15, %struct.latLong* %add.ptr12, %struct.latLong* %add.ptr15), !dbg !2557
  %call17 = call dereferenceable(8) %struct.latLong* @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEdeEv(%"class.__gnu_cxx::__normal_iterator"* %__position), !dbg !2559
  %20 = bitcast %struct.latLong* %call17 to i8*, !dbg !2560
  %21 = bitcast %struct.latLong* %__x_copy to i8*, !dbg !2560
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %21, i64 8, i32 4, i1 false), !dbg !2560
  br label %if.end70, !dbg !2561

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %__len, metadata !2562, metadata !1315), !dbg !2565
  %call18 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE12_M_check_lenEmPKc(%"class.std::vector.0"* %this1, i64 1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.23, i32 0, i32 0)), !dbg !2566
  store i64 %call18, i64* %__len, align 8, !dbg !2565
  call void @llvm.dbg.declare(metadata i64* %__elems_before, metadata !2567, metadata !1315), !dbg !2568
  %call19 = call %struct.latLong* @_ZNSt6vectorI7latLongSaIS0_EE5beginEv(%"class.std::vector.0"* %this1), !dbg !2569
  %coerce.dive20 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %ref.tmp, i32 0, i32 0, !dbg !2569
  store %struct.latLong* %call19, %struct.latLong** %coerce.dive20, align 8, !dbg !2569
  %call21 = call i64 @_ZN9__gnu_cxxmiIP7latLongSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_(%"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %__position, %"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %ref.tmp), !dbg !2570
  store i64 %call21, i64* %__elems_before, align 8, !dbg !2568
  call void @llvm.dbg.declare(metadata %struct.latLong** %__new_start, metadata !2572, metadata !1315), !dbg !2573
  %22 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2574
  %23 = load i64, i64* %__len, align 8, !dbg !2575
  %call22 = call %struct.latLong* @_ZNSt12_Vector_baseI7latLongSaIS0_EE11_M_allocateEm(%"struct.std::_Vector_base.1"* %22, i64 %23), !dbg !2574
  store %struct.latLong* %call22, %struct.latLong** %__new_start, align 8, !dbg !2573
  call void @llvm.dbg.declare(metadata %struct.latLong** %__new_finish, metadata !2576, metadata !1315), !dbg !2577
  %24 = load %struct.latLong*, %struct.latLong** %__new_start, align 8, !dbg !2578
  store %struct.latLong* %24, %struct.latLong** %__new_finish, align 8, !dbg !2577
  %25 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2579
  %_M_impl23 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %25, i32 0, i32 0, !dbg !2579
  %26 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl23 to %"class.std::allocator.2"*, !dbg !2581
  %27 = load %struct.latLong*, %struct.latLong** %__new_start, align 8, !dbg !2582
  %28 = load i64, i64* %__elems_before, align 8, !dbg !2583
  %add.ptr24 = getelementptr inbounds %struct.latLong, %struct.latLong* %27, i64 %28, !dbg !2584
  %29 = load %struct.latLong*, %struct.latLong** %__x.addr, align 8, !dbg !2585
  invoke void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator.2"* dereferenceable(1) %26, %struct.latLong* %add.ptr24, %struct.latLong* dereferenceable(8) %29)
          to label %invoke.cont unwind label %lpad, !dbg !2586

invoke.cont:                                      ; preds = %if.else
  store %struct.latLong* null, %struct.latLong** %__new_finish, align 8, !dbg !2587
  %30 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2588
  %_M_impl25 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %30, i32 0, i32 0, !dbg !2588
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl25, i32 0, i32 0, !dbg !2589
  %31 = load %struct.latLong*, %struct.latLong** %_M_start, align 8, !dbg !2589
  %call27 = invoke dereferenceable(8) %struct.latLong** @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %__position)
          to label %invoke.cont26 unwind label %lpad, !dbg !2590

invoke.cont26:                                    ; preds = %invoke.cont
  %32 = load %struct.latLong*, %struct.latLong** %call27, align 8, !dbg !2591
  %33 = load %struct.latLong*, %struct.latLong** %__new_start, align 8, !dbg !2593
  %34 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2594
  %call29 = invoke dereferenceable(1) %"class.std::allocator.2"* @_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %34)
          to label %invoke.cont28 unwind label %lpad, !dbg !2594

invoke.cont28:                                    ; preds = %invoke.cont26
  %call31 = invoke %struct.latLong* @_ZSt34__uninitialized_move_if_noexcept_aIP7latLongS1_SaIS0_EET0_T_S4_S3_RT1_(%struct.latLong* %31, %struct.latLong* %32, %struct.latLong* %33, %"class.std::allocator.2"* dereferenceable(1) %call29)
          to label %invoke.cont30 unwind label %lpad, !dbg !2595

invoke.cont30:                                    ; preds = %invoke.cont28
  store %struct.latLong* %call31, %struct.latLong** %__new_finish, align 8, !dbg !2596
  %35 = load %struct.latLong*, %struct.latLong** %__new_finish, align 8, !dbg !2597
  %incdec.ptr32 = getelementptr inbounds %struct.latLong, %struct.latLong* %35, i32 1, !dbg !2597
  store %struct.latLong* %incdec.ptr32, %struct.latLong** %__new_finish, align 8, !dbg !2597
  %call34 = invoke dereferenceable(8) %struct.latLong** @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %__position)
          to label %invoke.cont33 unwind label %lpad, !dbg !2598

invoke.cont33:                                    ; preds = %invoke.cont30
  %36 = load %struct.latLong*, %struct.latLong** %call34, align 8, !dbg !2599
  %37 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2600
  %_M_impl35 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %37, i32 0, i32 0, !dbg !2600
  %_M_finish36 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl35, i32 0, i32 1, !dbg !2601
  %38 = load %struct.latLong*, %struct.latLong** %_M_finish36, align 8, !dbg !2601
  %39 = load %struct.latLong*, %struct.latLong** %__new_finish, align 8, !dbg !2602
  %40 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2603
  %call38 = invoke dereferenceable(1) %"class.std::allocator.2"* @_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %40)
          to label %invoke.cont37 unwind label %lpad, !dbg !2603

invoke.cont37:                                    ; preds = %invoke.cont33
  %call40 = invoke %struct.latLong* @_ZSt34__uninitialized_move_if_noexcept_aIP7latLongS1_SaIS0_EET0_T_S4_S3_RT1_(%struct.latLong* %36, %struct.latLong* %38, %struct.latLong* %39, %"class.std::allocator.2"* dereferenceable(1) %call38)
          to label %invoke.cont39 unwind label %lpad, !dbg !2604

invoke.cont39:                                    ; preds = %invoke.cont37
  store %struct.latLong* %call40, %struct.latLong** %__new_finish, align 8, !dbg !2605
  br label %try.cont, !dbg !2606

lpad:                                             ; preds = %invoke.cont37, %invoke.cont33, %invoke.cont30, %invoke.cont28, %invoke.cont26, %invoke.cont, %if.else
  %41 = landingpad { i8*, i32 }
          catch i8* null, !dbg !2607
  %42 = extractvalue { i8*, i32 } %41, 0, !dbg !2607
  store i8* %42, i8** %exn.slot, align 8, !dbg !2607
  %43 = extractvalue { i8*, i32 } %41, 1, !dbg !2607
  store i32 %43, i32* %ehselector.slot, align 4, !dbg !2607
  br label %catch, !dbg !2607

catch:                                            ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !2608
  %44 = call i8* @__cxa_begin_catch(i8* %exn) #16, !dbg !2608
  %45 = load %struct.latLong*, %struct.latLong** %__new_finish, align 8, !dbg !2609
  %tobool = icmp ne %struct.latLong* %45, null, !dbg !2609
  br i1 %tobool, label %if.else46, label %if.then41, !dbg !2612

if.then41:                                        ; preds = %catch
  %46 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2613
  %_M_impl42 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %46, i32 0, i32 0, !dbg !2613
  %47 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl42 to %"class.std::allocator.2"*, !dbg !2614
  %48 = load %struct.latLong*, %struct.latLong** %__new_start, align 8, !dbg !2615
  %49 = load i64, i64* %__elems_before, align 8, !dbg !2616
  %add.ptr43 = getelementptr inbounds %struct.latLong, %struct.latLong* %48, i64 %49, !dbg !2617
  invoke void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE7destroyERS2_PS1_(%"class.std::allocator.2"* dereferenceable(1) %47, %struct.latLong* %add.ptr43)
          to label %invoke.cont45 unwind label %lpad44, !dbg !2618

invoke.cont45:                                    ; preds = %if.then41
  br label %if.end, !dbg !2619

lpad44:                                           ; preds = %invoke.cont50, %if.end, %invoke.cont47, %if.else46, %if.then41
  %50 = landingpad { i8*, i32 }
          cleanup, !dbg !2621
  %51 = extractvalue { i8*, i32 } %50, 0, !dbg !2621
  store i8* %51, i8** %exn.slot, align 8, !dbg !2621
  %52 = extractvalue { i8*, i32 } %50, 1, !dbg !2621
  store i32 %52, i32* %ehselector.slot, align 4, !dbg !2621
  invoke void @__cxa_end_catch()
          to label %invoke.cont51 unwind label %terminate.lpad, !dbg !2622

if.else46:                                        ; preds = %catch
  %53 = load %struct.latLong*, %struct.latLong** %__new_start, align 8, !dbg !2623
  %54 = load %struct.latLong*, %struct.latLong** %__new_finish, align 8, !dbg !2624
  %55 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2625
  %call48 = invoke dereferenceable(1) %"class.std::allocator.2"* @_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %55)
          to label %invoke.cont47 unwind label %lpad44, !dbg !2625

invoke.cont47:                                    ; preds = %if.else46
  invoke void @_ZSt8_DestroyIP7latLongS0_EvT_S2_RSaIT0_E(%struct.latLong* %53, %struct.latLong* %54, %"class.std::allocator.2"* dereferenceable(1) %call48)
          to label %invoke.cont49 unwind label %lpad44, !dbg !2626

invoke.cont49:                                    ; preds = %invoke.cont47
  br label %if.end

if.end:                                           ; preds = %invoke.cont49, %invoke.cont45
  %56 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2627
  %57 = load %struct.latLong*, %struct.latLong** %__new_start, align 8, !dbg !2628
  %58 = load i64, i64* %__len, align 8, !dbg !2629
  invoke void @_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base.1"* %56, %struct.latLong* %57, i64 %58)
          to label %invoke.cont50 unwind label %lpad44, !dbg !2627

invoke.cont50:                                    ; preds = %if.end
  invoke void @__cxa_rethrow() #18
          to label %unreachable unwind label %lpad44, !dbg !2630

invoke.cont51:                                    ; preds = %lpad44
  br label %eh.resume, !dbg !2631

try.cont:                                         ; preds = %invoke.cont39
  %59 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2633
  %_M_impl52 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %59, i32 0, i32 0, !dbg !2633
  %_M_start53 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl52, i32 0, i32 0, !dbg !2634
  %60 = load %struct.latLong*, %struct.latLong** %_M_start53, align 8, !dbg !2634
  %61 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2635
  %_M_impl54 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %61, i32 0, i32 0, !dbg !2635
  %_M_finish55 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl54, i32 0, i32 1, !dbg !2636
  %62 = load %struct.latLong*, %struct.latLong** %_M_finish55, align 8, !dbg !2636
  %63 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2637
  %call56 = call dereferenceable(1) %"class.std::allocator.2"* @_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %63), !dbg !2637
  call void @_ZSt8_DestroyIP7latLongS0_EvT_S2_RSaIT0_E(%struct.latLong* %60, %struct.latLong* %62, %"class.std::allocator.2"* dereferenceable(1) %call56), !dbg !2638
  %64 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2639
  %65 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2640
  %_M_impl57 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %65, i32 0, i32 0, !dbg !2640
  %_M_start58 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl57, i32 0, i32 0, !dbg !2641
  %66 = load %struct.latLong*, %struct.latLong** %_M_start58, align 8, !dbg !2641
  %67 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2642
  %_M_impl59 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %67, i32 0, i32 0, !dbg !2642
  %_M_end_of_storage60 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl59, i32 0, i32 2, !dbg !2643
  %68 = load %struct.latLong*, %struct.latLong** %_M_end_of_storage60, align 8, !dbg !2643
  %69 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2644
  %_M_impl61 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %69, i32 0, i32 0, !dbg !2644
  %_M_start62 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl61, i32 0, i32 0, !dbg !2645
  %70 = load %struct.latLong*, %struct.latLong** %_M_start62, align 8, !dbg !2645
  %sub.ptr.lhs.cast = ptrtoint %struct.latLong* %68 to i64, !dbg !2646
  %sub.ptr.rhs.cast = ptrtoint %struct.latLong* %70 to i64, !dbg !2646
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !2646
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8, !dbg !2646
  call void @_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base.1"* %64, %struct.latLong* %66, i64 %sub.ptr.div), !dbg !2639
  %71 = load %struct.latLong*, %struct.latLong** %__new_start, align 8, !dbg !2647
  %72 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2648
  %_M_impl63 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %72, i32 0, i32 0, !dbg !2648
  %_M_start64 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl63, i32 0, i32 0, !dbg !2649
  store %struct.latLong* %71, %struct.latLong** %_M_start64, align 8, !dbg !2650
  %73 = load %struct.latLong*, %struct.latLong** %__new_finish, align 8, !dbg !2651
  %74 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2652
  %_M_impl65 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %74, i32 0, i32 0, !dbg !2652
  %_M_finish66 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl65, i32 0, i32 1, !dbg !2653
  store %struct.latLong* %73, %struct.latLong** %_M_finish66, align 8, !dbg !2654
  %75 = load %struct.latLong*, %struct.latLong** %__new_start, align 8, !dbg !2655
  %76 = load i64, i64* %__len, align 8, !dbg !2656
  %add.ptr67 = getelementptr inbounds %struct.latLong, %struct.latLong* %75, i64 %76, !dbg !2657
  %77 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2658
  %_M_impl68 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %77, i32 0, i32 0, !dbg !2658
  %_M_end_of_storage69 = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl68, i32 0, i32 2, !dbg !2659
  store %struct.latLong* %add.ptr67, %struct.latLong** %_M_end_of_storage69, align 8, !dbg !2660
  br label %if.end70

if.end70:                                         ; preds = %try.cont, %if.then
  ret void, !dbg !2661

eh.resume:                                        ; preds = %invoke.cont51
  %exn71 = load i8*, i8** %exn.slot, align 8, !dbg !2663
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !2663
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn71, 0, !dbg !2663
  %lpad.val72 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !2663
  resume { i8*, i32 } %lpad.val72, !dbg !2663

terminate.lpad:                                   ; preds = %lpad44
  %78 = landingpad { i8*, i32 }
          catch i8* null, !dbg !2665
  %79 = extractvalue { i8*, i32 } %78, 0, !dbg !2665
  call void @__clang_call_terminate(i8* %79) #15, !dbg !2665
  unreachable, !dbg !2665

unreachable:                                      ; preds = %invoke.cont50
  unreachable
}

; Function Attrs: uwtable
define linkonce_odr %struct.latLong* @_ZNSt6vectorI7latLongSaIS0_EE3endEv(%"class.std::vector.0"* %this) #0 comdat align 2 !dbg !2667 {
entry:
  %retval = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %this.addr = alloca %"class.std::vector.0"*, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector.0"** %this.addr, metadata !2668, metadata !1315), !dbg !2669
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2670
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0, !dbg !2670
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 1, !dbg !2671
  call void @_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator"* %retval, %struct.latLong** dereferenceable(8) %_M_finish), !dbg !2672
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %retval, i32 0, i32 0, !dbg !2673
  %1 = load %struct.latLong*, %struct.latLong** %coerce.dive, align 8, !dbg !2673
  ret %struct.latLong* %1, !dbg !2673
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI7latLongE9constructEPS1_RKS1_(%"class.__gnu_cxx::new_allocator.3"* %this, %struct.latLong* %__p, %struct.latLong* dereferenceable(8) %__val) #3 comdat align 2 !dbg !2674 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  %__val.addr = alloca %struct.latLong*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator.3"** %this.addr, metadata !2675, metadata !1315), !dbg !2676
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__p.addr, metadata !2677, metadata !1315), !dbg !2678
  store %struct.latLong* %__val, %struct.latLong** %__val.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__val.addr, metadata !2679, metadata !1315), !dbg !2680
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8, !dbg !2681
  %1 = bitcast %struct.latLong* %0 to i8*, !dbg !2681
  %2 = bitcast i8* %1 to %struct.latLong*, !dbg !2682
  %3 = load %struct.latLong*, %struct.latLong** %__val.addr, align 8, !dbg !2683
  %4 = bitcast %struct.latLong* %2 to i8*, !dbg !2684
  %5 = bitcast %struct.latLong* %3 to i8*, !dbg !2684
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 8, i32 4, i1 false), !dbg !2684
  ret void, !dbg !2685
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.latLong* @_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #10 comdat !dbg !2686 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !2693, metadata !1315), !dbg !2694
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !2695, metadata !1315), !dbg !2696
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__result.addr, metadata !2697, metadata !1315), !dbg !2698
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !2699
  %call = call %struct.latLong* @_ZSt12__miter_baseIP7latLongENSt11_Miter_baseIT_E13iterator_typeES3_(%struct.latLong* %0), !dbg !2700
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !2701
  %call1 = call %struct.latLong* @_ZSt12__miter_baseIP7latLongENSt11_Miter_baseIT_E13iterator_typeES3_(%struct.latLong* %1), !dbg !2702
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !2704
  %call2 = call %struct.latLong* @_ZSt23__copy_move_backward_a2ILb0EP7latLongS1_ET1_T0_S3_S2_(%struct.latLong* %call, %struct.latLong* %call1, %struct.latLong* %2), !dbg !2705
  ret %struct.latLong* %call2, !dbg !2706
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(8) %struct.latLong** @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %this) #3 comdat align 2 !dbg !2707 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %this, %"class.__gnu_cxx::__normal_iterator"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::__normal_iterator"** %this.addr, metadata !2708, metadata !1315), !dbg !2710
  %this1 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %this.addr, align 8
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %this1, i32 0, i32 0, !dbg !2711
  ret %struct.latLong** %_M_current, !dbg !2712
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(8) %struct.latLong* @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEdeEv(%"class.__gnu_cxx::__normal_iterator"* %this) #3 comdat align 2 !dbg !2713 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %this, %"class.__gnu_cxx::__normal_iterator"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::__normal_iterator"** %this.addr, metadata !2714, metadata !1315), !dbg !2715
  %this1 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %this.addr, align 8
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %this1, i32 0, i32 0, !dbg !2716
  %0 = load %struct.latLong*, %struct.latLong** %_M_current, align 8, !dbg !2716
  ret %struct.latLong* %0, !dbg !2717
}

; Function Attrs: uwtable
define linkonce_odr i64 @_ZNKSt6vectorI7latLongSaIS0_EE12_M_check_lenEmPKc(%"class.std::vector.0"* %this, i64 %__n, i8* %__s) #0 comdat align 2 !dbg !2718 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  %__n.addr = alloca i64, align 8
  %__s.addr = alloca i8*, align 8
  %__len = alloca i64, align 8
  %ref.tmp = alloca i64, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector.0"** %this.addr, metadata !2719, metadata !1315), !dbg !2721
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !2722, metadata !1315), !dbg !2723
  store i8* %__s, i8** %__s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %__s.addr, metadata !2724, metadata !1315), !dbg !2725
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %call = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv(%"class.std::vector.0"* %this1), !dbg !2726
  %call2 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv(%"class.std::vector.0"* %this1), !dbg !2728
  %sub = sub i64 %call, %call2, !dbg !2730
  %0 = load i64, i64* %__n.addr, align 8, !dbg !2731
  %cmp = icmp ult i64 %sub, %0, !dbg !2732
  br i1 %cmp, label %if.then, label %if.end, !dbg !2733

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %__s.addr, align 8, !dbg !2734
  call void @_ZSt20__throw_length_errorPKc(i8* %1) #18, !dbg !2735
  unreachable, !dbg !2735

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %__len, metadata !2736, metadata !1315), !dbg !2737
  %call3 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv(%"class.std::vector.0"* %this1), !dbg !2738
  %call4 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv(%"class.std::vector.0"* %this1), !dbg !2739
  store i64 %call4, i64* %ref.tmp, align 8, !dbg !2741
  %call5 = call dereferenceable(8) i64* @_ZSt3maxImERKT_S2_S2_(i64* dereferenceable(8) %ref.tmp, i64* dereferenceable(8) %__n.addr), !dbg !2742
  %2 = load i64, i64* %call5, align 8, !dbg !2744
  %add = add i64 %call3, %2, !dbg !2745
  store i64 %add, i64* %__len, align 8, !dbg !2737
  %3 = load i64, i64* %__len, align 8, !dbg !2746
  %call6 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv(%"class.std::vector.0"* %this1), !dbg !2747
  %cmp7 = icmp ult i64 %3, %call6, !dbg !2748
  br i1 %cmp7, label %cond.true, label %lor.lhs.false, !dbg !2749

lor.lhs.false:                                    ; preds = %if.end
  %4 = load i64, i64* %__len, align 8, !dbg !2750
  %call8 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv(%"class.std::vector.0"* %this1), !dbg !2751
  %cmp9 = icmp ugt i64 %4, %call8, !dbg !2752
  br i1 %cmp9, label %cond.true, label %cond.false, !dbg !2753

cond.true:                                        ; preds = %lor.lhs.false, %if.end
  %call10 = call i64 @_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv(%"class.std::vector.0"* %this1), !dbg !2754
  br label %cond.end, !dbg !2755

cond.false:                                       ; preds = %lor.lhs.false
  %5 = load i64, i64* %__len, align 8, !dbg !2756
  br label %cond.end, !dbg !2758

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %call10, %cond.true ], [ %5, %cond.false ], !dbg !2759
  ret i64 %cond, !dbg !2761
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i64 @_ZN9__gnu_cxxmiIP7latLongSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_(%"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %__lhs, %"class.__gnu_cxx::__normal_iterator"* dereferenceable(8) %__rhs) #11 comdat !dbg !2762 {
entry:
  %__lhs.addr = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  %__rhs.addr = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %__lhs, %"class.__gnu_cxx::__normal_iterator"** %__lhs.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::__normal_iterator"** %__lhs.addr, metadata !2766, metadata !1315), !dbg !2767
  store %"class.__gnu_cxx::__normal_iterator"* %__rhs, %"class.__gnu_cxx::__normal_iterator"** %__rhs.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::__normal_iterator"** %__rhs.addr, metadata !2768, metadata !1315), !dbg !2769
  %0 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %__lhs.addr, align 8, !dbg !2770
  %call = call dereferenceable(8) %struct.latLong** @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %0), !dbg !2771
  %1 = load %struct.latLong*, %struct.latLong** %call, align 8, !dbg !2771
  %2 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %__rhs.addr, align 8, !dbg !2772
  %call1 = call dereferenceable(8) %struct.latLong** @_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator"* %2), !dbg !2773
  %3 = load %struct.latLong*, %struct.latLong** %call1, align 8, !dbg !2775
  %sub.ptr.lhs.cast = ptrtoint %struct.latLong* %1 to i64, !dbg !2776
  %sub.ptr.rhs.cast = ptrtoint %struct.latLong* %3 to i64, !dbg !2776
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !2776
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8, !dbg !2776
  ret i64 %sub.ptr.div, !dbg !2777
}

; Function Attrs: uwtable
define linkonce_odr %struct.latLong* @_ZNSt6vectorI7latLongSaIS0_EE5beginEv(%"class.std::vector.0"* %this) #0 comdat align 2 !dbg !2778 {
entry:
  %retval = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %this.addr = alloca %"class.std::vector.0"*, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector.0"** %this.addr, metadata !2779, metadata !1315), !dbg !2780
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2781
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0, !dbg !2781
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 0, !dbg !2782
  call void @_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator"* %retval, %struct.latLong** dereferenceable(8) %_M_start), !dbg !2783
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %retval, i32 0, i32 0, !dbg !2784
  %1 = load %struct.latLong*, %struct.latLong** %coerce.dive, align 8, !dbg !2784
  ret %struct.latLong* %1, !dbg !2784
}

; Function Attrs: uwtable
define linkonce_odr %struct.latLong* @_ZNSt12_Vector_baseI7latLongSaIS0_EE11_M_allocateEm(%"struct.std::_Vector_base.1"* %this, i64 %__n) #0 comdat align 2 !dbg !2785 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base.1"*, align 8
  %__n.addr = alloca i64, align 8
  store %"struct.std::_Vector_base.1"* %this, %"struct.std::_Vector_base.1"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base.1"** %this.addr, metadata !2786, metadata !1315), !dbg !2787
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !2788, metadata !1315), !dbg !2789
  %this1 = load %"struct.std::_Vector_base.1"*, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %0 = load i64, i64* %__n.addr, align 8, !dbg !2790
  %cmp = icmp ne i64 %0, 0, !dbg !2791
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !2790

cond.true:                                        ; preds = %entry
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0, !dbg !2792
  %1 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl to %"class.std::allocator.2"*, !dbg !2792
  %2 = load i64, i64* %__n.addr, align 8, !dbg !2794
  %call = call %struct.latLong* @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m(%"class.std::allocator.2"* dereferenceable(1) %1, i64 %2), !dbg !2795
  br label %cond.end, !dbg !2796

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !2797

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.latLong* [ %call, %cond.true ], [ null, %cond.false ], !dbg !2799
  ret %struct.latLong* %cond, !dbg !2801
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.latLong* @_ZSt34__uninitialized_move_if_noexcept_aIP7latLongS1_SaIS0_EET0_T_S4_S3_RT1_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result, %"class.std::allocator.2"* dereferenceable(1) %__alloc) #10 comdat !dbg !2802 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  %__alloc.addr = alloca %"class.std::allocator.2"*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !2809, metadata !1315), !dbg !2810
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !2811, metadata !1315), !dbg !2812
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__result.addr, metadata !2813, metadata !1315), !dbg !2814
  store %"class.std::allocator.2"* %__alloc, %"class.std::allocator.2"** %__alloc.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator.2"** %__alloc.addr, metadata !2815, metadata !1315), !dbg !2816
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !2817
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !2818
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !2819
  %3 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__alloc.addr, align 8, !dbg !2820
  %call = call %struct.latLong* @_ZSt22__uninitialized_copy_aIP7latLongS1_S0_ET0_T_S3_S2_RSaIT1_E(%struct.latLong* %0, %struct.latLong* %1, %struct.latLong* %2, %"class.std::allocator.2"* dereferenceable(1) %3), !dbg !2821
  ret %struct.latLong* %call, !dbg !2822
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE7destroyERS2_PS1_(%"class.std::allocator.2"* dereferenceable(1) %__a, %struct.latLong* %__p) #0 comdat align 2 !dbg !2823 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator.2"** %__a.addr, metadata !2824, metadata !1315), !dbg !2825
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__p.addr, metadata !2826, metadata !1315), !dbg !2827
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8, !dbg !2828
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*, !dbg !2828
  %2 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8, !dbg !2829
  call void @_ZN9__gnu_cxx13new_allocatorI7latLongE7destroyEPS1_(%"class.__gnu_cxx::new_allocator.3"* %1, %struct.latLong* %2), !dbg !2830
  ret void, !dbg !2831
}

declare void @__cxa_rethrow()

declare void @__cxa_end_catch()

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.latLong* @_ZSt23__copy_move_backward_a2ILb0EP7latLongS1_ET1_T0_S3_S2_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #10 comdat !dbg !2832 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !2835, metadata !1315), !dbg !2836
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !2837, metadata !1315), !dbg !2838
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__result.addr, metadata !2839, metadata !1315), !dbg !2840
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !2841
  %call = call %struct.latLong* @_ZSt12__niter_baseIP7latLongENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.latLong* %0), !dbg !2842
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !2843
  %call1 = call %struct.latLong* @_ZSt12__niter_baseIP7latLongENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.latLong* %1), !dbg !2844
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !2846
  %call2 = call %struct.latLong* @_ZSt12__niter_baseIP7latLongENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.latLong* %2), !dbg !2847
  %call3 = call %struct.latLong* @_ZSt22__copy_move_backward_aILb0EP7latLongS1_ET1_T0_S3_S2_(%struct.latLong* %call, %struct.latLong* %call1, %struct.latLong* %call2), !dbg !2848
  ret %struct.latLong* %call3, !dbg !2849
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr %struct.latLong* @_ZSt12__miter_baseIP7latLongENSt11_Miter_baseIT_E13iterator_typeES3_(%struct.latLong* %__it) #11 comdat !dbg !2850 {
entry:
  %__it.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__it, %struct.latLong** %__it.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__it.addr, metadata !2859, metadata !1315), !dbg !2860
  %0 = load %struct.latLong*, %struct.latLong** %__it.addr, align 8, !dbg !2861
  %call = call %struct.latLong* @_ZNSt10_Iter_baseIP7latLongLb0EE7_S_baseES1_(%struct.latLong* %0), !dbg !2862
  ret %struct.latLong* %call, !dbg !2863
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.latLong* @_ZSt22__copy_move_backward_aILb0EP7latLongS1_ET1_T0_S3_S2_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #10 comdat !dbg !2864 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  %__simple = alloca i8, align 1
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !2865, metadata !1315), !dbg !2866
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !2867, metadata !1315), !dbg !2868
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__result.addr, metadata !2869, metadata !1315), !dbg !2870
  call void @llvm.dbg.declare(metadata i8* %__simple, metadata !2871, metadata !1315), !dbg !2873
  store i8 1, i8* %__simple, align 1, !dbg !2873
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !2874
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !2875
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !2876
  %call = call %struct.latLong* @_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI7latLongEEPT_PKS4_S7_S5_(%struct.latLong* %0, %struct.latLong* %1, %struct.latLong* %2), !dbg !2877
  ret %struct.latLong* %call, !dbg !2878
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.latLong* @_ZSt12__niter_baseIP7latLongENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.latLong* %__it) #10 comdat !dbg !2879 {
entry:
  %__it.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__it, %struct.latLong** %__it.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__it.addr, metadata !2880, metadata !1315), !dbg !2881
  %0 = load %struct.latLong*, %struct.latLong** %__it.addr, align 8, !dbg !2882
  %call = call %struct.latLong* @_ZNSt10_Iter_baseIP7latLongLb0EE7_S_baseES1_(%struct.latLong* %0), !dbg !2883
  ret %struct.latLong* %call, !dbg !2884
}

; Function Attrs: nounwind uwtable
define linkonce_odr %struct.latLong* @_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI7latLongEEPT_PKS4_S7_S5_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #3 comdat align 2 !dbg !2885 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  %_Num = alloca i64, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !2903, metadata !1315), !dbg !2904
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !2905, metadata !1315), !dbg !2906
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__result.addr, metadata !2907, metadata !1315), !dbg !2908
  call void @llvm.dbg.declare(metadata i64* %_Num, metadata !2909, metadata !1315), !dbg !2911
  %0 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !2912
  %1 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !2913
  %sub.ptr.lhs.cast = ptrtoint %struct.latLong* %0 to i64, !dbg !2914
  %sub.ptr.rhs.cast = ptrtoint %struct.latLong* %1 to i64, !dbg !2914
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !2914
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8, !dbg !2914
  store i64 %sub.ptr.div, i64* %_Num, align 8, !dbg !2911
  %2 = load i64, i64* %_Num, align 8, !dbg !2915
  %tobool = icmp ne i64 %2, 0, !dbg !2915
  br i1 %tobool, label %if.then, label %if.end, !dbg !2917

if.then:                                          ; preds = %entry
  %3 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !2918
  %4 = load i64, i64* %_Num, align 8, !dbg !2919
  %idx.neg = sub i64 0, %4, !dbg !2920
  %add.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %3, i64 %idx.neg, !dbg !2920
  %5 = bitcast %struct.latLong* %add.ptr to i8*, !dbg !2921
  %6 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !2922
  %7 = bitcast %struct.latLong* %6 to i8*, !dbg !2921
  %8 = load i64, i64* %_Num, align 8, !dbg !2923
  %mul = mul i64 8, %8, !dbg !2924
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %5, i8* %7, i64 %mul, i32 4, i1 false), !dbg !2921
  br label %if.end, !dbg !2921

if.end:                                           ; preds = %if.then, %entry
  %9 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !2925
  %10 = load i64, i64* %_Num, align 8, !dbg !2926
  %idx.neg1 = sub i64 0, %10, !dbg !2927
  %add.ptr2 = getelementptr inbounds %struct.latLong, %struct.latLong* %9, i64 %idx.neg1, !dbg !2927
  ret %struct.latLong* %add.ptr2, !dbg !2928
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #7

; Function Attrs: nounwind uwtable
define linkonce_odr %struct.latLong* @_ZNSt10_Iter_baseIP7latLongLb0EE7_S_baseES1_(%struct.latLong* %__it) #3 comdat align 2 !dbg !2929 {
entry:
  %__it.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__it, %struct.latLong** %__it.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__it.addr, metadata !2930, metadata !1315), !dbg !2931
  %0 = load %struct.latLong*, %struct.latLong** %__it.addr, align 8, !dbg !2932
  ret %struct.latLong* %0, !dbg !2933
}

; Function Attrs: uwtable
define linkonce_odr i64 @_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv(%"class.std::vector.0"* %this) #0 comdat align 2 !dbg !2934 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector.0"** %this.addr, metadata !2935, metadata !1315), !dbg !2936
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2937
  %call = call dereferenceable(1) %"class.std::allocator.2"* @_ZNKSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %0), !dbg !2937
  %call2 = call i64 @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8max_sizeERKS2_(%"class.std::allocator.2"* dereferenceable(1) %call), !dbg !2938
  ret i64 %call2, !dbg !2940
}

; Function Attrs: nounwind uwtable
define linkonce_odr i64 @_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv(%"class.std::vector.0"* %this) #3 comdat align 2 !dbg !2941 {
entry:
  %this.addr = alloca %"class.std::vector.0"*, align 8
  store %"class.std::vector.0"* %this, %"class.std::vector.0"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector.0"** %this.addr, metadata !2942, metadata !1315), !dbg !2943
  %this1 = load %"class.std::vector.0"*, %"class.std::vector.0"** %this.addr, align 8
  %0 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2944
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %0, i32 0, i32 0, !dbg !2944
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl, i32 0, i32 1, !dbg !2945
  %1 = load %struct.latLong*, %struct.latLong** %_M_finish, align 8, !dbg !2945
  %2 = bitcast %"class.std::vector.0"* %this1 to %"struct.std::_Vector_base.1"*, !dbg !2946
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %2, i32 0, i32 0, !dbg !2946
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl", %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl2, i32 0, i32 0, !dbg !2947
  %3 = load %struct.latLong*, %struct.latLong** %_M_start, align 8, !dbg !2947
  %sub.ptr.lhs.cast = ptrtoint %struct.latLong* %1 to i64, !dbg !2948
  %sub.ptr.rhs.cast = ptrtoint %struct.latLong* %3 to i64, !dbg !2948
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !2948
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8, !dbg !2948
  ret i64 %sub.ptr.div, !dbg !2949
}

; Function Attrs: noreturn
declare void @_ZSt20__throw_length_errorPKc(i8*) #13

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(8) i64* @_ZSt3maxImERKT_S2_S2_(i64* dereferenceable(8) %__a, i64* dereferenceable(8) %__b) #11 comdat !dbg !2950 {
entry:
  %retval = alloca i64*, align 8
  %__a.addr = alloca i64*, align 8
  %__b.addr = alloca i64*, align 8
  store i64* %__a, i64** %__a.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %__a.addr, metadata !2957, metadata !1315), !dbg !2958
  store i64* %__b, i64** %__b.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %__b.addr, metadata !2959, metadata !1315), !dbg !2960
  %0 = load i64*, i64** %__a.addr, align 8, !dbg !2961
  %1 = load i64, i64* %0, align 8, !dbg !2961
  %2 = load i64*, i64** %__b.addr, align 8, !dbg !2963
  %3 = load i64, i64* %2, align 8, !dbg !2963
  %cmp = icmp ult i64 %1, %3, !dbg !2964
  br i1 %cmp, label %if.then, label %if.end, !dbg !2965

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %__b.addr, align 8, !dbg !2966
  store i64* %4, i64** %retval, align 8, !dbg !2967
  br label %return, !dbg !2967

if.end:                                           ; preds = %entry
  %5 = load i64*, i64** %__a.addr, align 8, !dbg !2968
  store i64* %5, i64** %retval, align 8, !dbg !2969
  br label %return, !dbg !2969

return:                                           ; preds = %if.end, %if.then
  %6 = load i64*, i64** %retval, align 8, !dbg !2970
  ret i64* %6, !dbg !2970
}

; Function Attrs: nounwind uwtable
define linkonce_odr i64 @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8max_sizeERKS2_(%"class.std::allocator.2"* dereferenceable(1) %__a) #3 comdat align 2 !dbg !2971 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator.2"** %__a.addr, metadata !2972, metadata !1315), !dbg !2973
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8, !dbg !2974
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*, !dbg !2974
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorI7latLongE8max_sizeEv(%"class.__gnu_cxx::new_allocator.3"* %1) #16, !dbg !2975
  ret i64 %call, !dbg !2976
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(1) %"class.std::allocator.2"* @_ZNKSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base.1"* %this) #3 comdat align 2 !dbg !2977 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base.1"*, align 8
  store %"struct.std::_Vector_base.1"* %this, %"struct.std::_Vector_base.1"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base.1"** %this.addr, metadata !2978, metadata !1315), !dbg !2980
  %this1 = load %"struct.std::_Vector_base.1"*, %"struct.std::_Vector_base.1"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base.1", %"struct.std::_Vector_base.1"* %this1, i32 0, i32 0, !dbg !2981
  %0 = bitcast %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl"* %_M_impl to %"class.std::allocator.2"*, !dbg !2982
  ret %"class.std::allocator.2"* %0, !dbg !2983
}

; Function Attrs: nounwind uwtable
define linkonce_odr i64 @_ZNK9__gnu_cxx13new_allocatorI7latLongE8max_sizeEv(%"class.__gnu_cxx::new_allocator.3"* %this) #3 comdat align 2 !dbg !2984 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator.3"** %this.addr, metadata !2985, metadata !1315), !dbg !2987
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  ret i64 2305843009213693951, !dbg !2988
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator"* %this, %struct.latLong** dereferenceable(8) %__i) unnamed_addr #3 comdat align 2 !dbg !2989 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::__normal_iterator"*, align 8
  %__i.addr = alloca %struct.latLong**, align 8
  store %"class.__gnu_cxx::__normal_iterator"* %this, %"class.__gnu_cxx::__normal_iterator"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::__normal_iterator"** %this.addr, metadata !2990, metadata !1315), !dbg !2992
  store %struct.latLong** %__i, %struct.latLong*** %__i.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong*** %__i.addr, metadata !2993, metadata !1315), !dbg !2994
  %this1 = load %"class.__gnu_cxx::__normal_iterator"*, %"class.__gnu_cxx::__normal_iterator"** %this.addr, align 8
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", %"class.__gnu_cxx::__normal_iterator"* %this1, i32 0, i32 0, !dbg !2995
  %0 = load %struct.latLong**, %struct.latLong*** %__i.addr, align 8, !dbg !2996
  %1 = load %struct.latLong*, %struct.latLong** %0, align 8, !dbg !2996
  store %struct.latLong* %1, %struct.latLong** %_M_current, align 8, !dbg !2995
  ret void, !dbg !2997
}

; Function Attrs: uwtable
define linkonce_odr %struct.latLong* @_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m(%"class.std::allocator.2"* dereferenceable(1) %__a, i64 %__n) #0 comdat align 2 !dbg !2998 {
entry:
  %__a.addr = alloca %"class.std::allocator.2"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::allocator.2"* %__a, %"class.std::allocator.2"** %__a.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator.2"** %__a.addr, metadata !2999, metadata !1315), !dbg !3000
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !3001, metadata !1315), !dbg !3002
  %0 = load %"class.std::allocator.2"*, %"class.std::allocator.2"** %__a.addr, align 8, !dbg !3003
  %1 = bitcast %"class.std::allocator.2"* %0 to %"class.__gnu_cxx::new_allocator.3"*, !dbg !3003
  %2 = load i64, i64* %__n.addr, align 8, !dbg !3004
  %call = call %struct.latLong* @_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.3"* %1, i64 %2, i8* null), !dbg !3005
  ret %struct.latLong* %call, !dbg !3006
}

; Function Attrs: uwtable
define linkonce_odr %struct.latLong* @_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv(%"class.__gnu_cxx::new_allocator.3"* %this, i64 %__n, i8*) #0 comdat align 2 !dbg !3007 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  %__n.addr = alloca i64, align 8
  %.addr = alloca i8*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator.3"** %this.addr, metadata !3008, metadata !1315), !dbg !3009
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !3010, metadata !1315), !dbg !3011
  store i8* %0, i8** %.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr, metadata !3012, metadata !1315), !dbg !3013
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %1 = load i64, i64* %__n.addr, align 8, !dbg !3014
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorI7latLongE8max_sizeEv(%"class.__gnu_cxx::new_allocator.3"* %this1) #16, !dbg !3016
  %cmp = icmp ugt i64 %1, %call, !dbg !3017
  br i1 %cmp, label %if.then, label %if.end, !dbg !3018

if.then:                                          ; preds = %entry
  call void @_ZSt17__throw_bad_allocv() #18, !dbg !3019
  unreachable, !dbg !3019

if.end:                                           ; preds = %entry
  %2 = load i64, i64* %__n.addr, align 8, !dbg !3020
  %mul = mul i64 %2, 8, !dbg !3021
  %call2 = call i8* @_Znwm(i64 %mul), !dbg !3022
  %3 = bitcast i8* %call2 to %struct.latLong*, !dbg !3023
  ret %struct.latLong* %3, !dbg !3024
}

; Function Attrs: noreturn
declare void @_ZSt17__throw_bad_allocv() #13

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #14

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.latLong* @_ZSt22__uninitialized_copy_aIP7latLongS1_S0_ET0_T_S3_S2_RSaIT1_E(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result, %"class.std::allocator.2"* dereferenceable(1)) #10 comdat !dbg !3025 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  %.addr = alloca %"class.std::allocator.2"*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !3027, metadata !1315), !dbg !3028
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !3029, metadata !1315), !dbg !3030
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__result.addr, metadata !3031, metadata !1315), !dbg !3032
  store %"class.std::allocator.2"* %0, %"class.std::allocator.2"** %.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator.2"** %.addr, metadata !3033, metadata !1315), !dbg !3034
  %1 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !3035
  %2 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !3036
  %3 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !3037
  %call = call %struct.latLong* @_ZSt18uninitialized_copyIP7latLongS1_ET0_T_S3_S2_(%struct.latLong* %1, %struct.latLong* %2, %struct.latLong* %3), !dbg !3038
  ret %struct.latLong* %call, !dbg !3039
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.latLong* @_ZSt18uninitialized_copyIP7latLongS1_ET0_T_S3_S2_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #10 comdat !dbg !3040 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  %__assignable = alloca i8, align 1
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !3042, metadata !1315), !dbg !3043
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !3044, metadata !1315), !dbg !3045
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__result.addr, metadata !3046, metadata !1315), !dbg !3047
  call void @llvm.dbg.declare(metadata i8* %__assignable, metadata !3048, metadata !1315), !dbg !3049
  store i8 1, i8* %__assignable, align 1, !dbg !3049
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !3050
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !3051
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !3052
  %call = call %struct.latLong* @_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP7latLongS3_EET0_T_S5_S4_(%struct.latLong* %0, %struct.latLong* %1, %struct.latLong* %2), !dbg !3053
  ret %struct.latLong* %call, !dbg !3054
}

; Function Attrs: uwtable
define linkonce_odr %struct.latLong* @_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP7latLongS3_EET0_T_S5_S4_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #0 comdat align 2 !dbg !3055 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !3060, metadata !1315), !dbg !3061
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !3062, metadata !1315), !dbg !3063
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__result.addr, metadata !3064, metadata !1315), !dbg !3065
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !3066
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !3067
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !3068
  %call = call %struct.latLong* @_ZSt4copyIP7latLongS1_ET0_T_S3_S2_(%struct.latLong* %0, %struct.latLong* %1, %struct.latLong* %2), !dbg !3069
  ret %struct.latLong* %call, !dbg !3070
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.latLong* @_ZSt4copyIP7latLongS1_ET0_T_S3_S2_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #10 comdat !dbg !3071 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !3075, metadata !1315), !dbg !3076
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !3077, metadata !1315), !dbg !3078
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__result.addr, metadata !3079, metadata !1315), !dbg !3080
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !3081
  %call = call %struct.latLong* @_ZSt12__miter_baseIP7latLongENSt11_Miter_baseIT_E13iterator_typeES3_(%struct.latLong* %0), !dbg !3082
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !3083
  %call1 = call %struct.latLong* @_ZSt12__miter_baseIP7latLongENSt11_Miter_baseIT_E13iterator_typeES3_(%struct.latLong* %1), !dbg !3084
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !3086
  %call2 = call %struct.latLong* @_ZSt14__copy_move_a2ILb0EP7latLongS1_ET1_T0_S3_S2_(%struct.latLong* %call, %struct.latLong* %call1, %struct.latLong* %2), !dbg !3087
  ret %struct.latLong* %call2, !dbg !3088
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.latLong* @_ZSt14__copy_move_a2ILb0EP7latLongS1_ET1_T0_S3_S2_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #10 comdat !dbg !3089 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !3091, metadata !1315), !dbg !3092
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !3093, metadata !1315), !dbg !3094
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__result.addr, metadata !3095, metadata !1315), !dbg !3096
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !3097
  %call = call %struct.latLong* @_ZSt12__niter_baseIP7latLongENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.latLong* %0), !dbg !3098
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !3099
  %call1 = call %struct.latLong* @_ZSt12__niter_baseIP7latLongENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.latLong* %1), !dbg !3100
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !3101
  %call2 = call %struct.latLong* @_ZSt12__niter_baseIP7latLongENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.latLong* %2), !dbg !3102
  %call3 = call %struct.latLong* @_ZSt13__copy_move_aILb0EP7latLongS1_ET1_T0_S3_S2_(%struct.latLong* %call, %struct.latLong* %call1, %struct.latLong* %call2), !dbg !3103
  ret %struct.latLong* %call3, !dbg !3105
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.latLong* @_ZSt13__copy_move_aILb0EP7latLongS1_ET1_T0_S3_S2_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #10 comdat !dbg !3106 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  %__simple = alloca i8, align 1
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !3107, metadata !1315), !dbg !3108
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !3109, metadata !1315), !dbg !3110
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__result.addr, metadata !3111, metadata !1315), !dbg !3112
  call void @llvm.dbg.declare(metadata i8* %__simple, metadata !3113, metadata !1315), !dbg !3114
  store i8 1, i8* %__simple, align 1, !dbg !3114
  %0 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !3115
  %1 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !3116
  %2 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !3117
  %call = call %struct.latLong* @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI7latLongEEPT_PKS4_S7_S5_(%struct.latLong* %0, %struct.latLong* %1, %struct.latLong* %2), !dbg !3118
  ret %struct.latLong* %call, !dbg !3119
}

; Function Attrs: nounwind uwtable
define linkonce_odr %struct.latLong* @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI7latLongEEPT_PKS4_S7_S5_(%struct.latLong* %__first, %struct.latLong* %__last, %struct.latLong* %__result) #3 comdat align 2 !dbg !3120 {
entry:
  %__first.addr = alloca %struct.latLong*, align 8
  %__last.addr = alloca %struct.latLong*, align 8
  %__result.addr = alloca %struct.latLong*, align 8
  %_Num = alloca i64, align 8
  store %struct.latLong* %__first, %struct.latLong** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__first.addr, metadata !3123, metadata !1315), !dbg !3124
  store %struct.latLong* %__last, %struct.latLong** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__last.addr, metadata !3125, metadata !1315), !dbg !3126
  store %struct.latLong* %__result, %struct.latLong** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__result.addr, metadata !3127, metadata !1315), !dbg !3128
  call void @llvm.dbg.declare(metadata i64* %_Num, metadata !3129, metadata !1315), !dbg !3130
  %0 = load %struct.latLong*, %struct.latLong** %__last.addr, align 8, !dbg !3131
  %1 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !3132
  %sub.ptr.lhs.cast = ptrtoint %struct.latLong* %0 to i64, !dbg !3133
  %sub.ptr.rhs.cast = ptrtoint %struct.latLong* %1 to i64, !dbg !3133
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !3133
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8, !dbg !3133
  store i64 %sub.ptr.div, i64* %_Num, align 8, !dbg !3130
  %2 = load i64, i64* %_Num, align 8, !dbg !3134
  %tobool = icmp ne i64 %2, 0, !dbg !3134
  br i1 %tobool, label %if.then, label %if.end, !dbg !3136

if.then:                                          ; preds = %entry
  %3 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !3137
  %4 = bitcast %struct.latLong* %3 to i8*, !dbg !3138
  %5 = load %struct.latLong*, %struct.latLong** %__first.addr, align 8, !dbg !3139
  %6 = bitcast %struct.latLong* %5 to i8*, !dbg !3138
  %7 = load i64, i64* %_Num, align 8, !dbg !3140
  %mul = mul i64 8, %7, !dbg !3141
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %4, i8* %6, i64 %mul, i32 4, i1 false), !dbg !3138
  br label %if.end, !dbg !3138

if.end:                                           ; preds = %if.then, %entry
  %8 = load %struct.latLong*, %struct.latLong** %__result.addr, align 8, !dbg !3142
  %9 = load i64, i64* %_Num, align 8, !dbg !3143
  %add.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %8, i64 %9, !dbg !3144
  ret %struct.latLong* %add.ptr, !dbg !3145
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI7latLongE7destroyEPS1_(%"class.__gnu_cxx::new_allocator.3"* %this, %struct.latLong* %__p) #3 comdat align 2 !dbg !3146 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator.3"*, align 8
  %__p.addr = alloca %struct.latLong*, align 8
  store %"class.__gnu_cxx::new_allocator.3"* %this, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator.3"** %this.addr, metadata !3147, metadata !1315), !dbg !3148
  store %struct.latLong* %__p, %struct.latLong** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.latLong** %__p.addr, metadata !3149, metadata !1315), !dbg !3150
  %this1 = load %"class.__gnu_cxx::new_allocator.3"*, %"class.__gnu_cxx::new_allocator.3"** %this.addr, align 8
  %0 = load %struct.latLong*, %struct.latLong** %__p.addr, align 8, !dbg !3151
  ret void, !dbg !3152
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator"* dereferenceable(1) %__a, %struct.record* %__p, %struct.record* dereferenceable(60) %__arg) #0 comdat align 2 !dbg !3153 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  %__arg.addr = alloca %struct.record*, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %__a.addr, metadata !3157, metadata !1315), !dbg !3158
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__p.addr, metadata !3159, metadata !1315), !dbg !3160
  store %struct.record* %__arg, %struct.record** %__arg.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__arg.addr, metadata !3161, metadata !1315), !dbg !3162
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8, !dbg !3163
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*, !dbg !3163
  %2 = load %struct.record*, %struct.record** %__p.addr, align 8, !dbg !3164
  %3 = load %struct.record*, %struct.record** %__arg.addr, align 8, !dbg !3165
  call void @_ZN9__gnu_cxx13new_allocatorI6recordE9constructEPS1_RKS1_(%"class.__gnu_cxx::new_allocator"* %1, %struct.record* %2, %struct.record* dereferenceable(60) %3), !dbg !3166
  ret void, !dbg !3167
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector"* %this, %struct.record* %__position.coerce, %struct.record* dereferenceable(60) %__x) #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !3168 {
entry:
  %__position = alloca %"class.__gnu_cxx::__normal_iterator.5", align 8
  %this.addr = alloca %"class.std::vector"*, align 8
  %__x.addr = alloca %struct.record*, align 8
  %__x_copy = alloca %struct.record, align 4
  %__len = alloca i64, align 8
  %__elems_before = alloca i64, align 8
  %ref.tmp = alloca %"class.__gnu_cxx::__normal_iterator.5", align 8
  %__new_start = alloca %struct.record*, align 8
  %__new_finish = alloca %struct.record*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %__position, i32 0, i32 0
  store %struct.record* %__position.coerce, %struct.record** %coerce.dive, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector"** %this.addr, metadata !3169, metadata !1315), !dbg !3170
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::__normal_iterator.5"* %__position, metadata !3171, metadata !1315), !dbg !3172
  store %struct.record* %__x, %struct.record** %__x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__x.addr, metadata !3173, metadata !1315), !dbg !3174
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3175
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0, !dbg !3175
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 1, !dbg !3177
  %1 = load %struct.record*, %struct.record** %_M_finish, align 8, !dbg !3177
  %2 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3178
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %2, i32 0, i32 0, !dbg !3178
  %_M_end_of_storage = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl2, i32 0, i32 2, !dbg !3179
  %3 = load %struct.record*, %struct.record** %_M_end_of_storage, align 8, !dbg !3179
  %cmp = icmp ne %struct.record* %1, %3, !dbg !3180
  br i1 %cmp, label %if.then, label %if.else, !dbg !3181

if.then:                                          ; preds = %entry
  %4 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3182
  %_M_impl3 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %4, i32 0, i32 0, !dbg !3182
  %5 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl3 to %"class.std::allocator"*, !dbg !3184
  %6 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3185
  %_M_impl4 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %6, i32 0, i32 0, !dbg !3185
  %_M_finish5 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl4, i32 0, i32 1, !dbg !3186
  %7 = load %struct.record*, %struct.record** %_M_finish5, align 8, !dbg !3186
  %8 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3187
  %_M_impl6 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %8, i32 0, i32 0, !dbg !3187
  %_M_finish7 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl6, i32 0, i32 1, !dbg !3187
  %9 = load %struct.record*, %struct.record** %_M_finish7, align 8, !dbg !3187
  %add.ptr = getelementptr inbounds %struct.record, %struct.record* %9, i64 -1, !dbg !3187
  call void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator"* dereferenceable(1) %5, %struct.record* %7, %struct.record* dereferenceable(60) %add.ptr), !dbg !3188
  %10 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3189
  %_M_impl8 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %10, i32 0, i32 0, !dbg !3189
  %_M_finish9 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl8, i32 0, i32 1, !dbg !3190
  %11 = load %struct.record*, %struct.record** %_M_finish9, align 8, !dbg !3191
  %incdec.ptr = getelementptr inbounds %struct.record, %struct.record* %11, i32 1, !dbg !3191
  store %struct.record* %incdec.ptr, %struct.record** %_M_finish9, align 8, !dbg !3191
  call void @llvm.dbg.declare(metadata %struct.record* %__x_copy, metadata !3192, metadata !1315), !dbg !3193
  %12 = load %struct.record*, %struct.record** %__x.addr, align 8, !dbg !3194
  %13 = bitcast %struct.record* %__x_copy to i8*, !dbg !3194
  %14 = bitcast %struct.record* %12 to i8*, !dbg !3194
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 60, i32 4, i1 false), !dbg !3194
  %call = call dereferenceable(8) %struct.record** @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.5"* %__position), !dbg !3195
  %15 = load %struct.record*, %struct.record** %call, align 8, !dbg !3195
  %16 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3195
  %_M_impl10 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %16, i32 0, i32 0, !dbg !3195
  %_M_finish11 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl10, i32 0, i32 1, !dbg !3195
  %17 = load %struct.record*, %struct.record** %_M_finish11, align 8, !dbg !3195
  %add.ptr12 = getelementptr inbounds %struct.record, %struct.record* %17, i64 -2, !dbg !3195
  %18 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3195
  %_M_impl13 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %18, i32 0, i32 0, !dbg !3195
  %_M_finish14 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl13, i32 0, i32 1, !dbg !3195
  %19 = load %struct.record*, %struct.record** %_M_finish14, align 8, !dbg !3195
  %add.ptr15 = getelementptr inbounds %struct.record, %struct.record* %19, i64 -1, !dbg !3195
  %call16 = call %struct.record* @_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_(%struct.record* %15, %struct.record* %add.ptr12, %struct.record* %add.ptr15), !dbg !3196
  %call17 = call dereferenceable(60) %struct.record* @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEdeEv(%"class.__gnu_cxx::__normal_iterator.5"* %__position), !dbg !3198
  %20 = bitcast %struct.record* %call17 to i8*, !dbg !3199
  %21 = bitcast %struct.record* %__x_copy to i8*, !dbg !3199
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %21, i64 60, i32 4, i1 false), !dbg !3199
  br label %if.end70, !dbg !3200

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %__len, metadata !3201, metadata !1315), !dbg !3203
  %call18 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE12_M_check_lenEmPKc(%"class.std::vector"* %this1, i64 1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.23, i32 0, i32 0)), !dbg !3204
  store i64 %call18, i64* %__len, align 8, !dbg !3203
  call void @llvm.dbg.declare(metadata i64* %__elems_before, metadata !3205, metadata !1315), !dbg !3206
  %call19 = call %struct.record* @_ZNSt6vectorI6recordSaIS0_EE5beginEv(%"class.std::vector"* %this1), !dbg !3207
  %coerce.dive20 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %ref.tmp, i32 0, i32 0, !dbg !3207
  store %struct.record* %call19, %struct.record** %coerce.dive20, align 8, !dbg !3207
  %call21 = call i64 @_ZN9__gnu_cxxmiIP6recordSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_(%"class.__gnu_cxx::__normal_iterator.5"* dereferenceable(8) %__position, %"class.__gnu_cxx::__normal_iterator.5"* dereferenceable(8) %ref.tmp), !dbg !3208
  store i64 %call21, i64* %__elems_before, align 8, !dbg !3206
  call void @llvm.dbg.declare(metadata %struct.record** %__new_start, metadata !3210, metadata !1315), !dbg !3211
  %22 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3212
  %23 = load i64, i64* %__len, align 8, !dbg !3213
  %call22 = call %struct.record* @_ZNSt12_Vector_baseI6recordSaIS0_EE11_M_allocateEm(%"struct.std::_Vector_base"* %22, i64 %23), !dbg !3212
  store %struct.record* %call22, %struct.record** %__new_start, align 8, !dbg !3211
  call void @llvm.dbg.declare(metadata %struct.record** %__new_finish, metadata !3214, metadata !1315), !dbg !3215
  %24 = load %struct.record*, %struct.record** %__new_start, align 8, !dbg !3216
  store %struct.record* %24, %struct.record** %__new_finish, align 8, !dbg !3215
  %25 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3217
  %_M_impl23 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %25, i32 0, i32 0, !dbg !3217
  %26 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl23 to %"class.std::allocator"*, !dbg !3219
  %27 = load %struct.record*, %struct.record** %__new_start, align 8, !dbg !3220
  %28 = load i64, i64* %__elems_before, align 8, !dbg !3221
  %add.ptr24 = getelementptr inbounds %struct.record, %struct.record* %27, i64 %28, !dbg !3222
  %29 = load %struct.record*, %struct.record** %__x.addr, align 8, !dbg !3223
  invoke void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_(%"class.std::allocator"* dereferenceable(1) %26, %struct.record* %add.ptr24, %struct.record* dereferenceable(60) %29)
          to label %invoke.cont unwind label %lpad, !dbg !3224

invoke.cont:                                      ; preds = %if.else
  store %struct.record* null, %struct.record** %__new_finish, align 8, !dbg !3225
  %30 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3226
  %_M_impl25 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %30, i32 0, i32 0, !dbg !3226
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl25, i32 0, i32 0, !dbg !3227
  %31 = load %struct.record*, %struct.record** %_M_start, align 8, !dbg !3227
  %call27 = invoke dereferenceable(8) %struct.record** @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.5"* %__position)
          to label %invoke.cont26 unwind label %lpad, !dbg !3228

invoke.cont26:                                    ; preds = %invoke.cont
  %32 = load %struct.record*, %struct.record** %call27, align 8, !dbg !3229
  %33 = load %struct.record*, %struct.record** %__new_start, align 8, !dbg !3231
  %34 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3232
  %call29 = invoke dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %34)
          to label %invoke.cont28 unwind label %lpad, !dbg !3232

invoke.cont28:                                    ; preds = %invoke.cont26
  %call31 = invoke %struct.record* @_ZSt34__uninitialized_move_if_noexcept_aIP6recordS1_SaIS0_EET0_T_S4_S3_RT1_(%struct.record* %31, %struct.record* %32, %struct.record* %33, %"class.std::allocator"* dereferenceable(1) %call29)
          to label %invoke.cont30 unwind label %lpad, !dbg !3233

invoke.cont30:                                    ; preds = %invoke.cont28
  store %struct.record* %call31, %struct.record** %__new_finish, align 8, !dbg !3234
  %35 = load %struct.record*, %struct.record** %__new_finish, align 8, !dbg !3235
  %incdec.ptr32 = getelementptr inbounds %struct.record, %struct.record* %35, i32 1, !dbg !3235
  store %struct.record* %incdec.ptr32, %struct.record** %__new_finish, align 8, !dbg !3235
  %call34 = invoke dereferenceable(8) %struct.record** @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.5"* %__position)
          to label %invoke.cont33 unwind label %lpad, !dbg !3236

invoke.cont33:                                    ; preds = %invoke.cont30
  %36 = load %struct.record*, %struct.record** %call34, align 8, !dbg !3237
  %37 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3238
  %_M_impl35 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %37, i32 0, i32 0, !dbg !3238
  %_M_finish36 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl35, i32 0, i32 1, !dbg !3239
  %38 = load %struct.record*, %struct.record** %_M_finish36, align 8, !dbg !3239
  %39 = load %struct.record*, %struct.record** %__new_finish, align 8, !dbg !3240
  %40 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3241
  %call38 = invoke dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %40)
          to label %invoke.cont37 unwind label %lpad, !dbg !3241

invoke.cont37:                                    ; preds = %invoke.cont33
  %call40 = invoke %struct.record* @_ZSt34__uninitialized_move_if_noexcept_aIP6recordS1_SaIS0_EET0_T_S4_S3_RT1_(%struct.record* %36, %struct.record* %38, %struct.record* %39, %"class.std::allocator"* dereferenceable(1) %call38)
          to label %invoke.cont39 unwind label %lpad, !dbg !3242

invoke.cont39:                                    ; preds = %invoke.cont37
  store %struct.record* %call40, %struct.record** %__new_finish, align 8, !dbg !3243
  br label %try.cont, !dbg !3244

lpad:                                             ; preds = %invoke.cont37, %invoke.cont33, %invoke.cont30, %invoke.cont28, %invoke.cont26, %invoke.cont, %if.else
  %41 = landingpad { i8*, i32 }
          catch i8* null, !dbg !3245
  %42 = extractvalue { i8*, i32 } %41, 0, !dbg !3245
  store i8* %42, i8** %exn.slot, align 8, !dbg !3245
  %43 = extractvalue { i8*, i32 } %41, 1, !dbg !3245
  store i32 %43, i32* %ehselector.slot, align 4, !dbg !3245
  br label %catch, !dbg !3245

catch:                                            ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !3246
  %44 = call i8* @__cxa_begin_catch(i8* %exn) #16, !dbg !3246
  %45 = load %struct.record*, %struct.record** %__new_finish, align 8, !dbg !3247
  %tobool = icmp ne %struct.record* %45, null, !dbg !3247
  br i1 %tobool, label %if.else46, label %if.then41, !dbg !3250

if.then41:                                        ; preds = %catch
  %46 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3251
  %_M_impl42 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %46, i32 0, i32 0, !dbg !3251
  %47 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl42 to %"class.std::allocator"*, !dbg !3252
  %48 = load %struct.record*, %struct.record** %__new_start, align 8, !dbg !3253
  %49 = load i64, i64* %__elems_before, align 8, !dbg !3254
  %add.ptr43 = getelementptr inbounds %struct.record, %struct.record* %48, i64 %49, !dbg !3255
  invoke void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE7destroyERS2_PS1_(%"class.std::allocator"* dereferenceable(1) %47, %struct.record* %add.ptr43)
          to label %invoke.cont45 unwind label %lpad44, !dbg !3256

invoke.cont45:                                    ; preds = %if.then41
  br label %if.end, !dbg !3257

lpad44:                                           ; preds = %invoke.cont50, %if.end, %invoke.cont47, %if.else46, %if.then41
  %50 = landingpad { i8*, i32 }
          cleanup, !dbg !3259
  %51 = extractvalue { i8*, i32 } %50, 0, !dbg !3259
  store i8* %51, i8** %exn.slot, align 8, !dbg !3259
  %52 = extractvalue { i8*, i32 } %50, 1, !dbg !3259
  store i32 %52, i32* %ehselector.slot, align 4, !dbg !3259
  invoke void @__cxa_end_catch()
          to label %invoke.cont51 unwind label %terminate.lpad, !dbg !3260

if.else46:                                        ; preds = %catch
  %53 = load %struct.record*, %struct.record** %__new_start, align 8, !dbg !3261
  %54 = load %struct.record*, %struct.record** %__new_finish, align 8, !dbg !3262
  %55 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3263
  %call48 = invoke dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %55)
          to label %invoke.cont47 unwind label %lpad44, !dbg !3263

invoke.cont47:                                    ; preds = %if.else46
  invoke void @_ZSt8_DestroyIP6recordS0_EvT_S2_RSaIT0_E(%struct.record* %53, %struct.record* %54, %"class.std::allocator"* dereferenceable(1) %call48)
          to label %invoke.cont49 unwind label %lpad44, !dbg !3264

invoke.cont49:                                    ; preds = %invoke.cont47
  br label %if.end

if.end:                                           ; preds = %invoke.cont49, %invoke.cont45
  %56 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3265
  %57 = load %struct.record*, %struct.record** %__new_start, align 8, !dbg !3266
  %58 = load i64, i64* %__len, align 8, !dbg !3267
  invoke void @_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base"* %56, %struct.record* %57, i64 %58)
          to label %invoke.cont50 unwind label %lpad44, !dbg !3265

invoke.cont50:                                    ; preds = %if.end
  invoke void @__cxa_rethrow() #18
          to label %unreachable unwind label %lpad44, !dbg !3268

invoke.cont51:                                    ; preds = %lpad44
  br label %eh.resume, !dbg !3269

try.cont:                                         ; preds = %invoke.cont39
  %59 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3271
  %_M_impl52 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %59, i32 0, i32 0, !dbg !3271
  %_M_start53 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl52, i32 0, i32 0, !dbg !3272
  %60 = load %struct.record*, %struct.record** %_M_start53, align 8, !dbg !3272
  %61 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3273
  %_M_impl54 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %61, i32 0, i32 0, !dbg !3273
  %_M_finish55 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl54, i32 0, i32 1, !dbg !3274
  %62 = load %struct.record*, %struct.record** %_M_finish55, align 8, !dbg !3274
  %63 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3275
  %call56 = call dereferenceable(1) %"class.std::allocator"* @_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %63), !dbg !3275
  call void @_ZSt8_DestroyIP6recordS0_EvT_S2_RSaIT0_E(%struct.record* %60, %struct.record* %62, %"class.std::allocator"* dereferenceable(1) %call56), !dbg !3276
  %64 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3277
  %65 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3278
  %_M_impl57 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %65, i32 0, i32 0, !dbg !3278
  %_M_start58 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl57, i32 0, i32 0, !dbg !3279
  %66 = load %struct.record*, %struct.record** %_M_start58, align 8, !dbg !3279
  %67 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3280
  %_M_impl59 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %67, i32 0, i32 0, !dbg !3280
  %_M_end_of_storage60 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl59, i32 0, i32 2, !dbg !3281
  %68 = load %struct.record*, %struct.record** %_M_end_of_storage60, align 8, !dbg !3281
  %69 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3282
  %_M_impl61 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %69, i32 0, i32 0, !dbg !3282
  %_M_start62 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl61, i32 0, i32 0, !dbg !3283
  %70 = load %struct.record*, %struct.record** %_M_start62, align 8, !dbg !3283
  %sub.ptr.lhs.cast = ptrtoint %struct.record* %68 to i64, !dbg !3284
  %sub.ptr.rhs.cast = ptrtoint %struct.record* %70 to i64, !dbg !3284
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !3284
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 60, !dbg !3284
  call void @_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m(%"struct.std::_Vector_base"* %64, %struct.record* %66, i64 %sub.ptr.div), !dbg !3277
  %71 = load %struct.record*, %struct.record** %__new_start, align 8, !dbg !3285
  %72 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3286
  %_M_impl63 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %72, i32 0, i32 0, !dbg !3286
  %_M_start64 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl63, i32 0, i32 0, !dbg !3287
  store %struct.record* %71, %struct.record** %_M_start64, align 8, !dbg !3288
  %73 = load %struct.record*, %struct.record** %__new_finish, align 8, !dbg !3289
  %74 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3290
  %_M_impl65 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %74, i32 0, i32 0, !dbg !3290
  %_M_finish66 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl65, i32 0, i32 1, !dbg !3291
  store %struct.record* %73, %struct.record** %_M_finish66, align 8, !dbg !3292
  %75 = load %struct.record*, %struct.record** %__new_start, align 8, !dbg !3293
  %76 = load i64, i64* %__len, align 8, !dbg !3294
  %add.ptr67 = getelementptr inbounds %struct.record, %struct.record* %75, i64 %76, !dbg !3295
  %77 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3296
  %_M_impl68 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %77, i32 0, i32 0, !dbg !3296
  %_M_end_of_storage69 = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl68, i32 0, i32 2, !dbg !3297
  store %struct.record* %add.ptr67, %struct.record** %_M_end_of_storage69, align 8, !dbg !3298
  br label %if.end70

if.end70:                                         ; preds = %try.cont, %if.then
  ret void, !dbg !3299

eh.resume:                                        ; preds = %invoke.cont51
  %exn71 = load i8*, i8** %exn.slot, align 8, !dbg !3301
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !3301
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn71, 0, !dbg !3301
  %lpad.val72 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !3301
  resume { i8*, i32 } %lpad.val72, !dbg !3301

terminate.lpad:                                   ; preds = %lpad44
  %78 = landingpad { i8*, i32 }
          catch i8* null, !dbg !3303
  %79 = extractvalue { i8*, i32 } %78, 0, !dbg !3303
  call void @__clang_call_terminate(i8* %79) #15, !dbg !3303
  unreachable, !dbg !3303

unreachable:                                      ; preds = %invoke.cont50
  unreachable
}

; Function Attrs: uwtable
define linkonce_odr %struct.record* @_ZNSt6vectorI6recordSaIS0_EE3endEv(%"class.std::vector"* %this) #0 comdat align 2 !dbg !3305 {
entry:
  %retval = alloca %"class.__gnu_cxx::__normal_iterator.5", align 8
  %this.addr = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector"** %this.addr, metadata !3306, metadata !1315), !dbg !3307
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3308
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0, !dbg !3308
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 1, !dbg !3309
  call void @_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator.5"* %retval, %struct.record** dereferenceable(8) %_M_finish), !dbg !3310
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %retval, i32 0, i32 0, !dbg !3311
  %1 = load %struct.record*, %struct.record** %coerce.dive, align 8, !dbg !3311
  ret %struct.record* %1, !dbg !3311
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI6recordE9constructEPS1_RKS1_(%"class.__gnu_cxx::new_allocator"* %this, %struct.record* %__p, %struct.record* dereferenceable(60) %__val) #3 comdat align 2 !dbg !3312 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  %__val.addr = alloca %struct.record*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator"** %this.addr, metadata !3313, metadata !1315), !dbg !3314
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__p.addr, metadata !3315, metadata !1315), !dbg !3316
  store %struct.record* %__val, %struct.record** %__val.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__val.addr, metadata !3317, metadata !1315), !dbg !3318
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %0 = load %struct.record*, %struct.record** %__p.addr, align 8, !dbg !3319
  %1 = bitcast %struct.record* %0 to i8*, !dbg !3319
  %2 = bitcast i8* %1 to %struct.record*, !dbg !3320
  %3 = load %struct.record*, %struct.record** %__val.addr, align 8, !dbg !3321
  %4 = bitcast %struct.record* %2 to i8*, !dbg !3322
  %5 = bitcast %struct.record* %3 to i8*, !dbg !3322
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 60, i32 4, i1 false), !dbg !3322
  ret void, !dbg !3323
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.record* @_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #10 comdat !dbg !3324 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !3330, metadata !1315), !dbg !3331
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !3332, metadata !1315), !dbg !3333
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__result.addr, metadata !3334, metadata !1315), !dbg !3335
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3336
  %call = call %struct.record* @_ZSt12__miter_baseIP6recordENSt11_Miter_baseIT_E13iterator_typeES3_(%struct.record* %0), !dbg !3337
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !3338
  %call1 = call %struct.record* @_ZSt12__miter_baseIP6recordENSt11_Miter_baseIT_E13iterator_typeES3_(%struct.record* %1), !dbg !3339
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3341
  %call2 = call %struct.record* @_ZSt23__copy_move_backward_a2ILb0EP6recordS1_ET1_T0_S3_S2_(%struct.record* %call, %struct.record* %call1, %struct.record* %2), !dbg !3342
  ret %struct.record* %call2, !dbg !3343
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(8) %struct.record** @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.5"* %this) #3 comdat align 2 !dbg !3344 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::__normal_iterator.5"*, align 8
  store %"class.__gnu_cxx::__normal_iterator.5"* %this, %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, metadata !3345, metadata !1315), !dbg !3347
  %this1 = load %"class.__gnu_cxx::__normal_iterator.5"*, %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, align 8
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %this1, i32 0, i32 0, !dbg !3348
  ret %struct.record** %_M_current, !dbg !3349
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(60) %struct.record* @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEdeEv(%"class.__gnu_cxx::__normal_iterator.5"* %this) #3 comdat align 2 !dbg !3350 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::__normal_iterator.5"*, align 8
  store %"class.__gnu_cxx::__normal_iterator.5"* %this, %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, metadata !3351, metadata !1315), !dbg !3352
  %this1 = load %"class.__gnu_cxx::__normal_iterator.5"*, %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, align 8
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %this1, i32 0, i32 0, !dbg !3353
  %0 = load %struct.record*, %struct.record** %_M_current, align 8, !dbg !3353
  ret %struct.record* %0, !dbg !3354
}

; Function Attrs: uwtable
define linkonce_odr i64 @_ZNKSt6vectorI6recordSaIS0_EE12_M_check_lenEmPKc(%"class.std::vector"* %this, i64 %__n, i8* %__s) #0 comdat align 2 !dbg !3355 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  %__n.addr = alloca i64, align 8
  %__s.addr = alloca i8*, align 8
  %__len = alloca i64, align 8
  %ref.tmp = alloca i64, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector"** %this.addr, metadata !3356, metadata !1315), !dbg !3358
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !3359, metadata !1315), !dbg !3360
  store i8* %__s, i8** %__s.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %__s.addr, metadata !3361, metadata !1315), !dbg !3362
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %call = call i64 @_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv(%"class.std::vector"* %this1), !dbg !3363
  %call2 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE4sizeEv(%"class.std::vector"* %this1), !dbg !3365
  %sub = sub i64 %call, %call2, !dbg !3367
  %0 = load i64, i64* %__n.addr, align 8, !dbg !3368
  %cmp = icmp ult i64 %sub, %0, !dbg !3369
  br i1 %cmp, label %if.then, label %if.end, !dbg !3370

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %__s.addr, align 8, !dbg !3371
  call void @_ZSt20__throw_length_errorPKc(i8* %1) #18, !dbg !3372
  unreachable, !dbg !3372

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i64* %__len, metadata !3373, metadata !1315), !dbg !3374
  %call3 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE4sizeEv(%"class.std::vector"* %this1), !dbg !3375
  %call4 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE4sizeEv(%"class.std::vector"* %this1), !dbg !3376
  store i64 %call4, i64* %ref.tmp, align 8, !dbg !3378
  %call5 = call dereferenceable(8) i64* @_ZSt3maxImERKT_S2_S2_(i64* dereferenceable(8) %ref.tmp, i64* dereferenceable(8) %__n.addr), !dbg !3379
  %2 = load i64, i64* %call5, align 8, !dbg !3381
  %add = add i64 %call3, %2, !dbg !3382
  store i64 %add, i64* %__len, align 8, !dbg !3374
  %3 = load i64, i64* %__len, align 8, !dbg !3383
  %call6 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE4sizeEv(%"class.std::vector"* %this1), !dbg !3384
  %cmp7 = icmp ult i64 %3, %call6, !dbg !3385
  br i1 %cmp7, label %cond.true, label %lor.lhs.false, !dbg !3386

lor.lhs.false:                                    ; preds = %if.end
  %4 = load i64, i64* %__len, align 8, !dbg !3387
  %call8 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv(%"class.std::vector"* %this1), !dbg !3388
  %cmp9 = icmp ugt i64 %4, %call8, !dbg !3389
  br i1 %cmp9, label %cond.true, label %cond.false, !dbg !3390

cond.true:                                        ; preds = %lor.lhs.false, %if.end
  %call10 = call i64 @_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv(%"class.std::vector"* %this1), !dbg !3391
  br label %cond.end, !dbg !3392

cond.false:                                       ; preds = %lor.lhs.false
  %5 = load i64, i64* %__len, align 8, !dbg !3393
  br label %cond.end, !dbg !3395

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %call10, %cond.true ], [ %5, %cond.false ], !dbg !3396
  ret i64 %cond, !dbg !3398
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i64 @_ZN9__gnu_cxxmiIP6recordSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_(%"class.__gnu_cxx::__normal_iterator.5"* dereferenceable(8) %__lhs, %"class.__gnu_cxx::__normal_iterator.5"* dereferenceable(8) %__rhs) #11 comdat !dbg !3399 {
entry:
  %__lhs.addr = alloca %"class.__gnu_cxx::__normal_iterator.5"*, align 8
  %__rhs.addr = alloca %"class.__gnu_cxx::__normal_iterator.5"*, align 8
  store %"class.__gnu_cxx::__normal_iterator.5"* %__lhs, %"class.__gnu_cxx::__normal_iterator.5"** %__lhs.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::__normal_iterator.5"** %__lhs.addr, metadata !3403, metadata !1315), !dbg !3404
  store %"class.__gnu_cxx::__normal_iterator.5"* %__rhs, %"class.__gnu_cxx::__normal_iterator.5"** %__rhs.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::__normal_iterator.5"** %__rhs.addr, metadata !3405, metadata !1315), !dbg !3406
  %0 = load %"class.__gnu_cxx::__normal_iterator.5"*, %"class.__gnu_cxx::__normal_iterator.5"** %__lhs.addr, align 8, !dbg !3407
  %call = call dereferenceable(8) %struct.record** @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.5"* %0), !dbg !3408
  %1 = load %struct.record*, %struct.record** %call, align 8, !dbg !3408
  %2 = load %"class.__gnu_cxx::__normal_iterator.5"*, %"class.__gnu_cxx::__normal_iterator.5"** %__rhs.addr, align 8, !dbg !3409
  %call1 = call dereferenceable(8) %struct.record** @_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv(%"class.__gnu_cxx::__normal_iterator.5"* %2), !dbg !3410
  %3 = load %struct.record*, %struct.record** %call1, align 8, !dbg !3412
  %sub.ptr.lhs.cast = ptrtoint %struct.record* %1 to i64, !dbg !3413
  %sub.ptr.rhs.cast = ptrtoint %struct.record* %3 to i64, !dbg !3413
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !3413
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 60, !dbg !3413
  ret i64 %sub.ptr.div, !dbg !3414
}

; Function Attrs: uwtable
define linkonce_odr %struct.record* @_ZNSt6vectorI6recordSaIS0_EE5beginEv(%"class.std::vector"* %this) #0 comdat align 2 !dbg !3415 {
entry:
  %retval = alloca %"class.__gnu_cxx::__normal_iterator.5", align 8
  %this.addr = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector"** %this.addr, metadata !3416, metadata !1315), !dbg !3417
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3418
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0, !dbg !3418
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 0, !dbg !3419
  call void @_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator.5"* %retval, %struct.record** dereferenceable(8) %_M_start), !dbg !3420
  %coerce.dive = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %retval, i32 0, i32 0, !dbg !3421
  %1 = load %struct.record*, %struct.record** %coerce.dive, align 8, !dbg !3421
  ret %struct.record* %1, !dbg !3421
}

; Function Attrs: uwtable
define linkonce_odr %struct.record* @_ZNSt12_Vector_baseI6recordSaIS0_EE11_M_allocateEm(%"struct.std::_Vector_base"* %this, i64 %__n) #0 comdat align 2 !dbg !3422 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base"*, align 8
  %__n.addr = alloca i64, align 8
  store %"struct.std::_Vector_base"* %this, %"struct.std::_Vector_base"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base"** %this.addr, metadata !3423, metadata !1315), !dbg !3424
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !3425, metadata !1315), !dbg !3426
  %this1 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %this.addr, align 8
  %0 = load i64, i64* %__n.addr, align 8, !dbg !3427
  %cmp = icmp ne i64 %0, 0, !dbg !3428
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !3427

cond.true:                                        ; preds = %entry
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0, !dbg !3429
  %1 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl to %"class.std::allocator"*, !dbg !3429
  %2 = load i64, i64* %__n.addr, align 8, !dbg !3431
  %call = call %struct.record* @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m(%"class.std::allocator"* dereferenceable(1) %1, i64 %2), !dbg !3432
  br label %cond.end, !dbg !3433

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !3434

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.record* [ %call, %cond.true ], [ null, %cond.false ], !dbg !3436
  ret %struct.record* %cond, !dbg !3438
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.record* @_ZSt34__uninitialized_move_if_noexcept_aIP6recordS1_SaIS0_EET0_T_S4_S3_RT1_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result, %"class.std::allocator"* dereferenceable(1) %__alloc) #10 comdat !dbg !3439 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  %__alloc.addr = alloca %"class.std::allocator"*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !3445, metadata !1315), !dbg !3446
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !3447, metadata !1315), !dbg !3448
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__result.addr, metadata !3449, metadata !1315), !dbg !3450
  store %"class.std::allocator"* %__alloc, %"class.std::allocator"** %__alloc.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %__alloc.addr, metadata !3451, metadata !1315), !dbg !3452
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3453
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !3454
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3455
  %3 = load %"class.std::allocator"*, %"class.std::allocator"** %__alloc.addr, align 8, !dbg !3456
  %call = call %struct.record* @_ZSt22__uninitialized_copy_aIP6recordS1_S0_ET0_T_S3_S2_RSaIT1_E(%struct.record* %0, %struct.record* %1, %struct.record* %2, %"class.std::allocator"* dereferenceable(1) %3), !dbg !3457
  ret %struct.record* %call, !dbg !3458
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE7destroyERS2_PS1_(%"class.std::allocator"* dereferenceable(1) %__a, %struct.record* %__p) #0 comdat align 2 !dbg !3459 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %__a.addr, metadata !3460, metadata !1315), !dbg !3461
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__p.addr, metadata !3462, metadata !1315), !dbg !3463
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8, !dbg !3464
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*, !dbg !3464
  %2 = load %struct.record*, %struct.record** %__p.addr, align 8, !dbg !3465
  call void @_ZN9__gnu_cxx13new_allocatorI6recordE7destroyEPS1_(%"class.__gnu_cxx::new_allocator"* %1, %struct.record* %2), !dbg !3466
  ret void, !dbg !3467
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.record* @_ZSt23__copy_move_backward_a2ILb0EP6recordS1_ET1_T0_S3_S2_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #10 comdat !dbg !3468 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !3470, metadata !1315), !dbg !3471
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !3472, metadata !1315), !dbg !3473
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__result.addr, metadata !3474, metadata !1315), !dbg !3475
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3476
  %call = call %struct.record* @_ZSt12__niter_baseIP6recordENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.record* %0), !dbg !3477
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !3478
  %call1 = call %struct.record* @_ZSt12__niter_baseIP6recordENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.record* %1), !dbg !3479
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3481
  %call2 = call %struct.record* @_ZSt12__niter_baseIP6recordENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.record* %2), !dbg !3482
  %call3 = call %struct.record* @_ZSt22__copy_move_backward_aILb0EP6recordS1_ET1_T0_S3_S2_(%struct.record* %call, %struct.record* %call1, %struct.record* %call2), !dbg !3483
  ret %struct.record* %call3, !dbg !3484
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr %struct.record* @_ZSt12__miter_baseIP6recordENSt11_Miter_baseIT_E13iterator_typeES3_(%struct.record* %__it) #11 comdat !dbg !3485 {
entry:
  %__it.addr = alloca %struct.record*, align 8
  store %struct.record* %__it, %struct.record** %__it.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__it.addr, metadata !3493, metadata !1315), !dbg !3494
  %0 = load %struct.record*, %struct.record** %__it.addr, align 8, !dbg !3495
  %call = call %struct.record* @_ZNSt10_Iter_baseIP6recordLb0EE7_S_baseES1_(%struct.record* %0), !dbg !3496
  ret %struct.record* %call, !dbg !3497
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.record* @_ZSt22__copy_move_backward_aILb0EP6recordS1_ET1_T0_S3_S2_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #10 comdat !dbg !3498 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  %__simple = alloca i8, align 1
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !3499, metadata !1315), !dbg !3500
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !3501, metadata !1315), !dbg !3502
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__result.addr, metadata !3503, metadata !1315), !dbg !3504
  call void @llvm.dbg.declare(metadata i8* %__simple, metadata !3505, metadata !1315), !dbg !3506
  store i8 1, i8* %__simple, align 1, !dbg !3506
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3507
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !3508
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3509
  %call = call %struct.record* @_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI6recordEEPT_PKS4_S7_S5_(%struct.record* %0, %struct.record* %1, %struct.record* %2), !dbg !3510
  ret %struct.record* %call, !dbg !3511
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.record* @_ZSt12__niter_baseIP6recordENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.record* %__it) #10 comdat !dbg !3512 {
entry:
  %__it.addr = alloca %struct.record*, align 8
  store %struct.record* %__it, %struct.record** %__it.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__it.addr, metadata !3513, metadata !1315), !dbg !3514
  %0 = load %struct.record*, %struct.record** %__it.addr, align 8, !dbg !3515
  %call = call %struct.record* @_ZNSt10_Iter_baseIP6recordLb0EE7_S_baseES1_(%struct.record* %0), !dbg !3516
  ret %struct.record* %call, !dbg !3517
}

; Function Attrs: nounwind uwtable
define linkonce_odr %struct.record* @_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI6recordEEPT_PKS4_S7_S5_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #3 comdat align 2 !dbg !3518 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  %_Num = alloca i64, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !3522, metadata !1315), !dbg !3523
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !3524, metadata !1315), !dbg !3525
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__result.addr, metadata !3526, metadata !1315), !dbg !3527
  call void @llvm.dbg.declare(metadata i64* %_Num, metadata !3528, metadata !1315), !dbg !3529
  %0 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !3530
  %1 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3531
  %sub.ptr.lhs.cast = ptrtoint %struct.record* %0 to i64, !dbg !3532
  %sub.ptr.rhs.cast = ptrtoint %struct.record* %1 to i64, !dbg !3532
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !3532
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 60, !dbg !3532
  store i64 %sub.ptr.div, i64* %_Num, align 8, !dbg !3529
  %2 = load i64, i64* %_Num, align 8, !dbg !3533
  %tobool = icmp ne i64 %2, 0, !dbg !3533
  br i1 %tobool, label %if.then, label %if.end, !dbg !3535

if.then:                                          ; preds = %entry
  %3 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3536
  %4 = load i64, i64* %_Num, align 8, !dbg !3537
  %idx.neg = sub i64 0, %4, !dbg !3538
  %add.ptr = getelementptr inbounds %struct.record, %struct.record* %3, i64 %idx.neg, !dbg !3538
  %5 = bitcast %struct.record* %add.ptr to i8*, !dbg !3539
  %6 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3540
  %7 = bitcast %struct.record* %6 to i8*, !dbg !3539
  %8 = load i64, i64* %_Num, align 8, !dbg !3541
  %mul = mul i64 60, %8, !dbg !3542
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %5, i8* %7, i64 %mul, i32 4, i1 false), !dbg !3539
  br label %if.end, !dbg !3539

if.end:                                           ; preds = %if.then, %entry
  %9 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3543
  %10 = load i64, i64* %_Num, align 8, !dbg !3544
  %idx.neg1 = sub i64 0, %10, !dbg !3545
  %add.ptr2 = getelementptr inbounds %struct.record, %struct.record* %9, i64 %idx.neg1, !dbg !3545
  ret %struct.record* %add.ptr2, !dbg !3546
}

; Function Attrs: nounwind uwtable
define linkonce_odr %struct.record* @_ZNSt10_Iter_baseIP6recordLb0EE7_S_baseES1_(%struct.record* %__it) #3 comdat align 2 !dbg !3547 {
entry:
  %__it.addr = alloca %struct.record*, align 8
  store %struct.record* %__it, %struct.record** %__it.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__it.addr, metadata !3548, metadata !1315), !dbg !3549
  %0 = load %struct.record*, %struct.record** %__it.addr, align 8, !dbg !3550
  ret %struct.record* %0, !dbg !3551
}

; Function Attrs: uwtable
define linkonce_odr i64 @_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv(%"class.std::vector"* %this) #0 comdat align 2 !dbg !3552 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector"** %this.addr, metadata !3553, metadata !1315), !dbg !3554
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3555
  %call = call dereferenceable(1) %"class.std::allocator"* @_ZNKSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %0), !dbg !3555
  %call2 = call i64 @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8max_sizeERKS2_(%"class.std::allocator"* dereferenceable(1) %call), !dbg !3556
  ret i64 %call2, !dbg !3558
}

; Function Attrs: nounwind uwtable
define linkonce_odr i64 @_ZNKSt6vectorI6recordSaIS0_EE4sizeEv(%"class.std::vector"* %this) #3 comdat align 2 !dbg !3559 {
entry:
  %this.addr = alloca %"class.std::vector"*, align 8
  store %"class.std::vector"* %this, %"class.std::vector"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::vector"** %this.addr, metadata !3560, metadata !1315), !dbg !3561
  %this1 = load %"class.std::vector"*, %"class.std::vector"** %this.addr, align 8
  %0 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3562
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %0, i32 0, i32 0, !dbg !3562
  %_M_finish = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl, i32 0, i32 1, !dbg !3563
  %1 = load %struct.record*, %struct.record** %_M_finish, align 8, !dbg !3563
  %2 = bitcast %"class.std::vector"* %this1 to %"struct.std::_Vector_base"*, !dbg !3564
  %_M_impl2 = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %2, i32 0, i32 0, !dbg !3564
  %_M_start = getelementptr inbounds %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl", %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl2, i32 0, i32 0, !dbg !3565
  %3 = load %struct.record*, %struct.record** %_M_start, align 8, !dbg !3565
  %sub.ptr.lhs.cast = ptrtoint %struct.record* %1 to i64, !dbg !3566
  %sub.ptr.rhs.cast = ptrtoint %struct.record* %3 to i64, !dbg !3566
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !3566
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 60, !dbg !3566
  ret i64 %sub.ptr.div, !dbg !3567
}

; Function Attrs: nounwind uwtable
define linkonce_odr i64 @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8max_sizeERKS2_(%"class.std::allocator"* dereferenceable(1) %__a) #3 comdat align 2 !dbg !3568 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %__a.addr, metadata !3569, metadata !1315), !dbg !3570
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8, !dbg !3571
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*, !dbg !3571
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorI6recordE8max_sizeEv(%"class.__gnu_cxx::new_allocator"* %1) #16, !dbg !3572
  ret i64 %call, !dbg !3573
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(1) %"class.std::allocator"* @_ZNKSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv(%"struct.std::_Vector_base"* %this) #3 comdat align 2 !dbg !3574 {
entry:
  %this.addr = alloca %"struct.std::_Vector_base"*, align 8
  store %"struct.std::_Vector_base"* %this, %"struct.std::_Vector_base"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"struct.std::_Vector_base"** %this.addr, metadata !3575, metadata !1315), !dbg !3577
  %this1 = load %"struct.std::_Vector_base"*, %"struct.std::_Vector_base"** %this.addr, align 8
  %_M_impl = getelementptr inbounds %"struct.std::_Vector_base", %"struct.std::_Vector_base"* %this1, i32 0, i32 0, !dbg !3578
  %0 = bitcast %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl"* %_M_impl to %"class.std::allocator"*, !dbg !3579
  ret %"class.std::allocator"* %0, !dbg !3580
}

; Function Attrs: nounwind uwtable
define linkonce_odr i64 @_ZNK9__gnu_cxx13new_allocatorI6recordE8max_sizeEv(%"class.__gnu_cxx::new_allocator"* %this) #3 comdat align 2 !dbg !3581 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator"** %this.addr, metadata !3582, metadata !1315), !dbg !3584
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  ret i64 307445734561825860, !dbg !3585
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEC2ERKS2_(%"class.__gnu_cxx::__normal_iterator.5"* %this, %struct.record** dereferenceable(8) %__i) unnamed_addr #3 comdat align 2 !dbg !3586 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::__normal_iterator.5"*, align 8
  %__i.addr = alloca %struct.record**, align 8
  store %"class.__gnu_cxx::__normal_iterator.5"* %this, %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, metadata !3587, metadata !1315), !dbg !3589
  store %struct.record** %__i, %struct.record*** %__i.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record*** %__i.addr, metadata !3590, metadata !1315), !dbg !3591
  %this1 = load %"class.__gnu_cxx::__normal_iterator.5"*, %"class.__gnu_cxx::__normal_iterator.5"** %this.addr, align 8
  %_M_current = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator.5", %"class.__gnu_cxx::__normal_iterator.5"* %this1, i32 0, i32 0, !dbg !3592
  %0 = load %struct.record**, %struct.record*** %__i.addr, align 8, !dbg !3593
  %1 = load %struct.record*, %struct.record** %0, align 8, !dbg !3593
  store %struct.record* %1, %struct.record** %_M_current, align 8, !dbg !3592
  ret void, !dbg !3594
}

; Function Attrs: uwtable
define linkonce_odr %struct.record* @_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m(%"class.std::allocator"* dereferenceable(1) %__a, i64 %__n) #0 comdat align 2 !dbg !3595 {
entry:
  %__a.addr = alloca %"class.std::allocator"*, align 8
  %__n.addr = alloca i64, align 8
  store %"class.std::allocator"* %__a, %"class.std::allocator"** %__a.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %__a.addr, metadata !3596, metadata !1315), !dbg !3597
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !3598, metadata !1315), !dbg !3599
  %0 = load %"class.std::allocator"*, %"class.std::allocator"** %__a.addr, align 8, !dbg !3600
  %1 = bitcast %"class.std::allocator"* %0 to %"class.__gnu_cxx::new_allocator"*, !dbg !3600
  %2 = load i64, i64* %__n.addr, align 8, !dbg !3601
  %call = call %struct.record* @_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv(%"class.__gnu_cxx::new_allocator"* %1, i64 %2, i8* null), !dbg !3602
  ret %struct.record* %call, !dbg !3603
}

; Function Attrs: uwtable
define linkonce_odr %struct.record* @_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv(%"class.__gnu_cxx::new_allocator"* %this, i64 %__n, i8*) #0 comdat align 2 !dbg !3604 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__n.addr = alloca i64, align 8
  %.addr = alloca i8*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator"** %this.addr, metadata !3605, metadata !1315), !dbg !3606
  store i64 %__n, i64* %__n.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %__n.addr, metadata !3607, metadata !1315), !dbg !3608
  store i8* %0, i8** %.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr, metadata !3609, metadata !1315), !dbg !3610
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %1 = load i64, i64* %__n.addr, align 8, !dbg !3611
  %call = call i64 @_ZNK9__gnu_cxx13new_allocatorI6recordE8max_sizeEv(%"class.__gnu_cxx::new_allocator"* %this1) #16, !dbg !3613
  %cmp = icmp ugt i64 %1, %call, !dbg !3614
  br i1 %cmp, label %if.then, label %if.end, !dbg !3615

if.then:                                          ; preds = %entry
  call void @_ZSt17__throw_bad_allocv() #18, !dbg !3616
  unreachable, !dbg !3616

if.end:                                           ; preds = %entry
  %2 = load i64, i64* %__n.addr, align 8, !dbg !3617
  %mul = mul i64 %2, 60, !dbg !3618
  %call2 = call i8* @_Znwm(i64 %mul), !dbg !3619
  %3 = bitcast i8* %call2 to %struct.record*, !dbg !3620
  ret %struct.record* %3, !dbg !3621
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.record* @_ZSt22__uninitialized_copy_aIP6recordS1_S0_ET0_T_S3_S2_RSaIT1_E(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result, %"class.std::allocator"* dereferenceable(1)) #10 comdat !dbg !3622 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  %.addr = alloca %"class.std::allocator"*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !3624, metadata !1315), !dbg !3625
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !3626, metadata !1315), !dbg !3627
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__result.addr, metadata !3628, metadata !1315), !dbg !3629
  store %"class.std::allocator"* %0, %"class.std::allocator"** %.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.std::allocator"** %.addr, metadata !3630, metadata !1315), !dbg !3631
  %1 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3632
  %2 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !3633
  %3 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3634
  %call = call %struct.record* @_ZSt18uninitialized_copyIP6recordS1_ET0_T_S3_S2_(%struct.record* %1, %struct.record* %2, %struct.record* %3), !dbg !3635
  ret %struct.record* %call, !dbg !3636
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.record* @_ZSt18uninitialized_copyIP6recordS1_ET0_T_S3_S2_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #10 comdat !dbg !3637 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  %__assignable = alloca i8, align 1
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !3639, metadata !1315), !dbg !3640
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !3641, metadata !1315), !dbg !3642
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__result.addr, metadata !3643, metadata !1315), !dbg !3644
  call void @llvm.dbg.declare(metadata i8* %__assignable, metadata !3645, metadata !1315), !dbg !3646
  store i8 1, i8* %__assignable, align 1, !dbg !3646
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3647
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !3648
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3649
  %call = call %struct.record* @_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP6recordS3_EET0_T_S5_S4_(%struct.record* %0, %struct.record* %1, %struct.record* %2), !dbg !3650
  ret %struct.record* %call, !dbg !3651
}

; Function Attrs: uwtable
define linkonce_odr %struct.record* @_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP6recordS3_EET0_T_S5_S4_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #0 comdat align 2 !dbg !3652 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !3654, metadata !1315), !dbg !3655
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !3656, metadata !1315), !dbg !3657
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__result.addr, metadata !3658, metadata !1315), !dbg !3659
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3660
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !3661
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3662
  %call = call %struct.record* @_ZSt4copyIP6recordS1_ET0_T_S3_S2_(%struct.record* %0, %struct.record* %1, %struct.record* %2), !dbg !3663
  ret %struct.record* %call, !dbg !3664
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.record* @_ZSt4copyIP6recordS1_ET0_T_S3_S2_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #10 comdat !dbg !3665 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !3669, metadata !1315), !dbg !3670
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !3671, metadata !1315), !dbg !3672
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__result.addr, metadata !3673, metadata !1315), !dbg !3674
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3675
  %call = call %struct.record* @_ZSt12__miter_baseIP6recordENSt11_Miter_baseIT_E13iterator_typeES3_(%struct.record* %0), !dbg !3676
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !3677
  %call1 = call %struct.record* @_ZSt12__miter_baseIP6recordENSt11_Miter_baseIT_E13iterator_typeES3_(%struct.record* %1), !dbg !3678
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3680
  %call2 = call %struct.record* @_ZSt14__copy_move_a2ILb0EP6recordS1_ET1_T0_S3_S2_(%struct.record* %call, %struct.record* %call1, %struct.record* %2), !dbg !3681
  ret %struct.record* %call2, !dbg !3682
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.record* @_ZSt14__copy_move_a2ILb0EP6recordS1_ET1_T0_S3_S2_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #10 comdat !dbg !3683 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !3685, metadata !1315), !dbg !3686
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !3687, metadata !1315), !dbg !3688
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__result.addr, metadata !3689, metadata !1315), !dbg !3690
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3691
  %call = call %struct.record* @_ZSt12__niter_baseIP6recordENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.record* %0), !dbg !3692
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !3693
  %call1 = call %struct.record* @_ZSt12__niter_baseIP6recordENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.record* %1), !dbg !3694
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3695
  %call2 = call %struct.record* @_ZSt12__niter_baseIP6recordENSt11_Niter_baseIT_E13iterator_typeES3_(%struct.record* %2), !dbg !3696
  %call3 = call %struct.record* @_ZSt13__copy_move_aILb0EP6recordS1_ET1_T0_S3_S2_(%struct.record* %call, %struct.record* %call1, %struct.record* %call2), !dbg !3697
  ret %struct.record* %call3, !dbg !3699
}

; Function Attrs: inlinehint uwtable
define linkonce_odr %struct.record* @_ZSt13__copy_move_aILb0EP6recordS1_ET1_T0_S3_S2_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #10 comdat !dbg !3700 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  %__simple = alloca i8, align 1
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !3701, metadata !1315), !dbg !3702
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !3703, metadata !1315), !dbg !3704
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__result.addr, metadata !3705, metadata !1315), !dbg !3706
  call void @llvm.dbg.declare(metadata i8* %__simple, metadata !3707, metadata !1315), !dbg !3708
  store i8 1, i8* %__simple, align 1, !dbg !3708
  %0 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3709
  %1 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !3710
  %2 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3711
  %call = call %struct.record* @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI6recordEEPT_PKS4_S7_S5_(%struct.record* %0, %struct.record* %1, %struct.record* %2), !dbg !3712
  ret %struct.record* %call, !dbg !3713
}

; Function Attrs: nounwind uwtable
define linkonce_odr %struct.record* @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI6recordEEPT_PKS4_S7_S5_(%struct.record* %__first, %struct.record* %__last, %struct.record* %__result) #3 comdat align 2 !dbg !3714 {
entry:
  %__first.addr = alloca %struct.record*, align 8
  %__last.addr = alloca %struct.record*, align 8
  %__result.addr = alloca %struct.record*, align 8
  %_Num = alloca i64, align 8
  store %struct.record* %__first, %struct.record** %__first.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__first.addr, metadata !3716, metadata !1315), !dbg !3717
  store %struct.record* %__last, %struct.record** %__last.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__last.addr, metadata !3718, metadata !1315), !dbg !3719
  store %struct.record* %__result, %struct.record** %__result.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__result.addr, metadata !3720, metadata !1315), !dbg !3721
  call void @llvm.dbg.declare(metadata i64* %_Num, metadata !3722, metadata !1315), !dbg !3723
  %0 = load %struct.record*, %struct.record** %__last.addr, align 8, !dbg !3724
  %1 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3725
  %sub.ptr.lhs.cast = ptrtoint %struct.record* %0 to i64, !dbg !3726
  %sub.ptr.rhs.cast = ptrtoint %struct.record* %1 to i64, !dbg !3726
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !3726
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 60, !dbg !3726
  store i64 %sub.ptr.div, i64* %_Num, align 8, !dbg !3723
  %2 = load i64, i64* %_Num, align 8, !dbg !3727
  %tobool = icmp ne i64 %2, 0, !dbg !3727
  br i1 %tobool, label %if.then, label %if.end, !dbg !3729

if.then:                                          ; preds = %entry
  %3 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3730
  %4 = bitcast %struct.record* %3 to i8*, !dbg !3731
  %5 = load %struct.record*, %struct.record** %__first.addr, align 8, !dbg !3732
  %6 = bitcast %struct.record* %5 to i8*, !dbg !3731
  %7 = load i64, i64* %_Num, align 8, !dbg !3733
  %mul = mul i64 60, %7, !dbg !3734
  call void @llvm.memmove.p0i8.p0i8.i64(i8* %4, i8* %6, i64 %mul, i32 4, i1 false), !dbg !3731
  br label %if.end, !dbg !3731

if.end:                                           ; preds = %if.then, %entry
  %8 = load %struct.record*, %struct.record** %__result.addr, align 8, !dbg !3735
  %9 = load i64, i64* %_Num, align 8, !dbg !3736
  %add.ptr = getelementptr inbounds %struct.record, %struct.record* %8, i64 %9, !dbg !3737
  ret %struct.record* %add.ptr, !dbg !3738
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN9__gnu_cxx13new_allocatorI6recordE7destroyEPS1_(%"class.__gnu_cxx::new_allocator"* %this, %struct.record* %__p) #3 comdat align 2 !dbg !3739 {
entry:
  %this.addr = alloca %"class.__gnu_cxx::new_allocator"*, align 8
  %__p.addr = alloca %struct.record*, align 8
  store %"class.__gnu_cxx::new_allocator"* %this, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %"class.__gnu_cxx::new_allocator"** %this.addr, metadata !3740, metadata !1315), !dbg !3741
  store %struct.record* %__p, %struct.record** %__p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %__p.addr, metadata !3742, metadata !1315), !dbg !3743
  %this1 = load %"class.__gnu_cxx::new_allocator"*, %"class.__gnu_cxx::new_allocator"** %this.addr, align 8
  %0 = load %struct.record*, %struct.record** %__p.addr, align 8, !dbg !3744
  ret void, !dbg !3745
}

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nounwind }
attributes #8 = { noinline noreturn nounwind }
attributes #9 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { inlinehint uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { noreturn nounwind }
attributes #16 = { nounwind }
attributes #17 = { nounwind readonly }
attributes #18 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!1306, !1307}
!llvm.ident = !{!1308}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !38, imports: !758)
!1 = !DIFile(filename: "nn_cuda.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!2 = !{!3, !11, !26}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !4, line: 807, size: 32, align: 32, elements: !5, identifier: "_ZTS14cudaMemcpyKind")
!4 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!5 = !{!6, !7, !8, !9, !10}
!6 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!7 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!8 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!10 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, scope: !13, file: !12, line: 113, size: 32, align: 32, elements: !24, identifier: "_ZTSNSt10__are_sameI7latLongS0_EUt_E")
!12 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/cpp_type_traits.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__are_same<latLong, latLong>", scope: !14, file: !12, line: 111, size: 8, align: 8, elements: !16, templateParams: !17, identifier: "_ZTSSt10__are_sameI7latLongS0_E")
!14 = !DINamespace(name: "std", scope: null, file: !15, line: 188)
!15 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!16 = !{}
!17 = !{!18, !18}
!18 = !DITemplateTypeParameter(type: !19)
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "latLong", file: !1, line: 26, size: 64, align: 32, elements: !20, identifier: "_ZTS7latLong")
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "lat", scope: !19, file: !1, line: 28, baseType: !22, size: 32, align: 32)
!22 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "lng", scope: !19, file: !1, line: 29, baseType: !22, size: 32, align: 32, offset: 32)
!24 = !{!25}
!25 = !DIEnumerator(name: "__value", value: 1)
!26 = !DICompositeType(tag: DW_TAG_enumeration_type, scope: !27, file: !12, line: 113, size: 32, align: 32, elements: !24, identifier: "_ZTSNSt10__are_sameI6recordS0_EUt_E")
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__are_same<record, record>", scope: !14, file: !12, line: 111, size: 8, align: 8, elements: !16, templateParams: !28, identifier: "_ZTSSt10__are_sameI6recordS0_E")
!28 = !{!29, !29}
!29 = !DITemplateTypeParameter(type: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "record", file: !1, line: 32, size: 480, align: 32, elements: !31, identifier: "_ZTS6record")
!31 = !{!32, !37}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "recString", scope: !30, file: !1, line: 34, baseType: !33, size: 424, align: 8)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 424, align: 8, elements: !35)
!34 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!35 = !{!36}
!36 = !DISubrange(count: 53)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "distance", scope: !30, file: !1, line: 35, baseType: !22, size: 32, align: 32, offset: 448)
!38 = !{!39, !40, !42, !206, !41, !359, !242, !100, !360, !361, !84, !563, !564}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64, align: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64, align: 64)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Tp_alloc_type", scope: !45, file: !44, line: 75, baseType: !200)
!44 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/stl_vector.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_base<record, std::allocator<record> >", scope: !14, file: !44, line: 72, size: 192, align: 64, elements: !46, templateParams: !199, identifier: "_ZTSSt12_Vector_baseI6recordSaIS0_EE")
!46 = !{!47, !163, !168, !173, !177, !180, !185, !188, !191, !192, !195, !198}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_M_impl", scope: !45, file: !44, line: 164, baseType: !48, size: 192, align: 64)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_impl", scope: !45, file: !44, line: 79, size: 192, align: 64, elements: !49, identifier: "_ZTSNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implE")
!49 = !{!50, !51, !148, !149, !150, !154, !159}
!50 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !48, baseType: !43)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_M_start", scope: !48, file: !44, line: 82, baseType: !52, size: 64, align: 64)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !45, file: !44, line: 77, baseType: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !55, file: !54, line: 172, baseType: !147)
!54 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/ext/alloc_traits.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__alloc_traits<std::allocator<record> >", scope: !56, file: !54, line: 95, size: 8, align: 8, elements: !58, templateParams: !145, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaI6recordEEE")
!56 = !DINamespace(name: "__gnu_cxx", scope: null, file: !57, line: 220)
!57 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!58 = !{!59, !130, !133, !136, !139, !142}
!59 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m", scope: !55, file: !54, line: 181, type: !60, isLocal: false, isDefinition: false, scopeLine: 181, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DISubroutineType(types: !61)
!61 = !{!53, !62, !128}
!62 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !63, size: 64, align: 64)
!63 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<record>", scope: !14, file: !64, line: 92, size: 8, align: 8, elements: !65, templateParams: !116, identifier: "_ZTSSaI6recordE")
!64 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/allocator.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!65 = !{!66, !118, !122, !127}
!66 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !63, baseType: !67, flags: DIFlagPublic)
!67 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "new_allocator<record>", scope: !56, file: !68, line: 58, size: 8, align: 8, elements: !69, templateParams: !116, identifier: "_ZTSN9__gnu_cxx13new_allocatorI6recordEE")
!68 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/ext/new_allocator.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!69 = !{!70, !74, !79, !80, !88, !96, !104, !107, !110, !113}
!70 = !DISubprogram(name: "new_allocator", scope: !67, file: !68, line: 79, type: !71, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!71 = !DISubroutineType(types: !72)
!72 = !{null, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!74 = !DISubprogram(name: "new_allocator", scope: !67, file: !68, line: 81, type: !75, isLocal: false, isDefinition: false, scopeLine: 81, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!75 = !DISubroutineType(types: !76)
!76 = !{null, !73, !77}
!77 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !78, size: 64, align: 64)
!78 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !67)
!79 = !DISubprogram(name: "~new_allocator", scope: !67, file: !68, line: 86, type: !71, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!80 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorI6recordE7addressERS1_", scope: !67, file: !68, line: 89, type: !81, isLocal: false, isDefinition: false, scopeLine: 89, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !85, !86}
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !67, file: !68, line: 63, baseType: !84)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64, align: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !67, file: !68, line: 65, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !30, size: 64, align: 64)
!88 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorI6recordE7addressERKS1_", scope: !67, file: !68, line: 93, type: !89, isLocal: false, isDefinition: false, scopeLine: 93, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!89 = !DISubroutineType(types: !90)
!90 = !{!91, !85, !94}
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !67, file: !68, line: 64, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64, align: 64)
!93 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !67, file: !68, line: 66, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !93, size: 64, align: 64)
!96 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv", scope: !67, file: !68, line: 99, type: !97, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!97 = !DISubroutineType(types: !98)
!98 = !{!83, !73, !99, !102}
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !68, line: 61, baseType: !100)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !14, file: !57, line: 196, baseType: !101)
!101 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64, align: 64)
!103 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!104 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE10deallocateEPS1_m", scope: !67, file: !68, line: 109, type: !105, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!105 = !DISubroutineType(types: !106)
!106 = !{null, !73, !83, !99}
!107 = !DISubprogram(name: "max_size", linkageName: "_ZNK9__gnu_cxx13new_allocatorI6recordE8max_sizeEv", scope: !67, file: !68, line: 113, type: !108, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!108 = !DISubroutineType(types: !109)
!109 = !{!99, !85}
!110 = !DISubprogram(name: "construct", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE9constructEPS1_RKS1_", scope: !67, file: !68, line: 129, type: !111, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!111 = !DISubroutineType(types: !112)
!112 = !{null, !73, !83, !95}
!113 = !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE7destroyEPS1_", scope: !67, file: !68, line: 133, type: !114, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!114 = !DISubroutineType(types: !115)
!115 = !{null, !73, !83}
!116 = !{!117}
!117 = !DITemplateTypeParameter(name: "_Tp", type: !30)
!118 = !DISubprogram(name: "allocator", scope: !63, file: !64, line: 113, type: !119, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!119 = !DISubroutineType(types: !120)
!120 = !{null, !121}
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!122 = !DISubprogram(name: "allocator", scope: !63, file: !64, line: 115, type: !123, isLocal: false, isDefinition: false, scopeLine: 115, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!123 = !DISubroutineType(types: !124)
!124 = !{null, !121, !125}
!125 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !126, size: 64, align: 64)
!126 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !63)
!127 = !DISubprogram(name: "~allocator", scope: !63, file: !64, line: 121, type: !119, isLocal: false, isDefinition: false, scopeLine: 121, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !55, file: !54, line: 177, baseType: !129)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !63, file: !64, line: 95, baseType: !100)
!130 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10deallocateERS2_PS1_m", scope: !55, file: !54, line: 184, type: !131, isLocal: false, isDefinition: false, scopeLine: 184, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DISubroutineType(types: !132)
!132 = !{null, !62, !53, !128}
!133 = !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE7destroyERS2_PS1_", scope: !55, file: !54, line: 191, type: !134, isLocal: false, isDefinition: false, scopeLine: 191, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DISubroutineType(types: !135)
!135 = !{null, !62, !53}
!136 = !DISubprogram(name: "max_size", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8max_sizeERKS2_", scope: !55, file: !54, line: 194, type: !137, isLocal: false, isDefinition: false, scopeLine: 194, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DISubroutineType(types: !138)
!138 = !{!128, !125}
!139 = !DISubprogram(name: "_S_select_on_copy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE17_S_select_on_copyERKS2_", scope: !55, file: !54, line: 197, type: !140, isLocal: false, isDefinition: false, scopeLine: 197, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DISubroutineType(types: !141)
!141 = !{!125, !125}
!142 = !DISubprogram(name: "_S_on_swap", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10_S_on_swapERS2_S4_", scope: !55, file: !54, line: 199, type: !143, isLocal: false, isDefinition: false, scopeLine: 199, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DISubroutineType(types: !144)
!144 = !{null, !62, !62}
!145 = !{!146}
!146 = !DITemplateTypeParameter(name: "_Alloc", type: !63)
!147 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !63, file: !64, line: 97, baseType: !84)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "_M_finish", scope: !48, file: !44, line: 83, baseType: !52, size: 64, align: 64, offset: 64)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "_M_end_of_storage", scope: !48, file: !44, line: 84, baseType: !52, size: 64, align: 64, offset: 128)
!150 = !DISubprogram(name: "_Vector_impl", scope: !48, file: !44, line: 86, type: !151, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DISubroutineType(types: !152)
!152 = !{null, !153}
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!154 = !DISubprogram(name: "_Vector_impl", scope: !48, file: !44, line: 90, type: !155, isLocal: false, isDefinition: false, scopeLine: 90, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DISubroutineType(types: !156)
!156 = !{null, !153, !157}
!157 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !158, size: 64, align: 64)
!158 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !43)
!159 = !DISubprogram(name: "_M_swap_data", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_impl12_M_swap_dataERS3_", scope: !48, file: !44, line: 101, type: !160, isLocal: false, isDefinition: false, scopeLine: 101, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DISubroutineType(types: !161)
!161 = !{null, !153, !162}
!162 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !48, size: 64, align: 64)
!163 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv", scope: !45, file: !44, line: 113, type: !164, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPrototyped, isOptimized: false)
!164 = !DISubroutineType(types: !165)
!165 = !{!166, !167}
!166 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !43, size: 64, align: 64)
!167 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!168 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNKSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv", scope: !45, file: !44, line: 117, type: !169, isLocal: false, isDefinition: false, scopeLine: 117, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DISubroutineType(types: !170)
!170 = !{!157, !171}
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!172 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !45)
!173 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt12_Vector_baseI6recordSaIS0_EE13get_allocatorEv", scope: !45, file: !44, line: 121, type: !174, isLocal: false, isDefinition: false, scopeLine: 121, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DISubroutineType(types: !175)
!175 = !{!176, !171}
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !45, file: !44, line: 110, baseType: !63)
!177 = !DISubprogram(name: "_Vector_base", scope: !45, file: !44, line: 124, type: !178, isLocal: false, isDefinition: false, scopeLine: 124, flags: DIFlagPrototyped, isOptimized: false)
!178 = !DISubroutineType(types: !179)
!179 = !{null, !167}
!180 = !DISubprogram(name: "_Vector_base", scope: !45, file: !44, line: 127, type: !181, isLocal: false, isDefinition: false, scopeLine: 127, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{null, !167, !183}
!183 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !184, size: 64, align: 64)
!184 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !176)
!185 = !DISubprogram(name: "_Vector_base", scope: !45, file: !44, line: 130, type: !186, isLocal: false, isDefinition: false, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DISubroutineType(types: !187)
!187 = !{null, !167, !100}
!188 = !DISubprogram(name: "_Vector_base", scope: !45, file: !44, line: 134, type: !189, isLocal: false, isDefinition: false, scopeLine: 134, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{null, !167, !100, !183}
!191 = !DISubprogram(name: "~_Vector_base", scope: !45, file: !44, line: 159, type: !178, isLocal: false, isDefinition: false, scopeLine: 159, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE11_M_allocateEm", scope: !45, file: !44, line: 167, type: !193, isLocal: false, isDefinition: false, scopeLine: 167, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DISubroutineType(types: !194)
!194 = !{!52, !167, !100}
!195 = !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m", scope: !45, file: !44, line: 174, type: !196, isLocal: false, isDefinition: false, scopeLine: 174, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DISubroutineType(types: !197)
!197 = !{null, !167, !52, !100}
!198 = !DISubprogram(name: "_M_create_storage", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE17_M_create_storageEm", scope: !45, file: !44, line: 183, type: !186, isLocal: false, isDefinition: false, scopeLine: 183, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!199 = !{!117, !146}
!200 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !201, file: !54, line: 208, baseType: !202)
!201 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<record>", scope: !55, file: !54, line: 207, size: 8, align: 8, elements: !16, templateParams: !116, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaI6recordEE6rebindIS1_EE")
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !203, file: !64, line: 105, baseType: !63)
!203 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<record>", scope: !63, file: !64, line: 104, size: 8, align: 8, elements: !16, templateParams: !204, identifier: "_ZTSNSaI6recordE6rebindIS_EE")
!204 = !{!205}
!205 = !DITemplateTypeParameter(name: "_Tp1", type: !30)
!206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !207, size: 64, align: 64)
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Tp_alloc_type", scope: !208, file: !44, line: 75, baseType: !353)
!208 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_base<latLong, std::allocator<latLong> >", scope: !14, file: !44, line: 72, size: 192, align: 64, elements: !209, templateParams: !352, identifier: "_ZTSSt12_Vector_baseI7latLongSaIS0_EE")
!209 = !{!210, !316, !321, !326, !330, !333, !338, !341, !344, !345, !348, !351}
!210 = !DIDerivedType(tag: DW_TAG_member, name: "_M_impl", scope: !208, file: !44, line: 164, baseType: !211, size: 192, align: 64)
!211 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_impl", scope: !208, file: !44, line: 79, size: 192, align: 64, elements: !212, identifier: "_ZTSNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implE")
!212 = !{!213, !214, !301, !302, !303, !307, !312}
!213 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !211, baseType: !207)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "_M_start", scope: !211, file: !44, line: 82, baseType: !215, size: 64, align: 64)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !208, file: !44, line: 77, baseType: !216)
!216 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !217, file: !54, line: 172, baseType: !300)
!217 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__alloc_traits<std::allocator<latLong> >", scope: !56, file: !54, line: 95, size: 8, align: 8, elements: !218, templateParams: !298, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaI7latLongEEE")
!218 = !{!219, !283, !286, !289, !292, !295}
!219 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m", scope: !217, file: !54, line: 181, type: !220, isLocal: false, isDefinition: false, scopeLine: 181, flags: DIFlagPrototyped, isOptimized: false)
!220 = !DISubroutineType(types: !221)
!221 = !{!216, !222, !281}
!222 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !223, size: 64, align: 64)
!223 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<latLong>", scope: !14, file: !64, line: 92, size: 8, align: 8, elements: !224, templateParams: !269, identifier: "_ZTSSaI7latLongE")
!224 = !{!225, !271, !275, !280}
!225 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !223, baseType: !226, flags: DIFlagPublic)
!226 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "new_allocator<latLong>", scope: !56, file: !68, line: 58, size: 8, align: 8, elements: !227, templateParams: !269, identifier: "_ZTSN9__gnu_cxx13new_allocatorI7latLongEE")
!227 = !{!228, !232, !237, !238, !246, !254, !257, !260, !263, !266}
!228 = !DISubprogram(name: "new_allocator", scope: !226, file: !68, line: 79, type: !229, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!229 = !DISubroutineType(types: !230)
!230 = !{null, !231}
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !226, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!232 = !DISubprogram(name: "new_allocator", scope: !226, file: !68, line: 81, type: !233, isLocal: false, isDefinition: false, scopeLine: 81, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!233 = !DISubroutineType(types: !234)
!234 = !{null, !231, !235}
!235 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !236, size: 64, align: 64)
!236 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !226)
!237 = !DISubprogram(name: "~new_allocator", scope: !226, file: !68, line: 86, type: !229, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!238 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorI7latLongE7addressERS1_", scope: !226, file: !68, line: 89, type: !239, isLocal: false, isDefinition: false, scopeLine: 89, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!239 = !DISubroutineType(types: !240)
!240 = !{!241, !243, !244}
!241 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !226, file: !68, line: 63, baseType: !242)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64, align: 64)
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!244 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !226, file: !68, line: 65, baseType: !245)
!245 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !19, size: 64, align: 64)
!246 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorI7latLongE7addressERKS1_", scope: !226, file: !68, line: 93, type: !247, isLocal: false, isDefinition: false, scopeLine: 93, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!247 = !DISubroutineType(types: !248)
!248 = !{!249, !243, !252}
!249 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !226, file: !68, line: 64, baseType: !250)
!250 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !251, size: 64, align: 64)
!251 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!252 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !226, file: !68, line: 66, baseType: !253)
!253 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !251, size: 64, align: 64)
!254 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv", scope: !226, file: !68, line: 99, type: !255, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!255 = !DISubroutineType(types: !256)
!256 = !{!241, !231, !99, !102}
!257 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE10deallocateEPS1_m", scope: !226, file: !68, line: 109, type: !258, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!258 = !DISubroutineType(types: !259)
!259 = !{null, !231, !241, !99}
!260 = !DISubprogram(name: "max_size", linkageName: "_ZNK9__gnu_cxx13new_allocatorI7latLongE8max_sizeEv", scope: !226, file: !68, line: 113, type: !261, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!261 = !DISubroutineType(types: !262)
!262 = !{!99, !243}
!263 = !DISubprogram(name: "construct", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE9constructEPS1_RKS1_", scope: !226, file: !68, line: 129, type: !264, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!264 = !DISubroutineType(types: !265)
!265 = !{null, !231, !241, !253}
!266 = !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE7destroyEPS1_", scope: !226, file: !68, line: 133, type: !267, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!267 = !DISubroutineType(types: !268)
!268 = !{null, !231, !241}
!269 = !{!270}
!270 = !DITemplateTypeParameter(name: "_Tp", type: !19)
!271 = !DISubprogram(name: "allocator", scope: !223, file: !64, line: 113, type: !272, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!272 = !DISubroutineType(types: !273)
!273 = !{null, !274}
!274 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !223, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!275 = !DISubprogram(name: "allocator", scope: !223, file: !64, line: 115, type: !276, isLocal: false, isDefinition: false, scopeLine: 115, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!276 = !DISubroutineType(types: !277)
!277 = !{null, !274, !278}
!278 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !279, size: 64, align: 64)
!279 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !223)
!280 = !DISubprogram(name: "~allocator", scope: !223, file: !64, line: 121, type: !272, isLocal: false, isDefinition: false, scopeLine: 121, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!281 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !217, file: !54, line: 177, baseType: !282)
!282 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !223, file: !64, line: 95, baseType: !100)
!283 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10deallocateERS2_PS1_m", scope: !217, file: !54, line: 184, type: !284, isLocal: false, isDefinition: false, scopeLine: 184, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DISubroutineType(types: !285)
!285 = !{null, !222, !216, !281}
!286 = !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE7destroyERS2_PS1_", scope: !217, file: !54, line: 191, type: !287, isLocal: false, isDefinition: false, scopeLine: 191, flags: DIFlagPrototyped, isOptimized: false)
!287 = !DISubroutineType(types: !288)
!288 = !{null, !222, !216}
!289 = !DISubprogram(name: "max_size", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8max_sizeERKS2_", scope: !217, file: !54, line: 194, type: !290, isLocal: false, isDefinition: false, scopeLine: 194, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DISubroutineType(types: !291)
!291 = !{!281, !278}
!292 = !DISubprogram(name: "_S_select_on_copy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE17_S_select_on_copyERKS2_", scope: !217, file: !54, line: 197, type: !293, isLocal: false, isDefinition: false, scopeLine: 197, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DISubroutineType(types: !294)
!294 = !{!278, !278}
!295 = !DISubprogram(name: "_S_on_swap", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10_S_on_swapERS2_S4_", scope: !217, file: !54, line: 199, type: !296, isLocal: false, isDefinition: false, scopeLine: 199, flags: DIFlagPrototyped, isOptimized: false)
!296 = !DISubroutineType(types: !297)
!297 = !{null, !222, !222}
!298 = !{!299}
!299 = !DITemplateTypeParameter(name: "_Alloc", type: !223)
!300 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !223, file: !64, line: 97, baseType: !242)
!301 = !DIDerivedType(tag: DW_TAG_member, name: "_M_finish", scope: !211, file: !44, line: 83, baseType: !215, size: 64, align: 64, offset: 64)
!302 = !DIDerivedType(tag: DW_TAG_member, name: "_M_end_of_storage", scope: !211, file: !44, line: 84, baseType: !215, size: 64, align: 64, offset: 128)
!303 = !DISubprogram(name: "_Vector_impl", scope: !211, file: !44, line: 86, type: !304, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DISubroutineType(types: !305)
!305 = !{null, !306}
!306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!307 = !DISubprogram(name: "_Vector_impl", scope: !211, file: !44, line: 90, type: !308, isLocal: false, isDefinition: false, scopeLine: 90, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{null, !306, !310}
!310 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !311, size: 64, align: 64)
!311 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !207)
!312 = !DISubprogram(name: "_M_swap_data", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_impl12_M_swap_dataERS3_", scope: !211, file: !44, line: 101, type: !313, isLocal: false, isDefinition: false, scopeLine: 101, flags: DIFlagPrototyped, isOptimized: false)
!313 = !DISubroutineType(types: !314)
!314 = !{null, !306, !315}
!315 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !211, size: 64, align: 64)
!316 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv", scope: !208, file: !44, line: 113, type: !317, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPrototyped, isOptimized: false)
!317 = !DISubroutineType(types: !318)
!318 = !{!319, !320}
!319 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !207, size: 64, align: 64)
!320 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !208, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!321 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNKSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv", scope: !208, file: !44, line: 117, type: !322, isLocal: false, isDefinition: false, scopeLine: 117, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DISubroutineType(types: !323)
!323 = !{!310, !324}
!324 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !325, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!325 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !208)
!326 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt12_Vector_baseI7latLongSaIS0_EE13get_allocatorEv", scope: !208, file: !44, line: 121, type: !327, isLocal: false, isDefinition: false, scopeLine: 121, flags: DIFlagPrototyped, isOptimized: false)
!327 = !DISubroutineType(types: !328)
!328 = !{!329, !324}
!329 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !208, file: !44, line: 110, baseType: !223)
!330 = !DISubprogram(name: "_Vector_base", scope: !208, file: !44, line: 124, type: !331, isLocal: false, isDefinition: false, scopeLine: 124, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DISubroutineType(types: !332)
!332 = !{null, !320}
!333 = !DISubprogram(name: "_Vector_base", scope: !208, file: !44, line: 127, type: !334, isLocal: false, isDefinition: false, scopeLine: 127, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DISubroutineType(types: !335)
!335 = !{null, !320, !336}
!336 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !337, size: 64, align: 64)
!337 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !329)
!338 = !DISubprogram(name: "_Vector_base", scope: !208, file: !44, line: 130, type: !339, isLocal: false, isDefinition: false, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: false)
!339 = !DISubroutineType(types: !340)
!340 = !{null, !320, !100}
!341 = !DISubprogram(name: "_Vector_base", scope: !208, file: !44, line: 134, type: !342, isLocal: false, isDefinition: false, scopeLine: 134, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DISubroutineType(types: !343)
!343 = !{null, !320, !100, !336}
!344 = !DISubprogram(name: "~_Vector_base", scope: !208, file: !44, line: 159, type: !331, isLocal: false, isDefinition: false, scopeLine: 159, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE11_M_allocateEm", scope: !208, file: !44, line: 167, type: !346, isLocal: false, isDefinition: false, scopeLine: 167, flags: DIFlagPrototyped, isOptimized: false)
!346 = !DISubroutineType(types: !347)
!347 = !{!215, !320, !100}
!348 = !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m", scope: !208, file: !44, line: 174, type: !349, isLocal: false, isDefinition: false, scopeLine: 174, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{null, !320, !215, !100}
!351 = !DISubprogram(name: "_M_create_storage", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE17_M_create_storageEm", scope: !208, file: !44, line: 183, type: !339, isLocal: false, isDefinition: false, scopeLine: 183, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: false)
!352 = !{!270, !299}
!353 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !354, file: !54, line: 208, baseType: !355)
!354 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<latLong>", scope: !217, file: !54, line: 207, size: 8, align: 8, elements: !16, templateParams: !269, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaI7latLongEE6rebindIS1_EE")
!355 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !356, file: !64, line: 105, baseType: !223)
!356 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<latLong>", scope: !223, file: !64, line: 104, size: 8, align: 8, elements: !16, templateParams: !357, identifier: "_ZTSNSaI7latLongE6rebindIS_EE")
!357 = !{!358}
!358 = !DITemplateTypeParameter(name: "_Tp1", type: !19)
!359 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !44, line: 236, baseType: !100)
!360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !311, size: 64, align: 64)
!361 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !362, file: !44, line: 231, baseType: !505)
!362 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "vector<latLong, std::allocator<latLong> >", scope: !14, file: !44, line: 214, size: 192, align: 64, elements: !363, templateParams: !352, identifier: "_ZTSSt6vectorI7latLongSaIS0_EE")
!363 = !{!364, !365, !369, !375, !381, !386, !387, !391, !394, !397, !404, !405, !406, !411, !416, !417, !418, !421, !422, !425, !426, !430, !433, !439, !445, !448, !449, !450, !453, !456, !457, !458, !462, !468, !471, !472, !475, !478, !481, !484, !487, !488, !489, !490, !491, !494, !500, !503, !504}
!364 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !362, baseType: !208, flags: DIFlagProtected)
!365 = !DISubprogram(name: "vector", scope: !362, file: !44, line: 253, type: !366, isLocal: false, isDefinition: false, scopeLine: 253, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!366 = !DISubroutineType(types: !367)
!367 = !{null, !368}
!368 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!369 = !DISubprogram(name: "vector", scope: !362, file: !44, line: 264, type: !370, isLocal: false, isDefinition: false, scopeLine: 264, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!370 = !DISubroutineType(types: !371)
!371 = !{null, !368, !372}
!372 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !373, size: 64, align: 64)
!373 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !374)
!374 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !362, file: !44, line: 238, baseType: !223)
!375 = !DISubprogram(name: "vector", scope: !362, file: !44, line: 303, type: !376, isLocal: false, isDefinition: false, scopeLine: 303, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!376 = !DISubroutineType(types: !377)
!377 = !{null, !368, !359, !378, !372}
!378 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !379, size: 64, align: 64)
!379 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !380)
!380 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !362, file: !44, line: 226, baseType: !19)
!381 = !DISubprogram(name: "vector", scope: !362, file: !44, line: 318, type: !382, isLocal: false, isDefinition: false, scopeLine: 318, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!382 = !DISubroutineType(types: !383)
!383 = !{null, !368, !384}
!384 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !385, size: 64, align: 64)
!385 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !362)
!386 = !DISubprogram(name: "~vector", scope: !362, file: !44, line: 423, type: !366, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!387 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6vectorI7latLongSaIS0_EEaSERKS2_", scope: !362, file: !44, line: 436, type: !388, isLocal: false, isDefinition: false, scopeLine: 436, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{!390, !368, !384}
!390 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !362, size: 64, align: 64)
!391 = !DISubprogram(name: "assign", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6assignEmRKS0_", scope: !362, file: !44, line: 488, type: !392, isLocal: false, isDefinition: false, scopeLine: 488, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!392 = !DISubroutineType(types: !393)
!393 = !{null, !368, !359, !378}
!394 = !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5beginEv", scope: !362, file: !44, line: 547, type: !395, isLocal: false, isDefinition: false, scopeLine: 547, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!395 = !DISubroutineType(types: !396)
!396 = !{!361, !368}
!397 = !DISubprogram(name: "begin", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE5beginEv", scope: !362, file: !44, line: 556, type: !398, isLocal: false, isDefinition: false, scopeLine: 556, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!398 = !DISubroutineType(types: !399)
!399 = !{!400, !403}
!400 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !362, file: !44, line: 233, baseType: !401)
!401 = !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<const latLong *, std::vector<latLong, std::allocator<latLong> > >", scope: !56, file: !402, line: 721, flags: DIFlagFwdDecl, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIPK7latLongSt6vectorIS1_SaIS1_EEEE")
!402 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/stl_iterator.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!403 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!404 = !DISubprogram(name: "end", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE3endEv", scope: !362, file: !44, line: 565, type: !395, isLocal: false, isDefinition: false, scopeLine: 565, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!405 = !DISubprogram(name: "end", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE3endEv", scope: !362, file: !44, line: 574, type: !398, isLocal: false, isDefinition: false, scopeLine: 574, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!406 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6rbeginEv", scope: !362, file: !44, line: 583, type: !407, isLocal: false, isDefinition: false, scopeLine: 583, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!407 = !DISubroutineType(types: !408)
!408 = !{!409, !368}
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !362, file: !44, line: 235, baseType: !410)
!410 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<latLong *, std::vector<latLong, std::allocator<latLong> > > >", scope: !14, file: !402, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS2_SaIS2_EEEEE")
!411 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE6rbeginEv", scope: !362, file: !44, line: 592, type: !412, isLocal: false, isDefinition: false, scopeLine: 592, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!412 = !DISubroutineType(types: !413)
!413 = !{!414, !403}
!414 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !362, file: !44, line: 234, baseType: !415)
!415 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<const latLong *, std::vector<latLong, std::allocator<latLong> > > >", scope: !14, file: !402, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPK7latLongSt6vectorIS2_SaIS2_EEEEE")
!416 = !DISubprogram(name: "rend", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE4rendEv", scope: !362, file: !44, line: 601, type: !407, isLocal: false, isDefinition: false, scopeLine: 601, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!417 = !DISubprogram(name: "rend", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4rendEv", scope: !362, file: !44, line: 610, type: !412, isLocal: false, isDefinition: false, scopeLine: 610, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!418 = !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv", scope: !362, file: !44, line: 654, type: !419, isLocal: false, isDefinition: false, scopeLine: 654, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!419 = !DISubroutineType(types: !420)
!420 = !{!359, !403}
!421 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv", scope: !362, file: !44, line: 659, type: !419, isLocal: false, isDefinition: false, scopeLine: 659, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!422 = !DISubprogram(name: "resize", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6resizeEmS0_", scope: !362, file: !44, line: 713, type: !423, isLocal: false, isDefinition: false, scopeLine: 713, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!423 = !DISubroutineType(types: !424)
!424 = !{null, !368, !359, !380}
!425 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE8capacityEv", scope: !362, file: !44, line: 734, type: !419, isLocal: false, isDefinition: false, scopeLine: 734, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!426 = !DISubprogram(name: "empty", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE5emptyEv", scope: !362, file: !44, line: 743, type: !427, isLocal: false, isDefinition: false, scopeLine: 743, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!427 = !DISubroutineType(types: !428)
!428 = !{!429, !403}
!429 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!430 = !DISubprogram(name: "reserve", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE7reserveEm", scope: !362, file: !44, line: 764, type: !431, isLocal: false, isDefinition: false, scopeLine: 764, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!431 = !DISubroutineType(types: !432)
!432 = !{null, !368, !359}
!433 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorI7latLongSaIS0_EEixEm", scope: !362, file: !44, line: 779, type: !434, isLocal: false, isDefinition: false, scopeLine: 779, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!434 = !DISubroutineType(types: !435)
!435 = !{!436, !368, !359}
!436 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !362, file: !44, line: 229, baseType: !437)
!437 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !217, file: !54, line: 175, baseType: !438)
!438 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !223, file: !64, line: 99, baseType: !245)
!439 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EEixEm", scope: !362, file: !44, line: 794, type: !440, isLocal: false, isDefinition: false, scopeLine: 794, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!440 = !DISubroutineType(types: !441)
!441 = !{!442, !403, !359}
!442 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !362, file: !44, line: 230, baseType: !443)
!443 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !217, file: !54, line: 176, baseType: !444)
!444 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !223, file: !64, line: 100, baseType: !253)
!445 = !DISubprogram(name: "_M_range_check", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE14_M_range_checkEm", scope: !362, file: !44, line: 800, type: !446, isLocal: false, isDefinition: false, scopeLine: 800, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!446 = !DISubroutineType(types: !447)
!447 = !{null, !403, !359}
!448 = !DISubprogram(name: "at", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE2atEm", scope: !362, file: !44, line: 822, type: !434, isLocal: false, isDefinition: false, scopeLine: 822, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!449 = !DISubprogram(name: "at", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE2atEm", scope: !362, file: !44, line: 840, type: !440, isLocal: false, isDefinition: false, scopeLine: 840, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!450 = !DISubprogram(name: "front", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5frontEv", scope: !362, file: !44, line: 851, type: !451, isLocal: false, isDefinition: false, scopeLine: 851, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!451 = !DISubroutineType(types: !452)
!452 = !{!436, !368}
!453 = !DISubprogram(name: "front", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE5frontEv", scope: !362, file: !44, line: 859, type: !454, isLocal: false, isDefinition: false, scopeLine: 859, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!454 = !DISubroutineType(types: !455)
!455 = !{!442, !403}
!456 = !DISubprogram(name: "back", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE4backEv", scope: !362, file: !44, line: 867, type: !451, isLocal: false, isDefinition: false, scopeLine: 867, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!457 = !DISubprogram(name: "back", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4backEv", scope: !362, file: !44, line: 875, type: !454, isLocal: false, isDefinition: false, scopeLine: 875, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!458 = !DISubprogram(name: "data", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE4dataEv", scope: !362, file: !44, line: 890, type: !459, isLocal: false, isDefinition: false, scopeLine: 890, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!459 = !DISubroutineType(types: !460)
!460 = !{!461, !368}
!461 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !362, file: !44, line: 227, baseType: !215)
!462 = !DISubprogram(name: "data", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4dataEv", scope: !362, file: !44, line: 898, type: !463, isLocal: false, isDefinition: false, scopeLine: 898, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!463 = !DISubroutineType(types: !464)
!464 = !{!465, !403}
!465 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !362, file: !44, line: 228, baseType: !466)
!466 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !217, file: !54, line: 173, baseType: !467)
!467 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !223, file: !64, line: 98, baseType: !250)
!468 = !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_", scope: !362, file: !44, line: 913, type: !469, isLocal: false, isDefinition: false, scopeLine: 913, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!469 = !DISubroutineType(types: !470)
!470 = !{null, !368, !378}
!471 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE8pop_backEv", scope: !362, file: !44, line: 949, type: !366, isLocal: false, isDefinition: false, scopeLine: 949, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!472 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !362, file: !44, line: 998, type: !473, isLocal: false, isDefinition: false, scopeLine: 998, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!473 = !DISubroutineType(types: !474)
!474 = !{!361, !368, !361, !378}
!475 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EEmRKS0_", scope: !362, file: !44, line: 1072, type: !476, isLocal: false, isDefinition: false, scopeLine: 1072, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!476 = !DISubroutineType(types: !477)
!477 = !{null, !368, !361, !359, !378}
!478 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EE", scope: !362, file: !44, line: 1149, type: !479, isLocal: false, isDefinition: false, scopeLine: 1149, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!479 = !DISubroutineType(types: !480)
!480 = !{!361, !368, !361}
!481 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EES6_", scope: !362, file: !44, line: 1180, type: !482, isLocal: false, isDefinition: false, scopeLine: 1180, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!482 = !DISubroutineType(types: !483)
!483 = !{!361, !368, !361, !361}
!484 = !DISubprogram(name: "swap", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE4swapERS2_", scope: !362, file: !44, line: 1194, type: !485, isLocal: false, isDefinition: false, scopeLine: 1194, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!485 = !DISubroutineType(types: !486)
!486 = !{null, !368, !390}
!487 = !DISubprogram(name: "clear", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5clearEv", scope: !362, file: !44, line: 1211, type: !366, isLocal: false, isDefinition: false, scopeLine: 1211, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!488 = !DISubprogram(name: "_M_fill_initialize", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE18_M_fill_initializeEmRKS0_", scope: !362, file: !44, line: 1298, type: !392, isLocal: false, isDefinition: false, scopeLine: 1298, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!489 = !DISubprogram(name: "_M_fill_assign", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE14_M_fill_assignEmRKS0_", scope: !362, file: !44, line: 1354, type: !392, isLocal: false, isDefinition: false, scopeLine: 1354, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!490 = !DISubprogram(name: "_M_fill_insert", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EEmRKS0_", scope: !362, file: !44, line: 1395, type: !476, isLocal: false, isDefinition: false, scopeLine: 1395, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!491 = !DISubprogram(name: "_M_insert_aux", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !362, file: !44, line: 1409, type: !492, isLocal: false, isDefinition: false, scopeLine: 1409, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!492 = !DISubroutineType(types: !493)
!493 = !{null, !368, !361, !378}
!494 = !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE12_M_check_lenEmPKc", scope: !362, file: !44, line: 1422, type: !495, isLocal: false, isDefinition: false, scopeLine: 1422, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!495 = !DISubroutineType(types: !496)
!496 = !{!497, !403, !359, !498}
!497 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !362, file: !44, line: 236, baseType: !100)
!498 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !499, size: 64, align: 64)
!499 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !34)
!500 = !DISubprogram(name: "_M_erase_at_end", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE15_M_erase_at_endEPS0_", scope: !362, file: !44, line: 1436, type: !501, isLocal: false, isDefinition: false, scopeLine: 1436, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!501 = !DISubroutineType(types: !502)
!502 = !{null, !368, !461}
!503 = !DISubprogram(name: "_M_erase", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE8_M_eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EE", scope: !362, file: !44, line: 1443, type: !479, isLocal: false, isDefinition: false, scopeLine: 1443, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!504 = !DISubprogram(name: "_M_erase", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE8_M_eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EES6_", scope: !362, file: !44, line: 1446, type: !482, isLocal: false, isDefinition: false, scopeLine: 1446, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!505 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<latLong *, std::vector<latLong, std::allocator<latLong> > >", scope: !56, file: !402, line: 721, size: 64, align: 64, elements: !506, templateParams: !561, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEE")
!506 = !{!507, !508, !512, !517, !528, !533, !537, !541, !542, !543, !550, !553, !556, !557, !558}
!507 = !DIDerivedType(tag: DW_TAG_member, name: "_M_current", scope: !505, file: !402, line: 724, baseType: !242, size: 64, align: 64, flags: DIFlagProtected)
!508 = !DISubprogram(name: "__normal_iterator", scope: !505, file: !402, line: 736, type: !509, isLocal: false, isDefinition: false, scopeLine: 736, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!509 = !DISubroutineType(types: !510)
!510 = !{null, !511}
!511 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !505, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!512 = !DISubprogram(name: "__normal_iterator", scope: !505, file: !402, line: 740, type: !513, isLocal: false, isDefinition: false, scopeLine: 740, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!513 = !DISubroutineType(types: !514)
!514 = !{null, !511, !515}
!515 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !516, size: 64, align: 64)
!516 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !242)
!517 = !DISubprogram(name: "operator*", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEdeEv", scope: !505, file: !402, line: 753, type: !518, isLocal: false, isDefinition: false, scopeLine: 753, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!518 = !DISubroutineType(types: !519)
!519 = !{!520, !526}
!520 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !505, file: !402, line: 733, baseType: !521)
!521 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !523, file: !522, line: 184, baseType: !245)
!522 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/stl_iterator_base_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!523 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iterator_traits<latLong *>", scope: !14, file: !522, line: 178, size: 8, align: 8, elements: !16, templateParams: !524, identifier: "_ZTSSt15iterator_traitsIP7latLongE")
!524 = !{!525}
!525 = !DITemplateTypeParameter(name: "_Iterator", type: !242)
!526 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !527, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!527 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !505)
!528 = !DISubprogram(name: "operator->", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEptEv", scope: !505, file: !402, line: 757, type: !529, isLocal: false, isDefinition: false, scopeLine: 757, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!529 = !DISubroutineType(types: !530)
!530 = !{!531, !526}
!531 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !505, file: !402, line: 734, baseType: !532)
!532 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !523, file: !522, line: 183, baseType: !242)
!533 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEppEv", scope: !505, file: !402, line: 761, type: !534, isLocal: false, isDefinition: false, scopeLine: 761, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!534 = !DISubroutineType(types: !535)
!535 = !{!536, !511}
!536 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !505, size: 64, align: 64)
!537 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEppEi", scope: !505, file: !402, line: 768, type: !538, isLocal: false, isDefinition: false, scopeLine: 768, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!538 = !DISubroutineType(types: !539)
!539 = !{!505, !511, !540}
!540 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!541 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEmmEv", scope: !505, file: !402, line: 773, type: !534, isLocal: false, isDefinition: false, scopeLine: 773, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!542 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEmmEi", scope: !505, file: !402, line: 780, type: !538, isLocal: false, isDefinition: false, scopeLine: 780, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!543 = !DISubprogram(name: "operator[]", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEixEl", scope: !505, file: !402, line: 785, type: !544, isLocal: false, isDefinition: false, scopeLine: 785, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!544 = !DISubroutineType(types: !545)
!545 = !{!520, !526, !546}
!546 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !505, file: !402, line: 732, baseType: !547)
!547 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !523, file: !522, line: 182, baseType: !548)
!548 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !14, file: !57, line: 197, baseType: !549)
!549 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!550 = !DISubprogram(name: "operator+=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEpLEl", scope: !505, file: !402, line: 789, type: !551, isLocal: false, isDefinition: false, scopeLine: 789, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!551 = !DISubroutineType(types: !552)
!552 = !{!536, !511, !546}
!553 = !DISubprogram(name: "operator+", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEplEl", scope: !505, file: !402, line: 793, type: !554, isLocal: false, isDefinition: false, scopeLine: 793, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!554 = !DISubroutineType(types: !555)
!555 = !{!505, !526, !546}
!556 = !DISubprogram(name: "operator-=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEmIEl", scope: !505, file: !402, line: 797, type: !551, isLocal: false, isDefinition: false, scopeLine: 797, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!557 = !DISubprogram(name: "operator-", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEmiEl", scope: !505, file: !402, line: 801, type: !554, isLocal: false, isDefinition: false, scopeLine: 801, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!558 = !DISubprogram(name: "base", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv", scope: !505, file: !402, line: 805, type: !559, isLocal: false, isDefinition: false, scopeLine: 805, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!559 = !DISubroutineType(types: !560)
!560 = !{!515, !526}
!561 = !{!525, !562}
!562 = !DITemplateTypeParameter(name: "_Container", type: !362)
!563 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64, align: 64)
!564 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !565, file: !44, line: 231, baseType: !704)
!565 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "vector<record, std::allocator<record> >", scope: !14, file: !44, line: 214, size: 192, align: 64, elements: !566, templateParams: !199, identifier: "_ZTSSt6vectorI6recordSaIS0_EE")
!566 = !{!567, !568, !572, !578, !584, !589, !590, !594, !597, !600, !606, !607, !608, !613, !618, !619, !620, !623, !624, !627, !628, !631, !634, !640, !646, !649, !650, !651, !654, !657, !658, !659, !663, !669, !672, !673, !676, !679, !682, !685, !688, !689, !690, !691, !692, !695, !699, !702, !703}
!567 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !565, baseType: !45, flags: DIFlagProtected)
!568 = !DISubprogram(name: "vector", scope: !565, file: !44, line: 253, type: !569, isLocal: false, isDefinition: false, scopeLine: 253, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!569 = !DISubroutineType(types: !570)
!570 = !{null, !571}
!571 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !565, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!572 = !DISubprogram(name: "vector", scope: !565, file: !44, line: 264, type: !573, isLocal: false, isDefinition: false, scopeLine: 264, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!573 = !DISubroutineType(types: !574)
!574 = !{null, !571, !575}
!575 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !576, size: 64, align: 64)
!576 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !577)
!577 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !565, file: !44, line: 238, baseType: !63)
!578 = !DISubprogram(name: "vector", scope: !565, file: !44, line: 303, type: !579, isLocal: false, isDefinition: false, scopeLine: 303, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!579 = !DISubroutineType(types: !580)
!580 = !{null, !571, !359, !581, !575}
!581 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !582, size: 64, align: 64)
!582 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !583)
!583 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !565, file: !44, line: 226, baseType: !30)
!584 = !DISubprogram(name: "vector", scope: !565, file: !44, line: 318, type: !585, isLocal: false, isDefinition: false, scopeLine: 318, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!585 = !DISubroutineType(types: !586)
!586 = !{null, !571, !587}
!587 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !588, size: 64, align: 64)
!588 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !565)
!589 = !DISubprogram(name: "~vector", scope: !565, file: !44, line: 423, type: !569, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!590 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6vectorI6recordSaIS0_EEaSERKS2_", scope: !565, file: !44, line: 436, type: !591, isLocal: false, isDefinition: false, scopeLine: 436, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!591 = !DISubroutineType(types: !592)
!592 = !{!593, !571, !587}
!593 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !565, size: 64, align: 64)
!594 = !DISubprogram(name: "assign", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6assignEmRKS0_", scope: !565, file: !44, line: 488, type: !595, isLocal: false, isDefinition: false, scopeLine: 488, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!595 = !DISubroutineType(types: !596)
!596 = !{null, !571, !359, !581}
!597 = !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5beginEv", scope: !565, file: !44, line: 547, type: !598, isLocal: false, isDefinition: false, scopeLine: 547, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!598 = !DISubroutineType(types: !599)
!599 = !{!564, !571}
!600 = !DISubprogram(name: "begin", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE5beginEv", scope: !565, file: !44, line: 556, type: !601, isLocal: false, isDefinition: false, scopeLine: 556, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!601 = !DISubroutineType(types: !602)
!602 = !{!603, !605}
!603 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !565, file: !44, line: 233, baseType: !604)
!604 = !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<const record *, std::vector<record, std::allocator<record> > >", scope: !56, file: !402, line: 721, flags: DIFlagFwdDecl, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIPK6recordSt6vectorIS1_SaIS1_EEEE")
!605 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !588, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!606 = !DISubprogram(name: "end", linkageName: "_ZNSt6vectorI6recordSaIS0_EE3endEv", scope: !565, file: !44, line: 565, type: !598, isLocal: false, isDefinition: false, scopeLine: 565, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!607 = !DISubprogram(name: "end", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE3endEv", scope: !565, file: !44, line: 574, type: !601, isLocal: false, isDefinition: false, scopeLine: 574, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!608 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6rbeginEv", scope: !565, file: !44, line: 583, type: !609, isLocal: false, isDefinition: false, scopeLine: 583, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!609 = !DISubroutineType(types: !610)
!610 = !{!611, !571}
!611 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !565, file: !44, line: 235, baseType: !612)
!612 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<record *, std::vector<record, std::allocator<record> > > >", scope: !14, file: !402, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS2_SaIS2_EEEEE")
!613 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE6rbeginEv", scope: !565, file: !44, line: 592, type: !614, isLocal: false, isDefinition: false, scopeLine: 592, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!614 = !DISubroutineType(types: !615)
!615 = !{!616, !605}
!616 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !565, file: !44, line: 234, baseType: !617)
!617 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<const record *, std::vector<record, std::allocator<record> > > >", scope: !14, file: !402, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPK6recordSt6vectorIS2_SaIS2_EEEEE")
!618 = !DISubprogram(name: "rend", linkageName: "_ZNSt6vectorI6recordSaIS0_EE4rendEv", scope: !565, file: !44, line: 601, type: !609, isLocal: false, isDefinition: false, scopeLine: 601, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!619 = !DISubprogram(name: "rend", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4rendEv", scope: !565, file: !44, line: 610, type: !614, isLocal: false, isDefinition: false, scopeLine: 610, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!620 = !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4sizeEv", scope: !565, file: !44, line: 654, type: !621, isLocal: false, isDefinition: false, scopeLine: 654, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!621 = !DISubroutineType(types: !622)
!622 = !{!359, !605}
!623 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv", scope: !565, file: !44, line: 659, type: !621, isLocal: false, isDefinition: false, scopeLine: 659, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!624 = !DISubprogram(name: "resize", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6resizeEmS0_", scope: !565, file: !44, line: 713, type: !625, isLocal: false, isDefinition: false, scopeLine: 713, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!625 = !DISubroutineType(types: !626)
!626 = !{null, !571, !359, !583}
!627 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE8capacityEv", scope: !565, file: !44, line: 734, type: !621, isLocal: false, isDefinition: false, scopeLine: 734, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!628 = !DISubprogram(name: "empty", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE5emptyEv", scope: !565, file: !44, line: 743, type: !629, isLocal: false, isDefinition: false, scopeLine: 743, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!629 = !DISubroutineType(types: !630)
!630 = !{!429, !605}
!631 = !DISubprogram(name: "reserve", linkageName: "_ZNSt6vectorI6recordSaIS0_EE7reserveEm", scope: !565, file: !44, line: 764, type: !632, isLocal: false, isDefinition: false, scopeLine: 764, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!632 = !DISubroutineType(types: !633)
!633 = !{null, !571, !359}
!634 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorI6recordSaIS0_EEixEm", scope: !565, file: !44, line: 779, type: !635, isLocal: false, isDefinition: false, scopeLine: 779, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!635 = !DISubroutineType(types: !636)
!636 = !{!637, !571, !359}
!637 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !565, file: !44, line: 229, baseType: !638)
!638 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !55, file: !54, line: 175, baseType: !639)
!639 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !63, file: !64, line: 99, baseType: !87)
!640 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt6vectorI6recordSaIS0_EEixEm", scope: !565, file: !44, line: 794, type: !641, isLocal: false, isDefinition: false, scopeLine: 794, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!641 = !DISubroutineType(types: !642)
!642 = !{!643, !605, !359}
!643 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !565, file: !44, line: 230, baseType: !644)
!644 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !55, file: !54, line: 176, baseType: !645)
!645 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !63, file: !64, line: 100, baseType: !95)
!646 = !DISubprogram(name: "_M_range_check", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE14_M_range_checkEm", scope: !565, file: !44, line: 800, type: !647, isLocal: false, isDefinition: false, scopeLine: 800, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!647 = !DISubroutineType(types: !648)
!648 = !{null, !605, !359}
!649 = !DISubprogram(name: "at", linkageName: "_ZNSt6vectorI6recordSaIS0_EE2atEm", scope: !565, file: !44, line: 822, type: !635, isLocal: false, isDefinition: false, scopeLine: 822, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!650 = !DISubprogram(name: "at", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE2atEm", scope: !565, file: !44, line: 840, type: !641, isLocal: false, isDefinition: false, scopeLine: 840, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!651 = !DISubprogram(name: "front", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5frontEv", scope: !565, file: !44, line: 851, type: !652, isLocal: false, isDefinition: false, scopeLine: 851, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!652 = !DISubroutineType(types: !653)
!653 = !{!637, !571}
!654 = !DISubprogram(name: "front", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE5frontEv", scope: !565, file: !44, line: 859, type: !655, isLocal: false, isDefinition: false, scopeLine: 859, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!655 = !DISubroutineType(types: !656)
!656 = !{!643, !605}
!657 = !DISubprogram(name: "back", linkageName: "_ZNSt6vectorI6recordSaIS0_EE4backEv", scope: !565, file: !44, line: 867, type: !652, isLocal: false, isDefinition: false, scopeLine: 867, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!658 = !DISubprogram(name: "back", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4backEv", scope: !565, file: !44, line: 875, type: !655, isLocal: false, isDefinition: false, scopeLine: 875, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!659 = !DISubprogram(name: "data", linkageName: "_ZNSt6vectorI6recordSaIS0_EE4dataEv", scope: !565, file: !44, line: 890, type: !660, isLocal: false, isDefinition: false, scopeLine: 890, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!660 = !DISubroutineType(types: !661)
!661 = !{!662, !571}
!662 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !565, file: !44, line: 227, baseType: !52)
!663 = !DISubprogram(name: "data", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4dataEv", scope: !565, file: !44, line: 898, type: !664, isLocal: false, isDefinition: false, scopeLine: 898, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!664 = !DISubroutineType(types: !665)
!665 = !{!666, !605}
!666 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !565, file: !44, line: 228, baseType: !667)
!667 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !55, file: !54, line: 173, baseType: !668)
!668 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !63, file: !64, line: 98, baseType: !92)
!669 = !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorI6recordSaIS0_EE9push_backERKS0_", scope: !565, file: !44, line: 913, type: !670, isLocal: false, isDefinition: false, scopeLine: 913, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!670 = !DISubroutineType(types: !671)
!671 = !{null, !571, !581}
!672 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt6vectorI6recordSaIS0_EE8pop_backEv", scope: !565, file: !44, line: 949, type: !569, isLocal: false, isDefinition: false, scopeLine: 949, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!673 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !565, file: !44, line: 998, type: !674, isLocal: false, isDefinition: false, scopeLine: 998, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!674 = !DISubroutineType(types: !675)
!675 = !{!564, !571, !564, !581}
!676 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EEmRKS0_", scope: !565, file: !44, line: 1072, type: !677, isLocal: false, isDefinition: false, scopeLine: 1072, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!677 = !DISubroutineType(types: !678)
!678 = !{null, !571, !564, !359, !581}
!679 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EE", scope: !565, file: !44, line: 1149, type: !680, isLocal: false, isDefinition: false, scopeLine: 1149, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!680 = !DISubroutineType(types: !681)
!681 = !{!564, !571, !564}
!682 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EES6_", scope: !565, file: !44, line: 1180, type: !683, isLocal: false, isDefinition: false, scopeLine: 1180, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!683 = !DISubroutineType(types: !684)
!684 = !{!564, !571, !564, !564}
!685 = !DISubprogram(name: "swap", linkageName: "_ZNSt6vectorI6recordSaIS0_EE4swapERS2_", scope: !565, file: !44, line: 1194, type: !686, isLocal: false, isDefinition: false, scopeLine: 1194, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!686 = !DISubroutineType(types: !687)
!687 = !{null, !571, !593}
!688 = !DISubprogram(name: "clear", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5clearEv", scope: !565, file: !44, line: 1211, type: !569, isLocal: false, isDefinition: false, scopeLine: 1211, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!689 = !DISubprogram(name: "_M_fill_initialize", linkageName: "_ZNSt6vectorI6recordSaIS0_EE18_M_fill_initializeEmRKS0_", scope: !565, file: !44, line: 1298, type: !595, isLocal: false, isDefinition: false, scopeLine: 1298, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!690 = !DISubprogram(name: "_M_fill_assign", linkageName: "_ZNSt6vectorI6recordSaIS0_EE14_M_fill_assignEmRKS0_", scope: !565, file: !44, line: 1354, type: !595, isLocal: false, isDefinition: false, scopeLine: 1354, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!691 = !DISubprogram(name: "_M_fill_insert", linkageName: "_ZNSt6vectorI6recordSaIS0_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EEmRKS0_", scope: !565, file: !44, line: 1395, type: !677, isLocal: false, isDefinition: false, scopeLine: 1395, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!692 = !DISubprogram(name: "_M_insert_aux", linkageName: "_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !565, file: !44, line: 1409, type: !693, isLocal: false, isDefinition: false, scopeLine: 1409, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !571, !564, !581}
!695 = !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE12_M_check_lenEmPKc", scope: !565, file: !44, line: 1422, type: !696, isLocal: false, isDefinition: false, scopeLine: 1422, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!696 = !DISubroutineType(types: !697)
!697 = !{!698, !605, !359, !498}
!698 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !565, file: !44, line: 236, baseType: !100)
!699 = !DISubprogram(name: "_M_erase_at_end", linkageName: "_ZNSt6vectorI6recordSaIS0_EE15_M_erase_at_endEPS0_", scope: !565, file: !44, line: 1436, type: !700, isLocal: false, isDefinition: false, scopeLine: 1436, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!700 = !DISubroutineType(types: !701)
!701 = !{null, !571, !662}
!702 = !DISubprogram(name: "_M_erase", linkageName: "_ZNSt6vectorI6recordSaIS0_EE8_M_eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EE", scope: !565, file: !44, line: 1443, type: !680, isLocal: false, isDefinition: false, scopeLine: 1443, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!703 = !DISubprogram(name: "_M_erase", linkageName: "_ZNSt6vectorI6recordSaIS0_EE8_M_eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EES6_", scope: !565, file: !44, line: 1446, type: !683, isLocal: false, isDefinition: false, scopeLine: 1446, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: false)
!704 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<record *, std::vector<record, std::allocator<record> > >", scope: !56, file: !402, line: 721, size: 64, align: 64, elements: !705, templateParams: !756, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEE")
!705 = !{!706, !707, !711, !716, !726, !731, !735, !738, !739, !740, !745, !748, !751, !752, !753}
!706 = !DIDerivedType(tag: DW_TAG_member, name: "_M_current", scope: !704, file: !402, line: 724, baseType: !84, size: 64, align: 64, flags: DIFlagProtected)
!707 = !DISubprogram(name: "__normal_iterator", scope: !704, file: !402, line: 736, type: !708, isLocal: false, isDefinition: false, scopeLine: 736, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!708 = !DISubroutineType(types: !709)
!709 = !{null, !710}
!710 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !704, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!711 = !DISubprogram(name: "__normal_iterator", scope: !704, file: !402, line: 740, type: !712, isLocal: false, isDefinition: false, scopeLine: 740, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!712 = !DISubroutineType(types: !713)
!713 = !{null, !710, !714}
!714 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !715, size: 64, align: 64)
!715 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !84)
!716 = !DISubprogram(name: "operator*", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEdeEv", scope: !704, file: !402, line: 753, type: !717, isLocal: false, isDefinition: false, scopeLine: 753, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!717 = !DISubroutineType(types: !718)
!718 = !{!719, !724}
!719 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !704, file: !402, line: 733, baseType: !720)
!720 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !721, file: !522, line: 184, baseType: !87)
!721 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iterator_traits<record *>", scope: !14, file: !522, line: 178, size: 8, align: 8, elements: !16, templateParams: !722, identifier: "_ZTSSt15iterator_traitsIP6recordE")
!722 = !{!723}
!723 = !DITemplateTypeParameter(name: "_Iterator", type: !84)
!724 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !725, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!725 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !704)
!726 = !DISubprogram(name: "operator->", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEptEv", scope: !704, file: !402, line: 757, type: !727, isLocal: false, isDefinition: false, scopeLine: 757, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!727 = !DISubroutineType(types: !728)
!728 = !{!729, !724}
!729 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !704, file: !402, line: 734, baseType: !730)
!730 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !721, file: !522, line: 183, baseType: !84)
!731 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEppEv", scope: !704, file: !402, line: 761, type: !732, isLocal: false, isDefinition: false, scopeLine: 761, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!732 = !DISubroutineType(types: !733)
!733 = !{!734, !710}
!734 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !704, size: 64, align: 64)
!735 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEppEi", scope: !704, file: !402, line: 768, type: !736, isLocal: false, isDefinition: false, scopeLine: 768, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!736 = !DISubroutineType(types: !737)
!737 = !{!704, !710, !540}
!738 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEmmEv", scope: !704, file: !402, line: 773, type: !732, isLocal: false, isDefinition: false, scopeLine: 773, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!739 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEmmEi", scope: !704, file: !402, line: 780, type: !736, isLocal: false, isDefinition: false, scopeLine: 780, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!740 = !DISubprogram(name: "operator[]", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEixEl", scope: !704, file: !402, line: 785, type: !741, isLocal: false, isDefinition: false, scopeLine: 785, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!741 = !DISubroutineType(types: !742)
!742 = !{!719, !724, !743}
!743 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !704, file: !402, line: 732, baseType: !744)
!744 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !721, file: !522, line: 182, baseType: !548)
!745 = !DISubprogram(name: "operator+=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEpLEl", scope: !704, file: !402, line: 789, type: !746, isLocal: false, isDefinition: false, scopeLine: 789, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!746 = !DISubroutineType(types: !747)
!747 = !{!734, !710, !743}
!748 = !DISubprogram(name: "operator+", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEplEl", scope: !704, file: !402, line: 793, type: !749, isLocal: false, isDefinition: false, scopeLine: 793, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!749 = !DISubroutineType(types: !750)
!750 = !{!704, !724, !743}
!751 = !DISubprogram(name: "operator-=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEmIEl", scope: !704, file: !402, line: 797, type: !746, isLocal: false, isDefinition: false, scopeLine: 797, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!752 = !DISubprogram(name: "operator-", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEmiEl", scope: !704, file: !402, line: 801, type: !749, isLocal: false, isDefinition: false, scopeLine: 801, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!753 = !DISubprogram(name: "base", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv", scope: !704, file: !402, line: 805, type: !754, isLocal: false, isDefinition: false, scopeLine: 805, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!754 = !DISubroutineType(types: !755)
!755 = !{!714, !724}
!756 = !{!723, !757}
!757 = !DITemplateTypeParameter(name: "_Container", type: !565)
!758 = !{!759, !764, !768, !770, !772, !774, !776, !780, !782, !784, !786, !788, !790, !792, !794, !796, !798, !800, !802, !804, !806, !808, !812, !814, !816, !818, !822, !827, !829, !831, !835, !839, !841, !843, !845, !847, !849, !851, !853, !855, !859, !863, !865, !867, !871, !873, !875, !877, !879, !881, !885, !887, !889, !893, !898, !902, !904, !906, !910, !912, !914, !918, !920, !922, !926, !928, !930, !932, !934, !936, !938, !940, !942, !944, !949, !951, !953, !957, !959, !961, !963, !965, !967, !969, !971, !975, !979, !981, !983, !988, !990, !992, !994, !996, !998, !1000, !1004, !1010, !1014, !1018, !1023, !1025, !1029, !1033, !1043, !1047, !1051, !1055, !1059, !1064, !1066, !1070, !1074, !1078, !1086, !1090, !1094, !1098, !1102, !1107, !1113, !1117, !1121, !1123, !1131, !1135, !1141, !1143, !1145, !1149, !1153, !1157, !1162, !1166, !1171, !1172, !1173, !1174, !1177, !1178, !1179, !1180, !1181, !1182, !1183, !1186, !1188, !1190, !1192, !1194, !1196, !1198, !1200, !1203, !1205, !1207, !1209, !1211, !1213, !1215, !1217, !1219, !1221, !1223, !1225, !1227, !1229, !1231, !1233, !1235, !1237, !1239, !1241, !1243, !1245, !1247, !1249, !1251, !1253, !1255, !1257, !1259, !1261, !1263, !1265, !1267, !1271, !1272, !1274, !1276, !1278, !1280, !1282, !1284, !1286, !1288, !1290, !1292, !1294, !1296, !1298, !1300, !1304, !1305}
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !760, line: 189)
!760 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !15, file: !15, line: 44, type: !761, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!761 = !DISubroutineType(types: !762)
!762 = !{!763, !763}
!763 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !765, line: 190)
!765 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !15, file: !15, line: 46, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!766 = !DISubroutineType(types: !767)
!767 = !{!22, !22}
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !769, line: 191)
!769 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !15, file: !15, line: 48, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !771, line: 192)
!771 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !15, file: !15, line: 50, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !773, line: 193)
!773 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !15, file: !15, line: 52, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !775, line: 194)
!775 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !15, file: !15, line: 56, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !777, line: 195)
!777 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !15, file: !15, line: 54, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!778 = !DISubroutineType(types: !779)
!779 = !{!22, !22, !22}
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !781, line: 196)
!781 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !15, file: !15, line: 58, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !783, line: 197)
!783 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !15, file: !15, line: 60, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !785, line: 198)
!785 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !15, file: !15, line: 62, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !787, line: 199)
!787 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !15, file: !15, line: 64, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !789, line: 200)
!789 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !15, file: !15, line: 66, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !791, line: 201)
!791 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !15, file: !15, line: 68, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !793, line: 202)
!793 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !15, file: !15, line: 72, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !795, line: 203)
!795 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !15, file: !15, line: 70, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !797, line: 204)
!797 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !15, file: !15, line: 76, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !799, line: 205)
!799 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !15, file: !15, line: 74, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !801, line: 206)
!801 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !15, file: !15, line: 78, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !803, line: 207)
!803 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !15, file: !15, line: 80, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !805, line: 208)
!805 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !15, file: !15, line: 82, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !807, line: 209)
!807 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !15, file: !15, line: 84, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !809, line: 210)
!809 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !15, file: !15, line: 86, type: !810, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!810 = !DISubroutineType(types: !811)
!811 = !{!22, !22, !22, !22}
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !813, line: 211)
!813 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !15, file: !15, line: 88, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !815, line: 212)
!815 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !15, file: !15, line: 90, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !817, line: 213)
!817 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !15, file: !15, line: 92, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !819, line: 214)
!819 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !15, file: !15, line: 94, type: !820, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!820 = !DISubroutineType(types: !821)
!821 = !{!540, !22}
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !823, line: 215)
!823 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !15, file: !15, line: 96, type: !824, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!824 = !DISubroutineType(types: !825)
!825 = !{!22, !22, !826}
!826 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !540, size: 64, align: 64)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !828, line: 216)
!828 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !15, file: !15, line: 98, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !830, line: 217)
!830 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !15, file: !15, line: 100, type: !820, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !832, line: 218)
!832 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !15, file: !15, line: 102, type: !833, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!833 = !DISubroutineType(types: !834)
!834 = !{!429, !22}
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !836, line: 219)
!836 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !15, file: !15, line: 106, type: !837, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!837 = !DISubroutineType(types: !838)
!838 = !{!429, !22, !22}
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !840, line: 220)
!840 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !15, file: !15, line: 105, type: !837, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !842, line: 221)
!842 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !15, file: !15, line: 108, type: !833, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !844, line: 222)
!844 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !15, file: !15, line: 112, type: !837, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !846, line: 223)
!846 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !15, file: !15, line: 111, type: !837, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !848, line: 224)
!848 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !15, file: !15, line: 114, type: !837, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !850, line: 225)
!850 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !15, file: !15, line: 116, type: !833, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !852, line: 226)
!852 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !15, file: !15, line: 118, type: !833, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !854, line: 227)
!854 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !15, file: !15, line: 120, type: !837, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !856, line: 228)
!856 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !15, file: !15, line: 121, type: !857, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!857 = !DISubroutineType(types: !858)
!858 = !{!549, !549}
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !860, line: 229)
!860 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !15, file: !15, line: 123, type: !861, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!861 = !DISubroutineType(types: !862)
!862 = !{!22, !22, !540}
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !864, line: 230)
!864 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !15, file: !15, line: 125, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !866, line: 231)
!866 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !15, file: !15, line: 126, type: !761, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !868, line: 232)
!868 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !15, file: !15, line: 128, type: !869, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!869 = !DISubroutineType(types: !870)
!870 = !{!763, !22}
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !872, line: 233)
!872 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !15, file: !15, line: 138, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !874, line: 234)
!874 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !15, file: !15, line: 130, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !876, line: 235)
!876 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !15, file: !15, line: 132, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !878, line: 236)
!878 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !15, file: !15, line: 134, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !880, line: 237)
!880 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !15, file: !15, line: 136, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !882, line: 238)
!882 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !15, file: !15, line: 140, type: !883, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!883 = !DISubroutineType(types: !884)
!884 = !{!549, !22}
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !886, line: 239)
!886 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !15, file: !15, line: 142, type: !883, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !888, line: 240)
!888 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !15, file: !15, line: 143, type: !869, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !890, line: 241)
!890 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !15, file: !15, line: 145, type: !891, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!891 = !DISubroutineType(types: !892)
!892 = !{!22, !22, !39}
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !894, line: 242)
!894 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !15, file: !15, line: 146, type: !895, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!895 = !DISubroutineType(types: !896)
!896 = !{!897, !498}
!897 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !899, line: 243)
!899 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !15, file: !15, line: 147, type: !900, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!900 = !DISubroutineType(types: !901)
!901 = !{!22, !498}
!902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !903, line: 244)
!903 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !15, file: !15, line: 149, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !905, line: 245)
!905 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !15, file: !15, line: 151, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !907, line: 246)
!907 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !15, file: !15, line: 153, type: !908, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!908 = !DISubroutineType(types: !909)
!909 = !{!22, !22, !897}
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !911, line: 247)
!911 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !15, file: !15, line: 158, type: !861, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !913, line: 248)
!913 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !15, file: !15, line: 160, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !915, line: 249)
!915 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !15, file: !15, line: 162, type: !916, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!916 = !DISubroutineType(types: !917)
!917 = !{!22, !22, !22, !826}
!918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !919, line: 250)
!919 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !15, file: !15, line: 164, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !921, line: 251)
!921 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !15, file: !15, line: 166, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !923, line: 252)
!923 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !15, file: !15, line: 168, type: !924, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!924 = !DISubroutineType(types: !925)
!925 = !{!22, !22, !549}
!926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !927, line: 253)
!927 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !15, file: !15, line: 170, type: !861, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !929, line: 254)
!929 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !15, file: !15, line: 172, type: !833, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !931, line: 255)
!931 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !15, file: !15, line: 174, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !933, line: 256)
!933 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !15, file: !15, line: 176, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !935, line: 257)
!935 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !15, file: !15, line: 178, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!936 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !937, line: 258)
!937 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !15, file: !15, line: 180, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !939, line: 259)
!939 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !15, file: !15, line: 182, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !941, line: 260)
!941 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !15, file: !15, line: 184, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !943, line: 261)
!943 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !15, file: !15, line: 186, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!944 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !945, line: 102)
!945 = !DISubprogram(name: "acos", scope: !946, file: !946, line: 54, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!946 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!947 = !DISubroutineType(types: !948)
!948 = !{!897, !897}
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !950, line: 121)
!950 = !DISubprogram(name: "asin", scope: !946, file: !946, line: 56, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !952, line: 140)
!952 = !DISubprogram(name: "atan", scope: !946, file: !946, line: 58, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !954, line: 159)
!954 = !DISubprogram(name: "atan2", scope: !946, file: !946, line: 60, type: !955, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!955 = !DISubroutineType(types: !956)
!956 = !{!897, !897, !897}
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !958, line: 180)
!958 = !DISubprogram(name: "ceil", scope: !946, file: !946, line: 178, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !960, line: 199)
!960 = !DISubprogram(name: "cos", scope: !946, file: !946, line: 63, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !962, line: 218)
!962 = !DISubprogram(name: "cosh", scope: !946, file: !946, line: 72, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !964, line: 237)
!964 = !DISubprogram(name: "exp", scope: !946, file: !946, line: 100, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !966, line: 256)
!966 = !DISubprogram(name: "fabs", scope: !946, file: !946, line: 181, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !968, line: 275)
!968 = !DISubprogram(name: "floor", scope: !946, file: !946, line: 184, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !970, line: 294)
!970 = !DISubprogram(name: "fmod", scope: !946, file: !946, line: 187, type: !955, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !972, line: 315)
!972 = !DISubprogram(name: "frexp", scope: !946, file: !946, line: 103, type: !973, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!973 = !DISubroutineType(types: !974)
!974 = !{!897, !897, !826}
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !976, line: 334)
!976 = !DISubprogram(name: "ldexp", scope: !946, file: !946, line: 106, type: !977, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!977 = !DISubroutineType(types: !978)
!978 = !{!897, !897, !540}
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !980, line: 353)
!980 = !DISubprogram(name: "log", scope: !946, file: !946, line: 109, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !982, line: 372)
!982 = !DISubprogram(name: "log10", scope: !946, file: !946, line: 112, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !984, line: 391)
!984 = !DISubprogram(name: "modf", scope: !946, file: !946, line: 115, type: !985, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!985 = !DISubroutineType(types: !986)
!986 = !{!897, !897, !987}
!987 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !897, size: 64, align: 64)
!988 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !989, line: 403)
!989 = !DISubprogram(name: "pow", scope: !946, file: !946, line: 153, type: !955, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !991, line: 440)
!991 = !DISubprogram(name: "sin", scope: !946, file: !946, line: 65, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !993, line: 459)
!993 = !DISubprogram(name: "sinh", scope: !946, file: !946, line: 74, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !995, line: 478)
!995 = !DISubprogram(name: "sqrt", scope: !946, file: !946, line: 156, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !997, line: 497)
!997 = !DISubprogram(name: "tan", scope: !946, file: !946, line: 67, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !999, line: 516)
!999 = !DISubprogram(name: "tanh", scope: !946, file: !946, line: 76, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1001, line: 118)
!1001 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1002, line: 101, baseType: !1003)
!1002 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!1003 = !DICompositeType(tag: DW_TAG_structure_type, file: !1002, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1005, line: 119)
!1005 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1002, line: 109, baseType: !1006)
!1006 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1002, line: 105, size: 128, align: 64, elements: !1007, identifier: "_ZTS6ldiv_t")
!1007 = !{!1008, !1009}
!1008 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1006, file: !1002, line: 107, baseType: !549, size: 64, align: 64)
!1009 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1006, file: !1002, line: 108, baseType: !549, size: 64, align: 64, offset: 64)
!1010 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1011, line: 121)
!1011 = !DISubprogram(name: "abort", scope: !1002, file: !1002, line: 515, type: !1012, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!1012 = !DISubroutineType(types: !1013)
!1013 = !{null}
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1015, line: 122)
!1015 = !DISubprogram(name: "abs", scope: !1002, file: !1002, line: 774, type: !1016, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!540, !540}
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1019, line: 123)
!1019 = !DISubprogram(name: "atexit", scope: !1002, file: !1002, line: 519, type: !1020, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1020 = !DISubroutineType(types: !1021)
!1021 = !{!540, !1022}
!1022 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1012, size: 64, align: 64)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1024, line: 129)
!1024 = !DISubprogram(name: "atof", scope: !1002, file: !1002, line: 144, type: !895, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1026, line: 130)
!1026 = !DISubprogram(name: "atoi", scope: !1002, file: !1002, line: 147, type: !1027, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1027 = !DISubroutineType(types: !1028)
!1028 = !{!540, !498}
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1030, line: 131)
!1030 = !DISubprogram(name: "atol", scope: !1002, file: !1002, line: 150, type: !1031, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1031 = !DISubroutineType(types: !1032)
!1032 = !{!549, !498}
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1034, line: 132)
!1034 = !DISubprogram(name: "bsearch", scope: !1002, file: !1002, line: 754, type: !1035, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1035 = !DISubroutineType(types: !1036)
!1036 = !{!41, !102, !102, !1037, !1037, !1039}
!1037 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1038, line: 62, baseType: !101)
!1038 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!1039 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !1002, line: 741, baseType: !1040)
!1040 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1041, size: 64, align: 64)
!1041 = !DISubroutineType(types: !1042)
!1042 = !{!540, !102, !102}
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1044, line: 133)
!1044 = !DISubprogram(name: "calloc", scope: !1002, file: !1002, line: 468, type: !1045, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1045 = !DISubroutineType(types: !1046)
!1046 = !{!41, !1037, !1037}
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1048, line: 134)
!1048 = !DISubprogram(name: "div", scope: !1002, file: !1002, line: 788, type: !1049, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1049 = !DISubroutineType(types: !1050)
!1050 = !{!1001, !540, !540}
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1052, line: 135)
!1052 = !DISubprogram(name: "exit", scope: !1002, file: !1002, line: 543, type: !1053, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!1053 = !DISubroutineType(types: !1054)
!1054 = !{null, !540}
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1056, line: 136)
!1056 = !DISubprogram(name: "free", scope: !1002, file: !1002, line: 483, type: !1057, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1057 = !DISubroutineType(types: !1058)
!1058 = !{null, !41}
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1060, line: 137)
!1060 = !DISubprogram(name: "getenv", scope: !1002, file: !1002, line: 564, type: !1061, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1061 = !DISubroutineType(types: !1062)
!1062 = !{!1063, !498}
!1063 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64, align: 64)
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1065, line: 138)
!1065 = !DISubprogram(name: "labs", scope: !1002, file: !1002, line: 775, type: !857, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1067, line: 139)
!1067 = !DISubprogram(name: "ldiv", scope: !1002, file: !1002, line: 790, type: !1068, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1068 = !DISubroutineType(types: !1069)
!1069 = !{!1005, !549, !549}
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1071, line: 140)
!1071 = !DISubprogram(name: "malloc", scope: !1002, file: !1002, line: 466, type: !1072, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{!41, !1037}
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1075, line: 142)
!1075 = !DISubprogram(name: "mblen", scope: !1002, file: !1002, line: 862, type: !1076, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1076 = !DISubroutineType(types: !1077)
!1077 = !{!540, !498, !1037}
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1079, line: 143)
!1079 = !DISubprogram(name: "mbstowcs", scope: !1002, file: !1002, line: 873, type: !1080, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!1037, !1082, !1085, !1037}
!1082 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1083)
!1083 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1084, size: 64, align: 64)
!1084 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!1085 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !498)
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1087, line: 144)
!1087 = !DISubprogram(name: "mbtowc", scope: !1002, file: !1002, line: 865, type: !1088, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1088 = !DISubroutineType(types: !1089)
!1089 = !{!540, !1082, !1085, !1037}
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1091, line: 146)
!1091 = !DISubprogram(name: "qsort", scope: !1002, file: !1002, line: 764, type: !1092, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1092 = !DISubroutineType(types: !1093)
!1093 = !{null, !41, !1037, !1037, !1039}
!1094 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1095, line: 152)
!1095 = !DISubprogram(name: "rand", scope: !1002, file: !1002, line: 374, type: !1096, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1096 = !DISubroutineType(types: !1097)
!1097 = !{!540}
!1098 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1099, line: 153)
!1099 = !DISubprogram(name: "realloc", scope: !1002, file: !1002, line: 480, type: !1100, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1100 = !DISubroutineType(types: !1101)
!1101 = !{!41, !41, !1037}
!1102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1103, line: 154)
!1103 = !DISubprogram(name: "srand", scope: !1002, file: !1002, line: 376, type: !1104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1104 = !DISubroutineType(types: !1105)
!1105 = !{null, !1106}
!1106 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1108, line: 155)
!1108 = !DISubprogram(name: "strtod", scope: !1002, file: !1002, line: 164, type: !1109, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1109 = !DISubroutineType(types: !1110)
!1110 = !{!897, !1085, !1111}
!1111 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1112)
!1112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1063, size: 64, align: 64)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1114, line: 156)
!1114 = !DISubprogram(name: "strtol", scope: !1002, file: !1002, line: 183, type: !1115, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1115 = !DISubroutineType(types: !1116)
!1116 = !{!549, !1085, !1111, !540}
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1118, line: 157)
!1118 = !DISubprogram(name: "strtoul", scope: !1002, file: !1002, line: 187, type: !1119, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1119 = !DISubroutineType(types: !1120)
!1120 = !{!101, !1085, !1111, !540}
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1122, line: 158)
!1122 = !DISubprogram(name: "system", scope: !1002, file: !1002, line: 716, type: !1027, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1124, line: 160)
!1124 = !DISubprogram(name: "wcstombs", scope: !1002, file: !1002, line: 876, type: !1125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1125 = !DISubroutineType(types: !1126)
!1126 = !{!1037, !1127, !1128, !1037}
!1127 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1063)
!1128 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1129)
!1129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1130, size: 64, align: 64)
!1130 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1084)
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1132, line: 161)
!1132 = !DISubprogram(name: "wctomb", scope: !1002, file: !1002, line: 869, type: !1133, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1133 = !DISubroutineType(types: !1134)
!1134 = !{!540, !1063, !1084}
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !56, entity: !1136, line: 214)
!1136 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1002, line: 121, baseType: !1137)
!1137 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1002, line: 117, size: 128, align: 64, elements: !1138, identifier: "_ZTS7lldiv_t")
!1138 = !{!1139, !1140}
!1139 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1137, file: !1002, line: 119, baseType: !763, size: 64, align: 64)
!1140 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1137, file: !1002, line: 120, baseType: !763, size: 64, align: 64, offset: 64)
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !56, entity: !1142, line: 220)
!1142 = !DISubprogram(name: "_Exit", scope: !1002, file: !1002, line: 557, type: !1053, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !56, entity: !1144, line: 224)
!1144 = !DISubprogram(name: "llabs", scope: !1002, file: !1002, line: 779, type: !761, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !56, entity: !1146, line: 230)
!1146 = !DISubprogram(name: "lldiv", scope: !1002, file: !1002, line: 796, type: !1147, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1147 = !DISubroutineType(types: !1148)
!1148 = !{!1136, !763, !763}
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !56, entity: !1150, line: 241)
!1150 = !DISubprogram(name: "atoll", scope: !1002, file: !1002, line: 157, type: !1151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1151 = !DISubroutineType(types: !1152)
!1152 = !{!763, !498}
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !56, entity: !1154, line: 242)
!1154 = !DISubprogram(name: "strtoll", scope: !1002, file: !1002, line: 209, type: !1155, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1155 = !DISubroutineType(types: !1156)
!1156 = !{!763, !1085, !1111, !540}
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !56, entity: !1158, line: 243)
!1158 = !DISubprogram(name: "strtoull", scope: !1002, file: !1002, line: 214, type: !1159, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1159 = !DISubroutineType(types: !1160)
!1160 = !{!1161, !1085, !1111, !540}
!1161 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !56, entity: !1163, line: 245)
!1163 = !DISubprogram(name: "strtof", scope: !1002, file: !1002, line: 172, type: !1164, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1164 = !DISubroutineType(types: !1165)
!1165 = !{!22, !1085, !1111}
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !56, entity: !1167, line: 246)
!1167 = !DISubprogram(name: "strtold", scope: !1002, file: !1002, line: 175, type: !1168, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1168 = !DISubroutineType(types: !1169)
!1169 = !{!1170, !1085, !1111}
!1170 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1136, line: 254)
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1142, line: 256)
!1173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1144, line: 258)
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1175, line: 259)
!1175 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !56, file: !1176, line: 227, type: !1147, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1176 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1146, line: 260)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1150, line: 262)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1163, line: 263)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1154, line: 264)
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1158, line: 265)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1167, line: 266)
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1184, line: 397)
!1184 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !1185, file: !1185, line: 1342, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1185 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1187, line: 398)
!1187 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !1185, file: !1185, line: 1370, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1189, line: 399)
!1189 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !1185, file: !1185, line: 1337, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1191, line: 400)
!1191 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !1185, file: !1185, line: 1375, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1193, line: 401)
!1193 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !1185, file: !1185, line: 1327, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1195, line: 402)
!1195 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !1185, file: !1185, line: 1332, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1197, line: 403)
!1197 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !1185, file: !1185, line: 1380, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1199, line: 404)
!1199 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !1185, file: !1185, line: 1430, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1201, line: 405)
!1201 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !1202, file: !1202, line: 667, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1202 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1204, line: 406)
!1204 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !1185, file: !1185, line: 1189, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1206, line: 407)
!1206 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !1185, file: !1185, line: 1243, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1208, line: 408)
!1208 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !1185, file: !1185, line: 1312, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1210, line: 409)
!1210 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !1185, file: !1185, line: 1490, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1212, line: 410)
!1212 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !1185, file: !1185, line: 1480, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1214, line: 411)
!1214 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !1202, file: !1202, line: 657, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1216, line: 412)
!1216 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !1185, file: !1185, line: 1294, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1218, line: 413)
!1218 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !1185, file: !1185, line: 1385, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1220, line: 414)
!1220 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !1202, file: !1202, line: 607, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1222, line: 415)
!1222 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !1185, file: !1185, line: 1616, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1224, line: 416)
!1224 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !1202, file: !1202, line: 597, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1226, line: 417)
!1226 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !1185, file: !1185, line: 1568, type: !810, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1228, line: 418)
!1228 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !1202, file: !1202, line: 622, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1230, line: 419)
!1230 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !1202, file: !1202, line: 617, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1232, line: 420)
!1232 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !1185, file: !1185, line: 1553, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1234, line: 421)
!1234 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !1185, file: !1185, line: 1543, type: !824, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1236, line: 422)
!1236 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !1185, file: !1185, line: 1390, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1238, line: 423)
!1238 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !1185, file: !1185, line: 1621, type: !820, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1240, line: 424)
!1240 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !1185, file: !1185, line: 1520, type: !861, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1242, line: 425)
!1242 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !1185, file: !1185, line: 1515, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1244, line: 426)
!1244 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !1185, file: !1185, line: 1149, type: !869, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1246, line: 427)
!1246 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !1185, file: !1185, line: 1602, type: !869, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1248, line: 428)
!1248 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !1185, file: !1185, line: 1356, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1250, line: 429)
!1250 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !1185, file: !1185, line: 1365, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1252, line: 430)
!1252 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !1185, file: !1185, line: 1285, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1254, line: 431)
!1254 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !1185, file: !1185, line: 1626, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1256, line: 432)
!1256 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !1185, file: !1185, line: 1347, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1258, line: 433)
!1258 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !1185, file: !1185, line: 1140, type: !883, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1260, line: 434)
!1260 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !1185, file: !1185, line: 1607, type: !883, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1262, line: 435)
!1262 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !1185, file: !1185, line: 1548, type: !891, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1264, line: 436)
!1264 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !1185, file: !1185, line: 1154, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1266, line: 437)
!1266 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !1185, file: !1185, line: 1218, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1268, line: 438)
!1268 = !DISubprogram(name: "nexttowardf", scope: !946, file: !946, line: 294, type: !1269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1269 = !DISubroutineType(types: !1270)
!1270 = !{!22, !22, !1170}
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1268, line: 439)
!1272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1273, line: 440)
!1273 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !1185, file: !1185, line: 1583, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1275, line: 441)
!1275 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !1185, file: !1185, line: 1558, type: !778, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1277, line: 442)
!1277 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !1185, file: !1185, line: 1563, type: !916, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1279, line: 443)
!1279 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !1185, file: !1185, line: 1135, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1281, line: 444)
!1281 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !1185, file: !1185, line: 1597, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1283, line: 445)
!1283 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !1185, file: !1185, line: 1530, type: !924, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1285, line: 446)
!1285 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !1185, file: !1185, line: 1525, type: !861, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1287, line: 447)
!1287 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !1185, file: !1185, line: 1234, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1289, line: 448)
!1289 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !1185, file: !1185, line: 1317, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1291, line: 449)
!1291 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !1202, file: !1202, line: 907, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1293, line: 450)
!1293 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !1185, file: !1185, line: 1276, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1295, line: 451)
!1295 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !1185, file: !1185, line: 1322, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1297, line: 452)
!1297 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !1185, file: !1185, line: 1592, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1299, line: 453)
!1299 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !1202, file: !1202, line: 662, type: !766, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1300 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1301, entity: !1303, line: 56)
!1301 = !DINamespace(name: "__gnu_debug", scope: null, file: !1302, line: 54)
!1302 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/debug/debug.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!1303 = !DINamespace(name: "__debug", scope: !14, file: !1302, line: 48)
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !56, entity: !100, line: 44)
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !56, entity: !548, line: 45)
!1306 = !{i32 2, !"Dwarf Version", i32 4}
!1307 = !{i32 2, !"Debug Info Version", i32 3}
!1308 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!1309 = distinct !DISubprogram(name: "euclid", linkageName: "_Z6euclidP7latLongPfiff", scope: !1, file: !1, line: 49, type: !1310, isLocal: false, isDefinition: true, scopeLine: 50, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !16)
!1310 = !DISubroutineType(types: !1311)
!1311 = !{null, !1312, !39, !540, !22, !22}
!1312 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1313, size: 64, align: 64)
!1313 = !DIDerivedType(tag: DW_TAG_typedef, name: "LatLong", file: !1, line: 30, baseType: !19)
!1314 = !DILocalVariable(name: "d_locations", arg: 1, scope: !1309, file: !1, line: 49, type: !1312)
!1315 = !DIExpression()
!1316 = !DILocation(line: 49, column: 33, scope: !1309)
!1317 = !DILocalVariable(name: "d_distances", arg: 2, scope: !1309, file: !1, line: 49, type: !39)
!1318 = !DILocation(line: 49, column: 53, scope: !1309)
!1319 = !DILocalVariable(name: "numRecords", arg: 3, scope: !1309, file: !1, line: 49, type: !540)
!1320 = !DILocation(line: 49, column: 70, scope: !1309)
!1321 = !DILocalVariable(name: "lat", arg: 4, scope: !1309, file: !1, line: 49, type: !22)
!1322 = !DILocation(line: 49, column: 87, scope: !1309)
!1323 = !DILocalVariable(name: "lng", arg: 5, scope: !1309, file: !1, line: 49, type: !22)
!1324 = !DILocation(line: 49, column: 98, scope: !1309)
!1325 = !DILocation(line: 50, column: 1, scope: !1309)
!1326 = !DILocation(line: 50, column: 1, scope: !1327)
!1327 = !DILexicalBlockFile(scope: !1309, file: !1, discriminator: 1)
!1328 = !DILocation(line: 50, column: 1, scope: !1329)
!1329 = !DILexicalBlockFile(scope: !1309, file: !1, discriminator: 2)
!1330 = !DILocation(line: 50, column: 1, scope: !1331)
!1331 = !DILexicalBlockFile(scope: !1309, file: !1, discriminator: 3)
!1332 = !DILocation(line: 50, column: 1, scope: !1333)
!1333 = !DILexicalBlockFile(scope: !1309, file: !1, discriminator: 4)
!1334 = !DILocation(line: 50, column: 1, scope: !1335)
!1335 = !DILexicalBlockFile(scope: !1309, file: !1, discriminator: 5)
!1336 = !DILocation(line: 58, column: 1, scope: !1309)
!1337 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 64, type: !1338, isLocal: false, isDefinition: true, scopeLine: 65, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !16)
!1338 = !DISubroutineType(types: !1339)
!1339 = !{!540, !540, !1112}
!1340 = !DILocalVariable(name: "argc", arg: 1, scope: !1337, file: !1, line: 64, type: !540)
!1341 = !DILocation(line: 64, column: 14, scope: !1337)
!1342 = !DILocalVariable(name: "argv", arg: 2, scope: !1337, file: !1, line: 64, type: !1112)
!1343 = !DILocation(line: 64, column: 26, scope: !1337)
!1344 = !DILocalVariable(name: "i", scope: !1337, file: !1, line: 66, type: !540)
!1345 = !DILocation(line: 66, column: 9, scope: !1337)
!1346 = !DILocalVariable(name: "lat", scope: !1337, file: !1, line: 67, type: !22)
!1347 = !DILocation(line: 67, column: 8, scope: !1337)
!1348 = !DILocalVariable(name: "lng", scope: !1337, file: !1, line: 67, type: !22)
!1349 = !DILocation(line: 67, column: 13, scope: !1337)
!1350 = !DILocalVariable(name: "quiet", scope: !1337, file: !1, line: 68, type: !540)
!1351 = !DILocation(line: 68, column: 6, scope: !1337)
!1352 = !DILocalVariable(name: "timing", scope: !1337, file: !1, line: 68, type: !540)
!1353 = !DILocation(line: 68, column: 14, scope: !1337)
!1354 = !DILocalVariable(name: "platform", scope: !1337, file: !1, line: 68, type: !540)
!1355 = !DILocation(line: 68, column: 23, scope: !1337)
!1356 = !DILocalVariable(name: "device", scope: !1337, file: !1, line: 68, type: !540)
!1357 = !DILocation(line: 68, column: 34, scope: !1337)
!1358 = !DILocalVariable(name: "records", scope: !1337, file: !1, line: 70, type: !565)
!1359 = !DILocation(line: 70, column: 25, scope: !1337)
!1360 = !DILocalVariable(name: "locations", scope: !1337, file: !1, line: 71, type: !362)
!1361 = !DILocation(line: 71, column: 23, scope: !1337)
!1362 = !DILocalVariable(name: "filename", scope: !1337, file: !1, line: 72, type: !1363)
!1363 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 800, align: 8, elements: !1364)
!1364 = !{!1365}
!1365 = !DISubrange(count: 100)
!1366 = !DILocation(line: 72, column: 7, scope: !1337)
!1367 = !DILocalVariable(name: "resultsCount", scope: !1337, file: !1, line: 73, type: !540)
!1368 = !DILocation(line: 73, column: 6, scope: !1337)
!1369 = !DILocation(line: 76, column: 26, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1337, file: !1, line: 76, column: 9)
!1371 = !DILocation(line: 76, column: 32, scope: !1370)
!1372 = !DILocation(line: 76, column: 38, scope: !1370)
!1373 = !DILocation(line: 76, column: 9, scope: !1370)
!1374 = !DILocation(line: 76, column: 9, scope: !1375)
!1375 = !DILexicalBlockFile(scope: !1370, file: !1, discriminator: 1)
!1376 = !DILocation(line: 78, column: 7, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1370, file: !1, line: 77, column: 60)
!1378 = !DILocation(line: 79, column: 7, scope: !1377)
!1379 = !DILocation(line: 167, column: 1, scope: !1337)
!1380 = !DILocation(line: 167, column: 1, scope: !1375)
!1381 = !DILocalVariable(name: "numRecords", scope: !1337, file: !1, line: 82, type: !540)
!1382 = !DILocation(line: 82, column: 9, scope: !1337)
!1383 = !DILocation(line: 82, column: 31, scope: !1337)
!1384 = !DILocation(line: 82, column: 22, scope: !1337)
!1385 = !DILocation(line: 82, column: 9, scope: !1386)
!1386 = !DILexicalBlockFile(scope: !1337, file: !1, discriminator: 1)
!1387 = !DILocation(line: 83, column: 9, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1337, file: !1, line: 83, column: 9)
!1389 = !DILocation(line: 83, column: 24, scope: !1388)
!1390 = !DILocation(line: 83, column: 22, scope: !1388)
!1391 = !DILocation(line: 83, column: 9, scope: !1337)
!1392 = !DILocation(line: 83, column: 51, scope: !1393)
!1393 = !DILexicalBlockFile(scope: !1388, file: !1, discriminator: 1)
!1394 = !DILocation(line: 83, column: 49, scope: !1393)
!1395 = !DILocation(line: 83, column: 36, scope: !1393)
!1396 = !DILocalVariable(name: "distances", scope: !1337, file: !1, line: 90, type: !39)
!1397 = !DILocation(line: 90, column: 9, scope: !1337)
!1398 = !DILocalVariable(name: "d_locations", scope: !1337, file: !1, line: 92, type: !1312)
!1399 = !DILocation(line: 92, column: 11, scope: !1337)
!1400 = !DILocalVariable(name: "d_distances", scope: !1337, file: !1, line: 93, type: !39)
!1401 = !DILocation(line: 93, column: 9, scope: !1337)
!1402 = !DILocalVariable(name: "deviceProp", scope: !1337, file: !1, line: 97, type: !1403)
!1403 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cudaDeviceProp", file: !4, line: 1307, size: 5184, align: 64, elements: !1404, identifier: "_ZTS14cudaDeviceProp")
!1404 = !{!1405, !1409, !1410, !1411, !1412, !1413, !1414, !1415, !1419, !1420, !1421, !1422, !1423, !1424, !1425, !1426, !1427, !1428, !1429, !1430, !1431, !1432, !1433, !1434, !1435, !1439, !1440, !1441, !1442, !1443, !1444, !1445, !1446, !1447, !1448, !1449, !1450, !1451, !1452, !1453, !1454, !1455, !1456, !1457, !1458, !1459, !1460, !1461, !1462, !1463, !1464, !1465, !1466, !1467, !1468, !1469, !1470, !1471, !1472, !1473, !1474, !1475, !1476, !1477, !1478, !1479}
!1405 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !1403, file: !4, line: 1309, baseType: !1406, size: 2048, align: 8)
!1406 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 2048, align: 8, elements: !1407)
!1407 = !{!1408}
!1408 = !DISubrange(count: 256)
!1409 = !DIDerivedType(tag: DW_TAG_member, name: "totalGlobalMem", scope: !1403, file: !4, line: 1310, baseType: !1037, size: 64, align: 64, offset: 2048)
!1410 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlock", scope: !1403, file: !4, line: 1311, baseType: !1037, size: 64, align: 64, offset: 2112)
!1411 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerBlock", scope: !1403, file: !4, line: 1312, baseType: !540, size: 32, align: 32, offset: 2176)
!1412 = !DIDerivedType(tag: DW_TAG_member, name: "warpSize", scope: !1403, file: !4, line: 1313, baseType: !540, size: 32, align: 32, offset: 2208)
!1413 = !DIDerivedType(tag: DW_TAG_member, name: "memPitch", scope: !1403, file: !4, line: 1314, baseType: !1037, size: 64, align: 64, offset: 2240)
!1414 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerBlock", scope: !1403, file: !4, line: 1315, baseType: !540, size: 32, align: 32, offset: 2304)
!1415 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsDim", scope: !1403, file: !4, line: 1316, baseType: !1416, size: 96, align: 32, offset: 2336)
!1416 = !DICompositeType(tag: DW_TAG_array_type, baseType: !540, size: 96, align: 32, elements: !1417)
!1417 = !{!1418}
!1418 = !DISubrange(count: 3)
!1419 = !DIDerivedType(tag: DW_TAG_member, name: "maxGridSize", scope: !1403, file: !4, line: 1317, baseType: !1416, size: 96, align: 32, offset: 2432)
!1420 = !DIDerivedType(tag: DW_TAG_member, name: "clockRate", scope: !1403, file: !4, line: 1318, baseType: !540, size: 32, align: 32, offset: 2528)
!1421 = !DIDerivedType(tag: DW_TAG_member, name: "totalConstMem", scope: !1403, file: !4, line: 1319, baseType: !1037, size: 64, align: 64, offset: 2560)
!1422 = !DIDerivedType(tag: DW_TAG_member, name: "major", scope: !1403, file: !4, line: 1320, baseType: !540, size: 32, align: 32, offset: 2624)
!1423 = !DIDerivedType(tag: DW_TAG_member, name: "minor", scope: !1403, file: !4, line: 1321, baseType: !540, size: 32, align: 32, offset: 2656)
!1424 = !DIDerivedType(tag: DW_TAG_member, name: "textureAlignment", scope: !1403, file: !4, line: 1322, baseType: !1037, size: 64, align: 64, offset: 2688)
!1425 = !DIDerivedType(tag: DW_TAG_member, name: "texturePitchAlignment", scope: !1403, file: !4, line: 1323, baseType: !1037, size: 64, align: 64, offset: 2752)
!1426 = !DIDerivedType(tag: DW_TAG_member, name: "deviceOverlap", scope: !1403, file: !4, line: 1324, baseType: !540, size: 32, align: 32, offset: 2816)
!1427 = !DIDerivedType(tag: DW_TAG_member, name: "multiProcessorCount", scope: !1403, file: !4, line: 1325, baseType: !540, size: 32, align: 32, offset: 2848)
!1428 = !DIDerivedType(tag: DW_TAG_member, name: "kernelExecTimeoutEnabled", scope: !1403, file: !4, line: 1326, baseType: !540, size: 32, align: 32, offset: 2880)
!1429 = !DIDerivedType(tag: DW_TAG_member, name: "integrated", scope: !1403, file: !4, line: 1327, baseType: !540, size: 32, align: 32, offset: 2912)
!1430 = !DIDerivedType(tag: DW_TAG_member, name: "canMapHostMemory", scope: !1403, file: !4, line: 1328, baseType: !540, size: 32, align: 32, offset: 2944)
!1431 = !DIDerivedType(tag: DW_TAG_member, name: "computeMode", scope: !1403, file: !4, line: 1329, baseType: !540, size: 32, align: 32, offset: 2976)
!1432 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1D", scope: !1403, file: !4, line: 1330, baseType: !540, size: 32, align: 32, offset: 3008)
!1433 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DMipmap", scope: !1403, file: !4, line: 1331, baseType: !540, size: 32, align: 32, offset: 3040)
!1434 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLinear", scope: !1403, file: !4, line: 1332, baseType: !540, size: 32, align: 32, offset: 3072)
!1435 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2D", scope: !1403, file: !4, line: 1333, baseType: !1436, size: 64, align: 32, offset: 3104)
!1436 = !DICompositeType(tag: DW_TAG_array_type, baseType: !540, size: 64, align: 32, elements: !1437)
!1437 = !{!1438}
!1438 = !DISubrange(count: 2)
!1439 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DMipmap", scope: !1403, file: !4, line: 1334, baseType: !1436, size: 64, align: 32, offset: 3168)
!1440 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLinear", scope: !1403, file: !4, line: 1335, baseType: !1416, size: 96, align: 32, offset: 3232)
!1441 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DGather", scope: !1403, file: !4, line: 1336, baseType: !1436, size: 64, align: 32, offset: 3328)
!1442 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3D", scope: !1403, file: !4, line: 1337, baseType: !1416, size: 96, align: 32, offset: 3392)
!1443 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3DAlt", scope: !1403, file: !4, line: 1338, baseType: !1416, size: 96, align: 32, offset: 3488)
!1444 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemap", scope: !1403, file: !4, line: 1339, baseType: !540, size: 32, align: 32, offset: 3584)
!1445 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLayered", scope: !1403, file: !4, line: 1340, baseType: !1436, size: 64, align: 32, offset: 3616)
!1446 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLayered", scope: !1403, file: !4, line: 1341, baseType: !1416, size: 96, align: 32, offset: 3680)
!1447 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemapLayered", scope: !1403, file: !4, line: 1342, baseType: !1436, size: 64, align: 32, offset: 3776)
!1448 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1D", scope: !1403, file: !4, line: 1343, baseType: !540, size: 32, align: 32, offset: 3840)
!1449 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2D", scope: !1403, file: !4, line: 1344, baseType: !1436, size: 64, align: 32, offset: 3872)
!1450 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface3D", scope: !1403, file: !4, line: 1345, baseType: !1416, size: 96, align: 32, offset: 3936)
!1451 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1DLayered", scope: !1403, file: !4, line: 1346, baseType: !1436, size: 64, align: 32, offset: 4032)
!1452 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2DLayered", scope: !1403, file: !4, line: 1347, baseType: !1416, size: 96, align: 32, offset: 4096)
!1453 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemap", scope: !1403, file: !4, line: 1348, baseType: !540, size: 32, align: 32, offset: 4192)
!1454 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemapLayered", scope: !1403, file: !4, line: 1349, baseType: !1436, size: 64, align: 32, offset: 4224)
!1455 = !DIDerivedType(tag: DW_TAG_member, name: "surfaceAlignment", scope: !1403, file: !4, line: 1350, baseType: !1037, size: 64, align: 64, offset: 4288)
!1456 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentKernels", scope: !1403, file: !4, line: 1351, baseType: !540, size: 32, align: 32, offset: 4352)
!1457 = !DIDerivedType(tag: DW_TAG_member, name: "ECCEnabled", scope: !1403, file: !4, line: 1352, baseType: !540, size: 32, align: 32, offset: 4384)
!1458 = !DIDerivedType(tag: DW_TAG_member, name: "pciBusID", scope: !1403, file: !4, line: 1353, baseType: !540, size: 32, align: 32, offset: 4416)
!1459 = !DIDerivedType(tag: DW_TAG_member, name: "pciDeviceID", scope: !1403, file: !4, line: 1354, baseType: !540, size: 32, align: 32, offset: 4448)
!1460 = !DIDerivedType(tag: DW_TAG_member, name: "pciDomainID", scope: !1403, file: !4, line: 1355, baseType: !540, size: 32, align: 32, offset: 4480)
!1461 = !DIDerivedType(tag: DW_TAG_member, name: "tccDriver", scope: !1403, file: !4, line: 1356, baseType: !540, size: 32, align: 32, offset: 4512)
!1462 = !DIDerivedType(tag: DW_TAG_member, name: "asyncEngineCount", scope: !1403, file: !4, line: 1357, baseType: !540, size: 32, align: 32, offset: 4544)
!1463 = !DIDerivedType(tag: DW_TAG_member, name: "unifiedAddressing", scope: !1403, file: !4, line: 1358, baseType: !540, size: 32, align: 32, offset: 4576)
!1464 = !DIDerivedType(tag: DW_TAG_member, name: "memoryClockRate", scope: !1403, file: !4, line: 1359, baseType: !540, size: 32, align: 32, offset: 4608)
!1465 = !DIDerivedType(tag: DW_TAG_member, name: "memoryBusWidth", scope: !1403, file: !4, line: 1360, baseType: !540, size: 32, align: 32, offset: 4640)
!1466 = !DIDerivedType(tag: DW_TAG_member, name: "l2CacheSize", scope: !1403, file: !4, line: 1361, baseType: !540, size: 32, align: 32, offset: 4672)
!1467 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerMultiProcessor", scope: !1403, file: !4, line: 1362, baseType: !540, size: 32, align: 32, offset: 4704)
!1468 = !DIDerivedType(tag: DW_TAG_member, name: "streamPrioritiesSupported", scope: !1403, file: !4, line: 1363, baseType: !540, size: 32, align: 32, offset: 4736)
!1469 = !DIDerivedType(tag: DW_TAG_member, name: "globalL1CacheSupported", scope: !1403, file: !4, line: 1364, baseType: !540, size: 32, align: 32, offset: 4768)
!1470 = !DIDerivedType(tag: DW_TAG_member, name: "localL1CacheSupported", scope: !1403, file: !4, line: 1365, baseType: !540, size: 32, align: 32, offset: 4800)
!1471 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerMultiprocessor", scope: !1403, file: !4, line: 1366, baseType: !1037, size: 64, align: 64, offset: 4864)
!1472 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerMultiprocessor", scope: !1403, file: !4, line: 1367, baseType: !540, size: 32, align: 32, offset: 4928)
!1473 = !DIDerivedType(tag: DW_TAG_member, name: "managedMemory", scope: !1403, file: !4, line: 1368, baseType: !540, size: 32, align: 32, offset: 4960)
!1474 = !DIDerivedType(tag: DW_TAG_member, name: "isMultiGpuBoard", scope: !1403, file: !4, line: 1369, baseType: !540, size: 32, align: 32, offset: 4992)
!1475 = !DIDerivedType(tag: DW_TAG_member, name: "multiGpuBoardGroupID", scope: !1403, file: !4, line: 1370, baseType: !540, size: 32, align: 32, offset: 5024)
!1476 = !DIDerivedType(tag: DW_TAG_member, name: "hostNativeAtomicSupported", scope: !1403, file: !4, line: 1371, baseType: !540, size: 32, align: 32, offset: 5056)
!1477 = !DIDerivedType(tag: DW_TAG_member, name: "singleToDoublePrecisionPerfRatio", scope: !1403, file: !4, line: 1372, baseType: !540, size: 32, align: 32, offset: 5088)
!1478 = !DIDerivedType(tag: DW_TAG_member, name: "pageableMemoryAccess", scope: !1403, file: !4, line: 1373, baseType: !540, size: 32, align: 32, offset: 5120)
!1479 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentManagedAccess", scope: !1403, file: !4, line: 1374, baseType: !540, size: 32, align: 32, offset: 5152)
!1480 = !DILocation(line: 97, column: 17, scope: !1337)
!1481 = !DILocation(line: 98, column: 2, scope: !1337)
!1482 = !DILocation(line: 99, column: 2, scope: !1337)
!1483 = !DILocalVariable(name: "maxGridX", scope: !1337, file: !1, line: 100, type: !101)
!1484 = !DILocation(line: 100, column: 16, scope: !1337)
!1485 = !DILocation(line: 100, column: 38, scope: !1337)
!1486 = !DILocation(line: 100, column: 27, scope: !1337)
!1487 = !DILocalVariable(name: "threadsPerBlock", scope: !1337, file: !1, line: 101, type: !101)
!1488 = !DILocation(line: 101, column: 16, scope: !1337)
!1489 = !DILocation(line: 101, column: 34, scope: !1337)
!1490 = !DILocation(line: 101, column: 34, scope: !1386)
!1491 = !DILocation(line: 101, column: 34, scope: !1492)
!1492 = !DILexicalBlockFile(scope: !1337, file: !1, discriminator: 2)
!1493 = !DILocation(line: 101, column: 34, scope: !1494)
!1494 = !DILexicalBlockFile(scope: !1337, file: !1, discriminator: 3)
!1495 = !DILocation(line: 101, column: 16, scope: !1494)
!1496 = !DILocalVariable(name: "totalDeviceMemory", scope: !1337, file: !1, line: 102, type: !1037)
!1497 = !DILocation(line: 102, column: 9, scope: !1337)
!1498 = !DILocalVariable(name: "freeDeviceMemory", scope: !1337, file: !1, line: 103, type: !1037)
!1499 = !DILocation(line: 103, column: 9, scope: !1337)
!1500 = !DILocation(line: 104, column: 2, scope: !1337)
!1501 = !DILocation(line: 105, column: 2, scope: !1337)
!1502 = !DILocalVariable(name: "usableDeviceMemory", scope: !1337, file: !1, line: 106, type: !101)
!1503 = !DILocation(line: 106, column: 16, scope: !1337)
!1504 = !DILocation(line: 106, column: 37, scope: !1337)
!1505 = !DILocation(line: 106, column: 54, scope: !1337)
!1506 = !DILocation(line: 106, column: 59, scope: !1337)
!1507 = !DILocalVariable(name: "maxThreads", scope: !1337, file: !1, line: 107, type: !101)
!1508 = !DILocation(line: 107, column: 16, scope: !1337)
!1509 = !DILocation(line: 107, column: 29, scope: !1337)
!1510 = !DILocation(line: 107, column: 48, scope: !1337)
!1511 = !DILocation(line: 108, column: 7, scope: !1512)
!1512 = distinct !DILexicalBlock(scope: !1337, file: !1, line: 108, column: 7)
!1513 = !DILocation(line: 108, column: 20, scope: !1512)
!1514 = !DILocation(line: 108, column: 18, scope: !1512)
!1515 = !DILocation(line: 108, column: 7, scope: !1337)
!1516 = !DILocation(line: 110, column: 12, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1512, file: !1, line: 109, column: 2)
!1518 = !DILocation(line: 110, column: 3, scope: !1517)
!1519 = !DILocation(line: 111, column: 3, scope: !1517)
!1520 = !DILocalVariable(name: "blocks", scope: !1337, file: !1, line: 113, type: !101)
!1521 = !DILocation(line: 113, column: 16, scope: !1337)
!1522 = !DILocation(line: 113, column: 25, scope: !1337)
!1523 = !DILocalVariable(name: "gridY", scope: !1337, file: !1, line: 114, type: !101)
!1524 = !DILocation(line: 114, column: 16, scope: !1337)
!1525 = !DILocation(line: 114, column: 24, scope: !1337)
!1526 = !DILocalVariable(name: "gridX", scope: !1337, file: !1, line: 115, type: !101)
!1527 = !DILocation(line: 115, column: 16, scope: !1337)
!1528 = !DILocation(line: 115, column: 24, scope: !1337)
!1529 = !DILocalVariable(name: "gridDim", scope: !1337, file: !1, line: 117, type: !1530)
!1530 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1531, line: 427, baseType: !1532)
!1531 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!1532 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1531, line: 417, size: 96, align: 32, elements: !1533, identifier: "_ZTS4dim3")
!1533 = !{!1534, !1535, !1536, !1537, !1541, !1550}
!1534 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1532, file: !1531, line: 419, baseType: !1106, size: 32, align: 32)
!1535 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1532, file: !1531, line: 419, baseType: !1106, size: 32, align: 32, offset: 32)
!1536 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1532, file: !1531, line: 419, baseType: !1106, size: 32, align: 32, offset: 64)
!1537 = !DISubprogram(name: "dim3", scope: !1532, file: !1531, line: 421, type: !1538, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!1538 = !DISubroutineType(types: !1539)
!1539 = !{null, !1540, !1106, !1106, !1106}
!1540 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1532, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1541 = !DISubprogram(name: "dim3", scope: !1532, file: !1531, line: 422, type: !1542, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!1542 = !DISubroutineType(types: !1543)
!1543 = !{null, !1540, !1544}
!1544 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1531, line: 383, baseType: !1545)
!1545 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1531, line: 190, size: 96, align: 32, elements: !1546, identifier: "_ZTS5uint3")
!1546 = !{!1547, !1548, !1549}
!1547 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1545, file: !1531, line: 192, baseType: !1106, size: 32, align: 32)
!1548 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1545, file: !1531, line: 192, baseType: !1106, size: 32, align: 32, offset: 32)
!1549 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1545, file: !1531, line: 192, baseType: !1106, size: 32, align: 32, offset: 64)
!1550 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1532, file: !1531, line: 423, type: !1551, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!1551 = !DISubroutineType(types: !1552)
!1552 = !{!1544, !1540}
!1553 = !DILocation(line: 117, column: 7, scope: !1337)
!1554 = !DILocation(line: 117, column: 16, scope: !1337)
!1555 = !DILocation(line: 117, column: 23, scope: !1337)
!1556 = !DILocation(line: 136, column: 46, scope: !1337)
!1557 = !DILocation(line: 136, column: 44, scope: !1337)
!1558 = !DILocation(line: 136, column: 23, scope: !1337)
!1559 = !DILocation(line: 136, column: 14, scope: !1337)
!1560 = !DILocation(line: 136, column: 12, scope: !1337)
!1561 = !DILocation(line: 137, column: 13, scope: !1337)
!1562 = !DILocation(line: 137, column: 54, scope: !1337)
!1563 = !DILocation(line: 137, column: 52, scope: !1337)
!1564 = !DILocation(line: 137, column: 2, scope: !1337)
!1565 = !DILocation(line: 138, column: 13, scope: !1337)
!1566 = !DILocation(line: 138, column: 52, scope: !1337)
!1567 = !DILocation(line: 138, column: 50, scope: !1337)
!1568 = !DILocation(line: 138, column: 2, scope: !1337)
!1569 = !DILocation(line: 143, column: 17, scope: !1337)
!1570 = !DILocation(line: 143, column: 31, scope: !1337)
!1571 = !DILocation(line: 143, column: 30, scope: !1386)
!1572 = !DILocation(line: 143, column: 63, scope: !1386)
!1573 = !DILocation(line: 143, column: 61, scope: !1386)
!1574 = !DILocation(line: 143, column: 5, scope: !1386)
!1575 = !DILocation(line: 148, column: 15, scope: !1337)
!1576 = !DILocation(line: 148, column: 24, scope: !1337)
!1577 = !DILocation(line: 148, column: 11, scope: !1386)
!1578 = !DILocation(line: 148, column: 11, scope: !1337)
!1579 = !DILocation(line: 148, column: 11, scope: !1492)
!1580 = !DILocation(line: 148, column: 5, scope: !1492)
!1581 = !DILocation(line: 148, column: 44, scope: !1494)
!1582 = !DILocation(line: 148, column: 56, scope: !1494)
!1583 = !DILocation(line: 148, column: 68, scope: !1494)
!1584 = !DILocation(line: 148, column: 79, scope: !1494)
!1585 = !DILocation(line: 148, column: 83, scope: !1494)
!1586 = !DILocation(line: 148, column: 5, scope: !1494)
!1587 = !DILocation(line: 148, column: 5, scope: !1588)
!1588 = !DILexicalBlockFile(scope: !1337, file: !1, discriminator: 4)
!1589 = !DILocation(line: 149, column: 5, scope: !1337)
!1590 = !DILocation(line: 152, column: 17, scope: !1337)
!1591 = !DILocation(line: 152, column: 28, scope: !1337)
!1592 = !DILocation(line: 152, column: 55, scope: !1337)
!1593 = !DILocation(line: 152, column: 54, scope: !1337)
!1594 = !DILocation(line: 152, column: 5, scope: !1337)
!1595 = !DILocation(line: 155, column: 24, scope: !1337)
!1596 = !DILocation(line: 155, column: 34, scope: !1337)
!1597 = !DILocation(line: 155, column: 45, scope: !1337)
!1598 = !DILocation(line: 155, column: 5, scope: !1337)
!1599 = !DILocation(line: 158, column: 10, scope: !1600)
!1600 = distinct !DILexicalBlock(scope: !1337, file: !1, line: 158, column: 9)
!1601 = !DILocation(line: 158, column: 9, scope: !1337)
!1602 = !DILocation(line: 159, column: 10, scope: !1603)
!1603 = distinct !DILexicalBlock(scope: !1600, file: !1, line: 159, column: 5)
!1604 = !DILocation(line: 159, column: 9, scope: !1603)
!1605 = !DILocation(line: 159, column: 13, scope: !1606)
!1606 = !DILexicalBlockFile(scope: !1607, file: !1, discriminator: 1)
!1607 = distinct !DILexicalBlock(scope: !1603, file: !1, line: 159, column: 5)
!1608 = !DILocation(line: 159, column: 15, scope: !1606)
!1609 = !DILocation(line: 159, column: 14, scope: !1606)
!1610 = !DILocation(line: 159, column: 5, scope: !1606)
!1611 = !DILocation(line: 160, column: 45, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1607, file: !1, line: 159, column: 33)
!1613 = !DILocation(line: 160, column: 37, scope: !1612)
!1614 = !DILocation(line: 160, column: 48, scope: !1615)
!1615 = !DILexicalBlockFile(scope: !1612, file: !1, discriminator: 1)
!1616 = !DILocation(line: 160, column: 37, scope: !1615)
!1617 = !DILocation(line: 160, column: 66, scope: !1615)
!1618 = !DILocation(line: 160, column: 58, scope: !1615)
!1619 = !DILocation(line: 160, column: 69, scope: !1620)
!1620 = !DILexicalBlockFile(scope: !1612, file: !1, discriminator: 2)
!1621 = !DILocation(line: 160, column: 58, scope: !1620)
!1622 = !DILocation(line: 160, column: 7, scope: !1620)
!1623 = !DILocation(line: 161, column: 5, scope: !1612)
!1624 = !DILocation(line: 159, column: 29, scope: !1625)
!1625 = !DILexicalBlockFile(scope: !1607, file: !1, discriminator: 2)
!1626 = !DILocation(line: 159, column: 5, scope: !1625)
!1627 = distinct !{!1627, !1628}
!1628 = !DILocation(line: 159, column: 5, scope: !1600)
!1629 = !DILocation(line: 161, column: 5, scope: !1630)
!1630 = !DILexicalBlockFile(scope: !1603, file: !1, discriminator: 1)
!1631 = !DILocation(line: 162, column: 10, scope: !1337)
!1632 = !DILocation(line: 162, column: 5, scope: !1337)
!1633 = !DILocation(line: 164, column: 11, scope: !1337)
!1634 = !DILocation(line: 164, column: 2, scope: !1337)
!1635 = !DILocation(line: 165, column: 11, scope: !1337)
!1636 = !DILocation(line: 165, column: 2, scope: !1337)
!1637 = !DILocation(line: 167, column: 1, scope: !1492)
!1638 = !DILocation(line: 167, column: 1, scope: !1494)
!1639 = !DILocation(line: 167, column: 1, scope: !1588)
!1640 = !DILocation(line: 167, column: 1, scope: !1641)
!1641 = !DILexicalBlockFile(scope: !1337, file: !1, discriminator: 5)
!1642 = !DILocation(line: 167, column: 1, scope: !1643)
!1643 = !DILexicalBlockFile(scope: !1337, file: !1, discriminator: 6)
!1644 = !DILocation(line: 167, column: 1, scope: !1645)
!1645 = !DILexicalBlockFile(scope: !1337, file: !1, discriminator: 7)
!1646 = !DILocation(line: 167, column: 1, scope: !1647)
!1647 = !DILexicalBlockFile(scope: !1337, file: !1, discriminator: 8)
!1648 = !DILocation(line: 167, column: 1, scope: !1649)
!1649 = !DILexicalBlockFile(scope: !1337, file: !1, discriminator: 9)
!1650 = !DILocation(line: 167, column: 1, scope: !1651)
!1651 = !DILexicalBlockFile(scope: !1337, file: !1, discriminator: 10)
!1652 = distinct !DISubprogram(name: "vector", linkageName: "_ZNSt6vectorI6recordSaIS0_EEC2Ev", scope: !565, file: !44, line: 253, type: !569, isLocal: false, isDefinition: true, scopeLine: 257, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !568, variables: !16)
!1653 = !DILocalVariable(name: "this", arg: 1, scope: !1652, type: !1654, flags: DIFlagArtificial | DIFlagObjectPointer)
!1654 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !565, size: 64, align: 64)
!1655 = !DILocation(line: 0, scope: !1652)
!1656 = !DILocation(line: 257, column: 17, scope: !1652)
!1657 = !DILocation(line: 257, column: 9, scope: !1652)
!1658 = !DILocation(line: 257, column: 19, scope: !1652)
!1659 = distinct !DISubprogram(name: "vector", linkageName: "_ZNSt6vectorI7latLongSaIS0_EEC2Ev", scope: !362, file: !44, line: 253, type: !366, isLocal: false, isDefinition: true, scopeLine: 257, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !365, variables: !16)
!1660 = !DILocalVariable(name: "this", arg: 1, scope: !1659, type: !1661, flags: DIFlagArtificial | DIFlagObjectPointer)
!1661 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 64, align: 64)
!1662 = !DILocation(line: 0, scope: !1659)
!1663 = !DILocation(line: 257, column: 17, scope: !1659)
!1664 = !DILocation(line: 257, column: 9, scope: !1659)
!1665 = !DILocation(line: 257, column: 19, scope: !1659)
!1666 = distinct !DISubprogram(name: "parseCommandline", linkageName: "_Z16parseCommandlineiPPcS_PiPfS2_S1_S1_S1_S1_", scope: !1, file: !1, line: 250, type: !1667, isLocal: false, isDefinition: true, scopeLine: 251, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !16)
!1667 = !DISubroutineType(types: !1668)
!1668 = !{!540, !540, !1112, !1063, !826, !39, !39, !826, !826, !826, !826}
!1669 = !DILocalVariable(name: "argc", arg: 1, scope: !1666, file: !1, line: 250, type: !540)
!1670 = !DILocation(line: 250, column: 26, scope: !1666)
!1671 = !DILocalVariable(name: "argv", arg: 2, scope: !1666, file: !1, line: 250, type: !1112)
!1672 = !DILocation(line: 250, column: 38, scope: !1666)
!1673 = !DILocalVariable(name: "filename", arg: 3, scope: !1666, file: !1, line: 250, type: !1063)
!1674 = !DILocation(line: 250, column: 52, scope: !1666)
!1675 = !DILocalVariable(name: "r", arg: 4, scope: !1666, file: !1, line: 250, type: !826)
!1676 = !DILocation(line: 250, column: 66, scope: !1666)
!1677 = !DILocalVariable(name: "lat", arg: 5, scope: !1666, file: !1, line: 250, type: !39)
!1678 = !DILocation(line: 250, column: 75, scope: !1666)
!1679 = !DILocalVariable(name: "lng", arg: 6, scope: !1666, file: !1, line: 250, type: !39)
!1680 = !DILocation(line: 250, column: 86, scope: !1666)
!1681 = !DILocalVariable(name: "q", arg: 7, scope: !1666, file: !1, line: 251, type: !826)
!1682 = !DILocation(line: 251, column: 27, scope: !1666)
!1683 = !DILocalVariable(name: "t", arg: 8, scope: !1666, file: !1, line: 251, type: !826)
!1684 = !DILocation(line: 251, column: 35, scope: !1666)
!1685 = !DILocalVariable(name: "p", arg: 9, scope: !1666, file: !1, line: 251, type: !826)
!1686 = !DILocation(line: 251, column: 43, scope: !1666)
!1687 = !DILocalVariable(name: "d", arg: 10, scope: !1666, file: !1, line: 251, type: !826)
!1688 = !DILocation(line: 251, column: 51, scope: !1666)
!1689 = !DILocalVariable(name: "i", scope: !1666, file: !1, line: 252, type: !540)
!1690 = !DILocation(line: 252, column: 9, scope: !1666)
!1691 = !DILocation(line: 253, column: 9, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1666, file: !1, line: 253, column: 9)
!1693 = !DILocation(line: 253, column: 14, scope: !1692)
!1694 = !DILocation(line: 253, column: 9, scope: !1666)
!1695 = !DILocation(line: 253, column: 19, scope: !1696)
!1696 = !DILexicalBlockFile(scope: !1692, file: !1, discriminator: 1)
!1697 = !DILocation(line: 254, column: 13, scope: !1666)
!1698 = !DILocation(line: 254, column: 22, scope: !1666)
!1699 = !DILocation(line: 254, column: 5, scope: !1666)
!1700 = !DILocalVariable(name: "flag", scope: !1666, file: !1, line: 255, type: !34)
!1701 = !DILocation(line: 255, column: 10, scope: !1666)
!1702 = !DILocation(line: 257, column: 10, scope: !1703)
!1703 = distinct !DILexicalBlock(scope: !1666, file: !1, line: 257, column: 5)
!1704 = !DILocation(line: 257, column: 9, scope: !1703)
!1705 = !DILocation(line: 257, column: 13, scope: !1706)
!1706 = !DILexicalBlockFile(scope: !1707, file: !1, discriminator: 1)
!1707 = distinct !DILexicalBlock(scope: !1703, file: !1, line: 257, column: 5)
!1708 = !DILocation(line: 257, column: 15, scope: !1706)
!1709 = !DILocation(line: 257, column: 14, scope: !1706)
!1710 = !DILocation(line: 257, column: 5, scope: !1706)
!1711 = !DILocation(line: 258, column: 11, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1713, file: !1, line: 258, column: 11)
!1713 = distinct !DILexicalBlock(scope: !1707, file: !1, line: 257, column: 25)
!1714 = !DILocation(line: 258, column: 16, scope: !1712)
!1715 = !DILocation(line: 258, column: 21, scope: !1712)
!1716 = !DILocation(line: 258, column: 11, scope: !1713)
!1717 = !DILocation(line: 259, column: 16, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1712, file: !1, line: 258, column: 28)
!1719 = !DILocation(line: 259, column: 21, scope: !1718)
!1720 = !DILocation(line: 259, column: 14, scope: !1718)
!1721 = !DILocation(line: 260, column: 19, scope: !1718)
!1722 = !DILocation(line: 260, column: 11, scope: !1718)
!1723 = !DILocation(line: 262, column: 16, scope: !1724)
!1724 = distinct !DILexicalBlock(scope: !1718, file: !1, line: 260, column: 25)
!1725 = !DILocation(line: 263, column: 25, scope: !1724)
!1726 = !DILocation(line: 263, column: 30, scope: !1724)
!1727 = !DILocation(line: 263, column: 20, scope: !1724)
!1728 = !DILocation(line: 263, column: 16, scope: !1724)
!1729 = !DILocation(line: 263, column: 18, scope: !1724)
!1730 = !DILocation(line: 264, column: 15, scope: !1724)
!1731 = !DILocation(line: 266, column: 19, scope: !1732)
!1732 = distinct !DILexicalBlock(scope: !1724, file: !1, line: 266, column: 19)
!1733 = !DILocation(line: 266, column: 24, scope: !1732)
!1734 = !DILocation(line: 266, column: 29, scope: !1732)
!1735 = !DILocation(line: 266, column: 19, scope: !1724)
!1736 = !DILocation(line: 267, column: 29, scope: !1737)
!1737 = distinct !DILexicalBlock(scope: !1732, file: !1, line: 266, column: 36)
!1738 = !DILocation(line: 267, column: 34, scope: !1737)
!1739 = !DILocation(line: 267, column: 35, scope: !1737)
!1740 = !DILocation(line: 267, column: 24, scope: !1737)
!1741 = !DILocation(line: 267, column: 18, scope: !1737)
!1742 = !DILocation(line: 267, column: 22, scope: !1737)
!1743 = !DILocation(line: 268, column: 15, scope: !1737)
!1744 = !DILocation(line: 270, column: 29, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1732, file: !1, line: 269, column: 20)
!1746 = !DILocation(line: 270, column: 34, scope: !1745)
!1747 = !DILocation(line: 270, column: 35, scope: !1745)
!1748 = !DILocation(line: 270, column: 24, scope: !1745)
!1749 = !DILocation(line: 270, column: 18, scope: !1745)
!1750 = !DILocation(line: 270, column: 22, scope: !1745)
!1751 = !DILocation(line: 272, column: 16, scope: !1724)
!1752 = !DILocation(line: 273, column: 15, scope: !1724)
!1753 = !DILocation(line: 275, column: 15, scope: !1724)
!1754 = !DILocation(line: 277, column: 16, scope: !1724)
!1755 = !DILocation(line: 277, column: 18, scope: !1724)
!1756 = !DILocation(line: 278, column: 15, scope: !1724)
!1757 = !DILocation(line: 280, column: 16, scope: !1724)
!1758 = !DILocation(line: 280, column: 18, scope: !1724)
!1759 = !DILocation(line: 281, column: 15, scope: !1724)
!1760 = !DILocation(line: 283, column: 16, scope: !1724)
!1761 = !DILocation(line: 284, column: 25, scope: !1724)
!1762 = !DILocation(line: 284, column: 30, scope: !1724)
!1763 = !DILocation(line: 284, column: 20, scope: !1724)
!1764 = !DILocation(line: 284, column: 16, scope: !1724)
!1765 = !DILocation(line: 284, column: 18, scope: !1724)
!1766 = !DILocation(line: 285, column: 15, scope: !1724)
!1767 = !DILocation(line: 287, column: 16, scope: !1724)
!1768 = !DILocation(line: 288, column: 25, scope: !1724)
!1769 = !DILocation(line: 288, column: 30, scope: !1724)
!1770 = !DILocation(line: 288, column: 20, scope: !1724)
!1771 = !DILocation(line: 288, column: 16, scope: !1724)
!1772 = !DILocation(line: 288, column: 18, scope: !1724)
!1773 = !DILocation(line: 289, column: 15, scope: !1724)
!1774 = !DILocation(line: 291, column: 7, scope: !1718)
!1775 = !DILocation(line: 292, column: 5, scope: !1713)
!1776 = !DILocation(line: 257, column: 21, scope: !1777)
!1777 = !DILexicalBlockFile(scope: !1707, file: !1, discriminator: 2)
!1778 = !DILocation(line: 257, column: 5, scope: !1777)
!1779 = distinct !{!1779, !1780}
!1780 = !DILocation(line: 257, column: 5, scope: !1666)
!1781 = !DILocation(line: 293, column: 11, scope: !1782)
!1782 = distinct !DILexicalBlock(scope: !1666, file: !1, line: 293, column: 9)
!1783 = !DILocation(line: 293, column: 10, scope: !1782)
!1784 = !DILocation(line: 293, column: 13, scope: !1782)
!1785 = !DILocation(line: 293, column: 18, scope: !1782)
!1786 = !DILocation(line: 293, column: 22, scope: !1787)
!1787 = !DILexicalBlockFile(scope: !1782, file: !1, discriminator: 1)
!1788 = !DILocation(line: 293, column: 21, scope: !1787)
!1789 = !DILocation(line: 293, column: 23, scope: !1787)
!1790 = !DILocation(line: 293, column: 27, scope: !1787)
!1791 = !DILocation(line: 293, column: 32, scope: !1792)
!1792 = !DILexicalBlockFile(scope: !1782, file: !1, discriminator: 2)
!1793 = !DILocation(line: 293, column: 31, scope: !1792)
!1794 = !DILocation(line: 293, column: 33, scope: !1792)
!1795 = !DILocation(line: 293, column: 37, scope: !1792)
!1796 = !DILocation(line: 293, column: 41, scope: !1797)
!1797 = !DILexicalBlockFile(scope: !1782, file: !1, discriminator: 3)
!1798 = !DILocation(line: 293, column: 40, scope: !1797)
!1799 = !DILocation(line: 293, column: 42, scope: !1797)
!1800 = !DILocation(line: 293, column: 9, scope: !1797)
!1801 = !DILocation(line: 294, column: 7, scope: !1782)
!1802 = !DILocation(line: 295, column: 5, scope: !1666)
!1803 = !DILocation(line: 296, column: 1, scope: !1666)
!1804 = distinct !DISubprogram(name: "printUsage", linkageName: "_Z10printUsagev", scope: !1, file: !1, line: 298, type: !1012, isLocal: false, isDefinition: true, scopeLine: 298, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !16)
!1805 = !DILocation(line: 299, column: 3, scope: !1804)
!1806 = !DILocation(line: 300, column: 3, scope: !1804)
!1807 = !DILocation(line: 301, column: 3, scope: !1804)
!1808 = !DILocation(line: 302, column: 3, scope: !1804)
!1809 = !DILocation(line: 303, column: 3, scope: !1804)
!1810 = !DILocation(line: 304, column: 3, scope: !1804)
!1811 = !DILocation(line: 305, column: 3, scope: !1804)
!1812 = !DILocation(line: 306, column: 3, scope: !1804)
!1813 = !DILocation(line: 307, column: 3, scope: !1804)
!1814 = !DILocation(line: 308, column: 3, scope: !1804)
!1815 = !DILocation(line: 309, column: 3, scope: !1804)
!1816 = !DILocation(line: 310, column: 3, scope: !1804)
!1817 = !DILocation(line: 311, column: 3, scope: !1804)
!1818 = !DILocation(line: 312, column: 3, scope: !1804)
!1819 = !DILocation(line: 313, column: 3, scope: !1804)
!1820 = !DILocation(line: 314, column: 3, scope: !1804)
!1821 = !DILocation(line: 315, column: 3, scope: !1804)
!1822 = !DILocation(line: 316, column: 3, scope: !1804)
!1823 = !DILocation(line: 317, column: 3, scope: !1804)
!1824 = !DILocation(line: 318, column: 3, scope: !1804)
!1825 = !DILocation(line: 319, column: 3, scope: !1804)
!1826 = !DILocation(line: 320, column: 3, scope: !1804)
!1827 = !DILocation(line: 321, column: 3, scope: !1804)
!1828 = !DILocation(line: 322, column: 1, scope: !1804)
!1829 = distinct !DISubprogram(name: "loadData", linkageName: "_Z8loadDataPcRSt6vectorI6recordSaIS1_EERS0_I7latLongSaIS5_EE", scope: !1, file: !1, line: 169, type: !1830, isLocal: false, isDefinition: true, scopeLine: 169, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !16)
!1830 = !DISubroutineType(types: !1831)
!1831 = !{!540, !1063, !593, !390}
!1832 = !DILocalVariable(name: "filename", arg: 1, scope: !1829, file: !1, line: 169, type: !1063)
!1833 = !DILocation(line: 169, column: 20, scope: !1829)
!1834 = !DILocalVariable(name: "records", arg: 2, scope: !1829, file: !1, line: 169, type: !593)
!1835 = !DILocation(line: 169, column: 50, scope: !1829)
!1836 = !DILocalVariable(name: "locations", arg: 3, scope: !1829, file: !1, line: 169, type: !390)
!1837 = !DILocation(line: 169, column: 80, scope: !1829)
!1838 = !DILocalVariable(name: "flist", scope: !1829, file: !1, line: 170, type: !1839)
!1839 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1840, size: 64, align: 64)
!1840 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1841, line: 48, baseType: !1842)
!1841 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!1842 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !1843, line: 241, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!1843 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!1844 = !DILocation(line: 170, column: 13, scope: !1829)
!1845 = !DILocalVariable(name: "fp", scope: !1829, file: !1, line: 170, type: !1839)
!1846 = !DILocation(line: 170, column: 20, scope: !1829)
!1847 = !DILocalVariable(name: "i", scope: !1829, file: !1, line: 171, type: !540)
!1848 = !DILocation(line: 171, column: 9, scope: !1829)
!1849 = !DILocalVariable(name: "dbname", scope: !1829, file: !1, line: 172, type: !1850)
!1850 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 512, align: 8, elements: !1851)
!1851 = !{!1852}
!1852 = !DISubrange(count: 64)
!1853 = !DILocation(line: 172, column: 7, scope: !1829)
!1854 = !DILocalVariable(name: "recNum", scope: !1829, file: !1, line: 173, type: !540)
!1855 = !DILocation(line: 173, column: 6, scope: !1829)
!1856 = !DILocation(line: 177, column: 19, scope: !1829)
!1857 = !DILocation(line: 177, column: 13, scope: !1829)
!1858 = !DILocation(line: 177, column: 11, scope: !1829)
!1859 = !DILocation(line: 178, column: 2, scope: !1829)
!1860 = !DILocation(line: 178, column: 14, scope: !1861)
!1861 = !DILexicalBlockFile(scope: !1829, file: !1, discriminator: 1)
!1862 = !DILocation(line: 178, column: 9, scope: !1861)
!1863 = !DILocation(line: 178, column: 8, scope: !1861)
!1864 = !DILocation(line: 178, column: 2, scope: !1861)
!1865 = !DILocation(line: 184, column: 13, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1867, file: !1, line: 184, column: 6)
!1867 = distinct !DILexicalBlock(scope: !1829, file: !1, line: 178, column: 22)
!1868 = !DILocation(line: 184, column: 28, scope: !1866)
!1869 = !DILocation(line: 184, column: 6, scope: !1866)
!1870 = !DILocation(line: 184, column: 36, scope: !1866)
!1871 = !DILocation(line: 184, column: 6, scope: !1867)
!1872 = !DILocation(line: 185, column: 21, scope: !1873)
!1873 = distinct !DILexicalBlock(scope: !1866, file: !1, line: 184, column: 42)
!1874 = !DILocation(line: 185, column: 13, scope: !1873)
!1875 = !DILocation(line: 186, column: 13, scope: !1873)
!1876 = !DILocation(line: 188, column: 20, scope: !1867)
!1877 = !DILocation(line: 188, column: 14, scope: !1867)
!1878 = !DILocation(line: 188, column: 12, scope: !1867)
!1879 = !DILocation(line: 189, column: 13, scope: !1880)
!1880 = distinct !DILexicalBlock(scope: !1867, file: !1, line: 189, column: 12)
!1881 = !DILocation(line: 189, column: 12, scope: !1867)
!1882 = !DILocation(line: 190, column: 13, scope: !1883)
!1883 = distinct !DILexicalBlock(scope: !1880, file: !1, line: 189, column: 17)
!1884 = !DILocation(line: 191, column: 13, scope: !1883)
!1885 = !DILocation(line: 194, column: 9, scope: !1867)
!1886 = !DILocation(line: 194, column: 21, scope: !1887)
!1887 = !DILexicalBlockFile(scope: !1867, file: !1, discriminator: 1)
!1888 = !DILocation(line: 194, column: 16, scope: !1887)
!1889 = !DILocation(line: 194, column: 15, scope: !1887)
!1890 = !DILocation(line: 194, column: 9, scope: !1887)
!1891 = !DILocalVariable(name: "record", scope: !1892, file: !1, line: 195, type: !1893)
!1892 = distinct !DILexicalBlock(scope: !1867, file: !1, line: 194, column: 25)
!1893 = !DIDerivedType(tag: DW_TAG_typedef, name: "Record", file: !1, line: 36, baseType: !30)
!1894 = !DILocation(line: 195, column: 20, scope: !1892)
!1895 = !DILocalVariable(name: "latLong", scope: !1892, file: !1, line: 196, type: !1313)
!1896 = !DILocation(line: 196, column: 21, scope: !1892)
!1897 = !DILocation(line: 197, column: 26, scope: !1892)
!1898 = !DILocation(line: 197, column: 19, scope: !1892)
!1899 = !DILocation(line: 197, column: 39, scope: !1892)
!1900 = !DILocation(line: 197, column: 13, scope: !1892)
!1901 = !DILocation(line: 198, column: 19, scope: !1892)
!1902 = !DILocation(line: 198, column: 13, scope: !1892)
!1903 = !DILocation(line: 199, column: 22, scope: !1904)
!1904 = distinct !DILexicalBlock(scope: !1892, file: !1, line: 199, column: 17)
!1905 = !DILocation(line: 199, column: 17, scope: !1904)
!1906 = !DILocation(line: 199, column: 17, scope: !1892)
!1907 = !DILocation(line: 199, column: 27, scope: !1908)
!1908 = !DILexicalBlockFile(scope: !1904, file: !1, discriminator: 1)
!1909 = !DILocalVariable(name: "substr", scope: !1892, file: !1, line: 202, type: !1910)
!1910 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 48, align: 8, elements: !1911)
!1911 = !{!1912}
!1912 = !DISubrange(count: 6)
!1913 = !DILocation(line: 202, column: 18, scope: !1892)
!1914 = !DILocation(line: 204, column: 18, scope: !1915)
!1915 = distinct !DILexicalBlock(scope: !1892, file: !1, line: 204, column: 13)
!1916 = !DILocation(line: 204, column: 17, scope: !1915)
!1917 = !DILocation(line: 204, column: 21, scope: !1918)
!1918 = !DILexicalBlockFile(scope: !1919, file: !1, discriminator: 1)
!1919 = distinct !DILexicalBlock(scope: !1915, file: !1, line: 204, column: 13)
!1920 = !DILocation(line: 204, column: 22, scope: !1918)
!1921 = !DILocation(line: 204, column: 13, scope: !1918)
!1922 = !DILocation(line: 204, column: 51, scope: !1923)
!1923 = !DILexicalBlockFile(scope: !1919, file: !1, discriminator: 2)
!1924 = !DILocation(line: 204, column: 44, scope: !1923)
!1925 = !DILocation(line: 204, column: 61, scope: !1923)
!1926 = !DILocation(line: 204, column: 60, scope: !1923)
!1927 = !DILocation(line: 204, column: 62, scope: !1923)
!1928 = !DILocation(line: 204, column: 42, scope: !1923)
!1929 = !DILocation(line: 204, column: 37, scope: !1923)
!1930 = !DILocation(line: 204, column: 30, scope: !1923)
!1931 = !DILocation(line: 204, column: 40, scope: !1923)
!1932 = !DILocation(line: 204, column: 26, scope: !1933)
!1933 = !DILexicalBlockFile(scope: !1919, file: !1, discriminator: 3)
!1934 = !DILocation(line: 204, column: 13, scope: !1933)
!1935 = distinct !{!1935, !1936}
!1936 = !DILocation(line: 204, column: 13, scope: !1892)
!1937 = !DILocation(line: 205, column: 13, scope: !1892)
!1938 = !DILocation(line: 205, column: 23, scope: !1892)
!1939 = !DILocation(line: 206, column: 32, scope: !1892)
!1940 = !DILocation(line: 206, column: 27, scope: !1892)
!1941 = !DILocation(line: 206, column: 21, scope: !1892)
!1942 = !DILocation(line: 206, column: 25, scope: !1892)
!1943 = !DILocation(line: 208, column: 18, scope: !1944)
!1944 = distinct !DILexicalBlock(scope: !1892, file: !1, line: 208, column: 13)
!1945 = !DILocation(line: 208, column: 17, scope: !1944)
!1946 = !DILocation(line: 208, column: 21, scope: !1947)
!1947 = !DILexicalBlockFile(scope: !1948, file: !1, discriminator: 1)
!1948 = distinct !DILexicalBlock(scope: !1944, file: !1, line: 208, column: 13)
!1949 = !DILocation(line: 208, column: 22, scope: !1947)
!1950 = !DILocation(line: 208, column: 13, scope: !1947)
!1951 = !DILocation(line: 208, column: 51, scope: !1952)
!1952 = !DILexicalBlockFile(scope: !1948, file: !1, discriminator: 2)
!1953 = !DILocation(line: 208, column: 44, scope: !1952)
!1954 = !DILocation(line: 208, column: 61, scope: !1952)
!1955 = !DILocation(line: 208, column: 60, scope: !1952)
!1956 = !DILocation(line: 208, column: 62, scope: !1952)
!1957 = !DILocation(line: 208, column: 42, scope: !1952)
!1958 = !DILocation(line: 208, column: 37, scope: !1952)
!1959 = !DILocation(line: 208, column: 30, scope: !1952)
!1960 = !DILocation(line: 208, column: 40, scope: !1952)
!1961 = !DILocation(line: 208, column: 26, scope: !1962)
!1962 = !DILexicalBlockFile(scope: !1948, file: !1, discriminator: 3)
!1963 = !DILocation(line: 208, column: 13, scope: !1962)
!1964 = distinct !{!1964, !1965}
!1965 = !DILocation(line: 208, column: 13, scope: !1892)
!1966 = !DILocation(line: 209, column: 13, scope: !1892)
!1967 = !DILocation(line: 209, column: 23, scope: !1892)
!1968 = !DILocation(line: 210, column: 32, scope: !1892)
!1969 = !DILocation(line: 210, column: 27, scope: !1892)
!1970 = !DILocation(line: 210, column: 21, scope: !1892)
!1971 = !DILocation(line: 210, column: 25, scope: !1892)
!1972 = !DILocation(line: 212, column: 13, scope: !1892)
!1973 = !DILocation(line: 212, column: 23, scope: !1892)
!1974 = !DILocation(line: 213, column: 13, scope: !1892)
!1975 = !DILocation(line: 213, column: 21, scope: !1892)
!1976 = !DILocation(line: 214, column: 19, scope: !1892)
!1977 = !DILocation(line: 194, column: 9, scope: !1978)
!1978 = !DILexicalBlockFile(scope: !1867, file: !1, discriminator: 2)
!1979 = distinct !{!1979, !1885}
!1980 = !DILocation(line: 216, column: 16, scope: !1867)
!1981 = !DILocation(line: 216, column: 9, scope: !1867)
!1982 = !DILocation(line: 178, column: 2, scope: !1983)
!1983 = !DILexicalBlockFile(scope: !1829, file: !1, discriminator: 2)
!1984 = distinct !{!1984, !1859}
!1985 = !DILocation(line: 218, column: 12, scope: !1829)
!1986 = !DILocation(line: 218, column: 5, scope: !1829)
!1987 = !DILocation(line: 220, column: 12, scope: !1829)
!1988 = !DILocation(line: 220, column: 5, scope: !1829)
!1989 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1532, file: !1531, line: 421, type: !1538, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !1537, variables: !16)
!1990 = !DILocalVariable(name: "this", arg: 1, scope: !1989, type: !1991, flags: DIFlagArtificial | DIFlagObjectPointer)
!1991 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1532, size: 64, align: 64)
!1992 = !DILocation(line: 0, scope: !1989)
!1993 = !DILocalVariable(name: "vx", arg: 2, scope: !1989, file: !1531, line: 421, type: !1106)
!1994 = !DILocation(line: 421, column: 43, scope: !1989)
!1995 = !DILocalVariable(name: "vy", arg: 3, scope: !1989, file: !1531, line: 421, type: !1106)
!1996 = !DILocation(line: 421, column: 64, scope: !1989)
!1997 = !DILocalVariable(name: "vz", arg: 4, scope: !1989, file: !1531, line: 421, type: !1106)
!1998 = !DILocation(line: 421, column: 85, scope: !1989)
!1999 = !DILocation(line: 421, column: 95, scope: !1989)
!2000 = !DILocation(line: 421, column: 97, scope: !1989)
!2001 = !DILocation(line: 421, column: 102, scope: !1989)
!2002 = !DILocation(line: 421, column: 104, scope: !1989)
!2003 = !DILocation(line: 421, column: 109, scope: !1989)
!2004 = !DILocation(line: 421, column: 111, scope: !1989)
!2005 = !DILocation(line: 421, column: 116, scope: !1989)
!2006 = distinct !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorI7latLongSaIS0_EEixEm", scope: !362, file: !44, line: 779, type: !434, isLocal: false, isDefinition: true, scopeLine: 780, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !433, variables: !16)
!2007 = !DILocalVariable(name: "this", arg: 1, scope: !2006, type: !1661, flags: DIFlagArtificial | DIFlagObjectPointer)
!2008 = !DILocation(line: 0, scope: !2006)
!2009 = !DILocalVariable(name: "__n", arg: 2, scope: !2006, file: !44, line: 779, type: !359)
!2010 = !DILocation(line: 779, column: 28, scope: !2006)
!2011 = !DILocation(line: 780, column: 24, scope: !2006)
!2012 = !DILocation(line: 780, column: 32, scope: !2006)
!2013 = !DILocation(line: 780, column: 43, scope: !2006)
!2014 = !DILocation(line: 780, column: 41, scope: !2006)
!2015 = !DILocation(line: 780, column: 9, scope: !2006)
!2016 = distinct !DISubprogram(name: "findLowest", linkageName: "_Z10findLowestRSt6vectorI6recordSaIS0_EEPfii", scope: !1, file: !1, line: 223, type: !2017, isLocal: false, isDefinition: true, scopeLine: 223, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !16)
!2017 = !DISubroutineType(types: !2018)
!2018 = !{null, !593, !39, !540, !540}
!2019 = !DILocalVariable(name: "records", arg: 1, scope: !2016, file: !1, line: 223, type: !593)
!2020 = !DILocation(line: 223, column: 38, scope: !2016)
!2021 = !DILocalVariable(name: "distances", arg: 2, scope: !2016, file: !1, line: 223, type: !39)
!2022 = !DILocation(line: 223, column: 53, scope: !2016)
!2023 = !DILocalVariable(name: "numRecords", arg: 3, scope: !2016, file: !1, line: 223, type: !540)
!2024 = !DILocation(line: 223, column: 67, scope: !2016)
!2025 = !DILocalVariable(name: "topN", arg: 4, scope: !2016, file: !1, line: 223, type: !540)
!2026 = !DILocation(line: 223, column: 82, scope: !2016)
!2027 = !DILocalVariable(name: "i", scope: !2016, file: !1, line: 224, type: !540)
!2028 = !DILocation(line: 224, column: 7, scope: !2016)
!2029 = !DILocalVariable(name: "j", scope: !2016, file: !1, line: 224, type: !540)
!2030 = !DILocation(line: 224, column: 9, scope: !2016)
!2031 = !DILocalVariable(name: "val", scope: !2016, file: !1, line: 225, type: !22)
!2032 = !DILocation(line: 225, column: 9, scope: !2016)
!2033 = !DILocalVariable(name: "minLoc", scope: !2016, file: !1, line: 226, type: !540)
!2034 = !DILocation(line: 226, column: 7, scope: !2016)
!2035 = !DILocalVariable(name: "tempRec", scope: !2016, file: !1, line: 227, type: !2036)
!2036 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1893, size: 64, align: 64)
!2037 = !DILocation(line: 227, column: 11, scope: !2016)
!2038 = !DILocalVariable(name: "tempDist", scope: !2016, file: !1, line: 228, type: !22)
!2039 = !DILocation(line: 228, column: 9, scope: !2016)
!2040 = !DILocation(line: 230, column: 8, scope: !2041)
!2041 = distinct !DILexicalBlock(scope: !2016, file: !1, line: 230, column: 3)
!2042 = !DILocation(line: 230, column: 7, scope: !2041)
!2043 = !DILocation(line: 230, column: 11, scope: !2044)
!2044 = !DILexicalBlockFile(scope: !2045, file: !1, discriminator: 1)
!2045 = distinct !DILexicalBlock(scope: !2041, file: !1, line: 230, column: 3)
!2046 = !DILocation(line: 230, column: 13, scope: !2044)
!2047 = !DILocation(line: 230, column: 12, scope: !2044)
!2048 = !DILocation(line: 230, column: 3, scope: !2044)
!2049 = !DILocation(line: 231, column: 14, scope: !2050)
!2050 = distinct !DILexicalBlock(scope: !2045, file: !1, line: 230, column: 23)
!2051 = !DILocation(line: 231, column: 12, scope: !2050)
!2052 = !DILocation(line: 232, column: 11, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !2050, file: !1, line: 232, column: 5)
!2054 = !DILocation(line: 232, column: 10, scope: !2053)
!2055 = !DILocation(line: 232, column: 9, scope: !2053)
!2056 = !DILocation(line: 232, column: 13, scope: !2057)
!2057 = !DILexicalBlockFile(scope: !2058, file: !1, discriminator: 1)
!2058 = distinct !DILexicalBlock(scope: !2053, file: !1, line: 232, column: 5)
!2059 = !DILocation(line: 232, column: 15, scope: !2057)
!2060 = !DILocation(line: 232, column: 14, scope: !2057)
!2061 = !DILocation(line: 232, column: 5, scope: !2057)
!2062 = !DILocation(line: 233, column: 13, scope: !2063)
!2063 = distinct !DILexicalBlock(scope: !2058, file: !1, line: 232, column: 31)
!2064 = !DILocation(line: 233, column: 23, scope: !2063)
!2065 = !DILocation(line: 233, column: 11, scope: !2063)
!2066 = !DILocation(line: 234, column: 11, scope: !2067)
!2067 = distinct !DILexicalBlock(scope: !2063, file: !1, line: 234, column: 11)
!2068 = !DILocation(line: 234, column: 17, scope: !2067)
!2069 = !DILocation(line: 234, column: 27, scope: !2067)
!2070 = !DILocation(line: 234, column: 15, scope: !2067)
!2071 = !DILocation(line: 234, column: 11, scope: !2063)
!2072 = !DILocation(line: 234, column: 45, scope: !2073)
!2073 = !DILexicalBlockFile(scope: !2067, file: !1, discriminator: 1)
!2074 = !DILocation(line: 234, column: 43, scope: !2073)
!2075 = !DILocation(line: 234, column: 36, scope: !2073)
!2076 = !DILocation(line: 235, column: 5, scope: !2063)
!2077 = !DILocation(line: 232, column: 27, scope: !2078)
!2078 = !DILexicalBlockFile(scope: !2058, file: !1, discriminator: 2)
!2079 = !DILocation(line: 232, column: 5, scope: !2078)
!2080 = distinct !{!2080, !2081}
!2081 = !DILocation(line: 232, column: 5, scope: !2050)
!2082 = !DILocation(line: 237, column: 16, scope: !2050)
!2083 = !DILocation(line: 237, column: 24, scope: !2050)
!2084 = !DILocation(line: 237, column: 13, scope: !2050)
!2085 = !DILocation(line: 238, column: 18, scope: !2050)
!2086 = !DILocation(line: 238, column: 26, scope: !2050)
!2087 = !DILocation(line: 238, column: 5, scope: !2050)
!2088 = !DILocation(line: 238, column: 13, scope: !2050)
!2089 = !DILocation(line: 238, column: 5, scope: !2090)
!2090 = !DILexicalBlockFile(scope: !2050, file: !1, discriminator: 1)
!2091 = !DILocation(line: 238, column: 16, scope: !2050)
!2092 = !DILocation(line: 239, column: 24, scope: !2050)
!2093 = !DILocation(line: 239, column: 5, scope: !2050)
!2094 = !DILocation(line: 239, column: 13, scope: !2050)
!2095 = !DILocation(line: 239, column: 21, scope: !2050)
!2096 = !DILocation(line: 241, column: 16, scope: !2050)
!2097 = !DILocation(line: 241, column: 26, scope: !2050)
!2098 = !DILocation(line: 241, column: 14, scope: !2050)
!2099 = !DILocation(line: 242, column: 20, scope: !2050)
!2100 = !DILocation(line: 242, column: 30, scope: !2050)
!2101 = !DILocation(line: 242, column: 5, scope: !2050)
!2102 = !DILocation(line: 242, column: 15, scope: !2050)
!2103 = !DILocation(line: 242, column: 18, scope: !2050)
!2104 = !DILocation(line: 243, column: 25, scope: !2050)
!2105 = !DILocation(line: 243, column: 5, scope: !2050)
!2106 = !DILocation(line: 243, column: 15, scope: !2050)
!2107 = !DILocation(line: 243, column: 23, scope: !2050)
!2108 = !DILocation(line: 246, column: 27, scope: !2050)
!2109 = !DILocation(line: 246, column: 37, scope: !2050)
!2110 = !DILocation(line: 246, column: 5, scope: !2050)
!2111 = !DILocation(line: 246, column: 13, scope: !2050)
!2112 = !DILocation(line: 246, column: 16, scope: !2050)
!2113 = !DILocation(line: 246, column: 25, scope: !2050)
!2114 = !DILocation(line: 247, column: 3, scope: !2050)
!2115 = !DILocation(line: 230, column: 19, scope: !2116)
!2116 = !DILexicalBlockFile(scope: !2045, file: !1, discriminator: 2)
!2117 = !DILocation(line: 230, column: 3, scope: !2116)
!2118 = distinct !{!2118, !2119}
!2119 = !DILocation(line: 230, column: 3, scope: !2016)
!2120 = !DILocation(line: 248, column: 1, scope: !2016)
!2121 = distinct !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorI6recordSaIS0_EEixEm", scope: !565, file: !44, line: 779, type: !635, isLocal: false, isDefinition: true, scopeLine: 780, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !634, variables: !16)
!2122 = !DILocalVariable(name: "this", arg: 1, scope: !2121, type: !1654, flags: DIFlagArtificial | DIFlagObjectPointer)
!2123 = !DILocation(line: 0, scope: !2121)
!2124 = !DILocalVariable(name: "__n", arg: 2, scope: !2121, file: !44, line: 779, type: !359)
!2125 = !DILocation(line: 779, column: 28, scope: !2121)
!2126 = !DILocation(line: 780, column: 24, scope: !2121)
!2127 = !DILocation(line: 780, column: 32, scope: !2121)
!2128 = !DILocation(line: 780, column: 43, scope: !2121)
!2129 = !DILocation(line: 780, column: 41, scope: !2121)
!2130 = !DILocation(line: 780, column: 9, scope: !2121)
!2131 = distinct !DISubprogram(name: "~vector", linkageName: "_ZNSt6vectorI7latLongSaIS0_EED2Ev", scope: !362, file: !44, line: 423, type: !366, isLocal: false, isDefinition: true, scopeLine: 424, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !386, variables: !16)
!2132 = !DILocalVariable(name: "this", arg: 1, scope: !2131, type: !1661, flags: DIFlagArtificial | DIFlagObjectPointer)
!2133 = !DILocation(line: 0, scope: !2131)
!2134 = !DILocation(line: 424, column: 29, scope: !2135)
!2135 = distinct !DILexicalBlock(scope: !2131, file: !44, line: 424, column: 7)
!2136 = !DILocation(line: 424, column: 37, scope: !2135)
!2137 = !DILocation(line: 424, column: 53, scope: !2135)
!2138 = !DILocation(line: 424, column: 61, scope: !2135)
!2139 = !DILocation(line: 425, column: 9, scope: !2135)
!2140 = !DILocation(line: 424, column: 9, scope: !2141)
!2141 = !DILexicalBlockFile(scope: !2135, file: !44, discriminator: 1)
!2142 = !DILocation(line: 425, column: 33, scope: !2141)
!2143 = !DILocation(line: 425, column: 33, scope: !2144)
!2144 = !DILexicalBlockFile(scope: !2135, file: !44, discriminator: 2)
!2145 = !DILocation(line: 425, column: 33, scope: !2146)
!2146 = !DILexicalBlockFile(scope: !2135, file: !44, discriminator: 3)
!2147 = !DILocation(line: 425, column: 33, scope: !2148)
!2148 = !DILexicalBlockFile(scope: !2135, file: !44, discriminator: 4)
!2149 = !DILocation(line: 425, column: 33, scope: !2150)
!2150 = !DILexicalBlockFile(scope: !2135, file: !44, discriminator: 5)
!2151 = distinct !DISubprogram(name: "~vector", linkageName: "_ZNSt6vectorI6recordSaIS0_EED2Ev", scope: !565, file: !44, line: 423, type: !569, isLocal: false, isDefinition: true, scopeLine: 424, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !589, variables: !16)
!2152 = !DILocalVariable(name: "this", arg: 1, scope: !2151, type: !1654, flags: DIFlagArtificial | DIFlagObjectPointer)
!2153 = !DILocation(line: 0, scope: !2151)
!2154 = !DILocation(line: 424, column: 29, scope: !2155)
!2155 = distinct !DILexicalBlock(scope: !2151, file: !44, line: 424, column: 7)
!2156 = !DILocation(line: 424, column: 37, scope: !2155)
!2157 = !DILocation(line: 424, column: 53, scope: !2155)
!2158 = !DILocation(line: 424, column: 61, scope: !2155)
!2159 = !DILocation(line: 425, column: 9, scope: !2155)
!2160 = !DILocation(line: 424, column: 9, scope: !2161)
!2161 = !DILexicalBlockFile(scope: !2155, file: !44, discriminator: 1)
!2162 = !DILocation(line: 425, column: 33, scope: !2161)
!2163 = !DILocation(line: 425, column: 33, scope: !2164)
!2164 = !DILexicalBlockFile(scope: !2155, file: !44, discriminator: 2)
!2165 = !DILocation(line: 425, column: 33, scope: !2166)
!2166 = !DILexicalBlockFile(scope: !2155, file: !44, discriminator: 3)
!2167 = !DILocation(line: 425, column: 33, scope: !2168)
!2168 = !DILexicalBlockFile(scope: !2155, file: !44, discriminator: 4)
!2169 = !DILocation(line: 425, column: 33, scope: !2170)
!2170 = !DILexicalBlockFile(scope: !2155, file: !44, discriminator: 5)
!2171 = distinct !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_", scope: !362, file: !44, line: 913, type: !469, isLocal: false, isDefinition: true, scopeLine: 914, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !468, variables: !16)
!2172 = !DILocalVariable(name: "this", arg: 1, scope: !2171, type: !1661, flags: DIFlagArtificial | DIFlagObjectPointer)
!2173 = !DILocation(line: 0, scope: !2171)
!2174 = !DILocalVariable(name: "__x", arg: 2, scope: !2171, file: !44, line: 913, type: !378)
!2175 = !DILocation(line: 913, column: 35, scope: !2171)
!2176 = !DILocation(line: 915, column: 12, scope: !2177)
!2177 = distinct !DILexicalBlock(scope: !2171, file: !44, line: 915, column: 6)
!2178 = !DILocation(line: 915, column: 20, scope: !2177)
!2179 = !DILocation(line: 915, column: 39, scope: !2177)
!2180 = !DILocation(line: 915, column: 47, scope: !2177)
!2181 = !DILocation(line: 915, column: 30, scope: !2177)
!2182 = !DILocation(line: 915, column: 6, scope: !2171)
!2183 = !DILocation(line: 917, column: 37, scope: !2184)
!2184 = distinct !DILexicalBlock(scope: !2177, file: !44, line: 916, column: 4)
!2185 = !DILocation(line: 917, column: 31, scope: !2184)
!2186 = !DILocation(line: 917, column: 52, scope: !2184)
!2187 = !DILocation(line: 917, column: 60, scope: !2184)
!2188 = !DILocation(line: 918, column: 31, scope: !2184)
!2189 = !DILocation(line: 917, column: 6, scope: !2184)
!2190 = !DILocation(line: 919, column: 14, scope: !2184)
!2191 = !DILocation(line: 919, column: 22, scope: !2184)
!2192 = !DILocation(line: 919, column: 6, scope: !2184)
!2193 = !DILocation(line: 920, column: 4, scope: !2184)
!2194 = !DILocation(line: 925, column: 18, scope: !2177)
!2195 = !DILocation(line: 925, column: 25, scope: !2177)
!2196 = !DILocation(line: 925, column: 4, scope: !2177)
!2197 = !DILocation(line: 925, column: 4, scope: !2198)
!2198 = !DILexicalBlockFile(scope: !2177, file: !44, discriminator: 1)
!2199 = !DILocation(line: 927, column: 7, scope: !2171)
!2200 = distinct !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorI6recordSaIS0_EE9push_backERKS0_", scope: !565, file: !44, line: 913, type: !670, isLocal: false, isDefinition: true, scopeLine: 914, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !669, variables: !16)
!2201 = !DILocalVariable(name: "this", arg: 1, scope: !2200, type: !1654, flags: DIFlagArtificial | DIFlagObjectPointer)
!2202 = !DILocation(line: 0, scope: !2200)
!2203 = !DILocalVariable(name: "__x", arg: 2, scope: !2200, file: !44, line: 913, type: !581)
!2204 = !DILocation(line: 913, column: 35, scope: !2200)
!2205 = !DILocation(line: 915, column: 12, scope: !2206)
!2206 = distinct !DILexicalBlock(scope: !2200, file: !44, line: 915, column: 6)
!2207 = !DILocation(line: 915, column: 20, scope: !2206)
!2208 = !DILocation(line: 915, column: 39, scope: !2206)
!2209 = !DILocation(line: 915, column: 47, scope: !2206)
!2210 = !DILocation(line: 915, column: 30, scope: !2206)
!2211 = !DILocation(line: 915, column: 6, scope: !2200)
!2212 = !DILocation(line: 917, column: 37, scope: !2213)
!2213 = distinct !DILexicalBlock(scope: !2206, file: !44, line: 916, column: 4)
!2214 = !DILocation(line: 917, column: 31, scope: !2213)
!2215 = !DILocation(line: 917, column: 52, scope: !2213)
!2216 = !DILocation(line: 917, column: 60, scope: !2213)
!2217 = !DILocation(line: 918, column: 31, scope: !2213)
!2218 = !DILocation(line: 917, column: 6, scope: !2213)
!2219 = !DILocation(line: 919, column: 14, scope: !2213)
!2220 = !DILocation(line: 919, column: 22, scope: !2213)
!2221 = !DILocation(line: 919, column: 6, scope: !2213)
!2222 = !DILocation(line: 920, column: 4, scope: !2213)
!2223 = !DILocation(line: 925, column: 18, scope: !2206)
!2224 = !DILocation(line: 925, column: 25, scope: !2206)
!2225 = !DILocation(line: 925, column: 4, scope: !2206)
!2226 = !DILocation(line: 925, column: 4, scope: !2227)
!2227 = !DILexicalBlockFile(scope: !2206, file: !44, discriminator: 1)
!2228 = !DILocation(line: 927, column: 7, scope: !2200)
!2229 = distinct !DISubprogram(name: "_Vector_base", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EEC2Ev", scope: !45, file: !44, line: 124, type: !178, isLocal: false, isDefinition: true, scopeLine: 125, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !177, variables: !16)
!2230 = !DILocalVariable(name: "this", arg: 1, scope: !2229, type: !2231, flags: DIFlagArtificial | DIFlagObjectPointer)
!2231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!2232 = !DILocation(line: 0, scope: !2229)
!2233 = !DILocation(line: 125, column: 9, scope: !2229)
!2234 = !DILocation(line: 125, column: 21, scope: !2229)
!2235 = distinct !DISubprogram(name: "_Vector_impl", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implC2Ev", scope: !48, file: !44, line: 86, type: !151, isLocal: false, isDefinition: true, scopeLine: 88, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !150, variables: !16)
!2236 = !DILocalVariable(name: "this", arg: 1, scope: !2235, type: !2237, flags: DIFlagArtificial | DIFlagObjectPointer)
!2237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64, align: 64)
!2238 = !DILocation(line: 0, scope: !2235)
!2239 = !DILocation(line: 88, column: 2, scope: !2235)
!2240 = !DILocation(line: 87, column: 4, scope: !2235)
!2241 = !DILocation(line: 87, column: 22, scope: !2235)
!2242 = !DILocation(line: 87, column: 34, scope: !2235)
!2243 = !DILocation(line: 87, column: 47, scope: !2235)
!2244 = !DILocation(line: 88, column: 4, scope: !2235)
!2245 = distinct !DISubprogram(name: "allocator", linkageName: "_ZNSaI6recordEC2Ev", scope: !63, file: !64, line: 113, type: !119, isLocal: false, isDefinition: true, scopeLine: 113, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !118, variables: !16)
!2246 = !DILocalVariable(name: "this", arg: 1, scope: !2245, type: !2247, flags: DIFlagArtificial | DIFlagObjectPointer)
!2247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64, align: 64)
!2248 = !DILocation(line: 0, scope: !2245)
!2249 = !DILocation(line: 113, column: 27, scope: !2245)
!2250 = !DILocation(line: 113, column: 7, scope: !2245)
!2251 = !DILocation(line: 113, column: 29, scope: !2245)
!2252 = distinct !DISubprogram(name: "new_allocator", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordEC2Ev", scope: !67, file: !68, line: 79, type: !71, isLocal: false, isDefinition: true, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !70, variables: !16)
!2253 = !DILocalVariable(name: "this", arg: 1, scope: !2252, type: !2254, flags: DIFlagArtificial | DIFlagObjectPointer)
!2254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64, align: 64)
!2255 = !DILocation(line: 0, scope: !2252)
!2256 = !DILocation(line: 79, column: 47, scope: !2252)
!2257 = distinct !DISubprogram(name: "_Destroy<record *, record>", linkageName: "_ZSt8_DestroyIP6recordS0_EvT_S2_RSaIT0_E", scope: !14, file: !2258, line: 148, type: !2259, isLocal: false, isDefinition: true, scopeLine: 150, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !2261, variables: !16)
!2258 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/stl_construct.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!2259 = !DISubroutineType(types: !2260)
!2260 = !{null, !84, !84, !62}
!2261 = !{!2262, !117}
!2262 = !DITemplateTypeParameter(name: "_ForwardIterator", type: !84)
!2263 = !DILocalVariable(name: "__first", arg: 1, scope: !2257, file: !2258, line: 148, type: !84)
!2264 = !DILocation(line: 148, column: 31, scope: !2257)
!2265 = !DILocalVariable(name: "__last", arg: 2, scope: !2257, file: !2258, line: 148, type: !84)
!2266 = !DILocation(line: 148, column: 57, scope: !2257)
!2267 = !DILocalVariable(arg: 3, scope: !2257, file: !2258, line: 149, type: !62)
!2268 = !DILocation(line: 149, column: 22, scope: !2257)
!2269 = !DILocation(line: 151, column: 16, scope: !2257)
!2270 = !DILocation(line: 151, column: 25, scope: !2257)
!2271 = !DILocation(line: 151, column: 7, scope: !2257)
!2272 = !DILocation(line: 152, column: 5, scope: !2257)
!2273 = distinct !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv", scope: !45, file: !44, line: 113, type: !164, isLocal: false, isDefinition: true, scopeLine: 114, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !163, variables: !16)
!2274 = !DILocalVariable(name: "this", arg: 1, scope: !2273, type: !2231, flags: DIFlagArtificial | DIFlagObjectPointer)
!2275 = !DILocation(line: 0, scope: !2273)
!2276 = !DILocation(line: 114, column: 53, scope: !2273)
!2277 = !DILocation(line: 114, column: 16, scope: !2273)
!2278 = !DILocation(line: 114, column: 9, scope: !2273)
!2279 = distinct !DISubprogram(name: "~_Vector_base", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EED2Ev", scope: !45, file: !44, line: 159, type: !178, isLocal: false, isDefinition: true, scopeLine: 160, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !191, variables: !16)
!2280 = !DILocalVariable(name: "this", arg: 1, scope: !2279, type: !2231, flags: DIFlagArtificial | DIFlagObjectPointer)
!2281 = !DILocation(line: 0, scope: !2279)
!2282 = !DILocation(line: 160, column: 29, scope: !2283)
!2283 = distinct !DILexicalBlock(scope: !2279, file: !44, line: 160, column: 7)
!2284 = !DILocation(line: 160, column: 37, scope: !2283)
!2285 = !DILocation(line: 160, column: 53, scope: !2283)
!2286 = !DILocation(line: 160, column: 61, scope: !2283)
!2287 = !DILocation(line: 161, column: 17, scope: !2283)
!2288 = !DILocation(line: 161, column: 25, scope: !2283)
!2289 = !DILocation(line: 161, column: 9, scope: !2283)
!2290 = !DILocation(line: 160, column: 9, scope: !2283)
!2291 = !DILocation(line: 161, column: 36, scope: !2292)
!2292 = !DILexicalBlockFile(scope: !2283, file: !44, discriminator: 1)
!2293 = !DILocation(line: 161, column: 36, scope: !2294)
!2294 = !DILexicalBlockFile(scope: !2283, file: !44, discriminator: 2)
!2295 = !DILocation(line: 161, column: 36, scope: !2296)
!2296 = !DILexicalBlockFile(scope: !2283, file: !44, discriminator: 3)
!2297 = distinct !DISubprogram(name: "_Destroy<record *>", linkageName: "_ZSt8_DestroyIP6recordEvT_S2_", scope: !14, file: !2258, line: 122, type: !2298, isLocal: false, isDefinition: true, scopeLine: 123, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !2300, variables: !16)
!2298 = !DISubroutineType(types: !2299)
!2299 = !{null, !84, !84}
!2300 = !{!2262}
!2301 = !DILocalVariable(name: "__first", arg: 1, scope: !2297, file: !2258, line: 122, type: !84)
!2302 = !DILocation(line: 122, column: 31, scope: !2297)
!2303 = !DILocalVariable(name: "__last", arg: 2, scope: !2297, file: !2258, line: 122, type: !84)
!2304 = !DILocation(line: 122, column: 57, scope: !2297)
!2305 = !DILocation(line: 127, column: 12, scope: !2297)
!2306 = !DILocation(line: 127, column: 21, scope: !2297)
!2307 = !DILocation(line: 126, column: 7, scope: !2297)
!2308 = !DILocation(line: 128, column: 5, scope: !2297)
!2309 = distinct !DISubprogram(name: "__destroy<record *>", linkageName: "_ZNSt12_Destroy_auxILb1EE9__destroyIP6recordEEvT_S4_", scope: !2310, file: !2258, line: 112, type: !2298, isLocal: false, isDefinition: true, scopeLine: 112, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !2300, declaration: !2313, variables: !16)
!2310 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Destroy_aux<true>", scope: !14, file: !2258, line: 108, size: 8, align: 8, elements: !16, templateParams: !2311, identifier: "_ZTSSt12_Destroy_auxILb1EE")
!2311 = !{!2312}
!2312 = !DITemplateValueParameter(type: !429, value: i8 1)
!2313 = !DISubprogram(name: "__destroy<record *>", linkageName: "_ZNSt12_Destroy_auxILb1EE9__destroyIP6recordEEvT_S4_", scope: !2310, file: !2258, line: 112, type: !2298, isLocal: false, isDefinition: false, scopeLine: 112, flags: DIFlagPrototyped, isOptimized: false, templateParams: !2300)
!2314 = !DILocalVariable(arg: 1, scope: !2309, file: !2258, line: 112, type: !84)
!2315 = !DILocation(line: 112, column: 35, scope: !2309)
!2316 = !DILocalVariable(arg: 2, scope: !2309, file: !2258, line: 112, type: !84)
!2317 = !DILocation(line: 112, column: 53, scope: !2309)
!2318 = !DILocation(line: 112, column: 57, scope: !2309)
!2319 = distinct !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m", scope: !45, file: !44, line: 174, type: !196, isLocal: false, isDefinition: true, scopeLine: 175, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !195, variables: !16)
!2320 = !DILocalVariable(name: "this", arg: 1, scope: !2319, type: !2231, flags: DIFlagArtificial | DIFlagObjectPointer)
!2321 = !DILocation(line: 0, scope: !2319)
!2322 = !DILocalVariable(name: "__p", arg: 2, scope: !2319, file: !44, line: 174, type: !52)
!2323 = !DILocation(line: 174, column: 29, scope: !2319)
!2324 = !DILocalVariable(name: "__n", arg: 3, scope: !2319, file: !44, line: 174, type: !100)
!2325 = !DILocation(line: 174, column: 41, scope: !2319)
!2326 = !DILocation(line: 177, column: 6, scope: !2327)
!2327 = distinct !DILexicalBlock(scope: !2319, file: !44, line: 177, column: 6)
!2328 = !DILocation(line: 177, column: 6, scope: !2319)
!2329 = !DILocation(line: 178, column: 20, scope: !2327)
!2330 = !DILocation(line: 178, column: 29, scope: !2327)
!2331 = !DILocation(line: 178, column: 34, scope: !2327)
!2332 = !DILocation(line: 178, column: 4, scope: !2327)
!2333 = !DILocation(line: 179, column: 7, scope: !2319)
!2334 = distinct !DISubprogram(name: "~_Vector_impl", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implD2Ev", scope: !48, file: !44, line: 79, type: !151, isLocal: false, isDefinition: true, scopeLine: 79, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !2335, variables: !16)
!2335 = !DISubprogram(name: "~_Vector_impl", scope: !48, type: !151, isLocal: false, isDefinition: false, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!2336 = !DILocalVariable(name: "this", arg: 1, scope: !2334, type: !2237, flags: DIFlagArtificial | DIFlagObjectPointer)
!2337 = !DILocation(line: 0, scope: !2334)
!2338 = !DILocation(line: 79, column: 14, scope: !2339)
!2339 = distinct !DILexicalBlock(scope: !2334, file: !44, line: 79, column: 14)
!2340 = !DILocation(line: 79, column: 14, scope: !2334)
!2341 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10deallocateERS2_PS1_m", scope: !55, file: !54, line: 184, type: !131, isLocal: false, isDefinition: true, scopeLine: 185, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !130, variables: !16)
!2342 = !DILocalVariable(name: "__a", arg: 1, scope: !2341, file: !54, line: 184, type: !62)
!2343 = !DILocation(line: 184, column: 36, scope: !2341)
!2344 = !DILocalVariable(name: "__p", arg: 2, scope: !2341, file: !54, line: 184, type: !53)
!2345 = !DILocation(line: 184, column: 49, scope: !2341)
!2346 = !DILocalVariable(name: "__n", arg: 3, scope: !2341, file: !54, line: 184, type: !128)
!2347 = !DILocation(line: 184, column: 64, scope: !2341)
!2348 = !DILocation(line: 185, column: 7, scope: !2341)
!2349 = !DILocation(line: 185, column: 22, scope: !2341)
!2350 = !DILocation(line: 185, column: 27, scope: !2341)
!2351 = !DILocation(line: 185, column: 11, scope: !2341)
!2352 = !DILocation(line: 185, column: 33, scope: !2341)
!2353 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE10deallocateEPS1_m", scope: !67, file: !68, line: 109, type: !105, isLocal: false, isDefinition: true, scopeLine: 110, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !104, variables: !16)
!2354 = !DILocalVariable(name: "this", arg: 1, scope: !2353, type: !2254, flags: DIFlagArtificial | DIFlagObjectPointer)
!2355 = !DILocation(line: 0, scope: !2353)
!2356 = !DILocalVariable(name: "__p", arg: 2, scope: !2353, file: !68, line: 109, type: !83)
!2357 = !DILocation(line: 109, column: 26, scope: !2353)
!2358 = !DILocalVariable(arg: 3, scope: !2353, file: !68, line: 109, type: !99)
!2359 = !DILocation(line: 109, column: 40, scope: !2353)
!2360 = !DILocation(line: 110, column: 27, scope: !2353)
!2361 = !DILocation(line: 110, column: 9, scope: !2353)
!2362 = !DILocation(line: 110, column: 33, scope: !2353)
!2363 = distinct !DISubprogram(name: "~allocator", linkageName: "_ZNSaI6recordED2Ev", scope: !63, file: !64, line: 121, type: !119, isLocal: false, isDefinition: true, scopeLine: 121, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !127, variables: !16)
!2364 = !DILocalVariable(name: "this", arg: 1, scope: !2363, type: !2247, flags: DIFlagArtificial | DIFlagObjectPointer)
!2365 = !DILocation(line: 0, scope: !2363)
!2366 = !DILocation(line: 121, column: 30, scope: !2367)
!2367 = distinct !DILexicalBlock(scope: !2363, file: !64, line: 121, column: 28)
!2368 = !DILocation(line: 121, column: 30, scope: !2363)
!2369 = distinct !DISubprogram(name: "~new_allocator", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordED2Ev", scope: !67, file: !68, line: 86, type: !71, isLocal: false, isDefinition: true, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !79, variables: !16)
!2370 = !DILocalVariable(name: "this", arg: 1, scope: !2369, type: !2254, flags: DIFlagArtificial | DIFlagObjectPointer)
!2371 = !DILocation(line: 0, scope: !2369)
!2372 = !DILocation(line: 86, column: 48, scope: !2369)
!2373 = distinct !DISubprogram(name: "_Vector_base", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EEC2Ev", scope: !208, file: !44, line: 124, type: !331, isLocal: false, isDefinition: true, scopeLine: 125, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !330, variables: !16)
!2374 = !DILocalVariable(name: "this", arg: 1, scope: !2373, type: !2375, flags: DIFlagArtificial | DIFlagObjectPointer)
!2375 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !208, size: 64, align: 64)
!2376 = !DILocation(line: 0, scope: !2373)
!2377 = !DILocation(line: 125, column: 9, scope: !2373)
!2378 = !DILocation(line: 125, column: 21, scope: !2373)
!2379 = distinct !DISubprogram(name: "_Vector_impl", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implC2Ev", scope: !211, file: !44, line: 86, type: !304, isLocal: false, isDefinition: true, scopeLine: 88, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !303, variables: !16)
!2380 = !DILocalVariable(name: "this", arg: 1, scope: !2379, type: !2381, flags: DIFlagArtificial | DIFlagObjectPointer)
!2381 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64, align: 64)
!2382 = !DILocation(line: 0, scope: !2379)
!2383 = !DILocation(line: 88, column: 2, scope: !2379)
!2384 = !DILocation(line: 87, column: 4, scope: !2379)
!2385 = !DILocation(line: 87, column: 22, scope: !2379)
!2386 = !DILocation(line: 87, column: 34, scope: !2379)
!2387 = !DILocation(line: 87, column: 47, scope: !2379)
!2388 = !DILocation(line: 88, column: 4, scope: !2379)
!2389 = distinct !DISubprogram(name: "allocator", linkageName: "_ZNSaI7latLongEC2Ev", scope: !223, file: !64, line: 113, type: !272, isLocal: false, isDefinition: true, scopeLine: 113, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !271, variables: !16)
!2390 = !DILocalVariable(name: "this", arg: 1, scope: !2389, type: !2391, flags: DIFlagArtificial | DIFlagObjectPointer)
!2391 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !223, size: 64, align: 64)
!2392 = !DILocation(line: 0, scope: !2389)
!2393 = !DILocation(line: 113, column: 27, scope: !2389)
!2394 = !DILocation(line: 113, column: 7, scope: !2389)
!2395 = !DILocation(line: 113, column: 29, scope: !2389)
!2396 = distinct !DISubprogram(name: "new_allocator", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongEC2Ev", scope: !226, file: !68, line: 79, type: !229, isLocal: false, isDefinition: true, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !228, variables: !16)
!2397 = !DILocalVariable(name: "this", arg: 1, scope: !2396, type: !2398, flags: DIFlagArtificial | DIFlagObjectPointer)
!2398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !226, size: 64, align: 64)
!2399 = !DILocation(line: 0, scope: !2396)
!2400 = !DILocation(line: 79, column: 47, scope: !2396)
!2401 = distinct !DISubprogram(name: "_Destroy<latLong *, latLong>", linkageName: "_ZSt8_DestroyIP7latLongS0_EvT_S2_RSaIT0_E", scope: !14, file: !2258, line: 148, type: !2402, isLocal: false, isDefinition: true, scopeLine: 150, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !2404, variables: !16)
!2402 = !DISubroutineType(types: !2403)
!2403 = !{null, !242, !242, !222}
!2404 = !{!2405, !270}
!2405 = !DITemplateTypeParameter(name: "_ForwardIterator", type: !242)
!2406 = !DILocalVariable(name: "__first", arg: 1, scope: !2401, file: !2258, line: 148, type: !242)
!2407 = !DILocation(line: 148, column: 31, scope: !2401)
!2408 = !DILocalVariable(name: "__last", arg: 2, scope: !2401, file: !2258, line: 148, type: !242)
!2409 = !DILocation(line: 148, column: 57, scope: !2401)
!2410 = !DILocalVariable(arg: 3, scope: !2401, file: !2258, line: 149, type: !222)
!2411 = !DILocation(line: 149, column: 22, scope: !2401)
!2412 = !DILocation(line: 151, column: 16, scope: !2401)
!2413 = !DILocation(line: 151, column: 25, scope: !2401)
!2414 = !DILocation(line: 151, column: 7, scope: !2401)
!2415 = !DILocation(line: 152, column: 5, scope: !2401)
!2416 = distinct !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv", scope: !208, file: !44, line: 113, type: !317, isLocal: false, isDefinition: true, scopeLine: 114, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !316, variables: !16)
!2417 = !DILocalVariable(name: "this", arg: 1, scope: !2416, type: !2375, flags: DIFlagArtificial | DIFlagObjectPointer)
!2418 = !DILocation(line: 0, scope: !2416)
!2419 = !DILocation(line: 114, column: 53, scope: !2416)
!2420 = !DILocation(line: 114, column: 16, scope: !2416)
!2421 = !DILocation(line: 114, column: 9, scope: !2416)
!2422 = distinct !DISubprogram(name: "~_Vector_base", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EED2Ev", scope: !208, file: !44, line: 159, type: !331, isLocal: false, isDefinition: true, scopeLine: 160, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !344, variables: !16)
!2423 = !DILocalVariable(name: "this", arg: 1, scope: !2422, type: !2375, flags: DIFlagArtificial | DIFlagObjectPointer)
!2424 = !DILocation(line: 0, scope: !2422)
!2425 = !DILocation(line: 160, column: 29, scope: !2426)
!2426 = distinct !DILexicalBlock(scope: !2422, file: !44, line: 160, column: 7)
!2427 = !DILocation(line: 160, column: 37, scope: !2426)
!2428 = !DILocation(line: 160, column: 53, scope: !2426)
!2429 = !DILocation(line: 160, column: 61, scope: !2426)
!2430 = !DILocation(line: 161, column: 17, scope: !2426)
!2431 = !DILocation(line: 161, column: 25, scope: !2426)
!2432 = !DILocation(line: 161, column: 9, scope: !2426)
!2433 = !DILocation(line: 160, column: 9, scope: !2426)
!2434 = !DILocation(line: 161, column: 36, scope: !2435)
!2435 = !DILexicalBlockFile(scope: !2426, file: !44, discriminator: 1)
!2436 = !DILocation(line: 161, column: 36, scope: !2437)
!2437 = !DILexicalBlockFile(scope: !2426, file: !44, discriminator: 2)
!2438 = !DILocation(line: 161, column: 36, scope: !2439)
!2439 = !DILexicalBlockFile(scope: !2426, file: !44, discriminator: 3)
!2440 = distinct !DISubprogram(name: "_Destroy<latLong *>", linkageName: "_ZSt8_DestroyIP7latLongEvT_S2_", scope: !14, file: !2258, line: 122, type: !2441, isLocal: false, isDefinition: true, scopeLine: 123, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !2443, variables: !16)
!2441 = !DISubroutineType(types: !2442)
!2442 = !{null, !242, !242}
!2443 = !{!2405}
!2444 = !DILocalVariable(name: "__first", arg: 1, scope: !2440, file: !2258, line: 122, type: !242)
!2445 = !DILocation(line: 122, column: 31, scope: !2440)
!2446 = !DILocalVariable(name: "__last", arg: 2, scope: !2440, file: !2258, line: 122, type: !242)
!2447 = !DILocation(line: 122, column: 57, scope: !2440)
!2448 = !DILocation(line: 127, column: 12, scope: !2440)
!2449 = !DILocation(line: 127, column: 21, scope: !2440)
!2450 = !DILocation(line: 126, column: 7, scope: !2440)
!2451 = !DILocation(line: 128, column: 5, scope: !2440)
!2452 = distinct !DISubprogram(name: "__destroy<latLong *>", linkageName: "_ZNSt12_Destroy_auxILb1EE9__destroyIP7latLongEEvT_S4_", scope: !2310, file: !2258, line: 112, type: !2441, isLocal: false, isDefinition: true, scopeLine: 112, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !2443, declaration: !2453, variables: !16)
!2453 = !DISubprogram(name: "__destroy<latLong *>", linkageName: "_ZNSt12_Destroy_auxILb1EE9__destroyIP7latLongEEvT_S4_", scope: !2310, file: !2258, line: 112, type: !2441, isLocal: false, isDefinition: false, scopeLine: 112, flags: DIFlagPrototyped, isOptimized: false, templateParams: !2443)
!2454 = !DILocalVariable(arg: 1, scope: !2452, file: !2258, line: 112, type: !242)
!2455 = !DILocation(line: 112, column: 35, scope: !2452)
!2456 = !DILocalVariable(arg: 2, scope: !2452, file: !2258, line: 112, type: !242)
!2457 = !DILocation(line: 112, column: 53, scope: !2452)
!2458 = !DILocation(line: 112, column: 57, scope: !2452)
!2459 = distinct !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m", scope: !208, file: !44, line: 174, type: !349, isLocal: false, isDefinition: true, scopeLine: 175, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !348, variables: !16)
!2460 = !DILocalVariable(name: "this", arg: 1, scope: !2459, type: !2375, flags: DIFlagArtificial | DIFlagObjectPointer)
!2461 = !DILocation(line: 0, scope: !2459)
!2462 = !DILocalVariable(name: "__p", arg: 2, scope: !2459, file: !44, line: 174, type: !215)
!2463 = !DILocation(line: 174, column: 29, scope: !2459)
!2464 = !DILocalVariable(name: "__n", arg: 3, scope: !2459, file: !44, line: 174, type: !100)
!2465 = !DILocation(line: 174, column: 41, scope: !2459)
!2466 = !DILocation(line: 177, column: 6, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2459, file: !44, line: 177, column: 6)
!2468 = !DILocation(line: 177, column: 6, scope: !2459)
!2469 = !DILocation(line: 178, column: 20, scope: !2467)
!2470 = !DILocation(line: 178, column: 29, scope: !2467)
!2471 = !DILocation(line: 178, column: 34, scope: !2467)
!2472 = !DILocation(line: 178, column: 4, scope: !2467)
!2473 = !DILocation(line: 179, column: 7, scope: !2459)
!2474 = distinct !DISubprogram(name: "~_Vector_impl", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implD2Ev", scope: !211, file: !44, line: 79, type: !304, isLocal: false, isDefinition: true, scopeLine: 79, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !2475, variables: !16)
!2475 = !DISubprogram(name: "~_Vector_impl", scope: !211, type: !304, isLocal: false, isDefinition: false, flags: DIFlagArtificial | DIFlagPrototyped, isOptimized: false)
!2476 = !DILocalVariable(name: "this", arg: 1, scope: !2474, type: !2381, flags: DIFlagArtificial | DIFlagObjectPointer)
!2477 = !DILocation(line: 0, scope: !2474)
!2478 = !DILocation(line: 79, column: 14, scope: !2479)
!2479 = distinct !DILexicalBlock(scope: !2474, file: !44, line: 79, column: 14)
!2480 = !DILocation(line: 79, column: 14, scope: !2474)
!2481 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10deallocateERS2_PS1_m", scope: !217, file: !54, line: 184, type: !284, isLocal: false, isDefinition: true, scopeLine: 185, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !283, variables: !16)
!2482 = !DILocalVariable(name: "__a", arg: 1, scope: !2481, file: !54, line: 184, type: !222)
!2483 = !DILocation(line: 184, column: 36, scope: !2481)
!2484 = !DILocalVariable(name: "__p", arg: 2, scope: !2481, file: !54, line: 184, type: !216)
!2485 = !DILocation(line: 184, column: 49, scope: !2481)
!2486 = !DILocalVariable(name: "__n", arg: 3, scope: !2481, file: !54, line: 184, type: !281)
!2487 = !DILocation(line: 184, column: 64, scope: !2481)
!2488 = !DILocation(line: 185, column: 7, scope: !2481)
!2489 = !DILocation(line: 185, column: 22, scope: !2481)
!2490 = !DILocation(line: 185, column: 27, scope: !2481)
!2491 = !DILocation(line: 185, column: 11, scope: !2481)
!2492 = !DILocation(line: 185, column: 33, scope: !2481)
!2493 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE10deallocateEPS1_m", scope: !226, file: !68, line: 109, type: !258, isLocal: false, isDefinition: true, scopeLine: 110, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !257, variables: !16)
!2494 = !DILocalVariable(name: "this", arg: 1, scope: !2493, type: !2398, flags: DIFlagArtificial | DIFlagObjectPointer)
!2495 = !DILocation(line: 0, scope: !2493)
!2496 = !DILocalVariable(name: "__p", arg: 2, scope: !2493, file: !68, line: 109, type: !241)
!2497 = !DILocation(line: 109, column: 26, scope: !2493)
!2498 = !DILocalVariable(arg: 3, scope: !2493, file: !68, line: 109, type: !99)
!2499 = !DILocation(line: 109, column: 40, scope: !2493)
!2500 = !DILocation(line: 110, column: 27, scope: !2493)
!2501 = !DILocation(line: 110, column: 9, scope: !2493)
!2502 = !DILocation(line: 110, column: 33, scope: !2493)
!2503 = distinct !DISubprogram(name: "~allocator", linkageName: "_ZNSaI7latLongED2Ev", scope: !223, file: !64, line: 121, type: !272, isLocal: false, isDefinition: true, scopeLine: 121, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !280, variables: !16)
!2504 = !DILocalVariable(name: "this", arg: 1, scope: !2503, type: !2391, flags: DIFlagArtificial | DIFlagObjectPointer)
!2505 = !DILocation(line: 0, scope: !2503)
!2506 = !DILocation(line: 121, column: 30, scope: !2507)
!2507 = distinct !DILexicalBlock(scope: !2503, file: !64, line: 121, column: 28)
!2508 = !DILocation(line: 121, column: 30, scope: !2503)
!2509 = distinct !DISubprogram(name: "~new_allocator", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongED2Ev", scope: !226, file: !68, line: 86, type: !229, isLocal: false, isDefinition: true, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !237, variables: !16)
!2510 = !DILocalVariable(name: "this", arg: 1, scope: !2509, type: !2398, flags: DIFlagArtificial | DIFlagObjectPointer)
!2511 = !DILocation(line: 0, scope: !2509)
!2512 = !DILocation(line: 86, column: 48, scope: !2509)
!2513 = distinct !DISubprogram(name: "construct<latLong>", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_", scope: !217, file: !54, line: 188, type: !2514, isLocal: false, isDefinition: true, scopeLine: 189, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !269, declaration: !2516, variables: !16)
!2514 = !DISubroutineType(types: !2515)
!2515 = !{null, !222, !216, !253}
!2516 = !DISubprogram(name: "construct<latLong>", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_", scope: !217, file: !54, line: 188, type: !2514, isLocal: false, isDefinition: false, scopeLine: 188, flags: DIFlagPrototyped, isOptimized: false, templateParams: !269)
!2517 = !DILocalVariable(name: "__a", arg: 1, scope: !2513, file: !54, line: 188, type: !222)
!2518 = !DILocation(line: 188, column: 37, scope: !2513)
!2519 = !DILocalVariable(name: "__p", arg: 2, scope: !2513, file: !54, line: 188, type: !216)
!2520 = !DILocation(line: 188, column: 50, scope: !2513)
!2521 = !DILocalVariable(name: "__arg", arg: 3, scope: !2513, file: !54, line: 188, type: !253)
!2522 = !DILocation(line: 188, column: 66, scope: !2513)
!2523 = !DILocation(line: 189, column: 9, scope: !2513)
!2524 = !DILocation(line: 189, column: 23, scope: !2513)
!2525 = !DILocation(line: 189, column: 28, scope: !2513)
!2526 = !DILocation(line: 189, column: 13, scope: !2513)
!2527 = !DILocation(line: 189, column: 36, scope: !2513)
!2528 = distinct !DISubprogram(name: "_M_insert_aux", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !362, file: !2529, line: 327, type: !492, isLocal: false, isDefinition: true, scopeLine: 329, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !491, variables: !16)
!2529 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/vector.tcc", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!2530 = !DILocalVariable(name: "this", arg: 1, scope: !2528, type: !1661, flags: DIFlagArtificial | DIFlagObjectPointer)
!2531 = !DILocation(line: 0, scope: !2528)
!2532 = !DILocalVariable(name: "__position", arg: 2, scope: !2528, file: !44, line: 1409, type: !361)
!2533 = !DILocation(line: 1409, column: 30, scope: !2528)
!2534 = !DILocalVariable(name: "__x", arg: 3, scope: !2528, file: !44, line: 1409, type: !378)
!2535 = !DILocation(line: 1409, column: 60, scope: !2528)
!2536 = !DILocation(line: 330, column: 17, scope: !2537)
!2537 = distinct !DILexicalBlock(scope: !2528, file: !2529, line: 330, column: 11)
!2538 = !DILocation(line: 330, column: 25, scope: !2537)
!2539 = !DILocation(line: 330, column: 44, scope: !2537)
!2540 = !DILocation(line: 330, column: 52, scope: !2537)
!2541 = !DILocation(line: 330, column: 35, scope: !2537)
!2542 = !DILocation(line: 330, column: 11, scope: !2528)
!2543 = !DILocation(line: 332, column: 35, scope: !2544)
!2544 = distinct !DILexicalBlock(scope: !2537, file: !2529, line: 331, column: 2)
!2545 = !DILocation(line: 332, column: 29, scope: !2544)
!2546 = !DILocation(line: 332, column: 50, scope: !2544)
!2547 = !DILocation(line: 332, column: 58, scope: !2544)
!2548 = !DILocation(line: 333, column: 15, scope: !2544)
!2549 = !DILocation(line: 332, column: 4, scope: !2544)
!2550 = !DILocation(line: 335, column: 12, scope: !2544)
!2551 = !DILocation(line: 335, column: 20, scope: !2544)
!2552 = !DILocation(line: 335, column: 4, scope: !2544)
!2553 = !DILocalVariable(name: "__x_copy", scope: !2544, file: !2529, line: 337, type: !19)
!2554 = !DILocation(line: 337, column: 8, scope: !2544)
!2555 = !DILocation(line: 337, column: 19, scope: !2544)
!2556 = !DILocation(line: 339, column: 4, scope: !2544)
!2557 = !DILocation(line: 339, column: 4, scope: !2558)
!2558 = !DILexicalBlockFile(scope: !2544, file: !2529, discriminator: 1)
!2559 = !DILocation(line: 343, column: 4, scope: !2544)
!2560 = !DILocation(line: 343, column: 16, scope: !2544)
!2561 = !DILocation(line: 347, column: 2, scope: !2544)
!2562 = !DILocalVariable(name: "__len", scope: !2563, file: !2529, line: 350, type: !2564)
!2563 = distinct !DILexicalBlock(scope: !2537, file: !2529, line: 349, column: 2)
!2564 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !359)
!2565 = !DILocation(line: 350, column: 20, scope: !2563)
!2566 = !DILocation(line: 351, column: 6, scope: !2563)
!2567 = !DILocalVariable(name: "__elems_before", scope: !2563, file: !2529, line: 352, type: !2564)
!2568 = !DILocation(line: 352, column: 20, scope: !2563)
!2569 = !DILocation(line: 352, column: 50, scope: !2563)
!2570 = !DILocation(line: 352, column: 48, scope: !2571)
!2571 = !DILexicalBlockFile(scope: !2563, file: !2529, discriminator: 1)
!2572 = !DILocalVariable(name: "__new_start", scope: !2563, file: !2529, line: 353, type: !461)
!2573 = !DILocation(line: 353, column: 12, scope: !2563)
!2574 = !DILocation(line: 353, column: 30, scope: !2563)
!2575 = !DILocation(line: 353, column: 42, scope: !2563)
!2576 = !DILocalVariable(name: "__new_finish", scope: !2563, file: !2529, line: 354, type: !461)
!2577 = !DILocation(line: 354, column: 12, scope: !2563)
!2578 = !DILocation(line: 354, column: 25, scope: !2563)
!2579 = !DILocation(line: 361, column: 39, scope: !2580)
!2580 = distinct !DILexicalBlock(scope: !2563, file: !2529, line: 356, column: 6)
!2581 = !DILocation(line: 361, column: 33, scope: !2580)
!2582 = !DILocation(line: 362, column: 26, scope: !2580)
!2583 = !DILocation(line: 362, column: 40, scope: !2580)
!2584 = !DILocation(line: 362, column: 38, scope: !2580)
!2585 = !DILocation(line: 366, column: 33, scope: !2580)
!2586 = !DILocation(line: 361, column: 8, scope: !2580)
!2587 = !DILocation(line: 368, column: 21, scope: !2580)
!2588 = !DILocation(line: 372, column: 10, scope: !2580)
!2589 = !DILocation(line: 372, column: 18, scope: !2580)
!2590 = !DILocation(line: 372, column: 39, scope: !2580)
!2591 = !DILocation(line: 372, column: 39, scope: !2592)
!2592 = !DILexicalBlockFile(scope: !2580, file: !2529, discriminator: 1)
!2593 = !DILocation(line: 373, column: 4, scope: !2580)
!2594 = !DILocation(line: 373, column: 17, scope: !2580)
!2595 = !DILocation(line: 371, column: 5, scope: !2580)
!2596 = !DILocation(line: 371, column: 3, scope: !2592)
!2597 = !DILocation(line: 375, column: 8, scope: !2580)
!2598 = !DILocation(line: 379, column: 15, scope: !2580)
!2599 = !DILocation(line: 379, column: 15, scope: !2592)
!2600 = !DILocation(line: 379, column: 29, scope: !2592)
!2601 = !DILocation(line: 379, column: 37, scope: !2592)
!2602 = !DILocation(line: 380, column: 4, scope: !2580)
!2603 = !DILocation(line: 380, column: 18, scope: !2580)
!2604 = !DILocation(line: 378, column: 5, scope: !2580)
!2605 = !DILocation(line: 378, column: 3, scope: !2592)
!2606 = !DILocation(line: 381, column: 6, scope: !2580)
!2607 = !DILocation(line: 401, column: 5, scope: !2580)
!2608 = !DILocation(line: 381, column: 6, scope: !2592)
!2609 = !DILocation(line: 384, column: 13, scope: !2610)
!2610 = distinct !DILexicalBlock(scope: !2611, file: !2529, line: 384, column: 12)
!2611 = distinct !DILexicalBlock(scope: !2563, file: !2529, line: 383, column: 6)
!2612 = !DILocation(line: 384, column: 12, scope: !2611)
!2613 = !DILocation(line: 385, column: 32, scope: !2610)
!2614 = !DILocation(line: 385, column: 26, scope: !2610)
!2615 = !DILocation(line: 386, column: 26, scope: !2610)
!2616 = !DILocation(line: 386, column: 40, scope: !2610)
!2617 = !DILocation(line: 386, column: 38, scope: !2610)
!2618 = !DILocation(line: 385, column: 3, scope: !2610)
!2619 = !DILocation(line: 385, column: 3, scope: !2620)
!2620 = !DILexicalBlockFile(scope: !2610, file: !2529, discriminator: 1)
!2621 = !DILocation(line: 401, column: 5, scope: !2620)
!2622 = !DILocation(line: 391, column: 6, scope: !2611)
!2623 = !DILocation(line: 388, column: 17, scope: !2610)
!2624 = !DILocation(line: 388, column: 30, scope: !2610)
!2625 = !DILocation(line: 388, column: 44, scope: !2610)
!2626 = !DILocation(line: 388, column: 3, scope: !2620)
!2627 = !DILocation(line: 389, column: 8, scope: !2611)
!2628 = !DILocation(line: 389, column: 22, scope: !2611)
!2629 = !DILocation(line: 389, column: 35, scope: !2611)
!2630 = !DILocation(line: 390, column: 8, scope: !2611)
!2631 = !DILocation(line: 391, column: 6, scope: !2632)
!2632 = !DILexicalBlockFile(scope: !2611, file: !2529, discriminator: 1)
!2633 = !DILocation(line: 392, column: 24, scope: !2563)
!2634 = !DILocation(line: 392, column: 32, scope: !2563)
!2635 = !DILocation(line: 392, column: 48, scope: !2563)
!2636 = !DILocation(line: 392, column: 56, scope: !2563)
!2637 = !DILocation(line: 393, column: 4, scope: !2563)
!2638 = !DILocation(line: 392, column: 4, scope: !2563)
!2639 = !DILocation(line: 394, column: 4, scope: !2563)
!2640 = !DILocation(line: 394, column: 24, scope: !2563)
!2641 = !DILocation(line: 394, column: 32, scope: !2563)
!2642 = !DILocation(line: 395, column: 10, scope: !2563)
!2643 = !DILocation(line: 395, column: 18, scope: !2563)
!2644 = !DILocation(line: 396, column: 12, scope: !2563)
!2645 = !DILocation(line: 396, column: 20, scope: !2563)
!2646 = !DILocation(line: 396, column: 4, scope: !2563)
!2647 = !DILocation(line: 397, column: 29, scope: !2563)
!2648 = !DILocation(line: 397, column: 10, scope: !2563)
!2649 = !DILocation(line: 397, column: 18, scope: !2563)
!2650 = !DILocation(line: 397, column: 27, scope: !2563)
!2651 = !DILocation(line: 398, column: 30, scope: !2563)
!2652 = !DILocation(line: 398, column: 10, scope: !2563)
!2653 = !DILocation(line: 398, column: 18, scope: !2563)
!2654 = !DILocation(line: 398, column: 28, scope: !2563)
!2655 = !DILocation(line: 399, column: 38, scope: !2563)
!2656 = !DILocation(line: 399, column: 52, scope: !2563)
!2657 = !DILocation(line: 399, column: 50, scope: !2563)
!2658 = !DILocation(line: 399, column: 10, scope: !2563)
!2659 = !DILocation(line: 399, column: 18, scope: !2563)
!2660 = !DILocation(line: 399, column: 36, scope: !2563)
!2661 = !DILocation(line: 401, column: 5, scope: !2662)
!2662 = !DILexicalBlockFile(scope: !2528, file: !2529, discriminator: 2)
!2663 = !DILocation(line: 391, column: 6, scope: !2664)
!2664 = !DILexicalBlockFile(scope: !2611, file: !2529, discriminator: 2)
!2665 = !DILocation(line: 391, column: 6, scope: !2666)
!2666 = !DILexicalBlockFile(scope: !2611, file: !2529, discriminator: 3)
!2667 = distinct !DISubprogram(name: "end", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE3endEv", scope: !362, file: !44, line: 565, type: !395, isLocal: false, isDefinition: true, scopeLine: 566, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !404, variables: !16)
!2668 = !DILocalVariable(name: "this", arg: 1, scope: !2667, type: !1661, flags: DIFlagArtificial | DIFlagObjectPointer)
!2669 = !DILocation(line: 0, scope: !2667)
!2670 = !DILocation(line: 566, column: 31, scope: !2667)
!2671 = !DILocation(line: 566, column: 39, scope: !2667)
!2672 = !DILocation(line: 566, column: 16, scope: !2667)
!2673 = !DILocation(line: 566, column: 9, scope: !2667)
!2674 = distinct !DISubprogram(name: "construct", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE9constructEPS1_RKS1_", scope: !226, file: !68, line: 129, type: !264, isLocal: false, isDefinition: true, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !263, variables: !16)
!2675 = !DILocalVariable(name: "this", arg: 1, scope: !2674, type: !2398, flags: DIFlagArtificial | DIFlagObjectPointer)
!2676 = !DILocation(line: 0, scope: !2674)
!2677 = !DILocalVariable(name: "__p", arg: 2, scope: !2674, file: !68, line: 129, type: !241)
!2678 = !DILocation(line: 129, column: 25, scope: !2674)
!2679 = !DILocalVariable(name: "__val", arg: 3, scope: !2674, file: !68, line: 129, type: !253)
!2680 = !DILocation(line: 129, column: 41, scope: !2674)
!2681 = !DILocation(line: 130, column: 23, scope: !2674)
!2682 = !DILocation(line: 130, column: 9, scope: !2674)
!2683 = !DILocation(line: 130, column: 32, scope: !2674)
!2684 = !DILocation(line: 130, column: 28, scope: !2674)
!2685 = !DILocation(line: 130, column: 40, scope: !2674)
!2686 = distinct !DISubprogram(name: "copy_backward<latLong *, latLong *>", linkageName: "_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_", scope: !14, file: !2687, line: 638, type: !2688, isLocal: false, isDefinition: true, scopeLine: 639, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !2690, variables: !16)
!2687 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/stl_algobase.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!2688 = !DISubroutineType(types: !2689)
!2689 = !{!242, !242, !242, !242}
!2690 = !{!2691, !2692}
!2691 = !DITemplateTypeParameter(name: "_BI1", type: !242)
!2692 = !DITemplateTypeParameter(name: "_BI2", type: !242)
!2693 = !DILocalVariable(name: "__first", arg: 1, scope: !2686, file: !2687, line: 638, type: !242)
!2694 = !DILocation(line: 638, column: 24, scope: !2686)
!2695 = !DILocalVariable(name: "__last", arg: 2, scope: !2686, file: !2687, line: 638, type: !242)
!2696 = !DILocation(line: 638, column: 38, scope: !2686)
!2697 = !DILocalVariable(name: "__result", arg: 3, scope: !2686, file: !2687, line: 638, type: !242)
!2698 = !DILocation(line: 638, column: 51, scope: !2686)
!2699 = !DILocation(line: 649, column: 27, scope: !2686)
!2700 = !DILocation(line: 649, column: 9, scope: !2686)
!2701 = !DILocation(line: 649, column: 55, scope: !2686)
!2702 = !DILocation(line: 649, column: 37, scope: !2703)
!2703 = !DILexicalBlockFile(scope: !2686, file: !2687, discriminator: 1)
!2704 = !DILocation(line: 650, column: 9, scope: !2686)
!2705 = !DILocation(line: 648, column: 15, scope: !2686)
!2706 = !DILocation(line: 648, column: 7, scope: !2686)
!2707 = distinct !DISubprogram(name: "base", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv", scope: !505, file: !402, line: 805, type: !559, isLocal: false, isDefinition: true, scopeLine: 806, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !558, variables: !16)
!2708 = !DILocalVariable(name: "this", arg: 1, scope: !2707, type: !2709, flags: DIFlagArtificial | DIFlagObjectPointer)
!2709 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !527, size: 64, align: 64)
!2710 = !DILocation(line: 0, scope: !2707)
!2711 = !DILocation(line: 806, column: 16, scope: !2707)
!2712 = !DILocation(line: 806, column: 9, scope: !2707)
!2713 = distinct !DISubprogram(name: "operator*", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEdeEv", scope: !505, file: !402, line: 753, type: !518, isLocal: false, isDefinition: true, scopeLine: 754, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !517, variables: !16)
!2714 = !DILocalVariable(name: "this", arg: 1, scope: !2713, type: !2709, flags: DIFlagArtificial | DIFlagObjectPointer)
!2715 = !DILocation(line: 0, scope: !2713)
!2716 = !DILocation(line: 754, column: 17, scope: !2713)
!2717 = !DILocation(line: 754, column: 9, scope: !2713)
!2718 = distinct !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE12_M_check_lenEmPKc", scope: !362, file: !44, line: 1422, type: !495, isLocal: false, isDefinition: true, scopeLine: 1423, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !494, variables: !16)
!2719 = !DILocalVariable(name: "this", arg: 1, scope: !2718, type: !2720, flags: DIFlagArtificial | DIFlagObjectPointer)
!2720 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64, align: 64)
!2721 = !DILocation(line: 0, scope: !2718)
!2722 = !DILocalVariable(name: "__n", arg: 2, scope: !2718, file: !44, line: 1422, type: !359)
!2723 = !DILocation(line: 1422, column: 30, scope: !2718)
!2724 = !DILocalVariable(name: "__s", arg: 3, scope: !2718, file: !44, line: 1422, type: !498)
!2725 = !DILocation(line: 1422, column: 47, scope: !2718)
!2726 = !DILocation(line: 1424, column: 6, scope: !2727)
!2727 = distinct !DILexicalBlock(scope: !2718, file: !44, line: 1424, column: 6)
!2728 = !DILocation(line: 1424, column: 19, scope: !2729)
!2729 = !DILexicalBlockFile(scope: !2727, file: !44, discriminator: 1)
!2730 = !DILocation(line: 1424, column: 17, scope: !2727)
!2731 = !DILocation(line: 1424, column: 28, scope: !2727)
!2732 = !DILocation(line: 1424, column: 26, scope: !2727)
!2733 = !DILocation(line: 1424, column: 6, scope: !2718)
!2734 = !DILocation(line: 1425, column: 25, scope: !2727)
!2735 = !DILocation(line: 1425, column: 4, scope: !2727)
!2736 = !DILocalVariable(name: "__len", scope: !2718, file: !44, line: 1427, type: !2564)
!2737 = !DILocation(line: 1427, column: 18, scope: !2718)
!2738 = !DILocation(line: 1427, column: 26, scope: !2718)
!2739 = !DILocation(line: 1427, column: 44, scope: !2740)
!2740 = !DILexicalBlockFile(scope: !2718, file: !44, discriminator: 1)
!2741 = !DILocation(line: 1427, column: 44, scope: !2718)
!2742 = !DILocation(line: 1427, column: 35, scope: !2743)
!2743 = !DILexicalBlockFile(scope: !2718, file: !44, discriminator: 2)
!2744 = !DILocation(line: 1427, column: 35, scope: !2718)
!2745 = !DILocation(line: 1427, column: 33, scope: !2718)
!2746 = !DILocation(line: 1428, column: 10, scope: !2718)
!2747 = !DILocation(line: 1428, column: 18, scope: !2718)
!2748 = !DILocation(line: 1428, column: 16, scope: !2718)
!2749 = !DILocation(line: 1428, column: 25, scope: !2718)
!2750 = !DILocation(line: 1428, column: 28, scope: !2740)
!2751 = !DILocation(line: 1428, column: 36, scope: !2740)
!2752 = !DILocation(line: 1428, column: 34, scope: !2740)
!2753 = !DILocation(line: 1428, column: 9, scope: !2740)
!2754 = !DILocation(line: 1428, column: 50, scope: !2743)
!2755 = !DILocation(line: 1428, column: 9, scope: !2743)
!2756 = !DILocation(line: 1428, column: 63, scope: !2757)
!2757 = !DILexicalBlockFile(scope: !2718, file: !44, discriminator: 3)
!2758 = !DILocation(line: 1428, column: 9, scope: !2757)
!2759 = !DILocation(line: 1428, column: 9, scope: !2760)
!2760 = !DILexicalBlockFile(scope: !2718, file: !44, discriminator: 4)
!2761 = !DILocation(line: 1428, column: 2, scope: !2760)
!2762 = distinct !DISubprogram(name: "operator-<latLong *, std::vector<latLong, std::allocator<latLong> > >", linkageName: "_ZN9__gnu_cxxmiIP7latLongSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_", scope: !56, file: !402, line: 923, type: !2763, isLocal: false, isDefinition: true, scopeLine: 926, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !561, variables: !16)
!2763 = !DISubroutineType(types: !2764)
!2764 = !{!546, !2765, !2765}
!2765 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !527, size: 64, align: 64)
!2766 = !DILocalVariable(name: "__lhs", arg: 1, scope: !2762, file: !402, line: 923, type: !2765)
!2767 = !DILocation(line: 923, column: 63, scope: !2762)
!2768 = !DILocalVariable(name: "__rhs", arg: 2, scope: !2762, file: !402, line: 924, type: !2765)
!2769 = !DILocation(line: 924, column: 56, scope: !2762)
!2770 = !DILocation(line: 926, column: 14, scope: !2762)
!2771 = !DILocation(line: 926, column: 20, scope: !2762)
!2772 = !DILocation(line: 926, column: 29, scope: !2762)
!2773 = !DILocation(line: 926, column: 35, scope: !2774)
!2774 = !DILexicalBlockFile(scope: !2762, file: !402, discriminator: 1)
!2775 = !DILocation(line: 926, column: 35, scope: !2762)
!2776 = !DILocation(line: 926, column: 27, scope: !2762)
!2777 = !DILocation(line: 926, column: 7, scope: !2762)
!2778 = distinct !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5beginEv", scope: !362, file: !44, line: 547, type: !395, isLocal: false, isDefinition: true, scopeLine: 548, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !394, variables: !16)
!2779 = !DILocalVariable(name: "this", arg: 1, scope: !2778, type: !1661, flags: DIFlagArtificial | DIFlagObjectPointer)
!2780 = !DILocation(line: 0, scope: !2778)
!2781 = !DILocation(line: 548, column: 31, scope: !2778)
!2782 = !DILocation(line: 548, column: 39, scope: !2778)
!2783 = !DILocation(line: 548, column: 16, scope: !2778)
!2784 = !DILocation(line: 548, column: 9, scope: !2778)
!2785 = distinct !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE11_M_allocateEm", scope: !208, file: !44, line: 167, type: !346, isLocal: false, isDefinition: true, scopeLine: 168, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !345, variables: !16)
!2786 = !DILocalVariable(name: "this", arg: 1, scope: !2785, type: !2375, flags: DIFlagArtificial | DIFlagObjectPointer)
!2787 = !DILocation(line: 0, scope: !2785)
!2788 = !DILocalVariable(name: "__n", arg: 2, scope: !2785, file: !44, line: 167, type: !100)
!2789 = !DILocation(line: 167, column: 26, scope: !2785)
!2790 = !DILocation(line: 170, column: 9, scope: !2785)
!2791 = !DILocation(line: 170, column: 13, scope: !2785)
!2792 = !DILocation(line: 170, column: 34, scope: !2793)
!2793 = !DILexicalBlockFile(scope: !2785, file: !44, discriminator: 1)
!2794 = !DILocation(line: 170, column: 43, scope: !2793)
!2795 = !DILocation(line: 170, column: 20, scope: !2793)
!2796 = !DILocation(line: 170, column: 9, scope: !2793)
!2797 = !DILocation(line: 170, column: 9, scope: !2798)
!2798 = !DILexicalBlockFile(scope: !2785, file: !44, discriminator: 2)
!2799 = !DILocation(line: 170, column: 9, scope: !2800)
!2800 = !DILexicalBlockFile(scope: !2785, file: !44, discriminator: 3)
!2801 = !DILocation(line: 170, column: 2, scope: !2800)
!2802 = distinct !DISubprogram(name: "__uninitialized_move_if_noexcept_a<latLong *, latLong *, std::allocator<latLong> >", linkageName: "_ZSt34__uninitialized_move_if_noexcept_aIP7latLongS1_SaIS0_EET0_T_S4_S3_RT1_", scope: !14, file: !2803, line: 297, type: !2804, isLocal: false, isDefinition: true, scopeLine: 301, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !2806, variables: !16)
!2803 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/stl_uninitialized.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/nn")
!2804 = !DISubroutineType(types: !2805)
!2805 = !{!242, !242, !242, !242, !222}
!2806 = !{!2807, !2405, !2808}
!2807 = !DITemplateTypeParameter(name: "_InputIterator", type: !242)
!2808 = !DITemplateTypeParameter(name: "_Allocator", type: !223)
!2809 = !DILocalVariable(name: "__first", arg: 1, scope: !2802, file: !2803, line: 297, type: !242)
!2810 = !DILocation(line: 297, column: 55, scope: !2802)
!2811 = !DILocalVariable(name: "__last", arg: 2, scope: !2802, file: !2803, line: 298, type: !242)
!2812 = !DILocation(line: 298, column: 27, scope: !2802)
!2813 = !DILocalVariable(name: "__result", arg: 3, scope: !2802, file: !2803, line: 299, type: !242)
!2814 = !DILocation(line: 299, column: 29, scope: !2802)
!2815 = !DILocalVariable(name: "__alloc", arg: 4, scope: !2802, file: !2803, line: 300, type: !222)
!2816 = !DILocation(line: 300, column: 24, scope: !2802)
!2817 = !DILocation(line: 303, column: 3, scope: !2802)
!2818 = !DILocation(line: 304, column: 3, scope: !2802)
!2819 = !DILocation(line: 304, column: 52, scope: !2802)
!2820 = !DILocation(line: 304, column: 62, scope: !2802)
!2821 = !DILocation(line: 302, column: 14, scope: !2802)
!2822 = !DILocation(line: 302, column: 7, scope: !2802)
!2823 = distinct !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE7destroyERS2_PS1_", scope: !217, file: !54, line: 191, type: !287, isLocal: false, isDefinition: true, scopeLine: 192, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !286, variables: !16)
!2824 = !DILocalVariable(name: "__a", arg: 1, scope: !2823, file: !54, line: 191, type: !222)
!2825 = !DILocation(line: 191, column: 33, scope: !2823)
!2826 = !DILocalVariable(name: "__p", arg: 2, scope: !2823, file: !54, line: 191, type: !216)
!2827 = !DILocation(line: 191, column: 46, scope: !2823)
!2828 = !DILocation(line: 192, column: 7, scope: !2823)
!2829 = !DILocation(line: 192, column: 19, scope: !2823)
!2830 = !DILocation(line: 192, column: 11, scope: !2823)
!2831 = !DILocation(line: 192, column: 25, scope: !2823)
!2832 = distinct !DISubprogram(name: "__copy_move_backward_a2<false, latLong *, latLong *>", linkageName: "_ZSt23__copy_move_backward_a2ILb0EP7latLongS1_ET1_T0_S3_S2_", scope: !14, file: !2687, line: 611, type: !2688, isLocal: false, isDefinition: true, scopeLine: 612, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !2833, variables: !16)
!2833 = !{!2834, !2691, !2692}
!2834 = !DITemplateValueParameter(name: "_IsMove", type: !429, value: i8 0)
!2835 = !DILocalVariable(name: "__first", arg: 1, scope: !2832, file: !2687, line: 611, type: !242)
!2836 = !DILocation(line: 611, column: 34, scope: !2832)
!2837 = !DILocalVariable(name: "__last", arg: 2, scope: !2832, file: !2687, line: 611, type: !242)
!2838 = !DILocation(line: 611, column: 48, scope: !2832)
!2839 = !DILocalVariable(name: "__result", arg: 3, scope: !2832, file: !2687, line: 611, type: !242)
!2840 = !DILocation(line: 611, column: 61, scope: !2832)
!2841 = !DILocation(line: 614, column: 24, scope: !2832)
!2842 = !DILocation(line: 614, column: 6, scope: !2832)
!2843 = !DILocation(line: 614, column: 52, scope: !2832)
!2844 = !DILocation(line: 614, column: 34, scope: !2845)
!2845 = !DILexicalBlockFile(scope: !2832, file: !2687, discriminator: 1)
!2846 = !DILocation(line: 615, column: 24, scope: !2832)
!2847 = !DILocation(line: 615, column: 6, scope: !2832)
!2848 = !DILocation(line: 613, column: 19, scope: !2832)
!2849 = !DILocation(line: 613, column: 7, scope: !2832)
!2850 = distinct !DISubprogram(name: "__miter_base<latLong *>", linkageName: "_ZSt12__miter_baseIP7latLongENSt11_Miter_baseIT_E13iterator_typeES3_", scope: !14, file: !2687, line: 293, type: !2851, isLocal: false, isDefinition: true, scopeLine: 294, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !524, variables: !16)
!2851 = !DISubroutineType(types: !2852)
!2852 = !{!2853, !242}
!2853 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator_type", scope: !2854, file: !522, line: 214, baseType: !242)
!2854 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Iter_base<latLong *, false>", scope: !14, file: !522, line: 212, size: 8, align: 8, elements: !2855, templateParams: !2857, identifier: "_ZTSSt10_Iter_baseIP7latLongLb0EE")
!2855 = !{!2856}
!2856 = !DISubprogram(name: "_S_base", linkageName: "_ZNSt10_Iter_baseIP7latLongLb0EE7_S_baseES1_", scope: !2854, file: !522, line: 215, type: !2851, isLocal: false, isDefinition: false, scopeLine: 215, flags: DIFlagPrototyped, isOptimized: false)
!2857 = !{!525, !2858}
!2858 = !DITemplateValueParameter(name: "_HasBase", type: !429, value: i8 0)
!2859 = !DILocalVariable(name: "__it", arg: 1, scope: !2850, file: !2687, line: 293, type: !242)
!2860 = !DILocation(line: 293, column: 28, scope: !2850)
!2861 = !DILocation(line: 294, column: 51, scope: !2850)
!2862 = !DILocation(line: 294, column: 14, scope: !2850)
!2863 = !DILocation(line: 294, column: 7, scope: !2850)
!2864 = distinct !DISubprogram(name: "__copy_move_backward_a<false, latLong *, latLong *>", linkageName: "_ZSt22__copy_move_backward_aILb0EP7latLongS1_ET1_T0_S3_S2_", scope: !14, file: !2687, line: 593, type: !2688, isLocal: false, isDefinition: true, scopeLine: 594, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !2833, variables: !16)
!2865 = !DILocalVariable(name: "__first", arg: 1, scope: !2864, file: !2687, line: 593, type: !242)
!2866 = !DILocation(line: 593, column: 33, scope: !2864)
!2867 = !DILocalVariable(name: "__last", arg: 2, scope: !2864, file: !2687, line: 593, type: !242)
!2868 = !DILocation(line: 593, column: 47, scope: !2864)
!2869 = !DILocalVariable(name: "__result", arg: 3, scope: !2864, file: !2687, line: 593, type: !242)
!2870 = !DILocation(line: 593, column: 60, scope: !2864)
!2871 = !DILocalVariable(name: "__simple", scope: !2864, file: !2687, line: 598, type: !2872)
!2872 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !429)
!2873 = !DILocation(line: 598, column: 18, scope: !2864)
!2874 = !DILocation(line: 604, column: 59, scope: !2864)
!2875 = !DILocation(line: 605, column: 10, scope: !2864)
!2876 = !DILocation(line: 606, column: 10, scope: !2864)
!2877 = !DILocation(line: 603, column: 14, scope: !2864)
!2878 = !DILocation(line: 603, column: 7, scope: !2864)
!2879 = distinct !DISubprogram(name: "__niter_base<latLong *>", linkageName: "_ZSt12__niter_baseIP7latLongENSt11_Niter_baseIT_E13iterator_typeES3_", scope: !14, file: !2687, line: 282, type: !2851, isLocal: false, isDefinition: true, scopeLine: 283, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !524, variables: !16)
!2880 = !DILocalVariable(name: "__it", arg: 1, scope: !2879, file: !2687, line: 282, type: !242)
!2881 = !DILocation(line: 282, column: 28, scope: !2879)
!2882 = !DILocation(line: 283, column: 51, scope: !2879)
!2883 = !DILocation(line: 283, column: 14, scope: !2879)
!2884 = !DILocation(line: 283, column: 7, scope: !2879)
!2885 = distinct !DISubprogram(name: "__copy_move_b<latLong>", linkageName: "_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI7latLongEEPT_PKS4_S7_S5_", scope: !2886, file: !2687, line: 575, type: !2900, isLocal: false, isDefinition: true, scopeLine: 576, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !269, declaration: !2902, variables: !16)
!2886 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__copy_move_backward<false, true, std::random_access_iterator_tag>", scope: !14, file: !2687, line: 571, size: 8, align: 8, elements: !16, templateParams: !2887, identifier: "_ZTSSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE")
!2887 = !{!2888, !2312, !2889}
!2888 = !DITemplateValueParameter(type: !429, value: i8 0)
!2889 = !DITemplateTypeParameter(type: !2890)
!2890 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "random_access_iterator_tag", scope: !14, file: !522, line: 103, size: 8, align: 8, elements: !2891, identifier: "_ZTSSt26random_access_iterator_tag")
!2891 = !{!2892}
!2892 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2890, baseType: !2893)
!2893 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bidirectional_iterator_tag", scope: !14, file: !522, line: 99, size: 8, align: 8, elements: !2894, identifier: "_ZTSSt26bidirectional_iterator_tag")
!2894 = !{!2895}
!2895 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2893, baseType: !2896)
!2896 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "forward_iterator_tag", scope: !14, file: !522, line: 95, size: 8, align: 8, elements: !2897, identifier: "_ZTSSt20forward_iterator_tag")
!2897 = !{!2898}
!2898 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2896, baseType: !2899)
!2899 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "input_iterator_tag", scope: !14, file: !522, line: 89, size: 8, align: 8, elements: !16, identifier: "_ZTSSt18input_iterator_tag")
!2900 = !DISubroutineType(types: !2901)
!2901 = !{!242, !250, !250, !242}
!2902 = !DISubprogram(name: "__copy_move_b<latLong>", linkageName: "_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI7latLongEEPT_PKS4_S7_S5_", scope: !2886, file: !2687, line: 575, type: !2900, isLocal: false, isDefinition: false, scopeLine: 575, flags: DIFlagPrototyped, isOptimized: false, templateParams: !269)
!2903 = !DILocalVariable(name: "__first", arg: 1, scope: !2885, file: !2687, line: 575, type: !250)
!2904 = !DILocation(line: 575, column: 34, scope: !2885)
!2905 = !DILocalVariable(name: "__last", arg: 2, scope: !2885, file: !2687, line: 575, type: !250)
!2906 = !DILocation(line: 575, column: 54, scope: !2885)
!2907 = !DILocalVariable(name: "__result", arg: 3, scope: !2885, file: !2687, line: 575, type: !242)
!2908 = !DILocation(line: 575, column: 67, scope: !2885)
!2909 = !DILocalVariable(name: "_Num", scope: !2885, file: !2687, line: 584, type: !2910)
!2910 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !548)
!2911 = !DILocation(line: 584, column: 20, scope: !2885)
!2912 = !DILocation(line: 584, column: 27, scope: !2885)
!2913 = !DILocation(line: 584, column: 36, scope: !2885)
!2914 = !DILocation(line: 584, column: 34, scope: !2885)
!2915 = !DILocation(line: 585, column: 8, scope: !2916)
!2916 = distinct !DILexicalBlock(scope: !2885, file: !2687, line: 585, column: 8)
!2917 = !DILocation(line: 585, column: 8, scope: !2885)
!2918 = !DILocation(line: 586, column: 24, scope: !2916)
!2919 = !DILocation(line: 586, column: 35, scope: !2916)
!2920 = !DILocation(line: 586, column: 33, scope: !2916)
!2921 = !DILocation(line: 586, column: 6, scope: !2916)
!2922 = !DILocation(line: 586, column: 41, scope: !2916)
!2923 = !DILocation(line: 586, column: 64, scope: !2916)
!2924 = !DILocation(line: 586, column: 62, scope: !2916)
!2925 = !DILocation(line: 587, column: 11, scope: !2885)
!2926 = !DILocation(line: 587, column: 22, scope: !2885)
!2927 = !DILocation(line: 587, column: 20, scope: !2885)
!2928 = !DILocation(line: 587, column: 4, scope: !2885)
!2929 = distinct !DISubprogram(name: "_S_base", linkageName: "_ZNSt10_Iter_baseIP7latLongLb0EE7_S_baseES1_", scope: !2854, file: !522, line: 215, type: !2851, isLocal: false, isDefinition: true, scopeLine: 216, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !2856, variables: !16)
!2930 = !DILocalVariable(name: "__it", arg: 1, scope: !2929, file: !522, line: 215, type: !242)
!2931 = !DILocation(line: 215, column: 46, scope: !2929)
!2932 = !DILocation(line: 216, column: 16, scope: !2929)
!2933 = !DILocation(line: 216, column: 9, scope: !2929)
!2934 = distinct !DISubprogram(name: "max_size", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv", scope: !362, file: !44, line: 659, type: !419, isLocal: false, isDefinition: true, scopeLine: 660, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !421, variables: !16)
!2935 = !DILocalVariable(name: "this", arg: 1, scope: !2934, type: !2720, flags: DIFlagArtificial | DIFlagObjectPointer)
!2936 = !DILocation(line: 0, scope: !2934)
!2937 = !DILocation(line: 660, column: 40, scope: !2934)
!2938 = !DILocation(line: 660, column: 16, scope: !2939)
!2939 = !DILexicalBlockFile(scope: !2934, file: !44, discriminator: 1)
!2940 = !DILocation(line: 660, column: 9, scope: !2934)
!2941 = distinct !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv", scope: !362, file: !44, line: 654, type: !419, isLocal: false, isDefinition: true, scopeLine: 655, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !418, variables: !16)
!2942 = !DILocalVariable(name: "this", arg: 1, scope: !2941, type: !2720, flags: DIFlagArtificial | DIFlagObjectPointer)
!2943 = !DILocation(line: 0, scope: !2941)
!2944 = !DILocation(line: 655, column: 32, scope: !2941)
!2945 = !DILocation(line: 655, column: 40, scope: !2941)
!2946 = !DILocation(line: 655, column: 58, scope: !2941)
!2947 = !DILocation(line: 655, column: 66, scope: !2941)
!2948 = !DILocation(line: 655, column: 50, scope: !2941)
!2949 = !DILocation(line: 655, column: 9, scope: !2941)
!2950 = distinct !DISubprogram(name: "max<unsigned long>", linkageName: "_ZSt3maxImERKT_S2_S2_", scope: !14, file: !2687, line: 219, type: !2951, isLocal: false, isDefinition: true, scopeLine: 220, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !2955, variables: !16)
!2951 = !DISubroutineType(types: !2952)
!2952 = !{!2953, !2953, !2953}
!2953 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2954, size: 64, align: 64)
!2954 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !101)
!2955 = !{!2956}
!2956 = !DITemplateTypeParameter(name: "_Tp", type: !101)
!2957 = !DILocalVariable(name: "__a", arg: 1, scope: !2950, file: !2687, line: 219, type: !2953)
!2958 = !DILocation(line: 219, column: 20, scope: !2950)
!2959 = !DILocalVariable(name: "__b", arg: 2, scope: !2950, file: !2687, line: 219, type: !2953)
!2960 = !DILocation(line: 219, column: 36, scope: !2950)
!2961 = !DILocation(line: 224, column: 11, scope: !2962)
!2962 = distinct !DILexicalBlock(scope: !2950, file: !2687, line: 224, column: 11)
!2963 = !DILocation(line: 224, column: 17, scope: !2962)
!2964 = !DILocation(line: 224, column: 15, scope: !2962)
!2965 = !DILocation(line: 224, column: 11, scope: !2950)
!2966 = !DILocation(line: 225, column: 9, scope: !2962)
!2967 = !DILocation(line: 225, column: 2, scope: !2962)
!2968 = !DILocation(line: 226, column: 14, scope: !2950)
!2969 = !DILocation(line: 226, column: 7, scope: !2950)
!2970 = !DILocation(line: 227, column: 5, scope: !2950)
!2971 = distinct !DISubprogram(name: "max_size", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8max_sizeERKS2_", scope: !217, file: !54, line: 194, type: !290, isLocal: false, isDefinition: true, scopeLine: 195, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !289, variables: !16)
!2972 = !DILocalVariable(name: "__a", arg: 1, scope: !2971, file: !54, line: 194, type: !278)
!2973 = !DILocation(line: 194, column: 45, scope: !2971)
!2974 = !DILocation(line: 195, column: 14, scope: !2971)
!2975 = !DILocation(line: 195, column: 18, scope: !2971)
!2976 = !DILocation(line: 195, column: 7, scope: !2971)
!2977 = distinct !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNKSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv", scope: !208, file: !44, line: 117, type: !322, isLocal: false, isDefinition: true, scopeLine: 118, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !321, variables: !16)
!2978 = !DILocalVariable(name: "this", arg: 1, scope: !2977, type: !2979, flags: DIFlagArtificial | DIFlagObjectPointer)
!2979 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !325, size: 64, align: 64)
!2980 = !DILocation(line: 0, scope: !2977)
!2981 = !DILocation(line: 118, column: 59, scope: !2977)
!2982 = !DILocation(line: 118, column: 16, scope: !2977)
!2983 = !DILocation(line: 118, column: 9, scope: !2977)
!2984 = distinct !DISubprogram(name: "max_size", linkageName: "_ZNK9__gnu_cxx13new_allocatorI7latLongE8max_sizeEv", scope: !226, file: !68, line: 113, type: !261, isLocal: false, isDefinition: true, scopeLine: 114, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !260, variables: !16)
!2985 = !DILocalVariable(name: "this", arg: 1, scope: !2984, type: !2986, flags: DIFlagArtificial | DIFlagObjectPointer)
!2986 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64, align: 64)
!2987 = !DILocation(line: 0, scope: !2984)
!2988 = !DILocation(line: 114, column: 9, scope: !2984)
!2989 = distinct !DISubprogram(name: "__normal_iterator", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEC2ERKS2_", scope: !505, file: !402, line: 740, type: !513, isLocal: false, isDefinition: true, scopeLine: 741, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !512, variables: !16)
!2990 = !DILocalVariable(name: "this", arg: 1, scope: !2989, type: !2991, flags: DIFlagArtificial | DIFlagObjectPointer)
!2991 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !505, size: 64, align: 64)
!2992 = !DILocation(line: 0, scope: !2989)
!2993 = !DILocalVariable(name: "__i", arg: 2, scope: !2989, file: !402, line: 740, type: !515)
!2994 = !DILocation(line: 740, column: 42, scope: !2989)
!2995 = !DILocation(line: 741, column: 9, scope: !2989)
!2996 = !DILocation(line: 741, column: 20, scope: !2989)
!2997 = !DILocation(line: 741, column: 27, scope: !2989)
!2998 = distinct !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m", scope: !217, file: !54, line: 181, type: !220, isLocal: false, isDefinition: true, scopeLine: 182, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !219, variables: !16)
!2999 = !DILocalVariable(name: "__a", arg: 1, scope: !2998, file: !54, line: 181, type: !222)
!3000 = !DILocation(line: 181, column: 22, scope: !2998)
!3001 = !DILocalVariable(name: "__n", arg: 2, scope: !2998, file: !54, line: 181, type: !281)
!3002 = !DILocation(line: 181, column: 37, scope: !2998)
!3003 = !DILocation(line: 182, column: 14, scope: !2998)
!3004 = !DILocation(line: 182, column: 27, scope: !2998)
!3005 = !DILocation(line: 182, column: 18, scope: !2998)
!3006 = !DILocation(line: 182, column: 7, scope: !2998)
!3007 = distinct !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv", scope: !226, file: !68, line: 99, type: !255, isLocal: false, isDefinition: true, scopeLine: 100, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !254, variables: !16)
!3008 = !DILocalVariable(name: "this", arg: 1, scope: !3007, type: !2398, flags: DIFlagArtificial | DIFlagObjectPointer)
!3009 = !DILocation(line: 0, scope: !3007)
!3010 = !DILocalVariable(name: "__n", arg: 2, scope: !3007, file: !68, line: 99, type: !99)
!3011 = !DILocation(line: 99, column: 26, scope: !3007)
!3012 = !DILocalVariable(arg: 3, scope: !3007, file: !68, line: 99, type: !102)
!3013 = !DILocation(line: 99, column: 43, scope: !3007)
!3014 = !DILocation(line: 101, column: 6, scope: !3015)
!3015 = distinct !DILexicalBlock(scope: !3007, file: !68, line: 101, column: 6)
!3016 = !DILocation(line: 101, column: 18, scope: !3015)
!3017 = !DILocation(line: 101, column: 10, scope: !3015)
!3018 = !DILocation(line: 101, column: 6, scope: !3007)
!3019 = !DILocation(line: 102, column: 4, scope: !3015)
!3020 = !DILocation(line: 104, column: 42, scope: !3007)
!3021 = !DILocation(line: 104, column: 46, scope: !3007)
!3022 = !DILocation(line: 104, column: 27, scope: !3007)
!3023 = !DILocation(line: 104, column: 9, scope: !3007)
!3024 = !DILocation(line: 104, column: 2, scope: !3007)
!3025 = distinct !DISubprogram(name: "__uninitialized_copy_a<latLong *, latLong *, latLong>", linkageName: "_ZSt22__uninitialized_copy_aIP7latLongS1_S0_ET0_T_S3_S2_RSaIT1_E", scope: !14, file: !2803, line: 279, type: !2804, isLocal: false, isDefinition: true, scopeLine: 281, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3026, variables: !16)
!3026 = !{!2807, !2405, !270}
!3027 = !DILocalVariable(name: "__first", arg: 1, scope: !3025, file: !2803, line: 279, type: !242)
!3028 = !DILocation(line: 279, column: 43, scope: !3025)
!3029 = !DILocalVariable(name: "__last", arg: 2, scope: !3025, file: !2803, line: 279, type: !242)
!3030 = !DILocation(line: 279, column: 67, scope: !3025)
!3031 = !DILocalVariable(name: "__result", arg: 3, scope: !3025, file: !2803, line: 280, type: !242)
!3032 = !DILocation(line: 280, column: 24, scope: !3025)
!3033 = !DILocalVariable(arg: 4, scope: !3025, file: !2803, line: 280, type: !222)
!3034 = !DILocation(line: 280, column: 49, scope: !3025)
!3035 = !DILocation(line: 281, column: 38, scope: !3025)
!3036 = !DILocation(line: 281, column: 47, scope: !3025)
!3037 = !DILocation(line: 281, column: 55, scope: !3025)
!3038 = !DILocation(line: 281, column: 14, scope: !3025)
!3039 = !DILocation(line: 281, column: 7, scope: !3025)
!3040 = distinct !DISubprogram(name: "uninitialized_copy<latLong *, latLong *>", linkageName: "_ZSt18uninitialized_copyIP7latLongS1_ET0_T_S3_S2_", scope: !14, file: !2803, line: 107, type: !2688, isLocal: false, isDefinition: true, scopeLine: 109, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3041, variables: !16)
!3041 = !{!2807, !2405}
!3042 = !DILocalVariable(name: "__first", arg: 1, scope: !3040, file: !2803, line: 107, type: !242)
!3043 = !DILocation(line: 107, column: 39, scope: !3040)
!3044 = !DILocalVariable(name: "__last", arg: 2, scope: !3040, file: !2803, line: 107, type: !242)
!3045 = !DILocation(line: 107, column: 63, scope: !3040)
!3046 = !DILocalVariable(name: "__result", arg: 3, scope: !3040, file: !2803, line: 108, type: !242)
!3047 = !DILocation(line: 108, column: 27, scope: !3040)
!3048 = !DILocalVariable(name: "__assignable", scope: !3040, file: !2803, line: 115, type: !2872)
!3049 = !DILocation(line: 115, column: 18, scope: !3040)
!3050 = !DILocation(line: 126, column: 16, scope: !3040)
!3051 = !DILocation(line: 126, column: 25, scope: !3040)
!3052 = !DILocation(line: 126, column: 33, scope: !3040)
!3053 = !DILocation(line: 123, column: 14, scope: !3040)
!3054 = !DILocation(line: 123, column: 7, scope: !3040)
!3055 = distinct !DISubprogram(name: "__uninit_copy<latLong *, latLong *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP7latLongS3_EET0_T_S5_S4_", scope: !3056, file: !2803, line: 91, type: !2688, isLocal: false, isDefinition: true, scopeLine: 93, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3041, declaration: !3059, variables: !16)
!3056 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__uninitialized_copy<true>", scope: !14, file: !2803, line: 87, size: 8, align: 8, elements: !16, templateParams: !3057, identifier: "_ZTSSt20__uninitialized_copyILb1EE")
!3057 = !{!3058}
!3058 = !DITemplateValueParameter(name: "_TrivialValueTypes", type: !429, value: i8 1)
!3059 = !DISubprogram(name: "__uninit_copy<latLong *, latLong *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP7latLongS3_EET0_T_S5_S4_", scope: !3056, file: !2803, line: 91, type: !2688, isLocal: false, isDefinition: false, scopeLine: 91, flags: DIFlagPrototyped, isOptimized: false, templateParams: !3041)
!3060 = !DILocalVariable(name: "__first", arg: 1, scope: !3055, file: !2803, line: 91, type: !242)
!3061 = !DILocation(line: 91, column: 38, scope: !3055)
!3062 = !DILocalVariable(name: "__last", arg: 2, scope: !3055, file: !2803, line: 91, type: !242)
!3063 = !DILocation(line: 91, column: 62, scope: !3055)
!3064 = !DILocalVariable(name: "__result", arg: 3, scope: !3055, file: !2803, line: 92, type: !242)
!3065 = !DILocation(line: 92, column: 26, scope: !3055)
!3066 = !DILocation(line: 93, column: 28, scope: !3055)
!3067 = !DILocation(line: 93, column: 37, scope: !3055)
!3068 = !DILocation(line: 93, column: 45, scope: !3055)
!3069 = !DILocation(line: 93, column: 18, scope: !3055)
!3070 = !DILocation(line: 93, column: 11, scope: !3055)
!3071 = distinct !DISubprogram(name: "copy<latLong *, latLong *>", linkageName: "_ZSt4copyIP7latLongS1_ET0_T_S3_S2_", scope: !14, file: !2687, line: 462, type: !2688, isLocal: false, isDefinition: true, scopeLine: 463, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3072, variables: !16)
!3072 = !{!3073, !3074}
!3073 = !DITemplateTypeParameter(name: "_II", type: !242)
!3074 = !DITemplateTypeParameter(name: "_OI", type: !242)
!3075 = !DILocalVariable(name: "__first", arg: 1, scope: !3071, file: !2687, line: 462, type: !242)
!3076 = !DILocation(line: 462, column: 14, scope: !3071)
!3077 = !DILocalVariable(name: "__last", arg: 2, scope: !3071, file: !2687, line: 462, type: !242)
!3078 = !DILocation(line: 462, column: 27, scope: !3071)
!3079 = !DILocalVariable(name: "__result", arg: 3, scope: !3071, file: !2687, line: 462, type: !242)
!3080 = !DILocation(line: 462, column: 39, scope: !3071)
!3081 = !DILocation(line: 471, column: 27, scope: !3071)
!3082 = !DILocation(line: 471, column: 9, scope: !3071)
!3083 = !DILocation(line: 471, column: 55, scope: !3071)
!3084 = !DILocation(line: 471, column: 37, scope: !3085)
!3085 = !DILexicalBlockFile(scope: !3071, file: !2687, discriminator: 1)
!3086 = !DILocation(line: 472, column: 9, scope: !3071)
!3087 = !DILocation(line: 470, column: 15, scope: !3071)
!3088 = !DILocation(line: 470, column: 7, scope: !3071)
!3089 = distinct !DISubprogram(name: "__copy_move_a2<false, latLong *, latLong *>", linkageName: "_ZSt14__copy_move_a2ILb0EP7latLongS1_ET1_T0_S3_S2_", scope: !14, file: !2687, line: 436, type: !2688, isLocal: false, isDefinition: true, scopeLine: 437, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3090, variables: !16)
!3090 = !{!2834, !3073, !3074}
!3091 = !DILocalVariable(name: "__first", arg: 1, scope: !3089, file: !2687, line: 436, type: !242)
!3092 = !DILocation(line: 436, column: 24, scope: !3089)
!3093 = !DILocalVariable(name: "__last", arg: 2, scope: !3089, file: !2687, line: 436, type: !242)
!3094 = !DILocation(line: 436, column: 37, scope: !3089)
!3095 = !DILocalVariable(name: "__result", arg: 3, scope: !3089, file: !2687, line: 436, type: !242)
!3096 = !DILocation(line: 436, column: 49, scope: !3089)
!3097 = !DILocation(line: 438, column: 64, scope: !3089)
!3098 = !DILocation(line: 438, column: 46, scope: !3089)
!3099 = !DILocation(line: 439, column: 29, scope: !3089)
!3100 = !DILocation(line: 439, column: 11, scope: !3089)
!3101 = !DILocation(line: 440, column: 29, scope: !3089)
!3102 = !DILocation(line: 440, column: 11, scope: !3089)
!3103 = !DILocation(line: 438, column: 18, scope: !3104)
!3104 = !DILexicalBlockFile(scope: !3089, file: !2687, discriminator: 1)
!3105 = !DILocation(line: 438, column: 7, scope: !3089)
!3106 = distinct !DISubprogram(name: "__copy_move_a<false, latLong *, latLong *>", linkageName: "_ZSt13__copy_move_aILb0EP7latLongS1_ET1_T0_S3_S2_", scope: !14, file: !2687, line: 391, type: !2688, isLocal: false, isDefinition: true, scopeLine: 392, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3090, variables: !16)
!3107 = !DILocalVariable(name: "__first", arg: 1, scope: !3106, file: !2687, line: 391, type: !242)
!3108 = !DILocation(line: 391, column: 23, scope: !3106)
!3109 = !DILocalVariable(name: "__last", arg: 2, scope: !3106, file: !2687, line: 391, type: !242)
!3110 = !DILocation(line: 391, column: 36, scope: !3106)
!3111 = !DILocalVariable(name: "__result", arg: 3, scope: !3106, file: !2687, line: 391, type: !242)
!3112 = !DILocation(line: 391, column: 48, scope: !3106)
!3113 = !DILocalVariable(name: "__simple", scope: !3106, file: !2687, line: 396, type: !2872)
!3114 = !DILocation(line: 396, column: 18, scope: !3106)
!3115 = !DILocation(line: 402, column: 45, scope: !3106)
!3116 = !DILocation(line: 402, column: 54, scope: !3106)
!3117 = !DILocation(line: 402, column: 62, scope: !3106)
!3118 = !DILocation(line: 401, column: 14, scope: !3106)
!3119 = !DILocation(line: 401, column: 7, scope: !3106)
!3120 = distinct !DISubprogram(name: "__copy_m<latLong>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI7latLongEEPT_PKS4_S7_S5_", scope: !3121, file: !2687, line: 373, type: !2900, isLocal: false, isDefinition: true, scopeLine: 374, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !269, declaration: !3122, variables: !16)
!3121 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__copy_move<false, true, std::random_access_iterator_tag>", scope: !14, file: !2687, line: 369, size: 8, align: 8, elements: !16, templateParams: !2887, identifier: "_ZTSSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE")
!3122 = !DISubprogram(name: "__copy_m<latLong>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI7latLongEEPT_PKS4_S7_S5_", scope: !3121, file: !2687, line: 373, type: !2900, isLocal: false, isDefinition: false, scopeLine: 373, flags: DIFlagPrototyped, isOptimized: false, templateParams: !269)
!3123 = !DILocalVariable(name: "__first", arg: 1, scope: !3120, file: !2687, line: 373, type: !250)
!3124 = !DILocation(line: 373, column: 29, scope: !3120)
!3125 = !DILocalVariable(name: "__last", arg: 2, scope: !3120, file: !2687, line: 373, type: !250)
!3126 = !DILocation(line: 373, column: 49, scope: !3120)
!3127 = !DILocalVariable(name: "__result", arg: 3, scope: !3120, file: !2687, line: 373, type: !242)
!3128 = !DILocation(line: 373, column: 62, scope: !3120)
!3129 = !DILocalVariable(name: "_Num", scope: !3120, file: !2687, line: 382, type: !2910)
!3130 = !DILocation(line: 382, column: 20, scope: !3120)
!3131 = !DILocation(line: 382, column: 27, scope: !3120)
!3132 = !DILocation(line: 382, column: 36, scope: !3120)
!3133 = !DILocation(line: 382, column: 34, scope: !3120)
!3134 = !DILocation(line: 383, column: 8, scope: !3135)
!3135 = distinct !DILexicalBlock(scope: !3120, file: !2687, line: 383, column: 8)
!3136 = !DILocation(line: 383, column: 8, scope: !3120)
!3137 = !DILocation(line: 384, column: 24, scope: !3135)
!3138 = !DILocation(line: 384, column: 6, scope: !3135)
!3139 = !DILocation(line: 384, column: 34, scope: !3135)
!3140 = !DILocation(line: 384, column: 57, scope: !3135)
!3141 = !DILocation(line: 384, column: 55, scope: !3135)
!3142 = !DILocation(line: 385, column: 11, scope: !3120)
!3143 = !DILocation(line: 385, column: 22, scope: !3120)
!3144 = !DILocation(line: 385, column: 20, scope: !3120)
!3145 = !DILocation(line: 385, column: 4, scope: !3120)
!3146 = distinct !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE7destroyEPS1_", scope: !226, file: !68, line: 133, type: !267, isLocal: false, isDefinition: true, scopeLine: 133, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !266, variables: !16)
!3147 = !DILocalVariable(name: "this", arg: 1, scope: !3146, type: !2398, flags: DIFlagArtificial | DIFlagObjectPointer)
!3148 = !DILocation(line: 0, scope: !3146)
!3149 = !DILocalVariable(name: "__p", arg: 2, scope: !3146, file: !68, line: 133, type: !241)
!3150 = !DILocation(line: 133, column: 23, scope: !3146)
!3151 = !DILocation(line: 133, column: 30, scope: !3146)
!3152 = !DILocation(line: 133, column: 43, scope: !3146)
!3153 = distinct !DISubprogram(name: "construct<record>", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_", scope: !55, file: !54, line: 188, type: !3154, isLocal: false, isDefinition: true, scopeLine: 189, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !116, declaration: !3156, variables: !16)
!3154 = !DISubroutineType(types: !3155)
!3155 = !{null, !62, !53, !95}
!3156 = !DISubprogram(name: "construct<record>", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_", scope: !55, file: !54, line: 188, type: !3154, isLocal: false, isDefinition: false, scopeLine: 188, flags: DIFlagPrototyped, isOptimized: false, templateParams: !116)
!3157 = !DILocalVariable(name: "__a", arg: 1, scope: !3153, file: !54, line: 188, type: !62)
!3158 = !DILocation(line: 188, column: 37, scope: !3153)
!3159 = !DILocalVariable(name: "__p", arg: 2, scope: !3153, file: !54, line: 188, type: !53)
!3160 = !DILocation(line: 188, column: 50, scope: !3153)
!3161 = !DILocalVariable(name: "__arg", arg: 3, scope: !3153, file: !54, line: 188, type: !95)
!3162 = !DILocation(line: 188, column: 66, scope: !3153)
!3163 = !DILocation(line: 189, column: 9, scope: !3153)
!3164 = !DILocation(line: 189, column: 23, scope: !3153)
!3165 = !DILocation(line: 189, column: 28, scope: !3153)
!3166 = !DILocation(line: 189, column: 13, scope: !3153)
!3167 = !DILocation(line: 189, column: 36, scope: !3153)
!3168 = distinct !DISubprogram(name: "_M_insert_aux", linkageName: "_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !565, file: !2529, line: 327, type: !693, isLocal: false, isDefinition: true, scopeLine: 329, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !692, variables: !16)
!3169 = !DILocalVariable(name: "this", arg: 1, scope: !3168, type: !1654, flags: DIFlagArtificial | DIFlagObjectPointer)
!3170 = !DILocation(line: 0, scope: !3168)
!3171 = !DILocalVariable(name: "__position", arg: 2, scope: !3168, file: !44, line: 1409, type: !564)
!3172 = !DILocation(line: 1409, column: 30, scope: !3168)
!3173 = !DILocalVariable(name: "__x", arg: 3, scope: !3168, file: !44, line: 1409, type: !581)
!3174 = !DILocation(line: 1409, column: 60, scope: !3168)
!3175 = !DILocation(line: 330, column: 17, scope: !3176)
!3176 = distinct !DILexicalBlock(scope: !3168, file: !2529, line: 330, column: 11)
!3177 = !DILocation(line: 330, column: 25, scope: !3176)
!3178 = !DILocation(line: 330, column: 44, scope: !3176)
!3179 = !DILocation(line: 330, column: 52, scope: !3176)
!3180 = !DILocation(line: 330, column: 35, scope: !3176)
!3181 = !DILocation(line: 330, column: 11, scope: !3168)
!3182 = !DILocation(line: 332, column: 35, scope: !3183)
!3183 = distinct !DILexicalBlock(scope: !3176, file: !2529, line: 331, column: 2)
!3184 = !DILocation(line: 332, column: 29, scope: !3183)
!3185 = !DILocation(line: 332, column: 50, scope: !3183)
!3186 = !DILocation(line: 332, column: 58, scope: !3183)
!3187 = !DILocation(line: 333, column: 15, scope: !3183)
!3188 = !DILocation(line: 332, column: 4, scope: !3183)
!3189 = !DILocation(line: 335, column: 12, scope: !3183)
!3190 = !DILocation(line: 335, column: 20, scope: !3183)
!3191 = !DILocation(line: 335, column: 4, scope: !3183)
!3192 = !DILocalVariable(name: "__x_copy", scope: !3183, file: !2529, line: 337, type: !30)
!3193 = !DILocation(line: 337, column: 8, scope: !3183)
!3194 = !DILocation(line: 337, column: 19, scope: !3183)
!3195 = !DILocation(line: 339, column: 4, scope: !3183)
!3196 = !DILocation(line: 339, column: 4, scope: !3197)
!3197 = !DILexicalBlockFile(scope: !3183, file: !2529, discriminator: 1)
!3198 = !DILocation(line: 343, column: 4, scope: !3183)
!3199 = !DILocation(line: 343, column: 16, scope: !3183)
!3200 = !DILocation(line: 347, column: 2, scope: !3183)
!3201 = !DILocalVariable(name: "__len", scope: !3202, file: !2529, line: 350, type: !2564)
!3202 = distinct !DILexicalBlock(scope: !3176, file: !2529, line: 349, column: 2)
!3203 = !DILocation(line: 350, column: 20, scope: !3202)
!3204 = !DILocation(line: 351, column: 6, scope: !3202)
!3205 = !DILocalVariable(name: "__elems_before", scope: !3202, file: !2529, line: 352, type: !2564)
!3206 = !DILocation(line: 352, column: 20, scope: !3202)
!3207 = !DILocation(line: 352, column: 50, scope: !3202)
!3208 = !DILocation(line: 352, column: 48, scope: !3209)
!3209 = !DILexicalBlockFile(scope: !3202, file: !2529, discriminator: 1)
!3210 = !DILocalVariable(name: "__new_start", scope: !3202, file: !2529, line: 353, type: !662)
!3211 = !DILocation(line: 353, column: 12, scope: !3202)
!3212 = !DILocation(line: 353, column: 30, scope: !3202)
!3213 = !DILocation(line: 353, column: 42, scope: !3202)
!3214 = !DILocalVariable(name: "__new_finish", scope: !3202, file: !2529, line: 354, type: !662)
!3215 = !DILocation(line: 354, column: 12, scope: !3202)
!3216 = !DILocation(line: 354, column: 25, scope: !3202)
!3217 = !DILocation(line: 361, column: 39, scope: !3218)
!3218 = distinct !DILexicalBlock(scope: !3202, file: !2529, line: 356, column: 6)
!3219 = !DILocation(line: 361, column: 33, scope: !3218)
!3220 = !DILocation(line: 362, column: 26, scope: !3218)
!3221 = !DILocation(line: 362, column: 40, scope: !3218)
!3222 = !DILocation(line: 362, column: 38, scope: !3218)
!3223 = !DILocation(line: 366, column: 33, scope: !3218)
!3224 = !DILocation(line: 361, column: 8, scope: !3218)
!3225 = !DILocation(line: 368, column: 21, scope: !3218)
!3226 = !DILocation(line: 372, column: 10, scope: !3218)
!3227 = !DILocation(line: 372, column: 18, scope: !3218)
!3228 = !DILocation(line: 372, column: 39, scope: !3218)
!3229 = !DILocation(line: 372, column: 39, scope: !3230)
!3230 = !DILexicalBlockFile(scope: !3218, file: !2529, discriminator: 1)
!3231 = !DILocation(line: 373, column: 4, scope: !3218)
!3232 = !DILocation(line: 373, column: 17, scope: !3218)
!3233 = !DILocation(line: 371, column: 5, scope: !3218)
!3234 = !DILocation(line: 371, column: 3, scope: !3230)
!3235 = !DILocation(line: 375, column: 8, scope: !3218)
!3236 = !DILocation(line: 379, column: 15, scope: !3218)
!3237 = !DILocation(line: 379, column: 15, scope: !3230)
!3238 = !DILocation(line: 379, column: 29, scope: !3230)
!3239 = !DILocation(line: 379, column: 37, scope: !3230)
!3240 = !DILocation(line: 380, column: 4, scope: !3218)
!3241 = !DILocation(line: 380, column: 18, scope: !3218)
!3242 = !DILocation(line: 378, column: 5, scope: !3218)
!3243 = !DILocation(line: 378, column: 3, scope: !3230)
!3244 = !DILocation(line: 381, column: 6, scope: !3218)
!3245 = !DILocation(line: 401, column: 5, scope: !3218)
!3246 = !DILocation(line: 381, column: 6, scope: !3230)
!3247 = !DILocation(line: 384, column: 13, scope: !3248)
!3248 = distinct !DILexicalBlock(scope: !3249, file: !2529, line: 384, column: 12)
!3249 = distinct !DILexicalBlock(scope: !3202, file: !2529, line: 383, column: 6)
!3250 = !DILocation(line: 384, column: 12, scope: !3249)
!3251 = !DILocation(line: 385, column: 32, scope: !3248)
!3252 = !DILocation(line: 385, column: 26, scope: !3248)
!3253 = !DILocation(line: 386, column: 26, scope: !3248)
!3254 = !DILocation(line: 386, column: 40, scope: !3248)
!3255 = !DILocation(line: 386, column: 38, scope: !3248)
!3256 = !DILocation(line: 385, column: 3, scope: !3248)
!3257 = !DILocation(line: 385, column: 3, scope: !3258)
!3258 = !DILexicalBlockFile(scope: !3248, file: !2529, discriminator: 1)
!3259 = !DILocation(line: 401, column: 5, scope: !3258)
!3260 = !DILocation(line: 391, column: 6, scope: !3249)
!3261 = !DILocation(line: 388, column: 17, scope: !3248)
!3262 = !DILocation(line: 388, column: 30, scope: !3248)
!3263 = !DILocation(line: 388, column: 44, scope: !3248)
!3264 = !DILocation(line: 388, column: 3, scope: !3258)
!3265 = !DILocation(line: 389, column: 8, scope: !3249)
!3266 = !DILocation(line: 389, column: 22, scope: !3249)
!3267 = !DILocation(line: 389, column: 35, scope: !3249)
!3268 = !DILocation(line: 390, column: 8, scope: !3249)
!3269 = !DILocation(line: 391, column: 6, scope: !3270)
!3270 = !DILexicalBlockFile(scope: !3249, file: !2529, discriminator: 1)
!3271 = !DILocation(line: 392, column: 24, scope: !3202)
!3272 = !DILocation(line: 392, column: 32, scope: !3202)
!3273 = !DILocation(line: 392, column: 48, scope: !3202)
!3274 = !DILocation(line: 392, column: 56, scope: !3202)
!3275 = !DILocation(line: 393, column: 4, scope: !3202)
!3276 = !DILocation(line: 392, column: 4, scope: !3202)
!3277 = !DILocation(line: 394, column: 4, scope: !3202)
!3278 = !DILocation(line: 394, column: 24, scope: !3202)
!3279 = !DILocation(line: 394, column: 32, scope: !3202)
!3280 = !DILocation(line: 395, column: 10, scope: !3202)
!3281 = !DILocation(line: 395, column: 18, scope: !3202)
!3282 = !DILocation(line: 396, column: 12, scope: !3202)
!3283 = !DILocation(line: 396, column: 20, scope: !3202)
!3284 = !DILocation(line: 396, column: 4, scope: !3202)
!3285 = !DILocation(line: 397, column: 29, scope: !3202)
!3286 = !DILocation(line: 397, column: 10, scope: !3202)
!3287 = !DILocation(line: 397, column: 18, scope: !3202)
!3288 = !DILocation(line: 397, column: 27, scope: !3202)
!3289 = !DILocation(line: 398, column: 30, scope: !3202)
!3290 = !DILocation(line: 398, column: 10, scope: !3202)
!3291 = !DILocation(line: 398, column: 18, scope: !3202)
!3292 = !DILocation(line: 398, column: 28, scope: !3202)
!3293 = !DILocation(line: 399, column: 38, scope: !3202)
!3294 = !DILocation(line: 399, column: 52, scope: !3202)
!3295 = !DILocation(line: 399, column: 50, scope: !3202)
!3296 = !DILocation(line: 399, column: 10, scope: !3202)
!3297 = !DILocation(line: 399, column: 18, scope: !3202)
!3298 = !DILocation(line: 399, column: 36, scope: !3202)
!3299 = !DILocation(line: 401, column: 5, scope: !3300)
!3300 = !DILexicalBlockFile(scope: !3168, file: !2529, discriminator: 2)
!3301 = !DILocation(line: 391, column: 6, scope: !3302)
!3302 = !DILexicalBlockFile(scope: !3249, file: !2529, discriminator: 2)
!3303 = !DILocation(line: 391, column: 6, scope: !3304)
!3304 = !DILexicalBlockFile(scope: !3249, file: !2529, discriminator: 3)
!3305 = distinct !DISubprogram(name: "end", linkageName: "_ZNSt6vectorI6recordSaIS0_EE3endEv", scope: !565, file: !44, line: 565, type: !598, isLocal: false, isDefinition: true, scopeLine: 566, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !606, variables: !16)
!3306 = !DILocalVariable(name: "this", arg: 1, scope: !3305, type: !1654, flags: DIFlagArtificial | DIFlagObjectPointer)
!3307 = !DILocation(line: 0, scope: !3305)
!3308 = !DILocation(line: 566, column: 31, scope: !3305)
!3309 = !DILocation(line: 566, column: 39, scope: !3305)
!3310 = !DILocation(line: 566, column: 16, scope: !3305)
!3311 = !DILocation(line: 566, column: 9, scope: !3305)
!3312 = distinct !DISubprogram(name: "construct", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE9constructEPS1_RKS1_", scope: !67, file: !68, line: 129, type: !111, isLocal: false, isDefinition: true, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !110, variables: !16)
!3313 = !DILocalVariable(name: "this", arg: 1, scope: !3312, type: !2254, flags: DIFlagArtificial | DIFlagObjectPointer)
!3314 = !DILocation(line: 0, scope: !3312)
!3315 = !DILocalVariable(name: "__p", arg: 2, scope: !3312, file: !68, line: 129, type: !83)
!3316 = !DILocation(line: 129, column: 25, scope: !3312)
!3317 = !DILocalVariable(name: "__val", arg: 3, scope: !3312, file: !68, line: 129, type: !95)
!3318 = !DILocation(line: 129, column: 41, scope: !3312)
!3319 = !DILocation(line: 130, column: 23, scope: !3312)
!3320 = !DILocation(line: 130, column: 9, scope: !3312)
!3321 = !DILocation(line: 130, column: 32, scope: !3312)
!3322 = !DILocation(line: 130, column: 28, scope: !3312)
!3323 = !DILocation(line: 130, column: 40, scope: !3312)
!3324 = distinct !DISubprogram(name: "copy_backward<record *, record *>", linkageName: "_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_", scope: !14, file: !2687, line: 638, type: !3325, isLocal: false, isDefinition: true, scopeLine: 639, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3327, variables: !16)
!3325 = !DISubroutineType(types: !3326)
!3326 = !{!84, !84, !84, !84}
!3327 = !{!3328, !3329}
!3328 = !DITemplateTypeParameter(name: "_BI1", type: !84)
!3329 = !DITemplateTypeParameter(name: "_BI2", type: !84)
!3330 = !DILocalVariable(name: "__first", arg: 1, scope: !3324, file: !2687, line: 638, type: !84)
!3331 = !DILocation(line: 638, column: 24, scope: !3324)
!3332 = !DILocalVariable(name: "__last", arg: 2, scope: !3324, file: !2687, line: 638, type: !84)
!3333 = !DILocation(line: 638, column: 38, scope: !3324)
!3334 = !DILocalVariable(name: "__result", arg: 3, scope: !3324, file: !2687, line: 638, type: !84)
!3335 = !DILocation(line: 638, column: 51, scope: !3324)
!3336 = !DILocation(line: 649, column: 27, scope: !3324)
!3337 = !DILocation(line: 649, column: 9, scope: !3324)
!3338 = !DILocation(line: 649, column: 55, scope: !3324)
!3339 = !DILocation(line: 649, column: 37, scope: !3340)
!3340 = !DILexicalBlockFile(scope: !3324, file: !2687, discriminator: 1)
!3341 = !DILocation(line: 650, column: 9, scope: !3324)
!3342 = !DILocation(line: 648, column: 15, scope: !3324)
!3343 = !DILocation(line: 648, column: 7, scope: !3324)
!3344 = distinct !DISubprogram(name: "base", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv", scope: !704, file: !402, line: 805, type: !754, isLocal: false, isDefinition: true, scopeLine: 806, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !753, variables: !16)
!3345 = !DILocalVariable(name: "this", arg: 1, scope: !3344, type: !3346, flags: DIFlagArtificial | DIFlagObjectPointer)
!3346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !725, size: 64, align: 64)
!3347 = !DILocation(line: 0, scope: !3344)
!3348 = !DILocation(line: 806, column: 16, scope: !3344)
!3349 = !DILocation(line: 806, column: 9, scope: !3344)
!3350 = distinct !DISubprogram(name: "operator*", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEdeEv", scope: !704, file: !402, line: 753, type: !717, isLocal: false, isDefinition: true, scopeLine: 754, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !716, variables: !16)
!3351 = !DILocalVariable(name: "this", arg: 1, scope: !3350, type: !3346, flags: DIFlagArtificial | DIFlagObjectPointer)
!3352 = !DILocation(line: 0, scope: !3350)
!3353 = !DILocation(line: 754, column: 17, scope: !3350)
!3354 = !DILocation(line: 754, column: 9, scope: !3350)
!3355 = distinct !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE12_M_check_lenEmPKc", scope: !565, file: !44, line: 1422, type: !696, isLocal: false, isDefinition: true, scopeLine: 1423, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !695, variables: !16)
!3356 = !DILocalVariable(name: "this", arg: 1, scope: !3355, type: !3357, flags: DIFlagArtificial | DIFlagObjectPointer)
!3357 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !588, size: 64, align: 64)
!3358 = !DILocation(line: 0, scope: !3355)
!3359 = !DILocalVariable(name: "__n", arg: 2, scope: !3355, file: !44, line: 1422, type: !359)
!3360 = !DILocation(line: 1422, column: 30, scope: !3355)
!3361 = !DILocalVariable(name: "__s", arg: 3, scope: !3355, file: !44, line: 1422, type: !498)
!3362 = !DILocation(line: 1422, column: 47, scope: !3355)
!3363 = !DILocation(line: 1424, column: 6, scope: !3364)
!3364 = distinct !DILexicalBlock(scope: !3355, file: !44, line: 1424, column: 6)
!3365 = !DILocation(line: 1424, column: 19, scope: !3366)
!3366 = !DILexicalBlockFile(scope: !3364, file: !44, discriminator: 1)
!3367 = !DILocation(line: 1424, column: 17, scope: !3364)
!3368 = !DILocation(line: 1424, column: 28, scope: !3364)
!3369 = !DILocation(line: 1424, column: 26, scope: !3364)
!3370 = !DILocation(line: 1424, column: 6, scope: !3355)
!3371 = !DILocation(line: 1425, column: 25, scope: !3364)
!3372 = !DILocation(line: 1425, column: 4, scope: !3364)
!3373 = !DILocalVariable(name: "__len", scope: !3355, file: !44, line: 1427, type: !2564)
!3374 = !DILocation(line: 1427, column: 18, scope: !3355)
!3375 = !DILocation(line: 1427, column: 26, scope: !3355)
!3376 = !DILocation(line: 1427, column: 44, scope: !3377)
!3377 = !DILexicalBlockFile(scope: !3355, file: !44, discriminator: 1)
!3378 = !DILocation(line: 1427, column: 44, scope: !3355)
!3379 = !DILocation(line: 1427, column: 35, scope: !3380)
!3380 = !DILexicalBlockFile(scope: !3355, file: !44, discriminator: 2)
!3381 = !DILocation(line: 1427, column: 35, scope: !3355)
!3382 = !DILocation(line: 1427, column: 33, scope: !3355)
!3383 = !DILocation(line: 1428, column: 10, scope: !3355)
!3384 = !DILocation(line: 1428, column: 18, scope: !3355)
!3385 = !DILocation(line: 1428, column: 16, scope: !3355)
!3386 = !DILocation(line: 1428, column: 25, scope: !3355)
!3387 = !DILocation(line: 1428, column: 28, scope: !3377)
!3388 = !DILocation(line: 1428, column: 36, scope: !3377)
!3389 = !DILocation(line: 1428, column: 34, scope: !3377)
!3390 = !DILocation(line: 1428, column: 9, scope: !3377)
!3391 = !DILocation(line: 1428, column: 50, scope: !3380)
!3392 = !DILocation(line: 1428, column: 9, scope: !3380)
!3393 = !DILocation(line: 1428, column: 63, scope: !3394)
!3394 = !DILexicalBlockFile(scope: !3355, file: !44, discriminator: 3)
!3395 = !DILocation(line: 1428, column: 9, scope: !3394)
!3396 = !DILocation(line: 1428, column: 9, scope: !3397)
!3397 = !DILexicalBlockFile(scope: !3355, file: !44, discriminator: 4)
!3398 = !DILocation(line: 1428, column: 2, scope: !3397)
!3399 = distinct !DISubprogram(name: "operator-<record *, std::vector<record, std::allocator<record> > >", linkageName: "_ZN9__gnu_cxxmiIP6recordSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_", scope: !56, file: !402, line: 923, type: !3400, isLocal: false, isDefinition: true, scopeLine: 926, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !756, variables: !16)
!3400 = !DISubroutineType(types: !3401)
!3401 = !{!743, !3402, !3402}
!3402 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !725, size: 64, align: 64)
!3403 = !DILocalVariable(name: "__lhs", arg: 1, scope: !3399, file: !402, line: 923, type: !3402)
!3404 = !DILocation(line: 923, column: 63, scope: !3399)
!3405 = !DILocalVariable(name: "__rhs", arg: 2, scope: !3399, file: !402, line: 924, type: !3402)
!3406 = !DILocation(line: 924, column: 56, scope: !3399)
!3407 = !DILocation(line: 926, column: 14, scope: !3399)
!3408 = !DILocation(line: 926, column: 20, scope: !3399)
!3409 = !DILocation(line: 926, column: 29, scope: !3399)
!3410 = !DILocation(line: 926, column: 35, scope: !3411)
!3411 = !DILexicalBlockFile(scope: !3399, file: !402, discriminator: 1)
!3412 = !DILocation(line: 926, column: 35, scope: !3399)
!3413 = !DILocation(line: 926, column: 27, scope: !3399)
!3414 = !DILocation(line: 926, column: 7, scope: !3399)
!3415 = distinct !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5beginEv", scope: !565, file: !44, line: 547, type: !598, isLocal: false, isDefinition: true, scopeLine: 548, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !597, variables: !16)
!3416 = !DILocalVariable(name: "this", arg: 1, scope: !3415, type: !1654, flags: DIFlagArtificial | DIFlagObjectPointer)
!3417 = !DILocation(line: 0, scope: !3415)
!3418 = !DILocation(line: 548, column: 31, scope: !3415)
!3419 = !DILocation(line: 548, column: 39, scope: !3415)
!3420 = !DILocation(line: 548, column: 16, scope: !3415)
!3421 = !DILocation(line: 548, column: 9, scope: !3415)
!3422 = distinct !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE11_M_allocateEm", scope: !45, file: !44, line: 167, type: !193, isLocal: false, isDefinition: true, scopeLine: 168, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !192, variables: !16)
!3423 = !DILocalVariable(name: "this", arg: 1, scope: !3422, type: !2231, flags: DIFlagArtificial | DIFlagObjectPointer)
!3424 = !DILocation(line: 0, scope: !3422)
!3425 = !DILocalVariable(name: "__n", arg: 2, scope: !3422, file: !44, line: 167, type: !100)
!3426 = !DILocation(line: 167, column: 26, scope: !3422)
!3427 = !DILocation(line: 170, column: 9, scope: !3422)
!3428 = !DILocation(line: 170, column: 13, scope: !3422)
!3429 = !DILocation(line: 170, column: 34, scope: !3430)
!3430 = !DILexicalBlockFile(scope: !3422, file: !44, discriminator: 1)
!3431 = !DILocation(line: 170, column: 43, scope: !3430)
!3432 = !DILocation(line: 170, column: 20, scope: !3430)
!3433 = !DILocation(line: 170, column: 9, scope: !3430)
!3434 = !DILocation(line: 170, column: 9, scope: !3435)
!3435 = !DILexicalBlockFile(scope: !3422, file: !44, discriminator: 2)
!3436 = !DILocation(line: 170, column: 9, scope: !3437)
!3437 = !DILexicalBlockFile(scope: !3422, file: !44, discriminator: 3)
!3438 = !DILocation(line: 170, column: 2, scope: !3437)
!3439 = distinct !DISubprogram(name: "__uninitialized_move_if_noexcept_a<record *, record *, std::allocator<record> >", linkageName: "_ZSt34__uninitialized_move_if_noexcept_aIP6recordS1_SaIS0_EET0_T_S4_S3_RT1_", scope: !14, file: !2803, line: 297, type: !3440, isLocal: false, isDefinition: true, scopeLine: 301, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3442, variables: !16)
!3440 = !DISubroutineType(types: !3441)
!3441 = !{!84, !84, !84, !84, !62}
!3442 = !{!3443, !2262, !3444}
!3443 = !DITemplateTypeParameter(name: "_InputIterator", type: !84)
!3444 = !DITemplateTypeParameter(name: "_Allocator", type: !63)
!3445 = !DILocalVariable(name: "__first", arg: 1, scope: !3439, file: !2803, line: 297, type: !84)
!3446 = !DILocation(line: 297, column: 55, scope: !3439)
!3447 = !DILocalVariable(name: "__last", arg: 2, scope: !3439, file: !2803, line: 298, type: !84)
!3448 = !DILocation(line: 298, column: 27, scope: !3439)
!3449 = !DILocalVariable(name: "__result", arg: 3, scope: !3439, file: !2803, line: 299, type: !84)
!3450 = !DILocation(line: 299, column: 29, scope: !3439)
!3451 = !DILocalVariable(name: "__alloc", arg: 4, scope: !3439, file: !2803, line: 300, type: !62)
!3452 = !DILocation(line: 300, column: 24, scope: !3439)
!3453 = !DILocation(line: 303, column: 3, scope: !3439)
!3454 = !DILocation(line: 304, column: 3, scope: !3439)
!3455 = !DILocation(line: 304, column: 52, scope: !3439)
!3456 = !DILocation(line: 304, column: 62, scope: !3439)
!3457 = !DILocation(line: 302, column: 14, scope: !3439)
!3458 = !DILocation(line: 302, column: 7, scope: !3439)
!3459 = distinct !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE7destroyERS2_PS1_", scope: !55, file: !54, line: 191, type: !134, isLocal: false, isDefinition: true, scopeLine: 192, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !133, variables: !16)
!3460 = !DILocalVariable(name: "__a", arg: 1, scope: !3459, file: !54, line: 191, type: !62)
!3461 = !DILocation(line: 191, column: 33, scope: !3459)
!3462 = !DILocalVariable(name: "__p", arg: 2, scope: !3459, file: !54, line: 191, type: !53)
!3463 = !DILocation(line: 191, column: 46, scope: !3459)
!3464 = !DILocation(line: 192, column: 7, scope: !3459)
!3465 = !DILocation(line: 192, column: 19, scope: !3459)
!3466 = !DILocation(line: 192, column: 11, scope: !3459)
!3467 = !DILocation(line: 192, column: 25, scope: !3459)
!3468 = distinct !DISubprogram(name: "__copy_move_backward_a2<false, record *, record *>", linkageName: "_ZSt23__copy_move_backward_a2ILb0EP6recordS1_ET1_T0_S3_S2_", scope: !14, file: !2687, line: 611, type: !3325, isLocal: false, isDefinition: true, scopeLine: 612, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3469, variables: !16)
!3469 = !{!2834, !3328, !3329}
!3470 = !DILocalVariable(name: "__first", arg: 1, scope: !3468, file: !2687, line: 611, type: !84)
!3471 = !DILocation(line: 611, column: 34, scope: !3468)
!3472 = !DILocalVariable(name: "__last", arg: 2, scope: !3468, file: !2687, line: 611, type: !84)
!3473 = !DILocation(line: 611, column: 48, scope: !3468)
!3474 = !DILocalVariable(name: "__result", arg: 3, scope: !3468, file: !2687, line: 611, type: !84)
!3475 = !DILocation(line: 611, column: 61, scope: !3468)
!3476 = !DILocation(line: 614, column: 24, scope: !3468)
!3477 = !DILocation(line: 614, column: 6, scope: !3468)
!3478 = !DILocation(line: 614, column: 52, scope: !3468)
!3479 = !DILocation(line: 614, column: 34, scope: !3480)
!3480 = !DILexicalBlockFile(scope: !3468, file: !2687, discriminator: 1)
!3481 = !DILocation(line: 615, column: 24, scope: !3468)
!3482 = !DILocation(line: 615, column: 6, scope: !3468)
!3483 = !DILocation(line: 613, column: 19, scope: !3468)
!3484 = !DILocation(line: 613, column: 7, scope: !3468)
!3485 = distinct !DISubprogram(name: "__miter_base<record *>", linkageName: "_ZSt12__miter_baseIP6recordENSt11_Miter_baseIT_E13iterator_typeES3_", scope: !14, file: !2687, line: 293, type: !3486, isLocal: false, isDefinition: true, scopeLine: 294, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !722, variables: !16)
!3486 = !DISubroutineType(types: !3487)
!3487 = !{!3488, !84}
!3488 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator_type", scope: !3489, file: !522, line: 214, baseType: !84)
!3489 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Iter_base<record *, false>", scope: !14, file: !522, line: 212, size: 8, align: 8, elements: !3490, templateParams: !3492, identifier: "_ZTSSt10_Iter_baseIP6recordLb0EE")
!3490 = !{!3491}
!3491 = !DISubprogram(name: "_S_base", linkageName: "_ZNSt10_Iter_baseIP6recordLb0EE7_S_baseES1_", scope: !3489, file: !522, line: 215, type: !3486, isLocal: false, isDefinition: false, scopeLine: 215, flags: DIFlagPrototyped, isOptimized: false)
!3492 = !{!723, !2858}
!3493 = !DILocalVariable(name: "__it", arg: 1, scope: !3485, file: !2687, line: 293, type: !84)
!3494 = !DILocation(line: 293, column: 28, scope: !3485)
!3495 = !DILocation(line: 294, column: 51, scope: !3485)
!3496 = !DILocation(line: 294, column: 14, scope: !3485)
!3497 = !DILocation(line: 294, column: 7, scope: !3485)
!3498 = distinct !DISubprogram(name: "__copy_move_backward_a<false, record *, record *>", linkageName: "_ZSt22__copy_move_backward_aILb0EP6recordS1_ET1_T0_S3_S2_", scope: !14, file: !2687, line: 593, type: !3325, isLocal: false, isDefinition: true, scopeLine: 594, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3469, variables: !16)
!3499 = !DILocalVariable(name: "__first", arg: 1, scope: !3498, file: !2687, line: 593, type: !84)
!3500 = !DILocation(line: 593, column: 33, scope: !3498)
!3501 = !DILocalVariable(name: "__last", arg: 2, scope: !3498, file: !2687, line: 593, type: !84)
!3502 = !DILocation(line: 593, column: 47, scope: !3498)
!3503 = !DILocalVariable(name: "__result", arg: 3, scope: !3498, file: !2687, line: 593, type: !84)
!3504 = !DILocation(line: 593, column: 60, scope: !3498)
!3505 = !DILocalVariable(name: "__simple", scope: !3498, file: !2687, line: 598, type: !2872)
!3506 = !DILocation(line: 598, column: 18, scope: !3498)
!3507 = !DILocation(line: 604, column: 59, scope: !3498)
!3508 = !DILocation(line: 605, column: 10, scope: !3498)
!3509 = !DILocation(line: 606, column: 10, scope: !3498)
!3510 = !DILocation(line: 603, column: 14, scope: !3498)
!3511 = !DILocation(line: 603, column: 7, scope: !3498)
!3512 = distinct !DISubprogram(name: "__niter_base<record *>", linkageName: "_ZSt12__niter_baseIP6recordENSt11_Niter_baseIT_E13iterator_typeES3_", scope: !14, file: !2687, line: 282, type: !3486, isLocal: false, isDefinition: true, scopeLine: 283, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !722, variables: !16)
!3513 = !DILocalVariable(name: "__it", arg: 1, scope: !3512, file: !2687, line: 282, type: !84)
!3514 = !DILocation(line: 282, column: 28, scope: !3512)
!3515 = !DILocation(line: 283, column: 51, scope: !3512)
!3516 = !DILocation(line: 283, column: 14, scope: !3512)
!3517 = !DILocation(line: 283, column: 7, scope: !3512)
!3518 = distinct !DISubprogram(name: "__copy_move_b<record>", linkageName: "_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI6recordEEPT_PKS4_S7_S5_", scope: !2886, file: !2687, line: 575, type: !3519, isLocal: false, isDefinition: true, scopeLine: 576, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !116, declaration: !3521, variables: !16)
!3519 = !DISubroutineType(types: !3520)
!3520 = !{!84, !92, !92, !84}
!3521 = !DISubprogram(name: "__copy_move_b<record>", linkageName: "_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI6recordEEPT_PKS4_S7_S5_", scope: !2886, file: !2687, line: 575, type: !3519, isLocal: false, isDefinition: false, scopeLine: 575, flags: DIFlagPrototyped, isOptimized: false, templateParams: !116)
!3522 = !DILocalVariable(name: "__first", arg: 1, scope: !3518, file: !2687, line: 575, type: !92)
!3523 = !DILocation(line: 575, column: 34, scope: !3518)
!3524 = !DILocalVariable(name: "__last", arg: 2, scope: !3518, file: !2687, line: 575, type: !92)
!3525 = !DILocation(line: 575, column: 54, scope: !3518)
!3526 = !DILocalVariable(name: "__result", arg: 3, scope: !3518, file: !2687, line: 575, type: !84)
!3527 = !DILocation(line: 575, column: 67, scope: !3518)
!3528 = !DILocalVariable(name: "_Num", scope: !3518, file: !2687, line: 584, type: !2910)
!3529 = !DILocation(line: 584, column: 20, scope: !3518)
!3530 = !DILocation(line: 584, column: 27, scope: !3518)
!3531 = !DILocation(line: 584, column: 36, scope: !3518)
!3532 = !DILocation(line: 584, column: 34, scope: !3518)
!3533 = !DILocation(line: 585, column: 8, scope: !3534)
!3534 = distinct !DILexicalBlock(scope: !3518, file: !2687, line: 585, column: 8)
!3535 = !DILocation(line: 585, column: 8, scope: !3518)
!3536 = !DILocation(line: 586, column: 24, scope: !3534)
!3537 = !DILocation(line: 586, column: 35, scope: !3534)
!3538 = !DILocation(line: 586, column: 33, scope: !3534)
!3539 = !DILocation(line: 586, column: 6, scope: !3534)
!3540 = !DILocation(line: 586, column: 41, scope: !3534)
!3541 = !DILocation(line: 586, column: 64, scope: !3534)
!3542 = !DILocation(line: 586, column: 62, scope: !3534)
!3543 = !DILocation(line: 587, column: 11, scope: !3518)
!3544 = !DILocation(line: 587, column: 22, scope: !3518)
!3545 = !DILocation(line: 587, column: 20, scope: !3518)
!3546 = !DILocation(line: 587, column: 4, scope: !3518)
!3547 = distinct !DISubprogram(name: "_S_base", linkageName: "_ZNSt10_Iter_baseIP6recordLb0EE7_S_baseES1_", scope: !3489, file: !522, line: 215, type: !3486, isLocal: false, isDefinition: true, scopeLine: 216, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !3491, variables: !16)
!3548 = !DILocalVariable(name: "__it", arg: 1, scope: !3547, file: !522, line: 215, type: !84)
!3549 = !DILocation(line: 215, column: 46, scope: !3547)
!3550 = !DILocation(line: 216, column: 16, scope: !3547)
!3551 = !DILocation(line: 216, column: 9, scope: !3547)
!3552 = distinct !DISubprogram(name: "max_size", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv", scope: !565, file: !44, line: 659, type: !621, isLocal: false, isDefinition: true, scopeLine: 660, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !623, variables: !16)
!3553 = !DILocalVariable(name: "this", arg: 1, scope: !3552, type: !3357, flags: DIFlagArtificial | DIFlagObjectPointer)
!3554 = !DILocation(line: 0, scope: !3552)
!3555 = !DILocation(line: 660, column: 40, scope: !3552)
!3556 = !DILocation(line: 660, column: 16, scope: !3557)
!3557 = !DILexicalBlockFile(scope: !3552, file: !44, discriminator: 1)
!3558 = !DILocation(line: 660, column: 9, scope: !3552)
!3559 = distinct !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4sizeEv", scope: !565, file: !44, line: 654, type: !621, isLocal: false, isDefinition: true, scopeLine: 655, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !620, variables: !16)
!3560 = !DILocalVariable(name: "this", arg: 1, scope: !3559, type: !3357, flags: DIFlagArtificial | DIFlagObjectPointer)
!3561 = !DILocation(line: 0, scope: !3559)
!3562 = !DILocation(line: 655, column: 32, scope: !3559)
!3563 = !DILocation(line: 655, column: 40, scope: !3559)
!3564 = !DILocation(line: 655, column: 58, scope: !3559)
!3565 = !DILocation(line: 655, column: 66, scope: !3559)
!3566 = !DILocation(line: 655, column: 50, scope: !3559)
!3567 = !DILocation(line: 655, column: 9, scope: !3559)
!3568 = distinct !DISubprogram(name: "max_size", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8max_sizeERKS2_", scope: !55, file: !54, line: 194, type: !137, isLocal: false, isDefinition: true, scopeLine: 195, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !136, variables: !16)
!3569 = !DILocalVariable(name: "__a", arg: 1, scope: !3568, file: !54, line: 194, type: !125)
!3570 = !DILocation(line: 194, column: 45, scope: !3568)
!3571 = !DILocation(line: 195, column: 14, scope: !3568)
!3572 = !DILocation(line: 195, column: 18, scope: !3568)
!3573 = !DILocation(line: 195, column: 7, scope: !3568)
!3574 = distinct !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNKSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv", scope: !45, file: !44, line: 117, type: !169, isLocal: false, isDefinition: true, scopeLine: 118, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !168, variables: !16)
!3575 = !DILocalVariable(name: "this", arg: 1, scope: !3574, type: !3576, flags: DIFlagArtificial | DIFlagObjectPointer)
!3576 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64, align: 64)
!3577 = !DILocation(line: 0, scope: !3574)
!3578 = !DILocation(line: 118, column: 59, scope: !3574)
!3579 = !DILocation(line: 118, column: 16, scope: !3574)
!3580 = !DILocation(line: 118, column: 9, scope: !3574)
!3581 = distinct !DISubprogram(name: "max_size", linkageName: "_ZNK9__gnu_cxx13new_allocatorI6recordE8max_sizeEv", scope: !67, file: !68, line: 113, type: !108, isLocal: false, isDefinition: true, scopeLine: 114, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !107, variables: !16)
!3582 = !DILocalVariable(name: "this", arg: 1, scope: !3581, type: !3583, flags: DIFlagArtificial | DIFlagObjectPointer)
!3583 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64, align: 64)
!3584 = !DILocation(line: 0, scope: !3581)
!3585 = !DILocation(line: 114, column: 9, scope: !3581)
!3586 = distinct !DISubprogram(name: "__normal_iterator", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEC2ERKS2_", scope: !704, file: !402, line: 740, type: !712, isLocal: false, isDefinition: true, scopeLine: 741, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !711, variables: !16)
!3587 = !DILocalVariable(name: "this", arg: 1, scope: !3586, type: !3588, flags: DIFlagArtificial | DIFlagObjectPointer)
!3588 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !704, size: 64, align: 64)
!3589 = !DILocation(line: 0, scope: !3586)
!3590 = !DILocalVariable(name: "__i", arg: 2, scope: !3586, file: !402, line: 740, type: !714)
!3591 = !DILocation(line: 740, column: 42, scope: !3586)
!3592 = !DILocation(line: 741, column: 9, scope: !3586)
!3593 = !DILocation(line: 741, column: 20, scope: !3586)
!3594 = !DILocation(line: 741, column: 27, scope: !3586)
!3595 = distinct !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m", scope: !55, file: !54, line: 181, type: !60, isLocal: false, isDefinition: true, scopeLine: 182, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !59, variables: !16)
!3596 = !DILocalVariable(name: "__a", arg: 1, scope: !3595, file: !54, line: 181, type: !62)
!3597 = !DILocation(line: 181, column: 22, scope: !3595)
!3598 = !DILocalVariable(name: "__n", arg: 2, scope: !3595, file: !54, line: 181, type: !128)
!3599 = !DILocation(line: 181, column: 37, scope: !3595)
!3600 = !DILocation(line: 182, column: 14, scope: !3595)
!3601 = !DILocation(line: 182, column: 27, scope: !3595)
!3602 = !DILocation(line: 182, column: 18, scope: !3595)
!3603 = !DILocation(line: 182, column: 7, scope: !3595)
!3604 = distinct !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv", scope: !67, file: !68, line: 99, type: !97, isLocal: false, isDefinition: true, scopeLine: 100, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !96, variables: !16)
!3605 = !DILocalVariable(name: "this", arg: 1, scope: !3604, type: !2254, flags: DIFlagArtificial | DIFlagObjectPointer)
!3606 = !DILocation(line: 0, scope: !3604)
!3607 = !DILocalVariable(name: "__n", arg: 2, scope: !3604, file: !68, line: 99, type: !99)
!3608 = !DILocation(line: 99, column: 26, scope: !3604)
!3609 = !DILocalVariable(arg: 3, scope: !3604, file: !68, line: 99, type: !102)
!3610 = !DILocation(line: 99, column: 43, scope: !3604)
!3611 = !DILocation(line: 101, column: 6, scope: !3612)
!3612 = distinct !DILexicalBlock(scope: !3604, file: !68, line: 101, column: 6)
!3613 = !DILocation(line: 101, column: 18, scope: !3612)
!3614 = !DILocation(line: 101, column: 10, scope: !3612)
!3615 = !DILocation(line: 101, column: 6, scope: !3604)
!3616 = !DILocation(line: 102, column: 4, scope: !3612)
!3617 = !DILocation(line: 104, column: 42, scope: !3604)
!3618 = !DILocation(line: 104, column: 46, scope: !3604)
!3619 = !DILocation(line: 104, column: 27, scope: !3604)
!3620 = !DILocation(line: 104, column: 9, scope: !3604)
!3621 = !DILocation(line: 104, column: 2, scope: !3604)
!3622 = distinct !DISubprogram(name: "__uninitialized_copy_a<record *, record *, record>", linkageName: "_ZSt22__uninitialized_copy_aIP6recordS1_S0_ET0_T_S3_S2_RSaIT1_E", scope: !14, file: !2803, line: 279, type: !3440, isLocal: false, isDefinition: true, scopeLine: 281, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3623, variables: !16)
!3623 = !{!3443, !2262, !117}
!3624 = !DILocalVariable(name: "__first", arg: 1, scope: !3622, file: !2803, line: 279, type: !84)
!3625 = !DILocation(line: 279, column: 43, scope: !3622)
!3626 = !DILocalVariable(name: "__last", arg: 2, scope: !3622, file: !2803, line: 279, type: !84)
!3627 = !DILocation(line: 279, column: 67, scope: !3622)
!3628 = !DILocalVariable(name: "__result", arg: 3, scope: !3622, file: !2803, line: 280, type: !84)
!3629 = !DILocation(line: 280, column: 24, scope: !3622)
!3630 = !DILocalVariable(arg: 4, scope: !3622, file: !2803, line: 280, type: !62)
!3631 = !DILocation(line: 280, column: 49, scope: !3622)
!3632 = !DILocation(line: 281, column: 38, scope: !3622)
!3633 = !DILocation(line: 281, column: 47, scope: !3622)
!3634 = !DILocation(line: 281, column: 55, scope: !3622)
!3635 = !DILocation(line: 281, column: 14, scope: !3622)
!3636 = !DILocation(line: 281, column: 7, scope: !3622)
!3637 = distinct !DISubprogram(name: "uninitialized_copy<record *, record *>", linkageName: "_ZSt18uninitialized_copyIP6recordS1_ET0_T_S3_S2_", scope: !14, file: !2803, line: 107, type: !3325, isLocal: false, isDefinition: true, scopeLine: 109, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3638, variables: !16)
!3638 = !{!3443, !2262}
!3639 = !DILocalVariable(name: "__first", arg: 1, scope: !3637, file: !2803, line: 107, type: !84)
!3640 = !DILocation(line: 107, column: 39, scope: !3637)
!3641 = !DILocalVariable(name: "__last", arg: 2, scope: !3637, file: !2803, line: 107, type: !84)
!3642 = !DILocation(line: 107, column: 63, scope: !3637)
!3643 = !DILocalVariable(name: "__result", arg: 3, scope: !3637, file: !2803, line: 108, type: !84)
!3644 = !DILocation(line: 108, column: 27, scope: !3637)
!3645 = !DILocalVariable(name: "__assignable", scope: !3637, file: !2803, line: 115, type: !2872)
!3646 = !DILocation(line: 115, column: 18, scope: !3637)
!3647 = !DILocation(line: 126, column: 16, scope: !3637)
!3648 = !DILocation(line: 126, column: 25, scope: !3637)
!3649 = !DILocation(line: 126, column: 33, scope: !3637)
!3650 = !DILocation(line: 123, column: 14, scope: !3637)
!3651 = !DILocation(line: 123, column: 7, scope: !3637)
!3652 = distinct !DISubprogram(name: "__uninit_copy<record *, record *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP6recordS3_EET0_T_S5_S4_", scope: !3056, file: !2803, line: 91, type: !3325, isLocal: false, isDefinition: true, scopeLine: 93, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3638, declaration: !3653, variables: !16)
!3653 = !DISubprogram(name: "__uninit_copy<record *, record *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP6recordS3_EET0_T_S5_S4_", scope: !3056, file: !2803, line: 91, type: !3325, isLocal: false, isDefinition: false, scopeLine: 91, flags: DIFlagPrototyped, isOptimized: false, templateParams: !3638)
!3654 = !DILocalVariable(name: "__first", arg: 1, scope: !3652, file: !2803, line: 91, type: !84)
!3655 = !DILocation(line: 91, column: 38, scope: !3652)
!3656 = !DILocalVariable(name: "__last", arg: 2, scope: !3652, file: !2803, line: 91, type: !84)
!3657 = !DILocation(line: 91, column: 62, scope: !3652)
!3658 = !DILocalVariable(name: "__result", arg: 3, scope: !3652, file: !2803, line: 92, type: !84)
!3659 = !DILocation(line: 92, column: 26, scope: !3652)
!3660 = !DILocation(line: 93, column: 28, scope: !3652)
!3661 = !DILocation(line: 93, column: 37, scope: !3652)
!3662 = !DILocation(line: 93, column: 45, scope: !3652)
!3663 = !DILocation(line: 93, column: 18, scope: !3652)
!3664 = !DILocation(line: 93, column: 11, scope: !3652)
!3665 = distinct !DISubprogram(name: "copy<record *, record *>", linkageName: "_ZSt4copyIP6recordS1_ET0_T_S3_S2_", scope: !14, file: !2687, line: 462, type: !3325, isLocal: false, isDefinition: true, scopeLine: 463, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3666, variables: !16)
!3666 = !{!3667, !3668}
!3667 = !DITemplateTypeParameter(name: "_II", type: !84)
!3668 = !DITemplateTypeParameter(name: "_OI", type: !84)
!3669 = !DILocalVariable(name: "__first", arg: 1, scope: !3665, file: !2687, line: 462, type: !84)
!3670 = !DILocation(line: 462, column: 14, scope: !3665)
!3671 = !DILocalVariable(name: "__last", arg: 2, scope: !3665, file: !2687, line: 462, type: !84)
!3672 = !DILocation(line: 462, column: 27, scope: !3665)
!3673 = !DILocalVariable(name: "__result", arg: 3, scope: !3665, file: !2687, line: 462, type: !84)
!3674 = !DILocation(line: 462, column: 39, scope: !3665)
!3675 = !DILocation(line: 471, column: 27, scope: !3665)
!3676 = !DILocation(line: 471, column: 9, scope: !3665)
!3677 = !DILocation(line: 471, column: 55, scope: !3665)
!3678 = !DILocation(line: 471, column: 37, scope: !3679)
!3679 = !DILexicalBlockFile(scope: !3665, file: !2687, discriminator: 1)
!3680 = !DILocation(line: 472, column: 9, scope: !3665)
!3681 = !DILocation(line: 470, column: 15, scope: !3665)
!3682 = !DILocation(line: 470, column: 7, scope: !3665)
!3683 = distinct !DISubprogram(name: "__copy_move_a2<false, record *, record *>", linkageName: "_ZSt14__copy_move_a2ILb0EP6recordS1_ET1_T0_S3_S2_", scope: !14, file: !2687, line: 436, type: !3325, isLocal: false, isDefinition: true, scopeLine: 437, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3684, variables: !16)
!3684 = !{!2834, !3667, !3668}
!3685 = !DILocalVariable(name: "__first", arg: 1, scope: !3683, file: !2687, line: 436, type: !84)
!3686 = !DILocation(line: 436, column: 24, scope: !3683)
!3687 = !DILocalVariable(name: "__last", arg: 2, scope: !3683, file: !2687, line: 436, type: !84)
!3688 = !DILocation(line: 436, column: 37, scope: !3683)
!3689 = !DILocalVariable(name: "__result", arg: 3, scope: !3683, file: !2687, line: 436, type: !84)
!3690 = !DILocation(line: 436, column: 49, scope: !3683)
!3691 = !DILocation(line: 438, column: 64, scope: !3683)
!3692 = !DILocation(line: 438, column: 46, scope: !3683)
!3693 = !DILocation(line: 439, column: 29, scope: !3683)
!3694 = !DILocation(line: 439, column: 11, scope: !3683)
!3695 = !DILocation(line: 440, column: 29, scope: !3683)
!3696 = !DILocation(line: 440, column: 11, scope: !3683)
!3697 = !DILocation(line: 438, column: 18, scope: !3698)
!3698 = !DILexicalBlockFile(scope: !3683, file: !2687, discriminator: 1)
!3699 = !DILocation(line: 438, column: 7, scope: !3683)
!3700 = distinct !DISubprogram(name: "__copy_move_a<false, record *, record *>", linkageName: "_ZSt13__copy_move_aILb0EP6recordS1_ET1_T0_S3_S2_", scope: !14, file: !2687, line: 391, type: !3325, isLocal: false, isDefinition: true, scopeLine: 392, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !3684, variables: !16)
!3701 = !DILocalVariable(name: "__first", arg: 1, scope: !3700, file: !2687, line: 391, type: !84)
!3702 = !DILocation(line: 391, column: 23, scope: !3700)
!3703 = !DILocalVariable(name: "__last", arg: 2, scope: !3700, file: !2687, line: 391, type: !84)
!3704 = !DILocation(line: 391, column: 36, scope: !3700)
!3705 = !DILocalVariable(name: "__result", arg: 3, scope: !3700, file: !2687, line: 391, type: !84)
!3706 = !DILocation(line: 391, column: 48, scope: !3700)
!3707 = !DILocalVariable(name: "__simple", scope: !3700, file: !2687, line: 396, type: !2872)
!3708 = !DILocation(line: 396, column: 18, scope: !3700)
!3709 = !DILocation(line: 402, column: 45, scope: !3700)
!3710 = !DILocation(line: 402, column: 54, scope: !3700)
!3711 = !DILocation(line: 402, column: 62, scope: !3700)
!3712 = !DILocation(line: 401, column: 14, scope: !3700)
!3713 = !DILocation(line: 401, column: 7, scope: !3700)
!3714 = distinct !DISubprogram(name: "__copy_m<record>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI6recordEEPT_PKS4_S7_S5_", scope: !3121, file: !2687, line: 373, type: !3519, isLocal: false, isDefinition: true, scopeLine: 374, flags: DIFlagPrototyped, isOptimized: false, unit: !0, templateParams: !116, declaration: !3715, variables: !16)
!3715 = !DISubprogram(name: "__copy_m<record>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI6recordEEPT_PKS4_S7_S5_", scope: !3121, file: !2687, line: 373, type: !3519, isLocal: false, isDefinition: false, scopeLine: 373, flags: DIFlagPrototyped, isOptimized: false, templateParams: !116)
!3716 = !DILocalVariable(name: "__first", arg: 1, scope: !3714, file: !2687, line: 373, type: !92)
!3717 = !DILocation(line: 373, column: 29, scope: !3714)
!3718 = !DILocalVariable(name: "__last", arg: 2, scope: !3714, file: !2687, line: 373, type: !92)
!3719 = !DILocation(line: 373, column: 49, scope: !3714)
!3720 = !DILocalVariable(name: "__result", arg: 3, scope: !3714, file: !2687, line: 373, type: !84)
!3721 = !DILocation(line: 373, column: 62, scope: !3714)
!3722 = !DILocalVariable(name: "_Num", scope: !3714, file: !2687, line: 382, type: !2910)
!3723 = !DILocation(line: 382, column: 20, scope: !3714)
!3724 = !DILocation(line: 382, column: 27, scope: !3714)
!3725 = !DILocation(line: 382, column: 36, scope: !3714)
!3726 = !DILocation(line: 382, column: 34, scope: !3714)
!3727 = !DILocation(line: 383, column: 8, scope: !3728)
!3728 = distinct !DILexicalBlock(scope: !3714, file: !2687, line: 383, column: 8)
!3729 = !DILocation(line: 383, column: 8, scope: !3714)
!3730 = !DILocation(line: 384, column: 24, scope: !3728)
!3731 = !DILocation(line: 384, column: 6, scope: !3728)
!3732 = !DILocation(line: 384, column: 34, scope: !3728)
!3733 = !DILocation(line: 384, column: 57, scope: !3728)
!3734 = !DILocation(line: 384, column: 55, scope: !3728)
!3735 = !DILocation(line: 385, column: 11, scope: !3714)
!3736 = !DILocation(line: 385, column: 22, scope: !3714)
!3737 = !DILocation(line: 385, column: 20, scope: !3714)
!3738 = !DILocation(line: 385, column: 4, scope: !3714)
!3739 = distinct !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE7destroyEPS1_", scope: !67, file: !68, line: 133, type: !114, isLocal: false, isDefinition: true, scopeLine: 133, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !113, variables: !16)
!3740 = !DILocalVariable(name: "this", arg: 1, scope: !3739, type: !2254, flags: DIFlagArtificial | DIFlagObjectPointer)
!3741 = !DILocation(line: 0, scope: !3739)
!3742 = !DILocalVariable(name: "__p", arg: 2, scope: !3739, file: !68, line: 133, type: !83)
!3743 = !DILocation(line: 133, column: 23, scope: !3739)
!3744 = !DILocation(line: 133, column: 30, scope: !3739)
!3745 = !DILocation(line: 133, column: 43, scope: !3739)
