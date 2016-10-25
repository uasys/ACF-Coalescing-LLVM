; ModuleID = 'bfs.cu'
source_filename = "bfs.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Node = type { i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C2Ejjj = comdat any

@no_of_nodes = global i32 0, align 4, !dbg !0
@edge_list_size = global i32 0, align 4, !dbg !26
@fp = global %struct._IO_FILE* null, align 8, !dbg !27
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [24 x i8] c"Usage: %s <input_file>\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"Reading File\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [26 x i8] c"Error Reading graph file\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.6 = private unnamed_addr constant [11 x i8] c"Read File\0A\00", align 1
@.str.7 = private unnamed_addr constant [33 x i8] c"Copied Everything to GPU memory\0A\00", align 1
@.str.8 = private unnamed_addr constant [27 x i8] c"Start traversing the tree\0A\00", align 1
@.str.9 = private unnamed_addr constant [26 x i8] c"Kernel Executed %d times\0A\00", align 1
@.str.10 = private unnamed_addr constant [11 x i8] c"result.txt\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.12 = private unnamed_addr constant [13 x i8] c"%d) cost:%d\0A\00", align 1
@.str.13 = private unnamed_addr constant [29 x i8] c"Result stored in result.txt\0A\00", align 1

; Function Attrs: uwtable
define void @_Z6KernelP4NodePiPbS2_S2_S1_i(%struct.Node* %g_graph_nodes, i32* %g_graph_edges, i8* %g_graph_mask, i8* %g_updating_graph_mask, i8* %g_graph_visited, i32* %g_cost, i32 %no_of_nodes) #0 !dbg !589 {
entry:
  %g_graph_nodes.addr = alloca %struct.Node*, align 8
  %g_graph_edges.addr = alloca i32*, align 8
  %g_graph_mask.addr = alloca i8*, align 8
  %g_updating_graph_mask.addr = alloca i8*, align 8
  %g_graph_visited.addr = alloca i8*, align 8
  %g_cost.addr = alloca i32*, align 8
  %no_of_nodes.addr = alloca i32, align 4
  store %struct.Node* %g_graph_nodes, %struct.Node** %g_graph_nodes.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Node** %g_graph_nodes.addr, metadata !594, metadata !595), !dbg !596
  store i32* %g_graph_edges, i32** %g_graph_edges.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %g_graph_edges.addr, metadata !597, metadata !595), !dbg !598
  store i8* %g_graph_mask, i8** %g_graph_mask.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_graph_mask.addr, metadata !599, metadata !595), !dbg !600
  store i8* %g_updating_graph_mask, i8** %g_updating_graph_mask.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_updating_graph_mask.addr, metadata !601, metadata !595), !dbg !602
  store i8* %g_graph_visited, i8** %g_graph_visited.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_graph_visited.addr, metadata !603, metadata !595), !dbg !604
  store i32* %g_cost, i32** %g_cost.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %g_cost.addr, metadata !605, metadata !595), !dbg !606
  store i32 %no_of_nodes, i32* %no_of_nodes.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %no_of_nodes.addr, metadata !607, metadata !595), !dbg !608
  %0 = bitcast %struct.Node** %g_graph_nodes.addr to i8*, !dbg !609
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !609
  %2 = icmp eq i32 %1, 0, !dbg !609
  br i1 %2, label %setup.next, label %setup.end, !dbg !609

setup.next:                                       ; preds = %entry
  %3 = bitcast i32** %g_graph_edges.addr to i8*, !dbg !610
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !610
  %5 = icmp eq i32 %4, 0, !dbg !610
  br i1 %5, label %setup.next1, label %setup.end, !dbg !610

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i8** %g_graph_mask.addr to i8*, !dbg !612
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !612
  %8 = icmp eq i32 %7, 0, !dbg !612
  br i1 %8, label %setup.next2, label %setup.end, !dbg !612

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i8** %g_updating_graph_mask.addr to i8*, !dbg !614
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !614
  %11 = icmp eq i32 %10, 0, !dbg !614
  br i1 %11, label %setup.next3, label %setup.end, !dbg !614

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i8** %g_graph_visited.addr to i8*, !dbg !616
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !616
  %14 = icmp eq i32 %13, 0, !dbg !616
  br i1 %14, label %setup.next4, label %setup.end, !dbg !616

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32** %g_cost.addr to i8*, !dbg !618
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !618
  %17 = icmp eq i32 %16, 0, !dbg !618
  br i1 %17, label %setup.next5, label %setup.end, !dbg !618

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i32* %no_of_nodes.addr to i8*, !dbg !620
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 4, i64 48), !dbg !620
  %20 = icmp eq i32 %19, 0, !dbg !620
  br i1 %20, label %setup.next6, label %setup.end, !dbg !620

setup.next6:                                      ; preds = %setup.next5
  %21 = call i32 @cudaLaunch(i8* bitcast (void (%struct.Node*, i32*, i8*, i8*, i8*, i32*, i32)* @_Z6KernelP4NodePiPbS2_S2_S1_i to i8*)), !dbg !622
  br label %setup.end, !dbg !622

setup.end:                                        ; preds = %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !624
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @_Z7Kernel2PbS_S_S_i(i8* %g_graph_mask, i8* %g_updating_graph_mask, i8* %g_graph_visited, i8* %g_over, i32 %no_of_nodes) #0 !dbg !625 {
entry:
  %g_graph_mask.addr = alloca i8*, align 8
  %g_updating_graph_mask.addr = alloca i8*, align 8
  %g_graph_visited.addr = alloca i8*, align 8
  %g_over.addr = alloca i8*, align 8
  %no_of_nodes.addr = alloca i32, align 4
  store i8* %g_graph_mask, i8** %g_graph_mask.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_graph_mask.addr, metadata !629, metadata !595), !dbg !630
  store i8* %g_updating_graph_mask, i8** %g_updating_graph_mask.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_updating_graph_mask.addr, metadata !631, metadata !595), !dbg !632
  store i8* %g_graph_visited, i8** %g_graph_visited.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_graph_visited.addr, metadata !633, metadata !595), !dbg !634
  store i8* %g_over, i8** %g_over.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_over.addr, metadata !635, metadata !595), !dbg !636
  store i32 %no_of_nodes, i32* %no_of_nodes.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %no_of_nodes.addr, metadata !637, metadata !595), !dbg !638
  %0 = bitcast i8** %g_graph_mask.addr to i8*, !dbg !639
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !639
  %2 = icmp eq i32 %1, 0, !dbg !639
  br i1 %2, label %setup.next, label %setup.end, !dbg !639

setup.next:                                       ; preds = %entry
  %3 = bitcast i8** %g_updating_graph_mask.addr to i8*, !dbg !640
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !640
  %5 = icmp eq i32 %4, 0, !dbg !640
  br i1 %5, label %setup.next1, label %setup.end, !dbg !640

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i8** %g_graph_visited.addr to i8*, !dbg !642
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !642
  %8 = icmp eq i32 %7, 0, !dbg !642
  br i1 %8, label %setup.next2, label %setup.end, !dbg !642

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i8** %g_over.addr to i8*, !dbg !644
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !644
  %11 = icmp eq i32 %10, 0, !dbg !644
  br i1 %11, label %setup.next3, label %setup.end, !dbg !644

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %no_of_nodes.addr to i8*, !dbg !646
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 32), !dbg !646
  %14 = icmp eq i32 %13, 0, !dbg !646
  br i1 %14, label %setup.next4, label %setup.end, !dbg !646

setup.next4:                                      ; preds = %setup.next3
  %15 = call i32 @cudaLaunch(i8* bitcast (void (i8*, i8*, i8*, i8*, i32)* @_Z7Kernel2PbS_S_S_i to i8*)), !dbg !648
  br label %setup.end, !dbg !648

setup.end:                                        ; preds = %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !650
}

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #2 !dbg !651 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !654, metadata !595), !dbg !655
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !656, metadata !595), !dbg !657
  store i32 0, i32* @no_of_nodes, align 4, !dbg !658
  store i32 0, i32* @edge_list_size, align 4, !dbg !659
  %0 = load i32, i32* %argc.addr, align 4, !dbg !660
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !661
  call void @_Z8BFSGraphiPPc(i32 %0, i8** %1), !dbg !662
  ret i32 0, !dbg !663
}

; Function Attrs: uwtable
define void @_Z8BFSGraphiPPc(i32 %argc, i8** %argv) #0 !dbg !664 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %input_f = alloca i8*, align 8
  %source = alloca i32, align 4
  %num_of_blocks = alloca i32, align 4
  %num_of_threads_per_block = alloca i32, align 4
  %h_graph_nodes = alloca %struct.Node*, align 8
  %h_graph_mask = alloca i8*, align 8
  %h_updating_graph_mask = alloca i8*, align 8
  %h_graph_visited = alloca i8*, align 8
  %start = alloca i32, align 4
  %edgeno = alloca i32, align 4
  %i = alloca i32, align 4
  %id = alloca i32, align 4
  %cost = alloca i32, align 4
  %h_graph_edges = alloca i32*, align 8
  %i42 = alloca i32, align 4
  %d_graph_nodes = alloca %struct.Node*, align 8
  %d_graph_edges = alloca i32*, align 8
  %d_graph_mask = alloca i8*, align 8
  %d_updating_graph_mask = alloca i8*, align 8
  %d_graph_visited = alloca i8*, align 8
  %h_cost = alloca i32*, align 8
  %i91 = alloca i32, align 4
  %d_cost = alloca i32*, align 8
  %d_over = alloca i8*, align 8
  %grid = alloca %struct.dim3, align 4
  %threads = alloca %struct.dim3, align 4
  %k = alloca i32, align 4
  %stop = alloca i8, align 1
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp112 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp112.coerce = alloca { i64, i32 }, align 4
  %agg.tmp115 = alloca %struct.dim3, align 4
  %agg.tmp116 = alloca %struct.dim3, align 4
  %agg.tmp115.coerce = alloca { i64, i32 }, align 4
  %agg.tmp116.coerce = alloca { i64, i32 }, align 4
  %fpo = alloca %struct._IO_FILE*, align 8
  %i129 = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !667, metadata !595), !dbg !668
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !669, metadata !595), !dbg !670
  call void @llvm.dbg.declare(metadata i8** %input_f, metadata !671, metadata !595), !dbg !672
  %0 = load i32, i32* %argc.addr, align 4, !dbg !673
  %cmp = icmp ne i32 %0, 2, !dbg !675
  br i1 %cmp, label %if.then, label %if.end, !dbg !676

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %argc.addr, align 4, !dbg !677
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !679
  call void @_Z5UsageiPPc(i32 %1, i8** %2), !dbg !680
  call void @exit(i32 0) #9, !dbg !681
  unreachable, !dbg !681

if.end:                                           ; preds = %entry
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !682
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !682
  %4 = load i8*, i8** %arrayidx, align 8, !dbg !682
  store i8* %4, i8** %input_f, align 8, !dbg !683
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0)), !dbg !684
  %5 = load i8*, i8** %input_f, align 8, !dbg !685
  %call1 = call %struct._IO_FILE* @fopen(i8* %5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0)), !dbg !686
  store %struct._IO_FILE* %call1, %struct._IO_FILE** @fp, align 8, !dbg !687
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !688
  %tobool = icmp ne %struct._IO_FILE* %6, null, !dbg !688
  br i1 %tobool, label %if.end4, label %if.then2, !dbg !690

if.then2:                                         ; preds = %if.end
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.3, i32 0, i32 0)), !dbg !691
  br label %return, !dbg !693

if.end4:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %source, metadata !694, metadata !595), !dbg !695
  store i32 0, i32* %source, align 4, !dbg !695
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !696
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* @no_of_nodes), !dbg !697
  call void @llvm.dbg.declare(metadata i32* %num_of_blocks, metadata !698, metadata !595), !dbg !699
  store i32 1, i32* %num_of_blocks, align 4, !dbg !699
  call void @llvm.dbg.declare(metadata i32* %num_of_threads_per_block, metadata !700, metadata !595), !dbg !701
  %8 = load i32, i32* @no_of_nodes, align 4, !dbg !702
  store i32 %8, i32* %num_of_threads_per_block, align 4, !dbg !701
  %9 = load i32, i32* @no_of_nodes, align 4, !dbg !703
  %cmp6 = icmp sgt i32 %9, 512, !dbg !705
  br i1 %cmp6, label %if.then7, label %if.end10, !dbg !706

if.then7:                                         ; preds = %if.end4
  %10 = load i32, i32* @no_of_nodes, align 4, !dbg !707
  %conv = sitofp i32 %10 to double, !dbg !707
  %div = fdiv double %conv, 5.120000e+02, !dbg !709
  %call8 = call double @ceil(double %div) #1, !dbg !710
  %conv9 = fptosi double %call8 to i32, !dbg !710
  store i32 %conv9, i32* %num_of_blocks, align 4, !dbg !711
  store i32 512, i32* %num_of_threads_per_block, align 4, !dbg !712
  br label %if.end10, !dbg !713

