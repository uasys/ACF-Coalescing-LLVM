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

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@work_mem_h = global float* null, align 8
@coord_h = global float* null, align 8
@work_mem_d = global float* null, align 8
@coord_d = global float* null, align 8
@center_table_d = global i32* null, align 8
@switch_membership_d = global i8* null, align 8
@p = global %struct.Point* null, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [42 x i8] c"Cuda error in file '%s' in line %i : %s.\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"streamcluster_cuda.cu\00", align 1
@_ZL4iter = internal global i32 0, align 4
@.str.2 = private unnamed_addr constant [18 x i8] c"kernel error: %s\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_streamcluster_cuda.cu, i8* null }]

; Function Attrs: uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !1099 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !1101
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #2, !dbg !1102
  ret void, !dbg !1101
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #2

; Function Attrs: uwtable
define void @_Z19kernel_compute_costiilP5PointiiPfS1_PiPb(i32 %num, i32 %dim, i64 %x, %struct.Point* %p, i32 %K, i32 %stride, float* %coord_d, float* %work_mem_d, i32* %center_table_d, i8* %switch_membership_d) #0 !dbg !1104 {
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
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !1107, metadata !1108), !dbg !1109
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !1110, metadata !1108), !dbg !1111
  store i64 %x, i64* %x.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %x.addr, metadata !1112, metadata !1108), !dbg !1113
  store %struct.Point* %p, %struct.Point** %p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Point** %p.addr, metadata !1114, metadata !1108), !dbg !1115
  store i32 %K, i32* %K.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %K.addr, metadata !1116, metadata !1108), !dbg !1117
  store i32 %stride, i32* %stride.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %stride.addr, metadata !1118, metadata !1108), !dbg !1119
  store float* %coord_d, float** %coord_d.addr, align 8
  call void @llvm.dbg.declare(metadata float** %coord_d.addr, metadata !1120, metadata !1108), !dbg !1121
  store float* %work_mem_d, float** %work_mem_d.addr, align 8
  call void @llvm.dbg.declare(metadata float** %work_mem_d.addr, metadata !1122, metadata !1108), !dbg !1123
  store i32* %center_table_d, i32** %center_table_d.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %center_table_d.addr, metadata !1124, metadata !1108), !dbg !1125
  store i8* %switch_membership_d, i8** %switch_membership_d.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %switch_membership_d.addr, metadata !1126, metadata !1108), !dbg !1127
  %0 = bitcast i32* %num.addr to i8*, !dbg !1128
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !1128
  %2 = icmp eq i32 %1, 0, !dbg !1128
  br i1 %2, label %setup.next, label %setup.end, !dbg !1128

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %dim.addr to i8*, !dbg !1129
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 4, i64 4), !dbg !1129
  %5 = icmp eq i32 %4, 0, !dbg !1129
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1129

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i64* %x.addr to i8*, !dbg !1131
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 8), !dbg !1131
  %8 = icmp eq i32 %7, 0, !dbg !1131
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1131

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast %struct.Point** %p.addr to i8*, !dbg !1133
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 16), !dbg !1133
  %11 = icmp eq i32 %10, 0, !dbg !1133
  br i1 %11, label %setup.next3, label %setup.end, !dbg !1133

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %K.addr to i8*, !dbg !1135
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 24), !dbg !1135
  %14 = icmp eq i32 %13, 0, !dbg !1135
  br i1 %14, label %setup.next4, label %setup.end, !dbg !1135

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %stride.addr to i8*, !dbg !1137
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 4, i64 28), !dbg !1137
  %17 = icmp eq i32 %16, 0, !dbg !1137
  br i1 %17, label %setup.next5, label %setup.end, !dbg !1137

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast float** %coord_d.addr to i8*, !dbg !1139
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 32), !dbg !1139
  %20 = icmp eq i32 %19, 0, !dbg !1139
  br i1 %20, label %setup.next6, label %setup.end, !dbg !1139

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast float** %work_mem_d.addr to i8*, !dbg !1141
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 8, i64 40), !dbg !1141
  %23 = icmp eq i32 %22, 0, !dbg !1141
  br i1 %23, label %setup.next7, label %setup.end, !dbg !1141

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast i32** %center_table_d.addr to i8*, !dbg !1143
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 8, i64 48), !dbg !1143
  %26 = icmp eq i32 %25, 0, !dbg !1143
  br i1 %26, label %setup.next8, label %setup.end, !dbg !1143

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast i8** %switch_membership_d.addr to i8*, !dbg !1145
  %28 = call i32 @cudaSetupArgument(i8* %27, i64 8, i64 56), !dbg !1145
  %29 = icmp eq i32 %28, 0, !dbg !1145
  br i1 %29, label %setup.next9, label %setup.end, !dbg !1145

setup.next9:                                      ; preds = %setup.next8
  %30 = call i32 @cudaLaunch(i8* bitcast (void (i32, i32, i64, %struct.Point*, i32, i32, float*, float*, i32*, i8*)* @_Z19kernel_compute_costiilP5PointiiPfS1_PiPb to i8*)), !dbg !1147
  br label %setup.end, !dbg !1147

setup.end:                                        ; preds = %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1149
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @_Z11allocDevMemii(i32 %num, i32 %dim) #0 !dbg !1150 {
entry:
  %num.addr = alloca i32, align 4
  %dim.addr = alloca i32, align 4
  %err = alloca i32, align 4
  %err4 = alloca i32, align 4
  %err15 = alloca i32, align 4
  %err26 = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !1153, metadata !1108), !dbg !1154
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !1155, metadata !1108), !dbg !1156
  br label %do.body, !dbg !1157, !llvm.loop !1158

do.body:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %err, metadata !1159, metadata !1108), !dbg !1161
  %0 = load i32, i32* %num.addr, align 4, !dbg !1162
  %conv = sext i32 %0 to i64, !dbg !1162
  %mul = mul i64 %conv, 4, !dbg !1162
  %call = call i32 @cudaMalloc(i8** bitcast (i32** @center_table_d to i8**), i64 %mul), !dbg !1162
  store i32 %call, i32* %err, align 4, !dbg !1162
  %1 = load i32, i32* %err, align 4, !dbg !1162
  %cmp = icmp ne i32 0, %1, !dbg !1162
  br i1 %cmp, label %if.then, label %if.end, !dbg !1162

if.then:                                          ; preds = %do.body
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1164
  %3 = load i32, i32* %err, align 4, !dbg !1164
  %call1 = call i8* @cudaGetErrorString(i32 %3), !dbg !1164
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 96, i8* %call1), !dbg !1168
  call void @exit(i32 1) #8, !dbg !1170
  unreachable, !dbg !1164

if.end:                                           ; preds = %do.body
  br label %do.end, !dbg !1172

do.end:                                           ; preds = %if.end
  br label %do.body3, !dbg !1174, !llvm.loop !1175

do.body3:                                         ; preds = %do.end
  call void @llvm.dbg.declare(metadata i32* %err4, metadata !1176, metadata !1108), !dbg !1178
  %4 = load i32, i32* %num.addr, align 4, !dbg !1179
  %conv5 = sext i32 %4 to i64, !dbg !1179
  %mul6 = mul i64 %conv5, 1, !dbg !1179
  %call7 = call i32 @cudaMalloc(i8** @switch_membership_d, i64 %mul6), !dbg !1179
  store i32 %call7, i32* %err4, align 4, !dbg !1179
  %5 = load i32, i32* %err4, align 4, !dbg !1179
  %cmp8 = icmp ne i32 0, %5, !dbg !1179
  br i1 %cmp8, label %if.then9, label %if.end12, !dbg !1179

if.then9:                                         ; preds = %do.body3
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1181
  %7 = load i32, i32* %err4, align 4, !dbg !1181
  %call10 = call i8* @cudaGetErrorString(i32 %7), !dbg !1181
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 97, i8* %call10), !dbg !1185
  call void @exit(i32 1) #8, !dbg !1187
  unreachable, !dbg !1181

if.end12:                                         ; preds = %do.body3
  br label %do.end13, !dbg !1189

do.end13:                                         ; preds = %if.end12
  br label %do.body14, !dbg !1191, !llvm.loop !1192

do.body14:                                        ; preds = %do.end13
  call void @llvm.dbg.declare(metadata i32* %err15, metadata !1193, metadata !1108), !dbg !1195
  %8 = load i32, i32* %num.addr, align 4, !dbg !1196
  %conv16 = sext i32 %8 to i64, !dbg !1196
  %mul17 = mul i64 %conv16, 32, !dbg !1196
  %call18 = call i32 @cudaMalloc(i8** bitcast (%struct.Point** @p to i8**), i64 %mul17), !dbg !1196
  store i32 %call18, i32* %err15, align 4, !dbg !1196
  %9 = load i32, i32* %err15, align 4, !dbg !1196
  %cmp19 = icmp ne i32 0, %9, !dbg !1196
  br i1 %cmp19, label %if.then20, label %if.end23, !dbg !1196

if.then20:                                        ; preds = %do.body14
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1198
  %11 = load i32, i32* %err15, align 4, !dbg !1198
  %call21 = call i8* @cudaGetErrorString(i32 %11), !dbg !1198
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 98, i8* %call21), !dbg !1202
  call void @exit(i32 1) #8, !dbg !1204
  unreachable, !dbg !1198

if.end23:                                         ; preds = %do.body14
  br label %do.end24, !dbg !1206

do.end24:                                         ; preds = %if.end23
  br label %do.body25, !dbg !1208, !llvm.loop !1209

do.body25:                                        ; preds = %do.end24
  call void @llvm.dbg.declare(metadata i32* %err26, metadata !1210, metadata !1108), !dbg !1212
  %12 = load i32, i32* %num.addr, align 4, !dbg !1213
  %13 = load i32, i32* %dim.addr, align 4, !dbg !1213
  %mul27 = mul nsw i32 %12, %13, !dbg !1213
  %conv28 = sext i32 %mul27 to i64, !dbg !1213
  %mul29 = mul i64 %conv28, 4, !dbg !1213
  %call30 = call i32 @cudaMalloc(i8** bitcast (float** @coord_d to i8**), i64 %mul29), !dbg !1213
  store i32 %call30, i32* %err26, align 4, !dbg !1213
  %14 = load i32, i32* %err26, align 4, !dbg !1213
  %cmp31 = icmp ne i32 0, %14, !dbg !1213
  br i1 %cmp31, label %if.then32, label %if.end35, !dbg !1213

if.then32:                                        ; preds = %do.body25
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1215
  %16 = load i32, i32* %err26, align 4, !dbg !1215
  %call33 = call i8* @cudaGetErrorString(i32 %16), !dbg !1215
  %call34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 99, i8* %call33), !dbg !1219
  call void @exit(i32 1) #8, !dbg !1221
  unreachable, !dbg !1215

if.end35:                                         ; preds = %do.body25
  br label %do.end36, !dbg !1223

do.end36:                                         ; preds = %if.end35
  ret void, !dbg !1225
}

declare i32 @cudaMalloc(i8**, i64) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @cudaGetErrorString(i32) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind uwtable
define void @_Z12allocHostMemii(i32 %num, i32 %dim) #5 !dbg !1226 {
entry:
  %num.addr = alloca i32, align 4
  %dim.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num.addr, metadata !1227, metadata !1108), !dbg !1228
  store i32 %dim, i32* %dim.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dim.addr, metadata !1229, metadata !1108), !dbg !1230
  %0 = load i32, i32* %num.addr, align 4, !dbg !1231
  %1 = load i32, i32* %dim.addr, align 4, !dbg !1232
  %mul = mul nsw i32 %0, %1, !dbg !1233
  %conv = sext i32 %mul to i64, !dbg !1231
  %mul1 = mul i64 %conv, 4, !dbg !1234
  %call = call noalias i8* @malloc(i64 %mul1) #2, !dbg !1235
  %2 = bitcast i8* %call to float*, !dbg !1236
  store float* %2, float** @coord_h, align 8, !dbg !1237
  ret void, !dbg !1238
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #6

; Function Attrs: uwtable
define void @_Z10freeDevMemv() #0 !dbg !1239 {
entry:
  %err = alloca i32, align 4
  %err4 = alloca i32, align 4
  %err13 = alloca i32, align 4
  %err22 = alloca i32, align 4
  br label %do.body, !dbg !1240, !llvm.loop !1241

do.body:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %err, metadata !1242, metadata !1108), !dbg !1244
  %0 = load i32*, i32** @center_table_d, align 8, !dbg !1245
  %1 = bitcast i32* %0 to i8*, !dbg !1245
  %call = call i32 @cudaFree(i8* %1), !dbg !1245
  store i32 %call, i32* %err, align 4, !dbg !1245
  %2 = load i32, i32* %err, align 4, !dbg !1245
  %cmp = icmp ne i32 0, %2, !dbg !1245
  br i1 %cmp, label %if.then, label %if.end, !dbg !1245

if.then:                                          ; preds = %do.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1247
  %4 = load i32, i32* %err, align 4, !dbg !1247
  %call1 = call i8* @cudaGetErrorString(i32 %4), !dbg !1247
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 115, i8* %call1), !dbg !1251
  call void @exit(i32 1) #8, !dbg !1253
  unreachable, !dbg !1247

if.end:                                           ; preds = %do.body
  br label %do.end, !dbg !1255

do.end:                                           ; preds = %if.end
  br label %do.body3, !dbg !1257, !llvm.loop !1258

do.body3:                                         ; preds = %do.end
  call void @llvm.dbg.declare(metadata i32* %err4, metadata !1259, metadata !1108), !dbg !1261
  %5 = load i8*, i8** @switch_membership_d, align 8, !dbg !1262
  %call5 = call i32 @cudaFree(i8* %5), !dbg !1262
  store i32 %call5, i32* %err4, align 4, !dbg !1262
  %6 = load i32, i32* %err4, align 4, !dbg !1262
  %cmp6 = icmp ne i32 0, %6, !dbg !1262
  br i1 %cmp6, label %if.then7, label %if.end10, !dbg !1262

if.then7:                                         ; preds = %do.body3
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1264
  %8 = load i32, i32* %err4, align 4, !dbg !1264
  %call8 = call i8* @cudaGetErrorString(i32 %8), !dbg !1264
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 116, i8* %call8), !dbg !1268
  call void @exit(i32 1) #8, !dbg !1270
  unreachable, !dbg !1264

if.end10:                                         ; preds = %do.body3
  br label %do.end11, !dbg !1272

do.end11:                                         ; preds = %if.end10
  br label %do.body12, !dbg !1274, !llvm.loop !1275

do.body12:                                        ; preds = %do.end11
  call void @llvm.dbg.declare(metadata i32* %err13, metadata !1276, metadata !1108), !dbg !1278
  %9 = load %struct.Point*, %struct.Point** @p, align 8, !dbg !1279
  %10 = bitcast %struct.Point* %9 to i8*, !dbg !1279
  %call14 = call i32 @cudaFree(i8* %10), !dbg !1279
  store i32 %call14, i32* %err13, align 4, !dbg !1279
  %11 = load i32, i32* %err13, align 4, !dbg !1279
  %cmp15 = icmp ne i32 0, %11, !dbg !1279
  br i1 %cmp15, label %if.then16, label %if.end19, !dbg !1279

if.then16:                                        ; preds = %do.body12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1281
  %13 = load i32, i32* %err13, align 4, !dbg !1281
  %call17 = call i8* @cudaGetErrorString(i32 %13), !dbg !1281
  %call18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 117, i8* %call17), !dbg !1285
  call void @exit(i32 1) #8, !dbg !1287
  unreachable, !dbg !1281

if.end19:                                         ; preds = %do.body12
  br label %do.end20, !dbg !1289

do.end20:                                         ; preds = %if.end19
  br label %do.body21, !dbg !1291, !llvm.loop !1292

do.body21:                                        ; preds = %do.end20
  call void @llvm.dbg.declare(metadata i32* %err22, metadata !1293, metadata !1108), !dbg !1295
  %14 = load float*, float** @coord_d, align 8, !dbg !1296
  %15 = bitcast float* %14 to i8*, !dbg !1296
  %call23 = call i32 @cudaFree(i8* %15), !dbg !1296
  store i32 %call23, i32* %err22, align 4, !dbg !1296
  %16 = load i32, i32* %err22, align 4, !dbg !1296
  %cmp24 = icmp ne i32 0, %16, !dbg !1296
  br i1 %cmp24, label %if.then25, label %if.end28, !dbg !1296

if.then25:                                        ; preds = %do.body21
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1298
  %18 = load i32, i32* %err22, align 4, !dbg !1298
  %call26 = call i8* @cudaGetErrorString(i32 %18), !dbg !1298
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 118, i8* %call26), !dbg !1302
  call void @exit(i32 1) #8, !dbg !1304
  unreachable, !dbg !1298

if.end28:                                         ; preds = %do.body21
  br label %do.end29, !dbg !1306

do.end29:                                         ; preds = %if.end28
  ret void, !dbg !1308
}

declare i32 @cudaFree(i8*) #1

; Function Attrs: nounwind uwtable
define void @_Z11freeHostMemv() #5 !dbg !1309 {
entry:
  %0 = load float*, float** @coord_h, align 8, !dbg !1310
  %1 = bitcast float* %0 to i8*, !dbg !1310
  call void @free(i8* %1) #2, !dbg !1311
  ret void, !dbg !1312
}

; Function Attrs: nounwind
declare void @free(i8*) #6

; Function Attrs: uwtable
define float @_Z5pgainlP6PointsfPliPbPiS2_bPdS4_S4_S4_S4_S4_(i64 %x, %struct.Points* %points, float %z, i64* %numcenters, i32 %kmax, i8* %is_center, i32* %center_table, i8* %switch_membership, i1 zeroext %isCoordChanged, double* %serial_t, double* %cpu_to_gpu_t, double* %gpu_to_cpu_t, double* %alloc_t, double* %kernel_t, double* %free_t) #0 !dbg !1313 {
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
  call void @llvm.dbg.declare(metadata i64* %x.addr, metadata !1324, metadata !1108), !dbg !1325
  store %struct.Points* %points, %struct.Points** %points.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Points** %points.addr, metadata !1326, metadata !1108), !dbg !1327
  store float %z, float* %z.addr, align 4
  call void @llvm.dbg.declare(metadata float* %z.addr, metadata !1328, metadata !1108), !dbg !1329
  store i64* %numcenters, i64** %numcenters.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %numcenters.addr, metadata !1330, metadata !1108), !dbg !1331
  store i32 %kmax, i32* %kmax.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %kmax.addr, metadata !1332, metadata !1108), !dbg !1333
  store i8* %is_center, i8** %is_center.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %is_center.addr, metadata !1334, metadata !1108), !dbg !1335
  store i32* %center_table, i32** %center_table.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %center_table.addr, metadata !1336, metadata !1108), !dbg !1337
  store i8* %switch_membership, i8** %switch_membership.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %switch_membership.addr, metadata !1338, metadata !1108), !dbg !1339
  %frombool = zext i1 %isCoordChanged to i8
  store i8 %frombool, i8* %isCoordChanged.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %isCoordChanged.addr, metadata !1340, metadata !1108), !dbg !1341
  store double* %serial_t, double** %serial_t.addr, align 8
  call void @llvm.dbg.declare(metadata double** %serial_t.addr, metadata !1342, metadata !1108), !dbg !1343
  store double* %cpu_to_gpu_t, double** %cpu_to_gpu_t.addr, align 8
  call void @llvm.dbg.declare(metadata double** %cpu_to_gpu_t.addr, metadata !1344, metadata !1108), !dbg !1345
  store double* %gpu_to_cpu_t, double** %gpu_to_cpu_t.addr, align 8
  call void @llvm.dbg.declare(metadata double** %gpu_to_cpu_t.addr, metadata !1346, metadata !1108), !dbg !1347
  store double* %alloc_t, double** %alloc_t.addr, align 8
  call void @llvm.dbg.declare(metadata double** %alloc_t.addr, metadata !1348, metadata !1108), !dbg !1349
  store double* %kernel_t, double** %kernel_t.addr, align 8
  call void @llvm.dbg.declare(metadata double** %kernel_t.addr, metadata !1350, metadata !1108), !dbg !1351
  store double* %free_t, double** %free_t.addr, align 8
  call void @llvm.dbg.declare(metadata double** %free_t.addr, metadata !1352, metadata !1108), !dbg !1353
  call void @llvm.dbg.declare(metadata float* %tmp_t, metadata !1354, metadata !1108), !dbg !1355
  call void @llvm.dbg.declare(metadata %struct.CUevent_st** %start, metadata !1356, metadata !1108), !dbg !1361
  call void @llvm.dbg.declare(metadata %struct.CUevent_st** %stop, metadata !1362, metadata !1108), !dbg !1363
  %call = call i32 @cudaEventCreate(%struct.CUevent_st** %start), !dbg !1364
  %call1 = call i32 @cudaEventCreate(%struct.CUevent_st** %stop), !dbg !1365
  %0 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1366
  %call2 = call i32 @cudaEventRecord(%struct.CUevent_st* %0, %struct.CUstream_st* null), !dbg !1367
  call void @llvm.dbg.declare(metadata i32* %error, metadata !1368, metadata !1108), !dbg !1370
  call void @llvm.dbg.declare(metadata i32* %stride, metadata !1371, metadata !1108), !dbg !1372
  %1 = load i64*, i64** %numcenters.addr, align 8, !dbg !1373
  %2 = load i64, i64* %1, align 8, !dbg !1374
  %add = add nsw i64 %2, 1, !dbg !1375
  %conv = trunc i64 %add to i32, !dbg !1374
  store i32 %conv, i32* %stride, align 4, !dbg !1372
  call void @llvm.dbg.declare(metadata i32* %K, metadata !1376, metadata !1108), !dbg !1377
  %3 = load i64*, i64** %numcenters.addr, align 8, !dbg !1378
  %4 = load i64, i64* %3, align 8, !dbg !1379
  %conv3 = trunc i64 %4 to i32, !dbg !1379
  store i32 %conv3, i32* %K, align 4, !dbg !1377
  call void @llvm.dbg.declare(metadata i32* %num, metadata !1380, metadata !1108), !dbg !1381
  %5 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1382
  %num4 = getelementptr inbounds %struct.Points, %struct.Points* %5, i32 0, i32 0, !dbg !1383
  %6 = load i64, i64* %num4, align 8, !dbg !1383
  %conv5 = trunc i64 %6 to i32, !dbg !1382
  store i32 %conv5, i32* %num, align 4, !dbg !1381
  call void @llvm.dbg.declare(metadata i32* %dim, metadata !1384, metadata !1108), !dbg !1385
  %7 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1386
  %dim6 = getelementptr inbounds %struct.Points, %struct.Points* %7, i32 0, i32 1, !dbg !1387
  %8 = load i32, i32* %dim6, align 8, !dbg !1387
  store i32 %8, i32* %dim, align 4, !dbg !1385
  call void @llvm.dbg.declare(metadata i32* %nThread, metadata !1388, metadata !1108), !dbg !1389
  %9 = load i32, i32* %num, align 4, !dbg !1390
  store i32 %9, i32* %nThread, align 4, !dbg !1389
  %10 = load i32, i32* %stride, align 4, !dbg !1391
  %11 = load i32, i32* %nThread, align 4, !dbg !1392
  %add7 = add nsw i32 %11, 1, !dbg !1393
  %mul = mul nsw i32 %10, %add7, !dbg !1394
  %conv8 = sext i32 %mul to i64, !dbg !1391
  %mul9 = mul i64 %conv8, 4, !dbg !1395
  %call10 = call noalias i8* @malloc(i64 %mul9) #2, !dbg !1396
  %12 = bitcast i8* %call10 to float*, !dbg !1397
  store float* %12, float** @work_mem_h, align 8, !dbg !1398
  %13 = load i32, i32* @_ZL4iter, align 4, !dbg !1399
  %cmp = icmp eq i32 %13, 0, !dbg !1401
  br i1 %cmp, label %if.then, label %if.end, !dbg !1402

if.then:                                          ; preds = %entry
  %14 = load i32, i32* %num, align 4, !dbg !1403
  %15 = load i32, i32* %dim, align 4, !dbg !1405
  call void @_Z12allocHostMemii(i32 %14, i32 %15), !dbg !1406
  br label %if.end, !dbg !1407

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i32* %count, metadata !1408, metadata !1108), !dbg !1409
  store i32 0, i32* %count, align 4, !dbg !1409
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1410, metadata !1108), !dbg !1412
  store i32 0, i32* %i, align 4, !dbg !1412
  br label %for.cond, !dbg !1413

for.cond:                                         ; preds = %for.inc, %if.end
  %16 = load i32, i32* %i, align 4, !dbg !1414
  %17 = load i32, i32* %num, align 4, !dbg !1417
  %cmp11 = icmp slt i32 %16, %17, !dbg !1418
  br i1 %cmp11, label %for.body, label %for.end, !dbg !1419

for.body:                                         ; preds = %for.cond
  %18 = load i32, i32* %i, align 4, !dbg !1420
  %idxprom = sext i32 %18 to i64, !dbg !1423
  %19 = load i8*, i8** %is_center.addr, align 8, !dbg !1423
  %arrayidx = getelementptr inbounds i8, i8* %19, i64 %idxprom, !dbg !1423
  %20 = load i8, i8* %arrayidx, align 1, !dbg !1423
  %tobool = trunc i8 %20 to i1, !dbg !1423
  br i1 %tobool, label %if.then12, label %if.end15, !dbg !1424

if.then12:                                        ; preds = %for.body
  %21 = load i32, i32* %count, align 4, !dbg !1425
  %inc = add nsw i32 %21, 1, !dbg !1425
  store i32 %inc, i32* %count, align 4, !dbg !1425
  %22 = load i32, i32* %i, align 4, !dbg !1427
  %idxprom13 = sext i32 %22 to i64, !dbg !1428
  %23 = load i32*, i32** %center_table.addr, align 8, !dbg !1428
  %arrayidx14 = getelementptr inbounds i32, i32* %23, i64 %idxprom13, !dbg !1428
  store i32 %21, i32* %arrayidx14, align 4, !dbg !1429
  br label %if.end15, !dbg !1430

if.end15:                                         ; preds = %if.then12, %for.body
  br label %for.inc, !dbg !1431

for.inc:                                          ; preds = %if.end15
  %24 = load i32, i32* %i, align 4, !dbg !1432
  %inc16 = add nsw i32 %24, 1, !dbg !1432
  store i32 %inc16, i32* %i, align 4, !dbg !1432
  br label %for.cond, !dbg !1434, !llvm.loop !1435

for.end:                                          ; preds = %for.cond
  %25 = load i8, i8* %isCoordChanged.addr, align 1, !dbg !1437
  %tobool17 = trunc i8 %25 to i1, !dbg !1437
  br i1 %tobool17, label %if.then19, label %lor.lhs.false, !dbg !1439

