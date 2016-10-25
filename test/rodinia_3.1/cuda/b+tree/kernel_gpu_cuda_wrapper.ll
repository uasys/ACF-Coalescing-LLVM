; ModuleID = './kernel/kernel_gpu_cuda_wrapper.cu'
source_filename = "./kernel/kernel_gpu_cuda_wrapper.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.knode = type { i32, [257 x i32], [257 x i32], i8, i32 }
%struct.record = type { i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@.str = private unnamed_addr constant [75 x i8] c"# of blocks = %d, # of threads/block = %d (ensure that device can handle)\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"cudaMalloc  recordsD\00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"cudaMalloc  currKnodeD\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"cudaMalloc  offsetD\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"cudaMalloc  keysD\00", align 1
@.str.5 = private unnamed_addr constant [16 x i8] c"cudaMalloc ansD\00", align 1
@.str.6 = private unnamed_addr constant [27 x i8] c"cudaMalloc cudaMemcpy memD\00", align 1
@.str.7 = private unnamed_addr constant [33 x i8] c"cudaMalloc cudaMemcpy currKnodeD\00", align 1
@.str.8 = private unnamed_addr constant [30 x i8] c"cudaMalloc cudaMemcpy offsetD\00", align 1
@.str.9 = private unnamed_addr constant [28 x i8] c"cudaMalloc cudaMemcpy keysD\00", align 1
@.str.10 = private unnamed_addr constant [27 x i8] c"cudaMalloc cudaMemcpy ansD\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"findK\00", align 1
@.str.12 = private unnamed_addr constant [16 x i8] c"cudaMemcpy ansD\00", align 1
@.str.13 = private unnamed_addr constant [52 x i8] c"Time spent in different stages of GPU_CUDA KERNEL:\0A\00", align 1
@.str.14 = private unnamed_addr constant [54 x i8] c"%15.12f s, %15.12f % : GPU: SET DEVICE / DRIVER INIT\0A\00", align 1
@.str.15 = private unnamed_addr constant [37 x i8] c"%15.12f s, %15.12f % : GPU MEM: ALO\0A\00", align 1
@.str.16 = private unnamed_addr constant [41 x i8] c"%15.12f s, %15.12f % : GPU MEM: COPY IN\0A\00", align 1
@.str.17 = private unnamed_addr constant [36 x i8] c"%15.12f s, %15.12f % : GPU: KERNEL\0A\00", align 1
@.str.18 = private unnamed_addr constant [42 x i8] c"%15.12f s, %15.12f % : GPU MEM: COPY OUT\0A\00", align 1
@.str.19 = private unnamed_addr constant [37 x i8] c"%15.12f s, %15.12f % : GPU MEM: FRE\0A\00", align 1
@.str.20 = private unnamed_addr constant [13 x i8] c"Total time:\0A\00", align 1
@.str.21 = private unnamed_addr constant [9 x i8] c"%.12f s\0A\00", align 1

; Function Attrs: uwtable
define void @findK(i64 %height, %struct.knode* %knodesD, i64 %knodes_elem, %struct.record* %recordsD, i64* %currKnodeD, i64* %offsetD, i32* %keysD, %struct.record* %ansD) #0 !dbg !574 {
entry:
  %height.addr = alloca i64, align 8
  %knodesD.addr = alloca %struct.knode*, align 8
  %knodes_elem.addr = alloca i64, align 8
  %recordsD.addr = alloca %struct.record*, align 8
  %currKnodeD.addr = alloca i64*, align 8
  %offsetD.addr = alloca i64*, align 8
  %keysD.addr = alloca i32*, align 8
  %ansD.addr = alloca %struct.record*, align 8
  store i64 %height, i64* %height.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %height.addr, metadata !598, metadata !599), !dbg !600
  store %struct.knode* %knodesD, %struct.knode** %knodesD.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.knode** %knodesD.addr, metadata !601, metadata !599), !dbg !602
  store i64 %knodes_elem, i64* %knodes_elem.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %knodes_elem.addr, metadata !603, metadata !599), !dbg !604
  store %struct.record* %recordsD, %struct.record** %recordsD.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %recordsD.addr, metadata !605, metadata !599), !dbg !606
  store i64* %currKnodeD, i64** %currKnodeD.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %currKnodeD.addr, metadata !607, metadata !599), !dbg !608
  store i64* %offsetD, i64** %offsetD.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %offsetD.addr, metadata !609, metadata !599), !dbg !610
  store i32* %keysD, i32** %keysD.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %keysD.addr, metadata !611, metadata !599), !dbg !612
  store %struct.record* %ansD, %struct.record** %ansD.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %ansD.addr, metadata !613, metadata !599), !dbg !614
  %0 = bitcast i64* %height.addr to i8*, !dbg !615
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !615
  %2 = icmp eq i32 %1, 0, !dbg !615
  br i1 %2, label %setup.next, label %setup.end, !dbg !615

setup.next:                                       ; preds = %entry
  %3 = bitcast %struct.knode** %knodesD.addr to i8*, !dbg !616
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !616
  %5 = icmp eq i32 %4, 0, !dbg !616
  br i1 %5, label %setup.next1, label %setup.end, !dbg !616

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i64* %knodes_elem.addr to i8*, !dbg !618
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !618
  %8 = icmp eq i32 %7, 0, !dbg !618
  br i1 %8, label %setup.next2, label %setup.end, !dbg !618

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast %struct.record** %recordsD.addr to i8*, !dbg !620
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !620
  %11 = icmp eq i32 %10, 0, !dbg !620
  br i1 %11, label %setup.next3, label %setup.end, !dbg !620

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i64** %currKnodeD.addr to i8*, !dbg !622
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !622
  %14 = icmp eq i32 %13, 0, !dbg !622
  br i1 %14, label %setup.next4, label %setup.end, !dbg !622

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i64** %offsetD.addr to i8*, !dbg !624
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !624
  %17 = icmp eq i32 %16, 0, !dbg !624
  br i1 %17, label %setup.next5, label %setup.end, !dbg !624

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i32** %keysD.addr to i8*, !dbg !626
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 8, i64 48), !dbg !626
  %20 = icmp eq i32 %19, 0, !dbg !626
  br i1 %20, label %setup.next6, label %setup.end, !dbg !626

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast %struct.record** %ansD.addr to i8*, !dbg !628
  %22 = call i32 @cudaSetupArgument(i8* %21, i64 8, i64 56), !dbg !628
  %23 = icmp eq i32 %22, 0, !dbg !628
  br i1 %23, label %setup.next7, label %setup.end, !dbg !628

setup.next7:                                      ; preds = %setup.next6
  %24 = call i32 @cudaLaunch(i8* bitcast (void (i64, %struct.knode*, i64, %struct.record*, i64*, i64*, i32*, %struct.record*)* @findK to i8*)), !dbg !630
  br label %setup.end, !dbg !630

