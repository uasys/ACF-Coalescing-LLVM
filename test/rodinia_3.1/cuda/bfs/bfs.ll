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

@no_of_nodes = global i32 0, align 4
@edge_list_size = global i32 0, align 4
@fp = global %struct._IO_FILE* null, align 8
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
define void @_Z6KernelP4NodePiPbS2_S2_S1_i(%struct.Node* %g_graph_nodes, i32* %g_graph_edges, i8* %g_graph_mask, i8* %g_updating_graph_mask, i8* %g_graph_visited, i32* %g_cost, i32 %no_of_nodes) #0 !dbg !468 {
entry:
  %g_graph_nodes.addr = alloca %struct.Node*, align 8
  %g_graph_edges.addr = alloca i32*, align 8
  %g_graph_mask.addr = alloca i8*, align 8
  %g_updating_graph_mask.addr = alloca i8*, align 8
  %g_graph_visited.addr = alloca i8*, align 8
  %g_cost.addr = alloca i32*, align 8
  %no_of_nodes.addr = alloca i32, align 4
  store %struct.Node* %g_graph_nodes, %struct.Node** %g_graph_nodes.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Node** %g_graph_nodes.addr, metadata !473, metadata !474), !dbg !475
  store i32* %g_graph_edges, i32** %g_graph_edges.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %g_graph_edges.addr, metadata !476, metadata !474), !dbg !477
  store i8* %g_graph_mask, i8** %g_graph_mask.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_graph_mask.addr, metadata !478, metadata !474), !dbg !479
  store i8* %g_updating_graph_mask, i8** %g_updating_graph_mask.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_updating_graph_mask.addr, metadata !480, metadata !474), !dbg !481
  store i8* %g_graph_visited, i8** %g_graph_visited.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_graph_visited.addr, metadata !482, metadata !474), !dbg !483
  store i32* %g_cost, i32** %g_cost.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %g_cost.addr, metadata !484, metadata !474), !dbg !485
  store i32 %no_of_nodes, i32* %no_of_nodes.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %no_of_nodes.addr, metadata !486, metadata !474), !dbg !487
  %0 = bitcast %struct.Node** %g_graph_nodes.addr to i8*, !dbg !488
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !488
  %2 = icmp eq i32 %1, 0, !dbg !488
  br i1 %2, label %setup.next, label %setup.end, !dbg !488

setup.next:                                       ; preds = %entry
  %3 = bitcast i32** %g_graph_edges.addr to i8*, !dbg !489
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !489
  %5 = icmp eq i32 %4, 0, !dbg !489
  br i1 %5, label %setup.next1, label %setup.end, !dbg !489

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i8** %g_graph_mask.addr to i8*, !dbg !491
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !491
  %8 = icmp eq i32 %7, 0, !dbg !491
  br i1 %8, label %setup.next2, label %setup.end, !dbg !491

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i8** %g_updating_graph_mask.addr to i8*, !dbg !493
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !493
  %11 = icmp eq i32 %10, 0, !dbg !493
  br i1 %11, label %setup.next3, label %setup.end, !dbg !493

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i8** %g_graph_visited.addr to i8*, !dbg !495
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 8, i64 32), !dbg !495
  %14 = icmp eq i32 %13, 0, !dbg !495
  br i1 %14, label %setup.next4, label %setup.end, !dbg !495

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32** %g_cost.addr to i8*, !dbg !497
  %16 = call i32 @cudaSetupArgument(i8* %15, i64 8, i64 40), !dbg !497
  %17 = icmp eq i32 %16, 0, !dbg !497
  br i1 %17, label %setup.next5, label %setup.end, !dbg !497

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i32* %no_of_nodes.addr to i8*, !dbg !499
  %19 = call i32 @cudaSetupArgument(i8* %18, i64 4, i64 48), !dbg !499
  %20 = icmp eq i32 %19, 0, !dbg !499
  br i1 %20, label %setup.next6, label %setup.end, !dbg !499

setup.next6:                                      ; preds = %setup.next5
  %21 = call i32 @cudaLaunch(i8* bitcast (void (%struct.Node*, i32*, i8*, i8*, i8*, i32*, i32)* @_Z6KernelP4NodePiPbS2_S2_S1_i to i8*)), !dbg !501
  br label %setup.end, !dbg !501

setup.end:                                        ; preds = %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !503
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @cudaSetupArgument(i8*, i64, i64)

declare i32 @cudaLaunch(i8*)

; Function Attrs: uwtable
define void @_Z7Kernel2PbS_S_S_i(i8* %g_graph_mask, i8* %g_updating_graph_mask, i8* %g_graph_visited, i8* %g_over, i32 %no_of_nodes) #0 !dbg !504 {
entry:
  %g_graph_mask.addr = alloca i8*, align 8
  %g_updating_graph_mask.addr = alloca i8*, align 8
  %g_graph_visited.addr = alloca i8*, align 8
  %g_over.addr = alloca i8*, align 8
  %no_of_nodes.addr = alloca i32, align 4
  store i8* %g_graph_mask, i8** %g_graph_mask.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_graph_mask.addr, metadata !508, metadata !474), !dbg !509
  store i8* %g_updating_graph_mask, i8** %g_updating_graph_mask.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_updating_graph_mask.addr, metadata !510, metadata !474), !dbg !511
  store i8* %g_graph_visited, i8** %g_graph_visited.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_graph_visited.addr, metadata !512, metadata !474), !dbg !513
  store i8* %g_over, i8** %g_over.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %g_over.addr, metadata !514, metadata !474), !dbg !515
  store i32 %no_of_nodes, i32* %no_of_nodes.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %no_of_nodes.addr, metadata !516, metadata !474), !dbg !517
  %0 = bitcast i8** %g_graph_mask.addr to i8*, !dbg !518
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0), !dbg !518
  %2 = icmp eq i32 %1, 0, !dbg !518
  br i1 %2, label %setup.next, label %setup.end, !dbg !518

setup.next:                                       ; preds = %entry
  %3 = bitcast i8** %g_updating_graph_mask.addr to i8*, !dbg !519
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !519
  %5 = icmp eq i32 %4, 0, !dbg !519
  br i1 %5, label %setup.next1, label %setup.end, !dbg !519

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i8** %g_graph_visited.addr to i8*, !dbg !521
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !521
  %8 = icmp eq i32 %7, 0, !dbg !521
  br i1 %8, label %setup.next2, label %setup.end, !dbg !521

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i8** %g_over.addr to i8*, !dbg !523
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 8, i64 24), !dbg !523
  %11 = icmp eq i32 %10, 0, !dbg !523
  br i1 %11, label %setup.next3, label %setup.end, !dbg !523

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %no_of_nodes.addr to i8*, !dbg !525
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 32), !dbg !525
  %14 = icmp eq i32 %13, 0, !dbg !525
  br i1 %14, label %setup.next4, label %setup.end, !dbg !525

setup.next4:                                      ; preds = %setup.next3
  %15 = call i32 @cudaLaunch(i8* bitcast (void (i8*, i8*, i8*, i8*, i32)* @_Z7Kernel2PbS_S_S_i to i8*)), !dbg !527
  br label %setup.end, !dbg !527

setup.end:                                        ; preds = %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !529
}

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) #2 !dbg !530 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !533, metadata !474), !dbg !534
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !535, metadata !474), !dbg !536
  store i32 0, i32* @no_of_nodes, align 4, !dbg !537
  store i32 0, i32* @edge_list_size, align 4, !dbg !538
  %0 = load i32, i32* %argc.addr, align 4, !dbg !539
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !540
  call void @_Z8BFSGraphiPPc(i32 %0, i8** %1), !dbg !541
  ret i32 0, !dbg !542
}

; Function Attrs: uwtable
define void @_Z8BFSGraphiPPc(i32 %argc, i8** %argv) #0 !dbg !543 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !546, metadata !474), !dbg !547
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !548, metadata !474), !dbg !549
  call void @llvm.dbg.declare(metadata i8** %input_f, metadata !550, metadata !474), !dbg !551
  %0 = load i32, i32* %argc.addr, align 4, !dbg !552
  %cmp = icmp ne i32 %0, 2, !dbg !554
  br i1 %cmp, label %if.then, label %if.end, !dbg !555

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %argc.addr, align 4, !dbg !556
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !558
  call void @_Z5UsageiPPc(i32 %1, i8** %2), !dbg !559
  call void @exit(i32 0) #9, !dbg !560
  unreachable, !dbg !560

if.end:                                           ; preds = %entry
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !561
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !561
  %4 = load i8*, i8** %arrayidx, align 8, !dbg !561
  store i8* %4, i8** %input_f, align 8, !dbg !562
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0)), !dbg !563
  %5 = load i8*, i8** %input_f, align 8, !dbg !564
  %call1 = call %struct._IO_FILE* @fopen(i8* %5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0)), !dbg !565
  store %struct._IO_FILE* %call1, %struct._IO_FILE** @fp, align 8, !dbg !566
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !567
  %tobool = icmp ne %struct._IO_FILE* %6, null, !dbg !567
  br i1 %tobool, label %if.end4, label %if.then2, !dbg !569

if.then2:                                         ; preds = %if.end
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.3, i32 0, i32 0)), !dbg !570
  br label %return, !dbg !572

if.end4:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %source, metadata !573, metadata !474), !dbg !574
  store i32 0, i32* %source, align 4, !dbg !574
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !575
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* @no_of_nodes), !dbg !576
  call void @llvm.dbg.declare(metadata i32* %num_of_blocks, metadata !577, metadata !474), !dbg !578
  store i32 1, i32* %num_of_blocks, align 4, !dbg !578
  call void @llvm.dbg.declare(metadata i32* %num_of_threads_per_block, metadata !579, metadata !474), !dbg !580
  %8 = load i32, i32* @no_of_nodes, align 4, !dbg !581
  store i32 %8, i32* %num_of_threads_per_block, align 4, !dbg !580
  %9 = load i32, i32* @no_of_nodes, align 4, !dbg !582
  %cmp6 = icmp sgt i32 %9, 512, !dbg !584
  br i1 %cmp6, label %if.then7, label %if.end10, !dbg !585

if.then7:                                         ; preds = %if.end4
  %10 = load i32, i32* @no_of_nodes, align 4, !dbg !586
  %conv = sitofp i32 %10 to double, !dbg !586
  %div = fdiv double %conv, 5.120000e+02, !dbg !588
  %call8 = call double @ceil(double %div) #1, !dbg !589
  %conv9 = fptosi double %call8 to i32, !dbg !589
  store i32 %conv9, i32* %num_of_blocks, align 4, !dbg !590
  store i32 512, i32* %num_of_threads_per_block, align 4, !dbg !591
  br label %if.end10, !dbg !592

if.end10:                                         ; preds = %if.then7, %if.end4
  call void @llvm.dbg.declare(metadata %struct.Node** %h_graph_nodes, metadata !593, metadata !474), !dbg !594
  %11 = load i32, i32* @no_of_nodes, align 4, !dbg !595
  %conv11 = sext i32 %11 to i64, !dbg !595
  %mul = mul i64 8, %conv11, !dbg !596
  %call12 = call noalias i8* @malloc(i64 %mul) #10, !dbg !597
  %12 = bitcast i8* %call12 to %struct.Node*, !dbg !598
  store %struct.Node* %12, %struct.Node** %h_graph_nodes, align 8, !dbg !594
  call void @llvm.dbg.declare(metadata i8** %h_graph_mask, metadata !599, metadata !474), !dbg !600
  %13 = load i32, i32* @no_of_nodes, align 4, !dbg !601
  %conv13 = sext i32 %13 to i64, !dbg !601
  %mul14 = mul i64 1, %conv13, !dbg !602
  %call15 = call noalias i8* @malloc(i64 %mul14) #10, !dbg !603
  store i8* %call15, i8** %h_graph_mask, align 8, !dbg !600
  call void @llvm.dbg.declare(metadata i8** %h_updating_graph_mask, metadata !604, metadata !474), !dbg !605
  %14 = load i32, i32* @no_of_nodes, align 4, !dbg !606
  %conv16 = sext i32 %14 to i64, !dbg !606
  %mul17 = mul i64 1, %conv16, !dbg !607
  %call18 = call noalias i8* @malloc(i64 %mul17) #10, !dbg !608
  store i8* %call18, i8** %h_updating_graph_mask, align 8, !dbg !605
  call void @llvm.dbg.declare(metadata i8** %h_graph_visited, metadata !609, metadata !474), !dbg !610
  %15 = load i32, i32* @no_of_nodes, align 4, !dbg !611
  %conv19 = sext i32 %15 to i64, !dbg !611
  %mul20 = mul i64 1, %conv19, !dbg !612
  %call21 = call noalias i8* @malloc(i64 %mul20) #10, !dbg !613
  store i8* %call21, i8** %h_graph_visited, align 8, !dbg !610
  call void @llvm.dbg.declare(metadata i32* %start, metadata !614, metadata !474), !dbg !615
  call void @llvm.dbg.declare(metadata i32* %edgeno, metadata !616, metadata !474), !dbg !617
  call void @llvm.dbg.declare(metadata i32* %i, metadata !618, metadata !474), !dbg !620
  store i32 0, i32* %i, align 4, !dbg !620
  br label %for.cond, !dbg !621

