; ModuleID = 'streamcluster_cuda.cu'
source_filename = "streamcluster_cuda.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%struct.Point = type { float, float*, i64, float }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Points = type { i64, i32, %struct.Point* }
%struct.CUevent_st = type opaque
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external global i8
@work_mem_h = global float* null, align 8, !dbg !19
@coord_h = global float* null, align 8, !dbg !121
@work_mem_d = global float* null, align 8, !dbg !122
@coord_d = global float* null, align 8, !dbg !123
@center_table_d = global i32* null, align 8, !dbg !124
@switch_membership_d = global i8* null, align 8, !dbg !126
@p = global %struct.Point* null, align 8, !dbg !128
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [42 x i8] c"Cuda error in file '%s' in line %i : %s.\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"streamcluster_cuda.cu\00", align 1
@_ZL4iter = internal global i32 0, align 4, !dbg !139
@.str.2 = private unnamed_addr constant [18 x i8] c"kernel error: %s\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_streamcluster_cuda.cu, i8* null }]

; Function Attrs: uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !1221 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !1223
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #2, !dbg !1224
  ret void, !dbg !1223
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #2

; Function Attrs: uwtable
define void @_Z19kernel_compute_costiilP5PointiiPfS1_PiPb(i32 %num, i32 %dim, i64 %x, %struct.Point* %p, i32 %K, i32 %stride, float* %coord_d, float* %work_mem_d, i32* %center_table_d, i8* %switch_membership_d) #0 !dbg !1226 {
entry:
  %num.addr = alloca i32, align 4
  %dim.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %p.addr = alloca %struct.Point*, align 8
  %K.addr = alloca i32, align 4
  %stride.addr = alloca i32, align 4
  %coord_d.addr = alloca float*, align 8
  %work_mem_d.addr = alloca float*, align 8
  %center_table_d.addr = alloca i32*, align 8
  %switch_membership_d.addr = alloca i8*, align 8
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !1229, metadata !1230), !dbg !1231
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !1232, metadata !1230), !dbg !1233
  store i64 %x, i64* %x.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %x.addr, metadata !1234, metadata !1230), !dbg !1235
  store %struct.Point* %p, %struct.Point** %p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Point** %p.addr, metadata !1236, metadata !1230), !dbg !1237
  store i32 %K, i32* %K.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %K.addr, metadata !1238, metadata !1230), !dbg !1239
  store i32 %stride, i32* %stride.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %stride.addr, metadata !1240, metadata !1230), !dbg !1241
  store float* %coord_d, float** %coord_d.addr, align 8
  call void @llvm.dbg.declare(metadata float** %coord_d.addr, metadata !1242, metadata !1230), !dbg !1243
  store float* %work_mem_d, float** %work_mem_d.addr, align 8
  call void @llvm.dbg.declare(metadata float** %work_mem_d.addr, metadata !1244, metadata !1230), !dbg !1245
  store i32* %center_table_d, i32** %center_table_d.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %center_table_d.addr, metadata !1246, metadata !1230), !dbg !1247
  store i8* %switch_membership_d, i8** %switch_membership_d.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %switch_membership_d.addr, metadata !1248, metadata !1230), !dbg !1249
  %0 = bitcast i32* %num.addr to i8*, !dbg !1250
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !1250
  %2 = icmp eq i32 %1, 0, !dbg !1250
  br i1 %2, label %setup.next, label %setup.end, !dbg !1250

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %dim.addr to i8*, !dbg !1251
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !1251
  %5 = icmp eq i32 %4, 0, !dbg !1251
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1251

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i64* %x.addr to i8*, !dbg !1253
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 8), !dbg !1253
  %8 = icmp eq i32 %7, 0, !dbg !1253
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1253

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast %struct.Point** %p.addr to i8*, !dbg !1255
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 16), !dbg !1255
  %11 = icmp eq i32 %10, 0, !dbg !1255
  br i1 %11, label %setup.next3, label %setup.end, !dbg !1255

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %K.addr to i8*, !dbg !1257
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 24), !dbg !1257
  %14 = icmp eq i32 %13, 0, !dbg !1257
  br i1 %14, label %setup.next4, label %setup.end, !dbg !1257

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %stride.addr to i8*, !dbg !1259
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 4, i64 28), !dbg !1259
  %17 = icmp eq i32 %16, 0, !dbg !1259
  br i1 %17, label %setup.next5, label %setup.end, !dbg !1259

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast float** %coord_d.addr to i8*, !dbg !1261
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 32), !dbg !1261
  %20 = icmp eq i32 %19, 0, !dbg !1261
  br i1 %20, label %setup.next6, label %setup.end, !dbg !1261

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast float** %work_mem_d.addr to i8*, !dbg !1263
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 8, i64 40), !dbg !1263
  %23 = icmp eq i32 %22, 0, !dbg !1263
  br i1 %23, label %setup.next7, label %setup.end, !dbg !1263

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast i32** %center_table_d.addr to i8*, !dbg !1265
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 8, i64 48), !dbg !1265
  %26 = icmp eq i32 %25, 0, !dbg !1265
  br i1 %26, label %setup.next8, label %setup.end, !dbg !1265

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast i8** %switch_membership_d.addr to i8*, !dbg !1267
  %28 = call i32 @cudaSetupArgument(i8* %27, i64 8, i64 56), !dbg !1267
  %29 = icmp eq i32 %28, 0, !dbg !1267
  br i1 %29, label %setup.next9, label %setup.end, !dbg !1267

setup.next9:                                      ; preds = %setup.next8
  %30 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, i64, %struct.Point*, i32, i32, float*, float*, i32*, i8*)* @_Z19kernel_compute_costiilP5PointiiPfS1_PiPb to i8*)), !dbg !1269
  br label %setup.end, !dbg !1269

setup.end:                                        ; preds = %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1271
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @_Z11allocDevMemii(i32 %num, i32 %dim) #0 !dbg !1272 {
entry:
  %num.addr = alloca i32, align 4
  %dim.addr = alloca i32, align 4
  %err = alloca i32, align 4
  %err4 = alloca i32, align 4
  %err15 = alloca i32, align 4
  %err26 = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !1275, metadata !1230), !dbg !1276
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !1277, metadata !1230), !dbg !1278
  br label %do.body, !dbg !1279, !llvm.loop !1280

do.body:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %err, metadata !1281, metadata !1230), !dbg !1283
  %0 = load i32, i32* %num.addr, align 4, !dbg !1284
  %conv = sext i32 %0 to i64, !dbg !1284
  %mul = mul i64 %conv, 4, !dbg !1284
  %call = call i32 @cudaMalloc(i8** bitcast (i32** @center_table_d to i8**), i64 %mul), !dbg !1284
  store i32 %call, i32* %err, align 4, !dbg !1284
  %1 = load i32, i32* %err, align 4, !dbg !1284
  %cmp = icmp ne i32 0, %1, !dbg !1284
  br i1 %cmp, label %if.then, label %if.end, !dbg !1284

if.then:                                          ; preds = %do.body
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1286
  %3 = load i32, i32* %err, align 4, !dbg !1286
  %call1 = call i8* @cudaGetErrorString(i32 %3), !dbg !1286
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 96, i8* %call1), !dbg !1290
  call void @exit(i32 1) #8, !dbg !1292
  unreachable, !dbg !1286

if.end:                                           ; preds = %do.body
  br label %do.end, !dbg !1294

do.end:                                           ; preds = %if.end
  br label %do.body3, !dbg !1296, !llvm.loop !1297

do.body3:                                         ; preds = %do.end
  call void @llvm.dbg.declare(metadata i32* %err4, metadata !1298, metadata !1230), !dbg !1300
  %4 = load i32, i32* %num.addr, align 4, !dbg !1301
  %conv5 = sext i32 %4 to i64, !dbg !1301
  %mul6 = mul i64 %conv5, 1, !dbg !1301
  %call7 = call i32 @cudaMalloc(i8** @switch_membership_d, i64 %mul6), !dbg !1301
  store i32 %call7, i32* %err4, align 4, !dbg !1301
  %5 = load i32, i32* %err4, align 4, !dbg !1301
  %cmp8 = icmp ne i32 0, %5, !dbg !1301
  br i1 %cmp8, label %if.then9, label %if.end12, !dbg !1301

if.then9:                                         ; preds = %do.body3
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1303
  %7 = load i32, i32* %err4, align 4, !dbg !1303
  %call10 = call i8* @cudaGetErrorString(i32 %7), !dbg !1303
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 97, i8* %call10), !dbg !1307
  call void @exit(i32 1) #8, !dbg !1309
  unreachable, !dbg !1303

if.end12:                                         ; preds = %do.body3
  br label %do.end13, !dbg !1311

do.end13:                                         ; preds = %if.end12
  br label %do.body14, !dbg !1313, !llvm.loop !1314

do.body14:                                        ; preds = %do.end13
  call void @llvm.dbg.declare(metadata i32* %err15, metadata !1315, metadata !1230), !dbg !1317
  %8 = load i32, i32* %num.addr, align 4, !dbg !1318
  %conv16 = sext i32 %8 to i64, !dbg !1318
  %mul17 = mul i64 %conv16, 32, !dbg !1318
  %call18 = call i32 @cudaMalloc(i8** bitcast (%struct.Point** @p to i8**), i64 %mul17), !dbg !1318
  store i32 %call18, i32* %err15, align 4, !dbg !1318
  %9 = load i32, i32* %err15, align 4, !dbg !1318
  %cmp19 = icmp ne i32 0, %9, !dbg !1318
  br i1 %cmp19, label %if.then20, label %if.end23, !dbg !1318

if.then20:                                        ; preds = %do.body14
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1320
  %11 = load i32, i32* %err15, align 4, !dbg !1320
  %call21 = call i8* @cudaGetErrorString(i32 %11), !dbg !1320
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 98, i8* %call21), !dbg !1324
  call void @exit(i32 1) #8, !dbg !1326
  unreachable, !dbg !1320

if.end23:                                         ; preds = %do.body14
  br label %do.end24, !dbg !1328

do.end24:                                         ; preds = %if.end23
  br label %do.body25, !dbg !1330, !llvm.loop !1331

do.body25:                                        ; preds = %do.end24
  call void @llvm.dbg.declare(metadata i32* %err26, metadata !1332, metadata !1230), !dbg !1334
  %12 = load i32, i32* %num.addr, align 4, !dbg !1335
  %13 = load i32, i32* %dim.addr, align 4, !dbg !1335
  %mul27 = mul nsw i32 %12, %13, !dbg !1335
  %conv28 = sext i32 %mul27 to i64, !dbg !1335
  %mul29 = mul i64 %conv28, 4, !dbg !1335
  %call30 = call i32 @cudaMalloc(i8** bitcast (float** @coord_d to i8**), i64 %mul29), !dbg !1335
  store i32 %call30, i32* %err26, align 4, !dbg !1335
  %14 = load i32, i32* %err26, align 4, !dbg !1335
  %cmp31 = icmp ne i32 0, %14, !dbg !1335
  br i1 %cmp31, label %if.then32, label %if.end35, !dbg !1335

if.then32:                                        ; preds = %do.body25
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1337
  %16 = load i32, i32* %err26, align 4, !dbg !1337
  %call33 = call i8* @cudaGetErrorString(i32 %16), !dbg !1337
  %call34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 99, i8* %call33), !dbg !1341
  call void @exit(i32 1) #8, !dbg !1343
  unreachable, !dbg !1337

if.end35:                                         ; preds = %do.body25
  br label %do.end36, !dbg !1345

do.end36:                                         ; preds = %if.end35
  ret void, !dbg !1347
}

declare i32 @cudaMalloc(i8**, i64) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @cudaGetErrorString(i32) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind uwtable
define void @_Z12allocHostMemii(i32 %num, i32 %dim) #5 !dbg !1348 {
entry:
  %num.addr = alloca i32, align 4
  %dim.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !1349, metadata !1230), !dbg !1350
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !1351, metadata !1230), !dbg !1352
  %0 = load i32, i32* %num.addr, align 4, !dbg !1353
  %1 = load i32, i32* %dim.addr, align 4, !dbg !1354
  %mul = mul nsw i32 %0, %1, !dbg !1355
  %conv = sext i32 %mul to i64, !dbg !1353
  %mul1 = mul i64 %conv, 4, !dbg !1356
  %call = call noalias i8* @malloc(i64 %mul1) #2, !dbg !1357
  %2 = bitcast i8* %call to float*, !dbg !1358
  store float* %2, float** @coord_h, align 8, !dbg !1359
  ret void, !dbg !1360
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #6

; Function Attrs: uwtable
define void @_Z10freeDevMemv() #0 !dbg !1361 {
entry:
  %err = alloca i32, align 4
  %err4 = alloca i32, align 4
  %err13 = alloca i32, align 4
  %err22 = alloca i32, align 4
  br label %do.body, !dbg !1362, !llvm.loop !1363

do.body:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %err, metadata !1364, metadata !1230), !dbg !1366
  %0 = load i32*, i32** @center_table_d, align 8, !dbg !1367
  %1 = bitcast i32* %0 to i8*, !dbg !1367
  %call = call i32 @cudaFree(i8* %1), !dbg !1367
  store i32 %call, i32* %err, align 4, !dbg !1367
  %2 = load i32, i32* %err, align 4, !dbg !1367
  %cmp = icmp ne i32 0, %2, !dbg !1367
  br i1 %cmp, label %if.then, label %if.end, !dbg !1367

if.then:                                          ; preds = %do.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1369
  %4 = load i32, i32* %err, align 4, !dbg !1369
  %call1 = call i8* @cudaGetErrorString(i32 %4), !dbg !1369
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 115, i8* %call1), !dbg !1373
  call void @exit(i32 1) #8, !dbg !1375
  unreachable, !dbg !1369

if.end:                                           ; preds = %do.body
  br label %do.end, !dbg !1377

do.end:                                           ; preds = %if.end
  br label %do.body3, !dbg !1379, !llvm.loop !1380

do.body3:                                         ; preds = %do.end
  call void @llvm.dbg.declare(metadata i32* %err4, metadata !1381, metadata !1230), !dbg !1383
  %5 = load i8*, i8** @switch_membership_d, align 8, !dbg !1384
  %call5 = call i32 @cudaFree(i8* %5), !dbg !1384
  store i32 %call5, i32* %err4, align 4, !dbg !1384
  %6 = load i32, i32* %err4, align 4, !dbg !1384
  %cmp6 = icmp ne i32 0, %6, !dbg !1384
  br i1 %cmp6, label %if.then7, label %if.end10, !dbg !1384

if.then7:                                         ; preds = %do.body3
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1386
  %8 = load i32, i32* %err4, align 4, !dbg !1386
  %call8 = call i8* @cudaGetErrorString(i32 %8), !dbg !1386
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 116, i8* %call8), !dbg !1390
  call void @exit(i32 1) #8, !dbg !1392
  unreachable, !dbg !1386

if.end10:                                         ; preds = %do.body3
  br label %do.end11, !dbg !1394

do.end11:                                         ; preds = %if.end10
  br label %do.body12, !dbg !1396, !llvm.loop !1397

do.body12:                                        ; preds = %do.end11
  call void @llvm.dbg.declare(metadata i32* %err13, metadata !1398, metadata !1230), !dbg !1400
  %9 = load %struct.Point*, %struct.Point** @p, align 8, !dbg !1401
  %10 = bitcast %struct.Point* %9 to i8*, !dbg !1401
  %call14 = call i32 @cudaFree(i8* %10), !dbg !1401
  store i32 %call14, i32* %err13, align 4, !dbg !1401
  %11 = load i32, i32* %err13, align 4, !dbg !1401
  %cmp15 = icmp ne i32 0, %11, !dbg !1401
  br i1 %cmp15, label %if.then16, label %if.end19, !dbg !1401

if.then16:                                        ; preds = %do.body12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1403
  %13 = load i32, i32* %err13, align 4, !dbg !1403
  %call17 = call i8* @cudaGetErrorString(i32 %13), !dbg !1403
  %call18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 117, i8* %call17), !dbg !1407
  call void @exit(i32 1) #8, !dbg !1409
  unreachable, !dbg !1403

if.end19:                                         ; preds = %do.body12
  br label %do.end20, !dbg !1411

do.end20:                                         ; preds = %if.end19
  br label %do.body21, !dbg !1413, !llvm.loop !1414

do.body21:                                        ; preds = %do.end20
  call void @llvm.dbg.declare(metadata i32* %err22, metadata !1415, metadata !1230), !dbg !1417
  %14 = load float*, float** @coord_d, align 8, !dbg !1418
  %15 = bitcast float* %14 to i8*, !dbg !1418
  %call23 = call i32 @cudaFree(i8* %15), !dbg !1418
  store i32 %call23, i32* %err22, align 4, !dbg !1418
  %16 = load i32, i32* %err22, align 4, !dbg !1418
  %cmp24 = icmp ne i32 0, %16, !dbg !1418
  br i1 %cmp24, label %if.then25, label %if.end28, !dbg !1418

if.then25:                                        ; preds = %do.body21
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1420
  %18 = load i32, i32* %err22, align 4, !dbg !1420
  %call26 = call i8* @cudaGetErrorString(i32 %18), !dbg !1420
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 118, i8* %call26), !dbg !1424
  call void @exit(i32 1) #8, !dbg !1426
  unreachable, !dbg !1420

if.end28:                                         ; preds = %do.body21
  br label %do.end29, !dbg !1428

do.end29:                                         ; preds = %if.end28
  ret void, !dbg !1430
}

declare i32 @cudaFree(i8*) #1

; Function Attrs: nounwind uwtable
define void @_Z11freeHostMemv() #5 !dbg !1431 {
entry:
  %0 = load float*, float** @coord_h, align 8, !dbg !1432
  %1 = bitcast float* %0 to i8*, !dbg !1432
  call void @free(i8* %1) #2, !dbg !1433
  ret void, !dbg !1434
}

; Function Attrs: nounwind
declare void @free(i8*) #6

; Function Attrs: uwtable
define float @_Z5pgainlP6PointsfPliPbPiS2_bPdS4_S4_S4_S4_S4_(i64 %x, %struct.Points* %points, float %z, i64* %numcenters, i32 %kmax, i8* %is_center, i32* %center_table, i8* %switch_membership, i1 zeroext %isCoordChanged, double* %serial_t, double* %cpu_to_gpu_t, double* %gpu_to_cpu_t, double* %alloc_t, double* %kernel_t, double* %free_t) #0 !dbg !1435 {
entry:
  %x.addr = alloca i64, align 8
  %points.addr = alloca %struct.Points*, align 8
  %z.addr = alloca float, align 4
  %numcenters.addr = alloca i64*, align 8
  %kmax.addr = alloca i32, align 4
  %is_center.addr = alloca i8*, align 8
  %center_table.addr = alloca i32*, align 8
  %switch_membership.addr = alloca i8*, align 8
  %isCoordChanged.addr = alloca i8, align 1
  %serial_t.addr = alloca double*, align 8
  %cpu_to_gpu_t.addr = alloca double*, align 8
  %gpu_to_cpu_t.addr = alloca double*, align 8
  %alloc_t.addr = alloca double*, align 8
  %kernel_t.addr = alloca double*, align 8
  %free_t.addr = alloca double*, align 8
  %tmp_t = alloca float, align 4
  %start = alloca %struct.CUevent_st*, align 8
  %stop = alloca %struct.CUevent_st*, align 8
  %error = alloca i32, align 4
  %stride = alloca i32, align 4
  %K = alloca i32, align 4
  %num = alloca i32, align 4
  %dim = alloca i32, align 4
  %nThread = alloca i32, align 4
  %count = alloca i32, align 4
  %i = alloca i32, align 4
  %i20 = alloca i32, align 4
  %j = alloca i32, align 4
  %err = alloca i32, align 4
  %err72 = alloca i32, align 4
  %err85 = alloca i32, align 4
  %err96 = alloca i32, align 4
  %err108 = alloca i32, align 4
  %err119 = alloca i32, align 4
  %num_blocks = alloca i32, align 4
  %num_blocks_y = alloca i32, align 4
  %num_blocks_x = alloca i32, align 4
  %grid_size = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp151 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp151.coerce = alloca { i64, i32 }, align 4
  %err168 = alloca i32, align 4
  %err181 = alloca i32, align 4
  %number_of_centers_to_close = alloca i32, align 4
  %gl_cost_of_opening_x = alloca float, align 4
  %gl_lower = alloca float*, align 8
  %i200 = alloca i32, align 4
  %low = alloca float, align 4
  %j208 = alloca i32, align 4
  %i246 = alloca i32, align 4
  %close_center = alloca i8, align 1
  %agg.tmp264 = alloca %struct.Point, align 8
  %agg.tmp268 = alloca %struct.Point, align 8
  %i287 = alloca i32, align 4
  %err324 = alloca i32, align 4
  store i64 %x, i64* %x.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %x.addr, metadata !1446, metadata !1230), !dbg !1447
  store %struct.Points* %points, %struct.Points** %points.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !1448, metadata !1230), !dbg !1449
  store float %z, float* %z.addr, align 4
  call void @llvm.dbg.declare(metadata float* %z.addr, metadata !1450, metadata !1230), !dbg !1451
  store i64* %numcenters, i64** %numcenters.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %numcenters.addr, metadata !1452, metadata !1230), !dbg !1453
  store i32 %kmax, i32* %kmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %kmax.addr, metadata !1454, metadata !1230), !dbg !1455
  store i8* %is_center, i8** %is_center.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %is_center.addr, metadata !1456, metadata !1230), !dbg !1457
  store i32* %center_table, i32** %center_table.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %center_table.addr, metadata !1458, metadata !1230), !dbg !1459
  store i8* %switch_membership, i8** %switch_membership.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %switch_membership.addr, metadata !1460, metadata !1230), !dbg !1461
  %frombool = zext i1 %isCoordChanged to i8
  store i8 %frombool, i8* %isCoordChanged.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %isCoordChanged.addr, metadata !1462, metadata !1230), !dbg !1463
  store double* %serial_t, double** %serial_t.addr, align 8
  call void @llvm.dbg.declare(metadata double** %serial_t.addr, metadata !1464, metadata !1230), !dbg !1465
  store double* %cpu_to_gpu_t, double** %cpu_to_gpu_t.addr, align 8
  call void @llvm.dbg.declare(metadata double** %cpu_to_gpu_t.addr, metadata !1466, metadata !1230), !dbg !1467
  store double* %gpu_to_cpu_t, double** %gpu_to_cpu_t.addr, align 8
  call void @llvm.dbg.declare(metadata double** %gpu_to_cpu_t.addr, metadata !1468, metadata !1230), !dbg !1469
  store double* %alloc_t, double** %alloc_t.addr, align 8
  call void @llvm.dbg.declare(metadata double** %alloc_t.addr, metadata !1470, metadata !1230), !dbg !1471
  store double* %kernel_t, double** %kernel_t.addr, align 8
  call void @llvm.dbg.declare(metadata double** %kernel_t.addr, metadata !1472, metadata !1230), !dbg !1473
  store double* %free_t, double** %free_t.addr, align 8
  call void @llvm.dbg.declare(metadata double** %free_t.addr, metadata !1474, metadata !1230), !dbg !1475
  call void @llvm.dbg.declare(metadata float* %tmp_t, metadata !1476, metadata !1230), !dbg !1477
  call void @llvm.dbg.declare(metadata %struct.CUevent_st** %start, metadata !1478, metadata !1230), !dbg !1483
  call void @llvm.dbg.declare(metadata %struct.CUevent_st** %stop, metadata !1484, metadata !1230), !dbg !1485
  %call = call i32 @cudaEventCreate(%struct.CUevent_st** %start), !dbg !1486
  %call1 = call i32 @cudaEventCreate(%struct.CUevent_st** %stop), !dbg !1487
  %0 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1488
  %call2 = call i32 @cudaEventRecord(%struct.CUevent_st* %0, %struct.CUstream_st* null), !dbg !1489
  call void @llvm.dbg.declare(metadata i32* %error, metadata !1490, metadata !1230), !dbg !1492
  call void @llvm.dbg.declare(metadata i32* %stride, metadata !1493, metadata !1230), !dbg !1494
  %1 = load i64*, i64** %numcenters.addr, align 8, !dbg !1495
  %2 = load i64, i64* %1, align 8, !dbg !1496
  %add = add nsw i64 %2, 1, !dbg !1497
  %conv = trunc i64 %add to i32, !dbg !1496
  store i32 %conv, i32* %stride, align 4, !dbg !1494
  call void @llvm.dbg.declare(metadata i32* %K, metadata !1498, metadata !1230), !dbg !1499
  %3 = load i64*, i64** %numcenters.addr, align 8, !dbg !1500
  %4 = load i64, i64* %3, align 8, !dbg !1501
  %conv3 = trunc i64 %4 to i32, !dbg !1501
  store i32 %conv3, i32* %K, align 4, !dbg !1499
  call void @llvm.dbg.declare(metadata i32* %num, metadata !1502, metadata !1230), !dbg !1503
  %5 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1504
  %num4 = getelementptr inbounds %struct.Points, %struct.Points* %5, i32 0, i32 0, !dbg !1505
  %6 = load i64, i64* %num4, align 8, !dbg !1505
  %conv5 = trunc i64 %6 to i32, !dbg !1504
  store i32 %conv5, i32* %num, align 4, !dbg !1503
  call void @llvm.dbg.declare(metadata i32* %dim, metadata !1506, metadata !1230), !dbg !1507
  %7 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1508
  %dim6 = getelementptr inbounds %struct.Points, %struct.Points* %7, i32 0, i32 1, !dbg !1509
  %8 = load i32, i32* %dim6, align 8, !dbg !1509
  store i32 %8, i32* %dim, align 4, !dbg !1507
  call void @llvm.dbg.declare(metadata i32* %nThread, metadata !1510, metadata !1230), !dbg !1511
  %9 = load i32, i32* %num, align 4, !dbg !1512
  store i32 %9, i32* %nThread, align 4, !dbg !1511
  %10 = load i32, i32* %stride, align 4, !dbg !1513
  %11 = load i32, i32* %nThread, align 4, !dbg !1514
  %add7 = add nsw i32 %11, 1, !dbg !1515
  %mul = mul nsw i32 %10, %add7, !dbg !1516
  %conv8 = sext i32 %mul to i64, !dbg !1513
  %mul9 = mul i64 %conv8, 4, !dbg !1517
  %call10 = call noalias i8* @malloc(i64 %mul9) #2, !dbg !1518
  %12 = bitcast i8* %call10 to float*, !dbg !1519
  store float* %12, float** @work_mem_h, align 8, !dbg !1520
  %13 = load i32, i32* @_ZL4iter, align 4, !dbg !1521
  %cmp = icmp eq i32 %13, 0, !dbg !1523
  br i1 %cmp, label %if.then, label %if.end, !dbg !1524

if.then:                                          ; preds = %entry
  %14 = load i32, i32* %num, align 4, !dbg !1525
  %15 = load i32, i32* %dim, align 4, !dbg !1527
  call void @_Z12allocHostMemii(i32 %14, i32 %15), !dbg !1528
  br label %if.end, !dbg !1529

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i32* %count, metadata !1530, metadata !1230), !dbg !1531
  store i32 0, i32* %count, align 4, !dbg !1531
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1532, metadata !1230), !dbg !1534
  store i32 0, i32* %i, align 4, !dbg !1534
  br label %for.cond, !dbg !1535

for.cond:                                         ; preds = %for.inc, %if.end
  %16 = load i32, i32* %i, align 4, !dbg !1536
  %17 = load i32, i32* %num, align 4, !dbg !1539
  %cmp11 = icmp slt i32 %16, %17, !dbg !1540
  br i1 %cmp11, label %for.body, label %for.end, !dbg !1541