setup.end:                                        ; preds = %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !632
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @kernel_gpu_cuda_wrapper(%struct.record* %records, i64 %records_mem, %struct.knode* %knodes, i64 %knodes_elem, i64 %knodes_mem, i32 %order, i64 %maxheight, i32 %count, i64* %currKnode, i64* %offset, i32* %keys, %struct.record* %ans) #0 !dbg !633 {
entry:
  %records.addr = alloca %struct.record*, align 8
  %records_mem.addr = alloca i64, align 8
  %knodes.addr = alloca %struct.knode*, align 8
  %knodes_elem.addr = alloca i64, align 8
  %knodes_mem.addr = alloca i64, align 8
  %order.addr = alloca i32, align 4
  %maxheight.addr = alloca i64, align 8
  %count.addr = alloca i32, align 4
  %currKnode.addr = alloca i64*, align 8
  %offset.addr = alloca i64*, align 8
  %keys.addr = alloca i32*, align 8
  %ans.addr = alloca %struct.record*, align 8
  %time0 = alloca i64, align 8
  %time1 = alloca i64, align 8
  %time2 = alloca i64, align 8
  %time3 = alloca i64, align 8
  %time4 = alloca i64, align 8
  %time5 = alloca i64, align 8
  %time6 = alloca i64, align 8
  %numBlocks = alloca i32, align 4
  %threadsPerBlock = alloca i32, align 4
  %recordsD = alloca %struct.record*, align 8
  %knodesD = alloca %struct.knode*, align 8
  %currKnodeD = alloca i64*, align 8
  %offsetD = alloca i64*, align 8
  %keysD = alloca i32*, align 8
  %ansD = alloca %struct.record*, align 8
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp32 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp32.coerce = alloca { i64, i32 }, align 4
  store %struct.record* %records, %struct.record** %records.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %records.addr, metadata !636, metadata !599), !dbg !637
  store i64 %records_mem, i64* %records_mem.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %records_mem.addr, metadata !638, metadata !599), !dbg !639
  store %struct.knode* %knodes, %struct.knode** %knodes.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.knode** %knodes.addr, metadata !640, metadata !599), !dbg !641
  store i64 %knodes_elem, i64* %knodes_elem.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %knodes_elem.addr, metadata !642, metadata !599), !dbg !643
  store i64 %knodes_mem, i64* %knodes_mem.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %knodes_mem.addr, metadata !644, metadata !599), !dbg !645
  store i32 %order, i32* %order.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %order.addr, metadata !646, metadata !599), !dbg !647
  store i64 %maxheight, i64* %maxheight.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %maxheight.addr, metadata !648, metadata !599), !dbg !649
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !650, metadata !599), !dbg !651
  store i64* %currKnode, i64** %currKnode.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %currKnode.addr, metadata !652, metadata !599), !dbg !653
  store i64* %offset, i64** %offset.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %offset.addr, metadata !654, metadata !599), !dbg !655
  store i32* %keys, i32** %keys.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %keys.addr, metadata !656, metadata !599), !dbg !657
  store %struct.record* %ans, %struct.record** %ans.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.record** %ans.addr, metadata !658, metadata !599), !dbg !659
  call void @llvm.dbg.declare(metadata i64* %time0, metadata !660, metadata !599), !dbg !661
  call void @llvm.dbg.declare(metadata i64* %time1, metadata !662, metadata !599), !dbg !663
  call void @llvm.dbg.declare(metadata i64* %time2, metadata !664, metadata !599), !dbg !665
  call void @llvm.dbg.declare(metadata i64* %time3, metadata !666, metadata !599), !dbg !667
  call void @llvm.dbg.declare(metadata i64* %time4, metadata !668, metadata !599), !dbg !669
  call void @llvm.dbg.declare(metadata i64* %time5, metadata !670, metadata !599), !dbg !671
  call void @llvm.dbg.declare(metadata i64* %time6, metadata !672, metadata !599), !dbg !673
  %call = call i64 @get_time(), !dbg !674
  store i64 %call, i64* %time0, align 8, !dbg !675
  %call1 = call i32 @cudaThreadSynchronize(), !dbg !676
  call void @llvm.dbg.declare(metadata i32* %numBlocks, metadata !677, metadata !599), !dbg !678
  %0 = load i32, i32* %count.addr, align 4, !dbg !679
  store i32 %0, i32* %numBlocks, align 4, !dbg !680
  call void @llvm.dbg.declare(metadata i32* %threadsPerBlock, metadata !681, metadata !599), !dbg !682
  %1 = load i32, i32* %order.addr, align 4, !dbg !683
  %cmp = icmp slt i32 %1, 1024, !dbg !684
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !683