for.cond:                                         ; preds = %for.inc, %if.end10
  %16 = load i32, i32* %i, align 4, !dbg !622
  %17 = load i32, i32* @no_of_nodes, align 4, !dbg !625
  %cmp22 = icmp ult i32 %16, %17, !dbg !626
  br i1 %cmp22, label %for.body, label %for.end, !dbg !627

for.body:                                         ; preds = %for.cond
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !628
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0), i32* %start, i32* %edgeno), !dbg !630
  %19 = load i32, i32* %start, align 4, !dbg !631
  %20 = load i32, i32* %i, align 4, !dbg !632
  %idxprom = zext i32 %20 to i64, !dbg !633
  %21 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !633
  %arrayidx24 = getelementptr inbounds %struct.Node, %struct.Node* %21, i64 %idxprom, !dbg !633
  %starting = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx24, i32 0, i32 0, !dbg !634
  store i32 %19, i32* %starting, align 4, !dbg !635
  %22 = load i32, i32* %edgeno, align 4, !dbg !636
  %23 = load i32, i32* %i, align 4, !dbg !637
  %idxprom25 = zext i32 %23 to i64, !dbg !638
  %24 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !638
  %arrayidx26 = getelementptr inbounds %struct.Node, %struct.Node* %24, i64 %idxprom25, !dbg !638
  %no_of_edges = getelementptr inbounds %struct.Node, %struct.Node* %arrayidx26, i32 0, i32 1, !dbg !639
  store i32 %22, i32* %no_of_edges, align 4, !dbg !640
  %25 = load i32, i32* %i, align 4, !dbg !641
  %idxprom27 = zext i32 %25 to i64, !dbg !642
  %26 = load i8*, i8** %h_graph_mask, align 8, !dbg !642
  %arrayidx28 = getelementptr inbounds i8, i8* %26, i64 %idxprom27, !dbg !642
  store i8 0, i8* %arrayidx28, align 1, !dbg !643
  %27 = load i32, i32* %i, align 4, !dbg !644
  %idxprom29 = zext i32 %27 to i64, !dbg !645
  %28 = load i8*, i8** %h_updating_graph_mask, align 8, !dbg !645
  %arrayidx30 = getelementptr inbounds i8, i8* %28, i64 %idxprom29, !dbg !645
  store i8 0, i8* %arrayidx30, align 1, !dbg !646
  %29 = load i32, i32* %i, align 4, !dbg !647
  %idxprom31 = zext i32 %29 to i64, !dbg !648
  %30 = load i8*, i8** %h_graph_visited, align 8, !dbg !648
  %arrayidx32 = getelementptr inbounds i8, i8* %30, i64 %idxprom31, !dbg !648
  store i8 0, i8* %arrayidx32, align 1, !dbg !649
  br label %for.inc, !dbg !650

for.inc:                                          ; preds = %for.body
  %31 = load i32, i32* %i, align 4, !dbg !651
  %inc = add i32 %31, 1, !dbg !651
  store i32 %inc, i32* %i, align 4, !dbg !651
  br label %for.cond, !dbg !653, !llvm.loop !654

for.end:                                          ; preds = %for.cond
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !656
  %call33 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* %source), !dbg !657
  store i32 0, i32* %source, align 4, !dbg !658
  %33 = load i32, i32* %source, align 4, !dbg !659
  %idxprom34 = sext i32 %33 to i64, !dbg !660
  %34 = load i8*, i8** %h_graph_mask, align 8, !dbg !660
  %arrayidx35 = getelementptr inbounds i8, i8* %34, i64 %idxprom34, !dbg !660
  store i8 1, i8* %arrayidx35, align 1, !dbg !661
  %35 = load i32, i32* %source, align 4, !dbg !662
  %idxprom36 = sext i32 %35 to i64, !dbg !663
  %36 = load i8*, i8** %h_graph_visited, align 8, !dbg !663
  %arrayidx37 = getelementptr inbounds i8, i8* %36, i64 %idxprom36, !dbg !663
  store i8 1, i8* %arrayidx37, align 1, !dbg !664
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !665
  %call38 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* @edge_list_size), !dbg !666
  call void @llvm.dbg.declare(metadata i32* %id, metadata !667, metadata !474), !dbg !668
  call void @llvm.dbg.declare(metadata i32* %cost, metadata !669, metadata !474), !dbg !670
  call void @llvm.dbg.declare(metadata i32** %h_graph_edges, metadata !671, metadata !474), !dbg !672
  %38 = load i32, i32* @edge_list_size, align 4, !dbg !673
  %conv39 = sext i32 %38 to i64, !dbg !673
  %mul40 = mul i64 4, %conv39, !dbg !674
  %call41 = call noalias i8* @malloc(i64 %mul40) #10, !dbg !675
  %39 = bitcast i8* %call41 to i32*, !dbg !676
  store i32* %39, i32** %h_graph_edges, align 8, !dbg !672
  call void @llvm.dbg.declare(metadata i32* %i42, metadata !677, metadata !474), !dbg !679
  store i32 0, i32* %i42, align 4, !dbg !679
  br label %for.cond43, !dbg !680

for.cond43:                                       ; preds = %for.inc50, %for.end
  %40 = load i32, i32* %i42, align 4, !dbg !681
  %41 = load i32, i32* @edge_list_size, align 4, !dbg !684
  %cmp44 = icmp slt i32 %40, %41, !dbg !685
  br i1 %cmp44, label %for.body45, label %for.end52, !dbg !686

for.body45:                                       ; preds = %for.cond43
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !687
  %call46 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* %id), !dbg !689
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !690
  %call47 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* %cost), !dbg !691
  %44 = load i32, i32* %id, align 4, !dbg !692
  %45 = load i32, i32* %i42, align 4, !dbg !693
  %idxprom48 = sext i32 %45 to i64, !dbg !694
  %46 = load i32*, i32** %h_graph_edges, align 8, !dbg !694
  %arrayidx49 = getelementptr inbounds i32, i32* %46, i64 %idxprom48, !dbg !694
  store i32 %44, i32* %arrayidx49, align 4, !dbg !695
  br label %for.inc50, !dbg !696

for.inc50:                                        ; preds = %for.body45
  %47 = load i32, i32* %i42, align 4, !dbg !697
  %inc51 = add nsw i32 %47, 1, !dbg !697
  store i32 %inc51, i32* %i42, align 4, !dbg !697
  br label %for.cond43, !dbg !699, !llvm.loop !700

for.end52:                                        ; preds = %for.cond43
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !702
  %tobool53 = icmp ne %struct._IO_FILE* %48, null, !dbg !702
  br i1 %tobool53, label %if.then54, label %if.end56, !dbg !704

if.then54:                                        ; preds = %for.end52
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !705
  %call55 = call i32 @fclose(%struct._IO_FILE* %49), !dbg !706
  br label %if.end56, !dbg !706

if.end56:                                         ; preds = %if.then54, %for.end52
  %call57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i32 0, i32 0)), !dbg !707
  call void @llvm.dbg.declare(metadata %struct.Node** %d_graph_nodes, metadata !708, metadata !474), !dbg !709
  %50 = bitcast %struct.Node** %d_graph_nodes to i8**, !dbg !710
  %51 = load i32, i32* @no_of_nodes, align 4, !dbg !711
  %conv58 = sext i32 %51 to i64, !dbg !711
  %mul59 = mul i64 8, %conv58, !dbg !712
  %call60 = call i32 @cudaMalloc(i8** %50, i64 %mul59), !dbg !713
  %52 = load %struct.Node*, %struct.Node** %d_graph_nodes, align 8, !dbg !714
  %53 = bitcast %struct.Node* %52 to i8*, !dbg !714
  %54 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !715
  %55 = bitcast %struct.Node* %54 to i8*, !dbg !715
  %56 = load i32, i32* @no_of_nodes, align 4, !dbg !716
  %conv61 = sext i32 %56 to i64, !dbg !716
  %mul62 = mul i64 8, %conv61, !dbg !717
  %call63 = call i32 @cudaMemcpy(i8* %53, i8* %55, i64 %mul62, i32 1), !dbg !718
  call void @llvm.dbg.declare(metadata i32** %d_graph_edges, metadata !719, metadata !474), !dbg !720
  %57 = bitcast i32** %d_graph_edges to i8**, !dbg !721
  %58 = load i32, i32* @edge_list_size, align 4, !dbg !722
  %conv64 = sext i32 %58 to i64, !dbg !722
  %mul65 = mul i64 4, %conv64, !dbg !723
  %call66 = call i32 @cudaMalloc(i8** %57, i64 %mul65), !dbg !724
  %59 = load i32*, i32** %d_graph_edges, align 8, !dbg !725
  %60 = bitcast i32* %59 to i8*, !dbg !725
  %61 = load i32*, i32** %h_graph_edges, align 8, !dbg !726
  %62 = bitcast i32* %61 to i8*, !dbg !726
  %63 = load i32, i32* @edge_list_size, align 4, !dbg !727
  %conv67 = sext i32 %63 to i64, !dbg !727
  %mul68 = mul i64 4, %conv67, !dbg !728
  %call69 = call i32 @cudaMemcpy(i8* %60, i8* %62, i64 %mul68, i32 1), !dbg !729
  call void @llvm.dbg.declare(metadata i8** %d_graph_mask, metadata !730, metadata !474), !dbg !731
  %64 = load i32, i32* @no_of_nodes, align 4, !dbg !732
  %conv70 = sext i32 %64 to i64, !dbg !732
  %mul71 = mul i64 1, %conv70, !dbg !733
  %call72 = call i32 @cudaMalloc(i8** %d_graph_mask, i64 %mul71), !dbg !734
  %65 = load i8*, i8** %d_graph_mask, align 8, !dbg !735
  %66 = load i8*, i8** %h_graph_mask, align 8, !dbg !736
  %67 = load i32, i32* @no_of_nodes, align 4, !dbg !737
  %conv73 = sext i32 %67 to i64, !dbg !737
  %mul74 = mul i64 1, %conv73, !dbg !738
  %call75 = call i32 @cudaMemcpy(i8* %65, i8* %66, i64 %mul74, i32 1), !dbg !739
  call void @llvm.dbg.declare(metadata i8** %d_updating_graph_mask, metadata !740, metadata !474), !dbg !741
  %68 = load i32, i32* @no_of_nodes, align 4, !dbg !742
  %conv76 = sext i32 %68 to i64, !dbg !742
  %mul77 = mul i64 1, %conv76, !dbg !743
  %call78 = call i32 @cudaMalloc(i8** %d_updating_graph_mask, i64 %mul77), !dbg !744
  %69 = load i8*, i8** %d_updating_graph_mask, align 8, !dbg !745
  %70 = load i8*, i8** %h_updating_graph_mask, align 8, !dbg !746
  %71 = load i32, i32* @no_of_nodes, align 4, !dbg !747
  %conv79 = sext i32 %71 to i64, !dbg !747
  %mul80 = mul i64 1, %conv79, !dbg !748
  %call81 = call i32 @cudaMemcpy(i8* %69, i8* %70, i64 %mul80, i32 1), !dbg !749
  call void @llvm.dbg.declare(metadata i8** %d_graph_visited, metadata !750, metadata !474), !dbg !751
  %72 = load i32, i32* @no_of_nodes, align 4, !dbg !752
  %conv82 = sext i32 %72 to i64, !dbg !752
  %mul83 = mul i64 1, %conv82, !dbg !753
  %call84 = call i32 @cudaMalloc(i8** %d_graph_visited, i64 %mul83), !dbg !754
  %73 = load i8*, i8** %d_graph_visited, align 8, !dbg !755
  %74 = load i8*, i8** %h_graph_visited, align 8, !dbg !756
  %75 = load i32, i32* @no_of_nodes, align 4, !dbg !757
  %conv85 = sext i32 %75 to i64, !dbg !757
  %mul86 = mul i64 1, %conv85, !dbg !758
  %call87 = call i32 @cudaMemcpy(i8* %73, i8* %74, i64 %mul86, i32 1), !dbg !759
  call void @llvm.dbg.declare(metadata i32** %h_cost, metadata !760, metadata !474), !dbg !761
  %76 = load i32, i32* @no_of_nodes, align 4, !dbg !762
  %conv88 = sext i32 %76 to i64, !dbg !762
  %mul89 = mul i64 4, %conv88, !dbg !763
  %call90 = call noalias i8* @malloc(i64 %mul89) #10, !dbg !764
  %77 = bitcast i8* %call90 to i32*, !dbg !765
  store i32* %77, i32** %h_cost, align 8, !dbg !761
  call void @llvm.dbg.declare(metadata i32* %i91, metadata !766, metadata !474), !dbg !768
  store i32 0, i32* %i91, align 4, !dbg !768
  br label %for.cond92, !dbg !769