for.body:                                         ; preds = %for.cond
  %18 = load i8*, i8** %is_center.addr, align 8, !dbg !1542
  %19 = load i32, i32* %i, align 4, !dbg !1545
  %idxprom = sext i32 %19 to i64, !dbg !1542
  %arrayidx = getelementptr inbounds i8, i8* %18, i64 %idxprom, !dbg !1542
  %20 = load i8, i8* %arrayidx, align 1, !dbg !1542
  %tobool = trunc i8 %20 to i1, !dbg !1542
  br i1 %tobool, label %if.then12, label %if.end15, !dbg !1546

if.then12:                                        ; preds = %for.body
  %21 = load i32, i32* %count, align 4, !dbg !1547
  %inc = add nsw i32 %21, 1, !dbg !1547
  store i32 %inc, i32* %count, align 4, !dbg !1547
  %22 = load i32*, i32** %center_table.addr, align 8, !dbg !1549
  %23 = load i32, i32* %i, align 4, !dbg !1550
  %idxprom13 = sext i32 %23 to i64, !dbg !1549
  %arrayidx14 = getelementptr inbounds i32, i32* %22, i64 %idxprom13, !dbg !1549
  store i32 %21, i32* %arrayidx14, align 4, !dbg !1551
  br label %if.end15, !dbg !1552

if.end15:                                         ; preds = %if.then12, %for.body
  br label %for.inc, !dbg !1553

for.inc:                                          ; preds = %if.end15
  %24 = load i32, i32* %i, align 4, !dbg !1554
  %inc16 = add nsw i32 %24, 1, !dbg !1554
  store i32 %inc16, i32* %i, align 4, !dbg !1554
  br label %for.cond, !dbg !1556, !llvm.loop !1557

for.end:                                          ; preds = %for.cond
  %25 = load i8, i8* %isCoordChanged.addr, align 1, !dbg !1559
  %tobool17 = trunc i8 %25 to i1, !dbg !1559
  br i1 %tobool17, label %if.then19, label %lor.lhs.false, !dbg !1561

lor.lhs.false:                                    ; preds = %for.end
  %26 = load i32, i32* @_ZL4iter, align 4, !dbg !1562
  %cmp18 = icmp eq i32 %26, 0, !dbg !1564
  br i1 %cmp18, label %if.then19, label %if.end41, !dbg !1565

if.then19:                                        ; preds = %lor.lhs.false, %for.end
  call void @llvm.dbg.declare(metadata i32* %i20, metadata !1566, metadata !1230), !dbg !1569
  store i32 0, i32* %i20, align 4, !dbg !1569
  br label %for.cond21, !dbg !1570

for.cond21:                                       ; preds = %for.inc38, %if.then19
  %27 = load i32, i32* %i20, align 4, !dbg !1571
  %28 = load i32, i32* %dim, align 4, !dbg !1574
  %cmp22 = icmp slt i32 %27, %28, !dbg !1575
  br i1 %cmp22, label %for.body23, label %for.end40, !dbg !1576

for.body23:                                       ; preds = %for.cond21
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1577, metadata !1230), !dbg !1580
  store i32 0, i32* %j, align 4, !dbg !1580
  br label %for.cond24, !dbg !1581

for.cond24:                                       ; preds = %for.inc35, %for.body23
  %29 = load i32, i32* %j, align 4, !dbg !1582
  %30 = load i32, i32* %num, align 4, !dbg !1585
  %cmp25 = icmp slt i32 %29, %30, !dbg !1586
  br i1 %cmp25, label %for.body26, label %for.end37, !dbg !1587

for.body26:                                       ; preds = %for.cond24
  %31 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1588
  %p = getelementptr inbounds %struct.Points, %struct.Points* %31, i32 0, i32 2, !dbg !1590
  %32 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !1590
  %33 = load i32, i32* %j, align 4, !dbg !1591
  %idxprom27 = sext i32 %33 to i64, !dbg !1588
  %arrayidx28 = getelementptr inbounds %struct.Point, %struct.Point* %32, i64 %idxprom27, !dbg !1588
  %coord = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx28, i32 0, i32 1, !dbg !1592
  %34 = load float*, float** %coord, align 8, !dbg !1592
  %35 = load i32, i32* %i20, align 4, !dbg !1593
  %idxprom29 = sext i32 %35 to i64, !dbg !1588
  %arrayidx30 = getelementptr inbounds float, float* %34, i64 %idxprom29, !dbg !1588
  %36 = load float, float* %arrayidx30, align 4, !dbg !1588
  %37 = load float*, float** @coord_h, align 8, !dbg !1594
  %38 = load i32, i32* %num, align 4, !dbg !1595
  %39 = load i32, i32* %i20, align 4, !dbg !1596
  %mul31 = mul nsw i32 %38, %39, !dbg !1597
  %40 = load i32, i32* %j, align 4, !dbg !1598
  %add32 = add nsw i32 %mul31, %40, !dbg !1599
  %idxprom33 = sext i32 %add32 to i64, !dbg !1594
  %arrayidx34 = getelementptr inbounds float, float* %37, i64 %idxprom33, !dbg !1594
  store float %36, float* %arrayidx34, align 4, !dbg !1600
  br label %for.inc35, !dbg !1601

for.inc35:                                        ; preds = %for.body26
  %41 = load i32, i32* %j, align 4, !dbg !1602
  %inc36 = add nsw i32 %41, 1, !dbg !1602
  store i32 %inc36, i32* %j, align 4, !dbg !1602
  br label %for.cond24, !dbg !1604, !llvm.loop !1605

for.end37:                                        ; preds = %for.cond24
  br label %for.inc38, !dbg !1607

for.inc38:                                        ; preds = %for.end37
  %42 = load i32, i32* %i20, align 4, !dbg !1608
  %inc39 = add nsw i32 %42, 1, !dbg !1608
  store i32 %inc39, i32* %i20, align 4, !dbg !1608
  br label %for.cond21, !dbg !1610, !llvm.loop !1611

for.end40:                                        ; preds = %for.cond21
  br label %if.end41, !dbg !1613

if.end41:                                         ; preds = %for.end40, %lor.lhs.false
  %43 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1614
  %call42 = call i32 @cudaEventRecord(%struct.CUevent_st* %43, %struct.CUstream_st* null), !dbg !1615
  %44 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1616
  %call43 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %44), !dbg !1617
  %45 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1618
  %46 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1619
  %call44 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %45, %struct.CUevent_st* %46), !dbg !1620
  %47 = load float, float* %tmp_t, align 4, !dbg !1621
  %conv45 = fpext float %47 to double, !dbg !1621
  %48 = load double*, double** %serial_t.addr, align 8, !dbg !1622
  %49 = load double, double* %48, align 8, !dbg !1623
  %add46 = fadd double %49, %conv45, !dbg !1623
  store double %add46, double* %48, align 8, !dbg !1623
  %50 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1624
  %call47 = call i32 @cudaEventRecord(%struct.CUevent_st* %50, %struct.CUstream_st* null), !dbg !1625
  br label %do.body, !dbg !1626, !llvm.loop !1627

do.body:                                          ; preds = %if.end41
  call void @llvm.dbg.declare(metadata i32* %err, metadata !1628, metadata !1230), !dbg !1630
  %51 = load i32, i32* %stride, align 4, !dbg !1631
  %52 = load i32, i32* %nThread, align 4, !dbg !1631
  %add48 = add nsw i32 %52, 1, !dbg !1631
  %mul49 = mul nsw i32 %51, %add48, !dbg !1631
  %conv50 = sext i32 %mul49 to i64, !dbg !1631
  %mul51 = mul i64 %conv50, 4, !dbg !1631
  %call52 = call i32 @cudaMalloc(i8** bitcast (float** @work_mem_d to i8**), i64 %mul51), !dbg !1631
  store i32 %call52, i32* %err, align 4, !dbg !1631
  %53 = load i32, i32* %err, align 4, !dbg !1631
  %cmp53 = icmp ne i32 0, %53, !dbg !1631
  br i1 %cmp53, label %if.then54, label %if.end57, !dbg !1631

if.then54:                                        ; preds = %do.body
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1633
  %55 = load i32, i32* %err, align 4, !dbg !1633
  %call55 = call i8* @cudaGetErrorString(i32 %55), !dbg !1633
  %call56 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 197, i8* %call55), !dbg !1637
  call void @exit(i32 1) #8, !dbg !1639
  unreachable, !dbg !1633

if.end57:                                         ; preds = %do.body
  br label %do.end, !dbg !1641

do.end:                                           ; preds = %if.end57
  %56 = load i32, i32* @_ZL4iter, align 4, !dbg !1643
  %cmp58 = icmp eq i32 %56, 0, !dbg !1645
  br i1 %cmp58, label %if.then59, label %if.end60, !dbg !1646

if.then59:                                        ; preds = %do.end
  %57 = load i32, i32* %num, align 4, !dbg !1647
  %58 = load i32, i32* %dim, align 4, !dbg !1649
  call void @_Z11allocDevMemii(i32 %57, i32 %58), !dbg !1650
  br label %if.end60, !dbg !1651

if.end60:                                         ; preds = %if.then59, %do.end
  %59 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1652
  %call61 = call i32 @cudaEventRecord(%struct.CUevent_st* %59, %struct.CUstream_st* null), !dbg !1653
  %60 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1654
  %call62 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %60), !dbg !1655
  %61 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1656
  %62 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1657
  %call63 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %61, %struct.CUevent_st* %62), !dbg !1658
  %63 = load float, float* %tmp_t, align 4, !dbg !1659
  %conv64 = fpext float %63 to double, !dbg !1659
  %64 = load double*, double** %alloc_t.addr, align 8, !dbg !1660
  %65 = load double, double* %64, align 8, !dbg !1661
  %add65 = fadd double %65, %conv64, !dbg !1661
  store double %add65, double* %64, align 8, !dbg !1661
  %66 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1662
  %call66 = call i32 @cudaEventRecord(%struct.CUevent_st* %66, %struct.CUstream_st* null), !dbg !1663
  %67 = load i8, i8* %isCoordChanged.addr, align 1, !dbg !1664
  %tobool67 = trunc i8 %67 to i1, !dbg !1664
  br i1 %tobool67, label %if.then70, label %lor.lhs.false68, !dbg !1666

lor.lhs.false68:                                  ; preds = %if.end60
  %68 = load i32, i32* @_ZL4iter, align 4, !dbg !1667
  %cmp69 = icmp eq i32 %68, 0, !dbg !1669
  br i1 %cmp69, label %if.then70, label %if.end83, !dbg !1670

if.then70:                                        ; preds = %lor.lhs.false68, %if.end60
  br label %do.body71, !dbg !1671, !llvm.loop !1673

do.body71:                                        ; preds = %if.then70
  call void @llvm.dbg.declare(metadata i32* %err72, metadata !1674, metadata !1230), !dbg !1676
  %69 = load float*, float** @coord_d, align 8, !dbg !1677
  %70 = bitcast float* %69 to i8*, !dbg !1677
  %71 = load float*, float** @coord_h, align 8, !dbg !1677
  %72 = bitcast float* %71 to i8*, !dbg !1677
  %73 = load i32, i32* %num, align 4, !dbg !1677
  %74 = load i32, i32* %dim, align 4, !dbg !1677
  %mul73 = mul nsw i32 %73, %74, !dbg !1677
  %conv74 = sext i32 %mul73 to i64, !dbg !1677
  %mul75 = mul i64 %conv74, 4, !dbg !1677
  %call76 = call i32 @cudaMemcpy(i8* %70, i8* %72, i64 %mul75, i32 1), !dbg !1677
  store i32 %call76, i32* %err72, align 4, !dbg !1677
  %75 = load i32, i32* %err72, align 4, !dbg !1677
  %cmp77 = icmp ne i32 0, %75, !dbg !1677
  br i1 %cmp77, label %if.then78, label %if.end81, !dbg !1677

if.then78:                                        ; preds = %do.body71
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1679
  %77 = load i32, i32* %err72, align 4, !dbg !1679
  %call79 = call i8* @cudaGetErrorString(i32 %77), !dbg !1679
  %call80 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 219, i8* %call79), !dbg !1683
  call void @exit(i32 1) #8, !dbg !1685
  unreachable, !dbg !1679

if.end81:                                         ; preds = %do.body71
  br label %do.end82, !dbg !1687

do.end82:                                         ; preds = %if.end81
  br label %if.end83, !dbg !1689

if.end83:                                         ; preds = %do.end82, %lor.lhs.false68
  br label %do.body84, !dbg !1690, !llvm.loop !1691

do.body84:                                        ; preds = %if.end83
  call void @llvm.dbg.declare(metadata i32* %err85, metadata !1692, metadata !1230), !dbg !1694
  %78 = load i32*, i32** @center_table_d, align 8, !dbg !1695
  %79 = bitcast i32* %78 to i8*, !dbg !1695
  %80 = load i32*, i32** %center_table.addr, align 8, !dbg !1695
  %81 = bitcast i32* %80 to i8*, !dbg !1695
  %82 = load i32, i32* %num, align 4, !dbg !1695
  %conv86 = sext i32 %82 to i64, !dbg !1695
  %mul87 = mul i64 %conv86, 4, !dbg !1695
  %call88 = call i32 @cudaMemcpy(i8* %79, i8* %81, i64 %mul87, i32 1), !dbg !1695
  store i32 %call88, i32* %err85, align 4, !dbg !1695
  %83 = load i32, i32* %err85, align 4, !dbg !1695
  %cmp89 = icmp ne i32 0, %83, !dbg !1695
  br i1 %cmp89, label %if.then90, label %if.end93, !dbg !1695

if.then90:                                        ; preds = %do.body84
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1697
  %85 = load i32, i32* %err85, align 4, !dbg !1697
  %call91 = call i8* @cudaGetErrorString(i32 %85), !dbg !1697
  %call92 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %84, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 221, i8* %call91), !dbg !1701
  call void @exit(i32 1) #8, !dbg !1703
  unreachable, !dbg !1697

if.end93:                                         ; preds = %do.body84
  br label %do.end94, !dbg !1705

do.end94:                                         ; preds = %if.end93
  br label %do.body95, !dbg !1707, !llvm.loop !1708

do.body95:                                        ; preds = %do.end94
  call void @llvm.dbg.declare(metadata i32* %err96, metadata !1709, metadata !1230), !dbg !1711
  %86 = load %struct.Point*, %struct.Point** @p, align 8, !dbg !1712
  %87 = bitcast %struct.Point* %86 to i8*, !dbg !1712
  %88 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1712
  %p97 = getelementptr inbounds %struct.Points, %struct.Points* %88, i32 0, i32 2, !dbg !1712
  %89 = load %struct.Point*, %struct.Point** %p97, align 8, !dbg !1712
  %90 = bitcast %struct.Point* %89 to i8*, !dbg !1712
  %91 = load i32, i32* %num, align 4, !dbg !1712
  %conv98 = sext i32 %91 to i64, !dbg !1712
  %mul99 = mul i64 %conv98, 32, !dbg !1712
  %call100 = call i32 @cudaMemcpy(i8* %87, i8* %90, i64 %mul99, i32 1), !dbg !1712
  store i32 %call100, i32* %err96, align 4, !dbg !1712
  %92 = load i32, i32* %err96, align 4, !dbg !1712
  %cmp101 = icmp ne i32 0, %92, !dbg !1712
  br i1 %cmp101, label %if.then102, label %if.end105, !dbg !1712

if.then102:                                       ; preds = %do.body95
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1714
  %94 = load i32, i32* %err96, align 4, !dbg !1714
  %call103 = call i8* @cudaGetErrorString(i32 %94), !dbg !1714
  %call104 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %93, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 222, i8* %call103), !dbg !1718
  call void @exit(i32 1) #8, !dbg !1720
  unreachable, !dbg !1714

if.end105:                                        ; preds = %do.body95
  br label %do.end106, !dbg !1722

do.end106:                                        ; preds = %if.end105
  br label %do.body107, !dbg !1724, !llvm.loop !1725

do.body107:                                       ; preds = %do.end106
  call void @llvm.dbg.declare(metadata i32* %err108, metadata !1726, metadata !1230), !dbg !1728
  %95 = load i8*, i8** @switch_membership_d, align 8, !dbg !1729
  %96 = load i32, i32* %num, align 4, !dbg !1729
  %conv109 = sext i32 %96 to i64, !dbg !1729
  %mul110 = mul i64 %conv109, 1, !dbg !1729
  %call111 = call i32 @cudaMemset(i8* %95, i32 0, i64 %mul110), !dbg !1729
  store i32 %call111, i32* %err108, align 4, !dbg !1729
  %97 = load i32, i32* %err108, align 4, !dbg !1729
  %cmp112 = icmp ne i32 0, %97, !dbg !1729
  br i1 %cmp112, label %if.then113, label %if.end116, !dbg !1729

if.then113:                                       ; preds = %do.body107
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1731
  %99 = load i32, i32* %err108, align 4, !dbg !1731
  %call114 = call i8* @cudaGetErrorString(i32 %99), !dbg !1731
  %call115 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %98, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 224, i8* %call114), !dbg !1735
  call void @exit(i32 1) #8, !dbg !1737
  unreachable, !dbg !1731

if.end116:                                        ; preds = %do.body107
  br label %do.end117, !dbg !1739

do.end117:                                        ; preds = %if.end116
  br label %do.body118, !dbg !1741, !llvm.loop !1742

do.body118:                                       ; preds = %do.end117
  call void @llvm.dbg.declare(metadata i32* %err119, metadata !1743, metadata !1230), !dbg !1745
  %100 = load float*, float** @work_mem_d, align 8, !dbg !1746
  %101 = bitcast float* %100 to i8*, !dbg !1746
  %102 = load i32, i32* %stride, align 4, !dbg !1746
  %103 = load i32, i32* %nThread, align 4, !dbg !1746
  %add120 = add nsw i32 %103, 1, !dbg !1746
  %mul121 = mul nsw i32 %102, %add120, !dbg !1746
  %conv122 = sext i32 %mul121 to i64, !dbg !1746
  %mul123 = mul i64 %conv122, 4, !dbg !1746
  %call124 = call i32 @cudaMemset(i8* %101, i32 0, i64 %mul123), !dbg !1746
  store i32 %call124, i32* %err119, align 4, !dbg !1746
  %104 = load i32, i32* %err119, align 4, !dbg !1746
  %cmp125 = icmp ne i32 0, %104, !dbg !1746
  br i1 %cmp125, label %if.then126, label %if.end129, !dbg !1746

if.then126:                                       ; preds = %do.body118
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1748
  %106 = load i32, i32* %err119, align 4, !dbg !1748
  %call127 = call i8* @cudaGetErrorString(i32 %106), !dbg !1748
  %call128 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %105, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 225, i8* %call127), !dbg !1752
  call void @exit(i32 1) #8, !dbg !1754
  unreachable, !dbg !1748

if.end129:                                        ; preds = %do.body118
  br label %do.end130, !dbg !1756

do.end130:                                        ; preds = %if.end129
  %107 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1758
  %call131 = call i32 @cudaEventRecord(%struct.CUevent_st* %107, %struct.CUstream_st* null), !dbg !1759
  %108 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1760
  %call132 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %108), !dbg !1761
  %109 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1762
  %110 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1763
  %call133 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %109, %struct.CUevent_st* %110), !dbg !1764
  %111 = load float, float* %tmp_t, align 4, !dbg !1765
  %conv134 = fpext float %111 to double, !dbg !1765
  %112 = load double*, double** %cpu_to_gpu_t.addr, align 8, !dbg !1766
  %113 = load double, double* %112, align 8, !dbg !1767
  %add135 = fadd double %113, %conv134, !dbg !1767
  store double %add135, double* %112, align 8, !dbg !1767
  %114 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1768
  %call136 = call i32 @cudaEventRecord(%struct.CUevent_st* %114, %struct.CUstream_st* null), !dbg !1769
  call void @llvm.dbg.declare(metadata i32* %num_blocks, metadata !1770, metadata !1230), !dbg !1771
  %115 = load i32, i32* %num, align 4, !dbg !1772
  %add137 = add nsw i32 %115, 512, !dbg !1773
  %sub = sub nsw i32 %add137, 1, !dbg !1774
  %conv138 = sitofp i32 %sub to float, !dbg !1775
  %div = fdiv float %conv138, 5.120000e+02, !dbg !1776
  %conv139 = fptosi float %div to i32, !dbg !1777
  store i32 %conv139, i32* %num_blocks, align 4, !dbg !1771
  call void @llvm.dbg.declare(metadata i32* %num_blocks_y, metadata !1778, metadata !1230), !dbg !1779
  %116 = load i32, i32* %num_blocks, align 4, !dbg !1780
  %add140 = add nsw i32 %116, 65536, !dbg !1781
  %sub141 = sub nsw i32 %add140, 1, !dbg !1782
  %conv142 = sitofp i32 %sub141 to float, !dbg !1783
  %div143 = fdiv float %conv142, 6.553600e+04, !dbg !1784
  %conv144 = fptosi float %div143 to i32, !dbg !1785
  store i32 %conv144, i32* %num_blocks_y, align 4, !dbg !1779
  call void @llvm.dbg.declare(metadata i32* %num_blocks_x, metadata !1786, metadata !1230), !dbg !1787
  %117 = load i32, i32* %num_blocks, align 4, !dbg !1788
  %118 = load i32, i32* %num_blocks_y, align 4, !dbg !1789
  %add145 = add nsw i32 %117, %118, !dbg !1790
  %sub146 = sub nsw i32 %add145, 1, !dbg !1791
  %conv147 = sitofp i32 %sub146 to float, !dbg !1792
  %119 = load i32, i32* %num_blocks_y, align 4, !dbg !1793
  %conv148 = sitofp i32 %119 to float, !dbg !1793
  %div149 = fdiv float %conv147, %conv148, !dbg !1794
  %conv150 = fptosi float %div149 to i32, !dbg !1795
  store i32 %conv150, i32* %num_blocks_x, align 4, !dbg !1787
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid_size, metadata !1796, metadata !1230), !dbg !1820
  %120 = load i32, i32* %num_blocks_x, align 4, !dbg !1821
  %121 = load i32, i32* %num_blocks_y, align 4, !dbg !1822
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid_size, i32 %120, i32 %121, i32 1), !dbg !1820
  %122 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1823
  %123 = bitcast %struct.dim3* %grid_size to i8*, !dbg !1823
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %122, i8* %123, i64 12, i32 4, i1 false), !dbg !1823
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp151, i32 512, i32 1, i32 1), !dbg !1824
  %124 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1825
  %125 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1825
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %124, i8* %125, i64 12, i32 4, i1 false), !dbg !1825
  %126 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !1825
  %127 = load i64, i64* %126, align 4, !dbg !1825
  %128 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !1825
  %129 = load i32, i32* %128, align 4, !dbg !1825
  %130 = bitcast { i64, i32 }* %agg.tmp151.coerce to i8*, !dbg !1825
  %131 = bitcast %struct.dim3* %agg.tmp151 to i8*, !dbg !1825
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %130, i8* %131, i64 12, i32 4, i1 false), !dbg !1825
  %132 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp151.coerce, i32 0, i32 0, !dbg !1825
  %133 = load i64, i64* %132, align 4, !dbg !1825
  %134 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp151.coerce, i32 0, i32 1, !dbg !1825
  %135 = load i32, i32* %134, align 4, !dbg !1825
  %call152 = call i32 @cudaConfigureCall(i64 %127, i32 %129, i64 %133, i32 %135, i64 0, %struct.CUstream_st* null), !dbg !1826
  %tobool153 = icmp ne i32 %call152, 0, !dbg !1825
  br i1 %tobool153, label %kcall.end, label %kcall.configok, !dbg !1828

kcall.configok:                                   ; preds = %do.end130
  %136 = load i32, i32* %num, align 4, !dbg !1829
  %137 = load i32, i32* %dim, align 4, !dbg !1830
  %138 = load i64, i64* %x.addr, align 8, !dbg !1831
  %139 = load %struct.Point*, %struct.Point** @p, align 8, !dbg !1832
  %140 = load i32, i32* %K, align 4, !dbg !1833
  %141 = load i32, i32* %stride, align 4, !dbg !1834
  %142 = load float*, float** @coord_d, align 8, !dbg !1835
  %143 = load float*, float** @work_mem_d, align 8, !dbg !1836
  %144 = load i32*, i32** @center_table_d, align 8, !dbg !1837
  %145 = load i8*, i8** @switch_membership_d, align 8, !dbg !1838
  call void @_Z19kernel_compute_costiilP5PointiiPfS1_PiPb(i32 %136, i32 %137, i64 %138, %struct.Point* %139, i32 %140, i32 %141, float* %142, float* %143, i32* %144, i8* %145), !dbg !1839
  br label %kcall.end, !dbg !1839

kcall.end:                                        ; preds = %kcall.configok, %do.end130
  %call154 = call i32 @cudaThreadSynchronize(), !dbg !1841
  %call155 = call i32 @cudaGetLastError(), !dbg !1842
  store i32 %call155, i32* %error, align 4, !dbg !1843
  %146 = load i32, i32* %error, align 4, !dbg !1844
  %cmp156 = icmp ne i32 %146, 0, !dbg !1846
  br i1 %cmp156, label %if.then157, label %if.end160, !dbg !1847

if.then157:                                       ; preds = %kcall.end
  %147 = load i32, i32* %error, align 4, !dbg !1848
  %call158 = call i8* @cudaGetErrorString(i32 %147), !dbg !1850
  %call159 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i32 0, i32 0), i8* %call158), !dbg !1851
  call void @exit(i32 1) #8, !dbg !1853
  unreachable, !dbg !1853

if.end160:                                        ; preds = %kcall.end
  %148 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1854
  %call161 = call i32 @cudaEventRecord(%struct.CUevent_st* %148, %struct.CUstream_st* null), !dbg !1855
  %149 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1856
  %call162 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %149), !dbg !1857
  %150 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1858
  %151 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1859
  %call163 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %150, %struct.CUevent_st* %151), !dbg !1860
  %152 = load float, float* %tmp_t, align 4, !dbg !1861
  %conv164 = fpext float %152 to double, !dbg !1861
  %153 = load double*, double** %kernel_t.addr, align 8, !dbg !1862
  %154 = load double, double* %153, align 8, !dbg !1863
  %add165 = fadd double %154, %conv164, !dbg !1863
  store double %add165, double* %153, align 8, !dbg !1863
  %155 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1864
  %call166 = call i32 @cudaEventRecord(%struct.CUevent_st* %155, %struct.CUstream_st* null), !dbg !1865
  br label %do.body167, !dbg !1866, !llvm.loop !1867

do.body167:                                       ; preds = %if.end160
  call void @llvm.dbg.declare(metadata i32* %err168, metadata !1868, metadata !1230), !dbg !1870
  %156 = load float*, float** @work_mem_h, align 8, !dbg !1871
  %157 = bitcast float* %156 to i8*, !dbg !1871
  %158 = load float*, float** @work_mem_d, align 8, !dbg !1871
  %159 = bitcast float* %158 to i8*, !dbg !1871
  %160 = load i32, i32* %stride, align 4, !dbg !1871
  %161 = load i32, i32* %nThread, align 4, !dbg !1871
  %add169 = add nsw i32 %161, 1, !dbg !1871
  %mul170 = mul nsw i32 %160, %add169, !dbg !1871
  %conv171 = sext i32 %mul170 to i64, !dbg !1871
  %mul172 = mul i64 %conv171, 4, !dbg !1871
  %call173 = call i32 @cudaMemcpy(i8* %157, i8* %159, i64 %mul172, i32 2), !dbg !1871
  store i32 %call173, i32* %err168, align 4, !dbg !1871
  %162 = load i32, i32* %err168, align 4, !dbg !1871
  %cmp174 = icmp ne i32 0, %162, !dbg !1871
  br i1 %cmp174, label %if.then175, label %if.end178, !dbg !1871