lor.lhs.false:                                    ; preds = %for.end
  %26 = load i32, i32* @_ZL4iter, align 4, !dbg !1440
  %cmp18 = icmp eq i32 %26, 0, !dbg !1442
  br i1 %cmp18, label %if.then19, label %if.end41, !dbg !1443

if.then19:                                        ; preds = %lor.lhs.false, %for.end
  call void @llvm.dbg.declare(metadata i32* %i20, metadata !1444, metadata !1108), !dbg !1447
  store i32 0, i32* %i20, align 4, !dbg !1447
  br label %for.cond21, !dbg !1448

for.cond21:                                       ; preds = %for.inc38, %if.then19
  %27 = load i32, i32* %i20, align 4, !dbg !1449
  %28 = load i32, i32* %dim, align 4, !dbg !1452
  %cmp22 = icmp slt i32 %27, %28, !dbg !1453
  br i1 %cmp22, label %for.body23, label %for.end40, !dbg !1454

for.body23:                                       ; preds = %for.cond21
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1455, metadata !1108), !dbg !1458
  store i32 0, i32* %j, align 4, !dbg !1458
  br label %for.cond24, !dbg !1459

for.cond24:                                       ; preds = %for.inc35, %for.body23
  %29 = load i32, i32* %j, align 4, !dbg !1460
  %30 = load i32, i32* %num, align 4, !dbg !1463
  %cmp25 = icmp slt i32 %29, %30, !dbg !1464
  br i1 %cmp25, label %for.body26, label %for.end37, !dbg !1465

for.body26:                                       ; preds = %for.cond24
  %31 = load i32, i32* %i20, align 4, !dbg !1466
  %idxprom27 = sext i32 %31 to i64, !dbg !1468
  %32 = load i32, i32* %j, align 4, !dbg !1469
  %idxprom28 = sext i32 %32 to i64, !dbg !1468
  %33 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1468
  %p = getelementptr inbounds %struct.Points, %struct.Points* %33, i32 0, i32 2, !dbg !1470
  %34 = load %struct.Point*, %struct.Point** %p, align 8, !dbg !1470
  %arrayidx29 = getelementptr inbounds %struct.Point, %struct.Point* %34, i64 %idxprom28, !dbg !1468
  %coord = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx29, i32 0, i32 1, !dbg !1471
  %35 = load float*, float** %coord, align 8, !dbg !1471
  %arrayidx30 = getelementptr inbounds float, float* %35, i64 %idxprom27, !dbg !1468
  %36 = load float, float* %arrayidx30, align 4, !dbg !1468
  %37 = load i32, i32* %num, align 4, !dbg !1472
  %38 = load i32, i32* %i20, align 4, !dbg !1473
  %mul31 = mul nsw i32 %37, %38, !dbg !1474
  %39 = load i32, i32* %j, align 4, !dbg !1475
  %add32 = add nsw i32 %mul31, %39, !dbg !1476
  %idxprom33 = sext i32 %add32 to i64, !dbg !1477
  %40 = load float*, float** @coord_h, align 8, !dbg !1477
  %arrayidx34 = getelementptr inbounds float, float* %40, i64 %idxprom33, !dbg !1477
  store float %36, float* %arrayidx34, align 4, !dbg !1478
  br label %for.inc35, !dbg !1479

for.inc35:                                        ; preds = %for.body26
  %41 = load i32, i32* %j, align 4, !dbg !1480
  %inc36 = add nsw i32 %41, 1, !dbg !1480
  store i32 %inc36, i32* %j, align 4, !dbg !1480
  br label %for.cond24, !dbg !1482, !llvm.loop !1483

for.end37:                                        ; preds = %for.cond24
  br label %for.inc38, !dbg !1485

for.inc38:                                        ; preds = %for.end37
  %42 = load i32, i32* %i20, align 4, !dbg !1486
  %inc39 = add nsw i32 %42, 1, !dbg !1486
  store i32 %inc39, i32* %i20, align 4, !dbg !1486
  br label %for.cond21, !dbg !1488, !llvm.loop !1489

for.end40:                                        ; preds = %for.cond21
  br label %if.end41, !dbg !1491

if.end41:                                         ; preds = %for.end40, %lor.lhs.false
  %43 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1492
  %call42 = call i32 @cudaEventRecord(%struct.CUevent_st* %43, %struct.CUstream_st* null), !dbg !1493
  %44 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1494
  %call43 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %44), !dbg !1495
  %45 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1496
  %46 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1497
  %call44 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %45, %struct.CUevent_st* %46), !dbg !1498
  %47 = load float, float* %tmp_t, align 4, !dbg !1499
  %conv45 = fpext float %47 to double, !dbg !1499
  %48 = load double*, double** %serial_t.addr, align 8, !dbg !1500
  %49 = load double, double* %48, align 8, !dbg !1501
  %add46 = fadd double %49, %conv45, !dbg !1501
  store double %add46, double* %48, align 8, !dbg !1501
  %50 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1502
  %call47 = call i32 @cudaEventRecord(%struct.CUevent_st* %50, %struct.CUstream_st* null), !dbg !1503
  br label %do.body, !dbg !1504, !llvm.loop !1505

do.body:                                          ; preds = %if.end41
  call void @llvm.dbg.declare(metadata i32* %err, metadata !1506, metadata !1108), !dbg !1508
  %51 = load i32, i32* %stride, align 4, !dbg !1509
  %52 = load i32, i32* %nThread, align 4, !dbg !1509
  %add48 = add nsw i32 %52, 1, !dbg !1509
  %mul49 = mul nsw i32 %51, %add48, !dbg !1509
  %conv50 = sext i32 %mul49 to i64, !dbg !1509
  %mul51 = mul i64 %conv50, 4, !dbg !1509
  %call52 = call i32 @cudaMalloc(i8** bitcast (float** @work_mem_d to i8**), i64 %mul51), !dbg !1509
  store i32 %call52, i32* %err, align 4, !dbg !1509
  %53 = load i32, i32* %err, align 4, !dbg !1509
  %cmp53 = icmp ne i32 0, %53, !dbg !1509
  br i1 %cmp53, label %if.then54, label %if.end57, !dbg !1509

if.then54:                                        ; preds = %do.body
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1511
  %55 = load i32, i32* %err, align 4, !dbg !1511
  %call55 = call i8* @cudaGetErrorString(i32 %55), !dbg !1511
  %call56 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 197, i8* %call55), !dbg !1515
  call void @exit(i32 1) #8, !dbg !1517
  unreachable, !dbg !1511

if.end57:                                         ; preds = %do.body
  br label %do.end, !dbg !1519

do.end:                                           ; preds = %if.end57
  %56 = load i32, i32* @_ZL4iter, align 4, !dbg !1521
  %cmp58 = icmp eq i32 %56, 0, !dbg !1523
  br i1 %cmp58, label %if.then59, label %if.end60, !dbg !1524

if.then59:                                        ; preds = %do.end
  %57 = load i32, i32* %num, align 4, !dbg !1525
  %58 = load i32, i32* %dim, align 4, !dbg !1527
  call void @_Z11allocDevMemii(i32 %57, i32 %58), !dbg !1528
  br label %if.end60, !dbg !1529

if.end60:                                         ; preds = %if.then59, %do.end
  %59 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1530
  %call61 = call i32 @cudaEventRecord(%struct.CUevent_st* %59, %struct.CUstream_st* null), !dbg !1531
  %60 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1532
  %call62 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %60), !dbg !1533
  %61 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1534
  %62 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1535
  %call63 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %61, %struct.CUevent_st* %62), !dbg !1536
  %63 = load float, float* %tmp_t, align 4, !dbg !1537
  %conv64 = fpext float %63 to double, !dbg !1537
  %64 = load double*, double** %alloc_t.addr, align 8, !dbg !1538
  %65 = load double, double* %64, align 8, !dbg !1539
  %add65 = fadd double %65, %conv64, !dbg !1539
  store double %add65, double* %64, align 8, !dbg !1539
  %66 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1540
  %call66 = call i32 @cudaEventRecord(%struct.CUevent_st* %66, %struct.CUstream_st* null), !dbg !1541
  %67 = load i8, i8* %isCoordChanged.addr, align 1, !dbg !1542
  %tobool67 = trunc i8 %67 to i1, !dbg !1542
  br i1 %tobool67, label %if.then70, label %lor.lhs.false68, !dbg !1544

lor.lhs.false68:                                  ; preds = %if.end60
  %68 = load i32, i32* @_ZL4iter, align 4, !dbg !1545
  %cmp69 = icmp eq i32 %68, 0, !dbg !1547
  br i1 %cmp69, label %if.then70, label %if.end83, !dbg !1548

if.then70:                                        ; preds = %lor.lhs.false68, %if.end60
  br label %do.body71, !dbg !1549, !llvm.loop !1551

do.body71:                                        ; preds = %if.then70
  call void @llvm.dbg.declare(metadata i32* %err72, metadata !1552, metadata !1108), !dbg !1554
  %69 = load float*, float** @coord_d, align 8, !dbg !1555
  %70 = bitcast float* %69 to i8*, !dbg !1555
  %71 = load float*, float** @coord_h, align 8, !dbg !1555
  %72 = bitcast float* %71 to i8*, !dbg !1555
  %73 = load i32, i32* %num, align 4, !dbg !1555
  %74 = load i32, i32* %dim, align 4, !dbg !1555
  %mul73 = mul nsw i32 %73, %74, !dbg !1555
  %conv74 = sext i32 %mul73 to i64, !dbg !1555
  %mul75 = mul i64 %conv74, 4, !dbg !1555
  %call76 = call i32 @cudaMemcpy(i8* %70, i8* %72, i64 %mul75, i32 1), !dbg !1555
  store i32 %call76, i32* %err72, align 4, !dbg !1555
  %75 = load i32, i32* %err72, align 4, !dbg !1555
  %cmp77 = icmp ne i32 0, %75, !dbg !1555
  br i1 %cmp77, label %if.then78, label %if.end81, !dbg !1555

if.then78:                                        ; preds = %do.body71
  %76 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1557
  %77 = load i32, i32* %err72, align 4, !dbg !1557
  %call79 = call i8* @cudaGetErrorString(i32 %77), !dbg !1557
  %call80 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %76, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 219, i8* %call79), !dbg !1561
  call void @exit(i32 1) #8, !dbg !1563
  unreachable, !dbg !1557

if.end81:                                         ; preds = %do.body71
  br label %do.end82, !dbg !1565

do.end82:                                         ; preds = %if.end81
  br label %if.end83, !dbg !1567

if.end83:                                         ; preds = %do.end82, %lor.lhs.false68
  br label %do.body84, !dbg !1568, !llvm.loop !1569

do.body84:                                        ; preds = %if.end83
  call void @llvm.dbg.declare(metadata i32* %err85, metadata !1570, metadata !1108), !dbg !1572
  %78 = load i32*, i32** @center_table_d, align 8, !dbg !1573
  %79 = bitcast i32* %78 to i8*, !dbg !1573
  %80 = load i32*, i32** %center_table.addr, align 8, !dbg !1573
  %81 = bitcast i32* %80 to i8*, !dbg !1573
  %82 = load i32, i32* %num, align 4, !dbg !1573
  %conv86 = sext i32 %82 to i64, !dbg !1573
  %mul87 = mul i64 %conv86, 4, !dbg !1573
  %call88 = call i32 @cudaMemcpy(i8* %79, i8* %81, i64 %mul87, i32 1), !dbg !1573
  store i32 %call88, i32* %err85, align 4, !dbg !1573
  %83 = load i32, i32* %err85, align 4, !dbg !1573
  %cmp89 = icmp ne i32 0, %83, !dbg !1573
  br i1 %cmp89, label %if.then90, label %if.end93, !dbg !1573

if.then90:                                        ; preds = %do.body84
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1575
  %85 = load i32, i32* %err85, align 4, !dbg !1575
  %call91 = call i8* @cudaGetErrorString(i32 %85), !dbg !1575
  %call92 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %84, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 221, i8* %call91), !dbg !1579
  call void @exit(i32 1) #8, !dbg !1581
  unreachable, !dbg !1575

if.end93:                                         ; preds = %do.body84
  br label %do.end94, !dbg !1583

do.end94:                                         ; preds = %if.end93
  br label %do.body95, !dbg !1585, !llvm.loop !1586

do.body95:                                        ; preds = %do.end94
  call void @llvm.dbg.declare(metadata i32* %err96, metadata !1587, metadata !1108), !dbg !1589
  %86 = load %struct.Point*, %struct.Point** @p, align 8, !dbg !1590
  %87 = bitcast %struct.Point* %86 to i8*, !dbg !1590
  %88 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1590
  %p97 = getelementptr inbounds %struct.Points, %struct.Points* %88, i32 0, i32 2, !dbg !1590
  %89 = load %struct.Point*, %struct.Point** %p97, align 8, !dbg !1590
  %90 = bitcast %struct.Point* %89 to i8*, !dbg !1590
  %91 = load i32, i32* %num, align 4, !dbg !1590
  %conv98 = sext i32 %91 to i64, !dbg !1590
  %mul99 = mul i64 %conv98, 32, !dbg !1590
  %call100 = call i32 @cudaMemcpy(i8* %87, i8* %90, i64 %mul99, i32 1), !dbg !1590
  store i32 %call100, i32* %err96, align 4, !dbg !1590
  %92 = load i32, i32* %err96, align 4, !dbg !1590
  %cmp101 = icmp ne i32 0, %92, !dbg !1590
  br i1 %cmp101, label %if.then102, label %if.end105, !dbg !1590

if.then102:                                       ; preds = %do.body95
  %93 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1592
  %94 = load i32, i32* %err96, align 4, !dbg !1592
  %call103 = call i8* @cudaGetErrorString(i32 %94), !dbg !1592
  %call104 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %93, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 222, i8* %call103), !dbg !1596
  call void @exit(i32 1) #8, !dbg !1598
  unreachable, !dbg !1592

if.end105:                                        ; preds = %do.body95
  br label %do.end106, !dbg !1600

do.end106:                                        ; preds = %if.end105
  br label %do.body107, !dbg !1602, !llvm.loop !1603

do.body107:                                       ; preds = %do.end106
  call void @llvm.dbg.declare(metadata i32* %err108, metadata !1604, metadata !1108), !dbg !1606
  %95 = load i8*, i8** @switch_membership_d, align 8, !dbg !1607
  %96 = load i32, i32* %num, align 4, !dbg !1607
  %conv109 = sext i32 %96 to i64, !dbg !1607
  %mul110 = mul i64 %conv109, 1, !dbg !1607
  %call111 = call i32 @cudaMemset(i8* %95, i32 0, i64 %mul110), !dbg !1607
  store i32 %call111, i32* %err108, align 4, !dbg !1607
  %97 = load i32, i32* %err108, align 4, !dbg !1607
  %cmp112 = icmp ne i32 0, %97, !dbg !1607
  br i1 %cmp112, label %if.then113, label %if.end116, !dbg !1607

if.then113:                                       ; preds = %do.body107
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1609
  %99 = load i32, i32* %err108, align 4, !dbg !1609
  %call114 = call i8* @cudaGetErrorString(i32 %99), !dbg !1609
  %call115 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %98, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 224, i8* %call114), !dbg !1613
  call void @exit(i32 1) #8, !dbg !1615
  unreachable, !dbg !1609

if.end116:                                        ; preds = %do.body107
  br label %do.end117, !dbg !1617

do.end117:                                        ; preds = %if.end116
  br label %do.body118, !dbg !1619, !llvm.loop !1620

do.body118:                                       ; preds = %do.end117
  call void @llvm.dbg.declare(metadata i32* %err119, metadata !1621, metadata !1108), !dbg !1623
  %100 = load float*, float** @work_mem_d, align 8, !dbg !1624
  %101 = bitcast float* %100 to i8*, !dbg !1624
  %102 = load i32, i32* %stride, align 4, !dbg !1624
  %103 = load i32, i32* %nThread, align 4, !dbg !1624
  %add120 = add nsw i32 %103, 1, !dbg !1624
  %mul121 = mul nsw i32 %102, %add120, !dbg !1624
  %conv122 = sext i32 %mul121 to i64, !dbg !1624
  %mul123 = mul i64 %conv122, 4, !dbg !1624
  %call124 = call i32 @cudaMemset(i8* %101, i32 0, i64 %mul123), !dbg !1624
  store i32 %call124, i32* %err119, align 4, !dbg !1624
  %104 = load i32, i32* %err119, align 4, !dbg !1624
  %cmp125 = icmp ne i32 0, %104, !dbg !1624
  br i1 %cmp125, label %if.then126, label %if.end129, !dbg !1624

if.then126:                                       ; preds = %do.body118
  %105 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1626
  %106 = load i32, i32* %err119, align 4, !dbg !1626
  %call127 = call i8* @cudaGetErrorString(i32 %106), !dbg !1626
  %call128 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %105, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 225, i8* %call127), !dbg !1630
  call void @exit(i32 1) #8, !dbg !1632
  unreachable, !dbg !1626

if.end129:                                        ; preds = %do.body118
  br label %do.end130, !dbg !1634

do.end130:                                        ; preds = %if.end129
  %107 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1636
  %call131 = call i32 @cudaEventRecord(%struct.CUevent_st* %107, %struct.CUstream_st* null), !dbg !1637
  %108 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1638
  %call132 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %108), !dbg !1639
  %109 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1640
  %110 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1641
  %call133 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %109, %struct.CUevent_st* %110), !dbg !1642
  %111 = load float, float* %tmp_t, align 4, !dbg !1643
  %conv134 = fpext float %111 to double, !dbg !1643
  %112 = load double*, double** %cpu_to_gpu_t.addr, align 8, !dbg !1644
  %113 = load double, double* %112, align 8, !dbg !1645
  %add135 = fadd double %113, %conv134, !dbg !1645
  store double %add135, double* %112, align 8, !dbg !1645
  %114 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1646
  %call136 = call i32 @cudaEventRecord(%struct.CUevent_st* %114, %struct.CUstream_st* null), !dbg !1647
  call void @llvm.dbg.declare(metadata i32* %num_blocks, metadata !1648, metadata !1108), !dbg !1649
  %115 = load i32, i32* %num, align 4, !dbg !1650
  %add137 = add nsw i32 %115, 512, !dbg !1651
  %sub = sub nsw i32 %add137, 1, !dbg !1652
  %conv138 = sitofp i32 %sub to float, !dbg !1653
  %div = fdiv float %conv138, 5.120000e+02, !dbg !1654
  %conv139 = fptosi float %div to i32, !dbg !1655
  store i32 %conv139, i32* %num_blocks, align 4, !dbg !1649
  call void @llvm.dbg.declare(metadata i32* %num_blocks_y, metadata !1656, metadata !1108), !dbg !1657
  %116 = load i32, i32* %num_blocks, align 4, !dbg !1658
  %add140 = add nsw i32 %116, 65536, !dbg !1659
  %sub141 = sub nsw i32 %add140, 1, !dbg !1660
  %conv142 = sitofp i32 %sub141 to float, !dbg !1661
  %div143 = fdiv float %conv142, 6.553600e+04, !dbg !1662
  %conv144 = fptosi float %div143 to i32, !dbg !1663
  store i32 %conv144, i32* %num_blocks_y, align 4, !dbg !1657
  call void @llvm.dbg.declare(metadata i32* %num_blocks_x, metadata !1664, metadata !1108), !dbg !1665
  %117 = load i32, i32* %num_blocks, align 4, !dbg !1666
  %118 = load i32, i32* %num_blocks_y, align 4, !dbg !1667
  %add145 = add nsw i32 %117, %118, !dbg !1668
  %sub146 = sub nsw i32 %add145, 1, !dbg !1669
  %conv147 = sitofp i32 %sub146 to float, !dbg !1670
  %119 = load i32, i32* %num_blocks_y, align 4, !dbg !1671
  %conv148 = sitofp i32 %119 to float, !dbg !1671
  %div149 = fdiv float %conv147, %conv148, !dbg !1672
  %conv150 = fptosi float %div149 to i32, !dbg !1673
  store i32 %conv150, i32* %num_blocks_x, align 4, !dbg !1665
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid_size, metadata !1674, metadata !1108), !dbg !1698
  %120 = load i32, i32* %num_blocks_x, align 4, !dbg !1699
  %121 = load i32, i32* %num_blocks_y, align 4, !dbg !1700
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid_size, i32 %120, i32 %121, i32 1), !dbg !1698
  %122 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1701
  %123 = bitcast %struct.dim3* %grid_size to i8*, !dbg !1701
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %122, i8* %123, i64 12, i32 4, i1 false), !dbg !1701
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp151, i32 512, i32 1, i32 1), !dbg !1702
  %124 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1704
  %125 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1704
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %124, i8* %125, i64 12, i32 4, i1 false), !dbg !1705
  %126 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !1704
  %127 = load i64, i64* %126, align 4, !dbg !1704
  %128 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !1704
  %129 = load i32, i32* %128, align 4, !dbg !1704
  %130 = bitcast { i64, i32 }* %agg.tmp151.coerce to i8*, !dbg !1704
  %131 = bitcast %struct.dim3* %agg.tmp151 to i8*, !dbg !1704
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %130, i8* %131, i64 12, i32 4, i1 false), !dbg !1707
  %132 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp151.coerce, i32 0, i32 0, !dbg !1704
  %133 = load i64, i64* %132, align 4, !dbg !1704
  %134 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp151.coerce, i32 0, i32 1, !dbg !1704
  %135 = load i32, i32* %134, align 4, !dbg !1704
  %call152 = call i32 @cudaConfigureCall(i64 %127, i32 %129, i64 %133, i32 %135, i64 0, %struct.CUstream_st* null), !dbg !1709
  %tobool153 = icmp ne i32 %call152, 0, !dbg !1704
  br i1 %tobool153, label %kcall.end, label %kcall.configok, !dbg !1711

kcall.configok:                                   ; preds = %do.end130
  %136 = load i32, i32* %num, align 4, !dbg !1712
  %137 = load i32, i32* %dim, align 4, !dbg !1713
  %138 = load i64, i64* %x.addr, align 8, !dbg !1714
  %139 = load %struct.Point*, %struct.Point** @p, align 8, !dbg !1715
  %140 = load i32, i32* %K, align 4, !dbg !1716
  %141 = load i32, i32* %stride, align 4, !dbg !1717
  %142 = load float*, float** @coord_d, align 8, !dbg !1718
  %143 = load float*, float** @work_mem_d, align 8, !dbg !1719
  %144 = load i32*, i32** @center_table_d, align 8, !dbg !1720
  %145 = load i8*, i8** @switch_membership_d, align 8, !dbg !1721
  call void @_Z19kernel_compute_costiilP5PointiiPfS1_PiPb(i32 %136, i32 %137, i64 %138, %struct.Point* %139, i32 %140, i32 %141, float* %142, float* %143, i32* %144, i8* %145), !dbg !1722
  br label %kcall.end, !dbg !1722

kcall.end:                                        ; preds = %kcall.configok, %do.end130
  %call154 = call i32 @cudaThreadSynchronize(), !dbg !1724
  %call155 = call i32 @cudaGetLastError(), !dbg !1725
  store i32 %call155, i32* %error, align 4, !dbg !1726
  %146 = load i32, i32* %error, align 4, !dbg !1727
  %cmp156 = icmp ne i32 %146, 0, !dbg !1729
  br i1 %cmp156, label %if.then157, label %if.end160, !dbg !1730

if.then157:                                       ; preds = %kcall.end
  %147 = load i32, i32* %error, align 4, !dbg !1731
  %call158 = call i8* @cudaGetErrorString(i32 %147), !dbg !1733
  %call159 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i32 0, i32 0), i8* %call158), !dbg !1734
  call void @exit(i32 1) #8, !dbg !1736
  unreachable, !dbg !1736

if.end160:                                        ; preds = %kcall.end
  %148 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1737
  %call161 = call i32 @cudaEventRecord(%struct.CUevent_st* %148, %struct.CUstream_st* null), !dbg !1738
  %149 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1739
  %call162 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %149), !dbg !1740
  %150 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1741
  %151 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1742
  %call163 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %150, %struct.CUevent_st* %151), !dbg !1743
  %152 = load float, float* %tmp_t, align 4, !dbg !1744
  %conv164 = fpext float %152 to double, !dbg !1744
  %153 = load double*, double** %kernel_t.addr, align 8, !dbg !1745
  %154 = load double, double* %153, align 8, !dbg !1746
  %add165 = fadd double %154, %conv164, !dbg !1746
  store double %add165, double* %153, align 8, !dbg !1746
  %155 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1747
  %call166 = call i32 @cudaEventRecord(%struct.CUevent_st* %155, %struct.CUstream_st* null), !dbg !1748
  br label %do.body167, !dbg !1749, !llvm.loop !1750

do.body167:                                       ; preds = %if.end160
  call void @llvm.dbg.declare(metadata i32* %err168, metadata !1751, metadata !1108), !dbg !1753
  %156 = load float*, float** @work_mem_h, align 8, !dbg !1754
  %157 = bitcast float* %156 to i8*, !dbg !1754
  %158 = load float*, float** @work_mem_d, align 8, !dbg !1754
  %159 = bitcast float* %158 to i8*, !dbg !1754
  %160 = load i32, i32* %stride, align 4, !dbg !1754
  %161 = load i32, i32* %nThread, align 4, !dbg !1754
  %add169 = add nsw i32 %161, 1, !dbg !1754
  %mul170 = mul nsw i32 %160, %add169, !dbg !1754
  %conv171 = sext i32 %mul170 to i64, !dbg !1754
  %mul172 = mul i64 %conv171, 4, !dbg !1754
  %call173 = call i32 @cudaMemcpy(i8* %157, i8* %159, i64 %mul172, i32 2), !dbg !1754
  store i32 %call173, i32* %err168, align 4, !dbg !1754
  %162 = load i32, i32* %err168, align 4, !dbg !1754
  %cmp174 = icmp ne i32 0, %162, !dbg !1754
  br i1 %cmp174, label %if.then175, label %if.end178, !dbg !1754

if.then175:                                       ; preds = %do.body167
  %163 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1756
  %164 = load i32, i32* %err168, align 4, !dbg !1756
  %call176 = call i8* @cudaGetErrorString(i32 %164), !dbg !1756
  %call177 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %163, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 279, i8* %call176), !dbg !1760
  call void @exit(i32 1) #8, !dbg !1762
  unreachable, !dbg !1756

if.end178:                                        ; preds = %do.body167
  br label %do.end179, !dbg !1764

do.end179:                                        ; preds = %if.end178
  br label %do.body180, !dbg !1766, !llvm.loop !1767

