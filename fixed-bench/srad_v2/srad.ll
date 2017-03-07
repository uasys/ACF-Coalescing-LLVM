; ModuleID = 'srad.cu'
source_filename = "srad.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [67 x i8] c"Usage: %s <rows> <cols> <y1> <y2> <x1> <x2> <lamda> <no. of iter>\0A\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"\09<rows>   - number of rows\0A\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"\09<cols>    - number of cols\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"\09<y1> \09 - y1 value of the speckle\0A\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"\09<y2>      - y2 value of the speckle\0A\00", align 1
@.str.5 = private unnamed_addr constant [39 x i8] c"\09<x1>       - x1 value of the speckle\0A\00", align 1
@.str.6 = private unnamed_addr constant [39 x i8] c"\09<x2>       - x2 value of the speckle\0A\00", align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"\09<lamda>   - lambda (0,1)\0A\00", align 1
@.str.8 = private unnamed_addr constant [41 x i8] c"\09<no. of iter>   - number of iterations\0A\00", align 1
@.str.9 = private unnamed_addr constant [29 x i8] c"WG size of kernel = %d X %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [39 x i8] c"rows and cols must be multiples of 16\0A\00", align 1
@.str.11 = private unnamed_addr constant [30 x i8] c"Randomizing the input matrix\0A\00", align 1
@.str.12 = private unnamed_addr constant [26 x i8] c"Start the SRAD main loop\0A\00", align 1
@.str.13 = private unnamed_addr constant [18 x i8] c"Computation Done\0A\00", align 1

; Function Attrs: uwtable
define void @_Z11srad_cuda_1PfS_S_S_S_S_iif(float* %E_C, float* %W_C, float* %N_C, float* %S_C, float* %J_cuda, float* %C_cuda, i32 %cols, i32 %rows, float %q0sqr) #0 !dbg !574 {
entry:
  %E_C.addr = alloca float*, align 8
  %W_C.addr = alloca float*, align 8
  %N_C.addr = alloca float*, align 8
  %S_C.addr = alloca float*, align 8
  %J_cuda.addr = alloca float*, align 8
  %C_cuda.addr = alloca float*, align 8
  %cols.addr = alloca i32, align 4
  %rows.addr = alloca i32, align 4
  %q0sqr.addr = alloca float, align 4
  store float* %E_C, float** %E_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %E_C.addr, metadata !579, metadata !580), !dbg !581
  store float* %W_C, float** %W_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %W_C.addr, metadata !582, metadata !580), !dbg !583
  store float* %N_C, float** %N_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %N_C.addr, metadata !584, metadata !580), !dbg !585
  store float* %S_C, float** %S_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %S_C.addr, metadata !586, metadata !580), !dbg !587
  store float* %J_cuda, float** %J_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %J_cuda.addr, metadata !588, metadata !580), !dbg !589
  store float* %C_cuda, float** %C_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C_cuda.addr, metadata !590, metadata !580), !dbg !591
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !592, metadata !580), !dbg !593
  store i32 %rows, i32* %rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rows.addr, metadata !594, metadata !580), !dbg !595
  store float %q0sqr, float* %q0sqr.addr, align 4
  call void @llvm.dbg.declare(metadata float* %q0sqr.addr, metadata !596, metadata !580), !dbg !597
  %0 = bitcast float** %E_C.addr to i8*, !dbg !598
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !598
  %2 = icmp eq i32 %1, 0, !dbg !598
  br i1 %2, label %setup.next, label %setup.end, !dbg !598

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %W_C.addr to i8*, !dbg !599
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !599
  %5 = icmp eq i32 %4, 0, !dbg !599
  br i1 %5, label %setup.next1, label %setup.end, !dbg !599

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %N_C.addr to i8*, !dbg !601
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !601
  %8 = icmp eq i32 %7, 0, !dbg !601
  br i1 %8, label %setup.next2, label %setup.end, !dbg !601

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float** %S_C.addr to i8*, !dbg !603
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !603
  %11 = icmp eq i32 %10, 0, !dbg !603
  br i1 %11, label %setup.next3, label %setup.end, !dbg !603

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast float** %J_cuda.addr to i8*, !dbg !605
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !605
  %14 = icmp eq i32 %13, 0, !dbg !605
  br i1 %14, label %setup.next4, label %setup.end, !dbg !605

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast float** %C_cuda.addr to i8*, !dbg !607
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !607
  %17 = icmp eq i32 %16, 0, !dbg !607
  br i1 %17, label %setup.next5, label %setup.end, !dbg !607

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i32* %cols.addr to i8*, !dbg !609
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 4, i64 48), !dbg !609
  %20 = icmp eq i32 %19, 0, !dbg !609
  br i1 %20, label %setup.next6, label %setup.end, !dbg !609

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32* %rows.addr to i8*, !dbg !611
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 4, i64 52), !dbg !611
  %23 = icmp eq i32 %22, 0, !dbg !611
  br i1 %23, label %setup.next7, label %setup.end, !dbg !611

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast float* %q0sqr.addr to i8*, !dbg !613
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 4, i64 56), !dbg !613
  %26 = icmp eq i32 %25, 0, !dbg !613
  br i1 %26, label %setup.next8, label %setup.end, !dbg !613

setup.next8:                                      ; preds = %setup.next7
  %27 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*, float*, float*, float*, i32, i32, float)* @_Z11srad_cuda_1PfS_S_S_S_S_iif to i8*)), !dbg !615
  br label %setup.end, !dbg !615

setup.end:                                        ; preds = %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !617
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @_Z11srad_cuda_2PfS_S_S_S_S_iiff(float* %E_C, float* %W_C, float* %N_C, float* %S_C, float* %J_cuda, float* %C_cuda, i32 %cols, i32 %rows, float %lambda, float %q0sqr) #0 !dbg !618 {
entry:
  %E_C.addr = alloca float*, align 8
  %W_C.addr = alloca float*, align 8
  %N_C.addr = alloca float*, align 8
  %S_C.addr = alloca float*, align 8
  %J_cuda.addr = alloca float*, align 8
  %C_cuda.addr = alloca float*, align 8
  %cols.addr = alloca i32, align 4
  %rows.addr = alloca i32, align 4
  %lambda.addr = alloca float, align 4
  %q0sqr.addr = alloca float, align 4
  store float* %E_C, float** %E_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %E_C.addr, metadata !621, metadata !580), !dbg !622
  store float* %W_C, float** %W_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %W_C.addr, metadata !623, metadata !580), !dbg !624
  store float* %N_C, float** %N_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %N_C.addr, metadata !625, metadata !580), !dbg !626
  store float* %S_C, float** %S_C.addr, align 8
  call void @llvm.dbg.declare(metadata float** %S_C.addr, metadata !627, metadata !580), !dbg !628
  store float* %J_cuda, float** %J_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %J_cuda.addr, metadata !629, metadata !580), !dbg !630
  store float* %C_cuda, float** %C_cuda.addr, align 8
  call void @llvm.dbg.declare(metadata float** %C_cuda.addr, metadata !631, metadata !580), !dbg !632
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !633, metadata !580), !dbg !634
  store i32 %rows, i32* %rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rows.addr, metadata !635, metadata !580), !dbg !636
  store float %lambda, float* %lambda.addr, align 4
  call void @llvm.dbg.declare(metadata float* %lambda.addr, metadata !637, metadata !580), !dbg !638
  store float %q0sqr, float* %q0sqr.addr, align 4
  call void @llvm.dbg.declare(metadata float* %q0sqr.addr, metadata !639, metadata !580), !dbg !640
  %0 = bitcast float** %E_C.addr to i8*, !dbg !641
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !641
  %2 = icmp eq i32 %1, 0, !dbg !641
  br i1 %2, label %setup.next, label %setup.end, !dbg !641

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %W_C.addr to i8*, !dbg !642
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !642
  %5 = icmp eq i32 %4, 0, !dbg !642
  br i1 %5, label %setup.next1, label %setup.end, !dbg !642

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %N_C.addr to i8*, !dbg !644
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !644
  %8 = icmp eq i32 %7, 0, !dbg !644
  br i1 %8, label %setup.next2, label %setup.end, !dbg !644

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float** %S_C.addr to i8*, !dbg !646
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !646
  %11 = icmp eq i32 %10, 0, !dbg !646
  br i1 %11, label %setup.next3, label %setup.end, !dbg !646

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast float** %J_cuda.addr to i8*, !dbg !648
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !648
  %14 = icmp eq i32 %13, 0, !dbg !648
  br i1 %14, label %setup.next4, label %setup.end, !dbg !648

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast float** %C_cuda.addr to i8*, !dbg !650
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !650
  %17 = icmp eq i32 %16, 0, !dbg !650
  br i1 %17, label %setup.next5, label %setup.end, !dbg !650

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i32* %cols.addr to i8*, !dbg !652
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 4, i64 48), !dbg !652
  %20 = icmp eq i32 %19, 0, !dbg !652
  br i1 %20, label %setup.next6, label %setup.end, !dbg !652

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32* %rows.addr to i8*, !dbg !654
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 4, i64 52), !dbg !654
  %23 = icmp eq i32 %22, 0, !dbg !654
  br i1 %23, label %setup.next7, label %setup.end, !dbg !654

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast float* %lambda.addr to i8*, !dbg !656
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 4, i64 56), !dbg !656
  %26 = icmp eq i32 %25, 0, !dbg !656
  br i1 %26, label %setup.next8, label %setup.end, !dbg !656

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast float* %q0sqr.addr to i8*, !dbg !658
  %28 = call i32 @cudaSetupArgument(i8* %27, i64 4, i64 60), !dbg !658
  %29 = icmp eq i32 %28, 0, !dbg !658
  br i1 %29, label %setup.next9, label %setup.end, !dbg !658

setup.next9:                                      ; preds = %setup.next8
  %30 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*, float*, float*, float*, i32, i32, float, float)* @_Z11srad_cuda_2PfS_S_S_S_S_iiff to i8*)), !dbg !660
  br label %setup.end, !dbg !660

setup.end:                                        ; preds = %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !662
}

; Function Attrs: uwtable
define void @_Z5usageiPPc(i32 %argc, i8** %argv) #0 !dbg !663 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !666, metadata !580), !dbg !667
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !668, metadata !580), !dbg !669
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !670
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !671
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !671
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !671
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str, i32 0, i32 0), i8* %2), !dbg !672
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !673
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i32 0, i32 0)), !dbg !674
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !675
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i32 0, i32 0)), !dbg !676
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !677
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i32 0, i32 0)), !dbg !678
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !679
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0)), !dbg !680
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !681
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.5, i32 0, i32 0)), !dbg !682
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !683
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.6, i32 0, i32 0)), !dbg !684
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !685
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.7, i32 0, i32 0)), !dbg !686
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !687
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.8, i32 0, i32 0)), !dbg !688
  call void @exit(i32 1) #9, !dbg !689
  unreachable, !dbg !689

return:                                           ; No predecessors!
  ret void, !dbg !690
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #4 !dbg !691 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !694, metadata !580), !dbg !695
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !696, metadata !580), !dbg !697
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.9, i32 0, i32 0), i32 16, i32 16), !dbg !698
  %0 = load i32, i32* %argc.addr, align 4, !dbg !699
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !700
  call void @_Z7runTestiPPc(i32 %0, i8** %1), !dbg !701
  ret i32 0, !dbg !702
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: uwtable
define void @_Z7runTestiPPc(i32 %argc, i8** %argv) #0 !dbg !703 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %rows = alloca i32, align 4
  %cols = alloca i32, align 4
  %size_I = alloca i32, align 4
  %size_R = alloca i32, align 4
  %niter = alloca i32, align 4
  %iter = alloca i32, align 4
  %I = alloca float*, align 8
  %J = alloca float*, align 8
  %lambda = alloca float, align 4
  %q0sqr = alloca float, align 4
  %sum = alloca float, align 4
  %sum2 = alloca float, align 4
  %tmp = alloca float, align 4
  %meanROI = alloca float, align 4
  %varROI = alloca float, align 4
  %J_cuda = alloca float*, align 8
  %C_cuda = alloca float*, align 8
  %E_C = alloca float*, align 8
  %W_C = alloca float*, align 8
  %N_C = alloca float*, align 8
  %S_C = alloca float*, align 8
  %r1 = alloca i32, align 4
  %r2 = alloca i32, align 4
  %c1 = alloca i32, align 4
  %c2 = alloca i32, align 4
  %c = alloca float*, align 8
  %k = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %block_x = alloca i32, align 4
  %block_y = alloca i32, align 4
  %dimBlock = alloca %struct.dim3, align 4
  %dimGrid = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp114 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp114.coerce = alloca { i64, i32 }, align 4
  %agg.tmp116 = alloca %struct.dim3, align 4
  %agg.tmp117 = alloca %struct.dim3, align 4
  %agg.tmp116.coerce = alloca { i64, i32 }, align 4
  %agg.tmp117.coerce = alloca { i64, i32 }, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !704, metadata !580), !dbg !705
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !706, metadata !580), !dbg !707
  call void @llvm.dbg.declare(metadata i32* %rows, metadata !708, metadata !580), !dbg !709
  call void @llvm.dbg.declare(metadata i32* %cols, metadata !710, metadata !580), !dbg !711
  call void @llvm.dbg.declare(metadata i32* %size_I, metadata !712, metadata !580), !dbg !713
  call void @llvm.dbg.declare(metadata i32* %size_R, metadata !714, metadata !580), !dbg !715
  call void @llvm.dbg.declare(metadata i32* %niter, metadata !716, metadata !580), !dbg !717
  store i32 10, i32* %niter, align 4, !dbg !717
  call void @llvm.dbg.declare(metadata i32* %iter, metadata !718, metadata !580), !dbg !719
  call void @llvm.dbg.declare(metadata float** %I, metadata !720, metadata !580), !dbg !721
  call void @llvm.dbg.declare(metadata float** %J, metadata !722, metadata !580), !dbg !723
  call void @llvm.dbg.declare(metadata float* %lambda, metadata !724, metadata !580), !dbg !725
  call void @llvm.dbg.declare(metadata float* %q0sqr, metadata !726, metadata !580), !dbg !727
  call void @llvm.dbg.declare(metadata float* %sum, metadata !728, metadata !580), !dbg !729
  call void @llvm.dbg.declare(metadata float* %sum2, metadata !730, metadata !580), !dbg !731
  call void @llvm.dbg.declare(metadata float* %tmp, metadata !732, metadata !580), !dbg !733
  call void @llvm.dbg.declare(metadata float* %meanROI, metadata !734, metadata !580), !dbg !735
  call void @llvm.dbg.declare(metadata float* %varROI, metadata !736, metadata !580), !dbg !737
  call void @llvm.dbg.declare(metadata float** %J_cuda, metadata !738, metadata !580), !dbg !739
  call void @llvm.dbg.declare(metadata float** %C_cuda, metadata !740, metadata !580), !dbg !741
  call void @llvm.dbg.declare(metadata float** %E_C, metadata !742, metadata !580), !dbg !743
  call void @llvm.dbg.declare(metadata float** %W_C, metadata !744, metadata !580), !dbg !745
  call void @llvm.dbg.declare(metadata float** %N_C, metadata !746, metadata !580), !dbg !747
  call void @llvm.dbg.declare(metadata float** %S_C, metadata !748, metadata !580), !dbg !749
  call void @llvm.dbg.declare(metadata i32* %r1, metadata !750, metadata !580), !dbg !751
  call void @llvm.dbg.declare(metadata i32* %r2, metadata !752, metadata !580), !dbg !753
  call void @llvm.dbg.declare(metadata i32* %c1, metadata !754, metadata !580), !dbg !755
  call void @llvm.dbg.declare(metadata i32* %c2, metadata !756, metadata !580), !dbg !757
  call void @llvm.dbg.declare(metadata float** %c, metadata !758, metadata !580), !dbg !759
  %0 = load i32, i32* %argc.addr, align 4, !dbg !760
  %cmp = icmp eq i32 %0, 9, !dbg !762
  br i1 %cmp, label %if.then, label %if.else, !dbg !763

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !764
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !764
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !764
  %call = call i32 @atoi(i8* %2) #10, !dbg !766
  store i32 %call, i32* %rows, align 4, !dbg !767
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !768
  %arrayidx14 = getelementptr inbounds i8*, i8** %3, i64 2, !dbg !768
  %4 = load i8*, i8** %arrayidx14, align 8, !dbg !768
  %call15 = call i32 @atoi(i8* %4) #10, !dbg !769
  store i32 %call15, i32* %cols, align 4, !dbg !770
  %5 = load i32, i32* %rows, align 4, !dbg !771
  %rem = srem i32 %5, 16, !dbg !773
  %cmp16 = icmp ne i32 %rem, 0, !dbg !774
  br i1 %cmp16, label %if.then19, label %lor.lhs.false, !dbg !775