if.end10:                                         ; preds = %if.then7, %if.end4
  call void @llvm.dbg.declare(metadata %struct.Node** %h_graph_nodes, metadata !714, metadata !595), !dbg !715
  %11 = load i32, i32* @no_of_nodes, align 4, !dbg !716
  %conv11 = sext i32 %11 to i64, !dbg !716
  %mul = mul i64 8, %conv11, !dbg !717
  %call12 = call noalias i8* @malloc(i64 %mul) #10, !dbg !718
  %12 = bitcast i8* %call12 to %struct.Node*, !dbg !719
  store %struct.Node* %12, %struct.Node** %h_graph_nodes, align 8, !dbg !715
  call void @llvm.dbg.declare(metadata i8** %h_graph_mask, metadata !720, metadata !595), !dbg !721
  %13 = load i32, i32* @no_of_nodes, align 4, !dbg !722
  %conv13 = sext i32 %13 to i64, !dbg !722
  %mul14 = mul i64 1, %conv13, !dbg !723
  %call15 = call noalias i8* @malloc(i64 %mul14) #10, !dbg !724
  store i8* %call15, i8** %h_graph_mask, align 8, !dbg !721
  call void @llvm.dbg.declare(metadata i8** %h_updating_graph_mask, metadata !725, metadata !595), !dbg !726
  %14 = load i32, i32* @no_of_nodes, align 4, !dbg !727
  %conv16 = sext i32 %14 to i64, !dbg !727
  %mul17 = mul i64 1, %conv16, !dbg !728
  %call18 = call noalias i8* @malloc(i64 %mul17) #10, !dbg !729
  store i8* %call18, i8** %h_updating_graph_mask, align 8, !dbg !726
  call void @llvm.dbg.declare(metadata i8** %h_graph_visited, metadata !730, metadata !595), !dbg !731
  %15 = load i32, i32* @no_of_nodes, align 4, !dbg !732
  %conv19 = sext i32 %15 to i64, !dbg !732
  %mul20 = mul i64 1, %conv19, !dbg !733
  %call21 = call noalias i8* @malloc(i64 %mul20) #10, !dbg !734
  store i8* %call21, i8** %h_graph_visited, align 8, !dbg !731
  call void @llvm.dbg.declare(metadata i32* %start, metadata !735, metadata !595), !dbg !736
  call void @llvm.dbg.declare(metadata i32* %edgeno, metadata !737, metadata !595), !dbg !738
  call void @llvm.dbg.declare(metadata i32* %i, metadata !739, metadata !595), !dbg !741
  store i32 0, i32* %i, align 4, !dbg !741
  br label %for.cond, !dbg !742

for.cond:                                         ; preds = %for.inc, %if.end10
  %16 = load i32, i32* %i, align 4, !dbg !743
  %17 = load i32, i32* @no_of_nodes, align 4, !dbg !746
  %cmp22 = icmp ult i32 %16, %17, !dbg !747
  br i1 %cmp22, label %for.body, label %for.end, !dbg !748

for.body:                                         ; preds = %for.cond
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !749
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0), i32* %start, i32* %edgeno), !dbg !751
  %19 = load i32, i32* %start, align 4, !dbg !752
  %20 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !753
  %21 = load i32, i32* %i, align 4, !dbg !754
  %idxprom = zext i32 %21 to i64, !dbg !753
  %arrayidx24 = getelementptr inbounds %struct.Node, %struct.Node* %20, i64 %idxprom, !dbg !753
  %starting = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx24, i32 0, i32 0, !dbg !755
  store i32 %19, i32* %starting, align 4, !dbg !756
  %22 = load i32, i32* %edgeno, align 4, !dbg !757
  %23 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !758
  %24 = load i32, i32* %i, align 4, !dbg !759
  %idxprom25 = zext i32 %24 to i64, !dbg !758
  %arrayidx26 = getelementptr inbounds %struct.Node, %struct.Node* %23, i64 %idxprom25, !dbg !758
  %no_of_edges = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx26, i32 0, i32 1, !dbg !760
  store i32 %22, i32* %no_of_edges, align 4, !dbg !761
  %25 = load i8*, i8** %h_graph_mask, align 8, !dbg !762
  %26 = load i32, i32* %i, align 4, !dbg !763
  %idxprom27 = zext i32 %26 to i64, !dbg !762
  %arrayidx28 = getelementptr inbounds i8, i8* %25, i64 %idxprom27, !dbg !762
  store i8 0, i8* %arrayidx28, align 1, !dbg !764
  %27 = load i8*, i8** %h_updating_graph_mask, align 8, !dbg !765
  %28 = load i32, i32* %i, align 4, !dbg !766
  %idxprom29 = zext i32 %28 to i64, !dbg !765
  %arrayidx30 = getelementptr inbounds i8, i8* %27, i64 %idxprom29, !dbg !765
  store i8 0, i8* %arrayidx30, align 1, !dbg !767
  %29 = load i8*, i8** %h_graph_visited, align 8, !dbg !768
  %30 = load i32, i32* %i, align 4, !dbg !769
  %idxprom31 = zext i32 %30 to i64, !dbg !768
  %arrayidx32 = getelementptr inbounds i8, i8* %29, i64 %idxprom31, !dbg !768
  store i8 0, i8* %arrayidx32, align 1, !dbg !770
  br label %for.inc, !dbg !771

for.inc:                                          ; preds = %for.body
  %31 = load i32, i32* %i, align 4, !dbg !772
  %inc = add i32 %31, 1, !dbg !772
  store i32 %inc, i32* %i, align 4, !dbg !772
  br label %for.cond, !dbg !774, !llvm.loop !775

for.end:                                          ; preds = %for.cond
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !777
  %call33 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* %source), !dbg !778
  store i32 0, i32* %source, align 4, !dbg !779
  %33 = load i8*, i8** %h_graph_mask, align 8, !dbg !780
  %34 = load i32, i32* %source, align 4, !dbg !781
  %idxprom34 = sext i32 %34 to i64, !dbg !780
  %arrayidx35 = getelementptr inbounds i8, i8* %33, i64 %idxprom34, !dbg !780
  store i8 1, i8* %arrayidx35, align 1, !dbg !782
  %35 = load i8*, i8** %h_graph_visited, align 8, !dbg !783
  %36 = load i32, i32* %source, align 4, !dbg !784
  %idxprom36 = sext i32 %36 to i64, !dbg !783
  %arrayidx37 = getelementptr inbounds i8, i8* %35, i64 %idxprom36, !dbg !783
  store i8 1, i8* %arrayidx37, align 1, !dbg !785
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !786
  %call38 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* @edge_list_size), !dbg !787
  call void @llvm.dbg.declare(metadata i32* %id, metadata !788, metadata !595), !dbg !789
  call void @llvm.dbg.declare(metadata i32* %cost, metadata !790, metadata !595), !dbg !791
  call void @llvm.dbg.declare(metadata i32** %h_graph_edges, metadata !792, metadata !595), !dbg !793
  %38 = load i32, i32* @edge_list_size, align 4, !dbg !794
  %conv39 = sext i32 %38 to i64, !dbg !794
  %mul40 = mul i64 4, %conv39, !dbg !795
  %call41 = call noalias i8* @malloc(i64 %mul40) #10, !dbg !796
  %39 = bitcast i8* %call41 to i32*, !dbg !797
  store i32* %39, i32** %h_graph_edges, align 8, !dbg !793
  call void @llvm.dbg.declare(metadata i32* %i42, metadata !798, metadata !595), !dbg !800
  store i32 0, i32* %i42, align 4, !dbg !800
  br label %for.cond43, !dbg !801

for.cond43:                                       ; preds = %for.inc50, %for.end
  %40 = load i32, i32* %i42, align 4, !dbg !802
  %41 = load i32, i32* @edge_list_size, align 4, !dbg !805
  %cmp44 = icmp slt i32 %40, %41, !dbg !806
  br i1 %cmp44, label %for.body45, label %for.end52, !dbg !807

for.body45:                                       ; preds = %for.cond43
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !808
  %call46 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* %id), !dbg !810
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !811
  %call47 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* %cost), !dbg !812
  %44 = load i32, i32* %id, align 4, !dbg !813
  %45 = load i32*, i32** %h_graph_edges, align 8, !dbg !814
  %46 = load i32, i32* %i42, align 4, !dbg !815
  %idxprom48 = sext i32 %46 to i64, !dbg !814
  %arrayidx49 = getelementptr inbounds i32, i32* %45, i64 %idxprom48, !dbg !814
  store i32 %44, i32* %arrayidx49, align 4, !dbg !816
  br label %for.inc50, !dbg !817

for.inc50:                                        ; preds = %for.body45
  %47 = load i32, i32* %i42, align 4, !dbg !818
  %inc51 = add nsw i32 %47, 1, !dbg !818
  store i32 %inc51, i32* %i42, align 4, !dbg !818
  br label %for.cond43, !dbg !820, !llvm.loop !821

for.end52:                                        ; preds = %for.cond43
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !823
  %tobool53 = icmp ne %struct._IO_FILE* %48, null, !dbg !823
  br i1 %tobool53, label %if.then54, label %if.end56, !dbg !825

if.then54:                                        ; preds = %for.end52
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !826
  %call55 = call i32 @fclose(%struct._IO_FILE* %49), !dbg !827
  br label %if.end56, !dbg !827

if.end56:                                         ; preds = %if.then54, %for.end52
  %call57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i32 0, i32 0)), !dbg !828
  call void @llvm.dbg.declare(metadata %struct.Node** %d_graph_nodes, metadata !829, metadata !595), !dbg !830
  %50 = bitcast %struct.Node** %d_graph_nodes to i8**, !dbg !831
  %51 = load i32, i32* @no_of_nodes, align 4, !dbg !832
  %conv58 = sext i32 %51 to i64, !dbg !832
  %mul59 = mul i64 8, %conv58, !dbg !833
  %call60 = call i32 @cudaMalloc(i8** %50, i64 %mul59), !dbg !834
  %52 = load %struct.Node*, %struct.Node** %d_graph_nodes, align 8, !dbg !835
  %53 = bitcast %struct.Node* %52 to i8*, !dbg !835
  %54 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !836
  %55 = bitcast %struct.Node* %54 to i8*, !dbg !836
  %56 = load i32, i32* @no_of_nodes, align 4, !dbg !837
  %conv61 = sext i32 %56 to i64, !dbg !837
  %mul62 = mul i64 8, %conv61, !dbg !838
  %call63 = call i32 @cudaMemcpy(i8* %53, i8* %55, i64 %mul62, i32 1), !dbg !839
  call void @llvm.dbg.declare(metadata i32** %d_graph_edges, metadata !840, metadata !595), !dbg !841
  %57 = bitcast i32** %d_graph_edges to i8**, !dbg !842
  %58 = load i32, i32* @edge_list_size, align 4, !dbg !843
  %conv64 = sext i32 %58 to i64, !dbg !843
  %mul65 = mul i64 4, %conv64, !dbg !844
  %call66 = call i32 @cudaMalloc(i8** %57, i64 %mul65), !dbg !845
  %59 = load i32*, i32** %d_graph_edges, align 8, !dbg !846
  %60 = bitcast i32* %59 to i8*, !dbg !846
  %61 = load i32*, i32** %h_graph_edges, align 8, !dbg !847
  %62 = bitcast i32* %61 to i8*, !dbg !847
  %63 = load i32, i32* @edge_list_size, align 4, !dbg !848
  %conv67 = sext i32 %63 to i64, !dbg !848
  %mul68 = mul i64 4, %conv67, !dbg !849
  %call69 = call i32 @cudaMemcpy(i8* %60, i8* %62, i64 %mul68, i32 1), !dbg !850
  call void @llvm.dbg.declare(metadata i8** %d_graph_mask, metadata !851, metadata !595), !dbg !852
  %64 = load i32, i32* @no_of_nodes, align 4, !dbg !853
  %conv70 = sext i32 %64 to i64, !dbg !853
  %mul71 = mul i64 1, %conv70, !dbg !854
  %call72 = call i32 @cudaMalloc(i8** %d_graph_mask, i64 %mul71), !dbg !855
  %65 = load i8*, i8** %d_graph_mask, align 8, !dbg !856
  %66 = load i8*, i8** %h_graph_mask, align 8, !dbg !857
  %67 = load i32, i32* @no_of_nodes, align 4, !dbg !858
  %conv73 = sext i32 %67 to i64, !dbg !858
  %mul74 = mul i64 1, %conv73, !dbg !859
  %call75 = call i32 @cudaMemcpy(i8* %65, i8* %66, i64 %mul74, i32 1), !dbg !860
  call void @llvm.dbg.declare(metadata i8** %d_updating_graph_mask, metadata !861, metadata !595), !dbg !862
  %68 = load i32, i32* @no_of_nodes, align 4, !dbg !863
  %conv76 = sext i32 %68 to i64, !dbg !863
  %mul77 = mul i64 1, %conv76, !dbg !864
  %call78 = call i32 @cudaMalloc(i8** %d_updating_graph_mask, i64 %mul77), !dbg !865
  %69 = load i8*, i8** %d_updating_graph_mask, align 8, !dbg !866
  %70 = load i8*, i8** %h_updating_graph_mask, align 8, !dbg !867
  %71 = load i32, i32* @no_of_nodes, align 4, !dbg !868
  %conv79 = sext i32 %71 to i64, !dbg !868
  %mul80 = mul i64 1, %conv79, !dbg !869
  %call81 = call i32 @cudaMemcpy(i8* %69, i8* %70, i64 %mul80, i32 1), !dbg !870
  call void @llvm.dbg.declare(metadata i8** %d_graph_visited, metadata !871, metadata !595), !dbg !872
  %72 = load i32, i32* @no_of_nodes, align 4, !dbg !873
  %conv82 = sext i32 %72 to i64, !dbg !873
  %mul83 = mul i64 1, %conv82, !dbg !874
  %call84 = call i32 @cudaMalloc(i8** %d_graph_visited, i64 %mul83), !dbg !875
  %73 = load i8*, i8** %d_graph_visited, align 8, !dbg !876
  %74 = load i8*, i8** %h_graph_visited, align 8, !dbg !877
  %75 = load i32, i32* @no_of_nodes, align 4, !dbg !878
  %conv85 = sext i32 %75 to i64, !dbg !878
  %mul86 = mul i64 1, %conv85, !dbg !879
  %call87 = call i32 @cudaMemcpy(i8* %73, i8* %74, i64 %mul86, i32 1), !dbg !880
  call void @llvm.dbg.declare(metadata i32** %h_cost, metadata !881, metadata !595), !dbg !882
  %76 = load i32, i32* @no_of_nodes, align 4, !dbg !883
  %conv88 = sext i32 %76 to i64, !dbg !883
  %mul89 = mul i64 4, %conv88, !dbg !884
  %call90 = call noalias i8* @malloc(i64 %mul89) #10, !dbg !885
  %77 = bitcast i8* %call90 to i32*, !dbg !886
  store i32* %77, i32** %h_cost, align 8, !dbg !882
  call void @llvm.dbg.declare(metadata i32* %i91, metadata !887, metadata !595), !dbg !889
  store i32 0, i32* %i91, align 4, !dbg !889
  br label %for.cond92, !dbg !890