do.body180:                                       ; preds = %do.end179
  call void @llvm.dbg.declare(metadata i32* %err181, metadata !1768, metadata !1108), !dbg !1770
  %165 = load i8*, i8** %switch_membership.addr, align 8, !dbg !1771
  %166 = load i8*, i8** @switch_membership_d, align 8, !dbg !1771
  %167 = load i32, i32* %num, align 4, !dbg !1771
  %conv182 = sext i32 %167 to i64, !dbg !1771
  %mul183 = mul i64 %conv182, 1, !dbg !1771
  %call184 = call i32 @cudaMemcpy(i8* %165, i8* %166, i64 %mul183, i32 2), !dbg !1771
  store i32 %call184, i32* %err181, align 4, !dbg !1771
  %168 = load i32, i32* %err181, align 4, !dbg !1771
  %cmp185 = icmp ne i32 0, %168, !dbg !1771
  br i1 %cmp185, label %if.then186, label %if.end189, !dbg !1771

if.then186:                                       ; preds = %do.body180
  %169 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1773
  %170 = load i32, i32* %err181, align 4, !dbg !1773
  %call187 = call i8* @cudaGetErrorString(i32 %170), !dbg !1773
  %call188 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %169, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 280, i8* %call187), !dbg !1777
  call void @exit(i32 1) #8, !dbg !1779
  unreachable, !dbg !1773

if.end189:                                        ; preds = %do.body180
  br label %do.end190, !dbg !1781

do.end190:                                        ; preds = %if.end189
  %171 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1783
  %call191 = call i32 @cudaEventRecord(%struct.CUevent_st* %171, %struct.CUstream_st* null), !dbg !1784
  %172 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1785
  %call192 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %172), !dbg !1786
  %173 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1787
  %174 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !1788
  %call193 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %173, %struct.CUevent_st* %174), !dbg !1789
  %175 = load float, float* %tmp_t, align 4, !dbg !1790
  %conv194 = fpext float %175 to double, !dbg !1790
  %176 = load double*, double** %gpu_to_cpu_t.addr, align 8, !dbg !1791
  %177 = load double, double* %176, align 8, !dbg !1792
  %add195 = fadd double %177, %conv194, !dbg !1792
  store double %add195, double* %176, align 8, !dbg !1792
  %178 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !1793
  %call196 = call i32 @cudaEventRecord(%struct.CUevent_st* %178, %struct.CUstream_st* null), !dbg !1794
  call void @llvm.dbg.declare(metadata i32* %number_of_centers_to_close, metadata !1795, metadata !1108), !dbg !1796
  store i32 0, i32* %number_of_centers_to_close, align 4, !dbg !1796
  call void @llvm.dbg.declare(metadata float* %gl_cost_of_opening_x, metadata !1797, metadata !1108), !dbg !1798
  %179 = load float, float* %z.addr, align 4, !dbg !1799
  store float %179, float* %gl_cost_of_opening_x, align 4, !dbg !1798
  call void @llvm.dbg.declare(metadata float** %gl_lower, metadata !1800, metadata !1108), !dbg !1801
  %180 = load i32, i32* %stride, align 4, !dbg !1802
  %181 = load i32, i32* %nThread, align 4, !dbg !1803
  %mul197 = mul nsw i32 %180, %181, !dbg !1804
  %idxprom198 = sext i32 %mul197 to i64, !dbg !1805
  %182 = load float*, float** @work_mem_h, align 8, !dbg !1805
  %arrayidx199 = getelementptr inbounds float, float* %182, i64 %idxprom198, !dbg !1805
  store float* %arrayidx199, float** %gl_lower, align 8, !dbg !1801
  call void @llvm.dbg.declare(metadata i32* %i200, metadata !1806, metadata !1108), !dbg !1808
  store i32 0, i32* %i200, align 4, !dbg !1808
  br label %for.cond201, !dbg !1809

for.cond201:                                      ; preds = %for.inc241, %do.end190
  %183 = load i32, i32* %i200, align 4, !dbg !1810
  %184 = load i32, i32* %num, align 4, !dbg !1813
  %cmp202 = icmp slt i32 %183, %184, !dbg !1814
  br i1 %cmp202, label %for.body203, label %for.end243, !dbg !1815

for.body203:                                      ; preds = %for.cond201
  %185 = load i32, i32* %i200, align 4, !dbg !1816
  %idxprom204 = sext i32 %185 to i64, !dbg !1819
  %186 = load i8*, i8** %is_center.addr, align 8, !dbg !1819
  %arrayidx205 = getelementptr inbounds i8, i8* %186, i64 %idxprom204, !dbg !1819
  %187 = load i8, i8* %arrayidx205, align 1, !dbg !1819
  %tobool206 = trunc i8 %187 to i1, !dbg !1819
  br i1 %tobool206, label %if.then207, label %if.end235, !dbg !1820

if.then207:                                       ; preds = %for.body203
  call void @llvm.dbg.declare(metadata float* %low, metadata !1821, metadata !1108), !dbg !1823
  %188 = load float, float* %z.addr, align 4, !dbg !1824
  store float %188, float* %low, align 4, !dbg !1823
  call void @llvm.dbg.declare(metadata i32* %j208, metadata !1825, metadata !1108), !dbg !1827
  store i32 0, i32* %j208, align 4, !dbg !1827
  br label %for.cond209, !dbg !1828

for.cond209:                                      ; preds = %for.inc219, %if.then207
  %189 = load i32, i32* %j208, align 4, !dbg !1829
  %190 = load i32, i32* %num, align 4, !dbg !1832
  %cmp210 = icmp slt i32 %189, %190, !dbg !1833
  br i1 %cmp210, label %for.body211, label %for.end221, !dbg !1834

for.body211:                                      ; preds = %for.cond209
  %191 = load i32, i32* %j208, align 4, !dbg !1835
  %192 = load i32, i32* %stride, align 4, !dbg !1837
  %mul212 = mul nsw i32 %191, %192, !dbg !1838
  %193 = load i32, i32* %i200, align 4, !dbg !1839
  %idxprom213 = sext i32 %193 to i64, !dbg !1840
  %194 = load i32*, i32** %center_table.addr, align 8, !dbg !1840
  %arrayidx214 = getelementptr inbounds i32, i32* %194, i64 %idxprom213, !dbg !1840
  %195 = load i32, i32* %arrayidx214, align 4, !dbg !1840
  %add215 = add nsw i32 %mul212, %195, !dbg !1841
  %idxprom216 = sext i32 %add215 to i64, !dbg !1842
  %196 = load float*, float** @work_mem_h, align 8, !dbg !1842
  %arrayidx217 = getelementptr inbounds float, float* %196, i64 %idxprom216, !dbg !1842
  %197 = load float, float* %arrayidx217, align 4, !dbg !1842
  %198 = load float, float* %low, align 4, !dbg !1843
  %add218 = fadd float %198, %197, !dbg !1843
  store float %add218, float* %low, align 4, !dbg !1843
  br label %for.inc219, !dbg !1844

for.inc219:                                       ; preds = %for.body211
  %199 = load i32, i32* %j208, align 4, !dbg !1845
  %inc220 = add nsw i32 %199, 1, !dbg !1845
  store i32 %inc220, i32* %j208, align 4, !dbg !1845
  br label %for.cond209, !dbg !1847, !llvm.loop !1848

for.end221:                                       ; preds = %for.cond209
  %200 = load float, float* %low, align 4, !dbg !1850
  %201 = load i32, i32* %i200, align 4, !dbg !1851
  %idxprom222 = sext i32 %201 to i64, !dbg !1852
  %202 = load i32*, i32** %center_table.addr, align 8, !dbg !1852
  %arrayidx223 = getelementptr inbounds i32, i32* %202, i64 %idxprom222, !dbg !1852
  %203 = load i32, i32* %arrayidx223, align 4, !dbg !1852
  %idxprom224 = sext i32 %203 to i64, !dbg !1853
  %204 = load float*, float** %gl_lower, align 8, !dbg !1853
  %arrayidx225 = getelementptr inbounds float, float* %204, i64 %idxprom224, !dbg !1853
  store float %200, float* %arrayidx225, align 4, !dbg !1854
  %205 = load float, float* %low, align 4, !dbg !1855
  %cmp226 = fcmp ogt float %205, 0.000000e+00, !dbg !1857
  br i1 %cmp226, label %if.then227, label %if.end234, !dbg !1858

if.then227:                                       ; preds = %for.end221
  %206 = load i32, i32* %number_of_centers_to_close, align 4, !dbg !1859
  %inc228 = add nsw i32 %206, 1, !dbg !1859
  store i32 %inc228, i32* %number_of_centers_to_close, align 4, !dbg !1859
  %207 = load float, float* %low, align 4, !dbg !1861
  %208 = load i32, i32* %i200, align 4, !dbg !1862
  %209 = load i32, i32* %stride, align 4, !dbg !1863
  %mul229 = mul nsw i32 %208, %209, !dbg !1864
  %210 = load i32, i32* %K, align 4, !dbg !1865
  %add230 = add nsw i32 %mul229, %210, !dbg !1866
  %idxprom231 = sext i32 %add230 to i64, !dbg !1867
  %211 = load float*, float** @work_mem_h, align 8, !dbg !1867
  %arrayidx232 = getelementptr inbounds float, float* %211, i64 %idxprom231, !dbg !1867
  %212 = load float, float* %arrayidx232, align 4, !dbg !1868
  %sub233 = fsub float %212, %207, !dbg !1868
  store float %sub233, float* %arrayidx232, align 4, !dbg !1868
  br label %if.end234, !dbg !1869

if.end234:                                        ; preds = %if.then227, %for.end221
  br label %if.end235, !dbg !1870

if.end235:                                        ; preds = %if.end234, %for.body203
  %213 = load i32, i32* %i200, align 4, !dbg !1871
  %214 = load i32, i32* %stride, align 4, !dbg !1872
  %mul236 = mul nsw i32 %213, %214, !dbg !1873
  %215 = load i32, i32* %K, align 4, !dbg !1874
  %add237 = add nsw i32 %mul236, %215, !dbg !1875
  %idxprom238 = sext i32 %add237 to i64, !dbg !1876
  %216 = load float*, float** @work_mem_h, align 8, !dbg !1876
  %arrayidx239 = getelementptr inbounds float, float* %216, i64 %idxprom238, !dbg !1876
  %217 = load float, float* %arrayidx239, align 4, !dbg !1876
  %218 = load float, float* %gl_cost_of_opening_x, align 4, !dbg !1877
  %add240 = fadd float %218, %217, !dbg !1877
  store float %add240, float* %gl_cost_of_opening_x, align 4, !dbg !1877
  br label %for.inc241, !dbg !1878

for.inc241:                                       ; preds = %if.end235
  %219 = load i32, i32* %i200, align 4, !dbg !1879
  %inc242 = add nsw i32 %219, 1, !dbg !1879
  store i32 %inc242, i32* %i200, align 4, !dbg !1879
  br label %for.cond201, !dbg !1881, !llvm.loop !1882

for.end243:                                       ; preds = %for.cond201
  %220 = load float, float* %gl_cost_of_opening_x, align 4, !dbg !1884
  %cmp244 = fcmp olt float %220, 0.000000e+00, !dbg !1886
  br i1 %cmp244, label %if.then245, label %if.else, !dbg !1887

if.then245:                                       ; preds = %for.end243
  call void @llvm.dbg.declare(metadata i32* %i246, metadata !1888, metadata !1108), !dbg !1891
  store i32 0, i32* %i246, align 4, !dbg !1891
  br label %for.cond247, !dbg !1892

for.cond247:                                      ; preds = %for.inc284, %if.then245
  %221 = load i32, i32* %i246, align 4, !dbg !1893
  %222 = load i32, i32* %num, align 4, !dbg !1896
  %cmp248 = icmp slt i32 %221, %222, !dbg !1897
  br i1 %cmp248, label %for.body249, label %for.end286, !dbg !1898

for.body249:                                      ; preds = %for.cond247
  call void @llvm.dbg.declare(metadata i8* %close_center, metadata !1899, metadata !1108), !dbg !1901
  %223 = load i32, i32* %i246, align 4, !dbg !1902
  %idxprom250 = sext i32 %223 to i64, !dbg !1903
  %224 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1903
  %p251 = getelementptr inbounds %struct.Points, %struct.Points* %224, i32 0, i32 2, !dbg !1904
  %225 = load %struct.Point*, %struct.Point** %p251, align 8, !dbg !1904
  %arrayidx252 = getelementptr inbounds %struct.Point, %struct.Point* %225, i64 %idxprom250, !dbg !1903
  %assign = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx252, i32 0, i32 2, !dbg !1905
  %226 = load i64, i64* %assign, align 8, !dbg !1905
  %227 = load i32*, i32** %center_table.addr, align 8, !dbg !1906
  %arrayidx253 = getelementptr inbounds i32, i32* %227, i64 %226, !dbg !1906
  %228 = load i32, i32* %arrayidx253, align 4, !dbg !1906
  %idxprom254 = sext i32 %228 to i64, !dbg !1907
  %229 = load float*, float** %gl_lower, align 8, !dbg !1907
  %arrayidx255 = getelementptr inbounds float, float* %229, i64 %idxprom254, !dbg !1907
  %230 = load float, float* %arrayidx255, align 4, !dbg !1907
  %cmp256 = fcmp ogt float %230, 0.000000e+00, !dbg !1908
  %frombool257 = zext i1 %cmp256 to i8, !dbg !1901
  store i8 %frombool257, i8* %close_center, align 1, !dbg !1901
  %231 = load i32, i32* %i246, align 4, !dbg !1909
  %idxprom258 = sext i32 %231 to i64, !dbg !1911
  %232 = load i8*, i8** %switch_membership.addr, align 8, !dbg !1911
  %arrayidx259 = getelementptr inbounds i8, i8* %232, i64 %idxprom258, !dbg !1911
  %233 = load i8, i8* %arrayidx259, align 1, !dbg !1911
  %tobool260 = trunc i8 %233 to i1, !dbg !1911
  br i1 %tobool260, label %if.then263, label %lor.lhs.false261, !dbg !1912

lor.lhs.false261:                                 ; preds = %for.body249
  %234 = load i8, i8* %close_center, align 1, !dbg !1913
  %tobool262 = trunc i8 %234 to i1, !dbg !1913
  br i1 %tobool262, label %if.then263, label %if.end283, !dbg !1915

if.then263:                                       ; preds = %lor.lhs.false261, %for.body249
  %235 = load i32, i32* %i246, align 4, !dbg !1916
  %idxprom265 = sext i32 %235 to i64, !dbg !1918
  %236 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1918
  %p266 = getelementptr inbounds %struct.Points, %struct.Points* %236, i32 0, i32 2, !dbg !1919
  %237 = load %struct.Point*, %struct.Point** %p266, align 8, !dbg !1919
  %arrayidx267 = getelementptr inbounds %struct.Point, %struct.Point* %237, i64 %idxprom265, !dbg !1918
  %238 = bitcast %struct.Point* %agg.tmp264 to i8*, !dbg !1918
  %239 = bitcast %struct.Point* %arrayidx267 to i8*, !dbg !1918
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %238, i8* %239, i64 32, i32 8, i1 false), !dbg !1918
  %240 = load i64, i64* %x.addr, align 8, !dbg !1920
  %241 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1921
  %p269 = getelementptr inbounds %struct.Points, %struct.Points* %241, i32 0, i32 2, !dbg !1922
  %242 = load %struct.Point*, %struct.Point** %p269, align 8, !dbg !1922
  %arrayidx270 = getelementptr inbounds %struct.Point, %struct.Point* %242, i64 %240, !dbg !1921
  %243 = bitcast %struct.Point* %agg.tmp268 to i8*, !dbg !1921
  %244 = bitcast %struct.Point* %arrayidx270 to i8*, !dbg !1921
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %243, i8* %244, i64 32, i32 8, i1 false), !dbg !1923
  %245 = load i32, i32* %dim, align 4, !dbg !1925
  %call271 = call float @_Z4dist5PointS_i(%struct.Point* byval align 8 %agg.tmp264, %struct.Point* byval align 8 %agg.tmp268, i32 %245), !dbg !1926
  %246 = load i32, i32* %i246, align 4, !dbg !1928
  %idxprom272 = sext i32 %246 to i64, !dbg !1929
  %247 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1929
  %p273 = getelementptr inbounds %struct.Points, %struct.Points* %247, i32 0, i32 2, !dbg !1930
  %248 = load %struct.Point*, %struct.Point** %p273, align 8, !dbg !1930
  %arrayidx274 = getelementptr inbounds %struct.Point, %struct.Point* %248, i64 %idxprom272, !dbg !1929
  %weight = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx274, i32 0, i32 0, !dbg !1931
  %249 = load float, float* %weight, align 8, !dbg !1931
  %mul275 = fmul float %call271, %249, !dbg !1932
  %250 = load i32, i32* %i246, align 4, !dbg !1933
  %idxprom276 = sext i32 %250 to i64, !dbg !1934
  %251 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1934
  %p277 = getelementptr inbounds %struct.Points, %struct.Points* %251, i32 0, i32 2, !dbg !1935
  %252 = load %struct.Point*, %struct.Point** %p277, align 8, !dbg !1935
  %arrayidx278 = getelementptr inbounds %struct.Point, %struct.Point* %252, i64 %idxprom276, !dbg !1934
  %cost = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx278, i32 0, i32 3, !dbg !1936
  store float %mul275, float* %cost, align 8, !dbg !1937
  %253 = load i64, i64* %x.addr, align 8, !dbg !1938
  %254 = load i32, i32* %i246, align 4, !dbg !1939
  %idxprom279 = sext i32 %254 to i64, !dbg !1940
  %255 = load %struct.Points*, %struct.Points** %points.addr, align 8, !dbg !1940
  %p280 = getelementptr inbounds %struct.Points, %struct.Points* %255, i32 0, i32 2, !dbg !1941
  %256 = load %struct.Point*, %struct.Point** %p280, align 8, !dbg !1941
  %arrayidx281 = getelementptr inbounds %struct.Point, %struct.Point* %256, i64 %idxprom279, !dbg !1940
  %assign282 = getelementptr inbounds %struct.Point, %struct.Point* %arrayidx281, i32 0, i32 2, !dbg !1942
  store i64 %253, i64* %assign282, align 8, !dbg !1943
  br label %if.end283, !dbg !1944

if.end283:                                        ; preds = %if.then263, %lor.lhs.false261
  br label %for.inc284, !dbg !1945

for.inc284:                                       ; preds = %if.end283
  %257 = load i32, i32* %i246, align 4, !dbg !1946
  %inc285 = add nsw i32 %257, 1, !dbg !1946
  store i32 %inc285, i32* %i246, align 4, !dbg !1946
  br label %for.cond247, !dbg !1948, !llvm.loop !1949

for.end286:                                       ; preds = %for.cond247
  call void @llvm.dbg.declare(metadata i32* %i287, metadata !1951, metadata !1108), !dbg !1953
  store i32 0, i32* %i287, align 4, !dbg !1953
  br label %for.cond288, !dbg !1954

for.cond288:                                      ; preds = %for.inc303, %for.end286
  %258 = load i32, i32* %i287, align 4, !dbg !1955
  %259 = load i32, i32* %num, align 4, !dbg !1958
  %cmp289 = icmp slt i32 %258, %259, !dbg !1959
  br i1 %cmp289, label %for.body290, label %for.end305, !dbg !1960

for.body290:                                      ; preds = %for.cond288
  %260 = load i32, i32* %i287, align 4, !dbg !1961
  %idxprom291 = sext i32 %260 to i64, !dbg !1964
  %261 = load i8*, i8** %is_center.addr, align 8, !dbg !1964
  %arrayidx292 = getelementptr inbounds i8, i8* %261, i64 %idxprom291, !dbg !1964
  %262 = load i8, i8* %arrayidx292, align 1, !dbg !1964
  %tobool293 = trunc i8 %262 to i1, !dbg !1964
  br i1 %tobool293, label %land.lhs.true, label %if.end302, !dbg !1965

land.lhs.true:                                    ; preds = %for.body290
  %263 = load i32, i32* %i287, align 4, !dbg !1966
  %idxprom294 = sext i32 %263 to i64, !dbg !1968
  %264 = load i32*, i32** %center_table.addr, align 8, !dbg !1968
  %arrayidx295 = getelementptr inbounds i32, i32* %264, i64 %idxprom294, !dbg !1968
  %265 = load i32, i32* %arrayidx295, align 4, !dbg !1968
  %idxprom296 = sext i32 %265 to i64, !dbg !1969
  %266 = load float*, float** %gl_lower, align 8, !dbg !1969
  %arrayidx297 = getelementptr inbounds float, float* %266, i64 %idxprom296, !dbg !1969
  %267 = load float, float* %arrayidx297, align 4, !dbg !1969
  %cmp298 = fcmp ogt float %267, 0.000000e+00, !dbg !1970
  br i1 %cmp298, label %if.then299, label %if.end302, !dbg !1971

if.then299:                                       ; preds = %land.lhs.true
  %268 = load i32, i32* %i287, align 4, !dbg !1972
  %idxprom300 = sext i32 %268 to i64, !dbg !1974
  %269 = load i8*, i8** %is_center.addr, align 8, !dbg !1974
  %arrayidx301 = getelementptr inbounds i8, i8* %269, i64 %idxprom300, !dbg !1974
  store i8 0, i8* %arrayidx301, align 1, !dbg !1975
  br label %if.end302, !dbg !1976

if.end302:                                        ; preds = %if.then299, %land.lhs.true, %for.body290
  br label %for.inc303, !dbg !1977

for.inc303:                                       ; preds = %if.end302
  %270 = load i32, i32* %i287, align 4, !dbg !1978
  %inc304 = add nsw i32 %270, 1, !dbg !1978
  store i32 %inc304, i32* %i287, align 4, !dbg !1978
  br label %for.cond288, !dbg !1980, !llvm.loop !1981

for.end305:                                       ; preds = %for.cond288
  %271 = load i64, i64* %x.addr, align 8, !dbg !1983
  %cmp306 = icmp sge i64 %271, 0, !dbg !1985
  br i1 %cmp306, label %land.lhs.true307, label %if.end312, !dbg !1986

land.lhs.true307:                                 ; preds = %for.end305
  %272 = load i64, i64* %x.addr, align 8, !dbg !1987
  %273 = load i32, i32* %num, align 4, !dbg !1989
  %conv308 = sext i32 %273 to i64, !dbg !1989
  %cmp309 = icmp slt i64 %272, %conv308, !dbg !1990
  br i1 %cmp309, label %if.then310, label %if.end312, !dbg !1991

if.then310:                                       ; preds = %land.lhs.true307
  %274 = load i64, i64* %x.addr, align 8, !dbg !1992
  %275 = load i8*, i8** %is_center.addr, align 8, !dbg !1994
  %arrayidx311 = getelementptr inbounds i8, i8* %275, i64 %274, !dbg !1994
  store i8 1, i8* %arrayidx311, align 1, !dbg !1995
  br label %if.end312, !dbg !1996

if.end312:                                        ; preds = %if.then310, %land.lhs.true307, %for.end305
  %276 = load i64*, i64** %numcenters.addr, align 8, !dbg !1997
  %277 = load i64, i64* %276, align 8, !dbg !1998
  %add313 = add nsw i64 %277, 1, !dbg !1999
  %278 = load i32, i32* %number_of_centers_to_close, align 4, !dbg !2000
  %conv314 = sext i32 %278 to i64, !dbg !2000
  %sub315 = sub nsw i64 %add313, %conv314, !dbg !2001
  %279 = load i64*, i64** %numcenters.addr, align 8, !dbg !2002
  store i64 %sub315, i64* %279, align 8, !dbg !2003
  br label %if.end316, !dbg !2004

if.else:                                          ; preds = %for.end243
  store float 0.000000e+00, float* %gl_cost_of_opening_x, align 4, !dbg !2005
  br label %if.end316

if.end316:                                        ; preds = %if.else, %if.end312
  %280 = load float*, float** @work_mem_h, align 8, !dbg !2007
  %281 = bitcast float* %280 to i8*, !dbg !2007
  call void @free(i8* %281) #2, !dbg !2008
  %282 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !2009
  %call317 = call i32 @cudaEventRecord(%struct.CUevent_st* %282, %struct.CUstream_st* null), !dbg !2010
  %283 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !2011
  %call318 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %283), !dbg !2012
  %284 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !2013
  %285 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !2014
  %call319 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %284, %struct.CUevent_st* %285), !dbg !2015
  %286 = load float, float* %tmp_t, align 4, !dbg !2016
  %conv320 = fpext float %286 to double, !dbg !2016
  %287 = load double*, double** %serial_t.addr, align 8, !dbg !2017
  %288 = load double, double* %287, align 8, !dbg !2018
  %add321 = fadd double %288, %conv320, !dbg !2018
  store double %add321, double* %287, align 8, !dbg !2018
  %289 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !2019
  %call322 = call i32 @cudaEventRecord(%struct.CUevent_st* %289, %struct.CUstream_st* null), !dbg !2020
  br label %do.body323, !dbg !2021, !llvm.loop !2022

do.body323:                                       ; preds = %if.end316
  call void @llvm.dbg.declare(metadata i32* %err324, metadata !2023, metadata !1108), !dbg !2025
  %290 = load float*, float** @work_mem_d, align 8, !dbg !2026
  %291 = bitcast float* %290 to i8*, !dbg !2026
  %call325 = call i32 @cudaFree(i8* %291), !dbg !2026
  store i32 %call325, i32* %err324, align 4, !dbg !2026
  %292 = load i32, i32* %err324, align 4, !dbg !2026
  %cmp326 = icmp ne i32 0, %292, !dbg !2026
  br i1 %cmp326, label %if.then327, label %if.end330, !dbg !2026

if.then327:                                       ; preds = %do.body323
  %293 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2028
  %294 = load i32, i32* %err324, align 4, !dbg !2028
  %call328 = call i8* @cudaGetErrorString(i32 %294), !dbg !2028
  %call329 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %293, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 369, i8* %call328), !dbg !2032
  call void @exit(i32 1) #8, !dbg !2034
  unreachable, !dbg !2028

if.end330:                                        ; preds = %do.body323
  br label %do.end331, !dbg !2036

do.end331:                                        ; preds = %if.end330
  %295 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !2038
  %call332 = call i32 @cudaEventRecord(%struct.CUevent_st* %295, %struct.CUstream_st* null), !dbg !2039
  %296 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !2040
  %call333 = call i32 @cudaEventSynchronize(%struct.CUevent_st* %296), !dbg !2041
  %297 = load %struct.CUevent_st*, %struct.CUevent_st** %start, align 8, !dbg !2042
  %298 = load %struct.CUevent_st*, %struct.CUevent_st** %stop, align 8, !dbg !2043
  %call334 = call i32 @cudaEventElapsedTime(float* %tmp_t, %struct.CUevent_st* %297, %struct.CUevent_st* %298), !dbg !2044
  %299 = load float, float* %tmp_t, align 4, !dbg !2045
  %conv335 = fpext float %299 to double, !dbg !2045
  %300 = load double*, double** %free_t.addr, align 8, !dbg !2046
  %301 = load double, double* %300, align 8, !dbg !2047
  %add336 = fadd double %301, %conv335, !dbg !2047
  store double %add336, double* %300, align 8, !dbg !2047
  %302 = load i32, i32* @_ZL4iter, align 4, !dbg !2048
  %inc337 = add nsw i32 %302, 1, !dbg !2048
  store i32 %inc337, i32* @_ZL4iter, align 4, !dbg !2048
  %303 = load float, float* %gl_cost_of_opening_x, align 4, !dbg !2049
  %sub338 = fsub float -0.000000e+00, %303, !dbg !2050
  ret float %sub338, !dbg !2051
}