lor.lhs.false:                                    ; preds = %if.then
  %6 = load i32, i32* %cols, align 4, !dbg !776
  %rem17 = srem i32 %6, 16, !dbg !778
  %cmp18 = icmp ne i32 %rem17, 0, !dbg !779
  br i1 %cmp18, label %if.then19, label %if.end, !dbg !780

if.then19:                                        ; preds = %lor.lhs.false, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !781
  %call20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.10, i32 0, i32 0)), !dbg !783
  call void @exit(i32 1) #9, !dbg !784
  unreachable, !dbg !784

if.end:                                           ; preds = %lor.lhs.false
  %8 = load i8**, i8*** %argv.addr, align 8, !dbg !785
  %arrayidx21 = getelementptr inbounds i8*, i8** %8, i64 3, !dbg !785
  %9 = load i8*, i8** %arrayidx21, align 8, !dbg !785
  %call22 = call i32 @atoi(i8* %9) #10, !dbg !786
  store i32 %call22, i32* %r1, align 4, !dbg !787
  %10 = load i8**, i8*** %argv.addr, align 8, !dbg !788
  %arrayidx23 = getelementptr inbounds i8*, i8** %10, i64 4, !dbg !788
  %11 = load i8*, i8** %arrayidx23, align 8, !dbg !788
  %call24 = call i32 @atoi(i8* %11) #10, !dbg !789
  store i32 %call24, i32* %r2, align 4, !dbg !790
  %12 = load i8**, i8*** %argv.addr, align 8, !dbg !791
  %arrayidx25 = getelementptr inbounds i8*, i8** %12, i64 5, !dbg !791
  %13 = load i8*, i8** %arrayidx25, align 8, !dbg !791
  %call26 = call i32 @atoi(i8* %13) #10, !dbg !792
  store i32 %call26, i32* %c1, align 4, !dbg !793
  %14 = load i8**, i8*** %argv.addr, align 8, !dbg !794
  %arrayidx27 = getelementptr inbounds i8*, i8** %14, i64 6, !dbg !794
  %15 = load i8*, i8** %arrayidx27, align 8, !dbg !794
  %call28 = call i32 @atoi(i8* %15) #10, !dbg !795
  store i32 %call28, i32* %c2, align 4, !dbg !796
  %16 = load i8**, i8*** %argv.addr, align 8, !dbg !797
  %arrayidx29 = getelementptr inbounds i8*, i8** %16, i64 7, !dbg !797
  %17 = load i8*, i8** %arrayidx29, align 8, !dbg !797
  %call30 = call double @atof(i8* %17) #10, !dbg !798
  %conv = fptrunc double %call30 to float, !dbg !798
  store float %conv, float* %lambda, align 4, !dbg !799
  %18 = load i8**, i8*** %argv.addr, align 8, !dbg !800
  %arrayidx31 = getelementptr inbounds i8*, i8** %18, i64 8, !dbg !800
  %19 = load i8*, i8** %arrayidx31, align 8, !dbg !800
  %call32 = call i32 @atoi(i8* %19) #10, !dbg !801
  store i32 %call32, i32* %niter, align 4, !dbg !802
  br label %if.end33, !dbg !803

if.else:                                          ; preds = %entry
  %20 = load i32, i32* %argc.addr, align 4, !dbg !804
  %21 = load i8**, i8*** %argv.addr, align 8, !dbg !806
  call void @_Z5usageiPPc(i32 %20, i8** %21), !dbg !807
  br label %if.end33

if.end33:                                         ; preds = %if.else, %if.end
  %22 = load i32, i32* %cols, align 4, !dbg !808
  %23 = load i32, i32* %rows, align 4, !dbg !809
  %mul = mul nsw i32 %22, %23, !dbg !810
  store i32 %mul, i32* %size_I, align 4, !dbg !811
  %24 = load i32, i32* %r2, align 4, !dbg !812
  %25 = load i32, i32* %r1, align 4, !dbg !813
  %sub = sub i32 %24, %25, !dbg !814
  %add = add i32 %sub, 1, !dbg !815
  %26 = load i32, i32* %c2, align 4, !dbg !816
  %27 = load i32, i32* %c1, align 4, !dbg !817
  %sub34 = sub i32 %26, %27, !dbg !818
  %add35 = add i32 %sub34, 1, !dbg !819
  %mul36 = mul i32 %add, %add35, !dbg !820
  store i32 %mul36, i32* %size_R, align 4, !dbg !821
  %28 = load i32, i32* %size_I, align 4, !dbg !822
  %conv37 = sext i32 %28 to i64, !dbg !822
  %mul38 = mul i64 %conv37, 4, !dbg !823
  %call39 = call noalias i8* @malloc(i64 %mul38) #11, !dbg !824
  %29 = bitcast i8* %call39 to float*, !dbg !825
  store float* %29, float** %I, align 8, !dbg !826
  %30 = load i32, i32* %size_I, align 4, !dbg !827
  %conv40 = sext i32 %30 to i64, !dbg !827
  %mul41 = mul i64 %conv40, 4, !dbg !828
  %call42 = call noalias i8* @malloc(i64 %mul41) #11, !dbg !829
  %31 = bitcast i8* %call42 to float*, !dbg !830
  store float* %31, float** %J, align 8, !dbg !831
  %32 = load i32, i32* %size_I, align 4, !dbg !832
  %conv43 = sext i32 %32 to i64, !dbg !832
  %mul44 = mul i64 4, %conv43, !dbg !833
  %call45 = call noalias i8* @malloc(i64 %mul44) #11, !dbg !834
  %33 = bitcast i8* %call45 to float*, !dbg !835
  store float* %33, float** %c, align 8, !dbg !836
  %34 = bitcast float** %J_cuda to i8**, !dbg !837
  %35 = load i32, i32* %size_I, align 4, !dbg !838
  %conv46 = sext i32 %35 to i64, !dbg !838
  %mul47 = mul i64 4, %conv46, !dbg !839
  %call48 = call i32 @cudaMalloc(i8** %34, i64 %mul47), !dbg !840
  %36 = bitcast float** %C_cuda to i8**, !dbg !841
  %37 = load i32, i32* %size_I, align 4, !dbg !842
  %conv49 = sext i32 %37 to i64, !dbg !842
  %mul50 = mul i64 4, %conv49, !dbg !843
  %call51 = call i32 @cudaMalloc(i8** %36, i64 %mul50), !dbg !844
  %38 = bitcast float** %E_C to i8**, !dbg !845
  %39 = load i32, i32* %size_I, align 4, !dbg !846
  %conv52 = sext i32 %39 to i64, !dbg !846
  %mul53 = mul i64 4, %conv52, !dbg !847
  %call54 = call i32 @cudaMalloc(i8** %38, i64 %mul53), !dbg !848
  %40 = bitcast float** %W_C to i8**, !dbg !849
  %41 = load i32, i32* %size_I, align 4, !dbg !850
  %conv55 = sext i32 %41 to i64, !dbg !850
  %mul56 = mul i64 4, %conv55, !dbg !851
  %call57 = call i32 @cudaMalloc(i8** %40, i64 %mul56), !dbg !852
  %42 = bitcast float** %S_C to i8**, !dbg !853
  %43 = load i32, i32* %size_I, align 4, !dbg !854
  %conv58 = sext i32 %43 to i64, !dbg !854
  %mul59 = mul i64 4, %conv58, !dbg !855
  %call60 = call i32 @cudaMalloc(i8** %42, i64 %mul59), !dbg !856
  %44 = bitcast float** %N_C to i8**, !dbg !857
  %45 = load i32, i32* %size_I, align 4, !dbg !858
  %conv61 = sext i32 %45 to i64, !dbg !858
  %mul62 = mul i64 4, %conv61, !dbg !859
  %call63 = call i32 @cudaMalloc(i8** %44, i64 %mul62), !dbg !860
  %call64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i32 0, i32 0)), !dbg !861
  %46 = load float*, float** %I, align 8, !dbg !862
  %47 = load i32, i32* %rows, align 4, !dbg !863
  %48 = load i32, i32* %cols, align 4, !dbg !864
  call void @_Z13random_matrixPfii(float* %46, i32 %47, i32 %48), !dbg !865
  call void @llvm.dbg.declare(metadata i32* %k, metadata !866, metadata !580), !dbg !868
  store i32 0, i32* %k, align 4, !dbg !868
  br label %for.cond, !dbg !869

for.cond:                                         ; preds = %for.inc, %if.end33
  %49 = load i32, i32* %k, align 4, !dbg !870
  %50 = load i32, i32* %size_I, align 4, !dbg !873
  %cmp66 = icmp slt i32 %49, %50, !dbg !874
  br i1 %cmp66, label %for.body, label %for.end, !dbg !875

for.body:                                         ; preds = %for.cond
  %51 = load float*, float** %I, align 8, !dbg !876
  %52 = load i32, i32* %k, align 4, !dbg !878
  %idxprom = sext i32 %52 to i64, !dbg !876
  %arrayidx67 = getelementptr inbounds float, float* %51, i64 %idxprom, !dbg !876
  %53 = load float, float* %arrayidx67, align 4, !dbg !876
  %conv68 = fpext float %53 to double, !dbg !876
  %call69 = call double @exp(double %conv68) #11, !dbg !879
  %conv70 = fptrunc double %call69 to float, !dbg !879
  %54 = load float*, float** %J, align 8, !dbg !880
  %55 = load i32, i32* %k, align 4, !dbg !881
  %idxprom71 = sext i32 %55 to i64, !dbg !880
  %arrayidx72 = getelementptr inbounds float, float* %54, i64 %idxprom71, !dbg !880
  store float %conv70, float* %arrayidx72, align 4, !dbg !882
  br label %for.inc, !dbg !883

for.inc:                                          ; preds = %for.body
  %56 = load i32, i32* %k, align 4, !dbg !884
  %inc = add nsw i32 %56, 1, !dbg !884
  store i32 %inc, i32* %k, align 4, !dbg !884
  br label %for.cond, !dbg !886, !llvm.loop !887

for.end:                                          ; preds = %for.cond
  %call73 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.12, i32 0, i32 0)), !dbg !889
  store i32 0, i32* %iter, align 4, !dbg !890
  br label %for.cond74, !dbg !892

for.cond74:                                       ; preds = %for.inc125, %for.end
  %57 = load i32, i32* %iter, align 4, !dbg !893
  %58 = load i32, i32* %niter, align 4, !dbg !896
  %cmp75 = icmp slt i32 %57, %58, !dbg !897
  br i1 %cmp75, label %for.body76, label %for.end127, !dbg !898

for.body76:                                       ; preds = %for.cond74
  store float 0.000000e+00, float* %sum, align 4, !dbg !899
  store float 0.000000e+00, float* %sum2, align 4, !dbg !901
  call void @llvm.dbg.declare(metadata i32* %i, metadata !902, metadata !580), !dbg !904
  %59 = load i32, i32* %r1, align 4, !dbg !905
  store i32 %59, i32* %i, align 4, !dbg !904
  br label %for.cond78, !dbg !906

for.cond78:                                       ; preds = %for.inc95, %for.body76
  %60 = load i32, i32* %i, align 4, !dbg !907
  %61 = load i32, i32* %r2, align 4, !dbg !910
  %cmp79 = icmp ule i32 %60, %61, !dbg !911
  br i1 %cmp79, label %for.body80, label %for.end97, !dbg !912