for.cond92:                                       ; preds = %for.inc97, %if.end56
  %78 = load i32, i32* %i91, align 4, !dbg !770
  %79 = load i32, i32* @no_of_nodes, align 4, !dbg !773
  %cmp93 = icmp slt i32 %78, %79, !dbg !774
  br i1 %cmp93, label %for.body94, label %for.end99, !dbg !775

for.body94:                                       ; preds = %for.cond92
  %80 = load i32, i32* %i91, align 4, !dbg !776
  %idxprom95 = sext i32 %80 to i64, !dbg !777
  %81 = load i32*, i32** %h_cost, align 8, !dbg !777
  %arrayidx96 = getelementptr inbounds i32, i32* %81, i64 %idxprom95, !dbg !777
  store i32 -1, i32* %arrayidx96, align 4, !dbg !778
  br label %for.inc97, !dbg !777

for.inc97:                                        ; preds = %for.body94
  %82 = load i32, i32* %i91, align 4, !dbg !779
  %inc98 = add nsw i32 %82, 1, !dbg !779
  store i32 %inc98, i32* %i91, align 4, !dbg !779
  br label %for.cond92, !dbg !781, !llvm.loop !782

for.end99:                                        ; preds = %for.cond92
  %83 = load i32, i32* %source, align 4, !dbg !784
  %idxprom100 = sext i32 %83 to i64, !dbg !785
  %84 = load i32*, i32** %h_cost, align 8, !dbg !785
  %arrayidx101 = getelementptr inbounds i32, i32* %84, i64 %idxprom100, !dbg !785
  store i32 0, i32* %arrayidx101, align 4, !dbg !786
  call void @llvm.dbg.declare(metadata i32** %d_cost, metadata !787, metadata !474), !dbg !788
  %85 = bitcast i32** %d_cost to i8**, !dbg !789
  %86 = load i32, i32* @no_of_nodes, align 4, !dbg !790
  %conv102 = sext i32 %86 to i64, !dbg !790
  %mul103 = mul i64 4, %conv102, !dbg !791
  %call104 = call i32 @cudaMalloc(i8** %85, i64 %mul103), !dbg !792
  %87 = load i32*, i32** %d_cost, align 8, !dbg !793
  %88 = bitcast i32* %87 to i8*, !dbg !793
  %89 = load i32*, i32** %h_cost, align 8, !dbg !794
  %90 = bitcast i32* %89 to i8*, !dbg !794
  %91 = load i32, i32* @no_of_nodes, align 4, !dbg !795
  %conv105 = sext i32 %91 to i64, !dbg !795
  %mul106 = mul i64 4, %conv105, !dbg !796
  %call107 = call i32 @cudaMemcpy(i8* %88, i8* %90, i64 %mul106, i32 1), !dbg !797
  call void @llvm.dbg.declare(metadata i8** %d_over, metadata !798, metadata !474), !dbg !799
  %call108 = call i32 @cudaMalloc(i8** %d_over, i64 1), !dbg !800
  %call109 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.7, i32 0, i32 0)), !dbg !801
  call void @llvm.dbg.declare(metadata %struct.dim3* %grid, metadata !802, metadata !474), !dbg !826
  %92 = load i32, i32* %num_of_blocks, align 4, !dbg !827
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %grid, i32 %92, i32 1, i32 1), !dbg !826
  call void @llvm.dbg.declare(metadata %struct.dim3* %threads, metadata !828, metadata !474), !dbg !829
  %93 = load i32, i32* %num_of_threads_per_block, align 4, !dbg !830
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %threads, i32 %93, i32 1, i32 1), !dbg !829
  call void @llvm.dbg.declare(metadata i32* %k, metadata !831, metadata !474), !dbg !832
  store i32 0, i32* %k, align 4, !dbg !832
  %call110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.8, i32 0, i32 0)), !dbg !833
  call void @llvm.dbg.declare(metadata i8* %stop, metadata !834, metadata !474), !dbg !835
  br label %do.body, !dbg !836, !llvm.loop !837

do.body:                                          ; preds = %do.cond, %for.end99
  store i8 0, i8* %stop, align 1, !dbg !838
  %94 = load i8*, i8** %d_over, align 8, !dbg !840
  %call111 = call i32 @cudaMemcpy(i8* %94, i8* %stop, i64 1, i32 1), !dbg !841
  %95 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !842
  %96 = bitcast %struct.dim3* %grid to i8*, !dbg !842
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %95, i8* %96, i64 12, i32 4, i1 false), !dbg !842
  %97 = bitcast %struct.dim3* %agg.tmp112 to i8*, !dbg !843
  %98 = bitcast %struct.dim3* %threads to i8*, !dbg !843
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %97, i8* %98, i64 12, i32 4, i1 false), !dbg !844
  %99 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !846
  %100 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !846
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %99, i8* %100, i64 12, i32 4, i1 false), !dbg !847
  %101 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !846
  %102 = load i64, i64* %101, align 4, !dbg !846
  %103 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !846
  %104 = load i32, i32* %103, align 4, !dbg !846
  %105 = bitcast { i64, i32 }* %agg.tmp112.coerce to i8*, !dbg !846
  %106 = bitcast %struct.dim3* %agg.tmp112 to i8*, !dbg !846
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %105, i8* %106, i64 12, i32 4, i1 false), !dbg !849
  %107 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp112.coerce, i32 0, i32 0, !dbg !846
  %108 = load i64, i64* %107, align 4, !dbg !846
  %109 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp112.coerce, i32 0, i32 1, !dbg !846
  %110 = load i32, i32* %109, align 4, !dbg !846
  %call113 = call i32 @cudaConfigureCall(i64 %102, i32 %104, i64 %108, i32 %110, i64 0, %struct.CUstream_st* null), !dbg !851
  %tobool114 = icmp ne i32 %call113, 0, !dbg !846
  br i1 %tobool114, label %kcall.end, label %kcall.configok, !dbg !853

kcall.configok:                                   ; preds = %do.body
  %111 = load %struct.Node*, %struct.Node** %d_graph_nodes, align 8, !dbg !854
  %112 = load i32*, i32** %d_graph_edges, align 8, !dbg !856
  %113 = load i8*, i8** %d_graph_mask, align 8, !dbg !857
  %114 = load i8*, i8** %d_updating_graph_mask, align 8, !dbg !858
  %115 = load i8*, i8** %d_graph_visited, align 8, !dbg !859
  %116 = load i32*, i32** %d_cost, align 8, !dbg !860
  %117 = load i32, i32* @no_of_nodes, align 4, !dbg !861
  call void @_Z6KernelP4NodePiPbS2_S2_S1_i(%struct.Node* %111, i32* %112, i8* %113, i8* %114, i8* %115, i32* %116, i32 %117), !dbg !862
  br label %kcall.end, !dbg !862

kcall.end:                                        ; preds = %kcall.configok, %do.body
  %118 = bitcast %struct.dim3* %agg.tmp115 to i8*, !dbg !863
  %119 = bitcast %struct.dim3* %grid to i8*, !dbg !863
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %118, i8* %119, i64 12, i32 4, i1 false), !dbg !863
  %120 = bitcast %struct.dim3* %agg.tmp116 to i8*, !dbg !864
  %121 = bitcast %struct.dim3* %threads to i8*, !dbg !864
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %120, i8* %121, i64 12, i32 4, i1 false), !dbg !865
  %122 = bitcast { i64, i32 }* %agg.tmp115.coerce to i8*, !dbg !866
  %123 = bitcast %struct.dim3* %agg.tmp115 to i8*, !dbg !866
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %122, i8* %123, i64 12, i32 4, i1 false), !dbg !867
  %124 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp115.coerce, i32 0, i32 0, !dbg !866
  %125 = load i64, i64* %124, align 4, !dbg !866
  %126 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp115.coerce, i32 0, i32 1, !dbg !866
  %127 = load i32, i32* %126, align 4, !dbg !866
  %128 = bitcast { i64, i32 }* %agg.tmp116.coerce to i8*, !dbg !866
  %129 = bitcast %struct.dim3* %agg.tmp116 to i8*, !dbg !866
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %128, i8* %129, i64 12, i32 4, i1 false), !dbg !868
  %130 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp116.coerce, i32 0, i32 0, !dbg !866
  %131 = load i64, i64* %130, align 4, !dbg !866
  %132 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp116.coerce, i32 0, i32 1, !dbg !866
  %133 = load i32, i32* %132, align 4, !dbg !866
  %call117 = call i32 @cudaConfigureCall(i64 %125, i32 %127, i64 %131, i32 %133, i64 0, %struct.CUstream_st* null), !dbg !869
  %tobool118 = icmp ne i32 %call117, 0, !dbg !866
  br i1 %tobool118, label %kcall.end120, label %kcall.configok119, !dbg !870

kcall.configok119:                                ; preds = %kcall.end
  %134 = load i8*, i8** %d_graph_mask, align 8, !dbg !871
  %135 = load i8*, i8** %d_updating_graph_mask, align 8, !dbg !872
  %136 = load i8*, i8** %d_graph_visited, align 8, !dbg !873
  %137 = load i8*, i8** %d_over, align 8, !dbg !874
  %138 = load i32, i32* @no_of_nodes, align 4, !dbg !875
  call void @_Z7Kernel2PbS_S_S_i(i8* %134, i8* %135, i8* %136, i8* %137, i32 %138), !dbg !876
  br label %kcall.end120, !dbg !876

kcall.end120:                                     ; preds = %kcall.configok119, %kcall.end
  %139 = load i8*, i8** %d_over, align 8, !dbg !877
  %call121 = call i32 @cudaMemcpy(i8* %stop, i8* %139, i64 1, i32 2), !dbg !878
  %140 = load i32, i32* %k, align 4, !dbg !879
  %inc122 = add nsw i32 %140, 1, !dbg !879
  store i32 %inc122, i32* %k, align 4, !dbg !879
  br label %do.cond, !dbg !880

do.cond:                                          ; preds = %kcall.end120
  %141 = load i8, i8* %stop, align 1, !dbg !881
  %tobool123 = trunc i8 %141 to i1, !dbg !881
  br i1 %tobool123, label %do.body, label %do.end, !dbg !882, !llvm.loop !837

do.end:                                           ; preds = %do.cond
  %142 = load i32, i32* %k, align 4, !dbg !883
  %call124 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.9, i32 0, i32 0), i32 %142), !dbg !884
  %143 = load i32*, i32** %h_cost, align 8, !dbg !885
  %144 = bitcast i32* %143 to i8*, !dbg !885
  %145 = load i32*, i32** %d_cost, align 8, !dbg !886
  %146 = bitcast i32* %145 to i8*, !dbg !886
  %147 = load i32, i32* @no_of_nodes, align 4, !dbg !887
  %conv125 = sext i32 %147 to i64, !dbg !887
  %mul126 = mul i64 4, %conv125, !dbg !888
  %call127 = call i32 @cudaMemcpy(i8* %144, i8* %146, i64 %mul126, i32 2), !dbg !889
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fpo, metadata !890, metadata !474), !dbg !891
  %call128 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0)), !dbg !892
  store %struct._IO_FILE* %call128, %struct._IO_FILE** %fpo, align 8, !dbg !891
  call void @llvm.dbg.declare(metadata i32* %i129, metadata !893, metadata !474), !dbg !895
  store i32 0, i32* %i129, align 4, !dbg !895
  br label %for.cond130, !dbg !896

for.cond130:                                      ; preds = %for.inc136, %do.end
  %148 = load i32, i32* %i129, align 4, !dbg !897
  %149 = load i32, i32* @no_of_nodes, align 4, !dbg !900
  %cmp131 = icmp slt i32 %148, %149, !dbg !901
  br i1 %cmp131, label %for.body132, label %for.end138, !dbg !902