declare i32 @cudaEventCreate(%struct.CUevent_st**) #1

declare i32 @cudaEventRecord(%struct.CUevent_st*, %struct.CUstream_st*) #1

declare i32 @cudaEventSynchronize(%struct.CUevent_st*) #1

declare i32 @cudaEventElapsedTime(float*, %struct.CUevent_st*, %struct.CUevent_st*) #1

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #1

declare i32 @cudaMemset(i8*, i32, i64) #1

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #5 comdat align 2 !dbg !2052 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !2053, metadata !1108), !dbg !2055
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !2056, metadata !1108), !dbg !2057
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !2058, metadata !1108), !dbg !2059
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !2060, metadata !1108), !dbg !2061
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !2062
  %0 = load i32, i32* %vx.addr, align 4, !dbg !2063
  store i32 %0, i32* %x, align 4, !dbg !2062
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !2064
  %1 = load i32, i32* %vy.addr, align 4, !dbg !2065
  store i32 %1, i32* %y, align 4, !dbg !2064
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !2066
  %2 = load i32, i32* %vz.addr, align 4, !dbg !2067
  store i32 %2, i32* %z, align 4, !dbg !2066
  ret void, !dbg !2068
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #7

declare i32 @cudaThreadSynchronize() #1

declare i32 @cudaGetLastError() #1

declare i32 @printf(i8*, ...) #1

declare float @_Z4dist5PointS_i(%struct.Point* byval align 8, %struct.Point* byval align 8, i32) #1

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_streamcluster_cuda.cu() #0 section ".text.startup" !dbg !2069 {
entry:
  call void @__cxx_global_var_init(), !dbg !2071
  ret void
}