if.then175:                                       ; preds = %do.body167
  %163 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1873
  %164 = load i32, i32* %err168, align 4, !dbg !1873
  %call176 = call i8* @cudaGetErrorString(i32 %164), !dbg !1873
  %call177 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %163, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 279, i8* %call176), !dbg !1877
  call void @exit(i32 1) #8, !dbg !1879
  unreachable, !dbg !1873

if.end178:                                        ; preds = %do.body167
  br label %do.end179, !dbg !1881

do.end179:                                        ; preds = %if.end178
  br label %do.body180, !dbg !1883, !llvm.loop !1884

do.body180:                                       ; preds = %do.end179
  call void @llvm.dbg.declare(metadata i32* %err181, metadata !1885, metadata !1230), !dbg !1887
  %165 = load i8*, i8** %switch_membership.addr, align 8, !dbg !1888
  %166 = load i8*, i8** @switch_membership_d, align 8, !dbg !1888
  %167 = load i32, i32* %num, align 4, !dbg !1888
  %conv182 = sext i32 %167 to i64, !dbg !1888
  %mul183 = mul i64 %conv182, 1, !dbg !1888
  %call184 = call i32 @cudaMemcpy(i8* %165, i8* %166, i64 %mul183, i32 2), !dbg !1888
  store i32 %call184, i32* %err181, align 4, !dbg !1888
  %168 = load i32, i32* %err181, align 4, !dbg !1888
  %cmp185 = icmp ne i32 0, %168, !dbg !1888
  br i1 %cmp185, label %if.then186, label %if.end189, !dbg !1888

if.then186:                                       ; preds = %do.body180
  %169 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1890
  %170 = load i32, i32* %err181, align 4, !dbg !1890
  %call187 = call i8* @cudaGetErrorString(i32 %170), !dbg !1890
  %call188 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %169, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 280, i8* %call187), !dbg !1894
  call void @exit(i32 1) #8, !dbg !1896
  unreachable, !dbg !1890

if.end189:                                        ; preds = %do.body180
  br label %do.end190, !dbg !1898

do.end190:                                        ; preds = %if.end189
  %171 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1900
  %call191 = call i32 @cudaEventRecord(%struct.CUevent_st* %171, %struct.CUstream_st* null), !dbg !1901
  %172 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1902
  %call192 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %172), !dbg !1903
  %173 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1904
  %174 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1905
  %call193 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %173, %struct.CUevent_st* %174), !dbg !1906
  %175 = load float, float* %tmp_t, align 4, !dbg !1907
  %conv194 = fpext float %175 to double, !dbg !1907
  %176 = load double*, double** %gpu_to_cpu_t.addr, align 8, !dbg !1908
  %177 = load double, double* %176, align 8, !dbg !1909
  %add195 = fadd double %177, %conv194, !dbg !1909
  store double %add195, double* %176, align 8, !dbg !1909
  %178 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1910
  %call196 = call i32 @cudaEventRecord(%struct.CUevent_st* %178, %struct.CUstream_st* null), !dbg !1911
  call void @llvm.dbg.declare(metadata i32* %number_of_centers_to_close, metadata !1912, metadata !1230), !dbg !1913
  store i32 0, i32* %number_of_centers_to_close, align 4, !dbg !1913
  call void @llvm.dbg.declare(metadata float* %gl_cost_of_opening_x, metadata !1914, metadata !1230), !dbg !1915
  %179 = load float, float* %z.addr, align 4, !dbg !1916
  store float %179, float* %gl_cost_of_opening_x, align 4, !dbg !1915
  call void @llvm.dbg.declare(metadata float** %gl_lower, metadata !1917, metadata !1230), !dbg !1918
  %180 = load float*, float** @work_mem_h, align 8, !dbg !1919
  %181 = load i32, i32* %stride, align 4, !dbg !1920
  %182 = load i32, i32* %nThread, align 4, !dbg !1921
  %mul197 = mul nsw i32 %181, %182, !dbg !1922
  %idxprom198 = sext i32 %mul197 to i64, !dbg !1919
  %arrayidx199 = getelementptr inbounds float, float* %180, i64 %idxprom198, !dbg !1919
  store float* %arrayidx199, float** %gl_lower, align 8, !dbg !1918
  call void @llvm.dbg.declare(metadata i32* %i200, metadata !1923, metadata !1230), !dbg !1925
  store i32 0, i32* %i200, align 4, !dbg !1925
  br label %for.cond201, !dbg !1926

for.cond201:                                      ; preds = %for.inc241, %do.end190
  %183 = load i32, i32* %i200, align 4, !dbg !1927
  %184 = load i32, i32* %num, align 4, !dbg !1930
  %cmp202 = icmp slt i32 %183, %184, !dbg !1931
  br i1 %cmp202, label %for.body203, label %for.end243, !dbg !1932

for.body203:                                      ; preds = %for.cond201
  %185 = load i8*, i8** %is_center.addr, align 8, !dbg !1933
  %186 = load i32, i32* %i200, align 4, !dbg !1936
  %idxprom204 = sext i32 %186 to i64, !dbg !1933
  %arrayidx205 = getelementptr inbounds i8, i8* %185, i64 %idxprom204, !dbg !1933
  %187 = load i8, i8* %arrayidx205, align 1, !dbg !1933
  %tobool206 = trunc i8 %187 to i1, !dbg !1933
  br i1 %tobool206, label %if.then207, label %if.end235, !dbg !1937

if.then207:                                       ; preds = %for.body203
  call void @llvm.dbg.declare(metadata float* %low, metadata !1938, metadata !1230), !dbg !1940
  %188 = load float, float* %z.addr, align 4, !dbg !1941
  store float %188, float* %low, align 4, !dbg !1940
  call void @llvm.dbg.declare(metadata i32* %j208, metadata !1942, metadata !1230), !dbg !1944
  store i32 0, i32* %j208, align 4, !dbg !1944
  br label %for.cond209, !dbg !1945

for.cond209:                                      ; preds = %for.inc219, %if.then207
  %189 = load i32, i32* %j208, align 4, !dbg !1946
  %190 = load i32, i32* %num, align 4, !dbg !1949
  %cmp210 = icmp slt i32 %189, %190, !dbg !1950
  br i1 %cmp210, label %for.body211, label %for.end221, !dbg !1951

for.body211:                                      ; preds = %for.cond209
  %191 = load float*, float** @work_mem_h, align 8, !dbg !1952
  %192 = load i32, i32* %j208, align 4, !dbg !1954
  %193 = load i32, i32* %stride, align 4, !dbg !1955
  %mul212 = mul nsw i32 %192, %193, !dbg !1956
  %194 = load i32*, i32** %center_table.addr, align 8, !dbg !1957
  %195 = load i32, i32* %i200, align 4, !dbg !1958
  %idxprom213 = sext i32 %195 to i64, !dbg !1957
  %arrayidx214 = getelementptr inbounds i32, i32* %194, i64 %idxprom213, !dbg !1957
  %196 = load i32, i32* %arrayidx214, align 4, !dbg !1957
  %add215 = add nsw i32 %mul212, %196, !dbg !1959
  %idxprom216 = sext i32 %add215 to i64, !dbg !1952
  %arrayidx217 = getelementptr inbounds float, float* %191, i64 %idxprom216, !dbg !1952
  %197 = load float, float* %arrayidx217, align 4, !dbg !1952
  %198 = load float, float* %low, align 4, !dbg !1960
  %add218 = fadd float %198, %197, !dbg !1960
  store float %add218, float* %low, align 4, !dbg !1960
  br label %for.inc219, !dbg !1961

for.inc219:                                       ; preds = %for.body211
  %199 = load i32, i32* %j208, align 4, !dbg !1962
  %inc220 = add nsw i32 %199, 1, !dbg !1962
  store i32 %inc220, i32* %j208, align 4, !dbg !1962
  br label %for.cond209, !dbg !1964, !llvm.loop !1965

for.end221:                                       ; preds = %for.cond209
  %200 = load float, float* %low, align 4, !dbg !1967
  %201 = load float*, float** %gl_lower, align 8, !dbg !1968
  %202 = load i32*, i32** %center_table.addr, align 8, !dbg !1969
  %203 = load i32, i32* %i200, align 4, !dbg !1970
  %idxprom222 = sext i32 %203 to i64, !dbg !1969
  %arrayidx223 = getelementptr inbounds i32, i32* %202, i64 %idxprom222, !dbg !1969
  %204 = load i32, i32* %arrayidx223, align 4, !dbg !1969
  %idxprom224 = sext i32 %204 to i64, !dbg !1968
  %arrayidx225 = getelementptr inbounds float, float* %201, i64 %idxprom224, !dbg !1968
  store float %200, float* %arrayidx225, align 4, !dbg !1971
  %205 = load float, float* %low, align 4, !dbg !1972
  %cmp226 = fcmp ogt float %205, 0.000000e+00, !dbg !1974
  br i1 %cmp226, label %if.then227, label %if.end234, !dbg !1975

if.then227:                                       ; preds = %for.end221
  %206 = load i32, i32* %number_of_centers_to_close, align 4, !dbg !1976
  %inc228 = add nsw i32 %206, 1, !dbg !1976
  store i32 %inc228, i32* %number_of_centers_to_close, align 4, !dbg !1976
  %207 = load float, float* %low, align 4, !dbg !1978
  %208 = load float*, float** @work_mem_h, align 8, !dbg !1979
  %209 = load i32, i32* %i200, align 4, !dbg !1980
  %210 = load i32, i32* %stride, align 4, !dbg !1981
  %mul229 = mul nsw i32 %209, %210, !dbg !1982
  %211 = load i32, i32* %K, align 4, !dbg !1983
  %add230 = add nsw i32 %mul229, %211, !dbg !1984
  %idxprom231 = sext i32 %add230 to i64, !dbg !1979
  %arrayidx232 = getelementptr inbounds float, float* %208, i64 %idxprom231, !dbg !1979
  %212 = load float, float* %arrayidx232, align 4, !dbg !1985
  %sub233 = fsub float %212, %207, !dbg !1985
  store float %sub233, float* %arrayidx232, align 4, !dbg !1985
  br label %if.end234, !dbg !1986

if.end234:                                        ; preds = %if.then227, %for.end221
  br label %if.end235, !dbg !1987

if.end235:                                        ; preds = %if.end234, %for.body203
  %213 = load float*, float** @work_mem_h, align 8, !dbg !1988
  %214 = load i32, i32* %i200, align 4, !dbg !1989
  %215 = load i32, i32* %stride, align 4, !dbg !1990
  %mul236 = mul nsw i32 %214, %215, !dbg !1991
  %216 = load i32, i32* %K, align 4, !dbg !1992
  %add237 = add nsw i32 %mul236, %216, !dbg !1993
  %idxprom238 = sext i32 %add237 to i64, !dbg !1988
  %arrayidx239 = getelementptr inbounds float, float* %213, i64 %idxprom238, !dbg !1988
  %217 = load float, float* %arrayidx239, align 4, !dbg !1988
  %218 = load float, float* %gl_cost_of_opening_x, align 4, !dbg !1994
  %add240 = fadd float %218, %217, !dbg !1994
  store float %add240, float* %gl_cost_of_opening_x, align 4, !dbg !1994
  br label %for.inc241, !dbg !1995

for.inc241:                                       ; preds = %if.end235
  %219 = load i32, i32* %i200, align 4, !dbg !1996
  %inc242 = add nsw i32 %219, 1, !dbg !1996
  store i32 %inc242, i32* %i200, align 4, !dbg !1996
  br label %for.cond201, !dbg !1998, !llvm.loop !1999

for.end243:                                       ; preds = %for.cond201
  %220 = load float, float* %gl_cost_of_opening_x, align 4, !dbg !2001
  %cmp244 = fcmp olt float %220, 0.000000e+00, !dbg !2003
  br i1 %cmp244, label %if.then245, label %if.else, !dbg !2004

if.then245:                                       ; preds = %for.end243
  call void @llvm.dbg.declare(metadata i32* %i246, metadata !2005, metadata !1230), !dbg !2008
  store i32 0, i32* %i246, align 4, !dbg !2008
  br label %for.cond247, !dbg !2009

for.cond247:                                      ; preds = %for.inc284, %if.then245
  %221 = load i32, i32* %i246, align 4, !dbg !2010
  %222 = load i32, i32* %num, align 4, !dbg !2013
  %cmp248 = icmp slt i32 %221, %222, !dbg !2014
  br i1 %cmp248, label %for.body249, label %for.end286, !dbg !2015

for.body249:                                      ; preds = %for.cond247
  call void @llvm.dbg.declare(metadata i8* %close_center, metadata !2016, metadata !1230), !dbg !2018
  %223 = load float*, float** %gl_lower, align 8, !dbg !2019
  %224 = load i32*, i32** %center_table.addr, align 8, !dbg !2020
  %225 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2021
  %p250 = getelementptr inbounds %struct.Points, %struct.Points* %225, i32 0, i32 2, !dbg !2022
  %226 = load %struct.Point*, %struct.Point** %p250, align 8, !dbg !2022
  %227 = load i32, i32* %i246, align 4, !dbg !2023
  %idxprom251 = sext i32 %227 to i64, !dbg !2021
  %arrayidx252 = getelementptr inbounds %struct.Point, %struct.Point* %226, i64 %idxprom251, !dbg !2021
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx252, i32 0, i32 2, !dbg !2024
  %228 = load i64, i64* %assign, align 8, !dbg !2024
  %arrayidx253 = getelementptr inbounds i32, i32* %224, i64 %228, !dbg !2020
  %229 = load i32, i32* %arrayidx253, align 4, !dbg !2020
  %idxprom254 = sext i32 %229 to i64, !dbg !2019
  %arrayidx255 = getelementptr inbounds float, float* %223, i64 %idxprom254, !dbg !2019
  %230 = load float, float* %arrayidx255, align 4, !dbg !2019
  %cmp256 = fcmp ogt float %230, 0.000000e+00, !dbg !2025
  %frombool257 = zext i1 %cmp256 to i8, !dbg !2018
  store i8 %frombool257, i8* %close_center, align 1, !dbg !2018
  %231 = load i8*, i8** %switch_membership.addr, align 8, !dbg !2026
  %232 = load i32, i32* %i246, align 4, !dbg !2028
  %idxprom258 = sext i32 %232 to i64, !dbg !2026
  %arrayidx259 = getelementptr inbounds i8, i8* %231, i64 %idxprom258, !dbg !2026
  %233 = load i8, i8* %arrayidx259, align 1, !dbg !2026
  %tobool260 = trunc i8 %233 to i1, !dbg !2026
  br i1 %tobool260, label %if.then263, label %lor.lhs.false261, !dbg !2029

lor.lhs.false261:                                 ; preds = %for.body249
  %234 = load i8, i8* %close_center, align 1, !dbg !2030
  %tobool262 = trunc i8 %234 to i1, !dbg !2030
  br i1 %tobool262, label %if.then263, label %if.end283, !dbg !2032

if.then263:                                       ; preds = %lor.lhs.false261, %for.body249
  %235 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2033
  %p265 = getelementptr inbounds %struct.Points, %struct.Points* %235, i32 0, i32 2, !dbg !2035
  %236 = load %struct.Point*, %struct.Point** %p265, align 8, !dbg !2035
  %237 = load i32, i32* %i246, align 4, !dbg !2036
  %idxprom266 = sext i32 %237 to i64, !dbg !2033
  %arrayidx267 = getelementptr inbounds %struct.Point, %struct.Point* %236, i64 %idxprom266, !dbg !2033
  %238 = bitcast %struct.Point* %agg.tmp264 to i8*, !dbg !2033
  %239 = bitcast %struct.Point* %arrayidx267 to i8*, !dbg !2033
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %238, i8* %239, i64 32, i32 8, i1 false), !dbg !2033
  %240 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2037
  %p269 = getelementptr inbounds %struct.Points, %struct.Points* %240, i32 0, i32 2, !dbg !2038
  %241 = load %struct.Point*, %struct.Point** %p269, align 8, !dbg !2038
  %242 = load i64, i64* %x.addr, align 8, !dbg !2039
  %arrayidx270 = getelementptr inbounds %struct.Point, %struct.Point* %241, i64 %242, !dbg !2037
  %243 = bitcast %struct.Point* %agg.tmp268 to i8*, !dbg !2037
  %244 = bitcast %struct.Point* %arrayidx270 to i8*, !dbg !2037
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %243, i8* %244, i64 32, i32 8, i1 false), !dbg !2037
  %245 = load i32, i32* %dim, align 4, !dbg !2040
  %call271 = call float @_Z4dist5PointS_i(%struct.Point* byval align 8 %agg.tmp264, %struct.Point* byval align 8 %agg.tmp268, i32 %245), !dbg !2041
  %246 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2042
  %p272 = getelementptr inbounds %struct.Points, %struct.Points* %246, i32 0, i32 2, !dbg !2043
  %247 = load %struct.Point*, %struct.Point** %p272, align 8, !dbg !2043
  %248 = load i32, i32* %i246, align 4, !dbg !2044
  %idxprom273 = sext i32 %248 to i64, !dbg !2042
  %arrayidx274 = getelementptr inbounds %struct.Point, %struct.Point* %247, i64 %idxprom273, !dbg !2042
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx274, i32 0, i32 0, !dbg !2045
  %249 = load float, float* %weight, align 8, !dbg !2045
  %mul275 = fmul float %call271, %249, !dbg !2046
  %250 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2047
  %p276 = getelementptr inbounds %struct.Points, %struct.Points* %250, i32 0, i32 2, !dbg !2048
  %251 = load %struct.Point*, %struct.Point** %p276, align 8, !dbg !2048
  %252 = load i32, i32* %i246, align 4, !dbg !2049
  %idxprom277 = sext i32 %252 to i64, !dbg !2047
  %arrayidx278 = getelementptr inbounds %struct.Point, %struct.Point* %251, i64 %idxprom277, !dbg !2047
  %cost = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx278, i32 0, i32 3, !dbg !2050
  store float %mul275, float* %cost, align 8, !dbg !2051
  %253 = load i64, i64* %x.addr, align 8, !dbg !2052
  %254 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !2053
  %p279 = getelementptr inbounds %struct.Points, %struct.Points* %254, i32 0, i32 2, !dbg !2054
  %255 = load %struct.Point*, %struct.Point** %p279, align 8, !dbg !2054
  %256 = load i32, i32* %i246, align 4, !dbg !2055
  %idxprom280 = sext i32 %256 to i64, !dbg !2053
  %arrayidx281 = getelementptr inbounds %struct.Point, %struct.Point* %255, i64 %idxprom280, !dbg !2053
  %assign282 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx281, i32 0, i32 2, !dbg !2056
  store i64 %253, i64* %assign282, align 8, !dbg !2057
  br label %if.end283, !dbg !2058

if.end283:                                        ; preds = %if.then263, %lor.lhs.false261
  br label %for.inc284, !dbg !2059

for.inc284:                                       ; preds = %if.end283
  %257 = load i32, i32* %i246, align 4, !dbg !2060
  %inc285 = add nsw i32 %257, 1, !dbg !2060
  store i32 %inc285, i32* %i246, align 4, !dbg !2060
  br label %for.cond247, !dbg !2062, !llvm.loop !2063

for.end286:                                       ; preds = %for.cond247
  call void @llvm.dbg.declare(metadata i32* %i287, metadata !2065, metadata !1230), !dbg !2067
  store i32 0, i32* %i287, align 4, !dbg !2067
  br label %for.cond288, !dbg !2068

for.cond288:                                      ; preds = %for.inc303, %for.end286
  %258 = load i32, i32* %i287, align 4, !dbg !2069
  %259 = load i32, i32* %num, align 4, !dbg !2072
  %cmp289 = icmp slt i32 %258, %259, !dbg !2073
  br i1 %cmp289, label %for.body290, label %for.end305, !dbg !2074

for.body290:                                      ; preds = %for.cond288
  %260 = load i8*, i8** %is_center.addr, align 8, !dbg !2075
  %261 = load i32, i32* %i287, align 4, !dbg !2078
  %idxprom291 = sext i32 %261 to i64, !dbg !2075
  %arrayidx292 = getelementptr inbounds i8, i8* %260, i64 %idxprom291, !dbg !2075
  %262 = load i8, i8* %arrayidx292, align 1, !dbg !2075
  %tobool293 = trunc i8 %262 to i1, !dbg !2075
  br i1 %tobool293, label %land.lhs.true, label %if.end302, !dbg !2079

land.lhs.true:                                    ; preds = %for.body290
  %263 = load float*, float** %gl_lower, align 8, !dbg !2080
  %264 = load i32*, i32** %center_table.addr, align 8, !dbg !2082
  %265 = load i32, i32* %i287, align 4, !dbg !2083
  %idxprom294 = sext i32 %265 to i64, !dbg !2082
  %arrayidx295 = getelementptr inbounds i32, i32* %264, i64 %idxprom294, !dbg !2082
  %266 = load i32, i32* %arrayidx295, align 4, !dbg !2082
  %idxprom296 = sext i32 %266 to i64, !dbg !2080
  %arrayidx297 = getelementptr inbounds float, float* %263, i64 %idxprom296, !dbg !2080
  %267 = load float, float* %arrayidx297, align 4, !dbg !2080
  %cmp298 = fcmp ogt float %267, 0.000000e+00, !dbg !2084
  br i1 %cmp298, label %if.then299, label %if.end302, !dbg !2085

if.then299:                                       ; preds = %land.lhs.true
  %268 = load i8*, i8** %is_center.addr, align 8, !dbg !2086
  %269 = load i32, i32* %i287, align 4, !dbg !2088
  %idxprom300 = sext i32 %269 to i64, !dbg !2086
  %arrayidx301 = getelementptr inbounds i8, i8* %268, i64 %idxprom300, !dbg !2086
  store i8 0, i8* %arrayidx301, align 1, !dbg !2089
  br label %if.end302, !dbg !2090

if.end302:                                        ; preds = %if.then299, %land.lhs.true, %for.body290
  br label %for.inc303, !dbg !2091

for.inc303:                                       ; preds = %if.end302
  %270 = load i32, i32* %i287, align 4, !dbg !2092
  %inc304 = add nsw i32 %270, 1, !dbg !2092
  store i32 %inc304, i32* %i287, align 4, !dbg !2092
  br label %for.cond288, !dbg !2094, !llvm.loop !2095

for.end305:                                       ; preds = %for.cond288
  %271 = load i64, i64* %x.addr, align 8, !dbg !2097
  %cmp306 = icmp sge i64 %271, 0, !dbg !2099
  br i1 %cmp306, label %land.lhs.true307, label %if.end312, !dbg !2100

land.lhs.true307:                                 ; preds = %for.end305
  %272 = load i64, i64* %x.addr, align 8, !dbg !2101
  %273 = load i32, i32* %num, align 4, !dbg !2103
  %conv308 = sext i32 %273 to i64, !dbg !2103
  %cmp309 = icmp slt i64 %272, %conv308, !dbg !2104
  br i1 %cmp309, label %if.then310, label %if.end312, !dbg !2105

if.then310:                                       ; preds = %land.lhs.true307
  %274 = load i8*, i8** %is_center.addr, align 8, !dbg !2106
  %275 = load i64, i64* %x.addr, align 8, !dbg !2108
  %arrayidx311 = getelementptr inbounds i8, i8* %274, i64 %275, !dbg !2106
  store i8 1, i8* %arrayidx311, align 1, !dbg !2109
  br label %if.end312, !dbg !2110

if.end312:                                        ; preds = %if.then310, %land.lhs.true307, %for.end305
  %276 = load i64*, i64** %numcenters.addr, align 8, !dbg !2111
  %277 = load i64, i64* %276, align 8, !dbg !2112
  %add313 = add nsw i64 %277, 1, !dbg !2113
  %278 = load i32, i32* %number_of_centers_to_close, align 4, !dbg !2114
  %conv314 = sext i32 %278 to i64, !dbg !2114
  %sub315 = sub nsw i64 %add313, %conv314, !dbg !2115
  %279 = load i64*, i64** %numcenters.addr, align 8, !dbg !2116
  store i64 %sub315, i64* %279, align 8, !dbg !2117
  br label %if.end316, !dbg !2118

if.else:                                          ; preds = %for.end243
  store float 0.000000e+00, float* %gl_cost_of_opening_x, align 4, !dbg !2119
  br label %if.end316

if.end316:                                        ; preds = %if.else, %if.end312
  %280 = load float*, float** @work_mem_h, align 8, !dbg !2121
  %281 = bitcast float* %280 to i8*, !dbg !2121
  call void @free(i8* %281) #2, !dbg !2122
  %282 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !2123
  %call317 = call i32 @cudaEventRecord(%struct.CUevent_st* %282, %struct.CUstream_st* null), !dbg !2124
  %283 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !2125
  %call318 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %283), !dbg !2126
  %284 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !2127
  %285 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !2128
  %call319 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %284, %struct.CUevent_st* %285), !dbg !2129
  %286 = load float, float* %tmp_t, align 4, !dbg !2130
  %conv320 = fpext float %286 to double, !dbg !2130
  %287 = load double*, double** %serial_t.addr, align 8, !dbg !2131
  %288 = load double, double* %287, align 8, !dbg !2132
  %add321 = fadd double %288, %conv320, !dbg !2132
  store double %add321, double* %287, align 8, !dbg !2132
  %289 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !2133
  %call322 = call i32 @cudaEventRecord(%struct.CUevent_st* %289, %struct.CUstream_st* null), !dbg !2134
  br label %do.body323, !dbg !2135, !llvm.loop !2136

do.body323:                                       ; preds = %if.end316
  call void @llvm.dbg.declare(metadata i32* %err324, metadata !2137, metadata !1230), !dbg !2139
  %290 = load float*, float** @work_mem_d, align 8, !dbg !2140
  %291 = bitcast float* %290 to i8*, !dbg !2140
  %call325 = call i32 @cudaFree(i8* %291), !dbg !2140
  store i32 %call325, i32* %err324, align 4, !dbg !2140
  %292 = load i32, i32* %err324, align 4, !dbg !2140
  %cmp326 = icmp ne i32 0, %292, !dbg !2140
  br i1 %cmp326, label %if.then327, label %if.end330, !dbg !2140

if.then327:                                       ; preds = %do.body323
  %293 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2142
  %294 = load i32, i32* %err324, align 4, !dbg !2142
  %call328 = call i8* @cudaGetErrorString(i32 %294), !dbg !2142
  %call329 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %293, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 369, i8* %call328), !dbg !2146
  call void @exit(i32 1) #8, !dbg !2148
  unreachable, !dbg !2142

if.end330:                                        ; preds = %do.body323
  br label %do.end331, !dbg !2150