for.body132:                                      ; preds = %for.cond130
  %150 = load %struct._IO_FILE*, %struct._IO_FILE** %fpo, align 8, !dbg !903
  %151 = load i32, i32* %i129, align 4, !dbg !904
  %152 = load i32, i32* %i129, align 4, !dbg !905
  %idxprom133 = sext i32 %152 to i64, !dbg !906
  %153 = load i32*, i32** %h_cost, align 8, !dbg !906
  %arrayidx134 = getelementptr inbounds i32, i32* %153, i64 %idxprom133, !dbg !906
  %154 = load i32, i32* %arrayidx134, align 4, !dbg !906
  %call135 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %150, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.12, i32 0, i32 0), i32 %151, i32 %154), !dbg !907
  br label %for.inc136, !dbg !907

for.inc136:                                       ; preds = %for.body132
  %155 = load i32, i32* %i129, align 4, !dbg !908
  %inc137 = add nsw i32 %155, 1, !dbg !908
  store i32 %inc137, i32* %i129, align 4, !dbg !908
  br label %for.cond130, !dbg !910, !llvm.loop !911

for.end138:                                       ; preds = %for.cond130
  %156 = load %struct._IO_FILE*, %struct._IO_FILE** %fpo, align 8, !dbg !913
  %call139 = call i32 @fclose(%struct._IO_FILE* %156), !dbg !914
  %call140 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.13, i32 0, i32 0)), !dbg !915
  %157 = load %struct.Node*, %struct.Node** %h_graph_nodes, align 8, !dbg !916
  %158 = bitcast %struct.Node* %157 to i8*, !dbg !916
  call void @free(i8* %158) #10, !dbg !917
  %159 = load i32*, i32** %h_graph_edges, align 8, !dbg !918
  %160 = bitcast i32* %159 to i8*, !dbg !918
  call void @free(i8* %160) #10, !dbg !919
  %161 = load i8*, i8** %h_graph_mask, align 8, !dbg !920
  call void @free(i8* %161) #10, !dbg !921
  %162 = load i8*, i8** %h_updating_graph_mask, align 8, !dbg !922
  call void @free(i8* %162) #10, !dbg !923
  %163 = load i8*, i8** %h_graph_visited, align 8, !dbg !924
  call void @free(i8* %163) #10, !dbg !925
  %164 = load i32*, i32** %h_cost, align 8, !dbg !926
  %165 = bitcast i32* %164 to i8*, !dbg !926
  call void @free(i8* %165) #10, !dbg !927
  %166 = load %struct.Node*, %struct.Node** %d_graph_nodes, align 8, !dbg !928
  %167 = bitcast %struct.Node* %166 to i8*, !dbg !928
  %call141 = call i32 @cudaFree(i8* %167), !dbg !929
  %168 = load i32*, i32** %d_graph_edges, align 8, !dbg !930
  %169 = bitcast i32* %168 to i8*, !dbg !930
  %call142 = call i32 @cudaFree(i8* %169), !dbg !931
  %170 = load i8*, i8** %d_graph_mask, align 8, !dbg !932
  %call143 = call i32 @cudaFree(i8* %170), !dbg !933
  %171 = load i8*, i8** %d_updating_graph_mask, align 8, !dbg !934
  %call144 = call i32 @cudaFree(i8* %171), !dbg !935
  %172 = load i8*, i8** %d_graph_visited, align 8, !dbg !936
  %call145 = call i32 @cudaFree(i8* %172), !dbg !937
  %173 = load i32*, i32** %d_cost, align 8, !dbg !938
  %174 = bitcast i32* %173 to i8*, !dbg !938
  %call146 = call i32 @cudaFree(i8* %174), !dbg !939
  br label %return, !dbg !940

return:                                           ; preds = %for.end138, %if.then2
  ret void, !dbg !941
}

; Function Attrs: uwtable
define void @_Z5UsageiPPc(i32 %argc, i8** %argv) #0 !dbg !943 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !944, metadata !474), !dbg !945
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !946, metadata !474), !dbg !947
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !948
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !949
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 0, !dbg !949
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !949
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0), i8* %2), !dbg !950
  ret void, !dbg !951
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
define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #7 comdat align 2 !dbg !952 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !953, metadata !474), !dbg !955
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !956, metadata !474), !dbg !957
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !958, metadata !474), !dbg !959
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !960, metadata !474), !dbg !961
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !962
  %0 = load i32, i32* %vx.addr, align 4, !dbg !963
  store i32 %0, i32* %x, align 4, !dbg !962
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !964
  %1 = load i32, i32* %vy.addr, align 4, !dbg !965
  store i32 %1, i32* %y, align 4, !dbg !964
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !966
  %2 = load i32, i32* %vz.addr, align 4, !dbg !967
  store i32 %2, i32* %z, align 4, !dbg !966
  ret void, !dbg !968
}

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #8

; Function Attrs: nounwind
declare void @free(i8*) #6

declare i32 @cudaFree(i8*) #3

