; ModuleID = './kernel/kernel_gpu_cuda_wrapper_2.cu'
source_filename = "./kernel/kernel_gpu_cuda_wrapper_2.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.knode = type { i32, [257 x i32], [257 x i32], i8, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@.str = private unnamed_addr constant [75 x i8] c"# of blocks = %d, # of threads/block = %d (ensure that device can handle)\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"cudaMalloc  recordsD\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"cudaMalloc  currKnodeD\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"cudaMalloc  offsetD\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"cudaMalloc  lastKnodeD\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"cudaMalloc  offset_2D\00", align 1
@.str.6 = private unnamed_addr constant [18 x i8] c"cudaMalloc startD\00", align 1
@.str.7 = private unnamed_addr constant [16 x i8] c"cudaMalloc endD\00", align 1
@.str.8 = private unnamed_addr constant [21 x i8] c"cudaMalloc ansDStart\00", align 1
@.str.9 = private unnamed_addr constant [22 x i8] c"cudaMalloc ansDLength\00", align 1
@.str.10 = private unnamed_addr constant [27 x i8] c"cudaMalloc cudaMemcpy memD\00", align 1
@.str.11 = private unnamed_addr constant [33 x i8] c"cudaMalloc cudaMemcpy currKnodeD\00", align 1
@.str.12 = private unnamed_addr constant [30 x i8] c"cudaMalloc cudaMemcpy offsetD\00", align 1
@.str.13 = private unnamed_addr constant [33 x i8] c"cudaMalloc cudaMemcpy lastKnodeD\00", align 1
@.str.14 = private unnamed_addr constant [32 x i8] c"cudaMalloc cudaMemcpy offset_2D\00", align 1
@.str.15 = private unnamed_addr constant [18 x i8] c"cudaMemcpy startD\00", align 1
@.str.16 = private unnamed_addr constant [16 x i8] c"cudaMemcpy endD\00", align 1
@.str.17 = private unnamed_addr constant [21 x i8] c"cudaMemcpy ansDStart\00", align 1
@.str.18 = private unnamed_addr constant [22 x i8] c"cudaMemcpy ansDLength\00", align 1
@.str.19 = private unnamed_addr constant [11 x i8] c"findRangeK\00", align 1
@.str.20 = private unnamed_addr constant [52 x i8] c"Time spent in different stages of GPU_CUDA KERNEL:\0A\00", align 1
@.str.21 = private unnamed_addr constant [54 x i8] c"%15.12f s, %15.12f % : GPU: SET DEVICE / DRIVER INIT\0A\00", align 1
@.str.22 = private unnamed_addr constant [37 x i8] c"%15.12f s, %15.12f % : GPU MEM: ALO\0A\00", align 1
@.str.23 = private unnamed_addr constant [41 x i8] c"%15.12f s, %15.12f % : GPU MEM: COPY IN\0A\00", align 1
@.str.24 = private unnamed_addr constant [36 x i8] c"%15.12f s, %15.12f % : GPU: KERNEL\0A\00", align 1
@.str.25 = private unnamed_addr constant [42 x i8] c"%15.12f s, %15.12f % : GPU MEM: COPY OUT\0A\00", align 1
@.str.26 = private unnamed_addr constant [37 x i8] c"%15.12f s, %15.12f % : GPU MEM: FRE\0A\00", align 1
@.str.27 = private unnamed_addr constant [13 x i8] c"Total time:\0A\00", align 1
@.str.28 = private unnamed_addr constant [9 x i8] c"%.12f s\0A\00", align 1

; Function Attrs: uwtable
define void @findRangeK(i64 %height, %struct.knode* %knodesD, i64 %knodes_elem, i64* %currKnodeD, i64* %offsetD, i64* %lastKnodeD, i64* %offset_2D, i32* %startD, i32* %endD, i32* %RecstartD, i32* %ReclenD) #0 !dbg !574 {
entry:
  %height.addr = alloca i64, align 8
  %knodesD.addr = alloca %struct.knode*, align 8
  %knodes_elem.addr = alloca i64, align 8
  %currKnodeD.addr = alloca i64*, align 8
  %offsetD.addr = alloca i64*, align 8
  %lastKnodeD.addr = alloca i64*, align 8
  %offset_2D.addr = alloca i64*, align 8
  %startD.addr = alloca i32*, align 8
  %endD.addr = alloca i32*, align 8
  %RecstartD.addr = alloca i32*, align 8
  %ReclenD.addr = alloca i32*, align 8
  store i64 %height, i64* %height.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %height.addr, metadata !593, metadata !594), !dbg !595
  store %struct.knode* %knodesD, %struct.knode** %knodesD.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.knode** %knodesD.addr, metadata !596, metadata !594), !dbg !597
  store i64 %knodes_elem, i64* %knodes_elem.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %knodes_elem.addr, metadata !598, metadata !594), !dbg !599
  store i64* %currKnodeD, i64** %currKnodeD.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %currKnodeD.addr, metadata !600, metadata !594), !dbg !601
  store i64* %offsetD, i64** %offsetD.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %offsetD.addr, metadata !602, metadata !594), !dbg !603
  store i64* %lastKnodeD, i64** %lastKnodeD.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %lastKnodeD.addr, metadata !604, metadata !594), !dbg !605
  store i64* %offset_2D, i64** %offset_2D.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %offset_2D.addr, metadata !606, metadata !594), !dbg !607
  store i32* %startD, i32** %startD.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %startD.addr, metadata !608, metadata !594), !dbg !609
  store i32* %endD, i32** %endD.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %endD.addr, metadata !610, metadata !594), !dbg !611
  store i32* %RecstartD, i32** %RecstartD.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %RecstartD.addr, metadata !612, metadata !594), !dbg !613
  store i32* %ReclenD, i32** %ReclenD.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %ReclenD.addr, metadata !614, metadata !594), !dbg !615
  %0 = bitcast i64* %height.addr to i8*, !dbg !616
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !616
  %2 = icmp eq i32 %1, 0, !dbg !616
  br i1 %2, label %setup.next, label %setup.end, !dbg !616

setup.next:                                       ; preds = %entry
  %3 = bitcast %struct.knode** %knodesD.addr to i8*, !dbg !617
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !617
  %5 = icmp eq i32 %4, 0, !dbg !617
  br i1 %5, label %setup.next1, label %setup.end, !dbg !617

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i64* %knodes_elem.addr to i8*, !dbg !619
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !619
  %8 = icmp eq i32 %7, 0, !dbg !619
  br i1 %8, label %setup.next2, label %setup.end, !dbg !619

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i64** %currKnodeD.addr to i8*, !dbg !621
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !621
  %11 = icmp eq i32 %10, 0, !dbg !621
  br i1 %11, label %setup.next3, label %setup.end, !dbg !621

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i64** %offsetD.addr to i8*, !dbg !623
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !623
  %14 = icmp eq i32 %13, 0, !dbg !623
  br i1 %14, label %setup.next4, label %setup.end, !dbg !623

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i64** %lastKnodeD.addr to i8*, !dbg !625
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !625
  %17 = icmp eq i32 %16, 0, !dbg !625
  br i1 %17, label %setup.next5, label %setup.end, !dbg !625

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i64** %offset_2D.addr to i8*, !dbg !627
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 48), !dbg !627
  %20 = icmp eq i32 %19, 0, !dbg !627
  br i1 %20, label %setup.next6, label %setup.end, !dbg !627

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32** %startD.addr to i8*, !dbg !629
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 8, i64 56), !dbg !629
  %23 = icmp eq i32 %22, 0, !dbg !629
  br i1 %23, label %setup.next7, label %setup.end, !dbg !629

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast i32** %endD.addr to i8*, !dbg !631
  %25 = call i32 @cudaSetupArgument(i8* %24, i64 8, i64 64), !dbg !631
  %26 = icmp eq i32 %25, 0, !dbg !631
  br i1 %26, label %setup.next8, label %setup.end, !dbg !631

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast i32** %RecstartD.addr to i8*, !dbg !633
  %28 = call i32 @cudaSetupArgument(i8* %27, i64 8, i64 72), !dbg !633
  %29 = icmp eq i32 %28, 0, !dbg !633
  br i1 %29, label %setup.next9, label %setup.end, !dbg !633

setup.next9:                                      ; preds = %setup.next8
  %30 = bitcast i32** %ReclenD.addr to i8*, !dbg !635
  %31 = call i32 @cudaSetupArgument(i8* %30, i64 8, i64 80), !dbg !635
  %32 = icmp eq i32 %31, 0, !dbg !635
  br i1 %32, label %setup.next10, label %setup.end, !dbg !635

setup.next10:                                     ; preds = %setup.next9
  %33 = call i32 @cudaLaunch(i8* bitcast (void (i64, %struct.knode*, i64, i64*, i64*, i64*, i64*, i32*, i32*, i32*, i32*)* @findRangeK to i8*)), !dbg !637
  br label %setup.end, !dbg !637

setup.end:                                        ; preds = %setup.next10, %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !639
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @kernel_gpu_cuda_wrapper_2(%struct.knode* %knodes, i64 %knodes_elem, i64 %knodes_mem, i32 %order, i64 %maxheight, i32 %count, i64* %currKnode, i64* %offset, i64* %lastKnode, i64* %offset_2, i32* %start, i32* %end, i32* %recstart, i32* %reclength) #0 !dbg !640 {
entry:
  %knodes.addr = alloca %struct.knode*, align 8
  %knodes_elem.addr = alloca i64, align 8
  %knodes_mem.addr = alloca i64, align 8
  %order.addr = alloca i32, align 4
  %maxheight.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  %currKnode.addr = alloca i64*, align 8
  %offset.addr = alloca i64*, align 8
  %lastKnode.addr = alloca i64*, align 8
  %offset_2.addr = alloca i64*, align 8
  %start.addr = alloca i32*, align 8
  %end.addr = alloca i32*, align 8
  %recstart.addr = alloca i32*, align 8
  %reclength.addr = alloca i32*, align 8
  %time0 = alloca i64, align 8
  %time1 = alloca i64, align 8
  %time2 = alloca i64, align 8
  %time3 = alloca i64, align 8
  %time4 = alloca i64, align 8
  %time5 = alloca i64, align 8
  %time6 = alloca i64, align 8
  %numBlocks = alloca i32, align 4
  %threadsPerBlock = alloca i32, align 4
  %knodesD = alloca %struct.knode*, align 8
  %currKnodeD = alloca i64*, align 8
  %offsetD = alloca i64*, align 8
  %lastKnodeD = alloca i64*, align 8
  %offset_2D = alloca i64*, align 8
  %startD = alloca i32*, align 8
  %endD = alloca i32*, align 8
  %ansDStart = alloca i32*, align 8
  %ansDLength = alloca i32*, align 8
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp54 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp54.coerce = alloca { i64, i32 }, align 4
  store %struct.knode* %knodes, %struct.knode** %knodes.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.knode** %knodes.addr, metadata !643, metadata !594), !dbg !644
  store i64 %knodes_elem, i64* %knodes_elem.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %knodes_elem.addr, metadata !645, metadata !594), !dbg !646
  store i64 %knodes_mem, i64* %knodes_mem.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %knodes_mem.addr, metadata !647, metadata !594), !dbg !648
  store i32 %order, i32* %order.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %order.addr, metadata !649, metadata !594), !dbg !650
  store i64 %maxheight, i64* %maxheight.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %maxheight.addr, metadata !651, metadata !594), !dbg !652
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !653, metadata !594), !dbg !654
  store i64* %currKnode, i64** %currKnode.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %currKnode.addr, metadata !655, metadata !594), !dbg !656
  store i64* %offset, i64** %offset.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %offset.addr, metadata !657, metadata !594), !dbg !658
  store i64* %lastKnode, i64** %lastKnode.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %lastKnode.addr, metadata !659, metadata !594), !dbg !660
  store i64* %offset_2, i64** %offset_2.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %offset_2.addr, metadata !661, metadata !594), !dbg !662
  store i32* %start, i32** %start.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %start.addr, metadata !663, metadata !594), !dbg !664
  store i32* %end, i32** %end.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %end.addr, metadata !665, metadata !594), !dbg !666
  store i32* %recstart, i32** %recstart.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %recstart.addr, metadata !667, metadata !594), !dbg !668
  store i32* %reclength, i32** %reclength.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %reclength.addr, metadata !669, metadata !594), !dbg !670
  call void @llvm.dbg.declare(metadata i64* %time0, metadata !671, metadata !594), !dbg !672
  call void @llvm.dbg.declare(metadata i64* %time1, metadata !673, metadata !594), !dbg !674
  call void @llvm.dbg.declare(metadata i64* %time2, metadata !675, metadata !594), !dbg !676
  call void @llvm.dbg.declare(metadata i64* %time3, metadata !677, metadata !594), !dbg !678
  call void @llvm.dbg.declare(metadata i64* %time4, metadata !679, metadata !594), !dbg !680
  call void @llvm.dbg.declare(metadata i64* %time5, metadata !681, metadata !594), !dbg !682
  call void @llvm.dbg.declare(metadata i64* %time6, metadata !683, metadata !594), !dbg !684
  %call = call i64 @get_time(), !dbg !685
  store i64 %call, i64* %time0, align 8, !dbg !686
  %call1 = call i32 @cudaThreadSynchronize(), !dbg !687
  call void @llvm.dbg.declare(metadata i32* %numBlocks, metadata !688, metadata !594), !dbg !689
  %0 = load i32, i32* %count.addr, align 4, !dbg !690
  store i32 %0, i32* %numBlocks, align 4, !dbg !691
  call void @llvm.dbg.declare(metadata i32* %threadsPerBlock, metadata !692, metadata !594), !dbg !693
  %1 = load i32, i32* %order.addr, align 4, !dbg !694
  %cmp = icmp slt i32 %1, 1024, !dbg !695
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !694