for.cond92:                                       ; preds = %for.inc97, %if.end56
  %78 = load i32, i32* %i91, align 4, !dbg !891
  %79 = load i32, i32* @no_of_nodes, align 4, !dbg !894
  %cmp93 = icmp slt i32 %78, %79, !dbg !895
  br i1 %cmp93, label %for.body94, label %for.end99, !dbg !896

for.body94:                                       ; preds = %for.cond92
  %80 = load i32*, i32** %h_cost, align 8, !dbg !897
  %81 = load i32, i32* %i91, align 4, !dbg !898
  %idxprom95 = sext i32 %81 to i64, !dbg !897
  %arrayidx96 = getelementptr inbounds i32, i32* %80, i64 %idxprom95, !dbg !897
  store i32 -1, i32* %arrayidx96, align 4, !dbg !899
  br label %for.inc97, !dbg !897

for.inc97:                                        ; preds = %for.body94
  %82 = load i32, i32* %i91, align 4, !dbg !900
  %inc98 = add nsw i32 %82, 1, !dbg !900
  store i32 %inc98, i32* %i91, align 4, !dbg !900
  br label %for.cond92, !dbg !902, !llvm.loop !903

for.end99:                                        ; preds = %for.cond92
  %83 = load i32*, i32** %h_cost, align 8, !dbg !905
  %84 = load i32, i32* %source, align 4, !dbg !906
  %idxprom100 = sext i32 %84 to i64, !dbg !905
  %arrayidx101 = getelementptr inbounds i32, i32* %83, i64 %idxprom100, !dbg !905
  store i32 0, i32* %arrayidx101, align 4, !dbg !907
  call void @llvm.dbg.declare(metadata i32** %d_cost, metadata !908, metadata !595), !dbg !909
  %85 = bitcast i32** %d_cost to i8**, !dbg !910
  %86 = load i32, i32* @no_of_nodes, align 4, !dbg !911
  %conv102 = sext i32 %86 to i64, !dbg !911
  %mul103 = mul i64 4, %conv102, !dbg !912
  %call104 = call i32 @cudaMalloc(i8** %85, i64 %mul103), !dbg !913
  %87 = load i32*, i32** %d_cost, align 8, !dbg !914
  %88 = bitcast i32* %87 to i8*, !dbg !914
  %89 = load i32*, i32** %h_cost, align 8, !dbg !915
  %90 = bitcast i32* %89 to i8*, !dbg !915
  %91 = load i32, i32* @no_of_nodes, align 4, !dbg !916
  %conv105 = sext i32 %91 to i64, !dbg !916
  %mul106 = mul i64 4, %conv105, !dbg !917
  %call107 = call i32 @cudaMemcpy(i8* %88, i8* %90, i64 %mul106, i32 1), !dbg !918
  call void @llvm.dbg.declare(metadata i8** %d_over, metadata !919, metadata !595), !dbg !920
  %call108 = call i32 @cudaMalloc(i8** %d_over, i64 1), !dbg !921
  %call109 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.7, i32 0, i32 0)), !dbg !922
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid, metadata !923, metadata !595), !dbg !947
  %92 = load i32, i32* %num_of_blocks, align 4, !dbg !948
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid, i32 %92, i32 1, i32 1), !dbg !947
  call void @llvm.dbg.declare(metadata %struct.dim3* %threads, metadata !949, metadata !595), !dbg !950
  %93 = load i32, i32* %num_of_threads_per_block, align 4, !dbg !951
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %threads, i32 %93, i32 1, i32 1), !dbg !950
  call void @llvm.dbg.declare(metadata i32* %k, metadata !952, metadata !595), !dbg !953
  store i32 0, i32* %k, align 4, !dbg !953
  %call110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.8, i32 0, i32 0)), !dbg !954
  call void @llvm.dbg.declare(metadata i8* %stop, metadata !955, metadata !595), !dbg !956
  br label %do.body, !dbg !957, !llvm.loop !958

do.body:                                          ; preds = %do.cond, %for.end99
  store i8 0, i8* %stop, align 1, !dbg !959
  %94 = load i8*, i8** %d_over, align 8, !dbg !961
  %call111 = call i32 @cudaMemcpy(i8* %94, i8* %stop, i64 1, i32 1), !dbg !962
  %95 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !963
  %96 = bitcast %struct.dim3* %grid to i8*, !dbg !963
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %95, i8* %96, i64 12, i32 4, i1 false), !dbg !963
  %97 = bitcast %struct.dim3* %agg.tmp112 to i8*, !dbg !964
  %98 = bitcast %struct.dim3* %threads to i8*, !dbg !964
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %97, i8* %98, i64 12, i32 4, i1 false), !dbg !964
  %99 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !965
  %100 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !965
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %99, i8* %100, i64 12, i32 4, i1 false), !dbg !965
  %101 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !965
  %102 = load i64, i64* %101, align 4, !dbg !965
  %103 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !965
  %104 = load i32, i32* %103, align 4, !dbg !965
  %105 = bitcast { i64, i32 }* %agg.tmp112.coerce to i8*, !dbg !965
  %106 = bitcast %struct.dim3* %agg.tmp112 to i8*, !dbg !965
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %105, i8* %106, i64 12, i32 4, i1 false), !dbg !965
  %107 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp112.coerce, i32 0, i32 0, !dbg !965
  %108 = load i64, i64* %107, align 4, !dbg !965
  %109 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp112.coerce, i32 0, i32 1, !dbg !965
  %110 = load i32, i32* %109, align 4, !dbg !965
  %call113 = call i32 @cudaConfigureCall(i64 %102, i32 %104, i64 %108, i32 %110, i64 0, %struct.CUstream_st* null), !dbg !965
  %tobool114 = icmp ne i32 %call113, 0, !dbg !965
  br i1 %tobool114, label %kcall.end, label %kcall.configok, !dbg !966

kcall.configok:                                   ; preds = %do.body
  %111 = load %struct.Node*, %struct.Node** %d_graph_nodes, align 8, !dbg !967
  %112 = load i32*, i32** %d_graph_edges, align 8, !dbg !969
  %113 = load i8*, i8** %d_graph_mask, align 8, !dbg !970
  %114 = load i8*, i8** %d_updating_graph_mask, align 8, !dbg !971
  %115 = load i8*, i8** %d_graph_visited, align 8, !dbg !972
  %116 = load i32*, i32** %d_cost, align 8, !dbg !973
  %117 = load i32, i32* @no_of_nodes, align 4, !dbg !974
  call void @_Z6KernelP4NodePiPbS2_S2_S1_i(%struct.Node* %111, i32* %112, i8* %113, i8* %114, i8* %115, i32* %116, i32 %117), !dbg !975
  br label %kcall.end, !dbg !975

kcall.end:                                        ; preds = %kcall.configok, %do.body
  %118 = bitcast %struct.dim3* %agg.tmp115 to i8*, !dbg !976
  %119 = bitcast %struct.dim3* %grid to i8*, !dbg !976
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %118, i8* %119, i64 12, i32 4, i1 false), !dbg !976
  %120 = bitcast %struct.dim3* %agg.tmp116 to i8*, !dbg !977
  %121 = bitcast %struct.dim3* %threads to i8*, !dbg !977
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %120, i8* %121, i64 12, i32 4, i1 false), !dbg !977
  %122 = bitcast { i64, i32 }* %agg.tmp115.coerce to i8*, !dbg !978
  %123 = bitcast %struct.dim3* %agg.tmp115 to i8*, !dbg !978
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %122, i8* %123, i64 12, i32 4, i1 false), !dbg !978
  %124 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp115.coerce, i32 0, i32 0, !dbg !978
  %125 = load i64, i64* %124, align 4, !dbg !978
  %126 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp115.coerce, i32 0, i32 1, !dbg !978
  %127 = load i32, i32* %126, align 4, !dbg !978
  %128 = bitcast { i64, i32 }* %agg.tmp116.coerce to i8*, !dbg !978
  %129 = bitcast %struct.dim3* %agg.tmp116 to i8*, !dbg !978
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %128, i8* %129, i64 12, i32 4, i1 false), !dbg !978
  %130 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp116.coerce, i32 0, i32 0, !dbg !978
  %131 = load i64, i64* %130, align 4, !dbg !978
  %132 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp116.coerce, i32 0, i32 1, !dbg !978
  %133 = load i32, i32* %132, align 4, !dbg !978
  %call117 = call i32 @cudaConfigureCall(i64 %125, i32 %127, i64 %131, i32 %133, i64 0, %struct.CUstream_st* null), !dbg !978
  %tobool118 = icmp ne i32 %call117, 0, !dbg !978
  br i1 %tobool118, label %kcall.end120, label %kcall.configok119, !dbg !979

kcall.configok119:                                ; preds = %kcall.end
  %134 = load i8*, i8** %d_graph_mask, align 8, !dbg !980
  %135 = load i8*, i8** %d_updating_graph_mask, align 8, !dbg !981
  %136 = load i8*, i8** %d_graph_visited, align 8, !dbg !982
  %137 = load i8*, i8** %d_over, align 8, !dbg !983
  %138 = load i32, i32* @no_of_nodes, align 4, !dbg !984
  call void @_Z7Kernel2PbS_S_S_i(i8* %134, i8* %135, i8* %136, i8* %137, i32 %138), !dbg !985
  br label %kcall.end120, !dbg !985

kcall.end120:                                     ; preds = %kcall.configok119, %kcall.end
  %139 = load i8*, i8** %d_over, align 8, !dbg !986
  %call121 = call i32 @cudaMemcpy(i8* %stop, i8* %139, i64 1, i32 2), !dbg !987
  %140 = load i32, i32* %k, align 4, !dbg !988
  %inc122 = add nsw i32 %140, 1, !dbg !988
  store i32 %inc122, i32* %k, align 4, !dbg !988
  br label %do.cond, !dbg !989

do.cond:                                          ; preds = %kcall.end120
  %141 = load i8, i8* %stop, align 1, !dbg !990
  %tobool123 = trunc i8 %141 to i1, !dbg !990
  br i1 %tobool123, label %do.body, label %do.end, !dbg !991, !llvm.loop !958

do.end:                                           ; preds = %do.cond
  %142 = load i32, i32* %k, align 4, !dbg !992
  %call124 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.9, i32 0, i32 0), i32 %142), !dbg !993
  %143 = load i32*, i32** %h_cost, align 8, !dbg !994
  %144 = bitcast i32* %143 to i8*, !dbg !994
  %145 = load i32*, i32** %d_cost, align 8, !dbg !995
  %146 = bitcast i32* %145 to i8*, !dbg !995
  %147 = load i32, i32* @no_of_nodes, align 4, !dbg !996
  %conv125 = sext i32 %147 to i64, !dbg !996
  %mul126 = mul i64 4, %conv125, !dbg !997
  %call127 = call i32 @cudaMemcpy(i8* %144, i8* %146, i64 %mul126, i32 2), !dbg !998
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fpo, metadata !999, metadata !595), !dbg !1000
  %call128 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0)), !dbg !1001
  store %struct._IO_FILE* %call128, %struct._IO_FILE** %fpo, align 8, !dbg !1000
  call void @llvm.dbg.declare(metadata i32* %i129, metadata !1002, metadata !595), !dbg !1004
  store i32 0, i32* %i129, align 4, !dbg !1004
  br label %for.cond130, !dbg !1005

for.cond130:                                      ; preds = %for.inc136, %do.end
  %148 = load i32, i32* %i129, align 4, !dbg !1006
  %149 = load i32, i32* @no_of_nodes, align 4, !dbg !1009
  %cmp131 = icmp slt i32 %148, %149, !dbg !1010
  br i1 %cmp131, label %for.body132, label %for.end138, !dbg !1011