attributes #0 = { uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { norecurse uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { argmemonly nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!465, !466}
!llvm.ident = !{!467}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 0c0654cbe42ce8060cf9bfeea18254aa37aceca3) (http://llvm.org/git/llvm.git 008f70d21cc2b33cebd1d4443052e62d3fbea6e8)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !11, globals: !24, imports: !33)
!1 = !DIFile(filename: "bfs.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !4, line: 797, size: 32, align: 32, elements: !5, identifier: "_ZTS14cudaMemcpyKind")
!4 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!5 = !{!6, !7, !8, !9, !10}
!6 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!7 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!8 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!10 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!11 = !{!12, !13, !14, !19, !21, !22}
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64, align: 64)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Node", file: !1, line: 31, size: 64, align: 32, elements: !16, identifier: "_ZTS4Node")
!16 = !{!17, !18}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "starting", scope: !15, file: !1, line: 33, baseType: !12, size: 32, align: 32)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "no_of_edges", scope: !15, file: !1, line: 34, baseType: !12, size: 32, align: 32, offset: 32)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64, align: 64)
!20 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64, align: 64)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!24 = !{!25, !26, !27}
!25 = distinct !DIGlobalVariable(name: "no_of_nodes", scope: !0, file: !1, line: 26, type: !12, isLocal: false, isDefinition: true, variable: i32* @no_of_nodes)
!26 = distinct !DIGlobalVariable(name: "edge_list_size", scope: !0, file: !1, line: 27, type: !12, isLocal: false, isDefinition: true, variable: i32* @edge_list_size)
!27 = distinct !DIGlobalVariable(name: "fp", scope: !0, file: !1, line: 28, type: !28, isLocal: false, isDefinition: true, variable: %struct._IO_FILE** @fp)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64, align: 64)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !30, line: 48, baseType: !31)
!30 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!31 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !32, line: 241, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!32 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!33 = !{!34, !41, !46, !48, !50, !52, !54, !58, !60, !62, !64, !66, !68, !70, !72, !74, !76, !78, !80, !82, !84, !86, !90, !92, !94, !96, !100, !104, !106, !108, !112, !116, !118, !120, !122, !124, !126, !128, !130, !132, !137, !141, !143, !145, !149, !151, !153, !155, !157, !159, !163, !165, !170, !177, !181, !183, !185, !187, !189, !191, !195, !197, !199, !203, !205, !207, !209, !211, !213, !215, !217, !219, !221, !226, !228, !230, !234, !236, !238, !240, !242, !244, !246, !248, !252, !256, !258, !260, !265, !267, !269, !271, !273, !275, !277, !281, !287, !291, !295, !300, !302, !306, !310, !323, !327, !331, !335, !339, !344, !346, !350, !354, !358, !366, !370, !374, !378, !382, !387, !393, !397, !401, !403, !411, !415, !423, !425, !427, !431, !435, !439, !444, !448, !453, !454, !455, !456, !459, !460, !461, !462, !463, !464}
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !37, line: 187)
!35 = !DINamespace(name: "std", scope: null, file: !36, line: 186)
!36 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!37 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !36, file: !36, line: 44, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!38 = !DISubroutineType(types: !39)
!39 = !{!40, !40}
!40 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !42, line: 188)
!42 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !36, file: !36, line: 46, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45}
!45 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !47, line: 189)
!47 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !36, file: !36, line: 48, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !49, line: 190)
!49 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !36, file: !36, line: 50, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !51, line: 191)
!51 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !36, file: !36, line: 52, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !53, line: 192)
!53 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !36, file: !36, line: 56, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !55, line: 193)
!55 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !36, file: !36, line: 54, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!56 = !DISubroutineType(types: !57)
!57 = !{!45, !45, !45}
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !59, line: 194)
!59 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !36, file: !36, line: 58, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !61, line: 195)
!61 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !36, file: !36, line: 60, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !63, line: 196)
!63 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !36, file: !36, line: 62, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !65, line: 197)
!65 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !36, file: !36, line: 64, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !67, line: 198)
!67 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !36, file: !36, line: 66, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !69, line: 199)
!69 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !36, file: !36, line: 68, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !71, line: 200)
!71 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !36, file: !36, line: 72, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !73, line: 201)
!73 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !36, file: !36, line: 70, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !75, line: 202)
!75 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !36, file: !36, line: 76, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !77, line: 203)
!77 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !36, file: !36, line: 74, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !79, line: 204)
!79 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !36, file: !36, line: 78, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !81, line: 205)
!81 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !36, file: !36, line: 80, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !83, line: 206)
!83 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !36, file: !36, line: 82, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !85, line: 207)
!85 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !36, file: !36, line: 84, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !87, line: 208)
!87 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !36, file: !36, line: 86, type: !88, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!88 = !DISubroutineType(types: !89)
!89 = !{!45, !45, !45, !45}
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !91, line: 209)
!91 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !36, file: !36, line: 88, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !93, line: 210)
!93 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !36, file: !36, line: 90, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !95, line: 211)
!95 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !36, file: !36, line: 92, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !97, line: 212)
!97 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !36, file: !36, line: 94, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!98 = !DISubroutineType(types: !99)
!99 = !{!12, !45}
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !101, line: 213)
!101 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !36, file: !36, line: 96, type: !102, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!102 = !DISubroutineType(types: !103)
!103 = !{!45, !45, !21}
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !105, line: 214)
!105 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !36, file: !36, line: 98, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !107, line: 215)
!107 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !36, file: !36, line: 100, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !109, line: 216)
!109 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !36, file: !36, line: 102, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DISubroutineType(types: !111)
!111 = !{!20, !45}
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !113, line: 217)
!113 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !36, file: !36, line: 106, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DISubroutineType(types: !115)
!115 = !{!20, !45, !45}
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !117, line: 218)
!117 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !36, file: !36, line: 105, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !119, line: 219)
!119 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !36, file: !36, line: 108, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !121, line: 220)
!121 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !36, file: !36, line: 112, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !123, line: 221)
!123 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !36, file: !36, line: 111, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !125, line: 222)
!125 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !36, file: !36, line: 114, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !127, line: 223)
!127 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !36, file: !36, line: 116, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !129, line: 224)
!129 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !36, file: !36, line: 118, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !131, line: 225)
!131 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !36, file: !36, line: 120, type: !114, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !133, line: 226)
!133 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !36, file: !36, line: 121, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DISubroutineType(types: !135)
!135 = !{!136, !136}
!136 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !138, line: 227)
!138 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !36, file: !36, line: 123, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DISubroutineType(types: !140)
!140 = !{!45, !45, !12}
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !142, line: 228)
!142 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !36, file: !36, line: 125, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !144, line: 229)
!144 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !36, file: !36, line: 126, type: !38, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !146, line: 230)
!146 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !36, file: !36, line: 128, type: !147, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DISubroutineType(types: !148)
!148 = !{!40, !45}
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !150, line: 231)
!150 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !36, file: !36, line: 138, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !152, line: 232)
!152 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !36, file: !36, line: 130, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !154, line: 233)
!154 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !36, file: !36, line: 132, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !156, line: 234)
!156 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !36, file: !36, line: 134, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !158, line: 235)
!158 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !36, file: !36, line: 136, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !160, line: 236)
!160 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !36, file: !36, line: 140, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DISubroutineType(types: !162)
!162 = !{!136, !45}
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !164, line: 237)
!164 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !36, file: !36, line: 142, type: !161, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !166, line: 238)
!166 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !36, file: !36, line: 144, type: !167, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DISubroutineType(types: !168)
!168 = !{!45, !45, !169}
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !171, line: 239)
!171 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !36, file: !36, line: 145, type: !172, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DISubroutineType(types: !173)
!173 = !{!13, !174}
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64, align: 64)
!175 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !176)
!176 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !178, line: 240)
!178 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !36, file: !36, line: 146, type: !179, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DISubroutineType(types: !180)
!180 = !{!45, !174}
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !182, line: 241)
!182 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !36, file: !36, line: 148, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !184, line: 242)
!184 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !36, file: !36, line: 150, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !186, line: 243)
!186 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardff", scope: !36, file: !36, line: 152, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !188, line: 244)
!188 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !36, file: !36, line: 156, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !190, line: 245)
!190 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !36, file: !36, line: 158, type: !56, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !192, line: 246)
!192 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !36, file: !36, line: 160, type: !193, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DISubroutineType(types: !194)
!194 = !{!45, !45, !45, !21}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !196, line: 247)
!196 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !36, file: !36, line: 162, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !198, line: 248)
!198 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !36, file: !36, line: 164, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !200, line: 249)
!200 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !36, file: !36, line: 166, type: !201, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DISubroutineType(types: !202)
!202 = !{!45, !45, !136}
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !204, line: 250)
!204 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !36, file: !36, line: 168, type: !139, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !206, line: 251)
!206 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !36, file: !36, line: 170, type: !110, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !208, line: 252)
!208 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !36, file: !36, line: 172, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !210, line: 253)
!210 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !36, file: !36, line: 174, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !212, line: 254)
!212 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !36, file: !36, line: 176, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !214, line: 255)
!214 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !36, file: !36, line: 178, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !216, line: 256)
!216 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !36, file: !36, line: 180, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !218, line: 257)
!218 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !36, file: !36, line: 182, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !220, line: 258)
!220 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !36, file: !36, line: 184, type: !43, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !222, line: 102)
!222 = !DISubprogram(name: "acos", scope: !223, file: !223, line: 54, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!224 = !DISubroutineType(types: !225)
!225 = !{!13, !13}
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !227, line: 121)
!227 = !DISubprogram(name: "asin", scope: !223, file: !223, line: 56, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !229, line: 140)
!229 = !DISubprogram(name: "atan", scope: !223, file: !223, line: 58, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !231, line: 159)
!231 = !DISubprogram(name: "atan2", scope: !223, file: !223, line: 60, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DISubroutineType(types: !233)
!233 = !{!13, !13, !13}
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !235, line: 180)
!235 = !DISubprogram(name: "ceil", scope: !223, file: !223, line: 178, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !237, line: 199)
!237 = !DISubprogram(name: "cos", scope: !223, file: !223, line: 63, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !239, line: 218)
!239 = !DISubprogram(name: "cosh", scope: !223, file: !223, line: 72, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !241, line: 237)
!241 = !DISubprogram(name: "exp", scope: !223, file: !223, line: 100, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !243, line: 256)
!243 = !DISubprogram(name: "fabs", scope: !223, file: !223, line: 181, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !245, line: 275)
!245 = !DISubprogram(name: "floor", scope: !223, file: !223, line: 184, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !247, line: 294)
!247 = !DISubprogram(name: "fmod", scope: !223, file: !223, line: 187, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !249, line: 315)
!249 = !DISubprogram(name: "frexp", scope: !223, file: !223, line: 103, type: !250, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DISubroutineType(types: !251)
!251 = !{!13, !13, !21}
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !253, line: 334)
!253 = !DISubprogram(name: "ldexp", scope: !223, file: !223, line: 106, type: !254, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DISubroutineType(types: !255)
!255 = !{!13, !13, !12}
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !257, line: 353)
!257 = !DISubprogram(name: "log", scope: !223, file: !223, line: 109, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !259, line: 372)
!259 = !DISubprogram(name: "log10", scope: !223, file: !223, line: 112, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !261, line: 391)
!261 = !DISubprogram(name: "modf", scope: !223, file: !223, line: 115, type: !262, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DISubroutineType(types: !263)
!263 = !{!13, !13, !264}
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !266, line: 403)
!266 = !DISubprogram(name: "pow", scope: !223, file: !223, line: 153, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !268, line: 440)
!268 = !DISubprogram(name: "sin", scope: !223, file: !223, line: 65, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !270, line: 459)
!270 = !DISubprogram(name: "sinh", scope: !223, file: !223, line: 74, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !272, line: 478)
!272 = !DISubprogram(name: "sqrt", scope: !223, file: !223, line: 156, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !274, line: 497)
!274 = !DISubprogram(name: "tan", scope: !223, file: !223, line: 67, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !276, line: 516)
!276 = !DISubprogram(name: "tanh", scope: !223, file: !223, line: 76, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !278, line: 118)
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !279, line: 101, baseType: !280)
!279 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!280 = !DICompositeType(tag: DW_TAG_structure_type, file: !279, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !282, line: 119)
!282 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !279, line: 109, baseType: !283)
!283 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !279, line: 105, size: 128, align: 64, elements: !284, identifier: "_ZTS6ldiv_t")
!284 = !{!285, !286}
!285 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !283, file: !279, line: 107, baseType: !136, size: 64, align: 64)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !283, file: !279, line: 108, baseType: !136, size: 64, align: 64, offset: 64)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !288, line: 121)
!288 = !DISubprogram(name: "abort", scope: !279, file: !279, line: 515, type: !289, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!289 = !DISubroutineType(types: !290)
!290 = !{null}
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !292, line: 122)
!292 = !DISubprogram(name: "abs", scope: !279, file: !279, line: 774, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DISubroutineType(types: !294)
!294 = !{!12, !12}
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !296, line: 123)
!296 = !DISubprogram(name: "atexit", scope: !279, file: !279, line: 519, type: !297, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DISubroutineType(types: !298)
!298 = !{!12, !299}
!299 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64, align: 64)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !301, line: 129)
!301 = !DISubprogram(name: "atof", scope: !279, file: !279, line: 144, type: !172, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !303, line: 130)
!303 = !DISubprogram(name: "atoi", scope: !279, file: !279, line: 147, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DISubroutineType(types: !305)
!305 = !{!12, !174}
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !307, line: 131)
!307 = !DISubprogram(name: "atol", scope: !279, file: !279, line: 150, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{!136, !174}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !311, line: 132)
!311 = !DISubprogram(name: "bsearch", scope: !279, file: !279, line: 754, type: !312, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DISubroutineType(types: !313)
!313 = !{!23, !314, !314, !316, !316, !319}
!314 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !315, size: 64, align: 64)
!315 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!316 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !317, line: 62, baseType: !318)
!317 = !DIFile(filename: "/usr/local/bin/../lib/clang/4.0.0/include/stddef.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!318 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!319 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !279, line: 741, baseType: !320)
!320 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !321, size: 64, align: 64)
!321 = !DISubroutineType(types: !322)
!322 = !{!12, !314, !314}
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !324, line: 133)
!324 = !DISubprogram(name: "calloc", scope: !279, file: !279, line: 468, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!325 = !DISubroutineType(types: !326)
!326 = !{!23, !316, !316}
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !328, line: 134)
!328 = !DISubprogram(name: "div", scope: !279, file: !279, line: 788, type: !329, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!329 = !DISubroutineType(types: !330)
!330 = !{!278, !12, !12}
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !332, line: 135)
!332 = !DISubprogram(name: "exit", scope: !279, file: !279, line: 543, type: !333, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!333 = !DISubroutineType(types: !334)
!334 = !{null, !12}
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !336, line: 136)
!336 = !DISubprogram(name: "free", scope: !279, file: !279, line: 483, type: !337, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!337 = !DISubroutineType(types: !338)
!338 = !{null, !23}
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !340, line: 137)
!340 = !DISubprogram(name: "getenv", scope: !279, file: !279, line: 564, type: !341, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DISubroutineType(types: !342)
!342 = !{!343, !174}
!343 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 64, align: 64)
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !345, line: 138)
!345 = !DISubprogram(name: "labs", scope: !279, file: !279, line: 775, type: !134, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !347, line: 139)
!347 = !DISubprogram(name: "ldiv", scope: !279, file: !279, line: 790, type: !348, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!348 = !DISubroutineType(types: !349)
!349 = !{!282, !136, !136}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !351, line: 140)
!351 = !DISubprogram(name: "malloc", scope: !279, file: !279, line: 466, type: !352, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !DISubroutineType(types: !353)
!353 = !{!23, !316}
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !355, line: 142)
!355 = !DISubprogram(name: "mblen", scope: !279, file: !279, line: 862, type: !356, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !DISubroutineType(types: !357)
!357 = !{!12, !174, !316}
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !359, line: 143)
!359 = !DISubprogram(name: "mbstowcs", scope: !279, file: !279, line: 873, type: !360, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DISubroutineType(types: !361)
!361 = !{!316, !362, !365, !316}
!362 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !363)
!363 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !364, size: 64, align: 64)
!364 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_signed)
!365 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !174)
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !367, line: 144)
!367 = !DISubprogram(name: "mbtowc", scope: !279, file: !279, line: 865, type: !368, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!368 = !DISubroutineType(types: !369)
!369 = !{!12, !362, !365, !316}
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !371, line: 146)
!371 = !DISubprogram(name: "qsort", scope: !279, file: !279, line: 764, type: !372, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!372 = !DISubroutineType(types: !373)
!373 = !{null, !23, !316, !316, !319}
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !375, line: 152)
!375 = !DISubprogram(name: "rand", scope: !279, file: !279, line: 374, type: !376, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!376 = !DISubroutineType(types: !377)
!377 = !{!12}
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !379, line: 153)
!379 = !DISubprogram(name: "realloc", scope: !279, file: !279, line: 480, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !DISubroutineType(types: !381)
!381 = !{!23, !23, !316}
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !383, line: 154)
!383 = !DISubprogram(name: "srand", scope: !279, file: !279, line: 376, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{null, !386}
!386 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !388, line: 155)
!388 = !DISubprogram(name: "strtod", scope: !279, file: !279, line: 164, type: !389, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!389 = !DISubroutineType(types: !390)
!390 = !{!13, !365, !391}
!391 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !392)
!392 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !343, size: 64, align: 64)
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !394, line: 156)
!394 = !DISubprogram(name: "strtol", scope: !279, file: !279, line: 183, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!395 = !DISubroutineType(types: !396)
!396 = !{!136, !365, !391, !12}
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !398, line: 157)
!398 = !DISubprogram(name: "strtoul", scope: !279, file: !279, line: 187, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!399 = !DISubroutineType(types: !400)
!400 = !{!318, !365, !391, !12}
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !402, line: 158)
!402 = !DISubprogram(name: "system", scope: !279, file: !279, line: 716, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !404, line: 160)
!404 = !DISubprogram(name: "wcstombs", scope: !279, file: !279, line: 876, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!405 = !DISubroutineType(types: !406)
!406 = !{!316, !407, !408, !316}
!407 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !343)
!408 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !409)
!409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !410, size: 64, align: 64)
!410 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !364)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !412, line: 161)
!412 = !DISubprogram(name: "wctomb", scope: !279, file: !279, line: 869, type: !413, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!413 = !DISubroutineType(types: !414)
!414 = !{!12, !343, !364}
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !418, line: 214)
!416 = !DINamespace(name: "__gnu_cxx", scope: null, file: !417, line: 220)
!417 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!418 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !279, line: 121, baseType: !419)
!419 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !279, line: 117, size: 128, align: 64, elements: !420, identifier: "_ZTS7lldiv_t")
!420 = !{!421, !422}
!421 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !419, file: !279, line: 119, baseType: !40, size: 64, align: 64)
!422 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !419, file: !279, line: 120, baseType: !40, size: 64, align: 64, offset: 64)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !424, line: 220)
!424 = !DISubprogram(name: "_Exit", scope: !279, file: !279, line: 557, type: !333, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !426, line: 224)
!426 = !DISubprogram(name: "llabs", scope: !279, file: !279, line: 779, type: !38, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !428, line: 230)
!428 = !DISubprogram(name: "lldiv", scope: !279, file: !279, line: 796, type: !429, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!429 = !DISubroutineType(types: !430)
!430 = !{!418, !40, !40}
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !432, line: 241)
!432 = !DISubprogram(name: "atoll", scope: !279, file: !279, line: 157, type: !433, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!433 = !DISubroutineType(types: !434)
!434 = !{!40, !174}
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !436, line: 242)
!436 = !DISubprogram(name: "strtoll", scope: !279, file: !279, line: 209, type: !437, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!437 = !DISubroutineType(types: !438)
!438 = !{!40, !365, !391, !12}
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !440, line: 243)
!440 = !DISubprogram(name: "strtoull", scope: !279, file: !279, line: 214, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!441 = !DISubroutineType(types: !442)
!442 = !{!443, !365, !391, !12}
!443 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !445, line: 245)
!445 = !DISubprogram(name: "strtof", scope: !279, file: !279, line: 172, type: !446, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!446 = !DISubroutineType(types: !447)
!447 = !{!45, !365, !391}
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !449, line: 246)
!449 = !DISubprogram(name: "strtold", scope: !279, file: !279, line: 175, type: !450, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!450 = !DISubroutineType(types: !451)
!451 = !{!452, !365, !391}
!452 = !DIBasicType(name: "long double", size: 128, align: 128, encoding: DW_ATE_float)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !418, line: 254)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !424, line: 256)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !426, line: 258)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !457, line: 259)
!457 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !416, file: !458, line: 227, type: !429, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!458 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !428, line: 260)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !432, line: 262)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !445, line: 263)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !436, line: 264)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !440, line: 265)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !35, entity: !449, line: 266)
!465 = !{i32 2, !"Dwarf Version", i32 4}
!466 = !{i32 2, !"Debug Info Version", i32 3}
!467 = !{!"clang version 4.0.0 (git@github.com:taylorlloyd/coalescingsa-clang.git 0c0654cbe42ce8060cf9bfeea18254aa37aceca3) (http://llvm.org/git/llvm.git 008f70d21cc2b33cebd1d4443052e62d3fbea6e8)"}
!468 = distinct !DISubprogram(name: "Kernel", linkageName: "_Z6KernelP4NodePiPbS2_S2_S1_i", scope: !469, file: !469, line: 22, type: !470, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !472)
!469 = !DIFile(filename: "./kernel.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!470 = !DISubroutineType(types: !471)
!471 = !{null, !14, !21, !19, !19, !19, !21, !12}
!472 = !{}
!473 = !DILocalVariable(name: "g_graph_nodes", arg: 1, scope: !468, file: !469, line: 22, type: !14)
!474 = !DIExpression()
!475 = !DILocation(line: 22, column: 15, scope: !468)
!476 = !DILocalVariable(name: "g_graph_edges", arg: 2, scope: !468, file: !469, line: 22, type: !21)
!477 = !DILocation(line: 22, column: 35, scope: !468)
!478 = !DILocalVariable(name: "g_graph_mask", arg: 3, scope: !468, file: !469, line: 22, type: !19)
!479 = !DILocation(line: 22, column: 56, scope: !468)
!480 = !DILocalVariable(name: "g_updating_graph_mask", arg: 4, scope: !468, file: !469, line: 22, type: !19)
!481 = !DILocation(line: 22, column: 76, scope: !468)
!482 = !DILocalVariable(name: "g_graph_visited", arg: 5, scope: !468, file: !469, line: 22, type: !19)
!483 = !DILocation(line: 22, column: 105, scope: !468)
!484 = !DILocalVariable(name: "g_cost", arg: 6, scope: !468, file: !469, line: 22, type: !21)
!485 = !DILocation(line: 22, column: 127, scope: !468)
!486 = !DILocalVariable(name: "no_of_nodes", arg: 7, scope: !468, file: !469, line: 22, type: !12)
!487 = !DILocation(line: 22, column: 139, scope: !468)
!488 = !DILocation(line: 23, column: 1, scope: !468)
!489 = !DILocation(line: 23, column: 1, scope: !490)
!490 = !DILexicalBlockFile(scope: !468, file: !469, discriminator: 1)
!491 = !DILocation(line: 23, column: 1, scope: !492)
!492 = !DILexicalBlockFile(scope: !468, file: !469, discriminator: 2)
!493 = !DILocation(line: 23, column: 1, scope: !494)
!494 = !DILexicalBlockFile(scope: !468, file: !469, discriminator: 3)
!495 = !DILocation(line: 23, column: 1, scope: !496)
!496 = !DILexicalBlockFile(scope: !468, file: !469, discriminator: 4)
!497 = !DILocation(line: 23, column: 1, scope: !498)
!498 = !DILexicalBlockFile(scope: !468, file: !469, discriminator: 5)
!499 = !DILocation(line: 23, column: 1, scope: !500)
!500 = !DILexicalBlockFile(scope: !468, file: !469, discriminator: 6)
!501 = !DILocation(line: 23, column: 1, scope: !502)
!502 = !DILexicalBlockFile(scope: !468, file: !469, discriminator: 7)
!503 = !DILocation(line: 38, column: 1, scope: !468)
!504 = distinct !DISubprogram(name: "Kernel2", linkageName: "_Z7Kernel2PbS_S_S_i", scope: !505, file: !505, line: 22, type: !506, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !472)
!505 = !DIFile(filename: "./kernel2.cu", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!506 = !DISubroutineType(types: !507)
!507 = !{null, !19, !19, !19, !19, !12}
!508 = !DILocalVariable(name: "g_graph_mask", arg: 1, scope: !504, file: !505, line: 22, type: !19)
!509 = !DILocation(line: 22, column: 16, scope: !504)
!510 = !DILocalVariable(name: "g_updating_graph_mask", arg: 2, scope: !504, file: !505, line: 22, type: !19)
!511 = !DILocation(line: 22, column: 36, scope: !504)
!512 = !DILocalVariable(name: "g_graph_visited", arg: 3, scope: !504, file: !505, line: 22, type: !19)
!513 = !DILocation(line: 22, column: 65, scope: !504)
!514 = !DILocalVariable(name: "g_over", arg: 4, scope: !504, file: !505, line: 22, type: !19)
!515 = !DILocation(line: 22, column: 88, scope: !504)
!516 = !DILocalVariable(name: "no_of_nodes", arg: 5, scope: !504, file: !505, line: 22, type: !12)
!517 = !DILocation(line: 22, column: 100, scope: !504)
!518 = !DILocation(line: 23, column: 1, scope: !504)
!519 = !DILocation(line: 23, column: 1, scope: !520)
!520 = !DILexicalBlockFile(scope: !504, file: !505, discriminator: 1)
!521 = !DILocation(line: 23, column: 1, scope: !522)
!522 = !DILexicalBlockFile(scope: !504, file: !505, discriminator: 2)
!523 = !DILocation(line: 23, column: 1, scope: !524)
!524 = !DILexicalBlockFile(scope: !504, file: !505, discriminator: 3)
!525 = !DILocation(line: 23, column: 1, scope: !526)
!526 = !DILexicalBlockFile(scope: !504, file: !505, discriminator: 4)
!527 = !DILocation(line: 23, column: 1, scope: !528)
!528 = !DILexicalBlockFile(scope: !504, file: !505, discriminator: 5)
!529 = !DILocation(line: 33, column: 1, scope: !504)
!530 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 45, type: !531, isLocal: false, isDefinition: true, scopeLine: 46, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !472)
!531 = !DISubroutineType(types: !532)
!532 = !{!12, !12, !392}
!533 = !DILocalVariable(name: "argc", arg: 1, scope: !530, file: !1, line: 45, type: !12)
!534 = !DILocation(line: 45, column: 15, scope: !530)
!535 = !DILocalVariable(name: "argv", arg: 2, scope: !530, file: !1, line: 45, type: !392)
!536 = !DILocation(line: 45, column: 28, scope: !530)
!537 = !DILocation(line: 47, column: 13, scope: !530)
!538 = !DILocation(line: 48, column: 16, scope: !530)
!539 = !DILocation(line: 49, column: 12, scope: !530)
!540 = !DILocation(line: 49, column: 18, scope: !530)
!541 = !DILocation(line: 49, column: 2, scope: !530)
!542 = !DILocation(line: 50, column: 1, scope: !530)
!543 = distinct !DISubprogram(name: "BFSGraph", linkageName: "_Z8BFSGraphiPPc", scope: !1, file: !1, line: 60, type: !544, isLocal: false, isDefinition: true, scopeLine: 61, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !472)
!544 = !DISubroutineType(types: !545)
!545 = !{null, !12, !392}
!546 = !DILocalVariable(name: "argc", arg: 1, scope: !543, file: !1, line: 60, type: !12)
!547 = !DILocation(line: 60, column: 20, scope: !543)
!548 = !DILocalVariable(name: "argv", arg: 2, scope: !543, file: !1, line: 60, type: !392)
!549 = !DILocation(line: 60, column: 33, scope: !543)
!550 = !DILocalVariable(name: "input_f", scope: !543, file: !1, line: 63, type: !343)
!551 = !DILocation(line: 63, column: 11, scope: !543)
!552 = !DILocation(line: 64, column: 5, scope: !553)
!553 = distinct !DILexicalBlock(scope: !543, file: !1, line: 64, column: 5)
!554 = !DILocation(line: 64, column: 9, scope: !553)
!555 = !DILocation(line: 64, column: 5, scope: !543)
!556 = !DILocation(line: 65, column: 8, scope: !557)
!557 = distinct !DILexicalBlock(scope: !553, file: !1, line: 64, column: 13)
!558 = !DILocation(line: 65, column: 14, scope: !557)
!559 = !DILocation(line: 65, column: 2, scope: !557)
!560 = !DILocation(line: 66, column: 2, scope: !557)
!561 = !DILocation(line: 69, column: 12, scope: !543)
!562 = !DILocation(line: 69, column: 10, scope: !543)
!563 = !DILocation(line: 70, column: 2, scope: !543)
!564 = !DILocation(line: 72, column: 13, scope: !543)
!565 = !DILocation(line: 72, column: 7, scope: !543)
!566 = !DILocation(line: 72, column: 5, scope: !543)
!567 = !DILocation(line: 73, column: 6, scope: !568)
!568 = distinct !DILexicalBlock(scope: !543, file: !1, line: 73, column: 5)
!569 = !DILocation(line: 73, column: 5, scope: !543)
!570 = !DILocation(line: 75, column: 3, scope: !571)
!571 = distinct !DILexicalBlock(scope: !568, file: !1, line: 74, column: 2)
!572 = !DILocation(line: 76, column: 3, scope: !571)
!573 = !DILocalVariable(name: "source", scope: !543, file: !1, line: 79, type: !12)
!574 = !DILocation(line: 79, column: 6, scope: !543)
!575 = !DILocation(line: 81, column: 9, scope: !543)
!576 = !DILocation(line: 81, column: 2, scope: !543)
!577 = !DILocalVariable(name: "num_of_blocks", scope: !543, file: !1, line: 83, type: !12)
!578 = !DILocation(line: 83, column: 6, scope: !543)
!579 = !DILocalVariable(name: "num_of_threads_per_block", scope: !543, file: !1, line: 84, type: !12)
!580 = !DILocation(line: 84, column: 6, scope: !543)
!581 = !DILocation(line: 84, column: 33, scope: !543)
!582 = !DILocation(line: 88, column: 5, scope: !583)
!583 = distinct !DILexicalBlock(scope: !543, file: !1, line: 88, column: 5)
!584 = !DILocation(line: 88, column: 16, scope: !583)
!585 = !DILocation(line: 88, column: 5, scope: !543)
!586 = !DILocation(line: 90, column: 29, scope: !587)
!587 = distinct !DILexicalBlock(scope: !583, file: !1, line: 89, column: 2)
!588 = !DILocation(line: 90, column: 40, scope: !587)
!589 = !DILocation(line: 90, column: 24, scope: !587)
!590 = !DILocation(line: 90, column: 17, scope: !587)
!591 = !DILocation(line: 91, column: 28, scope: !587)
!592 = !DILocation(line: 92, column: 2, scope: !587)
!593 = !DILocalVariable(name: "h_graph_nodes", scope: !543, file: !1, line: 95, type: !14)
!594 = !DILocation(line: 95, column: 8, scope: !543)
!595 = !DILocation(line: 95, column: 52, scope: !543)
!596 = !DILocation(line: 95, column: 51, scope: !543)
!597 = !DILocation(line: 95, column: 32, scope: !543)
!598 = !DILocation(line: 95, column: 24, scope: !543)
!599 = !DILocalVariable(name: "h_graph_mask", scope: !543, file: !1, line: 96, type: !19)
!600 = !DILocation(line: 96, column: 8, scope: !543)
!601 = !DILocation(line: 96, column: 51, scope: !543)
!602 = !DILocation(line: 96, column: 50, scope: !543)
!603 = !DILocation(line: 96, column: 31, scope: !543)
!604 = !DILocalVariable(name: "h_updating_graph_mask", scope: !543, file: !1, line: 97, type: !19)
!605 = !DILocation(line: 97, column: 8, scope: !543)
!606 = !DILocation(line: 97, column: 60, scope: !543)
!607 = !DILocation(line: 97, column: 59, scope: !543)
!608 = !DILocation(line: 97, column: 40, scope: !543)
!609 = !DILocalVariable(name: "h_graph_visited", scope: !543, file: !1, line: 98, type: !19)
!610 = !DILocation(line: 98, column: 8, scope: !543)
!611 = !DILocation(line: 98, column: 54, scope: !543)
!612 = !DILocation(line: 98, column: 53, scope: !543)
!613 = !DILocation(line: 98, column: 34, scope: !543)
!614 = !DILocalVariable(name: "start", scope: !543, file: !1, line: 100, type: !12)
!615 = !DILocation(line: 100, column: 6, scope: !543)
!616 = !DILocalVariable(name: "edgeno", scope: !543, file: !1, line: 100, type: !12)
!617 = !DILocation(line: 100, column: 13, scope: !543)
!618 = !DILocalVariable(name: "i", scope: !619, file: !1, line: 102, type: !386)
!619 = distinct !DILexicalBlock(scope: !543, file: !1, line: 102, column: 2)
!620 = !DILocation(line: 102, column: 20, scope: !619)
!621 = !DILocation(line: 102, column: 7, scope: !619)
!622 = !DILocation(line: 102, column: 27, scope: !623)
!623 = !DILexicalBlockFile(scope: !624, file: !1, discriminator: 1)
!624 = distinct !DILexicalBlock(scope: !619, file: !1, line: 102, column: 2)
!625 = !DILocation(line: 102, column: 31, scope: !623)
!626 = !DILocation(line: 102, column: 29, scope: !623)
!627 = !DILocation(line: 102, column: 2, scope: !623)
!628 = !DILocation(line: 104, column: 10, scope: !629)
!629 = distinct !DILexicalBlock(scope: !624, file: !1, line: 103, column: 2)
!630 = !DILocation(line: 104, column: 3, scope: !629)
!631 = !DILocation(line: 105, column: 31, scope: !629)
!632 = !DILocation(line: 105, column: 17, scope: !629)
!633 = !DILocation(line: 105, column: 3, scope: !629)
!634 = !DILocation(line: 105, column: 20, scope: !629)
!635 = !DILocation(line: 105, column: 29, scope: !629)
!636 = !DILocation(line: 106, column: 34, scope: !629)
!637 = !DILocation(line: 106, column: 17, scope: !629)
!638 = !DILocation(line: 106, column: 3, scope: !629)
!639 = !DILocation(line: 106, column: 20, scope: !629)
!640 = !DILocation(line: 106, column: 32, scope: !629)
!641 = !DILocation(line: 107, column: 16, scope: !629)
!642 = !DILocation(line: 107, column: 3, scope: !629)
!643 = !DILocation(line: 107, column: 18, scope: !629)
!644 = !DILocation(line: 108, column: 25, scope: !629)
!645 = !DILocation(line: 108, column: 3, scope: !629)
!646 = !DILocation(line: 108, column: 27, scope: !629)
!647 = !DILocation(line: 109, column: 19, scope: !629)
!648 = !DILocation(line: 109, column: 3, scope: !629)
!649 = !DILocation(line: 109, column: 21, scope: !629)
!650 = !DILocation(line: 110, column: 2, scope: !629)
!651 = !DILocation(line: 102, column: 45, scope: !652)
!652 = !DILexicalBlockFile(scope: !624, file: !1, discriminator: 2)
!653 = !DILocation(line: 102, column: 2, scope: !652)
!654 = distinct !{!654, !655}
!655 = !DILocation(line: 102, column: 2, scope: !543)
!656 = !DILocation(line: 113, column: 9, scope: !543)
!657 = !DILocation(line: 113, column: 2, scope: !543)
!658 = !DILocation(line: 114, column: 8, scope: !543)
!659 = !DILocation(line: 117, column: 15, scope: !543)
!660 = !DILocation(line: 117, column: 2, scope: !543)
!661 = !DILocation(line: 117, column: 22, scope: !543)
!662 = !DILocation(line: 118, column: 18, scope: !543)
!663 = !DILocation(line: 118, column: 2, scope: !543)
!664 = !DILocation(line: 118, column: 25, scope: !543)
!665 = !DILocation(line: 120, column: 9, scope: !543)
!666 = !DILocation(line: 120, column: 2, scope: !543)
!667 = !DILocalVariable(name: "id", scope: !543, file: !1, line: 122, type: !12)
!668 = !DILocation(line: 122, column: 6, scope: !543)
!669 = !DILocalVariable(name: "cost", scope: !543, file: !1, line: 122, type: !12)
!670 = !DILocation(line: 122, column: 9, scope: !543)
!671 = !DILocalVariable(name: "h_graph_edges", scope: !543, file: !1, line: 123, type: !21)
!672 = !DILocation(line: 123, column: 7, scope: !543)
!673 = !DILocation(line: 123, column: 49, scope: !543)
!674 = !DILocation(line: 123, column: 48, scope: !543)
!675 = !DILocation(line: 123, column: 30, scope: !543)
!676 = !DILocation(line: 123, column: 23, scope: !543)
!677 = !DILocalVariable(name: "i", scope: !678, file: !1, line: 124, type: !12)
!678 = distinct !DILexicalBlock(scope: !543, file: !1, line: 124, column: 2)
!679 = !DILocation(line: 124, column: 10, scope: !678)
!680 = !DILocation(line: 124, column: 6, scope: !678)
!681 = !DILocation(line: 124, column: 15, scope: !682)
!682 = !DILexicalBlockFile(scope: !683, file: !1, discriminator: 1)
!683 = distinct !DILexicalBlock(scope: !678, file: !1, line: 124, column: 2)
!684 = !DILocation(line: 124, column: 19, scope: !682)
!685 = !DILocation(line: 124, column: 17, scope: !682)
!686 = !DILocation(line: 124, column: 2, scope: !682)
!687 = !DILocation(line: 126, column: 10, scope: !688)
!688 = distinct !DILexicalBlock(scope: !683, file: !1, line: 125, column: 2)
!689 = !DILocation(line: 126, column: 3, scope: !688)
!690 = !DILocation(line: 127, column: 10, scope: !688)
!691 = !DILocation(line: 127, column: 3, scope: !688)
!692 = !DILocation(line: 128, column: 22, scope: !688)
!693 = !DILocation(line: 128, column: 17, scope: !688)
!694 = !DILocation(line: 128, column: 3, scope: !688)
!695 = !DILocation(line: 128, column: 20, scope: !688)
!696 = !DILocation(line: 129, column: 2, scope: !688)
!697 = !DILocation(line: 124, column: 37, scope: !698)
!698 = !DILexicalBlockFile(scope: !683, file: !1, discriminator: 2)
!699 = !DILocation(line: 124, column: 2, scope: !698)
!700 = distinct !{!700, !701}
!701 = !DILocation(line: 124, column: 2, scope: !543)
!702 = !DILocation(line: 131, column: 5, scope: !703)
!703 = distinct !DILexicalBlock(scope: !543, file: !1, line: 131, column: 5)
!704 = !DILocation(line: 131, column: 5, scope: !543)
!705 = !DILocation(line: 132, column: 10, scope: !703)
!706 = !DILocation(line: 132, column: 3, scope: !703)
!707 = !DILocation(line: 134, column: 2, scope: !543)
!708 = !DILocalVariable(name: "d_graph_nodes", scope: !543, file: !1, line: 137, type: !14)
!709 = !DILocation(line: 137, column: 8, scope: !543)
!710 = !DILocation(line: 138, column: 14, scope: !543)
!711 = !DILocation(line: 138, column: 52, scope: !543)
!712 = !DILocation(line: 138, column: 51, scope: !543)
!713 = !DILocation(line: 138, column: 2, scope: !543)
!714 = !DILocation(line: 139, column: 14, scope: !543)
!715 = !DILocation(line: 139, column: 29, scope: !543)
!716 = !DILocation(line: 139, column: 57, scope: !543)
!717 = !DILocation(line: 139, column: 56, scope: !543)
!718 = !DILocation(line: 139, column: 2, scope: !543)
!719 = !DILocalVariable(name: "d_graph_edges", scope: !543, file: !1, line: 142, type: !21)
!720 = !DILocation(line: 142, column: 7, scope: !543)
!721 = !DILocation(line: 143, column: 14, scope: !543)
!722 = !DILocation(line: 143, column: 51, scope: !543)
!723 = !DILocation(line: 143, column: 50, scope: !543)
!724 = !DILocation(line: 143, column: 2, scope: !543)
!725 = !DILocation(line: 144, column: 14, scope: !543)
!726 = !DILocation(line: 144, column: 29, scope: !543)
!727 = !DILocation(line: 144, column: 56, scope: !543)
!728 = !DILocation(line: 144, column: 55, scope: !543)
!729 = !DILocation(line: 144, column: 2, scope: !543)
!730 = !DILocalVariable(name: "d_graph_mask", scope: !543, file: !1, line: 147, type: !19)
!731 = !DILocation(line: 147, column: 8, scope: !543)
!732 = !DILocation(line: 148, column: 51, scope: !543)
!733 = !DILocation(line: 148, column: 50, scope: !543)
!734 = !DILocation(line: 148, column: 2, scope: !543)
!735 = !DILocation(line: 149, column: 14, scope: !543)
!736 = !DILocation(line: 149, column: 28, scope: !543)
!737 = !DILocation(line: 149, column: 55, scope: !543)
!738 = !DILocation(line: 149, column: 54, scope: !543)
!739 = !DILocation(line: 149, column: 2, scope: !543)
!740 = !DILocalVariable(name: "d_updating_graph_mask", scope: !543, file: !1, line: 151, type: !19)
!741 = !DILocation(line: 151, column: 8, scope: !543)
!742 = !DILocation(line: 152, column: 60, scope: !543)
!743 = !DILocation(line: 152, column: 59, scope: !543)
!744 = !DILocation(line: 152, column: 2, scope: !543)
!745 = !DILocation(line: 153, column: 14, scope: !543)
!746 = !DILocation(line: 153, column: 37, scope: !543)
!747 = !DILocation(line: 153, column: 73, scope: !543)
!748 = !DILocation(line: 153, column: 72, scope: !543)
!749 = !DILocation(line: 153, column: 2, scope: !543)
!750 = !DILocalVariable(name: "d_graph_visited", scope: !543, file: !1, line: 156, type: !19)
!751 = !DILocation(line: 156, column: 8, scope: !543)
!752 = !DILocation(line: 157, column: 54, scope: !543)
!753 = !DILocation(line: 157, column: 53, scope: !543)
!754 = !DILocation(line: 157, column: 2, scope: !543)
!755 = !DILocation(line: 158, column: 14, scope: !543)
!756 = !DILocation(line: 158, column: 31, scope: !543)
!757 = !DILocation(line: 158, column: 61, scope: !543)
!758 = !DILocation(line: 158, column: 60, scope: !543)
!759 = !DILocation(line: 158, column: 2, scope: !543)
!760 = !DILocalVariable(name: "h_cost", scope: !543, file: !1, line: 161, type: !21)
!761 = !DILocation(line: 161, column: 7, scope: !543)
!762 = !DILocation(line: 161, column: 43, scope: !543)
!763 = !DILocation(line: 161, column: 42, scope: !543)
!764 = !DILocation(line: 161, column: 23, scope: !543)
!765 = !DILocation(line: 161, column: 16, scope: !543)
!766 = !DILocalVariable(name: "i", scope: !767, file: !1, line: 162, type: !12)
!767 = distinct !DILexicalBlock(scope: !543, file: !1, line: 162, column: 2)
!768 = !DILocation(line: 162, column: 10, scope: !767)
!769 = !DILocation(line: 162, column: 6, scope: !767)
!770 = !DILocation(line: 162, column: 14, scope: !771)
!771 = !DILexicalBlockFile(scope: !772, file: !1, discriminator: 1)
!772 = distinct !DILexicalBlock(scope: !767, file: !1, line: 162, column: 2)
!773 = !DILocation(line: 162, column: 16, scope: !771)
!774 = !DILocation(line: 162, column: 15, scope: !771)
!775 = !DILocation(line: 162, column: 2, scope: !771)
!776 = !DILocation(line: 163, column: 10, scope: !772)
!777 = !DILocation(line: 163, column: 3, scope: !772)
!778 = !DILocation(line: 163, column: 12, scope: !772)
!779 = !DILocation(line: 162, column: 29, scope: !780)
!780 = !DILexicalBlockFile(scope: !772, file: !1, discriminator: 2)
!781 = !DILocation(line: 162, column: 2, scope: !780)
!782 = distinct !{!782, !783}
!783 = !DILocation(line: 162, column: 2, scope: !543)
!784 = !DILocation(line: 164, column: 9, scope: !543)
!785 = !DILocation(line: 164, column: 2, scope: !543)
!786 = !DILocation(line: 164, column: 16, scope: !543)
!787 = !DILocalVariable(name: "d_cost", scope: !543, file: !1, line: 167, type: !21)
!788 = !DILocation(line: 167, column: 7, scope: !543)
!789 = !DILocation(line: 168, column: 14, scope: !543)
!790 = !DILocation(line: 168, column: 44, scope: !543)
!791 = !DILocation(line: 168, column: 43, scope: !543)
!792 = !DILocation(line: 168, column: 2, scope: !543)
!793 = !DILocation(line: 169, column: 14, scope: !543)
!794 = !DILocation(line: 169, column: 22, scope: !543)
!795 = !DILocation(line: 169, column: 42, scope: !543)
!796 = !DILocation(line: 169, column: 41, scope: !543)
!797 = !DILocation(line: 169, column: 2, scope: !543)
!798 = !DILocalVariable(name: "d_over", scope: !543, file: !1, line: 172, type: !19)
!799 = !DILocation(line: 172, column: 8, scope: !543)
!800 = !DILocation(line: 173, column: 2, scope: !543)
!801 = !DILocation(line: 175, column: 2, scope: !543)
!802 = !DILocalVariable(name: "grid", scope: !543, file: !1, line: 178, type: !803)
!803 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !804, line: 427, baseType: !805)
!804 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/taylor/git/coalescingsa-llvm/test/rodinia_3.1/cuda/bfs")
!805 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !804, line: 417, size: 96, align: 32, elements: !806, identifier: "_ZTS4dim3")
!806 = !{!807, !808, !809, !810, !814, !823}
!807 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !805, file: !804, line: 419, baseType: !386, size: 32, align: 32)
!808 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !805, file: !804, line: 419, baseType: !386, size: 32, align: 32, offset: 32)
!809 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !805, file: !804, line: 419, baseType: !386, size: 32, align: 32, offset: 64)
!810 = !DISubprogram(name: "dim3", scope: !805, file: !804, line: 421, type: !811, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!811 = !DISubroutineType(types: !812)
!812 = !{null, !813, !386, !386, !386}
!813 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !805, size: 64, align: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!814 = !DISubprogram(name: "dim3", scope: !805, file: !804, line: 422, type: !815, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!815 = !DISubroutineType(types: !816)
!816 = !{null, !813, !817}
!817 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !804, line: 383, baseType: !818)
!818 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !804, line: 190, size: 96, align: 32, elements: !819, identifier: "_ZTS5uint3")
!819 = !{!820, !821, !822}
!820 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !818, file: !804, line: 192, baseType: !386, size: 32, align: 32)
!821 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !818, file: !804, line: 192, baseType: !386, size: 32, align: 32, offset: 32)
!822 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !818, file: !804, line: 192, baseType: !386, size: 32, align: 32, offset: 64)
!823 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !805, file: !804, line: 423, type: !824, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!824 = !DISubroutineType(types: !825)
!825 = !{!817, !813}
!826 = !DILocation(line: 178, column: 8, scope: !543)
!827 = !DILocation(line: 178, column: 14, scope: !543)
!828 = !DILocalVariable(name: "threads", scope: !543, file: !1, line: 179, type: !803)
!829 = !DILocation(line: 179, column: 8, scope: !543)
!830 = !DILocation(line: 179, column: 17, scope: !543)
!831 = !DILocalVariable(name: "k", scope: !543, file: !1, line: 181, type: !12)
!832 = !DILocation(line: 181, column: 6, scope: !543)
!833 = !DILocation(line: 182, column: 2, scope: !543)
!834 = !DILocalVariable(name: "stop", scope: !543, file: !1, line: 183, type: !20)
!835 = !DILocation(line: 183, column: 7, scope: !543)
!836 = !DILocation(line: 185, column: 2, scope: !543)
!837 = distinct !{!837, !836}
!838 = !DILocation(line: 188, column: 7, scope: !839)
!839 = distinct !DILexicalBlock(scope: !543, file: !1, line: 186, column: 2)
!840 = !DILocation(line: 189, column: 15, scope: !839)
!841 = !DILocation(line: 189, column: 3, scope: !839)
!842 = !DILocation(line: 190, column: 13, scope: !839)
!843 = !DILocation(line: 190, column: 19, scope: !839)
!844 = !DILocation(line: 190, column: 19, scope: !845)
!845 = !DILexicalBlockFile(scope: !839, file: !1, discriminator: 2)
!846 = !DILocation(line: 190, column: 9, scope: !839)
!847 = !DILocation(line: 190, column: 9, scope: !848)
!848 = !DILexicalBlockFile(scope: !839, file: !1, discriminator: 3)
!849 = !DILocation(line: 190, column: 9, scope: !850)
!850 = !DILexicalBlockFile(scope: !839, file: !1, discriminator: 4)
!851 = !DILocation(line: 190, column: 9, scope: !852)
!852 = !DILexicalBlockFile(scope: !839, file: !1, discriminator: 5)
!853 = !DILocation(line: 190, column: 3, scope: !839)
!854 = !DILocation(line: 190, column: 35, scope: !855)
!855 = !DILexicalBlockFile(scope: !839, file: !1, discriminator: 1)
!856 = !DILocation(line: 190, column: 50, scope: !855)
!857 = !DILocation(line: 190, column: 65, scope: !855)
!858 = !DILocation(line: 190, column: 79, scope: !855)
!859 = !DILocation(line: 190, column: 102, scope: !855)
!860 = !DILocation(line: 190, column: 119, scope: !855)
!861 = !DILocation(line: 190, column: 127, scope: !855)
!862 = !DILocation(line: 190, column: 3, scope: !855)
!863 = !DILocation(line: 194, column: 14, scope: !839)
!864 = !DILocation(line: 194, column: 20, scope: !839)
!865 = !DILocation(line: 194, column: 20, scope: !845)
!866 = !DILocation(line: 194, column: 10, scope: !839)
!867 = !DILocation(line: 194, column: 10, scope: !848)
!868 = !DILocation(line: 194, column: 10, scope: !850)
!869 = !DILocation(line: 194, column: 10, scope: !852)
!870 = !DILocation(line: 194, column: 3, scope: !839)
!871 = !DILocation(line: 194, column: 36, scope: !855)
!872 = !DILocation(line: 194, column: 50, scope: !855)
!873 = !DILocation(line: 194, column: 73, scope: !855)
!874 = !DILocation(line: 194, column: 90, scope: !855)
!875 = !DILocation(line: 194, column: 98, scope: !855)
!876 = !DILocation(line: 194, column: 3, scope: !855)
!877 = !DILocation(line: 198, column: 22, scope: !839)
!878 = !DILocation(line: 198, column: 3, scope: !839)
!879 = !DILocation(line: 199, column: 4, scope: !839)
!880 = !DILocation(line: 200, column: 2, scope: !839)
!881 = !DILocation(line: 201, column: 8, scope: !543)
!882 = !DILocation(line: 200, column: 2, scope: !855)
!883 = !DILocation(line: 204, column: 38, scope: !543)
!884 = !DILocation(line: 204, column: 2, scope: !543)
!885 = !DILocation(line: 207, column: 14, scope: !543)
!886 = !DILocation(line: 207, column: 22, scope: !543)
!887 = !DILocation(line: 207, column: 42, scope: !543)
!888 = !DILocation(line: 207, column: 41, scope: !543)
!889 = !DILocation(line: 207, column: 2, scope: !543)
!890 = !DILocalVariable(name: "fpo", scope: !543, file: !1, line: 210, type: !28)
!891 = !DILocation(line: 210, column: 8, scope: !543)
!892 = !DILocation(line: 210, column: 14, scope: !543)
!893 = !DILocalVariable(name: "i", scope: !894, file: !1, line: 211, type: !12)
!894 = distinct !DILexicalBlock(scope: !543, file: !1, line: 211, column: 2)
!895 = !DILocation(line: 211, column: 10, scope: !894)
!896 = !DILocation(line: 211, column: 6, scope: !894)
!897 = !DILocation(line: 211, column: 14, scope: !898)
!898 = !DILexicalBlockFile(scope: !899, file: !1, discriminator: 1)
!899 = distinct !DILexicalBlock(scope: !894, file: !1, line: 211, column: 2)
!900 = !DILocation(line: 211, column: 16, scope: !898)
!901 = !DILocation(line: 211, column: 15, scope: !898)
!902 = !DILocation(line: 211, column: 2, scope: !898)
!903 = !DILocation(line: 212, column: 11, scope: !899)
!904 = !DILocation(line: 212, column: 31, scope: !899)
!905 = !DILocation(line: 212, column: 40, scope: !899)
!906 = !DILocation(line: 212, column: 33, scope: !899)
!907 = !DILocation(line: 212, column: 3, scope: !899)
!908 = !DILocation(line: 211, column: 29, scope: !909)
!909 = !DILexicalBlockFile(scope: !899, file: !1, discriminator: 2)
!910 = !DILocation(line: 211, column: 2, scope: !909)
!911 = distinct !{!911, !912}
!912 = !DILocation(line: 211, column: 2, scope: !543)
!913 = !DILocation(line: 213, column: 9, scope: !543)
!914 = !DILocation(line: 213, column: 2, scope: !543)
!915 = !DILocation(line: 214, column: 2, scope: !543)
!916 = !DILocation(line: 218, column: 8, scope: !543)
!917 = !DILocation(line: 218, column: 2, scope: !543)
!918 = !DILocation(line: 219, column: 8, scope: !543)
!919 = !DILocation(line: 219, column: 2, scope: !543)
!920 = !DILocation(line: 220, column: 8, scope: !543)
!921 = !DILocation(line: 220, column: 2, scope: !543)
!922 = !DILocation(line: 221, column: 8, scope: !543)
!923 = !DILocation(line: 221, column: 2, scope: !543)
!924 = !DILocation(line: 222, column: 8, scope: !543)
!925 = !DILocation(line: 222, column: 2, scope: !543)
!926 = !DILocation(line: 223, column: 8, scope: !543)
!927 = !DILocation(line: 223, column: 2, scope: !543)
!928 = !DILocation(line: 224, column: 11, scope: !543)
!929 = !DILocation(line: 224, column: 2, scope: !543)
!930 = !DILocation(line: 225, column: 11, scope: !543)
!931 = !DILocation(line: 225, column: 2, scope: !543)
!932 = !DILocation(line: 226, column: 11, scope: !543)
!933 = !DILocation(line: 226, column: 2, scope: !543)
!934 = !DILocation(line: 227, column: 11, scope: !543)
!935 = !DILocation(line: 227, column: 2, scope: !543)
!936 = !DILocation(line: 228, column: 11, scope: !543)
!937 = !DILocation(line: 228, column: 2, scope: !543)
!938 = !DILocation(line: 229, column: 11, scope: !543)
!939 = !DILocation(line: 229, column: 2, scope: !543)
!940 = !DILocation(line: 230, column: 1, scope: !543)
!941 = !DILocation(line: 230, column: 1, scope: !942)
!942 = !DILexicalBlockFile(scope: !543, file: !1, discriminator: 1)
!943 = distinct !DISubprogram(name: "Usage", linkageName: "_Z5UsageiPPc", scope: !1, file: !1, line: 52, type: !544, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !472)
!944 = !DILocalVariable(name: "argc", arg: 1, scope: !943, file: !1, line: 52, type: !12)
!945 = !DILocation(line: 52, column: 16, scope: !943)
!946 = !DILocalVariable(name: "argv", arg: 2, scope: !943, file: !1, line: 52, type: !392)
!947 = !DILocation(line: 52, column: 28, scope: !943)
!948 = !DILocation(line: 54, column: 9, scope: !943)
!949 = !DILocation(line: 54, column: 44, scope: !943)
!950 = !DILocation(line: 54, column: 1, scope: !943)
!951 = !DILocation(line: 56, column: 1, scope: !943)
!952 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !805, file: !804, line: 421, type: !811, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !810, variables: !472)
!953 = !DILocalVariable(name: "this", arg: 1, scope: !952, type: !954, flags: DIFlagArtificial | DIFlagObjectPointer)
!954 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !805, size: 64, align: 64)
!955 = !DILocation(line: 0, scope: !952)
!956 = !DILocalVariable(name: "vx", arg: 2, scope: !952, file: !804, line: 421, type: !386)
!957 = !DILocation(line: 421, column: 43, scope: !952)
!958 = !DILocalVariable(name: "vy", arg: 3, scope: !952, file: !804, line: 421, type: !386)
!959 = !DILocation(line: 421, column: 64, scope: !952)
!960 = !DILocalVariable(name: "vz", arg: 4, scope: !952, file: !804, line: 421, type: !386)
!961 = !DILocation(line: 421, column: 85, scope: !952)
!962 = !DILocation(line: 421, column: 95, scope: !952)
!963 = !DILocation(line: 421, column: 97, scope: !952)
!964 = !DILocation(line: 421, column: 102, scope: !952)
!965 = !DILocation(line: 421, column: 104, scope: !952)
!966 = !DILocation(line: 421, column: 109, scope: !952)
!967 = !DILocation(line: 421, column: 111, scope: !952)
!968 = !DILocation(line: 421, column: 116, scope: !952)