cond.true:                                        ; preds = %entry
  %2 = load i32, i32* %order.addr, align 4, !dbg !696
  br label %cond.end, !dbg !698

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !699

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ 1024, %cond.false ], !dbg !701
  store i32 %cond, i32* %threadsPerBlock, align 4, !dbg !703
  %3 = load i32, i32* %numBlocks, align 4, !dbg !704
  %4 = load i32, i32* %threadsPerBlock, align 4, !dbg !705
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i32 0, i32 0), i32 %3, i32 %4), !dbg !706
  %call3 = call i64 @get_time(), !dbg !707
  store i64 %call3, i64* %time1, align 8, !dbg !708
  call void @llvm.dbg.declare(metadata %struct.knode** %knodesD, metadata !709, metadata !594), !dbg !710
  %5 = bitcast %struct.knode** %knodesD to i8**, !dbg !711
  %6 = load i64, i64* %knodes_mem.addr, align 8, !dbg !712
  %call4 = call i32 @cudaMalloc(i8** %5, i64 %6), !dbg !713
  call void @checkCUDAError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0)), !dbg !714
  call void @llvm.dbg.declare(metadata i64** %currKnodeD, metadata !715, metadata !594), !dbg !716
  %7 = bitcast i64** %currKnodeD to i8**, !dbg !717
  %8 = load i32, i32* %count.addr, align 4, !dbg !718
  %conv = sext i32 %8 to i64, !dbg !718
  %mul = mul i64 %conv, 8, !dbg !719
  %call5 = call i32 @cudaMalloc(i8** %7, i64 %mul), !dbg !720
  call void @checkCUDAError(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i32 0, i32 0)), !dbg !721
  call void @llvm.dbg.declare(metadata i64** %offsetD, metadata !722, metadata !594), !dbg !723
  %9 = bitcast i64** %offsetD to i8**, !dbg !724
  %10 = load i32, i32* %count.addr, align 4, !dbg !725
  %conv6 = sext i32 %10 to i64, !dbg !725
  %mul7 = mul i64 %conv6, 8, !dbg !726
  %call8 = call i32 @cudaMalloc(i8** %9, i64 %mul7), !dbg !727
  call void @checkCUDAError(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i32 0, i32 0)), !dbg !728
  call void @llvm.dbg.declare(metadata i64** %lastKnodeD, metadata !729, metadata !594), !dbg !730
  %11 = bitcast i64** %lastKnodeD to i8**, !dbg !731
  %12 = load i32, i32* %count.addr, align 4, !dbg !732
  %conv9 = sext i32 %12 to i64, !dbg !732
  %mul10 = mul i64 %conv9, 8, !dbg !733
  %call11 = call i32 @cudaMalloc(i8** %11, i64 %mul10), !dbg !734
  call void @checkCUDAError(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0)), !dbg !735
  call void @llvm.dbg.declare(metadata i64** %offset_2D, metadata !736, metadata !594), !dbg !737
  %13 = bitcast i64** %offset_2D to i8**, !dbg !738
  %14 = load i32, i32* %count.addr, align 4, !dbg !739
  %conv12 = sext i32 %14 to i64, !dbg !739
  %mul13 = mul i64 %conv12, 8, !dbg !740
  %call14 = call i32 @cudaMalloc(i8** %13, i64 %mul13), !dbg !741
  call void @checkCUDAError(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i32 0, i32 0)), !dbg !742
  call void @llvm.dbg.declare(metadata i32** %startD, metadata !743, metadata !594), !dbg !744
  %15 = bitcast i32** %startD to i8**, !dbg !745
  %16 = load i32, i32* %count.addr, align 4, !dbg !746
  %conv15 = sext i32 %16 to i64, !dbg !746
  %mul16 = mul i64 %conv15, 4, !dbg !747
  %call17 = call i32 @cudaMalloc(i8** %15, i64 %mul16), !dbg !748
  call void @checkCUDAError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.6, i32 0, i32 0)), !dbg !749
  call void @llvm.dbg.declare(metadata i32** %endD, metadata !750, metadata !594), !dbg !751
  %17 = bitcast i32** %endD to i8**, !dbg !752
  %18 = load i32, i32* %count.addr, align 4, !dbg !753
  %conv18 = sext i32 %18 to i64, !dbg !753
  %mul19 = mul i64 %conv18, 4, !dbg !754
  %call20 = call i32 @cudaMalloc(i8** %17, i64 %mul19), !dbg !755
  call void @checkCUDAError(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.7, i32 0, i32 0)), !dbg !756
  call void @llvm.dbg.declare(metadata i32** %ansDStart, metadata !757, metadata !594), !dbg !758
  %19 = bitcast i32** %ansDStart to i8**, !dbg !759
  %20 = load i32, i32* %count.addr, align 4, !dbg !760
  %conv21 = sext i32 %20 to i64, !dbg !760
  %mul22 = mul i64 %conv21, 4, !dbg !761
  %call23 = call i32 @cudaMalloc(i8** %19, i64 %mul22), !dbg !762
  call void @checkCUDAError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.8, i32 0, i32 0)), !dbg !763
  call void @llvm.dbg.declare(metadata i32** %ansDLength, metadata !764, metadata !594), !dbg !765
  %21 = bitcast i32** %ansDLength to i8**, !dbg !766
  %22 = load i32, i32* %count.addr, align 4, !dbg !767
  %conv24 = sext i32 %22 to i64, !dbg !767
  %mul25 = mul i64 %conv24, 4, !dbg !768
  %call26 = call i32 @cudaMalloc(i8** %21, i64 %mul25), !dbg !769
  call void @checkCUDAError(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.9, i32 0, i32 0)), !dbg !770
  %call27 = call i64 @get_time(), !dbg !771
  store i64 %call27, i64* %time2, align 8, !dbg !772
  %23 = load %struct.knode*, %struct.knode** %knodesD, align 8, !dbg !773
  %24 = bitcast %struct.knode* %23 to i8*, !dbg !773
  %25 = load %struct.knode*, %struct.knode** %knodes.addr, align 8, !dbg !774
  %26 = bitcast %struct.knode* %25 to i8*, !dbg !774
  %27 = load i64, i64* %knodes_mem.addr, align 8, !dbg !775
  %call28 = call i32 @cudaMemcpy(i8* %24, i8* %26, i64 %27, i32 1), !dbg !776
  call void @checkCUDAError(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.10, i32 0, i32 0)), !dbg !777
  %28 = load i64*, i64** %currKnodeD, align 8, !dbg !778
  %29 = bitcast i64* %28 to i8*, !dbg !778
  %30 = load i64*, i64** %currKnode.addr, align 8, !dbg !779
  %31 = bitcast i64* %30 to i8*, !dbg !779
  %32 = load i32, i32* %count.addr, align 4, !dbg !780
  %conv29 = sext i32 %32 to i64, !dbg !780
  %mul30 = mul i64 %conv29, 8, !dbg !781
  %call31 = call i32 @cudaMemcpy(i8* %29, i8* %31, i64 %mul30, i32 1), !dbg !782
  call void @checkCUDAError(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.11, i32 0, i32 0)), !dbg !783
  %33 = load i64*, i64** %offsetD, align 8, !dbg !784
  %34 = bitcast i64* %33 to i8*, !dbg !784
  %35 = load i64*, i64** %offset.addr, align 8, !dbg !785
  %36 = bitcast i64* %35 to i8*, !dbg !785
  %37 = load i32, i32* %count.addr, align 4, !dbg !786
  %conv32 = sext i32 %37 to i64, !dbg !786
  %mul33 = mul i64 %conv32, 8, !dbg !787
  %call34 = call i32 @cudaMemcpy(i8* %34, i8* %36, i64 %mul33, i32 1), !dbg !788
  call void @checkCUDAError(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.12, i32 0, i32 0)), !dbg !789
  %38 = load i64*, i64** %lastKnodeD, align 8, !dbg !790
  %39 = bitcast i64* %38 to i8*, !dbg !790
  %40 = load i64*, i64** %lastKnode.addr, align 8, !dbg !791
  %41 = bitcast i64* %40 to i8*, !dbg !791
  %42 = load i32, i32* %count.addr, align 4, !dbg !792
  %conv35 = sext i32 %42 to i64, !dbg !792
  %mul36 = mul i64 %conv35, 8, !dbg !793
  %call37 = call i32 @cudaMemcpy(i8* %39, i8* %41, i64 %mul36, i32 1), !dbg !794
  call void @checkCUDAError(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.13, i32 0, i32 0)), !dbg !795
  %43 = load i64*, i64** %offset_2D, align 8, !dbg !796
  %44 = bitcast i64* %43 to i8*, !dbg !796
  %45 = load i64*, i64** %offset_2.addr, align 8, !dbg !797
  %46 = bitcast i64* %45 to i8*, !dbg !797
  %47 = load i32, i32* %count.addr, align 4, !dbg !798
  %conv38 = sext i32 %47 to i64, !dbg !798
  %mul39 = mul i64 %conv38, 8, !dbg !799
  %call40 = call i32 @cudaMemcpy(i8* %44, i8* %46, i64 %mul39, i32 1), !dbg !800
  call void @checkCUDAError(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.14, i32 0, i32 0)), !dbg !801
  %48 = load i32*, i32** %startD, align 8, !dbg !802
  %49 = bitcast i32* %48 to i8*, !dbg !802
  %50 = load i32*, i32** %start.addr, align 8, !dbg !803
  %51 = bitcast i32* %50 to i8*, !dbg !803
  %52 = load i32, i32* %count.addr, align 4, !dbg !804
  %conv41 = sext i32 %52 to i64, !dbg !804
  %mul42 = mul i64 %conv41, 4, !dbg !805
  %call43 = call i32 @cudaMemcpy(i8* %49, i8* %51, i64 %mul42, i32 1), !dbg !806
  call void @checkCUDAError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.15, i32 0, i32 0)), !dbg !807
  %53 = load i32*, i32** %endD, align 8, !dbg !808
  %54 = bitcast i32* %53 to i8*, !dbg !808
  %55 = load i32*, i32** %end.addr, align 8, !dbg !809
  %56 = bitcast i32* %55 to i8*, !dbg !809
  %57 = load i32, i32* %count.addr, align 4, !dbg !810
  %conv44 = sext i32 %57 to i64, !dbg !810
  %mul45 = mul i64 %conv44, 4, !dbg !811
  %call46 = call i32 @cudaMemcpy(i8* %54, i8* %56, i64 %mul45, i32 1), !dbg !812
  call void @checkCUDAError(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.16, i32 0, i32 0)), !dbg !813
  %58 = load i32*, i32** %ansDStart, align 8, !dbg !814
  %59 = bitcast i32* %58 to i8*, !dbg !814
  %60 = load i32*, i32** %recstart.addr, align 8, !dbg !815
  %61 = bitcast i32* %60 to i8*, !dbg !815
  %62 = load i32, i32* %count.addr, align 4, !dbg !816
  %conv47 = sext i32 %62 to i64, !dbg !816
  %mul48 = mul i64 %conv47, 4, !dbg !817
  %call49 = call i32 @cudaMemcpy(i8* %59, i8* %61, i64 %mul48, i32 1), !dbg !818
  call void @checkCUDAError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.17, i32 0, i32 0)), !dbg !819
  %63 = load i32*, i32** %ansDLength, align 8, !dbg !820
  %64 = bitcast i32* %63 to i8*, !dbg !820
  %65 = load i32*, i32** %reclength.addr, align 8, !dbg !821
  %66 = bitcast i32* %65 to i8*, !dbg !821
  %67 = load i32, i32* %count.addr, align 4, !dbg !822
  %conv50 = sext i32 %67 to i64, !dbg !822
  %mul51 = mul i64 %conv50, 4, !dbg !823
  %call52 = call i32 @cudaMemcpy(i8* %64, i8* %66, i64 %mul51, i32 1), !dbg !824
  call void @checkCUDAError(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.18, i32 0, i32 0)), !dbg !825
  %call53 = call i64 @get_time(), !dbg !826
  store i64 %call53, i64* %time3, align 8, !dbg !827
  %68 = load i32, i32* %numBlocks, align 4, !dbg !828
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 %68, i32 1, i32 1), !dbg !828
  %69 = load i32, i32* %threadsPerBlock, align 4, !dbg !829
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp54, i32 %69, i32 1, i32 1), !dbg !830
  %70 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !831
  %71 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !831
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %70, i8* %71, i64 12, i32 4, i1 false), !dbg !831
  %72 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !831
  %73 = load i64, i64* %72, align 4, !dbg !831
  %74 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !831
  %75 = load i32, i32* %74, align 4, !dbg !831
  %76 = bitcast { i64, i32 }* %agg.tmp54.coerce to i8*, !dbg !831
  %77 = bitcast %struct.dim3* %agg.tmp54 to i8*, !dbg !831
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %76, i8* %77, i64 12, i32 4, i1 false), !dbg !831
  %78 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp54.coerce, i32 0, i32 0, !dbg !831
  %79 = load i64, i64* %78, align 4, !dbg !831
  %80 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp54.coerce, i32 0, i32 1, !dbg !831
  %81 = load i32, i32* %80, align 4, !dbg !831
  %call55 = call i32 @cudaConfigureCall(i64 %73, i32 %75, i64 %79, i32 %81, i64 0, %struct.CUstream_st* null), !dbg !832
  %tobool = icmp ne i32 %call55, 0, !dbg !831
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !833