for.body80:                                       ; preds = %for.cond78
  call void @llvm.dbg.declare(metadata i32* %j, metadata !913, metadata !580), !dbg !916
  %62 = load i32, i32* %c1, align 4, !dbg !917
  store i32 %62, i32* %j, align 4, !dbg !916
  br label %for.cond82, !dbg !918

for.cond82:                                       ; preds = %for.inc92, %for.body80
  %63 = load i32, i32* %j, align 4, !dbg !919
  %64 = load i32, i32* %c2, align 4, !dbg !922
  %cmp83 = icmp ule i32 %63, %64, !dbg !923
  br i1 %cmp83, label %for.body84, label %for.end94, !dbg !924

for.body84:                                       ; preds = %for.cond82
  %65 = load float*, float** %J, align 8, !dbg !925
  %66 = load i32, i32* %i, align 4, !dbg !927
  %67 = load i32, i32* %cols, align 4, !dbg !928
  %mul85 = mul nsw i32 %66, %67, !dbg !929
  %68 = load i32, i32* %j, align 4, !dbg !930
  %add86 = add nsw i32 %mul85, %68, !dbg !931
  %idxprom87 = sext i32 %add86 to i64, !dbg !925
  %arrayidx88 = getelementptr inbounds float, float* %65, i64 %idxprom87, !dbg !925
  %69 = load float, float* %arrayidx88, align 4, !dbg !925
  store float %69, float* %tmp, align 4, !dbg !932
  %70 = load float, float* %tmp, align 4, !dbg !933
  %71 = load float, float* %sum, align 4, !dbg !934
  %add89 = fadd float %71, %70, !dbg !934
  store float %add89, float* %sum, align 4, !dbg !934
  %72 = load float, float* %tmp, align 4, !dbg !935
  %73 = load float, float* %tmp, align 4, !dbg !936
  %mul90 = fmul float %72, %73, !dbg !937
  %74 = load float, float* %sum2, align 4, !dbg !938
  %add91 = fadd float %74, %mul90, !dbg !938
  store float %add91, float* %sum2, align 4, !dbg !938
  br label %for.inc92, !dbg !939

for.inc92:                                        ; preds = %for.body84
  %75 = load i32, i32* %j, align 4, !dbg !940
  %inc93 = add nsw i32 %75, 1, !dbg !940
  store i32 %inc93, i32* %j, align 4, !dbg !940
  br label %for.cond82, !dbg !942, !llvm.loop !943

for.end94:                                        ; preds = %for.cond82
  br label %for.inc95, !dbg !945

for.inc95:                                        ; preds = %for.end94
  %76 = load i32, i32* %i, align 4, !dbg !946
  %inc96 = add nsw i32 %76, 1, !dbg !946
  store i32 %inc96, i32* %i, align 4, !dbg !946
  br label %for.cond78, !dbg !948, !llvm.loop !949

for.end97:                                        ; preds = %for.cond78
  %77 = load float, float* %sum, align 4, !dbg !951
  %78 = load i32, i32* %size_R, align 4, !dbg !952
  %conv98 = sitofp i32 %78 to float, !dbg !952
  %div = fdiv float %77, %conv98, !dbg !953
  store float %div, float* %meanROI, align 4, !dbg !954
  %79 = load float, float* %sum2, align 4, !dbg !955
  %80 = load i32, i32* %size_R, align 4, !dbg !956
  %conv99 = sitofp i32 %80 to float, !dbg !956
  %div100 = fdiv float %79, %conv99, !dbg !957
  %81 = load float, float* %meanROI, align 4, !dbg !958
  %82 = load float, float* %meanROI, align 4, !dbg !959
  %mul101 = fmul float %81, %82, !dbg !960
  %sub102 = fsub float %div100, %mul101, !dbg !961
  store float %sub102, float* %varROI, align 4, !dbg !962
  %83 = load float, float* %varROI, align 4, !dbg !963
  %84 = load float, float* %meanROI, align 4, !dbg !964
  %85 = load float, float* %meanROI, align 4, !dbg !965
  %mul103 = fmul float %84, %85, !dbg !966
  %div104 = fdiv float %83, %mul103, !dbg !967
  store float %div104, float* %q0sqr, align 4, !dbg !968
  call void @llvm.dbg.declare(metadata i32* %block_x, metadata !969, metadata !580), !dbg !970
  %86 = load i32, i32* %cols, align 4, !dbg !971
  %div106 = sdiv i32 %86, 16, !dbg !972
  store i32 %div106, i32* %block_x, align 4, !dbg !970
  call void @llvm.dbg.declare(metadata i32* %block_y, metadata !973, metadata !580), !dbg !974
  %87 = load i32, i32* %rows, align 4, !dbg !975
  %div108 = sdiv i32 %87, 16, !dbg !976
  store i32 %div108, i32* %block_y, align 4, !dbg !974
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimBlock, metadata !977, metadata !580), !dbg !1001
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimBlock, i32 16, i32 16, i32 1), !dbg !1001
  call void @llvm.dbg.declare(metadata %struct.dim3* %dimGrid, metadata !1002, metadata !580), !dbg !1003
  %88 = load i32, i32* %block_x, align 4, !dbg !1004
  %89 = load i32, i32* %block_y, align 4, !dbg !1005
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %dimGrid, i32 %88, i32 %89, i32 1), !dbg !1003
  %90 = load float*, float** %J_cuda, align 8, !dbg !1006
  %91 = bitcast float* %90 to i8*, !dbg !1006
  %92 = load float*, float** %J, align 8, !dbg !1007
  %93 = bitcast float* %92 to i8*, !dbg !1007
  %94 = load i32, i32* %size_I, align 4, !dbg !1008
  %conv111 = sext i32 %94 to i64, !dbg !1008
  %mul112 = mul i64 4, %conv111, !dbg !1009
  %call113 = call i32 @cudaMemcpy(i8* %91, i8* %93, i64 %mul112, i32 1), !dbg !1010
  %95 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1011
  %96 = bitcast %struct.dim3* %dimGrid to i8*, !dbg !1011
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %95, i8* %96, i64 12, i32 4, i1 false), !dbg !1011
  %97 = bitcast %struct.dim3* %agg.tmp114 to i8*, !dbg !1012
  %98 = bitcast %struct.dim3* %dimBlock to i8*, !dbg !1012
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %97, i8* %98, i64 12, i32 4, i1 false), !dbg !1012
  %99 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1013
  %100 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1013
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %99, i8* %100, i64 12, i32 4, i1 false), !dbg !1013
  %101 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !1013
  %102 = load i64, i64* %101, align 4, !dbg !1013
  %103 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !1013
  %104 = load i32, i32* %103, align 4, !dbg !1013
  %105 = bitcast { i64, i32 }* %agg.tmp114.coerce to i8*, !dbg !1013
  %106 = bitcast %struct.dim3* %agg.tmp114 to i8*, !dbg !1013
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %105, i8* %106, i64 12, i32 4, i1 false), !dbg !1013
  %107 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp114.coerce, i32 0, i32 0, !dbg !1013
  %108 = load i64, i64* %107, align 4, !dbg !1013
  %109 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp114.coerce, i32 0, i32 1, !dbg !1013
  %110 = load i32, i32* %109, align 4, !dbg !1013
  %call115 = call i32 @cudaConfigureCall(i64 %102, i32 %104, i64 %108, i32 %110, i64 0, %struct.CUstream_st* null), !dbg !1013
  %tobool = icmp ne i32 %call115, 0, !dbg !1013
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !1014

kcall.configok:                                   ; preds = %for.end97
  %111 = load float*, float** %E_C, align 8, !dbg !1015
  %112 = load float*, float** %W_C, align 8, !dbg !1017
  %113 = load float*, float** %N_C, align 8, !dbg !1018
  %114 = load float*, float** %S_C, align 8, !dbg !1019
  %115 = load float*, float** %J_cuda, align 8, !dbg !1020
  %116 = load float*, float** %C_cuda, align 8, !dbg !1021
  %117 = load i32, i32* %cols, align 4, !dbg !1022
  %118 = load i32, i32* %rows, align 4, !dbg !1023
  %119 = load float, float* %q0sqr, align 4, !dbg !1024
  call void @_Z11srad_cuda_1PfS_S_S_S_S_iif(float* %111, float* %112, float* %113, float* %114, float* %115, float* %116, i32 %117, i32 %118, float %119), !dbg !1025
  br label %kcall.end, !dbg !1025

kcall.end:                                        ; preds = %kcall.configok, %for.end97
  %120 = bitcast %struct.dim3* %agg.tmp116 to i8*, !dbg !1026
  %121 = bitcast %struct.dim3* %dimGrid to i8*, !dbg !1026
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %120, i8* %121, i64 12, i32 4, i1 false), !dbg !1026
  %122 = bitcast %struct.dim3* %agg.tmp117 to i8*, !dbg !1027
  %123 = bitcast %struct.dim3* %dimBlock to i8*, !dbg !1027
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %122, i8* %123, i64 12, i32 4, i1 false), !dbg !1027
  %124 = bitcast { i64, i32 }* %agg.tmp116.coerce to i8*, !dbg !1028
  %125 = bitcast %struct.dim3* %agg.tmp116 to i8*, !dbg !1028
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %124, i8* %125, i64 12, i32 4, i1 false), !dbg !1028
  %126 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp116.coerce, i32 0, i32 0, !dbg !1028
  %127 = load i64, i64* %126, align 4, !dbg !1028
  %128 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp116.coerce, i32 0, i32 1, !dbg !1028
  %129 = load i32, i32* %128, align 4, !dbg !1028
  %130 = bitcast { i64, i32 }* %agg.tmp117.coerce to i8*, !dbg !1028
  %131 = bitcast %struct.dim3* %agg.tmp117 to i8*, !dbg !1028
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %130, i8* %131, i64 12, i32 4, i1 false), !dbg !1028
  %132 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp117.coerce, i32 0, i32 0, !dbg !1028
  %133 = load i64, i64* %132, align 4, !dbg !1028
  %134 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp117.coerce, i32 0, i32 1, !dbg !1028
  %135 = load i32, i32* %134, align 4, !dbg !1028
  %call118 = call i32 @cudaConfigureCall(i64 %127, i32 %129, i64 %133, i32 %135, i64 0, %struct.CUstream_st* null), !dbg !1028
  %tobool119 = icmp ne i32 %call118, 0, !dbg !1028
  br i1 %tobool119, label %kcall.end121, label %kcall.configok120, !dbg !1029

kcall.configok120:                                ; preds = %kcall.end
  %136 = load float*, float** %E_C, align 8, !dbg !1030
  %137 = load float*, float** %W_C, align 8, !dbg !1031
  %138 = load float*, float** %N_C, align 8, !dbg !1032
  %139 = load float*, float** %S_C, align 8, !dbg !1033
  %140 = load float*, float** %J_cuda, align 8, !dbg !1034
  %141 = load float*, float** %C_cuda, align 8, !dbg !1035
  %142 = load i32, i32* %cols, align 4, !dbg !1036
  %143 = load i32, i32* %rows, align 4, !dbg !1037
  %144 = load float, float* %lambda, align 4, !dbg !1038
  %145 = load float, float* %q0sqr, align 4, !dbg !1039
  call void @_Z11srad_cuda_2PfS_S_S_S_S_iiff(float* %136, float* %137, float* %138, float* %139, float* %140, float* %141, i32 %142, i32 %143, float %144, float %145), !dbg !1040
  br label %kcall.end121, !dbg !1040

kcall.end121:                                     ; preds = %kcall.configok120, %kcall.end
  %146 = load float*, float** %J, align 8, !dbg !1041
  %147 = bitcast float* %146 to i8*, !dbg !1041
  %148 = load float*, float** %J_cuda, align 8, !dbg !1042
  %149 = bitcast float* %148 to i8*, !dbg !1042
  %150 = load i32, i32* %size_I, align 4, !dbg !1043
  %conv122 = sext i32 %150 to i64, !dbg !1043
  %mul123 = mul i64 4, %conv122, !dbg !1044
  %call124 = call i32 @cudaMemcpy(i8* %147, i8* %149, i64 %mul123, i32 2), !dbg !1045
  br label %for.inc125, !dbg !1046

for.inc125:                                       ; preds = %kcall.end121
  %151 = load i32, i32* %iter, align 4, !dbg !1047
  %inc126 = add nsw i32 %151, 1, !dbg !1047
  store i32 %inc126, i32* %iter, align 4, !dbg !1047
  br label %for.cond74, !dbg !1049, !llvm.loop !1050

for.end127:                                       ; preds = %for.cond74
  %call128 = call i32 @cudaThreadSynchronize(), !dbg !1052
  %call129 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.13, i32 0, i32 0)), !dbg !1053
  %152 = load float*, float** %I, align 8, !dbg !1054
  %153 = bitcast float* %152 to i8*, !dbg !1054
  call void @free(i8* %153) #11, !dbg !1055
  %154 = load float*, float** %J, align 8, !dbg !1056
  %155 = bitcast float* %154 to i8*, !dbg !1056
  call void @free(i8* %155) #11, !dbg !1057
  %156 = load float*, float** %C_cuda, align 8, !dbg !1058
  %157 = bitcast float* %156 to i8*, !dbg !1058
  %call130 = call i32 @cudaFree(i8* %157), !dbg !1059
  %158 = load float*, float** %J_cuda, align 8, !dbg !1060
  %159 = bitcast float* %158 to i8*, !dbg !1060
  %call131 = call i32 @cudaFree(i8* %159), !dbg !1061
  %160 = load float*, float** %E_C, align 8, !dbg !1062
  %161 = bitcast float* %160 to i8*, !dbg !1062
  %call132 = call i32 @cudaFree(i8* %161), !dbg !1063
  %162 = load float*, float** %W_C, align 8, !dbg !1064
  %163 = bitcast float* %162 to i8*, !dbg !1064
  %call133 = call i32 @cudaFree(i8* %163), !dbg !1065
  %164 = load float*, float** %N_C, align 8, !dbg !1066
  %165 = bitcast float* %164 to i8*, !dbg !1066
  %call134 = call i32 @cudaFree(i8* %165), !dbg !1067
  %166 = load float*, float** %S_C, align 8, !dbg !1068
  %167 = bitcast float* %166 to i8*, !dbg !1068
  %call135 = call i32 @cudaFree(i8* %167), !dbg !1069
  %168 = load float*, float** %c, align 8, !dbg !1070
  %169 = bitcast float* %168 to i8*, !dbg !1070
  call void @free(i8* %169) #11, !dbg !1071
  ret void, !dbg !1072
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #5