attributes #0 = { uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!1096, !1097}
!llvm.ident = !{!1098}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 0c0654cbe42ce8060cf9bfeea18254aa37aceca3) (http://llvm.org/git/llvm.git 008f70d21cc2b33cebd1d4443052e62d3fbea6e8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !93, globals: !100, imports: !139)
!1 = !DIFile(filename: "streamcluster_cuda.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!2 = !{!3, !86}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !4, line: 151, size: 32, align: 32, elements: !5, identifier: "_ZTS9cudaError")
!4 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!5 = !{!6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85}
!6 = !DIEnumerator(name: "cudaSuccess", value: 0)
!7 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 1)
!8 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2)
!9 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3)
!10 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 4)
!11 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 5)
!12 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 6)
!13 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 7)
!14 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 8)
!15 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9)
!16 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 10)
!17 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 11)
!18 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12)
!19 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13)
!20 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 14)
!21 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 15)
!22 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16)
!23 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17)
!24 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18)
!25 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19)
!26 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20)
!27 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21)
!28 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22)
!29 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23)
!30 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24)
!31 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25)
!32 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26)
!33 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27)
!34 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28)
!35 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 29)
!36 = !DIEnumerator(name: "cudaErrorUnknown", value: 30)
!37 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31)
!38 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32)
!39 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 33)
!40 = !DIEnumerator(name: "cudaErrorNotReady", value: 34)
!41 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35)
!42 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 36)
!43 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37)
!44 = !DIEnumerator(name: "cudaErrorNoDevice", value: 38)
!45 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 39)
!46 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 40)
!47 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 41)
!48 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 42)
!49 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43)
!50 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44)
!51 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45)
!52 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46)
!53 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 47)
!54 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 48)
!55 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49)
!56 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 50)
!57 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 51)
!58 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 54)
!59 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 55)
!60 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 56)
!61 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 57)
!62 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 58)
!63 = !DIEnumerator(name: "cudaErrorAssert", value: 59)
!64 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 60)
!65 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 61)
!66 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 62)
!67 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 63)
!68 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 64)
!69 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65)
!70 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66)
!71 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67)
!72 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68)
!73 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69)
!74 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 70)
!75 = !DIEnumerator(name: "cudaErrorNotSupported", value: 71)
!76 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 72)
!77 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 73)
!78 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 74)
!79 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 75)
!80 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 76)
!81 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 77)
!82 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 78)
!83 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 79)
!84 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127)
!85 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000)
!86 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !4, line: 797, size: 32, align: 32, elements: !87, identifier: "_ZTS14cudaMemcpyKind")
!87 = !{!88, !89, !90, !91, !92}
!88 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!89 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!90 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!91 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!92 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!93 = !{!94, !96, !98, !95, !99, !97}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64, align: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64, align: 64)
!97 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!98 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!99 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!100 = !{!101, !119, !120, !121, !122, !123, !125, !127, !138}
!101 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !102, file: !104, line: 74, type: !105, isLocal: true, isDefinition: true, variable: %"class.std::ios_base::Init"* @_ZStL8__ioinit)
!102 = !DINamespace(name: "std", scope: null, file: !103, line: 186)
!103 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!104 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/iostream", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!105 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !107, file: !106, line: 601, size: 8, align: 8, elements: !108, identifier: "_ZTSNSt8ios_base4InitE")
!106 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/ios_base.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!107 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !102, file: !106, line: 228, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt8ios_base")
!108 = !{!109, !112, !114, !118}
!109 = !DIDerivedType(tag: DW_TAG_member, name: "_S_refcount", scope: !105, file: !106, line: 609, baseType: !110, flags: DIFlagStaticMember)
!110 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Atomic_word", file: !111, line: 32, baseType: !99)
!111 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/atomic_word.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!112 = !DIDerivedType(tag: DW_TAG_member, name: "_S_synced_with_stdio", scope: !105, file: !106, line: 610, baseType: !113, flags: DIFlagStaticMember)
!113 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!114 = !DISubprogram(name: "Init", scope: !105, file: !106, line: 605, type: !115, isLocal: false, isDefinition: false, scopeLine: 605, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!115 = !DISubroutineType(types: !116)
!116 = !{null, !117}
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!118 = !DISubprogram(name: "~Init", scope: !105, file: !106, line: 606, type: !115, isLocal: false, isDefinition: false, scopeLine: 606, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!119 = distinct !DIGlobalVariable(name: "work_mem_h", scope: !0, file: !1, line: 32, type: !96, isLocal: false, isDefinition: true, variable: float** @work_mem_h)
!120 = distinct !DIGlobalVariable(name: "coord_h", scope: !0, file: !1, line: 33, type: !96, isLocal: false, isDefinition: true, variable: float** @coord_h)
!121 = distinct !DIGlobalVariable(name: "work_mem_d", scope: !0, file: !1, line: 36, type: !96, isLocal: false, isDefinition: true, variable: float** @work_mem_d)
!122 = distinct !DIGlobalVariable(name: "coord_d", scope: !0, file: !1, line: 37, type: !96, isLocal: false, isDefinition: true, variable: float** @coord_d)
!123 = distinct !DIGlobalVariable(name: "center_table_d", scope: !0, file: !1, line: 38, type: !124, isLocal: false, isDefinition: true, variable: i32** @center_table_d)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64, align: 64)
!125 = distinct !DIGlobalVariable(name: "switch_membership_d", scope: !0, file: !1, line: 39, type: !126, isLocal: false, isDefinition: true, variable: i8** @switch_membership_d)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64, align: 64)
!127 = distinct !DIGlobalVariable(name: "p", scope: !0, file: !1, line: 40, type: !128, isLocal: false, isDefinition: true, variable: %struct.Point** @p)
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64, align: 64)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "Point", file: !130, line: 44, baseType: !131)
!130 = !DIFile(filename: "./streamcluster_header.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!131 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !130, line: 39, size: 256, align: 64, elements: !132, identifier: "_ZTS5Point")
!132 = !{!133, !134, !135, !137}
!133 = !DIDerivedType(tag: DW_TAG_member, name: "weight", scope: !131, file: !130, line: 40, baseType: !97, size: 32, align: 32)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "coord", scope: !131, file: !130, line: 41, baseType: !96, size: 64, align: 64, offset: 64)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "assign", scope: !131, file: !130, line: 42, baseType: !136, size: 64, align: 64, offset: 128)
!136 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "cost", scope: !131, file: !130, line: 43, baseType: !97, size: 32, align: 32, offset: 192)
!138 = distinct !DIGlobalVariable(name: "iter", linkageName: "_ZL4iter", scope: !0, file: !1, line: 42, type: !99, isLocal: true, isDefinition: true, variable: i32* @_ZL4iter)
!139 = !{!140, !145, !149, !151, !153, !155, !157, !161, !163, !165, !167, !169, !171, !173, !175, !177, !179, !181, !183, !185, !187, !189, !193, !195, !197, !199, !203, !207, !209, !211, !215, !219, !221, !223, !225, !227, !229, !231, !233, !235, !239, !243, !245, !247, !251, !253, !255, !257, !259, !261, !265, !267, !271, !278, !282, !284, !286, !288, !290, !292, !296, !298, !300, !304, !306, !308, !310, !312, !314, !316, !318, !320, !322, !327, !329, !331, !335, !337, !339, !341, !343, !345, !347, !349, !353, !357, !359, !361, !366, !368, !370, !372, !374, !376, !378, !382, !388, !392, !396, !401, !403, !407, !411, !424, !428, !432, !436, !440, !445, !447, !451, !455, !459, !467, !471, !475, !479, !483, !488, !494, !498, !502, !504, !512, !516, !524, !526, !528, !532, !536, !540, !545, !549, !554, !555, !556, !557, !560, !561, !562, !563, !564, !565, !566, !581, !583, !587, !596, !601, !605, !609, !613, !617, !619, !621, !625, !631, !635, !641, !647, !649, !653, !657, !661, !665, !676, !678, !682, !686, !690, !692, !696, !700, !704, !706, !708, !712, !720, !724, !728, !732, !734, !740, !742, !748, !752, !756, !760, !764, !768, !772, !774, !776, !780, !784, !788, !790, !794, !798, !800, !802, !806, !810, !814, !818, !819, !820, !821, !825, !828, !832, !837, !840, !842, !844, !846, !848, !850, !852, !854, !856, !858, !860, !862, !864, !866, !868, !875, !877, !878, !880, !882, !884, !886, !890, !892, !894, !896, !898, !900, !902, !904, !906, !910, !914, !916, !920, !924, !926, !931, !936, !940, !942, !944, !946, !948, !955, !959, !963, !967, !971, !975, !980, !984, !986, !990, !996, !1000, !1005, !1007, !1009, !1013, !1017, !1021, !1023, !1025, !1027, !1029, !1033, !1035, !1037, !1041, !1045, !1049, !1053, !1057, !1059, !1061, !1065, !1069, !1073, !1077, !1079, !1081, !1085, !1089, !1090, !1091, !1092, !1093, !1094, !1095}
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !141, line: 187)
!141 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !103, file: !103, line: 44, type: !142, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DISubroutineType(types: !143)
!143 = !{!144, !144}
!144 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !146, line: 188)
!146 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !103, file: !103, line: 46, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DISubroutineType(types: !148)
!148 = !{!97, !97}
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !150, line: 189)
!150 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !103, file: !103, line: 48, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !152, line: 190)
!152 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !103, file: !103, line: 50, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !154, line: 191)
!154 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !103, file: !103, line: 52, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !156, line: 192)
!156 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !103, file: !103, line: 56, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !158, line: 193)
!158 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !103, file: !103, line: 54, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DISubroutineType(types: !160)
!160 = !{!97, !97, !97}
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !162, line: 194)
!162 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !103, file: !103, line: 58, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !164, line: 195)
!164 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !103, file: !103, line: 60, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !166, line: 196)
!166 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !103, file: !103, line: 62, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !168, line: 197)
!168 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !103, file: !103, line: 64, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !170, line: 198)
!170 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !103, file: !103, line: 66, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !172, line: 199)
!172 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !103, file: !103, line: 68, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !174, line: 200)
!174 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !103, file: !103, line: 72, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !176, line: 201)
!176 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !103, file: !103, line: 70, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !178, line: 202)
!178 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !103, file: !103, line: 76, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !180, line: 203)
!180 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !103, file: !103, line: 74, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !182, line: 204)
!182 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !103, file: !103, line: 78, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !184, line: 205)
!184 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !103, file: !103, line: 80, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !186, line: 206)
!186 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !103, file: !103, line: 82, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !188, line: 207)
!188 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !103, file: !103, line: 84, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !190, line: 208)
!190 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !103, file: !103, line: 86, type: !191, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!191 = !DISubroutineType(types: !192)
!192 = !{!97, !97, !97, !97}
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !194, line: 209)
!194 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !103, file: !103, line: 88, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !196, line: 210)
!196 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !103, file: !103, line: 90, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !198, line: 211)
!198 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !103, file: !103, line: 92, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !200, line: 212)
!200 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !103, file: !103, line: 94, type: !201, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DISubroutineType(types: !202)
!202 = !{!99, !97}
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !204, line: 213)
!204 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !103, file: !103, line: 96, type: !205, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DISubroutineType(types: !206)
!206 = !{!97, !97, !124}
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !208, line: 214)
!208 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !103, file: !103, line: 98, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !210, line: 215)
!210 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !103, file: !103, line: 100, type: !201, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !212, line: 216)
!212 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !103, file: !103, line: 102, type: !213, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DISubroutineType(types: !214)
!214 = !{!113, !97}
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !216, line: 217)
!216 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !103, file: !103, line: 106, type: !217, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DISubroutineType(types: !218)
!218 = !{!113, !97, !97}
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !220, line: 218)
!220 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !103, file: !103, line: 105, type: !217, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !222, line: 219)
!222 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !103, file: !103, line: 108, type: !213, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !224, line: 220)
!224 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !103, file: !103, line: 112, type: !217, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !226, line: 221)
!226 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !103, file: !103, line: 111, type: !217, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !228, line: 222)
!228 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !103, file: !103, line: 114, type: !217, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !230, line: 223)
!230 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !103, file: !103, line: 116, type: !213, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !232, line: 224)
!232 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !103, file: !103, line: 118, type: !213, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !234, line: 225)
!234 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !103, file: !103, line: 120, type: !217, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !236, line: 226)
!236 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !103, file: !103, line: 121, type: !237, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DISubroutineType(types: !238)
!238 = !{!136, !136}
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !240, line: 227)
!240 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !103, file: !103, line: 123, type: !241, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DISubroutineType(types: !242)
!242 = !{!97, !97, !99}
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !244, line: 228)
!244 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !103, file: !103, line: 125, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !246, line: 229)
!246 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !103, file: !103, line: 126, type: !142, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !248, line: 230)
!248 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !103, file: !103, line: 128, type: !249, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DISubroutineType(types: !250)
!250 = !{!144, !97}
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !252, line: 231)
!252 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !103, file: !103, line: 138, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !254, line: 232)
!254 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !103, file: !103, line: 130, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !256, line: 233)
!256 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !103, file: !103, line: 132, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !258, line: 234)
!258 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !103, file: !103, line: 134, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !260, line: 235)
!260 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !103, file: !103, line: 136, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !262, line: 236)
!262 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !103, file: !103, line: 140, type: !263, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!263 = !DISubroutineType(types: !264)
!264 = !{!136, !97}
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !266, line: 237)
!266 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !103, file: !103, line: 142, type: !263, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !268, line: 238)
!268 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !103, file: !103, line: 144, type: !269, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DISubroutineType(types: !270)
!270 = !{!97, !97, !96}
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !272, line: 239)
!272 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !103, file: !103, line: 145, type: !273, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !DISubroutineType(types: !274)
!274 = !{!98, !275}
!275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !276, size: 64, align: 64)
!276 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !277)
!277 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !279, line: 240)
!279 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !103, file: !103, line: 146, type: !280, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!280 = !DISubroutineType(types: !281)
!281 = !{!97, !275}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !283, line: 241)
!283 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !103, file: !103, line: 148, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !285, line: 242)
!285 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !103, file: !103, line: 150, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !287, line: 243)
!287 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardff", scope: !103, file: !103, line: 152, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !289, line: 244)
!289 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !103, file: !103, line: 156, type: !241, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !291, line: 245)
!291 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !103, file: !103, line: 158, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !293, line: 246)
!293 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !103, file: !103, line: 160, type: !294, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DISubroutineType(types: !295)
!295 = !{!97, !97, !97, !124}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !297, line: 247)
!297 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !103, file: !103, line: 162, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !299, line: 248)
!299 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !103, file: !103, line: 164, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !301, line: 249)
!301 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !103, file: !103, line: 166, type: !302, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DISubroutineType(types: !303)
!303 = !{!97, !97, !136}
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !305, line: 250)
!305 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !103, file: !103, line: 168, type: !241, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !307, line: 251)
!307 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !103, file: !103, line: 170, type: !213, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !309, line: 252)
!309 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !103, file: !103, line: 172, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !311, line: 253)
!311 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !103, file: !103, line: 174, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !313, line: 254)
!313 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !103, file: !103, line: 176, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !315, line: 255)
!315 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !103, file: !103, line: 178, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !317, line: 256)
!317 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !103, file: !103, line: 180, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !319, line: 257)
!319 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !103, file: !103, line: 182, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !321, line: 258)
!321 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !103, file: !103, line: 184, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !323, line: 102)
!323 = !DISubprogram(name: "acos", scope: !324, file: !324, line: 54, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!324 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!325 = !DISubroutineType(types: !326)
!326 = !{!98, !98}
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !328, line: 121)
!328 = !DISubprogram(name: "asin", scope: !324, file: !324, line: 56, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !330, line: 140)
!330 = !DISubprogram(name: "atan", scope: !324, file: !324, line: 58, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !332, line: 159)
!332 = !DISubprogram(name: "atan2", scope: !324, file: !324, line: 60, type: !333, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!333 = !DISubroutineType(types: !334)
!334 = !{!98, !98, !98}
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !336, line: 180)
!336 = !DISubprogram(name: "ceil", scope: !324, file: !324, line: 178, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !338, line: 199)
!338 = !DISubprogram(name: "cos", scope: !324, file: !324, line: 63, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !340, line: 218)
!340 = !DISubprogram(name: "cosh", scope: !324, file: !324, line: 72, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !342, line: 237)
!342 = !DISubprogram(name: "exp", scope: !324, file: !324, line: 100, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !344, line: 256)
!344 = !DISubprogram(name: "fabs", scope: !324, file: !324, line: 181, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !346, line: 275)
!346 = !DISubprogram(name: "floor", scope: !324, file: !324, line: 184, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !348, line: 294)
!348 = !DISubprogram(name: "fmod", scope: !324, file: !324, line: 187, type: !333, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !350, line: 315)
!350 = !DISubprogram(name: "frexp", scope: !324, file: !324, line: 103, type: !351, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!351 = !DISubroutineType(types: !352)
!352 = !{!98, !98, !124}
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !354, line: 334)
!354 = !DISubprogram(name: "ldexp", scope: !324, file: !324, line: 106, type: !355, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!355 = !DISubroutineType(types: !356)
!356 = !{!98, !98, !99}
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !358, line: 353)
!358 = !DISubprogram(name: "log", scope: !324, file: !324, line: 109, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !360, line: 372)
!360 = !DISubprogram(name: "log10", scope: !324, file: !324, line: 112, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !362, line: 391)
!362 = !DISubprogram(name: "modf", scope: !324, file: !324, line: 115, type: !363, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!363 = !DISubroutineType(types: !364)
!364 = !{!98, !98, !365}
!365 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64, align: 64)
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !367, line: 403)
!367 = !DISubprogram(name: "pow", scope: !324, file: !324, line: 153, type: !333, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !369, line: 440)
!369 = !DISubprogram(name: "sin", scope: !324, file: !324, line: 65, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !371, line: 459)
!371 = !DISubprogram(name: "sinh", scope: !324, file: !324, line: 74, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !373, line: 478)
!373 = !DISubprogram(name: "sqrt", scope: !324, file: !324, line: 156, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !375, line: 497)
!375 = !DISubprogram(name: "tan", scope: !324, file: !324, line: 67, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !377, line: 516)
!377 = !DISubprogram(name: "tanh", scope: !324, file: !324, line: 76, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !379, line: 118)
!379 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !380, line: 101, baseType: !381)
!380 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!381 = !DICompositeType(tag: DW_TAG_structure_type, file: !380, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !383, line: 119)
!383 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !380, line: 109, baseType: !384)
!384 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !380, line: 105, size: 128, align: 64, elements: !385, identifier: "_ZTS6ldiv_t")
!385 = !{!386, !387}
!386 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !384, file: !380, line: 107, baseType: !136, size: 64, align: 64)
!387 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !384, file: !380, line: 108, baseType: !136, size: 64, align: 64, offset: 64)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !389, line: 121)
!389 = !DISubprogram(name: "abort", scope: !380, file: !380, line: 515, type: !390, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!390 = !DISubroutineType(types: !391)
!391 = !{null}
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !393, line: 122)
!393 = !DISubprogram(name: "abs", scope: !380, file: !380, line: 774, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!394 = !DISubroutineType(types: !395)
!395 = !{!99, !99}
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !397, line: 123)
!397 = !DISubprogram(name: "atexit", scope: !380, file: !380, line: 519, type: !398, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!398 = !DISubroutineType(types: !399)
!399 = !{!99, !400}
!400 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !390, size: 64, align: 64)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !402, line: 129)
!402 = !DISubprogram(name: "atof", scope: !380, file: !380, line: 144, type: !273, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !404, line: 130)
!404 = !DISubprogram(name: "atoi", scope: !380, file: !380, line: 147, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!405 = !DISubroutineType(types: !406)
!406 = !{!99, !275}
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !408, line: 131)
!408 = !DISubprogram(name: "atol", scope: !380, file: !380, line: 150, type: !409, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!409 = !DISubroutineType(types: !410)
!410 = !{!136, !275}
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !412, line: 132)
!412 = !DISubprogram(name: "bsearch", scope: !380, file: !380, line: 754, type: !413, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!413 = !DISubroutineType(types: !414)
!414 = !{!95, !415, !415, !417, !417, !420}
!415 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !416, size: 64, align: 64)
!416 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !418, line: 62, baseType: !419)
!418 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!419 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!420 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !380, line: 741, baseType: !421)
!421 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !422, size: 64, align: 64)
!422 = !DISubroutineType(types: !423)
!423 = !{!99, !415, !415}
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !425, line: 133)
!425 = !DISubprogram(name: "calloc", scope: !380, file: !380, line: 468, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!426 = !DISubroutineType(types: !427)
!427 = !{!95, !417, !417}
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !429, line: 134)
!429 = !DISubprogram(name: "div", scope: !380, file: !380, line: 788, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DISubroutineType(types: !431)
!431 = !{!379, !99, !99}
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !433, line: 135)
!433 = !DISubprogram(name: "exit", scope: !380, file: !380, line: 543, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!434 = !DISubroutineType(types: !435)
!435 = !{null, !99}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !437, line: 136)
!437 = !DISubprogram(name: "free", scope: !380, file: !380, line: 483, type: !438, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DISubroutineType(types: !439)
!439 = !{null, !95}
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !441, line: 137)
!441 = !DISubprogram(name: "getenv", scope: !380, file: !380, line: 564, type: !442, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!442 = !DISubroutineType(types: !443)
!443 = !{!444, !275}
!444 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 64, align: 64)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !446, line: 138)
!446 = !DISubprogram(name: "labs", scope: !380, file: !380, line: 775, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !448, line: 139)
!448 = !DISubprogram(name: "ldiv", scope: !380, file: !380, line: 790, type: !449, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!449 = !DISubroutineType(types: !450)
!450 = !{!383, !136, !136}
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !452, line: 140)
!452 = !DISubprogram(name: "malloc", scope: !380, file: !380, line: 466, type: !453, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!453 = !DISubroutineType(types: !454)
!454 = !{!95, !417}
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !456, line: 142)
!456 = !DISubprogram(name: "mblen", scope: !380, file: !380, line: 862, type: !457, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!457 = !DISubroutineType(types: !458)
!458 = !{!99, !275, !417}
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !460, line: 143)
!460 = !DISubprogram(name: "mbstowcs", scope: !380, file: !380, line: 873, type: !461, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!461 = !DISubroutineType(types: !462)
!462 = !{!417, !463, !466, !417}
!463 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !464)
!464 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !465, size: 64, align: 64)
!465 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!466 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !275)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !468, line: 144)
!468 = !DISubprogram(name: "mbtowc", scope: !380, file: !380, line: 865, type: !469, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!469 = !DISubroutineType(types: !470)
!470 = !{!99, !463, !466, !417}
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !472, line: 146)
!472 = !DISubprogram(name: "qsort", scope: !380, file: !380, line: 764, type: !473, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DISubroutineType(types: !474)
!474 = !{null, !95, !417, !417, !420}
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !476, line: 152)
!476 = !DISubprogram(name: "rand", scope: !380, file: !380, line: 374, type: !477, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!477 = !DISubroutineType(types: !478)
!478 = !{!99}
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !480, line: 153)
!480 = !DISubprogram(name: "realloc", scope: !380, file: !380, line: 480, type: !481, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!481 = !DISubroutineType(types: !482)
!482 = !{!95, !95, !417}
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !484, line: 154)
!484 = !DISubprogram(name: "srand", scope: !380, file: !380, line: 376, type: !485, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!485 = !DISubroutineType(types: !486)
!486 = !{null, !487}
!487 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !489, line: 155)
!489 = !DISubprogram(name: "strtod", scope: !380, file: !380, line: 164, type: !490, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DISubroutineType(types: !491)
!491 = !{!98, !466, !492}
!492 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !493)
!493 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !444, size: 64, align: 64)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !495, line: 156)
!495 = !DISubprogram(name: "strtol", scope: !380, file: !380, line: 183, type: !496, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DISubroutineType(types: !497)
!497 = !{!136, !466, !492, !99}
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !499, line: 157)
!499 = !DISubprogram(name: "strtoul", scope: !380, file: !380, line: 187, type: !500, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DISubroutineType(types: !501)
!501 = !{!419, !466, !492, !99}
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !503, line: 158)
!503 = !DISubprogram(name: "system", scope: !380, file: !380, line: 716, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !505, line: 160)
!505 = !DISubprogram(name: "wcstombs", scope: !380, file: !380, line: 876, type: !506, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DISubroutineType(types: !507)
!507 = !{!417, !508, !509, !417}
!508 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !444)
!509 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !510)
!510 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !511, size: 64, align: 64)
!511 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !465)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !513, line: 161)
!513 = !DISubprogram(name: "wctomb", scope: !380, file: !380, line: 869, type: !514, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DISubroutineType(types: !515)
!515 = !{!99, !444, !465}
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !519, line: 214)
!517 = !DINamespace(name: "__gnu_cxx", scope: null, file: !518, line: 220)
!518 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!519 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !380, line: 121, baseType: !520)
!520 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !380, line: 117, size: 128, align: 64, elements: !521, identifier: "_ZTS7lldiv_t")
!521 = !{!522, !523}
!522 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !520, file: !380, line: 119, baseType: !144, size: 64, align: 64)
!523 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !520, file: !380, line: 120, baseType: !144, size: 64, align: 64, offset: 64)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !525, line: 220)
!525 = !DISubprogram(name: "_Exit", scope: !380, file: !380, line: 557, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !527, line: 224)
!527 = !DISubprogram(name: "llabs", scope: !380, file: !380, line: 779, type: !142, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !529, line: 230)
!529 = !DISubprogram(name: "lldiv", scope: !380, file: !380, line: 796, type: !530, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DISubroutineType(types: !531)
!531 = !{!519, !144, !144}
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !533, line: 241)
!533 = !DISubprogram(name: "atoll", scope: !380, file: !380, line: 157, type: !534, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DISubroutineType(types: !535)
!535 = !{!144, !275}
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !537, line: 242)
!537 = !DISubprogram(name: "strtoll", scope: !380, file: !380, line: 209, type: !538, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DISubroutineType(types: !539)
!539 = !{!144, !466, !492, !99}
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !541, line: 243)
!541 = !DISubprogram(name: "strtoull", scope: !380, file: !380, line: 214, type: !542, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DISubroutineType(types: !543)
!543 = !{!544, !466, !492, !99}
!544 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !546, line: 245)
!546 = !DISubprogram(name: "strtof", scope: !380, file: !380, line: 172, type: !547, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DISubroutineType(types: !548)
!548 = !{!97, !466, !492}
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !550, line: 246)
!550 = !DISubprogram(name: "strtold", scope: !380, file: !380, line: 175, type: !551, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!551 = !DISubroutineType(types: !552)
!552 = !{!553, !466, !492}
!553 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !519, line: 254)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !525, line: 256)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !527, line: 258)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !558, line: 259)
!558 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !517, file: !559, line: 227, type: !530, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !529, line: 260)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !533, line: 262)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !546, line: 263)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !537, line: 264)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !541, line: 265)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !550, line: 266)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !567, line: 64)
!567 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !568, line: 106, baseType: !569)
!568 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!569 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !568, line: 94, baseType: !570)
!570 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !568, line: 82, size: 64, align: 32, elements: !571, identifier: "_ZTS11__mbstate_t")
!571 = !{!572, !573}
!572 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !570, file: !568, line: 84, baseType: !99, size: 32, align: 32)
!573 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !570, file: !568, line: 93, baseType: !574, size: 32, align: 32, offset: 32)
!574 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !570, file: !568, line: 85, size: 32, align: 32, elements: !575, identifier: "_ZTSN11__mbstate_tUt_E")
!575 = !{!576, !577}
!576 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !574, file: !568, line: 88, baseType: !487, size: 32, align: 32)
!577 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !574, file: !568, line: 92, baseType: !578, size: 32, align: 8)
!578 = !DICompositeType(tag: DW_TAG_array_type, baseType: !277, size: 32, align: 8, elements: !579)
!579 = !{!580}
!580 = !DISubrange(count: 4)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !582, line: 139)
!582 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !418, line: 132, baseType: !487)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !584, line: 141)
!584 = !DISubprogram(name: "btowc", scope: !568, file: !568, line: 356, type: !585, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!585 = !DISubroutineType(types: !586)
!586 = !{!582, !99}
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !588, line: 142)
!588 = !DISubprogram(name: "fgetwc", scope: !568, file: !568, line: 748, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!589 = !DISubroutineType(types: !590)
!590 = !{!582, !591}
!591 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !592, size: 64, align: 64)
!592 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !593, line: 64, baseType: !594)
!593 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!594 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !595, line: 241, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!595 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !597, line: 143)
!597 = !DISubprogram(name: "fgetws", scope: !568, file: !568, line: 777, type: !598, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!598 = !DISubroutineType(types: !599)
!599 = !{!464, !463, !99, !600}
!600 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !591)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !602, line: 144)
!602 = !DISubprogram(name: "fputwc", scope: !568, file: !568, line: 762, type: !603, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!603 = !DISubroutineType(types: !604)
!604 = !{!582, !465, !591}
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !606, line: 145)
!606 = !DISubprogram(name: "fputws", scope: !568, file: !568, line: 784, type: !607, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!607 = !DISubroutineType(types: !608)
!608 = !{!99, !509, !600}
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !610, line: 146)
!610 = !DISubprogram(name: "fwide", scope: !568, file: !568, line: 590, type: !611, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!611 = !DISubroutineType(types: !612)
!612 = !{!99, !591, !99}
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !614, line: 147)
!614 = !DISubprogram(name: "fwprintf", scope: !568, file: !568, line: 597, type: !615, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!615 = !DISubroutineType(types: !616)
!616 = !{!99, !600, !509, null}
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !618, line: 148)
!618 = !DISubprogram(name: "fwscanf", scope: !568, file: !568, line: 638, type: !615, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !620, line: 149)
!620 = !DISubprogram(name: "getwc", scope: !568, file: !568, line: 749, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !622, line: 150)
!622 = !DISubprogram(name: "getwchar", scope: !568, file: !568, line: 755, type: !623, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!623 = !DISubroutineType(types: !624)
!624 = !{!582}
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !626, line: 151)
!626 = !DISubprogram(name: "mbrlen", scope: !568, file: !568, line: 379, type: !627, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!627 = !DISubroutineType(types: !628)
!628 = !{!417, !466, !417, !629}
!629 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !630)
!630 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !567, size: 64, align: 64)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !632, line: 152)
!632 = !DISubprogram(name: "mbrtowc", scope: !568, file: !568, line: 368, type: !633, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!633 = !DISubroutineType(types: !634)
!634 = !{!417, !463, !466, !417, !629}
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !636, line: 153)
!636 = !DISubprogram(name: "mbsinit", scope: !568, file: !568, line: 364, type: !637, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!637 = !DISubroutineType(types: !638)
!638 = !{!99, !639}
!639 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !640, size: 64, align: 64)
!640 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !567)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !642, line: 154)
!642 = !DISubprogram(name: "mbsrtowcs", scope: !568, file: !568, line: 411, type: !643, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!643 = !DISubroutineType(types: !644)
!644 = !{!417, !463, !645, !417, !629}
!645 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !646)
!646 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !275, size: 64, align: 64)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !648, line: 155)
!648 = !DISubprogram(name: "putwc", scope: !568, file: !568, line: 763, type: !603, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !650, line: 156)
!650 = !DISubprogram(name: "putwchar", scope: !568, file: !568, line: 769, type: !651, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!651 = !DISubroutineType(types: !652)
!652 = !{!582, !465}
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !654, line: 158)
!654 = !DISubprogram(name: "swprintf", scope: !568, file: !568, line: 607, type: !655, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!655 = !DISubroutineType(types: !656)
!656 = !{!99, !463, !417, !509, null}
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !658, line: 160)
!658 = !DISubprogram(name: "swscanf", scope: !568, file: !568, line: 648, type: !659, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!659 = !DISubroutineType(types: !660)
!660 = !{!99, !509, !509, null}
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !662, line: 161)
!662 = !DISubprogram(name: "ungetwc", scope: !568, file: !568, line: 792, type: !663, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!663 = !DISubroutineType(types: !664)
!664 = !{!582, !582, !591}
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !666, line: 162)
!666 = !DISubprogram(name: "vfwprintf", scope: !568, file: !568, line: 615, type: !667, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!667 = !DISubroutineType(types: !668)
!668 = !{!99, !600, !509, !669}
!669 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !670, size: 64, align: 64)
!670 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !1, size: 192, align: 64, elements: !671, identifier: "_ZTS13__va_list_tag")
!671 = !{!672, !673, !674, !675}
!672 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !670, file: !1, baseType: !487, size: 32, align: 32)
!673 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !670, file: !1, baseType: !487, size: 32, align: 32, offset: 32)
!674 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !670, file: !1, baseType: !95, size: 64, align: 64, offset: 64)
!675 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !670, file: !1, baseType: !95, size: 64, align: 64, offset: 128)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !677, line: 164)
!677 = !DISubprogram(name: "vfwscanf", scope: !568, file: !568, line: 692, type: !667, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !679, line: 167)
!679 = !DISubprogram(name: "vswprintf", scope: !568, file: !568, line: 628, type: !680, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!680 = !DISubroutineType(types: !681)
!681 = !{!99, !463, !417, !509, !669}
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !683, line: 170)
!683 = !DISubprogram(name: "vswscanf", scope: !568, file: !568, line: 704, type: !684, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!684 = !DISubroutineType(types: !685)
!685 = !{!99, !509, !509, !669}
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !687, line: 172)
!687 = !DISubprogram(name: "vwprintf", scope: !568, file: !568, line: 623, type: !688, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!688 = !DISubroutineType(types: !689)
!689 = !{!99, !509, !669}
!690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !691, line: 174)
!691 = !DISubprogram(name: "vwscanf", scope: !568, file: !568, line: 700, type: !688, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !693, line: 176)
!693 = !DISubprogram(name: "wcrtomb", scope: !568, file: !568, line: 373, type: !694, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!694 = !DISubroutineType(types: !695)
!695 = !{!417, !508, !465, !629}
!696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !697, line: 177)
!697 = !DISubprogram(name: "wcscat", scope: !568, file: !568, line: 157, type: !698, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!698 = !DISubroutineType(types: !699)
!699 = !{!464, !463, !509}
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !701, line: 178)
!701 = !DISubprogram(name: "wcscmp", scope: !568, file: !568, line: 166, type: !702, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!702 = !DISubroutineType(types: !703)
!703 = !{!99, !510, !510}
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !705, line: 179)
!705 = !DISubprogram(name: "wcscoll", scope: !568, file: !568, line: 195, type: !702, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !707, line: 180)
!707 = !DISubprogram(name: "wcscpy", scope: !568, file: !568, line: 147, type: !698, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !709, line: 181)
!709 = !DISubprogram(name: "wcscspn", scope: !568, file: !568, line: 255, type: !710, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!710 = !DISubroutineType(types: !711)
!711 = !{!417, !510, !510}
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !713, line: 182)
!713 = !DISubprogram(name: "wcsftime", scope: !568, file: !568, line: 858, type: !714, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!714 = !DISubroutineType(types: !715)
!715 = !{!417, !463, !417, !509, !716}
!716 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !717)
!717 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !718, size: 64, align: 64)
!718 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !719)
!719 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !568, line: 137, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !721, line: 183)
!721 = !DISubprogram(name: "wcslen", scope: !568, file: !568, line: 290, type: !722, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!722 = !DISubroutineType(types: !723)
!723 = !{!417, !510}
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !725, line: 184)
!725 = !DISubprogram(name: "wcsncat", scope: !568, file: !568, line: 161, type: !726, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!726 = !DISubroutineType(types: !727)
!727 = !{!464, !463, !509, !417}
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !729, line: 185)
!729 = !DISubprogram(name: "wcsncmp", scope: !568, file: !568, line: 169, type: !730, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!730 = !DISubroutineType(types: !731)
!731 = !{!99, !510, !510, !417}
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !733, line: 186)
!733 = !DISubprogram(name: "wcsncpy", scope: !568, file: !568, line: 152, type: !726, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !735, line: 187)
!735 = !DISubprogram(name: "wcsrtombs", scope: !568, file: !568, line: 417, type: !736, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!736 = !DISubroutineType(types: !737)
!737 = !{!417, !508, !738, !417, !629}
!738 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !739)
!739 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !510, size: 64, align: 64)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !741, line: 188)
!741 = !DISubprogram(name: "wcsspn", scope: !568, file: !568, line: 259, type: !710, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !743, line: 189)
!743 = !DISubprogram(name: "wcstod", scope: !568, file: !568, line: 453, type: !744, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!744 = !DISubroutineType(types: !745)
!745 = !{!98, !509, !746}
!746 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !747)
!747 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !464, size: 64, align: 64)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !749, line: 191)
!749 = !DISubprogram(name: "wcstof", scope: !568, file: !568, line: 460, type: !750, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!750 = !DISubroutineType(types: !751)
!751 = !{!97, !509, !746}
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !753, line: 193)
!753 = !DISubprogram(name: "wcstok", scope: !568, file: !568, line: 285, type: !754, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!754 = !DISubroutineType(types: !755)
!755 = !{!464, !463, !509, !746}
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !757, line: 194)
!757 = !DISubprogram(name: "wcstol", scope: !568, file: !568, line: 471, type: !758, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!758 = !DISubroutineType(types: !759)
!759 = !{!136, !509, !746, !99}
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !761, line: 195)
!761 = !DISubprogram(name: "wcstoul", scope: !568, file: !568, line: 476, type: !762, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!762 = !DISubroutineType(types: !763)
!763 = !{!419, !509, !746, !99}
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !765, line: 196)
!765 = !DISubprogram(name: "wcsxfrm", scope: !568, file: !568, line: 199, type: !766, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!766 = !DISubroutineType(types: !767)
!767 = !{!417, !463, !509, !417}
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !769, line: 197)
!769 = !DISubprogram(name: "wctob", scope: !568, file: !568, line: 360, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!770 = !DISubroutineType(types: !771)
!771 = !{!99, !582}
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !773, line: 198)
!773 = !DISubprogram(name: "wmemcmp", scope: !568, file: !568, line: 328, type: !730, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !775, line: 199)
!775 = !DISubprogram(name: "wmemcpy", scope: !568, file: !568, line: 332, type: !726, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !777, line: 200)
!777 = !DISubprogram(name: "wmemmove", scope: !568, file: !568, line: 337, type: !778, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!778 = !DISubroutineType(types: !779)
!779 = !{!464, !464, !510, !417}
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !781, line: 201)
!781 = !DISubprogram(name: "wmemset", scope: !568, file: !568, line: 341, type: !782, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!782 = !DISubroutineType(types: !783)
!783 = !{!464, !464, !465, !417}
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !785, line: 202)
!785 = !DISubprogram(name: "wprintf", scope: !568, file: !568, line: 604, type: !786, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!786 = !DISubroutineType(types: !787)
!787 = !{!99, !509, null}
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !789, line: 203)
!789 = !DISubprogram(name: "wscanf", scope: !568, file: !568, line: 645, type: !786, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !791, line: 204)
!791 = !DISubprogram(name: "wcschr", scope: !568, file: !568, line: 230, type: !792, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!792 = !DISubroutineType(types: !793)
!793 = !{!464, !510, !465}
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !795, line: 205)
!795 = !DISubprogram(name: "wcspbrk", scope: !568, file: !568, line: 269, type: !796, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!796 = !DISubroutineType(types: !797)
!797 = !{!464, !510, !510}
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !799, line: 206)
!799 = !DISubprogram(name: "wcsrchr", scope: !568, file: !568, line: 240, type: !792, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !801, line: 207)
!801 = !DISubprogram(name: "wcsstr", scope: !568, file: !568, line: 280, type: !796, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !803, line: 208)
!803 = !DISubprogram(name: "wmemchr", scope: !568, file: !568, line: 323, type: !804, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!804 = !DISubroutineType(types: !805)
!805 = !{!464, !510, !465, !417}
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !807, line: 248)
!807 = !DISubprogram(name: "wcstold", scope: !568, file: !568, line: 462, type: !808, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!808 = !DISubroutineType(types: !809)
!809 = !{!553, !509, !746}
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !811, line: 257)
!811 = !DISubprogram(name: "wcstoll", scope: !568, file: !568, line: 486, type: !812, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!812 = !DISubroutineType(types: !813)
!813 = !{!144, !509, !746, !99}
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !815, line: 258)
!815 = !DISubprogram(name: "wcstoull", scope: !568, file: !568, line: 493, type: !816, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!816 = !DISubroutineType(types: !817)
!817 = !{!544, !509, !746, !99}
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !807, line: 264)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !811, line: 265)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !815, line: 266)
!821 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !822, entity: !824, line: 56)
!822 = !DINamespace(name: "__gnu_debug", scope: null, file: !823, line: 54)
!823 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/debug/debug.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!824 = !DINamespace(name: "__debug", scope: !102, file: !823, line: 48)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !826, line: 53)
!826 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !827, line: 53, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!827 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !829, line: 54)
!829 = !DISubprogram(name: "setlocale", scope: !827, file: !827, line: 124, type: !830, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!830 = !DISubroutineType(types: !831)
!831 = !{!444, !99, !275}
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !833, line: 55)
!833 = !DISubprogram(name: "localeconv", scope: !827, file: !827, line: 127, type: !834, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!834 = !DISubroutineType(types: !835)
!835 = !{!836}
!836 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !826, size: 64, align: 64)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !838, line: 64)
!838 = !DISubprogram(name: "isalnum", scope: !839, file: !839, line: 110, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!839 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !841, line: 65)
!841 = !DISubprogram(name: "isalpha", scope: !839, file: !839, line: 111, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !843, line: 66)
!843 = !DISubprogram(name: "iscntrl", scope: !839, file: !839, line: 112, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !845, line: 67)
!845 = !DISubprogram(name: "isdigit", scope: !839, file: !839, line: 113, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !847, line: 68)
!847 = !DISubprogram(name: "isgraph", scope: !839, file: !839, line: 115, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !849, line: 69)
!849 = !DISubprogram(name: "islower", scope: !839, file: !839, line: 114, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !851, line: 70)
!851 = !DISubprogram(name: "isprint", scope: !839, file: !839, line: 116, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !853, line: 71)
!853 = !DISubprogram(name: "ispunct", scope: !839, file: !839, line: 117, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !855, line: 72)
!855 = !DISubprogram(name: "isspace", scope: !839, file: !839, line: 118, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !857, line: 73)
!857 = !DISubprogram(name: "isupper", scope: !839, file: !839, line: 119, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !859, line: 74)
!859 = !DISubprogram(name: "isxdigit", scope: !839, file: !839, line: 120, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !861, line: 75)
!861 = !DISubprogram(name: "tolower", scope: !839, file: !839, line: 124, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !863, line: 76)
!863 = !DISubprogram(name: "toupper", scope: !839, file: !839, line: 127, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !865, line: 44)
!865 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !102, file: !518, line: 196, baseType: !419)
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !867, line: 45)
!867 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !102, file: !518, line: 197, baseType: !136)
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !869, line: 82)
!869 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !870, line: 186, baseType: !871)
!870 = !DIFile(filename: "/usr/include/wctype.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!871 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !872, size: 64, align: 64)
!872 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !873)
!873 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !874, line: 40, baseType: !99)
!874 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !876, line: 83)
!876 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !870, line: 52, baseType: !419)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !582, line: 84)
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !879, line: 86)
!879 = !DISubprogram(name: "iswalnum", scope: !870, file: !870, line: 111, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !881, line: 87)
!881 = !DISubprogram(name: "iswalpha", scope: !870, file: !870, line: 117, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !883, line: 89)
!883 = !DISubprogram(name: "iswblank", scope: !870, file: !870, line: 162, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !885, line: 91)
!885 = !DISubprogram(name: "iswcntrl", scope: !870, file: !870, line: 120, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!886 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !887, line: 92)
!887 = !DISubprogram(name: "iswctype", scope: !870, file: !870, line: 175, type: !888, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!888 = !DISubroutineType(types: !889)
!889 = !{!99, !582, !876}
!890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !891, line: 93)
!891 = !DISubprogram(name: "iswdigit", scope: !870, file: !870, line: 124, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !893, line: 94)
!893 = !DISubprogram(name: "iswgraph", scope: !870, file: !870, line: 128, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !895, line: 95)
!895 = !DISubprogram(name: "iswlower", scope: !870, file: !870, line: 133, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !897, line: 96)
!897 = !DISubprogram(name: "iswprint", scope: !870, file: !870, line: 136, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !899, line: 97)
!899 = !DISubprogram(name: "iswpunct", scope: !870, file: !870, line: 141, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !901, line: 98)
!901 = !DISubprogram(name: "iswspace", scope: !870, file: !870, line: 146, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !903, line: 99)
!903 = !DISubprogram(name: "iswupper", scope: !870, file: !870, line: 151, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !905, line: 100)
!905 = !DISubprogram(name: "iswxdigit", scope: !870, file: !870, line: 156, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !907, line: 101)
!907 = !DISubprogram(name: "towctrans", scope: !870, file: !870, line: 221, type: !908, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!908 = !DISubroutineType(types: !909)
!909 = !{!582, !582, !869}
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !911, line: 102)
!911 = !DISubprogram(name: "towlower", scope: !870, file: !870, line: 194, type: !912, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!912 = !DISubroutineType(types: !913)
!913 = !{!582, !582}
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !915, line: 103)
!915 = !DISubprogram(name: "towupper", scope: !870, file: !870, line: 197, type: !912, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !917, line: 104)
!917 = !DISubprogram(name: "wctrans", scope: !870, file: !870, line: 218, type: !918, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!918 = !DISubroutineType(types: !919)
!919 = !{!869, !275}
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !921, line: 105)
!921 = !DISubprogram(name: "wctype", scope: !870, file: !870, line: 171, type: !922, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!922 = !DISubroutineType(types: !923)
!923 = !{!876, !275}
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !925, line: 98)
!925 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !593, line: 48, baseType: !594)
!926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !927, line: 99)
!927 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !593, line: 110, baseType: !928)
!928 = !DIDerivedType(tag: DW_TAG_typedef, name: "_G_fpos_t", file: !929, line: 25, baseType: !930)
!929 = !DIFile(filename: "/usr/include/_G_config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!930 = !DICompositeType(tag: DW_TAG_structure_type, file: !929, line: 21, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !932, line: 101)
!932 = !DISubprogram(name: "clearerr", scope: !593, file: !593, line: 826, type: !933, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!933 = !DISubroutineType(types: !934)
!934 = !{null, !935}
!935 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !925, size: 64, align: 64)
!936 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !937, line: 102)
!937 = !DISubprogram(name: "fclose", scope: !593, file: !593, line: 237, type: !938, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!938 = !DISubroutineType(types: !939)
!939 = !{!99, !935}
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !941, line: 103)
!941 = !DISubprogram(name: "feof", scope: !593, file: !593, line: 828, type: !938, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !943, line: 104)
!943 = !DISubprogram(name: "ferror", scope: !593, file: !593, line: 830, type: !938, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!944 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !945, line: 105)
!945 = !DISubprogram(name: "fflush", scope: !593, file: !593, line: 242, type: !938, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !947, line: 106)
!947 = !DISubprogram(name: "fgetc", scope: !593, file: !593, line: 531, type: !938, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !949, line: 107)
!949 = !DISubprogram(name: "fgetpos", scope: !593, file: !593, line: 798, type: !950, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!950 = !DISubroutineType(types: !951)
!951 = !{!99, !952, !953}
!952 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !935)
!953 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !954)
!954 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !927, size: 64, align: 64)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !956, line: 108)
!956 = !DISubprogram(name: "fgets", scope: !593, file: !593, line: 622, type: !957, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!957 = !DISubroutineType(types: !958)
!958 = !{!444, !508, !99, !952}
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !960, line: 109)
!960 = !DISubprogram(name: "fopen", scope: !593, file: !593, line: 272, type: !961, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!961 = !DISubroutineType(types: !962)
!962 = !{!935, !466, !466}
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !964, line: 110)
!964 = !DISubprogram(name: "fprintf", scope: !593, file: !593, line: 356, type: !965, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!965 = !DISubroutineType(types: !966)
!966 = !{!99, !952, !466, null}
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !968, line: 111)
!968 = !DISubprogram(name: "fputc", scope: !593, file: !593, line: 573, type: !969, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!969 = !DISubroutineType(types: !970)
!970 = !{!99, !99, !935}
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !972, line: 112)
!972 = !DISubprogram(name: "fputs", scope: !593, file: !593, line: 689, type: !973, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!973 = !DISubroutineType(types: !974)
!974 = !{!99, !466, !952}
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !976, line: 113)
!976 = !DISubprogram(name: "fread", scope: !593, file: !593, line: 709, type: !977, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!977 = !DISubroutineType(types: !978)
!978 = !{!417, !979, !417, !417, !952}
!979 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !95)
!980 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !981, line: 114)
!981 = !DISubprogram(name: "freopen", scope: !593, file: !593, line: 278, type: !982, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!982 = !DISubroutineType(types: !983)
!983 = !{!935, !466, !466, !952}
!984 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !985, line: 115)
!985 = !DISubprogram(name: "fscanf", scope: !593, file: !593, line: 425, type: !965, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !987, line: 116)
!987 = !DISubprogram(name: "fseek", scope: !593, file: !593, line: 749, type: !988, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!988 = !DISubroutineType(types: !989)
!989 = !{!99, !935, !136, !99}
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !991, line: 117)
!991 = !DISubprogram(name: "fsetpos", scope: !593, file: !593, line: 803, type: !992, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!992 = !DISubroutineType(types: !993)
!993 = !{!99, !935, !994}
!994 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !995, size: 64, align: 64)
!995 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !927)
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !997, line: 118)
!997 = !DISubprogram(name: "ftell", scope: !593, file: !593, line: 754, type: !998, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!998 = !DISubroutineType(types: !999)
!999 = !{!136, !935}
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1001, line: 119)
!1001 = !DISubprogram(name: "fwrite", scope: !593, file: !593, line: 715, type: !1002, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1002 = !DISubroutineType(types: !1003)
!1003 = !{!417, !1004, !417, !417, !952}
!1004 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !415)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1006, line: 120)
!1006 = !DISubprogram(name: "getc", scope: !593, file: !593, line: 532, type: !938, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1008, line: 121)
!1008 = !DISubprogram(name: "getchar", scope: !593, file: !593, line: 538, type: !477, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1010, line: 124)
!1010 = !DISubprogram(name: "gets", scope: !593, file: !593, line: 638, type: !1011, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1011 = !DISubroutineType(types: !1012)
!1012 = !{!444, !444}
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1014, line: 126)
!1014 = !DISubprogram(name: "perror", scope: !593, file: !593, line: 846, type: !1015, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{null, !275}
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1018, line: 127)
!1018 = !DISubprogram(name: "printf", scope: !593, file: !593, line: 362, type: !1019, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!99, !466, null}
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1022, line: 128)
!1022 = !DISubprogram(name: "putc", scope: !593, file: !593, line: 574, type: !969, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1024, line: 129)
!1024 = !DISubprogram(name: "putchar", scope: !593, file: !593, line: 580, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1026, line: 130)
!1026 = !DISubprogram(name: "puts", scope: !593, file: !593, line: 695, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1028, line: 131)
!1028 = !DISubprogram(name: "remove", scope: !593, file: !593, line: 178, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1030, line: 132)
!1030 = !DISubprogram(name: "rename", scope: !593, file: !593, line: 180, type: !1031, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1031 = !DISubroutineType(types: !1032)
!1032 = !{!99, !275, !275}
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1034, line: 133)
!1034 = !DISubprogram(name: "rewind", scope: !593, file: !593, line: 759, type: !933, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1036, line: 134)
!1036 = !DISubprogram(name: "scanf", scope: !593, file: !593, line: 431, type: !1019, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1038, line: 135)
!1038 = !DISubprogram(name: "setbuf", scope: !593, file: !593, line: 332, type: !1039, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1039 = !DISubroutineType(types: !1040)
!1040 = !{null, !952, !508}
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1042, line: 136)
!1042 = !DISubprogram(name: "setvbuf", scope: !593, file: !593, line: 336, type: !1043, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1043 = !DISubroutineType(types: !1044)
!1044 = !{!99, !952, !508, !99, !417}
!1045 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1046, line: 137)
!1046 = !DISubprogram(name: "sprintf", scope: !593, file: !593, line: 364, type: !1047, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1047 = !DISubroutineType(types: !1048)
!1048 = !{!99, !508, !466, null}
!1049 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1050, line: 138)
!1050 = !DISubprogram(name: "sscanf", scope: !593, file: !593, line: 433, type: !1051, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1051 = !DISubroutineType(types: !1052)
!1052 = !{!99, !466, !466, null}
!1053 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1054, line: 139)
!1054 = !DISubprogram(name: "tmpfile", scope: !593, file: !593, line: 195, type: !1055, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1055 = !DISubroutineType(types: !1056)
!1056 = !{!935}
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1058, line: 141)
!1058 = !DISubprogram(name: "tmpnam", scope: !593, file: !593, line: 209, type: !1011, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1060, line: 143)
!1060 = !DISubprogram(name: "ungetc", scope: !593, file: !593, line: 702, type: !969, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1062, line: 144)
!1062 = !DISubprogram(name: "vfprintf", scope: !593, file: !593, line: 371, type: !1063, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1063 = !DISubroutineType(types: !1064)
!1064 = !{!99, !952, !466, !669}
!1065 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1066, line: 145)
!1066 = !DISubprogram(name: "vprintf", scope: !593, file: !593, line: 377, type: !1067, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1067 = !DISubroutineType(types: !1068)
!1068 = !{!99, !466, !669}
!1069 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1070, line: 146)
!1070 = !DISubprogram(name: "vsprintf", scope: !593, file: !593, line: 379, type: !1071, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1071 = !DISubroutineType(types: !1072)
!1072 = !{!99, !508, !466, !669}
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1074, line: 175)
!1074 = !DISubprogram(name: "snprintf", scope: !593, file: !593, line: 386, type: !1075, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1075 = !DISubroutineType(types: !1076)
!1076 = !{!99, !508, !417, !466, null}
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1078, line: 176)
!1078 = !DISubprogram(name: "vfscanf", scope: !593, file: !593, line: 471, type: !1063, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1080, line: 177)
!1080 = !DISubprogram(name: "vscanf", scope: !593, file: !593, line: 479, type: !1067, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1082, line: 178)
!1082 = !DISubprogram(name: "vsnprintf", scope: !593, file: !593, line: 390, type: !1083, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!99, !508, !417, !466, !669}
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !517, entity: !1086, line: 179)
!1086 = !DISubprogram(name: "vsscanf", scope: !593, file: !593, line: 483, type: !1087, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1087 = !DISubroutineType(types: !1088)
!1088 = !{!99, !466, !466, !669}
!1089 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1074, line: 185)
!1090 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1078, line: 186)
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1080, line: 187)
!1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1082, line: 188)
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !102, entity: !1086, line: 189)
!1094 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !0, entity: !102, line: 35)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !0, entity: !102, line: 16)
!1096 = !{i32 2, !"Dwarf Version", i32 4}
!1097 = !{i32 2, !"Debug Info Version", i32 3}
!1098 = !{!"clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 0c0654cbe42ce8060cf9bfeea18254aa37aceca3) (http://llvm.org/git/llvm.git 008f70d21cc2b33cebd1d4443052e62d3fbea6e8)"}
!1099 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !104, file: !104, line: 74, type: !390, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !1100)
!1100 = !{}
!1101 = !DILocation(line: 74, column: 25, scope: !1099)
!1102 = !DILocation(line: 74, column: 25, scope: !1103)
!1103 = !DILexicalBlockFile(scope: !1099, file: !104, discriminator: 1)
!1104 = distinct !DISubprogram(name: "kernel_compute_cost", linkageName: "_Z19kernel_compute_costiilP5PointiiPfS1_PiPb", scope: !1, file: !1, line: 63, type: !1105, isLocal: false, isDefinition: true, scopeLine: 65, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !1100)
!1105 = !DISubroutineType(types: !1106)
!1106 = !{null, !99, !99, !136, !128, !99, !99, !96, !96, !124, !126}
!1107 = !DILocalVariable(name: "num", arg: 1, scope: !1104, file: !1, line: 63, type: !99)
!1108 = !DIExpression()
!1109 = !DILocation(line: 63, column: 25, scope: !1104)
!1110 = !DILocalVariable(name: "dim", arg: 2, scope: !1104, file: !1, line: 63, type: !99)
!1111 = !DILocation(line: 63, column: 34, scope: !1104)
!1112 = !DILocalVariable(name: "x", arg: 3, scope: !1104, file: !1, line: 63, type: !136)
!1113 = !DILocation(line: 63, column: 44, scope: !1104)
!1114 = !DILocalVariable(name: "p", arg: 4, scope: !1104, file: !1, line: 63, type: !128)
!1115 = !DILocation(line: 63, column: 54, scope: !1104)
!1116 = !DILocalVariable(name: "K", arg: 5, scope: !1104, file: !1, line: 63, type: !99)
!1117 = !DILocation(line: 63, column: 61, scope: !1104)
!1118 = !DILocalVariable(name: "stride", arg: 6, scope: !1104, file: !1, line: 63, type: !99)
!1119 = !DILocation(line: 63, column: 68, scope: !1104)
!1120 = !DILocalVariable(name: "coord_d", arg: 7, scope: !1104, file: !1, line: 64, type: !96)
!1121 = !DILocation(line: 64, column: 13, scope: !1104)
!1122 = !DILocalVariable(name: "work_mem_d", arg: 8, scope: !1104, file: !1, line: 64, type: !96)
!1123 = !DILocation(line: 64, column: 29, scope: !1104)
!1124 = !DILocalVariable(name: "center_table_d", arg: 9, scope: !1104, file: !1, line: 64, type: !124)
!1125 = !DILocation(line: 64, column: 46, scope: !1104)
!1126 = !DILocalVariable(name: "switch_membership_d", arg: 10, scope: !1104, file: !1, line: 64, type: !126)
!1127 = !DILocation(line: 64, column: 68, scope: !1104)
!1128 = !DILocation(line: 65, column: 1, scope: !1104)
!1129 = !DILocation(line: 65, column: 1, scope: !1130)
!1130 = !DILexicalBlockFile(scope: !1104, file: !1, discriminator: 1)
!1131 = !DILocation(line: 65, column: 1, scope: !1132)
!1132 = !DILexicalBlockFile(scope: !1104, file: !1, discriminator: 2)
!1133 = !DILocation(line: 65, column: 1, scope: !1134)
!1134 = !DILexicalBlockFile(scope: !1104, file: !1, discriminator: 3)
!1135 = !DILocation(line: 65, column: 1, scope: !1136)
!1136 = !DILexicalBlockFile(scope: !1104, file: !1, discriminator: 4)
!1137 = !DILocation(line: 65, column: 1, scope: !1138)
!1138 = !DILexicalBlockFile(scope: !1104, file: !1, discriminator: 5)
!1139 = !DILocation(line: 65, column: 1, scope: !1140)
!1140 = !DILexicalBlockFile(scope: !1104, file: !1, discriminator: 6)
!1141 = !DILocation(line: 65, column: 1, scope: !1142)
!1142 = !DILexicalBlockFile(scope: !1104, file: !1, discriminator: 7)
!1143 = !DILocation(line: 65, column: 1, scope: !1144)
!1144 = !DILexicalBlockFile(scope: !1104, file: !1, discriminator: 8)
!1145 = !DILocation(line: 65, column: 1, scope: !1146)
!1146 = !DILexicalBlockFile(scope: !1104, file: !1, discriminator: 9)
!1147 = !DILocation(line: 65, column: 1, scope: !1148)
!1148 = !DILexicalBlockFile(scope: !1104, file: !1, discriminator: 10)
!1149 = !DILocation(line: 89, column: 1, scope: !1104)
!1150 = distinct !DISubprogram(name: "allocDevMem", linkageName: "_Z11allocDevMemii", scope: !1, file: !1, line: 94, type: !1151, isLocal: false, isDefinition: true, scopeLine: 95, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !1100)
!1151 = !DISubroutineType(types: !1152)
!1152 = !{null, !99, !99}
!1153 = !DILocalVariable(name: "num", arg: 1, scope: !1150, file: !1, line: 94, type: !99)
!1154 = !DILocation(line: 94, column: 22, scope: !1150)
!1155 = !DILocalVariable(name: "dim", arg: 2, scope: !1150, file: !1, line: 94, type: !99)
!1156 = !DILocation(line: 94, column: 31, scope: !1150)
!1157 = !DILocation(line: 96, column: 2, scope: !1150)
!1158 = distinct !{!1158, !1157}
!1159 = !DILocalVariable(name: "err", scope: !1160, file: !1, line: 96, type: !3)
!1160 = distinct !DILexicalBlock(scope: !1150, file: !1, line: 96, column: 2)
!1161 = !DILocation(line: 96, column: 2, scope: !1160)
!1162 = !DILocation(line: 96, column: 2, scope: !1163)
!1163 = !DILexicalBlockFile(scope: !1160, file: !1, discriminator: 1)
!1164 = !DILocation(line: 96, column: 2, scope: !1165)
!1165 = !DILexicalBlockFile(scope: !1166, file: !1, discriminator: 2)
!1166 = distinct !DILexicalBlock(scope: !1167, file: !1, line: 96, column: 2)
!1167 = distinct !DILexicalBlock(scope: !1160, file: !1, line: 96, column: 2)
!1168 = !DILocation(line: 96, column: 2, scope: !1169)
!1169 = !DILexicalBlockFile(scope: !1165, file: !1, discriminator: 4)
!1170 = !DILocation(line: 96, column: 2, scope: !1171)
!1171 = !DILexicalBlockFile(scope: !1165, file: !1, discriminator: 5)
!1172 = !DILocation(line: 96, column: 2, scope: !1173)
!1173 = !DILexicalBlockFile(scope: !1160, file: !1, discriminator: 3)
!1174 = !DILocation(line: 97, column: 2, scope: !1150)
!1175 = distinct !{!1175, !1174}
!1176 = !DILocalVariable(name: "err", scope: !1177, file: !1, line: 97, type: !3)
!1177 = distinct !DILexicalBlock(scope: !1150, file: !1, line: 97, column: 2)
!1178 = !DILocation(line: 97, column: 2, scope: !1177)
!1179 = !DILocation(line: 97, column: 2, scope: !1180)
!1180 = !DILexicalBlockFile(scope: !1177, file: !1, discriminator: 1)
!1181 = !DILocation(line: 97, column: 2, scope: !1182)
!1182 = !DILexicalBlockFile(scope: !1183, file: !1, discriminator: 2)
!1183 = distinct !DILexicalBlock(scope: !1184, file: !1, line: 97, column: 2)
!1184 = distinct !DILexicalBlock(scope: !1177, file: !1, line: 97, column: 2)
!1185 = !DILocation(line: 97, column: 2, scope: !1186)
!1186 = !DILexicalBlockFile(scope: !1182, file: !1, discriminator: 4)
!1187 = !DILocation(line: 97, column: 2, scope: !1188)
!1188 = !DILexicalBlockFile(scope: !1182, file: !1, discriminator: 5)
!1189 = !DILocation(line: 97, column: 2, scope: !1190)
!1190 = !DILexicalBlockFile(scope: !1177, file: !1, discriminator: 3)
!1191 = !DILocation(line: 98, column: 2, scope: !1150)
!1192 = distinct !{!1192, !1191}
!1193 = !DILocalVariable(name: "err", scope: !1194, file: !1, line: 98, type: !3)
!1194 = distinct !DILexicalBlock(scope: !1150, file: !1, line: 98, column: 2)
!1195 = !DILocation(line: 98, column: 2, scope: !1194)
!1196 = !DILocation(line: 98, column: 2, scope: !1197)
!1197 = !DILexicalBlockFile(scope: !1194, file: !1, discriminator: 1)
!1198 = !DILocation(line: 98, column: 2, scope: !1199)
!1199 = !DILexicalBlockFile(scope: !1200, file: !1, discriminator: 2)
!1200 = distinct !DILexicalBlock(scope: !1201, file: !1, line: 98, column: 2)
!1201 = distinct !DILexicalBlock(scope: !1194, file: !1, line: 98, column: 2)
!1202 = !DILocation(line: 98, column: 2, scope: !1203)
!1203 = !DILexicalBlockFile(scope: !1199, file: !1, discriminator: 4)
!1204 = !DILocation(line: 98, column: 2, scope: !1205)
!1205 = !DILexicalBlockFile(scope: !1199, file: !1, discriminator: 5)
!1206 = !DILocation(line: 98, column: 2, scope: !1207)
!1207 = !DILexicalBlockFile(scope: !1194, file: !1, discriminator: 3)
!1208 = !DILocation(line: 99, column: 2, scope: !1150)
!1209 = distinct !{!1209, !1208}
!1210 = !DILocalVariable(name: "err", scope: !1211, file: !1, line: 99, type: !3)
!1211 = distinct !DILexicalBlock(scope: !1150, file: !1, line: 99, column: 2)
!1212 = !DILocation(line: 99, column: 2, scope: !1211)
!1213 = !DILocation(line: 99, column: 2, scope: !1214)
!1214 = !DILexicalBlockFile(scope: !1211, file: !1, discriminator: 1)
!1215 = !DILocation(line: 99, column: 2, scope: !1216)
!1216 = !DILexicalBlockFile(scope: !1217, file: !1, discriminator: 2)
!1217 = distinct !DILexicalBlock(scope: !1218, file: !1, line: 99, column: 2)
!1218 = distinct !DILexicalBlock(scope: !1211, file: !1, line: 99, column: 2)
!1219 = !DILocation(line: 99, column: 2, scope: !1220)
!1220 = !DILexicalBlockFile(scope: !1216, file: !1, discriminator: 4)
!1221 = !DILocation(line: 99, column: 2, scope: !1222)
!1222 = !DILexicalBlockFile(scope: !1216, file: !1, discriminator: 5)
!1223 = !DILocation(line: 99, column: 2, scope: !1224)
!1224 = !DILexicalBlockFile(scope: !1211, file: !1, discriminator: 3)
!1225 = !DILocation(line: 100, column: 1, scope: !1150)
!1226 = distinct !DISubprogram(name: "allocHostMem", linkageName: "_Z12allocHostMemii", scope: !1, file: !1, line: 105, type: !1151, isLocal: false, isDefinition: true, scopeLine: 106, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !1100)
!1227 = !DILocalVariable(name: "num", arg: 1, scope: !1226, file: !1, line: 105, type: !99)
!1228 = !DILocation(line: 105, column: 23, scope: !1226)
!1229 = !DILocalVariable(name: "dim", arg: 2, scope: !1226, file: !1, line: 105, type: !99)
!1230 = !DILocation(line: 105, column: 32, scope: !1226)
!1231 = !DILocation(line: 107, column: 29, scope: !1226)
!1232 = !DILocation(line: 107, column: 35, scope: !1226)
!1233 = !DILocation(line: 107, column: 33, scope: !1226)
!1234 = !DILocation(line: 107, column: 39, scope: !1226)
!1235 = !DILocation(line: 107, column: 21, scope: !1226)
!1236 = !DILocation(line: 107, column: 12, scope: !1226)
!1237 = !DILocation(line: 107, column: 10, scope: !1226)
!1238 = !DILocation(line: 108, column: 1, scope: !1226)
!1239 = distinct !DISubprogram(name: "freeDevMem", linkageName: "_Z10freeDevMemv", scope: !1, file: !1, line: 113, type: !390, isLocal: false, isDefinition: true, scopeLine: 114, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !1100)
!1240 = !DILocation(line: 115, column: 2, scope: !1239)
!1241 = distinct !{!1241, !1240}
!1242 = !DILocalVariable(name: "err", scope: !1243, file: !1, line: 115, type: !3)
!1243 = distinct !DILexicalBlock(scope: !1239, file: !1, line: 115, column: 2)
!1244 = !DILocation(line: 115, column: 2, scope: !1243)
!1245 = !DILocation(line: 115, column: 2, scope: !1246)
!1246 = !DILexicalBlockFile(scope: !1243, file: !1, discriminator: 1)
!1247 = !DILocation(line: 115, column: 2, scope: !1248)
!1248 = !DILexicalBlockFile(scope: !1249, file: !1, discriminator: 2)
!1249 = distinct !DILexicalBlock(scope: !1250, file: !1, line: 115, column: 2)
!1250 = distinct !DILexicalBlock(scope: !1243, file: !1, line: 115, column: 2)
!1251 = !DILocation(line: 115, column: 2, scope: !1252)
!1252 = !DILexicalBlockFile(scope: !1248, file: !1, discriminator: 4)
!1253 = !DILocation(line: 115, column: 2, scope: !1254)
!1254 = !DILexicalBlockFile(scope: !1248, file: !1, discriminator: 5)
!1255 = !DILocation(line: 115, column: 2, scope: !1256)
!1256 = !DILexicalBlockFile(scope: !1243, file: !1, discriminator: 3)
!1257 = !DILocation(line: 116, column: 2, scope: !1239)
!1258 = distinct !{!1258, !1257}
!1259 = !DILocalVariable(name: "err", scope: !1260, file: !1, line: 116, type: !3)
!1260 = distinct !DILexicalBlock(scope: !1239, file: !1, line: 116, column: 2)
!1261 = !DILocation(line: 116, column: 2, scope: !1260)
!1262 = !DILocation(line: 116, column: 2, scope: !1263)
!1263 = !DILexicalBlockFile(scope: !1260, file: !1, discriminator: 1)
!1264 = !DILocation(line: 116, column: 2, scope: !1265)
!1265 = !DILexicalBlockFile(scope: !1266, file: !1, discriminator: 2)
!1266 = distinct !DILexicalBlock(scope: !1267, file: !1, line: 116, column: 2)
!1267 = distinct !DILexicalBlock(scope: !1260, file: !1, line: 116, column: 2)
!1268 = !DILocation(line: 116, column: 2, scope: !1269)
!1269 = !DILexicalBlockFile(scope: !1265, file: !1, discriminator: 4)
!1270 = !DILocation(line: 116, column: 2, scope: !1271)
!1271 = !DILexicalBlockFile(scope: !1265, file: !1, discriminator: 5)
!1272 = !DILocation(line: 116, column: 2, scope: !1273)
!1273 = !DILexicalBlockFile(scope: !1260, file: !1, discriminator: 3)
!1274 = !DILocation(line: 117, column: 2, scope: !1239)
!1275 = distinct !{!1275, !1274}
!1276 = !DILocalVariable(name: "err", scope: !1277, file: !1, line: 117, type: !3)
!1277 = distinct !DILexicalBlock(scope: !1239, file: !1, line: 117, column: 2)
!1278 = !DILocation(line: 117, column: 2, scope: !1277)
!1279 = !DILocation(line: 117, column: 2, scope: !1280)
!1280 = !DILexicalBlockFile(scope: !1277, file: !1, discriminator: 1)
!1281 = !DILocation(line: 117, column: 2, scope: !1282)
!1282 = !DILexicalBlockFile(scope: !1283, file: !1, discriminator: 2)
!1283 = distinct !DILexicalBlock(scope: !1284, file: !1, line: 117, column: 2)
!1284 = distinct !DILexicalBlock(scope: !1277, file: !1, line: 117, column: 2)
!1285 = !DILocation(line: 117, column: 2, scope: !1286)
!1286 = !DILexicalBlockFile(scope: !1282, file: !1, discriminator: 4)
!1287 = !DILocation(line: 117, column: 2, scope: !1288)
!1288 = !DILexicalBlockFile(scope: !1282, file: !1, discriminator: 5)
!1289 = !DILocation(line: 117, column: 2, scope: !1290)
!1290 = !DILexicalBlockFile(scope: !1277, file: !1, discriminator: 3)
!1291 = !DILocation(line: 118, column: 2, scope: !1239)
!1292 = distinct !{!1292, !1291}
!1293 = !DILocalVariable(name: "err", scope: !1294, file: !1, line: 118, type: !3)
!1294 = distinct !DILexicalBlock(scope: !1239, file: !1, line: 118, column: 2)
!1295 = !DILocation(line: 118, column: 2, scope: !1294)
!1296 = !DILocation(line: 118, column: 2, scope: !1297)
!1297 = !DILexicalBlockFile(scope: !1294, file: !1, discriminator: 1)
!1298 = !DILocation(line: 118, column: 2, scope: !1299)
!1299 = !DILexicalBlockFile(scope: !1300, file: !1, discriminator: 2)
!1300 = distinct !DILexicalBlock(scope: !1301, file: !1, line: 118, column: 2)
!1301 = distinct !DILexicalBlock(scope: !1294, file: !1, line: 118, column: 2)
!1302 = !DILocation(line: 118, column: 2, scope: !1303)
!1303 = !DILexicalBlockFile(scope: !1299, file: !1, discriminator: 4)
!1304 = !DILocation(line: 118, column: 2, scope: !1305)
!1305 = !DILexicalBlockFile(scope: !1299, file: !1, discriminator: 5)
!1306 = !DILocation(line: 118, column: 2, scope: !1307)
!1307 = !DILexicalBlockFile(scope: !1294, file: !1, discriminator: 3)
!1308 = !DILocation(line: 119, column: 1, scope: !1239)
!1309 = distinct !DISubprogram(name: "freeHostMem", linkageName: "_Z11freeHostMemv", scope: !1, file: !1, line: 124, type: !390, isLocal: false, isDefinition: true, scopeLine: 125, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !1100)
!1310 = !DILocation(line: 126, column: 7, scope: !1309)
!1311 = !DILocation(line: 126, column: 2, scope: !1309)
!1312 = !DILocation(line: 127, column: 1, scope: !1309)
!1313 = distinct !DISubprogram(name: "pgain", linkageName: "_Z5pgainlP6PointsfPliPbPiS2_bPdS4_S4_S4_S4_S4_", scope: !1, file: !1, line: 132, type: !1314, isLocal: false, isDefinition: true, scopeLine: 134, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !1100)
!1314 = !DISubroutineType(types: !1315)
!1315 = !{!97, !136, !1316, !97, !1323, !99, !126, !124, !126, !113, !365, !365, !365, !365, !365, !365}
!1316 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1317, size: 64, align: 64)
!1317 = !DIDerivedType(tag: DW_TAG_typedef, name: "Points", file: !130, line: 51, baseType: !1318)
!1318 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !130, line: 47, size: 192, align: 64, elements: !1319, identifier: "_ZTS6Points")
!1319 = !{!1320, !1321, !1322}
!1320 = !DIDerivedType(tag: DW_TAG_member, name: "num", scope: !1318, file: !130, line: 48, baseType: !136, size: 64, align: 64)
!1321 = !DIDerivedType(tag: DW_TAG_member, name: "dim", scope: !1318, file: !130, line: 49, baseType: !99, size: 32, align: 32, offset: 64)
!1322 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !1318, file: !130, line: 50, baseType: !128, size: 64, align: 64, offset: 128)
!1323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64, align: 64)
!1324 = !DILocalVariable(name: "x", arg: 1, scope: !1313, file: !1, line: 132, type: !136)
!1325 = !DILocation(line: 132, column: 19, scope: !1313)
!1326 = !DILocalVariable(name: "points", arg: 2, scope: !1313, file: !1, line: 132, type: !1316)
!1327 = !DILocation(line: 132, column: 30, scope: !1313)
!1328 = !DILocalVariable(name: "z", arg: 3, scope: !1313, file: !1, line: 132, type: !97)
!1329 = !DILocation(line: 132, column: 44, scope: !1313)
!1330 = !DILocalVariable(name: "numcenters", arg: 4, scope: !1313, file: !1, line: 132, type: !1323)
!1331 = !DILocation(line: 132, column: 57, scope: !1313)
!1332 = !DILocalVariable(name: "kmax", arg: 5, scope: !1313, file: !1, line: 132, type: !99)
!1333 = !DILocation(line: 132, column: 73, scope: !1313)
!1334 = !DILocalVariable(name: "is_center", arg: 6, scope: !1313, file: !1, line: 132, type: !126)
!1335 = !DILocation(line: 132, column: 85, scope: !1313)
!1336 = !DILocalVariable(name: "center_table", arg: 7, scope: !1313, file: !1, line: 132, type: !124)
!1337 = !DILocation(line: 132, column: 101, scope: !1313)
!1338 = !DILocalVariable(name: "switch_membership", arg: 8, scope: !1313, file: !1, line: 132, type: !126)
!1339 = !DILocation(line: 132, column: 121, scope: !1313)
!1340 = !DILocalVariable(name: "isCoordChanged", arg: 9, scope: !1313, file: !1, line: 132, type: !113)
!1341 = !DILocation(line: 132, column: 145, scope: !1313)
!1342 = !DILocalVariable(name: "serial_t", arg: 10, scope: !1313, file: !1, line: 133, type: !365)
!1343 = !DILocation(line: 133, column: 16, scope: !1313)
!1344 = !DILocalVariable(name: "cpu_to_gpu_t", arg: 11, scope: !1313, file: !1, line: 133, type: !365)
!1345 = !DILocation(line: 133, column: 34, scope: !1313)
!1346 = !DILocalVariable(name: "gpu_to_cpu_t", arg: 12, scope: !1313, file: !1, line: 133, type: !365)
!1347 = !DILocation(line: 133, column: 56, scope: !1313)
!1348 = !DILocalVariable(name: "alloc_t", arg: 13, scope: !1313, file: !1, line: 133, type: !365)
!1349 = !DILocation(line: 133, column: 78, scope: !1313)
!1350 = !DILocalVariable(name: "kernel_t", arg: 14, scope: !1313, file: !1, line: 133, type: !365)
!1351 = !DILocation(line: 133, column: 95, scope: !1313)
!1352 = !DILocalVariable(name: "free_t", arg: 15, scope: !1313, file: !1, line: 133, type: !365)
!1353 = !DILocation(line: 133, column: 113, scope: !1313)
!1354 = !DILocalVariable(name: "tmp_t", scope: !1313, file: !1, line: 136, type: !97)
!1355 = !DILocation(line: 136, column: 8, scope: !1313)
!1356 = !DILocalVariable(name: "start", scope: !1313, file: !1, line: 137, type: !1357)
!1357 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaEvent_t", file: !4, line: 1430, baseType: !1358)
!1358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1359, size: 64, align: 64)
!1359 = !DICompositeType(tag: DW_TAG_structure_type, name: "CUevent_st", file: !1360, line: 223, flags: DIFlagFwdDecl, identifier: "_ZTS10CUevent_st")
!1360 = !DIFile(filename: "/usr/local/cuda/include/cuda.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!1361 = !DILocation(line: 137, column: 14, scope: !1313)
!1362 = !DILocalVariable(name: "stop", scope: !1313, file: !1, line: 137, type: !1357)
!1363 = !DILocation(line: 137, column: 21, scope: !1313)
!1364 = !DILocation(line: 138, column: 2, scope: !1313)
!1365 = !DILocation(line: 139, column: 2, scope: !1313)
!1366 = !DILocation(line: 141, column: 18, scope: !1313)
!1367 = !DILocation(line: 141, column: 2, scope: !1313)
!1368 = !DILocalVariable(name: "error", scope: !1313, file: !1, line: 144, type: !1369)
!1369 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !4, line: 1420, baseType: !3)
!1370 = !DILocation(line: 144, column: 14, scope: !1313)
!1371 = !DILocalVariable(name: "stride", scope: !1313, file: !1, line: 146, type: !99)
!1372 = !DILocation(line: 146, column: 6, scope: !1313)
!1373 = !DILocation(line: 146, column: 16, scope: !1313)
!1374 = !DILocation(line: 146, column: 15, scope: !1313)
!1375 = !DILocation(line: 146, column: 27, scope: !1313)
!1376 = !DILocalVariable(name: "K", scope: !1313, file: !1, line: 147, type: !99)
!1377 = !DILocation(line: 147, column: 6, scope: !1313)
!1378 = !DILocation(line: 147, column: 12, scope: !1313)
!1379 = !DILocation(line: 147, column: 11, scope: !1313)
!1380 = !DILocalVariable(name: "num", scope: !1313, file: !1, line: 148, type: !99)
!1381 = !DILocation(line: 148, column: 6, scope: !1313)
!1382 = !DILocation(line: 148, column: 14, scope: !1313)
!1383 = !DILocation(line: 148, column: 22, scope: !1313)
!1384 = !DILocalVariable(name: "dim", scope: !1313, file: !1, line: 149, type: !99)
!1385 = !DILocation(line: 149, column: 6, scope: !1313)
!1386 = !DILocation(line: 149, column: 14, scope: !1313)
!1387 = !DILocation(line: 149, column: 22, scope: !1313)
!1388 = !DILocalVariable(name: "nThread", scope: !1313, file: !1, line: 150, type: !99)
!1389 = !DILocation(line: 150, column: 6, scope: !1313)
!1390 = !DILocation(line: 150, column: 17, scope: !1313)
!1391 = !DILocation(line: 155, column: 31, scope: !1313)
!1392 = !DILocation(line: 155, column: 41, scope: !1313)
!1393 = !DILocation(line: 155, column: 49, scope: !1313)
!1394 = !DILocation(line: 155, column: 38, scope: !1313)
!1395 = !DILocation(line: 155, column: 54, scope: !1313)
!1396 = !DILocation(line: 155, column: 24, scope: !1313)
!1397 = !DILocation(line: 155, column: 15, scope: !1313)
!1398 = !DILocation(line: 155, column: 13, scope: !1313)
!1399 = !DILocation(line: 157, column: 5, scope: !1400)
!1400 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 157, column: 5)
!1401 = !DILocation(line: 157, column: 10, scope: !1400)
!1402 = !DILocation(line: 157, column: 5, scope: !1313)
!1403 = !DILocation(line: 159, column: 16, scope: !1404)
!1404 = distinct !DILexicalBlock(scope: !1400, file: !1, line: 158, column: 2)
!1405 = !DILocation(line: 159, column: 21, scope: !1404)
!1406 = !DILocation(line: 159, column: 3, scope: !1404)
!1407 = !DILocation(line: 160, column: 2, scope: !1404)
!1408 = !DILocalVariable(name: "count", scope: !1313, file: !1, line: 163, type: !99)
!1409 = !DILocation(line: 163, column: 6, scope: !1313)
!1410 = !DILocalVariable(name: "i", scope: !1411, file: !1, line: 164, type: !99)
!1411 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 164, column: 2)
!1412 = !DILocation(line: 164, column: 11, scope: !1411)
!1413 = !DILocation(line: 164, column: 7, scope: !1411)
!1414 = !DILocation(line: 164, column: 16, scope: !1415)
!1415 = !DILexicalBlockFile(scope: !1416, file: !1, discriminator: 1)
!1416 = distinct !DILexicalBlock(scope: !1411, file: !1, line: 164, column: 2)
!1417 = !DILocation(line: 164, column: 18, scope: !1415)
!1418 = !DILocation(line: 164, column: 17, scope: !1415)
!1419 = !DILocation(line: 164, column: 2, scope: !1415)
!1420 = !DILocation(line: 166, column: 17, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1422, file: !1, line: 166, column: 7)
!1422 = distinct !DILexicalBlock(scope: !1416, file: !1, line: 165, column: 2)
!1423 = !DILocation(line: 166, column: 7, scope: !1421)
!1424 = !DILocation(line: 166, column: 7, scope: !1422)
!1425 = !DILocation(line: 168, column: 27, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1421, file: !1, line: 167, column: 3)
!1427 = !DILocation(line: 168, column: 17, scope: !1426)
!1428 = !DILocation(line: 168, column: 4, scope: !1426)
!1429 = !DILocation(line: 168, column: 20, scope: !1426)
!1430 = !DILocation(line: 169, column: 3, scope: !1426)
!1431 = !DILocation(line: 170, column: 2, scope: !1422)
!1432 = !DILocation(line: 164, column: 24, scope: !1433)
!1433 = !DILexicalBlockFile(scope: !1416, file: !1, discriminator: 2)
!1434 = !DILocation(line: 164, column: 2, scope: !1433)
!1435 = distinct !{!1435, !1436}
!1436 = !DILocation(line: 164, column: 2, scope: !1313)
!1437 = !DILocation(line: 174, column: 5, scope: !1438)
!1438 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 174, column: 5)
!1439 = !DILocation(line: 174, column: 20, scope: !1438)
!1440 = !DILocation(line: 174, column: 23, scope: !1441)
!1441 = !DILexicalBlockFile(scope: !1438, file: !1, discriminator: 1)
!1442 = !DILocation(line: 174, column: 28, scope: !1441)
!1443 = !DILocation(line: 174, column: 5, scope: !1441)
!1444 = !DILocalVariable(name: "i", scope: !1445, file: !1, line: 176, type: !99)
!1445 = distinct !DILexicalBlock(scope: !1446, file: !1, line: 176, column: 3)
!1446 = distinct !DILexicalBlock(scope: !1438, file: !1, line: 175, column: 2)
!1447 = !DILocation(line: 176, column: 11, scope: !1445)
!1448 = !DILocation(line: 176, column: 7, scope: !1445)
!1449 = !DILocation(line: 176, column: 16, scope: !1450)
!1450 = !DILexicalBlockFile(scope: !1451, file: !1, discriminator: 1)
!1451 = distinct !DILexicalBlock(scope: !1445, file: !1, line: 176, column: 3)
!1452 = !DILocation(line: 176, column: 18, scope: !1450)
!1453 = !DILocation(line: 176, column: 17, scope: !1450)
!1454 = !DILocation(line: 176, column: 3, scope: !1450)
!1455 = !DILocalVariable(name: "j", scope: !1456, file: !1, line: 178, type: !99)
!1456 = distinct !DILexicalBlock(scope: !1457, file: !1, line: 178, column: 4)
!1457 = distinct !DILexicalBlock(scope: !1451, file: !1, line: 177, column: 3)
!1458 = !DILocation(line: 178, column: 12, scope: !1456)
!1459 = !DILocation(line: 178, column: 8, scope: !1456)
!1460 = !DILocation(line: 178, column: 17, scope: !1461)
!1461 = !DILexicalBlockFile(scope: !1462, file: !1, discriminator: 1)
!1462 = distinct !DILexicalBlock(scope: !1456, file: !1, line: 178, column: 4)
!1463 = !DILocation(line: 178, column: 19, scope: !1461)
!1464 = !DILocation(line: 178, column: 18, scope: !1461)
!1465 = !DILocation(line: 178, column: 4, scope: !1461)
!1466 = !DILocation(line: 180, column: 47, scope: !1467)
!1467 = distinct !DILexicalBlock(scope: !1462, file: !1, line: 179, column: 4)
!1468 = !DILocation(line: 180, column: 28, scope: !1467)
!1469 = !DILocation(line: 180, column: 38, scope: !1467)
!1470 = !DILocation(line: 180, column: 36, scope: !1467)
!1471 = !DILocation(line: 180, column: 41, scope: !1467)
!1472 = !DILocation(line: 180, column: 15, scope: !1467)
!1473 = !DILocation(line: 180, column: 19, scope: !1467)
!1474 = !DILocation(line: 180, column: 18, scope: !1467)
!1475 = !DILocation(line: 180, column: 22, scope: !1467)
!1476 = !DILocation(line: 180, column: 21, scope: !1467)
!1477 = !DILocation(line: 180, column: 5, scope: !1467)
!1478 = !DILocation(line: 180, column: 26, scope: !1467)
!1479 = !DILocation(line: 181, column: 4, scope: !1467)
!1480 = !DILocation(line: 178, column: 25, scope: !1481)
!1481 = !DILexicalBlockFile(scope: !1462, file: !1, discriminator: 2)
!1482 = !DILocation(line: 178, column: 4, scope: !1481)
!1483 = distinct !{!1483, !1484}
!1484 = !DILocation(line: 178, column: 4, scope: !1457)
!1485 = !DILocation(line: 182, column: 3, scope: !1457)
!1486 = !DILocation(line: 176, column: 24, scope: !1487)
!1487 = !DILexicalBlockFile(scope: !1451, file: !1, discriminator: 2)
!1488 = !DILocation(line: 176, column: 3, scope: !1487)
!1489 = distinct !{!1489, !1490}
!1490 = !DILocation(line: 176, column: 3, scope: !1446)
!1491 = !DILocation(line: 183, column: 2, scope: !1446)
!1492 = !DILocation(line: 186, column: 18, scope: !1313)
!1493 = !DILocation(line: 186, column: 2, scope: !1313)
!1494 = !DILocation(line: 187, column: 23, scope: !1313)
!1495 = !DILocation(line: 187, column: 2, scope: !1313)
!1496 = !DILocation(line: 188, column: 31, scope: !1313)
!1497 = !DILocation(line: 188, column: 38, scope: !1313)
!1498 = !DILocation(line: 188, column: 2, scope: !1313)
!1499 = !DILocation(line: 189, column: 24, scope: !1313)
!1500 = !DILocation(line: 189, column: 3, scope: !1313)
!1501 = !DILocation(line: 189, column: 12, scope: !1313)
!1502 = !DILocation(line: 191, column: 18, scope: !1313)
!1503 = !DILocation(line: 191, column: 2, scope: !1313)
!1504 = !DILocation(line: 197, column: 2, scope: !1313)
!1505 = distinct !{!1505, !1504}
!1506 = !DILocalVariable(name: "err", scope: !1507, file: !1, line: 197, type: !3)
!1507 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 197, column: 2)
!1508 = !DILocation(line: 197, column: 2, scope: !1507)
!1509 = !DILocation(line: 197, column: 2, scope: !1510)
!1510 = !DILexicalBlockFile(scope: !1507, file: !1, discriminator: 1)
!1511 = !DILocation(line: 197, column: 2, scope: !1512)
!1512 = !DILexicalBlockFile(scope: !1513, file: !1, discriminator: 2)
!1513 = distinct !DILexicalBlock(scope: !1514, file: !1, line: 197, column: 2)
!1514 = distinct !DILexicalBlock(scope: !1507, file: !1, line: 197, column: 2)
!1515 = !DILocation(line: 197, column: 2, scope: !1516)
!1516 = !DILexicalBlockFile(scope: !1512, file: !1, discriminator: 4)
!1517 = !DILocation(line: 197, column: 2, scope: !1518)
!1518 = !DILexicalBlockFile(scope: !1512, file: !1, discriminator: 5)
!1519 = !DILocation(line: 197, column: 2, scope: !1520)
!1520 = !DILexicalBlockFile(scope: !1507, file: !1, discriminator: 3)
!1521 = !DILocation(line: 199, column: 6, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 199, column: 6)
!1523 = !DILocation(line: 199, column: 11, scope: !1522)
!1524 = !DILocation(line: 199, column: 6, scope: !1313)
!1525 = !DILocation(line: 201, column: 15, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1522, file: !1, line: 200, column: 2)
!1527 = !DILocation(line: 201, column: 20, scope: !1526)
!1528 = !DILocation(line: 201, column: 3, scope: !1526)
!1529 = !DILocation(line: 202, column: 2, scope: !1526)
!1530 = !DILocation(line: 205, column: 18, scope: !1313)
!1531 = !DILocation(line: 205, column: 2, scope: !1313)
!1532 = !DILocation(line: 206, column: 23, scope: !1313)
!1533 = !DILocation(line: 206, column: 2, scope: !1313)
!1534 = !DILocation(line: 207, column: 31, scope: !1313)
!1535 = !DILocation(line: 207, column: 38, scope: !1313)
!1536 = !DILocation(line: 207, column: 2, scope: !1313)
!1537 = !DILocation(line: 208, column: 23, scope: !1313)
!1538 = !DILocation(line: 208, column: 3, scope: !1313)
!1539 = !DILocation(line: 208, column: 11, scope: !1313)
!1540 = !DILocation(line: 210, column: 18, scope: !1313)
!1541 = !DILocation(line: 210, column: 2, scope: !1313)
!1542 = !DILocation(line: 217, column: 5, scope: !1543)
!1543 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 217, column: 5)
!1544 = !DILocation(line: 217, column: 20, scope: !1543)
!1545 = !DILocation(line: 217, column: 23, scope: !1546)
!1546 = !DILexicalBlockFile(scope: !1543, file: !1, discriminator: 1)
!1547 = !DILocation(line: 217, column: 28, scope: !1546)
!1548 = !DILocation(line: 217, column: 5, scope: !1546)
!1549 = !DILocation(line: 219, column: 3, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1543, file: !1, line: 218, column: 2)
!1551 = distinct !{!1551, !1549}
!1552 = !DILocalVariable(name: "err", scope: !1553, file: !1, line: 219, type: !3)
!1553 = distinct !DILexicalBlock(scope: !1550, file: !1, line: 219, column: 3)
!1554 = !DILocation(line: 219, column: 3, scope: !1553)
!1555 = !DILocation(line: 219, column: 3, scope: !1556)
!1556 = !DILexicalBlockFile(scope: !1553, file: !1, discriminator: 1)
!1557 = !DILocation(line: 219, column: 3, scope: !1558)
!1558 = !DILexicalBlockFile(scope: !1559, file: !1, discriminator: 2)
!1559 = distinct !DILexicalBlock(scope: !1560, file: !1, line: 219, column: 3)
!1560 = distinct !DILexicalBlock(scope: !1553, file: !1, line: 219, column: 3)
!1561 = !DILocation(line: 219, column: 3, scope: !1562)
!1562 = !DILexicalBlockFile(scope: !1558, file: !1, discriminator: 4)
!1563 = !DILocation(line: 219, column: 3, scope: !1564)
!1564 = !DILexicalBlockFile(scope: !1558, file: !1, discriminator: 5)
!1565 = !DILocation(line: 219, column: 3, scope: !1566)
!1566 = !DILexicalBlockFile(scope: !1553, file: !1, discriminator: 3)
!1567 = !DILocation(line: 220, column: 2, scope: !1550)
!1568 = !DILocation(line: 221, column: 2, scope: !1313)
!1569 = distinct !{!1569, !1568}
!1570 = !DILocalVariable(name: "err", scope: !1571, file: !1, line: 221, type: !3)
!1571 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 221, column: 2)
!1572 = !DILocation(line: 221, column: 2, scope: !1571)
!1573 = !DILocation(line: 221, column: 2, scope: !1574)
!1574 = !DILexicalBlockFile(scope: !1571, file: !1, discriminator: 1)
!1575 = !DILocation(line: 221, column: 2, scope: !1576)
!1576 = !DILexicalBlockFile(scope: !1577, file: !1, discriminator: 2)
!1577 = distinct !DILexicalBlock(scope: !1578, file: !1, line: 221, column: 2)
!1578 = distinct !DILexicalBlock(scope: !1571, file: !1, line: 221, column: 2)
!1579 = !DILocation(line: 221, column: 2, scope: !1580)
!1580 = !DILexicalBlockFile(scope: !1576, file: !1, discriminator: 4)
!1581 = !DILocation(line: 221, column: 2, scope: !1582)
!1582 = !DILexicalBlockFile(scope: !1576, file: !1, discriminator: 5)
!1583 = !DILocation(line: 221, column: 2, scope: !1584)
!1584 = !DILexicalBlockFile(scope: !1571, file: !1, discriminator: 3)
!1585 = !DILocation(line: 222, column: 2, scope: !1313)
!1586 = distinct !{!1586, !1585}
!1587 = !DILocalVariable(name: "err", scope: !1588, file: !1, line: 222, type: !3)
!1588 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 222, column: 2)
!1589 = !DILocation(line: 222, column: 2, scope: !1588)
!1590 = !DILocation(line: 222, column: 2, scope: !1591)
!1591 = !DILexicalBlockFile(scope: !1588, file: !1, discriminator: 1)
!1592 = !DILocation(line: 222, column: 2, scope: !1593)
!1593 = !DILexicalBlockFile(scope: !1594, file: !1, discriminator: 2)
!1594 = distinct !DILexicalBlock(scope: !1595, file: !1, line: 222, column: 2)
!1595 = distinct !DILexicalBlock(scope: !1588, file: !1, line: 222, column: 2)
!1596 = !DILocation(line: 222, column: 2, scope: !1597)
!1597 = !DILexicalBlockFile(scope: !1593, file: !1, discriminator: 4)
!1598 = !DILocation(line: 222, column: 2, scope: !1599)
!1599 = !DILexicalBlockFile(scope: !1593, file: !1, discriminator: 5)
!1600 = !DILocation(line: 222, column: 2, scope: !1601)
!1601 = !DILexicalBlockFile(scope: !1588, file: !1, discriminator: 3)
!1602 = !DILocation(line: 224, column: 2, scope: !1313)
!1603 = distinct !{!1603, !1602}
!1604 = !DILocalVariable(name: "err", scope: !1605, file: !1, line: 224, type: !3)
!1605 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 224, column: 2)
!1606 = !DILocation(line: 224, column: 2, scope: !1605)
!1607 = !DILocation(line: 224, column: 2, scope: !1608)
!1608 = !DILexicalBlockFile(scope: !1605, file: !1, discriminator: 1)
!1609 = !DILocation(line: 224, column: 2, scope: !1610)
!1610 = !DILexicalBlockFile(scope: !1611, file: !1, discriminator: 2)
!1611 = distinct !DILexicalBlock(scope: !1612, file: !1, line: 224, column: 2)
!1612 = distinct !DILexicalBlock(scope: !1605, file: !1, line: 224, column: 2)
!1613 = !DILocation(line: 224, column: 2, scope: !1614)
!1614 = !DILexicalBlockFile(scope: !1610, file: !1, discriminator: 4)
!1615 = !DILocation(line: 224, column: 2, scope: !1616)
!1616 = !DILexicalBlockFile(scope: !1610, file: !1, discriminator: 5)
!1617 = !DILocation(line: 224, column: 2, scope: !1618)
!1618 = !DILexicalBlockFile(scope: !1605, file: !1, discriminator: 3)
!1619 = !DILocation(line: 225, column: 2, scope: !1313)
!1620 = distinct !{!1620, !1619}
!1621 = !DILocalVariable(name: "err", scope: !1622, file: !1, line: 225, type: !3)
!1622 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 225, column: 2)
!1623 = !DILocation(line: 225, column: 2, scope: !1622)
!1624 = !DILocation(line: 225, column: 2, scope: !1625)
!1625 = !DILexicalBlockFile(scope: !1622, file: !1, discriminator: 1)
!1626 = !DILocation(line: 225, column: 2, scope: !1627)
!1627 = !DILexicalBlockFile(scope: !1628, file: !1, discriminator: 2)
!1628 = distinct !DILexicalBlock(scope: !1629, file: !1, line: 225, column: 2)
!1629 = distinct !DILexicalBlock(scope: !1622, file: !1, line: 225, column: 2)
!1630 = !DILocation(line: 225, column: 2, scope: !1631)
!1631 = !DILexicalBlockFile(scope: !1627, file: !1, discriminator: 4)
!1632 = !DILocation(line: 225, column: 2, scope: !1633)
!1633 = !DILexicalBlockFile(scope: !1627, file: !1, discriminator: 5)
!1634 = !DILocation(line: 225, column: 2, scope: !1635)
!1635 = !DILexicalBlockFile(scope: !1622, file: !1, discriminator: 3)
!1636 = !DILocation(line: 228, column: 18, scope: !1313)
!1637 = !DILocation(line: 228, column: 2, scope: !1313)
!1638 = !DILocation(line: 229, column: 23, scope: !1313)
!1639 = !DILocation(line: 229, column: 2, scope: !1313)
!1640 = !DILocation(line: 230, column: 31, scope: !1313)
!1641 = !DILocation(line: 230, column: 38, scope: !1313)
!1642 = !DILocation(line: 230, column: 2, scope: !1313)
!1643 = !DILocation(line: 231, column: 28, scope: !1313)
!1644 = !DILocation(line: 231, column: 3, scope: !1313)
!1645 = !DILocation(line: 231, column: 16, scope: !1313)
!1646 = !DILocation(line: 233, column: 18, scope: !1313)
!1647 = !DILocation(line: 233, column: 2, scope: !1313)
!1648 = !DILocalVariable(name: "num_blocks", scope: !1313, file: !1, line: 240, type: !99)
!1649 = !DILocation(line: 240, column: 6, scope: !1313)
!1650 = !DILocation(line: 240, column: 37, scope: !1313)
!1651 = !DILocation(line: 240, column: 41, scope: !1313)
!1652 = !DILocation(line: 240, column: 61, scope: !1313)
!1653 = !DILocation(line: 240, column: 36, scope: !1313)
!1654 = !DILocation(line: 240, column: 66, scope: !1313)
!1655 = !DILocation(line: 240, column: 27, scope: !1313)
!1656 = !DILocalVariable(name: "num_blocks_y", scope: !1313, file: !1, line: 241, type: !99)
!1657 = !DILocation(line: 241, column: 6, scope: !1313)
!1658 = !DILocation(line: 241, column: 37, scope: !1313)
!1659 = !DILocation(line: 241, column: 48, scope: !1313)
!1660 = !DILocation(line: 241, column: 60, scope: !1313)
!1661 = !DILocation(line: 241, column: 36, scope: !1313)
!1662 = !DILocation(line: 241, column: 66, scope: !1313)
!1663 = !DILocation(line: 241, column: 27, scope: !1313)
!1664 = !DILocalVariable(name: "num_blocks_x", scope: !1313, file: !1, line: 242, type: !99)
!1665 = !DILocation(line: 242, column: 6, scope: !1313)
!1666 = !DILocation(line: 242, column: 37, scope: !1313)
!1667 = !DILocation(line: 242, column: 48, scope: !1313)
!1668 = !DILocation(line: 242, column: 47, scope: !1313)
!1669 = !DILocation(line: 242, column: 61, scope: !1313)
!1670 = !DILocation(line: 242, column: 36, scope: !1313)
!1671 = !DILocation(line: 242, column: 76, scope: !1313)
!1672 = !DILocation(line: 242, column: 66, scope: !1313)
!1673 = !DILocation(line: 242, column: 27, scope: !1313)
!1674 = !DILocalVariable(name: "grid_size", scope: !1313, file: !1, line: 243, type: !1675)
!1675 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1676, line: 427, baseType: !1677)
!1676 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/streamcluster")
!1677 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1676, line: 417, size: 96, align: 32, elements: !1678, identifier: "_ZTS4dim3")
!1678 = !{!1679, !1680, !1681, !1682, !1686, !1695}
!1679 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1677, file: !1676, line: 419, baseType: !487, size: 32, align: 32)
!1680 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1677, file: !1676, line: 419, baseType: !487, size: 32, align: 32, offset: 32)
!1681 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1677, file: !1676, line: 419, baseType: !487, size: 32, align: 32, offset: 64)
!1682 = !DISubprogram(name: "dim3", scope: !1677, file: !1676, line: 421, type: !1683, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!1683 = !DISubroutineType(types: !1684)
!1684 = !{null, !1685, !487, !487, !487}
!1685 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1677, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1686 = !DISubprogram(name: "dim3", scope: !1677, file: !1676, line: 422, type: !1687, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!1687 = !DISubroutineType(types: !1688)
!1688 = !{null, !1685, !1689}
!1689 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1676, line: 383, baseType: !1690)
!1690 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1676, line: 190, size: 96, align: 32, elements: !1691, identifier: "_ZTS5uint3")
!1691 = !{!1692, !1693, !1694}
!1692 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1690, file: !1676, line: 192, baseType: !487, size: 32, align: 32)
!1693 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1690, file: !1676, line: 192, baseType: !487, size: 32, align: 32, offset: 32)
!1694 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1690, file: !1676, line: 192, baseType: !487, size: 32, align: 32, offset: 64)
!1695 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1677, file: !1676, line: 423, type: !1696, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!1696 = !DISubroutineType(types: !1697)
!1697 = !{!1689, !1685}
!1698 = !DILocation(line: 243, column: 7, scope: !1313)
!1699 = !DILocation(line: 243, column: 17, scope: !1313)
!1700 = !DILocation(line: 243, column: 31, scope: !1313)
!1701 = !DILocation(line: 245, column: 24, scope: !1313)
!1702 = !DILocation(line: 245, column: 35, scope: !1703)
!1703 = !DILexicalBlockFile(scope: !1313, file: !1, discriminator: 2)
!1704 = !DILocation(line: 245, column: 21, scope: !1313)
!1705 = !DILocation(line: 245, column: 21, scope: !1706)
!1706 = !DILexicalBlockFile(scope: !1313, file: !1, discriminator: 3)
!1707 = !DILocation(line: 245, column: 21, scope: !1708)
!1708 = !DILexicalBlockFile(scope: !1313, file: !1, discriminator: 4)
!1709 = !DILocation(line: 245, column: 21, scope: !1710)
!1710 = !DILexicalBlockFile(scope: !1313, file: !1, discriminator: 5)
!1711 = !DILocation(line: 245, column: 2, scope: !1313)
!1712 = !DILocation(line: 246, column: 16, scope: !1313)
!1713 = !DILocation(line: 247, column: 16, scope: !1313)
!1714 = !DILocation(line: 248, column: 16, scope: !1313)
!1715 = !DILocation(line: 249, column: 16, scope: !1313)
!1716 = !DILocation(line: 250, column: 16, scope: !1313)
!1717 = !DILocation(line: 251, column: 16, scope: !1313)
!1718 = !DILocation(line: 252, column: 16, scope: !1313)
!1719 = !DILocation(line: 253, column: 16, scope: !1313)
!1720 = !DILocation(line: 254, column: 16, scope: !1313)
!1721 = !DILocation(line: 255, column: 16, scope: !1313)
!1722 = !DILocation(line: 245, column: 2, scope: !1723)
!1723 = !DILexicalBlockFile(scope: !1313, file: !1, discriminator: 1)
!1724 = !DILocation(line: 257, column: 2, scope: !1313)
!1725 = !DILocation(line: 260, column: 10, scope: !1313)
!1726 = !DILocation(line: 260, column: 8, scope: !1313)
!1727 = !DILocation(line: 261, column: 6, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 261, column: 6)
!1729 = !DILocation(line: 261, column: 12, scope: !1728)
!1730 = !DILocation(line: 261, column: 6, scope: !1313)
!1731 = !DILocation(line: 263, column: 51, scope: !1732)
!1732 = distinct !DILexicalBlock(scope: !1728, file: !1, line: 262, column: 2)
!1733 = !DILocation(line: 263, column: 32, scope: !1732)
!1734 = !DILocation(line: 263, column: 3, scope: !1735)
!1735 = !DILexicalBlockFile(scope: !1732, file: !1, discriminator: 1)
!1736 = !DILocation(line: 264, column: 3, scope: !1732)
!1737 = !DILocation(line: 268, column: 18, scope: !1313)
!1738 = !DILocation(line: 268, column: 2, scope: !1313)
!1739 = !DILocation(line: 269, column: 23, scope: !1313)
!1740 = !DILocation(line: 269, column: 2, scope: !1313)
!1741 = !DILocation(line: 270, column: 31, scope: !1313)
!1742 = !DILocation(line: 270, column: 38, scope: !1313)
!1743 = !DILocation(line: 270, column: 2, scope: !1313)
!1744 = !DILocation(line: 271, column: 24, scope: !1313)
!1745 = !DILocation(line: 271, column: 3, scope: !1313)
!1746 = !DILocation(line: 271, column: 12, scope: !1313)
!1747 = !DILocation(line: 273, column: 18, scope: !1313)
!1748 = !DILocation(line: 273, column: 2, scope: !1313)
!1749 = !DILocation(line: 279, column: 2, scope: !1313)
!1750 = distinct !{!1750, !1749}
!1751 = !DILocalVariable(name: "err", scope: !1752, file: !1, line: 279, type: !3)
!1752 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 279, column: 2)
!1753 = !DILocation(line: 279, column: 2, scope: !1752)
!1754 = !DILocation(line: 279, column: 2, scope: !1755)
!1755 = !DILexicalBlockFile(scope: !1752, file: !1, discriminator: 1)
!1756 = !DILocation(line: 279, column: 2, scope: !1757)
!1757 = !DILexicalBlockFile(scope: !1758, file: !1, discriminator: 2)
!1758 = distinct !DILexicalBlock(scope: !1759, file: !1, line: 279, column: 2)
!1759 = distinct !DILexicalBlock(scope: !1752, file: !1, line: 279, column: 2)
!1760 = !DILocation(line: 279, column: 2, scope: !1761)
!1761 = !DILexicalBlockFile(scope: !1757, file: !1, discriminator: 4)
!1762 = !DILocation(line: 279, column: 2, scope: !1763)
!1763 = !DILexicalBlockFile(scope: !1757, file: !1, discriminator: 5)
!1764 = !DILocation(line: 279, column: 2, scope: !1765)
!1765 = !DILexicalBlockFile(scope: !1752, file: !1, discriminator: 3)
!1766 = !DILocation(line: 280, column: 2, scope: !1313)
!1767 = distinct !{!1767, !1766}
!1768 = !DILocalVariable(name: "err", scope: !1769, file: !1, line: 280, type: !3)
!1769 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 280, column: 2)
!1770 = !DILocation(line: 280, column: 2, scope: !1769)
!1771 = !DILocation(line: 280, column: 2, scope: !1772)
!1772 = !DILexicalBlockFile(scope: !1769, file: !1, discriminator: 1)
!1773 = !DILocation(line: 280, column: 2, scope: !1774)
!1774 = !DILexicalBlockFile(scope: !1775, file: !1, discriminator: 2)
!1775 = distinct !DILexicalBlock(scope: !1776, file: !1, line: 280, column: 2)
!1776 = distinct !DILexicalBlock(scope: !1769, file: !1, line: 280, column: 2)
!1777 = !DILocation(line: 280, column: 2, scope: !1778)
!1778 = !DILexicalBlockFile(scope: !1774, file: !1, discriminator: 4)
!1779 = !DILocation(line: 280, column: 2, scope: !1780)
!1780 = !DILexicalBlockFile(scope: !1774, file: !1, discriminator: 5)
!1781 = !DILocation(line: 280, column: 2, scope: !1782)
!1782 = !DILexicalBlockFile(scope: !1769, file: !1, discriminator: 3)
!1783 = !DILocation(line: 283, column: 18, scope: !1313)
!1784 = !DILocation(line: 283, column: 2, scope: !1313)
!1785 = !DILocation(line: 284, column: 23, scope: !1313)
!1786 = !DILocation(line: 284, column: 2, scope: !1313)
!1787 = !DILocation(line: 285, column: 31, scope: !1313)
!1788 = !DILocation(line: 285, column: 38, scope: !1313)
!1789 = !DILocation(line: 285, column: 2, scope: !1313)
!1790 = !DILocation(line: 286, column: 28, scope: !1313)
!1791 = !DILocation(line: 286, column: 3, scope: !1313)
!1792 = !DILocation(line: 286, column: 16, scope: !1313)
!1793 = !DILocation(line: 288, column: 18, scope: !1313)
!1794 = !DILocation(line: 288, column: 2, scope: !1313)
!1795 = !DILocalVariable(name: "number_of_centers_to_close", scope: !1313, file: !1, line: 294, type: !99)
!1796 = !DILocation(line: 294, column: 6, scope: !1313)
!1797 = !DILocalVariable(name: "gl_cost_of_opening_x", scope: !1313, file: !1, line: 295, type: !97)
!1798 = !DILocation(line: 295, column: 8, scope: !1313)
!1799 = !DILocation(line: 295, column: 31, scope: !1313)
!1800 = !DILocalVariable(name: "gl_lower", scope: !1313, file: !1, line: 296, type: !96)
!1801 = !DILocation(line: 296, column: 9, scope: !1313)
!1802 = !DILocation(line: 296, column: 32, scope: !1313)
!1803 = !DILocation(line: 296, column: 41, scope: !1313)
!1804 = !DILocation(line: 296, column: 39, scope: !1313)
!1805 = !DILocation(line: 296, column: 21, scope: !1313)
!1806 = !DILocalVariable(name: "i", scope: !1807, file: !1, line: 298, type: !99)
!1807 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 298, column: 2)
!1808 = !DILocation(line: 298, column: 10, scope: !1807)
!1809 = !DILocation(line: 298, column: 6, scope: !1807)
!1810 = !DILocation(line: 298, column: 15, scope: !1811)
!1811 = !DILexicalBlockFile(scope: !1812, file: !1, discriminator: 1)
!1812 = distinct !DILexicalBlock(scope: !1807, file: !1, line: 298, column: 2)
!1813 = !DILocation(line: 298, column: 19, scope: !1811)
!1814 = !DILocation(line: 298, column: 17, scope: !1811)
!1815 = !DILocation(line: 298, column: 2, scope: !1811)
!1816 = !DILocation(line: 300, column: 17, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1818, file: !1, line: 300, column: 7)
!1818 = distinct !DILexicalBlock(scope: !1812, file: !1, line: 299, column: 2)
!1819 = !DILocation(line: 300, column: 7, scope: !1817)
!1820 = !DILocation(line: 300, column: 7, scope: !1818)
!1821 = !DILocalVariable(name: "low", scope: !1822, file: !1, line: 302, type: !97)
!1822 = distinct !DILexicalBlock(scope: !1817, file: !1, line: 301, column: 3)
!1823 = !DILocation(line: 302, column: 10, scope: !1822)
!1824 = !DILocation(line: 302, column: 16, scope: !1822)
!1825 = !DILocalVariable(name: "j", scope: !1826, file: !1, line: 303, type: !99)
!1826 = distinct !DILexicalBlock(scope: !1822, file: !1, line: 303, column: 7)
!1827 = !DILocation(line: 303, column: 16, scope: !1826)
!1828 = !DILocation(line: 303, column: 12, scope: !1826)
!1829 = !DILocation(line: 303, column: 23, scope: !1830)
!1830 = !DILexicalBlockFile(scope: !1831, file: !1, discriminator: 1)
!1831 = distinct !DILexicalBlock(scope: !1826, file: !1, line: 303, column: 7)
!1832 = !DILocation(line: 303, column: 27, scope: !1830)
!1833 = !DILocation(line: 303, column: 25, scope: !1830)
!1834 = !DILocation(line: 303, column: 7, scope: !1830)
!1835 = !DILocation(line: 305, column: 24, scope: !1836)
!1836 = distinct !DILexicalBlock(scope: !1831, file: !1, line: 304, column: 4)
!1837 = !DILocation(line: 305, column: 26, scope: !1836)
!1838 = !DILocation(line: 305, column: 25, scope: !1836)
!1839 = !DILocation(line: 305, column: 48, scope: !1836)
!1840 = !DILocation(line: 305, column: 35, scope: !1836)
!1841 = !DILocation(line: 305, column: 33, scope: !1836)
!1842 = !DILocation(line: 305, column: 12, scope: !1836)
!1843 = !DILocation(line: 305, column: 9, scope: !1836)
!1844 = !DILocation(line: 306, column: 4, scope: !1836)
!1845 = !DILocation(line: 303, column: 33, scope: !1846)
!1846 = !DILexicalBlockFile(scope: !1831, file: !1, discriminator: 2)
!1847 = !DILocation(line: 303, column: 7, scope: !1846)
!1848 = distinct !{!1848, !1849}
!1849 = !DILocation(line: 303, column: 7, scope: !1822)
!1850 = !DILocation(line: 308, column: 35, scope: !1822)
!1851 = !DILocation(line: 308, column: 29, scope: !1822)
!1852 = !DILocation(line: 308, column: 16, scope: !1822)
!1853 = !DILocation(line: 308, column: 7, scope: !1822)
!1854 = !DILocation(line: 308, column: 33, scope: !1822)
!1855 = !DILocation(line: 310, column: 12, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1822, file: !1, line: 310, column: 12)
!1857 = !DILocation(line: 310, column: 16, scope: !1856)
!1858 = !DILocation(line: 310, column: 12, scope: !1822)
!1859 = !DILocation(line: 312, column: 5, scope: !1860)
!1860 = distinct !DILexicalBlock(scope: !1856, file: !1, line: 311, column: 4)
!1861 = !DILocation(line: 313, column: 31, scope: !1860)
!1862 = !DILocation(line: 313, column: 16, scope: !1860)
!1863 = !DILocation(line: 313, column: 18, scope: !1860)
!1864 = !DILocation(line: 313, column: 17, scope: !1860)
!1865 = !DILocation(line: 313, column: 25, scope: !1860)
!1866 = !DILocation(line: 313, column: 24, scope: !1860)
!1867 = !DILocation(line: 313, column: 5, scope: !1860)
!1868 = !DILocation(line: 313, column: 28, scope: !1860)
!1869 = !DILocation(line: 314, column: 7, scope: !1860)
!1870 = !DILocation(line: 315, column: 3, scope: !1822)
!1871 = !DILocation(line: 316, column: 38, scope: !1818)
!1872 = !DILocation(line: 316, column: 40, scope: !1818)
!1873 = !DILocation(line: 316, column: 39, scope: !1818)
!1874 = !DILocation(line: 316, column: 47, scope: !1818)
!1875 = !DILocation(line: 316, column: 46, scope: !1818)
!1876 = !DILocation(line: 316, column: 27, scope: !1818)
!1877 = !DILocation(line: 316, column: 24, scope: !1818)
!1878 = !DILocation(line: 317, column: 2, scope: !1818)
!1879 = !DILocation(line: 298, column: 25, scope: !1880)
!1880 = !DILexicalBlockFile(scope: !1812, file: !1, discriminator: 2)
!1881 = !DILocation(line: 298, column: 2, scope: !1880)
!1882 = distinct !{!1882, !1883}
!1883 = !DILocation(line: 298, column: 2, scope: !1313)
!1884 = !DILocation(line: 320, column: 7, scope: !1885)
!1885 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 320, column: 7)
!1886 = !DILocation(line: 320, column: 28, scope: !1885)
!1887 = !DILocation(line: 320, column: 7, scope: !1313)
!1888 = !DILocalVariable(name: "i", scope: !1889, file: !1, line: 322, type: !99)
!1889 = distinct !DILexicalBlock(scope: !1890, file: !1, line: 322, column: 3)
!1890 = distinct !DILexicalBlock(scope: !1885, file: !1, line: 321, column: 2)
!1891 = !DILocation(line: 322, column: 11, scope: !1889)
!1892 = !DILocation(line: 322, column: 7, scope: !1889)
!1893 = !DILocation(line: 322, column: 18, scope: !1894)
!1894 = !DILexicalBlockFile(scope: !1895, file: !1, discriminator: 1)
!1895 = distinct !DILexicalBlock(scope: !1889, file: !1, line: 322, column: 3)
!1896 = !DILocation(line: 322, column: 22, scope: !1894)
!1897 = !DILocation(line: 322, column: 20, scope: !1894)
!1898 = !DILocation(line: 322, column: 3, scope: !1894)
!1899 = !DILocalVariable(name: "close_center", scope: !1900, file: !1, line: 324, type: !113)
!1900 = distinct !DILexicalBlock(scope: !1895, file: !1, line: 323, column: 3)
!1901 = !DILocation(line: 324, column: 9, scope: !1900)
!1902 = !DILocation(line: 324, column: 56, scope: !1900)
!1903 = !DILocation(line: 324, column: 46, scope: !1900)
!1904 = !DILocation(line: 324, column: 54, scope: !1900)
!1905 = !DILocation(line: 324, column: 59, scope: !1900)
!1906 = !DILocation(line: 324, column: 33, scope: !1900)
!1907 = !DILocation(line: 324, column: 24, scope: !1900)
!1908 = !DILocation(line: 324, column: 68, scope: !1900)
!1909 = !DILocation(line: 325, column: 27, scope: !1910)
!1910 = distinct !DILexicalBlock(scope: !1900, file: !1, line: 325, column: 9)
!1911 = !DILocation(line: 325, column: 9, scope: !1910)
!1912 = !DILocation(line: 325, column: 30, scope: !1910)
!1913 = !DILocation(line: 325, column: 33, scope: !1914)
!1914 = !DILexicalBlockFile(scope: !1910, file: !1, discriminator: 1)
!1915 = !DILocation(line: 325, column: 9, scope: !1914)
!1916 = !DILocation(line: 327, column: 40, scope: !1917)
!1917 = distinct !DILexicalBlock(scope: !1910, file: !1, line: 326, column: 4)
!1918 = !DILocation(line: 327, column: 30, scope: !1917)
!1919 = !DILocation(line: 327, column: 38, scope: !1917)
!1920 = !DILocation(line: 327, column: 54, scope: !1917)
!1921 = !DILocation(line: 327, column: 44, scope: !1917)
!1922 = !DILocation(line: 327, column: 52, scope: !1917)
!1923 = !DILocation(line: 327, column: 44, scope: !1924)
!1924 = !DILexicalBlockFile(scope: !1917, file: !1, discriminator: 1)
!1925 = !DILocation(line: 327, column: 58, scope: !1917)
!1926 = !DILocation(line: 327, column: 25, scope: !1927)
!1927 = !DILexicalBlockFile(scope: !1917, file: !1, discriminator: 2)
!1928 = !DILocation(line: 327, column: 75, scope: !1917)
!1929 = !DILocation(line: 327, column: 65, scope: !1917)
!1930 = !DILocation(line: 327, column: 73, scope: !1917)
!1931 = !DILocation(line: 327, column: 78, scope: !1917)
!1932 = !DILocation(line: 327, column: 63, scope: !1917)
!1933 = !DILocation(line: 327, column: 15, scope: !1917)
!1934 = !DILocation(line: 327, column: 5, scope: !1917)
!1935 = !DILocation(line: 327, column: 13, scope: !1917)
!1936 = !DILocation(line: 327, column: 18, scope: !1917)
!1937 = !DILocation(line: 327, column: 23, scope: !1917)
!1938 = !DILocation(line: 328, column: 27, scope: !1917)
!1939 = !DILocation(line: 328, column: 15, scope: !1917)
!1940 = !DILocation(line: 328, column: 5, scope: !1917)
!1941 = !DILocation(line: 328, column: 13, scope: !1917)
!1942 = !DILocation(line: 328, column: 18, scope: !1917)
!1943 = !DILocation(line: 328, column: 25, scope: !1917)
!1944 = !DILocation(line: 329, column: 4, scope: !1917)
!1945 = !DILocation(line: 330, column: 3, scope: !1900)
!1946 = !DILocation(line: 322, column: 28, scope: !1947)
!1947 = !DILexicalBlockFile(scope: !1895, file: !1, discriminator: 2)
!1948 = !DILocation(line: 322, column: 3, scope: !1947)
!1949 = distinct !{!1949, !1950}
!1950 = !DILocation(line: 322, column: 3, scope: !1890)
!1951 = !DILocalVariable(name: "i", scope: !1952, file: !1, line: 332, type: !99)
!1952 = distinct !DILexicalBlock(scope: !1890, file: !1, line: 332, column: 3)
!1953 = !DILocation(line: 332, column: 11, scope: !1952)
!1954 = !DILocation(line: 332, column: 7, scope: !1952)
!1955 = !DILocation(line: 332, column: 18, scope: !1956)
!1956 = !DILexicalBlockFile(scope: !1957, file: !1, discriminator: 1)
!1957 = distinct !DILexicalBlock(scope: !1952, file: !1, line: 332, column: 3)
!1958 = !DILocation(line: 332, column: 22, scope: !1956)
!1959 = !DILocation(line: 332, column: 20, scope: !1956)
!1960 = !DILocation(line: 332, column: 3, scope: !1956)
!1961 = !DILocation(line: 334, column: 18, scope: !1962)
!1962 = distinct !DILexicalBlock(scope: !1963, file: !1, line: 334, column: 8)
!1963 = distinct !DILexicalBlock(scope: !1957, file: !1, line: 333, column: 3)
!1964 = !DILocation(line: 334, column: 8, scope: !1962)
!1965 = !DILocation(line: 334, column: 21, scope: !1962)
!1966 = !DILocation(line: 334, column: 46, scope: !1967)
!1967 = !DILexicalBlockFile(scope: !1962, file: !1, discriminator: 1)
!1968 = !DILocation(line: 334, column: 33, scope: !1967)
!1969 = !DILocation(line: 334, column: 24, scope: !1967)
!1970 = !DILocation(line: 334, column: 50, scope: !1967)
!1971 = !DILocation(line: 334, column: 8, scope: !1967)
!1972 = !DILocation(line: 336, column: 15, scope: !1973)
!1973 = distinct !DILexicalBlock(scope: !1962, file: !1, line: 335, column: 4)
!1974 = !DILocation(line: 336, column: 5, scope: !1973)
!1975 = !DILocation(line: 336, column: 18, scope: !1973)
!1976 = !DILocation(line: 337, column: 4, scope: !1973)
!1977 = !DILocation(line: 338, column: 3, scope: !1963)
!1978 = !DILocation(line: 332, column: 28, scope: !1979)
!1979 = !DILexicalBlockFile(scope: !1957, file: !1, discriminator: 2)
!1980 = !DILocation(line: 332, column: 3, scope: !1979)
!1981 = distinct !{!1981, !1982}
!1982 = !DILocation(line: 332, column: 3, scope: !1890)
!1983 = !DILocation(line: 340, column: 7, scope: !1984)
!1984 = distinct !DILexicalBlock(scope: !1890, file: !1, line: 340, column: 7)
!1985 = !DILocation(line: 340, column: 9, scope: !1984)
!1986 = !DILocation(line: 340, column: 14, scope: !1984)
!1987 = !DILocation(line: 340, column: 17, scope: !1988)
!1988 = !DILexicalBlockFile(scope: !1984, file: !1, discriminator: 1)
!1989 = !DILocation(line: 340, column: 21, scope: !1988)
!1990 = !DILocation(line: 340, column: 19, scope: !1988)
!1991 = !DILocation(line: 340, column: 7, scope: !1988)
!1992 = !DILocation(line: 342, column: 14, scope: !1993)
!1993 = distinct !DILexicalBlock(scope: !1984, file: !1, line: 341, column: 3)
!1994 = !DILocation(line: 342, column: 4, scope: !1993)
!1995 = !DILocation(line: 342, column: 17, scope: !1993)
!1996 = !DILocation(line: 343, column: 3, scope: !1993)
!1997 = !DILocation(line: 344, column: 18, scope: !1890)
!1998 = !DILocation(line: 344, column: 17, scope: !1890)
!1999 = !DILocation(line: 344, column: 29, scope: !1890)
!2000 = !DILocation(line: 344, column: 35, scope: !1890)
!2001 = !DILocation(line: 344, column: 33, scope: !1890)
!2002 = !DILocation(line: 344, column: 4, scope: !1890)
!2003 = !DILocation(line: 344, column: 15, scope: !1890)
!2004 = !DILocation(line: 345, column: 2, scope: !1890)
!2005 = !DILocation(line: 348, column: 24, scope: !2006)
!2006 = distinct !DILexicalBlock(scope: !1885, file: !1, line: 347, column: 2)
!2007 = !DILocation(line: 354, column: 7, scope: !1313)
!2008 = !DILocation(line: 354, column: 2, scope: !1313)
!2009 = !DILocation(line: 358, column: 18, scope: !1313)
!2010 = !DILocation(line: 358, column: 2, scope: !1313)
!2011 = !DILocation(line: 359, column: 23, scope: !1313)
!2012 = !DILocation(line: 359, column: 2, scope: !1313)
!2013 = !DILocation(line: 360, column: 31, scope: !1313)
!2014 = !DILocation(line: 360, column: 38, scope: !1313)
!2015 = !DILocation(line: 360, column: 2, scope: !1313)
!2016 = !DILocation(line: 361, column: 24, scope: !1313)
!2017 = !DILocation(line: 361, column: 3, scope: !1313)
!2018 = !DILocation(line: 361, column: 12, scope: !1313)
!2019 = !DILocation(line: 363, column: 18, scope: !1313)
!2020 = !DILocation(line: 363, column: 2, scope: !1313)
!2021 = !DILocation(line: 369, column: 2, scope: !1313)
!2022 = distinct !{!2022, !2021}
!2023 = !DILocalVariable(name: "err", scope: !2024, file: !1, line: 369, type: !3)
!2024 = distinct !DILexicalBlock(scope: !1313, file: !1, line: 369, column: 2)
!2025 = !DILocation(line: 369, column: 2, scope: !2024)
!2026 = !DILocation(line: 369, column: 2, scope: !2027)
!2027 = !DILexicalBlockFile(scope: !2024, file: !1, discriminator: 1)
!2028 = !DILocation(line: 369, column: 2, scope: !2029)
!2029 = !DILexicalBlockFile(scope: !2030, file: !1, discriminator: 2)
!2030 = distinct !DILexicalBlock(scope: !2031, file: !1, line: 369, column: 2)
!2031 = distinct !DILexicalBlock(scope: !2024, file: !1, line: 369, column: 2)
!2032 = !DILocation(line: 369, column: 2, scope: !2033)
!2033 = !DILexicalBlockFile(scope: !2029, file: !1, discriminator: 4)
!2034 = !DILocation(line: 369, column: 2, scope: !2035)
!2035 = !DILexicalBlockFile(scope: !2029, file: !1, discriminator: 5)
!2036 = !DILocation(line: 369, column: 2, scope: !2037)
!2037 = !DILexicalBlockFile(scope: !2024, file: !1, discriminator: 3)
!2038 = !DILocation(line: 373, column: 18, scope: !1313)
!2039 = !DILocation(line: 373, column: 2, scope: !1313)
!2040 = !DILocation(line: 374, column: 23, scope: !1313)
!2041 = !DILocation(line: 374, column: 2, scope: !1313)
!2042 = !DILocation(line: 375, column: 31, scope: !1313)
!2043 = !DILocation(line: 375, column: 38, scope: !1313)
!2044 = !DILocation(line: 375, column: 2, scope: !1313)
!2045 = !DILocation(line: 376, column: 22, scope: !1313)
!2046 = !DILocation(line: 376, column: 3, scope: !1313)
!2047 = !DILocation(line: 376, column: 10, scope: !1313)
!2048 = !DILocation(line: 378, column: 6, scope: !1313)
!2049 = !DILocation(line: 379, column: 10, scope: !1313)
!2050 = !DILocation(line: 379, column: 9, scope: !1313)
!2051 = !DILocation(line: 379, column: 2, scope: !1313)
!2052 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1677, file: !1676, line: 421, type: !1683, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !1682, variables: !1100)
!2053 = !DILocalVariable(name: "this", arg: 1, scope: !2052, type: !2054, flags: DIFlagArtificial | DIFlagObjectPointer)
!2054 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1677, size: 64, align: 64)
!2055 = !DILocation(line: 0, scope: !2052)
!2056 = !DILocalVariable(name: "vx", arg: 2, scope: !2052, file: !1676, line: 421, type: !487)
!2057 = !DILocation(line: 421, column: 43, scope: !2052)
!2058 = !DILocalVariable(name: "vy", arg: 3, scope: !2052, file: !1676, line: 421, type: !487)
!2059 = !DILocation(line: 421, column: 64, scope: !2052)
!2060 = !DILocalVariable(name: "vz", arg: 4, scope: !2052, file: !1676, line: 421, type: !487)
!2061 = !DILocation(line: 421, column: 85, scope: !2052)
!2062 = !DILocation(line: 421, column: 95, scope: !2052)
!2063 = !DILocation(line: 421, column: 97, scope: !2052)
!2064 = !DILocation(line: 421, column: 102, scope: !2052)
!2065 = !DILocation(line: 421, column: 104, scope: !2052)
!2066 = !DILocation(line: 421, column: 109, scope: !2052)
!2067 = !DILocation(line: 421, column: 111, scope: !2052)
!2068 = !DILocation(line: 421, column: 116, scope: !2052)
!2069 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_streamcluster_cuda.cu", scope: !1, file: !1, type: !2070, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !0, variables: !1100)
!2070 = !DISubroutineType(types: !1100)
!2071 = !DILocation(line: 0, scope: !2069)