cond.true:                                        ; preds = %entry
  %2 = load i32, i32* %order.addr, align 4, !dbg !685
  br label %cond.end, !dbg !687

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !688

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ 1024, %cond.false ], !dbg !690
  store i32 %cond, i32* %threadsPerBlock, align 4, !dbg !692
  %3 = load i32, i32* %numBlocks, align 4, !dbg !693
  %4 = load i32, i32* %threadsPerBlock, align 4, !dbg !694
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str, i32 0, i32 0), i32 %3, i32 %4), !dbg !695
  %call3 = call i64 @get_time(), !dbg !696
  store i64 %call3, i64* %time1, align 8, !dbg !697
  call void @llvm.dbg.declare(metadata %struct.record** %recordsD, metadata !698, metadata !599), !dbg !699
  %5 = bitcast %struct.record** %recordsD to i8**, !dbg !700
  %6 = load i64, i64* %records_mem.addr, align 8, !dbg !701
  %call4 = call i32 @cudaMalloc(i8** %5, i64 %6), !dbg !702
  call void @checkCUDAError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0)), !dbg !703
  call void @llvm.dbg.declare(metadata %struct.knode** %knodesD, metadata !704, metadata !599), !dbg !705
  %7 = bitcast %struct.knode** %knodesD to i8**, !dbg !706
  %8 = load i64, i64* %knodes_mem.addr, align 8, !dbg !707
  %call5 = call i32 @cudaMalloc(i8** %7, i64 %8), !dbg !708
  call void @checkCUDAError(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0)), !dbg !709
  call void @llvm.dbg.declare(metadata i64** %currKnodeD, metadata !710, metadata !599), !dbg !711
  %9 = bitcast i64** %currKnodeD to i8**, !dbg !712
  %10 = load i32, i32* %count.addr, align 4, !dbg !713
  %conv = sext i32 %10 to i64, !dbg !713
  %mul = mul i64 %conv, 8, !dbg !714
  %call6 = call i32 @cudaMalloc(i8** %9, i64 %mul), !dbg !715
  call void @checkCUDAError(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i32 0, i32 0)), !dbg !716
  call void @llvm.dbg.declare(metadata i64** %offsetD, metadata !717, metadata !599), !dbg !718
  %11 = bitcast i64** %offsetD to i8**, !dbg !719
  %12 = load i32, i32* %count.addr, align 4, !dbg !720
  %conv7 = sext i32 %12 to i64, !dbg !720
  %mul8 = mul i64 %conv7, 8, !dbg !721
  %call9 = call i32 @cudaMalloc(i8** %11, i64 %mul8), !dbg !722
  call void @checkCUDAError(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.3, i32 0, i32 0)), !dbg !723
  call void @llvm.dbg.declare(metadata i32** %keysD, metadata !724, metadata !599), !dbg !725
  %13 = bitcast i32** %keysD to i8**, !dbg !726
  %14 = load i32, i32* %count.addr, align 4, !dbg !727
  %conv10 = sext i32 %14 to i64, !dbg !727
  %mul11 = mul i64 %conv10, 4, !dbg !728
  %call12 = call i32 @cudaMalloc(i8** %13, i64 %mul11), !dbg !729
  call void @checkCUDAError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i32 0, i32 0)), !dbg !730
  call void @llvm.dbg.declare(metadata %struct.record** %ansD, metadata !731, metadata !599), !dbg !732
  %15 = bitcast %struct.record** %ansD to i8**, !dbg !733
  %16 = load i32, i32* %count.addr, align 4, !dbg !734
  %conv13 = sext i32 %16 to i64, !dbg !734
  %mul14 = mul i64 %conv13, 4, !dbg !735
  %call15 = call i32 @cudaMalloc(i8** %15, i64 %mul14), !dbg !736
  call void @checkCUDAError(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.5, i32 0, i32 0)), !dbg !737
  %call16 = call i64 @get_time(), !dbg !738
  store i64 %call16, i64* %time2, align 8, !dbg !739
  %17 = load %struct.record*, %struct.record** %recordsD, align 8, !dbg !740
  %18 = bitcast %struct.record* %17 to i8*, !dbg !740
  %19 = load %struct.record*, %struct.record** %records.addr, align 8, !dbg !741
  %20 = bitcast %struct.record* %19 to i8*, !dbg !741
  %21 = load i64, i64* %records_mem.addr, align 8, !dbg !742
  %call17 = call i32 @cudaMemcpy(i8* %18, i8* %20, i64 %21, i32 1), !dbg !743
  call void @checkCUDAError(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.6, i32 0, i32 0)), !dbg !744
  %22 = load %struct.knode*, %struct.knode** %knodesD, align 8, !dbg !745
  %23 = bitcast %struct.knode* %22 to i8*, !dbg !745
  %24 = load %struct.knode*, %struct.knode** %knodes.addr, align 8, !dbg !746
  %25 = bitcast %struct.knode* %24 to i8*, !dbg !746
  %26 = load i64, i64* %knodes_mem.addr, align 8, !dbg !747
  %call18 = call i32 @cudaMemcpy(i8* %23, i8* %25, i64 %26, i32 1), !dbg !748
  call void @checkCUDAError(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.6, i32 0, i32 0)), !dbg !749
  %27 = load i64*, i64** %currKnodeD, align 8, !dbg !750
  %28 = bitcast i64* %27 to i8*, !dbg !750
  %29 = load i64*, i64** %currKnode.addr, align 8, !dbg !751
  %30 = bitcast i64* %29 to i8*, !dbg !751
  %31 = load i32, i32* %count.addr, align 4, !dbg !752
  %conv19 = sext i32 %31 to i64, !dbg !752
  %mul20 = mul i64 %conv19, 8, !dbg !753
  %call21 = call i32 @cudaMemcpy(i8* %28, i8* %30, i64 %mul20, i32 1), !dbg !754
  call void @checkCUDAError(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.7, i32 0, i32 0)), !dbg !755
  %32 = load i64*, i64** %offsetD, align 8, !dbg !756
  %33 = bitcast i64* %32 to i8*, !dbg !756
  %34 = load i64*, i64** %offset.addr, align 8, !dbg !757
  %35 = bitcast i64* %34 to i8*, !dbg !757
  %36 = load i32, i32* %count.addr, align 4, !dbg !758
  %conv22 = sext i32 %36 to i64, !dbg !758
  %mul23 = mul i64 %conv22, 8, !dbg !759
  %call24 = call i32 @cudaMemcpy(i8* %33, i8* %35, i64 %mul23, i32 1), !dbg !760
  call void @checkCUDAError(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.8, i32 0, i32 0)), !dbg !761
  %37 = load i32*, i32** %keysD, align 8, !dbg !762
  %38 = bitcast i32* %37 to i8*, !dbg !762
  %39 = load i32*, i32** %keys.addr, align 8, !dbg !763
  %40 = bitcast i32* %39 to i8*, !dbg !763
  %41 = load i32, i32* %count.addr, align 4, !dbg !764
  %conv25 = sext i32 %41 to i64, !dbg !764
  %mul26 = mul i64 %conv25, 4, !dbg !765
  %call27 = call i32 @cudaMemcpy(i8* %38, i8* %40, i64 %mul26, i32 1), !dbg !766
  call void @checkCUDAError(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.9, i32 0, i32 0)), !dbg !767
  %42 = load %struct.record*, %struct.record** %ansD, align 8, !dbg !768
  %43 = bitcast %struct.record* %42 to i8*, !dbg !768
  %44 = load %struct.record*, %struct.record** %ans.addr, align 8, !dbg !769
  %45 = bitcast %struct.record* %44 to i8*, !dbg !769
  %46 = load i32, i32* %count.addr, align 4, !dbg !770
  %conv28 = sext i32 %46 to i64, !dbg !770
  %mul29 = mul i64 %conv28, 4, !dbg !771
  %call30 = call i32 @cudaMemcpy(i8* %43, i8* %45, i64 %mul29, i32 1), !dbg !772
  call void @checkCUDAError(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.10, i32 0, i32 0)), !dbg !773
  %call31 = call i64 @get_time(), !dbg !774
  store i64 %call31, i64* %time3, align 8, !dbg !775
  %47 = load i32, i32* %numBlocks, align 4, !dbg !776
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp, i32 %47, i32 1, i32 1), !dbg !776
  %48 = load i32, i32* %threadsPerBlock, align 4, !dbg !777
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %agg.tmp32, i32 %48, i32 1, i32 1), !dbg !778
  %49 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !779
  %50 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !779
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %49, i8* %50, i64 12, i32 4, i1 false), !dbg !779
  %51 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !779
  %52 = load i64, i64* %51, align 4, !dbg !779
  %53 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !779
  %54 = load i32, i32* %53, align 4, !dbg !779
  %55 = bitcast { i64, i32 }* %agg.tmp32.coerce to i8*, !dbg !779
  %56 = bitcast %struct.dim3* %agg.tmp32 to i8*, !dbg !779
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %55, i8* %56, i64 12, i32 4, i1 false), !dbg !779
  %57 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp32.coerce, i32 0, i32 0, !dbg !779
  %58 = load i64, i64* %57, align 4, !dbg !779
  %59 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp32.coerce, i32 0, i32 1, !dbg !779
  %60 = load i32, i32* %59, align 4, !dbg !779
  %call33 = call i32 @cudaConfigureCall(i64 %52, i32 %54, i64 %58, i32 %60, i64 0, %struct.CUstream_st* null), !dbg !780
  %tobool = icmp ne i32 %call33, 0, !dbg !779
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !781

kcall.configok:                                   ; preds = %cond.end
  %61 = load i64, i64* %maxheight.addr, align 8, !dbg !782
  %62 = load %struct.knode*, %struct.knode** %knodesD, align 8, !dbg !783
  %63 = load i64, i64* %knodes_elem.addr, align 8, !dbg !784
  %64 = load %struct.record*, %struct.record** %recordsD, align 8, !dbg !785
  %65 = load i64*, i64** %currKnodeD, align 8, !dbg !786
  %66 = load i64*, i64** %offsetD, align 8, !dbg !787
  %67 = load i32*, i32** %keysD, align 8, !dbg !788
  %68 = load %struct.record*, %struct.record** %ansD, align 8, !dbg !789
  call void @findK(i64 %61, %struct.knode* %62, i64 %63, %struct.record* %64, i64* %65, i64* %66, i32* %67, %struct.record* %68), !dbg !790
  br label %kcall.end, !dbg !790