for.body132:                                      ; preds = %for.cond130
  %150 = load %struct._IO_FILE*, %struct._IO_FILE** %fpo, align 8, !dbg !1012
  %151 = load i32, i32* %i129, align 4, !dbg !1013
  %152 = load i32*, i32** %h_cost, align 8, !dbg !1014
  %153 = load i32, i32* %i129, align 4, !dbg !1015
  %idxprom133 = sext i32 %153 to i64, !dbg !1014
  %arrayidx134 = getelementptr inbounds i32, i32* %152, i64 %idxprom133, !dbg !1014
  %154 = load i32, i32* %arrayidx134, align 4, !dbg !1014
  %call135 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %150, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i32 0, i32 0), i32 %151, i32 %154), !dbg !1016
  br label %for.inc136, !dbg !1016

for.inc136:                                       ; preds = %for.body132
  %155 = load i32, i32* %i129, align 4, !dbg !1017
  %inc137 = add nsw i32 %155, 1, !dbg !1017
  store i32 %inc137, i32* %i129, align 4, !dbg !1017
  br label %for.cond130, !dbg !1019, !llvm.loop !1020

for.end138:                                       ; preds = %for.cond130
  %156 = load %struct._IO_FILE*, %struct._IO_FILE** %fpo, align 8, !dbg !1022
  %call139 = call i32 @fclose(%struct._IO_FILE* %156), !dbg !1023
  %call140 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.13, i32 0, i32 0)), !dbg !1024
  %157 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !1025
  %158 = bitcast %struct.Node* %157 to i8*, !dbg !1025
  call void @free(i8* %158) #10, !dbg !1026
  %159 = load i32*, i32** %h_graph_edges, align 8, !dbg !1027
  %160 = bitcast i32* %159 to i8*, !dbg !1027
  call void @free(i8* %160) #10, !dbg !1028
  %161 = load i8*, i8** %h_graph_mask, align 8, !dbg !1029
  call void @free(i8* %161) #10, !dbg !1030
  %162 = load i8*, i8** %h_updating_graph_mask, align 8, !dbg !1031
  call void @free(i8* %162) #10, !dbg !1032
  %163 = load i8*, i8** %h_graph_visited, align 8, !dbg !1033
  call void @free(i8* %163) #10, !dbg !1034
  %164 = load i32*, i32** %h_cost, align 8, !dbg !1035
  %165 = bitcast i32* %164 to i8*, !dbg !1035
  call void @free(i8* %165) #10, !dbg !1036
  %166 = load %struct.Node*, %struct.Node** %d_graph_nodes, align 8, !dbg !1037
  %167 = bitcast %struct.Node* %166 to i8*, !dbg !1037
  %call141 = call i32 @cudaFree(i8* %167), !dbg !1038
  %168 = load i32*, i32** %d_graph_edges, align 8, !dbg !1039
  %169 = bitcast i32* %168 to i8*, !dbg !1039
  %call142 = call i32 @cudaFree(i8* %169), !dbg !1040
  %170 = load i8*, i8** %d_graph_mask, align 8, !dbg !1041
  %call143 = call i32 @cudaFree(i8* %170), !dbg !1042
  %171 = load i8*, i8** %d_updating_graph_mask, align 8, !dbg !1043
  %call144 = call i32 @cudaFree(i8* %171), !dbg !1044
  %172 = load i8*, i8** %d_graph_visited, align 8, !dbg !1045
  %call145 = call i32 @cudaFree(i8* %172), !dbg !1046
  %173 = load i32*, i32** %d_cost, align 8, !dbg !1047
  %174 = bitcast i32* %173 to i8*, !dbg !1047
  %call146 = call i32 @cudaFree(i8* %174), !dbg !1048
  br label %return, !dbg !1049

return:                                           ; preds = %for.end138, %if.then2
  ret void, !dbg !1050
}

; Function Attrs: uwtable
define void @_Z5UsageiPPc(i32 %argc, i8** %argv) #0 !dbg !1052 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1053, metadata !595), !dbg !1054
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1055, metadata !595), !dbg !1056
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1057
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !1058
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !1058
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !1058
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0), i8* %2), !dbg !1059
  ret void, !dbg !1060
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

declare i32 @printf(i8*, ...) #3

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

declare i32 @fscanf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind readnone
declare double @ceil(double) #5

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #6

declare i32 @fclose(%struct._IO_FILE*) #3

declare i32 @cudaMalloc(i8**, i64) #3

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) #3

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #7 comdat align 2 !dbg !1061 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1062, metadata !595), !dbg !1064
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1065, metadata !595), !dbg !1066
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1067, metadata !595), !dbg !1068
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1069, metadata !595), !dbg !1070
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1071
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1072
  store i32 %0, i32* %x, align 4, !dbg !1071
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1073
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1074
  store i32 %1, i32* %y, align 4, !dbg !1073
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1075
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1076
  store i32 %2, i32* %z, align 4, !dbg !1075
  ret void, !dbg !1077
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #8

; Function Attrs: nounwind
declare void @free(i8*) #6

declare i32 @cudaFree(i8*) #3

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { argmemonly nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind }

!llvm.dbg.cu = !{!1}
!llvm.module.flags = !{!586, !587}
!llvm.ident = !{!588}