; Function Attrs: nounwind readonly
declare double @atof(i8*) #5

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #6

declare i32 @cudaMalloc(i8**, i64) #2

; Function Attrs: nounwind uwtable
define void @_Z13random_matrixPfii(float* %I, i32 %rows, i32 %cols) #7 !dbg !1073 {
entry:
  %I.addr = alloca float*, align 8
  %rows.addr = alloca i32, align 4
  %cols.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store float* %I, float** %I.addr, align 8
  call void @llvm.dbg.declare(metadata float** %I.addr, metadata !1076, metadata !580), !dbg !1077
  store i32 %rows, i32* %rows.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rows.addr, metadata !1078, metadata !580), !dbg !1079
  store i32 %cols, i32* %cols.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cols.addr, metadata !1080, metadata !580), !dbg !1081
  call void @srand(i32 7) #11, !dbg !1082
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1083, metadata !580), !dbg !1085
  store i32 0, i32* %i, align 4, !dbg !1085
  br label %for.cond, !dbg !1086

for.cond:                                         ; preds = %for.inc4, %entry
  %0 = load i32, i32* %i, align 4, !dbg !1087
  %1 = load i32, i32* %rows.addr, align 4, !dbg !1090
  %cmp = icmp slt i32 %0, %1, !dbg !1091
  br i1 %cmp, label %for.body, label %for.end6, !dbg !1092

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1093, metadata !580), !dbg !1096
  store i32 0, i32* %j, align 4, !dbg !1096
  br label %for.cond1, !dbg !1097

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4, !dbg !1098
  %3 = load i32, i32* %cols.addr, align 4, !dbg !1101
  %cmp2 = icmp slt i32 %2, %3, !dbg !1102
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !1103

for.body3:                                        ; preds = %for.cond1
  %call = call i32 @rand() #11, !dbg !1104
  %conv = sitofp i32 %call to float, !dbg !1104
  %div = fdiv float %conv, 0x41E0000000000000, !dbg !1106
  %4 = load float*, float** %I.addr, align 8, !dbg !1107
  %5 = load i32, i32* %i, align 4, !dbg !1108
  %6 = load i32, i32* %cols.addr, align 4, !dbg !1109
  %mul = mul nsw i32 %5, %6, !dbg !1110
  %7 = load i32, i32* %j, align 4, !dbg !1111
  %add = add nsw i32 %mul, %7, !dbg !1112
  %idxprom = sext i32 %add to i64, !dbg !1107
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom, !dbg !1107
  store float %div, float* %arrayidx, align 4, !dbg !1113
  br label %for.inc, !dbg !1114

for.inc:                                          ; preds = %for.body3
  %8 = load i32, i32* %j, align 4, !dbg !1115
  %inc = add nsw i32 %8, 1, !dbg !1115
  store i32 %inc, i32* %j, align 4, !dbg !1115
  br label %for.cond1, !dbg !1117, !llvm.loop !1118

for.end:                                          ; preds = %for.cond1
  br label %for.inc4, !dbg !1120

for.inc4:                                         ; preds = %for.end
  %9 = load i32, i32* %i, align 4, !dbg !1121
  %inc5 = add nsw i32 %9, 1, !dbg !1121
  store i32 %inc5, i32* %i, align 4, !dbg !1121
  br label %for.cond, !dbg !1123, !llvm.loop !1124

for.end6:                                         ; preds = %for.cond
  ret void, !dbg !1126
}

; Function Attrs: nounwind
declare double @exp(double) #6

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #7 comdat align 2 !dbg !1127 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1128, metadata !580), !dbg !1130
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1131, metadata !580), !dbg !1132
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1133, metadata !580), !dbg !1134
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1135, metadata !580), !dbg !1136
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1137
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1138
  store i32 %0, i32* %x, align 4, !dbg !1137
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1139
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1140
  store i32 %1, i32* %y, align 4, !dbg !1139
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1141
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1142
  store i32 %2, i32* %z, align 4, !dbg !1141
  ret void, !dbg !1143
}

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #2

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #8

declare i32 @cudaThreadSynchronize() #2

; Function Attrs: nounwind
declare void @free(i8*) #6

declare i32 @cudaFree(i8*) #2

; Function Attrs: nounwind
declare void @srand(i32) #6