kcall.end:                                        ; preds = %kcall.configok, %cond.end
  %call34 = call i32 @cudaThreadSynchronize(), !dbg !791
  call void @checkCUDAError(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i32 0, i32 0)), !dbg !792
  %call35 = call i64 @get_time(), !dbg !793
  store i64 %call35, i64* %time4, align 8, !dbg !794
  %69 = load %struct.record*, %struct.record** %ans.addr, align 8, !dbg !795
  %70 = bitcast %struct.record* %69 to i8*, !dbg !795
  %71 = load %struct.record*, %struct.record** %ansD, align 8, !dbg !796
  %72 = bitcast %struct.record* %71 to i8*, !dbg !796
  %73 = load i32, i32* %count.addr, align 4, !dbg !797
  %conv36 = sext i32 %73 to i64, !dbg !797
  %mul37 = mul i64 %conv36, 4, !dbg !798
  %call38 = call i32 @cudaMemcpy(i8* %70, i8* %72, i64 %mul37, i32 2), !dbg !799
  call void @checkCUDAError(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.12, i32 0, i32 0)), !dbg !800
  %call39 = call i64 @get_time(), !dbg !801
  store i64 %call39, i64* %time5, align 8, !dbg !802
  %74 = load %struct.record*, %struct.record** %recordsD, align 8, !dbg !803
  %75 = bitcast %struct.record* %74 to i8*, !dbg !803
  %call40 = call i32 @cudaFree(i8* %75), !dbg !804
  %76 = load %struct.knode*, %struct.knode** %knodesD, align 8, !dbg !805
  %77 = bitcast %struct.knode* %76 to i8*, !dbg !805
  %call41 = call i32 @cudaFree(i8* %77), !dbg !806
  %78 = load i64*, i64** %currKnodeD, align 8, !dbg !807
  %79 = bitcast i64* %78 to i8*, !dbg !807
  %call42 = call i32 @cudaFree(i8* %79), !dbg !808
  %80 = load i64*, i64** %offsetD, align 8, !dbg !809
  %81 = bitcast i64* %80 to i8*, !dbg !809
  %call43 = call i32 @cudaFree(i8* %81), !dbg !810
  %82 = load i32*, i32** %keysD, align 8, !dbg !811
  %83 = bitcast i32* %82 to i8*, !dbg !811
  %call44 = call i32 @cudaFree(i8* %83), !dbg !812
  %84 = load %struct.record*, %struct.record** %ansD, align 8, !dbg !813
  %85 = bitcast %struct.record* %84 to i8*, !dbg !813
  %call45 = call i32 @cudaFree(i8* %85), !dbg !814
  %call46 = call i64 @get_time(), !dbg !815
  store i64 %call46, i64* %time6, align 8, !dbg !816
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.13, i32 0, i32 0)), !dbg !817
  %86 = load i64, i64* %time1, align 8, !dbg !818
  %87 = load i64, i64* %time0, align 8, !dbg !819
  %sub = sub nsw i64 %86, %87, !dbg !820
  %conv48 = sitofp i64 %sub to float, !dbg !821
  %div = fdiv float %conv48, 1.000000e+06, !dbg !822
  %conv49 = fpext float %div to double, !dbg !823
  %88 = load i64, i64* %time1, align 8, !dbg !824
  %89 = load i64, i64* %time0, align 8, !dbg !825
  %sub50 = sub nsw i64 %88, %89, !dbg !826
  %conv51 = sitofp i64 %sub50 to float, !dbg !827
  %90 = load i64, i64* %time6, align 8, !dbg !828
  %91 = load i64, i64* %time0, align 8, !dbg !829
  %sub52 = sub nsw i64 %90, %91, !dbg !830
  %conv53 = sitofp i64 %sub52 to float, !dbg !831
  %div54 = fdiv float %conv51, %conv53, !dbg !832
  %mul55 = fmul float %div54, 1.000000e+02, !dbg !833
  %conv56 = fpext float %mul55 to double, !dbg !834
  %call57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.14, i32 0, i32 0), double %conv49, double %conv56), !dbg !835
  %92 = load i64, i64* %time2, align 8, !dbg !836
  %93 = load i64, i64* %time1, align 8, !dbg !837
  %sub58 = sub nsw i64 %92, %93, !dbg !838
  %conv59 = sitofp i64 %sub58 to float, !dbg !839
  %div60 = fdiv float %conv59, 1.000000e+06, !dbg !840
  %conv61 = fpext float %div60 to double, !dbg !841
  %94 = load i64, i64* %time2, align 8, !dbg !842
  %95 = load i64, i64* %time1, align 8, !dbg !843
  %sub62 = sub nsw i64 %94, %95, !dbg !844
  %conv63 = sitofp i64 %sub62 to float, !dbg !845
  %96 = load i64, i64* %time6, align 8, !dbg !846
  %97 = load i64, i64* %time0, align 8, !dbg !847
  %sub64 = sub nsw i64 %96, %97, !dbg !848
  %conv65 = sitofp i64 %sub64 to float, !dbg !849
  %div66 = fdiv float %conv63, %conv65, !dbg !850
  %mul67 = fmul float %div66, 1.000000e+02, !dbg !851
  %conv68 = fpext float %mul67 to double, !dbg !852
  %call69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.15, i32 0, i32 0), double %conv61, double %conv68), !dbg !853
  %98 = load i64, i64* %time3, align 8, !dbg !854
  %99 = load i64, i64* %time2, align 8, !dbg !855
  %sub70 = sub nsw i64 %98, %99, !dbg !856
  %conv71 = sitofp i64 %sub70 to float, !dbg !857
  %div72 = fdiv float %conv71, 1.000000e+06, !dbg !858
  %conv73 = fpext float %div72 to double, !dbg !859
  %100 = load i64, i64* %time3, align 8, !dbg !860
  %101 = load i64, i64* %time2, align 8, !dbg !861
  %sub74 = sub nsw i64 %100, %101, !dbg !862
  %conv75 = sitofp i64 %sub74 to float, !dbg !863
  %102 = load i64, i64* %time6, align 8, !dbg !864
  %103 = load i64, i64* %time0, align 8, !dbg !865
  %sub76 = sub nsw i64 %102, %103, !dbg !866
  %conv77 = sitofp i64 %sub76 to float, !dbg !867
  %div78 = fdiv float %conv75, %conv77, !dbg !868
  %mul79 = fmul float %div78, 1.000000e+02, !dbg !869
  %conv80 = fpext float %mul79 to double, !dbg !870
  %call81 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.16, i32 0, i32 0), double %conv73, double %conv80), !dbg !871
  %104 = load i64, i64* %time4, align 8, !dbg !872
  %105 = load i64, i64* %time3, align 8, !dbg !873
  %sub82 = sub nsw i64 %104, %105, !dbg !874
  %conv83 = sitofp i64 %sub82 to float, !dbg !875
  %div84 = fdiv float %conv83, 1.000000e+06, !dbg !876
  %conv85 = fpext float %div84 to double, !dbg !877
  %106 = load i64, i64* %time4, align 8, !dbg !878
  %107 = load i64, i64* %time3, align 8, !dbg !879
  %sub86 = sub nsw i64 %106, %107, !dbg !880
  %conv87 = sitofp i64 %sub86 to float, !dbg !881
  %108 = load i64, i64* %time6, align 8, !dbg !882
  %109 = load i64, i64* %time0, align 8, !dbg !883
  %sub88 = sub nsw i64 %108, %109, !dbg !884
  %conv89 = sitofp i64 %sub88 to float, !dbg !885
  %div90 = fdiv float %conv87, %conv89, !dbg !886
  %mul91 = fmul float %div90, 1.000000e+02, !dbg !887
  %conv92 = fpext float %mul91 to double, !dbg !888
  %call93 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.17, i32 0, i32 0), double %conv85, double %conv92), !dbg !889
  %110 = load i64, i64* %time5, align 8, !dbg !890
  %111 = load i64, i64* %time4, align 8, !dbg !891
  %sub94 = sub nsw i64 %110, %111, !dbg !892
  %conv95 = sitofp i64 %sub94 to float, !dbg !893
  %div96 = fdiv float %conv95, 1.000000e+06, !dbg !894
  %conv97 = fpext float %div96 to double, !dbg !895
  %112 = load i64, i64* %time5, align 8, !dbg !896
  %113 = load i64, i64* %time4, align 8, !dbg !897
  %sub98 = sub nsw i64 %112, %113, !dbg !898
  %conv99 = sitofp i64 %sub98 to float, !dbg !899
  %114 = load i64, i64* %time6, align 8, !dbg !900
  %115 = load i64, i64* %time0, align 8, !dbg !901
  %sub100 = sub nsw i64 %114, %115, !dbg !902
  %conv101 = sitofp i64 %sub100 to float, !dbg !903
  %div102 = fdiv float %conv99, %conv101, !dbg !904
  %mul103 = fmul float %div102, 1.000000e+02, !dbg !905
  %conv104 = fpext float %mul103 to double, !dbg !906
  %call105 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.18, i32 0, i32 0), double %conv97, double %conv104), !dbg !907
  %116 = load i64, i64* %time6, align 8, !dbg !908
  %117 = load i64, i64* %time5, align 8, !dbg !909
  %sub106 = sub nsw i64 %116, %117, !dbg !910
  %conv107 = sitofp i64 %sub106 to float, !dbg !911
  %div108 = fdiv float %conv107, 1.000000e+06, !dbg !912
  %conv109 = fpext float %div108 to double, !dbg !913
  %118 = load i64, i64* %time6, align 8, !dbg !914
  %119 = load i64, i64* %time5, align 8, !dbg !915
  %sub110 = sub nsw i64 %118, %119, !dbg !916
  %conv111 = sitofp i64 %sub110 to float, !dbg !917
  %120 = load i64, i64* %time6, align 8, !dbg !918
  %121 = load i64, i64* %time0, align 8, !dbg !919
  %sub112 = sub nsw i64 %120, %121, !dbg !920
  %conv113 = sitofp i64 %sub112 to float, !dbg !921
  %div114 = fdiv float %conv111, %conv113, !dbg !922
  %mul115 = fmul float %div114, 1.000000e+02, !dbg !923
  %conv116 = fpext float %mul115 to double, !dbg !924
  %call117 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.19, i32 0, i32 0), double %conv109, double %conv116), !dbg !925
  %call118 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.20, i32 0, i32 0)), !dbg !926
  %122 = load i64, i64* %time6, align 8, !dbg !927
  %123 = load i64, i64* %time0, align 8, !dbg !928
  %sub119 = sub nsw i64 %122, %123, !dbg !929
  %conv120 = sitofp i64 %sub119 to float, !dbg !930
  %div121 = fdiv float %conv120, 1.000000e+06, !dbg !931
  %conv122 = fpext float %div121 to double, !dbg !932
  %call123 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.21, i32 0, i32 0), double %conv122), !dbg !933
  ret void, !dbg !934
}