!0 = distinct !DIGlobalVariable(name: "no_of_nodes", scope: !1, file: !2, line: 26, type: !13, isLocal: false, isDefinition: true)
!1 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !2, producer: "clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !3, retainedTypes: !12, globals: !25, imports: !33)
!2 = !DIFile(filename: "bfs.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!3 = !{!4}
!4 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !5, line: 807, size: 32, align: 32, elements: !6, identifier: "_ZTS14cudaMemcpyKind")
!5 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!6 = !{!7, !8, !9, !10, !11}
!7 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!8 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!10 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!11 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!12 = !{!13, !14, !15, !20, !22, !23}
!13 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!14 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64, align: 64)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Node", file: !2, line: 31, size: 64, align: 32, elements: !17, identifier: "_ZTS4Node")
!17 = !{!18, !19}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "starting", scope: !16, file: !2, line: 33, baseType: !13, size: 32, align: 32)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "no_of_edges", scope: !16, file: !2, line: 34, baseType: !13, size: 32, align: 32, offset: 32)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64, align: 64)
!21 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64, align: 64)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!25 = !{!0, !26, !27}
!26 = distinct !DIGlobalVariable(name: "edge_list_size", scope: !1, file: !2, line: 27, type: !13, isLocal: false, isDefinition: true)
!27 = distinct !DIGlobalVariable(name: "fp", scope: !1, file: !2, line: 28, type: !28, isLocal: false, isDefinition: true)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64, align: 64)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !30, line: 48, baseType: !31)
!30 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!31 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !32, line: 241, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!32 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!33 = !{!34, !41, !46, !48, !50, !52, !54, !58, !60, !62, !64, !66, !68, !70, !72, !74, !76, !78, !80, !82, !84, !86, !90, !92, !94, !96, !100, !104, !106, !108, !112, !116, !118, !120, !122, !124, !126, !128, !130, !132, !137, !141, !143, !145, !149, !151, !153, !155, !157, !159, !163, !165, !167, !172, !179, !183, !185, !187, !191, !193, !195, !199, !201, !203, !207, !209, !211, !213, !215, !217, !219, !221, !223, !225, !230, !232, !234, !238, !240, !242, !244, !246, !248, !250, !252, !256, !260, !262, !264, !269, !271, !273, !275, !277, !279, !281, !285, !291, !295, !299, !304, !306, !310, !314, !327, !331, !335, !339, !343, !348, !350, !354, !358, !362, !370, !374, !378, !382, !386, !391, !397, !401, !405, !407, !415, !419, !427, !429, !431, !435, !439, !443, !448, !452, !457, !458, !459, !460, !463, !464, !465, !466, !467, !468, !469, !472, !474, !476, !478, !480, !482, !484, !486, !489, !491, !493, !495, !497, !499, !501, !503, !505, !507, !509, !511, !513, !515, !517, !519, !521, !523, !525, !527, !529, !531, !533, !535, !537, !539, !541, !543, !545, !547, !549, !551, !553, !557, !558, !560, !562, !564, !566, !568, !570, !572, !574, !576, !578, !580, !582, !584}
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !37, line: 189)
!35 = !DINamespace(name: "std", scope: null, file: !36, line: 188)
!36 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!37 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !36, file: !36, line: 44, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!38 = !DISubroutineType(types: !39)
!39 = !{!40, !40}
!40 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !42, line: 190)
!42 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !36, file: !36, line: 46, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45}
!45 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !47, line: 191)
!47 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !36, file: !36, line: 48, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !49, line: 192)
!49 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !36, file: !36, line: 50, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !51, line: 193)
!51 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !36, file: !36, line: 52, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !53, line: 194)
!53 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !36, file: !36, line: 56, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !55, line: 195)
!55 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !36, file: !36, line: 54, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!56 = !DISubroutineType(types: !57)
!57 = !{!45, !45, !45}
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !59, line: 196)
!59 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !36, file: !36, line: 58, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !61, line: 197)
!61 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !36, file: !36, line: 60, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !63, line: 198)
!63 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !36, file: !36, line: 62, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !65, line: 199)
!65 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !36, file: !36, line: 64, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !67, line: 200)
!67 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !36, file: !36, line: 66, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !69, line: 201)
!69 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !36, file: !36, line: 68, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !71, line: 202)
!71 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !36, file: !36, line: 72, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !73, line: 203)
!73 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !36, file: !36, line: 70, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !75, line: 204)
!75 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !36, file: !36, line: 76, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !77, line: 205)
!77 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !36, file: !36, line: 74, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !79, line: 206)
!79 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !36, file: !36, line: 78, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !81, line: 207)
!81 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !36, file: !36, line: 80, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !83, line: 208)
!83 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !36, file: !36, line: 82, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !85, line: 209)
!85 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !36, file: !36, line: 84, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !87, line: 210)
!87 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !36, file: !36, line: 86, type: !88, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!88 = !DISubroutineType(types: !89)
!89 = !{!45, !45, !45, !45}
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !91, line: 211)
!91 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !36, file: !36, line: 88, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !93, line: 212)
!93 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !36, file: !36, line: 90, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !95, line: 213)
!95 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !36, file: !36, line: 92, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !97, line: 214)
!97 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !36, file: !36, line: 94, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!98 = !DISubroutineType(types: !99)
!99 = !{!13, !45}
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !101, line: 215)
!101 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !36, file: !36, line: 96, type: !102, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!102 = !DISubroutineType(types: !103)
!103 = !{!45, !45, !22}
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !105, line: 216)
!105 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !36, file: !36, line: 98, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !107, line: 217)
!107 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !36, file: !36, line: 100, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !109, line: 218)
!109 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !36, file: !36, line: 102, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DISubroutineType(types: !111)
!111 = !{!21, !45}
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !113, line: 219)
!113 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !36, file: !36, line: 106, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DISubroutineType(types: !115)
!115 = !{!21, !45, !45}
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !117, line: 220)
!117 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !36, file: !36, line: 105, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !119, line: 221)
!119 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !36, file: !36, line: 108, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !121, line: 222)
!121 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !36, file: !36, line: 112, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !123, line: 223)
!123 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !36, file: !36, line: 111, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !125, line: 224)
!125 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !36, file: !36, line: 114, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !127, line: 225)
!127 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !36, file: !36, line: 116, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !129, line: 226)
!129 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !36, file: !36, line: 118, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !131, line: 227)
!131 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !36, file: !36, line: 120, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !133, line: 228)
!133 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !36, file: !36, line: 121, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DISubroutineType(types: !135)
!135 = !{!136, !136}
!136 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !138, line: 229)
!138 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !36, file: !36, line: 123, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DISubroutineType(types: !140)
!140 = !{!45, !45, !13}
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !142, line: 230)
!142 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !36, file: !36, line: 125, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !144, line: 231)
!144 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !36, file: !36, line: 126, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !146, line: 232)
!146 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !36, file: !36, line: 128, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DISubroutineType(types: !148)
!148 = !{!40, !45}
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !150, line: 233)
!150 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !36, file: !36, line: 138, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !152, line: 234)
!152 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !36, file: !36, line: 130, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !154, line: 235)
!154 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !36, file: !36, line: 132, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !156, line: 236)
!156 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !36, file: !36, line: 134, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !158, line: 237)
!158 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !36, file: !36, line: 136, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !160, line: 238)
!160 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !36, file: !36, line: 140, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DISubroutineType(types: !162)
!162 = !{!136, !45}
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !164, line: 239)
!164 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !36, file: !36, line: 142, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !166, line: 240)
!166 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !36, file: !36, line: 143, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !168, line: 241)
!168 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !36, file: !36, line: 145, type: !169, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DISubroutineType(types: !170)
!170 = !{!45, !45, !171}
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !173, line: 242)
!173 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !36, file: !36, line: 146, type: !174, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DISubroutineType(types: !175)
!175 = !{!14, !176}
!176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !177, size: 64, align: 64)
!177 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !178)
!178 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !180, line: 243)
!180 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !36, file: !36, line: 147, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{!45, !176}
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !184, line: 244)
!184 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !36, file: !36, line: 149, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !186, line: 245)
!186 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !36, file: !36, line: 151, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !188, line: 246)
!188 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !36, file: !36, line: 153, type: !189, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!45, !45, !14}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !192, line: 247)
!192 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !36, file: !36, line: 158, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !194, line: 248)
!194 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !36, file: !36, line: 160, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !196, line: 249)
!196 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !36, file: !36, line: 162, type: !197, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DISubroutineType(types: !198)
!198 = !{!45, !45, !45, !22}
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !200, line: 250)
!200 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !36, file: !36, line: 164, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !202, line: 251)
!202 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !36, file: !36, line: 166, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !204, line: 252)
!204 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !36, file: !36, line: 168, type: !205, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DISubroutineType(types: !206)
!206 = !{!45, !45, !136}
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !208, line: 253)
!208 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !36, file: !36, line: 170, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !210, line: 254)
!210 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !36, file: !36, line: 172, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !212, line: 255)
!212 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !36, file: !36, line: 174, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !214, line: 256)
!214 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !36, file: !36, line: 176, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !216, line: 257)
!216 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !36, file: !36, line: 178, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !218, line: 258)
!218 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !36, file: !36, line: 180, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !220, line: 259)
!220 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !36, file: !36, line: 182, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !222, line: 260)
!222 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !36, file: !36, line: 184, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !224, line: 261)
!224 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !36, file: !36, line: 186, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !226, line: 102)
!226 = !DISubprogram(name: "acos", scope: !227, file: !227, line: 54, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!228 = !DISubroutineType(types: !229)
!229 = !{!14, !14}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !231, line: 121)
!231 = !DISubprogram(name: "asin", scope: !227, file: !227, line: 56, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !233, line: 140)
!233 = !DISubprogram(name: "atan", scope: !227, file: !227, line: 58, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !235, line: 159)
!235 = !DISubprogram(name: "atan2", scope: !227, file: !227, line: 60, type: !236, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DISubroutineType(types: !237)
!237 = !{!14, !14, !14}
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !239, line: 180)
!239 = !DISubprogram(name: "ceil", scope: !227, file: !227, line: 178, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !241, line: 199)
!241 = !DISubprogram(name: "cos", scope: !227, file: !227, line: 63, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !243, line: 218)
!243 = !DISubprogram(name: "cosh", scope: !227, file: !227, line: 72, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !245, line: 237)
!245 = !DISubprogram(name: "exp", scope: !227, file: !227, line: 100, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !247, line: 256)
!247 = !DISubprogram(name: "fabs", scope: !227, file: !227, line: 181, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !249, line: 275)
!249 = !DISubprogram(name: "floor", scope: !227, file: !227, line: 184, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !251, line: 294)
!251 = !DISubprogram(name: "fmod", scope: !227, file: !227, line: 187, type: !236, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !253, line: 315)
!253 = !DISubprogram(name: "frexp", scope: !227, file: !227, line: 103, type: !254, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DISubroutineType(types: !255)
!255 = !{!14, !14, !22}
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !257, line: 334)
!257 = !DISubprogram(name: "ldexp", scope: !227, file: !227, line: 106, type: !258, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DISubroutineType(types: !259)
!259 = !{!14, !14, !13}
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !261, line: 353)
!261 = !DISubprogram(name: "log", scope: !227, file: !227, line: 109, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !263, line: 372)
!263 = !DISubprogram(name: "log10", scope: !227, file: !227, line: 112, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !265, line: 391)
!265 = !DISubprogram(name: "modf", scope: !227, file: !227, line: 115, type: !266, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DISubroutineType(types: !267)
!267 = !{!14, !14, !268}
!268 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64, align: 64)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !270, line: 403)
!270 = !DISubprogram(name: "pow", scope: !227, file: !227, line: 153, type: !236, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !272, line: 440)
!272 = !DISubprogram(name: "sin", scope: !227, file: !227, line: 65, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !274, line: 459)
!274 = !DISubprogram(name: "sinh", scope: !227, file: !227, line: 74, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !276, line: 478)
!276 = !DISubprogram(name: "sqrt", scope: !227, file: !227, line: 156, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !278, line: 497)
!278 = !DISubprogram(name: "tan", scope: !227, file: !227, line: 67, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !280, line: 516)
!280 = !DISubprogram(name: "tanh", scope: !227, file: !227, line: 76, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !282, line: 118)
!282 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !283, line: 101, baseType: !284)
!283 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!284 = !DICompositeType(tag: DW_TAG_structure_type, file: !283, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !286, line: 119)
!286 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !283, line: 109, baseType: !287)
!287 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !283, line: 105, size: 128, align: 64, elements: !288, identifier: "_ZTS6ldiv_t")
!288 = !{!289, !290}
!289 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !287, file: !283, line: 107, baseType: !136, size: 64, align: 64)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !287, file: !283, line: 108, baseType: !136, size: 64, align: 64, offset: 64)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !292, line: 121)
!292 = !DISubprogram(name: "abort", scope: !283, file: !283, line: 515, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!293 = !DISubroutineType(types: !294)
!294 = !{null}
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !296, line: 122)
!296 = !DISubprogram(name: "abs", scope: !283, file: !283, line: 774, type: !297, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DISubroutineType(types: !298)
!298 = !{!13, !13}
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !300, line: 123)
!300 = !DISubprogram(name: "atexit", scope: !283, file: !283, line: 519, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !DISubroutineType(types: !302)
!302 = !{!13, !303}
!303 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !293, size: 64, align: 64)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !305, line: 129)
!305 = !DISubprogram(name: "atof", scope: !283, file: !283, line: 144, type: !174, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !307, line: 130)
!307 = !DISubprogram(name: "atoi", scope: !283, file: !283, line: 147, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{!13, !176}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !311, line: 131)
!311 = !DISubprogram(name: "atol", scope: !283, file: !283, line: 150, type: !312, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DISubroutineType(types: !313)
!313 = !{!136, !176}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !315, line: 132)
!315 = !DISubprogram(name: "bsearch", scope: !283, file: !283, line: 754, type: !316, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DISubroutineType(types: !317)
!317 = !{!24, !318, !318, !320, !320, !323}
!318 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !319, size: 64, align: 64)
!319 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!320 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !321, line: 62, baseType: !322)
!321 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!322 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!323 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !283, line: 741, baseType: !324)
!324 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !325, size: 64, align: 64)
!325 = !DISubroutineType(types: !326)
!326 = !{!13, !318, !318}
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !328, line: 133)
!328 = !DISubprogram(name: "calloc", scope: !283, file: !283, line: 468, type: !329, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!329 = !DISubroutineType(types: !330)
!330 = !{!24, !320, !320}
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !332, line: 134)
!332 = !DISubprogram(name: "div", scope: !283, file: !283, line: 788, type: !333, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!333 = !DISubroutineType(types: !334)
!334 = !{!282, !13, !13}
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !336, line: 135)
!336 = !DISubprogram(name: "exit", scope: !283, file: !283, line: 543, type: !337, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!337 = !DISubroutineType(types: !338)
!338 = !{null, !13}
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !340, line: 136)
!340 = !DISubprogram(name: "free", scope: !283, file: !283, line: 483, type: !341, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DISubroutineType(types: !342)
!342 = !{null, !24}
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !344, line: 137)
!344 = !DISubprogram(name: "getenv", scope: !283, file: !283, line: 564, type: !345, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DISubroutineType(types: !346)
!346 = !{!347, !176}
!347 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 64, align: 64)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !349, line: 138)
!349 = !DISubprogram(name: "labs", scope: !283, file: !283, line: 775, type: !134, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !351, line: 139)
!351 = !DISubprogram(name: "ldiv", scope: !283, file: !283, line: 790, type: !352, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !DISubroutineType(types: !353)
!353 = !{!286, !136, !136}
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !355, line: 140)
!355 = !DISubprogram(name: "malloc", scope: !283, file: !283, line: 466, type: !356, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !DISubroutineType(types: !357)
!357 = !{!24, !320}
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !359, line: 142)
!359 = !DISubprogram(name: "mblen", scope: !283, file: !283, line: 862, type: !360, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DISubroutineType(types: !361)
!361 = !{!13, !176, !320}
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !363, line: 143)
!363 = !DISubprogram(name: "mbstowcs", scope: !283, file: !283, line: 873, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{!320, !366, !369, !320}
!366 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !367)
!367 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !368, size: 64, align: 64)
!368 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!369 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !176)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !371, line: 144)
!371 = !DISubprogram(name: "mbtowc", scope: !283, file: !283, line: 865, type: !372, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!372 = !DISubroutineType(types: !373)
!373 = !{!13, !366, !369, !320}
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !375, line: 146)
!375 = !DISubprogram(name: "qsort", scope: !283, file: !283, line: 764, type: !376, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!376 = !DISubroutineType(types: !377)
!377 = !{null, !24, !320, !320, !323}
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !379, line: 152)
!379 = !DISubprogram(name: "rand", scope: !283, file: !283, line: 374, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !DISubroutineType(types: !381)
!381 = !{!13}
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !383, line: 153)
!383 = !DISubprogram(name: "realloc", scope: !283, file: !283, line: 480, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{!24, !24, !320}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !387, line: 154)
!387 = !DISubprogram(name: "srand", scope: !283, file: !283, line: 376, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{null, !390}
!390 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !392, line: 155)
!392 = !DISubprogram(name: "strtod", scope: !283, file: !283, line: 164, type: !393, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!393 = !DISubroutineType(types: !394)
!394 = !{!14, !369, !395}
!395 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !396)
!396 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !347, size: 64, align: 64)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !398, line: 156)
!398 = !DISubprogram(name: "strtol", scope: !283, file: !283, line: 183, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!399 = !DISubroutineType(types: !400)
!400 = !{!136, !369, !395, !13}
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !402, line: 157)
!402 = !DISubprogram(name: "strtoul", scope: !283, file: !283, line: 187, type: !403, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!403 = !DISubroutineType(types: !404)
!404 = !{!322, !369, !395, !13}
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !406, line: 158)
!406 = !DISubprogram(name: "system", scope: !283, file: !283, line: 716, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !408, line: 160)
!408 = !DISubprogram(name: "wcstombs", scope: !283, file: !283, line: 876, type: !409, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!409 = !DISubroutineType(types: !410)
!410 = !{!320, !411, !412, !320}
!411 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !347)
!412 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !413)
!413 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !414, size: 64, align: 64)
!414 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !368)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !416, line: 161)
!416 = !DISubprogram(name: "wctomb", scope: !283, file: !283, line: 869, type: !417, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!417 = !DISubroutineType(types: !418)
!418 = !{!13, !347, !368}
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !420, entity: !422, line: 214)
!420 = !DINamespace(name: "__gnu_cxx", scope: null, file: !421, line: 220)
!421 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !283, line: 121, baseType: !423)
!423 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !283, line: 117, size: 128, align: 64, elements: !424, identifier: "_ZTS7lldiv_t")
!424 = !{!425, !426}
!425 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !423, file: !283, line: 119, baseType: !40, size: 64, align: 64)
!426 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !423, file: !283, line: 120, baseType: !40, size: 64, align: 64, offset: 64)
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !420, entity: !428, line: 220)
!428 = !DISubprogram(name: "_Exit", scope: !283, file: !283, line: 557, type: !337, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !420, entity: !430, line: 224)
!430 = !DISubprogram(name: "llabs", scope: !283, file: !283, line: 779, type: !38, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !420, entity: !432, line: 230)
!432 = !DISubprogram(name: "lldiv", scope: !283, file: !283, line: 796, type: !433, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!433 = !DISubroutineType(types: !434)
!434 = !{!422, !40, !40}
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !420, entity: !436, line: 241)
!436 = !DISubprogram(name: "atoll", scope: !283, file: !283, line: 157, type: !437, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!437 = !DISubroutineType(types: !438)
!438 = !{!40, !176}
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !420, entity: !440, line: 242)
!440 = !DISubprogram(name: "strtoll", scope: !283, file: !283, line: 209, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!441 = !DISubroutineType(types: !442)
!442 = !{!40, !369, !395, !13}
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !420, entity: !444, line: 243)
!444 = !DISubprogram(name: "strtoull", scope: !283, file: !283, line: 214, type: !445, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!445 = !DISubroutineType(types: !446)
!446 = !{!447, !369, !395, !13}
!447 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !420, entity: !449, line: 245)
!449 = !DISubprogram(name: "strtof", scope: !283, file: !283, line: 172, type: !450, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!450 = !DISubroutineType(types: !451)
!451 = !{!45, !369, !395}
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !420, entity: !453, line: 246)
!453 = !DISubprogram(name: "strtold", scope: !283, file: !283, line: 175, type: !454, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!454 = !DISubroutineType(types: !455)
!455 = !{!456, !369, !395}
!456 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !422, line: 254)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !428, line: 256)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !430, line: 258)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !461, line: 259)
!461 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !420, file: !462, line: 227, type: !433, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!462 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !432, line: 260)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !436, line: 262)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !449, line: 263)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !440, line: 264)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !444, line: 265)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !453, line: 266)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !470, line: 397)
!470 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !471, file: !471, line: 1342, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !473, line: 398)
!473 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !471, file: !471, line: 1370, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !475, line: 399)
!475 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !471, file: !471, line: 1337, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !477, line: 400)
!477 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !471, file: !471, line: 1375, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !479, line: 401)
!479 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !471, file: !471, line: 1327, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !481, line: 402)
!481 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !471, file: !471, line: 1332, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !483, line: 403)
!483 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !471, file: !471, line: 1380, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !485, line: 404)
!485 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !471, file: !471, line: 1430, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !487, line: 405)
!487 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !488, file: !488, line: 667, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!488 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !490, line: 406)
!490 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !471, file: !471, line: 1189, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !492, line: 407)
!492 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !471, file: !471, line: 1243, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !494, line: 408)
!494 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !471, file: !471, line: 1312, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !496, line: 409)
!496 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !471, file: !471, line: 1490, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !498, line: 410)
!498 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !471, file: !471, line: 1480, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !500, line: 411)
!500 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !488, file: !488, line: 657, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !502, line: 412)
!502 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !471, file: !471, line: 1294, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !504, line: 413)
!504 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !471, file: !471, line: 1385, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !506, line: 414)
!506 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !488, file: !488, line: 607, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !508, line: 415)
!508 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !471, file: !471, line: 1616, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !510, line: 416)
!510 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !488, file: !488, line: 597, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !512, line: 417)
!512 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !471, file: !471, line: 1568, type: !88, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !514, line: 418)
!514 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !488, file: !488, line: 622, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !516, line: 419)
!516 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !488, file: !488, line: 617, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !518, line: 420)
!518 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !471, file: !471, line: 1553, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !520, line: 421)
!520 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !471, file: !471, line: 1543, type: !102, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !522, line: 422)
!522 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !471, file: !471, line: 1390, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !524, line: 423)
!524 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !471, file: !471, line: 1621, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !526, line: 424)
!526 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !471, file: !471, line: 1520, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !528, line: 425)
!528 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !471, file: !471, line: 1515, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !530, line: 426)
!530 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !471, file: !471, line: 1149, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !532, line: 427)
!532 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !471, file: !471, line: 1602, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !534, line: 428)
!534 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !471, file: !471, line: 1356, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !536, line: 429)
!536 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !471, file: !471, line: 1365, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !538, line: 430)
!538 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !471, file: !471, line: 1285, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !540, line: 431)
!540 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !471, file: !471, line: 1626, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !542, line: 432)
!542 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !471, file: !471, line: 1347, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !544, line: 433)
!544 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !471, file: !471, line: 1140, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !546, line: 434)
!546 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !471, file: !471, line: 1607, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !548, line: 435)
!548 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !471, file: !471, line: 1548, type: !169, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !550, line: 436)
!550 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !471, file: !471, line: 1154, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !552, line: 437)
!552 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !471, file: !471, line: 1218, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !554, line: 438)
!554 = !DISubprogram(name: "nexttowardf", scope: !227, file: !227, line: 294, type: !555, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DISubroutineType(types: !556)
!556 = !{!45, !45, !456}
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !554, line: 439)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !559, line: 440)
!559 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !471, file: !471, line: 1583, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !561, line: 441)
!561 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !471, file: !471, line: 1558, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !563, line: 442)
!563 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !471, file: !471, line: 1563, type: !197, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !565, line: 443)
!565 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !471, file: !471, line: 1135, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !567, line: 444)
!567 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !471, file: !471, line: 1597, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !569, line: 445)
!569 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !471, file: !471, line: 1530, type: !205, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !571, line: 446)
!571 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !471, file: !471, line: 1525, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !573, line: 447)
!573 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !471, file: !471, line: 1234, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !575, line: 448)
!575 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !471, file: !471, line: 1317, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !577, line: 449)
!577 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !488, file: !488, line: 907, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !579, line: 450)
!579 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !471, file: !471, line: 1276, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !581, line: 451)
!581 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !471, file: !471, line: 1322, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !583, line: 452)
!583 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !471, file: !471, line: 1592, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !585, line: 453)
!585 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !488, file: !488, line: 662, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!586 = !{i32 2, !"Dwarf Version", i32 4}
!587 = !{i32 2, !"Debug Info Version", i32 3}
!588 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 2debfe67236df81b4b386304d4aecd9fe20fc156) (http://llvm.org/git/llvm.git 9aa8644318b899329caf41dc98a12db04dee5855)"}
!589 = distinct !DISubprogram(name: "Kernel", linkageName: "_Z6KernelP4NodePiPbS2_S2_S1_i", scope: !590, file: !590, line: 22, type: !591, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !593)
!590 = !DIFile(filename: "./kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!591 = !DISubroutineType(types: !592)
!592 = !{null, !15, !22, !20, !20, !20, !22, !13}
!593 = !{}
!594 = !DILocalVariable(name: "g_graph_nodes", arg: 1, scope: !589, file: !590, line: 22, type: !15)
!595 = !DIExpression()
!596 = !DILocation(line: 22, column: 15, scope: !589)
!597 = !DILocalVariable(name: "g_graph_edges", arg: 2, scope: !589, file: !590, line: 22, type: !22)
!598 = !DILocation(line: 22, column: 35, scope: !589)
!599 = !DILocalVariable(name: "g_graph_mask", arg: 3, scope: !589, file: !590, line: 22, type: !20)
!600 = !DILocation(line: 22, column: 56, scope: !589)
!601 = !DILocalVariable(name: "g_updating_graph_mask", arg: 4, scope: !589, file: !590, line: 22, type: !20)
!602 = !DILocation(line: 22, column: 76, scope: !589)
!603 = !DILocalVariable(name: "g_graph_visited", arg: 5, scope: !589, file: !590, line: 22, type: !20)
!604 = !DILocation(line: 22, column: 105, scope: !589)
!605 = !DILocalVariable(name: "g_cost", arg: 6, scope: !589, file: !590, line: 22, type: !22)
!606 = !DILocation(line: 22, column: 127, scope: !589)
!607 = !DILocalVariable(name: "no_of_nodes", arg: 7, scope: !589, file: !590, line: 22, type: !13)
!608 = !DILocation(line: 22, column: 139, scope: !589)
!609 = !DILocation(line: 23, column: 1, scope: !589)
!610 = !DILocation(line: 23, column: 1, scope: !611)
!611 = !DILexicalBlockFile(scope: !589, file: !590, discriminator: 1)
!612 = !DILocation(line: 23, column: 1, scope: !613)
!613 = !DILexicalBlockFile(scope: !589, file: !590, discriminator: 2)
!614 = !DILocation(line: 23, column: 1, scope: !615)
!615 = !DILexicalBlockFile(scope: !589, file: !590, discriminator: 3)
!616 = !DILocation(line: 23, column: 1, scope: !617)
!617 = !DILexicalBlockFile(scope: !589, file: !590, discriminator: 4)
!618 = !DILocation(line: 23, column: 1, scope: !619)
!619 = !DILexicalBlockFile(scope: !589, file: !590, discriminator: 5)
!620 = !DILocation(line: 23, column: 1, scope: !621)
!621 = !DILexicalBlockFile(scope: !589, file: !590, discriminator: 6)
!622 = !DILocation(line: 23, column: 1, scope: !623)
!623 = !DILexicalBlockFile(scope: !589, file: !590, discriminator: 7)
!624 = !DILocation(line: 38, column: 1, scope: !589)
!625 = distinct !DISubprogram(name: "Kernel2", linkageName: "_Z7Kernel2PbS_S_S_i", scope: !626, file: !626, line: 22, type: !627, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !593)
!626 = !DIFile(filename: "./kernel2.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!627 = !DISubroutineType(types: !628)
!628 = !{null, !20, !20, !20, !20, !13}
!629 = !DILocalVariable(name: "g_graph_mask", arg: 1, scope: !625, file: !626, line: 22, type: !20)
!630 = !DILocation(line: 22, column: 16, scope: !625)
!631 = !DILocalVariable(name: "g_updating_graph_mask", arg: 2, scope: !625, file: !626, line: 22, type: !20)
!632 = !DILocation(line: 22, column: 36, scope: !625)
!633 = !DILocalVariable(name: "g_graph_visited", arg: 3, scope: !625, file: !626, line: 22, type: !20)
!634 = !DILocation(line: 22, column: 65, scope: !625)
!635 = !DILocalVariable(name: "g_over", arg: 4, scope: !625, file: !626, line: 22, type: !20)
!636 = !DILocation(line: 22, column: 88, scope: !625)
!637 = !DILocalVariable(name: "no_of_nodes", arg: 5, scope: !625, file: !626, line: 22, type: !13)
!638 = !DILocation(line: 22, column: 100, scope: !625)
!639 = !DILocation(line: 23, column: 1, scope: !625)
!640 = !DILocation(line: 23, column: 1, scope: !641)
!641 = !DILexicalBlockFile(scope: !625, file: !626, discriminator: 1)
!642 = !DILocation(line: 23, column: 1, scope: !643)
!643 = !DILexicalBlockFile(scope: !625, file: !626, discriminator: 2)
!644 = !DILocation(line: 23, column: 1, scope: !645)
!645 = !DILexicalBlockFile(scope: !625, file: !626, discriminator: 3)
!646 = !DILocation(line: 23, column: 1, scope: !647)
!647 = !DILexicalBlockFile(scope: !625, file: !626, discriminator: 4)
!648 = !DILocation(line: 23, column: 1, scope: !649)
!649 = !DILexicalBlockFile(scope: !625, file: !626, discriminator: 5)
!650 = !DILocation(line: 33, column: 1, scope: !625)
!651 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 45, type: !652, isLocal: false, isDefinition: true, scopeLine: 46, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !593)
!652 = !DISubroutineType(types: !653)
!653 = !{!13, !13, !396}
!654 = !DILocalVariable(name: "argc", arg: 1, scope: !651, file: !2, line: 45, type: !13)
!655 = !DILocation(line: 45, column: 15, scope: !651)
!656 = !DILocalVariable(name: "argv", arg: 2, scope: !651, file: !2, line: 45, type: !396)
!657 = !DILocation(line: 45, column: 28, scope: !651)
!658 = !DILocation(line: 47, column: 13, scope: !651)
!659 = !DILocation(line: 48, column: 16, scope: !651)
!660 = !DILocation(line: 49, column: 12, scope: !651)
!661 = !DILocation(line: 49, column: 18, scope: !651)
!662 = !DILocation(line: 49, column: 2, scope: !651)
!663 = !DILocation(line: 50, column: 1, scope: !651)
!664 = distinct !DISubprogram(name: "BFSGraph", linkageName: "_Z8BFSGraphiPPc", scope: !2, file: !2, line: 60, type: !665, isLocal: false, isDefinition: true, scopeLine: 61, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !593)
!665 = !DISubroutineType(types: !666)
!666 = !{null, !13, !396}
!667 = !DILocalVariable(name: "argc", arg: 1, scope: !664, file: !2, line: 60, type: !13)
!668 = !DILocation(line: 60, column: 20, scope: !664)
!669 = !DILocalVariable(name: "argv", arg: 2, scope: !664, file: !2, line: 60, type: !396)
!670 = !DILocation(line: 60, column: 33, scope: !664)
!671 = !DILocalVariable(name: "input_f", scope: !664, file: !2, line: 63, type: !347)
!672 = !DILocation(line: 63, column: 11, scope: !664)
!673 = !DILocation(line: 64, column: 5, scope: !674)
!674 = distinct !DILexicalBlock(scope: !664, file: !2, line: 64, column: 5)
!675 = !DILocation(line: 64, column: 9, scope: !674)
!676 = !DILocation(line: 64, column: 5, scope: !664)
!677 = !DILocation(line: 65, column: 8, scope: !678)
!678 = distinct !DILexicalBlock(scope: !674, file: !2, line: 64, column: 13)
!679 = !DILocation(line: 65, column: 14, scope: !678)
!680 = !DILocation(line: 65, column: 2, scope: !678)
!681 = !DILocation(line: 66, column: 2, scope: !678)
!682 = !DILocation(line: 69, column: 12, scope: !664)
!683 = !DILocation(line: 69, column: 10, scope: !664)
!684 = !DILocation(line: 70, column: 2, scope: !664)
!685 = !DILocation(line: 72, column: 13, scope: !664)
!686 = !DILocation(line: 72, column: 7, scope: !664)
!687 = !DILocation(line: 72, column: 5, scope: !664)
!688 = !DILocation(line: 73, column: 6, scope: !689)
!689 = distinct !DILexicalBlock(scope: !664, file: !2, line: 73, column: 5)
!690 = !DILocation(line: 73, column: 5, scope: !664)
!691 = !DILocation(line: 75, column: 3, scope: !692)
!692 = distinct !DILexicalBlock(scope: !689, file: !2, line: 74, column: 2)
!693 = !DILocation(line: 76, column: 3, scope: !692)
!694 = !DILocalVariable(name: "source", scope: !664, file: !2, line: 79, type: !13)
!695 = !DILocation(line: 79, column: 6, scope: !664)
!696 = !DILocation(line: 81, column: 9, scope: !664)
!697 = !DILocation(line: 81, column: 2, scope: !664)
!698 = !DILocalVariable(name: "num_of_blocks", scope: !664, file: !2, line: 83, type: !13)
!699 = !DILocation(line: 83, column: 6, scope: !664)
!700 = !DILocalVariable(name: "num_of_threads_per_block", scope: !664, file: !2, line: 84, type: !13)
!701 = !DILocation(line: 84, column: 6, scope: !664)
!702 = !DILocation(line: 84, column: 33, scope: !664)
!703 = !DILocation(line: 88, column: 5, scope: !704)
!704 = distinct !DILexicalBlock(scope: !664, file: !2, line: 88, column: 5)
!705 = !DILocation(line: 88, column: 16, scope: !704)
!706 = !DILocation(line: 88, column: 5, scope: !664)
!707 = !DILocation(line: 90, column: 29, scope: !708)
!708 = distinct !DILexicalBlock(scope: !704, file: !2, line: 89, column: 2)
!709 = !DILocation(line: 90, column: 40, scope: !708)
!710 = !DILocation(line: 90, column: 24, scope: !708)
!711 = !DILocation(line: 90, column: 17, scope: !708)
!712 = !DILocation(line: 91, column: 28, scope: !708)
!713 = !DILocation(line: 92, column: 2, scope: !708)
!714 = !DILocalVariable(name: "h_graph_nodes", scope: !664, file: !2, line: 95, type: !15)
!715 = !DILocation(line: 95, column: 8, scope: !664)
!716 = !DILocation(line: 95, column: 52, scope: !664)
!717 = !DILocation(line: 95, column: 51, scope: !664)
!718 = !DILocation(line: 95, column: 32, scope: !664)
!719 = !DILocation(line: 95, column: 24, scope: !664)
!720 = !DILocalVariable(name: "h_graph_mask", scope: !664, file: !2, line: 96, type: !20)
!721 = !DILocation(line: 96, column: 8, scope: !664)
!722 = !DILocation(line: 96, column: 51, scope: !664)
!723 = !DILocation(line: 96, column: 50, scope: !664)
!724 = !DILocation(line: 96, column: 31, scope: !664)
!725 = !DILocalVariable(name: "h_updating_graph_mask", scope: !664, file: !2, line: 97, type: !20)
!726 = !DILocation(line: 97, column: 8, scope: !664)
!727 = !DILocation(line: 97, column: 60, scope: !664)
!728 = !DILocation(line: 97, column: 59, scope: !664)
!729 = !DILocation(line: 97, column: 40, scope: !664)
!730 = !DILocalVariable(name: "h_graph_visited", scope: !664, file: !2, line: 98, type: !20)
!731 = !DILocation(line: 98, column: 8, scope: !664)
!732 = !DILocation(line: 98, column: 54, scope: !664)
!733 = !DILocation(line: 98, column: 53, scope: !664)
!734 = !DILocation(line: 98, column: 34, scope: !664)
!735 = !DILocalVariable(name: "start", scope: !664, file: !2, line: 100, type: !13)
!736 = !DILocation(line: 100, column: 6, scope: !664)
!737 = !DILocalVariable(name: "edgeno", scope: !664, file: !2, line: 100, type: !13)
!738 = !DILocation(line: 100, column: 13, scope: !664)
!739 = !DILocalVariable(name: "i", scope: !740, file: !2, line: 102, type: !390)
!740 = distinct !DILexicalBlock(scope: !664, file: !2, line: 102, column: 2)
!741 = !DILocation(line: 102, column: 20, scope: !740)
!742 = !DILocation(line: 102, column: 7, scope: !740)
!743 = !DILocation(line: 102, column: 27, scope: !744)
!744 = !DILexicalBlockFile(scope: !745, file: !2, discriminator: 1)
!745 = distinct !DILexicalBlock(scope: !740, file: !2, line: 102, column: 2)
!746 = !DILocation(line: 102, column: 31, scope: !744)
!747 = !DILocation(line: 102, column: 29, scope: !744)
!748 = !DILocation(line: 102, column: 2, scope: !744)
!749 = !DILocation(line: 104, column: 10, scope: !750)
!750 = distinct !DILexicalBlock(scope: !745, file: !2, line: 103, column: 2)
!751 = !DILocation(line: 104, column: 3, scope: !750)
!752 = !DILocation(line: 105, column: 31, scope: !750)
!753 = !DILocation(line: 105, column: 3, scope: !750)
!754 = !DILocation(line: 105, column: 17, scope: !750)
!755 = !DILocation(line: 105, column: 20, scope: !750)
!756 = !DILocation(line: 105, column: 29, scope: !750)
!757 = !DILocation(line: 106, column: 34, scope: !750)
!758 = !DILocation(line: 106, column: 3, scope: !750)
!759 = !DILocation(line: 106, column: 17, scope: !750)
!760 = !DILocation(line: 106, column: 20, scope: !750)
!761 = !DILocation(line: 106, column: 32, scope: !750)
!762 = !DILocation(line: 107, column: 3, scope: !750)
!763 = !DILocation(line: 107, column: 16, scope: !750)
!764 = !DILocation(line: 107, column: 18, scope: !750)
!765 = !DILocation(line: 108, column: 3, scope: !750)
!766 = !DILocation(line: 108, column: 25, scope: !750)
!767 = !DILocation(line: 108, column: 27, scope: !750)
!768 = !DILocation(line: 109, column: 3, scope: !750)
!769 = !DILocation(line: 109, column: 19, scope: !750)
!770 = !DILocation(line: 109, column: 21, scope: !750)
!771 = !DILocation(line: 110, column: 2, scope: !750)
!772 = !DILocation(line: 102, column: 45, scope: !773)
!773 = !DILexicalBlockFile(scope: !745, file: !2, discriminator: 2)
!774 = !DILocation(line: 102, column: 2, scope: !773)
!775 = distinct !{!775, !776}
!776 = !DILocation(line: 102, column: 2, scope: !664)
!777 = !DILocation(line: 113, column: 9, scope: !664)
!778 = !DILocation(line: 113, column: 2, scope: !664)
!779 = !DILocation(line: 114, column: 8, scope: !664)
!780 = !DILocation(line: 117, column: 2, scope: !664)
!781 = !DILocation(line: 117, column: 15, scope: !664)
!782 = !DILocation(line: 117, column: 22, scope: !664)
!783 = !DILocation(line: 118, column: 2, scope: !664)
!784 = !DILocation(line: 118, column: 18, scope: !664)
!785 = !DILocation(line: 118, column: 25, scope: !664)
!786 = !DILocation(line: 120, column: 9, scope: !664)
!787 = !DILocation(line: 120, column: 2, scope: !664)
!788 = !DILocalVariable(name: "id", scope: !664, file: !2, line: 122, type: !13)
!789 = !DILocation(line: 122, column: 6, scope: !664)
!790 = !DILocalVariable(name: "cost", scope: !664, file: !2, line: 122, type: !13)
!791 = !DILocation(line: 122, column: 9, scope: !664)
!792 = !DILocalVariable(name: "h_graph_edges", scope: !664, file: !2, line: 123, type: !22)
!793 = !DILocation(line: 123, column: 7, scope: !664)
!794 = !DILocation(line: 123, column: 49, scope: !664)
!795 = !DILocation(line: 123, column: 48, scope: !664)
!796 = !DILocation(line: 123, column: 30, scope: !664)
!797 = !DILocation(line: 123, column: 23, scope: !664)
!798 = !DILocalVariable(name: "i", scope: !799, file: !2, line: 124, type: !13)
!799 = distinct !DILexicalBlock(scope: !664, file: !2, line: 124, column: 2)
!800 = !DILocation(line: 124, column: 10, scope: !799)
!801 = !DILocation(line: 124, column: 6, scope: !799)
!802 = !DILocation(line: 124, column: 15, scope: !803)
!803 = !DILexicalBlockFile(scope: !804, file: !2, discriminator: 1)
!804 = distinct !DILexicalBlock(scope: !799, file: !2, line: 124, column: 2)
!805 = !DILocation(line: 124, column: 19, scope: !803)
!806 = !DILocation(line: 124, column: 17, scope: !803)
!807 = !DILocation(line: 124, column: 2, scope: !803)
!808 = !DILocation(line: 126, column: 10, scope: !809)
!809 = distinct !DILexicalBlock(scope: !804, file: !2, line: 125, column: 2)
!810 = !DILocation(line: 126, column: 3, scope: !809)
!811 = !DILocation(line: 127, column: 10, scope: !809)
!812 = !DILocation(line: 127, column: 3, scope: !809)
!813 = !DILocation(line: 128, column: 22, scope: !809)
!814 = !DILocation(line: 128, column: 3, scope: !809)
!815 = !DILocation(line: 128, column: 17, scope: !809)
!816 = !DILocation(line: 128, column: 20, scope: !809)
!817 = !DILocation(line: 129, column: 2, scope: !809)
!818 = !DILocation(line: 124, column: 37, scope: !819)
!819 = !DILexicalBlockFile(scope: !804, file: !2, discriminator: 2)
!820 = !DILocation(line: 124, column: 2, scope: !819)
!821 = distinct !{!821, !822}
!822 = !DILocation(line: 124, column: 2, scope: !664)
!823 = !DILocation(line: 131, column: 5, scope: !824)
!824 = distinct !DILexicalBlock(scope: !664, file: !2, line: 131, column: 5)
!825 = !DILocation(line: 131, column: 5, scope: !664)
!826 = !DILocation(line: 132, column: 10, scope: !824)
!827 = !DILocation(line: 132, column: 3, scope: !824)
!828 = !DILocation(line: 134, column: 2, scope: !664)
!829 = !DILocalVariable(name: "d_graph_nodes", scope: !664, file: !2, line: 137, type: !15)
!830 = !DILocation(line: 137, column: 8, scope: !664)
!831 = !DILocation(line: 138, column: 14, scope: !664)
!832 = !DILocation(line: 138, column: 52, scope: !664)
!833 = !DILocation(line: 138, column: 51, scope: !664)
!834 = !DILocation(line: 138, column: 2, scope: !664)
!835 = !DILocation(line: 139, column: 14, scope: !664)
!836 = !DILocation(line: 139, column: 29, scope: !664)
!837 = !DILocation(line: 139, column: 57, scope: !664)
!838 = !DILocation(line: 139, column: 56, scope: !664)
!839 = !DILocation(line: 139, column: 2, scope: !664)
!840 = !DILocalVariable(name: "d_graph_edges", scope: !664, file: !2, line: 142, type: !22)
!841 = !DILocation(line: 142, column: 7, scope: !664)
!842 = !DILocation(line: 143, column: 14, scope: !664)
!843 = !DILocation(line: 143, column: 51, scope: !664)
!844 = !DILocation(line: 143, column: 50, scope: !664)
!845 = !DILocation(line: 143, column: 2, scope: !664)
!846 = !DILocation(line: 144, column: 14, scope: !664)
!847 = !DILocation(line: 144, column: 29, scope: !664)
!848 = !DILocation(line: 144, column: 56, scope: !664)
!849 = !DILocation(line: 144, column: 55, scope: !664)
!850 = !DILocation(line: 144, column: 2, scope: !664)
!851 = !DILocalVariable(name: "d_graph_mask", scope: !664, file: !2, line: 147, type: !20)
!852 = !DILocation(line: 147, column: 8, scope: !664)
!853 = !DILocation(line: 148, column: 51, scope: !664)
!854 = !DILocation(line: 148, column: 50, scope: !664)
!855 = !DILocation(line: 148, column: 2, scope: !664)
!856 = !DILocation(line: 149, column: 14, scope: !664)
!857 = !DILocation(line: 149, column: 28, scope: !664)
!858 = !DILocation(line: 149, column: 55, scope: !664)
!859 = !DILocation(line: 149, column: 54, scope: !664)
!860 = !DILocation(line: 149, column: 2, scope: !664)
!861 = !DILocalVariable(name: "d_updating_graph_mask", scope: !664, file: !2, line: 151, type: !20)
!862 = !DILocation(line: 151, column: 8, scope: !664)
!863 = !DILocation(line: 152, column: 60, scope: !664)
!864 = !DILocation(line: 152, column: 59, scope: !664)
!865 = !DILocation(line: 152, column: 2, scope: !664)
!866 = !DILocation(line: 153, column: 14, scope: !664)
!867 = !DILocation(line: 153, column: 37, scope: !664)
!868 = !DILocation(line: 153, column: 73, scope: !664)
!869 = !DILocation(line: 153, column: 72, scope: !664)
!870 = !DILocation(line: 153, column: 2, scope: !664)
!871 = !DILocalVariable(name: "d_graph_visited", scope: !664, file: !2, line: 156, type: !20)
!872 = !DILocation(line: 156, column: 8, scope: !664)
!873 = !DILocation(line: 157, column: 54, scope: !664)
!874 = !DILocation(line: 157, column: 53, scope: !664)
!875 = !DILocation(line: 157, column: 2, scope: !664)
!876 = !DILocation(line: 158, column: 14, scope: !664)
!877 = !DILocation(line: 158, column: 31, scope: !664)
!878 = !DILocation(line: 158, column: 61, scope: !664)
!879 = !DILocation(line: 158, column: 60, scope: !664)
!880 = !DILocation(line: 158, column: 2, scope: !664)
!881 = !DILocalVariable(name: "h_cost", scope: !664, file: !2, line: 161, type: !22)
!882 = !DILocation(line: 161, column: 7, scope: !664)
!883 = !DILocation(line: 161, column: 43, scope: !664)
!884 = !DILocation(line: 161, column: 42, scope: !664)
!885 = !DILocation(line: 161, column: 23, scope: !664)
!886 = !DILocation(line: 161, column: 16, scope: !664)
!887 = !DILocalVariable(name: "i", scope: !888, file: !2, line: 162, type: !13)
!888 = distinct !DILexicalBlock(scope: !664, file: !2, line: 162, column: 2)
!889 = !DILocation(line: 162, column: 10, scope: !888)
!890 = !DILocation(line: 162, column: 6, scope: !888)
!891 = !DILocation(line: 162, column: 14, scope: !892)
!892 = !DILexicalBlockFile(scope: !893, file: !2, discriminator: 1)
!893 = distinct !DILexicalBlock(scope: !888, file: !2, line: 162, column: 2)
!894 = !DILocation(line: 162, column: 16, scope: !892)
!895 = !DILocation(line: 162, column: 15, scope: !892)
!896 = !DILocation(line: 162, column: 2, scope: !892)
!897 = !DILocation(line: 163, column: 3, scope: !893)
!898 = !DILocation(line: 163, column: 10, scope: !893)
!899 = !DILocation(line: 163, column: 12, scope: !893)
!900 = !DILocation(line: 162, column: 29, scope: !901)
!901 = !DILexicalBlockFile(scope: !893, file: !2, discriminator: 2)
!902 = !DILocation(line: 162, column: 2, scope: !901)
!903 = distinct !{!903, !904}
!904 = !DILocation(line: 162, column: 2, scope: !664)
!905 = !DILocation(line: 164, column: 2, scope: !664)
!906 = !DILocation(line: 164, column: 9, scope: !664)
!907 = !DILocation(line: 164, column: 16, scope: !664)
!908 = !DILocalVariable(name: "d_cost", scope: !664, file: !2, line: 167, type: !22)
!909 = !DILocation(line: 167, column: 7, scope: !664)
!910 = !DILocation(line: 168, column: 14, scope: !664)
!911 = !DILocation(line: 168, column: 44, scope: !664)
!912 = !DILocation(line: 168, column: 43, scope: !664)
!913 = !DILocation(line: 168, column: 2, scope: !664)
!914 = !DILocation(line: 169, column: 14, scope: !664)
!915 = !DILocation(line: 169, column: 22, scope: !664)
!916 = !DILocation(line: 169, column: 42, scope: !664)
!917 = !DILocation(line: 169, column: 41, scope: !664)
!918 = !DILocation(line: 169, column: 2, scope: !664)
!919 = !DILocalVariable(name: "d_over", scope: !664, file: !2, line: 172, type: !20)
!920 = !DILocation(line: 172, column: 8, scope: !664)
!921 = !DILocation(line: 173, column: 2, scope: !664)
!922 = !DILocation(line: 175, column: 2, scope: !664)
!923 = !DILocalVariable(name: "grid", scope: !664, file: !2, line: 178, type: !924)
!924 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !925, line: 427, baseType: !926)
!925 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!926 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !925, line: 417, size: 96, align: 32, elements: !927, identifier: "_ZTS4dim3")
!927 = !{!928, !929, !930, !931, !935, !944}
!928 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !926, file: !925, line: 419, baseType: !390, size: 32, align: 32)
!929 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !926, file: !925, line: 419, baseType: !390, size: 32, align: 32, offset: 32)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !926, file: !925, line: 419, baseType: !390, size: 32, align: 32, offset: 64)
!931 = !DISubprogram(name: "dim3", scope: !926, file: !925, line: 421, type: !932, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!932 = !DISubroutineType(types: !933)
!933 = !{null, !934, !390, !390, !390}
!934 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !926, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!935 = !DISubprogram(name: "dim3", scope: !926, file: !925, line: 422, type: !936, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!936 = !DISubroutineType(types: !937)
!937 = !{null, !934, !938}
!938 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !925, line: 383, baseType: !939)
!939 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !925, line: 190, size: 96, align: 32, elements: !940, identifier: "_ZTS5uint3")
!940 = !{!941, !942, !943}
!941 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !939, file: !925, line: 192, baseType: !390, size: 32, align: 32)
!942 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !939, file: !925, line: 192, baseType: !390, size: 32, align: 32, offset: 32)
!943 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !939, file: !925, line: 192, baseType: !390, size: 32, align: 32, offset: 64)
!944 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !926, file: !925, line: 423, type: !945, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!945 = !DISubroutineType(types: !946)
!946 = !{!938, !934}
!947 = !DILocation(line: 178, column: 8, scope: !664)
!948 = !DILocation(line: 178, column: 14, scope: !664)
!949 = !DILocalVariable(name: "threads", scope: !664, file: !2, line: 179, type: !924)
!950 = !DILocation(line: 179, column: 8, scope: !664)
!951 = !DILocation(line: 179, column: 17, scope: !664)
!952 = !DILocalVariable(name: "k", scope: !664, file: !2, line: 181, type: !13)
!953 = !DILocation(line: 181, column: 6, scope: !664)
!954 = !DILocation(line: 182, column: 2, scope: !664)
!955 = !DILocalVariable(name: "stop", scope: !664, file: !2, line: 183, type: !21)
!956 = !DILocation(line: 183, column: 7, scope: !664)
!957 = !DILocation(line: 185, column: 2, scope: !664)
!958 = distinct !{!958, !957}
!959 = !DILocation(line: 188, column: 7, scope: !960)
!960 = distinct !DILexicalBlock(scope: !664, file: !2, line: 186, column: 2)
!961 = !DILocation(line: 189, column: 15, scope: !960)
!962 = !DILocation(line: 189, column: 3, scope: !960)
!963 = !DILocation(line: 190, column: 13, scope: !960)
!964 = !DILocation(line: 190, column: 19, scope: !960)
!965 = !DILocation(line: 190, column: 9, scope: !960)
!966 = !DILocation(line: 190, column: 3, scope: !960)
!967 = !DILocation(line: 190, column: 35, scope: !968)
!968 = !DILexicalBlockFile(scope: !960, file: !2, discriminator: 1)
!969 = !DILocation(line: 190, column: 50, scope: !968)
!970 = !DILocation(line: 190, column: 65, scope: !968)
!971 = !DILocation(line: 190, column: 79, scope: !968)
!972 = !DILocation(line: 190, column: 102, scope: !968)
!973 = !DILocation(line: 190, column: 119, scope: !968)
!974 = !DILocation(line: 190, column: 127, scope: !968)
!975 = !DILocation(line: 190, column: 3, scope: !968)
!976 = !DILocation(line: 194, column: 14, scope: !960)
!977 = !DILocation(line: 194, column: 20, scope: !960)
!978 = !DILocation(line: 194, column: 10, scope: !960)
!979 = !DILocation(line: 194, column: 3, scope: !960)
!980 = !DILocation(line: 194, column: 36, scope: !968)
!981 = !DILocation(line: 194, column: 50, scope: !968)
!982 = !DILocation(line: 194, column: 73, scope: !968)
!983 = !DILocation(line: 194, column: 90, scope: !968)
!984 = !DILocation(line: 194, column: 98, scope: !968)
!985 = !DILocation(line: 194, column: 3, scope: !968)
!986 = !DILocation(line: 198, column: 22, scope: !960)
!987 = !DILocation(line: 198, column: 3, scope: !960)
!988 = !DILocation(line: 199, column: 4, scope: !960)
!989 = !DILocation(line: 200, column: 2, scope: !960)
!990 = !DILocation(line: 201, column: 8, scope: !664)
!991 = !DILocation(line: 200, column: 2, scope: !968)
!992 = !DILocation(line: 204, column: 38, scope: !664)
!993 = !DILocation(line: 204, column: 2, scope: !664)
!994 = !DILocation(line: 207, column: 14, scope: !664)
!995 = !DILocation(line: 207, column: 22, scope: !664)
!996 = !DILocation(line: 207, column: 42, scope: !664)
!997 = !DILocation(line: 207, column: 41, scope: !664)
!998 = !DILocation(line: 207, column: 2, scope: !664)
!999 = !DILocalVariable(name: "fpo", scope: !664, file: !2, line: 210, type: !28)
!1000 = !DILocation(line: 210, column: 8, scope: !664)
!1001 = !DILocation(line: 210, column: 14, scope: !664)
!1002 = !DILocalVariable(name: "i", scope: !1003, file: !2, line: 211, type: !13)
!1003 = distinct !DILexicalBlock(scope: !664, file: !2, line: 211, column: 2)
!1004 = !DILocation(line: 211, column: 10, scope: !1003)
!1005 = !DILocation(line: 211, column: 6, scope: !1003)
!1006 = !DILocation(line: 211, column: 14, scope: !1007)
!1007 = !DILexicalBlockFile(scope: !1008, file: !2, discriminator: 1)
!1008 = distinct !DILexicalBlock(scope: !1003, file: !2, line: 211, column: 2)
!1009 = !DILocation(line: 211, column: 16, scope: !1007)
!1010 = !DILocation(line: 211, column: 15, scope: !1007)
!1011 = !DILocation(line: 211, column: 2, scope: !1007)
!1012 = !DILocation(line: 212, column: 11, scope: !1008)
!1013 = !DILocation(line: 212, column: 31, scope: !1008)
!1014 = !DILocation(line: 212, column: 33, scope: !1008)
!1015 = !DILocation(line: 212, column: 40, scope: !1008)
!1016 = !DILocation(line: 212, column: 3, scope: !1008)
!1017 = !DILocation(line: 211, column: 29, scope: !1018)
!1018 = !DILexicalBlockFile(scope: !1008, file: !2, discriminator: 2)
!1019 = !DILocation(line: 211, column: 2, scope: !1018)
!1020 = distinct !{!1020, !1021}
!1021 = !DILocation(line: 211, column: 2, scope: !664)
!1022 = !DILocation(line: 213, column: 9, scope: !664)
!1023 = !DILocation(line: 213, column: 2, scope: !664)
!1024 = !DILocation(line: 214, column: 2, scope: !664)
!1025 = !DILocation(line: 218, column: 8, scope: !664)
!1026 = !DILocation(line: 218, column: 2, scope: !664)
!1027 = !DILocation(line: 219, column: 8, scope: !664)
!1028 = !DILocation(line: 219, column: 2, scope: !664)
!1029 = !DILocation(line: 220, column: 8, scope: !664)
!1030 = !DILocation(line: 220, column: 2, scope: !664)
!1031 = !DILocation(line: 221, column: 8, scope: !664)
!1032 = !DILocation(line: 221, column: 2, scope: !664)
!1033 = !DILocation(line: 222, column: 8, scope: !664)
!1034 = !DILocation(line: 222, column: 2, scope: !664)
!1035 = !DILocation(line: 223, column: 8, scope: !664)
!1036 = !DILocation(line: 223, column: 2, scope: !664)
!1037 = !DILocation(line: 224, column: 11, scope: !664)
!1038 = !DILocation(line: 224, column: 2, scope: !664)
!1039 = !DILocation(line: 225, column: 11, scope: !664)
!1040 = !DILocation(line: 225, column: 2, scope: !664)
!1041 = !DILocation(line: 226, column: 11, scope: !664)
!1042 = !DILocation(line: 226, column: 2, scope: !664)
!1043 = !DILocation(line: 227, column: 11, scope: !664)
!1044 = !DILocation(line: 227, column: 2, scope: !664)
!1045 = !DILocation(line: 228, column: 11, scope: !664)
!1046 = !DILocation(line: 228, column: 2, scope: !664)
!1047 = !DILocation(line: 229, column: 11, scope: !664)
!1048 = !DILocation(line: 229, column: 2, scope: !664)
!1049 = !DILocation(line: 230, column: 1, scope: !664)
!1050 = !DILocation(line: 230, column: 1, scope: !1051)
!1051 = !DILexicalBlockFile(scope: !664, file: !2, discriminator: 1)
!1052 = distinct !DISubprogram(name: "Usage", linkageName: "_Z5UsageiPPc", scope: !2, file: !2, line: 52, type: !665, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !1, variables: !593)
!1053 = !DILocalVariable(name: "argc", arg: 1, scope: !1052, file: !2, line: 52, type: !13)
!1054 = !DILocation(line: 52, column: 16, scope: !1052)
!1055 = !DILocalVariable(name: "argv", arg: 2, scope: !1052, file: !2, line: 52, type: !396)
!1056 = !DILocation(line: 52, column: 28, scope: !1052)
!1057 = !DILocation(line: 54, column: 9, scope: !1052)
!1058 = !DILocation(line: 54, column: 44, scope: !1052)
!1059 = !DILocation(line: 54, column: 1, scope: !1052)
!1060 = !DILocation(line: 56, column: 1, scope: !1052)
!1061 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !926, file: !925, line: 421, type: !932, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !1, declaration: !931, variables: !593)
!1062 = !DILocalVariable(name: "this", arg: 1, scope: !1061, type: !1063, flags: DIFlagArtificial | DIFlagObjectPointer)
!1063 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !926, size: 64, align: 64)
!1064 = !DILocation(line: 0, scope: !1061)
!1065 = !DILocalVariable(name: "vx", arg: 2, scope: !1061, file: !925, line: 421, type: !390)
!1066 = !DILocation(line: 421, column: 43, scope: !1061)
!1067 = !DILocalVariable(name: "vy", arg: 3, scope: !1061, file: !925, line: 421, type: !390)
!1068 = !DILocation(line: 421, column: 64, scope: !1061)
!1069 = !DILocalVariable(name: "vz", arg: 4, scope: !1061, file: !925, line: 421, type: !390)
!1070 = !DILocation(line: 421, column: 85, scope: !1061)
!1071 = !DILocation(line: 421, column: 95, scope: !1061)
!1072 = !DILocation(line: 421, column: 97, scope: !1061)
!1073 = !DILocation(line: 421, column: 102, scope: !1061)
!1074 = !DILocation(line: 421, column: 104, scope: !1061)
!1075 = !DILocation(line: 421, column: 109, scope: !1061)
!1076 = !DILocation(line: 421, column: 111, scope: !1061)
!1077 = !DILocation(line: 421, column: 116, scope: !1061)