; Function Attrs: nounwind
declare i32 @rand() #6

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { argmemonly nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly }
attributes #11 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!571, !572}
!llvm.ident = !{!573}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !11, imports: !16)
!1 = !DIFile(filename: "srad.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !4, line: 807, size: 32, align: 32, elements: !5, identifier: "_ZTS14cudaMemcpyKind")
!4 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!5 = !{!6, !7, !8, !9, !10}
!6 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!7 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!8 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!10 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!11 = !{!12, !14, !13}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!13 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64, align: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!16 = !{!17, !24, !28, !30, !32, !34, !36, !40, !42, !44, !46, !48, !50, !52, !54, !56, !58, !60, !62, !64, !66, !68, !72, !74, !76, !78, !83, !88, !90, !92, !97, !101, !103, !105, !107, !109, !111, !113, !115, !117, !122, !126, !128, !130, !134, !136, !138, !140, !142, !144, !148, !150, !152, !156, !164, !168, !170, !172, !176, !178, !180, !184, !186, !188, !192, !194, !196, !198, !200, !202, !204, !206, !208, !210, !215, !217, !219, !223, !225, !227, !229, !231, !233, !235, !237, !241, !245, !247, !249, !254, !256, !258, !260, !262, !264, !266, !270, !276, !280, !284, !289, !291, !295, !299, !312, !316, !320, !324, !328, !333, !335, !339, !343, !347, !355, !359, !363, !367, !371, !376, !382, !386, !390, !392, !400, !404, !412, !414, !416, !420, !424, !428, !433, !437, !442, !443, !444, !445, !448, !449, !450, !451, !452, !453, !454, !457, !459, !461, !463, !465, !467, !469, !471, !474, !476, !478, !480, !482, !484, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !542, !543, !545, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569}
!17 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !20, line: 189)
!18 = !DINamespace(name: "std", scope: null, file: !19, line: 188)
!19 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!20 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !19, file: !19, line: 44, type: !21, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!21 = !DISubroutineType(types: !22)
!22 = !{!23, !23}
!23 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!24 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !25, line: 190)
!25 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !19, file: !19, line: 46, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!26 = !DISubroutineType(types: !27)
!27 = !{!13, !13}
!28 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !29, line: 191)
!29 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !19, file: !19, line: 48, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!30 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !31, line: 192)
!31 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !19, file: !19, line: 50, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !33, line: 193)
!33 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !19, file: !19, line: 52, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !35, line: 194)
!35 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !19, file: !19, line: 56, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !37, line: 195)
!37 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !19, file: !19, line: 54, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!38 = !DISubroutineType(types: !39)
!39 = !{!13, !13, !13}
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !41, line: 196)
!41 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !19, file: !19, line: 58, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !43, line: 197)
!43 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !19, file: !19, line: 60, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !45, line: 198)
!45 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !19, file: !19, line: 62, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !47, line: 199)
!47 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !19, file: !19, line: 64, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !49, line: 200)
!49 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !19, file: !19, line: 66, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !51, line: 201)
!51 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !19, file: !19, line: 68, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !53, line: 202)
!53 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !19, file: !19, line: 72, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !55, line: 203)
!55 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !19, file: !19, line: 70, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !57, line: 204)
!57 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !19, file: !19, line: 76, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !59, line: 205)
!59 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !19, file: !19, line: 74, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !61, line: 206)
!61 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !19, file: !19, line: 78, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !63, line: 207)
!63 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !19, file: !19, line: 80, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !65, line: 208)
!65 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !19, file: !19, line: 82, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !67, line: 209)
!67 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !19, file: !19, line: 84, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !69, line: 210)
!69 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !19, file: !19, line: 86, type: !70, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!70 = !DISubroutineType(types: !71)
!71 = !{!13, !13, !13, !13}
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !73, line: 211)
!73 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !19, file: !19, line: 88, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !75, line: 212)
!75 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !19, file: !19, line: 90, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !77, line: 213)
!77 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !19, file: !19, line: 92, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !79, line: 214)
!79 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !19, file: !19, line: 94, type: !80, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !13}
!82 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !84, line: 215)
!84 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !19, file: !19, line: 96, type: !85, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!85 = !DISubroutineType(types: !86)
!86 = !{!13, !13, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64, align: 64)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !89, line: 216)
!89 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !19, file: !19, line: 98, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !91, line: 217)
!91 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !19, file: !19, line: 100, type: !80, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !93, line: 218)
!93 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !19, file: !19, line: 102, type: !94, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!94 = !DISubroutineType(types: !95)
!95 = !{!96, !13}
!96 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !98, line: 219)
!98 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !19, file: !19, line: 106, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!99 = !DISubroutineType(types: !100)
!100 = !{!96, !13, !13}
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !102, line: 220)
!102 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !19, file: !19, line: 105, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !104, line: 221)
!104 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !19, file: !19, line: 108, type: !94, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !106, line: 222)
!106 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !19, file: !19, line: 112, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !108, line: 223)
!108 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !19, file: !19, line: 111, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !110, line: 224)
!110 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !19, file: !19, line: 114, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !112, line: 225)
!112 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !19, file: !19, line: 116, type: !94, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !114, line: 226)
!114 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !19, file: !19, line: 118, type: !94, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !116, line: 227)
!116 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !19, file: !19, line: 120, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !118, line: 228)
!118 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !19, file: !19, line: 121, type: !119, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!119 = !DISubroutineType(types: !120)
!120 = !{!121, !121}
!121 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !123, line: 229)
!123 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !19, file: !19, line: 123, type: !124, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!124 = !DISubroutineType(types: !125)
!125 = !{!13, !13, !82}
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !127, line: 230)
!127 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !19, file: !19, line: 125, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !129, line: 231)
!129 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !19, file: !19, line: 126, type: !21, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !131, line: 232)
!131 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !19, file: !19, line: 128, type: !132, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!132 = !DISubroutineType(types: !133)
!133 = !{!23, !13}
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !135, line: 233)
!135 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !19, file: !19, line: 138, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !137, line: 234)
!137 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !19, file: !19, line: 130, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !139, line: 235)
!139 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !19, file: !19, line: 132, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !141, line: 236)
!141 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !19, file: !19, line: 134, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !143, line: 237)
!143 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !19, file: !19, line: 136, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !145, line: 238)
!145 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !19, file: !19, line: 140, type: !146, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!146 = !DISubroutineType(types: !147)
!147 = !{!121, !13}
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !149, line: 239)
!149 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !19, file: !19, line: 142, type: !146, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !151, line: 240)
!151 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !19, file: !19, line: 143, type: !132, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !153, line: 241)
!153 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !19, file: !19, line: 145, type: !154, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!154 = !DISubroutineType(types: !155)
!155 = !{!13, !13, !12}
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !157, line: 242)
!157 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !19, file: !19, line: 146, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DISubroutineType(types: !159)
!159 = !{!160, !161}
!160 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64, align: 64)
!162 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !163)
!163 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !165, line: 243)
!165 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !19, file: !19, line: 147, type: !166, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DISubroutineType(types: !167)
!167 = !{!13, !161}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !169, line: 244)
!169 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !19, file: !19, line: 149, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !171, line: 245)
!171 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !19, file: !19, line: 151, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !173, line: 246)
!173 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !19, file: !19, line: 153, type: !174, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DISubroutineType(types: !175)
!175 = !{!13, !13, !160}
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !177, line: 247)
!177 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !19, file: !19, line: 158, type: !124, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !179, line: 248)
!179 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !19, file: !19, line: 160, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !181, line: 249)
!181 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !19, file: !19, line: 162, type: !182, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!182 = !DISubroutineType(types: !183)
!183 = !{!13, !13, !13, !87}
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !185, line: 250)
!185 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !19, file: !19, line: 164, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !187, line: 251)
!187 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !19, file: !19, line: 166, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !189, line: 252)
!189 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !19, file: !19, line: 168, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DISubroutineType(types: !191)
!191 = !{!13, !13, !121}
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !193, line: 253)
!193 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !19, file: !19, line: 170, type: !124, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !195, line: 254)
!195 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !19, file: !19, line: 172, type: !94, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !197, line: 255)
!197 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !19, file: !19, line: 174, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !199, line: 256)
!199 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !19, file: !19, line: 176, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !201, line: 257)
!201 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !19, file: !19, line: 178, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !203, line: 258)
!203 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !19, file: !19, line: 180, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !205, line: 259)
!205 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !19, file: !19, line: 182, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !207, line: 260)
!207 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !19, file: !19, line: 184, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !209, line: 261)
!209 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !19, file: !19, line: 186, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !211, line: 102)
!211 = !DISubprogram(name: "acos", scope: !212, file: !212, line: 54, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!213 = !DISubroutineType(types: !214)
!214 = !{!160, !160}
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !216, line: 121)
!216 = !DISubprogram(name: "asin", scope: !212, file: !212, line: 56, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !218, line: 140)
!218 = !DISubprogram(name: "atan", scope: !212, file: !212, line: 58, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !220, line: 159)
!220 = !DISubprogram(name: "atan2", scope: !212, file: !212, line: 60, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DISubroutineType(types: !222)
!222 = !{!160, !160, !160}
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !224, line: 180)
!224 = !DISubprogram(name: "ceil", scope: !212, file: !212, line: 178, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !226, line: 199)
!226 = !DISubprogram(name: "cos", scope: !212, file: !212, line: 63, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !228, line: 218)
!228 = !DISubprogram(name: "cosh", scope: !212, file: !212, line: 72, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !230, line: 237)
!230 = !DISubprogram(name: "exp", scope: !212, file: !212, line: 100, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !232, line: 256)
!232 = !DISubprogram(name: "fabs", scope: !212, file: !212, line: 181, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !234, line: 275)
!234 = !DISubprogram(name: "floor", scope: !212, file: !212, line: 184, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !236, line: 294)
!236 = !DISubprogram(name: "fmod", scope: !212, file: !212, line: 187, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !238, line: 315)
!238 = !DISubprogram(name: "frexp", scope: !212, file: !212, line: 103, type: !239, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !DISubroutineType(types: !240)
!240 = !{!160, !160, !87}
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !242, line: 334)
!242 = !DISubprogram(name: "ldexp", scope: !212, file: !212, line: 106, type: !243, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!243 = !DISubroutineType(types: !244)
!244 = !{!160, !160, !82}
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !246, line: 353)
!246 = !DISubprogram(name: "log", scope: !212, file: !212, line: 109, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !248, line: 372)
!248 = !DISubprogram(name: "log10", scope: !212, file: !212, line: 112, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !250, line: 391)
!250 = !DISubprogram(name: "modf", scope: !212, file: !212, line: 115, type: !251, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!251 = !DISubroutineType(types: !252)
!252 = !{!160, !160, !253}
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64, align: 64)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !255, line: 403)
!255 = !DISubprogram(name: "pow", scope: !212, file: !212, line: 153, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !257, line: 440)
!257 = !DISubprogram(name: "sin", scope: !212, file: !212, line: 65, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !259, line: 459)
!259 = !DISubprogram(name: "sinh", scope: !212, file: !212, line: 74, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !261, line: 478)
!261 = !DISubprogram(name: "sqrt", scope: !212, file: !212, line: 156, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !263, line: 497)
!263 = !DISubprogram(name: "tan", scope: !212, file: !212, line: 67, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !265, line: 516)
!265 = !DISubprogram(name: "tanh", scope: !212, file: !212, line: 76, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !267, line: 118)
!267 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !268, line: 101, baseType: !269)
!268 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!269 = !DICompositeType(tag: DW_TAG_structure_type, file: !268, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !271, line: 119)
!271 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !268, line: 109, baseType: !272)
!272 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !268, line: 105, size: 128, align: 64, elements: !273, identifier: "_ZTS6ldiv_t")
!273 = !{!274, !275}
!274 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !272, file: !268, line: 107, baseType: !121, size: 64, align: 64)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !272, file: !268, line: 108, baseType: !121, size: 64, align: 64, offset: 64)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !277, line: 121)
!277 = !DISubprogram(name: "abort", scope: !268, file: !268, line: 515, type: !278, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!278 = !DISubroutineType(types: !279)
!279 = !{null}
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !281, line: 122)
!281 = !DISubprogram(name: "abs", scope: !268, file: !268, line: 774, type: !282, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!282 = !DISubroutineType(types: !283)
!283 = !{!82, !82}
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !285, line: 123)
!285 = !DISubprogram(name: "atexit", scope: !268, file: !268, line: 519, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{!82, !288}
!288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !278, size: 64, align: 64)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !290, line: 129)
!290 = !DISubprogram(name: "atof", scope: !268, file: !268, line: 144, type: !158, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !292, line: 130)
!292 = !DISubprogram(name: "atoi", scope: !268, file: !268, line: 147, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DISubroutineType(types: !294)
!294 = !{!82, !161}
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !296, line: 131)
!296 = !DISubprogram(name: "atol", scope: !268, file: !268, line: 150, type: !297, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DISubroutineType(types: !298)
!298 = !{!121, !161}
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !300, line: 132)
!300 = !DISubprogram(name: "bsearch", scope: !268, file: !268, line: 754, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !DISubroutineType(types: !302)
!302 = !{!15, !303, !303, !305, !305, !308}
!303 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !304, size: 64, align: 64)
!304 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!305 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !306, line: 62, baseType: !307)
!306 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!307 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!308 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !268, line: 741, baseType: !309)
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64, align: 64)
!310 = !DISubroutineType(types: !311)
!311 = !{!82, !303, !303}
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !313, line: 133)
!313 = !DISubprogram(name: "calloc", scope: !268, file: !268, line: 468, type: !314, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DISubroutineType(types: !315)
!315 = !{!15, !305, !305}
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !317, line: 134)
!317 = !DISubprogram(name: "div", scope: !268, file: !268, line: 788, type: !318, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DISubroutineType(types: !319)
!319 = !{!267, !82, !82}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !321, line: 135)
!321 = !DISubprogram(name: "exit", scope: !268, file: !268, line: 543, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!322 = !DISubroutineType(types: !323)
!323 = !{null, !82}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !325, line: 136)
!325 = !DISubprogram(name: "free", scope: !268, file: !268, line: 483, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{null, !15}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !329, line: 137)
!329 = !DISubprogram(name: "getenv", scope: !268, file: !268, line: 564, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{!332, !161}
!332 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64, align: 64)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !334, line: 138)
!334 = !DISubprogram(name: "labs", scope: !268, file: !268, line: 775, type: !119, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !336, line: 139)
!336 = !DISubprogram(name: "ldiv", scope: !268, file: !268, line: 790, type: !337, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!337 = !DISubroutineType(types: !338)
!338 = !{!271, !121, !121}
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !340, line: 140)
!340 = !DISubprogram(name: "malloc", scope: !268, file: !268, line: 466, type: !341, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DISubroutineType(types: !342)
!342 = !{!15, !305}
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !344, line: 142)
!344 = !DISubprogram(name: "mblen", scope: !268, file: !268, line: 862, type: !345, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DISubroutineType(types: !346)
!346 = !{!82, !161, !305}
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !348, line: 143)
!348 = !DISubprogram(name: "mbstowcs", scope: !268, file: !268, line: 873, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!305, !351, !354, !305}
!351 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !352)
!352 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !353, size: 64, align: 64)
!353 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!354 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !161)
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !356, line: 144)
!356 = !DISubprogram(name: "mbtowc", scope: !268, file: !268, line: 865, type: !357, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!357 = !DISubroutineType(types: !358)
!358 = !{!82, !351, !354, !305}
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !360, line: 146)
!360 = !DISubprogram(name: "qsort", scope: !268, file: !268, line: 764, type: !361, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!361 = !DISubroutineType(types: !362)
!362 = !{null, !15, !305, !305, !308}
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !364, line: 152)
!364 = !DISubprogram(name: "rand", scope: !268, file: !268, line: 374, type: !365, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!365 = !DISubroutineType(types: !366)
!366 = !{!82}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !368, line: 153)
!368 = !DISubprogram(name: "realloc", scope: !268, file: !268, line: 480, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{!15, !15, !305}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !372, line: 154)
!372 = !DISubprogram(name: "srand", scope: !268, file: !268, line: 376, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!373 = !DISubroutineType(types: !374)
!374 = !{null, !375}
!375 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !377, line: 155)
!377 = !DISubprogram(name: "strtod", scope: !268, file: !268, line: 164, type: !378, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!378 = !DISubroutineType(types: !379)
!379 = !{!160, !354, !380}
!380 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !381)
!381 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !332, size: 64, align: 64)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !383, line: 156)
!383 = !DISubprogram(name: "strtol", scope: !268, file: !268, line: 183, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{!121, !354, !380, !82}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !387, line: 157)
!387 = !DISubprogram(name: "strtoul", scope: !268, file: !268, line: 187, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{!307, !354, !380, !82}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !391, line: 158)
!391 = !DISubprogram(name: "system", scope: !268, file: !268, line: 716, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !393, line: 160)
!393 = !DISubprogram(name: "wcstombs", scope: !268, file: !268, line: 876, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!394 = !DISubroutineType(types: !395)
!395 = !{!305, !396, !397, !305}
!396 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !332)
!397 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !398)
!398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !399, size: 64, align: 64)
!399 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !353)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !401, line: 161)
!401 = !DISubprogram(name: "wctomb", scope: !268, file: !268, line: 869, type: !402, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!402 = !DISubroutineType(types: !403)
!403 = !{!82, !332, !353}
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !407, line: 214)
!405 = !DINamespace(name: "__gnu_cxx", scope: null, file: !406, line: 220)
!406 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!407 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !268, line: 121, baseType: !408)
!408 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !268, line: 117, size: 128, align: 64, elements: !409, identifier: "_ZTS7lldiv_t")
!409 = !{!410, !411}
!410 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !408, file: !268, line: 119, baseType: !23, size: 64, align: 64)
!411 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !408, file: !268, line: 120, baseType: !23, size: 64, align: 64, offset: 64)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !413, line: 220)
!413 = !DISubprogram(name: "_Exit", scope: !268, file: !268, line: 557, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !415, line: 224)
!415 = !DISubprogram(name: "llabs", scope: !268, file: !268, line: 779, type: !21, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !417, line: 230)
!417 = !DISubprogram(name: "lldiv", scope: !268, file: !268, line: 796, type: !418, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!418 = !DISubroutineType(types: !419)
!419 = !{!407, !23, !23}
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !421, line: 241)
!421 = !DISubprogram(name: "atoll", scope: !268, file: !268, line: 157, type: !422, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!422 = !DISubroutineType(types: !423)
!423 = !{!23, !161}
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !425, line: 242)
!425 = !DISubprogram(name: "strtoll", scope: !268, file: !268, line: 209, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!426 = !DISubroutineType(types: !427)
!427 = !{!23, !354, !380, !82}
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !429, line: 243)
!429 = !DISubprogram(name: "strtoull", scope: !268, file: !268, line: 214, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DISubroutineType(types: !431)
!431 = !{!432, !354, !380, !82}
!432 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !434, line: 245)
!434 = !DISubprogram(name: "strtof", scope: !268, file: !268, line: 172, type: !435, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!435 = !DISubroutineType(types: !436)
!436 = !{!13, !354, !380}
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !438, line: 246)
!438 = !DISubprogram(name: "strtold", scope: !268, file: !268, line: 175, type: !439, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!439 = !DISubroutineType(types: !440)
!440 = !{!441, !354, !380}
!441 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !407, line: 254)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !413, line: 256)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !415, line: 258)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !446, line: 259)
!446 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !405, file: !447, line: 227, type: !418, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !417, line: 260)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !421, line: 262)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !434, line: 263)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !425, line: 264)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !429, line: 265)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !438, line: 266)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !455, line: 397)
!455 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !456, file: !456, line: 1342, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !458, line: 398)
!458 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !456, file: !456, line: 1370, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !460, line: 399)
!460 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !456, file: !456, line: 1337, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !462, line: 400)
!462 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !456, file: !456, line: 1375, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !464, line: 401)
!464 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !456, file: !456, line: 1327, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !466, line: 402)
!466 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !456, file: !456, line: 1332, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !468, line: 403)
!468 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !456, file: !456, line: 1380, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !470, line: 404)
!470 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !456, file: !456, line: 1430, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !472, line: 405)
!472 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !473, file: !473, line: 667, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !475, line: 406)
!475 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !456, file: !456, line: 1189, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !477, line: 407)
!477 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !456, file: !456, line: 1243, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !479, line: 408)
!479 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !456, file: !456, line: 1312, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !481, line: 409)
!481 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !456, file: !456, line: 1490, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !483, line: 410)
!483 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !456, file: !456, line: 1480, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !485, line: 411)
!485 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !473, file: !473, line: 657, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !487, line: 412)
!487 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !456, file: !456, line: 1294, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !489, line: 413)
!489 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !456, file: !456, line: 1385, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !491, line: 414)
!491 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !473, file: !473, line: 607, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !493, line: 415)
!493 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !456, file: !456, line: 1616, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !495, line: 416)
!495 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !473, file: !473, line: 597, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !497, line: 417)
!497 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !456, file: !456, line: 1568, type: !70, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !499, line: 418)
!499 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !473, file: !473, line: 622, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !501, line: 419)
!501 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !473, file: !473, line: 617, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !503, line: 420)
!503 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !456, file: !456, line: 1553, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !505, line: 421)
!505 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !456, file: !456, line: 1543, type: !85, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !507, line: 422)
!507 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !456, file: !456, line: 1390, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !509, line: 423)
!509 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !456, file: !456, line: 1621, type: !80, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !511, line: 424)
!511 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !456, file: !456, line: 1520, type: !124, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !513, line: 425)
!513 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !456, file: !456, line: 1515, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !515, line: 426)
!515 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !456, file: !456, line: 1149, type: !132, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !517, line: 427)
!517 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !456, file: !456, line: 1602, type: !132, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !519, line: 428)
!519 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !456, file: !456, line: 1356, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !521, line: 429)
!521 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !456, file: !456, line: 1365, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !523, line: 430)
!523 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !456, file: !456, line: 1285, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !525, line: 431)
!525 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !456, file: !456, line: 1626, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !527, line: 432)
!527 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !456, file: !456, line: 1347, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !529, line: 433)
!529 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !456, file: !456, line: 1140, type: !146, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !531, line: 434)
!531 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !456, file: !456, line: 1607, type: !146, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !533, line: 435)
!533 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !456, file: !456, line: 1548, type: !154, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !535, line: 436)
!535 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !456, file: !456, line: 1154, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !537, line: 437)
!537 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !456, file: !456, line: 1218, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !539, line: 438)
!539 = !DISubprogram(name: "nexttowardf", scope: !212, file: !212, line: 294, type: !540, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DISubroutineType(types: !541)
!541 = !{!13, !13, !441}
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !539, line: 439)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !544, line: 440)
!544 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !456, file: !456, line: 1583, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !546, line: 441)
!546 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !456, file: !456, line: 1558, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !548, line: 442)
!548 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !456, file: !456, line: 1563, type: !182, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !550, line: 443)
!550 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !456, file: !456, line: 1135, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !552, line: 444)
!552 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !456, file: !456, line: 1597, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !554, line: 445)
!554 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !456, file: !456, line: 1530, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !556, line: 446)
!556 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !456, file: !456, line: 1525, type: !124, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !558, line: 447)
!558 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !456, file: !456, line: 1234, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !560, line: 448)
!560 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !456, file: !456, line: 1317, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !562, line: 449)
!562 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !473, file: !473, line: 907, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !564, line: 450)
!564 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !456, file: !456, line: 1276, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !566, line: 451)
!566 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !456, file: !456, line: 1322, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !568, line: 452)
!568 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !456, file: !456, line: 1592, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !18, entity: !570, line: 453)
!570 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !473, file: !473, line: 662, type: !26, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !{i32 2, !"Dwarf Version", i32 4}
!572 = !{i32 2, !"Debug Info Version", i32 3}
!573 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!574 = distinct !DISubprogram(name: "srad_cuda_1", linkageName: "_Z11srad_cuda_1PfS_S_S_S_S_iif", scope: !575, file: !575, line: 5, type: !576, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !578)
!575 = !DIFile(filename: "./srad_kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!576 = !DISubroutineType(types: !577)
!577 = !{null, !12, !12, !12, !12, !12, !12, !82, !82, !13}
!578 = !{}
!579 = !DILocalVariable(name: "E_C", arg: 1, scope: !574, file: !575, line: 6, type: !12)
!580 = !DIExpression()
!581 = !DILocation(line: 6, column: 12, scope: !574)
!582 = !DILocalVariable(name: "W_C", arg: 2, scope: !574, file: !575, line: 7, type: !12)
!583 = !DILocation(line: 7, column: 12, scope: !574)
!584 = !DILocalVariable(name: "N_C", arg: 3, scope: !574, file: !575, line: 8, type: !12)
!585 = !DILocation(line: 8, column: 12, scope: !574)
!586 = !DILocalVariable(name: "S_C", arg: 4, scope: !574, file: !575, line: 9, type: !12)
!587 = !DILocation(line: 9, column: 12, scope: !574)
!588 = !DILocalVariable(name: "J_cuda", arg: 5, scope: !574, file: !575, line: 10, type: !12)
!589 = !DILocation(line: 10, column: 13, scope: !574)
!590 = !DILocalVariable(name: "C_cuda", arg: 6, scope: !574, file: !575, line: 11, type: !12)
!591 = !DILocation(line: 11, column: 13, scope: !574)
!592 = !DILocalVariable(name: "cols", arg: 7, scope: !574, file: !575, line: 12, type: !82)
!593 = !DILocation(line: 12, column: 9, scope: !574)
!594 = !DILocalVariable(name: "rows", arg: 8, scope: !574, file: !575, line: 13, type: !82)
!595 = !DILocation(line: 13, column: 9, scope: !574)
!596 = !DILocalVariable(name: "q0sqr", arg: 9, scope: !574, file: !575, line: 14, type: !13)
!597 = !DILocation(line: 14, column: 11, scope: !574)
!598 = !DILocation(line: 16, column: 1, scope: !574)
!599 = !DILocation(line: 16, column: 1, scope: !600)
!600 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 1)
!601 = !DILocation(line: 16, column: 1, scope: !602)
!602 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 2)
!603 = !DILocation(line: 16, column: 1, scope: !604)
!604 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 3)
!605 = !DILocation(line: 16, column: 1, scope: !606)
!606 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 4)
!607 = !DILocation(line: 16, column: 1, scope: !608)
!608 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 5)
!609 = !DILocation(line: 16, column: 1, scope: !610)
!610 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 6)
!611 = !DILocation(line: 16, column: 1, scope: !612)
!612 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 7)
!613 = !DILocation(line: 16, column: 1, scope: !614)
!614 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 8)
!615 = !DILocation(line: 16, column: 1, scope: !616)
!616 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 9)
!617 = !DILocation(line: 157, column: 1, scope: !574)
!618 = distinct !DISubprogram(name: "srad_cuda_2", linkageName: "_Z11srad_cuda_2PfS_S_S_S_S_iiff", scope: !575, file: !575, line: 160, type: !619, isLocal: false, isDefinition: true, scopeLine: 172, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !578)
!619 = !DISubroutineType(types: !620)
!620 = !{null, !12, !12, !12, !12, !12, !12, !82, !82, !13, !13}
!621 = !DILocalVariable(name: "E_C", arg: 1, scope: !618, file: !575, line: 161, type: !12)
!622 = !DILocation(line: 161, column: 12, scope: !618)
!623 = !DILocalVariable(name: "W_C", arg: 2, scope: !618, file: !575, line: 162, type: !12)
!624 = !DILocation(line: 162, column: 12, scope: !618)
!625 = !DILocalVariable(name: "N_C", arg: 3, scope: !618, file: !575, line: 163, type: !12)
!626 = !DILocation(line: 163, column: 12, scope: !618)
!627 = !DILocalVariable(name: "S_C", arg: 4, scope: !618, file: !575, line: 164, type: !12)
!628 = !DILocation(line: 164, column: 12, scope: !618)
!629 = !DILocalVariable(name: "J_cuda", arg: 5, scope: !618, file: !575, line: 165, type: !12)
!630 = !DILocation(line: 165, column: 13, scope: !618)
!631 = !DILocalVariable(name: "C_cuda", arg: 6, scope: !618, file: !575, line: 166, type: !12)
!632 = !DILocation(line: 166, column: 13, scope: !618)
!633 = !DILocalVariable(name: "cols", arg: 7, scope: !618, file: !575, line: 167, type: !82)
!634 = !DILocation(line: 167, column: 9, scope: !618)
!635 = !DILocalVariable(name: "rows", arg: 8, scope: !618, file: !575, line: 168, type: !82)
!636 = !DILocation(line: 168, column: 9, scope: !618)
!637 = !DILocalVariable(name: "lambda", arg: 9, scope: !618, file: !575, line: 169, type: !13)
!638 = !DILocation(line: 169, column: 11, scope: !618)
!639 = !DILocalVariable(name: "q0sqr", arg: 10, scope: !618, file: !575, line: 170, type: !13)
!640 = !DILocation(line: 170, column: 11, scope: !618)
!641 = !DILocation(line: 172, column: 1, scope: !618)
!642 = !DILocation(line: 172, column: 1, scope: !643)
!643 = !DILexicalBlockFile(scope: !618, file: !575, discriminator: 1)
!644 = !DILocation(line: 172, column: 1, scope: !645)
!645 = !DILexicalBlockFile(scope: !618, file: !575, discriminator: 2)
!646 = !DILocation(line: 172, column: 1, scope: !647)
!647 = !DILexicalBlockFile(scope: !618, file: !575, discriminator: 3)
!648 = !DILocation(line: 172, column: 1, scope: !649)
!649 = !DILexicalBlockFile(scope: !618, file: !575, discriminator: 4)
!650 = !DILocation(line: 172, column: 1, scope: !651)
!651 = !DILexicalBlockFile(scope: !618, file: !575, discriminator: 5)
!652 = !DILocation(line: 172, column: 1, scope: !653)
!653 = !DILexicalBlockFile(scope: !618, file: !575, discriminator: 6)
!654 = !DILocation(line: 172, column: 1, scope: !655)
!655 = !DILexicalBlockFile(scope: !618, file: !575, discriminator: 7)
!656 = !DILocation(line: 172, column: 1, scope: !657)
!657 = !DILexicalBlockFile(scope: !618, file: !575, discriminator: 8)
!658 = !DILocation(line: 172, column: 1, scope: !659)
!659 = !DILexicalBlockFile(scope: !618, file: !575, discriminator: 9)
!660 = !DILocation(line: 172, column: 1, scope: !661)
!661 = !DILexicalBlockFile(scope: !618, file: !575, discriminator: 10)
!662 = !DILocation(line: 257, column: 1, scope: !618)
!663 = distinct !DISubprogram(name: "usage", linkageName: "_Z5usageiPPc", scope: !1, file: !1, line: 16, type: !664, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !578)
!664 = !DISubroutineType(types: !665)
!665 = !{null, !82, !381}
!666 = !DILocalVariable(name: "argc", arg: 1, scope: !663, file: !1, line: 16, type: !82)
!667 = !DILocation(line: 16, column: 16, scope: !663)
!668 = !DILocalVariable(name: "argv", arg: 2, scope: !663, file: !1, line: 16, type: !381)
!669 = !DILocation(line: 16, column: 29, scope: !663)
!670 = !DILocation(line: 18, column: 10, scope: !663)
!671 = !DILocation(line: 18, column: 89, scope: !663)
!672 = !DILocation(line: 18, column: 2, scope: !663)
!673 = !DILocation(line: 19, column: 10, scope: !663)
!674 = !DILocation(line: 19, column: 2, scope: !663)
!675 = !DILocation(line: 20, column: 10, scope: !663)
!676 = !DILocation(line: 20, column: 2, scope: !663)
!677 = !DILocation(line: 21, column: 10, scope: !663)
!678 = !DILocation(line: 21, column: 2, scope: !663)
!679 = !DILocation(line: 22, column: 10, scope: !663)
!680 = !DILocation(line: 22, column: 2, scope: !663)
!681 = !DILocation(line: 23, column: 10, scope: !663)
!682 = !DILocation(line: 23, column: 2, scope: !663)
!683 = !DILocation(line: 24, column: 10, scope: !663)
!684 = !DILocation(line: 24, column: 2, scope: !663)
!685 = !DILocation(line: 25, column: 10, scope: !663)
!686 = !DILocation(line: 25, column: 2, scope: !663)
!687 = !DILocation(line: 26, column: 10, scope: !663)
!688 = !DILocation(line: 26, column: 2, scope: !663)
!689 = !DILocation(line: 28, column: 2, scope: !663)
!690 = !DILocation(line: 29, column: 1, scope: !663)
!691 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 34, type: !692, isLocal: false, isDefinition: true, scopeLine: 35, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !578)
!692 = !DISubroutineType(types: !693)
!693 = !{!82, !82, !381}
!694 = !DILocalVariable(name: "argc", arg: 1, scope: !691, file: !1, line: 34, type: !82)
!695 = !DILocation(line: 34, column: 11, scope: !691)
!696 = !DILocalVariable(name: "argv", arg: 2, scope: !691, file: !1, line: 34, type: !381)
!697 = !DILocation(line: 34, column: 24, scope: !691)
!698 = !DILocation(line: 36, column: 3, scope: !691)
!699 = !DILocation(line: 37, column: 14, scope: !691)
!700 = !DILocation(line: 37, column: 20, scope: !691)
!701 = !DILocation(line: 37, column: 5, scope: !691)
!702 = !DILocation(line: 39, column: 5, scope: !691)
!703 = distinct !DISubprogram(name: "runTest", linkageName: "_Z7runTestiPPc", scope: !1, file: !1, line: 44, type: !664, isLocal: false, isDefinition: true, scopeLine: 45, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !578)
!704 = !DILocalVariable(name: "argc", arg: 1, scope: !703, file: !1, line: 44, type: !82)
!705 = !DILocation(line: 44, column: 14, scope: !703)
!706 = !DILocalVariable(name: "argv", arg: 2, scope: !703, file: !1, line: 44, type: !381)
!707 = !DILocation(line: 44, column: 27, scope: !703)
!708 = !DILocalVariable(name: "rows", scope: !703, file: !1, line: 46, type: !82)
!709 = !DILocation(line: 46, column: 9, scope: !703)
!710 = !DILocalVariable(name: "cols", scope: !703, file: !1, line: 46, type: !82)
!711 = !DILocation(line: 46, column: 15, scope: !703)
!712 = !DILocalVariable(name: "size_I", scope: !703, file: !1, line: 46, type: !82)
!713 = !DILocation(line: 46, column: 21, scope: !703)
!714 = !DILocalVariable(name: "size_R", scope: !703, file: !1, line: 46, type: !82)
!715 = !DILocation(line: 46, column: 29, scope: !703)
!716 = !DILocalVariable(name: "niter", scope: !703, file: !1, line: 46, type: !82)
!717 = !DILocation(line: 46, column: 37, scope: !703)
!718 = !DILocalVariable(name: "iter", scope: !703, file: !1, line: 46, type: !82)
!719 = !DILocation(line: 46, column: 49, scope: !703)
!720 = !DILocalVariable(name: "I", scope: !703, file: !1, line: 47, type: !12)
!721 = !DILocation(line: 47, column: 12, scope: !703)
!722 = !DILocalVariable(name: "J", scope: !703, file: !1, line: 47, type: !12)
!723 = !DILocation(line: 47, column: 16, scope: !703)
!724 = !DILocalVariable(name: "lambda", scope: !703, file: !1, line: 47, type: !13)
!725 = !DILocation(line: 47, column: 19, scope: !703)
!726 = !DILocalVariable(name: "q0sqr", scope: !703, file: !1, line: 47, type: !13)
!727 = !DILocation(line: 47, column: 27, scope: !703)
!728 = !DILocalVariable(name: "sum", scope: !703, file: !1, line: 47, type: !13)
!729 = !DILocation(line: 47, column: 34, scope: !703)
!730 = !DILocalVariable(name: "sum2", scope: !703, file: !1, line: 47, type: !13)
!731 = !DILocation(line: 47, column: 39, scope: !703)
!732 = !DILocalVariable(name: "tmp", scope: !703, file: !1, line: 47, type: !13)
!733 = !DILocation(line: 47, column: 45, scope: !703)
!734 = !DILocalVariable(name: "meanROI", scope: !703, file: !1, line: 47, type: !13)
!735 = !DILocation(line: 47, column: 50, scope: !703)
!736 = !DILocalVariable(name: "varROI", scope: !703, file: !1, line: 47, type: !13)
!737 = !DILocation(line: 47, column: 58, scope: !703)
!738 = !DILocalVariable(name: "J_cuda", scope: !703, file: !1, line: 58, type: !12)
!739 = !DILocation(line: 58, column: 9, scope: !703)
!740 = !DILocalVariable(name: "C_cuda", scope: !703, file: !1, line: 59, type: !12)
!741 = !DILocation(line: 59, column: 12, scope: !703)
!742 = !DILocalVariable(name: "E_C", scope: !703, file: !1, line: 60, type: !12)
!743 = !DILocation(line: 60, column: 9, scope: !703)
!744 = !DILocalVariable(name: "W_C", scope: !703, file: !1, line: 60, type: !12)
!745 = !DILocation(line: 60, column: 15, scope: !703)
!746 = !DILocalVariable(name: "N_C", scope: !703, file: !1, line: 60, type: !12)
!747 = !DILocation(line: 60, column: 21, scope: !703)
!748 = !DILocalVariable(name: "S_C", scope: !703, file: !1, line: 60, type: !12)
!749 = !DILocation(line: 60, column: 27, scope: !703)
!750 = !DILocalVariable(name: "r1", scope: !703, file: !1, line: 64, type: !375)
!751 = !DILocation(line: 64, column: 15, scope: !703)
!752 = !DILocalVariable(name: "r2", scope: !703, file: !1, line: 64, type: !375)
!753 = !DILocation(line: 64, column: 19, scope: !703)
!754 = !DILocalVariable(name: "c1", scope: !703, file: !1, line: 64, type: !375)
!755 = !DILocation(line: 64, column: 23, scope: !703)
!756 = !DILocalVariable(name: "c2", scope: !703, file: !1, line: 64, type: !375)
!757 = !DILocation(line: 64, column: 27, scope: !703)
!758 = !DILocalVariable(name: "c", scope: !703, file: !1, line: 65, type: !12)
!759 = !DILocation(line: 65, column: 9, scope: !703)
!760 = !DILocation(line: 69, column: 6, scope: !761)
!761 = distinct !DILexicalBlock(scope: !703, file: !1, line: 69, column: 6)
!762 = !DILocation(line: 69, column: 11, scope: !761)
!763 = !DILocation(line: 69, column: 6, scope: !703)
!764 = !DILocation(line: 71, column: 15, scope: !765)
!765 = distinct !DILexicalBlock(scope: !761, file: !1, line: 70, column: 2)
!766 = !DILocation(line: 71, column: 10, scope: !765)
!767 = !DILocation(line: 71, column: 8, scope: !765)
!768 = !DILocation(line: 72, column: 15, scope: !765)
!769 = !DILocation(line: 72, column: 10, scope: !765)
!770 = !DILocation(line: 72, column: 8, scope: !765)
!771 = !DILocation(line: 73, column: 8, scope: !772)
!772 = distinct !DILexicalBlock(scope: !765, file: !1, line: 73, column: 7)
!773 = !DILocation(line: 73, column: 12, scope: !772)
!774 = !DILocation(line: 73, column: 15, scope: !772)
!775 = !DILocation(line: 73, column: 20, scope: !772)
!776 = !DILocation(line: 73, column: 24, scope: !777)
!777 = !DILexicalBlockFile(scope: !772, file: !1, discriminator: 1)
!778 = !DILocation(line: 73, column: 28, scope: !777)
!779 = !DILocation(line: 73, column: 31, scope: !777)
!780 = !DILocation(line: 73, column: 7, scope: !777)
!781 = !DILocation(line: 74, column: 11, scope: !782)
!782 = distinct !DILexicalBlock(scope: !772, file: !1, line: 73, column: 36)
!783 = !DILocation(line: 74, column: 3, scope: !782)
!784 = !DILocation(line: 75, column: 3, scope: !782)
!785 = !DILocation(line: 77, column: 15, scope: !765)
!786 = !DILocation(line: 77, column: 10, scope: !765)
!787 = !DILocation(line: 77, column: 8, scope: !765)
!788 = !DILocation(line: 78, column: 15, scope: !765)
!789 = !DILocation(line: 78, column: 10, scope: !765)
!790 = !DILocation(line: 78, column: 8, scope: !765)
!791 = !DILocation(line: 79, column: 15, scope: !765)
!792 = !DILocation(line: 79, column: 10, scope: !765)
!793 = !DILocation(line: 79, column: 8, scope: !765)
!794 = !DILocation(line: 80, column: 15, scope: !765)
!795 = !DILocation(line: 80, column: 10, scope: !765)
!796 = !DILocation(line: 80, column: 8, scope: !765)
!797 = !DILocation(line: 81, column: 17, scope: !765)
!798 = !DILocation(line: 81, column: 12, scope: !765)
!799 = !DILocation(line: 81, column: 10, scope: !765)
!800 = !DILocation(line: 82, column: 16, scope: !765)
!801 = !DILocation(line: 82, column: 11, scope: !765)
!802 = !DILocation(line: 82, column: 9, scope: !765)
!803 = !DILocation(line: 84, column: 2, scope: !765)
!804 = !DILocation(line: 86, column: 8, scope: !805)
!805 = distinct !DILexicalBlock(scope: !761, file: !1, line: 85, column: 9)
!806 = !DILocation(line: 86, column: 14, scope: !805)
!807 = !DILocation(line: 86, column: 2, scope: !805)
!808 = !DILocation(line: 91, column: 11, scope: !703)
!809 = !DILocation(line: 91, column: 18, scope: !703)
!810 = !DILocation(line: 91, column: 16, scope: !703)
!811 = !DILocation(line: 91, column: 9, scope: !703)
!812 = !DILocation(line: 92, column: 15, scope: !703)
!813 = !DILocation(line: 92, column: 18, scope: !703)
!814 = !DILocation(line: 92, column: 17, scope: !703)
!815 = !DILocation(line: 92, column: 20, scope: !703)
!816 = !DILocation(line: 92, column: 25, scope: !703)
!817 = !DILocation(line: 92, column: 28, scope: !703)
!818 = !DILocation(line: 92, column: 27, scope: !703)
!819 = !DILocation(line: 92, column: 30, scope: !703)
!820 = !DILocation(line: 92, column: 23, scope: !703)
!821 = !DILocation(line: 92, column: 12, scope: !703)
!822 = !DILocation(line: 94, column: 23, scope: !703)
!823 = !DILocation(line: 94, column: 30, scope: !703)
!824 = !DILocation(line: 94, column: 15, scope: !703)
!825 = !DILocation(line: 94, column: 6, scope: !703)
!826 = !DILocation(line: 94, column: 4, scope: !703)
!827 = !DILocation(line: 95, column: 26, scope: !703)
!828 = !DILocation(line: 95, column: 33, scope: !703)
!829 = !DILocation(line: 95, column: 18, scope: !703)
!830 = !DILocation(line: 95, column: 9, scope: !703)
!831 = !DILocation(line: 95, column: 7, scope: !703)
!832 = !DILocation(line: 96, column: 38, scope: !703)
!833 = !DILocation(line: 96, column: 36, scope: !703)
!834 = !DILocation(line: 96, column: 16, scope: !703)
!835 = !DILocation(line: 96, column: 7, scope: !703)
!836 = !DILocation(line: 96, column: 5, scope: !703)
!837 = !DILocation(line: 131, column: 16, scope: !703)
!838 = !DILocation(line: 131, column: 49, scope: !703)
!839 = !DILocation(line: 131, column: 47, scope: !703)
!840 = !DILocation(line: 131, column: 5, scope: !703)
!841 = !DILocation(line: 132, column: 16, scope: !703)
!842 = !DILocation(line: 132, column: 49, scope: !703)
!843 = !DILocation(line: 132, column: 47, scope: !703)
!844 = !DILocation(line: 132, column: 5, scope: !703)
!845 = !DILocation(line: 133, column: 13, scope: !703)
!846 = !DILocation(line: 133, column: 43, scope: !703)
!847 = !DILocation(line: 133, column: 41, scope: !703)
!848 = !DILocation(line: 133, column: 2, scope: !703)
!849 = !DILocation(line: 134, column: 13, scope: !703)
!850 = !DILocation(line: 134, column: 43, scope: !703)
!851 = !DILocation(line: 134, column: 41, scope: !703)
!852 = !DILocation(line: 134, column: 2, scope: !703)
!853 = !DILocation(line: 135, column: 13, scope: !703)
!854 = !DILocation(line: 135, column: 43, scope: !703)
!855 = !DILocation(line: 135, column: 41, scope: !703)
!856 = !DILocation(line: 135, column: 2, scope: !703)
!857 = !DILocation(line: 136, column: 13, scope: !703)
!858 = !DILocation(line: 136, column: 43, scope: !703)
!859 = !DILocation(line: 136, column: 41, scope: !703)
!860 = !DILocation(line: 136, column: 2, scope: !703)
!861 = !DILocation(line: 141, column: 2, scope: !703)
!862 = !DILocation(line: 143, column: 16, scope: !703)
!863 = !DILocation(line: 143, column: 19, scope: !703)
!864 = !DILocation(line: 143, column: 25, scope: !703)
!865 = !DILocation(line: 143, column: 2, scope: !703)
!866 = !DILocalVariable(name: "k", scope: !867, file: !1, line: 145, type: !82)
!867 = distinct !DILexicalBlock(scope: !703, file: !1, line: 145, column: 5)
!868 = !DILocation(line: 145, column: 14, scope: !867)
!869 = !DILocation(line: 145, column: 10, scope: !867)
!870 = !DILocation(line: 145, column: 22, scope: !871)
!871 = !DILexicalBlockFile(scope: !872, file: !1, discriminator: 1)
!872 = distinct !DILexicalBlock(scope: !867, file: !1, line: 145, column: 5)
!873 = !DILocation(line: 145, column: 26, scope: !871)
!874 = !DILocation(line: 145, column: 24, scope: !871)
!875 = !DILocation(line: 145, column: 5, scope: !871)
!876 = !DILocation(line: 146, column: 25, scope: !877)
!877 = distinct !DILexicalBlock(scope: !872, file: !1, line: 145, column: 40)
!878 = !DILocation(line: 146, column: 27, scope: !877)
!879 = !DILocation(line: 146, column: 21, scope: !877)
!880 = !DILocation(line: 146, column: 7, scope: !877)
!881 = !DILocation(line: 146, column: 9, scope: !877)
!882 = !DILocation(line: 146, column: 12, scope: !877)
!883 = !DILocation(line: 147, column: 5, scope: !877)
!884 = !DILocation(line: 145, column: 35, scope: !885)
!885 = !DILexicalBlockFile(scope: !872, file: !1, discriminator: 2)
!886 = !DILocation(line: 145, column: 5, scope: !885)
!887 = distinct !{!887, !888}
!888 = !DILocation(line: 145, column: 5, scope: !703)
!889 = !DILocation(line: 148, column: 2, scope: !703)
!890 = !DILocation(line: 149, column: 11, scope: !891)
!891 = distinct !DILexicalBlock(scope: !703, file: !1, line: 149, column: 2)
!892 = !DILocation(line: 149, column: 7, scope: !891)
!893 = !DILocation(line: 149, column: 15, scope: !894)
!894 = !DILexicalBlockFile(scope: !895, file: !1, discriminator: 1)
!895 = distinct !DILexicalBlock(scope: !891, file: !1, line: 149, column: 2)
!896 = !DILocation(line: 149, column: 21, scope: !894)
!897 = !DILocation(line: 149, column: 19, scope: !894)
!898 = !DILocation(line: 149, column: 2, scope: !894)
!899 = !DILocation(line: 150, column: 6, scope: !900)
!900 = distinct !DILexicalBlock(scope: !895, file: !1, line: 149, column: 35)
!901 = !DILocation(line: 150, column: 14, scope: !900)
!902 = !DILocalVariable(name: "i", scope: !903, file: !1, line: 151, type: !82)
!903 = distinct !DILexicalBlock(scope: !900, file: !1, line: 151, column: 9)
!904 = !DILocation(line: 151, column: 18, scope: !903)
!905 = !DILocation(line: 151, column: 20, scope: !903)
!906 = !DILocation(line: 151, column: 14, scope: !903)
!907 = !DILocation(line: 151, column: 24, scope: !908)
!908 = !DILexicalBlockFile(scope: !909, file: !1, discriminator: 1)
!909 = distinct !DILexicalBlock(scope: !903, file: !1, line: 151, column: 9)
!910 = !DILocation(line: 151, column: 27, scope: !908)
!911 = !DILocation(line: 151, column: 25, scope: !908)
!912 = !DILocation(line: 151, column: 9, scope: !908)
!913 = !DILocalVariable(name: "j", scope: !914, file: !1, line: 152, type: !82)
!914 = distinct !DILexicalBlock(scope: !915, file: !1, line: 152, column: 13)
!915 = distinct !DILexicalBlock(scope: !909, file: !1, line: 151, column: 36)
!916 = !DILocation(line: 152, column: 22, scope: !914)
!917 = !DILocation(line: 152, column: 24, scope: !914)
!918 = !DILocation(line: 152, column: 18, scope: !914)
!919 = !DILocation(line: 152, column: 28, scope: !920)
!920 = !DILexicalBlockFile(scope: !921, file: !1, discriminator: 1)
!921 = distinct !DILexicalBlock(scope: !914, file: !1, line: 152, column: 13)
!922 = !DILocation(line: 152, column: 31, scope: !920)
!923 = !DILocation(line: 152, column: 29, scope: !920)
!924 = !DILocation(line: 152, column: 13, scope: !920)
!925 = !DILocation(line: 153, column: 25, scope: !926)
!926 = distinct !DILexicalBlock(scope: !921, file: !1, line: 152, column: 40)
!927 = !DILocation(line: 153, column: 27, scope: !926)
!928 = !DILocation(line: 153, column: 31, scope: !926)
!929 = !DILocation(line: 153, column: 29, scope: !926)
!930 = !DILocation(line: 153, column: 38, scope: !926)
!931 = !DILocation(line: 153, column: 36, scope: !926)
!932 = !DILocation(line: 153, column: 23, scope: !926)
!933 = !DILocation(line: 154, column: 25, scope: !926)
!934 = !DILocation(line: 154, column: 22, scope: !926)
!935 = !DILocation(line: 155, column: 25, scope: !926)
!936 = !DILocation(line: 155, column: 29, scope: !926)
!937 = !DILocation(line: 155, column: 28, scope: !926)
!938 = !DILocation(line: 155, column: 22, scope: !926)
!939 = !DILocation(line: 156, column: 13, scope: !926)
!940 = !DILocation(line: 152, column: 36, scope: !941)
!941 = !DILexicalBlockFile(scope: !921, file: !1, discriminator: 2)
!942 = !DILocation(line: 152, column: 13, scope: !941)
!943 = distinct !{!943, !944}
!944 = !DILocation(line: 152, column: 13, scope: !915)
!945 = !DILocation(line: 157, column: 9, scope: !915)
!946 = !DILocation(line: 151, column: 32, scope: !947)
!947 = !DILexicalBlockFile(scope: !909, file: !1, discriminator: 2)
!948 = !DILocation(line: 151, column: 9, scope: !947)
!949 = distinct !{!949, !950}
!950 = !DILocation(line: 151, column: 9, scope: !900)
!951 = !DILocation(line: 158, column: 19, scope: !900)
!952 = !DILocation(line: 158, column: 25, scope: !900)
!953 = !DILocation(line: 158, column: 23, scope: !900)
!954 = !DILocation(line: 158, column: 17, scope: !900)
!955 = !DILocation(line: 159, column: 20, scope: !900)
!956 = !DILocation(line: 159, column: 27, scope: !900)
!957 = !DILocation(line: 159, column: 25, scope: !900)
!958 = !DILocation(line: 159, column: 37, scope: !900)
!959 = !DILocation(line: 159, column: 45, scope: !900)
!960 = !DILocation(line: 159, column: 44, scope: !900)
!961 = !DILocation(line: 159, column: 35, scope: !900)
!962 = !DILocation(line: 159, column: 17, scope: !900)
!963 = !DILocation(line: 160, column: 19, scope: !900)
!964 = !DILocation(line: 160, column: 29, scope: !900)
!965 = !DILocation(line: 160, column: 37, scope: !900)
!966 = !DILocation(line: 160, column: 36, scope: !900)
!967 = !DILocation(line: 160, column: 26, scope: !900)
!968 = !DILocation(line: 160, column: 17, scope: !900)
!969 = !DILocalVariable(name: "block_x", scope: !900, file: !1, line: 220, type: !82)
!970 = !DILocation(line: 220, column: 6, scope: !900)
!971 = !DILocation(line: 220, column: 16, scope: !900)
!972 = !DILocation(line: 220, column: 20, scope: !900)
!973 = !DILocalVariable(name: "block_y", scope: !900, file: !1, line: 221, type: !82)
!974 = !DILocation(line: 221, column: 9, scope: !900)
!975 = !DILocation(line: 221, column: 19, scope: !900)
!976 = !DILocation(line: 221, column: 23, scope: !900)
!977 = !DILocalVariable(name: "dimBlock", scope: !900, file: !1, line: 223, type: !978)
!978 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !979, line: 427, baseType: !980)
!979 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/srad/srad_v2")
!980 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !979, line: 417, size: 96, align: 32, elements: !981, identifier: "_ZTS4dim3")
!981 = !{!982, !983, !984, !985, !989, !998}
!982 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !980, file: !979, line: 419, baseType: !375, size: 32, align: 32)
!983 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !980, file: !979, line: 419, baseType: !375, size: 32, align: 32, offset: 32)
!984 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !980, file: !979, line: 419, baseType: !375, size: 32, align: 32, offset: 64)
!985 = !DISubprogram(name: "dim3", scope: !980, file: !979, line: 421, type: !986, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!986 = !DISubroutineType(types: !987)
!987 = !{null, !988, !375, !375, !375}
!988 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !980, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!989 = !DISubprogram(name: "dim3", scope: !980, file: !979, line: 422, type: !990, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!990 = !DISubroutineType(types: !991)
!991 = !{null, !988, !992}
!992 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !979, line: 383, baseType: !993)
!993 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !979, line: 190, size: 96, align: 32, elements: !994, identifier: "_ZTS5uint3")
!994 = !{!995, !996, !997}
!995 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !993, file: !979, line: 192, baseType: !375, size: 32, align: 32)
!996 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !993, file: !979, line: 192, baseType: !375, size: 32, align: 32, offset: 32)
!997 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !993, file: !979, line: 192, baseType: !375, size: 32, align: 32, offset: 64)
!998 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !980, file: !979, line: 423, type: !999, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!999 = !DISubroutineType(types: !1000)
!1000 = !{!992, !988}
!1001 = !DILocation(line: 223, column: 10, scope: !900)
!1002 = !DILocalVariable(name: "dimGrid", scope: !900, file: !1, line: 224, type: !978)
!1003 = !DILocation(line: 224, column: 7, scope: !900)
!1004 = !DILocation(line: 224, column: 15, scope: !900)
!1005 = !DILocation(line: 224, column: 25, scope: !900)
!1006 = !DILocation(line: 228, column: 13, scope: !900)
!1007 = !DILocation(line: 228, column: 21, scope: !900)
!1008 = !DILocation(line: 228, column: 40, scope: !900)
!1009 = !DILocation(line: 228, column: 38, scope: !900)
!1010 = !DILocation(line: 228, column: 2, scope: !900)
!1011 = !DILocation(line: 231, column: 16, scope: !900)
!1012 = !DILocation(line: 231, column: 25, scope: !900)
!1013 = !DILocation(line: 231, column: 13, scope: !900)
!1014 = !DILocation(line: 231, column: 2, scope: !900)
!1015 = !DILocation(line: 231, column: 37, scope: !1016)
!1016 = !DILexicalBlockFile(scope: !900, file: !1, discriminator: 1)
!1017 = !DILocation(line: 231, column: 42, scope: !1016)
!1018 = !DILocation(line: 231, column: 47, scope: !1016)
!1019 = !DILocation(line: 231, column: 52, scope: !1016)
!1020 = !DILocation(line: 231, column: 57, scope: !1016)
!1021 = !DILocation(line: 231, column: 65, scope: !1016)
!1022 = !DILocation(line: 231, column: 73, scope: !1016)
!1023 = !DILocation(line: 231, column: 79, scope: !1016)
!1024 = !DILocation(line: 231, column: 85, scope: !1016)
!1025 = !DILocation(line: 231, column: 2, scope: !1016)
!1026 = !DILocation(line: 232, column: 16, scope: !900)
!1027 = !DILocation(line: 232, column: 25, scope: !900)
!1028 = !DILocation(line: 232, column: 13, scope: !900)
!1029 = !DILocation(line: 232, column: 2, scope: !900)
!1030 = !DILocation(line: 232, column: 37, scope: !1016)
!1031 = !DILocation(line: 232, column: 42, scope: !1016)
!1032 = !DILocation(line: 232, column: 47, scope: !1016)
!1033 = !DILocation(line: 232, column: 52, scope: !1016)
!1034 = !DILocation(line: 232, column: 57, scope: !1016)
!1035 = !DILocation(line: 232, column: 65, scope: !1016)
!1036 = !DILocation(line: 232, column: 73, scope: !1016)
!1037 = !DILocation(line: 232, column: 79, scope: !1016)
!1038 = !DILocation(line: 232, column: 85, scope: !1016)
!1039 = !DILocation(line: 232, column: 93, scope: !1016)
!1040 = !DILocation(line: 232, column: 2, scope: !1016)
!1041 = !DILocation(line: 235, column: 16, scope: !900)
!1042 = !DILocation(line: 235, column: 19, scope: !900)
!1043 = !DILocation(line: 235, column: 43, scope: !900)
!1044 = !DILocation(line: 235, column: 41, scope: !900)
!1045 = !DILocation(line: 235, column: 5, scope: !900)
!1046 = !DILocation(line: 238, column: 1, scope: !900)
!1047 = !DILocation(line: 149, column: 32, scope: !1048)
!1048 = !DILexicalBlockFile(scope: !895, file: !1, discriminator: 2)
!1049 = !DILocation(line: 149, column: 2, scope: !1048)
!1050 = distinct !{!1050, !1051}
!1051 = !DILocation(line: 149, column: 2, scope: !703)
!1052 = !DILocation(line: 240, column: 5, scope: !703)
!1053 = !DILocation(line: 253, column: 2, scope: !703)
!1054 = !DILocation(line: 255, column: 7, scope: !703)
!1055 = !DILocation(line: 255, column: 2, scope: !703)
!1056 = !DILocation(line: 256, column: 7, scope: !703)
!1057 = !DILocation(line: 256, column: 2, scope: !703)
!1058 = !DILocation(line: 262, column: 14, scope: !703)
!1059 = !DILocation(line: 262, column: 5, scope: !703)
!1060 = !DILocation(line: 263, column: 11, scope: !703)
!1061 = !DILocation(line: 263, column: 2, scope: !703)
!1062 = !DILocation(line: 264, column: 11, scope: !703)
!1063 = !DILocation(line: 264, column: 2, scope: !703)
!1064 = !DILocation(line: 265, column: 11, scope: !703)
!1065 = !DILocation(line: 265, column: 2, scope: !703)
!1066 = !DILocation(line: 266, column: 11, scope: !703)
!1067 = !DILocation(line: 266, column: 2, scope: !703)
!1068 = !DILocation(line: 267, column: 11, scope: !703)
!1069 = !DILocation(line: 267, column: 2, scope: !703)
!1070 = !DILocation(line: 269, column: 7, scope: !703)
!1071 = !DILocation(line: 269, column: 2, scope: !703)
!1072 = !DILocation(line: 271, column: 1, scope: !703)
!1073 = distinct !DISubprogram(name: "random_matrix", linkageName: "_Z13random_matrixPfii", scope: !1, file: !1, line: 274, type: !1074, isLocal: false, isDefinition: true, scopeLine: 274, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !578)
!1074 = !DISubroutineType(types: !1075)
!1075 = !{null, !12, !82, !82}
!1076 = !DILocalVariable(name: "I", arg: 1, scope: !1073, file: !1, line: 274, type: !12)
!1077 = !DILocation(line: 274, column: 27, scope: !1073)
!1078 = !DILocalVariable(name: "rows", arg: 2, scope: !1073, file: !1, line: 274, type: !82)
!1079 = !DILocation(line: 274, column: 34, scope: !1073)
!1080 = !DILocalVariable(name: "cols", arg: 3, scope: !1073, file: !1, line: 274, type: !82)
!1081 = !DILocation(line: 274, column: 44, scope: !1073)
!1082 = !DILocation(line: 276, column: 2, scope: !1073)
!1083 = !DILocalVariable(name: "i", scope: !1084, file: !1, line: 278, type: !82)
!1084 = distinct !DILexicalBlock(scope: !1073, file: !1, line: 278, column: 2)
!1085 = !DILocation(line: 278, column: 11, scope: !1084)
!1086 = !DILocation(line: 278, column: 7, scope: !1084)
!1087 = !DILocation(line: 278, column: 19, scope: !1088)
!1088 = !DILexicalBlockFile(scope: !1089, file: !1, discriminator: 1)
!1089 = distinct !DILexicalBlock(scope: !1084, file: !1, line: 278, column: 2)
!1090 = !DILocation(line: 278, column: 23, scope: !1088)
!1091 = !DILocation(line: 278, column: 21, scope: !1088)
!1092 = !DILocation(line: 278, column: 2, scope: !1088)
!1093 = !DILocalVariable(name: "j", scope: !1094, file: !1, line: 279, type: !82)
!1094 = distinct !DILexicalBlock(scope: !1095, file: !1, line: 279, column: 3)
!1095 = distinct !DILexicalBlock(scope: !1089, file: !1, line: 278, column: 34)
!1096 = !DILocation(line: 279, column: 13, scope: !1094)
!1097 = !DILocation(line: 279, column: 9, scope: !1094)
!1098 = !DILocation(line: 279, column: 21, scope: !1099)
!1099 = !DILexicalBlockFile(scope: !1100, file: !1, discriminator: 1)
!1100 = distinct !DILexicalBlock(scope: !1094, file: !1, line: 279, column: 3)
!1101 = !DILocation(line: 279, column: 25, scope: !1099)
!1102 = !DILocation(line: 279, column: 23, scope: !1099)
!1103 = !DILocation(line: 279, column: 3, scope: !1099)
!1104 = !DILocation(line: 280, column: 22, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1100, file: !1, line: 279, column: 36)
!1106 = !DILocation(line: 280, column: 28, scope: !1105)
!1107 = !DILocation(line: 280, column: 4, scope: !1105)
!1108 = !DILocation(line: 280, column: 6, scope: !1105)
!1109 = !DILocation(line: 280, column: 10, scope: !1105)
!1110 = !DILocation(line: 280, column: 8, scope: !1105)
!1111 = !DILocation(line: 280, column: 17, scope: !1105)
!1112 = !DILocation(line: 280, column: 15, scope: !1105)
!1113 = !DILocation(line: 280, column: 20, scope: !1105)
!1114 = !DILocation(line: 281, column: 3, scope: !1105)
!1115 = !DILocation(line: 279, column: 33, scope: !1116)
!1116 = !DILexicalBlockFile(scope: !1100, file: !1, discriminator: 2)
!1117 = !DILocation(line: 279, column: 3, scope: !1116)
!1118 = distinct !{!1118, !1119}
!1119 = !DILocation(line: 279, column: 3, scope: !1095)
!1120 = !DILocation(line: 282, column: 2, scope: !1095)
!1121 = !DILocation(line: 278, column: 31, scope: !1122)
!1122 = !DILexicalBlockFile(scope: !1089, file: !1, discriminator: 2)
!1123 = !DILocation(line: 278, column: 2, scope: !1122)
!1124 = distinct !{!1124, !1125}
!1125 = !DILocation(line: 278, column: 2, scope: !1073)
!1126 = !DILocation(line: 284, column: 1, scope: !1073)
!1127 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !980, file: !979, line: 421, type: !986, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !985, variables: !578)
!1128 = !DILocalVariable(name: "this", arg: 1, scope: !1127, type: !1129, flags: DIFlagArtificial | DIFlagObjectPointer)
!1129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !980, size: 64, align: 64)
!1130 = !DILocation(line: 0, scope: !1127)
!1131 = !DILocalVariable(name: "vx", arg: 2, scope: !1127, file: !979, line: 421, type: !375)
!1132 = !DILocation(line: 421, column: 43, scope: !1127)
!1133 = !DILocalVariable(name: "vy", arg: 3, scope: !1127, file: !979, line: 421, type: !375)
!1134 = !DILocation(line: 421, column: 64, scope: !1127)
!1135 = !DILocalVariable(name: "vz", arg: 4, scope: !1127, file: !979, line: 421, type: !375)
!1136 = !DILocation(line: 421, column: 85, scope: !1127)
!1137 = !DILocation(line: 421, column: 95, scope: !1127)
!1138 = !DILocation(line: 421, column: 97, scope: !1127)
!1139 = !DILocation(line: 421, column: 102, scope: !1127)
!1140 = !DILocation(line: 421, column: 104, scope: !1127)
!1141 = !DILocation(line: 421, column: 109, scope: !1127)
!1142 = !DILocation(line: 421, column: 111, scope: !1127)
!1143 = !DILocation(line: 421, column: 116, scope: !1127)