declare i64 @get_time() #2

declare i32 @cudaThreadSynchronize() #2

declare i32 @printf(i8*, ...) #2

declare i32 @cudaMalloc(i8**, i64) #2

declare void @checkCUDAError(i8*) #2

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #2

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #2

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #3 comdat align 2 !dbg !935 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !958, metadata !599), !dbg !960
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !961, metadata !599), !dbg !962
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !963, metadata !599), !dbg !964
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !965, metadata !599), !dbg !966
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !967
  %0 = load i32, i32* %vx.addr, align 4, !dbg !968
  store i32 %0, i32* %x, align 4, !dbg !967
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !969
  %1 = load i32, i32* %vy.addr, align 4, !dbg !970
  store i32 %1, i32* %y, align 4, !dbg !969
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !971
  %2 = load i32, i32* %vz.addr, align 4, !dbg !972
  store i32 %2, i32* %z, align 4, !dbg !971
  ret void, !dbg !973
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
!1 = !DIFile(filename: "./kernel/kernel_gpu_cuda_wrapper.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
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
!574 = distinct !DISubprogram(name: "findK", scope: !575, file: !575, line: 6, type: !576, isLocal: false, isDefinition: true, scopeLine: 15, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !597)
!575 = !DIFile(filename: "./kernel/./kernel_gpu_cuda.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!576 = !DISubroutineType(types: !577)
!577 = !{null, !120, !578, !120, !591, !596, !596, !86, !591}
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
!591 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !592, size: 64, align: 64)
!592 = !DIDerivedType(tag: DW_TAG_typedef, name: "record", file: !580, line: 99, baseType: !593)
!593 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "record", file: !580, line: 97, size: 32, align: 32, elements: !594, identifier: "_ZTS6record")
!594 = !{!595}
!595 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !593, file: !580, line: 98, baseType: !81, size: 32, align: 32)
!596 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64, align: 64)
!597 = !{}
!598 = !DILocalVariable(name: "height", arg: 1, scope: !574, file: !575, line: 6, type: !120)
!599 = !DIExpression()
!600 = !DILocation(line: 6, column: 13, scope: !574)
!601 = !DILocalVariable(name: "knodesD", arg: 2, scope: !574, file: !575, line: 7, type: !578)
!602 = !DILocation(line: 7, column: 10, scope: !574)
!603 = !DILocalVariable(name: "knodes_elem", arg: 3, scope: !574, file: !575, line: 8, type: !120)
!604 = !DILocation(line: 8, column: 8, scope: !574)
!605 = !DILocalVariable(name: "recordsD", arg: 4, scope: !574, file: !575, line: 9, type: !591)
!606 = !DILocation(line: 9, column: 11, scope: !574)
!607 = !DILocalVariable(name: "currKnodeD", arg: 5, scope: !574, file: !575, line: 11, type: !596)
!608 = !DILocation(line: 11, column: 9, scope: !574)
!609 = !DILocalVariable(name: "offsetD", arg: 6, scope: !574, file: !575, line: 12, type: !596)
!610 = !DILocation(line: 12, column: 9, scope: !574)
!611 = !DILocalVariable(name: "keysD", arg: 7, scope: !574, file: !575, line: 13, type: !86)
!612 = !DILocation(line: 13, column: 8, scope: !574)
!613 = !DILocalVariable(name: "ansD", arg: 8, scope: !574, file: !575, line: 14, type: !591)
!614 = !DILocation(line: 14, column: 11, scope: !574)
!615 = !DILocation(line: 15, column: 1, scope: !574)
!616 = !DILocation(line: 15, column: 1, scope: !617)
!617 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 1)
!618 = !DILocation(line: 15, column: 1, scope: !619)
!619 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 2)
!620 = !DILocation(line: 15, column: 1, scope: !621)
!621 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 3)
!622 = !DILocation(line: 15, column: 1, scope: !623)
!623 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 4)
!624 = !DILocation(line: 15, column: 1, scope: !625)
!625 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 5)
!626 = !DILocation(line: 15, column: 1, scope: !627)
!627 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 6)
!628 = !DILocation(line: 15, column: 1, scope: !629)
!629 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 7)
!630 = !DILocation(line: 15, column: 1, scope: !631)
!631 = !DILexicalBlockFile(scope: !574, file: !575, discriminator: 8)
!632 = !DILocation(line: 50, column: 1, scope: !574)
!633 = distinct !DISubprogram(name: "kernel_gpu_cuda_wrapper", scope: !1, file: !1, line: 39, type: !634, isLocal: false, isDefinition: true, scopeLine: 53, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !597)
!634 = !DISubroutineType(types: !635)
!635 = !{null, !591, !120, !578, !120, !120, !81, !120, !81, !596, !596, !86, !591}
!636 = !DILocalVariable(name: "records", arg: 1, scope: !633, file: !1, line: 39, type: !591)
!637 = !DILocation(line: 39, column: 33, scope: !633)
!638 = !DILocalVariable(name: "records_mem", arg: 2, scope: !633, file: !1, line: 40, type: !120)
!639 = !DILocation(line: 40, column: 12, scope: !633)
!640 = !DILocalVariable(name: "knodes", arg: 3, scope: !633, file: !1, line: 41, type: !578)
!641 = !DILocation(line: 41, column: 14, scope: !633)
!642 = !DILocalVariable(name: "knodes_elem", arg: 4, scope: !633, file: !1, line: 42, type: !120)
!643 = !DILocation(line: 42, column: 12, scope: !633)
!644 = !DILocalVariable(name: "knodes_mem", arg: 5, scope: !633, file: !1, line: 43, type: !120)
!645 = !DILocation(line: 43, column: 12, scope: !633)
!646 = !DILocalVariable(name: "order", arg: 6, scope: !633, file: !1, line: 45, type: !81)
!647 = !DILocation(line: 45, column: 11, scope: !633)
!648 = !DILocalVariable(name: "maxheight", arg: 7, scope: !633, file: !1, line: 46, type: !120)
!649 = !DILocation(line: 46, column: 12, scope: !633)
!650 = !DILocalVariable(name: "count", arg: 8, scope: !633, file: !1, line: 47, type: !81)
!651 = !DILocation(line: 47, column: 11, scope: !633)
!652 = !DILocalVariable(name: "currKnode", arg: 9, scope: !633, file: !1, line: 49, type: !596)
!653 = !DILocation(line: 49, column: 13, scope: !633)
!654 = !DILocalVariable(name: "offset", arg: 10, scope: !633, file: !1, line: 50, type: !596)
!655 = !DILocation(line: 50, column: 13, scope: !633)
!656 = !DILocalVariable(name: "keys", arg: 11, scope: !633, file: !1, line: 51, type: !86)
!657 = !DILocation(line: 51, column: 12, scope: !633)
!658 = !DILocalVariable(name: "ans", arg: 12, scope: !633, file: !1, line: 52, type: !591)
!659 = !DILocation(line: 52, column: 15, scope: !633)
!660 = !DILocalVariable(name: "time0", scope: !633, file: !1, line: 60, type: !22)
!661 = !DILocation(line: 60, column: 12, scope: !633)
!662 = !DILocalVariable(name: "time1", scope: !633, file: !1, line: 61, type: !22)
!663 = !DILocation(line: 61, column: 12, scope: !633)
!664 = !DILocalVariable(name: "time2", scope: !633, file: !1, line: 62, type: !22)
!665 = !DILocation(line: 62, column: 12, scope: !633)
!666 = !DILocalVariable(name: "time3", scope: !633, file: !1, line: 63, type: !22)
!667 = !DILocation(line: 63, column: 12, scope: !633)
!668 = !DILocalVariable(name: "time4", scope: !633, file: !1, line: 64, type: !22)
!669 = !DILocation(line: 64, column: 12, scope: !633)
!670 = !DILocalVariable(name: "time5", scope: !633, file: !1, line: 65, type: !22)
!671 = !DILocation(line: 65, column: 12, scope: !633)
!672 = !DILocalVariable(name: "time6", scope: !633, file: !1, line: 66, type: !22)
!673 = !DILocation(line: 66, column: 12, scope: !633)
!674 = !DILocation(line: 68, column: 10, scope: !633)
!675 = !DILocation(line: 68, column: 8, scope: !633)
!676 = !DILocation(line: 78, column: 2, scope: !633)
!677 = !DILocalVariable(name: "numBlocks", scope: !633, file: !1, line: 84, type: !81)
!678 = !DILocation(line: 84, column: 6, scope: !633)
!679 = !DILocation(line: 85, column: 14, scope: !633)
!680 = !DILocation(line: 85, column: 12, scope: !633)
!681 = !DILocalVariable(name: "threadsPerBlock", scope: !633, file: !1, line: 86, type: !81)
!682 = !DILocation(line: 86, column: 6, scope: !633)
!683 = !DILocation(line: 87, column: 20, scope: !633)
!684 = !DILocation(line: 87, column: 26, scope: !633)
!685 = !DILocation(line: 87, column: 35, scope: !686)
!686 = !DILexicalBlockFile(scope: !633, file: !1, discriminator: 1)
!687 = !DILocation(line: 87, column: 20, scope: !686)
!688 = !DILocation(line: 87, column: 20, scope: !689)
!689 = !DILexicalBlockFile(scope: !633, file: !1, discriminator: 2)
!690 = !DILocation(line: 87, column: 20, scope: !691)
!691 = !DILexicalBlockFile(scope: !633, file: !1, discriminator: 3)
!692 = !DILocation(line: 87, column: 18, scope: !691)
!693 = !DILocation(line: 89, column: 88, scope: !633)
!694 = !DILocation(line: 89, column: 99, scope: !633)
!695 = !DILocation(line: 89, column: 2, scope: !633)
!696 = !DILocation(line: 91, column: 10, scope: !633)
!697 = !DILocation(line: 91, column: 8, scope: !633)
!698 = !DILocalVariable(name: "recordsD", scope: !633, file: !1, line: 105, type: !591)
!699 = !DILocation(line: 105, column: 10, scope: !633)
!700 = !DILocation(line: 106, column: 13, scope: !633)
!701 = !DILocation(line: 106, column: 32, scope: !633)
!702 = !DILocation(line: 106, column: 2, scope: !633)
!703 = !DILocation(line: 107, column: 2, scope: !633)
!704 = !DILocalVariable(name: "knodesD", scope: !633, file: !1, line: 113, type: !578)
!705 = !DILocation(line: 113, column: 9, scope: !633)
!706 = !DILocation(line: 114, column: 13, scope: !633)
!707 = !DILocation(line: 114, column: 31, scope: !633)
!708 = !DILocation(line: 114, column: 2, scope: !633)
!709 = !DILocation(line: 115, column: 2, scope: !633)
!710 = !DILocalVariable(name: "currKnodeD", scope: !633, file: !1, line: 121, type: !596)
!711 = !DILocation(line: 121, column: 8, scope: !633)
!712 = !DILocation(line: 122, column: 13, scope: !633)
!713 = !DILocation(line: 122, column: 34, scope: !633)
!714 = !DILocation(line: 122, column: 39, scope: !633)
!715 = !DILocation(line: 122, column: 2, scope: !633)
!716 = !DILocation(line: 123, column: 2, scope: !633)
!717 = !DILocalVariable(name: "offsetD", scope: !633, file: !1, line: 129, type: !596)
!718 = !DILocation(line: 129, column: 8, scope: !633)
!719 = !DILocation(line: 130, column: 13, scope: !633)
!720 = !DILocation(line: 130, column: 31, scope: !633)
!721 = !DILocation(line: 130, column: 36, scope: !633)
!722 = !DILocation(line: 130, column: 2, scope: !633)
!723 = !DILocation(line: 131, column: 2, scope: !633)
!724 = !DILocalVariable(name: "keysD", scope: !633, file: !1, line: 137, type: !86)
!725 = !DILocation(line: 137, column: 7, scope: !633)
!726 = !DILocation(line: 138, column: 13, scope: !633)
!727 = !DILocation(line: 138, column: 29, scope: !633)
!728 = !DILocation(line: 138, column: 34, scope: !633)
!729 = !DILocation(line: 138, column: 2, scope: !633)
!730 = !DILocation(line: 139, column: 2, scope: !633)
!731 = !DILocalVariable(name: "ansD", scope: !633, file: !1, line: 149, type: !591)
!732 = !DILocation(line: 149, column: 10, scope: !633)
!733 = !DILocation(line: 150, column: 13, scope: !633)
!734 = !DILocation(line: 150, column: 28, scope: !633)
!735 = !DILocation(line: 150, column: 33, scope: !633)
!736 = !DILocation(line: 150, column: 2, scope: !633)
!737 = !DILocation(line: 151, column: 2, scope: !633)
!738 = !DILocation(line: 153, column: 10, scope: !633)
!739 = !DILocation(line: 153, column: 8, scope: !633)
!740 = !DILocation(line: 167, column: 13, scope: !633)
!741 = !DILocation(line: 167, column: 23, scope: !633)
!742 = !DILocation(line: 167, column: 32, scope: !633)
!743 = !DILocation(line: 167, column: 2, scope: !633)
!744 = !DILocation(line: 168, column: 2, scope: !633)
!745 = !DILocation(line: 174, column: 13, scope: !633)
!746 = !DILocation(line: 174, column: 22, scope: !633)
!747 = !DILocation(line: 174, column: 30, scope: !633)
!748 = !DILocation(line: 174, column: 2, scope: !633)
!749 = !DILocation(line: 175, column: 2, scope: !633)
!750 = !DILocation(line: 181, column: 13, scope: !633)
!751 = !DILocation(line: 181, column: 25, scope: !633)
!752 = !DILocation(line: 181, column: 36, scope: !633)
!753 = !DILocation(line: 181, column: 41, scope: !633)
!754 = !DILocation(line: 181, column: 2, scope: !633)
!755 = !DILocation(line: 182, column: 2, scope: !633)
!756 = !DILocation(line: 188, column: 13, scope: !633)
!757 = !DILocation(line: 188, column: 22, scope: !633)
!758 = !DILocation(line: 188, column: 30, scope: !633)
!759 = !DILocation(line: 188, column: 35, scope: !633)
!760 = !DILocation(line: 188, column: 2, scope: !633)
!761 = !DILocation(line: 189, column: 2, scope: !633)
!762 = !DILocation(line: 195, column: 13, scope: !633)
!763 = !DILocation(line: 195, column: 20, scope: !633)
!764 = !DILocation(line: 195, column: 26, scope: !633)
!765 = !DILocation(line: 195, column: 31, scope: !633)
!766 = !DILocation(line: 195, column: 2, scope: !633)
!767 = !DILocation(line: 196, column: 2, scope: !633)
!768 = !DILocation(line: 206, column: 13, scope: !633)
!769 = !DILocation(line: 206, column: 19, scope: !633)
!770 = !DILocation(line: 206, column: 24, scope: !633)
!771 = !DILocation(line: 206, column: 29, scope: !633)
!772 = !DILocation(line: 206, column: 2, scope: !633)
!773 = !DILocation(line: 207, column: 2, scope: !633)
!774 = !DILocation(line: 209, column: 10, scope: !633)
!775 = !DILocation(line: 209, column: 8, scope: !633)
!776 = !DILocation(line: 215, column: 10, scope: !633)
!777 = !DILocation(line: 215, column: 21, scope: !633)
!778 = !DILocation(line: 215, column: 21, scope: !689)
!779 = !DILocation(line: 215, column: 7, scope: !633)
!780 = !DILocation(line: 215, column: 7, scope: !691)
!781 = !DILocation(line: 215, column: 2, scope: !633)
!782 = !DILocation(line: 215, column: 41, scope: !686)
!783 = !DILocation(line: 217, column: 12, scope: !633)
!784 = !DILocation(line: 218, column: 12, scope: !633)
!785 = !DILocation(line: 220, column: 12, scope: !633)
!786 = !DILocation(line: 222, column: 12, scope: !633)
!787 = !DILocation(line: 223, column: 12, scope: !633)
!788 = !DILocation(line: 224, column: 12, scope: !633)
!789 = !DILocation(line: 225, column: 12, scope: !633)
!790 = !DILocation(line: 215, column: 2, scope: !686)
!791 = !DILocation(line: 226, column: 2, scope: !633)
!792 = !DILocation(line: 227, column: 2, scope: !633)
!793 = !DILocation(line: 229, column: 10, scope: !633)
!794 = !DILocation(line: 229, column: 8, scope: !633)
!795 = !DILocation(line: 243, column: 13, scope: !633)
!796 = !DILocation(line: 243, column: 18, scope: !633)
!797 = !DILocation(line: 243, column: 24, scope: !633)
!798 = !DILocation(line: 243, column: 29, scope: !633)
!799 = !DILocation(line: 243, column: 2, scope: !633)
!800 = !DILocation(line: 244, column: 2, scope: !633)
!801 = !DILocation(line: 246, column: 10, scope: !633)
!802 = !DILocation(line: 246, column: 8, scope: !633)
!803 = !DILocation(line: 252, column: 11, scope: !633)
!804 = !DILocation(line: 252, column: 2, scope: !633)
!805 = !DILocation(line: 253, column: 11, scope: !633)
!806 = !DILocation(line: 253, column: 2, scope: !633)
!807 = !DILocation(line: 255, column: 11, scope: !633)
!808 = !DILocation(line: 255, column: 2, scope: !633)
!809 = !DILocation(line: 256, column: 11, scope: !633)
!810 = !DILocation(line: 256, column: 2, scope: !633)
!811 = !DILocation(line: 257, column: 11, scope: !633)
!812 = !DILocation(line: 257, column: 2, scope: !633)
!813 = !DILocation(line: 258, column: 11, scope: !633)
!814 = !DILocation(line: 258, column: 2, scope: !633)
!815 = !DILocation(line: 260, column: 10, scope: !633)
!816 = !DILocation(line: 260, column: 8, scope: !633)
!817 = !DILocation(line: 266, column: 2, scope: !633)
!818 = !DILocation(line: 268, column: 76, scope: !633)
!819 = !DILocation(line: 268, column: 82, scope: !633)
!820 = !DILocation(line: 268, column: 81, scope: !633)
!821 = !DILocation(line: 268, column: 75, scope: !633)
!822 = !DILocation(line: 268, column: 89, scope: !633)
!823 = !DILocation(line: 268, column: 67, scope: !633)
!824 = !DILocation(line: 268, column: 109, scope: !633)
!825 = !DILocation(line: 268, column: 115, scope: !633)
!826 = !DILocation(line: 268, column: 114, scope: !633)
!827 = !DILocation(line: 268, column: 108, scope: !633)
!828 = !DILocation(line: 268, column: 133, scope: !633)
!829 = !DILocation(line: 268, column: 139, scope: !633)
!830 = !DILocation(line: 268, column: 138, scope: !633)
!831 = !DILocation(line: 268, column: 132, scope: !633)
!832 = !DILocation(line: 268, column: 122, scope: !633)
!833 = !DILocation(line: 268, column: 146, scope: !633)
!834 = !DILocation(line: 268, column: 100, scope: !633)
!835 = !DILocation(line: 268, column: 2, scope: !633)
!836 = !DILocation(line: 269, column: 64, scope: !633)
!837 = !DILocation(line: 269, column: 70, scope: !633)
!838 = !DILocation(line: 269, column: 69, scope: !633)
!839 = !DILocation(line: 269, column: 63, scope: !633)
!840 = !DILocation(line: 269, column: 77, scope: !633)
!841 = !DILocation(line: 269, column: 55, scope: !633)
!842 = !DILocation(line: 269, column: 97, scope: !633)
!843 = !DILocation(line: 269, column: 103, scope: !633)
!844 = !DILocation(line: 269, column: 102, scope: !633)
!845 = !DILocation(line: 269, column: 96, scope: !633)
!846 = !DILocation(line: 269, column: 121, scope: !633)
!847 = !DILocation(line: 269, column: 127, scope: !633)
!848 = !DILocation(line: 269, column: 126, scope: !633)
!849 = !DILocation(line: 269, column: 120, scope: !633)
!850 = !DILocation(line: 269, column: 110, scope: !633)
!851 = !DILocation(line: 269, column: 134, scope: !633)
!852 = !DILocation(line: 269, column: 88, scope: !633)
!853 = !DILocation(line: 269, column: 2, scope: !633)
!854 = !DILocation(line: 270, column: 67, scope: !633)
!855 = !DILocation(line: 270, column: 73, scope: !633)
!856 = !DILocation(line: 270, column: 72, scope: !633)
!857 = !DILocation(line: 270, column: 66, scope: !633)
!858 = !DILocation(line: 270, column: 80, scope: !633)
!859 = !DILocation(line: 270, column: 58, scope: !633)
!860 = !DILocation(line: 270, column: 100, scope: !633)
!861 = !DILocation(line: 270, column: 106, scope: !633)
!862 = !DILocation(line: 270, column: 105, scope: !633)
!863 = !DILocation(line: 270, column: 99, scope: !633)
!864 = !DILocation(line: 270, column: 124, scope: !633)
!865 = !DILocation(line: 270, column: 130, scope: !633)
!866 = !DILocation(line: 270, column: 129, scope: !633)
!867 = !DILocation(line: 270, column: 123, scope: !633)
!868 = !DILocation(line: 270, column: 113, scope: !633)
!869 = !DILocation(line: 270, column: 137, scope: !633)
!870 = !DILocation(line: 270, column: 91, scope: !633)
!871 = !DILocation(line: 270, column: 2, scope: !633)
!872 = !DILocation(line: 272, column: 63, scope: !633)
!873 = !DILocation(line: 272, column: 69, scope: !633)
!874 = !DILocation(line: 272, column: 68, scope: !633)
!875 = !DILocation(line: 272, column: 62, scope: !633)
!876 = !DILocation(line: 272, column: 76, scope: !633)
!877 = !DILocation(line: 272, column: 54, scope: !633)
!878 = !DILocation(line: 272, column: 96, scope: !633)
!879 = !DILocation(line: 272, column: 102, scope: !633)
!880 = !DILocation(line: 272, column: 101, scope: !633)
!881 = !DILocation(line: 272, column: 95, scope: !633)
!882 = !DILocation(line: 272, column: 120, scope: !633)
!883 = !DILocation(line: 272, column: 126, scope: !633)
!884 = !DILocation(line: 272, column: 125, scope: !633)
!885 = !DILocation(line: 272, column: 119, scope: !633)
!886 = !DILocation(line: 272, column: 109, scope: !633)
!887 = !DILocation(line: 272, column: 133, scope: !633)
!888 = !DILocation(line: 272, column: 87, scope: !633)
!889 = !DILocation(line: 272, column: 2, scope: !633)
!890 = !DILocation(line: 274, column: 67, scope: !633)
!891 = !DILocation(line: 274, column: 73, scope: !633)
!892 = !DILocation(line: 274, column: 72, scope: !633)
!893 = !DILocation(line: 274, column: 66, scope: !633)
!894 = !DILocation(line: 274, column: 80, scope: !633)
!895 = !DILocation(line: 274, column: 58, scope: !633)
!896 = !DILocation(line: 274, column: 100, scope: !633)
!897 = !DILocation(line: 274, column: 106, scope: !633)
!898 = !DILocation(line: 274, column: 105, scope: !633)
!899 = !DILocation(line: 274, column: 99, scope: !633)
!900 = !DILocation(line: 274, column: 124, scope: !633)
!901 = !DILocation(line: 274, column: 130, scope: !633)
!902 = !DILocation(line: 274, column: 129, scope: !633)
!903 = !DILocation(line: 274, column: 123, scope: !633)
!904 = !DILocation(line: 274, column: 113, scope: !633)
!905 = !DILocation(line: 274, column: 137, scope: !633)
!906 = !DILocation(line: 274, column: 91, scope: !633)
!907 = !DILocation(line: 274, column: 2, scope: !633)
!908 = !DILocation(line: 275, column: 64, scope: !633)
!909 = !DILocation(line: 275, column: 70, scope: !633)
!910 = !DILocation(line: 275, column: 69, scope: !633)
!911 = !DILocation(line: 275, column: 63, scope: !633)
!912 = !DILocation(line: 275, column: 77, scope: !633)
!913 = !DILocation(line: 275, column: 55, scope: !633)
!914 = !DILocation(line: 275, column: 97, scope: !633)
!915 = !DILocation(line: 275, column: 103, scope: !633)
!916 = !DILocation(line: 275, column: 102, scope: !633)
!917 = !DILocation(line: 275, column: 96, scope: !633)
!918 = !DILocation(line: 275, column: 121, scope: !633)
!919 = !DILocation(line: 275, column: 127, scope: !633)
!920 = !DILocation(line: 275, column: 126, scope: !633)
!921 = !DILocation(line: 275, column: 120, scope: !633)
!922 = !DILocation(line: 275, column: 110, scope: !633)
!923 = !DILocation(line: 275, column: 134, scope: !633)
!924 = !DILocation(line: 275, column: 88, scope: !633)
!925 = !DILocation(line: 275, column: 2, scope: !633)
!926 = !DILocation(line: 277, column: 2, scope: !633)
!927 = !DILocation(line: 278, column: 43, scope: !633)
!928 = !DILocation(line: 278, column: 49, scope: !633)
!929 = !DILocation(line: 278, column: 48, scope: !633)
!930 = !DILocation(line: 278, column: 42, scope: !633)
!931 = !DILocation(line: 278, column: 56, scope: !633)
!932 = !DILocation(line: 278, column: 34, scope: !633)
!933 = !DILocation(line: 278, column: 2, scope: !633)
!934 = !DILocation(line: 284, column: 1, scope: !633)
!935 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !937, file: !936, line: 421, type: !943, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !942, variables: !597)
!936 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/b+tree")
!937 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !936, line: 417, size: 96, align: 32, elements: !938, identifier: "_ZTS4dim3")
!938 = !{!939, !940, !941, !942, !946, !955}
!939 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !937, file: !936, line: 419, baseType: !375, size: 32, align: 32)
!940 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !937, file: !936, line: 419, baseType: !375, size: 32, align: 32, offset: 32)
!941 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !937, file: !936, line: 419, baseType: !375, size: 32, align: 32, offset: 64)
!942 = !DISubprogram(name: "dim3", scope: !937, file: !936, line: 421, type: !943, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!943 = !DISubroutineType(types: !944)
!944 = !{null, !945, !375, !375, !375}
!945 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !937, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!946 = !DISubprogram(name: "dim3", scope: !937, file: !936, line: 422, type: !947, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!947 = !DISubroutineType(types: !948)
!948 = !{null, !945, !949}
!949 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !936, line: 383, baseType: !950)
!950 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !936, line: 190, size: 96, align: 32, elements: !951, identifier: "_ZTS5uint3")
!951 = !{!952, !953, !954}
!952 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !950, file: !936, line: 192, baseType: !375, size: 32, align: 32)
!953 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !950, file: !936, line: 192, baseType: !375, size: 32, align: 32, offset: 32)
!954 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !950, file: !936, line: 192, baseType: !375, size: 32, align: 32, offset: 64)
!955 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !937, file: !936, line: 423, type: !956, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!956 = !DISubroutineType(types: !957)
!957 = !{!949, !945}
!958 = !DILocalVariable(name: "this", arg: 1, scope: !935, type: !959, flags: DIFlagArtificial | DIFlagObjectPointer)
!959 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !937, size: 64, align: 64)
!960 = !DILocation(line: 0, scope: !935)
!961 = !DILocalVariable(name: "vx", arg: 2, scope: !935, file: !936, line: 421, type: !375)
!962 = !DILocation(line: 421, column: 43, scope: !935)
!963 = !DILocalVariable(name: "vy", arg: 3, scope: !935, file: !936, line: 421, type: !375)
!964 = !DILocation(line: 421, column: 64, scope: !935)
!965 = !DILocalVariable(name: "vz", arg: 4, scope: !935, file: !936, line: 421, type: !375)
!966 = !DILocation(line: 421, column: 85, scope: !935)
!967 = !DILocation(line: 421, column: 95, scope: !935)
!968 = !DILocation(line: 421, column: 97, scope: !935)
!969 = !DILocation(line: 421, column: 102, scope: !935)
!970 = !DILocation(line: 421, column: 104, scope: !935)
!971 = !DILocation(line: 421, column: 109, scope: !935)
!972 = !DILocation(line: 421, column: 111, scope: !935)
!973 = !DILocation(line: 421, column: 116, scope: !935)