do.end331:                                        ; preds = %if.end330
  %295 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !2152
  %call332 = call i32 @cudaEventRecord(%struct.CUevent_st* %295, %struct.CUstream_st* null), !dbg !2153
  %296 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !2154
  %call333 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %296), !dbg !2155
  %297 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !2156
  %298 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !2157
  %call334 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %297, %struct.CUevent_st* %298), !dbg !2158
  %299 = load float, float* %tmp_t, align 4, !dbg !2159
  %conv335 = fpext float %299 to double, !dbg !2159
  %300 = load double*, double** %free_t.addr, align 8, !dbg !2160
  %301 = load double, double* %300, align 8, !dbg !2161
  %add336 = fadd double %301, %conv335, !dbg !2161
  store double %add336, double* %300, align 8, !dbg !2161
  %302 = load i32, i32* @_ZL4iter, align 4, !dbg !2162
  %inc337 = add nsw i32 %302, 1, !dbg !2162
  store i32 %inc337, i32* @_ZL4iter, align 4, !dbg !2162
  %303 = load float, float* %gl_cost_of_opening_x, align 4, !dbg !2163
  %sub338 = fsub float -0.000000e+00, %303, !dbg !2164
  ret float %sub338, !dbg !2165
}

declare i32 @cudaEventCreate(%struct.CUevent_st**) #1

declare i32 @cudaEventRecord(%struct.CUevent_st*, %struct.CUstream_st*) #1

declare i32 @cudaEventSynchronize(%struct.CUevent_st*) #1

declare i32 @cudaEventElapsedTime(float*, %struct.CUevent_st*, %struct.CUevent_st*) #1

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #1

declare i32 @cudaMemset(i8*, i32, i64) #1

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #5 comdat align 2 !dbg !2166 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !2167, metadata !1230), !dbg !2169
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !2170, metadata !1230), !dbg !2171
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !2172, metadata !1230), !dbg !2173
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !2174, metadata !1230), !dbg !2175
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !2176
  %0 = load i32, i32* %vx.addr, align 4, !dbg !2177
  store i32 %0, i32* %x, align 4, !dbg !2176
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !2178
  %1 = load i32, i32* %vy.addr, align 4, !dbg !2179
  store i32 %1, i32* %y, align 4, !dbg !2178
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !2180
  %2 = load i32, i32* %vz.addr, align 4, !dbg !2181
  store i32 %2, i32* %z, align 4, !dbg !2180
  ret void, !dbg !2182
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #7

declare i32 @cudaThreadSynchronize() #1

declare i32 @cudaGetLastError() #1

declare i32 @printf(i8*, ...) #1

declare float @_Z4dist5PointS_i(%struct.Point* byval align 8, %struct.Point* byval align 8, i32) #1

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_streamcluster_cuda.cu() #0 section ".text.startup" !dbg !2183 {
entry:
  call void @__cxx_global_var_init(), !dbg !2185
  ret void
}

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!20}
!llvm.module.flags = !{!1218, !1219}
!llvm.ident = !{!1220}