kcall.configok:                                   ; preds = %cond.end
  %82 = load i64, i64* %maxheight.addr, align 8, !dbg !834
  %83 = load %struct.knode*, %struct.knode** %knodesD, align 8, !dbg !835
  %84 = load i64, i64* %knodes_elem.addr, align 8, !dbg !836
  %85 = load i64*, i64** %currKnodeD, align 8, !dbg !837
  %86 = load i64*, i64** %offsetD, align 8, !dbg !838
  %87 = load i64*, i64** %lastKnodeD, align 8, !dbg !839
  %88 = load i64*, i64** %offset_2D, align 8, !dbg !840
  %89 = load i32*, i32** %startD, align 8, !dbg !841
  %90 = load i32*, i32** %endD, align 8, !dbg !842
  %91 = load i32*, i32** %ansDStart, align 8, !dbg !843
  %92 = load i32*, i32** %ansDLength, align 8, !dbg !844
  call void @findRangeK(i64 %82, %struct.knode* %83, i64 %84, i64* %85, i64* %86, i64* %87, i64* %88, i32* %89, i32* %90, i32* %91, i32* %92), !dbg !845
  br label %kcall.end, !dbg !845

kcall.end:                                        ; preds = %kcall.configok, %cond.end
  %call56 = call i32 @cudaThreadSynchronize(), !dbg !846
  call void @checkCUDAError(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.19, i32 0, i32 0)), !dbg !847
  %call57 = call i64 @get_time(), !dbg !848
  store i64 %call57, i64* %time4, align 8, !dbg !849
  %93 = load i32*, i32** %recstart.addr, align 8, !dbg !850
  %94 = bitcast i32* %93 to i8*, !dbg !850
  %95 = load i32*, i32** %ansDStart, align 8, !dbg !851
  %96 = bitcast i32* %95 to i8*, !dbg !851
  %97 = load i32, i32* %count.addr, align 4, !dbg !852
  %conv58 = sext i32 %97 to i64, !dbg !852
  %mul59 = mul i64 %conv58, 4, !dbg !853
  %call60 = call i32 @cudaMemcpy(i8* %94, i8* %96, i64 %mul59, i32 2), !dbg !854
  call void @checkCUDAError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.17, i32 0, i32 0)), !dbg !855
  %98 = load i32*, i32** %reclength.addr, align 8, !dbg !856
  %99 = bitcast i32* %98 to i8*, !dbg !856
  %100 = load i32*, i32** %ansDLength, align 8, !dbg !857
  %101 = bitcast i32* %100 to i8*, !dbg !857
  %102 = load i32, i32* %count.addr, align 4, !dbg !858
  %conv61 = sext i32 %102 to i64, !dbg !858
  %mul62 = mul i64 %conv61, 4, !dbg !859
  %call63 = call i32 @cudaMemcpy(i8* %99, i8* %101, i64 %mul62, i32 2), !dbg !860
  call void @checkCUDAError(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.18, i32 0, i32 0)), !dbg !861
  %call64 = call i64 @get_time(), !dbg !862
  store i64 %call64, i64* %time5, align 8, !dbg !863
  %103 = load %struct.knode*, %struct.knode** %knodesD, align 8, !dbg !864
  %104 = bitcast %struct.knode* %103 to i8*, !dbg !864
  %call65 = call i32 @cudaFree(i8* %104), !dbg !865
  %105 = load i64*, i64** %currKnodeD, align 8, !dbg !866
  %106 = bitcast i64* %105 to i8*, !dbg !866
  %call66 = call i32 @cudaFree(i8* %106), !dbg !867
  %107 = load i64*, i64** %offsetD, align 8, !dbg !868
  %108 = bitcast i64* %107 to i8*, !dbg !868
  %call67 = call i32 @cudaFree(i8* %108), !dbg !869
  %109 = load i64*, i64** %lastKnodeD, align 8, !dbg !870
  %110 = bitcast i64* %109 to i8*, !dbg !870
  %call68 = call i32 @cudaFree(i8* %110), !dbg !871
  %111 = load i64*, i64** %offset_2D, align 8, !dbg !872
  %112 = bitcast i64* %111 to i8*, !dbg !872
  %call69 = call i32 @cudaFree(i8* %112), !dbg !873
  %113 = load i32*, i32** %startD, align 8, !dbg !874
  %114 = bitcast i32* %113 to i8*, !dbg !874
  %call70 = call i32 @cudaFree(i8* %114), !dbg !875
  %115 = load i32*, i32** %endD, align 8, !dbg !876
  %116 = bitcast i32* %115 to i8*, !dbg !876
  %call71 = call i32 @cudaFree(i8* %116), !dbg !877
  %117 = load i32*, i32** %ansDStart, align 8, !dbg !878
  %118 = bitcast i32* %117 to i8*, !dbg !878
  %call72 = call i32 @cudaFree(i8* %118), !dbg !879
  %119 = load i32*, i32** %ansDLength, align 8, !dbg !880
  %120 = bitcast i32* %119 to i8*, !dbg !880
  %call73 = call i32 @cudaFree(i8* %120), !dbg !881
  %call74 = call i64 @get_time(), !dbg !882
  store i64 %call74, i64* %time6, align 8, !dbg !883
  %call75 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.20, i32 0, i32 0)), !dbg !884
  %121 = load i64, i64* %time1, align 8, !dbg !885
  %122 = load i64, i64* %time0, align 8, !dbg !886
  %sub = sub nsw i64 %121, %122, !dbg !887
  %conv76 = sitofp i64 %sub to float, !dbg !888
  %div = fdiv float %conv76, 1.000000e+06, !dbg !889
  %conv77 = fpext float %div to double, !dbg !890
  %123 = load i64, i64* %time1, align 8, !dbg !891
  %124 = load i64, i64* %time0, align 8, !dbg !892
  %sub78 = sub nsw i64 %123, %124, !dbg !893
  %conv79 = sitofp i64 %sub78 to float, !dbg !894
  %125 = load i64, i64* %time6, align 8, !dbg !895
  %126 = load i64, i64* %time0, align 8, !dbg !896
  %sub80 = sub nsw i64 %125, %126, !dbg !897
  %conv81 = sitofp i64 %sub80 to float, !dbg !898
  %div82 = fdiv float %conv79, %conv81, !dbg !899
  %mul83 = fmul float %div82, 1.000000e+02, !dbg !900
  %conv84 = fpext float %mul83 to double, !dbg !901
  %call85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.21, i32 0, i32 0), double %conv77, double %conv84), !dbg !902
  %127 = load i64, i64* %time2, align 8, !dbg !903
  %128 = load i64, i64* %time1, align 8, !dbg !904
  %sub86 = sub nsw i64 %127, %128, !dbg !905
  %conv87 = sitofp i64 %sub86 to float, !dbg !906
  %div88 = fdiv float %conv87, 1.000000e+06, !dbg !907
  %conv89 = fpext float %div88 to double, !dbg !908
  %129 = load i64, i64* %time2, align 8, !dbg !909
  %130 = load i64, i64* %time1, align 8, !dbg !910
  %sub90 = sub nsw i64 %129, %130, !dbg !911
  %conv91 = sitofp i64 %sub90 to float, !dbg !912
  %131 = load i64, i64* %time6, align 8, !dbg !913
  %132 = load i64, i64* %time0, align 8, !dbg !914
  %sub92 = sub nsw i64 %131, %132, !dbg !915
  %conv93 = sitofp i64 %sub92 to float, !dbg !916
  %div94 = fdiv float %conv91, %conv93, !dbg !917
  %mul95 = fmul float %div94, 1.000000e+02, !dbg !918
  %conv96 = fpext float %mul95 to double, !dbg !919
  %call97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.22, i32 0, i32 0), double %conv89, double %conv96), !dbg !920
  %133 = load i64, i64* %time3, align 8, !dbg !921
  %134 = load i64, i64* %time2, align 8, !dbg !922
  %sub98 = sub nsw i64 %133, %134, !dbg !923
  %conv99 = sitofp i64 %sub98 to float, !dbg !924
  %div100 = fdiv float %conv99, 1.000000e+06, !dbg !925
  %conv101 = fpext float %div100 to double, !dbg !926
  %135 = load i64, i64* %time3, align 8, !dbg !927
  %136 = load i64, i64* %time2, align 8, !dbg !928
  %sub102 = sub nsw i64 %135, %136, !dbg !929
  %conv103 = sitofp i64 %sub102 to float, !dbg !930
  %137 = load i64, i64* %time6, align 8, !dbg !931
  %138 = load i64, i64* %time0, align 8, !dbg !932
  %sub104 = sub nsw i64 %137, %138, !dbg !933
  %conv105 = sitofp i64 %sub104 to float, !dbg !934
  %div106 = fdiv float %conv103, %conv105, !dbg !935
  %mul107 = fmul float %div106, 1.000000e+02, !dbg !936
  %conv108 = fpext float %mul107 to double, !dbg !937
  %call109 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.23, i32 0, i32 0), double %conv101, double %conv108), !dbg !938
  %139 = load i64, i64* %time4, align 8, !dbg !939
  %140 = load i64, i64* %time3, align 8, !dbg !940
  %sub110 = sub nsw i64 %139, %140, !dbg !941
  %conv111 = sitofp i64 %sub110 to float, !dbg !942
  %div112 = fdiv float %conv111, 1.000000e+06, !dbg !943
  %conv113 = fpext float %div112 to double, !dbg !944
  %141 = load i64, i64* %time4, align 8, !dbg !945
  %142 = load i64, i64* %time3, align 8, !dbg !946
  %sub114 = sub nsw i64 %141, %142, !dbg !947
  %conv115 = sitofp i64 %sub114 to float, !dbg !948
  %143 = load i64, i64* %time6, align 8, !dbg !949
  %144 = load i64, i64* %time0, align 8, !dbg !950
  %sub116 = sub nsw i64 %143, %144, !dbg !951
  %conv117 = sitofp i64 %sub116 to float, !dbg !952
  %div118 = fdiv float %conv115, %conv117, !dbg !953
  %mul119 = fmul float %div118, 1.000000e+02, !dbg !954
  %conv120 = fpext float %mul119 to double, !dbg !955
  %call121 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.24, i32 0, i32 0), double %conv113, double %conv120), !dbg !956
  %145 = load i64, i64* %time5, align 8, !dbg !957
  %146 = load i64, i64* %time4, align 8, !dbg !958
  %sub122 = sub nsw i64 %145, %146, !dbg !959
  %conv123 = sitofp i64 %sub122 to float, !dbg !960
  %div124 = fdiv float %conv123, 1.000000e+06, !dbg !961
  %conv125 = fpext float %div124 to double, !dbg !962
  %147 = load i64, i64* %time5, align 8, !dbg !963
  %148 = load i64, i64* %time4, align 8, !dbg !964
  %sub126 = sub nsw i64 %147, %148, !dbg !965
  %conv127 = sitofp i64 %sub126 to float, !dbg !966
  %149 = load i64, i64* %time6, align 8, !dbg !967
  %150 = load i64, i64* %time0, align 8, !dbg !968
  %sub128 = sub nsw i64 %149, %150, !dbg !969
  %conv129 = sitofp i64 %sub128 to float, !dbg !970
  %div130 = fdiv float %conv127, %conv129, !dbg !971
  %mul131 = fmul float %div130, 1.000000e+02, !dbg !972
  %conv132 = fpext float %mul131 to double, !dbg !973
  %call133 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.25, i32 0, i32 0), double %conv125, double %conv132), !dbg !974
  %151 = load i64, i64* %time6, align 8, !dbg !975
  %152 = load i64, i64* %time5, align 8, !dbg !976
  %sub134 = sub nsw i64 %151, %152, !dbg !977
  %conv135 = sitofp i64 %sub134 to float, !dbg !978
  %div136 = fdiv float %conv135, 1.000000e+06, !dbg !979
  %conv137 = fpext float %div136 to double, !dbg !980
  %153 = load i64, i64* %time6, align 8, !dbg !981
  %154 = load i64, i64* %time5, align 8, !dbg !982
  %sub138 = sub nsw i64 %153, %154, !dbg !983
  %conv139 = sitofp i64 %sub138 to float, !dbg !984
  %155 = load i64, i64* %time6, align 8, !dbg !985
  %156 = load i64, i64* %time0, align 8, !dbg !986
  %sub140 = sub nsw i64 %155, %156, !dbg !987
  %conv141 = sitofp i64 %sub140 to float, !dbg !988
  %div142 = fdiv float %conv139, %conv141, !dbg !989
  %mul143 = fmul float %div142, 1.000000e+02, !dbg !990
  %conv144 = fpext float %mul143 to double, !dbg !991
  %call145 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.26, i32 0, i32 0), double %conv137, double %conv144), !dbg !992
  %call146 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.27, i32 0, i32 0)), !dbg !993
  %157 = load i64, i64* %time6, align 8, !dbg !994
  %158 = load i64, i64* %time0, align 8, !dbg !995
  %sub147 = sub nsw i64 %157, %158, !dbg !996
  %conv148 = sitofp i64 %sub147 to float, !dbg !997
  %div149 = fdiv float %conv148, 1.000000e+06, !dbg !998
  %conv150 = fpext float %div149 to double, !dbg !999
  %call151 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.28, i32 0, i32 0), double %conv150), !dbg !1000
  ret void, !dbg !1001
}