!0 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !1, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!1 = !DINamespace(name: "std", scope: null, file: !2, line: 188)
!2 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
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
!19 = distinct !DIGlobalVariable(name: "work_mem_h", scope: !20, file: !21, line: 32, type: !117, isLocal: false, isDefinition: true)
!20 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !21, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !22, retainedTypes: !114, globals: !120, imports: !140)
!21 = !DIFile(filename: "streamcluster_cuda.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!22 = !{!23, !107}
!23 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !24, line: 156, size: 32, align: 32, elements: !25, identifier: "_ZTS9cudaError")
!24 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!25 = !{!26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106}
!26 = !DIEnumerator(name: "cudaSuccess", value: 0)
!27 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 1)
!28 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2)
!29 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3)
!30 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 4)
!31 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 5)
!32 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 6)
!33 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 7)
!34 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 8)
!35 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9)
!36 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 10)
!37 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 11)
!38 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12)
!39 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13)
!40 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 14)
!41 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 15)
!42 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16)
!43 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17)
!44 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18)
!45 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19)
!46 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20)
!47 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21)
!48 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22)
!49 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23)
!50 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24)
!51 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25)
!52 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26)
!53 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27)
!54 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28)
!55 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 29)
!56 = !DIEnumerator(name: "cudaErrorUnknown", value: 30)
!57 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31)
!58 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32)
!59 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 33)
!60 = !DIEnumerator(name: "cudaErrorNotReady", value: 34)
!61 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35)
!62 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 36)
!63 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37)
!64 = !DIEnumerator(name: "cudaErrorNoDevice", value: 38)
!65 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 39)
!66 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 40)
!67 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 41)
!68 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 42)
!69 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43)
!70 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44)
!71 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45)
!72 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46)
!73 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 47)
!74 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 48)
!75 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49)
!76 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 50)
!77 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 51)
!78 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 54)
!79 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 55)
!80 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 56)
!81 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 57)
!82 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 58)
!83 = !DIEnumerator(name: "cudaErrorAssert", value: 59)
!84 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 60)
!85 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 61)
!86 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 62)
!87 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 63)
!88 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 64)
!89 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65)
!90 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66)
!91 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67)
!92 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68)
!93 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69)
!94 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 70)
!95 = !DIEnumerator(name: "cudaErrorNotSupported", value: 71)
!96 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 72)
!97 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 73)
!98 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 74)
!99 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 75)
!100 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 76)
!101 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 77)
!102 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 78)
!103 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 79)
!104 = !DIEnumerator(name: "cudaErrorNvlinkUncorrectable", value: 80)
!105 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127)
!106 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000)
!107 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !24, line: 807, size: 32, align: 32, elements: !108, identifier: "_ZTS14cudaMemcpyKind")
!108 = !{!109, !110, !111, !112, !113}
!109 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!110 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!111 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!112 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!113 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!114 = !{!115, !117, !119, !116, !11, !118}
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64, align: 64)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !118, size: 64, align: 64)
!118 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!119 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!120 = !{!0, !19, !121, !122, !123, !124, !126, !128, !139}
!121 = distinct !DIGlobalVariable(name: "coord_h", scope: !20, file: !21, line: 33, type: !117, isLocal: false, isDefinition: true)
!122 = distinct !DIGlobalVariable(name: "work_mem_d", scope: !20, file: !21, line: 36, type: !117, isLocal: false, isDefinition: true)
!123 = distinct !DIGlobalVariable(name: "coord_d", scope: !20, file: !21, line: 37, type: !117, isLocal: false, isDefinition: true)
!124 = distinct !DIGlobalVariable(name: "center_table_d", scope: !20, file: !21, line: 38, type: !125, isLocal: false, isDefinition: true)
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!126 = distinct !DIGlobalVariable(name: "switch_membership_d", scope: !20, file: !21, line: 39, type: !127, isLocal: false, isDefinition: true)
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!128 = distinct !DIGlobalVariable(name: "p", scope: !20, file: !21, line: 40, type: !129, isLocal: false, isDefinition: true)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64, align: 64)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "Point", file: !131, line: 44, baseType: !132)
!131 = !DIFile(filename: "./streamcluster_header.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!132 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !131, line: 39, size: 256, align: 64, elements: !133, identifier: "_ZTS5Point")
!133 = !{!134, !135, !136, !138}
!134 = !DIDerivedType(tag: DW_TAG_member, name: "weight", scope: !132, file: !131, line: 40, baseType: !118, size: 32, align: 32)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "coord", scope: !132, file: !131, line: 41, baseType: !117, size: 64, align: 64, offset: 64)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "assign", scope: !132, file: !131, line: 42, baseType: !137, size: 64, align: 64, offset: 128)
!137 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "cost", scope: !132, file: !131, line: 43, baseType: !118, size: 32, align: 32, offset: 192)
!139 = distinct !DIGlobalVariable(name: "iter", linkageName: "_ZL4iter", scope: !20, file: !21, line: 42, type: !11, isLocal: true, isDefinition: true)
!140 = !{!141, !146, !150, !152, !154, !156, !158, !162, !164, !166, !168, !170, !172, !174, !176, !178, !180, !182, !184, !186, !188, !190, !194, !196, !198, !200, !204, !208, !210, !212, !216, !220, !222, !224, !226, !228, !230, !232, !234, !236, !240, !244, !246, !248, !252, !254, !256, !258, !260, !262, !266, !268, !270, !274, !281, !285, !287, !289, !293, !295, !297, !301, !303, !305, !309, !311, !313, !315, !317, !319, !321, !323, !325, !327, !332, !334, !336, !340, !342, !344, !346, !348, !350, !352, !354, !358, !362, !364, !366, !371, !373, !375, !377, !379, !381, !383, !387, !393, !397, !401, !406, !408, !412, !416, !429, !433, !437, !441, !445, !450, !452, !456, !460, !464, !472, !476, !480, !484, !488, !493, !499, !503, !507, !509, !517, !521, !529, !531, !533, !537, !541, !545, !550, !554, !559, !560, !561, !562, !565, !566, !567, !568, !569, !570, !571, !574, !576, !578, !580, !582, !584, !586, !588, !591, !593, !595, !597, !599, !601, !603, !605, !607, !609, !611, !613, !615, !617, !619, !621, !623, !625, !627, !629, !631, !633, !635, !637, !639, !641, !643, !645, !647, !649, !651, !653, !655, !659, !660, !662, !664, !666, !668, !670, !672, !674, !676, !678, !680, !682, !684, !686, !688, !703, !705, !709, !718, !723, !727, !731, !735, !739, !741, !743, !747, !753, !757, !763, !769, !771, !775, !779, !783, !787, !798, !800, !804, !808, !812, !814, !818, !822, !826, !828, !830, !834, !842, !846, !850, !854, !856, !862, !864, !870, !874, !878, !882, !886, !890, !894, !896, !898, !902, !906, !910, !912, !916, !920, !922, !924, !928, !932, !936, !940, !941, !942, !943, !947, !950, !954, !959, !962, !964, !966, !968, !970, !972, !974, !976, !978, !980, !982, !984, !986, !988, !990, !997, !999, !1000, !1002, !1004, !1006, !1008, !1012, !1014, !1016, !1018, !1020, !1022, !1024, !1026, !1028, !1032, !1036, !1038, !1042, !1046, !1048, !1053, !1058, !1062, !1064, !1066, !1068, !1070, !1077, !1081, !1085, !1089, !1093, !1097, !1102, !1106, !1108, !1112, !1118, !1122, !1127, !1129, !1131, !1135, !1139, !1143, !1145, !1147, !1149, !1151, !1155, !1157, !1159, !1163, !1167, !1171, !1175, !1179, !1181, !1183, !1187, !1191, !1195, !1199, !1201, !1203, !1207, !1211, !1212, !1213, !1214, !1215, !1216, !1217}
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !142, line: 189)
!142 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !2, file: !2, line: 44, type: !143, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DISubroutineType(types: !144)
!144 = !{!145, !145}
!145 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !147, line: 190)
!147 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !2, file: !2, line: 46, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!148 = !DISubroutineType(types: !149)
!149 = !{!118, !118}
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !151, line: 191)
!151 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !2, file: !2, line: 48, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !153, line: 192)
!153 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !2, file: !2, line: 50, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !155, line: 193)
!155 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !2, file: !2, line: 52, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !157, line: 194)
!157 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !2, file: !2, line: 56, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !159, line: 195)
!159 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !2, file: !2, line: 54, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DISubroutineType(types: !161)
!161 = !{!118, !118, !118}
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !163, line: 196)
!163 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !2, file: !2, line: 58, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !165, line: 197)
!165 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !2, file: !2, line: 60, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !167, line: 198)
!167 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !2, file: !2, line: 62, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !169, line: 199)
!169 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !2, file: !2, line: 64, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !171, line: 200)
!171 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !2, file: !2, line: 66, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !173, line: 201)
!173 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !2, file: !2, line: 68, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !175, line: 202)
!175 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !2, file: !2, line: 72, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !177, line: 203)
!177 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !2, file: !2, line: 70, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !179, line: 204)
!179 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !2, file: !2, line: 76, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !181, line: 205)
!181 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !2, file: !2, line: 74, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !183, line: 206)
!183 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !2, file: !2, line: 78, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !185, line: 207)
!185 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !2, file: !2, line: 80, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !187, line: 208)
!187 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !2, file: !2, line: 82, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !189, line: 209)
!189 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !2, file: !2, line: 84, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !191, line: 210)
!191 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !2, file: !2, line: 86, type: !192, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DISubroutineType(types: !193)
!193 = !{!118, !118, !118, !118}
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !195, line: 211)
!195 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !2, file: !2, line: 88, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !197, line: 212)
!197 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !2, file: !2, line: 90, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !199, line: 213)
!199 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !2, file: !2, line: 92, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !201, line: 214)
!201 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !2, file: !2, line: 94, type: !202, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DISubroutineType(types: !203)
!203 = !{!11, !118}
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !205, line: 215)
!205 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !2, file: !2, line: 96, type: !206, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DISubroutineType(types: !207)
!207 = !{!118, !118, !125}
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !209, line: 216)
!209 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !2, file: !2, line: 98, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !211, line: 217)
!211 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !2, file: !2, line: 100, type: !202, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !213, line: 218)
!213 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !2, file: !2, line: 102, type: !214, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DISubroutineType(types: !215)
!215 = !{!13, !118}
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !217, line: 219)
!217 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !2, file: !2, line: 106, type: !218, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!218 = !DISubroutineType(types: !219)
!219 = !{!13, !118, !118}
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !221, line: 220)
!221 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !2, file: !2, line: 105, type: !218, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !223, line: 221)
!223 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !2, file: !2, line: 108, type: !214, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !225, line: 222)
!225 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !2, file: !2, line: 112, type: !218, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !227, line: 223)
!227 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !2, file: !2, line: 111, type: !218, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !229, line: 224)
!229 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !2, file: !2, line: 114, type: !218, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !231, line: 225)
!231 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !2, file: !2, line: 116, type: !214, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !233, line: 226)
!233 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !2, file: !2, line: 118, type: !214, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !235, line: 227)
!235 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !2, file: !2, line: 120, type: !218, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !237, line: 228)
!237 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !2, file: !2, line: 121, type: !238, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DISubroutineType(types: !239)
!239 = !{!137, !137}
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !241, line: 229)
!241 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !2, file: !2, line: 123, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DISubroutineType(types: !243)
!243 = !{!118, !118, !11}
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !245, line: 230)
!245 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !2, file: !2, line: 125, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !247, line: 231)
!247 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !2, file: !2, line: 126, type: !143, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !249, line: 232)
!249 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !2, file: !2, line: 128, type: !250, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DISubroutineType(types: !251)
!251 = !{!145, !118}
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !253, line: 233)
!253 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !2, file: !2, line: 138, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !255, line: 234)
!255 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !2, file: !2, line: 130, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !257, line: 235)
!257 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !2, file: !2, line: 132, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !259, line: 236)
!259 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !2, file: !2, line: 134, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !261, line: 237)
!261 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !2, file: !2, line: 136, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !263, line: 238)
!263 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !2, file: !2, line: 140, type: !264, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DISubroutineType(types: !265)
!265 = !{!137, !118}
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !267, line: 239)
!267 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !2, file: !2, line: 142, type: !264, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !269, line: 240)
!269 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !2, file: !2, line: 143, type: !250, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !271, line: 241)
!271 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !2, file: !2, line: 145, type: !272, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!272 = !DISubroutineType(types: !273)
!273 = !{!118, !118, !117}
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !275, line: 242)
!275 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !2, file: !2, line: 146, type: !276, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!276 = !DISubroutineType(types: !277)
!277 = !{!119, !278}
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !279, size: 64, align: 64)
!279 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !280)
!280 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !282, line: 243)
!282 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !2, file: !2, line: 147, type: !283, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!283 = !DISubroutineType(types: !284)
!284 = !{!118, !278}
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !286, line: 244)
!286 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !2, file: !2, line: 149, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !288, line: 245)
!288 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !2, file: !2, line: 151, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !290, line: 246)
!290 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !2, file: !2, line: 153, type: !291, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DISubroutineType(types: !292)
!292 = !{!118, !118, !119}
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !294, line: 247)
!294 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !2, file: !2, line: 158, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !296, line: 248)
!296 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !2, file: !2, line: 160, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !298, line: 249)
!298 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !2, file: !2, line: 162, type: !299, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DISubroutineType(types: !300)
!300 = !{!118, !118, !118, !125}
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !302, line: 250)
!302 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !2, file: !2, line: 164, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !304, line: 251)
!304 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !2, file: !2, line: 166, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !306, line: 252)
!306 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !2, file: !2, line: 168, type: !307, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!307 = !DISubroutineType(types: !308)
!308 = !{!118, !118, !137}
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !310, line: 253)
!310 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !2, file: !2, line: 170, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !312, line: 254)
!312 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !2, file: !2, line: 172, type: !214, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !314, line: 255)
!314 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !2, file: !2, line: 174, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !316, line: 256)
!316 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !2, file: !2, line: 176, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !318, line: 257)
!318 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !2, file: !2, line: 178, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !320, line: 258)
!320 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !2, file: !2, line: 180, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !322, line: 259)
!322 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !2, file: !2, line: 182, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !324, line: 260)
!324 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !2, file: !2, line: 184, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !326, line: 261)
!326 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !2, file: !2, line: 186, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !328, line: 102)
!328 = !DISubprogram(name: "acos", scope: !329, file: !329, line: 54, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!329 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!330 = !DISubroutineType(types: !331)
!331 = !{!119, !119}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !333, line: 121)
!333 = !DISubprogram(name: "asin", scope: !329, file: !329, line: 56, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !335, line: 140)
!335 = !DISubprogram(name: "atan", scope: !329, file: !329, line: 58, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !337, line: 159)
!337 = !DISubprogram(name: "atan2", scope: !329, file: !329, line: 60, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !DISubroutineType(types: !339)
!339 = !{!119, !119, !119}
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !341, line: 180)
!341 = !DISubprogram(name: "ceil", scope: !329, file: !329, line: 178, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !343, line: 199)
!343 = !DISubprogram(name: "cos", scope: !329, file: !329, line: 63, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !345, line: 218)
!345 = !DISubprogram(name: "cosh", scope: !329, file: !329, line: 72, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !347, line: 237)
!347 = !DISubprogram(name: "exp", scope: !329, file: !329, line: 100, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !349, line: 256)
!349 = !DISubprogram(name: "fabs", scope: !329, file: !329, line: 181, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !351, line: 275)
!351 = !DISubprogram(name: "floor", scope: !329, file: !329, line: 184, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !353, line: 294)
!353 = !DISubprogram(name: "fmod", scope: !329, file: !329, line: 187, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !355, line: 315)
!355 = !DISubprogram(name: "frexp", scope: !329, file: !329, line: 103, type: !356, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !DISubroutineType(types: !357)
!357 = !{!119, !119, !125}
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !359, line: 334)
!359 = !DISubprogram(name: "ldexp", scope: !329, file: !329, line: 106, type: !360, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DISubroutineType(types: !361)
!361 = !{!119, !119, !11}
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !363, line: 353)
!363 = !DISubprogram(name: "log", scope: !329, file: !329, line: 109, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !365, line: 372)
!365 = !DISubprogram(name: "log10", scope: !329, file: !329, line: 112, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !367, line: 391)
!367 = !DISubprogram(name: "modf", scope: !329, file: !329, line: 115, type: !368, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!368 = !DISubroutineType(types: !369)
!369 = !{!119, !119, !370}
!370 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64, align: 64)
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !372, line: 403)
!372 = !DISubprogram(name: "pow", scope: !329, file: !329, line: 153, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !374, line: 440)
!374 = !DISubprogram(name: "sin", scope: !329, file: !329, line: 65, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !376, line: 459)
!376 = !DISubprogram(name: "sinh", scope: !329, file: !329, line: 74, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !378, line: 478)
!378 = !DISubprogram(name: "sqrt", scope: !329, file: !329, line: 156, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !380, line: 497)
!380 = !DISubprogram(name: "tan", scope: !329, file: !329, line: 67, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !382, line: 516)
!382 = !DISubprogram(name: "tanh", scope: !329, file: !329, line: 76, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !384, line: 118)
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !385, line: 101, baseType: !386)
!385 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!386 = !DICompositeType(tag: DW_TAG_structure_type, file: !385, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !388, line: 119)
!388 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !385, line: 109, baseType: !389)
!389 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !385, line: 105, size: 128, align: 64, elements: !390, identifier: "_ZTS6ldiv_t")
!390 = !{!391, !392}
!391 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !389, file: !385, line: 107, baseType: !137, size: 64, align: 64)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !389, file: !385, line: 108, baseType: !137, size: 64, align: 64, offset: 64)
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !394, line: 121)
!394 = !DISubprogram(name: "abort", scope: !385, file: !385, line: 515, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!395 = !DISubroutineType(types: !396)
!396 = !{null}
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !398, line: 122)
!398 = !DISubprogram(name: "abs", scope: !385, file: !385, line: 774, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!399 = !DISubroutineType(types: !400)
!400 = !{!11, !11}
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !402, line: 123)
!402 = !DISubprogram(name: "atexit", scope: !385, file: !385, line: 519, type: !403, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!403 = !DISubroutineType(types: !404)
!404 = !{!11, !405}
!405 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !395, size: 64, align: 64)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !407, line: 129)
!407 = !DISubprogram(name: "atof", scope: !385, file: !385, line: 144, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !409, line: 130)
!409 = !DISubprogram(name: "atoi", scope: !385, file: !385, line: 147, type: !410, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!410 = !DISubroutineType(types: !411)
!411 = !{!11, !278}
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !413, line: 131)
!413 = !DISubprogram(name: "atol", scope: !385, file: !385, line: 150, type: !414, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!414 = !DISubroutineType(types: !415)
!415 = !{!137, !278}
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !417, line: 132)
!417 = !DISubprogram(name: "bsearch", scope: !385, file: !385, line: 754, type: !418, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!418 = !DISubroutineType(types: !419)
!419 = !{!116, !420, !420, !422, !422, !425}
!420 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !421, size: 64, align: 64)
!421 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !423, line: 62, baseType: !424)
!423 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!424 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!425 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !385, line: 741, baseType: !426)
!426 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !427, size: 64, align: 64)
!427 = !DISubroutineType(types: !428)
!428 = !{!11, !420, !420}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !430, line: 133)
!430 = !DISubprogram(name: "calloc", scope: !385, file: !385, line: 468, type: !431, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!431 = !DISubroutineType(types: !432)
!432 = !{!116, !422, !422}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !434, line: 134)
!434 = !DISubprogram(name: "div", scope: !385, file: !385, line: 788, type: !435, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!435 = !DISubroutineType(types: !436)
!436 = !{!384, !11, !11}
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !438, line: 135)
!438 = !DISubprogram(name: "exit", scope: !385, file: !385, line: 543, type: !439, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!439 = !DISubroutineType(types: !440)
!440 = !{null, !11}
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !442, line: 136)
!442 = !DISubprogram(name: "free", scope: !385, file: !385, line: 483, type: !443, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!443 = !DISubroutineType(types: !444)
!444 = !{null, !116}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !446, line: 137)
!446 = !DISubprogram(name: "getenv", scope: !385, file: !385, line: 564, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DISubroutineType(types: !448)
!448 = !{!449, !278}
!449 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64, align: 64)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !451, line: 138)
!451 = !DISubprogram(name: "labs", scope: !385, file: !385, line: 775, type: !238, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !453, line: 139)
!453 = !DISubprogram(name: "ldiv", scope: !385, file: !385, line: 790, type: !454, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!454 = !DISubroutineType(types: !455)
!455 = !{!388, !137, !137}
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !457, line: 140)
!457 = !DISubprogram(name: "malloc", scope: !385, file: !385, line: 466, type: !458, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!458 = !DISubroutineType(types: !459)
!459 = !{!116, !422}
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !461, line: 142)
!461 = !DISubprogram(name: "mblen", scope: !385, file: !385, line: 862, type: !462, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!462 = !DISubroutineType(types: !463)
!463 = !{!11, !278, !422}
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !465, line: 143)
!465 = !DISubprogram(name: "mbstowcs", scope: !385, file: !385, line: 873, type: !466, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!466 = !DISubroutineType(types: !467)
!467 = !{!422, !468, !471, !422}
!468 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !469)
!469 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !470, size: 64, align: 64)
!470 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!471 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !278)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !473, line: 144)
!473 = !DISubprogram(name: "mbtowc", scope: !385, file: !385, line: 865, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DISubroutineType(types: !475)
!475 = !{!11, !468, !471, !422}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !477, line: 146)
!477 = !DISubprogram(name: "qsort", scope: !385, file: !385, line: 764, type: !478, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DISubroutineType(types: !479)
!479 = !{null, !116, !422, !422, !425}
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !481, line: 152)
!481 = !DISubprogram(name: "rand", scope: !385, file: !385, line: 374, type: !482, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!482 = !DISubroutineType(types: !483)
!483 = !{!11}
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !485, line: 153)
!485 = !DISubprogram(name: "realloc", scope: !385, file: !385, line: 480, type: !486, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DISubroutineType(types: !487)
!487 = !{!116, !116, !422}
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !489, line: 154)
!489 = !DISubprogram(name: "srand", scope: !385, file: !385, line: 376, type: !490, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DISubroutineType(types: !491)
!491 = !{null, !492}
!492 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !494, line: 155)
!494 = !DISubprogram(name: "strtod", scope: !385, file: !385, line: 164, type: !495, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!495 = !DISubroutineType(types: !496)
!496 = !{!119, !471, !497}
!497 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !498)
!498 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !449, size: 64, align: 64)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !500, line: 156)
!500 = !DISubprogram(name: "strtol", scope: !385, file: !385, line: 183, type: !501, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!501 = !DISubroutineType(types: !502)
!502 = !{!137, !471, !497, !11}
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !504, line: 157)
!504 = !DISubprogram(name: "strtoul", scope: !385, file: !385, line: 187, type: !505, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!505 = !DISubroutineType(types: !506)
!506 = !{!424, !471, !497, !11}
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !508, line: 158)
!508 = !DISubprogram(name: "system", scope: !385, file: !385, line: 716, type: !410, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !510, line: 160)
!510 = !DISubprogram(name: "wcstombs", scope: !385, file: !385, line: 876, type: !511, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!511 = !DISubroutineType(types: !512)
!512 = !{!422, !513, !514, !422}
!513 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !449)
!514 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !515)
!515 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !516, size: 64, align: 64)
!516 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !470)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !518, line: 161)
!518 = !DISubprogram(name: "wctomb", scope: !385, file: !385, line: 869, type: !519, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!519 = !DISubroutineType(types: !520)
!520 = !{!11, !449, !470}
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !524, line: 214)
!522 = !DINamespace(name: "__gnu_cxx", scope: null, file: !523, line: 220)
!523 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!524 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !385, line: 121, baseType: !525)
!525 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !385, line: 117, size: 128, align: 64, elements: !526, identifier: "_ZTS7lldiv_t")
!526 = !{!527, !528}
!527 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !525, file: !385, line: 119, baseType: !145, size: 64, align: 64)
!528 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !525, file: !385, line: 120, baseType: !145, size: 64, align: 64, offset: 64)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !530, line: 220)
!530 = !DISubprogram(name: "_Exit", scope: !385, file: !385, line: 557, type: !439, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !532, line: 224)
!532 = !DISubprogram(name: "llabs", scope: !385, file: !385, line: 779, type: !143, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !534, line: 230)
!534 = !DISubprogram(name: "lldiv", scope: !385, file: !385, line: 796, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!535 = !DISubroutineType(types: !536)
!536 = !{!524, !145, !145}
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !538, line: 241)
!538 = !DISubprogram(name: "atoll", scope: !385, file: !385, line: 157, type: !539, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!539 = !DISubroutineType(types: !540)
!540 = !{!145, !278}
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !542, line: 242)
!542 = !DISubprogram(name: "strtoll", scope: !385, file: !385, line: 209, type: !543, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!543 = !DISubroutineType(types: !544)
!544 = !{!145, !471, !497, !11}
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !546, line: 243)
!546 = !DISubprogram(name: "strtoull", scope: !385, file: !385, line: 214, type: !547, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DISubroutineType(types: !548)
!548 = !{!549, !471, !497, !11}
!549 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !551, line: 245)
!551 = !DISubprogram(name: "strtof", scope: !385, file: !385, line: 172, type: !552, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!552 = !DISubroutineType(types: !553)
!553 = !{!118, !471, !497}
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !555, line: 246)
!555 = !DISubprogram(name: "strtold", scope: !385, file: !385, line: 175, type: !556, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!556 = !DISubroutineType(types: !557)
!557 = !{!558, !471, !497}
!558 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !524, line: 254)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !530, line: 256)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !532, line: 258)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !563, line: 259)
!563 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !522, file: !564, line: 227, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!564 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !534, line: 260)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !538, line: 262)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !551, line: 263)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !542, line: 264)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !546, line: 265)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !555, line: 266)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !572, line: 397)
!572 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !573, file: !573, line: 1342, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!573 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !575, line: 398)
!575 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !573, file: !573, line: 1370, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !577, line: 399)
!577 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !573, file: !573, line: 1337, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !579, line: 400)
!579 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !573, file: !573, line: 1375, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !581, line: 401)
!581 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !573, file: !573, line: 1327, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !583, line: 402)
!583 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !573, file: !573, line: 1332, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !585, line: 403)
!585 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !573, file: !573, line: 1380, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !587, line: 404)
!587 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !573, file: !573, line: 1430, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !589, line: 405)
!589 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !590, file: !590, line: 667, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!590 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !592, line: 406)
!592 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !573, file: !573, line: 1189, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !594, line: 407)
!594 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !573, file: !573, line: 1243, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !596, line: 408)
!596 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !573, file: !573, line: 1312, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !598, line: 409)
!598 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !573, file: !573, line: 1490, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !600, line: 410)
!600 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !573, file: !573, line: 1480, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !602, line: 411)
!602 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !590, file: !590, line: 657, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !604, line: 412)
!604 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !573, file: !573, line: 1294, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !606, line: 413)
!606 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !573, file: !573, line: 1385, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !608, line: 414)
!608 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !590, file: !590, line: 607, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !610, line: 415)
!610 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !573, file: !573, line: 1616, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !612, line: 416)
!612 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !590, file: !590, line: 597, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !614, line: 417)
!614 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !573, file: !573, line: 1568, type: !192, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !616, line: 418)
!616 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !590, file: !590, line: 622, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !618, line: 419)
!618 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !590, file: !590, line: 617, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !620, line: 420)
!620 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !573, file: !573, line: 1553, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !622, line: 421)
!622 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !573, file: !573, line: 1543, type: !206, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !624, line: 422)
!624 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !573, file: !573, line: 1390, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !626, line: 423)
!626 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !573, file: !573, line: 1621, type: !202, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !628, line: 424)
!628 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !573, file: !573, line: 1520, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !630, line: 425)
!630 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !573, file: !573, line: 1515, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !632, line: 426)
!632 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !573, file: !573, line: 1149, type: !250, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !634, line: 427)
!634 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !573, file: !573, line: 1602, type: !250, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !636, line: 428)
!636 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !573, file: !573, line: 1356, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !638, line: 429)
!638 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !573, file: !573, line: 1365, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !640, line: 430)
!640 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !573, file: !573, line: 1285, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !642, line: 431)
!642 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !573, file: !573, line: 1626, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !644, line: 432)
!644 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !573, file: !573, line: 1347, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !646, line: 433)
!646 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !573, file: !573, line: 1140, type: !264, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !648, line: 434)
!648 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !573, file: !573, line: 1607, type: !264, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !650, line: 435)
!650 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !573, file: !573, line: 1548, type: !272, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !652, line: 436)
!652 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !573, file: !573, line: 1154, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !654, line: 437)
!654 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !573, file: !573, line: 1218, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !656, line: 438)
!656 = !DISubprogram(name: "nexttowardf", scope: !329, file: !329, line: 294, type: !657, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!657 = !DISubroutineType(types: !658)
!658 = !{!118, !118, !558}
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !656, line: 439)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !661, line: 440)
!661 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !573, file: !573, line: 1583, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !663, line: 441)
!663 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !573, file: !573, line: 1558, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !665, line: 442)
!665 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !573, file: !573, line: 1563, type: !299, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !667, line: 443)
!667 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !573, file: !573, line: 1135, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !669, line: 444)
!669 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !573, file: !573, line: 1597, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !671, line: 445)
!671 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !573, file: !573, line: 1530, type: !307, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !673, line: 446)
!673 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !573, file: !573, line: 1525, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !675, line: 447)
!675 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !573, file: !573, line: 1234, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !677, line: 448)
!677 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !573, file: !573, line: 1317, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !679, line: 449)
!679 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !590, file: !590, line: 907, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !681, line: 450)
!681 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !573, file: !573, line: 1276, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !683, line: 451)
!683 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !573, file: !573, line: 1322, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !685, line: 452)
!685 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !573, file: !573, line: 1592, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !687, line: 453)
!687 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !590, file: !590, line: 662, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !689, line: 64)
!689 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !690, line: 106, baseType: !691)
!690 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!691 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !690, line: 94, baseType: !692)
!692 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !690, line: 82, size: 64, align: 32, elements: !693, identifier: "_ZTS11__mbstate_t")
!693 = !{!694, !695}
!694 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !692, file: !690, line: 84, baseType: !11, size: 32, align: 32)
!695 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !692, file: !690, line: 93, baseType: !696, size: 32, align: 32, offset: 32)
!696 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !692, file: !690, line: 85, size: 32, align: 32, elements: !697, identifier: "_ZTSN11__mbstate_tUt_E")
!697 = !{!698, !699}
!698 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !696, file: !690, line: 88, baseType: !492, size: 32, align: 32)
!699 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !696, file: !690, line: 92, baseType: !700, size: 32, align: 8)
!700 = !DICompositeType(tag: DW_TAG_array_type, baseType: !280, size: 32, align: 8, elements: !701)
!701 = !{!702}
!702 = !DISubrange(count: 4)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !704, line: 139)
!704 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !423, line: 132, baseType: !492)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !706, line: 141)
!706 = !DISubprogram(name: "btowc", scope: !690, file: !690, line: 356, type: !707, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!707 = !DISubroutineType(types: !708)
!708 = !{!704, !11}
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !710, line: 142)
!710 = !DISubprogram(name: "fgetwc", scope: !690, file: !690, line: 748, type: !711, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!711 = !DISubroutineType(types: !712)
!712 = !{!704, !713}
!713 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !714, size: 64, align: 64)
!714 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !715, line: 64, baseType: !716)
!715 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!716 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !717, line: 241, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!717 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !719, line: 143)
!719 = !DISubprogram(name: "fgetws", scope: !690, file: !690, line: 777, type: !720, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!720 = !DISubroutineType(types: !721)
!721 = !{!469, !468, !11, !722}
!722 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !713)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !724, line: 144)
!724 = !DISubprogram(name: "fputwc", scope: !690, file: !690, line: 762, type: !725, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!725 = !DISubroutineType(types: !726)
!726 = !{!704, !470, !713}
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !728, line: 145)
!728 = !DISubprogram(name: "fputws", scope: !690, file: !690, line: 784, type: !729, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!729 = !DISubroutineType(types: !730)
!730 = !{!11, !514, !722}
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !732, line: 146)
!732 = !DISubprogram(name: "fwide", scope: !690, file: !690, line: 590, type: !733, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!733 = !DISubroutineType(types: !734)
!734 = !{!11, !713, !11}
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !736, line: 147)
!736 = !DISubprogram(name: "fwprintf", scope: !690, file: !690, line: 597, type: !737, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!737 = !DISubroutineType(types: !738)
!738 = !{!11, !722, !514, null}
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !740, line: 148)
!740 = !DISubprogram(name: "fwscanf", scope: !690, file: !690, line: 638, type: !737, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !742, line: 149)
!742 = !DISubprogram(name: "getwc", scope: !690, file: !690, line: 749, type: !711, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !744, line: 150)
!744 = !DISubprogram(name: "getwchar", scope: !690, file: !690, line: 755, type: !745, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!745 = !DISubroutineType(types: !746)
!746 = !{!704}
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !748, line: 151)
!748 = !DISubprogram(name: "mbrlen", scope: !690, file: !690, line: 379, type: !749, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!749 = !DISubroutineType(types: !750)
!750 = !{!422, !471, !422, !751}
!751 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !752)
!752 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !689, size: 64, align: 64)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !754, line: 152)
!754 = !DISubprogram(name: "mbrtowc", scope: !690, file: !690, line: 368, type: !755, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!755 = !DISubroutineType(types: !756)
!756 = !{!422, !468, !471, !422, !751}
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !758, line: 153)
!758 = !DISubprogram(name: "mbsinit", scope: !690, file: !690, line: 364, type: !759, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!759 = !DISubroutineType(types: !760)
!760 = !{!11, !761}
!761 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !762, size: 64, align: 64)
!762 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !689)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !764, line: 154)
!764 = !DISubprogram(name: "mbsrtowcs", scope: !690, file: !690, line: 411, type: !765, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!765 = !DISubroutineType(types: !766)
!766 = !{!422, !468, !767, !422, !751}
!767 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !768)
!768 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !278, size: 64, align: 64)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !770, line: 155)
!770 = !DISubprogram(name: "putwc", scope: !690, file: !690, line: 763, type: !725, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !772, line: 156)
!772 = !DISubprogram(name: "putwchar", scope: !690, file: !690, line: 769, type: !773, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!773 = !DISubroutineType(types: !774)
!774 = !{!704, !470}
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !776, line: 158)
!776 = !DISubprogram(name: "swprintf", scope: !690, file: !690, line: 607, type: !777, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!777 = !DISubroutineType(types: !778)
!778 = !{!11, !468, !422, !514, null}
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !780, line: 160)
!780 = !DISubprogram(name: "swscanf", scope: !690, file: !690, line: 648, type: !781, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!781 = !DISubroutineType(types: !782)
!782 = !{!11, !514, !514, null}
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !784, line: 161)
!784 = !DISubprogram(name: "ungetwc", scope: !690, file: !690, line: 792, type: !785, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!785 = !DISubroutineType(types: !786)
!786 = !{!704, !704, !713}
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !788, line: 162)
!788 = !DISubprogram(name: "vfwprintf", scope: !690, file: !690, line: 615, type: !789, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!789 = !DISubroutineType(types: !790)
!790 = !{!11, !722, !514, !791}
!791 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !792, size: 64, align: 64)
!792 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !21, size: 192, align: 64, elements: !793, identifier: "_ZTS13__va_list_tag")
!793 = !{!794, !795, !796, !797}
!794 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !792, file: !21, baseType: !492, size: 32, align: 32)
!795 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !792, file: !21, baseType: !492, size: 32, align: 32, offset: 32)
!796 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !792, file: !21, baseType: !116, size: 64, align: 64, offset: 64)
!797 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !792, file: !21, baseType: !116, size: 64, align: 64, offset: 128)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !799, line: 164)
!799 = !DISubprogram(name: "vfwscanf", scope: !690, file: !690, line: 692, type: !789, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !801, line: 167)
!801 = !DISubprogram(name: "vswprintf", scope: !690, file: !690, line: 628, type: !802, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!802 = !DISubroutineType(types: !803)
!803 = !{!11, !468, !422, !514, !791}
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !805, line: 170)
!805 = !DISubprogram(name: "vswscanf", scope: !690, file: !690, line: 704, type: !806, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!806 = !DISubroutineType(types: !807)
!807 = !{!11, !514, !514, !791}
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !809, line: 172)
!809 = !DISubprogram(name: "vwprintf", scope: !690, file: !690, line: 623, type: !810, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!810 = !DISubroutineType(types: !811)
!811 = !{!11, !514, !791}
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !813, line: 174)
!813 = !DISubprogram(name: "vwscanf", scope: !690, file: !690, line: 700, type: !810, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !815, line: 176)
!815 = !DISubprogram(name: "wcrtomb", scope: !690, file: !690, line: 373, type: !816, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!816 = !DISubroutineType(types: !817)
!817 = !{!422, !513, !470, !751}
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !819, line: 177)
!819 = !DISubprogram(name: "wcscat", scope: !690, file: !690, line: 157, type: !820, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!820 = !DISubroutineType(types: !821)
!821 = !{!469, !468, !514}
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !823, line: 178)
!823 = !DISubprogram(name: "wcscmp", scope: !690, file: !690, line: 166, type: !824, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!824 = !DISubroutineType(types: !825)
!825 = !{!11, !515, !515}
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !827, line: 179)
!827 = !DISubprogram(name: "wcscoll", scope: !690, file: !690, line: 195, type: !824, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !829, line: 180)
!829 = !DISubprogram(name: "wcscpy", scope: !690, file: !690, line: 147, type: !820, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !831, line: 181)
!831 = !DISubprogram(name: "wcscspn", scope: !690, file: !690, line: 255, type: !832, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!832 = !DISubroutineType(types: !833)
!833 = !{!422, !515, !515}
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !835, line: 182)
!835 = !DISubprogram(name: "wcsftime", scope: !690, file: !690, line: 858, type: !836, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!836 = !DISubroutineType(types: !837)
!837 = !{!422, !468, !422, !514, !838}
!838 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !839)
!839 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !840, size: 64, align: 64)
!840 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !841)
!841 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !690, line: 137, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !843, line: 183)
!843 = !DISubprogram(name: "wcslen", scope: !690, file: !690, line: 290, type: !844, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!844 = !DISubroutineType(types: !845)
!845 = !{!422, !515}
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !847, line: 184)
!847 = !DISubprogram(name: "wcsncat", scope: !690, file: !690, line: 161, type: !848, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!848 = !DISubroutineType(types: !849)
!849 = !{!469, !468, !514, !422}
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !851, line: 185)
!851 = !DISubprogram(name: "wcsncmp", scope: !690, file: !690, line: 169, type: !852, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!852 = !DISubroutineType(types: !853)
!853 = !{!11, !515, !515, !422}
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !855, line: 186)
!855 = !DISubprogram(name: "wcsncpy", scope: !690, file: !690, line: 152, type: !848, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !857, line: 187)
!857 = !DISubprogram(name: "wcsrtombs", scope: !690, file: !690, line: 417, type: !858, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!858 = !DISubroutineType(types: !859)
!859 = !{!422, !513, !860, !422, !751}
!860 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !861)
!861 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !515, size: 64, align: 64)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !863, line: 188)
!863 = !DISubprogram(name: "wcsspn", scope: !690, file: !690, line: 259, type: !832, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !865, line: 189)
!865 = !DISubprogram(name: "wcstod", scope: !690, file: !690, line: 453, type: !866, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!866 = !DISubroutineType(types: !867)
!867 = !{!119, !514, !868}
!868 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !869)
!869 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !469, size: 64, align: 64)
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !871, line: 191)
!871 = !DISubprogram(name: "wcstof", scope: !690, file: !690, line: 460, type: !872, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!872 = !DISubroutineType(types: !873)
!873 = !{!118, !514, !868}
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !875, line: 193)
!875 = !DISubprogram(name: "wcstok", scope: !690, file: !690, line: 285, type: !876, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!876 = !DISubroutineType(types: !877)
!877 = !{!469, !468, !514, !868}
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !879, line: 194)
!879 = !DISubprogram(name: "wcstol", scope: !690, file: !690, line: 471, type: !880, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!880 = !DISubroutineType(types: !881)
!881 = !{!137, !514, !868, !11}
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !883, line: 195)
!883 = !DISubprogram(name: "wcstoul", scope: !690, file: !690, line: 476, type: !884, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!884 = !DISubroutineType(types: !885)
!885 = !{!424, !514, !868, !11}
!886 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !887, line: 196)
!887 = !DISubprogram(name: "wcsxfrm", scope: !690, file: !690, line: 199, type: !888, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!888 = !DISubroutineType(types: !889)
!889 = !{!422, !468, !514, !422}
!890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !891, line: 197)
!891 = !DISubprogram(name: "wctob", scope: !690, file: !690, line: 360, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!892 = !DISubroutineType(types: !893)
!893 = !{!11, !704}
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !895, line: 198)
!895 = !DISubprogram(name: "wmemcmp", scope: !690, file: !690, line: 328, type: !852, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !897, line: 199)
!897 = !DISubprogram(name: "wmemcpy", scope: !690, file: !690, line: 332, type: !848, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !899, line: 200)
!899 = !DISubprogram(name: "wmemmove", scope: !690, file: !690, line: 337, type: !900, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!900 = !DISubroutineType(types: !901)
!901 = !{!469, !469, !515, !422}
!902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !903, line: 201)
!903 = !DISubprogram(name: "wmemset", scope: !690, file: !690, line: 341, type: !904, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!904 = !DISubroutineType(types: !905)
!905 = !{!469, !469, !470, !422}
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !907, line: 202)
!907 = !DISubprogram(name: "wprintf", scope: !690, file: !690, line: 604, type: !908, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!908 = !DISubroutineType(types: !909)
!909 = !{!11, !514, null}
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !911, line: 203)
!911 = !DISubprogram(name: "wscanf", scope: !690, file: !690, line: 645, type: !908, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !913, line: 204)
!913 = !DISubprogram(name: "wcschr", scope: !690, file: !690, line: 230, type: !914, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!914 = !DISubroutineType(types: !915)
!915 = !{!469, !515, !470}
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !917, line: 205)
!917 = !DISubprogram(name: "wcspbrk", scope: !690, file: !690, line: 269, type: !918, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!918 = !DISubroutineType(types: !919)
!919 = !{!469, !515, !515}
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !921, line: 206)
!921 = !DISubprogram(name: "wcsrchr", scope: !690, file: !690, line: 240, type: !914, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !923, line: 207)
!923 = !DISubprogram(name: "wcsstr", scope: !690, file: !690, line: 280, type: !918, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !925, line: 208)
!925 = !DISubprogram(name: "wmemchr", scope: !690, file: !690, line: 323, type: !926, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!926 = !DISubroutineType(types: !927)
!927 = !{!469, !515, !470, !422}
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !929, line: 248)
!929 = !DISubprogram(name: "wcstold", scope: !690, file: !690, line: 462, type: !930, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!930 = !DISubroutineType(types: !931)
!931 = !{!558, !514, !868}
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !933, line: 257)
!933 = !DISubprogram(name: "wcstoll", scope: !690, file: !690, line: 486, type: !934, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!934 = !DISubroutineType(types: !935)
!935 = !{!145, !514, !868, !11}
!936 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !937, line: 258)
!937 = !DISubprogram(name: "wcstoull", scope: !690, file: !690, line: 493, type: !938, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!938 = !DISubroutineType(types: !939)
!939 = !{!549, !514, !868, !11}
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !929, line: 264)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !933, line: 265)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !937, line: 266)
!943 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !944, entity: !946, line: 56)
!944 = !DINamespace(name: "__gnu_debug", scope: null, file: !945, line: 54)
!945 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/debug/debug.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!946 = !DINamespace(name: "__debug", scope: !1, file: !945, line: 48)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !948, line: 53)
!948 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !949, line: 53, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!949 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !951, line: 54)
!951 = !DISubprogram(name: "setlocale", scope: !949, file: !949, line: 124, type: !952, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!952 = !DISubroutineType(types: !953)
!953 = !{!449, !11, !278}
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !955, line: 55)
!955 = !DISubprogram(name: "localeconv", scope: !949, file: !949, line: 127, type: !956, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!956 = !DISubroutineType(types: !957)
!957 = !{!958}
!958 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !948, size: 64, align: 64)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !960, line: 64)
!960 = !DISubprogram(name: "isalnum", scope: !961, file: !961, line: 110, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!961 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !963, line: 65)
!963 = !DISubprogram(name: "isalpha", scope: !961, file: !961, line: 111, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!964 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !965, line: 66)
!965 = !DISubprogram(name: "iscntrl", scope: !961, file: !961, line: 112, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!966 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !967, line: 67)
!967 = !DISubprogram(name: "isdigit", scope: !961, file: !961, line: 113, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !969, line: 68)
!969 = !DISubprogram(name: "isgraph", scope: !961, file: !961, line: 115, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !971, line: 69)
!971 = !DISubprogram(name: "islower", scope: !961, file: !961, line: 114, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!972 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !973, line: 70)
!973 = !DISubprogram(name: "isprint", scope: !961, file: !961, line: 116, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!974 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !975, line: 71)
!975 = !DISubprogram(name: "ispunct", scope: !961, file: !961, line: 117, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!976 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !977, line: 72)
!977 = !DISubprogram(name: "isspace", scope: !961, file: !961, line: 118, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!978 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !979, line: 73)
!979 = !DISubprogram(name: "isupper", scope: !961, file: !961, line: 119, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !981, line: 74)
!981 = !DISubprogram(name: "isxdigit", scope: !961, file: !961, line: 120, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!982 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !983, line: 75)
!983 = !DISubprogram(name: "tolower", scope: !961, file: !961, line: 124, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!984 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !985, line: 76)
!985 = !DISubprogram(name: "toupper", scope: !961, file: !961, line: 127, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !987, line: 44)
!987 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !1, file: !523, line: 196, baseType: !424)
!988 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !989, line: 45)
!989 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !1, file: !523, line: 197, baseType: !137)
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !991, line: 82)
!991 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !992, line: 186, baseType: !993)
!992 = !DIFile(filename: "/usr/include/wctype.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!993 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !994, size: 64, align: 64)
!994 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !995)
!995 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !996, line: 40, baseType: !11)
!996 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !998, line: 83)
!998 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !992, line: 52, baseType: !424)
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !704, line: 84)
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1001, line: 86)
!1001 = !DISubprogram(name: "iswalnum", scope: !992, file: !992, line: 111, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1003, line: 87)
!1003 = !DISubprogram(name: "iswalpha", scope: !992, file: !992, line: 117, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1004 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1005, line: 89)
!1005 = !DISubprogram(name: "iswblank", scope: !992, file: !992, line: 162, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1007, line: 91)
!1007 = !DISubprogram(name: "iswcntrl", scope: !992, file: !992, line: 120, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1008 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1009, line: 92)
!1009 = !DISubprogram(name: "iswctype", scope: !992, file: !992, line: 175, type: !1010, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1010 = !DISubroutineType(types: !1011)
!1011 = !{!11, !704, !998}
!1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1013, line: 93)
!1013 = !DISubprogram(name: "iswdigit", scope: !992, file: !992, line: 124, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1014 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1015, line: 94)
!1015 = !DISubprogram(name: "iswgraph", scope: !992, file: !992, line: 128, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1017, line: 95)
!1017 = !DISubprogram(name: "iswlower", scope: !992, file: !992, line: 133, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1018 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1019, line: 96)
!1019 = !DISubprogram(name: "iswprint", scope: !992, file: !992, line: 136, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1020 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1021, line: 97)
!1021 = !DISubprogram(name: "iswpunct", scope: !992, file: !992, line: 141, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1022 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1023, line: 98)
!1023 = !DISubprogram(name: "iswspace", scope: !992, file: !992, line: 146, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1024 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1025, line: 99)
!1025 = !DISubprogram(name: "iswupper", scope: !992, file: !992, line: 151, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1026 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1027, line: 100)
!1027 = !DISubprogram(name: "iswxdigit", scope: !992, file: !992, line: 156, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1029, line: 101)
!1029 = !DISubprogram(name: "towctrans", scope: !992, file: !992, line: 221, type: !1030, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1030 = !DISubroutineType(types: !1031)
!1031 = !{!704, !704, !991}
!1032 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1033, line: 102)
!1033 = !DISubprogram(name: "towlower", scope: !992, file: !992, line: 194, type: !1034, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1034 = !DISubroutineType(types: !1035)
!1035 = !{!704, !704}
!1036 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1037, line: 103)
!1037 = !DISubprogram(name: "towupper", scope: !992, file: !992, line: 197, type: !1034, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1039, line: 104)
!1039 = !DISubprogram(name: "wctrans", scope: !992, file: !992, line: 218, type: !1040, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{!991, !278}
!1042 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1043, line: 105)
!1043 = !DISubprogram(name: "wctype", scope: !992, file: !992, line: 171, type: !1044, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1044 = !DISubroutineType(types: !1045)
!1045 = !{!998, !278}
!1046 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1047, line: 98)
!1047 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !715, line: 48, baseType: !716)
!1048 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1049, line: 99)
!1049 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !715, line: 110, baseType: !1050)
!1050 = !DIDerivedType(tag: DW_TAG_typedef, name: "_G_fpos_t", file: !1051, line: 25, baseType: !1052)
!1051 = !DIFile(filename: "/usr/include/_G_config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!1052 = !DICompositeType(tag: DW_TAG_structure_type, file: !1051, line: 21, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1054, line: 101)
!1054 = !DISubprogram(name: "clearerr", scope: !715, file: !715, line: 826, type: !1055, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1055 = !DISubroutineType(types: !1056)
!1056 = !{null, !1057}
!1057 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1047, size: 64, align: 64)
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1059, line: 102)
!1059 = !DISubprogram(name: "fclose", scope: !715, file: !715, line: 237, type: !1060, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1060 = !DISubroutineType(types: !1061)
!1061 = !{!11, !1057}
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1063, line: 103)
!1063 = !DISubprogram(name: "feof", scope: !715, file: !715, line: 828, type: !1060, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1064 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1065, line: 104)
!1065 = !DISubprogram(name: "ferror", scope: !715, file: !715, line: 830, type: !1060, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1067, line: 105)
!1067 = !DISubprogram(name: "fflush", scope: !715, file: !715, line: 242, type: !1060, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1068 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1069, line: 106)
!1069 = !DISubprogram(name: "fgetc", scope: !715, file: !715, line: 531, type: !1060, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1071, line: 107)
!1071 = !DISubprogram(name: "fgetpos", scope: !715, file: !715, line: 798, type: !1072, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{!11, !1074, !1075}
!1074 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1057)
!1075 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1076)
!1076 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1049, size: 64, align: 64)
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1078, line: 108)
!1078 = !DISubprogram(name: "fgets", scope: !715, file: !715, line: 622, type: !1079, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1079 = !DISubroutineType(types: !1080)
!1080 = !{!449, !513, !11, !1074}
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1082, line: 109)
!1082 = !DISubprogram(name: "fopen", scope: !715, file: !715, line: 272, type: !1083, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!1057, !471, !471}
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1086, line: 110)
!1086 = !DISubprogram(name: "fprintf", scope: !715, file: !715, line: 356, type: !1087, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1087 = !DISubroutineType(types: !1088)
!1088 = !{!11, !1074, !471, null}
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1090, line: 111)
!1090 = !DISubprogram(name: "fputc", scope: !715, file: !715, line: 573, type: !1091, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1091 = !DISubroutineType(types: !1092)
!1092 = !{!11, !11, !1057}
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1094, line: 112)
!1094 = !DISubprogram(name: "fputs", scope: !715, file: !715, line: 689, type: !1095, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1095 = !DISubroutineType(types: !1096)
!1096 = !{!11, !471, !1074}
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1098, line: 113)
!1098 = !DISubprogram(name: "fread", scope: !715, file: !715, line: 709, type: !1099, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1099 = !DISubroutineType(types: !1100)
!1100 = !{!422, !1101, !422, !422, !1074}
!1101 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !116)
!1102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1103, line: 114)
!1103 = !DISubprogram(name: "freopen", scope: !715, file: !715, line: 278, type: !1104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1104 = !DISubroutineType(types: !1105)
!1105 = !{!1057, !471, !471, !1074}
!1106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1107, line: 115)
!1107 = !DISubprogram(name: "fscanf", scope: !715, file: !715, line: 425, type: !1087, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1109, line: 116)
!1109 = !DISubprogram(name: "fseek", scope: !715, file: !715, line: 749, type: !1110, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1110 = !DISubroutineType(types: !1111)
!1111 = !{!11, !1057, !137, !11}
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1113, line: 117)
!1113 = !DISubprogram(name: "fsetpos", scope: !715, file: !715, line: 803, type: !1114, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1114 = !DISubroutineType(types: !1115)
!1115 = !{!11, !1057, !1116}
!1116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1117, size: 64, align: 64)
!1117 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1049)
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1119, line: 118)
!1119 = !DISubprogram(name: "ftell", scope: !715, file: !715, line: 754, type: !1120, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1120 = !DISubroutineType(types: !1121)
!1121 = !{!137, !1057}
!1122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1123, line: 119)
!1123 = !DISubprogram(name: "fwrite", scope: !715, file: !715, line: 715, type: !1124, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1124 = !DISubroutineType(types: !1125)
!1125 = !{!422, !1126, !422, !422, !1074}
!1126 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !420)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1128, line: 120)
!1128 = !DISubprogram(name: "getc", scope: !715, file: !715, line: 532, type: !1060, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1130, line: 121)
!1130 = !DISubprogram(name: "getchar", scope: !715, file: !715, line: 538, type: !482, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1132, line: 124)
!1132 = !DISubprogram(name: "gets", scope: !715, file: !715, line: 638, type: !1133, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1133 = !DISubroutineType(types: !1134)
!1134 = !{!449, !449}
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1136, line: 126)
!1136 = !DISubprogram(name: "perror", scope: !715, file: !715, line: 846, type: !1137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1137 = !DISubroutineType(types: !1138)
!1138 = !{null, !278}
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1140, line: 127)
!1140 = !DISubprogram(name: "printf", scope: !715, file: !715, line: 362, type: !1141, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1141 = !DISubroutineType(types: !1142)
!1142 = !{!11, !471, null}
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1144, line: 128)
!1144 = !DISubprogram(name: "putc", scope: !715, file: !715, line: 574, type: !1091, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1146, line: 129)
!1146 = !DISubprogram(name: "putchar", scope: !715, file: !715, line: 580, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1148, line: 130)
!1148 = !DISubprogram(name: "puts", scope: !715, file: !715, line: 695, type: !410, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1150, line: 131)
!1150 = !DISubprogram(name: "remove", scope: !715, file: !715, line: 178, type: !410, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1152, line: 132)
!1152 = !DISubprogram(name: "rename", scope: !715, file: !715, line: 180, type: !1153, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1153 = !DISubroutineType(types: !1154)
!1154 = !{!11, !278, !278}
!1155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1156, line: 133)
!1156 = !DISubprogram(name: "rewind", scope: !715, file: !715, line: 759, type: !1055, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1158, line: 134)
!1158 = !DISubprogram(name: "scanf", scope: !715, file: !715, line: 431, type: !1141, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1160, line: 135)
!1160 = !DISubprogram(name: "setbuf", scope: !715, file: !715, line: 332, type: !1161, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1161 = !DISubroutineType(types: !1162)
!1162 = !{null, !1074, !513}
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1164, line: 136)
!1164 = !DISubprogram(name: "setvbuf", scope: !715, file: !715, line: 336, type: !1165, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1165 = !DISubroutineType(types: !1166)
!1166 = !{!11, !1074, !513, !11, !422}
!1167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1168, line: 137)
!1168 = !DISubprogram(name: "sprintf", scope: !715, file: !715, line: 364, type: !1169, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1169 = !DISubroutineType(types: !1170)
!1170 = !{!11, !513, !471, null}
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1172, line: 138)
!1172 = !DISubprogram(name: "sscanf", scope: !715, file: !715, line: 433, type: !1173, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1173 = !DISubroutineType(types: !1174)
!1174 = !{!11, !471, !471, null}
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1176, line: 139)
!1176 = !DISubprogram(name: "tmpfile", scope: !715, file: !715, line: 195, type: !1177, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1177 = !DISubroutineType(types: !1178)
!1178 = !{!1057}
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1180, line: 141)
!1180 = !DISubprogram(name: "tmpnam", scope: !715, file: !715, line: 209, type: !1133, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1182, line: 143)
!1182 = !DISubprogram(name: "ungetc", scope: !715, file: !715, line: 702, type: !1091, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1184, line: 144)
!1184 = !DISubprogram(name: "vfprintf", scope: !715, file: !715, line: 371, type: !1185, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1185 = !DISubroutineType(types: !1186)
!1186 = !{!11, !1074, !471, !791}
!1187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1188, line: 145)
!1188 = !DISubprogram(name: "vprintf", scope: !715, file: !715, line: 377, type: !1189, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1189 = !DISubroutineType(types: !1190)
!1190 = !{!11, !471, !791}
!1191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1192, line: 146)
!1192 = !DISubprogram(name: "vsprintf", scope: !715, file: !715, line: 379, type: !1193, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1193 = !DISubroutineType(types: !1194)
!1194 = !{!11, !513, !471, !791}
!1195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !1196, line: 175)
!1196 = !DISubprogram(name: "snprintf", scope: !715, file: !715, line: 386, type: !1197, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1197 = !DISubroutineType(types: !1198)
!1198 = !{!11, !513, !422, !471, null}
!1199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !1200, line: 176)
!1200 = !DISubprogram(name: "vfscanf", scope: !715, file: !715, line: 471, type: !1185, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !1202, line: 177)
!1202 = !DISubprogram(name: "vscanf", scope: !715, file: !715, line: 479, type: !1189, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !1204, line: 178)
!1204 = !DISubprogram(name: "vsnprintf", scope: !715, file: !715, line: 390, type: !1205, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1205 = !DISubroutineType(types: !1206)
!1206 = !{!11, !513, !422, !471, !791}
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !522, entity: !1208, line: 179)
!1208 = !DISubprogram(name: "vsscanf", scope: !715, file: !715, line: 483, type: !1209, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1209 = !DISubroutineType(types: !1210)
!1210 = !{!11, !471, !471, !791}
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1196, line: 185)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1200, line: 186)
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1202, line: 187)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1204, line: 188)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1, entity: !1208, line: 189)
!1216 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !20, entity: !1, line: 35)
!1217 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !20, entity: !1, line: 16)
!1218 = !{i32 2, !"Dwarf Version", i32 4}
!1219 = !{i32 2, !"Debug Info Version", i32 3}
!1220 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!1221 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !3, file: !3, line: 74, type: !395, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !1222)
!1222 = !{}
!1223 = !DILocation(line: 74, column: 25, scope: !1221)
!1224 = !DILocation(line: 74, column: 25, scope: !1225)
!1225 = !DILexicalBlockFile(scope: !1221, file: !3, discriminator: 1)
!1226 = distinct !DISubprogram(name: "kernel_compute_cost", linkageName: "_Z19kernel_compute_costiilP5PointiiPfS1_PiPb", scope: !21, file: !21, line: 63, type: !1227, isLocal: false, isDefinition: true, scopeLine: 65, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !1222)
!1227 = !DISubroutineType(types: !1228)
!1228 = !{null, !11, !11, !137, !129, !11, !11, !117, !117, !125, !127}
!1229 = !DILocalVariable(name: "num", arg: 1, scope: !1226, file: !21, line: 63, type: !11)
!1230 = !DIExpression()
!1231 = !DILocation(line: 63, column: 25, scope: !1226)
!1232 = !DILocalVariable(name: "dim", arg: 2, scope: !1226, file: !21, line: 63, type: !11)
!1233 = !DILocation(line: 63, column: 34, scope: !1226)
!1234 = !DILocalVariable(name: "x", arg: 3, scope: !1226, file: !21, line: 63, type: !137)
!1235 = !DILocation(line: 63, column: 44, scope: !1226)
!1236 = !DILocalVariable(name: "p", arg: 4, scope: !1226, file: !21, line: 63, type: !129)
!1237 = !DILocation(line: 63, column: 54, scope: !1226)
!1238 = !DILocalVariable(name: "K", arg: 5, scope: !1226, file: !21, line: 63, type: !11)
!1239 = !DILocation(line: 63, column: 61, scope: !1226)
!1240 = !DILocalVariable(name: "stride", arg: 6, scope: !1226, file: !21, line: 63, type: !11)
!1241 = !DILocation(line: 63, column: 68, scope: !1226)
!1242 = !DILocalVariable(name: "coord_d", arg: 7, scope: !1226, file: !21, line: 64, type: !117)
!1243 = !DILocation(line: 64, column: 13, scope: !1226)
!1244 = !DILocalVariable(name: "work_mem_d", arg: 8, scope: !1226, file: !21, line: 64, type: !117)
!1245 = !DILocation(line: 64, column: 29, scope: !1226)
!1246 = !DILocalVariable(name: "center_table_d", arg: 9, scope: !1226, file: !21, line: 64, type: !125)
!1247 = !DILocation(line: 64, column: 46, scope: !1226)
!1248 = !DILocalVariable(name: "switch_membership_d", arg: 10, scope: !1226, file: !21, line: 64, type: !127)
!1249 = !DILocation(line: 64, column: 68, scope: !1226)
!1250 = !DILocation(line: 65, column: 1, scope: !1226)
!1251 = !DILocation(line: 65, column: 1, scope: !1252)
!1252 = !DILexicalBlockFile(scope: !1226, file: !21, discriminator: 1)
!1253 = !DILocation(line: 65, column: 1, scope: !1254)
!1254 = !DILexicalBlockFile(scope: !1226, file: !21, discriminator: 2)
!1255 = !DILocation(line: 65, column: 1, scope: !1256)
!1256 = !DILexicalBlockFile(scope: !1226, file: !21, discriminator: 3)
!1257 = !DILocation(line: 65, column: 1, scope: !1258)
!1258 = !DILexicalBlockFile(scope: !1226, file: !21, discriminator: 4)
!1259 = !DILocation(line: 65, column: 1, scope: !1260)
!1260 = !DILexicalBlockFile(scope: !1226, file: !21, discriminator: 5)
!1261 = !DILocation(line: 65, column: 1, scope: !1262)
!1262 = !DILexicalBlockFile(scope: !1226, file: !21, discriminator: 6)
!1263 = !DILocation(line: 65, column: 1, scope: !1264)
!1264 = !DILexicalBlockFile(scope: !1226, file: !21, discriminator: 7)
!1265 = !DILocation(line: 65, column: 1, scope: !1266)
!1266 = !DILexicalBlockFile(scope: !1226, file: !21, discriminator: 8)
!1267 = !DILocation(line: 65, column: 1, scope: !1268)
!1268 = !DILexicalBlockFile(scope: !1226, file: !21, discriminator: 9)
!1269 = !DILocation(line: 65, column: 1, scope: !1270)
!1270 = !DILexicalBlockFile(scope: !1226, file: !21, discriminator: 10)
!1271 = !DILocation(line: 89, column: 1, scope: !1226)
!1272 = distinct !DISubprogram(name: "allocDevMem", linkageName: "_Z11allocDevMemii", scope: !21, file: !21, line: 94, type: !1273, isLocal: false, isDefinition: true, scopeLine: 95, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !1222)
!1273 = !DISubroutineType(types: !1274)
!1274 = !{null, !11, !11}
!1275 = !DILocalVariable(name: "num", arg: 1, scope: !1272, file: !21, line: 94, type: !11)
!1276 = !DILocation(line: 94, column: 22, scope: !1272)
!1277 = !DILocalVariable(name: "dim", arg: 2, scope: !1272, file: !21, line: 94, type: !11)
!1278 = !DILocation(line: 94, column: 31, scope: !1272)
!1279 = !DILocation(line: 96, column: 2, scope: !1272)
!1280 = distinct !{!1280, !1279}
!1281 = !DILocalVariable(name: "err", scope: !1282, file: !21, line: 96, type: !23)
!1282 = distinct !DILexicalBlock(scope: !1272, file: !21, line: 96, column: 2)
!1283 = !DILocation(line: 96, column: 2, scope: !1282)
!1284 = !DILocation(line: 96, column: 2, scope: !1285)
!1285 = !DILexicalBlockFile(scope: !1282, file: !21, discriminator: 1)
!1286 = !DILocation(line: 96, column: 2, scope: !1287)
!1287 = !DILexicalBlockFile(scope: !1288, file: !21, discriminator: 2)
!1288 = distinct !DILexicalBlock(scope: !1289, file: !21, line: 96, column: 2)
!1289 = distinct !DILexicalBlock(scope: !1282, file: !21, line: 96, column: 2)
!1290 = !DILocation(line: 96, column: 2, scope: !1291)
!1291 = !DILexicalBlockFile(scope: !1287, file: !21, discriminator: 4)
!1292 = !DILocation(line: 96, column: 2, scope: !1293)
!1293 = !DILexicalBlockFile(scope: !1287, file: !21, discriminator: 5)
!1294 = !DILocation(line: 96, column: 2, scope: !1295)
!1295 = !DILexicalBlockFile(scope: !1282, file: !21, discriminator: 3)
!1296 = !DILocation(line: 97, column: 2, scope: !1272)
!1297 = distinct !{!1297, !1296}
!1298 = !DILocalVariable(name: "err", scope: !1299, file: !21, line: 97, type: !23)
!1299 = distinct !DILexicalBlock(scope: !1272, file: !21, line: 97, column: 2)
!1300 = !DILocation(line: 97, column: 2, scope: !1299)
!1301 = !DILocation(line: 97, column: 2, scope: !1302)
!1302 = !DILexicalBlockFile(scope: !1299, file: !21, discriminator: 1)
!1303 = !DILocation(line: 97, column: 2, scope: !1304)
!1304 = !DILexicalBlockFile(scope: !1305, file: !21, discriminator: 2)
!1305 = distinct !DILexicalBlock(scope: !1306, file: !21, line: 97, column: 2)
!1306 = distinct !DILexicalBlock(scope: !1299, file: !21, line: 97, column: 2)
!1307 = !DILocation(line: 97, column: 2, scope: !1308)
!1308 = !DILexicalBlockFile(scope: !1304, file: !21, discriminator: 4)
!1309 = !DILocation(line: 97, column: 2, scope: !1310)
!1310 = !DILexicalBlockFile(scope: !1304, file: !21, discriminator: 5)
!1311 = !DILocation(line: 97, column: 2, scope: !1312)
!1312 = !DILexicalBlockFile(scope: !1299, file: !21, discriminator: 3)
!1313 = !DILocation(line: 98, column: 2, scope: !1272)
!1314 = distinct !{!1314, !1313}
!1315 = !DILocalVariable(name: "err", scope: !1316, file: !21, line: 98, type: !23)
!1316 = distinct !DILexicalBlock(scope: !1272, file: !21, line: 98, column: 2)
!1317 = !DILocation(line: 98, column: 2, scope: !1316)
!1318 = !DILocation(line: 98, column: 2, scope: !1319)
!1319 = !DILexicalBlockFile(scope: !1316, file: !21, discriminator: 1)
!1320 = !DILocation(line: 98, column: 2, scope: !1321)
!1321 = !DILexicalBlockFile(scope: !1322, file: !21, discriminator: 2)
!1322 = distinct !DILexicalBlock(scope: !1323, file: !21, line: 98, column: 2)
!1323 = distinct !DILexicalBlock(scope: !1316, file: !21, line: 98, column: 2)
!1324 = !DILocation(line: 98, column: 2, scope: !1325)
!1325 = !DILexicalBlockFile(scope: !1321, file: !21, discriminator: 4)
!1326 = !DILocation(line: 98, column: 2, scope: !1327)
!1327 = !DILexicalBlockFile(scope: !1321, file: !21, discriminator: 5)
!1328 = !DILocation(line: 98, column: 2, scope: !1329)
!1329 = !DILexicalBlockFile(scope: !1316, file: !21, discriminator: 3)
!1330 = !DILocation(line: 99, column: 2, scope: !1272)
!1331 = distinct !{!1331, !1330}
!1332 = !DILocalVariable(name: "err", scope: !1333, file: !21, line: 99, type: !23)
!1333 = distinct !DILexicalBlock(scope: !1272, file: !21, line: 99, column: 2)
!1334 = !DILocation(line: 99, column: 2, scope: !1333)
!1335 = !DILocation(line: 99, column: 2, scope: !1336)
!1336 = !DILexicalBlockFile(scope: !1333, file: !21, discriminator: 1)
!1337 = !DILocation(line: 99, column: 2, scope: !1338)
!1338 = !DILexicalBlockFile(scope: !1339, file: !21, discriminator: 2)
!1339 = distinct !DILexicalBlock(scope: !1340, file: !21, line: 99, column: 2)
!1340 = distinct !DILexicalBlock(scope: !1333, file: !21, line: 99, column: 2)
!1341 = !DILocation(line: 99, column: 2, scope: !1342)
!1342 = !DILexicalBlockFile(scope: !1338, file: !21, discriminator: 4)
!1343 = !DILocation(line: 99, column: 2, scope: !1344)
!1344 = !DILexicalBlockFile(scope: !1338, file: !21, discriminator: 5)
!1345 = !DILocation(line: 99, column: 2, scope: !1346)
!1346 = !DILexicalBlockFile(scope: !1333, file: !21, discriminator: 3)
!1347 = !DILocation(line: 100, column: 1, scope: !1272)
!1348 = distinct !DISubprogram(name: "allocHostMem", linkageName: "_Z12allocHostMemii", scope: !21, file: !21, line: 105, type: !1273, isLocal: false, isDefinition: true, scopeLine: 106, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !1222)
!1349 = !DILocalVariable(name: "num", arg: 1, scope: !1348, file: !21, line: 105, type: !11)
!1350 = !DILocation(line: 105, column: 23, scope: !1348)
!1351 = !DILocalVariable(name: "dim", arg: 2, scope: !1348, file: !21, line: 105, type: !11)
!1352 = !DILocation(line: 105, column: 32, scope: !1348)
!1353 = !DILocation(line: 107, column: 29, scope: !1348)
!1354 = !DILocation(line: 107, column: 35, scope: !1348)
!1355 = !DILocation(line: 107, column: 33, scope: !1348)
!1356 = !DILocation(line: 107, column: 39, scope: !1348)
!1357 = !DILocation(line: 107, column: 21, scope: !1348)
!1358 = !DILocation(line: 107, column: 12, scope: !1348)
!1359 = !DILocation(line: 107, column: 10, scope: !1348)
!1360 = !DILocation(line: 108, column: 1, scope: !1348)
!1361 = distinct !DISubprogram(name: "freeDevMem", linkageName: "_Z10freeDevMemv", scope: !21, file: !21, line: 113, type: !395, isLocal: false, isDefinition: true, scopeLine: 114, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !1222)
!1362 = !DILocation(line: 115, column: 2, scope: !1361)
!1363 = distinct !{!1363, !1362}
!1364 = !DILocalVariable(name: "err", scope: !1365, file: !21, line: 115, type: !23)
!1365 = distinct !DILexicalBlock(scope: !1361, file: !21, line: 115, column: 2)
!1366 = !DILocation(line: 115, column: 2, scope: !1365)
!1367 = !DILocation(line: 115, column: 2, scope: !1368)
!1368 = !DILexicalBlockFile(scope: !1365, file: !21, discriminator: 1)
!1369 = !DILocation(line: 115, column: 2, scope: !1370)
!1370 = !DILexicalBlockFile(scope: !1371, file: !21, discriminator: 2)
!1371 = distinct !DILexicalBlock(scope: !1372, file: !21, line: 115, column: 2)
!1372 = distinct !DILexicalBlock(scope: !1365, file: !21, line: 115, column: 2)
!1373 = !DILocation(line: 115, column: 2, scope: !1374)
!1374 = !DILexicalBlockFile(scope: !1370, file: !21, discriminator: 4)
!1375 = !DILocation(line: 115, column: 2, scope: !1376)
!1376 = !DILexicalBlockFile(scope: !1370, file: !21, discriminator: 5)
!1377 = !DILocation(line: 115, column: 2, scope: !1378)
!1378 = !DILexicalBlockFile(scope: !1365, file: !21, discriminator: 3)
!1379 = !DILocation(line: 116, column: 2, scope: !1361)
!1380 = distinct !{!1380, !1379}
!1381 = !DILocalVariable(name: "err", scope: !1382, file: !21, line: 116, type: !23)
!1382 = distinct !DILexicalBlock(scope: !1361, file: !21, line: 116, column: 2)
!1383 = !DILocation(line: 116, column: 2, scope: !1382)
!1384 = !DILocation(line: 116, column: 2, scope: !1385)
!1385 = !DILexicalBlockFile(scope: !1382, file: !21, discriminator: 1)
!1386 = !DILocation(line: 116, column: 2, scope: !1387)
!1387 = !DILexicalBlockFile(scope: !1388, file: !21, discriminator: 2)
!1388 = distinct !DILexicalBlock(scope: !1389, file: !21, line: 116, column: 2)
!1389 = distinct !DILexicalBlock(scope: !1382, file: !21, line: 116, column: 2)
!1390 = !DILocation(line: 116, column: 2, scope: !1391)
!1391 = !DILexicalBlockFile(scope: !1387, file: !21, discriminator: 4)
!1392 = !DILocation(line: 116, column: 2, scope: !1393)
!1393 = !DILexicalBlockFile(scope: !1387, file: !21, discriminator: 5)
!1394 = !DILocation(line: 116, column: 2, scope: !1395)
!1395 = !DILexicalBlockFile(scope: !1382, file: !21, discriminator: 3)
!1396 = !DILocation(line: 117, column: 2, scope: !1361)
!1397 = distinct !{!1397, !1396}
!1398 = !DILocalVariable(name: "err", scope: !1399, file: !21, line: 117, type: !23)
!1399 = distinct !DILexicalBlock(scope: !1361, file: !21, line: 117, column: 2)
!1400 = !DILocation(line: 117, column: 2, scope: !1399)
!1401 = !DILocation(line: 117, column: 2, scope: !1402)
!1402 = !DILexicalBlockFile(scope: !1399, file: !21, discriminator: 1)
!1403 = !DILocation(line: 117, column: 2, scope: !1404)
!1404 = !DILexicalBlockFile(scope: !1405, file: !21, discriminator: 2)
!1405 = distinct !DILexicalBlock(scope: !1406, file: !21, line: 117, column: 2)
!1406 = distinct !DILexicalBlock(scope: !1399, file: !21, line: 117, column: 2)
!1407 = !DILocation(line: 117, column: 2, scope: !1408)
!1408 = !DILexicalBlockFile(scope: !1404, file: !21, discriminator: 4)
!1409 = !DILocation(line: 117, column: 2, scope: !1410)
!1410 = !DILexicalBlockFile(scope: !1404, file: !21, discriminator: 5)
!1411 = !DILocation(line: 117, column: 2, scope: !1412)
!1412 = !DILexicalBlockFile(scope: !1399, file: !21, discriminator: 3)
!1413 = !DILocation(line: 118, column: 2, scope: !1361)
!1414 = distinct !{!1414, !1413}
!1415 = !DILocalVariable(name: "err", scope: !1416, file: !21, line: 118, type: !23)
!1416 = distinct !DILexicalBlock(scope: !1361, file: !21, line: 118, column: 2)
!1417 = !DILocation(line: 118, column: 2, scope: !1416)
!1418 = !DILocation(line: 118, column: 2, scope: !1419)
!1419 = !DILexicalBlockFile(scope: !1416, file: !21, discriminator: 1)
!1420 = !DILocation(line: 118, column: 2, scope: !1421)
!1421 = !DILexicalBlockFile(scope: !1422, file: !21, discriminator: 2)
!1422 = distinct !DILexicalBlock(scope: !1423, file: !21, line: 118, column: 2)
!1423 = distinct !DILexicalBlock(scope: !1416, file: !21, line: 118, column: 2)
!1424 = !DILocation(line: 118, column: 2, scope: !1425)
!1425 = !DILexicalBlockFile(scope: !1421, file: !21, discriminator: 4)
!1426 = !DILocation(line: 118, column: 2, scope: !1427)
!1427 = !DILexicalBlockFile(scope: !1421, file: !21, discriminator: 5)
!1428 = !DILocation(line: 118, column: 2, scope: !1429)
!1429 = !DILexicalBlockFile(scope: !1416, file: !21, discriminator: 3)
!1430 = !DILocation(line: 119, column: 1, scope: !1361)
!1431 = distinct !DISubprogram(name: "freeHostMem", linkageName: "_Z11freeHostMemv", scope: !21, file: !21, line: 124, type: !395, isLocal: false, isDefinition: true, scopeLine: 125, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !1222)
!1432 = !DILocation(line: 126, column: 7, scope: !1431)
!1433 = !DILocation(line: 126, column: 2, scope: !1431)
!1434 = !DILocation(line: 127, column: 1, scope: !1431)
!1435 = distinct !DISubprogram(name: "pgain", linkageName: "_Z5pgainlP6PointsfPliPbPiS2_bPdS4_S4_S4_S4_S4_", scope: !21, file: !21, line: 132, type: !1436, isLocal: false, isDefinition: true, scopeLine: 134, flags: DIFlagPrototyped, isOptimized: false, unit: !20, variables: !1222)
!1436 = !DISubroutineType(types: !1437)
!1437 = !{!118, !137, !1438, !118, !1445, !11, !127, !125, !127, !13, !370, !370, !370, !370, !370, !370}
!1438 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1439, size: 64, align: 64)
!1439 = !DIDerivedType(tag: DW_TAG_typedef, name: "Points", file: !131, line: 51, baseType: !1440)
!1440 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !131, line: 47, size: 192, align: 64, elements: !1441, identifier: "_ZTS6Points")
!1441 = !{!1442, !1443, !1444}
!1442 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !1440, file: !131, line: 48, baseType: !137, size: 64, align: 64)
!1443 = !DIDerivedType(tag: DW_TAG_member, name: "dim", scope: !1440, file: !131, line: 49, baseType: !11, size: 32, align: 32, offset: 64)
!1444 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !1440, file: !131, line: 50, baseType: !129, size: 64, align: 64, offset: 128)
!1445 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64, align: 64)
!1446 = !DILocalVariable(name: "x", arg: 1, scope: !1435, file: !21, line: 132, type: !137)
!1447 = !DILocation(line: 132, column: 19, scope: !1435)
!1448 = !DILocalVariable(name: "points", arg: 2, scope: !1435, file: !21, line: 132, type: !1438)
!1449 = !DILocation(line: 132, column: 30, scope: !1435)
!1450 = !DILocalVariable(name: "z", arg: 3, scope: !1435, file: !21, line: 132, type: !118)
!1451 = !DILocation(line: 132, column: 44, scope: !1435)
!1452 = !DILocalVariable(name: "numcenters", arg: 4, scope: !1435, file: !21, line: 132, type: !1445)
!1453 = !DILocation(line: 132, column: 57, scope: !1435)
!1454 = !DILocalVariable(name: "kmax", arg: 5, scope: !1435, file: !21, line: 132, type: !11)
!1455 = !DILocation(line: 132, column: 73, scope: !1435)
!1456 = !DILocalVariable(name: "is_center", arg: 6, scope: !1435, file: !21, line: 132, type: !127)
!1457 = !DILocation(line: 132, column: 85, scope: !1435)
!1458 = !DILocalVariable(name: "center_table", arg: 7, scope: !1435, file: !21, line: 132, type: !125)
!1459 = !DILocation(line: 132, column: 101, scope: !1435)
!1460 = !DILocalVariable(name: "switch_membership", arg: 8, scope: !1435, file: !21, line: 132, type: !127)
!1461 = !DILocation(line: 132, column: 121, scope: !1435)
!1462 = !DILocalVariable(name: "isCoordChanged", arg: 9, scope: !1435, file: !21, line: 132, type: !13)
!1463 = !DILocation(line: 132, column: 145, scope: !1435)
!1464 = !DILocalVariable(name: "serial_t", arg: 10, scope: !1435, file: !21, line: 133, type: !370)
!1465 = !DILocation(line: 133, column: 16, scope: !1435)
!1466 = !DILocalVariable(name: "cpu_to_gpu_t", arg: 11, scope: !1435, file: !21, line: 133, type: !370)
!1467 = !DILocation(line: 133, column: 34, scope: !1435)
!1468 = !DILocalVariable(name: "gpu_to_cpu_t", arg: 12, scope: !1435, file: !21, line: 133, type: !370)
!1469 = !DILocation(line: 133, column: 56, scope: !1435)
!1470 = !DILocalVariable(name: "alloc_t", arg: 13, scope: !1435, file: !21, line: 133, type: !370)
!1471 = !DILocation(line: 133, column: 78, scope: !1435)
!1472 = !DILocalVariable(name: "kernel_t", arg: 14, scope: !1435, file: !21, line: 133, type: !370)
!1473 = !DILocation(line: 133, column: 95, scope: !1435)
!1474 = !DILocalVariable(name: "free_t", arg: 15, scope: !1435, file: !21, line: 133, type: !370)
!1475 = !DILocation(line: 133, column: 113, scope: !1435)
!1476 = !DILocalVariable(name: "tmp_t", scope: !1435, file: !21, line: 136, type: !118)
!1477 = !DILocation(line: 136, column: 8, scope: !1435)
!1478 = !DILocalVariable(name: "start", scope: !1435, file: !21, line: 137, type: !1479)
!1479 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaEvent_t", file: !24, line: 1487, baseType: !1480)
!1480 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1481, size: 64, align: 64)
!1481 = !DICompositeType(tag: DW_TAG_structure_type, name: "CUevent_st", file: !1482, line: 236, flags: DIFlagFwdDecl, identifier: "_ZTS10CUevent_st")
!1482 = !DIFile(filename: "/usr/local/cuda/include/cuda.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!1483 = !DILocation(line: 137, column: 14, scope: !1435)
!1484 = !DILocalVariable(name: "stop", scope: !1435, file: !21, line: 137, type: !1479)
!1485 = !DILocation(line: 137, column: 21, scope: !1435)
!1486 = !DILocation(line: 138, column: 2, scope: !1435)
!1487 = !DILocation(line: 139, column: 2, scope: !1435)
!1488 = !DILocation(line: 141, column: 18, scope: !1435)
!1489 = !DILocation(line: 141, column: 2, scope: !1435)
!1490 = !DILocalVariable(name: "error", scope: !1435, file: !21, line: 144, type: !1491)
!1491 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !24, line: 1477, baseType: !23)
!1492 = !DILocation(line: 144, column: 14, scope: !1435)
!1493 = !DILocalVariable(name: "stride", scope: !1435, file: !21, line: 146, type: !11)
!1494 = !DILocation(line: 146, column: 6, scope: !1435)
!1495 = !DILocation(line: 146, column: 16, scope: !1435)
!1496 = !DILocation(line: 146, column: 15, scope: !1435)
!1497 = !DILocation(line: 146, column: 27, scope: !1435)
!1498 = !DILocalVariable(name: "K", scope: !1435, file: !21, line: 147, type: !11)
!1499 = !DILocation(line: 147, column: 6, scope: !1435)
!1500 = !DILocation(line: 147, column: 12, scope: !1435)
!1501 = !DILocation(line: 147, column: 11, scope: !1435)
!1502 = !DILocalVariable(name: "num", scope: !1435, file: !21, line: 148, type: !11)
!1503 = !DILocation(line: 148, column: 6, scope: !1435)
!1504 = !DILocation(line: 148, column: 14, scope: !1435)
!1505 = !DILocation(line: 148, column: 22, scope: !1435)
!1506 = !DILocalVariable(name: "dim", scope: !1435, file: !21, line: 149, type: !11)
!1507 = !DILocation(line: 149, column: 6, scope: !1435)
!1508 = !DILocation(line: 149, column: 14, scope: !1435)
!1509 = !DILocation(line: 149, column: 22, scope: !1435)
!1510 = !DILocalVariable(name: "nThread", scope: !1435, file: !21, line: 150, type: !11)
!1511 = !DILocation(line: 150, column: 6, scope: !1435)
!1512 = !DILocation(line: 150, column: 17, scope: !1435)
!1513 = !DILocation(line: 155, column: 31, scope: !1435)
!1514 = !DILocation(line: 155, column: 41, scope: !1435)
!1515 = !DILocation(line: 155, column: 49, scope: !1435)
!1516 = !DILocation(line: 155, column: 38, scope: !1435)
!1517 = !DILocation(line: 155, column: 54, scope: !1435)
!1518 = !DILocation(line: 155, column: 24, scope: !1435)
!1519 = !DILocation(line: 155, column: 15, scope: !1435)
!1520 = !DILocation(line: 155, column: 13, scope: !1435)
!1521 = !DILocation(line: 157, column: 5, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 157, column: 5)
!1523 = !DILocation(line: 157, column: 10, scope: !1522)
!1524 = !DILocation(line: 157, column: 5, scope: !1435)
!1525 = !DILocation(line: 159, column: 16, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1522, file: !21, line: 158, column: 2)
!1527 = !DILocation(line: 159, column: 21, scope: !1526)
!1528 = !DILocation(line: 159, column: 3, scope: !1526)
!1529 = !DILocation(line: 160, column: 2, scope: !1526)
!1530 = !DILocalVariable(name: "count", scope: !1435, file: !21, line: 163, type: !11)
!1531 = !DILocation(line: 163, column: 6, scope: !1435)
!1532 = !DILocalVariable(name: "i", scope: !1533, file: !21, line: 164, type: !11)
!1533 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 164, column: 2)
!1534 = !DILocation(line: 164, column: 11, scope: !1533)
!1535 = !DILocation(line: 164, column: 7, scope: !1533)
!1536 = !DILocation(line: 164, column: 16, scope: !1537)
!1537 = !DILexicalBlockFile(scope: !1538, file: !21, discriminator: 1)
!1538 = distinct !DILexicalBlock(scope: !1533, file: !21, line: 164, column: 2)
!1539 = !DILocation(line: 164, column: 18, scope: !1537)
!1540 = !DILocation(line: 164, column: 17, scope: !1537)
!1541 = !DILocation(line: 164, column: 2, scope: !1537)
!1542 = !DILocation(line: 166, column: 7, scope: !1543)
!1543 = distinct !DILexicalBlock(scope: !1544, file: !21, line: 166, column: 7)
!1544 = distinct !DILexicalBlock(scope: !1538, file: !21, line: 165, column: 2)
!1545 = !DILocation(line: 166, column: 17, scope: !1543)
!1546 = !DILocation(line: 166, column: 7, scope: !1544)
!1547 = !DILocation(line: 168, column: 27, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1543, file: !21, line: 167, column: 3)
!1549 = !DILocation(line: 168, column: 4, scope: !1548)
!1550 = !DILocation(line: 168, column: 17, scope: !1548)
!1551 = !DILocation(line: 168, column: 20, scope: !1548)
!1552 = !DILocation(line: 169, column: 3, scope: !1548)
!1553 = !DILocation(line: 170, column: 2, scope: !1544)
!1554 = !DILocation(line: 164, column: 24, scope: !1555)
!1555 = !DILexicalBlockFile(scope: !1538, file: !21, discriminator: 2)
!1556 = !DILocation(line: 164, column: 2, scope: !1555)
!1557 = distinct !{!1557, !1558}
!1558 = !DILocation(line: 164, column: 2, scope: !1435)
!1559 = !DILocation(line: 174, column: 5, scope: !1560)
!1560 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 174, column: 5)
!1561 = !DILocation(line: 174, column: 20, scope: !1560)
!1562 = !DILocation(line: 174, column: 23, scope: !1563)
!1563 = !DILexicalBlockFile(scope: !1560, file: !21, discriminator: 1)
!1564 = !DILocation(line: 174, column: 28, scope: !1563)
!1565 = !DILocation(line: 174, column: 5, scope: !1563)
!1566 = !DILocalVariable(name: "i", scope: !1567, file: !21, line: 176, type: !11)
!1567 = distinct !DILexicalBlock(scope: !1568, file: !21, line: 176, column: 3)
!1568 = distinct !DILexicalBlock(scope: !1560, file: !21, line: 175, column: 2)
!1569 = !DILocation(line: 176, column: 11, scope: !1567)
!1570 = !DILocation(line: 176, column: 7, scope: !1567)
!1571 = !DILocation(line: 176, column: 16, scope: !1572)
!1572 = !DILexicalBlockFile(scope: !1573, file: !21, discriminator: 1)
!1573 = distinct !DILexicalBlock(scope: !1567, file: !21, line: 176, column: 3)
!1574 = !DILocation(line: 176, column: 18, scope: !1572)
!1575 = !DILocation(line: 176, column: 17, scope: !1572)
!1576 = !DILocation(line: 176, column: 3, scope: !1572)
!1577 = !DILocalVariable(name: "j", scope: !1578, file: !21, line: 178, type: !11)
!1578 = distinct !DILexicalBlock(scope: !1579, file: !21, line: 178, column: 4)
!1579 = distinct !DILexicalBlock(scope: !1573, file: !21, line: 177, column: 3)
!1580 = !DILocation(line: 178, column: 12, scope: !1578)
!1581 = !DILocation(line: 178, column: 8, scope: !1578)
!1582 = !DILocation(line: 178, column: 17, scope: !1583)
!1583 = !DILexicalBlockFile(scope: !1584, file: !21, discriminator: 1)
!1584 = distinct !DILexicalBlock(scope: !1578, file: !21, line: 178, column: 4)
!1585 = !DILocation(line: 178, column: 19, scope: !1583)
!1586 = !DILocation(line: 178, column: 18, scope: !1583)
!1587 = !DILocation(line: 178, column: 4, scope: !1583)
!1588 = !DILocation(line: 180, column: 28, scope: !1589)
!1589 = distinct !DILexicalBlock(scope: !1584, file: !21, line: 179, column: 4)
!1590 = !DILocation(line: 180, column: 36, scope: !1589)
!1591 = !DILocation(line: 180, column: 38, scope: !1589)
!1592 = !DILocation(line: 180, column: 41, scope: !1589)
!1593 = !DILocation(line: 180, column: 47, scope: !1589)
!1594 = !DILocation(line: 180, column: 5, scope: !1589)
!1595 = !DILocation(line: 180, column: 15, scope: !1589)
!1596 = !DILocation(line: 180, column: 19, scope: !1589)
!1597 = !DILocation(line: 180, column: 18, scope: !1589)
!1598 = !DILocation(line: 180, column: 22, scope: !1589)
!1599 = !DILocation(line: 180, column: 21, scope: !1589)
!1600 = !DILocation(line: 180, column: 26, scope: !1589)
!1601 = !DILocation(line: 181, column: 4, scope: !1589)
!1602 = !DILocation(line: 178, column: 25, scope: !1603)
!1603 = !DILexicalBlockFile(scope: !1584, file: !21, discriminator: 2)
!1604 = !DILocation(line: 178, column: 4, scope: !1603)
!1605 = distinct !{!1605, !1606}
!1606 = !DILocation(line: 178, column: 4, scope: !1579)
!1607 = !DILocation(line: 182, column: 3, scope: !1579)
!1608 = !DILocation(line: 176, column: 24, scope: !1609)
!1609 = !DILexicalBlockFile(scope: !1573, file: !21, discriminator: 2)
!1610 = !DILocation(line: 176, column: 3, scope: !1609)
!1611 = distinct !{!1611, !1612}
!1612 = !DILocation(line: 176, column: 3, scope: !1568)
!1613 = !DILocation(line: 183, column: 2, scope: !1568)
!1614 = !DILocation(line: 186, column: 18, scope: !1435)
!1615 = !DILocation(line: 186, column: 2, scope: !1435)
!1616 = !DILocation(line: 187, column: 23, scope: !1435)
!1617 = !DILocation(line: 187, column: 2, scope: !1435)
!1618 = !DILocation(line: 188, column: 31, scope: !1435)
!1619 = !DILocation(line: 188, column: 38, scope: !1435)
!1620 = !DILocation(line: 188, column: 2, scope: !1435)
!1621 = !DILocation(line: 189, column: 24, scope: !1435)
!1622 = !DILocation(line: 189, column: 3, scope: !1435)
!1623 = !DILocation(line: 189, column: 12, scope: !1435)
!1624 = !DILocation(line: 191, column: 18, scope: !1435)
!1625 = !DILocation(line: 191, column: 2, scope: !1435)
!1626 = !DILocation(line: 197, column: 2, scope: !1435)
!1627 = distinct !{!1627, !1626}
!1628 = !DILocalVariable(name: "err", scope: !1629, file: !21, line: 197, type: !23)
!1629 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 197, column: 2)
!1630 = !DILocation(line: 197, column: 2, scope: !1629)
!1631 = !DILocation(line: 197, column: 2, scope: !1632)
!1632 = !DILexicalBlockFile(scope: !1629, file: !21, discriminator: 1)
!1633 = !DILocation(line: 197, column: 2, scope: !1634)
!1634 = !DILexicalBlockFile(scope: !1635, file: !21, discriminator: 2)
!1635 = distinct !DILexicalBlock(scope: !1636, file: !21, line: 197, column: 2)
!1636 = distinct !DILexicalBlock(scope: !1629, file: !21, line: 197, column: 2)
!1637 = !DILocation(line: 197, column: 2, scope: !1638)
!1638 = !DILexicalBlockFile(scope: !1634, file: !21, discriminator: 4)
!1639 = !DILocation(line: 197, column: 2, scope: !1640)
!1640 = !DILexicalBlockFile(scope: !1634, file: !21, discriminator: 5)
!1641 = !DILocation(line: 197, column: 2, scope: !1642)
!1642 = !DILexicalBlockFile(scope: !1629, file: !21, discriminator: 3)
!1643 = !DILocation(line: 199, column: 6, scope: !1644)
!1644 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 199, column: 6)
!1645 = !DILocation(line: 199, column: 11, scope: !1644)
!1646 = !DILocation(line: 199, column: 6, scope: !1435)
!1647 = !DILocation(line: 201, column: 15, scope: !1648)
!1648 = distinct !DILexicalBlock(scope: !1644, file: !21, line: 200, column: 2)
!1649 = !DILocation(line: 201, column: 20, scope: !1648)
!1650 = !DILocation(line: 201, column: 3, scope: !1648)
!1651 = !DILocation(line: 202, column: 2, scope: !1648)
!1652 = !DILocation(line: 205, column: 18, scope: !1435)
!1653 = !DILocation(line: 205, column: 2, scope: !1435)
!1654 = !DILocation(line: 206, column: 23, scope: !1435)
!1655 = !DILocation(line: 206, column: 2, scope: !1435)
!1656 = !DILocation(line: 207, column: 31, scope: !1435)
!1657 = !DILocation(line: 207, column: 38, scope: !1435)
!1658 = !DILocation(line: 207, column: 2, scope: !1435)
!1659 = !DILocation(line: 208, column: 23, scope: !1435)
!1660 = !DILocation(line: 208, column: 3, scope: !1435)
!1661 = !DILocation(line: 208, column: 11, scope: !1435)
!1662 = !DILocation(line: 210, column: 18, scope: !1435)
!1663 = !DILocation(line: 210, column: 2, scope: !1435)
!1664 = !DILocation(line: 217, column: 5, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 217, column: 5)
!1666 = !DILocation(line: 217, column: 20, scope: !1665)
!1667 = !DILocation(line: 217, column: 23, scope: !1668)
!1668 = !DILexicalBlockFile(scope: !1665, file: !21, discriminator: 1)
!1669 = !DILocation(line: 217, column: 28, scope: !1668)
!1670 = !DILocation(line: 217, column: 5, scope: !1668)
!1671 = !DILocation(line: 219, column: 3, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !1665, file: !21, line: 218, column: 2)
!1673 = distinct !{!1673, !1671}
!1674 = !DILocalVariable(name: "err", scope: !1675, file: !21, line: 219, type: !23)
!1675 = distinct !DILexicalBlock(scope: !1672, file: !21, line: 219, column: 3)
!1676 = !DILocation(line: 219, column: 3, scope: !1675)
!1677 = !DILocation(line: 219, column: 3, scope: !1678)
!1678 = !DILexicalBlockFile(scope: !1675, file: !21, discriminator: 1)
!1679 = !DILocation(line: 219, column: 3, scope: !1680)
!1680 = !DILexicalBlockFile(scope: !1681, file: !21, discriminator: 2)
!1681 = distinct !DILexicalBlock(scope: !1682, file: !21, line: 219, column: 3)
!1682 = distinct !DILexicalBlock(scope: !1675, file: !21, line: 219, column: 3)
!1683 = !DILocation(line: 219, column: 3, scope: !1684)
!1684 = !DILexicalBlockFile(scope: !1680, file: !21, discriminator: 4)
!1685 = !DILocation(line: 219, column: 3, scope: !1686)
!1686 = !DILexicalBlockFile(scope: !1680, file: !21, discriminator: 5)
!1687 = !DILocation(line: 219, column: 3, scope: !1688)
!1688 = !DILexicalBlockFile(scope: !1675, file: !21, discriminator: 3)
!1689 = !DILocation(line: 220, column: 2, scope: !1672)
!1690 = !DILocation(line: 221, column: 2, scope: !1435)
!1691 = distinct !{!1691, !1690}
!1692 = !DILocalVariable(name: "err", scope: !1693, file: !21, line: 221, type: !23)
!1693 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 221, column: 2)
!1694 = !DILocation(line: 221, column: 2, scope: !1693)
!1695 = !DILocation(line: 221, column: 2, scope: !1696)
!1696 = !DILexicalBlockFile(scope: !1693, file: !21, discriminator: 1)
!1697 = !DILocation(line: 221, column: 2, scope: !1698)
!1698 = !DILexicalBlockFile(scope: !1699, file: !21, discriminator: 2)
!1699 = distinct !DILexicalBlock(scope: !1700, file: !21, line: 221, column: 2)
!1700 = distinct !DILexicalBlock(scope: !1693, file: !21, line: 221, column: 2)
!1701 = !DILocation(line: 221, column: 2, scope: !1702)
!1702 = !DILexicalBlockFile(scope: !1698, file: !21, discriminator: 4)
!1703 = !DILocation(line: 221, column: 2, scope: !1704)
!1704 = !DILexicalBlockFile(scope: !1698, file: !21, discriminator: 5)
!1705 = !DILocation(line: 221, column: 2, scope: !1706)
!1706 = !DILexicalBlockFile(scope: !1693, file: !21, discriminator: 3)
!1707 = !DILocation(line: 222, column: 2, scope: !1435)
!1708 = distinct !{!1708, !1707}
!1709 = !DILocalVariable(name: "err", scope: !1710, file: !21, line: 222, type: !23)
!1710 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 222, column: 2)
!1711 = !DILocation(line: 222, column: 2, scope: !1710)
!1712 = !DILocation(line: 222, column: 2, scope: !1713)
!1713 = !DILexicalBlockFile(scope: !1710, file: !21, discriminator: 1)
!1714 = !DILocation(line: 222, column: 2, scope: !1715)
!1715 = !DILexicalBlockFile(scope: !1716, file: !21, discriminator: 2)
!1716 = distinct !DILexicalBlock(scope: !1717, file: !21, line: 222, column: 2)
!1717 = distinct !DILexicalBlock(scope: !1710, file: !21, line: 222, column: 2)
!1718 = !DILocation(line: 222, column: 2, scope: !1719)
!1719 = !DILexicalBlockFile(scope: !1715, file: !21, discriminator: 4)
!1720 = !DILocation(line: 222, column: 2, scope: !1721)
!1721 = !DILexicalBlockFile(scope: !1715, file: !21, discriminator: 5)
!1722 = !DILocation(line: 222, column: 2, scope: !1723)
!1723 = !DILexicalBlockFile(scope: !1710, file: !21, discriminator: 3)
!1724 = !DILocation(line: 224, column: 2, scope: !1435)
!1725 = distinct !{!1725, !1724}
!1726 = !DILocalVariable(name: "err", scope: !1727, file: !21, line: 224, type: !23)
!1727 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 224, column: 2)
!1728 = !DILocation(line: 224, column: 2, scope: !1727)
!1729 = !DILocation(line: 224, column: 2, scope: !1730)
!1730 = !DILexicalBlockFile(scope: !1727, file: !21, discriminator: 1)
!1731 = !DILocation(line: 224, column: 2, scope: !1732)
!1732 = !DILexicalBlockFile(scope: !1733, file: !21, discriminator: 2)
!1733 = distinct !DILexicalBlock(scope: !1734, file: !21, line: 224, column: 2)
!1734 = distinct !DILexicalBlock(scope: !1727, file: !21, line: 224, column: 2)
!1735 = !DILocation(line: 224, column: 2, scope: !1736)
!1736 = !DILexicalBlockFile(scope: !1732, file: !21, discriminator: 4)
!1737 = !DILocation(line: 224, column: 2, scope: !1738)
!1738 = !DILexicalBlockFile(scope: !1732, file: !21, discriminator: 5)
!1739 = !DILocation(line: 224, column: 2, scope: !1740)
!1740 = !DILexicalBlockFile(scope: !1727, file: !21, discriminator: 3)
!1741 = !DILocation(line: 225, column: 2, scope: !1435)
!1742 = distinct !{!1742, !1741}
!1743 = !DILocalVariable(name: "err", scope: !1744, file: !21, line: 225, type: !23)
!1744 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 225, column: 2)
!1745 = !DILocation(line: 225, column: 2, scope: !1744)
!1746 = !DILocation(line: 225, column: 2, scope: !1747)
!1747 = !DILexicalBlockFile(scope: !1744, file: !21, discriminator: 1)
!1748 = !DILocation(line: 225, column: 2, scope: !1749)
!1749 = !DILexicalBlockFile(scope: !1750, file: !21, discriminator: 2)
!1750 = distinct !DILexicalBlock(scope: !1751, file: !21, line: 225, column: 2)
!1751 = distinct !DILexicalBlock(scope: !1744, file: !21, line: 225, column: 2)
!1752 = !DILocation(line: 225, column: 2, scope: !1753)
!1753 = !DILexicalBlockFile(scope: !1749, file: !21, discriminator: 4)
!1754 = !DILocation(line: 225, column: 2, scope: !1755)
!1755 = !DILexicalBlockFile(scope: !1749, file: !21, discriminator: 5)
!1756 = !DILocation(line: 225, column: 2, scope: !1757)
!1757 = !DILexicalBlockFile(scope: !1744, file: !21, discriminator: 3)
!1758 = !DILocation(line: 228, column: 18, scope: !1435)
!1759 = !DILocation(line: 228, column: 2, scope: !1435)
!1760 = !DILocation(line: 229, column: 23, scope: !1435)
!1761 = !DILocation(line: 229, column: 2, scope: !1435)
!1762 = !DILocation(line: 230, column: 31, scope: !1435)
!1763 = !DILocation(line: 230, column: 38, scope: !1435)
!1764 = !DILocation(line: 230, column: 2, scope: !1435)
!1765 = !DILocation(line: 231, column: 28, scope: !1435)
!1766 = !DILocation(line: 231, column: 3, scope: !1435)
!1767 = !DILocation(line: 231, column: 16, scope: !1435)
!1768 = !DILocation(line: 233, column: 18, scope: !1435)
!1769 = !DILocation(line: 233, column: 2, scope: !1435)
!1770 = !DILocalVariable(name: "num_blocks", scope: !1435, file: !21, line: 240, type: !11)
!1771 = !DILocation(line: 240, column: 6, scope: !1435)
!1772 = !DILocation(line: 240, column: 37, scope: !1435)
!1773 = !DILocation(line: 240, column: 41, scope: !1435)
!1774 = !DILocation(line: 240, column: 61, scope: !1435)
!1775 = !DILocation(line: 240, column: 36, scope: !1435)
!1776 = !DILocation(line: 240, column: 66, scope: !1435)
!1777 = !DILocation(line: 240, column: 27, scope: !1435)
!1778 = !DILocalVariable(name: "num_blocks_y", scope: !1435, file: !21, line: 241, type: !11)
!1779 = !DILocation(line: 241, column: 6, scope: !1435)
!1780 = !DILocation(line: 241, column: 37, scope: !1435)
!1781 = !DILocation(line: 241, column: 48, scope: !1435)
!1782 = !DILocation(line: 241, column: 60, scope: !1435)
!1783 = !DILocation(line: 241, column: 36, scope: !1435)
!1784 = !DILocation(line: 241, column: 66, scope: !1435)
!1785 = !DILocation(line: 241, column: 27, scope: !1435)
!1786 = !DILocalVariable(name: "num_blocks_x", scope: !1435, file: !21, line: 242, type: !11)
!1787 = !DILocation(line: 242, column: 6, scope: !1435)
!1788 = !DILocation(line: 242, column: 37, scope: !1435)
!1789 = !DILocation(line: 242, column: 48, scope: !1435)
!1790 = !DILocation(line: 242, column: 47, scope: !1435)
!1791 = !DILocation(line: 242, column: 61, scope: !1435)
!1792 = !DILocation(line: 242, column: 36, scope: !1435)
!1793 = !DILocation(line: 242, column: 76, scope: !1435)
!1794 = !DILocation(line: 242, column: 66, scope: !1435)
!1795 = !DILocation(line: 242, column: 27, scope: !1435)
!1796 = !DILocalVariable(name: "grid_size", scope: !1435, file: !21, line: 243, type: !1797)
!1797 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1798, line: 427, baseType: !1799)
!1798 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!1799 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1798, line: 417, size: 96, align: 32, elements: !1800, identifier: "_ZTS4dim3")
!1800 = !{!1801, !1802, !1803, !1804, !1808, !1817}
!1801 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1799, file: !1798, line: 419, baseType: !492, size: 32, align: 32)
!1802 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1799, file: !1798, line: 419, baseType: !492, size: 32, align: 32, offset: 32)
!1803 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1799, file: !1798, line: 419, baseType: !492, size: 32, align: 32, offset: 64)
!1804 = !DISubprogram(name: "dim3", scope: !1799, file: !1798, line: 421, type: !1805, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!1805 = !DISubroutineType(types: !1806)
!1806 = !{null, !1807, !492, !492, !492}
!1807 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1799, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1808 = !DISubprogram(name: "dim3", scope: !1799, file: !1798, line: 422, type: !1809, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!1809 = !DISubroutineType(types: !1810)
!1810 = !{null, !1807, !1811}
!1811 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1798, line: 383, baseType: !1812)
!1812 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1798, line: 190, size: 96, align: 32, elements: !1813, identifier: "_ZTS5uint3")
!1813 = !{!1814, !1815, !1816}
!1814 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1812, file: !1798, line: 192, baseType: !492, size: 32, align: 32)
!1815 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1812, file: !1798, line: 192, baseType: !492, size: 32, align: 32, offset: 32)
!1816 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1812, file: !1798, line: 192, baseType: !492, size: 32, align: 32, offset: 64)
!1817 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1799, file: !1798, line: 423, type: !1818, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!1818 = !DISubroutineType(types: !1819)
!1819 = !{!1811, !1807}
!1820 = !DILocation(line: 243, column: 7, scope: !1435)
!1821 = !DILocation(line: 243, column: 17, scope: !1435)
!1822 = !DILocation(line: 243, column: 31, scope: !1435)
!1823 = !DILocation(line: 245, column: 24, scope: !1435)
!1824 = !DILocation(line: 245, column: 35, scope: !1435)
!1825 = !DILocation(line: 245, column: 21, scope: !1435)
!1826 = !DILocation(line: 245, column: 21, scope: !1827)
!1827 = !DILexicalBlockFile(scope: !1435, file: !21, discriminator: 2)
!1828 = !DILocation(line: 245, column: 2, scope: !1435)
!1829 = !DILocation(line: 246, column: 16, scope: !1435)
!1830 = !DILocation(line: 247, column: 16, scope: !1435)
!1831 = !DILocation(line: 248, column: 16, scope: !1435)
!1832 = !DILocation(line: 249, column: 16, scope: !1435)
!1833 = !DILocation(line: 250, column: 16, scope: !1435)
!1834 = !DILocation(line: 251, column: 16, scope: !1435)
!1835 = !DILocation(line: 252, column: 16, scope: !1435)
!1836 = !DILocation(line: 253, column: 16, scope: !1435)
!1837 = !DILocation(line: 254, column: 16, scope: !1435)
!1838 = !DILocation(line: 255, column: 16, scope: !1435)
!1839 = !DILocation(line: 245, column: 2, scope: !1840)
!1840 = !DILexicalBlockFile(scope: !1435, file: !21, discriminator: 1)
!1841 = !DILocation(line: 257, column: 2, scope: !1435)
!1842 = !DILocation(line: 260, column: 10, scope: !1435)
!1843 = !DILocation(line: 260, column: 8, scope: !1435)
!1844 = !DILocation(line: 261, column: 6, scope: !1845)
!1845 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 261, column: 6)
!1846 = !DILocation(line: 261, column: 12, scope: !1845)
!1847 = !DILocation(line: 261, column: 6, scope: !1435)
!1848 = !DILocation(line: 263, column: 51, scope: !1849)
!1849 = distinct !DILexicalBlock(scope: !1845, file: !21, line: 262, column: 2)
!1850 = !DILocation(line: 263, column: 32, scope: !1849)
!1851 = !DILocation(line: 263, column: 3, scope: !1852)
!1852 = !DILexicalBlockFile(scope: !1849, file: !21, discriminator: 1)
!1853 = !DILocation(line: 264, column: 3, scope: !1849)
!1854 = !DILocation(line: 268, column: 18, scope: !1435)
!1855 = !DILocation(line: 268, column: 2, scope: !1435)
!1856 = !DILocation(line: 269, column: 23, scope: !1435)
!1857 = !DILocation(line: 269, column: 2, scope: !1435)
!1858 = !DILocation(line: 270, column: 31, scope: !1435)
!1859 = !DILocation(line: 270, column: 38, scope: !1435)
!1860 = !DILocation(line: 270, column: 2, scope: !1435)
!1861 = !DILocation(line: 271, column: 24, scope: !1435)
!1862 = !DILocation(line: 271, column: 3, scope: !1435)
!1863 = !DILocation(line: 271, column: 12, scope: !1435)
!1864 = !DILocation(line: 273, column: 18, scope: !1435)
!1865 = !DILocation(line: 273, column: 2, scope: !1435)
!1866 = !DILocation(line: 279, column: 2, scope: !1435)
!1867 = distinct !{!1867, !1866}
!1868 = !DILocalVariable(name: "err", scope: !1869, file: !21, line: 279, type: !23)
!1869 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 279, column: 2)
!1870 = !DILocation(line: 279, column: 2, scope: !1869)
!1871 = !DILocation(line: 279, column: 2, scope: !1872)
!1872 = !DILexicalBlockFile(scope: !1869, file: !21, discriminator: 1)
!1873 = !DILocation(line: 279, column: 2, scope: !1874)
!1874 = !DILexicalBlockFile(scope: !1875, file: !21, discriminator: 2)
!1875 = distinct !DILexicalBlock(scope: !1876, file: !21, line: 279, column: 2)
!1876 = distinct !DILexicalBlock(scope: !1869, file: !21, line: 279, column: 2)
!1877 = !DILocation(line: 279, column: 2, scope: !1878)
!1878 = !DILexicalBlockFile(scope: !1874, file: !21, discriminator: 4)
!1879 = !DILocation(line: 279, column: 2, scope: !1880)
!1880 = !DILexicalBlockFile(scope: !1874, file: !21, discriminator: 5)
!1881 = !DILocation(line: 279, column: 2, scope: !1882)
!1882 = !DILexicalBlockFile(scope: !1869, file: !21, discriminator: 3)
!1883 = !DILocation(line: 280, column: 2, scope: !1435)
!1884 = distinct !{!1884, !1883}
!1885 = !DILocalVariable(name: "err", scope: !1886, file: !21, line: 280, type: !23)
!1886 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 280, column: 2)
!1887 = !DILocation(line: 280, column: 2, scope: !1886)
!1888 = !DILocation(line: 280, column: 2, scope: !1889)
!1889 = !DILexicalBlockFile(scope: !1886, file: !21, discriminator: 1)
!1890 = !DILocation(line: 280, column: 2, scope: !1891)
!1891 = !DILexicalBlockFile(scope: !1892, file: !21, discriminator: 2)
!1892 = distinct !DILexicalBlock(scope: !1893, file: !21, line: 280, column: 2)
!1893 = distinct !DILexicalBlock(scope: !1886, file: !21, line: 280, column: 2)
!1894 = !DILocation(line: 280, column: 2, scope: !1895)
!1895 = !DILexicalBlockFile(scope: !1891, file: !21, discriminator: 4)
!1896 = !DILocation(line: 280, column: 2, scope: !1897)
!1897 = !DILexicalBlockFile(scope: !1891, file: !21, discriminator: 5)
!1898 = !DILocation(line: 280, column: 2, scope: !1899)
!1899 = !DILexicalBlockFile(scope: !1886, file: !21, discriminator: 3)
!1900 = !DILocation(line: 283, column: 18, scope: !1435)
!1901 = !DILocation(line: 283, column: 2, scope: !1435)
!1902 = !DILocation(line: 284, column: 23, scope: !1435)
!1903 = !DILocation(line: 284, column: 2, scope: !1435)
!1904 = !DILocation(line: 285, column: 31, scope: !1435)
!1905 = !DILocation(line: 285, column: 38, scope: !1435)
!1906 = !DILocation(line: 285, column: 2, scope: !1435)
!1907 = !DILocation(line: 286, column: 28, scope: !1435)
!1908 = !DILocation(line: 286, column: 3, scope: !1435)
!1909 = !DILocation(line: 286, column: 16, scope: !1435)
!1910 = !DILocation(line: 288, column: 18, scope: !1435)
!1911 = !DILocation(line: 288, column: 2, scope: !1435)
!1912 = !DILocalVariable(name: "number_of_centers_to_close", scope: !1435, file: !21, line: 294, type: !11)
!1913 = !DILocation(line: 294, column: 6, scope: !1435)
!1914 = !DILocalVariable(name: "gl_cost_of_opening_x", scope: !1435, file: !21, line: 295, type: !118)
!1915 = !DILocation(line: 295, column: 8, scope: !1435)
!1916 = !DILocation(line: 295, column: 31, scope: !1435)
!1917 = !DILocalVariable(name: "gl_lower", scope: !1435, file: !21, line: 296, type: !117)
!1918 = !DILocation(line: 296, column: 9, scope: !1435)
!1919 = !DILocation(line: 296, column: 21, scope: !1435)
!1920 = !DILocation(line: 296, column: 32, scope: !1435)
!1921 = !DILocation(line: 296, column: 41, scope: !1435)
!1922 = !DILocation(line: 296, column: 39, scope: !1435)
!1923 = !DILocalVariable(name: "i", scope: !1924, file: !21, line: 298, type: !11)
!1924 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 298, column: 2)
!1925 = !DILocation(line: 298, column: 10, scope: !1924)
!1926 = !DILocation(line: 298, column: 6, scope: !1924)
!1927 = !DILocation(line: 298, column: 15, scope: !1928)
!1928 = !DILexicalBlockFile(scope: !1929, file: !21, discriminator: 1)
!1929 = distinct !DILexicalBlock(scope: !1924, file: !21, line: 298, column: 2)
!1930 = !DILocation(line: 298, column: 19, scope: !1928)
!1931 = !DILocation(line: 298, column: 17, scope: !1928)
!1932 = !DILocation(line: 298, column: 2, scope: !1928)
!1933 = !DILocation(line: 300, column: 7, scope: !1934)
!1934 = distinct !DILexicalBlock(scope: !1935, file: !21, line: 300, column: 7)
!1935 = distinct !DILexicalBlock(scope: !1929, file: !21, line: 299, column: 2)
!1936 = !DILocation(line: 300, column: 17, scope: !1934)
!1937 = !DILocation(line: 300, column: 7, scope: !1935)
!1938 = !DILocalVariable(name: "low", scope: !1939, file: !21, line: 302, type: !118)
!1939 = distinct !DILexicalBlock(scope: !1934, file: !21, line: 301, column: 3)
!1940 = !DILocation(line: 302, column: 10, scope: !1939)
!1941 = !DILocation(line: 302, column: 16, scope: !1939)
!1942 = !DILocalVariable(name: "j", scope: !1943, file: !21, line: 303, type: !11)
!1943 = distinct !DILexicalBlock(scope: !1939, file: !21, line: 303, column: 7)
!1944 = !DILocation(line: 303, column: 16, scope: !1943)
!1945 = !DILocation(line: 303, column: 12, scope: !1943)
!1946 = !DILocation(line: 303, column: 23, scope: !1947)
!1947 = !DILexicalBlockFile(scope: !1948, file: !21, discriminator: 1)
!1948 = distinct !DILexicalBlock(scope: !1943, file: !21, line: 303, column: 7)
!1949 = !DILocation(line: 303, column: 27, scope: !1947)
!1950 = !DILocation(line: 303, column: 25, scope: !1947)
!1951 = !DILocation(line: 303, column: 7, scope: !1947)
!1952 = !DILocation(line: 305, column: 12, scope: !1953)
!1953 = distinct !DILexicalBlock(scope: !1948, file: !21, line: 304, column: 4)
!1954 = !DILocation(line: 305, column: 24, scope: !1953)
!1955 = !DILocation(line: 305, column: 26, scope: !1953)
!1956 = !DILocation(line: 305, column: 25, scope: !1953)
!1957 = !DILocation(line: 305, column: 35, scope: !1953)
!1958 = !DILocation(line: 305, column: 48, scope: !1953)
!1959 = !DILocation(line: 305, column: 33, scope: !1953)
!1960 = !DILocation(line: 305, column: 9, scope: !1953)
!1961 = !DILocation(line: 306, column: 4, scope: !1953)
!1962 = !DILocation(line: 303, column: 33, scope: !1963)
!1963 = !DILexicalBlockFile(scope: !1948, file: !21, discriminator: 2)
!1964 = !DILocation(line: 303, column: 7, scope: !1963)
!1965 = distinct !{!1965, !1966}
!1966 = !DILocation(line: 303, column: 7, scope: !1939)
!1967 = !DILocation(line: 308, column: 35, scope: !1939)
!1968 = !DILocation(line: 308, column: 7, scope: !1939)
!1969 = !DILocation(line: 308, column: 16, scope: !1939)
!1970 = !DILocation(line: 308, column: 29, scope: !1939)
!1971 = !DILocation(line: 308, column: 33, scope: !1939)
!1972 = !DILocation(line: 310, column: 12, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1939, file: !21, line: 310, column: 12)
!1974 = !DILocation(line: 310, column: 16, scope: !1973)
!1975 = !DILocation(line: 310, column: 12, scope: !1939)
!1976 = !DILocation(line: 312, column: 5, scope: !1977)
!1977 = distinct !DILexicalBlock(scope: !1973, file: !21, line: 311, column: 4)
!1978 = !DILocation(line: 313, column: 31, scope: !1977)
!1979 = !DILocation(line: 313, column: 5, scope: !1977)
!1980 = !DILocation(line: 313, column: 16, scope: !1977)
!1981 = !DILocation(line: 313, column: 18, scope: !1977)
!1982 = !DILocation(line: 313, column: 17, scope: !1977)
!1983 = !DILocation(line: 313, column: 25, scope: !1977)
!1984 = !DILocation(line: 313, column: 24, scope: !1977)
!1985 = !DILocation(line: 313, column: 28, scope: !1977)
!1986 = !DILocation(line: 314, column: 7, scope: !1977)
!1987 = !DILocation(line: 315, column: 3, scope: !1939)
!1988 = !DILocation(line: 316, column: 27, scope: !1935)
!1989 = !DILocation(line: 316, column: 38, scope: !1935)
!1990 = !DILocation(line: 316, column: 40, scope: !1935)
!1991 = !DILocation(line: 316, column: 39, scope: !1935)
!1992 = !DILocation(line: 316, column: 47, scope: !1935)
!1993 = !DILocation(line: 316, column: 46, scope: !1935)
!1994 = !DILocation(line: 316, column: 24, scope: !1935)
!1995 = !DILocation(line: 317, column: 2, scope: !1935)
!1996 = !DILocation(line: 298, column: 25, scope: !1997)
!1997 = !DILexicalBlockFile(scope: !1929, file: !21, discriminator: 2)
!1998 = !DILocation(line: 298, column: 2, scope: !1997)
!1999 = distinct !{!1999, !2000}
!2000 = !DILocation(line: 298, column: 2, scope: !1435)
!2001 = !DILocation(line: 320, column: 7, scope: !2002)
!2002 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 320, column: 7)
!2003 = !DILocation(line: 320, column: 28, scope: !2002)
!2004 = !DILocation(line: 320, column: 7, scope: !1435)
!2005 = !DILocalVariable(name: "i", scope: !2006, file: !21, line: 322, type: !11)
!2006 = distinct !DILexicalBlock(scope: !2007, file: !21, line: 322, column: 3)
!2007 = distinct !DILexicalBlock(scope: !2002, file: !21, line: 321, column: 2)
!2008 = !DILocation(line: 322, column: 11, scope: !2006)
!2009 = !DILocation(line: 322, column: 7, scope: !2006)
!2010 = !DILocation(line: 322, column: 18, scope: !2011)
!2011 = !DILexicalBlockFile(scope: !2012, file: !21, discriminator: 1)
!2012 = distinct !DILexicalBlock(scope: !2006, file: !21, line: 322, column: 3)
!2013 = !DILocation(line: 322, column: 22, scope: !2011)
!2014 = !DILocation(line: 322, column: 20, scope: !2011)
!2015 = !DILocation(line: 322, column: 3, scope: !2011)
!2016 = !DILocalVariable(name: "close_center", scope: !2017, file: !21, line: 324, type: !13)
!2017 = distinct !DILexicalBlock(scope: !2012, file: !21, line: 323, column: 3)
!2018 = !DILocation(line: 324, column: 9, scope: !2017)
!2019 = !DILocation(line: 324, column: 24, scope: !2017)
!2020 = !DILocation(line: 324, column: 33, scope: !2017)
!2021 = !DILocation(line: 324, column: 46, scope: !2017)
!2022 = !DILocation(line: 324, column: 54, scope: !2017)
!2023 = !DILocation(line: 324, column: 56, scope: !2017)
!2024 = !DILocation(line: 324, column: 59, scope: !2017)
!2025 = !DILocation(line: 324, column: 68, scope: !2017)
!2026 = !DILocation(line: 325, column: 9, scope: !2027)
!2027 = distinct !DILexicalBlock(scope: !2017, file: !21, line: 325, column: 9)
!2028 = !DILocation(line: 325, column: 27, scope: !2027)
!2029 = !DILocation(line: 325, column: 30, scope: !2027)
!2030 = !DILocation(line: 325, column: 33, scope: !2031)
!2031 = !DILexicalBlockFile(scope: !2027, file: !21, discriminator: 1)
!2032 = !DILocation(line: 325, column: 9, scope: !2031)
!2033 = !DILocation(line: 327, column: 30, scope: !2034)
!2034 = distinct !DILexicalBlock(scope: !2027, file: !21, line: 326, column: 4)
!2035 = !DILocation(line: 327, column: 38, scope: !2034)
!2036 = !DILocation(line: 327, column: 40, scope: !2034)
!2037 = !DILocation(line: 327, column: 44, scope: !2034)
!2038 = !DILocation(line: 327, column: 52, scope: !2034)
!2039 = !DILocation(line: 327, column: 54, scope: !2034)
!2040 = !DILocation(line: 327, column: 58, scope: !2034)
!2041 = !DILocation(line: 327, column: 25, scope: !2034)
!2042 = !DILocation(line: 327, column: 65, scope: !2034)
!2043 = !DILocation(line: 327, column: 73, scope: !2034)
!2044 = !DILocation(line: 327, column: 75, scope: !2034)
!2045 = !DILocation(line: 327, column: 78, scope: !2034)
!2046 = !DILocation(line: 327, column: 63, scope: !2034)
!2047 = !DILocation(line: 327, column: 5, scope: !2034)
!2048 = !DILocation(line: 327, column: 13, scope: !2034)
!2049 = !DILocation(line: 327, column: 15, scope: !2034)
!2050 = !DILocation(line: 327, column: 18, scope: !2034)
!2051 = !DILocation(line: 327, column: 23, scope: !2034)
!2052 = !DILocation(line: 328, column: 27, scope: !2034)
!2053 = !DILocation(line: 328, column: 5, scope: !2034)
!2054 = !DILocation(line: 328, column: 13, scope: !2034)
!2055 = !DILocation(line: 328, column: 15, scope: !2034)
!2056 = !DILocation(line: 328, column: 18, scope: !2034)
!2057 = !DILocation(line: 328, column: 25, scope: !2034)
!2058 = !DILocation(line: 329, column: 4, scope: !2034)
!2059 = !DILocation(line: 330, column: 3, scope: !2017)
!2060 = !DILocation(line: 322, column: 28, scope: !2061)
!2061 = !DILexicalBlockFile(scope: !2012, file: !21, discriminator: 2)
!2062 = !DILocation(line: 322, column: 3, scope: !2061)
!2063 = distinct !{!2063, !2064}
!2064 = !DILocation(line: 322, column: 3, scope: !2007)
!2065 = !DILocalVariable(name: "i", scope: !2066, file: !21, line: 332, type: !11)
!2066 = distinct !DILexicalBlock(scope: !2007, file: !21, line: 332, column: 3)
!2067 = !DILocation(line: 332, column: 11, scope: !2066)
!2068 = !DILocation(line: 332, column: 7, scope: !2066)
!2069 = !DILocation(line: 332, column: 18, scope: !2070)
!2070 = !DILexicalBlockFile(scope: !2071, file: !21, discriminator: 1)
!2071 = distinct !DILexicalBlock(scope: !2066, file: !21, line: 332, column: 3)
!2072 = !DILocation(line: 332, column: 22, scope: !2070)
!2073 = !DILocation(line: 332, column: 20, scope: !2070)
!2074 = !DILocation(line: 332, column: 3, scope: !2070)
!2075 = !DILocation(line: 334, column: 8, scope: !2076)
!2076 = distinct !DILexicalBlock(scope: !2077, file: !21, line: 334, column: 8)
!2077 = distinct !DILexicalBlock(scope: !2071, file: !21, line: 333, column: 3)
!2078 = !DILocation(line: 334, column: 18, scope: !2076)
!2079 = !DILocation(line: 334, column: 21, scope: !2076)
!2080 = !DILocation(line: 334, column: 24, scope: !2081)
!2081 = !DILexicalBlockFile(scope: !2076, file: !21, discriminator: 1)
!2082 = !DILocation(line: 334, column: 33, scope: !2081)
!2083 = !DILocation(line: 334, column: 46, scope: !2081)
!2084 = !DILocation(line: 334, column: 50, scope: !2081)
!2085 = !DILocation(line: 334, column: 8, scope: !2081)
!2086 = !DILocation(line: 336, column: 5, scope: !2087)
!2087 = distinct !DILexicalBlock(scope: !2076, file: !21, line: 335, column: 4)
!2088 = !DILocation(line: 336, column: 15, scope: !2087)
!2089 = !DILocation(line: 336, column: 18, scope: !2087)
!2090 = !DILocation(line: 337, column: 4, scope: !2087)
!2091 = !DILocation(line: 338, column: 3, scope: !2077)
!2092 = !DILocation(line: 332, column: 28, scope: !2093)
!2093 = !DILexicalBlockFile(scope: !2071, file: !21, discriminator: 2)
!2094 = !DILocation(line: 332, column: 3, scope: !2093)
!2095 = distinct !{!2095, !2096}
!2096 = !DILocation(line: 332, column: 3, scope: !2007)
!2097 = !DILocation(line: 340, column: 7, scope: !2098)
!2098 = distinct !DILexicalBlock(scope: !2007, file: !21, line: 340, column: 7)
!2099 = !DILocation(line: 340, column: 9, scope: !2098)
!2100 = !DILocation(line: 340, column: 14, scope: !2098)
!2101 = !DILocation(line: 340, column: 17, scope: !2102)
!2102 = !DILexicalBlockFile(scope: !2098, file: !21, discriminator: 1)
!2103 = !DILocation(line: 340, column: 21, scope: !2102)
!2104 = !DILocation(line: 340, column: 19, scope: !2102)
!2105 = !DILocation(line: 340, column: 7, scope: !2102)
!2106 = !DILocation(line: 342, column: 4, scope: !2107)
!2107 = distinct !DILexicalBlock(scope: !2098, file: !21, line: 341, column: 3)
!2108 = !DILocation(line: 342, column: 14, scope: !2107)
!2109 = !DILocation(line: 342, column: 17, scope: !2107)
!2110 = !DILocation(line: 343, column: 3, scope: !2107)
!2111 = !DILocation(line: 344, column: 18, scope: !2007)
!2112 = !DILocation(line: 344, column: 17, scope: !2007)
!2113 = !DILocation(line: 344, column: 29, scope: !2007)
!2114 = !DILocation(line: 344, column: 35, scope: !2007)
!2115 = !DILocation(line: 344, column: 33, scope: !2007)
!2116 = !DILocation(line: 344, column: 4, scope: !2007)
!2117 = !DILocation(line: 344, column: 15, scope: !2007)
!2118 = !DILocation(line: 345, column: 2, scope: !2007)
!2119 = !DILocation(line: 348, column: 24, scope: !2120)
!2120 = distinct !DILexicalBlock(scope: !2002, file: !21, line: 347, column: 2)
!2121 = !DILocation(line: 354, column: 7, scope: !1435)
!2122 = !DILocation(line: 354, column: 2, scope: !1435)
!2123 = !DILocation(line: 358, column: 18, scope: !1435)
!2124 = !DILocation(line: 358, column: 2, scope: !1435)
!2125 = !DILocation(line: 359, column: 23, scope: !1435)
!2126 = !DILocation(line: 359, column: 2, scope: !1435)
!2127 = !DILocation(line: 360, column: 31, scope: !1435)
!2128 = !DILocation(line: 360, column: 38, scope: !1435)
!2129 = !DILocation(line: 360, column: 2, scope: !1435)
!2130 = !DILocation(line: 361, column: 24, scope: !1435)
!2131 = !DILocation(line: 361, column: 3, scope: !1435)
!2132 = !DILocation(line: 361, column: 12, scope: !1435)
!2133 = !DILocation(line: 363, column: 18, scope: !1435)
!2134 = !DILocation(line: 363, column: 2, scope: !1435)
!2135 = !DILocation(line: 369, column: 2, scope: !1435)
!2136 = distinct !{!2136, !2135}
!2137 = !DILocalVariable(name: "err", scope: !2138, file: !21, line: 369, type: !23)
!2138 = distinct !DILexicalBlock(scope: !1435, file: !21, line: 369, column: 2)
!2139 = !DILocation(line: 369, column: 2, scope: !2138)
!2140 = !DILocation(line: 369, column: 2, scope: !2141)
!2141 = !DILexicalBlockFile(scope: !2138, file: !21, discriminator: 1)
!2142 = !DILocation(line: 369, column: 2, scope: !2143)
!2143 = !DILexicalBlockFile(scope: !2144, file: !21, discriminator: 2)
!2144 = distinct !DILexicalBlock(scope: !2145, file: !21, line: 369, column: 2)
!2145 = distinct !DILexicalBlock(scope: !2138, file: !21, line: 369, column: 2)
!2146 = !DILocation(line: 369, column: 2, scope: !2147)
!2147 = !DILexicalBlockFile(scope: !2143, file: !21, discriminator: 4)
!2148 = !DILocation(line: 369, column: 2, scope: !2149)
!2149 = !DILexicalBlockFile(scope: !2143, file: !21, discriminator: 5)
!2150 = !DILocation(line: 369, column: 2, scope: !2151)
!2151 = !DILexicalBlockFile(scope: !2138, file: !21, discriminator: 3)
!2152 = !DILocation(line: 373, column: 18, scope: !1435)
!2153 = !DILocation(line: 373, column: 2, scope: !1435)
!2154 = !DILocation(line: 374, column: 23, scope: !1435)
!2155 = !DILocation(line: 374, column: 2, scope: !1435)
!2156 = !DILocation(line: 375, column: 31, scope: !1435)
!2157 = !DILocation(line: 375, column: 38, scope: !1435)
!2158 = !DILocation(line: 375, column: 2, scope: !1435)
!2159 = !DILocation(line: 376, column: 22, scope: !1435)
!2160 = !DILocation(line: 376, column: 3, scope: !1435)
!2161 = !DILocation(line: 376, column: 10, scope: !1435)
!2162 = !DILocation(line: 378, column: 6, scope: !1435)
!2163 = !DILocation(line: 379, column: 10, scope: !1435)
!2164 = !DILocation(line: 379, column: 9, scope: !1435)
!2165 = !DILocation(line: 379, column: 2, scope: !1435)
!2166 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1799, file: !1798, line: 421, type: !1805, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !20, declaration: !1804, variables: !1222)
!2167 = !DILocalVariable(name: "this", arg: 1, scope: !2166, type: !2168, flags: DIFlagArtificial | DIFlagObjectPointer)
!2168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1799, size: 64, align: 64)
!2169 = !DILocation(line: 0, scope: !2166)
!2170 = !DILocalVariable(name: "vx", arg: 2, scope: !2166, file: !1798, line: 421, type: !492)
!2171 = !DILocation(line: 421, column: 43, scope: !2166)
!2172 = !DILocalVariable(name: "vy", arg: 3, scope: !2166, file: !1798, line: 421, type: !492)
!2173 = !DILocation(line: 421, column: 64, scope: !2166)
!2174 = !DILocalVariable(name: "vz", arg: 4, scope: !2166, file: !1798, line: 421, type: !492)
!2175 = !DILocation(line: 421, column: 85, scope: !2166)
!2176 = !DILocation(line: 421, column: 95, scope: !2166)
!2177 = !DILocation(line: 421, column: 97, scope: !2166)
!2178 = !DILocation(line: 421, column: 102, scope: !2166)
!2179 = !DILocation(line: 421, column: 104, scope: !2166)
!2180 = !DILocation(line: 421, column: 109, scope: !2166)
!2181 = !DILocation(line: 421, column: 111, scope: !2166)
!2182 = !DILocation(line: 421, column: 116, scope: !2166)
!2183 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_streamcluster_cuda.cu", scope: !21, file: !21, type: !2184, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !20, variables: !1222)
!2184 = !DISubroutineType(types: !1222)
!2185 = !DILocation(line: 0, scope: !2183)