declare i64 @get_time() #2

declare i32 @cudaThreadSynchronize() #2

declare i32 @printf(i8*, ...) #2

declare i32 @cudaMalloc(i8**, i64) #2

declare void @checkCUDAError(i8*) #2

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #2

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #2

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #3 comdat align 2 !dbg !1002 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1025, metadata !594), !dbg !1027
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1028, metadata !594), !dbg !1029
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1030, metadata !594), !dbg !1031
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1032, metadata !594), !dbg !1033
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1034
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1035
  store i32 %0, i32* %x, align 4, !dbg !1034
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1036
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1037
  store i32 %1, i32* %y, align 4, !dbg !1036
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1038
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1039
  store i32 %2, i32* %z, align 4, !dbg !1038
  ret void, !dbg !1040
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

declare i32 @cudaFree(i8*) #2

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!571, !572}
!llvm.ident = !{!573}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !11, imports: !15)
!1 = !DIFile(filename: "./kernel/kernel_gpu_cuda_wrapper_2.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !4, line: 807, size: 32, align: 32, elements: !5, identifier: "_ZTS14cudaMemcpyKind")
!4 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!5 = !{!6, !7, !8, !9, !10}
!6 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!7 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!8 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!10 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!11 = !{!12, !14}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!14 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!15 = !{!16, !23, !27, !29, !31, !33, !35, !39, !41, !43, !45, !47, !49, !51, !53, !55, !57, !59, !61, !63, !65, !67, !71, !73, !75, !77, !82, !87, !89, !91, !96, !100, !102, !104, !106, !108, !110, !112, !114, !116, !121, !125, !127, !129, !133, !135, !137, !139, !141, !143, !147, !149, !151, !156, !164, !168, !170, !172, !176, !178, !180, !184, !186, !188, !192, !194, !196, !198, !200, !202, !204, !206, !208, !210, !215, !217, !219, !223, !225, !227, !229, !231, !233, !235, !237, !241, !245, !247, !249, !254, !256, !258, !260, !262, !264, !266, !270, !276, !280, !284, !289, !291, !295, !299, !312, !316, !320, !324, !328, !333, !335, !339, !343, !347, !355, !359, !363, !367, !371, !376, !382, !386, !390, !392, !400, !404, !412, !414, !416, !420, !424, !428, !433, !437, !442, !443, !444, !445, !448, !449, !450, !451, !452, !453, !454, !457, !459, !461, !463, !465, !467, !469, !471, !474, !476, !478, !480, !482, !484, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !542, !543, !545, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569}
!16 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !19, line: 189)
!17 = !DINamespace(name: "std", scope: null, file: !18, line: 188)
!18 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!19 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !18, file: !18, line: 44, type: !20, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!20 = !DISubroutineType(types: !21)
!21 = !{!22, !22}
!22 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!23 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !24, line: 190)
!24 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !18, file: !18, line: 46, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!25 = !DISubroutineType(types: !26)
!26 = !{!14, !14}
!27 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !28, line: 191)
!28 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !18, file: !18, line: 48, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !30, line: 192)
!30 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !18, file: !18, line: 50, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!31 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !32, line: 193)
!32 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !18, file: !18, line: 52, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!33 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !34, line: 194)
!34 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !18, file: !18, line: 56, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !36, line: 195)
!36 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !18, file: !18, line: 54, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!37 = !DISubroutineType(types: !38)
!38 = !{!14, !14, !14}
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !40, line: 196)
!40 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !18, file: !18, line: 58, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !42, line: 197)
!42 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !18, file: !18, line: 60, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !44, line: 198)
!44 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !18, file: !18, line: 62, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !46, line: 199)
!46 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !18, file: !18, line: 64, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !48, line: 200)
!48 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !18, file: !18, line: 66, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !50, line: 201)
!50 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !18, file: !18, line: 68, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !52, line: 202)
!52 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !18, file: !18, line: 72, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !54, line: 203)
!54 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !18, file: !18, line: 70, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !56, line: 204)
!56 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !18, file: !18, line: 76, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !58, line: 205)
!58 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !18, file: !18, line: 74, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !60, line: 206)
!60 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !18, file: !18, line: 78, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !62, line: 207)
!62 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !18, file: !18, line: 80, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !64, line: 208)
!64 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !18, file: !18, line: 82, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !66, line: 209)
!66 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !18, file: !18, line: 84, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !68, line: 210)
!68 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !18, file: !18, line: 86, type: !69, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!69 = !DISubroutineType(types: !70)
!70 = !{!14, !14, !14, !14}
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !72, line: 211)
!72 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !18, file: !18, line: 88, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !74, line: 212)
!74 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !18, file: !18, line: 90, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !76, line: 213)
!76 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !18, file: !18, line: 92, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !78, line: 214)
!78 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !18, file: !18, line: 94, type: !79, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !14}
!81 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !83, line: 215)
!83 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !18, file: !18, line: 96, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!84 = !DISubroutineType(types: !85)
!85 = !{!14, !14, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64, align: 64)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !88, line: 216)
!88 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !18, file: !18, line: 98, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !90, line: 217)
!90 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !18, file: !18, line: 100, type: !79, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !92, line: 218)
!92 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !18, file: !18, line: 102, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DISubroutineType(types: !94)
!94 = !{!95, !14}
!95 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !97, line: 219)
!97 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !18, file: !18, line: 106, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!98 = !DISubroutineType(types: !99)
!99 = !{!95, !14, !14}
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !101, line: 220)
!101 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !18, file: !18, line: 105, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !103, line: 221)
!103 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !18, file: !18, line: 108, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !105, line: 222)
!105 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !18, file: !18, line: 112, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !107, line: 223)
!107 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !18, file: !18, line: 111, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !109, line: 224)
!109 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !18, file: !18, line: 114, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !111, line: 225)
!111 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !18, file: !18, line: 116, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !113, line: 226)
!113 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !18, file: !18, line: 118, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !115, line: 227)
!115 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !18, file: !18, line: 120, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !117, line: 228)
!117 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !18, file: !18, line: 121, type: !118, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DISubroutineType(types: !119)
!119 = !{!120, !120}
!120 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !122, line: 229)
!122 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !18, file: !18, line: 123, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!123 = !DISubroutineType(types: !124)
!124 = !{!14, !14, !81}
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !126, line: 230)
!126 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !18, file: !18, line: 125, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !128, line: 231)
!128 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !18, file: !18, line: 126, type: !20, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !130, line: 232)
!130 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !18, file: !18, line: 128, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DISubroutineType(types: !132)
!132 = !{!22, !14}
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !134, line: 233)
!134 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !18, file: !18, line: 138, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !136, line: 234)
!136 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !18, file: !18, line: 130, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !138, line: 235)
!138 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !18, file: !18, line: 132, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !140, line: 236)
!140 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !18, file: !18, line: 134, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !142, line: 237)
!142 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !18, file: !18, line: 136, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !144, line: 238)
!144 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !18, file: !18, line: 140, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DISubroutineType(types: !146)
!146 = !{!120, !14}
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !148, line: 239)
!148 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !18, file: !18, line: 142, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !150, line: 240)
!150 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !18, file: !18, line: 143, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !152, line: 241)
!152 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !18, file: !18, line: 145, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{!14, !14, !155}
!155 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64, align: 64)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !157, line: 242)
!157 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !18, file: !18, line: 146, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DISubroutineType(types: !159)
!159 = !{!160, !161}
!160 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64, align: 64)
!162 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !163)
!163 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !165, line: 243)
!165 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !18, file: !18, line: 147, type: !166, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DISubroutineType(types: !167)
!167 = !{!14, !161}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !169, line: 244)
!169 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !18, file: !18, line: 149, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !171, line: 245)
!171 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !18, file: !18, line: 151, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !173, line: 246)
!173 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !18, file: !18, line: 153, type: !174, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DISubroutineType(types: !175)
!175 = !{!14, !14, !160}
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !177, line: 247)
!177 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !18, file: !18, line: 158, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !179, line: 248)
!179 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !18, file: !18, line: 160, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !181, line: 249)
!181 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !18, file: !18, line: 162, type: !182, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!182 = !DISubroutineType(types: !183)
!183 = !{!14, !14, !14, !86}
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !185, line: 250)
!185 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !18, file: !18, line: 164, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !187, line: 251)
!187 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !18, file: !18, line: 166, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !189, line: 252)
!189 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !18, file: !18, line: 168, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DISubroutineType(types: !191)
!191 = !{!14, !14, !120}
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !193, line: 253)
!193 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !18, file: !18, line: 170, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !195, line: 254)
!195 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !18, file: !18, line: 172, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !197, line: 255)
!197 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !18, file: !18, line: 174, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !199, line: 256)
!199 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !18, file: !18, line: 176, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !201, line: 257)
!201 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !18, file: !18, line: 178, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !203, line: 258)
!203 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !18, file: !18, line: 180, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !205, line: 259)
!205 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !18, file: !18, line: 182, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !207, line: 260)
!207 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !18, file: !18, line: 184, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !209, line: 261)
!209 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !18, file: !18, line: 186, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !211, line: 102)
!211 = !DISubprogram(name: "acos", scope: !212, file: !212, line: 54, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!213 = !DISubroutineType(types: !214)
!214 = !{!160, !160}
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !216, line: 121)
!216 = !DISubprogram(name: "asin", scope: !212, file: !212, line: 56, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !218, line: 140)
!218 = !DISubprogram(name: "atan", scope: !212, file: !212, line: 58, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !220, line: 159)
!220 = !DISubprogram(name: "atan2", scope: !212, file: !212, line: 60, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DISubroutineType(types: !222)
!222 = !{!160, !160, !160}
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !224, line: 180)
!224 = !DISubprogram(name: "ceil", scope: !212, file: !212, line: 178, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !226, line: 199)
!226 = !DISubprogram(name: "cos", scope: !212, file: !212, line: 63, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !228, line: 218)
!228 = !DISubprogram(name: "cosh", scope: !212, file: !212, line: 72, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !230, line: 237)
!230 = !DISubprogram(name: "exp", scope: !212, file: !212, line: 100, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !232, line: 256)
!232 = !DISubprogram(name: "fabs", scope: !212, file: !212, line: 181, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !234, line: 275)
!234 = !DISubprogram(name: "floor", scope: !212, file: !212, line: 184, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !236, line: 294)
!236 = !DISubprogram(name: "fmod", scope: !212, file: !212, line: 187, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !238, line: 315)
!238 = !DISubprogram(name: "frexp", scope: !212, file: !212, line: 103, type: !239, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !DISubroutineType(types: !240)
!240 = !{!160, !160, !86}
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !242, line: 334)
!242 = !DISubprogram(name: "ldexp", scope: !212, file: !212, line: 106, type: !243, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!243 = !DISubroutineType(types: !244)
!244 = !{!160, !160, !81}
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !246, line: 353)
!246 = !DISubprogram(name: "log", scope: !212, file: !212, line: 109, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !248, line: 372)
!248 = !DISubprogram(name: "log10", scope: !212, file: !212, line: 112, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !250, line: 391)
!250 = !DISubprogram(name: "modf", scope: !212, file: !212, line: 115, type: !251, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!251 = !DISubroutineType(types: !252)
!252 = !{!160, !160, !253}
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64, align: 64)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !255, line: 403)
!255 = !DISubprogram(name: "pow", scope: !212, file: !212, line: 153, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !257, line: 440)
!257 = !DISubprogram(name: "sin", scope: !212, file: !212, line: 65, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !259, line: 459)
!259 = !DISubprogram(name: "sinh", scope: !212, file: !212, line: 74, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !261, line: 478)
!261 = !DISubprogram(name: "sqrt", scope: !212, file: !212, line: 156, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !263, line: 497)
!263 = !DISubprogram(name: "tan", scope: !212, file: !212, line: 67, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !265, line: 516)
!265 = !DISubprogram(name: "tanh", scope: !212, file: !212, line: 76, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !267, line: 118)
!267 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !268, line: 101, baseType: !269)
!268 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!269 = !DICompositeType(tag: DW_TAG_structure_type, file: !268, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !271, line: 119)
!271 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !268, line: 109, baseType: !272)
!272 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !268, line: 105, size: 128, align: 64, elements: !273, identifier: "_ZTS6ldiv_t")
!273 = !{!274, !275}
!274 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !272, file: !268, line: 107, baseType: !120, size: 64, align: 64)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !272, file: !268, line: 108, baseType: !120, size: 64, align: 64, offset: 64)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !277, line: 121)
!277 = !DISubprogram(name: "abort", scope: !268, file: !268, line: 515, type: !278, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!278 = !DISubroutineType(types: !279)
!279 = !{null}
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !281, line: 122)
!281 = !DISubprogram(name: "abs", scope: !268, file: !268, line: 774, type: !282, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!282 = !DISubroutineType(types: !283)
!283 = !{!81, !81}
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !285, line: 123)
!285 = !DISubprogram(name: "atexit", scope: !268, file: !268, line: 519, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{!81, !288}
!288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !278, size: 64, align: 64)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !290, line: 129)
!290 = !DISubprogram(name: "atof", scope: !268, file: !268, line: 144, type: !158, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !292, line: 130)
!292 = !DISubprogram(name: "atoi", scope: !268, file: !268, line: 147, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DISubroutineType(types: !294)
!294 = !{!81, !161}
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !296, line: 131)
!296 = !DISubprogram(name: "atol", scope: !268, file: !268, line: 150, type: !297, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DISubroutineType(types: !298)
!298 = !{!120, !161}
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !300, line: 132)
!300 = !DISubprogram(name: "bsearch", scope: !268, file: !268, line: 754, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !DISubroutineType(types: !302)
!302 = !{!13, !303, !303, !305, !305, !308}
!303 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !304, size: 64, align: 64)
!304 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!305 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !306, line: 62, baseType: !307)
!306 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!307 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!308 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !268, line: 741, baseType: !309)
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64, align: 64)
!310 = !DISubroutineType(types: !311)
!311 = !{!81, !303, !303}
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !313, line: 133)
!313 = !DISubprogram(name: "calloc", scope: !268, file: !268, line: 468, type: !314, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DISubroutineType(types: !315)
!315 = !{!13, !305, !305}
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !317, line: 134)
!317 = !DISubprogram(name: "div", scope: !268, file: !268, line: 788, type: !318, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DISubroutineType(types: !319)
!319 = !{!267, !81, !81}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !321, line: 135)
!321 = !DISubprogram(name: "exit", scope: !268, file: !268, line: 543, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!322 = !DISubroutineType(types: !323)
!323 = !{null, !81}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !325, line: 136)
!325 = !DISubprogram(name: "free", scope: !268, file: !268, line: 483, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{null, !13}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !329, line: 137)
!329 = !DISubprogram(name: "getenv", scope: !268, file: !268, line: 564, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{!332, !161}
!332 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64, align: 64)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !334, line: 138)
!334 = !DISubprogram(name: "labs", scope: !268, file: !268, line: 775, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !336, line: 139)
!336 = !DISubprogram(name: "ldiv", scope: !268, file: !268, line: 790, type: !337, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!337 = !DISubroutineType(types: !338)
!338 = !{!271, !120, !120}
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !340, line: 140)
!340 = !DISubprogram(name: "malloc", scope: !268, file: !268, line: 466, type: !341, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DISubroutineType(types: !342)
!342 = !{!13, !305}
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !344, line: 142)
!344 = !DISubprogram(name: "mblen", scope: !268, file: !268, line: 862, type: !345, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DISubroutineType(types: !346)
!346 = !{!81, !161, !305}
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !348, line: 143)
!348 = !DISubprogram(name: "mbstowcs", scope: !268, file: !268, line: 873, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!305, !351, !354, !305}
!351 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !352)
!352 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !353, size: 64, align: 64)
!353 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!354 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !161)
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !356, line: 144)
!356 = !DISubprogram(name: "mbtowc", scope: !268, file: !268, line: 865, type: !357, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!357 = !DISubroutineType(types: !358)
!358 = !{!81, !351, !354, !305}
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !360, line: 146)
!360 = !DISubprogram(name: "qsort", scope: !268, file: !268, line: 764, type: !361, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!361 = !DISubroutineType(types: !362)
!362 = !{null, !13, !305, !305, !308}
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !364, line: 152)
!364 = !DISubprogram(name: "rand", scope: !268, file: !268, line: 374, type: !365, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!365 = !DISubroutineType(types: !366)
!366 = !{!81}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !368, line: 153)
!368 = !DISubprogram(name: "realloc", scope: !268, file: !268, line: 480, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{!13, !13, !305}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !372, line: 154)
!372 = !DISubprogram(name: "srand", scope: !268, file: !268, line: 376, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!373 = !DISubroutineType(types: !374)
!374 = !{null, !375}
!375 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !377, line: 155)
!377 = !DISubprogram(name: "strtod", scope: !268, file: !268, line: 164, type: !378, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!378 = !DISubroutineType(types: !379)
!379 = !{!160, !354, !380}
!380 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !381)
!381 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !332, size: 64, align: 64)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !383, line: 156)
!383 = !DISubprogram(name: "strtol", scope: !268, file: !268, line: 183, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{!120, !354, !380, !81}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !387, line: 157)
!387 = !DISubprogram(name: "strtoul", scope: !268, file: !268, line: 187, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{!307, !354, !380, !81}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !391, line: 158)
!391 = !DISubprogram(name: "system", scope: !268, file: !268, line: 716, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !393, line: 160)
!393 = !DISubprogram(name: "wcstombs", scope: !268, file: !268, line: 876, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!394 = !DISubroutineType(types: !395)
!395 = !{!305, !396, !397, !305}
!396 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !332)
!397 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !398)
!398 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !399, size: 64, align: 64)
!399 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !353)
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !401, line: 161)
!401 = !DISubprogram(name: "wctomb", scope: !268, file: !268, line: 869, type: !402, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!402 = !DISubroutineType(types: !403)
!403 = !{!81, !332, !353}
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !407, line: 214)
!405 = !DINamespace(name: "__gnu_cxx", scope: null, file: !406, line: 220)
!406 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!407 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !268, line: 121, baseType: !408)
!408 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !268, line: 117, size: 128, align: 64, elements: !409, identifier: "_ZTS7lldiv_t")
!409 = !{!410, !411}
!410 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !408, file: !268, line: 119, baseType: !22, size: 64, align: 64)
!411 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !408, file: !268, line: 120, baseType: !22, size: 64, align: 64, offset: 64)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !413, line: 220)
!413 = !DISubprogram(name: "_Exit", scope: !268, file: !268, line: 557, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !415, line: 224)
!415 = !DISubprogram(name: "llabs", scope: !268, file: !268, line: 779, type: !20, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !417, line: 230)
!417 = !DISubprogram(name: "lldiv", scope: !268, file: !268, line: 796, type: !418, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!418 = !DISubroutineType(types: !419)
!419 = !{!407, !22, !22}
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !421, line: 241)
!421 = !DISubprogram(name: "atoll", scope: !268, file: !268, line: 157, type: !422, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!422 = !DISubroutineType(types: !423)
!423 = !{!22, !161}
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !425, line: 242)
!425 = !DISubprogram(name: "strtoll", scope: !268, file: !268, line: 209, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!426 = !DISubroutineType(types: !427)
!427 = !{!22, !354, !380, !81}
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !429, line: 243)
!429 = !DISubprogram(name: "strtoull", scope: !268, file: !268, line: 214, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DISubroutineType(types: !431)
!431 = !{!432, !354, !380, !81}
!432 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !434, line: 245)
!434 = !DISubprogram(name: "strtof", scope: !268, file: !268, line: 172, type: !435, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!435 = !DISubroutineType(types: !436)
!436 = !{!14, !354, !380}
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !405, entity: !438, line: 246)
!438 = !DISubprogram(name: "strtold", scope: !268, file: !268, line: 175, type: !439, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!439 = !DISubroutineType(types: !440)
!440 = !{!441, !354, !380}
!441 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !407, line: 254)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !413, line: 256)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !415, line: 258)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !446, line: 259)
!446 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !405, file: !447, line: 227, type: !418, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !417, line: 260)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !421, line: 262)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !434, line: 263)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !425, line: 264)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !429, line: 265)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !438, line: 266)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !455, line: 397)
!455 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !456, file: !456, line: 1342, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !458, line: 398)
!458 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !456, file: !456, line: 1370, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !460, line: 399)
!460 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !456, file: !456, line: 1337, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !462, line: 400)
!462 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !456, file: !456, line: 1375, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !464, line: 401)
!464 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !456, file: !456, line: 1327, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !466, line: 402)
!466 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !456, file: !456, line: 1332, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !468, line: 403)
!468 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !456, file: !456, line: 1380, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !470, line: 404)
!470 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !456, file: !456, line: 1430, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !472, line: 405)
!472 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !473, file: !473, line: 667, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !475, line: 406)
!475 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !456, file: !456, line: 1189, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !477, line: 407)
!477 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !456, file: !456, line: 1243, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !479, line: 408)
!479 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !456, file: !456, line: 1312, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !481, line: 409)
!481 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !456, file: !456, line: 1490, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !483, line: 410)
!483 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !456, file: !456, line: 1480, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !485, line: 411)
!485 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !473, file: !473, line: 657, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !487, line: 412)
!487 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !456, file: !456, line: 1294, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !489, line: 413)
!489 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !456, file: !456, line: 1385, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !491, line: 414)
!491 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !473, file: !473, line: 607, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !493, line: 415)
!493 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !456, file: !456, line: 1616, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !495, line: 416)
!495 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !473, file: !473, line: 597, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !497, line: 417)
!497 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !456, file: !456, line: 1568, type: !69, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !499, line: 418)
!499 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !473, file: !473, line: 622, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !501, line: 419)
!501 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !473, file: !473, line: 617, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !503, line: 420)
!503 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !456, file: !456, line: 1553, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !505, line: 421)
!505 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !456, file: !456, line: 1543, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !507, line: 422)
!507 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !456, file: !456, line: 1390, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !509, line: 423)
!509 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !456, file: !456, line: 1621, type: !79, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !511, line: 424)
!511 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !456, file: !456, line: 1520, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !513, line: 425)
!513 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !456, file: !456, line: 1515, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !515, line: 426)
!515 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !456, file: !456, line: 1149, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !517, line: 427)
!517 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !456, file: !456, line: 1602, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !519, line: 428)
!519 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !456, file: !456, line: 1356, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !521, line: 429)
!521 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !456, file: !456, line: 1365, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !523, line: 430)
!523 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !456, file: !456, line: 1285, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !525, line: 431)
!525 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !456, file: !456, line: 1626, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !527, line: 432)
!527 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !456, file: !456, line: 1347, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !529, line: 433)
!529 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !456, file: !456, line: 1140, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !531, line: 434)
!531 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !456, file: !456, line: 1607, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !533, line: 435)
!533 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !456, file: !456, line: 1548, type: !153, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !535, line: 436)
!535 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !456, file: !456, line: 1154, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !537, line: 437)
!537 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !456, file: !456, line: 1218, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !539, line: 438)
!539 = !DISubprogram(name: "nexttowardf", scope: !212, file: !212, line: 294, type: !540, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DISubroutineType(types: !541)
!541 = !{!14, !14, !441}
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !539, line: 439)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !544, line: 440)
!544 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !456, file: !456, line: 1583, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !546, line: 441)
!546 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !456, file: !456, line: 1558, type: !37, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !548, line: 442)
!548 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !456, file: !456, line: 1563, type: !182, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !550, line: 443)
!550 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !456, file: !456, line: 1135, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !552, line: 444)
!552 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !456, file: !456, line: 1597, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !554, line: 445)
!554 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !456, file: !456, line: 1530, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !556, line: 446)
!556 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !456, file: !456, line: 1525, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !558, line: 447)
!558 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !456, file: !456, line: 1234, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !560, line: 448)
!560 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !456, file: !456, line: 1317, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !562, line: 449)
!562 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !473, file: !473, line: 907, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !564, line: 450)
!564 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !456, file: !456, line: 1276, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !566, line: 451)
!566 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !456, file: !456, line: 1322, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !568, line: 452)
!568 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !456, file: !456, line: 1592, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !570, line: 453)
!570 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !473, file: !473, line: 662, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !{i32 2, !"Dwarf Version", i32 4}
!572 = !{i32 2, !"Debug Info Version", i32 3}
!573 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!574 = distinct !DISubprogram(name: "findRangeK", scope: !575, file: !575, line: 6, type: !576, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !592)
!575 = !DIFile(filename: "./kernel/./kernel_gpu_cuda_2.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!576 = !DISubroutineType(types: !577)
!577 = !{null, !120, !578, !120, !591, !591, !591, !591, !86, !86, !86, !86}
!578 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !579, size: 64, align: 64)
!579 = !DIDerivedType(tag: DW_TAG_typedef, name: "knode", file: !580, line: 145, baseType: !581)
!580 = !DIFile(filename: "./kernel/../common.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!581 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "knode", file: !580, line: 139, size: 16544, align: 32, elements: !582, identifier: "_ZTS5knode")
!582 = !{!583, !584, !588, !589, !590}
!583 = !DIDerivedType(tag: DW_TAG_member, name: "location", scope: !581, file: !580, line: 140, baseType: !81, size: 32, align: 32)
!584 = !DIDerivedType(tag: DW_TAG_member, name: "indices", scope: !581, file: !580, line: 141, baseType: !585, size: 8224, align: 32, offset: 32)
!585 = !DICompositeType(tag: DW_TAG_array_type, baseType: !81, size: 8224, align: 32, elements: !586)
!586 = !{!587}
!587 = !DISubrange(count: 257)
!588 = !DIDerivedType(tag: DW_TAG_member, name: "keys", scope: !581, file: !580, line: 142, baseType: !585, size: 8224, align: 32, offset: 8256)
!589 = !DIDerivedType(tag: DW_TAG_member, name: "is_leaf", scope: !581, file: !580, line: 143, baseType: !95, size: 8, align: 8, offset: 16480)
!590 = !DIDerivedType(tag: DW_TAG_member, name: "num_keys", scope: !581, file: !580, line: 144, baseType: !81, size: 32, align: 32, offset: 16512)
!591 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64, align: 64)
!592 = !{}
!593 = !DILocalVariable(name: "height", arg: 1, scope: !574, file: !575, line: 6, type: !120)
!594 = !DIExpression()
!595 = !DILocation(line: 6, column: 18, scope: !574)
!596 = !DILocalVariable(name: "knodesD", arg: 2, scope: !574, file: !575, line: 8, type: !578)
!597 = !DILocation(line: 8, column: 11, scope: !574)
!598 = !DILocalVariable(name: "knodes_elem", arg: 3, scope: !574, file: !575, line: 9, type: !120)
!599 = !DILocation(line: 9, column: 9, scope: !574)
!600 = !DILocalVariable(name: "currKnodeD", arg: 4, scope: !574, file: !575, line: 11, type: !591)
!601 = !DILocation(line: 11, column: 10, scope: !574)
!602 = !DILocalVariable(name: "offsetD", arg: 5, scope: !574, file: !575, line: 12, type: !591)
!603 = !DILocation(line: 12, column: 10, scope: !574)
!604 = !DILocalVariable(name: "lastKnodeD", arg: 6, scope: !574, file: !575, line: 13, type: !591)
!605 = !DILocation(line: 13, column: 10, scope: !574)
!606 = !DILocalVariable(name: "offset_2D", arg: 7, scope: !574, file: !575, line: 14, type: !591)
!607 = !DILocation(line: 14, column: 10, scope: !574)
!608 = !DILocalVariable(name: "startD", arg: 8, scope: !574, file: !575, line: 15, type: !86)
!609 = !DILocation(line: 15, column: 9, scope: !574)
!610 = !DILocalVariable(name: "endD", arg: 9, scope: !574, file: !575, line: 16, type: !86)
!611 = !DILocation(line: 16, column: 9, scope: !574)
!612 = !DILocalVariable(name: "RecstartD", arg: 10, scope: !574, file: !575, line: 17, type: !86)
!613 = !DILocation(line: 17, column: 9, scope: !574)
!614 = !DILocalVariable(name: "ReclenD", arg: 11, scope: !574, file: !575, line: 18, type: !86)
!615 = !DILocation(line: 18, column: 9, scope: !574)
!616 = !DILocation(line: 19, column: 1, scope: !574)
!617 = !DILocation(line: 19, column: 1, scope: !618)
!618 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 1)
!619 = !DILocation(line: 19, column: 1, scope: !620)
!620 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 2)
!621 = !DILocation(line: 19, column: 1, scope: !622)
!622 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 3)
!623 = !DILocation(line: 19, column: 1, scope: !624)
!624 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 4)
!625 = !DILocation(line: 19, column: 1, scope: !626)
!626 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 5)
!627 = !DILocation(line: 19, column: 1, scope: !628)
!628 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 6)
!629 = !DILocation(line: 19, column: 1, scope: !630)
!630 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 7)
!631 = !DILocation(line: 19, column: 1, scope: !632)
!632 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 8)
!633 = !DILocation(line: 19, column: 1, scope: !634)
!634 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 9)
!635 = !DILocation(line: 19, column: 1, scope: !636)
!636 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 10)
!637 = !DILocation(line: 19, column: 1, scope: !638)
!638 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 11)
!639 = !DILocation(line: 66, column: 1, scope: !574)
!640 = distinct !DISubprogram(name: "kernel_gpu_cuda_wrapper_2", scope: !1, file: !1, line: 39, type: !641, isLocal: false, isDefinition: true, scopeLine: 55, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !592)
!641 = !DISubroutineType(types: !642)
!642 = !{null, !578, !120, !120, !81, !120, !81, !591, !591, !591, !591, !86, !86, !86, !86}
!643 = !DILocalVariable(name: "knodes", arg: 1, scope: !640, file: !1, line: 39, type: !578)
!644 = !DILocation(line: 39, column: 35, scope: !640)
!645 = !DILocalVariable(name: "knodes_elem", arg: 2, scope: !640, file: !1, line: 40, type: !120)
!646 = !DILocation(line: 40, column: 13, scope: !640)
!647 = !DILocalVariable(name: "knodes_mem", arg: 3, scope: !640, file: !1, line: 41, type: !120)
!648 = !DILocation(line: 41, column: 13, scope: !640)
!649 = !DILocalVariable(name: "order", arg: 4, scope: !640, file: !1, line: 43, type: !81)
!650 = !DILocation(line: 43, column: 12, scope: !640)
!651 = !DILocalVariable(name: "maxheight", arg: 5, scope: !640, file: !1, line: 44, type: !120)
!652 = !DILocation(line: 44, column: 13, scope: !640)
!653 = !DILocalVariable(name: "count", arg: 6, scope: !640, file: !1, line: 45, type: !81)
!654 = !DILocation(line: 45, column: 12, scope: !640)
!655 = !DILocalVariable(name: "currKnode", arg: 7, scope: !640, file: !1, line: 47, type: !591)
!656 = !DILocation(line: 47, column: 14, scope: !640)
!657 = !DILocalVariable(name: "offset", arg: 8, scope: !640, file: !1, line: 48, type: !591)
!658 = !DILocation(line: 48, column: 14, scope: !640)
!659 = !DILocalVariable(name: "lastKnode", arg: 9, scope: !640, file: !1, line: 49, type: !591)
!660 = !DILocation(line: 49, column: 14, scope: !640)
!661 = !DILocalVariable(name: "offset_2", arg: 10, scope: !640, file: !1, line: 50, type: !591)
!662 = !DILocation(line: 50, column: 14, scope: !640)
!663 = !DILocalVariable(name: "start", arg: 11, scope: !640, file: !1, line: 51, type: !86)
!664 = !DILocation(line: 51, column: 13, scope: !640)
!665 = !DILocalVariable(name: "end", arg: 12, scope: !640, file: !1, line: 52, type: !86)
!666 = !DILocation(line: 52, column: 13, scope: !640)
!667 = !DILocalVariable(name: "recstart", arg: 13, scope: !640, file: !1, line: 53, type: !86)
!668 = !DILocation(line: 53, column: 13, scope: !640)
!669 = !DILocalVariable(name: "reclength", arg: 14, scope: !640, file: !1, line: 54, type: !86)
!670 = !DILocation(line: 54, column: 13, scope: !640)
!671 = !DILocalVariable(name: "time0", scope: !640, file: !1, line: 62, type: !22)
!672 = !DILocation(line: 62, column: 12, scope: !640)
!673 = !DILocalVariable(name: "time1", scope: !640, file: !1, line: 63, type: !22)
!674 = !DILocation(line: 63, column: 12, scope: !640)
!675 = !DILocalVariable(name: "time2", scope: !640, file: !1, line: 64, type: !22)
!676 = !DILocation(line: 64, column: 12, scope: !640)
!677 = !DILocalVariable(name: "time3", scope: !640, file: !1, line: 65, type: !22)
!678 = !DILocation(line: 65, column: 12, scope: !640)
!679 = !DILocalVariable(name: "time4", scope: !640, file: !1, line: 66, type: !22)
!680 = !DILocation(line: 66, column: 12, scope: !640)
!681 = !DILocalVariable(name: "time5", scope: !640, file: !1, line: 67, type: !22)
!682 = !DILocation(line: 67, column: 12, scope: !640)
!683 = !DILocalVariable(name: "time6", scope: !640, file: !1, line: 68, type: !22)
!684 = !DILocation(line: 68, column: 12, scope: !640)
!685 = !DILocation(line: 70, column: 10, scope: !640)
!686 = !DILocation(line: 70, column: 8, scope: !640)
!687 = !DILocation(line: 80, column: 2, scope: !640)
!688 = !DILocalVariable(name: "numBlocks", scope: !640, file: !1, line: 86, type: !81)
!689 = !DILocation(line: 86, column: 6, scope: !640)
!690 = !DILocation(line: 87, column: 14, scope: !640)
!691 = !DILocation(line: 87, column: 12, scope: !640)
!692 = !DILocalVariable(name: "threadsPerBlock", scope: !640, file: !1, line: 88, type: !81)
!693 = !DILocation(line: 88, column: 6, scope: !640)
!694 = !DILocation(line: 89, column: 20, scope: !640)
!695 = !DILocation(line: 89, column: 26, scope: !640)
!696 = !DILocation(line: 89, column: 35, scope: !697)
!697 = !DILexicalBlockFile(scope: !640, file: !1, discriminator: 1)
!698 = !DILocation(line: 89, column: 20, scope: !697)
!699 = !DILocation(line: 89, column: 20, scope: !700)
!700 = !DILexicalBlockFile(scope: !640, file: !1, discriminator: 2)
!701 = !DILocation(line: 89, column: 20, scope: !702)
!702 = !DILexicalBlockFile(scope: !640, file: !1, discriminator: 3)
!703 = !DILocation(line: 89, column: 18, scope: !702)
!704 = !DILocation(line: 91, column: 88, scope: !640)
!705 = !DILocation(line: 91, column: 99, scope: !640)
!706 = !DILocation(line: 91, column: 2, scope: !640)
!707 = !DILocation(line: 93, column: 10, scope: !640)
!708 = !DILocation(line: 93, column: 8, scope: !640)
!709 = !DILocalVariable(name: "knodesD", scope: !640, file: !1, line: 107, type: !578)
!710 = !DILocation(line: 107, column: 9, scope: !640)
!711 = !DILocation(line: 108, column: 13, scope: !640)
!712 = !DILocation(line: 108, column: 31, scope: !640)
!713 = !DILocation(line: 108, column: 2, scope: !640)
!714 = !DILocation(line: 109, column: 2, scope: !640)
!715 = !DILocalVariable(name: "currKnodeD", scope: !640, file: !1, line: 115, type: !591)
!716 = !DILocation(line: 115, column: 8, scope: !640)
!717 = !DILocation(line: 116, column: 13, scope: !640)
!718 = !DILocation(line: 116, column: 34, scope: !640)
!719 = !DILocation(line: 116, column: 39, scope: !640)
!720 = !DILocation(line: 116, column: 2, scope: !640)
!721 = !DILocation(line: 117, column: 2, scope: !640)
!722 = !DILocalVariable(name: "offsetD", scope: !640, file: !1, line: 123, type: !591)
!723 = !DILocation(line: 123, column: 8, scope: !640)
!724 = !DILocation(line: 124, column: 13, scope: !640)
!725 = !DILocation(line: 124, column: 31, scope: !640)
!726 = !DILocation(line: 124, column: 36, scope: !640)
!727 = !DILocation(line: 124, column: 2, scope: !640)
!728 = !DILocation(line: 125, column: 2, scope: !640)
!729 = !DILocalVariable(name: "lastKnodeD", scope: !640, file: !1, line: 131, type: !591)
!730 = !DILocation(line: 131, column: 8, scope: !640)
!731 = !DILocation(line: 132, column: 13, scope: !640)
!732 = !DILocation(line: 132, column: 34, scope: !640)
!733 = !DILocation(line: 132, column: 39, scope: !640)
!734 = !DILocation(line: 132, column: 2, scope: !640)
!735 = !DILocation(line: 133, column: 2, scope: !640)
!736 = !DILocalVariable(name: "offset_2D", scope: !640, file: !1, line: 139, type: !591)
!737 = !DILocation(line: 139, column: 8, scope: !640)
!738 = !DILocation(line: 140, column: 13, scope: !640)
!739 = !DILocation(line: 140, column: 33, scope: !640)
!740 = !DILocation(line: 140, column: 38, scope: !640)
!741 = !DILocation(line: 140, column: 2, scope: !640)
!742 = !DILocation(line: 141, column: 2, scope: !640)
!743 = !DILocalVariable(name: "startD", scope: !640, file: !1, line: 147, type: !86)
!744 = !DILocation(line: 147, column: 7, scope: !640)
!745 = !DILocation(line: 148, column: 13, scope: !640)
!746 = !DILocation(line: 148, column: 30, scope: !640)
!747 = !DILocation(line: 148, column: 35, scope: !640)
!748 = !DILocation(line: 148, column: 2, scope: !640)
!749 = !DILocation(line: 149, column: 2, scope: !640)
!750 = !DILocalVariable(name: "endD", scope: !640, file: !1, line: 155, type: !86)
!751 = !DILocation(line: 155, column: 7, scope: !640)
!752 = !DILocation(line: 156, column: 13, scope: !640)
!753 = !DILocation(line: 156, column: 28, scope: !640)
!754 = !DILocation(line: 156, column: 33, scope: !640)
!755 = !DILocation(line: 156, column: 2, scope: !640)
!756 = !DILocation(line: 157, column: 2, scope: !640)
!757 = !DILocalVariable(name: "ansDStart", scope: !640, file: !1, line: 167, type: !86)
!758 = !DILocation(line: 167, column: 7, scope: !640)
!759 = !DILocation(line: 168, column: 13, scope: !640)
!760 = !DILocation(line: 168, column: 33, scope: !640)
!761 = !DILocation(line: 168, column: 38, scope: !640)
!762 = !DILocation(line: 168, column: 2, scope: !640)
!763 = !DILocation(line: 169, column: 2, scope: !640)
!764 = !DILocalVariable(name: "ansDLength", scope: !640, file: !1, line: 175, type: !86)
!765 = !DILocation(line: 175, column: 7, scope: !640)
!766 = !DILocation(line: 176, column: 13, scope: !640)
!767 = !DILocation(line: 176, column: 34, scope: !640)
!768 = !DILocation(line: 176, column: 39, scope: !640)
!769 = !DILocation(line: 176, column: 2, scope: !640)
!770 = !DILocation(line: 177, column: 2, scope: !640)
!771 = !DILocation(line: 179, column: 10, scope: !640)
!772 = !DILocation(line: 179, column: 8, scope: !640)
!773 = !DILocation(line: 193, column: 13, scope: !640)
!774 = !DILocation(line: 193, column: 22, scope: !640)
!775 = !DILocation(line: 193, column: 30, scope: !640)
!776 = !DILocation(line: 193, column: 2, scope: !640)
!777 = !DILocation(line: 194, column: 2, scope: !640)
!778 = !DILocation(line: 200, column: 13, scope: !640)
!779 = !DILocation(line: 200, column: 25, scope: !640)
!780 = !DILocation(line: 200, column: 36, scope: !640)
!781 = !DILocation(line: 200, column: 41, scope: !640)
!782 = !DILocation(line: 200, column: 2, scope: !640)
!783 = !DILocation(line: 201, column: 2, scope: !640)
!784 = !DILocation(line: 207, column: 13, scope: !640)
!785 = !DILocation(line: 207, column: 22, scope: !640)
!786 = !DILocation(line: 207, column: 30, scope: !640)
!787 = !DILocation(line: 207, column: 35, scope: !640)
!788 = !DILocation(line: 207, column: 2, scope: !640)
!789 = !DILocation(line: 208, column: 2, scope: !640)
!790 = !DILocation(line: 214, column: 13, scope: !640)
!791 = !DILocation(line: 214, column: 25, scope: !640)
!792 = !DILocation(line: 214, column: 36, scope: !640)
!793 = !DILocation(line: 214, column: 41, scope: !640)
!794 = !DILocation(line: 214, column: 2, scope: !640)
!795 = !DILocation(line: 215, column: 2, scope: !640)
!796 = !DILocation(line: 221, column: 13, scope: !640)
!797 = !DILocation(line: 221, column: 24, scope: !640)
!798 = !DILocation(line: 221, column: 34, scope: !640)
!799 = !DILocation(line: 221, column: 39, scope: !640)
!800 = !DILocation(line: 221, column: 2, scope: !640)
!801 = !DILocation(line: 222, column: 2, scope: !640)
!802 = !DILocation(line: 228, column: 13, scope: !640)
!803 = !DILocation(line: 228, column: 21, scope: !640)
!804 = !DILocation(line: 228, column: 28, scope: !640)
!805 = !DILocation(line: 228, column: 33, scope: !640)
!806 = !DILocation(line: 228, column: 2, scope: !640)
!807 = !DILocation(line: 229, column: 2, scope: !640)
!808 = !DILocation(line: 235, column: 13, scope: !640)
!809 = !DILocation(line: 235, column: 19, scope: !640)
!810 = !DILocation(line: 235, column: 24, scope: !640)
!811 = !DILocation(line: 235, column: 29, scope: !640)
!812 = !DILocation(line: 235, column: 2, scope: !640)
!813 = !DILocation(line: 236, column: 2, scope: !640)
!814 = !DILocation(line: 246, column: 13, scope: !640)
!815 = !DILocation(line: 246, column: 24, scope: !640)
!816 = !DILocation(line: 246, column: 34, scope: !640)
!817 = !DILocation(line: 246, column: 39, scope: !640)
!818 = !DILocation(line: 246, column: 2, scope: !640)
!819 = !DILocation(line: 247, column: 2, scope: !640)
!820 = !DILocation(line: 253, column: 13, scope: !640)
!821 = !DILocation(line: 253, column: 25, scope: !640)
!822 = !DILocation(line: 253, column: 36, scope: !640)
!823 = !DILocation(line: 253, column: 41, scope: !640)
!824 = !DILocation(line: 253, column: 2, scope: !640)
!825 = !DILocation(line: 254, column: 2, scope: !640)
!826 = !DILocation(line: 256, column: 10, scope: !640)
!827 = !DILocation(line: 256, column: 8, scope: !640)
!828 = !DILocation(line: 263, column: 15, scope: !640)
!829 = !DILocation(line: 263, column: 26, scope: !640)
!830 = !DILocation(line: 263, column: 26, scope: !700)
!831 = !DILocation(line: 263, column: 12, scope: !640)
!832 = !DILocation(line: 263, column: 12, scope: !702)
!833 = !DILocation(line: 263, column: 2, scope: !640)
!834 = !DILocation(line: 263, column: 46, scope: !697)
!835 = !DILocation(line: 264, column: 13, scope: !640)
!836 = !DILocation(line: 265, column: 13, scope: !640)
!837 = !DILocation(line: 267, column: 13, scope: !640)
!838 = !DILocation(line: 268, column: 13, scope: !640)
!839 = !DILocation(line: 269, column: 13, scope: !640)
!840 = !DILocation(line: 270, column: 13, scope: !640)
!841 = !DILocation(line: 271, column: 13, scope: !640)
!842 = !DILocation(line: 272, column: 13, scope: !640)
!843 = !DILocation(line: 273, column: 13, scope: !640)
!844 = !DILocation(line: 274, column: 13, scope: !640)
!845 = !DILocation(line: 263, column: 2, scope: !697)
!846 = !DILocation(line: 275, column: 2, scope: !640)
!847 = !DILocation(line: 276, column: 2, scope: !640)
!848 = !DILocation(line: 278, column: 10, scope: !640)
!849 = !DILocation(line: 278, column: 8, scope: !640)
!850 = !DILocation(line: 292, column: 13, scope: !640)
!851 = !DILocation(line: 292, column: 23, scope: !640)
!852 = !DILocation(line: 292, column: 34, scope: !640)
!853 = !DILocation(line: 292, column: 39, scope: !640)
!854 = !DILocation(line: 292, column: 2, scope: !640)
!855 = !DILocation(line: 293, column: 2, scope: !640)
!856 = !DILocation(line: 299, column: 13, scope: !640)
!857 = !DILocation(line: 299, column: 24, scope: !640)
!858 = !DILocation(line: 299, column: 36, scope: !640)
!859 = !DILocation(line: 299, column: 41, scope: !640)
!860 = !DILocation(line: 299, column: 2, scope: !640)
!861 = !DILocation(line: 300, column: 2, scope: !640)
!862 = !DILocation(line: 302, column: 10, scope: !640)
!863 = !DILocation(line: 302, column: 8, scope: !640)
!864 = !DILocation(line: 308, column: 11, scope: !640)
!865 = !DILocation(line: 308, column: 2, scope: !640)
!866 = !DILocation(line: 310, column: 11, scope: !640)
!867 = !DILocation(line: 310, column: 2, scope: !640)
!868 = !DILocation(line: 311, column: 11, scope: !640)
!869 = !DILocation(line: 311, column: 2, scope: !640)
!870 = !DILocation(line: 312, column: 11, scope: !640)
!871 = !DILocation(line: 312, column: 2, scope: !640)
!872 = !DILocation(line: 313, column: 11, scope: !640)
!873 = !DILocation(line: 313, column: 2, scope: !640)
!874 = !DILocation(line: 314, column: 11, scope: !640)
!875 = !DILocation(line: 314, column: 2, scope: !640)
!876 = !DILocation(line: 315, column: 11, scope: !640)
!877 = !DILocation(line: 315, column: 2, scope: !640)
!878 = !DILocation(line: 316, column: 11, scope: !640)
!879 = !DILocation(line: 316, column: 2, scope: !640)
!880 = !DILocation(line: 317, column: 11, scope: !640)
!881 = !DILocation(line: 317, column: 2, scope: !640)
!882 = !DILocation(line: 319, column: 10, scope: !640)
!883 = !DILocation(line: 319, column: 8, scope: !640)
!884 = !DILocation(line: 325, column: 2, scope: !640)
!885 = !DILocation(line: 327, column: 76, scope: !640)
!886 = !DILocation(line: 327, column: 82, scope: !640)
!887 = !DILocation(line: 327, column: 81, scope: !640)
!888 = !DILocation(line: 327, column: 75, scope: !640)
!889 = !DILocation(line: 327, column: 89, scope: !640)
!890 = !DILocation(line: 327, column: 67, scope: !640)
!891 = !DILocation(line: 327, column: 109, scope: !640)
!892 = !DILocation(line: 327, column: 115, scope: !640)
!893 = !DILocation(line: 327, column: 114, scope: !640)
!894 = !DILocation(line: 327, column: 108, scope: !640)
!895 = !DILocation(line: 327, column: 133, scope: !640)
!896 = !DILocation(line: 327, column: 139, scope: !640)
!897 = !DILocation(line: 327, column: 138, scope: !640)
!898 = !DILocation(line: 327, column: 132, scope: !640)
!899 = !DILocation(line: 327, column: 122, scope: !640)
!900 = !DILocation(line: 327, column: 146, scope: !640)
!901 = !DILocation(line: 327, column: 100, scope: !640)
!902 = !DILocation(line: 327, column: 2, scope: !640)
!903 = !DILocation(line: 328, column: 64, scope: !640)
!904 = !DILocation(line: 328, column: 70, scope: !640)
!905 = !DILocation(line: 328, column: 69, scope: !640)
!906 = !DILocation(line: 328, column: 63, scope: !640)
!907 = !DILocation(line: 328, column: 77, scope: !640)
!908 = !DILocation(line: 328, column: 55, scope: !640)
!909 = !DILocation(line: 328, column: 97, scope: !640)
!910 = !DILocation(line: 328, column: 103, scope: !640)
!911 = !DILocation(line: 328, column: 102, scope: !640)
!912 = !DILocation(line: 328, column: 96, scope: !640)
!913 = !DILocation(line: 328, column: 121, scope: !640)
!914 = !DILocation(line: 328, column: 127, scope: !640)
!915 = !DILocation(line: 328, column: 126, scope: !640)
!916 = !DILocation(line: 328, column: 120, scope: !640)
!917 = !DILocation(line: 328, column: 110, scope: !640)
!918 = !DILocation(line: 328, column: 134, scope: !640)
!919 = !DILocation(line: 328, column: 88, scope: !640)
!920 = !DILocation(line: 328, column: 2, scope: !640)
!921 = !DILocation(line: 329, column: 67, scope: !640)
!922 = !DILocation(line: 329, column: 73, scope: !640)
!923 = !DILocation(line: 329, column: 72, scope: !640)
!924 = !DILocation(line: 329, column: 66, scope: !640)
!925 = !DILocation(line: 329, column: 80, scope: !640)
!926 = !DILocation(line: 329, column: 58, scope: !640)
!927 = !DILocation(line: 329, column: 100, scope: !640)
!928 = !DILocation(line: 329, column: 106, scope: !640)
!929 = !DILocation(line: 329, column: 105, scope: !640)
!930 = !DILocation(line: 329, column: 99, scope: !640)
!931 = !DILocation(line: 329, column: 124, scope: !640)
!932 = !DILocation(line: 329, column: 130, scope: !640)
!933 = !DILocation(line: 329, column: 129, scope: !640)
!934 = !DILocation(line: 329, column: 123, scope: !640)
!935 = !DILocation(line: 329, column: 113, scope: !640)
!936 = !DILocation(line: 329, column: 137, scope: !640)
!937 = !DILocation(line: 329, column: 91, scope: !640)
!938 = !DILocation(line: 329, column: 2, scope: !640)
!939 = !DILocation(line: 331, column: 63, scope: !640)
!940 = !DILocation(line: 331, column: 69, scope: !640)
!941 = !DILocation(line: 331, column: 68, scope: !640)
!942 = !DILocation(line: 331, column: 62, scope: !640)
!943 = !DILocation(line: 331, column: 76, scope: !640)
!944 = !DILocation(line: 331, column: 54, scope: !640)
!945 = !DILocation(line: 331, column: 96, scope: !640)
!946 = !DILocation(line: 331, column: 102, scope: !640)
!947 = !DILocation(line: 331, column: 101, scope: !640)
!948 = !DILocation(line: 331, column: 95, scope: !640)
!949 = !DILocation(line: 331, column: 120, scope: !640)
!950 = !DILocation(line: 331, column: 126, scope: !640)
!951 = !DILocation(line: 331, column: 125, scope: !640)
!952 = !DILocation(line: 331, column: 119, scope: !640)
!953 = !DILocation(line: 331, column: 109, scope: !640)
!954 = !DILocation(line: 331, column: 133, scope: !640)
!955 = !DILocation(line: 331, column: 87, scope: !640)
!956 = !DILocation(line: 331, column: 2, scope: !640)
!957 = !DILocation(line: 333, column: 67, scope: !640)
!958 = !DILocation(line: 333, column: 73, scope: !640)
!959 = !DILocation(line: 333, column: 72, scope: !640)
!960 = !DILocation(line: 333, column: 66, scope: !640)
!961 = !DILocation(line: 333, column: 80, scope: !640)
!962 = !DILocation(line: 333, column: 58, scope: !640)
!963 = !DILocation(line: 333, column: 100, scope: !640)
!964 = !DILocation(line: 333, column: 106, scope: !640)
!965 = !DILocation(line: 333, column: 105, scope: !640)
!966 = !DILocation(line: 333, column: 99, scope: !640)
!967 = !DILocation(line: 333, column: 124, scope: !640)
!968 = !DILocation(line: 333, column: 130, scope: !640)
!969 = !DILocation(line: 333, column: 129, scope: !640)
!970 = !DILocation(line: 333, column: 123, scope: !640)
!971 = !DILocation(line: 333, column: 113, scope: !640)
!972 = !DILocation(line: 333, column: 137, scope: !640)
!973 = !DILocation(line: 333, column: 91, scope: !640)
!974 = !DILocation(line: 333, column: 2, scope: !640)
!975 = !DILocation(line: 334, column: 64, scope: !640)
!976 = !DILocation(line: 334, column: 70, scope: !640)
!977 = !DILocation(line: 334, column: 69, scope: !640)
!978 = !DILocation(line: 334, column: 63, scope: !640)
!979 = !DILocation(line: 334, column: 77, scope: !640)
!980 = !DILocation(line: 334, column: 55, scope: !640)
!981 = !DILocation(line: 334, column: 97, scope: !640)
!982 = !DILocation(line: 334, column: 103, scope: !640)
!983 = !DILocation(line: 334, column: 102, scope: !640)
!984 = !DILocation(line: 334, column: 96, scope: !640)
!985 = !DILocation(line: 334, column: 121, scope: !640)
!986 = !DILocation(line: 334, column: 127, scope: !640)
!987 = !DILocation(line: 334, column: 126, scope: !640)
!988 = !DILocation(line: 334, column: 120, scope: !640)
!989 = !DILocation(line: 334, column: 110, scope: !640)
!990 = !DILocation(line: 334, column: 134, scope: !640)
!991 = !DILocation(line: 334, column: 88, scope: !640)
!992 = !DILocation(line: 334, column: 2, scope: !640)
!993 = !DILocation(line: 336, column: 2, scope: !640)
!994 = !DILocation(line: 337, column: 43, scope: !640)
!995 = !DILocation(line: 337, column: 49, scope: !640)
!996 = !DILocation(line: 337, column: 48, scope: !640)
!997 = !DILocation(line: 337, column: 42, scope: !640)
!998 = !DILocation(line: 337, column: 56, scope: !640)
!999 = !DILocation(line: 337, column: 34, scope: !640)
!1000 = !DILocation(line: 337, column: 2, scope: !640)
!1001 = !DILocation(line: 339, column: 1, scope: !640)
!1002 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1004, file: !1003, line: 421, type: !1010, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !1009, variables: !592)
!1003 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!1004 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1003, line: 417, size: 96, align: 32, elements: !1005, identifier: "_ZTS4dim3")
!1005 = !{!1006, !1007, !1008, !1009, !1013, !1022}
!1006 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1004, file: !1003, line: 419, baseType: !375, size: 32, align: 32)
!1007 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1004, file: !1003, line: 419, baseType: !375, size: 32, align: 32, offset: 32)
!1008 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1004, file: !1003, line: 419, baseType: !375, size: 32, align: 32, offset: 64)
!1009 = !DISubprogram(name: "dim3", scope: !1004, file: !1003, line: 421, type: !1010, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!1010 = !DISubroutineType(types: !1011)
!1011 = !{null, !1012, !375, !375, !375}
!1012 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1004, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1013 = !DISubprogram(name: "dim3", scope: !1004, file: !1003, line: 422, type: !1014, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!1014 = !DISubroutineType(types: !1015)
!1015 = !{null, !1012, !1016}
!1016 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1003, line: 383, baseType: !1017)
!1017 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1003, line: 190, size: 96, align: 32, elements: !1018, identifier: "_ZTS5uint3")
!1018 = !{!1019, !1020, !1021}
!1019 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1017, file: !1003, line: 192, baseType: !375, size: 32, align: 32)
!1020 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1017, file: !1003, line: 192, baseType: !375, size: 32, align: 32, offset: 32)
!1021 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1017, file: !1003, line: 192, baseType: !375, size: 32, align: 32, offset: 64)
!1022 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1004, file: !1003, line: 423, type: !1023, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!1023 = !DISubroutineType(types: !1024)
!1024 = !{!1016, !1012}
!1025 = !DILocalVariable(name: "this", arg: 1, scope: !1002, type: !1026, flags: DIFlagArtificial | DIFlagObjectPointer)
!1026 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1004, size: 64, align: 64)
!1027 = !DILocation(line: 0, scope: !1002)
!1028 = !DILocalVariable(name: "vx", arg: 2, scope: !1002, file: !1003, line: 421, type: !375)
!1029 = !DILocation(line: 421, column: 43, scope: !1002)
!1030 = !DILocalVariable(name: "vy", arg: 3, scope: !1002, file: !1003, line: 421, type: !375)
!1031 = !DILocation(line: 421, column: 64, scope: !1002)
!1032 = !DILocalVariable(name: "vz", arg: 4, scope: !1002, file: !1003, line: 421, type: !375)
!1033 = !DILocation(line: 421, column: 85, scope: !1002)
!1034 = !DILocation(line: 421, column: 95, scope: !1002)
!1035 = !DILocation(line: 421, column: 97, scope: !1002)
!1036 = !DILocation(line: 421, column: 102, scope: !1002)
!1037 = !DILocation(line: 421, column: 104, scope: !1002)
!1038 = !DILocation(line: 421, column: 109, scope: !1002)
!1039 = !DILocation(line: 421, column: 111, scope: !1002)
!1040 = !DILocation(line: 421, column: 116, scope: !1002)
